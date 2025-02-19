---
title: "Test: community"
type: docs
toc: true
#aliases:
---
```
A test build has been released :tada: !
Check it out here:
- [download](https://leech.binbash.rocks:8008/axp-unstable/)*
- [factory](https://leech.binbash.rocks:8008/axpYYYY/XXXX/factory/)

_*) Please note: the test build might get removed during regular clean-up tasks @midnight. If you missed to fetch it in time let us know._

## YOUR feedback is required:

1. copy the following snippet
2. add a new comment with that snippet as content
3. save it
4. go through the list and tick each item you have tested
```

### Pro

```
## Tested AXP.OS (Pro) core features

- [ ] current ASB patch - System (`Android Settings -> Info/About Phone -> Android Version` must be current)
- [ ] current ASB patch - Kernel (`Android Settings -> Info/About Phone -> Kernel version -> build date` must be current. Kernel version must have `-pXXX` inside the version string)
- [ ] paste a screenshot of the Android version screen (must show `AXP.OS version, Android security update, Kernel version`)
- [ ] SELinux enforced (`Android Settings -> Privacy -> Trust`)
- [ ] Encryption enforced (`Android Settings -> Privacy -> Trust`)
- [ ] pre-rooted (`Magisk App -> "Magisk" must be shown as "installed"`)
- [ ] signature spoofing support (see Enable [Google Support](https://axpos.org/docs/guides/setup/#optional-activate-google-support))
- [ ] microG included (`microG Settings -> Selftest -> ensure all checkboxes are ticked`)
- [ ] current [Google Play Store](https://github.com/AXP-OS/microg-phonesky-iap-support/releases) included
- [ ] Enable WireGuard VPN Kernel module (`Wireguard App -> grant root -> enable kernel support in settings`)
- [ ] OpenEUICC app included for devices supporting euicc ([Enable eSIM](https://axpos.org/docs/knowledge/faq/#esim-management-if-supported-by-device))
- [ ] Home Launcher Neo Launcher included
- [ ] F-Droid included
    - [ ] extended list of F-Droid repositories (`F-Droid App -> Repositories -> find Molly, Molly FOSS, nailyk, Threema, FUTO, Cromite, IzzyOnDroid`)
- [ ] AuroraStore App included
- [ ] AOSmium WebView installed (`Developer Options -> WebView implementation`)
- [ ] boot debug log added (`adb shell su -c ls -la [DEVICE-BOOT-DEBUG-PATH]/boot_debug` [DEVICE-BOOT-DEBUG-PATH] is defined in the [install guide](/devices). Add the output in a comment)
- [ ] OTA update
- [ ] `OEM unlock` option is **NOT** shown in developer options
- [ ] locking the bootloader on supported devices (see the [device page](https://axpos.org/devices))
```

### Slim

```
## Tested AXP.OS (Slim) core features

- [ ] current ASB patch - System (`Android Settings -> Info/About -> Android Version` must be current)
- [ ] current ASB patch - Kernel (`Android Settings -> Info/About -> Kernel version -> build date` must be current. Kernel version must have `-pXXX` inside the version string)
- [ ] paste a screenshot of the Android version screen (must show `AXP.OS version, Android security update, Kernel version`)
- [ ] SELinux enforced (`Android Settings -> Privacy -> Trust`)
- [ ] Encryption enforced (`Android Settings -> Privacy -> Trust`)
- [ ] microG install test (microG is NOT included within Slim builds but its usage has been prepared):
    - [ ] Install [microG](https://github.com/microg/GmsCore/wiki/Installation)
    - [ ] signature spoofing support (see Enable [Google Support](https://axpos.org/docs/guides/setup/#optional-activate-google-support))
    - [ ]`microG Settings -> Selftest -> ensure all checkboxes are ticked`
- [ ] OpenEUICC app included for devices supporting euicc ([Enable eSIM](https://axpos.org/docs/knowledge/faq/#esim-management-if-supported-by-device))
- [ ] F-Droid included
    - [ ] extended list of F-Droid repositories (`F-Droid App -> Repositories -> find Molly, Molly FOSS, nailyk, Threema, FUTO, Cromite, IzzyOnDroid`)
- [ ] AuroraStore App included
- [ ] AOSmium WebView installed (`Developer Options -> WebView implementation`)
- [ ] OTA update
- [ ] `OEM unlock` option is **NOT** shown in developer options
- [ ] locking the bootloader on supported devices (see the [device page](https://axpos.org/devices))
```

