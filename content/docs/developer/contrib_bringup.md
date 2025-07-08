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

## Pre-requirements

1. A [github](https://github.com) account _(for PR's against the manifests & build repos, can be skipped otherwise)_
2. A [code.binbash.rocks](https://code.binbash.rocks) account

## Find device requests

Go through the list of device requests, there is no enforced priority but usually from oldest to newest is the expected one.

#### Low hanging fruits

Pre-filtered which shows just those which are 90% sure to be added:
- [Issue tracker](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues?type=all&state=open&labels=26%2C47%2C-43%2C-44%2C-41%2C-34&sort=oldest) _(top->down: oldest->newest)_

#### Good enough

Pre-filtered (official) LineageOS ones which are 80% sure to be added:
- [Issue tracker](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues?type=all&state=open&labels=-34%2C-41%2C-43%2C-44%2C26%2C45&sort=oldest) _(top->down: oldest->newest)_

#### Problematic ones

Pre-filtered unofficial LineageOS ones which are 40% sure to be added:
- [Issue tracker](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues?type=all&state=open&labels=-34%2C-41%2C-43%2C-44%2C26%2C46&sort=oldest) _(top->down: oldest->newest)_

## Firmware / Bootloader

for each device:

### Firmware included?

A pre-check is required if Divest had supported including firmware in the past already:
- https://code.binbash.rocks/AXP.OS/vendor_firmware (branch must match the android version)

If there is a folder with the requested codename, check the file `0SOURCE`. It "maybe" lists the latest STOCK-OS version but that is not always the case.

If **not**, continue with the **_AXP.OS manifest_** topic.

#### Android version still vendor-supported?

AXP.OS does not ship the latest Android version but usually the firmware provided by the vendor is for the latest Android version only.
There are some exceptions like Fairphone and SHIFT though which still supporting older Android versions and so AXP.OS.

For these devices (currently **Fairphone** only) AXP.OS automatically downloads and includes the latest available firmware if properly set up.
Here examples for the [Fairphone 3](https://code.binbash.rocks/AXP.OS/vendor_firmware/src/branch/axp-a13/FP3/0SOURCE) and [Fairphone 4](https://code.binbash.rocks/AXP.OS/vendor_firmware/src/branch/axp-a13/FP4/0SOURCE).

Basically the `0SOURCE` file gets sourced by the `update.sh` script which must match the Fairphone model requirements. It handles not just the firmware but also the proprietary blobs! That also means the manifest for `vendor/<vendor>/<model>` must point to `remote="axp.os-private"`.

Create a PR at https://code.binbash.rocks/AXP.OS/vendor_firmware for the file `<codename>/0SOURCE` in the following format:
```
# URL: <Download link>
# Release notes: <release notes link>

export VENDOR_SECPATCH_DATE="<REPLACE-WITH-THAT-FROM-RELEASE-NOTES>"
FACTORYID="<ID>"
FACTORYIDHASH="<HASH>"
FACTORYFULLNAME="${FACTORYID}-gms-${FACTORYIDHASH}-user-fastbootimage"
```

#### Android version not vendor-supported?

You need to find the latest and _Android-version-matching_ STOCK-OS ZIP from a [trusted source](/docs/developer/port/#extract-and-push-vendorfirmware).

Create a PR at https://code.binbash.rocks/AXP.OS/vendor_firmware for the file `<codename>/0SOURCE` in the following format:
```
# URL: <Download link to STOCK-OS ZIP>
# SHA: <If there is no hash sum: download the STOCK-OS ZIP and generate a sha512 one>
export VENDOR_SECPATCH_DATE="<REPLACE-WITH-ro.vendor.build.security_patch>"
```

Usually you can identify `ro.vendor.build.security_patch` by extracting the vendor image from that STOCK-OS ZIP, mounting it and find the default or vendor prop containing that property.

If you are a trusted & verified developer:
{{% details title="Click to reveal" closed="true" %}}
- download STOCK-OS ZIP
- extract the required files (likely requires an additional payload.bin extract)
- modify `0SOURCE` accordingly (see above)
- push all required files (see `<codename>/AndroidBoardVendor.mk`)
{{% /details %}}

## AXP.OS manifest

Note: this requires (atm) a github account.

A manifest entry must be added in the form like this: https://github.com/AXP-OS/manifest/commit/8c7b7df03ebb9fe615f7c98d91d7949075122c8d

Usually a device has its own tree and a common device one, while there are exceptions. The common one is usually included via `inherit` in the device one, e.g. as shown [here](https://github.com/LineageOS/android_device_oneplus_hotdog/blob/49737e02bc192556eda74b9d5b36ab12f5d28ee8/device.mk#L52). It usually is in the device.mk but can also happen in different mk files. Ensure you are on the correct LineageOS branch matching the requested Android version!

You might noticed some entries containing `remote="axp.os"` while others are named `los` or `muppets`. that depends on where to find the repos actually. At the top you find the base URLs of each remote. 
- `remote="axp.os"` for the common device tree _(if there is none, the device specific one)_
- `remote="muppets"` for non-vendor-supported firmware at the `vendor/<vendorname>/<model>` entry _(TheMuppets repo must be checked!)_
- `remote="axp.os-private"` only for vendor-supported firmware at the `vendor/<vendor>/<model>` entry
- `remote="los"` for untouched repos, like the kernel and the device specific device tree

We need to enable AXP.OS' build handling which usually happens in the common device tree, if available. Otherwise within the specific device itself but this is rare though. See above how to identify the common device tree.

Open a PR against https://github.com/AXP-OS/manifest and ensure that you base on the correct branch matching the requested Android version.

If you are a trusted & verified developer:
{{% details title="Click to reveal" closed="true" %}}
- fork the LineageOS common device tree into the AXP.OS org
- set `axp-a<VERSION>` branch based on the corresponding LineageOS branch
- set `axp-a<VERSION>` branch as default branch
- adjust the BoardConfig (e.g. https://github.com/AXP-OS/android_device_oneplus_sm8250-common/commit/03d7e7c66ef7789f0191208cf35b0d7eb399a7bf
)
- adjust the common or device mk (e.g. https://github.com/AXP-OS/android_device_oneplus_sm8250-common/commit/1eeaa8990383e26b7eed7d1ce78964e0ac796246)
- Actions -> choose `AXP.OS Sync Workflow` and set it up
- Test Sync
{{% /details %}}

