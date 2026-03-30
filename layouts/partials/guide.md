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
AXP.OS for the *{{ .devicename }}* includes the appropriate bootloader and modem firmware for the corresponding Android version provided.
{{ else }}
AXP.OS for the *{{ .devicename }}* does **not** include firmware.  
You must ensure correct firmware manually to avoid unexpected problems.

Follow the [AXP.OS firmware guide]({{ printf "%s" .docbaseurl }}/fw-{{ .vendor }}).<br/>
If there is no specific AXP.OS guide, check if there is a LineageOS [firmware guide for {{ .codename }}](
https://wiki.lineageos.org/devices/{{ .codename }}/fw_update/) and match it with the AXP.OS Android version.
{{ end }}

> [!IMPORTANT]
> _Unfortunately, some manufacturers enable so-called “[Anti-Rollback Protection](/docs/knowledge/faq/#anti-roll-back-arb)” (ARB), which in the worst-case scenario can even take effect within the bootloader (notable examples include various LG models, as well as Samsung and even some Google Pixel devices)._
> 
> _In these cases, special caution must be exercised, as this can often result in a hard brick, which may be unreparable depending on the manufacturer and model. This is not a problem with AXP.OS itself, but affects all custom OSes for such devices._
> 
> _If you are unsure, please check with the support room **before** flashing AXP.OS._

### Install / Upgrade

{{ if eq .custominstall "yes" }}
    {{ $guide := printf "%s" .custominstall_path }}
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
