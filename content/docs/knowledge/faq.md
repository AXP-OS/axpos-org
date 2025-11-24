---
title: "FAQ"
type: docs
toc: true
aliases:
    - /FAQ
    - /faq
    - /Frequently-Asked-Questions
---
### What's inside AXP.OS?

See [Features](/Features) and [Technical Details](/Technical-Details)

### Known Issues

See: [here](/Known-Issues)

### eSIM management (if supported by device)

eSIM Management is not enabled by default and available on supported devices only:

*   `Android Settings -> Security -> "Enable eUICC management"`
*   Reboot your device.
*   You should now have an app 'OpenEUICC' in your launcher and you can also use `Android settings -> Network&Internet -> SIMs` to open it.
*   If it says 'No eUICC found', then you need to tap the top right 3dot and enable "Dual SIM", then reboot.
*   Tap the add button.
*   If you received a QR code, then tap the barcode scanner button in top right, and scan it.
*   If you received only a server and activation code, input it into the respective fields, and tap the checkbox to continue.
*   After a few moments your eSIM should be provisioned and start working.

### Is AXP.OS secure?

See [AXP.OS patch level](/docs/knowledge/patchlevels) for details.

### Debug logs

See [Grab-Logs](/Grab-Logs)

### Magisk

- [Magisk: App not installed?!](https://github.com/sfX-android/android_vendor_extendrom/wiki/FAQ#magisk-app-not-installed)
- [Magisk: "Requires Additional Setup" on start](https://github.com/sfX-android/android_vendor_extendrom/wiki/FAQ#magisk-requires-additional-setup-on-start)
- [Banking/Hide root](hide-root)

### no GCM available / Google Play service required

Ensure you have the following activated in microG settings:

- Google device registration
- Cloud Messaging
- Allow apps to find accounts (will fix Whatsapp and others apps cannot find the google account)

If you still get this message also check the next topic here: [Possible fixes for stubborn apps](/Possible-fixes-for-stubborn-apps) topic.

### will my Banking / strict app work with AXP.OS?

It depends. Many apps will check for a custom OS and/or root and so might fail to start / refuse to work.

Many of these apps will work if following [this guide](hide-root) though  _(but also check the next topics regarding Play integrity which can be a requirement for some apps)_.

### what is Play Integrity / SafetyNet?

In short: it is Google's proprietary method to verify a device is "trustworthy" - which means in other words: a device is trustworthy if Google receives money for it _(OEM's have to walk through a certification process and of course pay to get a "certified" state)_.

_SafetyNet_ is the "old" method _Play Integrity_ the new/current one.

More details can be found here:

- A12 and lower: [Safetynet](https://en.wikipedia.org/wiki/SafetyNet) and [Play integrity/certified](https://developer.android.com/google/play/integrity/overview)
- A13 and later: [Play Integrity ("improvements")](https://developer.android.com/google/play/integrity/improvements)
- AVB is one part of that testing process: [Android verified boot](https://source.android.com/docs/security/features/verifiedboot/boot-flow)

### does AXP.OS allow to pass Play Integrity / SafetyNet?

No and this is not supported in any way. Even though Magisk modules exist (which at least give a chance to pass it) users reported it non-working nevertheless. Any PI/SafetyNet bypass stands on shaky ground anyways as its detection can change at any time.

Yes, iode and eOS and likely others implemented bypasses but these bypasses are not included in AXP.OS (yet). This might change in the future but it has no priority atm.

### can you recommend any apps?

yes/no but here are some great lists containing FOSS alternative apps:

- [divestos.org/pages/recommended_apps](https://divestos-archive.codeberg.page/page/recommended_apps.html) (discontinued since Dec 2024, but still a very valuable list)
- https://github.com/tycrek/degoogle (discontinued since Aug 2024, but still a huge list)
- https://github.com/pluja/awesome-privacy

### Google Play services update?

If you using Google play it might want updating the Google play services. Please see here for details and changes: [Google System Updates](https://support.google.com/product-documentation/answer/14343500?hl=en)

### Is there a list where the source code is hosted?

{{< callout emoji="💡" type="info" >}}
AXP.OS is in the progress of moving away from Github.<br/>
The main goal is to have all needed on the projects self-hosted Gitea instance and mirror everything to e.g. (but not limited to) Codeberg.org.
{{< /callout >}}

|Hoster|URL|Public**|Purpose|Repos|
|-|-|:-:|-|-:|
|disroot|[https://git.disroot.org/AXP.OS](https://git.disroot.org/AXP.OS)|✅|mirror of code.binbash.rocks public available repos, APK releases, reproducible builds|~191*|
|Self-Hosted|[https://code.binbash.rocks/AXP.OS](https://code.binbash.rocks/AXP.OS)|❌**|main, CI/CD, APK build, internals, sensitive parts of build|~211*|
|Codeberg|[https://codeberg.org/AXP-OS_limited](https://codeberg.org/AXP-OS_limited)|❌**|mirror of code.binbash.rocks non-public available repos, APK releases|~23*|
|**_DEPRECATED:_**|||||
|Github|[https://github.com/AXP-OS](https://github.com/AXP-OS)|✅|DEPRECATED: proprietary, acquired by Microsoft. was used for reproducible builds, manifests, public parts of build|~208*|
|Codeberg|[https://codeberg.org/AXP-OS](https://codeberg.org/AXP-OS)|✅|DEPRECATED: repo/size limits, see [#1123](https://codeberg.org/Codeberg-e.V./requests/issues/1123#issuecomment-8422650) was used as mirror of code.binbash.rocks public available repos, APK releases|100|

- *) _state: November 2025_
- **) _see next topic_

### Why do some repositories require a (free) registration?

1. Solely because they could contain problematic/sensitive parts
1. If an official mirror(s) requires a registration it is for [reproducible builds](/Reproducible-builds) **only**
1. You can build AXP.OS **without** these repositories by just using the normal [AXP.OS manifest](https://github.com/AXP-OS/manifest/) and add vendor blobs and firmware on your own
1. Splitting the problematic parts from the rest of the sources also makes it easier keeping the main project/builds alive in case of trouble


## meaning of the AXP.OS build id

You might noticed the build ID already when checking the [Changelog](/Changelog) or when looking at the [automation channel](/docs/overview/#support) when a new release is announced.

The format of the AXP.OS build ID is:

- until August 2025: `YYYY-MM-05.<ID>`
- since September 2025: `YYYY-MM.<ID>`

It gets set once a build "freeze" starts and uses the current year and month of that start date. The `<ID>` begins with `1` and increases if there is any other build in that same year and month (which rarely happens though).

This build ID is used in several places: Changelog, build release announcments, reproducible buid manifest, testing checklist, and more. When referring to a build ID it is possible to get all relevant information and it ensures that all builds run with the same config, same included app versions etc.

---

## DivestOS-based FAQ

The document starting from here is a markdown replacement of the original made by: [Divested Computing Group](https://web.archive.org/web/20241231213231/https://divestos.org/pages/faq), so all credits goes to them.

AXP.OS used DivestOS as a base up to December 2024 (see [Divest_EOL](/Divest_EOL)) but the following still reflects the current state for AXP.OS (as of January 2025).

Nevertheless the whole page get a full re-work after the `Divest->AXP.OS` cleanups are finalized and the dust has settled again.. Until then expect broken links and incomplete/not 100% matching content.


### Device Choice

#### Any guidelines for choosing a device?

Yes, please for your own sake avoid devices with the following:

*   Carrier branding
*   No access to fastboot and/or requiring to create an account
*   Less than 6GB of RAM
*   Less than 64GB of storage
*   Less than a 2000mAh battery
*   Released before 2017
*   Non-Qualcomm/Tensor SoC, eg. MediaTek/Exynos/Tegra/OMAP
*   Kernel older than 4.4

And for the best experience:

*   At least 8GB of RAM
*   At least 128GB of storage
*   At least an SD845 SoC
*   At least kernel 4.9, preferably newer.

#### What phone do you recommend?

Any Pixel 6 or newer, with the Pro variants preferred as they have 12GB of RAM. The 6a/7a/8a are excellent values on sale and will receive support from Google until July 2027, May 2028, and May 2031 respectively. Please note the 6a only has 6GB of RAM and you will experience apps swapping in and out with it though.

#### What tablet do you recommend?

Only the modern Google Pixel Tablet (tangorpro) is recommended, as it is available for an OKish price on sale without the dock and receives updates until June 2028. AXP.OS supports a handful of older tablets but those should be avoided as they do not meet the above guidelines.

#### Can I send you my phone to install AXP.OS for me?

No. You can however join the chat room and ask for install help.

#### A note on Google Pixels

Seemingly any Verizon, Telus, Rogers, or EE carrier variants cannot be bootloader unlocked. In general always avoid such.

### Device Support

#### Are all devices supported equally?

No, some devices have much better support than others.

#### What devices support Wi-Fi MAC randomization?

As of 2024/12/23: `akari, akatsuki, alioth, Amber, apollon, aura, aurora, avicii, barbet, beryllium, bluejay, blueline, bonito, bramble, cheeseburger, cheetah, cheryl, coral, crosshatch, davinci, dipper, discovery, dumpling, enchilada, equuleus, fajita, flame, FP4, guacamole, guacamoleb, hotdog, hotdogb, instantnoodle, instantnoodlep, jasmine_sprout, kebab, kirin, lavender, lemonade, lemonadep, lemonades, lmi, lynx, mata, mermaid, oriole, panther, pioneer, platina, polaris, pro1, pro1x, raven, redfin, sargo, star2lte, starlte, sunfish, taimen, tangorpro, twolip, ursa, vayu, voyager, walleye, wayne, whyred, xz2c`

#### What devices have CFI enabled kernels?

As of 2024/12/23:

*   CFI enabled: none yet
*   CFI and SCS enabled: blueline/crosshatch, bonito/sargo, coral/flame/sunfish, bramble/redfin/barbet, oriole/raven/bluejay, cheetah/panther/lynx/felix/tangorpro, FP4, lemonade\*
*   CFI supported, but not enabled: akari/akatsuki/aurora/xz2c, avicii, cheryl, beryllium/dipper/equuleus/polaris/ursa, davinci, FP3
*   CFI and SCS supported, but not enabled: alioth/apollon/lmi, guacamole\*/hotdog\*, vayu, instantnoodle\*/kebab
*   CFI supported, but tested non-functional as is: enchilada/fajita

#### What memory allocator is used?

As of 2024/12/23:

*   jemalloc for 32-bit and 64-bit: all 14.1 devices
*   jemalloc for 32-bit and hardened_malloc for 64-bit: all 15.1, 16.0 and 17.1 devices
*   scudo for 32-bit and hardened_malloc for 64-bit: all 18.1, 19.1, and 20.0 devices
*   Exceptions:
    *   These devices use jemalloc for 32-bit instead of scudo: akari/akatsuki/aurora/xz2c, cheryl, klte, hlte
    *   These devices use jemalloc for 32-bit and 64-bit: flounder\*

#### Why does AXP.OS enable low_ram mode when Google only recommends it for <=2GB devices?

The OnePlus 3 released with Android 6.0 and had 6GB of RAM. Running Android 11 on a device that released with Android 4.2 and 2GB of RAM is much more usable when the system isn't hogging all the resources.

#### What devices have low_ram mode set?

As of 2024/12/23

*   14.1: <2GB
*   15.1: <2GB
*   16.0: <2GB
*   17.1: <3GB
*   18.1: <3GB
*   19.1: <4GB
*   20.0: <4GB

#### What devices are known to have faulty/insecure bootloaders?

These are vendor limitations and apply to any OS. This list must be assumed incomplete. As of 2024/12/23:

*   Trusts test-keys for verified boot:
    *   Impact: Combined with the ability to write to system partitions this may allow an attacker to write data that will pass verified boot checks.
    *   Affected Devices: enchilada/fajita, FP3, [FP4](https://forum.fairphone.com/t/bootloader-avb-keys-used-in-roms-for-fairphone-3-4/83448/11)
*   Can't be relocked (with a custom OS):
    *   Impact: When unlocked, an attacker can trivally flash partitions without risk of erasing user-data. Additionally verified boot is only enforcing when locked. Verified boot raises the barrier of local attacks and helps mitigate persistence of remote attacks.
    *   Affected Devices: [OnePlus 7 and newer](https://calyxos.org/news/2022/07/06/oneplus-android-12-relock-issue/), Motorola, Samsung, Xiaomi
*   EDL access [available](https://github.com/bkerler/loaders):
    *   Impact: Allows replacing partitions at will. Can even allow dumping entire RAM (including secrets) and/or partition (including userdata) contents.
    *   Affected Devices: axolotl, FP2, FP3, bacon, oneplus2, oneplus3/t, cheeseburger/dumpling, enchilada/fajita, hotdog\*/guacamole\*, avicii, instantnoodle\*/kebab/lemonades, lemonade\*
*   Qualcomm Crashdump enabled:
    *   Impact: When combined with EDL access this allows dumping complete RAM contents at runtime without any restrictions.
    *   Affected Devices: enchilada/fajita
*   Qualcomm Secure Boot disabled:
    *   Impact: This allows replacing ALL partitions, including the bootloader itself, when combined with EDL access. This directly undermines all other signature checks and verified boot.
    *   Affected Devices: [axolotl](https://forum.shiftphones.com/threads/vollstaendiges-backup-ueber-qualcomm-edl-mode.4777/#post-44656), FP2, [FP3](https://forum.fairphone.com/uploads/default/original/3X/9/b/9b6fee6021b919e855b5258f76de9738d5b04995.jpeg)
*   Has alternate manufacture mode available (eg. [LAF](https://github.com/steadfasterX/lglaf)):
    *   Impact: Allows replacing partitions at will.
    *   Affected Devices: mako, LG G2, LG G3, LG G4

#### What devices have eSIM support?

As of 2024/12/23: Pixel 4 series and newer, along with the Fairphone 4

#### Why does VoLTE not work on my device?

*   VoLTE does not work on any Samsung or LGE devices under aftermarket systems.
*   On 18.1 and higher you can toggle additional configurations that may enable VoLTE to work via Settings > Security > Enable CarrierConfig2 and rebooting.
*   The device may lack the necessary configuration files for your carrier and will never work.
*   VoLTE may be default disabled for your line. You can check your carrier website or call them to activate it if so.
*   Your carrier may only activate VoLTE on "approved" devices.
*   Your carrier hasn't actually rolled out VoLTE yet.

#### What devices is VoLTE known to be working on assuming everything else is in-place?

As of 2024/12/23: `bluejay/oriole/raven, flame, cheeseburger, fajita, mata, taimen, FP3, FP4`  
Can be assumed working: `cheetah, coral, dumpling, enchilada, felix, lynx, panther, walleye`

#### My device has LTE without VoLTE but my carrier has phased out 2G/3G calling, what can I do?

*   Acquire a newer device if possible.
*   Otherwise consider a VoIP service like [JMP.chat](https://jmp.chat).

#### Will you provide GSI images?

No, many of the features in AXP.OS such as the deblobber and kernel patching/hardening are incompatible with how GSI images work.

#### Will you provide x86 images?

No, there is no support in AOSP for running on traditional desktop/laptop computers. It is recommended you instead use [Fedora](https://getfedora.org/) with our [Brace](https://divested.dev/pages/software#brace) package.

#### Can you support X device, that does have an official LineageOS port?

New devices and/or flavors can be requested [here](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues/new/choose).

#### Can you support X device, that doesn't have an (un)official LineageOS port?

No.

#### LineageOS stopped supporting X device, does that mean AXP.OS will stop too?

No.

### Operating System

#### I found a bug! Where do I report it?

Please see the [bug reporting](/pages/bug_reporting) page.

#### How is location handled?

AXP.OS takes some more extreme care with location compared to most other systems and doesn't work how most people expect.

Please see the ["Location" page](/Location) for further details.

#### What is the benefit of a security focused memory allocator?

The primary possible benefits of security focused memory allocators are the ability to make attacks harder through out of line metadata, greater randomness, double free detection, use after free detection, invalid free detection, 1-byte buffer over or underflow detection, and some write after free detection, as well as zero on free to reduce data lifetime. Not all memory allocators provide these features. There is a [comparison table here](https://github.com/struct/isoalloc/blob/master/SECURITY_COMPARISON.MD).

#### How do I backup my system?

*   On 17.1 and higher Seedvault is included which should be used to backup user apps that allow it. Using Seedvault to a flash drive over OTG is strongly recommended, but be sure to plug it in occasionally to actually ensure recent backups are available.
*   Note: Seedvault can be unreliable, doesn't support work profiles or secondary users, and the file backup option will squash directory hirearchies.
*   Note: Restoring a Seedvault backup from another distinct OS is unsupported and will likely cause numerous issues.
*   Many apps have their own backup function, you should use this if Seedvault is unable to backup the app, as a backup backup, or if you're on a version without Seedvault.
*   From here you can copy all of internal storage (documents, downloads, pictures/videos) which should also include the Seedvault folder (if you didn't use OTG) along with any app specific exports. You can either use USB MTP or with some setup you can use Syncthing to a remote computer.

#### What apps have their own backup mechanism?

The following list is largely user contributed, nor do we necessarily endorse or recommend any of the following apps.  
Also note some apps only prompt the share menu which can't actually directly save to a file, you can use [this app](https://f-droid.org/packages/name.lmj001.savetodevice/) in that case.  
See an example list [here](https://divestos-archive.codeberg.page/misc/app-backup.txt) _(credits: DivestOS, not updated anymore)_

#### Are OTA updates available?

All devices have OTA updates via the Updater app accessible via Settings.

#### Do I need to install every update the Updater shows?

No, just the latest one.

#### How long do OTA updates take to install?

Devices that use update_engine (they install while in the Updater app) should take 10-20 minutes to install, although may take longer if using other apps, and will pause entirely if the screen is off. Devices that reboot to the recovery to install should be less than 5 minutes, but may be up to 10 minutes on very old devices.

#### What internal databases are updated?

AOSP has many internal databases that are often neglected on older versions, however we [provide updates](https://codeberg.org/AXP-OS/build/src/branch/axp/Scripts/Update_Commons.sh) for them as follows.

*   14.1+: LineageOS contributors cloud from latest LineageOS version. Provides accurate credits viewable in Settings.
*   14.1+: Timezone Databases from latest available. Provides accurate time/offsets for different regions.
*   14.1+: Certificate Authority store from AOSP master branch. Improves TLS compatibility and integrity.
*   14.1+: APN list from latest LineageOS version. Improves carrier compatibility.
*   14.1+: MMS configs from Google Messenger. Improves carrier compatibility.
*   15.1+: Visual VoiceMail configs from Google Dialer. Improves carrier compatibility.
*   18.1+: Phone number helplines databases from latest LineageOS version. Improves care in personal crisis.
*   16.0+: carrier_list from AOSP master branch. Improves carrier compatibility. \[disabled due to breakage\]
*   17.1+: CarrierConfig from AOSP master branch. Improves carrier compatibility. \[disabled due to breakage\]
*   On supported kernels: Wi-Fi regulations database. Improves Wi-Fi compatibility. \[disabled due to breakage\]

#### What Bluetooth audio codecs are available (if supported by device)?

*   SBC is available on all versions.
*   SBC-XQ is available on select versions, see [below](#btSBCXQ).
*   AAC, aptX, and LDAC are available on 15.1 and higher.
*   LC3 (LE Audio) is available on 20.0 and higher.
*   aptX is available on all 20.0 devices after the March 2023 update as it was open-sourced.

#### Is Bluetooth SBC-XQ (dual channel SBC) available?

*   [14.1](https://review.lineageos.org/q/topic:bt-sbc-hd-dualchannel-nougat) has the patches included, but it can only be enabled globally with root which is not supported.
*   [15.1](https://review.lineageos.org/q/topic:bt-sbc-hd-dualchannel), [16.0](https://review.lineageos.org/q/topic:bt-sbc-hd-dualchannel-pie), and [18.1](https://review.lineageos.org/q/topic:eleven-bt-sbc-hd-dualchannel) have it in the per-device Bluetooth settings menu.
*   [17.1](https://review.lineageos.org/q/topic:ten-bt-sbc-hd-dualchannel) and [19.1](https://review.lineageos.org/q/topic:twelve-bt-sbc-hd-dualchannel) had incomplete patches made, and not merged.
*   20.0 has not yet received a port of it.

#### What changes does low_ram mode incur?

*   On 14.1 through 16.0 jemalloc is set to svelte mode.
*   Picture in picture support is disabled.
*   Multi-window support is disabled.
*   Split-screen support is disabled.
*   Live wallpaper support is disabled.
*   Secondary displays are mirrored instead of extended.
*   The auto-rotate hint is disabled.
*   The GPU will be avoided for certain tasks.
*   Various graphics throughout the system will be rendered at a lower resolution.
*   Some animations and effects are disabled.
*   File previews are disabled in the Files app and file picker.

#### Background apps keep dying! How can I reduce memory usage?

*   Uninstall apps you rarely use.
*   Reduce the number of background apps running.
*   Close apps that you aren't using by swiping them away in the app switcher.
*   Use the built-in network controls in favor of VPN-based firewall apps.
*   Use the built-in content blocker or `Private DNS` with an adblocking DNS resolver instead of a VPN-based adblock app.
*   Use the built-in home launcher instead of a third-party launcher. On modern Android the app switcher/overview is handled by the launcher (Quickstep) and most replacement launchers do not actually implement this, which results in both launchers always running.
*   Try to consolidate messaging apps, as an example [Conversations](https://f-droid.org/packages/eu.siacs.conversations/) can talk XMPP, IRC via Biboumi, Matrix via Bifrost, and PSTN via jmp.chat. Conversations can even be a push notification provider for apps supporting [UnifiedPush](https://unifiedpush.org/users/apps/), which can let them pause entirely.
*   Use lighter or more efficient apps such as:
    *   Organic Maps instead of OsmAnd, as it is more optimized
    *   Wireguard instead of OpenVPN in VPN apps
*   If you use a work profile, pause it when not needed.
*   Work profile apps like Shelter and Insular have options to "freeze" individual apps entirely, use it for infrequently used apps.
*   Main profile apps can be disabled on 17.1 and higher from app info and also be "frozen" via apps like SuperFreezZ or Hail on older versions, but may cause issues.
*   If you use secondary user profiles, use the `End Session` button to completely stop them when not needed.
*   At the direct cost of security you can consider installing 32-bit variants of apps.
*   Disable the `secure app spawning` feature in Settings > Security.
*   Try to reboot your device once every three days to workaround any latent memory leaks.
*   Do not bother with "booster" or "cleaner" apps.
*   In your web browser, close tabs that are no longer needed.
*   In your web browser, only keep extensions that you really need. We only recommend uBlock Origin.
*   If you use uBlock Origin, consider enabling the `Ignore generic cosmetic filters` option.
*   Use the right tool for the job. Web browsers are great, but sometimes using a dedicated app really is more efficient, such as:
    *   using a unit/currency converter app instead of searching it.
    *   watching YouTube in NewPipe instead of their website.
*   Use an appropriate resolution wallpaper. While that 8K wallpaper may be breathtaking, it only wastes resources when your screen is a fraction of the resolution. [Here](/images/Black-100x100.png) is an all black smallest possible PNG for this.
*   Prefer lower resolution video if available. Watching 2K/4K/8K requires more memory for processing and buffering which is just a waste when your screen is only five inches.

#### How do I allow TalkBack on AXP.OS 20.0?

*   Settings > Accessibility > TalkBack > Try to open > Shows "Restricted Setting"
*   Settings > Apps > See all apps > com.android.talkback > 3dot in top right > Allow restricted settings
*   Settings > Accessibility > TalkBack > Use TalkBack

#### How do I allow this restricted setting thing?

Depending on the installation source, apps may have some special settings restricted. To allow: Settings > Apps > Special App Access > \[the setting\] > \[the app\] > confirm that it is greyed out > tap the icon there > then on that app info screen tap the 3dot in top right > Allow restricted settings.

#### Should I use an alternative F-Droid client?

It is not recommend to use an alternative client due to how AXP.OS utilizes its own F-Droid repos for updates. Additionally most alternative clients lack mirror support for downloads, incremental index database downloads, or any metadata localization support. If you do want to use one anyway, you MUST do the following:

* Add at least the [AXP.OS Stable repo](/F-Droid) to receive important updates

#### Should I use the 'XG only' network mode option (if available)?

2G has no encryption, 3G has decent encryption, and LTE has end-to-end encryption (simplified, 3G and LTE still have many leaks). Malicious cell interception devices capable of intercepting 3G/LTE are very expensive kits, so the lesser ones downgrade you to 2G where they can work. These network modes offer enhanced protection against interception by pinning to a mode. As always there are various other ways for your device to be compromised or to have your data intercepted.

Which to use? If your device has VoLTE available, you should choose 'LTE only'. If it has LTE but you can make calls over 3G, choose 'LTE/3G only'. If it does not have LTE, but can make calls over 3G, choose '3G only'. If you can't make calls over 3G, you will sadly have to use the regular LTE or 3G modes (which happily downgrade to 2G).

#### Why isn't AXP.OS based on X operating system?

LineageOS has superb device compatibility across the board, along with a strict set of [baseline requirements](https://github.com/LineageOS/charter/blob/master/device-support-requirements.md). Our build scripts are mostly universal so adding an alternate base if needed is easily doable.

#### Why did you only partially remove VoLTE?

Many carriers are phasing out their 2G/3G cell towers. Soon it will only be possible to make calls using VoLTE.

#### Why did you remove the weather providers?

Because they all transmit your location on a somewhat fixed schedule over HTTP.

#### Will you add that one theme engine?

No.

#### How can I sandbox my apps?

All apps on Android are already sandboxed. If you want to be able to grant less-trustworthy apps permissions that they demand such as contacts or files access then install them in a work profile (eg. Shelter). This would let them access any saved contacts or files in the work profile but not of your true main user. So be sure to not actually store any sensitive information in the work profile!

#### Can apps access hardware identifiers like the serial number or IMEI?

Android 10 and higher prohibits all user apps from accessing: serial number, Wi-Fi & Bluetooth MAC addresses, IMEI, and IMSI. AXP.OS 16.0 and higher also ensures apps with a lower targetSdk cannot access the serial number.

#### Does AXP.OS contain proprietary code?

Yes. All of the devices have hundreds to thousands of proprietary blobs used for hardware enablement. This applies to every aftermarket Android OS and every known shipping Android device. However unlike other systems, AXP.OS goes to a great extent to remove proprietary blobs that are not truly necessary as is [handled here](https://codeberg.org/divested-mobile/AXP.OS-build/src/branch/master/Scripts/Common/Deblob.sh).

#### Does AXP.OS still contain non-device specific proprietary code?

Yes. Of note: GrapheneOS, CalyxOS, LineageOS, and others contain these too.

*   Chromium/Mulch contains Google Play Services and Firebase libraries. Removal of this would noticeable slow down updates leaving users exposed to known security issues for longer.
*   ImsServiceEntitlement on A12/19.1 and higher contains Google Play Services and Firebase libraries. Removal of this would break calling functionality on select carriers that utilize FCM for IMS enablement. AXP.OS removed this in the September 2023 release.
*   The Car/DebuggingRestrictionController on A12/19.1 and higher contains Google Play Services and Firebase libraries. AXP.OS removed this in the September 2023 release.

#### Why isn't root included/supported?

AXP.OS does not support or encourage the use of root or runtime modification frameworks.  
Such tools will break the following functions:

*   Bootloader locking on verified boot capable devices, preventing the system from booting.
*   Verified boot on capable devices, preventing the system from booting.
*   Incremental delta OTA updates, will fail to flash.
*   You will not be able to use the AXP.OS recovery. AXP.OS recovery only flashes same-signed ZIPs.
*   Lineage add-on backuptool is removed from AXP.OS, you will have to reflash your changes every update.
*   Will break the trust model that AOSP employs and reduce the integrity of the system.

Here are some common use cases of rooting and alternatives if available:

*   Network Restriction: AXP.OS already lets you restrict network for each app by connection type (cellular/Wi-Fi/VPN), when in the background, and optionally completely revoke NETWORK permission.
*   Ad/Tracker Blocking: AXP.OS includes a tailored [HOSTS](https://divested.dev/pages/dnsbl) file by default for such blocking. The user can further choose to use an alternative DNS or use a local VPN app such as [personalDNSfilter](https://f-droid.org/packages/dnsfilter.android) or [NetGuard](https://f-droid.org/packages/eu.faircode.netguard).
*   Permission Control: Modern AOSP provides far more control of permissions than older versions.
*   Data Spoofing: You can run apps in a work profile via [Shelter](https://f-droid.org/packages/net.typeblog.shelter)/[Insular](https://f-droid.org/packages/com.oasisfeng.island.fdroid) or in a separate user profile to minimize data available to apps when granted related permissions.
*   Backup: AXP.OS includes [SeedVault](https://calyxinstitute.org/projects/seedvault-encrypted-backup-for-android) on Q/R/S/T for backing up apps and their data to Nextcloud or USB OTG.
*   Overclocking: Most mobile system-on-chips have their RAM stacked above the processor. Heat kills. Overclocking can and will reduce the life-span of your device.
*   App Removal: Modern AOSP already lets you strictly disable most system installed apps. Furthermore AXP.OS already includes [far fewer](https://codeberg.org/divested-mobile/AXP.OS-build/src/branch/master/Scripts/Common/Deblob.sh) system apps compared to most other operating systems.
*   Battery Saving: Modern AOSP lets you prohibit apps from running in the background completely and has more advanced idle battery saving features.
*   Battery Analysis: You can use [Battery Historian](https://developer.android.com/topic/performance/power/setup-battery-historian) via ADB for extremely detailed battery usage reports.

### Application Compatibility

#### So Google apps and other proprietary apps won't work at all?

Many apps will work just fine. Status of some apps is documented [here](/pages/functionality_tables#apps)

*   Apps that hard depend on Play Services won't work, but may work with [microG enabled](#microgEnable).
*   Apps that depend on FCM/GCM without a fallback won't have notifications, but may work with [microG enabled](#microgEnable).
*   Apps that mandate Google login won't work, but may work with [microG enabled](#microgEnable).
*   Apps that depend on SafetyNet won't work.
*   Apps that depend on DRM won't work.
*   Apps that depend on Play Asset Delivery won't work.
*   Apps that Aurora Store labels as "GSF dependent" may actually work just fine.
*   Android Auto won't work.
*   Some games will be broken by the hardened memory allocator, pick a 32-bit device in the Aurora `spoof manager` instead.
*   While not for AXP.OS, there is a large list of banking apps and their compatibility status regarding SafetyNet & Play Services documented [here](https://privsec.dev/posts/android/banking-applications-compatibility-with-grapheneos/).

If you have an app that isn't working and doesn't contain an error message covering the above (SafetyNet/DRM/Play), try:

*   Allowing self debugging: Settings > Security > Enable native code debugging > checked
*   Disabling the content blocker: Settings > Security > Disable DNS content blocker > checked (if this fixes it please report so it can be excluded from list)
*   17.1 and lower only: Try installing the APK with the source spoofed to the Play Store: `adb push example.apk /data/local/tmp && adb shell pm install -i "com.android.vending" -r /data/local/tmp/example.apk`
*   Joining the [chat](/pages/community#chat) and asking for help.

There are also alternative ways to use an incompatible app:

*   See if there is an official (progressive) web app version of the app.
*   Some services have phone numbers you can call to interact with. (eg. Uber)
*   Try to find an _official_ version of the app on the Amazon or Huawei app store. These are unlikely to have any Google dependencies. Be careful as both stores have many fake/impostor apps.

#### Anything important I should know about microG?

*   The 'Google device registration' and 'Google SafetyNet' options WILL make microG connect to [Google servers](https://github.com/microg/GmsCore/wiki/Google-Network-Connections).
*   The 'Cloud Messaging' option WILL make microG maintain a persistent connection to [Google servers](https://github.com/microg/GmsCore/wiki/Google-Network-Connections).
*   The 'Cloud Messaging' option does NOT require a Google account.
*   The 'Google SafetyNet' option WILL download and execute proprietary obfuscated code from Google and is strongly NOT recommended.
*   While microG itself is open source, any apps talking to it will do so using the proprietary Google Play Services library.

#### How do I enable microG?

microG is NOT supported and NOT recommended, however it can work in an unprivileged fashion on AXP.OS 17.1 and higher after the July 2023 update.  
You can watch a short (100 second, 7.5MB) [video tutorial of installing and enabling microG here](/videos/tutorial-AXP.OS-enable_microg.webm).

1.  Note: microG on AXP.OS is only visible to other apps in the same profile as itself.
2.  Open system Settings, Security, and toggle on the 'microG enablement' option.
3.  Open F-Droid, Settings, Repositories, and enable the 'microG' repo. If it isn't listed you can [add it manually](https://microg.org/download.html).
4.  **IMPORTANT NOTE FOR NEXT STEP**: F-Droid will NOT suggest the latest version of microG as it is marked a beta, but that beta is mandatory. You must scroll down, expand the versions section, and manually choose it.
5.  In F-Droid search for and install the latest version of the following apps: microG Services Core, microG Services Framework Proxy, microG Companion/FakeStore.
6.  microG will now work.
7.  Tip: If you didn't flip the toggle on before installing, simply flip it on and reboot.

#### How should I configure microG?

Depending on the apps you want to use there are a few different ways you can use microG.

*   Some apps don't need microG but check that they were installed via Play, in this case you only need microG Companion/FakeStore and to install the app via `Aurora Store` (via session installer) or `Obtainium`. This mechanism only works on 18.1+ currently, adb workaround still necessary on older versions.
*   Some apps will work with microG simply installed without any Google connections, in this case it is strongly recommended to [revoke Network permission](#networkControl) from the microG app.
*   Some apps need push notifications via Google, for them you must let microG maintain a persistent identifiable connection to Google. Enable 'Google device registration' and 'Cloud Messaging' in microG.
*   Some apps require a captcha to be performed by the user, for them you can enable the 'Google SafetyNet' option.
*   Some apps require SafetyNet to work, while the option to enable it currently exists it will not work in the unprivileged mode that AXP.OS uses and will be removed in a future update.

### Networking

#### Why haven't you completely changed the default DNS servers?

Currently Quad9 is used for DNS fallback and for tethering. Switching it by default for cell would break VoLTE, SMS, MMS, and Visual Voicemail. And switching it for Wi-Fi could potentially break access to some LAN devices.

#### Should I use Private DNS?

Generally yes you should, otherwise whatever DNS server is advertised by your carrier or Wi-Fi network will be used.  
Do note however that Private DNS despite its name has limited privacy benefits (due to lack of ESNI/ECH), but does have security benefits and when combined with a DNSSEC enabled resolver will better ensure your DNS requests are not tampered with.

#### Should I use Private DNS when using a VPN/Tor?

*   If you want to use the built-in content blocker of AXP.OS with a VPN you must enable Private DNS.
*   If you use NetGuard/RethinkDNS/DNS66/Blokada or any VPN provider with a built-in content blocker you should disable Private DNS.
*   If you're using Tor via Orbot's VPN mode and want an app to access Onion Services you must disable Private DNS.
*   Otherwise you should consider what you value more: the content blocker or ensuring the VPN handles DNS.
*   In the case you do use Private DNS with Tor or a real VPN, the Private DNS host will not learn your true IP as the requests will be routed over the VPN slot.

#### How do I control network access for an app?

*   For simply blocking an app from say using mobile data, use the built-in data restrictions: App info > Mobile data & Wi-fi
*   For completely denying an app access to networking functions entirely, revoke the Network permission: App info > Permissions > Network
*   For blocking ads/trackers: that is already done via the built-in content filter and there is nothing to configure.

#### When is the content blocker enforcing?

*   Disabled by user: permissive
*   Not disabled by user: enforcing
*   No VPN used: enforcing
*   16.0+: VPN in use and Private DNS set other than Off or Automatic: enforcing
*   14.1 & 15.1: VPN in use: permissive

#### XYZ website is blocked! How do I disable the content blocker?

Settings > Security > Disable DNS content blocker > Enabled

#### How to set a stable MAC address for a specific Wi-Fi network?

Settings > Network & internet > Internet > Tap the gear next to the specific Wi-Fi network > Privacy > Use per-network randomized MAC.

#### How can I use two VPNs at once?

You cannot chain VPNs, but you can route different apps through different VPNs via the work profile feature enabled through an app like Shelter. Your main profile can have one VPN, and your work profile another. This is very useful for eg. main profile through Orbot/Tor and work profile via a trusted or self-hosted VPN.

#### Why won't my work profile use my main profile VPN?

Profiles are completely separate in that regard. You must setup your preferred VPN in the work profile too.

#### Can I route connected hotspot devices via the VPN?

Yes, you can route them via the main profile VPN. Enable this in Settings > Network & internet > Hotspot & tethering > Allow clients to use VPNs.

#### Does AXP.OS handle Tor differently?

Yes, it explicitely allows Tor apps to bypass a Tor based VPN when block connections is enabled to allow them to safely work. Supported Tor providers are Orbot, Tor VPN, and Tor Services. Supported apps are Briar, Cwtch, OnionShare, and Tor Browser.

#### Why can't I access AXP.OS.org (or other websites of the project)?

*   The primary web servers are rarely down.
*   In order to manage resource usage the divested.dev web servers block hundreds of million of IP addresses via dozens of static blocklists and dynamic log analysis via our [SCFW3](https://codeberg.org/divested/scfw3) tool.
*   Tor exit nodes are exempted.
*   Some consumer VPNs may be unintentionally blocked.
*   Enabling/using IPv6 is strongly recommended.
*   You can check your IP address reputation via the following websites:
    *   [CrowdSec CTI](https://app.crowdsec.net/cti)
    *   [VirusTotal](https://www.virustotal.com/gui/home/search)
    *   [APIVoid](https://www.apivoid.com/tools/ip-reputation-check)
    *   [Cisco Talos](https://www.talosintelligence.com/reputation_center)
    *   [Akamai](https://www.akamai.com/us/en/clientrep-lookup)
    *   [Valli MultiRBL](https://multirbl.valli.org/lookup)
    *   [Hacked IP](https://www.hackedip.org)
    *   [Internet Storm Center](https://www.dshield.org/ipinfo)
*   Additional website mirrors are listed at the footer of the webpage.
*   Additional F-Droid mirrors are listed [here](/pages/our_apps#repos).

### Freedom

#### Why are you hosting on GitHub.com and GitLab.com if they are proprietary?

Because a lot of people have existing accounts on them which reduces the barrier to entry for contributing. You are otherwise free to contribute via Codeberg or e-mail patches to us if you prefer.

#### Why are you wasting your time with Android? It's clear that Google has been slowly killing AOSP every release!

Android is a legitimately fantastic operating system and no other mobile platform has as many open source apps as it does. F-Droid as of February 2023 has over 4,000 FOSS apps!

### Other Things

#### Where can I talk to other users?

Please see the [community](/pages/community) page.


#### What VPN/email/boat rental services do you recommend?

¯\\\_(ツ)\_/¯

#### Why does AXP.OS not use the word "ROM" anywhere on its website?

AXP.OS is an aftermarket operating system with a strict set of standards it strives to achieve.  
Not a poorly documented, code over the wall, haphazardly maintained "ROM".

#### What are some misconceptions I should be aware of?

*   If you encounter a serious issue, wiping is almost never the solution.
*   In-place upgrades are supported whenever possible.
*   Wiping cache does absolutely nothing.
*   You can still install updates when the bootloader is locked.
*   `fastboot update xyz.zip` does not replace your bootloader.
*   UnifiedNlp is not required for apps to acquire location.
*   Network location providers, such as Play and UnifiedNlp, do not make GPS acquire a lock quicker.


#### Why do older branches compile quicker?

*   Older branches often have fewer 64-bit devices. This means only 32-bit code has to be compiled as opposed to 32-bit and 64-bit code.
*   Older branches have less features/apps, which means less code to compile.
*   Older branches have fewer devices that need to be compiled.
*   Older branches compile with fewer compile-time sanitizers or optimizations.

#### I want to sell devices with AXP.OS preloaded, what should I know?

Selling devices with official builds of AXP.OS installed is OKAY and within the license. Some preferred suggestions:

*   Handle the sale in good faith.
*   Do not market AXP.OS as a magic bullet of privacy and/or security.
*   Verify the GPG signature and checksums of the builds you download/install.
*   Use Extirpater + factory reset to ensure no previous user data remains.
*   Ensure the device firmware is up to date before flashing.
*   Use the AXP.OS recovery if supported.
*   Do not modify any system or firmware partitions such as /system, /vendor, or /boot.
*   Lock the bootloader if supported.
*   If the device requires a token or keyfile to unlock the bootloader, provide it to the user.
*   Leave it at the setup screen.
*   Leave the default wallpaper.
*   If you preload apps only source from the existing F-Droid repositories.

If you are not using official builds of AXP.OS:

*   Make it clear to your users that it is unofficial.
*   Use the branding variables in the scripts to rebrand it.
*   You must make your sources available to your users as per the original repositories' respective licenses. Compliance is mandatory!
*   Consider upstreaming any appropriate changes.
