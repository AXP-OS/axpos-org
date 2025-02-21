---
title: "DivestOS EOL"
type: docs
toc: true
aliases:
    - /Divest_EOL
---

Since the hard "over and out" cut ([source](https://web.archive.org/web/20241227223444/https://divestos.org/pages/news#end)) of Divest OS it was unclear if and how AXP.OS will continue.

State: `2025-02-20`

## Tasks

Main challenges which need to be solved (not ordered):

### critical

- [ ] automating CVE kernel patcher [1] (90% done)
- [x] automating the ASB patching process [2]
- [x] Webview replacement / automating Mulch patching [4]
    - [x] F-Droid release (undecided if)
- [x] Creating a `Slim` variant targeting Divest OS users (see [#35](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues/35)) [5]

### not critical

- [ ] Hypatia (not directly AXP.OS related) [3]
    - [x] creating a forked hypatia app
    - [ ] automating signature db updates (90% done)
    - [ ] F-Droid release (undecided)

## Progress details

### [1] CVE kernel patcher

The **kernel patching** is essential for an ongoing enhanced security. This part has been checked quickly and it seems to be solvable. Automation is the key though 
and it already has been [started to work](https://github.com/sfX-android/automation_scripts/tree/ansible/roles/kernel_patcher) on that topic. From what is known currently it *should* be possible to achieve continuing this part and even automate all or whole parts at least. As the process has just been started with it is unclear what challenges are behind the next corner though. **Even though the process of patching itself IS release critical the January build will not contain any new Kernel patches to not delay releases even more.** While the process is still ongoing we are close :)

#### UPDATE: 2025-02-20

I guess (i.e. hope) that I can finish soon the work on the CVE patcher. its code [had to be adapted](https://codeberg.org/AXP-OS/cve_checker/compare/8472020ac4f2b677fdd356d7af5b6318689c0834...main) and also the build automation routines had to be changed at several places. 

all the main changes have been done but there's still/just some fine tuning left.

it all took longer than thought (isn't that always the case..?!) but I had to walk deep through the code plus a lot of trial & error to get used to the process and fixing issues.

during wrapping my mind around all the required steps (with great help by Tad! thanks again dude..) I found that I cannot provide the **exact** content as Tad did. at least not without help.

for this you need to understand the process:

1. **automatic** fetch cve patches from *some* sources (e.g. CIP, Ubuntu, kernel.org)
1. partly **manual**: download incremental patches (increases a minor kernel version step-by-step, e.g. v4.9.200 -> v4.9.201)
1. **manual** review them
1. **manual** merge them with a global list of patches
1. **manual** test-apply them on some devices
1. **manual** re-do the same with several other sources which are not downloaded automatically
1. **manual** maybe even modify/extend patches to get them applied

the first part has been integrated in the automation process ([1](https://github.com/sfX-android/automation_scripts/blob/ansible/roles/kernel_patcher/tasks/cip.yml) and [2](https://github.com/sfX-android/automation_scripts/blob/ansible/roles/kernel_patcher/tasks/patch_download.yml)) and enhanced where possible.

the second part has been fully [automated](https://github.com/sfX-android/automation_scripts/blob/ansible/roles/kernel_patcher/tasks/incremental.yml). this is useful for still maintained LTS kernel versions and the most ideal way to get patches included.

especially the last 2 parts are something I cannot provide (alone) and so will not make it into AXP.OS for now.
but what we **get** are the Android patches (if they can be applied - which usually means on newer kernels only) plus the part which I can (almost) fully automate (CIP). 

CIP (https://gitlab.com/cip-project/cip-kernel/cip-kernel-sec.git) has the advantage that we get backported patches from kernel.org to (LTS) supported kernels which increases the chance it can be applied on even older kernels, too.

so even though a lot more can be done *manually* we get at least the major sources included. The kernel patches Google releases usually (often/always?) have made it already in the CIP content (sometimes this happens long time before!). From all I found the now missing parts are reducing the result slightly only - from now on at least. The reason for this is that a lot of major manual work has been done in the past already (thx to Tad!) and upcoming manual picks are hopefully rare (while they **will** happen, ofc).

If someone is interested for taken the manual parts - [let me know](https://axpos.org/docs/overview/#support).
actually it is about all the [sources](https://codeberg.org/AXP-OS/kernel_patches/src/branch/main/Kernel_CVE_Patch_List.header) not mentioned above.

during the code review and integration into the automation process I found also general problems when applying patches:

if a patch did not apply (even though a pre-flight check said it should) the process continued. that means it is a) hard to track that during a build and b) if a patch fails during the git am/apply process it MIGHT would have worked using the fuzzy patch command.
worst case: if 10 patches of 400 not applied you THINK they are while they weren't.
this has been enhanced in a way that if applying a patch fails it will try the patch command after.
this does not just increasing the chance that it applies but it now aborts the build process if that happens so there is no chance this stays undetected.

the patch count was wrong, too bc if a patch passed the pre-flight check it was counted even when the Fix_CVE_Patcher script outcommented it in the next step. this has been [fixed](https://github.com/AXP-OS/build/commit/f9325ee6a966378048149bc76d02e43e759a80fd) as well and a re-count of the real to be applied patches happens after outcommenting.

Kernel patches have been applied successfully up to **2025-02-19** on a first test device! Next step is doing clean builds and tests with all other devices asap.

**TL;DR: we will get CVE kernel patches with the February builds but in a (slightly) reduced manner.**

#### UPDATE: 2025-02-21

so.. there was still not just fine tuning left it seems. anyways but now the previously used workarounds which ensured proper patch handling have been moved to the cve patcher directly, i.e. it will write the correct patch lines including:
- fallback to patch cmd
- when fallback applies it will parse the patch and grab its metadata (author,date,subject)
- and applies the patch with that metadata + a link to the git repo pointing to the origin patch

Also the patch count is now 100% accurate! instead of counting those which _might_ apply (Divest) and instead of counting which _should_ apply (see [UPDATE: 2025-02-20](#update-2025-02-20)) we now count (cve_checker [v0.8.3 or later](https://codeberg.org/AXP-OS/cve_checker/releases)) the REAL amount of successfully **applied(!)** patches. nothing more, nothing less.

Some patches for Dec 2024 and January 2025 were not properly downloaded in one of the previous attempts so they have been re-imported.

I started to deprecate the use of [git submodules](https://github.com/AXP-OS/build/blob/axp/.gitmodules) within the main build repo already while they are still there to ensure nothing breaks during the current work on the CVE kernel patcher. Especially for the kernel patches this makes no sense anymore and these have been moved to the [manifest](https://github.com/AXP-OS/manifest/commit/af49c33a44fe122b89e8d316d544e3cd66ed2bc2) instead.

The automation had to be adapted again as well to reflect the changes above.



### [2] ASB patching process

The **ASB patching** process has been adapted and [implemented](https://github.com/sfX-android/automation_scripts/blob/ansible/roles/axp/common/tasks/main.yml#L38-L41) via Ansible.

#### [3] Hypatia

 **Hypatia** has been [forked](https://code.binbash.rocks/AXP.OS/packages_apps_LoveLaceAV) already, a server has been setup, ci/cd building of the apk works and half of the dozens of signature sources have been [automated](https://github.com/sfX-android/automation_scripts/tree/ansible/roles/hypatiadb) to fetch and convert for hypatia. Atm it is unclear how the project will be named and when it will been released officially though. In any case it is planned to make it available via F-Droid. There is also an attempt to maintain it [here](https://github.com/MaintainTeam/Hypatia/issues/1).

#### [4] Webview replacement

**Webview** has been forked and is [available](Browser) already.

#### [5] Divest-like flavor

The (so-called) **Slim** flavor was requested by several users which should not contain root or Google Play and provide a Divest-like experience. The issue tracker has been updated to ask users which variant the request is made for (defaults to the _Pro_ flavor). So if you came here as a Divest user and want such build feel free to [open a FR](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues/new?template=.github%2fISSUE_TEMPLATE%2fsupport-new-device-request.yaml) and select the SLIM flavor there. Read more about these AOS flavors [here](/Flavors).

