---
title: "Play Store"
type: docs
toc: true
aliases:
    - /Upgrade-Play-Store
---
AXP.OS will ship the latest (stable) Play Store during its regular OS builds but if you do not want to wait you can update the play store manually as well.

### AXP.OS users
 
- browse to the [Release page](https://github.com/AXP-OS/packages_apps_phonesky/releases)
- expand "Assets" at the release you want to install
- download the latest "Phonesky_AXP-OS-**signed**.apk"
- install it via e.g. `adb install Phonesky_AXP-OS-signed.apk`
- verify the version via `App info`

note: you can install only the `-signed` variants on AXP.OS as these are signed with the [AXP.OS app key](/docs/knowledge/signatures/#axpos-app-signature).<br/>
Any other Play Store (e.g. downloaded elsewhere) will be rejected and can't be installed on AXP.OS. 

### non-AXP.OS users

If you want to use this Play Store version on any other OS than AXP.OS you are in general free to use the signed or unsigned variant - while it is strongly recommended using the signed one. 

The process is slightly different then though, please follow the [README](https://github.com/AXP-OS/packages_apps_phonesky/tree/axp?tab=readme-ov-file#installing-patched-google-play) for the how-to. 

In general that should work fine while it is not tested nor supported by AXP.OS.

### Turn-off "Update Google Play services" notification

see: [here](/Google-Play-store-notifications)

