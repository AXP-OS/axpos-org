---
title: "AXP.OS"
type: docs
toc: true
aliases:
    - /Setup
---
## _Pro_ flavor only

### Setup Magisk

1. see [First-time](https://github.com/sfX-android/android_vendor_extendrom/wiki/FAQ#magisk-app-not-installed) setup
1. and [additional-setup](https://github.com/sfX-android/android_vendor_extendrom/wiki/FAQ#magisk-requires-additional-setup-on-start) message
1. follow [this advice](/docs/guides/installation/bootloaderlock/#magisk) (if you locked your bootloader)
1. when using apps detecting root (e.g. banking apps) follow this [guide](/hide-root)

### Exclude apps from updating

Some parts within AXP.OS are baked in and cannot / should not be touched at all. These are:

- *Google Play* (disabling it is totally fine though, see [here](#google-play-store-regular-flavor))
- *Google Play Services*
- *Magisk*

### when your bootloader is locked

additionally to the above do not touch these when your bootloader is [locked](/Bootloader-Lock):

- *microG Services*
- *microG Services Framework*
- *Magisk*

Ensure you set these on the ignore list for F-Droid and Aurora (see next topics).

## _Pro_ and _Slim_ flavor

### Setup Aurora

Aurora comes with the corresponding Aurora Service:

1. In the app drawer choose Aurora Services
1. touch "Permissions"
1. grant access
1. open Aurora
1. follow the initial config wizard and grant permission as requested
1. once logged in (anonymous or real) choose "Blacklist manager" from the left menu
1. select the apps from the [above list](#exclude-apps-from-updating)
1. Recommended: In "Updates" choose "Do not auto-update apps". This avoids that you install apps automatically which MUST be installed via Play Store. If you are 100% sure you do not or if you simply do not use Google Play its totally safe setting it to auto-update of course

While on it keep an eye on the [Fix stubborn apps](/docs/guides/fixstubborn) topic as this is something you might run into as well when using some apps.

### Setup F-Droid

1. Settings -> Repositories
1. Enable those you want, at least "DivestOS Official" should be kept enabled
1. Move (long press, drag&drop) the "DivestOS Official" repo at top! Otherwise you will not get current updates for Mull/Mulch etc
1. Settings -> "Manage installed apps" and search for any of the apps from the [above list](#exclude-apps-from-updating):
   - when selected an app use the 3 dot menu from top right
   - select "Ignore all updates"
   - repeat that step for all the mentioned apps

While on it keep an eye on the [Fix stubborn apps](/docs/guides/fixstubborn) topic as this is something you might run into as well when using some apps.

### Setup external MicroSD card

If your device supports an external sdcard you might get prompted to choose how to use it, either as portable storage or adoptable to extend your internal storage. While the latter sounds promising it is totally unsupported and not maintained anymore.

Things which can happen when using adoptable storage (non-exclusive list):
- App icons disappear
- whole apps disappear
- boot loops
- you can LOOSE DATA!

TL;DR
- set it up as **portable** storage

### Recommended Apps

A personal excerpt of recommended apps:

1. Keyboard - FlorisBoard ([F-Droid](https://f-droid.org/packages/dev.patrickgold.florisboard))
1. Speech2Text - Say Board ([F-Droid](https://f-droid.org/packages/com.elishaazaria.sayboard/))
1. SmartWatch etc - GadgetBridge ([F-Droid](https://f-droid.org/packages/nodomain.freeyourgadget.gadgetbridge/))

For the rest checkout: [Recommended Apps](/docs/knowledge/faq/#can-you-recommend-any-apps)

### Optional: Activate Google support

The _Pro_ flavor of AXP.OS comes with [microG](https://microg.org/) included, as well with the Google Play store (internal name "Phonesky") but **both are not activated by default** (this exactly wanted that way, leaving the choice to the user).

If you are using the _Slim_ flavor you can install microG on your own though. Just keep in mind that you **can NOT lock the bootloader** in this case!

For both flavors you need to follow some simple steps in order to *activate* it in AXP.OS.

The very first step: 

#### Global signature spoofing toggle

AXP.OS comes with an [extendrom feature](https://github.com/sfX-android/android_vendor_extendrom/wiki/Signature-spoofing-support) which requires to globally switch signature spoofing on first. 

If the required toggle is **not** enabled or **disabled later** signature spoofing will be denied - even when you have it allowed for an app before.

1. Enable [Developer Options](https://developer.android.com/studio/debug/dev-options#enable)
2. Enable signature spoofing for microG:

![ttps://github.com/sfX-android/android_vendor_extendrom/raw/main/wiki/sigspoof/](https://github.com/sfX-android/android_vendor_extendrom/raw/main/wiki/sigspoof/01-devoption-onoff.png)

From now on all apps which requests signature spoofing will PROMPT you and you can decide on a per-app base to allow or deny it.

This means the app must explicitly requests signature spoofing and you might need to do that step manually for apps which don't (like the Google Play store).

#### Google Play store (Pro flavor)

If you do **not** want to use any google service simply **disable** the Google Play app and do not enable Signature spoofing support for Google Play. If you **want** to use it, read on.

##### Play Store Service handling by microG

There is also a quite new option within microG settings named "Play Store services" which allows to handle:

- Answer license verification request
- Google Play billing

This might or might not work for your apps. So before enabling Google Play this might be worth a try?!

##### Fake Store / Native Play Store

If the above does not work for you or you do not trust its state of implementation (as said its quite new) you can use the native Play Store.

The AXP.OS-_Pro_ flavor comes with a patched Google Play store based on the great work of [Nanolx](https://gitlab.com/Nanolx/microg-phonesky-iap-support) but [greatly enhanced](https://github.com/AXP-OS/packages_apps_phonesky) to support more recent Android versions, latest Play store release and more bug-free (i.e. no crashes).

1. Ensure signature spoofing is enabled in developer options (see above)
1. Find the Google Play store in the app drawer, long press it and open the (i) - "App info" screen
1. open `Permissions ->  Spoof package signature` and switch from `Don't allow` to `Allow`:

![https://github.com/sfX-android/android_vendor_extendrom/raw/main/wiki/sigspoof/](https://github.com/sfX-android/android_vendor_extendrom/raw/main/wiki/sigspoof/07-app-permission-manual-enablement.png)

_You can disable/enable spoofing support or the app itself at any time later (if your apps do not run any licence checks in the background to function properly..)._

4. disable Play protect (`start Google Play -> 3 dots at top right -> Play protect -> settings wheel -> untick "Scan apps with Play Protect"`)
5. **Next:** follow the microG topic otherwise Google Play won't even start/work properly.

#### microG 

microG simulates and implements the existence of the Google framework required to use e.g. the Google Maps API or receiving Push notifications. If you want to use the Google Play store and/or use apps which need to communicate with the Google API's you have to configure microG as follows:

1. Ensure signature spoofing is enabled in developer options (see above)
1. open the `microG settings app -> Self-Check`:
   - touch `System grants signature spoofing permission` -> you get a prompt to allow signature spoofing, if not see: ¹
   - scroll down and touch the permissions of your choice to enable them
1. Google Play requires this, otherwise it will not work properly:
   - `Google device registration->On`
1. In order to make Push notifications work enable:
   - `Cloud Messaging->On`
   - Recommended: `Advanced->Confirm new apps` (ensure you set the Permission in Self-Check: `This app can appear on top of other apps->On`)

Now you're set and Push notifications and all other supported microG features should work (take a look at the [FAQ](/FAQ) for any issues).

Some apps require you to be installed by the google play store to work properly but no worries: you can simply deactivate the play store as soon as you are finished (depends on the app, e.g. if the app checks a license you might need to keep it enabled)!

- ¹) If you do not get a prompt (should happen for the _Slim_ flavor only):
   1. Ensure signature spoofing is enabled in developer options (see above)
   1. Find the _microG services app_ in the app drawer, long press it and open the `App info` screen
   1. open `Permissions ->  Spoof package signature` and switch from `Don't allow` to `Allow`

### Post Install

Follow the post install steps mentioned [here](/post-install)

