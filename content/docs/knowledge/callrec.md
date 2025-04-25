---
title: "Call Recording"
type: docs
toc: true
aliases:
    - /r
    - /call-recording
    - /callrecording
    - /Callrecording
    - /CallRecording
---
## About

You can disable call recording restrictions which are usually enabled by default.

At the moment this feature is available for devices running:

- Android **11**
- Android **13**

_You can request it for other Android versions [here](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues)._

Technical details can be found at the [EXTENDROM wiki](https://github.com/sfX-android/android_vendor_extendrom/wiki/EXTENDROM_ALLOW_ANY_CALL_RECORDING).

### Legal notice

{{< callout type="warning" >}}
AXP.OS allows you to disable restrictions on call recording, which may or may not be illegal in your country. 
The user alone is responsible for checking this with local law and assumes sole responsibility if enabling this option is a criminal offense in their country.
{{< /callout >}}

A purely exemplary and not legally valid list of possible local legislation can be viewed [here](https://github.com/LineageOS/android_packages_apps_Dialer/blob/lineage-22.0/java/com/android/dialer/callrecord/res/xml/call_record_states.xml). If you are unsure or for a legally binding statement, ask a local lawyer!

## Enabling call recording

1. Enable [Developer options](https://developer.android.com/studio/debug/dev-options#enable) _(you do **not** need following "Enable USB debugging on your device" or any later topics)_
1. Navigate to the Developer options (`Android Settings -> System -> Developer options`)
1. Scroll all the way down to `Call recording support` and activate the toggle for `Disable call recording restrictions`
1. During a call touch the record button
1. Recordings will be stored at: `/sdcard/Download/`
 
## Disabling call recording

1. just swap the toggle again