---
title: "Request: accepted"
type: docs
toc: true
#aliases:
---

## AXP.OS accepted info

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

## AXP.OS test build info

### bring-up

```
A test build has been released :tada: !

Check it out here:
- [download](https://download.axpos.org/axp-unstable/)

Installation guide:
- [here](https://axpos.org/devices/xxxx/yyyy/)

## YOUR feedback is required:

1. copy the following snippet: [Quality Control Checklist](https://axpos.org/docs/developer/copysnippets/test_community/#axpos-quality-control-checklist)
2. add a new comment with that snippet as content
3. save it
4. go through the list and tick each item you have tested

when having any questions pls just ask in the [Matrix Bring-Up room](https://axpos.org/docs/overview/#support)
```

### MR upgrade

```
A test build has been released :tada: !

Check it out here:
- [download](https://download.axpos.org/axp-unstable/)

Upgrade guide:
- [here](https://axpos.org/MRU)

**_note: a factory reset is mandatory so ensure you have a current backup before doing anything else!_**

## YOUR feedback is required:

1. copy the following snippet: [Quality Control Checklist](https://axpos.org/docs/developer/copysnippets/test_community/#axpos-quality-control-checklist)
2. add a new comment with that snippet as content
3. save it
4. go through the list and tick each item you have tested

when having any questions pls just ask in the [Matrix Bring-Up room](https://axpos.org/docs/overview/#support)
```

## Troubleshooting notes

if kernel defconfig can't be found: add it manually to [getDefconfig](https://github.com/AXP-OS/build/blob/a1508ef817cded844cb984131e0868b2cbc84801/Scripts/Common/Functions.sh#L873)

if it does not _compile_: follow [generate & test kernel patches](https://axpos.org/docs/developer/port/#generate--test-kernel-patches) and add exceptions to [Fix_CVE_Patchers.sh](https://github.com/AXP-OS/build/blob/axp/Scripts/Common/Fix_CVE_Patchers.sh)

if it does not _boot_: overwrite the device default CONFIG (e.g. like [this](https://github.com/sfX-android/automation_scripts/blob/d20f7dce494c72e956eb4e7efde2c0705cb969b3/roles/axp/common/templates/divested.vars.j5y17lte.j2#L13C8-L13C28))