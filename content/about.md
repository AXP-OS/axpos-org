---
title: About
toc: true
---
![](/favicon.svg)
<center>
<h4>[A]dvanced [XP]erience [OS]</h4>
<br/>
{{< globalvar key="about_info" format="true" >}}
</center>

## The project name

- full project name: `[A]dvanced [XP]erience [OS]`, `The AXP.OS Project`
- shortened: `AXP.OS`, `AXP-OS` _(when a dot is not allowed)_,`AOS`
- **NOT** a valid short name: _AOSP_

## The OS

No, this is not a _ROM_, a term often used for hacky adjustments of existing OS builds.<br/>
AXP.OS is a fully-fledged operating system in its own right, i.e. an [O]perating [S]ystem.

- based on*: [LineageOS](https://github.com/LineageOS/) which itself is based on [AOSP](https://source.android.com/)
- using massively patches from: [GrapheneOS](https://github.com/GrapheneOS)
- using several patches from: [CalyxOS](https://gitlab.com/CalyxOS/)
- using several patches from: DivestOS by [Divested Computing Group](https://github.com/Divested-Mobile/DivestOS-Build)
- on top of this: massive {{< globalvar key="docBaseUrl" uripath="/Features" linkname="enhancements and additions" >}} by the AXP.OS project
- details about the above can be found at the {{< globalvar key="docBaseUrl" uripath="/Technical-Details" linkname="Technical Details" >}} page

*) _since January 2025 due to the {{< globalvar key="docBaseUrl" uripath="/Divest_EOL" linkname="EOL of DivestOS" >}}_

## Project Milestones

{{% steps %}}

### Now

### 2025-02
- new website using [HUGO](https://gohugo.io/) running [hextra](https://github.com/imfing/hextra) theme
- shifting device guides from Github to https://axpos.org basing on templates to ease maintenance and adding new devices

### 2025-01

- Shifting (or removing) all major DivestOS dependencies to own implementations
- introduced [AXP.OS flavors]({{< docbaseurl >}}/AOS%E2%80%90Flavors), providing a _Slim_ version mainly for DivestOS "refugees"
- introduced [AOSmium]({{< docbaseurl >}}/Browser) the AXP.OS Browser + WebView
- fully adapting ASB patching (Android sources) to own automation processes

### 2024-12-23

- The [EOL of DivestOS]({{< docbaseurl >}}/Divest_EOL), the base for AXP.OS up to this time.

### 2024-11

- finalized [Reproducible builds]({{< docbaseurl >}}/Reproducible-builds)

### 2024-06

- introduced [Reproducible builds]({{< docbaseurl >}}/Reproducible-builds)

### 2023-03-31

- Initial project start / First public(!) changes

{{% /steps %}}
