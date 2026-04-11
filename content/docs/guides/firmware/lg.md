---
title: "LG"
type: docs
toc: true
aliases:
    - /fw-LG
    - /fw-lg
---
{{< callout type="info" >}}
Ensure you select the matching **Android version** offered by the AXP.OS build. You can find the Android version at the [device's overview page](/devices).

That means:
- if AXP.OS offers a build with **Android 13** choose Android 13 _firmware_ and not any later or older - if there is any
- if there is **no** matching firmware for that Android version of the AXP.OS build (e.g. because your device is very old), choose the latest one available.

{{< /callout >}}

## Generic

Follow the LineageOS wiki based on your device: https://wiki.lineageos.org/devices/ if one is available.

## G4

boot into TWRP and flash the required firmware for your model:

### h815 (officially unlocked)

required firmware:
- [h815_20p_bootloader_20p_modem_TWRP-flashable.zip](https://leech.binbash.rocks:8008/stock/LG/h815/20p/) (i.e. **no** `UsU` in its name)

1. download `h815_20p_bootloader_20p_modem_TWRP-flashable.zip` *(it is crucial important you are selecting the exact filename)*
1. download `h815_20p_bootloader_20p_modem_TWRP-flashable.zip.md5`
1. boot TWRP
1. push **both** files to TWRP (e.g. `adb push h815_20p_bootloader_20p_modem_TWRP-flashable.zip* /sdcard/`)
1. in TWRP choose `Install` and find the zip in /sdcard
1. ensure you **uncheck** "_Skip digest check before installing zip_" as it is crucial important that the md5sum will be used and checked to avoid corruption
1. let TWRP install the file

### h812_usu (UsU unlocked)

required firmware *(`20z` is untested but should also work)*:
- [h812_20x_ARB-0_UsU_bootloader_TWRP-flashable.zip](https://leech.binbash.rocks:8008/stock/LG/h812/20x/h812_20x_ARB-0_UsU_bootloader_TWRP-flashable.zip) (i.e. **with** **with** `UsU` in its name)

1. download the `h812_20x_ARB-0_UsU_bootloader_TWRP-flashable.zip` *(it is crucial important you are selecting the exact filename)*
1. download `h812_20x_ARB-0_UsU_bootloader_TWRP-flashable.zip.md5`
1. boot TWRP
1. push **both** files to TWRP (e.g. `adb push h812_20x_ARB-0_UsU_bootloader_TWRP-flashable.zip* /sdcard/`)
1. in TWRP choose `Install` and find the zip in /sdcard
1. ensure you **uncheck** "_Skip digest check before installing zip_" as it is crucial important that the md5sum will be used and checked to avoid corruption
1. let TWRP install the file

### h815_usu (UsU unlocked)

required firmware:
- [h815_UsU_20p_bootloader_20p_modem_TWRP-flashable.zip](https://leech.binbash.rocks:8008/stock/LG/h815/20p/) (i.e. **with** `UsU` in its name)

1. download `h815_UsU_20p_bootloader_20p_modem_TWRP-flashable.zip` *(it is crucial important you are selecting the exact filename)*
1. download `h815_UsU_20p_bootloader_20p_modem_TWRP-flashable.zip.md5`
1. boot TWRP
1. push **both** files to TWRP (e.g. `adb push h815_UsU_20p_bootloader_20p_modem_TWRP-flashable.zip* /sdcard/`)
1. in TWRP choose `Install` and find the zip in /sdcard
1. ensure you **uncheck** "_Skip digest check before installing zip_" as it is crucial important that the md5sum will be used and checked to avoid corruption
1. let TWRP install the file
