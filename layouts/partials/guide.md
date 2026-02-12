## Installation guide

You want to switch between flavors or coming from DivestOS?

Please read this first: [All about AXP.OS flavors]({{ printf "%s" .docbaseurl }}/Flavors)
If you miss a flavor you can request it [here](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues/new/choose).

### Known issues

- AXP.OS - [Known Issues]({{ printf "%s" .docbaseurl }}/Known-Issues)
- Issue tracker - [won't fix](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues?type=all&state=closed&labels=36)

{{ if or .kilink .trackerlink }}
Specific for your device:
{{ end }}
  {{ if .kilink }}
  - Knowledgebase: _[{{ .codename }}]({{ printf "%s" .docbaseurl }}/docs/knowledge/knownissues/#{{ printf "%s" .kilink }})_
  {{ end }}
  {{ if .trackerlink }}
  - Issue tracker: _[{{ .codename }}]({{ printf "%s" .trackerlink }})_
  {{ end }}

### Boot modes

Each device has its own method to access special boot modes.  
See: [{{ .codename }} (@LineageOS wiki)](https://wiki.lineageos.org/devices/{{ .codename }}/#special-boot-modes)

### Firmware

{{ if eq .firmware "included" }}
AXP.OS for the *{{ .devicename }}* includes the latest available bootloader and modem firmware.  
No manual firmware flashing needed if you follow the Install guide.
{{ else }}
AXP.OS for the *{{ .devicename }}* does **not** include firmware.  
You must ensure correct firmware manually to avoid unexpected problems.

Follow the [firmware guide]({{ printf "%s" .docbaseurl }}/fw-{{ .vendor }}).  
If missing, check the [{{ .codename }} firmware guide](
https://wiki.lineageos.org/devices/{{ .codename }}/fw_update/) and match the Android version.
{{ end }}

### Install / Upgrade

{{ if eq .custominstall "yes" }}
    {{ $guide := printf "content/devices/install_%s.guide" .codename }}
    {{ if fileExists $guide }}
{{ readFile $guide | markdownify }}
    {{ else }}
*Device specific guide expected but missing! Please contact [support]({{ printf "%s" .docbaseurl }}#support)!*
    {{ end }}
{{ end }}

{{ if eq .ispixel "yes" }}
[Install (Pixel devices)]({{ printf "%s" .docbaseurl }}/Installation-on-Pixel-devices)
{{ else if eq .isab "yes" }}
[Install (A/B)]({{ printf "%s" .docbaseurl }}/Installation-on-A%E2%80%90B-devices)
{{ else }}
[Install (non A/B)]({{ printf "%s" .docbaseurl }}/Installation-on-Non-A%E2%80%90B-devices)
{{ end }}

### Setup AXP.OS

Follow [Setup]({{ printf "%s" .docbaseurl }}/Setup)

{{ if or (hasPrefix .relock_pro "yes") (hasPrefix .relock_slim "yes") }}
### Re-locking the bootloader

{{ if eq .customlock "yes" }}
    {{ $guide := printf "content/devices/lock_%s.guide" .codename }}
    {{ if fileExists $guide }}
{{ readFile $guide | markdownify }}
    {{ else }}
*Device specific lock guide missing! Contact [support]({{ printf "%s" .docbaseurl }}#support).*
    {{ end }}
{{ end }}

Follow [Bootloader-Lock]({{ printf "%s" .docbaseurl }}/Bootloader-Lock)

#### Fingerprint information

On boot you may see a fingerprint/ID verifying AVB trust.  
Some devices show only 8 chars, others full digest.  
See more details [here](https://source.android.com/docs/security/features/verifiedboot/boot-flow).

This fingerprint is unique per device and flavor.

**If you see a different ID, immediately request [support]({{ printf "%s" .docbaseurl }}#support).**

{{ if .flavor_pro }}
##### Pro build

    {{ $filename := printf "content/devices/fp_%s_pro" .codename }}
    {{ if fileExists $filename }}
{{ readFile $filename  }}
    {{ else }}
No fingerprint information available. Contact support.
    {{ end }}
{{ end }}

{{ if .flavor_slim }}
##### Slim build

    {{ $filename := printf "content/devices/fp_%s_slim" .codename }}
    {{ if fileExists $filename }}
{{ readFile $filename }}
    {{ else }}
No fingerprint information available. Contact support.
    {{ end }}
{{ end }}

{{ else }}
{{ end }}

### XDA thread

See [here]({{ printf "%s" .xdalink }})

### Debugging

DEVICE-BOOT-DEBUG-PATH: `{{ .debugbootpath }}`  
See [Logs]({{ printf "%s" .docbaseurl }}/Grab-Logs)
