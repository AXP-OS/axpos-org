---
title: "Post Install"
type: docs
toc: true
aliases:
    - /Post-Install
    - /post-install
---

> [!IMPORTANT]
> The whole document is a markdown replacement of the original made by: [Divested Computing Group](https://web.archive.org/web/20241231213231/https://divestos.org/pages/post_install), so all credits goes to them.
> 
> AXP.OS used DivestOS as a base up to December 2024 (see [Divest_EOL](/Divest_EOL)) but the following still reflects the current state for AXP.OS (as of January 2025).

Things you should do soon after installing.

### Install some apps

We created a list of recommended and tested apps [here](/docs/knowledge/faq/#can-you-recommend-any-apps).  
You can also get access to even more apps by enabling the included 'IzzyOnDroid' repo; be warned however that while all apps are largely open source, some may contain proprietary components/libraries/dependencies. Read more [here at IzzySoft.](https://apt.izzysoft.de/fdroid/index/info)

### Settings to optionally change after install

*   Mandatory step to fix F-Droid repository priority to ensure app updates for DivestOS: F-Droid > Settings > Repositories > Long-press and drag 'DivestOS Official' above 'F-Droid'.
*   Install a browser, we recommend our Mull and a shim is included by default so F-Droid should prompt you to install the full browser. Alternatively you can disable updates for the Mull shim and choose another browser at your discretion.
*   Setting a lockscreen password of 12+ characters is extremely recommended, at the minimum please use a 8+ digit pin. Pattern locks are not recommended.
*   16.0+: Change the DNS via Settings > Network & internet > Private DNS. We recommend Quad9 (dns.quad9.net) and DNS0 (zero.dns0.eu).
*   18.1+: Change the connectivity check server via Settings > Network & internet > Internet connectivity check.
*   \[2024-06 Update\] 18.1+: Change the system update server via Settings > System > Updater > 3dot > Preferences > Server Choice.
*   17.1+: If your device has 6GB or more RAM, it is strongly recommended to enable 'Secure App Spawning' in Settings > Security.
*   17.1+: Block native debugging via Settings > Security > "Enable native code debugging" > Disabled.
*   16.0+: Enable USB restrictions via Settings > Privacy > Trust > Restrict USB > Allow USB connections when unlocked.
*   Enable strict LTE mode if VoLTE works via Settings > Network & internet > SIMs > \[your carrier/SIM\] > Preferred network type > LTE only.
*   19.1+: Ensure 2G usage is blocked via Settings > Network & internet > SIMs > \[your carrier/SIM\] > Allow 2G > Disabled.
*   17.1+: Enable automatic idle reboots via Settings > Security > Auto reboot > 24 hours.
*   17.1+: Enable automatic Bluetooth turn off via Settings > Connected devices > Bluetooth timeout > 10 minutes.
*   Relock your [bootloader](/pages/bootloader#fastbootLocking) if supported.
*   Have a limited/expensive mobile data plan? Check out our saving data page [here](/pages/saving_data).
*   14.1/15.1 only: Enable 'Privacy Guard' for extra control over application permissions.
*   Utilizing and configuring 'Profiles' for your uses/environment can increase battery life and potentially enhance security.
*   Disabling lockscreen shortcuts can potentially reduce potential lockscreen bypass vulnerabilities.
*   Enabling 'Increasing ring volume' is very nice if you don't use it already.
*   \[DivestOS currently ships without VoWiFi support\] You may consider disabling Wi-Fi calling to not let your carrier learn such information about IP addresses, access-points, and potentially more accurate location.

### Update

There are monthly updates. You MUST read the Changelog page and **backup** your device **before each update**.

### Recommended reading

*   [mobile device best practices](https://media.defense.gov/2021/Sep/16/2002855921/-1/-1/0/MOBILE_DEVICE_BEST_PRACTICES_FINAL_V3%20-%20COPY.PDF)
*   [home network best practices](https://media.defense.gov/2023/Feb/22/2003165170/-1/-1/0/CSI_BEST_PRACTICES_FOR_SECURING_YOUR_HOME_NETWORK.PDF)
*   [public network best practices](https://media.defense.gov/2021/Jul/29/2002815141/-1/-1/0/CSI_SECURING_WIRELESS_DEVICES_IN_PUBLIC.PDF)
*   [compromised network indicators and mitigations](https://media.defense.gov/2020/Sep/17/2002499615/-1/-1/0/COMPROMISED_PERSONAL_NETWORK_INDICATORS_AND_MITIGATIONS_20200914_FINAL.PDF.pdf)
*   [social media best practices](https://media.defense.gov/2021/Sep/16/2002855950/-1/-1/0/CSI_KEEPING_SAFE_ON_SOCIAL_MEDIA_20210806.pdf)

### Backup

You are strongly recommended to backup your devices at least once a month or before system updates.

### Physical Protections

#### Apply a privacy screen protector

Privacy screen protectors limit the viewing angles of the screen they are applied to, resulting in a dramatic reduction of what people and cameras around you can see. They can be purchased for around $8 on eBay and similar sites. The glass ones are the best as always, but some older phones seem to only have the plastic film ones available. Be warned, they noticeably reduce the brightness and add an ever so slight screen door effect. If your phone doesn't have the brightest of screens it will become near-impossible to see in sunlight and also impact camera/videos experience.

#### Keep a faraday bag handy

Faraday bags for phones can be purchased for around $10. They are absolutely essential if you have a phone without a removable battery and are in high-risk areas often. Putting your phone in their inner flap will prevent all relevant radio signals coming/going to your phone.

#### Wear a hat

Plain baseball hats can be purchased for around $6 and provide a decent reduction in visibility of your face to cameras.

### Contribute

Please consider contributing in the form of testing, promoting, bug reports, code review, merge requests, [translations](https://hosted.weblate.org/engage/divestos/), mirrors, device donations, and financially to ensure the project's longevity.

