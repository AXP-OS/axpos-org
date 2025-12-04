---
title: "Android Verified Boot"
type: docs
toc: true
aliases:
    - /AVB
    - /avb
    - /VerifiedBoot
    - /verifiedboot
    - /AndroidVerifiedBoot
---

## About

_Android Verified Boot_ or just _AVB_ is a feature of Android to gain more security or better said integrity.

There are a lot of technical explanations about this topic, e.g.:
- [android.com - verified-boot](https://source.android.com/docs/security/features/verifiedboot/verified-boot)
- [android.com - avb](https://source.android.com/docs/security/features/verifiedboot/avb)
- [android.com - dm-verity](https://source.android.com/docs/security/features/verifiedboot/dm-verity)
- [kernel.org - dm-verity](https://docs.kernel.org/admin-guide/device-mapper/verity.html)
- [chromium.org - verified-boot](https://www.chromium.org/chromium-os/chromiumos-design-docs/verified-boot/)

Basically AVB is a "boot chain of trust" where each stage verifies the next - but there are big differences between the currently available AVB versions: 1.0 and 2.0.

To make it a bit more irritating, Google uses an different version numbering for the library `libavb` which can get printed by e.g. `avbtool` as follows:
- AVB 1 or 1.0: `1.0.0`
- AVB 2.0: `1.1.0, 1.2.0, 1.3.0`

The basic idea of AVB is:
- only valid signed (i.e. _trusted_) boot images can be loaded
- any change of a protected read-only partition (e.g. /system or /vendor) will cause a serious error, rejecting to boot

> [!Tip] **Conclusion**
> AVB aims to detect changes made by malware or an attacker to the OS before even booting.

### AVB 1.0

#### Simplified boot flow

The following is more a logical view and do not show all parts of the boot process, e.g. the Bootloader itself is not just a single partition and so is already a chain of trust by itself - also verified by signature validation.

> [!NOTE] **Hint**
> _The following assumes the device has the bootloader in LOCKED state._

```
ANDROID VERIFIED BOOT 1.0 (AVB1) BOOT FLOW
=============================================

+-----------------------------+
|         Bootloader          |
+-------------+---------------+
            |
            | loads boot.img/recovery.img
            | extracts /verity_key
            v
+-----------------------------+
|  boot.img / recovery.img    | <-- signed with a private verity key
|  signed by "boot_signer"    |
|-----------------------------|
|  /verity_key                | <-- public part of the verity key, embedded within the img,
+-------------+---------------+     used by the bootloader to verify the image
            |
            | if it is properly(*) signed by /verity_key => PROCEED
            | loads Android kernel
            v
+-----------------------------+
|    Android kernel starts    | --> if >= A11: no further checks are done, OS just loads
+-------------+---------------+
            |
            | mounts root filesystem
            | with dm-verity enabled (+ further protected(**) partitions)
            v
            | kernel verifies hash tree
            | using embedded verity_key
            v
+---------------------------------+
| IF: OK => System boots normal   |
| IF: FAILED => PANIC / REBOOT    |
+---------------------------------+

KEYS INVOLVED IN AVB1
=====================
PRODUCT_VERITY_SIGNING_KEY -> can be replaced when calling sign_target_files_apks by:
    --replace_verity_public_key path/to/verity_key (converted to libmincrypt format)
    --replace_verity_private_key path/to/verity (without .pk8 extension)
    --replace_verity_keyid path/to/verity.x509.pem
```

**References**
- [web.archive.org AVB 1.0](https://web.archive.org/web/20170320192852/http://source.android.com/security/verifiedboot/verified-boot.html) (archived source.android.com page)
- [web.archive.org  dm-verity](https://web.archive.org/web/20170320191303/http://source.android.com/security/verifiedboot/dm-verity.html) (official explanation of the hash-tree mechanism used in AVB1 partitions)

> [!NOTE]
> (*) _properly_ means:<br/>
> 1. it must be in a format accepted by the bootloader (`libmincrypt`)
> 1. not yet expired
> 1. expire not too far away in the future _(e.g. an expire date in 30 years might get rejected)_
> 1. signature must(!) be: `RSA, SHA256, 2048 bits`
> 
> _There is NO mechanism involved which checks for an specific/defined key. In other words, replacing a boot.img is enough to get accepted - even in locked state (e.g. if running a custom recovery or [EDL](/docs/guides/installation/bootloaderlock/#known-low-level-recovery-tools) is accessible)._
>
> (**) _protected_ means:<br/>
> 1. `CONFIG_DM_VERITY=y` HAS TO be set in the kernel config
> 1. the partition in question HAS TO be mounted as read-only
> 1. it HAS TO have the flag `verify` set in either fstab and/or kernel dtsi
> 1. it HAS TO be defined within the AOSP build process (`PRODUCT_<PARTITION-NAME>_VERITY_PARTITION`)

#### Key generation

As usual it is crucial important to follow the specs as described above. 
AXP.OS uses automation and adds the replacement arguments on the fly where needed [here](https://git.disroot.org/AXP.OS/build/src/commit/2fd88abb1e1d34b9a202b6892506c79940f89d2c/Scripts/Common/Functions.sh#L318-L321).
Keys are generated via [sign_generate_keys](https://github.com/sfX-android/android_buildtools/blob/main/sign/sign_generate_keys.sh) which is part of the build process. The relevant verity key part can be found [here](https://github.com/sfX-android/android_buildtools/blob/ffea8d06d6ace906c6a27be9e880ff0b2db1b0e5/sign/sign_generate_keys.sh#L97-L114).

#### Details

Due to the fact that the whole process is far away from ideal and can be easily bypassed it has been replaced by AVB 2.0 with Android 11.
There are a lot of articles explaining in more detail about this, for us the most important facts with AVB 1.0 are:

1. it makes sense only up to & including Android 10
2. when using A10 or lower it is a _basic_ protection
3. users should not rely on it at all but at least always verify the bootloader ID when rebooting!
4. on devices running A11 or later there is ZERO verification of protected partitions to detect unusual OS changes

It is still possible to lock your device even on Android 11 or later as the only part involved here is the boot.img / recovery.img but then it stops.
That means there is no method implemented anymore which identifies someone has tampered with your protected partitions - because they are simply not checked anymore.
In other words: Google has removed the checks [with A11](https://github.com/LineageOS/android_system_core/commit/f7545cea34695bb49531104d7f68e95b86254fbb) completely.

Android 11 and later, when booting up on a device with AVB 1.0, will throw a warning in the logs that it has no idea what a specific flag means (`init: [libfs_mgr]Warning: unknown flag: verify`) and just goes on - regardless if something / someone has changed your whole OS / parts of it.

To be even more clear: AVB 1.0 on A11 or later has almost zero benefit at all and even locking the bootloader will stop working with Android 15 as the necessary signing process has been removed as well _(this will be checked if it can be kept for AXP.OS though)_.

> [!CAUTION] **Conclusion 🫤**
> In general, AVB 1.0 is a better than nothing approach, on **A11 and later** it is almost **useless** though and can be considered as broken.<br/>
> If your device only supports AVB 1.0 and runs on A11 or higher, it is strongly recommended that you upgrade to a device that supports AVB 2.0 - if OS integrity is important to you.

### AVB 2.0

Several versions of AVB 2.0 try to make things better. Most important changes compared to 1.0 are:

- support for A/B partitions | Project Treble
- enhanced rollback protection
- a (virtual) partition is used to add an (additional) accepted signature key (partition name: `avb_custom_key`)
- a new VBMETA (Verified Boot Metadata) partition has been introduced
- a standard, portable C library called `libavb` that manufacturers can easily integrate into their bootloaders

#### Simplified boot flow

The following is more a logical view and do not show all parts of the boot process, e.g. the Bootloader itself is not just a single partition and so is already a chain of trust by itself - also verified by signature validation.

> [!NOTE] **Hint**
> _The following assumes the device has the bootloader in LOCKED state._
> 
```
ANDROID VERIFIED BOOT 2.0 (AVB2) BOOT FLOW
=============================================

+-----------------------------+
|        Bootloader           |
+-------------+---------------+
              |
              | loads top-level vbmeta.img
              | from vbmeta partition
              v
+-----------------------------+
|         VBMETA.IMG          |
|-----------------------------|
|  - public key metadata      |
|  - hash descriptors         |
|  - hashtree descriptors     |
|  - chained vbmeta desc.     |
|  - rollback index info      |
+-------------+---------------+
              |
              | bootloader verifies vbmeta.img
              | using the built-in/avb_custom_key key
              |
              | if signature invalid => STOP / FAIL
              v
+-----------------------------+
|   Verified VBMETA (OK)      |
+-------------+---------------+
              |
              | for EACH descriptor in vbmeta:
              |   - if type=HASH: verify raw hash of partition
              |   - if type=HASHTREE: verify dm-verity root hash
              |   - if type=CHAIN: load child vbmeta and repeat chain
              |
              | partitions typically included:
              |   boot, system, vendor, product, dtbo, system_ext
              v
+-----------------------------+
| Partition Verification Loop |
|   boot.img:   hash verify   |
|   dtbo.img:   hash verify   |
|   system.img: hashtree root |
|   vendor.img: hashtree root |
|   product:    hash/hashtree |
+-------------+---------------+
              |
              | if ANY verification fails => enforce error mode
              | if ALL OK:
              |   - update rollback indices
              |   - continue boot
              v
+-----------------------------+
|  Load Android Kernel        |
|  (cmdline includes verity   |
|   parameters from vbmeta)   |
+-------------+---------------+
              |
              | kernel mounts dm-verity protected partitions
              | (system, vendor, product, system_ext, etc.)
              |
              | kernel performs runtime dm-verity checks:
              |   - every block read verified via hashtree
              v
+---------------------------------+
| IF: all runtime checks OK       |
|     => System boots normally    |
| IF: dm-verity block fails       |
|     => PANIC / REBOOT           |
+---------------------------------+
```

**References**
- [platform/external/avb README](https://android.googlesource.com/platform/external/avb/+show/master/README.md) (AVB2 reference implementation)
- [Android Verified Boot](https://source.android.com/docs/security/features/verifiedboot/avb) (source.android.com overview / AVB)
- [platform/external/avb](https://android.googlesource.com/platform/external/avb/) (git) — repo and implementation details
- [libavb](https://android.googlesource.com/platform/external/avb/+/refs/heads/master/libavb/avb_vbmeta_image.h) `avb_vbmeta_image.h` (rollback index / vbmeta header details)
- [U-Boot AVB2 docs / integration notes](https://docs.u-boot.org/en/latest/android/avb2.html) (how bootloader verifies vbmeta/partitions)

#### Key generation

AXP.OS uses automation and sets the proper build flags during the build process by an [own BoardConfig.mk](https://git.disroot.org/AXP.OS/vendor_axp/src/branch/main/BoardConfigVendor.mk).
Keys are generated via [sign_generate_keys](https://github.com/sfX-android/android_buildtools/blob/main/sign/sign_generate_keys.sh) which is also part of the automated build process.

> [!Tip] **Conclusion 😀**
> AVB 2.0 offers way better protection & verification than 1.0 and increases security. If you plan to buy a device ensure it supports this modern standard implemented since Android 8.
