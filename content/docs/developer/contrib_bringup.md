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

If **not**, continue with the **_AXP.OS manifest_** topic otherwise go on.

#### Fairphone / SHIFTphone

AXP.OS does not ship the latest Android version but usually the firmware provided by the vendor is for the latest Android version only.
There are some exceptions like Fairphone and SHIFT though which still supporting older Android versions and so AXP.OS releases based on those.

For these devices (currently **Fairphone** only) AXP.OS automatically downloads and includes the latest available firmware if properly set up.
Here examples for the [Fairphone 3](https://code.binbash.rocks/AXP.OS/vendor_firmware/src/branch/axp-a13/FP3/0SOURCE) and [Fairphone 4](https://code.binbash.rocks/AXP.OS/vendor_firmware/src/branch/axp-a13/FP4/0SOURCE).

Basically the `0SOURCE` file gets sourced by the `update.sh` script which must match the Fairphone model requirements. It handles not just the firmware but also the proprietary blobs! That also means the manifest for `vendor/<vendor>/<model>` must point to `remote="axp.os-private"`.

Create a PR at https://code.binbash.rocks/AXP.OS/vendor_firmware for the file `<codename>/0SOURCE` in the following format:
```
##########################################################################
# <Fairphone | SHIFTphone> device
#
# will be sourced by the AXP.OS build process.
# FACTORYID and FACTORYIDHASH are case sensitive values
# and can be extracted from the actual download URL.
##########################################################################
#
# SOURCE: <BASE-DOWNLOAD-URL>
#
# LATEST: <DIRECT-DOWNLOAD-URL>
# MD5|SHA256|SHA512: <hash_IF-THERE-IS-NONE-CREATE-A-SHA512>
#
##########################################################################

FACTORYID="<REPLACE-FROM-DL-URL>"
FACTORYIDHASH="<REPLACE-FROM-DL-URL>"

# see download url
FACTORYFULLNAME="${FACTORYID}-gms-${FACTORYIDHASH}-user-fastbootimage"

# see release notes
export VENDOR_SECPATCH_DATE="<REPLACE-WITH-THAT-FROM-STRINGS-OUTPUT>"
```

{{% details title="Click to show an example for the Fairphone 3" closed="true" %}}
```
##########################################################################
# Fairphone device
#
# will be sourced by the AXP.OS build process.
# FACTORYID and FACTORYIDHASH are case sensitive values
# and can be extracted from the actual download URL.
##########################################################################
#
# SOURCE: https://support.fairphone.com/hc/en-us/articles/18896094650513-Install-Fairphone-OS-manually#01HB8ZZ1BMMQNSNMFT3YXDBXA0
#
# LATEST: https://fairphone-android-builds.ams3.digitaloceanspaces.com/FP3/A13/FP3-6.A.031.7-gms-f31c7748-user-fastbootimage.zip
# SHA256: c061082822fa812a0e1485a60771069b1d0b7fabc107aecb3bc2ba63418b428b
#
##########################################################################

FACTORYID="FP3-6.A.035.2"
FACTORYIDHASH="691ff58c"

# see download url
FACTORYFULLNAME="${FACTORYID}-gms-${FACTORYIDHASH}-user-fastbootimage"

# see release notes
export VENDOR_SECPATCH_DATE="2025-06-03"
```
{{% /details %}}

#### Generic

All other devices (except Fairphone & SHIFTphone) will likely provide firmware for the latest Android version only.

You need to find the latest and _Android-version-matching_ STOCK-OS ZIP from a [trusted source](/docs/developer/port/#extract-and-push-vendorfirmware). That means it must match the _AXP.OS_ Android version.

Create a PR at https://code.binbash.rocks/AXP.OS/vendor_firmware for the file `<codename>/0SOURCE` in the following format:
```
##########################################################################
# <VENDOR-NAME> device
#
# will be sourced by the AXP.OS build process.
# FACTORYID and FACTORYIDHASH are case sensitive values
# and can be extracted from the actual download URL.
##########################################################################
#
# SOURCE: <BASE-DOWNLOAD-URL>
#
# LATEST: <DIRECT-DOWNLOAD-URL>
# MD5|SHA256|SHA512: <hash_IF-THERE-IS-NONE-CREATE-A-SHA512>
#
##########################################################################

FACTORYID="<REPLACE-FROM-DL-URL>"
FACTORYIDHASH="<REPLACE-FROM-DL-URL>"

# extract vendor.img, boot.img or system.img, then:
# $> strings <IMAGE> | grep -EA1 "build.vendor.security_patch|vendor.build.version.security_patch"
export VENDOR_SECPATCH_DATE="<REPLACE-WITH-THAT-FROM-STRINGS-OUTPUT>"
```

{{% details title="Click to show an example" closed="true" %}}
```
##########################################################################
# Google device
#
# will be sourced by the AXP.OS build process.
# FACTORYID and FACTORYIDHASH are case sensitive values
# and can be extracted from the actual download URL.
##########################################################################
#
# SOURCE: https://developers.google.com/android/images#panther
#
# LATEST: https://dl.google.com/dl/android/aosp/panther-tq3a.230901.001-factory-21bf556f.zip
# SHA256: 21bf556f0d65fc1e383a5d0614084c9dce685219537e6909d0bbcffe0ef331ea
#
##########################################################################

FACTORYID="tq3a.230901.001"
FACTORYIDHASH="21bf556f"

# extract vendor.img, boot.img or system.img, then:
# $> strings <IMAGE> | grep -EA1 "build.vendor.security_patch|vendor.build.version.security_patch"
export VENDOR_SECPATCH_DATE="2023-09-01"
```
{{% /details %}}
 
Besides the quick "strings + grep" method you can also identify `vendor.build.security_patch` by extracting the vendor image from the STOCK-OS ZIP, mounting it and find the default or vendor prop containing that property.

If you are a trusted & verified developer:
{{% details title="Click to reveal" closed="true" %}}
- download STOCK-OS ZIP
- extract the required files (likely requires an additional payload.bin extract)
- modify `0SOURCE` accordingly (see above)
- push all required files (see `<codename>/AndroidBoardVendor.mk`)
{{% /details %}}

#### Add sha1sums

Affects: `<codename>/AndroidBoardVendor.mk`

All new (i.e. starting from 2025-07 onwards) device additions must contain a sha1sum within the call method.

An example can be found [here](https://code.binbash.rocks/AXP.OS/vendor_firmware/commit/821db7df2e943926f32ea57668c0d4fa0277039e) _(noticed the for loop in the comment? it helps to generate the hash sums accordingly)_.

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

