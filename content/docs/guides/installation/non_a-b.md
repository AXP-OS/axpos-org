---
title: "Non A/B devices"
type: docs
toc: true
aliases:
    - /Installation-on-Non-A‐B-devices
    - /install_nonAB
---

## About

Non-A/B devices do **not** have different slots for it's bootloader stack.

## Requirements

1. a recent **recovery image** (see [Recovery Images](/Recovery-images) for options)
1. a PC to load AXP.OS in recovery (OTA is supported once installed)
1. an unlocked bootloader (not part of this guide! use www.google.com to find instructions)

## New to AXP.OS

#### running incompatible vendor firmware (or if unknown)

If you are not sure whether the current firmware matches the AXP.OS build you want to install:

1. create a FULL [backup](/Backup-and-Restore) of all your data, pictures, etc and and save them somewhere **other** than on the phone (all data needs to be **wiped**)
1. flash latest device firmware as described in the device's install section
1. boot into recovery (e.g. by `adb reboot recovery`)
1. flash AXP.OS (e.g. with `adb sideload AXP.OS.zip`)
    - _note: some devices report something similar to: `(~94%) adb: failed to read command: No error`, which can be safely ignored_
1. ensure you factory reset (all your data will be erased!):
    - choose `Factory reset`
    - choose `Format data/factory reset`
1. boot into system / AXP.OS

#### running compatible vendor firmware

If you are 100% sure that you are using **compatible** firmware that matches the AXP.OS build:

1. create a FULL [backup](/Backup-and-Restore) of all your data, pictures, etc and and save them somewhere **other** than on the phone (all data needs to be **wiped**)
1. boot into recovery (e.g. by `adb reboot recovery`)
1. flash AXP.OS (e.g. with `adb sideload AXP.OS.zip`)
1. ensure you factory reset (all your data will be erased!):
    - choose `Factory reset`
    - choose `Format data/factory reset`
1. boot into system / AXP.OS

## Update AXP.OS

See [Updating AXP.OS](/Updating)

## Final note

> [!CAUTION]
> AXP.OS comes with its own recovery so if you **flash** a custom recovery it usually gets overwritten on next update! Even worse if you own a device which does not have a dedicated recovery partition (e.g. the OnePlus 6T) flashing TWRP will remove Magisk and needs to be manually re-flashed afterwards, so causing just trouble at the end.
