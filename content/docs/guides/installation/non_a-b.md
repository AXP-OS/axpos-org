---
title: "Non A/B devices"
type: docs
toc: true
aliases:
    - /Installation-on-Non-A‐B-devices
---

## About

Non-A/B devices do **not** have different slots for it's bootloader stack.

## Requirements

1. a recent **recovery image** (see [Recovery Images](/Recovery-images) for options)
1. a PC to load AXP.OS in recovery (OTA is supported once installed)
1. an unlocked bootloader (not part of this guide! use www.google.com to find instructions)

## New to AXP.OS but not on latest vendor firmware (or unsure)

When you are not sure or it is the very first time flashing AXP.OS:

1. flash latest device firmware as described in the device's install section
1. boot into recovery (e.g. by `adb reboot recovery`)
1. flash AXP.OS (e.g. with `adb sideload AXP.OS.zip`)
    - _note: some devices report something similar to: `(~94%) adb: failed to read command: No error`, which can be safely ignored_
1. boot into system / AXP.OS

## New to AXP.OS but latest vendor firmware

When you are 100% sure that you're on the latest supported firmware and never flashed AXP.OS before:

 - use your recovery as usual to flash AXP.OS (once) and you're done

## Update AXP.OS

See [Updating AXP.OS](/Updating)

## Final note

> [!CAUTION]
> AXP.OS comes with its own recovery so if you **flash** a custom recovery it usually gets overwritten on next update! Even worse if you own a device which does not have a dedicated recovery partition (e.g. the OnePlus 6T) flashing TWRP will remove Magisk and needs to be manually re-flashed afterwards, so causing just trouble at the end.
