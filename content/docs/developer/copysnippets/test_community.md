---
title: "Test: community"
type: docs
toc: true
#aliases:
---
## AXP.OS test build info

```
A test build has been released :tada: !
Check it out here:
- [download](https://leech.binbash.rocks:8008/axp<XXXX>/<XXXX>/tests/)

## YOUR feedback is required:

1. copy the following snippet: [Quality Control Checklist](https://axpos.org/docs/developer/copysnippets/test_community/#axpos-quality-control-checklist)
2. add a new comment with that snippet as content
3. save it
4. go through the list and tick each item you have tested
```

## AXP.OS Quality Control Checklist

```
## Device

- codename: 
- flavor: Slim | Pro

### AXP.OS - Core features

_Major tests which HAVE TO succeed for any flavor_

- [ ] **current ASB patch - System** (`Android Settings -> Info/About Phone -> Android Version` must be current)
- [ ] **current ASB patch - Kernel** (`Android Settings -> Info/About Phone -> Android Version -> Kernel version -> build date` must be current. Kernel version must have `-pXXX` inside the version string)
- [ ] paste a **screenshot** of the Android version screen (must show `AXP.OS version, Android security update, Kernel version`)
- [ ] **SELinux enforced** (`Android Settings -> Privacy -> Trust`)
- [ ] **Encryption is auto-enabled** (`Android Settings -> Privacy -> Trust`)
- [ ] **signature spoofing support** (see Enable [Google Support](https://axpos.org/docs/guides/setup/#optional-activate-google-support))
- [ ] **F-Droid** included and expected version
- [ ] **OpenEUICC** app included for devices supporting euicc ([Enable eSIM](https://axpos.org/docs/knowledge/faq/#esim-management-if-supported-by-device))
- [ ] **AuroraStore** App included and expected version
- [ ] **AOSmium WebView** installed (`Developer Options -> WebView implementation`) and expected version
- [ ] **OTA update** (`Android Settings -> Updater -> 3dots -> Preferences -> Server Choice -> "UNSTABLE"`)
- [ ] **Developer options**: `OEM unlock` option is **NOT** shown in developer options
- [ ] **locking the bootloader**: on supported devices (see the [device page](https://axpos.org/devices))

#### AXP.OS - Pro tests

_Required only when the flavor you are testing is: Pro_

- [ ] **Pre-rooted** (`Magisk App -> "Magisk" must be shown as "installed"`) and expected version
- [ ] **MicroG included** (`microG Settings -> Selftest -> ensure all checkboxes are ticked`) and expected version
- [ ] current **[Google Play Store](https://github.com/AXP-OS/microg-phonesky-iap-support/releases)** included and expected version
- [ ] **WireGuard VPN Kernel module** (Install [Wireguard](https://download.wireguard.com/android-client/) or [WG Tunnel](https://f-droid.org/packages/com.zaneschepke.wireguardautotunnel/). `Wireguard App -> grant root -> enable kernel support in settings`. `WG Tunnel -> Settings -> Use Kernel module -> grant root`)
- [ ] Home **Launcher Neo Launcher** included and expected version
- [ ] **F-Droid**: extended list of **F-Droid repositories** (`F-Droid App -> Settings -> Repositories -> find Molly, Molly FOSS, nailyk, Threema, FUTO, Cromite, IzzyOnDroid`)
- [ ] **boot debug** log added (`adb shell su -c ls -la [DEVICE-BOOT-DEBUG-PATH]/boot_debug` [DEVICE-BOOT-DEBUG-PATH] is defined in the [install guide](/devices). Add the output in a comment)

#### AXP.OS - Slim tests

_Required only when the flavor you are testing is: Slim_

- [ ] **F-Droid**: extended list of **F-Droid repositories** (`F-Droid App -> Settings -> Repositories -> find Molly, Molly FOSS, nailyk, Threema, FUTO, Cromite, IzzyOnDroid, MicroG`)
- [ ] **MicroG install test** (microG is NOT included within Slim builds but its usage has been prepared):
    - [ ] Install [microG](https://github.com/microg/GmsCore/wiki/Installation)
    - [ ] signature spoofing support (see Enable [Google Support](https://axpos.org/docs/guides/setup/#optional-activate-google-support))
    - [ ]`microG Settings -> Selftest -> ensure all checkboxes are ticked`

### AXP.OS - Core functionality

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
