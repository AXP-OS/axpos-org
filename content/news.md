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

## 2025-09-23

### The ASB drama

So it seems ([source](https://www.androidauthority.com/android-risk-based-security-updates-3597466/)) Google will release:

1. **monthly** _"high-risk"_ patches (if there are any)
1. **quarterly** _"all the rest"_

![hypothetical release cycle](https://www.androidauthority.com/wp-content/uploads/2025/09/Timeline-of-a-hypothetical-hisk-risk-Android-security-vulnerability.png.webp)
(image source: [androidauthority.com](https://www.androidauthority.com/android-risk-based-security-updates-3597466/))

This results in _massive_ quarterly updates but more worse: those not "high-risk" vulnerabilities have a fix ready and we have to wait for Google's mercy finally releasing them (and pray :pray: no one leaks/exploit them until then). Google decides who gets what and when.

The idea behind holding back patches is that it should (could?) even _protect_ users! How? Well the logic is: "hiding vulnerabilities will make them invisible to the bad guys". Okay, I'm being a little sarcastic here but nevertheless this is the same argument all closed-source disciples have: "security" by hiding information/code.

So, yes I get the point and yes, of course, it's much easier to write an exploit if I know the potentially dangerous vulnerability that it creates, but... is that the idea of Open Source development?

Some people say this quarterly move protects users because hiding vulnerabilities for longer time gives OEM's more time to implement the patches. We all know how well things like that work. What about the bad guys? Actually **they** have now more time, too for **exploiting** our phones. "Great".. Yes, they must first _know_ about these vulnerabilities but keep in mind: they are already fixed, there are (hidden) patches available, there were people who actually _found_ these vulnerabilities, OEM's involved as before but with more time a potential leak can happen.

Unfortunately (many) _humans_ have access to these patches and humans make faults (either tech-based ones or .. well money is a great thing.. if you have it..).

From the _bad guys_ POV it **is** great though: now they have way more time, they do not need to hack around to find vulnerabilities, there is the potential that they can access them months before the patches will be released and even more time if OEM's are still late on that quarterly ones. 

I do **not** believe that this approach is a great idea, for various reasons:

1. OEM's will still provide ASB patches (too) late, some may do it better than others but this quarterly move will not change the world
1. the hiding approach is a big step backwards in terms of transparency and security (yes, I believe that Open Source should be also open developed)
1. the whole thing stands and falls with patches not getting leaked (keep in mind there is an industry for selling zero-day exploits), interested parties are often not interested to let others KNOW that they have/use such exploits (so we might never get aware when they are used "in the wild")
1. it massively disadvantages the open source community and favors paying OEMs
1. what many people have been saying for years is finally coming "true": a custom OS is not as secure as an official / STOCK one* (at least this is how they will announce it)

So, bottom line: that really sucks.

*_one word regarding security compared to STOCK: of course OEM's had always better cards as they always got patches before they were released in public but the thing which has changed with that new quarterly approach is that the time span from the release of a fix up to its public release can be several months now, instead of just 1. On the other hand: a custom OS can still provide more security than a STOCK one, because security is not just security patches. For example using a hardened malloc like GrapheneOS provides which is also used by AXP.OS can prevent several malicious code executions even when a vulnerability is not yet patched. Besides that AXP.OS and other privacy oriented OS reduce the attack surface more than an OEM usually does. AXP.OS also [massively debloat](https://github.com/AXP-OS/build/blob/axp/Scripts/Common/Deblob.sh) and reduce calling-home like **no other OS does in that depth** (since DivestOS is EOL)._

### Real impact

What is the impact on AXP.OS?

1. **Kernel:** no change at all, AXP.OS patches all kernels independently via the [CVE Kernel patcher][cvepatcher] regardless (and additionally) to the ASB
1. **Android:** we all have to follow Google, so monthly patches may come .. or not

### Alternatives?

What are the alternatives then? Great question: that is why Google does not care at all. The greatest power of a monopolist is that it can ignore what others say and want. In other words: there are alternatives but they either depend on Android or they simply do not cover many devices.

Most interesting examples (in that order):
1. [postmarketOS](https://postmarketos.org) _(Alpine based, minimum reliance on Android code, devices may suffer missing drivers, security gaps)_
1. [Sailfish OS](https://sailfishos.org) _(forked/merged from Mer Linux, closed-source UI, needs some Android-driver reuse)_
1. [Ubuntu Touch](https://www.ubuntu-touch.io) _(dependencies on vendor/Android components via Halium, less full control compared to postmarketOS)_

As you can see the most interesting alternative to Android is (not surprisingly) a Linux based OS. Especially if you do not want to buy a new device or want to switch to Apple's interpretation of _"privacy"_. The most promising variant is [postmarketOS](https://postmarketos.org) as it follows open standards, uses a common and prominent Linux as its base and has the least dependencies on Android while trying to keep close to the mainline Linux kernel (for some devices at least). Sailfish OS has merged with Mer Linux and is not following an open approach for all its components while it is still a better choice than Ubuntu Touch when it comes to getting rid of Google/Android's dependencies.

While browsing through these alternative options you will quickly identify that just a few devices are supported or only older ones, or a lot of basic functionality is simply not working (often enough this includes camera and/or calling/sms).

The reason is that porting a device to a custom Android OS is already hard while porting it to a Linux one has its own challenges on top of that.

I personally do not think that any of these has the potential to _replace_ Android. Main reason is the closed-source practice for many parts of a smartphone and the massive amount of devices out there today and in the future. It is really impossible imho that the community can port all/most of these devices, it is already an issue for porting many to a custom _Android_ based OS for these reasons.

It all begins and ends with the hardware, it must be created and developed with an open source based approach and that includes all hardware parts of it. There are already phones (partly) made like this like the PinePhone, Jolla's phones or Volla as well but none of them has the potential (yet) a current Android device has right now. Maybe / hopefully that changes some day.

## 2025-09-03

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

This change includes the ASB security patches as well, of course. We already saw this in the [first-time ever empty July 2025 ASB](https://source.android.com/docs/security/bulletin/2025-07-01), the [August 2025 ASB](https://source.android.com/docs/security/bulletin/2025-08-01) and now with the [September 2025 ASB](https://source.android.com/docs/security/bulletin/2025-09-01) which all do not have any code references (atm of writing this) _(edit: now September got them)_.

In opposite ASB's before that change had code references linked, e.g. [June 2025 ASB](https://source.android.com/docs/security/bulletin/2025-06-01) and any other before that date.

Until now custom [OS][cusos] like DivestOS ([R.I.P](/Divest_EOL)), AXP.OS and others(?) scraped the ASB bulletin site to pick the required code changes for an ASB level. This is not possible anymore due to the mentioned changes.

#### OSV.dev to the rescue?

While doing some research I stumbled over the [osv.dev][osvdev] project provided by [Google themself](https://github.com/google/osv.dev/) which provides full details about all CVE's, their meaning and all that even before they are published at e.g. [nvd.nist.gov][nist] or [cve.org][cveorg] ?!

**Example with CVE-2025-0089**
- https://nvd.nist.gov/vuln/detail/CVE-2025-48558 -> _marked as reserved (atm of writing this)_
- https://www.cve.org/CVERecord?id=CVE-2025-48558 -> _marked as reserved (atm of writing this)_
- https://osv.dev/list?q=CVE-2025-48558&ecosystem=Android -> full details, incl. descriptions of related code functions etc and _(non-working)_ commit references
- which points after some research to: [the real commit](https://android.googlesource.com/platform/frameworks/base/+/0d30c78c8953adfc969a8dba8a58a8ea3571908c) taken from the tag [android-security-15.0.0_r10](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-security-15.0.0_r10) which is (as you can see) available in public and ready to pick!

This will be further investigated in the coming weeks, and if it proves to be reliable, it will be incorporated into the automated build process for AXP.OS.

### Where to go from here?

At the moment it is totally unclear if the code we can access right now and the osv.dev links are intentional and to be expected the same way in the future or if these will be hidden as well. We will see how Google will proceed, which and how they tag new patches etc _(while tags like [android-security-V.v.v_rXX](https://android.googlesource.com/platform/frameworks/base/+/refs/tags/android-security-15.0.0_r10) sound valid this is not mentioned in their new [release-cycle][aospcycle] and so might stop to appear at any time)_.

Things regarding the whole source code release process might also completely change in the next months until all has settled but we will see.

In any case AXP.OS will provide further updates which will include the regular changes and also include the [CVE kernel patches][cvepatcher] like from the beginning. These kernel security patches are fully independent from the Android source code and based on AXP.OS' own patching process.<br/>
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
- https://github.com/google/osv.dev/

[aospchanges]: https://source.android.com/docs/whatsnew/site-updates?year=2025#aosp-changes
[aospcycle]: https://source.android.com/docs/setup/contribute/release-lifecycle
[evilwp]: https://en.wikipedia.org/wiki/Don't_be_evil
[evilgiz]: https://gizmodo.com/google-removes-nearly-all-mentions-of-dont-be-evil-from-1826153393
[ggreview]: https://android-review.googlesource.com/q/branch:main
[patchlevels]: https://axpos.org/docs/knowledge/patchlevels/#the-axpos-patch-level
[cvepatcher]: https://codeberg.org/AXP-OS/kernel_patches
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