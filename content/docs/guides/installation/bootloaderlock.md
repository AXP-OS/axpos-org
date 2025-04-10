---
title: "Bootloader Lock"
type: docs
toc: true
aliases:
    - /Bootloader-Lock
---
Yes you read correctly: some devices can lock their bootloader again _(check your device's overview table "Relockable")_! 

... so why should you?

## Sensible?

**The very first question is:**

Are there _Low-Level recovery / "unbrick" tools_ for your device available? See [Known Low-Level recovery tools](#known-low-level-recovery-tools).

If your device has one (e.g. many if not all QualComm devices) then anything you can do is (almost) useless or "just" makes it a bit _harder_ for a **serious** attacker but will not avoid it completely.

So what is the practical risk of such low-level recovery tools?

If the attacker has physical access: every writable partition can be tampered with, even when your bootloader is **locked**!

Will you notice it? Not if he is good. That means if he flashes in this mode malicious code and ensures the vbmeta (VerifiedBoot) gets updated as well even VerifiedBoot won't help you out here.

Still locking the bootloader on such devices:
1. will avoid quick `fastboot boot / flash` attacks
1. will limit the attacking vector to a low-recovery tool (which often requires time to access and/or even shorten pins on the mainboard)
1. will not help much if your phone gets lost or stolen
1. will make it a little more difficult for hobby attackers

In any case you are _strongly_ advised to use a **secure PIN/password** to prevent access to your data.

You wonder why there are **no** Low-Level recovery tools available for Google Pixel devices? This might be one of the reasons - even though they have such tools internally for sure.

## Going further

All AXP.OS builds **force encrypt** your userdata partition so as long as:

1. you set a **secure** PIN/password
1. **and** the build enforces **[VerifiedBoot](https://source.android.com/docs/security/features/verifiedboot/verified-boot)** _(check your device's overview table: "VerfiedBoot")_
1. **and** there are no [Known Low-Level recovery tools](#known-low-level-recovery-tools) (e.g. EDL/QDL mode) available

then you are already in _good_ safety.

There are 2 scenarios why locking the bootloader **still** enhances your security:

1. your phone gets lost or stolen
1. you leave your phone unattended at a public spot

Not **all** partitions are part of [VerifiedBoot](https://source.android.com/docs/security/features/verifiedboot/verified-boot). That means if an attacker has physical access to your device and its bootloader is unlocked he can flash in 10 seconds malicious code into such a partition and you won't even notice it. It also makes the device more exploitable especially in case 1 above when time does not matter (e.g. LG devices could be exploited by a complete unexciting and inconspicuous partition at that time). 

Locking the bootloader ensures that this is no longer possible.

If your device's build does **not** support [VerifiedBoot](https://source.android.com/docs/security/features/verifiedboot/verified-boot) it is highly recommended to lock your bootloader whenever possible.

In any case you are _strongly_ advised to use a **secure PIN/password** to prevent access to your data for cases not covered by the above.


# Checklist: is bootloader lock for you?!

If you answer anyone - even just 1 - of the following with YES - then **KEEP AWAY FROM LOCKING your bootloader**!

1. I want to remove (not just disable) system apps
1. I want to add / convert apps into system apps (e.g. Titanium Backup offers such an option)
1. I want to update Magisk to the latest version
1. I want to change init scripts, XMLs or anything else within system/, product/ etc partitions
1. I want to use an ad-blocker which modifies the "hosts" file (system partition - using the magisk module works fine though!)
1. I want to install another recovery then the one coming with AXP.OS
1. I want to flash GApps (THIS WILL **NOT** WORK ANYWAYS! AXP.OS comes with microG included)
1. I want to flash anything else in recovery which modifies: boot, recovery, system or any other partition then userdata

Do you have answered at least 1 of the above with YES ? Then do **NOT** lock your bootloader. **It WILL brick your device if you try**.

if you can live with the above - **GO GO GO** :)

# Lock your bootloader!

## Downloads

First of all you need the AVB key for your device: [here](https://github.com/sfX-android/update_verifier)

## Backup!

backup all your data. I am serious -> EVERYTHING. Your userdata partition will be **FORMATTED** during the lock process and there is no way around. so use e.g. NeoBackup or any other you trust. It will not hurt also having a TWRP backup - just for the case..

## boot recovery

1. flash AXP.OS
1. reboot to the bootloader / fastboot
1. _note: if you ever flashed a **factory** image (pixel device) you can skip the following 2 steps_
   1. type: `fastboot erase avb_custom_key`
   1. type: `fastboot flash avb_custom_key <device>_AXP.OS_avb_pkmd.bin` (which is the file you downloaded earlier)
1. type: `fastboot oem lock`  or: `fastboot flashing lock`
1. approve locking the bootloader on the phone's screen
1. `< take a deeeeeeep breath >`
1. on some devices recovery will load and format userdata automatically
1. if not: choose factory reset -> format(!) data (there is no way around)
1. boot Android -> you will likely see a new bootloader message warning that you have a custom OS installed - but it will load
   1. if you see an ID string like "`ID: aabbcc112ddd...`" verify it against the one in the installation guide
1. congrats! you now running on a locked bootloader + AXP.OS
1. start the Magisk app (requires internet), accept the install request and open the magisk app afterwards and let it reboot when asked
1. enjoooooy :)

# Locked - now what?

## OEM unlock option

> [!IMPORTANT]
> :bell: _Note: the following was possible in builds made before 2024-12-16. The toggle has been removed because people still used it regardless of any warnings._ :bell:
>
> _Even though it is possible to bypass that removal (as AXP.OS comes rooted by default) it is (still) strongly recommended **not touching** it. Really **keep your hands off**._

***

The above locking process does not mention an additional possible step: _disabling OEM unlock in developer options_. For a reason. You _can_ uncheck that option now that all is running fine **but** you do **NOT** get any more security win **or any other (real) benefit**! On the other site deactivating this will close the door to unbrick your device when in trouble!

If you keep it checked an attacker is able to unlock your device in fastboot - but it WILL _**format the encryption keys + wipe your data**_ when doing so. That means: **there is no way to access your data anyways**. So simply keep it **enabled**, you can sleep well doing so!

If you **_really_** want to avoid even that then uncheck OEM unlock in developer settings (_see note above. removed in builds since 2024-12-16_) as well but then a brick will require _low-level recovery tools_ to bring your device back to life in case of a brick.

The problem: **such low-level recovery tools are not available for all devices!!**

*) see also: [Bricked O_o](#bricked-o_o)

### TL;DR: do NOT(!!) disable OEM unlock

{{< callout type="error" >}}
there is ZERO security or any other benefit in doing so<br/>
it can even turn your device into a paperweight - i.e in an IRREVERSIBLE way*
{{< /callout >}}


*) see also: [Bricked O_o](#bricked-o_o)

## Magisk

I recommend to disable _automatic update checking_ within magisk settings - remember: when flashing a newer version of magisk it WILL brick your device. you have to wait for me updating it within AXP.

Almost everything you do within Magisk can EASILY BRICK your device, e.g. installing a magisk module which tampers your system partition: **BRICK**. So really really check if a module touches anything mentioned in the above checklist topic.

You can use all standard root functions, magisk hide, zygisk, systemless-hosts-list, deny-lists and even re-pack the magisk app without a problem though.

## Bricked O_o

Always keep an eye on the above "Checklist" topic! If you change/do something mentioned there you will brick your device with a snap of a finger.

### bootloader locked/unlocked & OEM unlock=ON (default)

Android does not boot anymore (e.g. because you installed a "bad" Magisk module or changed something within the protected partitions):

1. boot recovery
1. flash the current AXP.OS version (`adb sideload ...`) or a later release and reboot

Recovery does not load bc you flashed another recovery:

1. wait for the next OTA and it will be fixed automatically
1. or if you do not want to wait:
    - boot into fastboot
    - _if bl is locked:_ unlock (_**note: this will wipe all your data!**_) 
    - flash AXP.OS
    - _optional/depends on device:_ re-lock the bootloader again

Any other bricks:

1. boot into fastboot
1. _if bl is locked:_ unlock the bootloader (_**note: this will wipe all your data!**_)
1. flash AXP.OS again (follow the regular install guide for your device)

### bootloader locked & OEM unlock=DISABLED

While it is possible to disable OEM unlock in Android settings it is not recommended. See the above topic: _OEM unlock option_ for details. Also there are situations where you cannot unlock your bootloader even though you have not disabled this option. In both cases read on.

#### non-A/B device

1. use a low-level recovery tool* to flash a STOCK image (_be sure to use the same Android version though to make things easier for the next steps and avoid barriers like ARB etc_)
1. if there is no low-level recovery tool: buy a new phone

#### A/B device

1. first thing to try: force power off (us the specific key combo, usually power+voldown or volup or take out the battery if removable)
1. now wait 2 min
1. now let it bootloop 7 times 
1. it should switch to the other slot and **_might_** boot (depends on what _exactly_ caused the brick)
1. use a low-level recovery tool* to flash a STOCK image (_be sure to use the same Android version though to make things easier for the next steps and avoid barriers like ARB etc_)
1. if there is no low-level recovery tool: buy a new phone

*) _some devices (e.g. OnePlus, LG, ..) have a so called _EDL/QDL mode_ which can unbrick a device no matter what. actually these are almost impossible to hard-brick. Google Pixels on the other site do **not** have such a mode and so will be for sure gone forever if that happens._

_Examples for those tools:_

### Known Low-Level recovery tools

- bkerler [EDL tool](https://github.com/bkerler/edl)
- Oneplus MSM tool (e.g. for: [fajita](https://xdaforums.com/t/op6t-latest-10-3-8-collection-of-unbrick-tools.3914746/) or [hotdog](https://xdaforums.com/t/op7tpro-oos-hd01aa-hd01ba-unbrick-tool-to-restore-your-device-to-oxygenos.4002909/))
- LG QFIL tool (e.g. for: [H815](https://xdaforums.com/t/guide-proper-h815-unbrick-through-qfil-files-included.3709212/))
- Samsung [Heimdall tool](https://github.com/Benjamin-Dobell/Heimdall) (included in [mAid Linux](https://maid.binbash.rocks/))
- Google Pixels: N/A
