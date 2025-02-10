---
title: "Backup & Restore"
type: docs
toc: true
aliases:
    - /Backup-and-Restore
---
> [!CAUTION]
> This guide is marked as outdated and requires a re-work

SeedVault is not recommended anymore
- does not backport features nor bugfixes to older Android versions
- had many backup issues
- had many restore issues
- misses important features like clean-up etc

Recommended: `root + NeoBackup [+ RoundSync for remote-backups]`

# About

AXP.OS comes with the current OpenSource standard backup application [SeedVault](https://github.com/seedvault-app/seedvault). It uses internal Android APIs to backup and restore your data and does not require root at all (while root is available in AXP.OS of course).

You can backup your "normal" profile but SeedVault supports working profiles as well (e.g. when using Insular or Shelter to isolate apps). Choose whatever you like most, using `USB flash drive` is the easiest and fastest method.

## Limitations

Please note that SeedVault will not backup **all** app's **_data_**. An app developer can decide if its app data is allowed to be included in a backup or not. This is nothing we can change! Request allowing data backup by the App dev.. or proceed with this guide and overcome these limitations by using a 2-step method.

SeedVault might overcome these limitations with Android14 as they recently added an "hack" to backup even those apps data which usually deny doing so (see [here](https://github.com/seedvault-app/seedvault/pull/562)).

# Backup

## Option 1: Easy method (fast + manual)

1. in SeedVault (`Settings - System - Backup - Choose Backup Provider SeedVault`) choose `USB flash drive`
1. setup SeedVault as written in the topic: "Setup SeedVault / overcoming the limitations"
1. Manually select "Backup Now" (3 dots at the top right in SeedVault) at any time you want or keep the USB drive connected over night

## Option 2: Advanced "setup-and-forget" method (slower + automatic)

A more advanced and "setup-and-forget" method is by using webdav. Unfortunately and due to the way how SeedVault works there are limitations, i.e. it will NOT work with owncloud or nextcloud. Even though it might work sometimes it will fail sooner or later. You can find reports in their issue trackers as well. Besides that I tried all simple webdav alternatives I could find but either there were outdated or incompatible, slow or had security issues.

The only reliable way which works for me - while still supported by its devs - seems to be DUFS:

1. Running [DUFS](https://github.com/sigoden/dufs) on your server
1. setup a SSL certificate for DUFS
1. example DUFS config which actually works (separated main + work profile for backup, 1 restore account for both):
```
# see: https://github.com/sigoden/dufs

serve_path: /var/opt/dufs
bind: <your-pub-IP>
port: <your-pub-IP-port>
#path_prefix: /path
hidden:
  - '*.log'

auth:
  - <restore-readonly-username>:<a-secure-password>@/
  - <backup-readwrite-username-MAINPROFILE>:<a-secure-password>@/main:rw
  - <backup-readwrite-username-MAINPROFILE>:<a-secure-password>@/work:rw

auth-method: digest
allow-all: false
allow-upload: true
allow-delete: true
allow-search: false
allow-symlink: false
allow-archive: false
enable-cors: false
render-index: false
render-try-index: false
render-spa: false
tls-cert: /etc/dufs/cert.crt
tls-key: /etc/dufs/key.pem
```
4. install [DAVx5](https://f-droid.org/packages/at.bitfire.davdroid/) on your phone
5. configure a webdav mount with the credentials set in `DUFS_AUTH` (repeat for your work/insular/shelter profile)
6. setup SeedVault as written in the next topic: "Setup SeedVault / overcoming the limitations"
7. SeedVault will backup automatically over night

## Setup SeedVault / overcoming the limitations

As written in the _Limitations_ topic SeedVault will not backup all app's data. Here AXP.OS comes to the rescue as it contains root by default allowing to overcome this. Of course you might want to use a backup tool which can upload backups directly wherever you like but as Titanium is not working reliable anymore these days I use Neo Backup instead. At the moment it does not allow to upload but that's not a problem as we can combine SeedVault with Neo Backup to get the best of both worlds!

Here is my current way of backing up my devices:

### Main profile

Note: this will work great for the main profile - for the work/Insular/Shelter profile there is "just" the SeedVault way - if you want to keep this isolated area root-less.

1. Install [Neo Backup](https://f-droid.org/packages/com.machiav3lli.backup/) - requires root (one of the main reasons why Magisk is included in AXP.OS)
1. Schedule your app backups as you like (if selected including the app's data - regardless if that app allowing it or not)
1. Ensure you set in Neo Backup "keep max backup count" to `1` (we do a daily SeedVault backup which will already handle multi versions) 
1. In `Settings - System - Backup - Choose Backup Provider SeedVault`
1. Setup DAVx5 with your main profile (must match your `DUFS_AUTH` setup)
1. Configure SeedVault:
   - deselect "Backup my apps" completely or select just mandatory ones (keep in mind that you have an app backup from Neo Backup)
   - select "Backup my files"
   - select "Included files and folders"
   - tap the + button and add the location where you store your NeoBackup backups
1. From now on SeedVault will run a backup every night including any changes by Neo Backup (and what else you selected of course)

### Work profile (Insular/Shelter)

Note: if you do **not** want to keep this isolated area root-less you can configure root and Neo Backup and follow the above "Main profile" topic instead.

1. In `Settings - System - Backup - Choose Backup Provider SeedVault`:
1. Setup DAVx5 with a different mount then your main profile! (must match your `DUFS_AUTH` setup)
1. Configure SeedVault:
   - select "Backup my apps" - choose all or select just mandatory ones (keep in mind that you do NOT have an app backup from Neo Backup)
   - optional: select "Backup my files"
       - select "Included files and folders"
       - tap the + button and add any other location you want to backup
1. From now on SeedVault will run a backup every night

# Restore

## by USB flash drive

Restoring by `USB flash drive` is straight forward when re-installing / factory reset your device. 

1. Ensure you plugin your USB device
1. When the wizard asks to restore choose `USB flash drive` and go through the steps.

## by Webdav (advanced method above)

When restoring from a webdav location there is a bit more to do:

1. When the wizard asks to restore choose `DAVx5` -> you will be prompted to install -> choose F-Droid here
1. Note: If F-Droid cannot find the app, just retry after some secs as the package db might not be downloaded yet
1. configure your webdav mount with the credentials set in `DUFS_AUTH` (repeat for your work/insular/shelter profile)
1. you will be guided through the rest

once your data has been restored:

1. install Neo Backup again
1. choose what apps to restore

## after passing the wizard / restoring a work profile

SeedVault will show the restore dialog during the initial wizard process only. If you went through the wizard there is no way to bring back the restore window - usually. AXP.OS [fixed that](https://github.com/LineageOS/android_packages_apps_Seedvault/compare/lineage-20.0...AXP-OS:android_packages_apps_Seedvault:axp-a13) while it requires ADB to show the restore page.

The same applies when restoring a work profile (e.g. created by Insular/Shelter).

Bring up the restore dialog at any time:

1. Enable USB Debugging
1. restore dialog for the **main** profile:<br/>
`adb shell am start -a com.stevesoltys.seedvault.RESTORE_BACKUP`
1. restore dialog for the **work** profile (note the user is usually 10 but this might be different in your setup):<br/>
`adb shell am start --user 10 -a com.stevesoltys.seedvault.RESTORE_BACKUP`

