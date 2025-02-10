---
title: "Device Encryption"
type: docs
toc: true
aliases:
    - /Device-Encryption
---
# Encryption types

AXP.OS will force-encrypt every device automatically on first boot. If you are about to [port](/port-guide) a new device to AXP.OS you should always try to get the latest supported encryption method available for your hardware.

These are the encryption methods and their state:

* **Full Disk Encryption (FDE):** `not supported*` and even removed in recent Android releases
* **Inline Crypto Engine (ICE):** `not supported*`, always check if you can upgrade to FBEv1 or FBEv2 though as ICE is not maintained for many devices anymore
* **File Based Encryption v1 (FBEv1):** `supported`, always check if you can upgrade to FBEv2 though
* **File Based Encryption v2 (FBEv2):** `supported`, if possible: get it!

_(*) there might be exceptions on a per device decision_

references:

- [FBE implementation](https://source.android.com/docs/security/features/encryption/file-based)
- [FBE metadata encryption](https://source.android.com/docs/security/features/encryption/metadata)
- [FBE adoptable storage](https://source.android.com/docs/security/features/encryption/file-based#enabling-fbe-on-adoptable-storage)
- [FBE hardware wrapped keys](https://source.android.com/docs/security/features/encryption/hw-wrapped-keys)
- [legacy: FDE](https://source.android.com/docs/security/features/encryption/full-disk)
- legacy: ICE ([ref1](https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/documents/file_based_encryption_enhancements_final_06.10.2019.pdf), [ref2](https://android.googlesource.com/kernel/msm/+/android-9.0.0_r0.50/Documentation/crypto/msm/msm_ice_driver.txt))

# Migrating from FDE

In general AXP.OS will **not** support FDE and so you have to move to FBE v1 or v2 first. There might be exceptions on a per device decision but you shouldn't bet on it.

Quick wrap-up is: 
- remove any FDE references within your device tree(s) (e.g. `TARGET_HW_DISK_ENCRYPTION` or `TARGET_LEGACY_HW_DISK_ENCRYPTION`)
- remove any FDE references within your kernel config

# Implementing FBE

**_Every setting here must be compatible and match each others sub section. That means kernel, fstab and device.mk depend on each other and conflicting configuration will break things._**

AXP.OS prefers setting encryption parameters explicitly, i.e. even though `fileencryption=::v1` is (atm) identical to `fileencryption=aes-256-xts:aes-256-cts:v1` AXP.OS prefers the latter. Not that it is perfectly clear what is in use but defaults change in Android (like it will with the upcoming `aes-256-hctr2` default for filenames_encryption_mode).

## fstab

### ICE

reference commit: TBD

Examples:

```
...   /data   ...                fileencryption=ice
...   /data   ...,inlinecrypt    fileencryption=ice
...   /data   ...,inlinecrypt    fileencryption=ice,wrappedkey
```

### FBE v1

reference commit: TBD

choose the mount option which is best matching your hardware, listed from low to high:

```
...   /data   ...    fileencryption=aes-256-xts:aes-256-cts:v1
...   /data   ...    fileencryption=aes-256-xts:aes-256-cts:v1+inlinecrypt_optimized

rare on FBEv1 - if any:
...   /data   ...,inlinecrypt    ...,fileencryption=aes-256-xts:aes-256-cts:v1+inlinecrypt_optimized+wrappedkey_v0
...   /data   ...,inlinecrypt    ...,fileencryption=aes-256-xts:aes-256-cts:v1+emmc_optimized+wrappedkey_v0
```

### FBE v2

reference commit: [hotdog](https://github.com/AXP-OS/android_device_oneplus_hotdog/commit/492ab254d4733358481ee19cc96a1241e005997b)

choose the mount option which is best matching your hardware, listed from low to high:

```
...   /data   ...    fileencryption=aes-256-xts:aes-256-cts:v2
...   /data   ...    fileencryption=aes-256-xts:aes-256-cts:v2+inlinecrypt_optimized
...   /data   ...    fileencryption=aes-256-xts:aes-256-cts:v2+emmc_optimized
...   /data   ...,inlinecrypt    ...,fileencryption=aes-256-xts:aes-256-cts:v2+inlinecrypt_optimized+wrappedkey_v0
...   /data   ...,inlinecrypt    ...,fileencryption=aes-256-xts:aes-256-cts:v2+emmc_optimized+wrappedkey_v0

A14 (+ your kernel must have AES-HCTR2 implemented):
...   /data   ...,inlinecrypt    ...,fileencryption=aes-256-xts:aes-256-hctr2:v2
```

## device.mk

### ICE

TBD


### FBE v1

reference commit: TBD

```
# FBEv1
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.volume.filenames_mode=aes-256-cts

# adoptable storage
# remove inlinecrypt_optimized when not using inline encryption hardware
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.volume.options=aes-256-xts:aes-256-cts:v1+inlinecrypt_optimized \
    ro.crypto.volume.contents_mode=aes-256-xts \
    ro.crypto.volume.filenames_mode=aes-256-cts
```

### FBE v2

reference commit: [hotdog](https://github.com/AXP-OS/android_device_oneplus_hotdog/commit/492ab254d4733358481ee19cc96a1241e005997b)

full example:
```
# FBE (forces FBE v2 regardless of PRODUCT_SHIPPING_API_LEVEL)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.volume.filenames_mode=aes-256-cts \
    ro.crypto.volume.metadata.method=dm-default-key \
    ro.crypto.dm_default_key.options_format.version=2

# adoptable storage
# remove inlinecrypt_optimized when not using inline encryption hardware
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.volume.options=aes-256-xts:aes-256-cts:v2+inlinecrypt_optimized \
    ro.crypto.volume.contents_mode=aes-256-xts \
    ro.crypto.volume.filenames_mode=aes-256-cts
```

## Metadata encryption on internal storage

_Metadata encryption is always enabled on [adoptable storage](https://source.android.com/docs/core/storage/adoptable) whenever FBE is enabled. Metadata encryption can also be enabled on internal storage though._

Requirements:
- A11 or higher
- Kernel v4.14 or higher
- dm-default-key (`CONFIG_DM_DEFAULT_KEY=y` must be supported by your kernel)

To enable metadata encryption on your internal storage u have to adjust your

### init.hardware.rc

```
# We need vold early for metadata encryption
on early-fs
    start vold


init.hardware.rc should already contain a "mount_all" instruction which
mounts /data itself in the on late-fs stanza. Before this line, add the
directive to exec the "wait_for_keymaster" service:

on late-fs
    ...
    # Wait for keymaster
    exec_start wait_for_keymaster

    # Mount RW partitions which need run fsck
    mount_all /vendor/etc/fstab.${ro.boot.hardware.platform} --late
```

### fstab

```
...    /metadata    ext4    noatime,nosuid,nodev,discard    wait,check,formattable
...    /data        ext4    ...,inlinecrypt    latemount,wait,check,fileencryption=<see FBE fstab>,quota,formattable,keydirectory=/metadata/vold/metadata_encryption
```

## kernel

Not all kernel versions support all configuration options and on the other site vendors or maintainers might have backported features from newer kernels to your device's kernel.

You can e.g. use this command to check if an option is found in your kernel or not:

`find kernel/<vendor>/<device>/ -type f -name Makefile -or -type f -name Kconfig -exec grep <CONFIG-OPTION-without-"CONFIG_"-prefix> {} \; -print`

e.g. to find `CONFIG_DM_DEFAULT_KEY` grep for "`DM_DEFAULT_KEY`" like this:

`find kernel/lge/msm8992/ -type f -name Makefile -or -type f -name Kconfig -exec grep DM_DEFAULT_KEY {} \; -print`

While this is no guarantee that it is well or fully implemented it gives you an idea if you should try or leave an option.

### general (any kernel version)

~~~
CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
CONFIG_CRYPTO_SHA2_ARM64_CE=y
~~~

If your device uses **UFS-based** storage:

~~~
CONFIG_SCSI_UFS_CRYPTO=y
~~~

OR if your device uses **eMMC-based** storage instead:

~~~
CONFIG_MMC_CRYPTO=y
~~~

If you will **not** be using inline encryption hardware set also:

~~~
CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK=y
~~~

### when using ICE

~~~
CONFIG_CRYPTO_DEV_QCOM_ICE=y
~~~

### v3.18 - v4.13 & when using ICE

~~~
CONFIG_EXT4_ENCRYPTION=y
CONFIG_F2FS_FS_ENCRYPTION=y
~~~

For Metadata encryption

~~~
CONFIG_DM_CRYPT=y
~~~

### v4.14 - v5.0

~~~
CONFIG_EXT4_ENCRYPTION=y
CONFIG_F2FS_FS_ENCRYPTION=y
CONFIG_BLK_INLINE_ENCRYPTION=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
~~~

For Metadata encryption

~~~
CONFIG_DM_DEFAULT_KEY=y
#CONFIG_DM_CRYPT is not set
~~~

### v5.1 or higher

~~~
#CONFIG_EXT4_ENCRYPTION is not set
#CONFIG_F2FS_FS_ENCRYPTION is not set
CONFIG_BLK_INLINE_ENCRYPTION=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
~~~

For Metadata encryption

~~~
CONFIG_DM_DEFAULT_KEY=y
#CONFIG_DM_CRYPT is not set
~~~

# Verifying FBE

~~~
adb shell su -c dmesg | grep "has the encryption policy"
adb shell getprop ro.crypto.type
adb shell getprop ro.crypto.metadata.enabled
~~~

### FBE v1

indicator for a v1 implementation: **v1 modes**

~~~
[    7.228836] init: Verified that /data/bootchart has the encryption policy b61e9ea288b49580 v1 modes 127/4 flags 0x3
[    7.232630] init: Verified that /data/vendor has the encryption policy b61e9ea288b49580 v1 modes 127/4 flags 0x3
[    7.243721] init: Verified that /data/anr has the encryption policy b61e9ea288b49580 v1 modes 127/4 flags 0x3
[    7.244091] init: Verified that /data/tombstones has the encryption policy b61e9ea288b49580 v1 modes 127/4 flags 0x3
[...]
~~~

### FBE v2

indicator for a v2 implementation: **v2 modes**

~~~
[    3.408194] init: Verified that /data/bootchart has the encryption policy b086d8852523490a756844845c93833e v2 modes 1/4 flags 0xb
[    3.409456] init: Verified that /data/vendor has the encryption policy b086d8852523490a756844845c93833e v2 modes 1/4 flags 0xb
[    3.410074] init: Verified that /data/anr has the encryption policy b086d8852523490a756844845c93833e v2 modes 1/4 flags 0xb
[    3.410257] init: Verified that /data/tombstones has the encryption policy b086d8852523490a756844845c93833e v2 modes 1/4 flags 0xb
[...]
~~~
