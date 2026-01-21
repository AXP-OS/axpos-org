---
title: "Signatures"
type: docs
toc: true
aliases:
    - /Signatures
    - /Verify
---
## General

- **Apps** within AXP.OS itself are signed with the corresponding build keys
- **every device** has its own signing key set**¹**
- **flavors** of the **same** device have **different** signing key sets**¹** (see [AOS-Flavors](/Flavors))
- Apps provided by **3rd party's** might have their own signature
- Apps which are directly **part of AXP.OS** (or made by them) are signed by the common AXP.OS app signature (see next topic)

Notes:
- **¹)** `apps avb avb_pkmd bluetooth cyngn-app cyngn-priv-app extra media networkstack platform releasekey sdk_sandbox shared testkey verity`

## AXP.OS app signature

Starting in January 2025 apps will use a new signing key which affects both automatic releases provided via CI/CD and integrated within the OS building process. The main reason is that keys need to be stored within the CI/CD system and AXP.OS keys should be never exposed to a 3rd party - even though they claim to store them encrypted. Moving to the AXP.OS git server ensures that. The other reason is moving to a modern key algorithm ([ECDSA](https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm) instead of [RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem)), [more1](https://nordvpn.com/blog/ecdsa-vs-rsa/),[more2](https://www.baeldung.com/cs/encryption-asymmetric-algorithms)). 

**TL;DR: the new key is way smaller while the security level is dramatically increased (521-bit ECDSA == 15360-bit RSA).**

All apps have been fully migrated to the [AXP.OS git server](https://code.binbash.rocks) and uses the new key.<br/>
Releases will be made on [Codeberg](https://codeberg.org/AXP-OS/) and mirrored to [Github](https://github.com/AXP-OS).

### Current

_Since January 2025_

- [AOSmium @Codeberg](https://codeberg.org/AXP-OS/app_aosmium) | [AOSmium @Github](https://github.com/AXP-OS/app_aosmium) (no LFS!)
- [LoveLaceAV @Codeberg](https://codeberg.org/AXP-OS/packages_apps_LoveLaceAV) | [LoveLaceAV @Github](https://github.com/AXP-OS/packages_apps_LoveLaceAV)
- [Phonesky @Codeberg](https://codeberg.org/AXP-OS/packages_apps_phonesky) | [Phonesky @Github](https://github.com/AXP-OS/packages_apps_phonesky)
- [OpenEUICC @Codeberg](https://codeberg.org/AXP-OS/packages_apps_OpenEUICC) | [OpenEUICC @Github](https://github.com/AXP-OS/packages_apps_OpenEUICC)

AXP.OS users can install releases from these sources as an update to the included version.

```bash
Signer #1 certificate DN: CN=APK SIGNING KEY, OU=AXP.OS, O=AXP.OS, L=N/A, ST=N/A, C=DE
Signer #1 certificate SHA-256 digest: 005c9805d501bf50c1a8bfd3204b6908843088581fdcf3db8ab4f688ffc0e7b6
Signer #1 certificate SHA-1 digest: 53c4021704a4a565e4833d0620eb38f6808e1316
Signer #1 certificate MD5 digest: 4ff29417c66aeb46375d9e9913b9ffd2
Signer #1 key algorithm: EC
Signer #1 key size (bits): 521
Signer #1 public key SHA-256 digest: f002a63815f5433343677dcbabe110bd1a83a3483136fc97d6385bbe09088bc4
Signer #1 public key SHA-1 digest: 4248c76806aa5a8d5fb897061c3fc01414becf9d
Signer #1 public key MD5 digest: b6c4006030da70fd1a1692c0124ac18f

Full Signature:
MIICajCCAcugAwIBAgIJAKKFzP6qpdgWMAoGCCqGSM49BAMEMGUxCzAJBgNVBAYTAkRFMQwwCgYDVQQI
EwNOL0ExDDAKBgNVBAcTA04vQTEPMA0GA1UEChMGQVhQLk9TMQ8wDQYDVQQLEwZBWFAuT1MxGDAWBgNV
BAMTD0FQSyBTSUdOSU5HIEtFWTAeFw0yNTAxMDgxNzAxMjNaFw0zNTAxMDYxNzAxMjNaMGUxCzAJBgNV
BAYTAkRFMQwwCgYDVQQIEwNOL0ExDDAKBgNVBAcTA04vQTEPMA0GA1UEChMGQVhQLk9TMQ8wDQYDVQQL
EwZBWFAuT1MxGDAWBgNVBAMTD0FQSyBTSUdOSU5HIEtFWTCBmzAQBgcqhkjOPQIBBgUrgQQAIwOBhgAE
AOhJfTYKhxYAs391+zrDZVKxtMnKkDvoFQfUHrl/HLCwK+c9X9kSHXaG7DcEzBPtEc7105CUyhk9YtN5
GNCphnSqAa7fG5v4nngeTOFplZUq295outNAjT0NlWFWuA+3ei3JV43AzQGimH5EQ/UD9CpFemLoAQpU
lOMU5tr5BWzAyUsqoyEwHzAdBgNVHQ4EFgQUpv+2CCk3423DCp5oTA5bZmxYX9owCgYIKoZIzj0EAwQD
gYwAMIGIAkIBrPhoYHbix9fESALKBCQvW2Z4RULHJs7CwFSEc71rNN30QWHA5W8sRkfUgZJzFGcFQmhf
8nHUISMWpRFm0kdszkUCQgHhWodLT3JmqiR1Eg5fU5oo4cdijJft50slR1u7gTiTamY5SmuohJvLO51L
hmgnRN1uCE69yYloqvfvoIoaSBdmyA==
```

### Legacy

_Before January 2025_

{{% details title="Click to reveal" closed="true" %}}

AXP.OS users using an AXP.OS January 2025 or later build cannot install the CI/CD releases for these apps as the signing key differs from the one during the build process (build uses the new key, github releases signs with the old one).

```bash
Signer #1 certificate DN: CN=axp, OU=axp, O=AXP.OS, C=DE
Signer #1 certificate SHA-256 digest: c84042a34189d034b01408f2cfc8d929ac91ccd0054bdafa7ccc791b0a16d103
Signer #1 certificate SHA-1 digest: 834bc49132e21a1384d4456fada4b23f39c38417
Signer #1 certificate MD5 digest: 81cec168edc60c8dbc5c2bbd6ae7f635
Signer #1 key algorithm: RSA
Signer #1 key size (bits): 8192
Signer #1 public key SHA-256 digest: c65864cdaff0b1d3c9abce5dc20786112a2323ffe0ca0e5dfc938b400ea38829
Signer #1 public key SHA-1 digest: 3e0665075fee5a033061dc70a78e565d5b70dd9d
Signer #1 public key MD5 digest: 1358a82861f8e9057bbb5445cde4037e

Full Signature:
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
```
{{% /details %}}

## Build signatures

## OTA & AVB

Build keys (i.e. OTA release-key + AVB key where available) for all AXP.OS devices can be found here:
- [Pro flavor](https://github.com/sfX-android/update_verifier/tree/main/AXP.OS)
- [Slim flavor](https://github.com/sfX-android/update_verifier/tree/main/AXP.OS-slim)

AXP.OS provides OTA (Over The Air) updates which are signed with the releasekey to allow verifying the integrity of an update.
That means:
- when the Updater downloaded a new build it verifies the signature and fails if it is compromised
- when the AXP.OS recovery loads an update via ADB sideload it verifies the signature and fails if it is compromised

The use of a custom recovery is strongly discouraged as it cannot (will not) verify the build signature.

If you are forced to use a _custom_ recovery:
1. download the update zip & the corresponding sha512 file
1. verify the signature manually: with the [update_verifier](https://github.com/sfX-android/update_verifier/)
1. alternative: verify the sha512 hash of the zip with the one from the Automation channel (not of the download website)

### GPG

Besides the above OTA signatures (see _OTA & AVB_ topic) of the OS zips all OS sha512sum files are signed with the AXP.OS GPG key (since 2025-08).
This can be used as an alternative or additional way to verify builds have not been tampered with by this server or in transit.

#### Download
- [axpos_signing.key](/axpos_signing.key) ([mirror1](https://codeberg.org/AXP-OS/axpos-org/src/branch/hugo/static/axpos_signing.key), [mirror2](https://leech.binbash.rocks:8008/axp/axpos_signing.key), [mirror3](https://keyserver.ubuntu.com/pks/lookup?search=FE4B2FA2B225F0AB903AF4136740E645718A8E47&fingerprint=on&op=index), [mirror4](https://keys.openpgp.org/search?q=FE4B2FA2B225F0AB903AF4136740E645718A8E47), [mirror5](https://github.com/AXP-OS/axpos-org/blob/hugo/static/axpos_signing.key))

`ID: FE4B2FA2B225F0AB903AF4136740E645718A8E47`

> [!CAUTION]
> Ensure you place the _signing key_, the _OS zip_ and the _sha512sum_ file all in the **same** directory

#### How to verify GPG signed files on _Linux or Mac OS_

1. Open a terminal
2. switch to the folder where you downloaded the signing key and the OS zip
3. enter:
```bash
gpg --import axpos_signing.key # need to be done only ONCE ever, skip next time
gpg --verify AXP.OS*sha512sum # if you have more than 1 sha512sum file in the same dir, specify the exact filename!
```
4. verify the output of the second command:
   - the key ID must match (see _Download_ above)
   - it must show `Good signature` (_see [Examples](/docs/knowledge/signatures/#example-verifychecksum-output)_)

#### How to verify GPG signed files on _Windows_

1. Download [GPG4WIN](https://www.gpg4win.org/)
2. Check its [integrity](https://wiki.gnupg.org/Gpg4win/CheckIntegrity)
3. Install it and if asked which UI you prefer, _Kleopatra_ should fit for the most.
4. Open the folder where you downloaded the signing key and the OS zip in the file explorer
5. right click on a free area there and choose `open terminal / command prompt here`
6. enter:
```bash
gpg --import axpos_signing.key # need to be done only ONCE ever, skip next time
gpg --verify AXP.OS*sha512sum # if you have more than 1 sha512sum file in the same dir, specify the exact filename!
```
7. verify the output of the second command:
   - the key ID must match (see _Download_ above)
   - it must show `Good signature` (_see [Examples](/docs/knowledge/signatures/#example-verifychecksum-output)_)

### SHA

All builds have a corresponding hash file (sha512.sum) which should be used to verify a downloaded zip.
Before starting, ensure you have verified the SHA512 hash file as shown above in the _GPG_ topic!

#### How to verify a SHA512 hash on _Linux or Mac OS_

1. Open a terminal
2. switch to the folder where you downloaded the SHA file and the OS zip
3. enter:
```bash
sha512sum -c AXP.OS*sha512sum # if you have more than 1 sha512sum file in the same dir, specify the exact filename!
# or SHA256, for example for legacy signed files:
sha256sum -c AXP.OS*sha256sum # if you have more than 1 sha256sum file in the same dir, specify the exact filename!
```
4. The following should be displayed: `AXP.OS-xxxxx.zip: OK` (_see [Examples](/docs/knowledge/signatures/#example-verifychecksum-output)_)

#### How to verify a SHA512 hash on _Windows_

1. Open the folder where you downloaded the signing key and the OS zip in the file explorer
2. right click on a free area there and choose `open terminal / command prompt here`
3. enter:
```bash
certutil -hashfile "AXP.OS-xxxxx.zip" SHA512
# alternatively if you have Windows PowerShell installed, you can also do:
Get-FileHash -Path AXP.OS-xxxxx.zip -Algorithm SHA512
```
4. open the text file `AXP.OS-xxxxx.zip.sha512sum`
5. compare the long string with the one displayed in 3)

#### Example verify/checksum output

GPG verify:
```bash
gpg --verify AXP.OS-20.0-20251116-PRO-bluejay.zip.sha512sum

gpg: Signature made Sun Nov 16 11:24:01 2025 UTC
gpg:                using EDDSA key FE4B2FA2B225F0AB903AF4136740E645718A8E47
#                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
gpg: Good signature from "AXP.OS <aosbot@axpos.org>" [ultimate]
#    ^^^^^^^^^^^^^^
gpg:                 aka "droidme <sfx-bot@binbash.rocks>" [ultimate]
```

SHA512 verify:
```bash
sha512sum -c AXP.OS-20.0-20251116-PRO-bluejay.zip.sha512sum
AXP.OS-20.0-20251116-dos-bluejay.zip: OK
#                                     ^^
```