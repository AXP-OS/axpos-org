---
title: "Reproducible Builds"
type: docs
toc: true
aliases:
    - /Reproducible-builds
---
> [!CAUTION]
> This guide is marked as outdated and requires a re-work

DivestOS patches kernels and android code in a "kind of" transparent manner. That means you can find all _patch files_ ([^kernel_patches] + [^android_patches]) which will be applied but it is not very easy to follow these (as you can easily see when going through the massive amount of patches).

Kernel patches will be applied by its _name/hash_ ([^scripts]) but you won't see the _resulting change **within** the kernel **code sources**_ anywhere.

Android patches will be applied as they can be found in [^android_patches] and again you won't see the _resulting change **within** the android **code sources**_ anywhere.

This makes it **impossible** to create 1:1 reproducible builds as patches might or might not apply _differently_ on any next run but not just that: investigating changes is very hard, too. For this you would need to check every single patch file (without the help of git) and going through all these single files etc. 

## AXP.OS setup

 In order to improve this AXP.OS changed a few things to make reproducible builds possible:
 - any kernel used by AXP.OS will be automatically forked
 - any LOS/AOSP source repo which gets patched will be automatically forked and added to the AXP.OS org
 - instead of using _git apply_ (as in the DivestOS patch process) AXP.OS uses _git am_ to keep a valid history of these patches with a fallback to use the `patch` command on errors (also improves the patching process itself)
- during the patch process every commit will have a valid author and meaningful commit message in the following order:
   - when `git am` succeeds it will be used, if not:
   - when it's a DOS patch: `patch` will be used and DivestOS will be set as author with an advanced magic commit message*
   - when it's an AXP.OS patch: `patch` will be used and AXP.OS will be set as author with a simple magic commit message

## Patching process

For every(!) patch process run all repositories where a **change** (_current vs. origin untouched_) has been detected:

