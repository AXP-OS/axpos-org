---
title: "Build Server Setup"
type: docs
toc: true
aliases:
    - /Build-server-setup
---
### System

* **CPU:** 48 x Intel(R) Xeon(R) Gold 5412U (1 Socket) **speed:** 2100 MHz - 3900 MHz
* **Mem:** 256 GB
* **Storage:** 36 TiB (~4 TiB on SSD)

### Location

- Germany (Frankfurt am Main)

### Setup

- Ubuntu 24.04 VM running on [Proxmox VE](https://www.proxmox.com/)
- no public access
  - access is granted via a dedicated VPN connection only
  - SSH only via that VPN and pubkey-only (password auth disabled)

#### Proxmox VE setup

- Full Disk Encryption via LUKS on all partitions
- Secure Boot enforced (LUKS unlock on boot is NOT handled using TPM! i.e. an unlock must happen manually for enhanced security)
- no public access
  - access is granted via a dedicated VPN connection only
  - SSH only via that VPN and pubkey-only (password auth disabled)

### Build time averages

some examples (last updated: **2025-12-03**) for AXP.OS builds which are covering the following specs:

- clean builds (i.e. emptied `out/`)
- using fast SSD storage for Android sources and `out/`

|Android version|Pure build time (^1)|Full build run (^2)|
|-|-|-|
|Android 9|~18-22 minutes|N/A|
|Android 10|~25-35 minutes|~42 minutes|
|Android 11|~20-25 minutes|~36 minutes|
|Android 13|~35-45 minutes|~60-80 minutes|
|Android 15|~45-60 minutes|~90-120 minutes|

- _(^1): Pure build time: calculated only build time (i.e. **w/o** preparation like git reset/sync etc and **w/o** post-tasks like release, git push etc)_
- _(^2): Full build run: calculated whole build run (i.e. **with** preparation like git reset/sync etc and **with** all post-tasks like release, git push etc)_
