---
title: "Location"
type: docs
toc: true
aliases:
    - /Location
    - /gps
---

{{< callout type="info" >}}
Compared to most other systems, AXP.OS takes a slightly more extreme approach to location and does not work in the way most people expect.

Here's how it works.
{{< /callout >}}

## General

* GPS should lock within 2 minutes when outdoors and within 10 minutes indoors. Maximum GPS TTFF is 12.5 minutes due to their orbit and transmission rate.
* On Tensor devices both PSDS and SUPL can be used to speedup GPS TTFF. It is recommended to disable SUPL on these devices.
* On newer Qualcomm devices (ones that'd typically use xtra-daemon) SUPL is the only mechanism to obtain the almanac to speedup GPS TTFF. PSDS is not supported. It is not recommended to disable SUPL on these devices as it will cause very long lock times.
* On older Qualcomm devices (ones that'd typically use libloc) PSDS may work in addition to SUPL to speedup GPS TTFF. It is recommended to disable SUPL on these devices.
* On 20.0 and higher you can disable PSDS and SUPL in Settings > Location > Use assisted GPS. This setting will still allow them during emergency calls.
* On 17.1 and higher you can disable SUPL in Settings > Location > Force disable SUPL. This setting will not allow it even during emergency calls.
* On pre 17.1 you can disable SUPL by removing the `supl` APN type from your chosen APN preset.
* AXP.OS furthermore disables use of SUPL MSA as well as LPP and LPPe.

### Privacy enhancements

_See also [credits](https://divestos-archive.codeberg.page/page/network_connections.html)_

{{< callout type="info" >}}
Besides the following user-friendly description a more technical explanation can be [found here](https://raw.githubusercontent.com/AXP-OS/website_ref_dos/refs/heads/axp/static/misc/gnss.txt), too.
{{< /callout >}}

#### Predicted Satellite Data Service (PSDS)

_when actively using GPS_

**Purpose:** Used to [speed up](https://en.wikipedia.org/wiki/Time_to_first_fix) the process of acquiring a GPS lock.

##### Qualcomm devices

- IZat NLP has been removed from all devices
- Devices [utilizing xtra-daemon](https://raw.githubusercontent.com/AXP-OS/website_ref_dos/refs/heads/axp/static/misc/gnss/xtra-daemon.txt) to make this request will not do so as it has been removed
- Devices that [grant location stack access to serial number via the `sysfs_soc` label](https://raw.githubusercontent.com/AXP-OS/website_ref_dos/refs/heads/axp/static/misc/gnss/sysfs_soc.txt) will be denied access
- Devices that [use a source built libloc](https://raw.githubusercontent.com/AXP-OS/website_ref_dos/refs/heads/axp/static/misc/gnss/source_built_libloc.txt) will not include this information

**To summarize:**
- **These devices will not make the request**  
  akari, akatsuki, alioth, Amber, apollon, aura, aurora, avicii, axon7, barbet, beryllium, blueline, bonito, bramble, cheeseburger, cheryl, coral, crosshatch, davinci, dipper, discovery, dumpling, enchilada, equuleus, fajita, flame, FP3, FP4, griffin, guacamole, guacamoleb, h830, h850, h870, h910, h918, h990, hotdog, hotdogb, instantnoodle, instantnoodlep, jasmine_sprout, kebab, kirin, lavender, lemonade, lemonadep, lemonades, lmi, ls997, marlin, mata, mermaid, Mi8917, Mi8937, oneplus3, pioneer, platina, polaris, pro1, pro1x, redfin, rs988, sailfish, sargo, sunfish, taimen, twolip, ursa, us996, us997, vayu, voyager, vs995, walleye, wayne, whyred, xz2c, z2_plus

- **These devices cannot read the serial since 2023-05-03:**  
  blueline, bonito, bramble, cheryl, coral, crosshatch, discovery, flame, FP3, jactivelte, jflteatt, jfltespr, jfltevzw, jfltexx, jfvelte, kccat6, kirin, lentislte, mako, marlin, mata, mermaid, Mi8917, Mi8937, pioneer, pro1, redfin, sailfish, sargo, serrano3gxx, serranodsdd, serranoltexx, shamu, sunfish, taimen, voyager, walleye

- **These devices may make the request but have the information removed since 2023-05-05:**  
  athene, bacon, clark/17.1, crackling, d800, d801, d802, d803, d850, d851, d852, d855, ether, f400, FP2, h811, h815, ham, harpia, hlte, kipper, klte, ls990, m8, m8d, merlin, oneplus2, osprey, serrano3gxx, serranodsdd, serranoltexx, surnia, vs985, Z00T

- **These devices may make the request but use an older version which may not contain the information:**  
  apollo, d2att, d2spr, d2tmo, d2vzw, deb, debx, flo, flox, hammerhead, i9100, i9300, i9305, jactivelte, jflteatt, jfltespr, jfltevzw, jfltexx, jfvelte, m7, mako, n5100, n5110, n5120, thor, victara

- **These devices may make the request with all the information included:**  
  angler, bullhead, himaul, himawl, nex

- All devices not listed above must be assumed to make the request with all information included.

known to contain personal information or identifiers:
- `https://{,xtra}path[1-9].izatcloud.net/xtra{,2,3grc}.bin` - includes Android version, device manufacturer & model, carrier, and chipset serial number.

##### Broadcom devices (Samsung Exynos, Google Tensor, NVIDIA Tegra)

_should_ not contain any of the following: personal information, device identifiers, or other persistent identifiers:

- `https://gllto.glpals.com/7day/v5/latest/lto2.dat`
- `https://gllto.glpals.com/rto/v1/latest/rto.dat`
- `https://gllto.glpals.com/rtistatus4.dat`

#### Secure User Plane Location ([SUPL](https://en.wikipedia.org/wiki/Assisted_GNSS#SUPL))

_when actively using GPS_

**Purpose:** Used to [speed up](https://en.wikipedia.org/wiki/Time_to_first_fix) the process of acquiring a GPS lock and to provide your location when placing a call to emergency services.

**Notes:**
- The carrier/SIM along with emergency calls can override this server
- AXP.OS 17.1 and higher can disable SUPL via `Settings > Location > Force disable SUPL toggle`
- AXP.OS 14.1 through 16.0 can disable SUPL by removing the `supl` APN type from the selected APN via Settings
- This typically includes the IMSI with these requests, however thanks to @MSe1969, AXP.OS has *not* done so
- This typically is used with both MSA (server calculates location) and MSB (device calculates location) modes, however AXP.OS has disabled the MSA mode of operation due to privacy concerns

#### Fallback: Google

- [privacy policy](https://policies.google.com/privacy)

known to contain personal information or identifiers:
- `tls://supl.google.com:727X` - Includes MCC, MNC, and potentially vis


### AXP.OS - Slim

Location providers:

* "privacy-enhanced GPS" is the only provider of location, see also [microG comparison](https://axpos.org/docs/knowledge/flavors/#microg-implementation)
* Tablets or other devices without GPS support have no mechanism to obtain location.
* Network (cell tower, Wi-Fi, Bluetooth beacon) based location providers such as Google Play Services, Qualcomm IZat, and microG/UnifiedNlp are not supported.
* Enabling the location provider in microG/UnifiedNlp will not help in most cases as it does not have permission to be a system location provider. It can however provide location to some apps that also utilize the proprietary Play Services library for location handling.
* The primary reason for not supporting network location providers is that they effectively divulge your location to third-parties (eg. Google/Qualcomm/Apple/Mozilla) every time they are used. The alternative offline databases are too small to be realistically effective.


### AXP.OS - Pro

Location providers:

* "privacy-enhanced GPS" (see _General_ -> technical explanation above)
* Network (cell tower, Wi-Fi, Bluetooth beacon) based location providers: BeaconDB + Positon by microG

Since a while microG supports [BeaconDB](https://beacondb.net) and [Positon](https://positon.xyz) as alternative or additionally to GPS. Depending on your [country](https://beacondb.net/map/) BeaconDB works quite well and you can even contribute by using e.g. [NeoStumbler](https://github.com/mjaakko/NeoStumbler) or [TowerCollector](https://github.com/zamojski/TowerCollector).

Privacy statements:
- https://positon.xyz/docs/privacy/
- https://beacondb.net/privacy/

While Positon has way better coverage (it uses Apple's services) AXP.OS recommends BeaconDB where possible. When installing AXP.OS the first time you will be prompted to select a location provider when enabling microG.

_Note: even though [Graphene doesn't like Positon](https://grapheneos.org/articles/positon-location-service) keep in mind that there is no single evidence in this article to support the claimed position._

See also [microG implementation details](/microG)