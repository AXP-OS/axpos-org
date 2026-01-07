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

- **Ansible** 2.18 or later - see [here](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
    - |+ `ansible-galaxy collection install community.general`
- **Semaphore** UI 2.16 or later - see [here](https://docs.ansible-semaphore.com/administration-guide/installation)

Recommended specs (standalone, i.e. when using a **separate(!)** Buildserver):
- 4 CPU cores
- 2 GB RAM
- 20 GB free disk space
- can run in LXC, docker, full VM, or even on your laptop/PC
- OS: a recent Alma Linux (v10 or later), Ubuntu (24.04 or later), Debian (13 or later)<br/>_recommended: latest Ubuntu LTS release_

Ansible + Semaphore must run on the **same** machine while your Buildserver can be the same system **or** a complete different one. Ansible will connect by SSH to the build system or keeps everything local - depending on your config.

The following is a guide how you can setup your _Control node_ using **Ubuntu 24.04** and _Maria DB_ on the same system:

#### Installation

1. Install required packages:
```
apt install mariadb-server ansible-core ansible python3-venv
```
2. Prepare semaphore:
```
useradd -d /opt/semaphore -r -m -s /bin/false semaphore

mkdir /etc/semaphore
chown semaphore:semaphore /etc/semaphore
chmod 750 /etc/semaphore
```
3. Create a python virtual environment:
```
su - semaphore
cd /opt/semaphore
python3 -m venv .venv
```
4. Follow the semaphore installation: [guide](https://docs.ansible-semaphore.com/administration-guide/installation) _(semaphore binary is expected to be in `/usr/bin`)_
5. Setup MariaDB:
```
systemctl enable --now mariadb
mysql_secure_installation
# (optional but recommended)

mysql

MariaDB [(none)]> CREATE DATABASE semaphoredb CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
MariaDB [(none)]> ALTER DATABASE semaphoredb DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

MariaDB [(none)]> CREATE user 'semaphore'@'localhost' identified by 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
MariaDB [(none)]> GRANT ALL PRIVILEGES ON semaphoredb.* TO 'semaphore'@'localhost';
```

if you have an existing database and not set the default character this would convert it accordingly:

```
SELECT CONCAT('ALTER TABLE ', table_name, ' CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;') FROM information_schema.tables WHERE table_schema = 'semaphore';
```

#### Configuration

Semaphore can be configured in different ways:

- interactive setup: `cd /etc/semaphore; semaphore setup`
- or via web configurator: https://semaphoreui.com/install/binary --> `Server config`
- see:[ https://docs.semaphoreui.com](https://semaphoreui.com/docs/administration-guide/configuration) for details and other options


If you want to setup a systemd service _(recommended)_, you can use the following one:<br/>_(official [documentation](https://docs.semaphoreui.com/administration-guide/installation_manually/#extended-systemd-service))_

```
echo > /etc/systemd/system/semaphore.service < _EOF
[Unit]
Description=Semaphore UI
Documentation=https://semaphoreui.com/docs
Wants=network-online.target
After=network-online.target mariadb.service
Requires=mariadb.service
ConditionPathExists=/usr/bin/semaphore
ConditionPathExists=/etc/semaphore/config.json

[Service]
Type=simple
SyslogIdentifier=semaphore
Restart=always
RestartSec=60
ExecReload=/bin/kill -HUP $MAINPID
User=semaphore

# to fix "python module not found" issues, the following WorkingDirectory must point to the same
# directory as ` tmp_path`  variable in your semaphore config.json
# if using non-default ansible.cfg params (i.e. overrides of the AXP.OS ones), it also should contain your `.ansible.cfg` (yes, `dot`ansible.cfg)
WorkingDirectory=/opt/semaphore

# auto install/upgrade python modules
ExecStartPre=wget "https://raw.githubusercontent.com/sfX-android/automation_scripts/refs/heads/ansible/plays/python-requirements.txt" -O /tmp/pr.dl
ExecStartPre=/usr/bin/mv -v /tmp/pr.dl /etc/semaphore/python-requirements.txt
ExecStartPre=/bin/bash -c 'source /opt/semaphore/.venv/bin/activate \
                && python3 -m pip install --upgrade -r /etc/semaphore/python-requirements.txt'

# auto install/upgrade ansible collections
ExecStartPre=wget "https://raw.githubusercontent.com/sfX-android/automation_scripts/refs/heads/ansible/plays/collections/requirements.yml" -O /tmp/r.dl
ExecStartPre=/usr/bin/mv -v /tmp/r.dl /etc/semaphore/requirements.yml
ExecStartPre=/bin/bash -c 'source /opt/semaphore/.venv/bin/activate \
                && ansible-galaxy collection install --upgrade -r /etc/semaphore/requirements.yml \
                && ansible-galaxy role install --force -r /etc/semaphore/requirements.yml'

# eventually start semaphore
ExecStart=/bin/bash -c 'source /opt/semaphore/.venv/bin/activate \
                && /usr/bin/semaphore server --config /etc/semaphore/config.json'

# OPTIONAL (only if you are using splunk or require different callbacks or other specific overrides)
# see: https://semaphoreui.com/docs/administration-guide/configuration/env-vars
# pass environment vars to semaphore:
#Environment="ANSIBLE_CALLBACKS_ENABLED=splunkpors"
#Environment="ANSIBLE_CALLBACK_WHITELIST=splunkpors"
#Environment="SEMAPHORE_FORWARDED_ENV_VARS=[\"ANSIBLE_CALLBACK_WHITELIST\", \"ANSIBLE_CALLBACKS_ENABLED\"]"

[Install]
WantedBy=multi-user.target

_EOF

systemctl enable --now semaphore
```

If you do **not** want to use the automated process via systemd you need to download the requirements manually:<br/>_(i.e. **SKIP** this if you use the provided systemd service above)_
```
su - semaphore
wget https://raw.githubusercontent.com/sfX-android/automation_scripts/refs/heads/ansible/plays/python-requirements.txt -O /etc/semaphore/python-requirements.txt
wget "https://raw.githubusercontent.com/sfX-android/automation_scripts/refs/heads/ansible/plays/collections/requirements.yml" -O /etc/semaphore/requirements.yml

source /opt/semaphore/.venv/bin/activate
python3 -m pip install --upgrade -r /etc/semaphore/python-requirements.txt
ansible-galaxy collection install --upgrade -r /etc/semaphore/requirements.yml
ansible-galaxy role install --force -r /etc/semaphore/requirements.yml

# if you follow this approach ensure you execute these from time to time again to get updates
```

### Buildserver

AXP.OS supports Ubuntu **24.04 LTS** only while [others](https://web.archive.org/web/20241227223444/https://divestos.org/pages/build#deps) **might** work, too but you are on your own then.

Recommended specs (standalone, i.e. when using a **separate(!)** Buildserver):
- 16 CPU cores _(ofc building with e.g 2 cores works but would take a long time)_
- 64 GB RAM
  - _if you have less than that, you might need a SWAP file_
  - _the amount of RAM and/or SWAP depends on the Android version you build for! E.g. A9 just requires 8 GB and A15 at least 48 GB to build without workarounds_
- at least 200 GB free disk space (on `/usr/src`).
  - _the amount depends though. as a rule of thumb: ~200GB per Android version you want to build for_
- if you want to use CCACHE _(recommended)_:
  - the amount depends again on how many Android versions (and/or kernels) you want to build for and can be set via `ccache_max_size` in your semaphore inventory
  - if building for 2 Android versions (e.g. A11 + A13) the disk usage is `ccache_max_size x 2` and `ccache_max_size x 3`  when building for 3 versions and so on.
  - example when building A15 for multiple devices: 50G _(ccache uncompressed)_
  - example when building A10 for 1 device only: 20-30G _(ccache uncompressed)_
  - you can optionally enable compression _(`CCACHE_COMPRESS: 1` in your semaphore inventory)_ to reduce disk usage at the cost of CPU usage
- can run in LXC, docker, full VM, or even on your laptop/PC
- OS: Ubuntu 24.04

```
sudo apt update && sudo apt upgrade && sudo apt full-upgrade && sudo apt -f install && sudo apt autoremove
sudo ln -s /usr/include/asm-generic /usr/include/asm

sudo apt install aapt android-sdk-libsparse-utils policycoreutils-python-utils autoconf automake bc bison bsdmainutils build-essential ccache curl dos2unix expat firejail flex fuse2fs g++ g++-multilib gawk gcc gcc-multilib git git-lfs gnupg gperf imagemagick jpegoptim jq lib32ncurses-dev lib32z1-dev libc6-dev libc6-dev-i386 libcap-dev libexpat1-dev libgl1-mesa-dev libgmp-dev libmpc-dev libmpfr-dev libncurses-dev libncurses5-dev libncurses6 libsdl1.2-dev libssl-dev libtool libx11-dev libxml2 libxml2-utils lzop maven openjdk-8-jdk openssl optipng patch pkg-config pngcrush python-is-python3 python3-all-dev python3-colorama python3-pip python3-pygerrit2 python3-pyperclip repo schedtool squashfs-tools subversion texinfo tmux unzip wget x11proto-core-dev xsltproc zip zlib1g-dev

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

ensure locale is as expected:
```
sudo dpkg-reconfigure locales
```

now you can already start downloading the android sources to speed up your first build. The following is an example for A13, adapt the LineageOS version if needed:
```
$[BUILD-USER]> sudo mkdir -p /usr/src/android/axp/Build/LineageOS-20.0
$[BUILD-USER]> sudo chown -R $[BUILD-USER] /usr/src/android
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
$[BUILD-USER]> gpg --expert --full-gen-key --pinentry-mode=loopback
# Select: ECC (sign and encrypt)
# Select: Curve 25519
# Select: expire date of your choice
# Answer requested information
# note: if you set a password on the key several automation parts will NOT work unless you automate the key unlock before starting a build
```

`--pinentry-mode=loopback` is required as switching via su/sudo to another user won't give you access to the tty which is required by gpg. if you still get a `permission denied` error you can run the following command as root user + sudo instead:
```
root#> sudo -u $[BUILD-USER] gpg --expert --full-gen-key
```


add both, SSH and GPG keys, to your accounts (and.. yes repeat that for _all_ sites):
- https://code.binbash.rocks
- and: https://github.com
- and: https://git.disroot.org

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

1. Download the JSON project according to your semaphore version:
   -  [semaphore v2.16](/semaphore_project.json)
   -  [semaphore v2.17](/semaphore_project_v217.json)
2. Click top left menu and `Restore Project`
3. Select the downloaded JSON file and set a project name, e.g. `AXP.OS` and let it import
4. you might see a message that some keys are empty, that is expected as they are private keys
5. Menu: `Key Store`
   - adapt `buildserver` to your setup
   - ignore `vault_pw` as this is nothing you need
6. Menu: `Inventory`
   - adapt `buildserver` to your setup
   - ignore `downloadserver` as you won't upload any builds
   - in the `all -> vars` section adapt all variables according to your setup

## Build AXP.OS 

1. Menu: `Task Templates`
2. Start the device task you want
3. Check/adapt the popup form and let it run ...

## Debugging

### Repo sync

Google is pretty strict when you try to re-sync multiple times but you can avoid getting rate limited by following: [fix-quota-barriers](https://source.android.com/docs/setup/download/troubleshoot-sync#fix-quota-barriers)

After following the instructions you also need to ensure adding `/a` to the manifest(s), e.g.:

```
vim .repo/manifests/default.xml

  <remote  name="aosp"
           fetch="https://android.googlesource.com/a"    <--! that /a path REQUIRES AN AUTHENTICATION COOKIE -->
           review="android-review.googlesource.com"
           revision="refs/tags/android-15.0.0_r5" />
```

As this is usually not happening after the initial sync completed once there is no automated process for this implemented.

### Ansible

check your Ansible log (https://github.com/sfX-android/automation_scripts/blob/ansible/ansible.cfg -> `log_path`)

### Build

Every build once started(!) will generate a build log on the `[buildserver]` (see your _inventory_) in the home directory of the user in the format:

`~/build_<model>_axp_<build-id>.log` and a `~/build_<model>_axp_latest.log` which points to the latest log

Example: `~/build_hotdog_axp_13.1.34.log` `<-` `build_hotdog_axp_latest.log` 

