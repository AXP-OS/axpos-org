---
title: "microG"
type: docs
toc: true
aliases:
    - /MicroG
    - /microG
    - /microg
---

{{< callout type="info" >}}
A short summary how microG behaves and is used in AXP.OS
{{< /callout >}}

## AXP.OS - Slim

- not pre-installed, so must be installed as a user app
- cannot be used as system location provider
- see also Slim's [microG comparison](/docs/knowledge/flavors/#microg-implementation)

## AXP.OS - Pro

- pre-installed*
- it is **not functional** by default, you have to [enable it and enable signature spoofing](/docs/guides/setup/aos/#optional-activate-google-support) first
- it can also be disabled
- it cannot request privileged permissions
- several permissions are [auto-granted](https://github.com/sfX-android/android_vendor_extendrom/blob/main/extra/er_default-permissions-com.google.android.gms.xml)
- some background/battery restrictions are relaxed
- blocked from platform [signature](https://developer.android.com/guide/topics/manifest/permission-element) permissions _(microG is not signed with the high privileged platform key)_
- due to the fact it is signed during the build process it can only be updated by a newer version of AXP.OS

_*microG in AXP.OS Pro is installed _unprivileged_, i.e. **not** installed in `system(_ext)/priv-app` but in either `system/app` or `system_ext/app` depending on the Android version. Installing an app in `system/system_ext` gives that app more permissions than if it were installed as a user app though._

The implementation itself is handled by [extendrom](https://github.com/sfX-android/android_vendor_extendrom), used by the [build automation](https://github.com/search?q=repo%3AsfX-android%2Fautomation_scripts+extendrom_package_list_default%3A+path%3Aroles%2Faxp%2Fcommon%2Fdefaults%2Fmain.yml&type=code).