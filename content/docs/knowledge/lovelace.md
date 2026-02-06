---
title: "LoveLaceAV"
type: docs
toc: true
aliases:
    - /lovelace
    - /lovelaceav
    - /lovelaceAV
    - /LoveLace
    - /LoveLaceAV
    - /lav
    - /LAV
---
![image](/img/LoveLaceAV_web.png)

## About

Due to the [EOL of DivestOS](/Divest_EOL) the development of the world's first FOSS malware scanner for Android [Hypatia](https://github.com/Divested-Mobile/Hypatia) stopped as well.

At that time it was unclear if and when someone will take-over the work, especially for updating the most important parts of it: the signature databases. For this reason we forked Hypatia so this great project won't die.

## "LoveLaceAV"

#### Why this name?

The first part is a reference to [Ada Lovelace](https://en.wikipedia.org/wiki/Ada_Lovelace) a 19th century mathematician and also one of the first, if not the first, female programmer.

The name therefore follows the [original concept](https://en.wikipedia.org/wiki/Hypatia) of the Hypatia developer and is also a modest way to honor women who have achieved great things in the past.

The second part _"AV"_ is an abbreviation for _"Anti Virus"_.

#### Why this icon?

The LoveLaceAV icon shows the hash and the mathematical sum symbols on a shield which together form _hashsum_.

This is an analogy to the fact that LoveLaceAV is a signature-based scanner (signatures are in this case: hashsums).

All together this should symbolize that:
- you are **_protected_** by **_hashsum_** based checks

The _icon color_ was chosen to be similar to [AOSmium](/AOSmium), the other AXP.OS own app.

## LoveLaceAV vs. MaintainTeam-Hypatia

Time passed by and in the meantime another fork has been created [here](https://github.com/MaintainTeam/Hypatia) with some useful additions and fixes. LoveLaceAV was in sync with the MaintainTeam-Hypatia code for a while but switched to pure maintenance mode now. 
As soon as the LoveLaceAV databases are available in MaintainTeam-Hypatia by a button LoveLaceAV will (likely) be discontinued _(this might or might not change at any time)_. The requested change has been merged already [here](https://github.com/MaintainTeam/Hypatia/issues/69) while it is not yet available in any public build.

The main difference between the both projects is they are using a different default signature database. Both apps can be configured to use the database of the other project though.

That being said the database of LoveLaceAV is updated more frequently and contains more & different signatures ~~and also domains for the integrated link scanner which are not integrated in MaintainTeam-Hypatia at the moment~~ _(domain scanning has been re-added in their v3.17)_. 

For all details see the [Signature Databases](/docs/knowledge/lovelace/#signature-databases) topic on this page for all details.

#### TL;DR

Feel free to use the MaintainTeam-Hypatia app and add the LoveLaceAV databases there or directly use LoveLaceAV. Just try out what you like better! 

## Features

- Privacy-friendly, no calling home (network required only for database download and only to the specified server)
- Near zero battery impact: you'll never notice any impact on battery at all
- Extremely fast: it can scan small files (1MB) in <20ms, and even large files (40MB) in 1000ms.
- Memory efficient: with the default databases enabled it uses under 120MB.
- Regular scan: allowing selection of /system, internal storage, external storage, and installed apps
- Realtime scanner: can detect malware in realtime on write/rename in internal storage
- Completely offline: Internet is only used to download signature databases, files will never ever leave your device
- Persistence: will automatically restart on boot/update
- Tiny codebase: coming in at under 1000 sloc, it can be audited by even someone with basic programming experience
- Minimal dependencies: the app only uses libraries when necessary
- Signature databases can be enabled/disabled at the users demand

## Signature Databases

- Default database:
	- Signing key: `14C17E7F99EABF3F`
	- Database: https://lav.axpos.org/db
    - Hashes: 
        - `> 16 million`* _(regular database)_
        - `> 46 million`* _(with extended database enabled)_
    - Malicious domains detection (on-screen scanner): `> 900k`*
    - Update interval: `daily at 3:55 AM (UTC)`

- MaintainTeam-Hypatia:
	- Signing key: `5298C0C0C3E73288`
	- Database (button: `Github Mirror`): https://github.com/MaintainTeam/HypatiaDatabases/
    - Mirror Database _(can be added manually)_: https://codeberg.org/MaintainTeam/HypatiaDatabases/
    - Hashes:
        - `> 1 million`* _(regular database)_
        - _(no extended database available atm)*_
    - Malicious domains detection (on-screen scanner): `> 1 million`*
    - Update interval: `every 2 days at 1:00 AM (UTC)`

> [!TIP] Footnotes
> _*) see [Live database statistics](/docs/knowledge/lovelace/#live-database-statistics) for current values_

### Live database statistics

- LoveLaceAV: [https://lav.axpos.org/db](https://lav.axpos.org/db)
- MaintainTeam-Hypatia: [https://maintainteam.codeberg.page/HypatiaDatabases](https://maintainteam.codeberg.page/HypatiaDatabases)

## Download & Sources

While it is possible to download LoveLaceAV directly it is strongly recommended using the public **AXP.OS F-Droid repo**.

- Direct download: [here](https://codeberg.org/AXP-OS/packages_apps_LoveLaceAV/releases), [mirror](https://github.com/AXP-OS/packages_apps_LoveLaceAV/releases)
- F-Droid repo: [here](/F-Droid)
- Source code:
    - [LoveLaceAV - main](https://code.binbash.rocks/AXP.OS/packages_apps_LoveLaceAV) _(requires to login first!)_, [LoveLace AV - mirror](https://codeberg.org/AXP-OS/packages_apps_LoveLaceAV) _(no login required)_
    - [LoveLaceAV database tool](https://code.binbash.rocks/AXP.OS/tools_lovelaceav_convertdb) _(requires to login first!)_, [LoveLaceAV database tool - mirror](https://codeberg.org/AXP-OS/tools_lovelaceav_convertdb) _(no login required)_

## Credits

- Divested Computing Group for [Hypatia](https://divestos.org/pages/our_apps#hypatia)
- MaintainTeam-Hypatia: https://github.com/MaintainTeam/Hypatia
- ClamAV for the databases (GPLv2)
- ESET for extra databases (BSD 2-Clause)
- Nex (@botherder) for extra databases (CC BY-SA 4.0)
- Amnesty International for extra databases (CC BY 2.0)
- Echap for extra databases (CC BY 4.0)
- MalwareBazaar for extra databases (CC0)
- RecursiveFileObserver.java (GPL-3.0-or-later): Daniel Gultsch, ownCloud Inc., Bartek Przybylski
- GPGDetachedSignatureVerifier.java (GPL-2.0-or-later): Federico Fissore, Arduino LLC
- Petra Mirelli for the app banner/feature graphic and various tweaks.
- @eloitor: Translations work
- Various for signatures which can be found at [https://lav.axpos.org/db](https://lav.axpos.org/db)