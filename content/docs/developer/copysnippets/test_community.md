---
title: "Test: community"
type: docs
toc: true
aliases:
    - /qa
    - /test
---
## AXP.OS test build info

```
A test build has been released :tada: !

Check it out here:
- [download](https://leech.binbash.rocks:8008/axp-unstable/)

Installation guide:
- [here](https://axpos.org/devices/xxxx/yyyy/)

## YOUR feedback is required:

1. copy the following snippet: [Quality Control Checklist](https://axpos.org/docs/developer/copysnippets/test_community/#axpos-quality-control-checklist)
2. add a new comment with that snippet as content
3. save it
4. go through the list and tick each item you have tested

when having any questions pls just ask in the [Matrix Bring-Up room](https://axpos.org/docs/overview/#support)
```

## AXP.OS test issue template

```
2025-MM-05.1: UNSTABLE builds testing process
```

```
Hey guys,

according to the [device requirements](https://axpos.org/docs/knowledge/requirements/#build--test), **all new builds** for devices with community-level support must be tested by the community before they are considered _stable_ (and therefore will be moved to the stable update channel).

## Step 1 - Check readiness first!

Check the `Build & test states` table, column `test result`:

If you find the "awaiting test results" icons: 📝👷 **then its your turn**! Do **not** start testing before you see this.

If you see these or got a notification go on with step 2.

⚠️ _Even though there might be test builds already available via the Updater / on the leech server you should wait until you see these icons or get a notification that a build is ready_

## Step 2 - Download the latest build

`Android Settings -> Updater -> 3-dots-menu -> Preferences -> Server Choice -> "UNSTABLE"`

Then touch the update button and you can download & install the latest unstable test build as described in the [update guide](https://axpos.org/docs/guides/updating/automatic/) _(take care when using the **Pro** flavor + Magisk **hide** which is all covered in the linked guide as well)_.

## Step 3 - Test

> [!TIP]
> _Did you know? There is also a small Video Guide available which describes the next steps: [here](https://axpos.org/docs/developer/copysnippets/test_community/#howto-use-the-qa-checklist)_

Grab the latest [checklist version](https://axpos.org/docs/developer/copysnippets/test_community/#axpos-quality-control-checklist) and **comment on this issue with your result**:

1. copy the linked checklist
2. paste it as a comment here and adjust the codename & flavor
3. just save it as it is now
4. after saving do not edit the comment, just tick the check boxes according to your test result*
5. attach requested files/screenshots to your comment where necessary

ℹ️ _once you saved the whole checklist (must be saved, so not in edit mode) you can simply toggle the checkboxes by a mouse click. if you want to go through the list without saving before you can also simply add an `x` between the `[ ]` brackets like `- [x] abcabc` which then will also enable the box_

Fill out as much as possible but all topics marked as **MUST succeed** are mandatory.

If you have any questions use the [Matrix Support chat](https://axpos.org/docs/overview/#1-matrix-chat-_recommended_) and post in the `AXP.OS - Release Tests` room.

Keep in mind that devices not receiving test results by the community get [removed](https://axpos.org/docs/knowledge/requirements/#removals) from the supported list.

### special notes

- **bootloader lock** is passed: _when it is already locked and it is still booting after the update_
- **MicroG on _Slim_** is passed: _when it is still installed and still working (i.e. no uninstall+install required)_


## Happy testing and many THANKS for your contribution! 🎉

🆘 : No tester known or available! these builds **will not receive any further updates** if no one participates in testing!
✅ : finished successfully
🛠️ : work in progress
⏸️ : on-hold / paused (usually this means a previous task hasn't finished yet)
📝👷 : awaiting test results by the community

## Build & test states

| codename | flavor | build ready | test result | released to stable | community tester|build|
| --- | --- | :---: | :---: | :---: | :---: | --- |
| enchilada | _Pro_  | 🛠️ | ⏸️ | ⏸️ | @SerYo | [WIP](https://leech.binbash.rocks:8008/axp-unstable/AXP.OS-20.0-20250702-SLIM-enchilada.zip) |
| enchilada | _Slim_  | 🛠️ | ⏸️ | ⏸️ |@rocky-184 | [WIP](https://leech.binbash.rocks:8008/axp-unstable/AXP.OS-20.0-20250702-SLIM-enchilada.zip) |
| FP3            | _Slim_  |🛠️ | ⏸️ | ⏸️ | @tial |[WIP](https://leech.binbash.rocks:8008/axp-unstable/AXP.OS-20.0-20250704-SLIM-FP3.zip)|
| FP4            | _Slim_  |🛠️ | ⏸️ | ⏸️ | @snupeli @kujawek |[WIP](https://leech.binbash.rocks:8008/axp-unstable/AXP.OS-20.0-20250703-SLIM-FP4.zip)|
| klte            | _Pro_   |🛠️| ⏸️ | ⏸️ | @jschroeter-user @duven87 @SerYo |[WIP](https://leech.binbash.rocks:8008/axp-unstable/AXP.OS-18.1-20250705-dos-klte.zip)|
| klte            | _Slim_  |🛠️ | ⏸️ | ⏸️ | @kilou78 @CueHD |[WIP](https://leech.binbash.rocks:8008/axp-slim/klte/AXP.OS-18.1-20250705-SLIM-klte.zip)|
| oriole        | _Slim_  |🛠️ |⏸️ | ⏸️ | @SerYo |[WIP](https://leech.binbash.rocks:8008/axp-unstable/AXP.OS-20.0-20250530-SLIM-oriole.zip)|
| sargo        | _Pro_   |🛠️ | ⏸️ | ⏸️ | @BerTranD |[WIP](https://leech.binbash.rocks:8008/axp-unstable/AXP.OS-20.0-20250702-dos-sargo.zip)|
| sargo        | _Slim_  |🛠️| ⏸️ | ⏸️ | @Confined5290 @cam | [WIP](https://leech.binbash.rocks:8008/axp-unstable/AXP.OS-20.0-20250702-SLIM-sargo.zip) |
| sunfish     | _Slim_  |🛠️ | ⏸️ | ⏸️ | @SerYo |[WIP](https://leech.binbash.rocks:8008/axp-unstable/AXP.OS-20.0-20250702-SLIM-sunfish.zip)|

### marked for removal

None 🎉

### community tester

1. let me know if you want to be added/removed from that list
2. the more testers the better, so even if you see a user already attached to a device and still want to help: pls do so!

```


