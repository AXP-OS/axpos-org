---
title: "Build AXP.OS"
type: docs
toc: true
aliases:
    - /Build
    - /build
---

AXP.OS is build the "traditional" way, i.e. without docker and fully automated. Building AXP.OS without automation is **not(!) supported**. 

## Automation scheme


```
   ┌────────────────────────────────────┐
   │     🚦 Semaphore (UI + Control)    │───.     . . . . . . . . . . . . . . . .
   │     🛠️ Ansible (same system)       │   '──▶ .       🗄️ Database           .
   │    . . . . . . . . . . . . . . .   │         .   (remote or on Semaphore)  .
   │    🏗️ Buildserver (can be local)   │         . . . . . . . . . . . . . . . . 
   └──────────────┬─────────────────────┘
                  │
                  ▼
   . . . . . . . . . . . . . .  . . . . .
   .         🏗️ Buildserver             .
   .  (remote or on Semaphore system)   .
   . . . . . . . . . . . . . .  . . . . .
                  │
                  ▼
   . . . . . . . . . . . . . .  . . . . .
   .      📦 Download + OTA Server      .
   .           (fully optional)         .
   . . . . . . . . . . . . . .  . . . . .

Legend:
─────────  = required  
. . . . .  = optional, can be a separate server or completely skipped

- Semaphore+Ansible require each other (single system).
- Buildserver and Database are optionally on a different server.
- Semaphore supports MariaDB, Postgres or a simple filebased DB (BoltDB).
```

## Requirements

### Control node

The control node holds the automation software:

