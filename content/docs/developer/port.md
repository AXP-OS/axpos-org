---
title: "Port Guide"
type: docs
toc: true
aliases:
    - /port-guide
---
> [!CAUTION]
> This guide is marked as outdated and requires a re-work

This guide describes roughly how to bring-up a new device for AXP.OS.

## Requirements

New devices must match with the [Device Requirements](/Device-Requirements) 

## Device

### AXP.OS manifest

add all device, common, firmware etc in: https://github.com/AXP-OS/manifest

### Prepare your device trees

##### include AXP.OS

add the following into any the device's `<device>.mk`:

```
# enable AXP.OS vendor
$(call inherit-product, vendor/axp/config/common.mk)
```

##### fix your proprietary-files.txt

ensure you have a proper defined `proprietary-files.txt` in all your device trees as these are used by the Divest patcher.

if you never had updated that file (as this is nothing you actually need for other custom OS') and you are sure that your `vendor/<vendor-name>/<device>/<device>-vendor.mk` is set up correctly you can _generate_ this file like [this](https://github.com/LGgFour/android_device_lge_g4-common/blob/8d2ef6430dceac4144dec8f4b34c4c6659a63794/proprietary-files.txt#L1-L6).

##### remove extendrom inclusions

Check that you have no [extendrom](https://github.com/sfX-android/android_vendor_extendrom) inclusions anywhere. E.g. search for it like:

`grep -r "extendrom" device/`

AXP.OS includes extendrom by default so this would conflict with any manual inclusions.

### extract and push vendor/firmware

1. extract the latest vendor OTA (e.g. by [ROME](https://code.binbash.rocks/mAid/android_rome)) for ZIPs or [SALT](https://github.com/steadfasterX/salt) for KDZ's. **Example sources** where you can find those are:
   - _NOTE1: ensure you select a trusted source, I cannot guarantee that the following are trusted though!_
   - _NOTE2: ensure you choose the latest "global" one (i.e. never provider specific ones) for the supported Android version (which is reflected by the device tree branch name)_
   - OnePlus: e.g. on [XDA](https://www.google.com/search?q=site%3Axdaforums.com+OTA+oneplus+%3CREPLACE-WITH-DEVICE-NAME%3E)
   - Google Pixel: [here](https://developers.google.com/android/ota)
   - LG: e.g. [here](https://lgrom.com/) or [here](https://lg-firmwares.com/)
   - Samsung: e.g. [here](https://sfirmware.com/) or [here](https://samfrew.com/)
   - use www.google.com to find more/better ones!
1. ensure you have access to the [vendor_firmware repo](https://code.binbash.rocks/AXP.OS/vendor_firmware). it is **not public** but you will be able to access it once you have registered and logged in!
1. add all required (which highly depends on the device) firmware files (bootloader + firmware / modem) to LFS:
    - `cd vendor/firmware/<model>`
    - `git lfs install` (this is a one-time thing per user)
    - `git lfs track "*.img"`
    - `git add .gitattributes`
    - `git add *.img`
1. copy `Android.mk`, `AndroidBoardVendor.mk` and `0SOURCE` from any of the existing ones (e.g. hotdog)
1. adjust all files according to the device and img files you extracted and add the exact OTA identifier to `0SOURCE`

### create an engineering build

1. set `axp_build_eng = true` , e.g. in your semaphore environment
1. build as usual and fix all issues ;)

keep in mind that official devices must be **enforcing**, so you need to solve all _needed_ denials **correctly** (i.e. not opening too much or the wrong way, see [here for a rough guide](https://gist.github.com/steadfasterX/e674749d6ca475ca8f4facdb7244e964)).

### find permission denials

To find missing permissions when bringing up a new device, enable transitional log mode:

`ro.control_privapp_permissions=log`

source and details: [here](https://source.android.com/docs/core/permissions/perms-allowlist#finding-missing-permissions)

### Set/Upgrade device encryption

See [Device Encryption](/Device-Encryption)

## Kernel patching

Devices which are not supported by DivestOS must follow some extra steps to get the kernel patched as well:

#### generate & test kernel patches

1. get latest CVE patcher:<br/>
`wget "http-URL-to-cve_patcher.jar" -O cve_patcher.jar`
1. find your kernel version in `../../Scripts/Common/Fix_CVE_Patchers.sh` and add `kernel_<vendor>_<device>.sh` to the `#Loose versioning hacks` section
1. create a kernel specific CVE patcher script (& applying the result):<br/>
`startPatcher kernel_<vendor>_<device>`
1. `mka bootimage`
1. if it does not compile find the corresponding `apply` line in `../../Scripts/LineageOS-<VERSION>/CVE_Patchers/android_kernel_<vendor>_<device>.sh`. <br/>as this is not straight forward you can make use of this little helper:<br/>
`../../Scripts/cve_find_patch.sh '<SEARCHSTRING>'`<br/>
outcomment the resulting line(s) in `../../Scripts/LineageOS-<VERSION>/CVE_Patchers/android_kernel_<vendor>_<device>.sh` and write it down (you will need it later)
1. reset your kernel dir:<br/>
`repo forall -j6 kernel/<vendor>/<device> -c "git am --abort; git rebase --abort; git reset --hard"`
1. apply the patches again:<br/>
`bash ../../Scripts/LineageOS-<VERSION>/CVE_Patchers/android_kernel_<vendor>_<device>.sh`
1. repeat step 4-7 until it compiles and comment the problematic one out. you need those later!
1. test if it boots<br/>
<br/>if **not**:<br/>
1. edit `../../Scripts/LineageOS-<VERSION>/CVE_Patchers/android_kernel_<vendor>_<device>.sh`
1. do a 50%-revert, i.e. out-comment the last 50% of the not (yet) outcommented `apply` lines in this file
1. reset your kernel dir:<br/>
`repo forall -j6 kernel/<vendor>/<device> -c "git am --abort; git rebase --abort; git reset --hard"`
1. apply the 50%-reverted patches:<br/>
`bash ../../Scripts/LineageOS-<VERSION>/CVE_Patchers/android_kernel_<vendor>_<device>.sh`
1. repeat beginning at **step 4**
1. if it boots though: repeat but in step 8 revert the last 50%-reverted block (i.e. let them apply again. the goal is to identify the patches preventing from boot)

once you have identified **ALL** problematic apply rule(s):

1. add them to the out-commenter (`../../Scripts/Common/Fix_CVE_Patchers.sh`): <br/>
`commentPatches android_kernel_<vendor>_<device>.sh "XXX" "YYY"`<br/>
1. test if the out-commenter works:<br/>
~~
CROOT=$PWD
cd ../../Scripts/LineageOS-<VERSION>/CVE_Patchers
bash /home/androidsource/do-not-touch/axp/Scripts/Common/Fix_CVE_Patchers.sh
cd $CROOT
~~
check: `../axp/Scripts/LineageOS-<VERSION>/CVE_Patchers/android_kernel_<vendor>_<device>.sh`


#### troubleshooting kernel patching

- if kernel defconfig can't be found: add it manually to [getDefconfig](https://github.com/AXP-OS/build/blob/a1508ef817cded844cb984131e0868b2cbc84801/Scripts/Common/Functions.sh#L873)
- if it does not _compile_: follow [generate & test kernel patches](/docs/developer/port/#generate--test-kernel-patches) and add exceptions to [Fix_CVE_Patchers.sh](https://github.com/AXP-OS/build/blob/axp/Scripts/Common/Fix_CVE_Patchers.sh)
- if it does not _boot_: overwrite the device default CONFIG (e.g. like [this](https://github.com/sfX-android/automation_scripts/blob/d20f7dce494c72e956eb4e7efde2c0705cb969b3/roles/axp/common/templates/divested.vars.j5y17lte.j2#L13C8-L13C28))

## Build-Process automation

### axp / device

1. create a new folder named like the codename of your device in [https://github.com/sfX-android/automation_scripts/tree/ansible/roles/axp](https://github.com/sfX-android/automation_scripts/tree/ansible/roles/axp).
1. copy the content from any of the existing ones into that folder so you have all required variables and stuff there.

Adjust the main device variables file: `roles/axp/<device-codename>/vars/main.yml`. For sure you want to change these:

- `target_model_full`
- `target_kernel_dir` (must match the [manifest](https://github.com/AXP-OS/manifest))
- `dtree_cl` (must match the [manifest](https://github.com/AXP-OS/manifest))
- `cdtree_cl` (must match the [manifest](https://github.com/AXP-OS/manifest))
- `kernel_cl` (must match the [manifest](https://github.com/AXP-OS/manifest))

### OPTIONAL: axp / common

the following is needed only when you want to overwrite the [global common variables](https://github.com/sfX-android/automation_scripts/blob/ansible/roles/axp/common/templates/divested.vars.j2) and can be skipped otherwise.

1. create a new template in [https://github.com/sfX-android/automation_scripts/tree/ansible/roles/axp/common/templates](https://github.com/sfX-android/automation_scripts/tree/ansible/roles/axp/common/templates) 
1. name it `divested.vars.<device-codename>.j2` (e.g. `divested.vars.hotdog.j2`)
1. copy the content from another device, e.g. from [hotdog](https://github.com/sfX-android/automation_scripts/blob/ansible/roles/axp/common/templates/divested.vars.hotdog.j2). Note: it is fully ok if it contains just the comments block as it acts as an override for the defaults only.


