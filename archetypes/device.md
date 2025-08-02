---
title: "{{ getenv "HUGO_NAME" }}"
codename: {{ getenv "HUGO_CODENAME" }}
android: {{ getenv "HUGO_ANDROID" }}
encryption: "{{ getenv "HUGO_ENCRYPTION" }}"
firmware: "{{ getenv "HUGO_FIRMWARE" }}"
relockable: "{{ getenv "HUGO_RELOCKABLE" }}"
verifiedboot: "{{ getenv "HUGO_VERIFIEDBOOT" }}"
flavors: "{{ getenv "HUGO_FLAVORS" }}"
state: "{{ getenv "HUGO_STATE" }}"
supportlevel: {{ getenv "HUGO_SUPPORTLEVEL" }}
debugbootpath: {{ getenv "HUGO_DEBUGBOOTPATH" }}
factoryzip: "{{ getenv "HUGO_FACTORYZIP" }}"
isab: "{{ getenv "HUGO_ISAB" }}"
ispixel: "{{ getenv "HUGO_ISPIXEL" }}"
kilink: {{ getenv "HUGO_KILINK" }}
custominstall: "{{ getenv "HUGO_CI_GUIDE" }}"
custominstall_path: "{{ getenv "HUGO_CI_GUIDE_PATH" }}"
customlock: "{{ getenv "HUGO_CUSTOMLOCK" }}"
xdalink: "{{ getenv "HUGO_XDALINK" }}"
firstrelease: "{{ getenv "HUGO_FIRSTRELEASE" }}"
vendor: "{{ getenv "HUGO_VENDOR" }}"

type: docs
layout: device
prev: devices/{{ getenv "HUGO_VENDOR" }}
toc: true
---
