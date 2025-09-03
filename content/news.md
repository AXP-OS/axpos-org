---
title: "News"
type: docs
toc: true
aliases:
    - /News
---

{{< callout type="info" >}}
Some major news related to the project can be found here. Do not expect updates here often, check the [changelog](/Changelog) and the Matrix [Support room](/docs/overview/#support) for more updates.
{{< /callout >}}

# 2025-09-03

### If Google simply decides to take the other route

[Rumors](https://discuss.grapheneos.org/d/21315-explanation-of-recent-changes-to-aosp-and-the-lack-of-major-impact-on-grapheneos) had been circulating since March 2025, gaining credibility until everything finally became crystal(?) clear:

- Google [changes][aospchanges] the way it [publishes][aospcycle] Android code changes
- Google does not care about custom [OS][cusos] development at all _(unless you are "Samsung/Oppo/etc," which are not what most referring to as a "custom [OS][cusos]")_
- Google _owns_ Android _(no suprise, everyone knew it but ..)_
- wasn't there a well known motto ...? _([don't be evil!?][evilwp], well and then the ["don't be evil" demote..][evilgiz])_
- but keep in mind: AOSP = [A]ndroid **[O]pen [S]ource** [P]roject !?

### What happened?

#### Source code hiding?

First of all I feel like there is a big misunderstanding when it comes to the latest decisions by Google. I hear a lot of people saying things like _Android becomes closed-source_, _Android code changes are all hidden in the future_ or _Custom OS development will die now!_

The change announced by Google sounds like a dramatic step at first, but let's take a closer look at the whole thing.

