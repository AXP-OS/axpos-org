---
title: "Known Issues"
type: docs
toc: true
aliases:
    - /Known-Issues
---
> [!IMPORTANT]
>
> The whole document is a markdown replacement of the original made by: [Divested Computing Group](https://web.archive.org/web/20241231213231/https://divestos.org/pages/broken), so all credits goes to them.
>
> AXP.OS used DivestOS as a base up to December 2024 (see [Divest_EOL](/Divest_EOL)) but the following still reflects the current state for AXP.OS (as of January 2025).

This page documents known problems, along with workarounds if available, for the system and apps.

# Apps

*   F-Droid will reset its database on the second start in many cases. \[upstream\]
*   To use gmail.com with the F-Droid variant of FairEmail you must use an App Password.
*   Silence will crash if first started without a SIM-card inserted. \[upstream\]
*   SMT / Fossify Gallery will fail to render images on select older devices. Disable 'deep zooming' in its settings to workaround. \[hardware limitations\]
*   Games like "Call of Duty Mobile" (CODM) might crash \[hardened_malloc\]

# System

## Not Supported

*   Adoptable Storage is NOT supported. This feature is unmaintained in AOSP and DOES NOT WORK. You WILL LOSE DATA if you use it.
*   Changing device identifiers like the IMEI is NOT supported.
*   Encryption cannot be disabled.
*   Fonts cannot be easily added to the system.
*   Google Apps or microG or Sandboxed Play Services are NOT supported.
*   Granting apps special permissions via ADB is NOT supported and can/will compromise privacy/security/reliability of your device.
*   Other WebView providers such as Bromite are not currently supported. They were briefly supported in the past but caused boot issues on 15.1 for unknown reasons.
*   Remote desktop host apps like AnyDesk and TeamViewer are not supported. They rely on special system permissions enabled by vendors signing helper apps on their behalf.
*   Removing system apps via ADB is NOT supported and will break things.
*   SELinux is always enforcing and cannot be set permissive or disabled.
*   Signature spoofing is NOT supported.
*   Torrents will not be offered for downloads/updates. They don't work well on mobile and they leak IP addresses of users.

## Notes

*   16.0 and higher will warn when running an app that is not targeting Android 9.0 API for the first time.
*   17.1 and higher will warn when running a 32-bit app for the first time on a 64-bit device. Sometimes this warning is not accurate.
*   Compiling is non-trivial and has many undocumented steps.
*   Devices using 'encryptable=footer' in their fstab will not be encrypted by default. These devices typically are unable to be encrypted on the very first boot.
*   If your device is not detected by your computer use a USB 2.0 port. If you don't have any USB 2.0 ports use a USB 2.0 hub. If that still doesn't work try another cable. Please note, it is possible in some cases that a cable will work for fastboot but not for adb and vice versa, so try another one regardless.
*   IMS/VoLTE [may or may not work](/pages/faq#volte). \[upstream? deblobber? carrier?\]
*   Incremental updates will often fail to successfully apply on non [update-engine](/pages/faq#incrementalSupport) devices. \[releasetools\]
*   It is strongly recommended to leave OEM unlocked enabled to allow for recovery if unbootable and locked.
*   Sensors Off toggle on 17.1/18.1 also turns off the camera and microphone.
*   'Storage Manager' is non-functional in some cases.
*   The ADB toggle in developer options has absolutely zero effect on whether or not you can use ADB in recovery.
*   The default password for Android encryption is `defaultpassword`.
*   The DivestOS recovery is automatically installed on supported devices each successful boot. If you externally change it, you must not boot the system to use it.
*   The 'enable native code debugging'/ptrace\_scope toggle does nothing on devices without stacked YAMA, ie. kernels before 3.10.
*   The Updater may not show very recent updates due to the server's 2 hour cache.
*   The Updater will show the currently installed update, this is expected.
*   When sideloading a final percent of 90-94% is expected and not signs of failure.
*   You can quickly access the default keyboard settings by long pressing on the comma key.
*   Etar may not have its battery management set unrestricted. It'll prompt on opening if it doesn't. When restricted it cannot provide reliable event notifications.

## Papercuts

*   On 20.0, when taking a picture from an app the confirm/retry buttons will be invisible. Tap in the bottom right to confirm/attach the image. Fixed in April 2024 update.
*   When tethering hotspot clients through the active VPN via the "Allow clients to use VPNs" option it must be noted that they will bypass the VPN if it is stopped/disabled/deactivated even with "Block connections without VPN" enabled.
*   Block encrypted devices will fail to shutdown from secure boot screen on 18.1. Force power off via power button to workaround. \[help wanted\]
*   Bluetooth phone calls may not work.
*   Bluetooth functions may not work correctly for apps installed in a work profile.
*   Captured photos may have incorrection orientation. \[various\]
*   Devices with less than 2GB of RAM \*will\* likely out-of-memory more often than usual. \[various\]
*   Devices with replaced/aftermarket screens may be incompatible with the double tap to wake feature. \[hardware\]
*   Disabling Storage Manager is strongly recommended, it may choose to delete your old files after 90 days otherwise.
*   Fingerprint readers may work inconsistently, this is usually not actually caused by DivestOS.
*   If `fastboot update` fails on identifying device you can try the force option, otherwise extract the zip and `fastboot flash` each partition manually.
*   If Seedvault is set to backup to a USB flash drive and it is later plugged in, the automatically started backup may fail. If so, you must invoke the backup manually. \[upstream\]
*   If you have banking or game apps that do not work, ensure the `Enable native code debugging` toggle is enabled in Settings > Security. Such apps use ptrace as a form of crude anti-tamper mechanism.
*   MediaProvider error toast on some boots of <=16.0. \[permission issue?\][\[tracking\]](https://gitlab.com/divested-mobile/divestos-build/-/issues/3)\[help wanted\]
*   Most devices may take up to the full 12.5 minutes to acquire a GPS lock. Locks will often be quicker, especially if recently locked. Please test using GPSTest app with \*clear\* and \*direct\* line of sky. \[deblobber\][\[link\]](https://f-droid.org/packages/com.android.gpstest.osmdroid)
*   Phone call audio is distorted sometimes until speaker phone is toggled. \[deblobber?\]
*   Recovery will not be updated on each boot on 14.1. \[upstream\]
*   Search in Trebuchet when a work profile is available may cause the view to wrongly switch.
*   The OLED screen protection mechanism may push the clock off the screen for a minute every now and then. \[help wanted\]
*   The changelog link in the Updater links to the LineageOS changelog for your device. However devices Lineage no longer compiles for don't have such a page.
*   The option to allow MMS messages when mobile data is off may cause all data to pass on some devices. Effectively making the mobile data toggle always on.
*   The secondary user logout button on the lockscreen will overlap the unlock icon on some devices. \[help wanted\]
*   Trebuchet, the launcher, on older versions will randomly enter a half-broken state where you cannot long press any apps. Force stop Trebuchet from Settings or reboot to fix. \[help wanted\]
*   TWRP (which isn't supported) often cannot decrypt/unlock /data due to it being incompatible/outdated.
*   Updater JSON parsing error on 14.1. \[upstream?\][\[tracking\]](https://gitlab.com/divested-mobile/divestos-build/-/issues/2)\[help wanted\]
*   `Wallpapers & Styles` may crash after upgrading to 20.0 from 19.1, clear it's app data to fix.
*   `Wallpapers & Styles` may not show homescreen icon previews if grid size is greater than 5x5.
*   `Wallpapers & Styles` will not show wallpaper previews if not granted `Music and audio` permission in addition to `Photos and videos` on 20.0.
*   When `Private DNS` is enabled for the system, Chromium based browsers will automatically handle DNS themself bypassing the /etc/hosts based blocking function. Disable `Secure DNS` to work around.
*   When `Private DNS` is disabled for the system, using anything in the VPN slot will likely bypass the /etc/hosts based blocking function. [Read here](/pages/faq#privateDNS) for more information.

## Bugs

*   There have been reports of new Bluetooth connections being automatically granted contacts permission even when not chosen during pairing. This may be a UI issue when the device requires a PIN to be entered, as opposed to simply confirmed, where the code defaults the permission on but the user interface shows it off. It is recommended to toggle this contacts option during pairing as a possible workaround, and confirm it is disabled after pairing. Please take extra caution if the connecting device is Internet connected such as many modern cars are. Users should also review this permission for all existing paired devices.
*   15.1 will bootloop if a pin/password/pattern is not set or is removed/unset. \[???\][\[tracking\]](https://github.com/Divested-Mobile/DivestOS-Build/issues/154)\[help wanted\]
*   Flutter-based apps may show graphical artifacting on older (msm8974 era) devices. \[help wanted\]
*   Older Unity engine games will likely crash on 16.0+ due to the hardened memory allocator. A workaround is to install the 32-bit variant of the app. \[Unity engine bug\][\[tracking\]](https://issuetracker.unity3d.com/issues/android-il2cpp-empty-project-crashes-on-launch-with-using-memoryadresses-from-more-than-16gb-of-memory-messages)
*   Select older devices running 17.1/10 or higher will fail to connect to 802.11w (optional/required) enabled Wi-Fi networks due to lack of PMF support. \[hardware\]
*   System profiles option to disable lock screen under certain scenarios can prevent the navigation bar from working. \[upstream\][\[tracking 1\]](https://gitlab.com/LineageOS/issues/android/-/issues/4434)[\[tracking 2\]](https://gitlab.com/LineageOS/issues/android/-/issues/6093)

# Devices

## apollo/thor

*   Encryption is not supported. \[upstream blobs\]

## athene

*   Wi-Fi country code MUST be set via advanced settings before connecting. Will bootloop otherwise. \[???\]
*   Using GPS causes a reboot. \[???\]
*   Encryption is not supported. \[???\]

## bacon

*   Video recording doesn't work \[???\]\[help wanted\]

## beryllium/dipper/equuleus/polaris/ursa

*   (confirmed report) Camera is non-functional. \[kernel\]\[help wanted\]

## clark

*   Camera is very slow to start and sometimes won't start at all. \[upstream\]
*   Camera can be very slow to take pictures at higher resoutions. \[???\]

## crackling

*   Mobile data doesn't work. \[hmalloc incompatibility\]\[help wanted\]

## d852

*   Sensors will not work unless you have a hybrid v220k modem which requires an a10b bootloader. \[firmware\]

## FP3

### FP3 - Bootloader lock 

{{< callout type="error" emoji="⚠️" >}}
The security of the FP3 bootloader can be considered as **broken**
{{< /callout >}}

The bootloader accepts images signed by the public available Android [testkey](https://github.com/LineageOS/android_external_avb/raw/refs/heads/lineage-20.0/test/data/testkey_rsa4096_pub.bin). This has been verified by the AXP.OS Team with the help of the community (many many thanks for all your patience during the progress Tim 😉).

That means: an attacker can replace the whole system and you won't get even a warning about that on boot (no, not even that [yellow warning](https://source.android.com/static/docs/security/images/boot_yellow1.png) screen!). To achieve this an attacker can load a malicious update e.g. using EDL (therefor requires physical access).

Once AXP.OS has been flashed **ADB** sideloading (so not using EDL) such a package would fail though - as long as you haven't replaced the [recovery](https://axpos.org/docs/guides/installation/recoveries/#official-axpos-recovery) by e.g. TWRP. Same applies to OTA updates as these will be verified using the AXP.OS key only.

_Note: It has not been tested if you can sideload a testkey signed update via ADB/OTA on stock FP OS._

## FP4

*   Do **NOT** attempt to lock the bootloader if `fastboot flashing get_unlock_ability` returns zero or else it will brick. EDL access is not available on this device and you will have to send it in for service. \[upstream\][\[forum thread\]](https://forum.fairphone.com/t/trapped-in-fastboot-mode-with-locked-bootloader-and-corrupted-custom-rom/80985)

## d850/d851/d852/d855/f400/ls990/vs985/G3

*   Wi-Fi tethering may not work. \[???\]\[help wanted\]
*   Bluetooth likely won't start due to missing MAC address. \[hwaddrs selinux? /misc corrupt?\]\[help wanted\]
*   Device will often fail on reboot and become unresponsive, requiring the battery to be pulled. \[hardware\]

## h830/h850/rs988/G5/G6/V20

*   20.0 does not support encryption due to limitations. \[upstream\]
*   Bluetooth maybe won't start due to missing MAC address. \[hwaddrs selinux? /misc corrupt?\]\[help wanted\]
*   (unconfirmed) NFC doesn't work. \[???\]
*   (unconfirmed) GPS doesn't work. \[???\]
*   (unconfirmed) Torch doesn't work. \[???\]

## davinci

*   Wi-Fi does not work under 20.0. \[???\]\[help wanted\]
*   FM radio causes reboot on headphone plug/unplug, app can be disabled as workaround. \[???\]\[help wanted\]

## enchilada/fajita

*   On select devices Wi-Fi may be very broken. \[hardware?\][\[upstream tracking\]](https://gitlab.com/LineageOS/issues/android/-/issues/4667)

## guacamole\*/hotdog\*

*   (reported) Occasional bouts of rapid battery drain. \[???\]
*   (reported) Having fingerprints registered can cause the sensor to trigger at random causing the screen to flicker green. \[???\]
*   (reported) Automatic brightness may not be available. \[???\]
*   (reported) Charge history may not be available. \[???\]
*   Second SIM non-functional. \[disabled, some variants lack the necessary firmware\]
*   While it was possible in [earlier firmware releases](https://calyxos.org/news/2022/07/06/oneplus-android-12-relock-issue/) they (OnePlus/OPPO) half-removed the ability to re-lock the bootloader. That means: you can still flash a custom AVB key but it will not get respected anymore. The mentioned steps in that linked blog post have all been tested by me and none of them are either working or sufficient. AXP.OS comes with the latest firmware and so cannot be locked anymore.


## lemonade\*

*   (reported) Automatic brightness may not be available. \[???\]

## flox

*   Device powers off after sleeping for an unknown time. \[???\]

## grouper

*   Camera is non-functional. \[upstream kernel\]
*   Device is extremely slow. \[hardware?\]
*   Relocking bootloader with an AOSP/Lineage/DivestOS recovery flashed will result in a \*permanent hard brick\* unless you have acquired your NvFlash recovery token! \[bootloader\][\[guide\]](https://web.archive.org/web/20171225183216/http://www.androidroot.mobi/pages/guides/tegra3-guide-nvflash-jellybean/)

## hammerhead

*   15.1: Wi-Fi tethering doesn't work. \[???\]\[help wanted\]
*   16.0: Camera, Bluetooth, and Wi-Fi tethering doesn't work. \[???\]

## herolte/hero2lte/S7

*   (reported) bootloops. \[???\][\[report\]](https://forum.f-droid.org/t/divestos-an-aftermarket-system/10105/62)\[help wanted\]

## i9300/i9305/S3

*   Web browsers and other complex apps fail to open at all or may open and then later crash. \[kernel? memory?\]\[help wanted\]
*   USB MTP is likely not functioning. \[SELinux?\]\[help wanted\]
*   NFC is likely not functioning. \[SELinux?\]\[help wanted\]
*   (reported) SIM card detection issues. Likely fixed in 2021-06 build. \[SELinux\][\[report\]](https://github.com/divestos/divestos/issues/1)\[help wanted\]

## lavender and maybe jasmine\_sprout/platina/twolip/wayne/whyred

*   Do NOT use `fastboot update` on lavender or jasmine\_sprout, it has been reported to brick.
*   Recovery doesn't update on system update due to missing install-recovery.sh. \[upstream\]\[help wanted\]

## kccat6/lentislte

*   Sideload doesn't work in recovery, use TWRP instead. \[help wanted\][\[tracking\]](https://github.com/Divested-Mobile/DivestOS-Build/issues/190)

## klte and maybe hlte

* SD cards might fail to mount or format. \[vold + selinux?\]
* USB ADB only works when MTP mode isn't set. \[FunctionFS corruption?\]
* Fingerprint sensor does not work [deblobber?!]

## m8/m8d

*   Recovery doesn't boot, use TWRP instead. \[???\]\[upstream\]
*   FM radio doesn't work. \[???\]\[upstream\]
*   IR blaster doesn't work. \[???\]\[upstream\]

## maguro/toro/toroplus

*   Not encrypted by default. \[OMAP SMC limitation\]
*   Camera unavailable until reboot occasionally. \[ducati cma issues?\]

## mako

*   /system needs to be resized to fit 17.1 or higher. \[too small partition\]
*   Will fail to boot on first boot. Force off once after 3 minutes. Likely fixed in 2022-01 builds. \[modem subsystem service startup failure with forceencrypt\]

## mata

*   Images will often fail to install via recovery. \[fstab /vendor/firmware\_mnt\]\[help wanted\]
*   Speaker phone volume cannot be changed from maximum.

## harpia/merlin/osprey/surnia

*   Recovery doesn't boot, use TWRP instead. \[defconfig?\]\[help wanted\]

## nex/n900

*   Camera is non-functional. \[upstream blobs?\]
*   Encryption is not supported. \[upstream device tree?\]
*   GPS is non-functional. \[deblobber\]

## cheeseburger/dumpling

*   20.0 won't automatically update the recovery. \[selinux?\][\[tracking\]](https://gitlab.com/divested-mobile/divestos-build/-/issues/24)\[help wanted\]

## pioneer

*   19.1 and 20.0 stopped booting after the September update. \[???\]\[help wanted\]

## pro1x

*   (reported) Fingerprint reader doesn't work. \[???\]

## sargo

- charge control is not supported ([ref1](https://github.com/AXP-OS/android_device_google_bonito/commit/443a410a5b4099dee766abe2bdda8b9c17c492af), [ref2](https://github.com/AXP-OS/android_device_google_bonito/commit/d9bd9565b6f514e9df5b35df6b0dd464d18ad36f))

## star\*lte

*   Uses the stock /vendor partition, making many of the deblobber benefits unavailable. \[upstream\]

## taimen/walleye

*   (reported) APN persistence issues. \[???\]
*   (reported) SIM detection issues. \[???\]\[upstream\]

## vayu

*   Wi-Fi does not work under 20.0. \[???\]\[help wanted\]

