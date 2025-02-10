---
title: Pixel devices
type: docs
aliases:
    - /Installation-on-Pixel-devices
---

## About

Newer Google Pixel devices require to flash an AXP.OS factory image once. This is needed only on the very first flash or when you need to recover from a bad flash. 

This is also why a factory image will **not** be generated _regularly_ and so are likely older then the latest OTA zip. Don't worry simply do an OTA afterwards and you are on the latest version again.

## Requirements

1. download the latest AXP.OS **factory(!)** image for your device (see _FACTORY zip_ column for your [device](/devices))
1. **a PC** to push the AXP.OS factory image via **fastboot** (OTA and `adb sideload` via recovery are supported once installed)
1. an unlocked bootloader (not part of this guide! use www.google.com to find instructions)

## Flashing instructions

1. extract the downloaded AXP.OS factory zip
1. open a terminal / command window in that extracted directory
1. reboot to the bootloader (**not** fastboot**d**)
1. flash AXP.OS - this also includes the AXP.OS signing key so you can lock your device - **if supported** (see last step)
   - when on Windows, type: `flash-all.bat`
   - when on Linux, type: `./flash-all.sh`
1. boot into recovery
1. perform a factory reset
1. reboot into AXP.OS. If it takes more than 10 minutes to boot then something is wrong. Do not let it sit for more than 10 minutes!

## Update AXP.OS

See [Updating AXP.OS](/docs/updating/)

## Final note

> [!CAUTION]
> AXP.OS comes with its own recovery so if you **flash** a custom recovery it gets overwritten on next update! Even worse if you own a device which does not have a dedicated recovery partition (e.g. the OnePlus 6T) flashing TWRP will remove Magisk and needs to be manually re-flashed afterwards, so causing just trouble at the end.
