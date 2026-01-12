---
title: "Patch Levels"
type: docs
toc: true
aliases:
    - /Patchlevel
    - /Patchlevels
    - /patchlevel
    - /patchlevels
---

## A note on operating system security
There is a singular all-or-nothing, all-encompassing Android security bulletin released every month that covers security issues across the entire system.
Below we break it into five parts solely for ease of understanding for you to determine the general security of a given operating system.
Being behind on any one part means the system is inherently insecure.

1. the [version](https://developer.android.com/about/versions) of Android itself, _newer versions have more security features/hardening_
1. the [ASB](https://source.android.com/security/bulletin) patch level, _these are essential security patches_
1. the [Pixel ASB](https://source.android.com/security/bulletin/pixel) patch level, _these are recommended security patches and are only provided for the latest Android version. Despite the name, the majority are NOT Pixel specific as described [here](https://x.com/GrapheneOS/status/1600599763682005004#m) and [here](https://forum.fairphone.com/t/pixel-vs-android-security-bulletin/91776)._
1. the vendor (aka _SOC_) ASB patch level, _see e.g. [Qualcomm](https://www.qualcomm.com/company/product-security/bulletins)_
1. and lastly the [Linux kernel](https://www.kernel.org/) version, _newer versions have more security features/hardening_

## Does AXP.OS make my device secure?
The short answer: No. "Just" _more_ secure.

The long answer is that AXP.OS is likely the best harm reduction option if your device is no longer in support by its manufacturer or vendor.
Any project or product claiming they make end-of-life devices _secure_ should be rigorously scrutinized.

AXP.OS tries to fill a gap mainly for end-of-life devices and offers more security and privacy than e.g. an outdated STOCK OS version of such a device. Compared to other custom OS it even offers highly increased security due to the integrated kernel patching (see [The AXP.OS patch level](#the-axpos-patch-level))

Lastly it must be noted that _privacy_ and _security_ go hand-in-hand, there is a fundamental limit of how much privacy you can achieve if you do not have security backing it up.

## If AXP.OS isn't _secure_, then why should I be using it?

To be clear: you should seek out a newer non-EOL device, but not everyone can afford such.

Additionally for a handful of use cases AXP.OS fills the gap enough to be OKish, eg. offline music/maps/wikipedia device, basic gaming (solitaire/sudoku/etc.), basic browsing of trusted websites with updated browsers, a spare/backup device, website or Android app development/testing, etc. 

And security aside, it still has substantial benefits over the stock/final release for EOL devices.

## The AXP.OS patch level

Each month Google releases an Android Security Bulletin ("ASB") which contains important patches _(check next topic, as their content has heavily changed)_ and marked with different patch dates.

#### until 2025-12

Up to 2025-12 AXP.OS re-used Google's [patch dates](https://source.android.com/docs/security/bulletin/2025-01-01#Common-questions-and-answers) and mapped `-05` for all devices where the Linux kernel could be patched, regardless if they were `Firmware` updates included.

|Patch date|STOCK OS|AXP.OS|
|-|-|-|
|`YYYY-MM-01`|🧩 Android platform fixes only|🧩 Android platform fixes only|
|`YYYY-MM-05`|🧩 Android platform fixes +<br/>💽 SoC manufacturers/OEM's +<br/>🐧 Linux kernel|🧩 Android platform fixes +<br/>💽 SoC manufacturers/OEM's +<br/>🐧 Linux kernel|

#### since 2026-01

A new patch level `"YYYY-MM-03"` has been added to distinguish better between fully patched _(i.e. including `Firmware`)_ and "just" including `Kernel` patches:

|Patch date|STOCK OS|AXP.OS|
|-|-|-|
|`YYYY-MM-01`|🧩 Android platform fixes only|🧩 Android platform fixes only|
|`YYYY-MM-03`|N/A|🧩 Android platform fixes +<br/>🐧 Linux kernel|
|`YYYY-MM-05`|🧩 Android platform fixes +<br/>💽 SoC manufacturers/OEM's +<br/>🐧 Linux kernel|🧩 Android platform fixes +<br/>💽 SoC manufacturers/OEM's +<br/>🐧 Linux kernel|


{{< callout type="info" emoji="🧩" >}}
`Android platform fixes` _(often referred to as just `ASB`, meaning Android Security Bulletins)_ are backports of [official released fixes](https://source.android.com/docs/security/bulletin/) by Google and can be provided for a wide range of devices. Backports will usually **not** cover _all_ ASB patches as code is constantly evolving and so might not even apply to older versions, especially on ultra legacy Android versions _(i.e. ~5 or more versions older than the latest Android version)_.<br/>
<br/>*_see next topic `New (2025) ASB release cycle` for more details_
{{< /callout >}}

{{< callout type="info" emoji="💽" >}}
Fixes from `SoC manufacturers` _(SoC = System-on-Chip, e.g. QualComm)_ and/or `OEM's` _(Original Equipment Manufacturer, e.g. Samsung, Google, Sony, ...)_ can be usually provided for modern _(i.e. still OEM supported)_ devices only _(e.g. Fairphone, SHIFT)_.
<br/>_Note: These updates are usually simply referred to as `"Firmware"`._
<br/>Many devices get these updates for a short period of time only and they are always proprietary / closed source.<br/>
Besides that they are always bound to the _Android_ version used by the AXP.OS release and so can be even _outdated_ _(i.e. if AXP.OS is A13 and there are A14 SoC/OEM patches they can **not** be applied)_.<br/>
Check out the `Patchlevel` row of the [Devices](/devices) page for your model to see what is covered for your device.
{{< /callout >}}

{{< callout type="info" emoji="🐧" >}}
One of the outstanding AXP.OS features is patching each and every Kernel. OEM's or other OS developers usually "just" take Google patches and backport them to their devices. If they do it at all! AXP.OS on the other hand uses the [CVE-Patcher](https://git.disroot.org/AXP.OS/kernel_patches) _(originally developed by DivestOS)_ and that often before they are even/ever part of a Google ASB. Kernel patches sometimes can take months until they get merged by Google which already resulted in several open security holes for longer than necessary. Additionally the CVE-Patcher covers a lot more than an ASB does, legacy devices easily have 1000+ patches applied _(exact amount can be revealed in the Kernel version shown as `-pXXXX` in Android's About-Info page)_.<br/><br/>
AXP.OS `Linux kernel` patches include:
- [patches](https://github.com/sfX-android/automation_scripts/blob/ansible/roles/kernel_patcher/tasks/asb.yml) by [Google](https://source.android.com/docs/security/bulletin/asb-overview)
- [patches](https://github.com/sfX-android/automation_scripts/blob/ansible/roles/kernel_patcher/tasks/cip.yml) by the [CIP project](https://gitlab.com/cip-project/cip-kernel/cip-kernel-sec)
- [patches](https://github.com/sfX-android/automation_scripts/blob/ansible/roles/kernel_patcher/tasks/incremental.yml) by [kernel.org](https://kernel.org/)
- Note: not _all_ these patches can be applied on _all_ devices. These exclusions are handled via [Fix_CVE_Patchers.sh](https://github.com/AXP-OS/build/blob/axp/Scripts/Common/Fix_CVE_Patchers.sh)
{{< /callout >}}

### New (2025) ASB release cycle

Since July 2025, Google has fundamentally changed the way Android security updates are announced and released. Many patches are now only released quarterly, which has a significant impact on the custom OS community and the importance of the monthly ASB for us. For more information, please visit the [News](/News) page.