Google decided to [change][aospchanges] its way of [releasing][aospcycle] the source code for Android. In short: only when a new _stable_ version will be released, they will _release_ (i.e. _tag/create a branch of_) its source code to the public. They said the [A]ndroid [O]pen [S]ource [P]roject [stays](https://x.com/seangchau/status/1933029688202703062) open source _(could Google even stop doing so?*)_.

_* (Android as it is right now will always stay open source but Google can stop at any time and switch to a different license for any **new** code - if that is not depending on other open source parts with conflicting licenses. As Android is a whole universe of dependencies this might **never** happen and is way more complicated as it sounds first. Yes, Google owns Android and if they change their mind like they did with their [motto][evilgiz] then who knows what could happen. Personally I do not expect this though. What will more likely happen is more proprietary parts on top of Android and more bindings to their "Google Play Integrity", of course.)_

To be more clear: this change affects the `AOSP-main` branch only. **Nobody uses that branch anyways**. It was always unstable and not reliable so it is actually a _good_ move by Google making it read-only and instead refering to the new `android-latest-release` [branch](https://android.googlesource.com/platform/manifest/+/refs/heads/android-latest-release/default.xml#7) but.. well it might be just because the whole process is new but we do not had any code published for Android 16 since several months (but we can still use their gerrit, e.g. [searching for android16-release](https://android-review.googlesource.com/q/project:platform/frameworks/base+branch:android16-release)). For older releases like Android 15 and earlier there are [public available](https://android.googlesource.com/platform/manifest/+log/refs/tags/android-security-15.0.0_r10/default.xml) code changes (as usual by _tags_) since yesterday, 2nd of September, though.

The reason behind this change is [understandable][aawhy] though, mainly they claim it reduces a lot of work within Google's development process:

> What will change is the frequency of public source code releases for specific Android components. Some components like the build system, update engine, Bluetooth stack, Virtualization framework, and SELinux configuration are currently AOSP-first, meaning they’re developed fully in public. Most Android components like the core OS framework are primarily developed internally, although some features, such as the unlocked-only storage area API, are still developed within AOSP. ([source][aawhy])

> Because Google develops large portions of Android in its internal branch, the public AOSP branch often lags far behind what’s available privately. [...] This discrepancy forces Google to spend time and effort merging patches between the public AOSP branch and its internal branch. Due to how different the branches are, merge conflicts often arise. ([source][aawhy])

If it turns true that e.g. the framework part (really) gets completely hidden, custom [OS][cusos] developers are not able to get code changes in-time anymore (better said: for all parts which are not _AOSP-first_). They have to wait until Google releases the internal code changes to the public. 

So we can access and see code changes for A15 and earlier but not for A16 at all - while this might change in the next days, too. Likely they keep going with the older Android versions as before and do the branch approach with A16 and later only?!

#### Let's remove pixel trees

The other part of Google's new approach is that they completely removed the device tree's for their Google Pixel devices from the sources. This move is bad as these were used as a reference for custom [OS][cusos] developers and helped a lot to understand implementations of new features etc. Google's [statement](https://groups.google.com/g/android-building/c/c4_W34xH55I/m/Cu0jCJjtAwAJ): use the cuttlefish emulator _(emulator != hardware, especially when it comes to testing!!)_ must be a joke _(spoiler: no, it isn't)_.

#### Don't be evil (?)

.. btw: Google's ["new"][evilgiz] interpretation of _don't be evil_ has a longer [history][tad] which adds to the bad taste..

.. while on it: it does not stop here. Google recently pulled all factory images for its Google Pixel 4a ([sunfish](https://developers.google.com/android/images#sunfish)) device except the latest containing their "[fix][sunfishbat]" _(i.e. reducing battery capacity)_ for a battery issue. They also removed all the image downloads for its Google Pixel 6 ([bluejay](https://developers.google.com/android/images#bluejay)) device except the latest one, again due to a [battery issue](https://9to5google.com/2025/06/11/google-pixel-6a-battery-overheating-update-code/). While it sounds like a good choice it leaves a(nother) bad taste especially if your device is [not affected](https://support.google.com/pixelphone/thread/319310911/my-pixel-4a-is-junk-after-the-battery-software-update-can-i-reverse-or-uninstall-the-update?hl=en) and/or you require older binaries frome an older image.

### What does this mean for users?

_If Google has been teasing the community for years with ever-new ideas for demotivating developers, why is this new thing any different?_

**TL;DR: not (that) much** _(what users will see actually. of course delays will happen, especially in the next months)_

Actually, this all leaves a / an even more bad taste. Google does not care if a project like LineageOS or GrapheneOS (or even AXP.OS) get in trouble when they change their processes while especially the first 2 mentioned are the main reasons for the great success of Android at all. It would have been nice to consult with the community and involve them in the process but that's just wishful thinking if it comes to Google.

The recent changes making custom development [harder](https://www.androidauthority.com/google-not-killing-aosp-3566882/) and require reverse-engineering for Pixel devices now (as it needs to be done with almost any other vendor). Also the way how ASB patches will be integrated needs to be adapted depending on how Google proceeds.

_So, will there be no custom [OS][cusos] anymore for Google devices?_

Don't worry, this will not happen (anytime soon) but all custom [OS][cusos] devs were used to the fact the Google was friendly, i.e. not evil, and shared things other vendors never did. It's “just” another bad taste that Google leaves us with.

#### Android Security Bulletins

last but not least.. all this also influences **security patching**.

This change includes the ASB security patches as well, of course. We already saw this in the [August 2025 ASB](https://source.android.com/docs/security/bulletin/2025-08-01) and now with the [September 2025 ASB](https://source.android.com/docs/security/bulletin/2025-09-01) which both do not have any code references (atm of writing this).

In opposite ASB's before that change had code references linked, e.g. [June 2025 ASB](https://source.android.com/docs/security/bulletin/2025-06-01) and any other before that date.

Until now custom [OS][cusos] like DivestOS ([R.I.P](/Divest_EOL)), AXP.OS and others(?) scraped the ASB bulletin site to pick the required code changes for an ASB level. This is not possible anymore due to the mentioned changes.

#### OSV.dev to the rescue?

While doing some research I stumbled over the [osv.dev][osvdev] project provided by Google themself which provides full details about all CVE's, their meaning and all that even before they are published at e.g. [nvd.nist.gov][nist] or [cve.org][cveorg] ?!

**Example with CVE-2025-0089**
- https://nvd.nist.gov/vuln/detail/CVE-2025-48558 -> _marked as reserved (atm of writing this)_
- https://www.cve.org/CVERecord?id=CVE-2025-48558 -> _marked as reserved (atm of writing this)_
- https://osv.dev/list?q=CVE-2025-48558&ecosystem=Android -> full details, incl. descriptions of related code functions etc and _(non-working)_ commit references
- which points after some research to: [the real commit](https://android.googlesource.com/platform/frameworks/base/+/0d30c78c8953adfc969a8dba8a58a8ea3571908c) taken from the tag [android-security-15.0.0_r10](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-security-15.0.0_r10) which is (as you can see) available in public and ready to pick!

This will be further investigated in the coming weeks, and if it proves to be reliable, it will be incorporated into the automated build process for AXP.OS.

### Where to go from here?

At the moment it is totally unclear if the code we can access right now and the osv.dev links are intentional and to be expected the same way in the future or if these will be hidden as well. We will see how Google will proceed, which and how they tag new patches etc _(while tags like [android-security-V.v.v_rXX](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-security-15.0.0_r10) sound valid this is not mentioned in their new [release-cycle][aospcycle] and so might stop to appear at any time)_.

Things regarding the whole source code release process might also completely change in the next months until all has settled but we will see.

In any case AXP.OS will provide further updates which will include the regular changes and also include the [CVE kernel patches][kernelcve] like from the beginning. These kernel security patches are fully independent from the Android source code and based on AXP.OS' own patching process.<br/>
Due to the nature of how AXP.OS kernels getting patched from [upstream](https://kernel.org) and the [CIP project](https://gitlab.com/cip-project/cip-kernel/cip-kernel-sec) CVE fixes are often included long before an Android CVE has been even created.

## Credits & links

AXP.OS is heavily based on [LineageOS][los] and uses a massive amount of patches by the [GrapheneOS][gos] project and others like [CalyxOS](https://calyxos.org).<br/>
-> _See also the [Credits](/docs/credits/) page of the AXP.OS project_

- [LineageOS][los]: there is no statement (afaik)
- [GrapheneOS][gos]: [statement](https://discuss.grapheneos.org/d/21315-explanation-of-recent-changes-to-aosp-and-the-lack-of-major-impact-on-grapheneos)
- [CalyxOS][calos]: [statement](https://calyxos.org/news/2025/06/11/android-16-plans/) and project [on-hold](https://calyxos.org/news/2025/08/01/a-letter-to-our-community/) and [last-ota](https://calyxos.org/news/2025/08/27/last-ota-update-before-new-calyxos-release/)

some further readings:

- https://divested.dev/pages/blog#2025-08-27-android-issues
- https://calyxos.org/news/2025/06/11/android-16-plans/
- https://calyxos.org/news/2025/08/27/last-ota-update-before-new-calyxos-release/
- https://source.android.com/docs/whatsnew/site-updates?year=2025#aosp-changes
- https://www.androidauthority.com/google-android-development-aosp-3538503/
- https://osv.dev/list?page=3&ecosystem=Android
- https://android-review.googlesource.com

[aospchanges]: https://source.android.com/docs/whatsnew/site-updates?year=2025#aosp-changes
[aospcycle]: https://source.android.com/docs/setup/contribute/release-lifecycle
[evilwp]: https://en.wikipedia.org/wiki/Don't_be_evil
[evilgiz]: https://gizmodo.com/google-removes-nearly-all-mentions-of-dont-be-evil-from-1826153393
[ggreview]: https://android-review.googlesource.com/q/branch:main
[kernelcve]: https://axpos.org/docs/knowledge/patchlevels/#the-axpos-patch-level
[tad]: https://divested.dev/pages/blog#2025-08-27-android-issues
[sunfishbat]: https://support.google.com/pixelphone/answer/15701861
[aawhy]: https://www.androidauthority.com/google-android-development-aosp-3538503/
[nist]: https://nvd.nist.gov/
[osvdev]: https://osv.dev/list?page=3&ecosystem=Android
[cveorg]: https://www.cve.org/
[cusos]: https://axpos.org/about/#the-os
[los]: https://lineageos.org
[gos]: https://graphenos.org
[calos]: https://calyxos.org/