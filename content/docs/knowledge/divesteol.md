---
title: "DivestOS EOL"
type: docs
toc: true
aliases:
    - /Divest_EOL
---

Since the hard "over and out" cut ([source](https://web.archive.org/web/20241227223444/https://divestos.org/pages/news#end)) of Divest OS it was unclear if and how AXP.OS will continue.

State: `2025-02-19`

## Tasks

Main challenges which need to be solved (not ordered):

### critical

- [ ] automating CVE kernel patcher [1] (90% done)
- [x] automating the ASB patching process [2]
- [x] Webview replacement / automating Mulch patching [4]
    - [x] F-Droid release (undecided if)
- [x] Creating a `SLIM` variant targeting Divest OS users (see [#35](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues/35)) [5]

### not critical

- [ ] Hypatia (not directly AXP.OS related) [3]
    - [x] creating a forked hypatia app
    - [ ] automating signature db updates (90% done)
    - [ ] F-Droid release (undecided)

## Progress details

- [1] The **kernel patching** is essential for an ongoing enhanced security. This part has been checked quickly and it seems to be solvable. Automation is the key though 
and it already has been [started to work](https://github.com/sfX-android/automation_scripts/tree/ansible/roles/kernel_patcher) on that topic. From what is known currently it *should* be possible to achieve continuing this part and even automate all or whole parts at least. As the process has just been started with it is unclear what challenges are behind the next corner though. **Even though the process of patching itself IS release critical the January build will not contain any new Kernel patches to not delay releases even more.** While the process is still ongoing we are close :)

- [2] The **ASB patching** process has been adapted and [implemented](https://github.com/sfX-android/automation_scripts/blob/ansible/roles/axp/common/tasks/main.yml#L38-L41) via Ansible.

- [3] **Hypatia** has been [forked](https://code.binbash.rocks/AXP.OS/packages_apps_LoveLaceAV) already, a server has been setup, ci/cd building of the apk works and half of the dozens of signature sources have been [automated](https://github.com/sfX-android/automation_scripts/tree/ansible/roles/hypatiadb) to fetch and convert for hypatia. Atm it is unclear how the project will be named and when it will been released officially though. In any case it is planned to make it available via F-Droid. There is also an attempt to maintain it [here](https://github.com/MaintainTeam/Hypatia/issues/1).

- [4] **Webview** has been forked and is [available](Browser) already.

- [5] The (so-called) **SLIM** flavor was requested by several users which should not contain root or Google Play and provide a Divest-like experience. The issue tracker has been updated to ask users which variant the request is made for (defaults to the _Pro_ flavor). So if you came here as a Divest user and want such build feel free to [open a FR](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues/new?template=.github%2fISSUE_TEMPLATE%2fsupport-new-device-request.yaml) and select the SLIM flavor there. Read more about these AOS flavors [here](/Flavors).

