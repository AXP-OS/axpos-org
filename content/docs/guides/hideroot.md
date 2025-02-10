---
title: "Hide Root"
type: docs
toc: true
aliases:
    - /hide-root
---
Some applications have very strict requirements before they will work. This affects mostly **_banking_** apps but also some _**company**_ apps or apps from your government, etc.

The main culprit here is to follow the topics here briefly, really. step by step. If you miss a single step all will fail and of course there is no guarantee it works for all apps - while it does for many.

Note: such an app causing issues because of device checks is named "_trouble-app_" in the next topics.

### Background

There are usually 2 types of checks:

- root check
- AVB (Android verified boot) state

The problem is that the implementation in **how** and how **deep** they check for these 2 differs and is of course app dependent.

### Simple hide

The following is quite easy to use and quickly done but it does not work for all apps:

1. uninstall your trouble-app (or force close and clear **storage(!)** - not just the cache)
1. install the trouble-app but do **NOT** start it yet
1. open Magisk -> _settings gear icon_
1. select to _hide_ the Magisk app (name it _SettingsNG_ or something non-suspicious)
1. enable _Zygisk_
1. enable to _force the deny list_
1. open the denial list
1. find your trouble-app and select **ALL** sub-options of that app (if you touch it it opens up)
1. reboot

Start your trouble-app. If it works now - GREAT! if not don't worry, go on with the next topic

### Advanced hide

1. install & setup a work-profile manager like [Insular (recommended)](https://f-droid.org/en/packages/com.oasisfeng.island.fdroid/)*
1. uninstall your trouble-app (or force close and clear **storage(!)** - not just the cache). yes you have to do that again if you followed the above topic.
1. install the trouble-app but do **NOT** start it (ever)
1. open Magisk -> _settings gear icon_
1. select to _hide_ the Magisk app (name it _SettingsNG_ or something non-suspicious)
1. enable _Zygisk_
1. enable to _force the deny list_
1. open the denial list
1. find your trouble-app and select **ALL** sub-options of that app (if you touch it it opens up)
1. do **NOT** start the trouble-app! actually you will **NEVER** start it from here and you can not uninstall** it either!
1. open the work-profile manager (e.g. Insular)
1. in the tab "Island" find the _hidden Magisk name_ you created before and remove/uninstall it from there (i.e **NOT** from Mainland). this has to be done after every AXP.OS upgrade (see topic "_**IMPORTANT**_").
1. clone the trouble-app into your work profile (Insular: _Tab "Mainland" -> select trouble-app -> press "+" icon_)
1. in the tab "Island" find the trouble-app and create a quick start launcher (_select -> 3dots -> Create Unfreeze & Launch shortcut_)
1. place it on your home screen and start it - and **only THAT from now on** (i.e. **not** from your main profile)

If it works now - GREAT! but ensure you read the next _**IMPORTANT**_ topic!

If it does not work:

- It can make sense to try another work-profile manager if the above way fails for you as the app devs are using different techniques.
- If it still does detect root or a custom OS you either have not followed the above steps briefly or you are out of luck.

*) _examples for other work-profile managers: [Shelter](https://f-droid.org/en/packages/net.typeblog.shelter/), (if you do not care about google trackers: [Island](https://play.google.com/store/apps/details?id=com.oasisfeng.island)), or [fill-in-another] ,....._

**) _You cannot uninstall the trouble-app from android (ever) because otherwise Magisk hide will not work. so you always need to keep that app(s) but never starting it!_

#### IMPORTANT: AXP.OS updates (Regular flavor)

> [!CAUTION]
> Magisk will clone itself into the work profile whenever you select to hide/unhide it. This is absolutely important to know as the root check of an app will for sure check if there is the origin Magisk app installed.
> 
> That means after every AXP.OS update (where you always should [unhide Magisk](/docs/guides/updating/automatic/) before) you have to open your work-profile manager (e.g. Insular) and remove the Magisk version there before you are safe again, so:
> 
> 1. before an AXP.OS upgrade: unhide Magisk (do not start any apps)
> 1. do the AXP.OS upgrade
> 1. after the upgrade: hide Magisk again, remember its name and remove it from the work profile

