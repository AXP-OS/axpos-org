---
title: "Test: community"
type: docs
toc: true
aliases:
    - /qa
    - /QA
    - /Test
    - /test
    - /Checklist
    - /checklist
---

## AXP.OS Quality Control Checklist

{{< callout emoji="💡" type="info" >}}
_A community based set of helper scripts exists, huge thanks to @SerYo who maintains these. Use at your own risk 😏 --> [Test Helper Scripts](https://code.binbash.rocks/SerYo/AXP-OS-bash-utilities)_
{{< /callout >}}

```
`copytemplate: v1.12`

_Note: The use of `MUST`, `MUST NOT`, `REQUIRED`, `SHALL`, `SHALL NOT`, `SHOULD`, `SHOULD NOT`, `RECOMMENDED`, `MAY`, and `OPTIONAL` is per the IETF standard defined in [RFC2119](https://www.rfc-editor.org/rfc/rfc2119.html)._

## Device

- codename: FILL_IN_THE_CODENAME
- flavor: FILL_IN_THE_FLAVOR

## AXP.OS - Core features

_Major tests which MUST succeed for any flavor_

- [ ] **AXP.OS [build id](https://axpos.org/docs/knowledge/faq/#meaning-of-the-axpos-build-id)** shown in **recovery** _(reboot to recovery, check if you see e.g. `Version xxx (2026.001)`, in this example `2026.001` would be the expected build id which should match the issue tracker's title)_
- [ ] **current ASB patch - System** (`Android Settings -> Info/About Phone -> Android Version (touch it to open)` must be [on expected version](https://axpos.org/Changelog))
- [ ] **current ASB patch - Kernel** (`Android Settings -> Info/About Phone -> Android Version (touch it to open) -> Kernel version -> build date` must be current. Kernel version must have `-pXXX` inside the version string)
- [ ] paste a **screenshot** of the Android version screen (`Android Settings -> Info/About Phone -> Android Version (touch it to open)`. `AXP.OS version, Android security update, Kernel version`, all must be visible)
- [ ] **SELinux enforced** (`Android Settings -> Privacy -> Trust`)
- [ ] **Encryption is auto-enabled** (`Android Settings -> Privacy -> Trust`) _SKIP if your device has [autoencryption disabled (click to find out)](https://github.com/search?q=repo%3AsfX-android%2Fautomation_scripts+%22axp_auto_encrypt%3A+False%22+NOT+path%3A%22roles%2Faxp%2Fcommon%22&type=code)_
- [ ] **signature spoofing support** (see Enable [Google Support](https://axpos.org/docs/guides/setup/aos/#optional-activate-google-support))
- [ ] **F-Droid** included and [on expected version](https://code.binbash.rocks/AXP.OS/axp_versioning/tags)
- [ ] **OpenEUICC** app included and [on expected version](https://code.binbash.rocks/AXP.OS/axp_versioning/tags) - for devices supporting euicc ([Enable eSIM](https://axpos.org/docs/knowledge/faq/#esim-management-if-supported-by-device)) _(enabling is required only on =< A13. If you are on >= A14 and your device supports eSIMs, you should find the OpenEUICC without any extra steps in the app drawer)_
- [ ] **AuroraStore** App included and [on expected version](https://code.binbash.rocks/AXP.OS/axp_versioning/tags)
- [ ] **AOSmium WebView** installed (`Developer Options -> WebView implementation` -> verify it is selected)
    - [ ] and on [expected version](https://code.binbash.rocks/AXP.OS/axp_versioning/tags)
- **AOSmium WebView** quick test: `AuroraStore -> search & install "Webview test"` ([link](https://play.google.com/store/search?q=webview+test&c=apps))
    - [ ] click on the Globe icon or open the menu and choose `Webview` _(if no input popup appears click the globe icon at the top)_
    - [ ] enter any url and test if it opens
- [ ] **OTA update** (`Android Settings -> Updater -> 3dots -> Preferences -> Server Choice -> "UNSTABLE"`):
    - [ ] shows up the next/current version
    - Testing the OTA update process _(requires Internet)_:
        - [ ] flashing from the previous version to the latest unstable was successful _(why: this test checks if the OTA process is not broken in the previous stable)_
        - [ ] re-flash the latest unstable from that same latest unstable again was successful _(why: this test checks if the OTA process is not broken in the latest unstable)_
- [ ] **Developer options**: `OEM unlock` option is **NOT** shown in developer options
- **Call recording option**: follow the [guide](https://axpos.org/r) to find & enable it
    - [ ] it must be possible to set & unset the toggle (`enable it -> move out of developer screen -> and open it again`: _is the toggle still enabled? if so, then you can toggle it off again and tick the box: ✅_ )
    - [ ] if possible: test the call recording
- **locking the bootloader**: on supported devices (see the [device page](https://axpos.org/devices))
    - [ ] re-lock the device or ensure it still boots when in locked state
    - [ ] verify the bootloader ID (string on startup) matches with your device [device](https://axpos.org/devices)
    _HINT: LEAVE UNCHECKED only if the ID does NOT match!_
    ***If your device does not show any ID at all: SET(!) the check mark!***
- **Verified Boot**: check if verity is enabled (if your device supports _Verified Boot_, (see the [device page](https://axpos.org/devices))
    - connect via ADB (`adb shell`) or open a terminal emulator (e.g. [termux](https://f-droid.org/de/packages/com.termux/)):
    - [ ] enter: `grep dm- /proc/mounts | grep -E " /(system|system_ext|product|vendor|odm) "` _(the spaces at start and end are important!)_
        - [ ] output added to the bottom of this checklist
    - [ ] enter: `getprop | grep verity`
        - [ ] output added to the bottom of this checklist

### AXP.OS - Pro tests

_Secondary tests which MUST succeed when the flavor you are testing is: Pro_

- [ ] **Pre-rooted** (`Magisk App -> "Magisk" must be shown as "installed"`) and [on expected version](https://code.binbash.rocks/AXP.OS/axp_versioning/tags)
- [ ] **microG included** (`microG Settings -> Selftest -> ensure all checkboxes are ticked`) and [on expected version](https://code.binbash.rocks/AXP.OS/axp_versioning/tags)
- [ ] current **[Google Play Store](https://github.com/AXP-OS/microg-phonesky-iap-support/releases)** included and [on expected version](https://code.binbash.rocks/AXP.OS/axp_versioning/tags)
- [ ] Home **Launcher Neo Launcher** included and [on expected version](https://code.binbash.rocks/AXP.OS/axp_versioning/tags)
- **F-Droid**: extended list of **F-Droid repositories**
    - step1: `long press F-Droid icon -> App info -> Storage and cache -> Clear storage`
    - step2: `F-Droid App -> Settings -> Repositories` and check:
        - [ ] _enabled:_ `F-Droid, AXP.OS - Stable`
        - [ ] _disabled:_ `AXP.OS - Cutting Edge, Molly, Molly FOSS, nailyk, Threema, FUTO, Cromite, IzzyOnDroid, IronFox (since July25)`
        - [ ] enable all disabled repos: no error should occur
- **boot debug** log existence:
    - connect via ADB (`adb shell`) or open a terminal emulator (e.g. [termux](https://f-droid.org/de/packages/com.termux/)):<br/>
    - enter: `su -c ls -la [DEVICE-BOOT-DEBUG-PATH]/boot_debug` _(you can find the definition of `[DEVICE-BOOT-DEBUG-PATH]` in the [install guide](https://axpos.org/devices))_
      - [ ] output added to the bottom of this checklist
- **Verified Boot**: addtional check if verity is enabled (if your device supports _Verified Boot_, (see the [device page](https://axpos.org/devices))
    - connect via ADB (`adb shell`) or open a terminal emulator (e.g. [termux](https://f-droid.org/de/packages/com.termux/)):
    - enter: `su -c dmctl info system-verity`
      - [ ] output added to the bottom of this checklist
    - enter: `su -c dmctl info vendor-verity`
      - [ ] output added to the bottom of this checklist
    - enter: `su -c cat /proc/cmdline`
      - [ ] output added to the bottom of this checklist

_Secondary tests which SHOULD succeed when the flavor you are testing is: Pro_

- [ ] **WireGuard VPN Kernel module** (Install [Wireguard](https://download.wireguard.com/android-client/) or [WG Tunnel](https://f-droid.org/packages/com.zaneschepke.wireguardautotunnel/). `Wireguard App -> grant root -> enable kernel support in settings`. `WG Tunnel -> Settings > App Mode > Kernel -> grant root`)

### AXP.OS - Slim tests

_Secondary tests which MUST succeed when the flavor you are testing is: Slim_

- **F-Droid**: extended list of **F-Droid repositories**
    - step1: `long press F-Droid icon -> App info -> Storage and cache -> Clear storage`
    - step2: `F-Droid App -> Settings -> Repositories` and check:
        - [ ] _enabled:_ `F-Droid, AXP.OS - Stable`
        - [ ] _disabled:_ `AXP.OS - Cutting Edge, Molly, Molly FOSS, nailyk, Threema, FUTO, Cromite, IzzyOnDroid, microG, IronFox (since July25)`
        - [ ] enable all disabled repos: no error should occur

_Secondary tests which SHOULD succeed when the flavor you are testing is: Slim_

- **microG FULL install test** (microG is NOT included within Slim builds but its usage has been prepared)<br/>
***WARNING: ONLY IF YOUR BOOTLOADER IS STILL `UNLOCKED` - SKIP TO "minimal test" IF YOUR BOOTLOADER IS `LOCKED`!***
  - [ ] _if bootloader unlocked:_ Install [microG](https://github.com/microg/GmsCore/wiki/Installation) + and its Companion App (enable `microG` F-Droid repo)
  - [ ] signature spoofing support (see Enable [Google Support](https://axpos.org/docs/guides/setup/aos/#optional-activate-google-support))
  - `microG Settings -> Selftest:`
      - [ ] Signature spoofing support _(tick it once, it must be enabled after that)_
      - [ ] Topic _Installed packages_ should have all items enabled
- **microG MINIMAL test** _(no install required)_.<br/>For those _NOT_ wanting to install microG or ***if your bootloader is locked***:
    - [ ] check if signature spoofing support is available (`enable it -> move out of developer screen -> and open it again`: _is the toggle still enabled? if so, then you can toggle it off again and tick the box: ✅_ )

## AXP.OS - Core functionality

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

## Additional tests

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

## Tester feedback / command outputs

### free form

_This is a space for comments by the tester, remarks, notable changes and any other report about the result which might be useful._<br/>
_Especially if a test does not succeed, report here what happened (not in the above checklist)._

...

### command results

##### Pro/Slim: `grep dm- /proc/mounts | grep -E " /(system|system_ext|product|vendor|odm) "`

_paste the result here, then mark the WHOLE TEXT BLOCK (REALLY ALL, NOT JUST A SINGLE LINE!), then click the symbol `< >` ("Add code") in the format menu above_

...

##### Pro/Slim: `getprop | grep verity`

_paste the result here, then mark the WHOLE TEXT BLOCK (REALLY ALL, NOT JUST A SINGLE LINE!), then click the symbol `< >` ("Add code") in the format menu above_

...

##### Pro: `su -c ls -la [DEVICE-BOOT-DEBUG-PATH]/boot_debug`

_paste the result here, then mark the WHOLE TEXT BLOCK (REALLY ALL, NOT JUST A SINGLE LINE!), then click the symbol `< >` ("Add code") in the format menu above_

...

##### Pro: `su -c dmctl info system-verity`

_paste the result here, then mark the WHOLE TEXT BLOCK (REALLY ALL, NOT JUST A SINGLE LINE!), then click the symbol `< >` ("Add code") in the format menu above_

...

##### Pro: `su -c dmctl info vendor-verity`

_paste the result here, then mark the WHOLE TEXT BLOCK (REALLY ALL, NOT JUST A SINGLE LINE!), then click the symbol `< >` ("Add code") in the format menu above_

...

##### Pro: `su -c cat /proc/cmdline`

_paste the result here, then mark the whole text block and click the symbol `< >` ("Add code") in the format menu above_

...


```

Base for the above checklist: [LineageOS Device Requirements](https://github.com/LineageOS/charter/blob/main/device-support-requirements.md)

### Howto use the QA checklist

{{< youtube BS8kweB2s58 >}}


