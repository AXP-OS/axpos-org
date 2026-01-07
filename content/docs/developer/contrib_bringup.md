---
title: "Contribute: Device Bring-Up"
type: docs
toc: true
aliases:
    - /Contrib-Device
    - /Contrib-device
---
You want to contribute and help making AXP.OS better?! That is awesome and greatly appreciated!

Here some steps and tasks which would help in bringing up a new device more quickly!

First of all you could help adding as much information as possible. Bringing up a new device requires several steps and costs time.

There is no need to walk through _all_ steps if you do not like to, it is up to _you_ how much you _want_ to do or you want/have to skip one or more, of course. Any contribution counts ;)

## Pre-requirements

Before you can start you must register an account _(this is already required for opening a device request anyways, so you might have that already)_:

- register a [code.binbash.rocks (click)](https://code.binbash.rocks) account

## Prepare additional information

In order to speed up your device request to be worked on you can:

1. prepare additional information (listed in the next topics) to ***your own*** request
1. add the same for ***other*** device requests which are older than your own _(usually the order of processing is from oldest->newest - with exceptions though)_

## Android version

AXP.OS might not offer the latest available Android version for your device (by design):

1. check the current latest stable or planned [Android version](/docs/knowledge/requirements/#android-version)
1. check what LineageOS version is supported for your device [LineageOS wiki](https://wiki.lineageos.org/devices/)
1. map LineageOS version with Android version: [click](https://en.wikipedia.org/wiki/LineageOS#Version_history)
1. you need both versions later so note them

#### update your request:

Update your request with the following information:
- Suggested AXP.OS version: `Android XXX , lineageOS-XXX`

_keep in mind that the AXP.OS version must be a stable or planned Android version. That means if LOS supports A13-A16 but AXP.OS only A13 or A15, then A15 is the suggested AXP.OS version._

## Firmware / Bootloader

### Firmware check

1. open https://code.binbash.rocks/AXP.OS/vendor_firmware
1. select the correct `branch` _(must match the AXP.OS Android version)_
1. click the folder with the `codename` for your device<br/>_(if you do not know it: https://wiki.lineageos.org/devices/ -> select your device and find its codename)_

If there is a folder with the requested codename (e.g. `enchilada`), check the file `AndroidBoardVendor.mk`. It should contain several `$(call add-radio-file.....`.

#### update your request:

Update your request with the following information:

- vendor_firmware - AndroidBoardVendor.mk: `<link>` (or, if not found: `not supported/found`)

### Blobs check

> [!CAUTION] EXCEPTIONS
> _Skip this topic for **any** device which still provides firmware updates for the suggested Android version of the device (e.g. Fairphone or SHIFTphone might still offer updates for that Android version. In that case skip to the next topic)._

1. open https://github.com/TheMuppets
1. find the repo with the codename
1. select the correct `branch` (axp-a13 = `lineage-20.0`, etc)
1. find the `Android.mk` within
1. add a _link_ to that Android.mk file in your request (example: `https://github.com/TheMuppets/proprietary_vendor_fairphone_FP3/blob/lineage-20.0/Android.mk`)

#### update your request:

Update your request with the following information:

- TheMuppets - Android.mk: `<link>`

### Any device which still gets vendor firmware updates

> [!CAUTION] EXCEPTIONS
> _This topic can be skipped if the previous **Blobs check** topic matched for your device_

Usually this topic covers mostly Fairphone / SHIFTphone but even then that has to be verified first! For example Fairphone recently released A15 for the FP4 model and so stopped providing updates for A13. If A13 is the suggested Android version it means you have to follow the _blobs check_ above instead, otherwise (i.e. if the Android version matches what the vendor provides updates for, go on).

For these devices AXP.OS automatically downloads and includes the latest available firmware if properly set up.

You need to find the latest and _Android-version-matching_ STOCK-OS ZIP from a [trusted source](/docs/developer/port/#extract-and-push-vendorfirmware). That means it must match the _AXP.OS_ Android version.

#### update your request:

Update your request with the following information:

```
vendor_firmware_source: "https://the-website-where-the-firmware-is-located"
vendor_firmware_download_url: "" # DIRECT download link
vendor_firmware_download_sha512: "" # one of sha512, sha256 or md5 is required (in that order)
```

### Automation

#### update your request:

Update your request as follows:

1. copy the whole content of this [copytemplate](https://github.com/sfX-android/automation_scripts/blob/ansible/roles/axp/common_init_device/vars/copytemplate.yml)
2. add a new comment and paste it there _(do not save yet)_
3. select the **whole** block, then click the `<>` icon, from now on you can save that comment or directly proceed with 4:
4. fill in what you can, blocks with `REQUIRED` are more important than others, if you have no idea ask or simply skip. ensure you _ignore_ any `DO NOT TOUCH` blocks _(do **not** remove them though)_.

### Prepare _other_ requests

After you have done all for your _own_ request you might find that there is a queue of requests before yours. You can do the same as the above with these requests, because the sooner _they_ will be finished the sooner yours will.

The following are helpers, i.e. preset searches which can be used to identify device requests and their order (there is no static / fixed process order but chances are high they go like this).

#### Low hanging fruits (top in processing order)

Pre-filtered which shows just those which are 90% sure to be added:
- [Issue tracker](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues?type=all&state=open&labels=26%2C47%2C-43%2C-44%2C-41%2C-34&sort=oldest) _(top->down: oldest->newest)_

#### Good enough (high in processing order)

Pre-filtered (official) LineageOS ones which are 80% sure to be added:
- [Issue tracker](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues?type=all&state=open&labels=-34%2C-41%2C-43%2C-44%2C26%2C45&sort=oldest) _(top->down: oldest->newest)_

#### Problematic ones (low in processing order)

Pre-filtered unofficial LineageOS ones which are 40% sure to be added:
- [Issue tracker](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues?type=all&state=open&labels=-34%2C-41%2C-43%2C-44%2C26%2C46&sort=oldest) _(top->down: oldest->newest)_