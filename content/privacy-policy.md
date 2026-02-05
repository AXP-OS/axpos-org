---
title: Privacy Policy
toc: true
---

Last [changed](https://codeberg.org/AXP-OS_releases/axpos-org/blame/branch/hugo/content/privacy-policy.md): `2025-02-10`

# The AXP.OS Project

## Web Services

### Self-Hosting

The following services running in containers which themselves run on a `dedicated` server `owned` by the AXP.OS project. More details can be found here: [Server Setup](/Build-server-setup).<br/>
The server is physically located in: Germany (Frankfurt am Main).

##### `https://code.binbash.rocks`
---

- **Main purpose:** Source code hosting running [Gitea](https://gitea.com)
    - several CI/CD processes (e.g. building AOSmium and other packages, syncing Mirrors)
    - Issue tracking (e.g. Feature Requests, Bugs, but also the Project Roadmap and some Documentation)
    - Protected by [CrowdSec](#crowdsec)

##### `https://leech.binbash.rocks`
---
TOR alias:<br/>`http://e3tx35xwvqoihx36tjmnzurjcghs6kjwrwnen55jg7ujqilbaicutpid.onion`

- **Main purpose:** Downloads
    - downloads for all OS relevant parts of AXP.OS (i.e. OS + factory zip's, recovery images and more)
    - Protected by [CrowdSec](#crowdsec)
- What is received: User Agent, URI path, **NO** IP Address (replaced by `0.0.0.0` _before_ logging)
- How often: On every page visit
- Why it is received: creating [Download stats](https://leech.binbash.rocks:8008/theme/stats_axp_dl.html)
- When it will be deleted: Logs are kept for no longer than 90 days
- What else will it be used for: rate & bandwidth limiting
- How to anonymize: Use e.g. the Tor Browser
- Example: `0.0.0.0 - - [TIMESTAMP] "GET /axp/sunfish/ HTTP/2.0" 200 11584 "https://leech.binbash.rocks:8008/axp/sunfish/tests/" "-"`

##### `https://sfxota[-unstable].binbash.rocks`:
---

- **Main purpose:** OTA (Over The Air) Update Service
    - See [Updater](#updater)
    - Protected by [CrowdSec](#crowdsec)

##### `captiveportal.axpos.org/generate_204` (http/https)
---

- **Main purpose:** Online connectivity / Captive Portal test
    - See [Connectivity Checks](#connectivity-checks)
    - Protected by [CrowdSec](#crowdsec)

### Not self-hosting

##### `https://axpos.org`:
---

- **Main purpose:** Homepage
    - Documentation
    - Download links
    - See [Third parties / Website](#website)

### CrowdSec

About [CrowdSec](https://www.crowdsec.net/about)

*   How often: see the _How often_ line of any service protected by CrowdSec
*   What is received:
    * IP address
    * +service logs (e.g. webserver logs, see the _What is received_ line of any service protected by CrowdSec)
*   Why it is received: Protecting from several kinds of attacks (incl. (D)DoS, SQL injection, XSS, etc.)
*   When it will be deleted: DB and logs not kept longer than 15 days
*   Configuration:
    * All services using CrowdSec are configured to send **no data** at all to CrowdSec (i.e. opting out _sharing_)
    * Depending on the service the IP gets either banned or the user receives a Captcha to escape from a ban
    * A ban is taken in several steps (1. Captcha if possible, 2. Ban)
    * A ban duration depends on the detection (5 minutes up to 12 hours)
*   What else will it be used for: Nothing else
*   How to anonymize: Use the TOR Browser / Install Orbot and access the Onion addresses where available
*   _The CrowdSec [Privacy Policy](https://www.crowdsec.net/privacy-policy) does **not** apply for the AXP.OS services as we opt-out sharing any data_

## Operating System

*   The operating system does not contain any analytics and any requests are used only for supporting it

### Connectivity Checks

*   What is received: Static User Agent, IP Address
*   How often: On every Wi-Fi and cell connection
*   Why it is received: Used to determine if there is a working connection and if there is a captive portal
*   When it will be deleted _(if `AXP.OS` is selected)_: All requests to `generate_204` are never logged
*   What else will it be used for _(if `AXP.OS` is selected)_: Nothing else
*   How to disable: Toggle in settings app (noted below) or `adb shell settings put global captive_portal_mode 0;`
*   Settings can be accessed via:
    *   14.1/15.1: Settings > Network > Data usage > Disable Captive Portal
    *   16.0/17.1: Settings > Network & Internet > Advanced > Captive portal mode
    *   18.1/19.1/20.0/22.2: Settings > Network & Internet > Advanced > Internet connectivity check

### Updater

*   What is received: Device Model, Flavor, Incremental Build ID, Default User Agent, **NO** IP Address (redacted _before_ logging)
*   How often: On every boot and also once per week
*   Why it is received: Used to serve system updates
*   When it will be deleted: Logs are kept for no longer than 90 days
*   What else will it be used for: creating [OTA stats](https://leech.binbash.rocks:8008/theme/stats_axp_ota.html)
*   How to anonymize: Install Orbot and enable 'Perform requests over Tor'
*   How to disable: Disable 'Auto updates check'
*   Settings can be accessed via:
    *   9+: Settings > System > Advanced > AXP.OS updates > 3dot > Preferences
*   Example: `- - - [TIMESTAMP] "GET /axp-slim/api/v1/cheetah/slim/engemy20250123212920 HTTP/1.1" 200 3683 "-" "Dalvik/2.1.0 (Linux; U; Android 13; Pixel 7 Pro Build/TQ3A.230901.001)"`

### AXP.OS F-Droid Repos

*   What is received: Repo Index Requests/App APK Requests/App Icon Requests, F-Droid Version, IP Address
*   How often: Once per day
*   Why it is received: Used to serve apps and their updates
*   When it will be deleted: Web server logs are kept for no longer than two weeks
*   What else will it be used for: Nothing else
*   How to anonymize: Install Orbot and enable 'Use Tor' in F-Droid > Settings
*   How to reduce: Decrease the 'Automatic update interval' in F-Droid > Settings
*   How to disable: Disable the 'AXP.OS' repos in F-Droid > Settings > Repositories
*   Example: `[IP Address] - - [Timestamp] "HEAD /fdroid/official/index-v1.jar HTTP/1.1" 200 - "-" "F-Droid 1.13.1"`

## Apps

### LoveLaceAV

*   What is received: Signature Database Requests, IP Address
*   How often: Manually
*   Why it is received: Used to serve signature databases
*   When it will be deleted: Web server logs are kept for no longer than 15 days
*   What else will it be used for: Nothing else
*   How to anonymize: Install Orbot and enable 'Download over Tor'
*   Example: `[IP Address] - - [Timestamp] "GET /MalwareScannerSignatures/hypatia-sha1-bloom.bin HTTP/1.1" 304 - "-" "Hypatia"`

### Aurora Store

*   Who: Google
*   What is received: IP Address, search query, packagename of any new app getting installed
    * _Timezone, MCC & MNC:_ stripped & replaced
    * _List of installed apps:_ can be filtered in App settings 
    * _When adding a Google account:_ account details
*   How to anonymize: Install Orbot and enable 'Proxy' in `Aurora Store -> Settings -> Network`
*   How to reduce: Decrease the 'Automatic App update' `Aurora Store -> Settings -> Updates`
*   How to disable:
    * `Long press App icon -> App info -> Disable`
    * and/or remove the `Network` permission
*   Privacy Policy: [Aurora Store](https://gitlab.com/AuroraOSS/AuroraStore/-/blob/master/POLICY.md)
*   Privacy Policy: [Google](https://policies.google.com/privacy)

## _Pro_ flavor

### Neo Launcher

*   Who: Neo Launcher developer
*   How often: manually, when requesting support
*   How to disable:
    * `Long press App icon -> App info -> Permissions` remove: `Network`
*   Privacy Policy: [Neo Launcher](https://neolauncher.github.io/privacy_policy.html)

### microG

*   Who: Google
*   Network Connections [@Google](https://github.com/microg/GmsCore/wiki/Google-Network-Connections)
*   microG's [Implementation](https://github.com/microg/GmsCore/wiki/Implementation-Status)
*   How to disable:
    * `Long press App icon -> App info -> Disable`
    * `Developer options -> Signature Spoofing -> Disable` (note: this disables PhoneSky as well)
    * and/or remove the `Network` permission
    * and/or remove the `Signature Spoofing` permission
*   Privacy Policy: [Google](https://policies.google.com/privacy)
*   Privacy Policy microG: N/A

### PhoneSky

*   Who: Google
*   How often: on regular intervals, any app which depends on it (e.g. license checks)
*   How to disable:
    * `Long press App icon -> App info -> Disable`
    * `Developer options -> Signature Spoofing -> Disable` (note: this disables microG as well)
    * and/or remove the `Network` permission
    * and/or remove the `Signature Spoofing` permission
*   Privacy Policy: [Google](https://policies.google.com/privacy)

### Magisk

*   Who: Github
*   How often: on regular intervals
    * _(note: AXP.OS recommends disabling the check to avoid device bricks)_
*   How to disable:
    * `Magisk -> Settings (gears icon) -> toggle update check`
    * and/or `Long press App icon -> App info -> Permissions -> remove: Network`
*   No Privacy Policy policy available for Magisk itself
*   Privacy Policy: [Github¹](https://docs.github.com/en/pages/getting-started-with-github-pages/about-github-pages#data-collection) [Github²](https://docs.github.com/en/site-policy/privacy-policies/github-general-privacy-statement)

## Chat room (Matrix)
    
Matrix homeservers share user data with the wider ecosystem over _federation_. Federated homeservers can be located _anywhere_ in the world, and are subject to local laws and regulations.<br/>
When you send messages or files in the AXP.OS room, a copy of the data is sent to all participants in the room, including participants who join the room in future. If these participants are on different homeservers than you, your username, display name, messages and files may be replicated across each participating homeserver.

Federated homeservers are outside the control area of AXP.OS.

Overall it is important to choose a homeserver service you trust or host your own one if possible.

*   What is received: _depends on the chosen homeserver_
*   How often: join, leave, post, delete, ping
*   Why it is received: Used to provide the chat service to you
*   When it will be deleted: _depends on the chosen homeserver and federation configuration_
*   What else will it be used for: _depends on the chosen homeserver provider_
*   How to anonymize: Use a throwaway username. Route your Matrix client over Tor.
*   Example Privacy Policy for: [matrix.org](https://matrix.org/legal/privacy-notice/) _(note: if you are using a different homeserver, this does not apply_)

# Third parties

Third parties are used to support basic functions along with features and apps.

## Website

*   This website is hosted at Codeberg and has a minimum-collection policy.
*   How often: On every page visit
*   Why it is received: Used to serve the web pages to users
*   When it will be deleted: Logs are kept for no longer than 7 days
*   What else will it be used for: Nothing else
*   How to anonymize: Visit the site using the Tor Browser
*   Privacy Policy: [Codeberg](https://codeberg.org/Codeberg/org/src/branch/main/PrivacyPolicy.md)

## Connectivity Checks

*   Who: Google
*   Description: Used to determine if there is a working connection and if there is a captive portal
*   What they receive: Static User Agent, IP Address
*   How often: On every Wi-Fi and cell connection
*   How to disable: Toggle in settings app (noted below) or `$ adb shell settings put global captive_portal_mode 0;`
*   Settings can be accessed via:
    *   14.1/15.1: Settings > Network > Data usage > Disable Captive Portal
    *   16.0/17.1: Settings > Network & Internet > Advanced > Captive portal mode
    *   18.1/19.1/20.0: Settings > Network & Internet > Advanced > Internet connectivity check
*   Privacy Policy: [Google](https://policies.google.com/privacy)

## Network Time Protocol

*   Who: pool.ntp.org volunteers
*   Description: Used to set an accurate (clock) time
*   What they receive: IP Address
*   How often: On every boot
*   Privacy Policy: unavailable

## Fallback Domain Name System Lookups

*   Who: Quad9
*   Description: Used to translate domain names into IP addresses to establish network connections, only when no other DNS was advertised by the network
*   What they receive: DNS requests, IP Address
*   How often: Every network request to a non-cached and non-expired domain
*   Privacy Policy: [Quad9](https://www.quad9.net/privacy/policy)

## F-Droid Official Repo

*   Who: F-Droid
*   What they receive: Repo Index Requests/App APK Requests/App Icon Requests, F-Droid Version, IP Address
*   How often: Once per day
*   Why they receive: Used to serve apps and their updates
*   How to anonymize: Install Orbot and enable 'Use Tor' in F-Droid > Settings
*   How to reduce: Decrease the 'Automatic update interval' in F-Droid > Settings
*   How to disable: Disable the 'F-Droid' repos in F-Droid > Settings > Repositories
*   Privacy Policy: [F-Droid Security Information](https://f-droid.org/docs/Security_Model)