- **Ansible** 2.12 or later - see [here](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
    - |+ `ansible-galaxy collection install community.general`
- **Semaphore** UI 2.14 or later - see [here](https://docs.ansible-semaphore.com/administration-guide/installation)

Recommended specs (standalone, i.e. when using a **separate(!)** Buildserver):
- 4 CPU cores
- 2 GB RAM
- 20 GB free disk space
- can run in LXC, docker, full VM, or even on your laptop/PC
- OS: a recent Alma Linux (e.g. v9 or later), Ubuntu 24.04, Debian 12 or later are recommended

Ansible + Semaphore must run on the **same** machine while your Buildserver can be the same system **or** a complete different one. Ansible will connect by SSH to the build system or keeps everything local - depending on your config.

The following is a quick introduction on how you can setup your system **after** [installing semaphore](https://docs.ansible-semaphore.com/administration-guide/installation) on a recent **Alma Linux v9**.

#### Installation

Install semaphore (see above).

Install and setup MariaDB:
```
dnf install mariadb-server ansible-core

systemctl enable --now mariadb
mysql_secure_installation
# (optional but recommended)

mysql

MariaDB [(none)]> CREATE DATABASE semaphoredb CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
MariaDB [(none)]> ALTER DATABASE semaphoredb DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

MariaDB [(none)]> CREATE user 'semaphore'@'localhost' identified by 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
MariaDB [(none)]> GRANT ALL PRIVILEGES ON semaphoredb.* TO 'semaphore'@'localhost';
```

if you have an existing database and not set the default character set this will convert it accordingly:

```
SELECT CONCAT('ALTER TABLE ', table_name, ' CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;') FROM information_schema.tables WHERE table_schema = 'semaphore';
```

Setup semaphore:
```
useradd -d /opt/semaphore -r -m -s /bin/false semaphore

mkdir /etc/semaphore
cd /etc/semaphore
chown semaphore:semaphore /etc/semaphore
chmod 750 /etc/semaphore
```
#### Configuration

Semaphore can be configured in different ways:

- interactive setup: `cd /etc/semaphore; semaphore setup`
- or via web configurator: https://semaphoreui.com/install/binary/2_14/config
- see: https://docs.semaphoreui.com for details and other options

If you want to setup a systemd service (recommended), follow [this](https://docs.semaphoreui.com/administration-guide/installation_manually/#extended-systemd-service) or for a quick one:

```
echo > /etc/systemd/system/semaphore.service < _EOF
[Unit]
Description=Ansible Semaphore
Documentation=https://docs.ansible-semaphore.com/
Wants=network-online.target
After=network-online.target mariadb.service
Requires=mariadb.service
ConditionPathExists=/usr/bin/semaphore
ConditionPathExists=/etc/semaphore/config.json

[Service]
User=semaphore
Group=semaphore
ExecStart=/usr/bin/semaphore service --config /etc/semaphore/config.json
ExecReload=/bin/kill -HUP $MAINPID
Restart=always
RestartSec=20s
# to auto-upgrade python modules at service startup
ExecStartPre=/bin/bash -c 'python3 -m pip install --upgrade --user -r /etc/semaphore/python-requirements.txt'
# so the executables are found
Environment="PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:~/.local/bin"
# to fix "python module not found" issues, the following WorkingDirectory must point to the same
# directory as ` tmp_path`  variable in your semaphore config.json
# if using non-default ansible.cfg params, it also should contain your `.ansible.cfg` (yes, `dot`ansible.cfg)
WorkingDirectory=/opt/semaphore
# besides the WorkingDirectory we need to tell systemd where to find your pip installed libs:
# to find out the user's as $User exec: python -c "import site; print(site.USER_SITE)"
Environment="PYTHONPATH=/home/pors/.local/lib/python3.9/site-packages"

[Install]
WantedBy=multi-user.target
_EOF

systemctl enable --now semaphore

```

### Buildserver

AXP.OS supports Ubuntu **24.04 LTS** only while [others](https://web.archive.org/web/20241227223444/https://divestos.org/pages/build#deps) **might** work, too.

```
sudo apt update && sudo apt upgrade && sudo apt full-upgrade && sudo apt -f install && sudo apt autoremove
sudo ln -s /usr/include/asm-generic /usr/include/asm

sudo apt install aapt android-sdk-libsparse-utils autoconf automake bc bison bsdmainutils build-essential ccache curl dos2unix expat firejail flex fuse2fs g++ g++-multilib gawk gcc gcc-multilib git git-lfs gnupg gperf imagemagick jpegoptim jq lib32ncurses-dev lib32z1-dev libc6-dev libc6-dev-i386 libcap-dev libexpat1-dev libgl1-mesa-dev libgmp-dev libmpc-dev libmpfr-dev libncurses-dev libncurses5-dev libncurses6 libsdl1.2-dev libssl-dev libtool libx11-dev libxml2 libxml2-utils lzop maven openjdk-8-jdk openssl optipng patch pkg-config pngcrush python-is-python3 python3-all-dev python3-colorama python3-pip python3-pygerrit2 python3-pyperclip repo schedtool squashfs-tools subversion texinfo tmux unzip wget x11proto-core-dev xsltproc zip zlib1g-dev

wget https://archive.ubuntu.com/ubuntu/pool/universe/n/ncurses/libncurses5_6.3-2ubuntu0.1_amd64.deb
wget https://archive.ubuntu.com/ubuntu/pool/universe/n/ncurses/libtinfo5_6.3-2ubuntu0.1_amd64.deb
sudo dpkg -i lib*.deb
```

it is not required nore recommended to build as root user:
```
sudo useradd -m <BUILD-USER>
```

Install Google's repo tool:
```
sudo su - <BUILD-USER>

$[BUILD-USER]> mkdir -p ~/.local/bin
$[BUILD-USER]> curl https://storage.googleapis.com/git-repo-downloads/repo > ~/.local/bin/repo
```

repo tool dependency (Ubuntu 20.04 only):
```
$[BUILD-USER]> pip install pygerrit2
```

ensure locale is as expected:
```
sudo dpkg-reconfigure locales
```

you can already start downloading the android sources to speed up your first build:
```
$[BUILD-USER]> mkdir -p /usr/src/android/axp/Build/LineageOS-20.0
$[BUILD-USER]> cd /usr/src/android/axp/Build/LineageOS-20.0
$[BUILD-USER]> repo init -u https://github.com/LineageOS/android.git -b lineage-20.0 --git-lfs
$[BUILD-USER]> repo sync -c --no-clone-bundle --jobs-network=6
```

create a ssh key:
```
$[BUILD-USER]> ssh-keygen -a 500 -t ed25519 -C "some comment"
```

create a gpg key (optional but recommended):
```
$[BUILD-USER]> gpg --expert --full-gen-key
# Select: ECC (sign and encrypt)
# Select: Curve 25519
# Select: expire date of your choice
# Answer requested information
# note: if you set a password on the key several automation parts will NOT work unless you automate the key unlock before starting a build
```

add both, SSH and GPG keys, to your accounts (and.. yes repeat that for _all_ sites):
- https://code.binbash.rocks
- and: https://github.com
- and: https://codeberg.org (not used yet, which will change anytime soon though, so better be prepared)

#### When building for Android 9 or 10 only

add the deprecated version 2 of python as a virtual environment (do not change any paths here as they are used within the automation process):

```
# tested on Ubuntu 24.04

$[BUILD-USER]> sudo apt-get install build-essential checkinstall libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev
$[BUILD-USER]> wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz
$[BUILD-USER]> tar -xvf Python-2.7.18.tgz
$[BUILD-USER]> cd Python-2.7.18
$[BUILD-USER]> ./configure --enable-optimizations
$[BUILD-USER]> make
$[BUILD-USER]> curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py
$[BUILD-USER]> Python-2.7.18/python get-pip.py
$[BUILD-USER]> pip2 install virtualenv
$[BUILD-USER]> Python-2.7.18/python -m virtualenv ~/.venv/python2/
$[BUILD-USER]> source ~/.venv/python2/bin/activate
$[BUILD-USER]> python --version
# should print v2.7.18
$[BUILD-USER]> deactivate
```

## Setup Semaphore


_TODO: upload semaphore backup.json for a 1 second setup!_


1. create a new project
1. **Key Store**:
   - name: `NoKey`
   - Type: `None`
1. **Repositories**:
   - name: `sfX-automation`
   - URL: `https://github.com/sfX-android/automation_scripts.git`
   - branch: `ansible`
   - Access Key: `NoKey`
1. **Environment**:
   - name: `AXP-<model>-<Android-Version>`
   - Extra Variables, depending on what you want to build: 
```
{
  "ROM_FLAVOR": "axp",
  "target_model": "hotdog",
  "android_shortversion": "a13"
}
```
5. **Inventory**
   - name: `default`
   - type: `Static YAML` <br/>
     use `localhost` here if you build on the same machine where Ansbile + Semaphore are running.
     otherwise Ansible will try to connect to this machine to actually start building. 
     So if you use a different system ensure you can reach that one from your Automation server.
     
     This is how it should look like when using the same system as build server where Ansible+Semaphore are running:
```
---
# hint: do not change the group name as it is used in Ansible later
buildserver:
  hosts:
    builder:
     ansible_host: localhost
     #ansible_host: X.X.X.X
     #ansible_host: myserver.fqdn.local

# hint: do not change the group name as it is used in Ansible later
downloadserver:
  hosts:
   leechserver:
    ansible_port: 22

all:
  vars:
    just_git_push: False
    commit_push: False
    telegram_notifications: False
    use_secrets_yaml: False
    max_processes: 18         # max cpu count for building/checking out sources
    # max_processes_sync: 8   # max cpu count for repo sync cmds (be careful as u can get rate limited easily!)
    keep_build_logs: False
    axp_release_recovery: False

    # Buildserver paths    
    android_build_path: "/usr/src/android"   # root path of where you wanna place android sources
    zipdir_mntp: "{{ android_build_path }}/zips/{{ target_model }}" # target directory for the final OS zips
    BUILDHOME: "/home/<BUILD-USER>" # the home path of the buildserver user
    SRCPATH: "{{ DOSPATH }}/Build/LineageOS-{{ los_version }}"
    keys_base_path: "{{ BUILDHOME }}/keys" # signing keys goes here
    repo_bin: "{{ BUILDHOME }}/.local/bin/repo" # full path to your repo binary
    DOSPATH: "{{ android_build_path }}/axp"  # divest path (keep it like that if unsure)
    CCACHE_DIR: "{{ android_build_path }}/ccache/{{ android_shortversion }}"   # full path where to place ccache data
    #SEPARATE_OUT_DIR: "{{ android_build_path }}/out/{{ target_model }}/{{ ROM_FLAVOR }}-{{ android_shortversion }}"
    
    # Semaphore paths
    semaphore_lock_dir: "/opt/semaphore/run" # semaphore run files
    semaphore_work_dir: "/opt/semaphore" # must match semaphore's config.json
    gist_home_dir: /opt/semaphore
    semaphore_home_dir: /opt/semaphore
    ansible_home_dir: /opt/semaphore
```
```
# note: if semaphore_work_dir and BUILDHOME differ (like in the above example)
# you have to symlink the .ansible dirs like that:
#ln -s <semaphore_work_dir>/.ansible <BUILDHOME>/
#ln -s <semaphore_work_dir>/.ansible_async <BUILDHOME>/
#ln -s <semaphore_work_dir>/.gitconfig <BUILDHOME>/
```
6. **Task Templates**:
   - name: `AXP - A13 - hotdog`
   - Playbook Filename: `plays/build.yml`
   - Inventory: `default`
   - Repository: `sfX-automation`
   - Environment: `AXP-<model>-<Android-Version>`

Optional:

Define Survey Variables to interactively change parts of the build process:

#### Task Template - Survey Variables

Dirty or clean build (overrides `clean_out` from your `Environment`)
- name: `override_clean_out`
- Title: `Clean build?`
- Description: `true | false`


## Build instructions

1. **Task Templates**
1. Click **Build**

## Debugging

### Repo sync

Google is pretty strict when you try to re-sync multiple times but you can avoid getting rate limited by following: [fix-quota-barriers](https://source.android.com/docs/setup/download/troubleshoot-sync#fix-quota-barriers)

After following the instructions you also need to ensure adding `/a` to the manifest(s), e.g.:

```
vim .repo/manifests/default.xml

  <remote  name="aosp"
           fetch="https://android.googlesource.com/a"    <--! /a REQUIRES AUTHENTICATION COOKIE -->
           review="android-review.googlesource.com"
           revision="refs/tags/android-15.0.0_r5" />
```

As this is usually not happening after the initial sync completed once there is no automated way for this implemented.

### Ansible

check your Ansible log (https://github.com/sfX-android/automation_scripts/blob/ansible/ansible.cfg -> `log_path`)

### Build

Every build once started(!) will generate a build log on the `[buildserver]` (see your _inventory_) in the home directory of the user in the format:

`~/build_<model>_axp_<build-id>.log` and a `~/build_<model>_axp_latest.log` which points to the latest log

Example: `~/build_hotdog_axp_13.1.34.log` `<-` `build_hotdog_axp_latest.log` 

