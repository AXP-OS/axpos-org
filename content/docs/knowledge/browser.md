---
title: "Browser"
type: docs
toc: true
aliases:
    - /Browser
---
## About

![image](https://github.com/user-attachments/assets/89bfb426-ed34-49dd-9733-8aa3eb54e5ca)

AXP.OS comes with its own **WebView** implementation and **browser** named [AOSmium](https://codeberg.org/AXP-OS/app_aosmium) and build by the AXP.OS project.

The WebView is _built-in_ and will be automatically kept updated with OS updates.<br/> 
Out-of-Band updates can be installed manually via: [Releases](https://codeberg.org/AXP-OS/app_aosmium/releases).<br/>
The builds there are properly signed so you can safely use them without trouble on next OTA update.

_Note: At the moment it is unclear if or when there will be an F-Droid version for the webview or the browser._

### Webview?!

The Android WebView component allows developers to display web content within their mobile applications.

In other words the Android Webview is a web browser engine that can be embedded within an app which is not just convenient for developers but also they do not need to handle security patches for it.

Some popular examples using Android's Webview:

- Facebook (news, videos, links, ...)
- Amazon (product descriptions, reviews, ...)
- MicroG -> Sign in page
- ebay (item listings, product descriptions, ...)
- slack (chat messages, files, ...)
- CNN (news articles, videos, ...)
- Spotify (artist profiles, album descriptions, ...)

and many many more!

_some more examples, details and credits for the above: [smallusefultips.com](https://smallusefultips.com/which-apps-run-on-the-webview-component)_

### Features

- [Chromium](https://www.chromium.org/Home/)-based
- Fork of [Mulch](https://gitlab.com/divested-mobile/mulch) by the Divested Computing Group
- Security focused (using [Vanadium's](https://github.com/GrapheneOS/Vanadium) patches)
- Minimizing anti-features
- While there are some privacy patches applied becoming a "privacy" browser is out of scope
- See the [README](https://code.binbash.rocks/AXP.OS/app_aosmium) for technical details and all credits

### Recommended settings

Some of these settings may not be available or may already be set depending on browser.
The cowboy 🤠 emoji is used to denote settings recommended for advanced/less annoyed users.

(Credits to [DivestOS](https://web.archive.org/web/20241227223444/https://divestos.org/pages/browsers#tuningChromium))

* 🤠 Privacy and security > Clear browsing data > At Startup > Check all boxes below
* Privacy and security > Safe Browsing > Standard protection
* 🤠 Privacy and security > Safe Browsing > Enhanced protection, at the cost of potentially reduced privacy
* Privacy and security > Always use secure connections > Enabled
* Privacy and security > Cross-origin referrer policy > Disable cross-origin referrer
* Privacy and security > WebRTC IP handling policy > Disable non-proxied UDP
* Privacy and security > Send a "Do Not Track" request > Enabled
* Privacy and security > Preload pages > No preloading
* 🤠 Privacy and security > Close (all open) tabs on exit > Enabled
* Site Settings > Motion sensors > Blocked
* Site Settings > JavaScript JIT > Blocked
* Site settings > Protected content > Blocked
* Site settings > Auto-verify > Disabled
* Navigate to chrome://flags > Darken websites checkbox in themes setting > Enabled > Relaunch
    * Google services > Help improve Chrome's features and performance > Disabled
    * Google services > Make searches and browsing better > Disabled
    * Privacy and security > Ad privacy > Ad topics > Disabled
    * Privacy and security > Ad privacy > Site-suggested ads > Disabled
    * Privacy and security > Ad privacy > Ad measurement > Disabled
