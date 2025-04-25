---
title: "Features"
type: docs
toc: true
aliases:
    - /Features
---
## About

AXP.OS is a more private and more secure aftermarket mobile operating system based on AOSP & LineageOS.
<br />
<br />
{{< globalvar key="about_info" format="true" >}}

The _Pro_ [flavor](/Flavors) of AXP.OS comes pre-rooted which is a major difference between many (if not all) other custom OS and requires to read the documentation properly and acting wisely (i.e. not installing APKs from random sources, open every link in mails you get, etc). While the OS comes pre-rooted it is not _active_ at all and requires to _actively install_ the Magisk companion app + run the requirements installer once to make it usable first. That means if you do not need root you can simply skip that step and there will be no `su` binary available at all.

The _Slim_ [flavor](/Flavors) on the other side, does **not** come pre-rooted, which has some drawbacks regarding usability, and is not as intensively tested as the _Pro_ one.

**If you are not sure which one to choose, ask in the support channel.**

### Divest Notice

_Up to `Dec 2024` AXP.OS was based on [DivestOS](https://web.archive.org/web/20241227223444/https://divestos.org/), see the EOL notice for Divest and its impact on AXP.OS [here](/Divest_EOL)._

Due to this AXP.OS started in 2025 offering different [flavors](/Flavors).<br/>
The _Pro_ one is still the main flavor and so default on new devices but users [can request](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues/new/choose) a _slim_ variant which gives a "Divest-like" experience.

## Flavor comparison

|Feature|Pro|Slim|
|-|:-:|:-:|
|Using Graphene's [hardened malloc](https://github.com/GrapheneOS/hardened_malloc) ([comparison](https://github.com/struct/isoalloc/blob/master/SECURITY_COMPARISON.MD))|**X**|**X**|
|OTA (Over The Air) updates|**X**|**X**|
|Including [ASB patches](https://source.android.com/docs/security/bulletin) (see [AXP.OS patch level](/docs/knowledge/patchlevels) for details)|**X**|**X**|
|Hardened and focusing on [security and privacy](/docs/knowledge/techdetails/#the-changes)|**X**|**X**|
|Hardened [Browser & WebView](Browser) by [EXTENDROM_PACKAGES](https://github.com/sfX-android/android_vendor_extendrom/wiki/EXTENDROM_PACKAGES) |**X**|**X**|
|Extra _Privacy_ by extensive [deblobbing](https://github.com/AXP-OS/build/blob/axp/Scripts/Common/Deblob.sh) and privacy-focused settings ([config](https://github.com/sfX-android/automation_scripts/blob/ansible/roles/axp/common/templates/axp.vars.j2))|**X**||
|Super _Privacy_ by even **more extensive** [deblobbing](https://github.com/AXP-OS/build/blob/axp/Scripts/Common/Deblob.sh) and privacy-focused settings ([config](https://github.com/sfX-android/automation_scripts/blob/ansible/roles/axp/common/templates/axpslim.vars.j2))<br/>(while reducing usability)||**X**|
|SELinux enforced|**X**|**X**|
|Data encryption enforced|**X**|**X**|
|Signed (by [AXP.OS keys](/Signatures))|**X**|**X**|
|Increased key size + hash (8192 / sha512) for AVB, APK signing and dm-verity<br/>_(incl. adjustments in recovery and OTA Updater to support higher hash algo)_|**X**|**X**|
|Advanced boot debug log ([EXTENDROM_BOOT_DEBUG](https://github.com/sfX-android/android_vendor_extendrom/wiki/EXTENDROM_BOOT_DEBUG))|**X**|**X**|
|Advanced Signature spoofing support by [EXTENDROM_SIGNATURE_SPOOFING](https://github.com/sfX-android/android_vendor_extendrom/wiki/EXTENDROM_SIGNATURE_SPOOFING)<br/>(**must be explicitly enabled**)|**X**|**X**|
|Using the [AOSmium](/Browser) System WebView by [EXTENDROM_PACKAGES](https://github.com/sfX-android/android_vendor_extendrom/wiki/EXTENDROM_PACKAGES)|**X**|**X**|
|Extra Apps included by [EXTENDROM_PACKAGES](https://github.com/sfX-android/android_vendor_extendrom/wiki/EXTENDROM_PACKAGES)<br/>_([F-Droid](https://f-droid.org/), [AuroraStore](https://f-droid.org/de/packages/com.aurora.store/), [FossifyGallery](https://f-droid.org/en/packages/org.fossify.gallery/))_|**X**|**X**|
|extended list of F-Droid repositories ([1](https://github.com/sfX-android/android_vendor_extendrom/blob/main/fdroid_repos/molly.xml),[2](https://github.com/sfX-android/android_vendor_extendrom/blob/main/fdroid_repos/nailyk.xml),[3](https://github.com/sfX-android/android_vendor_extendrom/blob/main/fdroid_repos/threema.xml),[4](https://github.com/sfX-android/android_vendor_extendrom/blob/main/fdroid_repos/futo_org.xml))<br/>(**must be explicitly enabled**)|**X**|**X**|
|[eSIM](https://github.com/AXP-OS/packages_apps_OpenEUICC) support (A10 and later) for devices supporting euicc<br/>(**must be explicitly enabled**)|**X**|**X**|
|Internal DNS content blocker ([blocklist](https://github.com/hagezi/dns-blocklists?tab=readme-ov-file#ledger-multi-pro---extended-protection-recommended-))|**X**|**X**|
|Disable [call recording restrictions](/r) (by [EXTENDROM](https://github.com/sfX-android/android_vendor_extendrom))<br/>(**must be explicitly enabled**)|**X**|**X**|
|Re-locking the bootloader on supported devices|**X**|**X**|
|Reproducible builds - see the [details](/Reproducible-builds)|**X**|**X**|
|[MicroG](https://microg.org/) included<br/>(**requires to explicitly enable signature spoofing**)|**X**|¹|
|Current and MicroG compatible [Google Play Store](https://github.com/AXP-OS/microg-phonesky-iap-support/releases) included<br/>(**must be explicitly enabled**)|**X**|¹|
|WireGuard VPN [Kernel module](https://www.wireguard.com/compilation)|**X**|²|
|Pre-rooted (Magisk) by [EXTENDROM_PREROOT_BOOT](https://github.com/sfX-android/android_vendor_extendrom/wiki/EXTENDROM_PREROOT_BOOT) - Bootloader re-lock compatible<br/>(**must be explicitly enabled and activated first**)|**X**||
|Basic (i.e. w/o SafetyNet) support for [Widevine DRM](https://developers.google.com/widevine/drm/overview)|**X**||
|Supporting a FULL(!) app & settings [backup & restore](/Backup-and-Restore)|**X**||
|Advanced _Usability Support_ by [EXTENDROM_PACKAGES](https://github.com/sfX-android/android_vendor_extendrom/wiki/EXTENDROM_PACKAGES)<br/>_(Magisk, MicrogGmsCore, GsfProxy, Phonesky, [NeoLauncher](https://github.com/NeoApplications/Neo-Launcher))_|**X**||
|On **device*** testing before release<br/>_(*for devices marked as "[verified by the AXP Team](/docs/knowledge/supportlevels/#by-the-axp-team)")_|**X**||

- ¹ while not supported (and not possible on bootloader-locked devices) you can flash MicroG as in LineageOS.<br/>AXP.OS [Phonesky](https://github.com/AXP-OS/packages_apps_phonesky/releases) can be installed manually (via a custom recovery: place it in `/system/priv-app/Phonesky/`).<br/>Regardless if using the MicroG FakeStore or AXP.OS Phonesky you need to follow [the setup guide](/docs/guides/setup/aos/#optional-activate-google-support)) as well.
- ² some kernels have the wireguard patches already included - the Slim flavor will not remove them while you need root to _activate_ it

## Simplified OS comparison

The following is just a **simplified** comparison between some popular custom OS and is meant to give a short **overview** only (there are dozens of detailed comparisons available elsewhere).

Examples of more detailed comparisons (_even though without AXP.OS_) can be found:
- [here](https://eylenburg.github.io/android_comparison.htm) or
- [here](https://eylenburg.github.io/old/android_comparison_2024old.htm) (_hint:  AXP.OS was based on Divest until Dec 2024_)

The _Main(!) focus_ column is a bit vague or better said subjective as all OS claim to be all of these 3: user-friendly, secure and privacy-friendly.<br/>Just some doing it more **intensive** than others.

|OS|Main(!) focus|Pro|Contra|
|-|-|-|-|
|[LineageOS](http://www.lineageos.org/)|Usability|wide range of supported devices, _very high_ usability|no focus on privacy + security, only latest 3 major releases supported|
|[CalyxOS](https://calyxos.org/)|Usability, Privacy|wide range of supported devices, _high_ usability|no focus on security|
|[GrapheneOS](http://grapheneos.org/)|Security|best in class focus on security, _good_ usability|Google Pixel devices only, usually does not support older Android versions|
|[/e/ OS](https://e.foundation/e-os/)|Usability, Privacy|wide range of supported devices, _very high_ usability|no focus on security, does not support devices with older Android versions, late ASB patches|
|[AXP.OS - Pro](https://axpos.org/)|Usability, Security, Privacy|best balance between Usability, Security, Privacy, supports devices with older Android versions|only a subset of LineageOS devices currently supported|
|[AXP.OS - Slim](https://axpos.org/)|Security, Privacy|Security, Privacy, supports devices with older Android versions|only a subset of LineageOS devices currently supported, reduced usability compared to the Pro flavor|

Privacy examples:
- reducing/disabling Call-Home functions
- reducing/removing Google dependencies
- deblobbing of proprietary parts

Usability examples:
- allow or even include custom extensions (e.g. MicroG)
- pre-configurations
- including certain Apps
- support installing Apps from F-Droid
- ...

Security examples:
- fast ASB patching
- (CVE related) Kernel patching
- intensive hardening (e.g. malloc replacement)

