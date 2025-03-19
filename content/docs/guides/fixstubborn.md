---
title: "Fix stubborn apps"
type: docs
toc: true
aliases:
    - /Possible-fixes-for-stubborn-apps
    - /stubborn
    - /s
---
Some problems you might encounter are:

- "Google Play Service is not installed"
- your app's license check fails
- Map data of a navigation/map app is not shown (or a map within an app)
- the app does not behave as it should

## Background

Some apps are quite stubborn when it comes to get push notifications, showing map data and/or license checking. 
Some known apps are (to name just some examples): 
- _Threema_
- _Google Maps_
- _Tractive GPS_
- _Element / Schildi-Chat_
- ...

They are not (just) checking if there is the google play service installed but also check if the app is **linked** to the play store (i.e. exactly the package name: `com.android.vending`).

For these apps you likely get a warning/popup telling you that they cannot find google play services and/or they simply refuse to work and/or do not show any map data or (in case of Threema/Element/SchildiChat) activating their own push notification service.

The solution is quite simple: the app HAS TO be linked with the play store (i.e. open app info -> "installed by ..." should list "Google Play Store" and not e.g. Aurora or F-Droid etc.

### Possible solutions

#### Pro flavor / or Magisk manually installed

1. Uninstall the app and install it directly from the Google play store
2. Backup the app with [Neo Backup](https://f-droid.org/packages/com.machiav3lli.backup/), then in the Neo Backup settings: `Service -> "The installer package name"` set the name to `com.android.vending`, then simply restore the previous backup'ed app

After that check the app info page again -> it should show "installed by Google Play Store".

If you use e.g. Aurora to keep your apps updated ensure you blacklist these apps there so they do not stop working after an update - or follow the above to restore them after.

Last but not least check the topic in the [AXP.OS FAQ](/docs/knowledge/faq/#no-gcm-available--google-play-service-required)

#### Slim flavor

Due to the new introduced _Slim_ flavor (and so lacking root permission) a different solution is in the works ([details](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues/53)).
