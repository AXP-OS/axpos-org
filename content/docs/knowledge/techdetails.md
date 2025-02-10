---
title: "Technical Details"
type: docs
toc: true
aliases:
    - /Technical-Details
---

> [!IMPORTANT]
> The whole document is a markdown replacement of the original made by: [Divested Computing Group](https://web.archive.org/web/20241231213231/https://divestos.org/pages/technical_details), so all credits goes to them.
>
> AXP.OS used DivestOS as a base up to December 2024 (see [Divest_EOL](/Divest_EOL)) but the following still reflects the current state for AXP.OS (as of January 2025).
>
> In order to reduce the need for maintenance of this page, minor tweaks and fixes are not documented; please check the source code for complete details about all the changes made.
> 
> Nevertheless the whole page get a full re-work after the `Divest->AXP.OS` cleanups are finalized and the dust has settled again..  

Last updated: `2025-01-30`

### Overview

An Android operating system is essentially made up of three parts as detailed below.

#### The Linux Kernel

The kernel is a necessary part of any operating system. It provides the essential core functionalities and allows the software to talk to the hardware.

Due to the extensive modifications made by device manufacturers and upstream hardware creators, the vanilla 'Mainline' kernel cannot be used. This means that most devices use kernels that are outdated and need to be manually maintained. Some kernels can be easily kept up to date by applying kernel version patches, but more often are modified so much that they need to instead have patches manually tweaked (backported) to work. Google, Qualcomm, and other manufacturers do actually do this work but they still need to be manually applied by device maintainers. Due to this most third party and even stock operating systems ship kernels that are littered with known vulnerabilities.

We however have created a program that eases tracking and applying of these patches massively. Once supplied with a sufficient number of patches it can can be easily fed kernels and spit out scripts that will automatically apply all applicable patches. It is far from perfect, but with our current set of ~13,400 patches for ~2,800 CVEs it can typically apply between 30 and 300 patches to a kernel. The end result of this is that kernels are much more secure. **This is referred to below as our 'CVE patcher'.**

The kernel also sports many built-in security features, that most devices actually have disabled! We created a tool that automatically enables as many of these security features as possible. This is an easy way to have a noticeable increase in security with minimal effort. **This is referred to below as 'hardenDefconfig()'.**

#### Android Itself

\[TO BE COMPLETED\]

#### Vendor Blobs

\[TO BE COMPLETED\]

#### Workspace

*   Many unneeded repositories are removed from the repo manifests
*   The workspace is fully reset and synced before every full build
*   Upon starting buildAll a thorough malware scan is performed using ClamAV

#### The Patcher

We do not maintain forks of repos to store modifications. Instead we keep all of our changes and scripts to apply them in a single repository. This has various benefits and downsides, but works best for our needs.

##### Steps performed when running patchWorkspace()

*   Our changes are periodically verified to ensure that they are properly applied and functioning
*   Before executing any scripts in the workspace a quick malware scan is performed using ClamAV
*   Any cherry picks are applied
*   Patch.sh is executed, this applies many .patch files to various repositories and also calls many functions that make further changes
*   Copy_Keys.sh is executed, this copies public keys into place to enable verified boot support
*   Defaults.sh is executed, this changes various default settings
*   Rebrand.sh is executed, this changes many LineageOS references over to DivestOS
*   Deblob.sh is executed, this removes many proprietary blob files from the following locations: device, kernel, vendor
*   Patch_CVE.sh is executed, this executes scripts created by the CVE patcher to automatically apply many CVE patches to all the kernels
*   N: Theme.sh is executed, this changes the teal accents to orange ones

#### The Changes

We currently support several Android versions. We try our best to ensure parity between them. The below is non-exhaustive and does not include the many changes made using the vendor overlay.

##### Included Apps

*   Etar: An improved calendar app. Replaces AOSP Calendar
*   for the rest see [FEATURES](/Features)

##### android_art

*   N: Workaround for mmap error when building (AOSP)
*   P/Q/R/S: GRAPHENE_CONSTIFY=true: Constify JNINativeMethod tables (GrapheneOS)

##### android_bootable_recovery

*   Abort package installs if they are specific to a serial number (GrapheneOS)
*   N/O/P: Remove sideload cache
*   N: Squash menus
*   O/P: Allow 4096-bit keys
*   O/P: Resurrect dm-verity
*   P: Always enforcing
*   P: Fix USB on most devices
*   Various rebranding

##### android_bionic

*   P/Q/R/S/T: GRAPHENE_MALLOC=true: Use hardened_malloc (GrapheneOS)
*   S/T: Sort and cache hosts file data for fast lookup (tdm)
*   N/O/S/T: Support wildcards in cached hosts file (tdm)
*   Q/R/S/T: Add a toggle to disable /etc/hosts lookup (DivestOS)
*   GRAPHENE_BIONIC=true:
*   P/Q/R/S/T: Add a real explicit_bzero implementation (GrapheneOS)
*   P/Q/R/S/T: Fix undefined out-of-bounds accesses in sched.h (GrapheneOS)
*   P/Q/R/S/T: Stop implicitly marking mappings as mergeable (GrapheneOS)
*   P/Q/R/S/T: Replace VLA formatting with dprintf-like function (GrapheneOS)
*   P/Q/R/S/T: Increase default pthread stack to 8MiB on 64-bit (GrapheneOS)
*   P/Q/R/S/T: Make __stack_chk_guard read-only at runtime (GrapheneOS)
*   P/Q/R/S/T: On 64-bit, zero the leading stack canary byte (GrapheneOS)
*   S/T: Switch pthread_atfork handler allocation to mmap (GrapheneOS)
*   S/T: Add memory protection for pthread_atfork handlers (GrapheneOS)

##### android_build_make

*   Re-enable the downgrade check
*   P/Q: Add back PicoTTS and language files (DivestOS)
*   !N: Use -fwrapv at a minimum (GrapheneOS)
*   Add correct keys to recovery for OTA verification (DivestOS)
*   R/S/T: GRAPHENE_EXEC=true: Add exec-based spawning support (GrapheneOS)
*   O/P/Q/R/S: Fix VB 1.0 failure due to openssl output format change
*   Enable auto-add-overlay for packages, this allows the vendor overlay to easily work across all branches.
*   Q/R/S: Disable APEX
*   T: Only enable APEX on 6th/7th gen Pixel devices (GrapheneOS)
*   P/Q/R/S/T: Set the minimum supported target SDK to Pie (GrapheneOS)
*   Various rebranding

##### android_build_soong

*   !N: Use -fwrapv at a minimum (GrapheneOS)
*   R/S/T: GRAPHENE_MALLOC=true: Make hardened malloc available to apexes (GrapheneOS)
*   Q: Enable -ftrivial-auto-var-init=zero (GrapheneOS)
*   !N: Disable clang-tidy (kdrag0n)

##### android_device_qcom_sepolicy(-legacy)

*   !S/!T: Fix camera on -user builds (DivestOS)
*   P/Q/R: Ignore neverallow violations
*   N: Cherrypick 248649: msm_irqbalance: Allow read for stats and interrupts (syphyr)

##### android_external_conscrypt

*   P/Q/R/S/T: GRAPHENE_CONSTIFY=true: Constify JNINativeMethod tables (GrapheneOS)

##### android_external_chromium-webview

*   Update the WebView to latest if available

##### android_external_hardened_malloc

*   P: GRAPHENE_MALLOC=true: DeviceDescriptor sorting wrongly relies on malloc addresses (GrapheneOS)
*   S/T: Workarounds for Pixel 3 SoC era camera driver bugs (GrapheneOS)
*   P/Q/R/S/T: GRAPHENE_MALLOC=true: Expand workaround to all camera executables (DivestOS)
*   T: Add workaround for OnePlus 8 & 9 display driver crash (DivestOS)

##### android_external_sqlite

*   N: Enable secure_delete by default (AndroidHardening-13.0)

##### android_external_svox

*   O/P/Q: Add back Makefiles
*   P/Q: Fix build under Pie

##### android_external_webp

*   R/S/T: Fix OOB write in BuildHuffmanTable

##### android_frameworks_av

*   P: GRAPHENE_MALLOC=true: Don't set RLIMIT_AS for hardened_malloc support (GrapheneOS)
*   N: Patch CVE-2017-0592 (AOSP)

##### android_frameworks_base

*   Harden the default GPS config
*   N: Re-enable doze on devices without gms
*   Disable DropBox internal logging service
*   Notify the user if their location is requested via SUPL
*   !N: Skip strict update compatibility checks
*   !N: Disable partition fingerprint mismatch warnings
*   Increase default max password length to 64 (GrapheneOS)
*   Decrease the strong auth prompt timeout to occur more often
*   N: Cherrypick 248599: Make SET_TIME_ZONE permission match SET_TIME (AOSP)
*   N: Allow reducing resolution to save power (DivestOS)
*   Change the default DNS servers
*   R/S/T: Enable app compaction by default (GrapheneOS)
*   R: Enable app freezer by default (GrapheneOS)
*   P/Q/R/S/T: Always restrict access to Build.SERIAL (GrapheneOS)
*   Don't grant location permission to system browsers (GrapheneOS)
*   P/Q/R/S: Allow SystemUI to directly manage Bluetooth/WiFi (GrapheneOS)
*   P/Q/R/S/T: GRAPHENE_EXEC=true: Add exec-based spawning support (GrapheneOS)
*   Don't send IMSI to SUPL (MSe1969)
*   !N: Enable fingerprint lockout after five failed attempts (GrapheneOS)
*   P/Q/R/S/T: Allow user logout (GrapheneOS)
*   P/Q/R/S/T: Support new special runtime permissions (GrapheneOS)
*   S: Extend special runtime permission implementation (GrapheneOS)
*   P/Q/R/S/T: Make INTERNET into a special runtime permission (GrapheneOS)
*   P/Q/R/S: Add a NETWORK permission group for INTERNET (GrapheneOS)
*   Q/R: Enforce INTERNET as a runtime permission. (GrapheneOS)
*   Q/R: Fix INTERNET enforcement for secondary users (GrapheneOS)
*   Q/R: Send uid for each user instead of just owner/admin user (GrapheneOS)
*   Q/R: Skip reportNetworkConnectivity() when permission is revoked (GrapheneOS)
*   S: net: Notify ConnectivityService of runtime permission changes (GrapheneOS)
*   S: Make DownloadManager.enqueue() a no-op when INTERNET permission is revoked (GrapheneOS)
*   S: Make DownloadManager.query() a no-op when INTERNET permission is revoked (GrapheneOS)
*   P/Q/R/S/T: Add special runtime permission for other sensors (GrapheneOS)
*   Q/R/S/T: Timeout for reboot (GrapheneOS)
*   Q/R/S/T: Timeout for Bluetooth (GrapheneOS)
*   Q/R/S/T: Timeout for Wi-Fi (GrapheneOS)
*   P/Q/R/S/T: GRAPHENE_CONSTIFY=true: Constify JNINativeMethod tables (GrapheneOS)
*   Q/R/S:/T Add option of always randomizing MAC addresses (GrapheneOS)
*   Q/R: Fix random reboots on broken kernels when an app has data restricted (DivestOS)
*   S/T: Don't report statementservice crashes (GrapheneOS)
*   S: Skip screen on animation when wake and unlock via biometrics (jesec)
*   S: SystemUI: Skip screen-on animation in all scenarios (kdrag0n)
*   R/S/T: SystemUI: add burnIn protection (arter97)
*   S: Make monet based theming user configurable (GrapheneOS)
*   S/T: Add an option to show the details of an application error to the user (GrapheneOS)
*   T: Make sure PackageInstaller UI returns a result (GrapheneOS)
*   T: Don't leak device-wide package list to apps when work profile is present (GrapheneOS)
*   T: Disable package parser cache (GrapheneOS)
*   T: Perform additional boot-time checks on system package updates (GrapheneOS)
*   T: Replace agnss.goog with the Broadcom PSDS server (heavily based off of a GrapheneOS patch)
*   R/S/T: DeviceIdleJobsController: don't ignore whitelisted system apps (GrapheneOS)
*   Q/R/S/T: Unprivileged microG handling (heavily based off of a CalyxOS patch)
*   T: Filter select package queries for GMS (CalyxOS)
*   T: Do not auto-grant Camera permission to the eUICC LPA UI app (GrapheneOS)
*   T: Add hooks for modifying PackageManagerService behavior (GrapheneOS)
*   T: Integrate Google's EuiccSupportPixel package (GrapheneOS)
*   R/S/T: SystemUI: Require unlocking to use sensitive QS tiles (GrapheneOS)
*   S/T: Put bare minimum metadata in screenshots (CalyxOS)
*   P/Q/R/S/T: Don't crash apps that depend on missing Gservices provider (GrapheneOS)
*   S/T: Revert "Null safe package name in AppOps writeState" (GrapheneOS)
*   S/T: appops: skip ops for invalid null package during state serialization (GrapheneOS)
*   Q/R/S/T: Add a setting for forcibly disabling SUPL (GrapheneOS)
*   T: Always add Briar and Tor Browser to Orbot's lockdown allowlist (CalyxOS)
*   R/S/T: Dont ping ntp server when nitz time update is toggled off (GrapheneOS)
*   Q/R/S: Warn when running activity from 32 bit app on ARM64 devices. (AOSP)
*   Q/R: Restore the Sensors Off tile (DivestOS)
*   P/Q/R: More 'Private DNS' options (based off of a CalyxOS patch)
*   N/O/Q: Remove Osu, Automatic Wi-Fi connection non-sense
*   Remove PrintRecommendationService, Creates popups to install proprietary print apps
*   Set animation scales to 0.5
*   Various rebranding

##### android_frameworks_ex

*   R/S/T: GRAPHENE_CONSTIFY=true: Constify JNINativeMethod tables (GrapheneOS)

##### android_frameworks_libs_net

*   S: More 'Private DNS' options (heavily based off of a CalyxOS patch)

##### android_frameworks_libs_systemui

*   S/T: Invalidate icon cache between OS releases (GrapheneOS)

##### android_frameworks_native

*   P/Q/R/S/T: Require OTHER_SENSORS permission for sensors (GrapheneOS)
*   S/T: Protect step sensors with OTHER_SENSORS permission for targetSdk<29 apps (GrapheneOS)
*   R: Fix use-after-free in adbd_auth (GrapheneOS)
*   !N/!O: Allow Work Profiles in low_ram mode

##### android_frameworks_opt_net_wifi

*   P/Q: GRAPHENE_CONSTIFY=true: Constify JNINativeMethod tables (GrapheneOS)
*   Q/R/S/T: Add support for always generating new random MAC (GrapheneOS)

##### android_hardware_ti_omap4

*   N: Fix camera on tuna (repinski)

##### android_hardware_ti_wlan

*   N: Cherrypick 209209: wl12xx: Update SR and MR firmwares versions (Texas Instruments)
*   N: Cherrypick 209210: wl12xx: Update SR PLT firmwares (Texas Instruments)

##### android_hardware_qcom_audio

*   Q/R/S/T: audio_extn: Fix unused parameter warning in utils.c (codeworkx)

##### android_hardware_qcom_display

*   !S/!T: Patch CVE-2019-2306 (Qualcomm)

##### android_hardware_qcom_gps

*   N/O: Fix week rollover (jlask)

##### android_libcore

*   Q/R/S/T: GRAPHENE_EXEC=true: Add exec-based spawning support (GrapheneOS)
*   P/Q/R/S/T: Expose the NETWORK permission (GrapheneOS)
*   P/Q/R/S/T: GRAPHENE_CONSTIFY=true: Constify JNINativeMethod tables (GrapheneOS)

##### android_lineage-sdk

*   Disable Weather
*   DEBLOBBER_REMOVE_AUDIOFX=true: Remove AudioFX
*   Various rebranding

##### android_packages_apps_Aperture

*   T: Fix invisible buttons

##### android_packages_apps_Bluetooth

*   P/Q/R/S: GRAPHENE_CONSTIFY=true: Constify JNINativeMethod tables (GrapheneOS)

##### android_packages_apps_CellBroadcastReceiver

*   T: Allow toggling presidential alerts (GrapheneOS)

##### android_packages_apps_Contacts

*   !N: Remove Privacy Policy and Terms of Service links (GrapheneOS)
*   Q/R/S/T: Backups are not sent to Google (GrapheneOS)
*   !N: Don't prompt to add account when creating a contact (CalyxOS)
*   Use common intent for directions instead of Google Maps URL (GrapheneOS)
*   !N: Add basic support for vCard 4.0 (GrapheneOS)

##### android_packages_apps_Dialer

*   P/Q/R/S: Add a privacy warning banner to calls (CalyxOS)
*   Disable FLP
*   Disable PLP
*   Disable RLP
*   S/T: temporary workaround for black screen on incoming calls https://gitlab.com/LineageOS/issues/android/-/issues/4632

##### android_packages_apps_ImsServiceEntitlement

*   T: Delay FCM registration until it's actually required (CalyxOS)

##### android_packages_apps_SetupWizard

*   Remove silly carrier restrictions

##### android_packages_apps_CMParts

*   N: Remove analytics (DivestOS)
*   N: Allow reducing resolution to save power (DivestOS)
*   N: Various rebranding
*   N: Update LineageOS contributors cloud

##### android_packages_apps_LineageParts

*   Remove analytics (DivestOS)
*   Various rebranding
*   Update LineageOS contributors cloud

##### android_packages_apps_Messaging

*   Handle null case (GrapheneOS)
*   !N/!T: Add notification channels where missing (LineageOS)

##### android_packages_apps_Nfc

*   Disable NFC by default
*   Disable NDEF Push by default
*   P/Q/R/S/T: GRAPHENE_CONSTIFY=true: Constify JNINativeMethod tables (GrapheneOS)

##### android_packages_apps_OpenEUICC

*   T: Hacky fix for misidentifying physical SIM (DivestOS)

##### android_packages_apps_PackageInstaller

*   N: Fix an issue with Permission Review (AOSP)

##### android_packages_apps_PermissionController

*   P/Q/R/S: Always treat INTERNET as a runtime permission (GrapheneOS)
*   T: Add special handling for INTERNET/OTHER_SENSORS (GrapheneOS)
*   P: Add NETWORK permission group (GrapheneOS)
*   Q/R/S: Add INTERNET permission toggle (GrapheneOS)
*   P/Q/R/S: Add OTHER_SENSORS permission group (GrapheneOS)
*   P/Q/R/S: Always treat OTHER_SENSORS as a runtime permission (GrapheneOS)
*   R/S: Refactor handling of special runtime permissions (GrapheneOS)
*   R/S: Don't auto revoke Network and Sensors (GrapheneOS)
*   R/S: UI fix for special runtime permission (GrapheneOS)
*   S/T: Fix usage UI summary for Network/Sensors (GrapheneOS)
*   S/T: Stop auto-granting location to system browsers (GrapheneOS)
*   S/T: SystemUI: Use new privacy indicators for location (GrapheneOS)

##### android_packages_apps_Settings

*   !R/!S/!T: Don't hide OEM unlock
*   N: Cherrypick 201113: wifi: Add world regulatory domain country code (syphyr)
*   N/O/P/Q: Add option to disable captive portal checks (MSe1969)
*   R/S/T: Add option to disable captive portal checks (GrapheneOS)
*   Q/R: Remove the Sensors Off development tile (DivestOS)
*   P/Q/R/S/T: More 'Private DNS' options (based off of a CalyxOS patch)
*   Q/R/S/T: Timeout for reboot (GrapheneOS)
*   Q/R/S/T: Timeout for Bluetooth (CalyxOS)
*   Q/R/S/T: Timeout for Wi-Fi (CalyxOS)
*   Q/R/S/T: Add native debugging setting (GrapheneOS)
*   Q/R/S/T: GRAPHENE_EXEC=true: Add exec spawning toggle (GrapheneOS)
*   Q/R/S/T: Add option to always randomize MAC (GrapheneOS
*   R/S/T: UserManager app installation restrictions (GrapheneOS)
*   Q/R/S/T: Add a toggle to disable /etc/hosts lookup (based off of a GrapheneOS patch)
*   N/O/P/Q: Increase default max password length to 64 (GrapheneOS)
*   Q/R/S/T: Add LTE-only mode option (GrapheneOS)
*   Q/R/S/T: Add a toggle for forcibly disabling SUPL (GrapheneOS)
*   Q/R/S/T: Add a toggle for microG enablement (heavily based off of a GrapheneOS patch)
*   T: Add a toggle for OpenEUICC enablement (heavily based off of a GrapheneOS patch)
*   Q/R/S/T: Add an ability to disable non-system apps from the "App info" screen (GrapheneOS)
*   Never disable secure start-up when enabling an accessibility service
*   Disable "Instant Apps"
*   Always reset animation scales to 0.5
*   Various rebranding

##### android_packages_apps_SetupWizard

*   Remove analytics (DivestOS)
*   R/S/T: Always update recovery by default
*   Various rebranding

##### android_packages_apps_ThemePicker

*   S: Add a UI for enabling Material You (GrapheneOS)

##### android_packages_apps_Trebuchet

*   Override the default workspace layouts
*   O: Disable predictive apps by default

##### android_packages_apps_Updater

*   Switch to our server (DivestOS)
*   Add Tor support (DivestOS)
*   Q/R/S/T: Remove periods from incremental version
*   R/S/T: Always update recovery by default
*   R: Add prop for allowing major updates (erfanoabdi)
*   Various rebranding

##### android_packages_apps_WallpaperPicker

*   N: Replace the wallpapers with our choices
*   N: Allow scrolling
*   N: Center aligned by default

##### android_packages_inputmethods_LatinIME

*   Remove voice input key (DivestOS)
*   Disable personalization dictionary by default (GrapheneOS)

##### android_packages_modules_Connectivity

*   S: Add callback for enforcing INTERNET permission changes (GrapheneOS)
*   S: Use uid instead of app id (GrapheneOS)
*   S/T: Skip reportNetworkConnectivity() when permission is revoked (GrapheneOS)
*   T: Enforce INTERNET permission per-uid instead of per-appId (GrapheneOS)
*   T: Don't crash INTERNET-unaware apps that try to access NsdManager (GrapheneOS)
*   S: More 'Private DNS' options (based off of a CalyxOS patch)

##### android_packages_modules_DnsResolver

*   S/T: Sort and cache hosts file data for fast lookup (tdm)
*   S/T: Support wildcards in cached hosts file (tdm)
*   R/S/T: Add a toggle to disable /etc/hosts lookup (DivestOS)
*   T: Reuse align_ptr in hosts_cache (danielk43)

##### android_packages_modules_NetworkStack

*   R/S/T: Avoid reusing DHCP state for full MAC randomization (GrapheneOS)

##### android_packages_modules_Wifi

*   S/T: Add support for always generating new random MAC (GrapheneOS)
*   S: Fix MAC address leak after SSR (AOSP)
*   S: WifiService: Capture BackendBusyException in MacRandomization (CodeAurora)
*   T: wifi: resurrect mWifiLinkLayerStatsSupported counter (sassmann)

##### android_packages_providers_DownloadProvider

*   P/Q/R/S/T: Expose the NETWORK permission (GrapheneOS)

##### android_packages_providers_MediaProvider

*   O: Fix permission denial (luca.stefani)

##### android_packages_providers_TelephonyProvider

*   R: Cherrypick 304614: mcc/mnc fix (Sony)
*   R: Cherrypick 312102: mnc fix (Sony)

##### android_packages_services_Telephony

*   N/O/P: Add an LTE only option (DivestOS)

##### android_prebuilts_abi-dumps_vndk

*   Q: Work around ABI changes from compiler hardening (GrapheneOS)

##### android_system_bt

*   N: Add an option to let devices opt-out of the HCI_READ_ENCR_KEY_SIZE_SUPPORTED assert (DivestOS)
*   N: Cherrypick topic bt-sbc-hd-dualchannel-nougat (ValdikSS)
*   N: Cherrypick 242134: avrc_bld_get_attrs_rsp - fix attribute length position off by one (cprhokie)
*   R: Cherrypick topic a2dp-master-fixes (AOSP)
*   Q/R/S: Add alloc_size attributes to the allocator (GrapheneOS)

##### android_system_ca-certificates

*   Sync with AOSP/master
*   Remove untrusted certificates

##### android_system_core

*   Merge in our HOSTS file
*   Q/R/S/T: Revert some Lineage insanity
*   N: Allow 4096-bit keys
*   !R/!S/!T: Always update recovery
*   P/Q/R/S/T: GRAPHENE_MALLOC=true: Increase max_map_count for hardened_malloc (GrapheneOS)
*   Harden mounts with nodev/noexec/nosuid (GrapheneOS)
*   Misc sysctl changes
*   Q/R/S/T: Add a property for controlling ptrace_scope (GrapheneOS)
*   P/Q/R: GRAPHENE_BIONIC=true: Zero sensitive information with explicit_bzero (GrapheneOS)

##### android_system_extras

*   P/Q/R/S/T: File Based Encryption: pad filenames more (GrapheneOS)

##### android_system_netd

*   Q/R/S: Expose the NETWORK permission (GrapheneOS)
*   Q: Add a toggle to disable /etc/hosts lookup (DivestOS)

##### android_system_sepolicy

*   N: Cherrypick 248600: Restrict access to timing information in /proc (AndoridHardening)
*   Fix -user builds for LGE devices (DivestOS)
*   !N: Allow ignoring neverallows under -user
*   label protected_{fifos,regular} as proc_security (GrapheneOS)
*   Q/R/S/T: Allow init to control kernel.yama.ptrace_scope (GrapheneOS)
*   Q/R/S/T: Allow system to use persist.native_debug (GrapheneOS)
*   R/S/T: Disable unused gmscore_app domain (GrapheneOS)

##### android_system_update_engine

*   Q/R/S/T: Do not skip payload signature verification

##### android_system_vold

*   N/O: Add a variable for enabling AES-256 bit encryption (DivestOS)

##### android_vendor_lineage

*   Remove Lineage keys
*   Remove analytics
*   Remove Lineage wallpaper
*   R/S: Do not set device model as DHCP hostname
*   Make sure our hosts is always used
*   Remove Weather
*   Unset default backup provider
*   DEBLOBBER_REMOVE_AUDIOFX=true: Remove AudioFX
*   Change buildtype to dos
*   Include our customizations
*   Update APN list
*   Change default notification sound to Pong
*   Change default alarm sound to Alarm_Buzzer
*   T: Ignore missing packages
*   Various rebranding

##### android_vendor_divested

*   Note: these are per branch changes to the overlay itself, not \*the\* changes made by the overlay
*   R/S/T: Remove all lookup provider overrides
*   P/Q/R/S: Add deny usb service, all of our kernels the necessary patch
*   R/S/T: PicoTTS needs work to compile on 18.1, use eSpeak-NG instead

##### Automated mass changes to android_device_*

*   hardenLocationConf()
*   hardenLocationFWB()
*   hardenLocationSerials()
*   DEBLOBBER_REMOVE_IMS=false: volteOverride()
*   enableDexPreOpt()
*   hardenUserdata()
*   Q/R/S: disableAPEX()
*   removeBuildFingerprints()
*   AVB chaining is disabled
*   OEM unlocking toggle is made available on supported devices
*   P/Q/R/S: GRAPHENE_EXEC=true: disableEnforceRRO() (GrapheneOS)
*   Many proprietary blobs are disabled/removed via Deblob.sh
*   Camera pinning is disabled for reduced memory usage.
*   USAP is disabled for reduced memory usage.

##### Automated mass changes to android_kernel_*

*   hardenDefconfig()
*   Fix builds with GCC 10
*   Verified boot keys are copied into their respective kernels
*   Change the VM_MAX_READAHEAD value from the default 128KB to 512KB
*   -ftrivial-auto-var-init=zero is enabled if supported (GrapheneOS)
*   Wi-Fi regulations database is updated to latest on supported kernels.
*   Many CVE (and some hardening) patches are applied to each and every kernel as applicably determined by the CVE checker.

##### Automated mass changes to android_vendor_*

*   hardenLocationConf()
*   Many proprietary blobs are disabled/removed via Deblob.sh
