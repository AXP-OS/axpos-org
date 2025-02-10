---
title: "Grab Logs"
type: docs
toc: true
aliases:
    - /Grab-Logs
---
## Application / System logs

For debugging you need to have adb up and running. If you have trouble with that consider using the special Android distro [mAid](https://maid.binbash.rocks/).

### Windows & Linux: Log to a file (recommended way!)

#### specific issue (e.g. app crashes etc)

1. `adb shell` (or just open your favorite terminal app + become root via `su`)
1. `logcat -c -b all` (this will print nothing - it will just clear the log buffer)
1. now reproduce the issue. when the issue occurs immediately do this afterwards
   - `logcat -b all -d -D > /sdcard/Download/logcat.txt`
1. grab the log:
   - `adb pull /sdcard/Download/logcat.txt`
1. upload the log, see topic [Share logs](#share-logs)
1. always share your model name (e.g. hotdog, pixel 7a, LG G4 H811, ...)

#### unspecific / general issue

1. `adb shell` (or just open your favorite terminal app + become root via `su`)
1. `logcat -b all -d -D > /sdcard/Download/logcat.txt`
1. grab the log:
   - `adb pull /sdcard/Download/logcat.txt`
1. upload the log, see topic [Share logs](#share-logs)
1. always share your model name (e.g. hotdog, pixel 7a, LG G4 H811, ...)

### Alternative: Windows & Linux: Log to terminal window

If the recommended way fails for any reason you can also print the logcat output in the terminal window. It's not very funny but might get the things done.

#### Windows preparation

1. open a terminal and type:
    - `mode con lines=32766` and ENTER

This sets the buffer in your terminal to the max possible which is needed due to the log verbosity.


#### specific issue (e.g. app crashes etc)

1. `adb shell` (or just open your favorite terminal app + become root via `su`)
1. `logcat -c -b all` (this will print nothing - it will just clear the log buffer)
1. now reproduce the issue. when the issue occurres immediately do this:
   - `logcat -b all -d -D`
1. grab the log by copying the whole console output (yea u might need to scroll a lot up...)
1. upload the log, see topic [Share logs](#share-logs)
1. always share your model name (e.g. hotdog, pixel 7a, LG G4 H811, ...)

#### unspecific / general issue

1. `adb shell` (or just open your favorite terminal app + become root via `su`)
1. `logcat -b all -d -D`
1. grab the log by copying the whole console output (yea u might need to scroll a lot up...)
1. upload the log, see topic [Share logs](#share-logs)
1. always share your model name (e.g. hotdog, pixel 7a, LG G4 H811, ...)


## Boot logs

First of all: not every device shares the same path where the boot logs get stored. This is due to different partitioning and so depends on the device.
 
Check the value of `[DEVICE-BOOT-DEBUG-PATH]` in the "Debugging" topic of the [Installation guide](/devices) for your device.

#### if you can boot

1. boot Android
1. ensure you have USB debugging enabled in developer options
1. open a terminal on your PC and execute (obviously replace `[DEVICE-BOOT-DEBUG-PATH]` with the real value):
~~~
adb shell
su     (Magisk prompt should appear which you need to accept)
tar cvfz /sdcard/Download/logs.tgz [DEVICE-BOOT-DEBUG-PATH]/boot_debug
exit
adb pull /sdcard/Download/logs.tgz
~~~
4. share the file `logs.tgz` you pulled by attaching it to a [new issue](https://github.com/AXP-OS/issue-tracker/issues) or to a related XDA post

#### if you can not boot

1. if you encounter a bootloop instead: you need to install TWRP first
1. once in TWRP ensure that "`[DEVICE-BOOT-DEBUG-PATH]`" is mounted in the "Mount" menu (if not mount it by ticking the box)
1. open a terminal on your PC and type (obviously replace `[DEVICE-BOOT-DEBUG-PATH]` with the real value):
~~~
adb pull [DEVICE-BOOT-DEBUG-PATH]/boot_debug/crash.txt   (don't worry if that one fails it might not exists)
adb pull [DEVICE-BOOT-DEBUG-PATH]/boot_debug/full.txt
adb pull [DEVICE-BOOT-DEBUG-PATH]/boot_debug/full.txt.1   (don't worry if that one fails it might not exists)
adb pull [DEVICE-BOOT-DEBUG-PATH]/boot_debug/kernel.txt   (don't worry if that one fails it might not exists)   
adb pull [DEVICE-BOOT-DEBUG-PATH]/boot_debug/selinux.txt   (don't worry if that one fails it might not exists)
~~~~
4. share the log(s) you pulled by a paste service (see [Share logs](#share-logs)) or create /attach it to [an issue](https://github.com/AXP-OS/issue-tracker/issues)

## Recovery logs (TWRP)

### minimal (recovery.log)

1. Boot in TWRP and connect an USB cable to your device
1. Re-produce the issue you have
1. Menu: Advanced
1. Menu: Copy Log
1. Click Home button and go to Menu: Mount
1. Ensure MTP is enabled (button at the bottom)
1. Open the file explorer on your PC and go to Sdcard
1. open the file "recovery.log" in a text editor
1. share the log (see next topic)

Alternative approach:
1. Boot in TWRP and connect an USB cable to your device
1. Re-produce the issue you have
1. Execute on your PC: `adb pull /tmp/recovery.log`
1. share the log (see next topic)

### full

1. Boot TWRP and connect an USB cable to your device
1. Re-produce the issue you have
1. Then on your PC (requires ADB installed! Check FAQ #3 of this post!!):
```
adb shell
dmesg > /tmp/dmesg.txt
logcat -d -b all > /tmp/logcat.txt
cat /proc/last_kmsg > /tmp/kmsg.txt
exit
adb pull /tmp/logcat.txt
adb pull /tmp/kmsg.txt
adb pull /tmp/recovery.log
adb pull /tmp/dmesg.txt
```
4. Open all logs one by one with a text editor like wordpad or similar and paste
5. share the log (see next topic)

## Share logs

When sharing logs or longer texts it is recommended a so-called "paste service". This is useful to keep a forum / chat readable for everyone and it dramatically helps a developer to read the log without saving tons of log files on their phones/PC's.

Here are some examples (use your fav search engine to find more):

* https://privatebin.at/
* https://paste.binbash.rocks:8999/ | https://paste.axpos.org:8999/
* https://hastebin.com/
* https://controlc.com/
* https://privatebin.net/
* https://pastebin.com/
* https://gist.github.com/ (no size limit! req. login)
* https://gitlab.com/dashboard/snippets (no size limit! req. login)

There you will always have an option **how long** you want to store that paste:

Please ensure you choose **at least several months** (better 1 year) because developers have a real life, too and so its uncertain when they might find time to look into it.

Once you pasted your text in there you will get an unique **paste URL** which you then can simply share in the support channel.
