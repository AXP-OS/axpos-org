---
title: Manual
type: docs
toc: true
#aliases:
---
> [!WARNING]
> The following methods are meant as a fallback only. It is recommended to use the [Over the Air](/Over-the-air) update method whenever possible.

### Via Updater
> [!TIP]
> During the local update process the zip validation happens identically as within the [Over the Air](/Over-the-air) update method.

1. Read the [Changelog](/devices/changelogs)!
1. Keep an eye on the [Automation channel](/docs/overview)
1. Always do a [Backup](/docs/guides/backuprestore)!
1. Using Magisk hide? un-do this before upgrading
1. Download ({{< globalvar key="downloadServerBaseUrl" uripath="/axp" linkname="Pro" >}} / {{< globalvar key="downloadServerBaseUrl" uripath="/axp-slim" linkname="Slim" >}}) the latest release for your device and flavor (_for Pixels: choose "OS zip"_)
1. open `Android Settings -> Updater -> 3 dots menu -> Local update` and select the downloaded zip
1. follow the instructions and ensure you do not miss the hint above regarding Magisk

### Via ADB / recovery

> [!TIP]
> As long as you use the recommended AXP.OS recovery and **not** a _custom_ recovery it will also check for a valid signature and so if the zip is tampered or not. This is one of the reasons why the AXP.OS recovery is highly recommended and should be used always.

1. Read the [Changelog](/devices/changelogs)!
1. Keep an eye on the [Automation channel](/docs/overview)
1. Always do a [Backup](/docs/guides/backuprestore)!
1. Using Magisk hide? un-do this before upgrading
1. Download ({{< globalvar key="downloadServerBaseUrl" uripath="/axp" linkname="Pro" >}} / {{< globalvar key="downloadServerBaseUrl" uripath="/axp-slim" linkname="Slim" >}}) the latest release for your device and flavor (_for Pixels: choose "OS zip"_)
1. Verify the build [Signature](/docs/knowledge/signatures/#build-signatures) and hash sum
1. reboot your device into recovery and select `Apply update -> Apply from ADB`
1. use `adb sideload AXP.OS.zip` to flash the update

### Via fastboot (last resort)

> [!CAUTION]
> This method skips any signature validations and will fully overwrite an existing system without any further checks (other than obvious ones like if the device is matching etc).
>
> It is highly recommended to check if the checksum hash is valid before flashing such a factory zip and compare it not just with the one from the download site but also from the [automation channel](/docs/overview).

If there is a factory zip for your device available you can use this one to flash it via fastboot like described in the Installation guide of your device **but beware**: 

{{< callout type="warning" >}}
you will loose all your apps and settings as it will factory reset. 
{{< /callout >}}

If there is a need for a flashable one without factory reset [let us know](/docs/overview/#support).

1. Read the [Changelog](/devices/changelogs)!
1. Keep an eye on the [Automation channel](/docs/overview)
1. Always do a [Backup](/docs/guides/backuprestore)!
1. Download ({{< globalvar key="downloadServerBaseUrl" uripath="/axp" linkname="Pro" >}} / {{< globalvar key="downloadServerBaseUrl" uripath="/axp-slim" linkname="Slim" >}}) the latest release for your device and flavor (_choose "Factory zip"_)
1. Verify the build [Signature](/docs/knowledge/signatures/#build-signatures) and hash sum
1. reboot your device into fastboot mode
1. flash the Factory zip:
    * when on Windows, type: `flash-all.bat`
    * when on Linux, type: `./flash-all.sh`
