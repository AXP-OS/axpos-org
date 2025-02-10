---
title: "Recovery Images"
type: docs
toc: true
aliases:
    - /Recovery-images
---
AXP.OS comes with a restricted and limited recovery which ensures no one can tamper with your device (as far as possible - as the bootloader cannot be locked on every device).

## Official AXP.OS recovery

The recommended way to install AXP.OS when you come from any OS including STOCK or when switching between [Flavors](/Flavors).

That being said there is one **exception** to this rule:<br/>
If there is a factory image available (e.g. any Google Pixel device) it is required to flash the factory image via _**fastboot**_ (see the installation guide for your device!) for the very first flash. If you switch between [Flavors](/Flavors) you can safely use the recovery instead as they share the same firmware.

Official AXP.OS recovery images can be found in the subdirectory named `recovery/` of each device's download path.
- Regular: https://leech.binbash.rocks:8008/axp/ ([tor](http://e3tx35xwvqoihx36tjmnzurjcghs6kjwrwnen55jg7ujqilbaicutpid.onion:8008/axp/))
- Slim: https://leech.binbash.rocks:8008/axp-slim/ ([tor](http://e3tx35xwvqoihx36tjmnzurjcghs6kjwrwnen55jg7ujqilbaicutpid.onion:8008/axp-slim/))

Flashing the recovery image depends on the device but is usually made in fastboot mode:
```
fastboot flash recovery AXP.OS-18.1-20250124-RECOVERY-klte.img
```
or if there is no dedicated recovery partition:
```
fastboot flash boot AXP.OS-18.1-20250124-BOOT-fajita.img
```

## Custom recovery

AXP.OS provides OTA (Over The Air) updates which are signed with the releasekey to allow verifying the integrity of an update.
That means:
- when the Updater downloaded a new build it verifies the signature and fails if it is compromised
- when the AXP.OS recovery loads an update via ADB sideload it verifies the signature and fails if it is compromised

Read here how and where to find those keys: [build-signatures](/docs/knowledge/signatures/#build-signatures)

#### Note

_AXP.OS comes with its **own** recovery so if you flash a custom recovery it might gets overwritten on next update (does not apply to devices having a dedicated recovery partition AND when they opt-out from updating the recovery)! Even worse if you own a device which does not have a dedicated recovery partition (e.g. the OnePlus 6T) flashing TWRP will remove Magisk and last but not least in a worst case scenario it can even brick your device if your booloader is locked._

### TWRP

Sometimes it is required to boot into a more advanced recovery and while not supported you can check my own TWRP builds or the latest official ones:

#### Official TWRP builds
_(often older and well - official)_

Main page: [all devices](https://twrp.me/Devices/)

- LG G4 (h815,h815_usu, ...) [(download)](https://twrp.me/lg/lgg4.html)
- Oneplus 6T [(download)](https://twrp.me/oneplus/oneplus6t.html)
- Oneplus 7T [(download)](https://twrp.me/oneplus/oneplus7t.html)
- Oneplus 7T pro [(download)](https://twrp.me/oneplus/oneplus7tpro.html)

#### Unofficial TWRP builds
_(often newer, more features, often more bugfixes - but unofficial)_

Main page: [all devices](https://leech.binbash.rocks:8008/TWRP/)

- LG G4 (h815,h815_usu, ...) {{< globalvar key="downloadServerBaseUrl" uripath="/TWRP/g4/" linkname="(download)" >}} known issues + source: [here](https://xdaforums.com/t/recovery-official-f500-ls991-h81x-us991-vs986-n-o-p-twrp-2020-06-22.3442424/)
- Oneplus 6T {{< globalvar key="downloadServerBaseUrl" uripath="/TWRP/fajita/" linkname="(download)" >}} known issues + source: [here](https://github.com/AXP-OS/android_device_oneplus_fajita/blob/twrp-a12)
- Oneplus 7T pro {{< globalvar key="downloadServerBaseUrl" uripath="/TWRP/hotdog/" linkname="(download)" >}} known issues + source: [here](https://github.com/AXP-OS/android_device_oneplus_hotdog/tree/twrp-a12)
- Samsung J5 2017 {{< globalvar key="downloadServerBaseUrl" uripath="/TWRP/j5y17lte/" linkname="(download)" >}} known issues + source: [here](https://github.com/AXP-OS/device_samsung_j5y17lte/tree/android-10.0_twrp)
- Sony Xperia XZ2 Compact [(download)](https://www.dhsfileserver.de/ftp/MartinX3/Xperia%20XZ2%20Compact/android_11/twrp/sodp/) known issues + source: [here](https://xdaforums.com/t/recovery-android-10-11-stock-sodp-xz2-c-p-3-twrp-3-4-0-0-unofficial.4074305/)

#### Usage (official TWRP or not)

`fastboot boot twrp.img`

or if that fails:
~~~
fastboot flash recovery twrp.img
fastboot reboot-recovery # or use the key combo for your device
~~~
