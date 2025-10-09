---
title: "Device Requirements"
type: docs
toc: true
aliases:
    - /Device-Requirements
---
If you are applying for a currently unsupported device or [AXP.OS flavor](/Flavors), some requirements must be met before the request is (possibly) accepted.

## Soft requirements

### Android version

- oldest supported: Android **9**
- newest supported: Android **13**
- in progress: Android **15** (see [#94](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues/94))

At the moment **Android 9** is the oldest supported version and **Android 13** the newest supported version, regardless of the device age.<br/>
If your device does not fit between these versions but matches all other requirements feel free to request anyways. Just expect a way longer [bring-up time](#processing-requests) then.

Note: This might also take more of _your_ time when it comes to debugging issues during the process.

## Hard requirements

### The request itself

The **only** way to request a new device or AXP.OS flavor is by the projects [issue tracker](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues/new/choose).<br/>Requests over Chat, Forum, Mail etc will be ignored.

The request form must be properly filled with all required information and the user must be responsive to questions (either via the issue tracker or ideally using the official [support room](/docs/overview/#support))

### LineageOS

There must be either:
1. an *official* LineageOS (non-[GSI](https://developer.android.com/topic/generic-system-image) build) build or 
1. a **properly working** *unofficial* LineageOS (non-[GSI](https://developer.android.com/topic/generic-system-image)) build

for that device available.

Other custom OS variants (e.g. AOSCP, etc.) cannot be used as a basis and will be rejected.

#### Unofficial

Specific for _Unofficial_ LineageOS builds _(requests will be rejected if **any** of these does not apply)_:

1. must provide a proper _(local) manifest_ or **link to all(!) sources used** _(requester **must** add this information to the request)_
1. must not be heavily customized
1. must not have critical bugs or missing features
1. must not be a [GSI](https://developer.android.com/topic/generic-system-image) build

### Build & Test

1. there must be a user willing to test all core Features of the requested AXP.OS flavor
1. if it builds properly and the user testing went fine it will become finally a [community-level](/docs/knowledge/supportlevels/#by-the-axp-community) supported device.

## Removals

There are situations when a device which was previously supported gets removed again. Here a non-exclusive list of reasons why that might happen:

1. the sources (Android and/or Kernel) cannot be patched properly anymore
1. patches (especially backported ASB ones) which breaks booting or core features of Android (e.g. WiFi etc)
1. any other critical issue (e.g. important core features don't work anymore, device is not booting anymore, ...) and there is no user willing to help in debugging
1. devices with AXP.OS [community - level](/docs/knowledge/supportlevels/#by-the-axp-community) support will be released to the _unstable_ channel first and **require** a feedback by the community before they are released to the _stable_ channel. If there is no feedback by the community the device will likely get removed from the next build run and even from the support list if there is no feedback for longer time

## Processing requests

The exact order in which processing takes place and how long it takes for a device to be accepted is not exactly specified, but this is a rough guide:

|Type|Duration|
|-|-|
|AXP.OS flavor of an already supported device|Fast|
|new device _supported_ by LineageOS|Medium|
|new device **not** supported by LineageOS|Long|
|new device with an unsupported Android version|Longest|

## Major Release processing

When LineageOS supports a higher Android version for an already supported device it will _likely_ get the corresponding AXP.OS version, too.

Keep in mind that due to the massive amount of changes needed to bring up a new Major Release it will take a while until all AXP.OS dependencies support the new Major Release.

{{< callout type="important" >}} 
As soon as a device got migrated to the new Major Release there will be no builds released anymore for its _previous_ Android version.
{{< /callout >}}

### AXP team supported devices

Devices with AXP.OS [team - level](/docs/knowledge/supportlevels/#by-the-axp-team) support will get a new Major Release **automatically** (i.e. no request is required).

### AXP community supported devices

Devices with AXP.OS [community - level](/docs/knowledge/supportlevels/#by-the-axp-community) support will **not** get new Major Releases automatically.

Users owning such a device must open a new device request to get them migrated to a later Android version and so participate in testing and debugging.


