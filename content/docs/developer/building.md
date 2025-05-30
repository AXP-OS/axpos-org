---
title: "Build AXP.OS"
type: docs
toc: true
aliases:
    - /Build
    - /build
---

> [!CAUTION]
> This guide is currently being revised

AXP.OS is build the "traditional" way, i.e. without docker and fully automated. Building AXP.OS without automation is **not(!) supported**. 

## Automation scheme


```

               ┌────────────────────────────────────┐
               │     🚦 Semaphore (UI + Control)    │──────.          . . . . . . . . . . . . . . . .
               │     🛠️ Ansible (same system)       │      '───────▶ .       🗄️ Database           .
               │    . . . . . . . . . . . . . . .   │                 .   (remote or on Semaphore)  .
               │    🏗️ Buildserver (can be local)   │                 . . . . . . . . . . . . . . . . 
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
- **Semaphore** UI - see [here](https://docs.ansible-semaphore.com/administration-guide/installation)

Recommended specs (standalone, i.e. when using a **separate** build system):
- 4 CPU cores
- 2 GB RAM
- 20 GB free disk space
- can run in LXC, docker, full VM, or even on your laptop/PC

Ansible + Semaphore must run on the **same** machine while your build system can be the same system **or** a complete different one. Ansible will connect by SSH to the build system or keeps everything local - depending on your config.

Note: This guide does not cover the configuration of Ansible nor Semaphore. Use their corresponding documentation page to do so. Usually that is a 5-10 min task so don't worry ;)

If you want to share logs for troubleshooting etc:

```
sudo apt install gist
gist-paste --login
(follow the steps to authorize)
```

### Build system

AXP.OS supports **Ubuntu (22.04 LTS)** only while [others](https://web.archive.org/web/20241227223444/https://divestos.org/pages/build#deps) **might** work, too.

```
sudo apt update && sudo apt upgrade && sudo apt full-upgrade && sudo apt -f install && sudo apt autoremove
sudo ln -s /usr/include/asm-generic /usr/include/asm

sudo apt install aapt autoconf automake bc bison build-essential ccache curl expat flex g++ gawk gcc gcc-multilib git-core git-lfs g++-multilib gnupg gperf lib32ncurses5-dev lib32z1-dev lib32z-dev libc6-dev libc6-dev-i386 libcap-dev libcloog-isl-dev libesd0-dev libexpat1-dev libgcc1:i386 libgl1-mesa-dev libgmp-dev libmpc-dev libmpfr-dev libncurses5-dev libsdl1.2-dev libtool libx11-dev libxml2 libxml2-utils lzop maven ncurses-dev openjdk-8-jdk patch pkg-config pngcrush python-all-dev schedtool squashfs-tools subversion texinfo unzip x11proto-core-dev xsltproc zip zlib1g-dev imagemagick repo firejail optipng jpegoptim openssl vim wget python3-colorama python3-pip python3-pyperclip bsdmainutils dos2unix

pip install pygerrit2
```

#### When building for Android 9 or 10 only

add the deprecated version 2 of python as a virtual environment (do not change any paths here as they are used within the automation process):

```
sudo apt-get install python2 virtualenv python2-pip-whl python2-setuptools-whl
mkdir -p ~/.venv/python2
virtualenv --python=$(which python2) ~/.venv/python2
```


## Setup Semaphore

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
  "android_shortversion": "a13",
  "git_repo_main_branch": "lineage-20.0",
  "post_cleanup": "true",
  "clean_basic": "true",
  "clean_out": "true",
  "reset_git": "true",
  "sign_build": "true",
  "release_build": "true",
  "nolog_gitreset": "true",
  "axp_allow_permissive": false
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
# never use TABs here!!!!!

# buildserver is either localhost or a remote system
# the following setup is when using semaphore/ansible on the same
# machine
buildserver:
  hosts:
     localhost:
        ansible_connection: local

all:
  vars:
    BUILDHOME: "/opt/semaphore" # the home path of the semaphore user
    semaphore_lock_dir: "{{ BUILDHOME }}/run" # semaphore run files
    semaphore_work_dir: "{{ BUILDHOME }}/data" # must match semaphore's config.json
    repo_bin: "{{ BUILDHOME }}/.local/bin/repo" # full path to your repo binary
    android_build_path: "/opt/data/development/android_build"   # root path of where you wanna place android sources
    DOSPATH: "{{ android_build_path }}/{{ ROM_FLAVOR }}"    # divest path (keep it like that if unsure)
    CCACHE_DIR: "{{ android_build_path }}/ccache"   # full path where to place ccache data
    max_processes: 18   # max cpu count for building/checking out sources
    max_processes_sync: 8   # max cpu count for repo sync cmds (be careful as u can get rate limited easily)
    ZIPDIR: "{{ BUILDHOME }}/zips/{{ target_model }}" # target directory for the final OS zips

#    SEPARATE_OUT_DIR: "/ssd/{{ target_model }}/{{ ROM_FLAVOR }}-{{ android_shortversion }}/out"
#    SRCPATH: "{{ BUILDHOME }}/{{ ROM_FLAVOR }}"


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

### Ansible

check your Ansible log (https://github.com/sfX-android/automation_scripts/blob/ansible/ansible.cfg -> `log_path`)

### Build

Every build once started(!) will generate a build log on the `[buildserver]` (see your _inventory_) in the home directory of the user in the format:

`~/build_<model>_a<androidversionnumber>_axp.log`

Example: `~/build_hotdog_a13_axp.log`

