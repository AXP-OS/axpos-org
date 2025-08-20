---
title: MajorRelease
type: docs
toc: true
aliases:
    - /MRU
    - /MajorRelease
    - /MajorUpdate
    - /MajorReleaseUpdate
    - /MajorReleaseUpgrade
---

{{< callout type="info" >}}
This describes the manual process for updating AXP.OS to a new **Major Release** _(see [regular updates](/Over-the-air) otherwise)_. <br/>

The updater app does not support automatic upgrades from one Major Release of AXP.OS to another and will block installation to any update for a different version.

Due to the nature of such a massive update you should never start without a full [Backup](/docs/guides/backuprestore)!
{{< /callout >}}

## Via ADB / recovery (recommended)

1. Read the [Changelog](/devices/changelogs)!
1. Keep an eye on the [Automation channel](/docs/overview)
1. Always do a [Backup](/docs/guides/backuprestore)!
1. Using Magisk hide? [Undo the hiding of Magisk](/docs/guides/hideroot/#undo-hide) before upgrading
1. Download ({{< globalvar key="downloadServerBaseUrl" uripath="/axp" linkname="Pro" >}} / {{< globalvar key="downloadServerBaseUrl" uripath="/axp-slim" linkname="Slim" >}}) the latest release for your device and flavor (_for Pixels: choose "OS zip"_)
1. Verify the build [Signature](/docs/knowledge/signatures/#build-signatures) and hash sum
1. reboot your device into recovery and select `Apply update -> Apply from ADB`
1. use `adb sideload AXP.OS.zip` to flash the update

{{< callout type="info" >}}
_Note for **A/B devices**: do **NOT** reboot to recovery and flash it twice. If the update cause boot issues it will switch to the other slot and so you keep a working/booting system this way._
{{< /callout >}}

## Via fastboot (fallback)

{{< callout type="warning" >}}
This method skips any signature validations and will fully overwrite an existing system without any further checks (other than obvious ones like if the device is matching etc).

It is highly recommended to check if the checksum hash is valid before flashing such a fastboot or factory zip and compare it not just with the one from the download site but also from the [automation channel](/docs/overview).
{{< /callout >}}

### non-destructive

{{< callout type="info" >}}
At the release time of a Major Release a fastboot zip will be provided. There are no regular releases for fastboot zip's so you will likely be prompted for an OTA update after you have flashed fastboot zip and booted once.
{{< /callout >}}

Available for most devices, except Samsung and other non-fastboot aware vendors.

1. Read the [Changelog](/devices/changelogs)!
1. Keep an eye on the [Automation channel](/docs/overview)
1. Always do a [Backup](/docs/guides/backuprestore)!
1. Using Magisk hide? [Undo the hiding of Magisk](/docs/guides/hideroot/#undo-hide) before upgrading
1. Download ({{< globalvar key="downloadServerBaseUrl" uripath="/axp" linkname="Pro" >}} / {{< globalvar key="downloadServerBaseUrl" uripath="/axp-slim" linkname="Slim" >}}) the latest release for your device and flavor (_choose "Fastboot zip"_)
1. Verify the build [Signature](/docs/knowledge/signatures/#build-signatures) and hash sum
1. reboot your device into fastboot mode
1. flash the fastboot zip:
    * `fastboot update <fastboot.zip filename>`
1. boot into the system and check with the [Updater](/Over-the-air) if there is any OTA available (install it if there is any)

### destructive / clean flash

{{< callout type="error" emoji="⚠️" >}}
you will loose all your apps and settings as it will factory reset. 
{{< /callout >}}

Not available for all devices, mostly for Google Pixels and Fairphone devices.

1. Read the [Changelog](/devices/changelogs)!
1. Keep an eye on the [Automation channel](/docs/overview)
1. Always do a [Backup](/docs/guides/backuprestore)!
1. Download ({{< globalvar key="downloadServerBaseUrl" uripath="/axp" linkname="Pro" >}} / {{< globalvar key="downloadServerBaseUrl" uripath="/axp-slim" linkname="Slim" >}}) the latest release for your device and flavor (_choose "Factory zip"_)
1. Verify the build [Signature](/docs/knowledge/signatures/#build-signatures) and hash sum
1. reboot your device into fastboot mode
1. flash the Factory zip:
    * when on Windows, type: `flash-all.bat`
    * when on Linux, type: `./flash-all.sh`
1. boot into the system and check with the [Updater](/Over-the-air) if there is any OTA available (install it if there is any)

