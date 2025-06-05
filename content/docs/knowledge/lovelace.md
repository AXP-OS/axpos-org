---
title: "LoveLaceAV"
type: docs
toc: true
aliases:
    - /lovelace
    - /lovelaceav
    - /lovelaceAV
    - /lav
    - /LAV
---
![image](https://codeberg.org/AXP-OS/packages_apps_LoveLaceAV/raw/branch/merge/app/src/main/res/mipmap-xxhdpi/ic_launcher_foreground.png)

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

Time passed by and in the meantime another fork has been created [here](https://github.com/MaintainTeam/Hypatia) with some useful additions and fixes. At the moment LoveLaceAV is in sync with the MaintainTeam-Hypatia code and will continue this way as long as there is no important reason to change this.

That means LoveLaceAV merges changes from MaintainTeam-Hypatia via CI/CD and the only difference between the both projects are different signature databases at the moment.

That being said the database of LoveLaceAV is updated more frequently, contains more signatures and also domains for the integrated link scanner which are not integrated in MaintainTeam-Hypatia at the moment.

See also the [Signature Databases](/docs/knowledge/lovelace/#signature-databases) topic on this page for all details.

#### TL;DR

Feel free to use the MaintainTeam-Hypatia app and add the LoveLaceAV databases there or directly use LoveLaceAV. Up to you! We also created a request to integrate the LoveLaceAV databases by a button: [here](https://github.com/MaintainTeam/Hypatia/issues/69).

## Features

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
    - Hashes: `> 7 million`*
    - Blocked domains (link scanner): `> 500k`*
    - Update interval: `daily at 7:00 AM and 08:00 PM (UTC)`

- MaintainTeam-Hypatia:
	- Signing key:`5298C0C0C3E73288`
	- Database (button `Github Mirror`): https://github.com/MaintainTeam/HypatiaDatabases/
    - Mirror Database (can be added manually): https://codeberg.org/MaintainTeam/HypatiaDatabases/
    - Hashes: `> 5 million`*
    - Blocked domains (link scanner): `0`*
    - Update interval: `every 2 days at 1:00 AM (UTC)`

> [!TIP]
> _*) see [All database statistics](/docs/knowledge/lovelace/#all-database-statistics) for current values_

### All database statistics

- LoveLaceAV: [https://lav.axpos.org/db](https://lav.axpos.org/db)
- MaintainTeam-Hypatia: [https://maintainteam.codeberg.page/HypatiaDatabases](https://maintainteam.codeberg.page/HypatiaDatabases)

## Download

While it is possible to download LoveLaceAV directly it is strongly recommended using the public **AXP.OS F-Droid repo**.

- Direct download: [here](https://codeberg.org/AXP-OS/packages_apps_LoveLaceAV/releases), [mirror](https://github.com/AXP-OS/packages_apps_LoveLaceAV/releases)
- F-Droid repo: [here](/F-Droid)

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