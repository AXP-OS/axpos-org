---
title: "Functionality Tables"
type: docs
toc: true
aliases:
    - /Functionality-Tables 
---
> [!IMPORTANT]
> The whole document is a markdown replacement of the original made by: [Divested Computing Group](https://web.archive.org/web/20241231213231/https://divestos.org/pages/functionality_tables), so all credits goes to them.
>
> AXP.OS used DivestOS as a base up to December 2024 (see [Divest_EOL](/Divest_EOL)) but the following still reflects the current state for AXP.OS (as of January 2025).

This page documents what hardware and software features are expected to be non-functional on AXP.OS. See also the [known issues](/Known-Issues) page if necessary.

### Hardware Features

While some hardware might not require proprietary userspace blobs, the hardware itself is non-free and runs proprietary firmware.

| **Name**            | **Critical** | **Status** | **Blobs Required**              | **Blobs Removed**    |
|---------------------|--------------|------------|---------------------------------|----------------------|
| Accelerometer/Gyro  | Yes          | Works      | Some devices                    | No                   |
| Audio               | Yes          | Works      | Yes                             | Some are             |
| Bluetooth           | Yes          | Works      | Yes                             | No                   |
| Camera              | Yes          | Works      | Yes                             | No                   |
| Cell Service        | Yes          | Works      | Yes                             | Some are             |
| Compass             | Yes          | Works      | Some devices                    | No                   |
| GPS                 | Yes          | Works      | Yes                             | Many are             |
| GPU                 | Yes          | Works      | Yes                             | No                   |
| HW Audio Decoding   | Yes          | Works      | Yes                             | No                   |
| HW Encryption       | Yes          | Works      | Yes                             | Some debug tools are |
| HW Packet Processor | Nice to have | Works      | Yes, but sources seem available | Some debug tools are |
| HW Video Decoding   | Yes          | Works      | Yes                             | No                   |
| IR Transceiver      | Nice to have | Works      | Yes                             | No                   |
| Light Sensor        | Nice to have | Works      | Some devices                    | No                   |
| NFC                 | Nice to have | Works      | Some devices                    | Some are             |
| Proximity Sensor    | Yes          | Works      | Some devices                    | No                   |
| Wi-Fi               | Yes          | Works      | Yes                             | Many are             |
| Wireless Charging   | Nice to have | Depends    | Some devices                    | WiPower blobs are    |

### Software Features

| **Name**                 | **Status**        | **Information**                                                                      |
|--------------------------|-------------------|--------------------------------------------------------------------------------------|
| Android Auto             | Does not work     | Requires Play Services                                                               |
| AudioFX                  | Does not work     | Many AudioFX blobs are removed                                                       |
| Chromecast               | Does not work     | Requires Play Services                                                               |
| Device Encryption        | Works             | Encryption is a must-have                                                            |
| DRM/HDCP                 | Purposely Removed | DRM is harmful to the user                                                           |
| eSIM/eUICC               | Works             | LPAd provided by OpenEUICC                                                           |
| Google Safetynet         | Does not work     | Requires Play Services                                                               |
| IMS/VoLTE                | Works             | Select IMS blobs are removed, but is kept working                                    |
| VoWiFi/Wi-Fi Calling     | Does not work     | Removed due to privacy/security concerns                                             |
| Qualcomm aptX            | Works             | On devices where it is available                                                     |
| RCS                      | Purposely Removed | RCS is a fundamentally broken replacement                                            |
| Tethering (BT/USB/Wi-Fi) | Works             | No blobs are required for Tethering                                                  |
| Wireless Display         | Unknown           | There are many different protocols. All Qualcomm Wireless Display blobs are removed. |


### Apps

See this [section](Frequently-Asked-Questions#appCompat) for more information. This section is largely focused on proprietary apps, as the vast majority of apps from eg. F-Droid work without issue.  
Disclaimer, the following section is largely user contributed, nor do we endorse or recommend any of the following apps.

| **Name**                         | **Category**    | **Status**              | **Information**                               |
|----------------------------------|-----------------|-------------------------|-----------------------------------------------|
| Ace Racer                        | Gaming          | Reported Working        | 2023/05                                       |
| Amazon Prime Video               | Media Streaming | Reported Mostly Working | 2023/05: Bumpy but works                      |
| Apex Legends Mobile (deprecated) | Gaming          | Reported Working        | 2023/01                                       |
| Apple Music                      | Media Streaming | Reported Working        | 2022/11                                       |
| Arena Breakout                   | Gaming          | Reported Working        | 2023/05                                       |
| BMO (Canada)                     | Banking         | Reported Working        | 2023/05                                       |
| Call of Duty Mobile              | Gaming          | Reported Broken         | 2024/01: They added a strict ABI check.       |
| Call of Duty: Warzone Mobile     | Gaming          | Reported Working        | 2023/05                                       |
| CIBC (USA+Canada)                | Banking         | Reported Working        | 2023/05                                       |
| Combat Master                    | Gaming          | Reported Working        | 2023/05                                       |
| Devil War                        | Gaming          | Reported Working        | 2023/05                                       |
| Devils Be Dead: Rise of Demons   | Gaming          | Reported Working        | 2023/05                                       |
| Discord                          | Communication   | Reported Mostly Working | 2023/05: Use microG to fix notifications.     |
| DKB-TAN2go                       | Banking         | Reported Broken         | 2023/05: microG may fix it.                   |
| DoorDash                         | Shopping        | Reported Broken         | 2023/04: Complains about OS, maybe SafetyNet. |
| Farlight 84                      | Gaming          | Reported Working        | 2023/05                                       |
| Flaming Durtles                  | Education       | Reported Working        | 2023/06                                       |
| Genshin Impact                   | Gaming          | Reported Working        | 2023/01                                       |
| Google Camera                    | Photography     | Tested Working          | 2023/04                                       |
| Google Maps                      | Navigation      | Reported Working        | 2023/05                                       |
| Google Play Music (deprecated)   | Media Streaming | Tested Working          | 2017/07: Doesn't rely on DRM.                 |
| Instagram                        | Social          | Reported Working        | 2024/08                                       |
| Just Run                         | Health          | Reported Working        | 2023/06                                       |
| League of Legends: Wild Rift     | Gaming          | Reported Working        | 2022/01                                       |
| LINE                             | Communication   | Reported Working        | 2023/06                                       |
| Lost Light                       | Gaming          | Reported Working        | 2023/05                                       |
| Microsoft Edge                   | Web             | Tested Working          | 2023/04                                       |
| Microsoft Lens                   | Productivity    | Reported Working        | 2023/05                                       |
| Monzo (UK)                       | Banking         | Reported Working        | 2024/07                                       |
| Moovit                           | Navigation      | Reported Working        | 2023/05                                       |
| Netflix                          | Media Streaming | Tested Broken           | 2022: Relies on Google's Widevine DRM         |
| New State Mobile                 | Gaming          | Reported Working        | 2022/01                                       |
| Opera Browser                    | Web             | Tested Working          | 2023/04                                       |
| OVPN                             | Utility         | Reported Working        | 2023/06                                       |
| Pandora                          | Media Streaming | Tested Working          | 2017: Doesn't rely on DRM                     |
| Papara (Turkey)                  | Banking         | Reported Working        | 2023/12                                       |
| Project Bloodstrike (beta)       | Gaming          | Reported Working        | 2023/05                                       |
| PUBG Mobile                      | Gaming          | Reported Working        | 2022/01                                       |
| Rainbow Six Mobile               | Gaming          | Reported Working        | 2023/06                                       |
| RSA SecurID                      | Utility         | Reported Working        | 2023/07                                       |
| Satori Reader                    | Reading         | Reported Working        | 2023/06                                       |
| SecureGo Plus                    | Banking         | Reported Working        | 2024/08                                       |
| Skiff Mail                       | Communication   | Reported Working        | 2023/06                                       |
| SkyShowtime                      | Media Streaming | Reported Broken         | 2023/05                                       |
| Soundcloud                       | Media Streaming | Tested Working          | 2017: Doesn't rely on DRM                     |
| Spotify                          | Media Streaming | Reported Mostly Working | 2024/04: Jam feature doesn't work             |
| Square Point of Sale             | Finance         | Tested Working          | 2017                                          |
| Steam                            | Gaming          | Reported Working        | 2023/05                                       |
| Steam Link                       | Gaming          | Tested Working          | 2023/01                                       |
| TD (USA+Canada)                  | Banking         | Reported Working        | 2023/05                                       |
| The Division Resurgence          | Gaming          | Reported Working        | 2023/06                                       |
| TK                               | Health          | Reported Working        | 2023/05                                       |
| UpNote                           | Productivity    | Reported Working        | 2023/06                                       |
| Vivaldi Browser                  | Web             | Reported Working        | 2023/05                                       |
| Waze                             | Navigation      | Reported Working        | 2023/07                                       |
| WhatsApp                         | Communication   | Reported Working        | 2023/04                                       |
| Yandex Browser                   | Web             | Tested Working          | 2023/04                                       |


