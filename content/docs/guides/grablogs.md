---
title: "Grab Logs"
type: docs
toc: true
aliases:
    - /Grab-Logs
    - /GrabLogs
    - /Logs
    - /Log
---
# Application & System logs

For debugging you need to have `adb` up and running. If you have trouble with that consider using the special Android distro [mAid](https://maid.binbash.rocks/).

## Windows & Linux: Log to a file (recommended way!)

### specific issue (e.g. app crashes etc)

1. type: `adb shell` (or just open your favorite terminal app + become root via `su`)
1. type: `logcat -c -b all` (this will print nothing - it will just clear the log buffer)
1. now reproduce the issue. when the issue occurs immediately do this afterwards
   - type: `logcat -b all -d -D > /sdcard/Download/logcat.txt`
   - type: `exit`
1. grab the log:
   - `adb pull /sdcard/Download/logcat.txt`
1. upload the log, see topic [Share logs](#share-logs)
1. always share your model name (e.g. hotdog, pixel 7a, LG G4 H811, ...)

### unspecific / general issue

1. type: `adb shell` (or just open your favorite terminal app + become root via `su`)
1. type: `logcat -b all -d -D > /sdcard/Download/logcat.txt`
1. type: `exit`
1. grab the log:
   - type: `adb pull /sdcard/Download/logcat.txt`
1. upload the log, see topic [Share logs](#share-logs)
1. always share your model name (e.g. hotdog, pixel 7a, LG G4 H811, ...)

## Alternative: Windows & Linux: Log to terminal window

If the recommended way fails for any reason you can also print the logcat output in the terminal window. It's not very funny but might get the things done.

### Windows preparation

1. open a terminal and type:
    - `mode con lines=32766` and ENTER

This sets the buffer in your terminal to the max possible which is needed due to the log verbosity.

### specific issue (e.g. app crashes etc)

1. type: `adb shell` (or just open your favorite terminal app + become root via `su`)
1. type: `logcat -c -b all` (this will print nothing - it will just clear the log buffer)
1. now reproduce the issue. when the issue occurres immediately do this:
   - type: `logcat -b all -d -D`
   - type: `exit`
1. grab the log by copying the whole console output (yea u might need to scroll a lot up...)
1. upload the log, see topic [Share logs](#share-logs)
1. always share your model name (e.g. hotdog, pixel 7a, LG G4 H811, ...)

### unspecific / general issue

1. type: `adb shell` (or just open your favorite terminal app + become root via `su`)
1. type: `logcat -b all -d -D`
1. type: `exit`
1. grab the log by copying the whole console output (yea u might need to scroll a lot up...)
1. upload the log, see topic [Share logs](#share-logs)
1. always share your model name (e.g. hotdog, pixel 7a, LG G4 H811, ...)

## Boot logs

First of all: not every device shares the same path where the special AXP.OS boot logs get and so depends per device.

Check the value of `[DEVICE-BOOT-DEBUG-PATH]` in the "Debugging" topic of the [Installation guide](/devices) for your device.

### if you can boot _(requires root!)_

1. boot Android
2. ensure you have USB debugging enabled in developer options
3. this requires root, you have the following options:
   - AXP.OS Pro: [activate Magisk](/docs/guides/setup/aos/#setup-magisk)
   - AXP.OS Slim: flash Magisk manually - if you can/want, otherwise check the next topic
   - any other: check if you can enable `adb root` in Developer options _(requires a `USERDEBUG` or `ENG` build)_
4. open a terminal on your PC and execute _(replace [DEVICE-BOOT-DEBUG-PATH](/devices) with the real value)_:
- for those having `adb root`:
```
adb root
adb shell
```
- for those having `Magisk`:
```
adb shell
su     #(a Magisk prompt should appear in Android which you have to accept)
```
5. now do:
```
rm -rf /sdcard/Download/logs  #(don't worry if that one fails it might not exist)

mkdir /sdcard/Download/logs
cp [DEVICE-BOOT-DEBUG-PATH]/boot_debug/* /sdcard/Download/logs/

cat /proc/cmdline > /sdcard/Download/logs/more.txt
cat /proc/bootconfig >> /sdcard/Download/logs/more.txt
mount >> /sdcard/Download/logs/more.txt
dmesg >> /sdcard/Download/logs/more.txt

cd /sdcard/Download/logs/
tar cvzf ../logs.tgz *

exit
adb pull /sdcard/Download/logs.tgz
```
6. share the file `logs.tgz` you pulled by attaching it to an [issue](https://code.binbash.rocks/AXP.OS-public/issue-tracker) or to a related XDA post
   - _**bonus:** extract all files from `logs.tgz` and attach / paste them one by one (see topic [Share logs](#share-logs)) instead of the `logs.tgz` itself_

##### Early kernel log
Sometimes it is also required to get an early kernel log, this is how:<br/>_(ensure you walked through the above steps first because this ensures all is properly set up)_

1. Power off your device
2. start adb on your PC:
   - for those having _adb root_:<br/>
   `adb wait-for-device && adb root && adb shell dmesg`
   - for those having _Magisk_:<br/>
   `adb wait-for-device && adb shell "su -c dmesg"`
3. connect an USB cable & power on the device
4. share the output, see topic [Share logs](#share-logs)

### if you can not boot / no root _(requires TWRP)_

1. if you cannot boot or if there is no root available, you have the following options:
   - boot TWRP _(e.g. `fastboot boot twrp.img`)_
   - install TWRP _(some devices won't allow / work with `fastboot boot`)_
2. when in TWRP: ensure that "[DEVICE-BOOT-DEBUG-PATH](/devices)" is mounted in the "Mount" menu _(if not, mount it by ticking the box)_
3. open a terminal on your PC and type _(replace [DEVICE-BOOT-DEBUG-PATH](/devices) with the real value)_:
~~~
adb pull [DEVICE-BOOT-DEBUG-PATH]/boot_debug/crash.txt   (don't worry if that one fails it might not exists)
adb pull [DEVICE-BOOT-DEBUG-PATH]/boot_debug/full.txt
adb pull [DEVICE-BOOT-DEBUG-PATH]/boot_debug/full.txt.1   (don't worry if that one fails it might not exists)
adb pull [DEVICE-BOOT-DEBUG-PATH]/boot_debug/kernel.txt   (don't worry if that one fails it might not exists)   
adb pull [DEVICE-BOOT-DEBUG-PATH]/boot_debug/selinux.txt   (don't worry if that one fails it might not exists)
~~~~
1. share the log(s) you pulled by a paste service (see [Share logs](#share-logs)) or create /attach it to [an issue](https://code.binbash.rocks/AXP.OS-public/issue-tracker)

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

When sharing logs or longer texts it is recommended using a so-called "paste service". This is useful to keep a forum / chat / issue readable for everyone and it dramatically helps a developer to read the log without saving tons of log files on their phones/PC's.

{{< callout type="error" >}}
**Logs can contain sensitive information (like phone numbers, location, IP's, WiFi data, etc)!<br/>**
In case of Android logs this is almost always the case so it is generally not recommended sharing these in public (exceptions are e.g. _specific issue_ logs or the _early kernel_ log).

Keep that in mind and if you are unsure, follow the _"Sensitive log files"_ topic.

In general:
- Do not add several logs into 1 paste. **Always use a separate paste for each log!**
- Do not add any _additional_ filters to the above commands. While you _think_ that these might be useful, it often enough hides the most relevant information or an important/useful context.
{{< /callout >}}

### Sensitive log files

While there are several paste services which can encrypt your data the following is the recommended process for **AXP.OS** users:

1. Open https://paste.axpos.org/ _(running on AXP.OS servers)_
1. Set `Expires` = `1 year` _(min. 3 months, keep in mind that you need to provide a new log if selecting a too short time period)_
1. Do **not(!)** select "Burn after reading"
1. Set a strong password in the `Password` field<br/>_(and record it for later. Note: it is recommended to use the same password when pasting multiple outputs)_
1. Paste the log into the `Editor` frame _(remember: 1 paste per log/output)_
1. Click on `Create` at the top right
1. Click `Copy link` to save your unique link
1. Share that unique link from the previous step where the log was requested<br/>_(e.g. in your [issue](https://code.binbash.rocks/AXP.OS-public/issue-tracker/issues) or in the [Matrix room](/Support))_
1. Share the password **in private** only _(send the requestor a DM via [Matrix](/Support), do not use the public rooms for this)_

### Non-sensitive log files

Here are some examples (use your fav search engine to find more):

* https://paste.axpos.org/ _(running on AXP.OS servers)_
* https://privatebin.at/
* https://hastebin.com/
* https://controlc.com/
* https://privatebin.net/
* https://pastebin.com/
* https://gist.github.com/ (no size limit! req. login)
* https://gitlab.com/dashboard/snippets (no size limit! req. login)

Always set `Expires` = `1 year` _(min. 3 months, keep in mind that you need to provide a new log if selecting a too short time period)_

Please ensure you choose **at least several months** (better 1 year) because developers have a real life, too and so its uncertain when they might find time to look into it.

Once you pasted your text in there you will get an unique **paste URL** which you then can simply share in the support channel.
