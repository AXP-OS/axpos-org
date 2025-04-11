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
- _Google Rewards_
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

## Intercepting App installation check

Based on [#53](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues/53) an **experimental** option is available for

- Android 11
- _Android 13 (coming soon)_

This check has some drawbacks when enabling it:

1. every app which gets installed will be marked **persistently** as installed by `com.android.vending` which is either _Google Play_ or the _MicroG Companion App_ (aka _FakeStore_) depending on the AXP.OS flavor
1. a **reboot is required** to make a new installed/updated app work (again)
1. as the change is persistent the only way to **unmark an app as installed by `com.android.vending`** is either using a 3rd party tool which can change the installation source (e.g. Neo Backup on the Pro flavor) or without any 3rd party tools like this:
    - uninstall the app
    - disable the installation check toggle in developer options
    - install it again
    - _Note: changing packages.xml manually requires root/TWRP access and can easily break things up to a phone brick if you are not careful_
1. when using MicroG Companion App / FakeStore: some apps **cause an App crash of the Companion App**. Just ignoring that is usually enough.

We continuesly will look into solving/improving the above and hopefully get them all solved one day.

{{% details title="Developer hint: App crash of the Companion App" closed="true" %}}
```
E AndroidRuntime: java.lang.RuntimeException: Unable to bind to service com.android.vending.licensing.LicensingService@ca218e4 with Intent { act=com.android.vending.licensing.ILicensingService pkg=com.android.vending }: java.lang.SecurityException: Permission Denial: opening provider org.microg.gms.settings.SettingsProvider from ProcessRecord{621a62a 3113:com.android.vending/u0a94} (pid=3113, uid=10094) requires com.google.android.gms.permission.READ_SETTINGS or com.google.android.gms.permission.WRITE_SETTINGS
```
caused by: [this](https://github.com/microg/GmsCore/commit/9f4ac5951e534f646d4dee88c401397553d761e6)
{{% /details %}}

### Enabling installation interception

1. Enable [Developer Options](https://developer.android.com/studio/debug/dev-options#enable)
1. scroll down near to the bottom and enable `Intercept App installation check`<br/>![app_installsource_intercept](/img/guides/app_installsource_intercept.png)
1. scroll down and enable `Allow signature spoofing` (which is part of the next step but while you are here, do it now)
1. fully setup MicroG: go through the [whole guide](https://axpos.org/docs/guides/setup/aos/#optional-activate-google-support)
1. if the MicroG Self-Check has no empty boxes: re-install any problematic app
1. reboot(!)
1. enjoy

**Note:**
_keep in mind that any App update will need a reboot once after installing._
