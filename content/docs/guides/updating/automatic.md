---
title: Automatic
type: docs
toc: true
aliases:
    - /Over-the-air
---
> [!TIP]
> This is the recommended way for installing AXP.OS updates
>
> The process of an OTA update will include validating (i.e. verifying the signature / ZIP integrity) of the downloaded file before it offers to actually _start_ an installation.

All AXP.OS devices support OTA ([Over The Air](https://source.android.com/docs/core/ota)) updates so there is no need for manually downloading / flashing once you have AXP.OS running. In case of trouble you can also use one of the [manual](/docs/updating/manual) update methods though.

_Updates via OTA or adb sideload will keep all your data and self-installed apps._

Here the major steps for updating your system:

1. always watch the [Changelog](/Changelog) page for important hints and news for your device
1. always watch the [automation channel](/docs/overview), too - major impacts will be announced here first
1. if you don't want to wait for the regular updater check, open `Android Settings -> Updater -> Press the circled arrow to check for updates`

_Regular_ flavor users (not needed when using the _Slim_ flavor):

3. {{< callout type="warning" >}}before actually _installing_ (on non-A/B devices) or at latest before _rebooting_ (on A/B devices) you should **unhide** Magisk if it is currently hidden!* {{< /callout >}}
4. in any case ensure you understood the [Magisk hints](https://github.com/sfX-android/android_vendor_extendrom/wiki/FAQ#magisk-requires-additional-setup-on-start) _(even when not using the hide Magisk app functionality)_


{{< callout type="info" >}}
*) If you miss unhiding Magisk is possible that the Magisk icon disappears after the update.

If that happens:
1. try a reboot
1. if it still does not show up: ensure you remove any leftovers of the previously hidden Magisk (i.e open the App drawer and search for your previously chosen Magisk app name)
1. then install the [official Magisk apk](https://github.com/topjohnwu/Magisk/releases) and hide it again. When downloading Magisk it is recommended to use the latest version as written in the Changelog and **not** simply the latest one available!
 
Do **not (i.e. NEVER EVER)** INSTALL Magisk via the "Install" button! Just the apk is enough. Anything else can lead into a non-booting system. See also this important [hints](https://github.com/sfX-android/android_vendor_extendrom/wiki/FAQ#magisk-requires-additional-setup-on-start).
{{< /callout >}}

## Steps

1. Read the [Changelog](/devices/changelogs)!
1. Keep an eye on the [Automation channel](/docs/overview)
1. Always do a [Backup](/docs/guides/backuprestore)!
1. Using Magisk hide? un-do this before upgrading
1. `Android settings -> System -> Updater`
1. Follow the process

On **A/B devices** the upgrade will happen in the _background_ and you get informed when a reboot is required.<br/>
On **non A/B devices** the device will just prepare the installation and **immediately reboot** afterwards to upgrade within the _recovery_ instead.

While it is much more convenient to use the background OTA process on A/B devices it takes quite longer (depends on device + installed apps), i.e it can easily take 20-60 mins to complete before you see the reboot prompt!

If you are in hurry you can do an upgrade in [recovery](/docs/guides/updating/manual/#via-adb--recovery) as this will be much faster - while it requires a PC to sideload the package.
