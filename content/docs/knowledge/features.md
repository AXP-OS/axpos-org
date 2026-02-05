---
title: "Features"
type: docs
toc: true
aliases:
    - /Features
---
## About

{{< globalvar key="about_info" format="true" >}}

## Flavor comparison

|Feature|Pro ⚙️|Slim 🛡️|
|-|:-:|:-:|
|On **device** testing* before each release _(no blind builds)_<br/>_(*see also "[verified by ...](/docs/knowledge/supportlevels)")_|**X**|**X**|
|Using Graphene's [hardened malloc](https://github.com/GrapheneOS/hardened_malloc) ([comparison](https://github.com/struct/isoalloc/blob/master/SECURITY_COMPARISON.MD))|**X**|**X**|
|OTA (Over The Air) updates|**X**|**X**|
|Including [ASB patches](https://source.android.com/docs/security/bulletin) (see [AXP.OS patch level](/Patchlevel) for details)|**X**|**X**|
|Hardened and focusing on [security and privacy](/docs/knowledge/techdetails/#the-changes)|**X**|**X**|
|Hardened [AOSmium](/Browser) System WebView by [EXTENDROM_PACKAGES](https://github.com/sfX-android/android_vendor_extendrom/wiki/EXTENDROM_PACKAGES)|**X**|**X**|
|[Hardened](/docs/knowledge/techdetails/#automated-mass-changes-to-android_kernel_) Kernel for any device|**X**|**X**|
|[CVE patched](/Patchlevel) Kernel for any device|**X**|**X**|
|Extra _Privacy_ by extensive [deblobbing](https://github.com/AXP-OS/build/blob/axp/Scripts/Common/Deblob.sh) and privacy-focused settings ([config](https://github.com/sfX-android/automation_scripts/blob/ansible/roles/axp/common/templates/axp.vars.j2))|**X**||
|Super _Privacy_ by even **more extensive** [deblobbing](https://github.com/AXP-OS/build/blob/axp/Scripts/Common/Deblob.sh) and privacy-focused settings ([config](https://github.com/sfX-android/automation_scripts/blob/ansible/roles/axp/common/templates/axpslim.vars.j2))<br/>_(while reducing usability)_||**X**|
|SELinux enforced|**X**|**X**|
|Data encryption enforced *(except on low-end devices)*|**X**|**X**|
|Signed (by [AXP.OS keys](/Signatures))|**X**|**X**|
|Increased key size + hash (8192 / sha512) for AVB, APK signing and dm-verity<br/>_(incl. adjustments in recovery and OTA Updater to support these)_|**X**|**X**|
|Advanced boot debug log ([EXTENDROM_BOOT_DEBUG](https://github.com/sfX-android/android_vendor_extendrom/wiki/EXTENDROM_BOOT_DEBUG))|**X**|**X**|
|Advanced Signature spoofing support by [EXTENDROM_SIGNATURE_SPOOFING](https://github.com/sfX-android/android_vendor_extendrom/wiki/EXTENDROM_SIGNATURE_SPOOFING)<br/>(**must be explicitly enabled**)|**X**|**X**|
|Extra Apps included by [EXTENDROM_PACKAGES](https://github.com/sfX-android/android_vendor_extendrom/wiki/EXTENDROM_PACKAGES)<br/>_([F-Droid](https://f-droid.org/), [AuroraStore](https://f-droid.org/de/packages/com.aurora.store/), [FossifyGallery](https://f-droid.org/en/packages/org.fossify.gallery/))_|**X**|**X**|
|extended list of F-Droid repositories ([1](https://github.com/sfX-android/android_vendor_extendrom/blob/main/fdroid_repos/molly.xml),[2](https://github.com/sfX-android/android_vendor_extendrom/blob/main/fdroid_repos/nailyk.xml),[3](https://github.com/sfX-android/android_vendor_extendrom/blob/main/fdroid_repos/threema.xml),[4](https://github.com/sfX-android/android_vendor_extendrom/blob/main/fdroid_repos/futo_org.xml))<br/>(**must be explicitly enabled**)|**X**|**X**|
|[eSIM](https://github.com/AXP-OS/packages_apps_OpenEUICC) support (A10 and later) for devices supporting euicc<br/>(**must be explicitly enabled**)|**X**|**X**|
|Internal DNS content blocker ([blocklist](https://github.com/hagezi/dns-blocklists?tab=readme-ov-file#ledger-multi-pro---extended-protection-recommended-))|**X**|**X**|
|Disable [call recording restrictions](/r) (by [EXTENDROM](https://github.com/sfX-android/android_vendor_extendrom))<br/>(**must be explicitly enabled**)|**X**|**X**|
|Re-locking the bootloader on supported devices|**X**|**X**|
|Reproducible builds - see the [details](/Reproducible-builds)|**X**|**X**|
|[microG](https://microg.org/) included<br/>(**requires to explicitly enable signature spoofing**)|**X**|¹|
|Current and microG compatible [Google Play Store](https://github.com/AXP-OS/microg-phonesky-iap-support/releases) included<br/>(**must be explicitly enabled**)|**X**|¹|
|WireGuard VPN [Kernel module](https://www.wireguard.com/compilation)|**X**|²|
|Pre-rooted (Magisk) by [EXTENDROM_PREROOT_BOOT](https://github.com/sfX-android/android_vendor_extendrom/wiki/EXTENDROM_PREROOT_BOOT) - Bootloader re-lock compatible<br/>(**must be explicitly enabled and activated first**)|**X**||
|Basic (i.e. w/o SafetyNet) support for [Widevine DRM](https://developers.google.com/widevine/drm/overview)|**X**||
|Supporting a FULL(!) app & settings [backup & restore](/Backup-and-Restore)|**X**||
|Advanced _Usability Support_ by [EXTENDROM_PACKAGES](https://github.com/sfX-android/android_vendor_extendrom/wiki/EXTENDROM_PACKAGES)<br/>_(Magisk, MicrogGmsCore, GsfProxy, Phonesky, [NeoLauncher](https://github.com/NeoApplications/Neo-Launcher))_|**X**||

- ¹ while not supported (and not possible on bootloader-locked devices) you can flash microG as in LineageOS.<br/>AXP.OS [Phonesky](https://github.com/AXP-OS/packages_apps_phonesky/releases) can be installed manually (via a custom recovery: place it in `/system/priv-app/Phonesky/`).<br/>Regardless if using the microG FakeStore or AXP.OS Phonesky you need to follow [the setup guide](/docs/guides/setup/aos/#optional-activate-google-support)) as well.
- ² some kernels have the wireguard patches already included - the Slim flavor will not remove them while you need root to _activate_ it

### Which flavor to choose?

Freedom of choice also brings with it a sometimes overwhelming flood of information. The table above may not be helpful for everyone. Here are some rough decision-making aids:

|Feature|Flavor|
|:-|:-:|
|Purchasing apps (incl. _In-App_) via **Google Play** strictly required?|Pro ⚙️|
|**Root**/Magisk required?|Pro ⚙️|
|**Full** device access required _(really **own** your device)_?|Pro ⚙️|
|Full(!) **backup of any**(!) app needed?|Pro ⚙️|
|Installing **Google Play apps** required _(no purchase)_?<br/>_(by AuroraStore)_|Pro ⚙️ / Slim 🛡️|
|Installing **[FOSS](https://en.wikipedia.org/wiki/Free_and_open-source_software) apps**<br/>_(by F-Droid or AuroraStore)_|Pro ⚙️ / Slim 🛡️|
|**Security** is more important than *usability*?|Slim 🛡️|
|**Privacy** is more important than *usability*?|Slim 🛡️|
|_... still uncertain?_|Slim 🛡️|

#### Pro flavor

The _Pro_ [flavor](/Flavors) of AXP.OS comes pre-rooted which is a major difference between many (if not all) other custom OS and requires to read the documentation properly and acting wisely _(i.e. not installing APKs from random sources, open every link in mails you get, installing OS and app updates quickly, etc)_. Also main parts are directly integrated into the OS, i.e. you do not need to care about installing "compatibility layers" like microG and can even use the official Google Play store _(btw, another unique feature of AXP.OS Pro that no other OS offers)_.

While the OS comes pre-rooted root is not _active_ at all and requires to _actively enable_ it _(downloading Magisk companion app, starting app, choose to activate Magisk, reboot)_ to make it _usable_ first. That means if you do not need root you can simply skip that step and there will be no root _(even no `su` binary)_ available at all. No app can access/detect root then. If the user decides **not** to activate root, there is still a chance it can become problematic:

1. you get infected by malware and/or getting hacked _(see above on how to reduce risks)_
1. if you **then** _also_ get tricked into _activating_ root:
   - _**with** user interaction:_ lets say the malwares shows a button which then silently downloads magisk, it also must silently install(!) magisk which is nothing an user app can do by default _(installing apps is a dangerous permission no user app gets by default)_. but lets say it can also _install_ Magisk, it still requires you to _open_ Magisk and choose to _enable_ root AND to _reboot_. Here latest you should be aware of something is unusual if an app prompts you there. So ok lets say a more advanced attack could also act as an overlay over other apps _(this is also a dangerous permission no user app can get by default)_ and trick you by clicking even _that_ button well then.. it still requires to _get_ root permissions which means Magisk will prompt you allowing/denying root for that specific malware app. If all that went through then yes, an app has all full access to the device. A more likely attack would be that you get tricked to install a custom Magisk app which comes pre-configured to skip all these manual activation steps. So, the "installing apps" permission request is your best _(and only!)_ protection then.<br/>_**TL;DR: If your device is infected AND you grant this permission ("allow to install apps") without thinking, there is nothing to stop the malware/attacker from doing what it wants.**_
   - _**without** user interaction_ the malware/attacker must perform all the mentioned manual activation steps behind your back. This requires _unpatched_ exploit(s) _(see [AXP.OS patch level](/Patchlevel))_ which is what AXP.OS tries to reduce with several actions, while there is no guarantee at all. Of course this requires the user to install any update quickly as well.

The _Pro_ flavor symbol ⚙️ should reflect that it comes pre-configured and includes engineering tools like being pre-rooted. Besides this all _major_ security and privacy mechanism and pre-cautions are mostly similiar _(see above feature comparison)_ between Pro and Slim.

#### Slim flavor

The _Slim_ flavor on the other side, does **not** come pre-rooted and offer you an OS without compromise regarding security and privacy _(compared to Pro)_. Unfortunately this comes with some drawbacks regarding usability.

Examples are: 
- longer first-time GPS (location) fix
- using several Google apps require to manually install microG
- some apps do not work or functionality is not available/reduced due to the more extensive deblobbing

These might sound more problematic than it is in real-life. Usually it does not have such a big impact _(depends on the device and Android version)_ and as shown in the _"Which flavor to choose"_ table above, Slim is still the recommended choice if you are uncertain where to start. It is highly recommended to fully test all your apps & requirements before using it as a daily driver though so you could switch to _Pro_ if it fits better for your needs.

The _Slim_ flavor symbol 🛡️ should reflect that it comes with all possible pre-cautions in terms of security and privacy.

### Divest Notice

_Up to `Dec 2024` AXP.OS was based on [DivestOS](https://web.archive.org/web/20241227223444/https://divestos.org/), see the EOL notice for Divest and its impact on AXP.OS [here](/Divest_EOL)._

For this reason, AXP.OS started at the beginning of 2025 with different [flavors](/Flavors), where Slim represents a Divest-like experience _(Slim uses 99% of the DivestOS setup and configuration)_.

## Simplified(!) OS comparison

The following is just a **simplified** comparison between some popular custom OS and is meant to give a short **overview** only (there are dozens of detailed comparisons available elsewhere).

Examples of more detailed comparisons (_even though without AXP.OS_) can be found:
- [here](https://eylenburg.github.io/android_comparison.htm) or
- [here](https://eylenburg.github.io/old/android_comparison_2024old.htm) (_hint: AXP.OS has always been based on DivestOS and therefore always contained all of its features. Since January 2025, AXP.OS has been developed independently on this last available DivestOS code base._)

The _Main(!) focus_ column is a bit vague or better said subjective as all OS claim to be all of these 3: _user-friendly, secure and privacy-friendly_.

Yes, _Privacy_ always requires having a _secure_ device, too! Although _security_ and _privacy_ are often mentioned in the same breath, the two terms are **not** synonymous ([details](https://threema.com/en/blog/security-vs-privacy)). OS in the following table having _Privacy_ as their main focus doing this more intensively than others. See _Privacy Examples_ to get an idea.

|OS|Main(!) focus|Pro|Contra|
|-|-|-|-|
|[LineageOS](http://www.lineageos.org/)|Usability|wide range of supported devices, _very high_ usability|no focus on privacy + security, only latest 2-3 major releases supported|
|[CalyxOS](https://calyxos.org/)|Usability, Privacy|_high_ usability, customizable|no focus on security, does not support older Android versions, recently [paused](https://calyxos.org/news/2025/08/01/a-letter-to-our-community/) development, mostly Pixel devices focussed|
|[GrapheneOS](http://grapheneos.org/)|Security|best in class focus on security, _good_ usability|Google Pixel devices only, usually does not support older Android versions|
|[/e/ OS](https://e.foundation/e-os/)|Usability, Privacy|wide range of supported devices, _very high_ usability|no focus on security, does not support devices with older Android versions, late ASB patches|
|AXP.OS - Pro ⚙️|Usability, Privacy|_best_ balance between modding, usability, security and privacy, supports devices with older Android versions, _good_ range of supported devices, extensive testing _(no blind builds!)_|only a subset of LineageOS devices currently supported, reduced security compared to the _Slim_ flavor|
|AXP.OS - Slim 🛡️|Security, Privacy|provides _good_ usability while focussing strictly on security and privacy, supports devices with older Android versions, _good_ range of supported devices, extensive testing _(no blind builds!)_|only a subset of LineageOS devices currently supported, reduced usability compared to the _Pro_ flavor|

_Privacy_ examples:
- reducing/disabling Call-Home functions
- reducing/removing Google dependencies
- deblobbing of proprietary parts
- ...

_Usability_ examples:
- allow or even include custom extensions (e.g. microG)
- pre-configurations
- including certain Apps
- support installing Apps from F-Droid
- ...

_Security_ examples:
- ASB patching/backporting
- (CVE related) Kernel patching
- intensive hardening (e.g. malloc replacement)
- ...

## Find another OS

Your device or flavor is currently not supported or AXP.OS does not fit your requirements?<br/>
Then these pages might help finding a suitable one:

- [sustaphones.com](https://www.sustaphones.com/)
- [empto @disroot](https://git.disroot.org/empto/CoolAndroids_devices_scrapers/wiki)

_([let us know](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues/new/choose) if you want to see any other site listed)_