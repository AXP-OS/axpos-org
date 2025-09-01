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

The updater app does **not** support automatic upgrades from one Major Release of AXP.OS to another and will block installation to any update for a different version.

The process involves factory resetting your device so you should never start without a full [Backup](/docs/guides/backuprestore)!

In-place upgrades (i.e. keeping all your apps and settings) are **not** supported.
{{< /callout >}}

## Via recovery (recommended)

{{< callout type="info" >}}
_ensure you do not miss unlocking your bootloader first (if currently locked)_
{{< /callout >}}

Doing a Major Release Upgrade is like flashing AXP.OS the first time. That means this process will factory reset your device and you need to re-install or restore your apps from your backup.

Simply follow the regular installation guide of [your device](https://axpos.org/devices) with one exception:

{{< callout type="info" >}}
When downloading the recovery, choose the recovery image of the **target major release** _(i.e. for AXP.OS-**22.2**-XXXXX.img if you plan upgrading to **A15**)_
{{< /callout >}}

For the rest just follow the regular guide.

{{< callout type="warning" >}}
_Note for **A/B devices**: do **NOT** reboot to recovery and flash it twice. If the update cause boot issues it will switch to the other slot and so you keep a working/booting system this way._
{{< /callout >}}

## Via fastboot

{{< callout type="warning" >}}
This method skips any signature validations and will fully overwrite an existing system without any further checks (other than obvious ones like if the device is matching etc).

It is highly recommended to check if the checksum hash is valid before flashing such a fastboot or factory zip and compare it not just with the one from the download site but also from the [automation channel](/docs/overview).

_Note for **A/B devices**: do **NOT** reboot to recovery and flash it twice. If the update cause boot issues it will switch to the other slot and so you keep a working/booting system this way._
{{< /callout >}}

{{< callout type="info" >}}
_ensure you do not miss unlocking your bootloader first (if currently locked)_
{{< /callout >}}

### fastboot.zip

{{< callout type="info" >}}
At the release time of a Major Release a fastboot zip will be provided. There are no regular releases for fastboot zip's so you will likely be prompted for an OTA update after you have flashed fastboot zip and booted once.
{{< /callout >}}

Available for most devices, except Samsung and other non-fastboot aware vendors.

{{< callout type="error" emoji="⚠️" >}}
you will loose all your apps and settings as it will factory reset. 
{{< /callout >}}

1. Read the [Changelog](/devices/changelogs)!
1. Keep an eye on the [Automation channel](/docs/overview)
1. Always do a [Backup](/docs/guides/backuprestore)!
1. Using Magisk hide? [Undo the hiding of Magisk](/docs/guides/hideroot/#undo-hide) before upgrading
1. Download ({{< globalvar key="downloadServerBaseUrl" uripath="/axp" linkname="Pro" >}} / {{< globalvar key="downloadServerBaseUrl" uripath="/axp-slim" linkname="Slim" >}}) the latest release for your device and flavor (_choose "Fastboot zip"_)
1. Verify the build [Signature](/docs/knowledge/signatures/#build-signatures) and hash sum
1. _if your bootloader is **unlocked**_: reboot your device into recovery mode and FACTORY RESET the device
1. _if your bootloader is **locked**_: unlock it NOW _(this will factory reset the device)_
1. reboot your device into fastboot mode
1. flash the fastboot zip:
    * `fastboot update <fastboot.zip filename>`
1. boot into the system and check with the [Updater](/Over-the-air) if there is any OTA available _(install it if there is any)_
1. if all went fine follow the [device guide](https://axpos.org/devices/) if there is anything left (e.g. locking the bootloader again etc)

### factory.zip

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
1. boot into the system and check with the [Updater](/Over-the-air) if there is any OTA available _(install it if there is any)_
1. if all went fine follow the [device guide](https://axpos.org/devices/) if there is anything left (e.g. locking the bootloader again etc)


