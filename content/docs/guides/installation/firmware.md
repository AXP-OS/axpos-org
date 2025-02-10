---
title: "Firmware"
type: docs
toc: true
aliases:
    - /Firmware
---
## LG G4

boot into TWRP and flash the required firmware for your model:

### h815 (officially unlocked)

required firmware: [h815_20p_bootloader_20p_modem_TWRP-flashable.zip](https://leech.binbash.rocks:8008/stock/LG/h815/20p/) (i.e. **no** `UsU` in its name)

1. download `h815_20p_bootloader_20p_modem_TWRP-flashable.zip` (it is crucial important you are selecting the exact filename)
1. download `h815_20p_bootloader_20p_modem_TWRP-flashable.zip.md5`
1. boot TWRP
1. push **both** files to TWRP (e.g. `adb push h815_20p_bootloader_20p_modem_TWRP-flashable.zip* /sdcard/`)
1. in TWRP choose `Install` and find the zip in /sdcard
1. ensure you **uncheck** "_Skip digest check before installing zip_" as it is crucial important that the md5sum will be used and checked to avoid corruption
1. let TWRP install the file

### h815_usu (UsU unlocked)

required firmware: [h815_UsU_20p_bootloader_20p_modem_TWRP-flashable.zip](https://leech.binbash.rocks:8008/stock/LG/h815/20p/) (i.e. **with** `UsU` in its name)

1. download `h815_UsU_20p_bootloader_20p_modem_TWRP-flashable.zip` (it is crucial important you are selecting the exact filename)
1. download `h815_UsU_20p_bootloader_20p_modem_TWRP-flashable.zip.md5`
1. boot TWRP
1. push **both** files to TWRP (e.g. `adb push h815_UsU_20p_bootloader_20p_modem_TWRP-flashable.zip* /sdcard/`)
1. in TWRP choose `Install` and find the zip in /sdcard
1. ensure you **uncheck** "_Skip digest check before installing zip_" as it is crucial important that the md5sum will be used and checked to avoid corruption
1. let TWRP install the file

## Samsung - Generic

This includes:

- **Samsung S5 (klte)**

For flashing the firmware you can use e.g. [mAid](https://maid.binbash.rocks/) which has all required tools ready-to-use included.

The actual firmware files depend on your location and exact device model. 
The following are links to unverified and untested firmware locations. You might want to follow a specific guide on XDA or whatever source you trust.
It is up to you if you trust them or if you find better ones: [here](https://sfirmware.com/) or [here](https://samfrew.com/).

Ensure you select either the latest one supported by the given Android version used in AXP.OS or the latest one available if it is not a current device.

A great help on that topic is to follow the LineageOS wiki for your model: https://wiki.lineageos.org/devices/
You will be guided through the steps and also usually will see a hint what firmware version is required (e.g. [here](https://wiki.lineageos.org/devices/klte/install/#checking-the-correct-firmware) -> Android _6.0.1_)

Once you have the firmware use "heimdall" or JOdin to flash it (both can be found on the desktop in the folder "Samsung" when using [mAid](https://maid.binbash.rocks/)). 

Especially (but not only then!) when flashing the whole package it will fully reset the device back to STOCK, so..

 **ensure you always have a FULL backup first**.

## Samsung SM-J530F (j5y17lte)

For flashing the firmware you can use e.g. [mAid](https://maid.binbash.rocks/) which has all required tools ready-to-use included.

### Enter Download mode

1. Power off your device first.
1. Wait for a few seconds for the device to completely turn off.
1. Press and hold the Volume Down, Home, and Power keys simultaneously.
1. Release the keys when the blue-colored “Warning” screen appears.
1. Press the Volume Up key to continue into Download Mode.

### Flash latest firmware

Download: [HEIMDALL_SM-J530F_J530FXXS9CUE5_firmware.gz](https://github.com/AXP-OS/build/files/12323312/HEIMDALL_SM-J530F_J530FXXS9CUE5_firmware.gz)

Instructions:

1. BACKUP, all the following comes without any warranties! You do this on your own risk!
1. start Heimdall
1. in the tab "**Load package**" browse to the firmware
![image](https://github.com/AXP-OS/build/assets/8750713/98217e7e-37ca-43c1-a21c-54985469777c)
4. after pressing "Load package" the tab "**Flash**" becomes active -> Click the "**Flash**" tab
5. connect your device in ODIN download mode and let it flash

## Sony Xperia XZ2 Compact (xz2c)

For flashing the firmware you can use e.g. [mAid](https://maid.binbash.rocks/) which has all required tools ready-to-use included.

- Recommended flashing tool: _Xperia Flashtool_
- Recommended firmware: **52.1.A.3.49** or later

Unfortunately we do not own that device so we cannot provide a step-by-step guide but you can use the LineageOS wiki as guidance: [here](https://wiki.lineageos.org/devices/xz2c/install/)

