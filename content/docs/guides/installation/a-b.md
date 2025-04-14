---
title: "A/B devices"
type: docs
toc: true
aliases:
    - /Installation-on-A‐B-devices 
---

## About

A/B devices have different slots for it's bootloader stack for easier recovery in case of boot errors. 

For some devices AXP.OS comes with the latest official vendor firmware included which requires the flash of AXP.OS twice (once for each slot) at the very first time. Any later flashes (OTA or manually) can be simply flashed once. 

If you are unsure about what firmware you have it never hurts to flash it twice.

## Requirements

1. a recent **recovery image** (see [Recovery Images](/Recovery-images) for options)
1. **a PC** to push AXP.OS to recovery (OTA is supported once installed)
1. an unlocked bootloader (not part of this guide! use www.google.com to find instructions)

## New to AXP.OS

When you are not sure or it is the very first time flashing AXP.OS:

1. flash the official AXP.OS [recovery image](/docs/guides/installation/recoveries/#official-axpos-recovery)
1. boot into recovery (e.g. by `adb reboot recovery`)
1. flash AXP.OS:
    - `Apply update -> Apply from ADB`
    - `adb sideload AXP.OS.zip`) --> do **not** boot yet though!
1. reboot into **recovery** again
1. start sideload and flash AXP.OS again (_see step 3_)
1. boot into system / AXP.OS

## Update AXP.OS

See [Updating AXP.OS](/Updating)

## Final note

> [!CAUTION]
> AXP.OS comes with its own recovery so if you **flash** a custom recovery it gets overwritten on next update! Even worse if you own a device which does not have a dedicated recovery partition (e.g. the OnePlus 6T) flashing TWRP will remove Magisk and needs to be manually re-flashed afterwards, so causing just trouble at the end.
