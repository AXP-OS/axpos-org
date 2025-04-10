---
title: "Samsung"
type: docs
toc: true
aliases:
    - /fw-Samsung
    - /fw-samsung
---
{{< callout type="info" >}}
Ensure you select the matching **Android version** offered by the AXP.OS build. You can find the Android version at the [device's overview page](/devices).

That means:
- if AXP.OS offers a build with **Android 13** choose Android 13 _firmware_ and not any later or older - if there is any
- if there is **no** matching firmware for that Android version of the AXP.OS build (e.g. because your device is very old), choose the latest one available.

{{< /callout >}}

## Generic

This includes:

- **Samsung S5 (klte)**

For flashing the firmware you can use e.g. [mAid](https://maid.binbash.rocks/) which has all required tools ready-to-use included.

The actual firmware files depend on your location and exact device model. 
The following are links to unverified and untested firmware locations. You might want to follow a specific guide on XDA or whatever source you trust.
It is up to you if you trust them or if you find better ones: [here](https://sfirmware.com/) or [here](https://samfrew.com/).

Follow the LineageOS wiki based on your device: https://wiki.lineageos.org/devices/ if one is available.

A great help on that topic is to follow the LineageOS wiki for your model: https://wiki.lineageos.org/devices/
You will be guided through the steps and also usually will see a hint what firmware version is required (e.g. [here](https://wiki.lineageos.org/devices/klte/install/#checking-the-correct-firmware) -> Android _6.0.1_)

Once you have the firmware use "heimdall" or JOdin to flash it (both can be found on the desktop in the folder "Samsung" when using [mAid](https://maid.binbash.rocks/)). 

Especially (but not only then!) when flashing the whole package it will fully reset the device back to STOCK, so..

 **ensure you always have a FULL backup first**.

### SM-J530F (j5y17lte)

For flashing the firmware you can use e.g. [mAid](https://maid.binbash.rocks/) which has all required tools ready-to-use included.

#### Enter Download mode

1. Power off your device first.
1. Wait for a few seconds for the device to completely turn off.
1. Press and hold the Volume Down, Home, and Power keys simultaneously.
1. Release the keys when the blue-colored “Warning” screen appears.
1. Press the Volume Up key to continue into Download Mode.

#### Flash latest firmware

Download: [HEIMDALL_SM-J530F_J530FXXS9CUE5_firmware.gz](https://github.com/AXP-OS/build/files/12323312/HEIMDALL_SM-J530F_J530FXXS9CUE5_firmware.gz)

Instructions:

1. BACKUP, all the following comes without any warranties! You do this on your own risk!
1. start Heimdall
1. in the tab "**Load package**" browse to the firmware
![image](/img/guides/heimdall_j5.png)
4. after pressing "Load package" the tab "**Flash**" becomes active -> Click the "**Flash**" tab
5. connect your device in ODIN download mode and let it flash
