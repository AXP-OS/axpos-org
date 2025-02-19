---
title: "Flavors"
type: docs
toc: true
aliases:
    - /AOS-Flavors
    - /Flavors
---
"_Flavors_" are different variants of AXP.OS which came up with the [EOL of Divest](/Divest_EOL) which AXP.OS was based on up to the end of 2024.

### AXP.OS - Pro vs. Slim

The differences are described here: [Features](/Features)

### AXP.OS - Slim vs. DivestOS

**Most requested** comparisons between the _Slim_ flavor and _**DivestOS**_.

Note: The differences between the AXP.OS _Pro_ and _Slim_ flavor is described here: [Features](/Features)

#### MicroG implementation
{{% details title="Click to reveal" closed="true" %}}
|Statement|DivestOS|AXP.OS-Slim|
|-|:-:|:-:|
|not a privileged system app or system app|**X**|**X**|
|not pre-installed|**X**|**X**|
|no special permissions|**X**|**X**|
|user must install the apps themself|**X**|**X**|
|no automatically granted permissions|**X**|**X**|
|only available to the profile the user installed it to|**X**|**X**|
|all abilities default disabled/opt-in|**X**|**X**|
|has [warnings](https://divestos.org/misc/mg.txt) on enable and warnings on website|**X**|**X**|
|can't access [location](https://discuss.privacyguides.net/t/divestos-unprivileged-microg-implementation/13287/33)|**X**|**X**|
|signature spoofing gated behind a toggle|**X**|**X**|
|spoofing bound to the official microG build certificates|**X**|**X**¹|
|can only spoof the Google signature|**X**|**X**¹|
|blocked SafetyNet [Droidguard](https://github.com/microg/GmsCore/issues/1971)|**X**|²|
|gated with [version code and target SDK](https://github.com/Divested-Mobile/DivestOS-Build/blob/master/Patches/LineageOS-20.0/android_frameworks_base/0036-Unprivileged_microG_Handling.patch#L175-L176) checks|**X**|²|
|Spoofing permission on FakeStore / PlayStore app must be [explicitly granted](/docs/guides/setup/#fake-store--native-play-store)||**X**|
|Spoofing permission on microG app must be [explicitly granted](/docs/guides/setup/#microg)||**X**|

- ¹) _The **user** decides per permission setting if other signatures are allowed_
- ²) _Can be implemented, if there is a demand / [request](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues/new) for this._

There is a issue pending which will adapt the current implementation to fit the DivestOS one here.
{{% /details %}}

## Switching between flavors

### Supported

Switching between flavors require a **factory reset**. This is the only way to ensure there are no left-overs and glitches.

The same applies when switching from **DivestOS to AXP.OS** (regardless which flavor).

1. _When your device bootloader is locked:_ unlock it (as this will factory reset, skip the next step)
1. boot into recovery and format data/factory reset
1. grab the recovery/boot image from the _other_ flavor ([Recovery Images](/Recovery-images))<br/>(e.g. if you want to go `Slim -> Pro` then get the _Pro_ one)
1. flash the _other_ flavor recovery/boot image in fastboot (e.g. `fastboot flash recovery AXP.OS-18.1-20250124-RECOVERY-klte.img`)
1. boot into recovery and follow the _**Install / Upgrade**_" topic from AXP.OS device's guide, ensure you flash to BOTH slots!
1. let it boot, verify everything is working as it should and verify its the wanted flavor in Android settings
1. once you are happy and if you want to re-lock your bootloader: see the "_**Re-locking the bootloader**_" topic from AXP.OS device's guide

### Unsupported

Switching between flavors _without_ a factory reset (i.e. keeping all user data and apps) is technically possible while totally unsupported. In order to achieve this you would need to use a different recovery (i.e. the recovery image of the flavor you want to install).

The same applies when switching from **DivestOS to AXP.OS** (regardless which flavor).

When your device supports bootloader re-locking and you currently have your bootloader locked you HAVE TO unlock and so factory reset as flavors have **different signing keys**.

A non-exclusive list of things which can happen if you ignore all warnings:
- soft brick
- hard brick
- unusual high battery drain
- App FC's (Force Closes)

