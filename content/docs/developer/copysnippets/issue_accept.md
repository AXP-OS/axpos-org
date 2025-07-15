---
title: "Request: accepted"
type: docs
toc: true
#aliases:
---

```
## current implementation STATE of this device request

:tada: **Congratulations!**
Your device request has been accepted after an initial (rough) check. This means that the standard process for introducing this device into AXP.OS will now begin. The following overview shows the current STATUS. Please avoid asking for any ETA's (Estimated Time of Arrival).

_Please note: Even if this does not happen often, it may turn out during this process that a device CANNOT be included after all. This may be for technical reasons, but may also be due to a lack of co-operation on the part of the requester._

---

**This is a status page for information purposes only and will be updated by the AXP.OS team on an ongoing basis.**

**NO action is required on your part until you are explicitly requested to do so.**

---

- [ ] setup [AXP.OS manifest](https://github.com/AXP-OS/manifest)
- [ ] setup [vendor/firmware](https://code.binbash.rocks/AXP.OS/vendor_firmware)
- [ ] setup [automation repo](https://github.com/sfX-android/automation_scripts/tree/ansible/roles/axp)
- [ ] setup semaphore
- [ ] check/enable [verity](https://github.com/AXP-OS/build/blob/a4536167f37731618f83045b9996cf9b4552520b/Scripts/Common/Enable_Verity.sh#L293) or [AVB](https://github.com/AXP-OS/build/blob/a4536167f37731618f83045b9996cf9b4552520b/Scripts/Common/Enable_Verity.sh#L98) 
- [ ] build
- add/update device guide on [the AXP.OS website](https://code.binbash.rocks/AXP.OS/axpos-org)
    - [ ] add [params](https://code.binbash.rocks/AXP.OS/axpos-org/src/branch/hugo/params)
    - [ ] add [bootloader id](https://code.binbash.rocks/AXP.OS/axpos-org/src/branch/hugo/content/devices)
    - [ ] upload [signing keys](https://github.com/sfX-android/update_verifier)
- [ ] provide a public UNSTABLE version
- [ ] validating test results of all AXP.OS [core features](https://axpos.org/Features)
- [ ] release to STABLE channel
- [ ] announce on XDA
```

#### Troubleshooting notes

if kernel defconfig can't be found: add it manually to [getDefconfig](https://github.com/AXP-OS/build/blob/a1508ef817cded844cb984131e0868b2cbc84801/Scripts/Common/Functions.sh#L873)

if it does not _compile_: follow [generate & test kernel patches](https://axpos.org/docs/developer/port/#generate--test-kernel-patches) and add exceptions to [Fix_CVE_Patchers.sh](https://github.com/AXP-OS/build/blob/axp/Scripts/Common/Fix_CVE_Patchers.sh)

if it does not _boot_: overwrite the device default CONFIG (e.g. like [this](https://github.com/sfX-android/automation_scripts/blob/d20f7dce494c72e956eb4e7efde2c0705cb969b3/roles/axp/common/templates/divested.vars.j5y17lte.j2#L13C8-L13C28))