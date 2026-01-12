---
title: "{{ getenv "HUGO_NAME" }}"

# COMMON (shared)
codename: {{ getenv "HUGO_CODENAME" }}
debugbootpath: {{ getenv "HUGO_DEBUGBOOTPATH" }}
factoryzip: "{{ getenv "HUGO_FACTORYZIP" }}"
firmware: {{ getenv "HUGO_FIRMWARE" }}
isab: "{{ getenv "HUGO_ISAB" }}"
ispixel: "{{ getenv "HUGO_ISPIXEL" }}"
kilink: {{ getenv "HUGO_KILINK" }}
name: {{ getenv "HUGO_NAME" }}
vendor: {{ getenv "HUGO_VENDOR" }}
xdalink: "{{ getenv "HUGO_XDALINK" }}"
custominstall: "{{ getenv "HUGO_CI_GUIDE" }}"
custominstall_path: {{ getenv "HUGO_CI_GUIDE_PATH" }}

# PRO
android_pro: {{ getenv "HUGO_PRO_ANDROID" }}
encryption_pro: "{{ getenv "HUGO_PRO_ENCRYPTION" }}"
firstrelease_pro: "{{ getenv "HUGO_PRO_FIRSTRELEASE" }}"
flavors_pro: {{ getenv "HUGO_PRO_FLAVOR" }}
patchlevel_pro: "{{ with getenv "HUGO_PRO_PATCHLEVEL" }}{{ . }}{{ else }}Platform + Kernel{{ end }}"
relockable_pro: "{{ getenv "HUGO_PRO_RELOCKABLE" }}"
state_pro: "{{ getenv "HUGO_PRO_STATE" }}"
supportlevel_pro: {{ getenv "HUGO_PRO_SUPPORTLEVEL" }}
verifiedboot_pro: {{ getenv "HUGO_PRO_VERIFIEDBOOT" }}

# SLIM
android_slim: {{ getenv "HUGO_SLIM_ANDROID" }}
encryption_slim: "{{ getenv "HUGO_SLIM_ENCRYPTION" }}"
firstrelease_slim: "{{ getenv "HUGO_SLIM_FIRSTRELEASE" }}"
flavors_slim: {{ getenv "HUGO_SLIM_FLAVOR" }}
patchlevel_slim: "{{ with getenv "HUGO_SLIM_PATCHLEVEL" }}{{ . }}{{ else }}Platform + Kernel{{ end }}"
relockable_slim: "{{ getenv "HUGO_SLIM_RELOCKABLE" }}"
state_slim: "{{ getenv "HUGO_SLIM_STATE" }}"
supportlevel_slim: {{ getenv "HUGO_SLIM_SUPPORTLEVEL" }}
verifiedboot_slim: {{ getenv "HUGO_SLIM_VERIFIEDBOOT" }}

type: docs
layout: device
toc: true
---