- will be automatically created in the AXP.OS org
- a branch `upstream_a<Android-Version>` will be uploaded which contains the untouched base for that repo (i.e origin & untouched LOS/AOSP)
- a tag `<YYYY-MM-DD>_<device>_a<Android-version>` will be added which contains all changes from the untouched base
- a manifest file (`axp.xml`) in the [manifest repo](https://github.com/AXP-OS/manifest) will be created containing all tag names for that unique combination of `device + model + patch-date`

All this has been implemented via the Ansible build [automation](https://github.com/sfX-android/automation_scripts/tree/ansible/roles/axp/common/tasks) which is used to sync, build and patch any AXP.OS build.

This approach allows to get full insights into _what_ has changed and _why_ but also making any AXP.OS build 99%* _reproducible_ by using a specific **manifest** for an unique combination of `device + model + patch-date`.

_(*) see the "Final note" topic_

## Usage examples

### Compare/View changes

#### Compare between origin and AXP.OS

AS noted above AXP.OS creates the branch `upstream_a<Android-Version>` (untouched source) and a build tag `<YYYY-MM-DD>_<device>_a<Android-version>` (patched state) for every repo which gets touched.

Comparing those via github is easy:

- Commits view (3 dots between):<br/>
`https://github.com/AXP-OS/<REPO-NAME>/compare/upstream_a<Android-Version>...<YYYY-MM-DD>_<device>_a<Android-version>`

- Changes view (2 dots between):<br/>
`https://github.com/AXP-OS/<REPO-NAME>/compare/upstream_a<Android-Version>..<YYYY-MM-DD>_<device>_a<Android-version>`

Example:

- Commits view: https://github.com/AXP-OS/android_frameworks_base/compare/upstream_a13...2024-06-20_lynx_a13
- Changes view: https://github.com/AXP-OS/android_frameworks_base/compare/upstream_a13..2024-06-20_lynx_a13


#### Compare between different AXP.OS patch dates

Additionally you can now also compare between patch dates easily. For example if you want to see all kernel changes between 2 patch dates do:

- Commits view (3 dots between):<br/>
`https://github.com/AXP-OS/<REPO-NAME>/compare/<YYYY-MM-DD>_<DEVICE-NAME>_a<Android-Version>...<YYYY-MM-DD>_<DEVICE-NAME>_a<Android-Version>`

- Changes view (2 dots between):<br/>
`https://github.com/AXP-OS/<REPO-NAME>/compare/<YYYY-MM-DD>_<DEVICE-NAME>_a<Android-Version>..<YYYY-MM-DD>_<DEVICE-NAME>_a<Android-Version>`

Example (_due to the ramp-up phase the tags are missing the `_a13` here_):

- Commits view: https://github.com/AXP-OS/android_kernel_google_gs201/compare/2024-06-04_cheetah...2024-06-17_cheetah
- Changes view: https://github.com/AXP-OS/android_kernel_google_gs201/compare/2024-06-04_cheetah..2024-06-17_cheetah

### Setup for a reproducible build

#### Automatic (recommended)

1. setup your build environment: https://github.com/AXP-OS/build/wiki/build
2. ensure you set these ansible override variables (in the Semaphore device "environment"):
   - `git_repo_main_manifests: "https://github.com/AXP-OS/manifest.git"`
   - `git_repo_main_branch: "<REPLACE-WITH_TAG-NAME>"`
   - `clean_basic: True`
   - `clean_out: True`
   - `reset_git: True`
3. start the Semaphore task to create the build for that specific tag

#### Manual

This is mainly meant as a _**fallback**_ option only. The recommended approach is using the regular AXP.OS automation setup above instead.

1. init the reproducible manifest:
```
mkdir axp-rpr
cd axp-rpr
repo init -u https://github.com/AXP-OS/manifest.git -b refs/tags/<REPLACE-WITH_TAG-NAME> -m axp.xml --git-lfs
repo sync
```
2. adjust the build script to your setup (check ALL paths and replace if needed):
```
vim .repo/manifests/build_<REPLACE-WITH_target_model>_<REPLACE-WITH-_android_shortversion>_axp.sh
```
3. start the build:
```
time .repo/manifests/build_<REPLACE-WITH_target_model>_<REPLACE-WITH-_android_shortversion>_axp.sh
```

Full example for the Google Pixel 7a (lynx):
```
mkdir axp-rpr
cd axp-rpr
repo init -u https://github.com/AXP-OS/manifest.git -b refs/tags/2024-06-20_lynx_a13 -m axp.xml --git-lfs
repo sync
time .repo/manifests/build_lynx_a13_axp.sh
```

## Final note

as all this is still quite new (finalized in November 2024) and has a tons of dependencies it might be not 100% finished at the time of writing and if you encounter any issues when creating a reproducible build let us know please!

for builds before 2024-11:

- **marked with `90%`**: missing [scripted DOS patches](https://github.com/sfX-android/automation_scripts/blob/1bc1c14868d7ac63562ac0fc7c16d3df434ffd6c/roles/axp/common/tasks/git_push.yml#L30-L34) `device/<vendor>/<model>` (reason: scripted changes were simply not covered before. newer releases will cover these)
- **marked with `90%`**: missing `vendor/<vendor>/XXX` (reason: there was no proper handling before. newer releases will push to [axp.os-private](https://code.binbash.rocks:8443/AXP.OS))
- **marked with `90%`**: all kernel+device repos will be redundantly re-pushed for every tag for every device (reason: there was no git push filter before. newer releases will push only their own kernel and device repos)
- **marked with `99%`**: missing `vendor/divested` (reason: this is not a repo on its own but created by DivestOS during the patch process)
- **marked with `99%`**: missing info about the link between `vendor/firmware/CarrierSettings/` and `vendor/divested-carriersettings` (they get copied by the automation process to the final location)
- **marked with `99%`**: wrong replacements for `remote=` in the manifest (needs further investigation)

[^scripts]: https://github.com/Divested-Mobile/DivestOS-Build/tree/master/Scripts/LineageOS-20.0/CVE_Patchers
[^kernel_patches]: https://gitlab.com/divested-mobile/kernel_patches
[^android_patches]: https://github.com/Divested-Mobile/DivestOS-Build/tree/master/Patches