## AXP.OS Quality Control Checklist

```
_Note: The use of `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`, `SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` is per the IETF standard defined in [RFC2119](https://www.rfc-editor.org/rfc/rfc2119.html)._

## Device

- codename: <! FILL-IN !>
- flavor: <! FILL-IN !>

### AXP.OS - Core features

_Major tests which MUST succeed for any flavor_

- [ ] **current ASB patch - System** (`Android Settings -> Info/About Phone -> Android Version (touch it to open)` must be [on expected version](https://axpos.org/Changelog))
- [ ] **current ASB patch - Kernel** (`Android Settings -> Info/About Phone -> Android Version (touch it to open) -> Kernel version -> build date` must be current. Kernel version must have `-pXXX` inside the version string)
- [ ] paste a **screenshot** of the Android version screen (must show `AXP.OS version, Android security update, Kernel version`)
- [ ] **SELinux enforced** (`Android Settings -> Privacy -> Trust`)
- [ ] **Encryption is auto-enabled** (`Android Settings -> Privacy -> Trust`)
- [ ] **signature spoofing support** (see Enable [Google Support](https://axpos.org/docs/guides/setup/aos/#optional-activate-google-support))
- [ ] **F-Droid** included and [on expected version](https://axpos.org/Changelog)
- [ ] **OpenEUICC** app included for devices supporting euicc ([Enable eSIM](https://axpos.org/docs/knowledge/faq/#esim-management-if-supported-by-device))
- [ ] **AuroraStore** App included and [on expected version](https://axpos.org/Changelog)
- [ ] **AOSmium WebView** installed (`Developer Options -> WebView implementation` -> verify it is selected)
- **AOSmium WebView** quick test: `AuroraStore -> search & install "Webview test"` ([link](https://play.google.com/store/search?q=webview+test&c=apps))
    - [ ] Open Webview test app & check `Webview Info` (hamburger menu), it should display the version in the [AXP.OS Changelog](https://axpos.org/Changelog)
    - [ ] click on the Globe icon or open the menu and choose `Webview` _(if no input popup appears click the globe icon at the top)_
    - [ ] enter any url and test if it opens
- [ ] **OTA update** (`Android Settings -> Updater -> 3dots -> Preferences -> Server Choice -> "UNSTABLE"`)
- [ ] **Developer options**: `OEM unlock` option is **NOT** shown in developer options
- **Call recording option**: follow the [guide](https://axpos.org/r) to find & enable it
    - [ ] it must be possible to set & unset the toggle
    - [ ] if possible: test the call recording
- [ ] **locking the bootloader**: on supported devices (see the [device page](https://axpos.org/devices))

#### AXP.OS - Pro tests

_Secondary tests which MUST succeed when the flavor you are testing is: Pro_

- [ ] **Pre-rooted** (`Magisk App -> "Magisk" must be shown as "installed"`) and [on expected version](https://axpos.org/Changelog)
- [ ] **MicroG included** (`microG Settings -> Selftest -> ensure all checkboxes are ticked`) and [on expected version](https://axpos.org/Changelog)
- [ ] current **[Google Play Store](https://github.com/AXP-OS/microg-phonesky-iap-support/releases)** included and [on expected version](https://axpos.org/Changelog)
- [ ] Home **Launcher Neo Launcher** included and [on expected version](https://axpos.org/Changelog)
- **F-Droid**: extended list of **F-Droid repositories**
    - step1: `long press F-Droid icon -> App info -> Storage and cache -> Clear storage`
    - step2: `F-Droid App -> Settings -> Repositories` and check:
        - [ ] _enabled:_ `F-Droid, AXP.OS - Stable`
        - [ ] _disabled:_ `AXP.OS - Cutting Edge, Molly, Molly FOSS, nailyk, Threema, FUTO, Cromite, IzzyOnDroid, IronFox (since July25)`
        - [ ] enable all disabled repos: no error should occur
- [ ] **boot debug** log added (`adb shell su -c ls -la [DEVICE-BOOT-DEBUG-PATH]/boot_debug` [DEVICE-BOOT-DEBUG-PATH] is defined in the [install guide](https://axpos.org/devices). Add the output in a comment)

_Secondary tests which SHOULD succeed when the flavor you are testing is: Pro_

- [ ] **WireGuard VPN Kernel module** (Install [Wireguard](https://download.wireguard.com/android-client/) or [WG Tunnel](https://f-droid.org/packages/com.zaneschepke.wireguardautotunnel/). `Wireguard App -> grant root -> enable kernel support in settings`. `WG Tunnel -> Settings -> Use Kernel module -> grant root`)

#### AXP.OS - Slim tests

_Secondary tests which MUST succeed when the flavor you are testing is: Slim_

- **F-Droid**: extended list of **F-Droid repositories**
    - step1: `long press F-Droid icon -> App info -> Storage and cache -> Clear storage`
    - step2: `F-Droid App -> Settings -> Repositories` and check:
        - [ ] _enabled:_ `F-Droid, AXP.OS - Stable`
        - [ ] _disabled:_ `AXP.OS - Cutting Edge, Molly, Molly FOSS, nailyk, Threema, FUTO, Cromite, IzzyOnDroid, MicroG, IronFox (since July25)`
        - [ ] enable all disabled repos: no error should occur

_Secondary tests which SHOULD succeed when the flavor you are testing is: Slim_

- **MicroG install test** (microG is NOT included within Slim builds but its usage has been prepared):
    - [ ] Install [microG](https://github.com/microg/GmsCore/wiki/Installation) + and its Companion App (enable `MicroG` F-Droid repo)
    - [ ] signature spoofing support (see Enable [Google Support](https://axpos.org/docs/guides/setup/aos/#optional-activate-google-support))
    - `microG Settings -> Selftest:`
        - [ ] Signature spoofing support (tick it once, it must be enabled after that)
        - [ ] Topic _Installed packages_ should have all items enabled

### AXP.OS - Core functionality

_Tests which SHOULD succeed for any flavor_

_These tests are for critical parts of the system_

- [ ] **Wi-Fi Connectivity**: Ensure the device can connect to Wi-Fi networks.
- [ ] **Bluetooth and Bluetooth Audio**: Verify Bluetooth functionality and audio transmission.
- [ ] **Mobile Network and Data**: Confirm that the device can connect to mobile networks and use data services.
- [ ] **Airplane Mode**: Test the functionality of airplane mode.
- [ ] **Call Functionality**: Check speaker and microphone functions during calls.
- [ ] **Accelerometer and Step Counter**: Ensure the device can accurately track movement and steps.
- [ ] **Front and Back Cameras**: Test the cameras for proper image and video capture, including flash and zoom features.
- [ ] **Speaker Functionality**: Confirm that the device plays ringtone and alarm sounds correctly.
- [ ] **Battery Usage**: Ensure the battery lasts more than two hours under normal use.
- [ ] **Battery Saver Modes**: Test for effectiveness.
- [ ] **Battery Health Status**: Check the battery's health status.
- [ ] **Internal Storage Accessibility**: Ensure you can access and manage internal storage.
- [ ] **GPS and Location Services**: successfully acquire a GPS lock (can take up to 10min, must be tried outside, e.g. using [Organic Maps](https://f-droid.org/de/packages/app.organicmaps/))
- [ ] **USB OTG Support**: Test USB On-The-Go functionality.
- [ ] **SIM Card Detection**: Verify that the device can detect and use SIM cards.
- [ ] **SMS and MMS**: Test sending and receiving SMS and MMS messages.
- [ ] **Fingerprint Scanner (if applicable)**: Test fingerprint scanner functionality.
- [ ] **Screen Rotation**: Ensure the screen rotates properly in different orientations.
- [ ] **Vibration Motor**: Check the vibration motor for proper functionality.
- [ ] **System Stability**: Monitor the system for crashes, freezes, or other stability issues.
- [ ] **ADB and Fastboot**: Verify ADB and Fastboot commands work.
- [ ] **App install test**: F-Droid, Aurora Store, Play Store (_Pro_ only)

### Additional tests

_Tests which MAY succeed for any flavor_

_These tests are either not too critical or are primarily intended for overall system stability_

- [ ] **Flashlight (if applicable)**: Test the flashlight (torch) function.
- [ ] **Touchscreen Responsiveness**: Test the responsiveness of the touchscreen.
- [ ] **Face Unlock (if applicable)**: Verify face unlock functionality.
- [ ] **NFC (if applicable)**: Ensure Near Field Communication (NFC) works as expected.
- [ ] **Headphone Jack (if applicable)**: Test audio output through the headphone jack.
- [ ] **RAM Management and CPU Performance**: Test RAM management and CPU performance using benchmarks.
- [ ] **Gestures and Motion Controls**: Test gesture and motion control features.
- [ ] **Screen Lock Functionality**: Verify face unlock and fingerprint unlock functions.
- [ ] **Settings Review**: Check all settings for any anomalies.
- [ ] **Do Not Disturb and Notification Settings**: Ensure these settings work as expected.
- [ ] **VPN and DNS Support**: Test the functionality of VPN and DNS settings.
- [ ] **App Permissions**: Verify that app permissions are working correctly.
- [ ] **Screen Shot**: Ensure the screenshot function works.
- [ ] **Battery Stats and Usage**: Review battery stats and usage patterns.
- [ ] **Language and Region Settings**: Ensure language and region settings are applied correctly.
```

Base for the above checklist: [LineageOS Device Requirements](https://github.com/LineageOS/charter/blob/main/device-support-requirements.md)

### Howto use the QA checklist

{{< youtube BS8kweB2s58 >}}

##
