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

{{< callout type="error" emoji="⚠️" >}}
Do not skip flashing the OS ***twice*** as mentioned in the following guide. Otherwise you **risk a hard-brick**!
{{< /callout >}}

{{< callout type="error" emoji="⚠️" >}}
**IMPORTANT NOTICE** for the following devices:
-  **Pixel 6 (6, 6 Pro, 6a | raven, oriole, bluejay)**
-  **Pixel 8 (8, 8 Pro, 8a | shiba, husky, akita)**

If your firmware is on **May 2025 or _later_** you can **NOT** flash AXP.OS - **A13** builds! This is due to a rollback implementation by Google **which will lead to a hard-brick** on these devices!
If you are not sure, request support **before** flashing!
[Details](https://developers.google.com/android/images#special_instructions_for_updating_pixel_devices_to_the_may_2025_monthly_release)
{{< /callout >}}

1. extract the downloaded AXP.OS factory zip
2. open a terminal / command window in that extracted directory
3. reboot to the bootloader (**not** fastboot**d**), note down the current _BOOT SLOT_ name (`a|b`)
4. flash AXP.OS - this also includes the AXP.OS signing key so you can lock your device - **if supported**
   - when on Windows, type: `flash-all.bat`
   - when on Linux, type: `./flash-all.sh`
5. during the process you will see the _SLOT_ which gets flashed, here an excerpt where it flashes slot **>b<** (e.g. boot_**b**):
```
Sending 'boot_b' (65536 KB)                        OKAY [  1.675s]
Writing 'boot_b'
...
Sending 'dtbo_b' (16384 KB)                        OKAY [  0.423s]
Writing 'dtbo_b'                                   OKAY [  0.028s]
... (and much more)
```
6. once completed **successfully** reboot to the _bootloader_ (aka `fastboot`) again!<br/> _(request support if you see errors during flashing and do NOT reboot or poweroff!)_ 
7. the _BOOT SLOT_ must be changed to the updated one of step 5 as follows:
   - if it has ***NOT*** changed already, switch the slot manually via:<br/>
   `fastboot --set-active=>UNPATCHED-SLOT<` so to stick with the example above _(where we flashed >b<)_:<br/>
   `fastboot --set-active=a` _(replace >a< according to your device)_
   - check the screen on your phone _(no reboot)_, it should show the new boot slot name immediately
   <br/>_(request support if you have any issues and do NOT reboot or poweroff in that case!)_
8. repeat step 4 and ensure it flashes the _OTHER_ slot now _(to stick with the example above: it should flash slot **>a<** now)_
9.  if this also went fine: boot into _recovery_
10. perform a factory reset
11. reboot into AXP.OS. If it takes more than 10 minutes to boot then something is wrong. Do not let it sit for more than 10 minutes!

## Update AXP.OS

See [Updating AXP.OS](/Updating)

## Final note

> [!CAUTION]
> AXP.OS comes with its own recovery so if you **flash** a custom recovery it gets overwritten on next update! Even worse if you own a device which does not have a dedicated recovery partition (e.g. the OnePlus 6T) flashing TWRP will remove Magisk and needs to be manually re-flashed afterwards, so causing just trouble at the end.
