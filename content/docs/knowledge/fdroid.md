---
title: "F-Droid repositories"
type: docs
toc: true
aliases:
    - /F-Droid
    - /f-droid
    - /F-droid
    - /fdroid
    - /FDROID
    - /F-DROID
---
![image](/img/axp_fdroid.png)

## About

AXP.OS maintains two F-Droid repositories.

Main purpose is deploying out-of-band updates, e.g. for the [AOSmium based System Webview](/Browser) but also provide other apps build/made by the AXP.OS project.

There are 2 repos available:
- **Stable** (roughly tested)
and
- **Cutting Edge** (fully untested)

If you enable _Cutting Edge_ be aware that it _may_ contain unstable/broken/incomplete applications (however, you can choose which repository you prefer for each application).

AXP.OS builds starting from May 2025 onwards deliver both repositories as part of the [OS update](/devices/changelogs/2025/#f-droid).

> [!TIP]
> _It is not necessary to use AXP.OS to add and use these repositories! You can add them manually to get AXP.OS managed applications._

### Add them manually

1. _Stable:_
    - open [https://apps.axpos.org/repo/](https://apps.axpos.org/repo/) and scan the code from your phone
1. _Cutting Edge:_
    - open [https://cutting-apps.axpos.org/repo/](https://cutting-apps.axpos.org/repo/) and scan the code from your phone

### If you use AXP.OS and updated from a release before May 2025

**Reset F-Droid:**
1. long press the F-Droid icon
1. choose `App info`
1. choose `Storage and cache`
1. choose `Clear storage` (_Clear cache_ is not enough!)
1. open F-Droid and in `Settings` -> `Repositories` check if the AXP.OS **Stable** repo is there and _enabled_
1. **optional:** activate the _"Cutting Edge"_ repository

## Apps

Both repositories contain the same apps while the _Cutting Edge_ one gets updates first (see above).
The apps inside the F-Droid repo are:

- [AOSmium](/Browser) Browser
- [AOSmium](/Browser) Webview
- [LoveLaceAV](/lovelace)
- [PhoneSky](https://github.com/AXP-OS/packages_apps_phonesky/)
- [OpenEUICC](https://github.com/AXP-OS/packages_apps_OpenEUICC)
- [EasyEUICC](https://github.com/AXP-OS/packages_apps_OpenEUICC)

More to come, see: [here](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues/107) 

## Credits

- [F-Droid](https://fdroid.org)
- The F-Droid icon is licensed by [CC-BY-SA 3.0 Unported](http://creativecommons.org/licenses/by-sa/3.0/) and taken from [here](https://gitlab.com/fdroid/artwork/-/tree/master/fdroid-logo-2015)