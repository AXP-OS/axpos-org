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

## Prepare your _own_ request

### Firmware

#### Legacy devices/versions not receiving vendor firmware updates anymore

> [!CAUTION] EXCEPTIONS
> _Skip this topic only for devices which still gets firmware updates for the suggested Android version of the device. For example Fairphone or SHIFTphone might still offer updates for that Android version you want to use with AXP.OS. Only then skip that topic and proceed with the next topic._

1. open https://github.com/TheMuppets
2. find the repo with the codename
3. select the correct `branch` (axp-a13 = `lineage-20.0`, etc)
4. find the `Android.mk` within

##### update your request:

Update your request with the following information:

- TheMuppets: `<link-to-Android.mk>`

(e.g.: `https://github.com/TheMuppets/proprietary_vendor_google_blueline/blob/lineage-20/Android.mk`)

#### Devices which still gets vendor firmware updates

> [!CAUTION] EXCEPTIONS
> _This topic can be skipped if the previous **"Legacy devices/versions not receiving vendor firmware updates anymore"** topic matched for your device already._

This topic covers mostly Fairphone / SHIFTphone but even then that has to be verified first! For example Fairphone recently released A15 for the FP4 model and so stopped providing updates for A13. If A13 is the suggested Android version it means you have to follow the *"Legacy devices/versions not receiving vendor firmware updates anymore"* above instead, otherwise (i.e. if the Android version matches what the vendor provides updates for, go on).

For these devices AXP.OS automatically downloads and includes the latest available firmware and live-extract all required blobs.

No action required here but you have to fill in the whole **Firmware info** block in the copytemplate of the next topic _"Automation"_

### Automation

#### update your request:

Update your request as follows:

1. copy the whole content of this [copytemplate (click to open)](https://github.com/sfX-android/automation_scripts/blob/ansible/roles/axp/common_init_device/vars/copytemplate.yml)
![copytemplate](/img/copytemplate.png)
2. add a new comment to your request and paste it there _(do not save yet)_
3. select the **whole** block, then click the `<>` icon, from now on you can save that comment or directly proceed with 4:
4. fill in what you can, related blocks are marked with `DEFINE-IF-YOU-CAN`. If you have no idea ask or simply skip it. ensure you _ignore_ any `DO NOT TOUCH` blocks _(do **not** remove them though)_.

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