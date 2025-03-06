---
title: "Hide Root"
type: docs
toc: true
aliases:
    - /hide-root
    - /hideroot
    - /banking
    - /Banking
---
Some applications have very strict requirements before they will work. This affects mostly **_banking_** apps but also some _**company**_ apps or apps from your government, etc.

The main culprit here is to follow the topics here briefly, really. step by step. If you miss a single step all will fail and of course there is no guarantee it works for all apps - while it does for many.

{{< callout type="info" >}}
such an app causing issues because of device checks is named "_trouble-app_" in the next topics.
{{< /callout >}}

### Background

There are usually multiple types of checks:

1. _root_ check
1. **partly** covered here: _custom OS_ check (Insular is often enough to trick some apps)
1. **not** covered here: _AVB_ ([Android verified boot](https://source.android.com/docs/security/features/verifiedboot/boot-flow)) state
1. **not** covered here: _[Safetynet](https://en.wikipedia.org/wiki/SafetyNet) / [Play integrity/certified](https://developer.android.com/google/play/integrity/overview) and for >= A13 [here](https://developer.android.com/google/play/integrity/improvements)_

The problem is that the implementation in **how** and how **deep** they check differs and is of course app dependent. So even though the following guide works for many it may not work for you, i.e. only in situations where the app just checks for the existence of root and simple custom OS checks.

> [!CAUTION]
> For each of those checks which are not covered here Magisk modules may exist:<br/>
>
> AXP.OS strongly discourages using any of these if you are not want to expose your whole system to a third party. They might work, might don't do any harm and are not suspicious at all but we cannot and will not check or approve any of these modules.
> 
> Last but not least:<br/>**If your bootloader is in _locked_ state Magisk modules can even brick your whole device!**


### Simple hide

The following is quite easy to use and quickly done but it does not work for all apps:

1. uninstall your trouble-app (or force close and clear **storage(!)** - not just the cache)
1. install the trouble-app but do **NOT** start it yet
1. open Magisk -> _settings gear icon_
1. select _Hide the Magisk app_
1. give it a name you easily remember, e.g. _SettingsNG_ or anything non-suspicious (i.e. **do not** name it _MyRootApp_ etc)
1. if you have installed a work-profile manager like [Insular](https://f-droid.org/en/packages/com.oasisfeng.island.fdroid/) uninstall the now HIDDEN Magisk app from that work profile (in the App drawer simply search for the _hidden custom Magisk app name_ you created before -> `select work profile apps tab -> long press -> uninstall`)
1. enable _Zygisk_
1. enable to _force the deny list_
1. open the denial list
1. find your trouble-app and select **ALL** sub-options of that app (if you touch it it opens up)
1. reboot

Start your trouble-app. If it works now - GREAT! if not don't worry, go on with the next topic

### Advanced hide

The recommended work profile manager is: [Insular (recommended)](https://f-droid.org/en/packages/com.oasisfeng.island.fdroid/)*

1. install & start the work-profile manager to set it up
1. uninstall your trouble-app (or force close and clear **storage(!)** - not just the cache). yes you have to do that again if you followed the above topic.
1. install the trouble-app but do **NOT** start it (ever)
1. open Magisk -> _settings gear icon_
1. select _Hide the Magisk app_
1. give it a name you easily remember, e.g. _SettingsNG_ or anything non-suspicious (i.e. **do not** name it _MyRootApp_ etc)
1. enable _Zygisk_
1. enable to _force the deny list_
1. open the denial list
1. find your trouble-app and select **ALL** sub-options of that app (if you touch it it opens up)
1. do **NOT** start the trouble-app! actually you will **NEVER** start it from here and you can not uninstall** it either!
1. open the work-profile manager Insular
1. in the tab "Island" find the _hidden custom Magisk app name_ you created before and remove/uninstall it from there (i.e **NOT** from Mainland). this has to be done after every AXP.OS upgrade (see topic "_**IMPORTANT**_").
1. clone the trouble-app into your work profile (_Tab "Mainland" -> select trouble-app -> press "+" icon_)
1. in the tab "Island" find the trouble-app and create a quick start launcher (_select -> 3dots -> Create Unfreeze & Launch shortcut_)
1. place it on your home screen and start it - and **only THAT from now on** (i.e. **not** from your main profile)

If it works now - GREAT! but ensure you read the next _**IMPORTANT**_ topic!

If it does not work:

- It can make sense to try another work-profile manager if the above way fails for you as the app devs are using different techniques.
- If it still does detect root or a custom OS you either have not followed the above steps briefly or you are out of luck.

*) _examples for other work-profile managers: [Shelter](https://f-droid.org/en/packages/net.typeblog.shelter/), (if you do not care about google trackers: [Island](https://play.google.com/store/apps/details?id=com.oasisfeng.island)), or [fill-in-another] ,....._

**) _You cannot uninstall the trouble-app from android (ever) because otherwise Magisk hide will not work. so you always need to keep that app(s) but remember: NEVER start it/them!_

### IMPORTANT: AXP.OS updates (Pro flavor)

> [!CAUTION]
> Magisk will clone itself into the work profile whenever you select to hide/unhide it. This is absolutely important to know as the root check of an app will for sure check if there is the origin Magisk app installed.
> 
> That means after every AXP.OS update (where you always should [unhide Magisk](/docs/guides/updating/automatic/) before) you have to open your work-profile manager (e.g. Insular) and remove the Magisk version there before you are safe again, so:
> 
> 1. before an AXP.OS upgrade: unhide Magisk, see the next topic _Undo hide_ (and do not start any apps)
> 1. do the AXP.OS upgrade
> 1. after the upgrade: hide Magisk again, remember its name and remove it from the work profile

### Undo hide

1. open Magisk -> _settings gear icon_
1. select _Restore the Magisk App_
1. if you have installed a work-profile manager like [Insular](https://f-droid.org/en/packages/com.oasisfeng.island.fdroid/) uninstall Magisk app from that work profile (in the App drawer simply search for "Magisk" -> `select work profile apps tab -> long press -> uninstall`)

