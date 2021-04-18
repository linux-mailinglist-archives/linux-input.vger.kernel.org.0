Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3882036364D
	for <lists+linux-input@lfdr.de>; Sun, 18 Apr 2021 17:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbhDRPJy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 18 Apr 2021 11:09:54 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:55607 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231409AbhDRPJy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 18 Apr 2021 11:09:54 -0400
Received: from fsav405.sakura.ne.jp (fsav405.sakura.ne.jp [133.242.250.104])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 13IF9A2c077658;
        Mon, 19 Apr 2021 00:09:10 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav405.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav405.sakura.ne.jp);
 Mon, 19 Apr 2021 00:09:10 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav405.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 13IF99eq077653
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 19 Apr 2021 00:09:10 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [syzbot] unexpected kernel reboot (4)
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To:     Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>
Cc:     syzbot <syzbot+9ce030d4c89856b27619@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
References: <000000000000301a4d05bfe14b8f@google.com>
 <CACT4Y+ZT2m7t+o9=VYCE32U_1aUVJXRp_5KgJSdEZC1YXy=qgA@mail.gmail.com>
 <CA+fCnZcWEuYeOx6-0LY+cqtGVbMx2OiyhEELErdfwaHGcUWHbQ@mail.gmail.com>
 <55f68dce-77e8-b142-0822-fca14b13d4bd@i-love.sakura.ne.jp>
Message-ID: <be9e80b1-5be1-842e-538e-d69a3995d567@i-love.sakura.ne.jp>
Date:   Mon, 19 Apr 2021 00:09:07 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <55f68dce-77e8-b142-0822-fca14b13d4bd@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 2021/04/17 12:19, Tetsuo Handa wrote:
> On 2021/04/15 0:39, Andrey Konovalov wrote:
>> On Wed, Apr 14, 2021 at 7:45 AM Dmitry Vyukov <dvyukov@google.com> wrote:
>>> The reproducer connects some USB HID device and communicates with the driver.
>>> Previously we observed reboots because HID devices can trigger reboot
>>> SYSRQ, but we disable it with "CONFIG_MAGIC_SYSRQ is not set".
>>> How else can a USB device reboot the machine? Is it possible to disable it?
>>> I don't see any direct includes of <linux/reboot.h> in drivers/usb/*
>>
>> This happens when a keyboard sends the Ctrl+Alt+Del sequence, see
>> fn_boot_it()->ctrl_alt_del() in drivers/tty/vt/keyboard.c.
>>
> 
> Regarding ctrl_alt_del() problem, doing
> 
>   sh -c 'echo 0 > /proc/sys/kernel/ctrl-alt-del; echo $$ > /proc/sys/kernel/cad_pid'
> 
> as root before start fuzzing might help.
> 
> Also, with the command above, reproducer still triggers suspend operation which freezes userspace processes.
> This could possibly be one of causes for no output / lost connections. Try disabling freeze/suspend related configs?
> 

I tried

  # CONFIG_HIBERNATION is not set
  # CONFIG_SUSPEND is not set
  # CONFIG_PM is not set

but the reproducer still shutdowns the system.

The reproducer can be simplified to single threaded.

----------------------------------------
int main(int argc, char *argv[])
{
        uint64_t r[1] = { 0xffffffffffffffff };

        syscall(__NR_mmap, 0x20000000ul, 0x1000000ul, 7ul, 0x32ul, -1, 0ul);
        memcpy((void*)0x20000200,
               "\x12\x01\x00\x00\x00\x00\x00\x40\x26\x09\x33\x33\x40\x00\x00\x00\x00"
               "\x01\x09\x02\x24\x00\x01\x00\x00\x00\x00\x09\x04\x00\x00\x01\x03\x01"
               "\x00\x00\x09\x21\x00\x00\x00\x01\x22\x01\x00\x09\x05\x81\x03\x08",
               50);
        r[0] = syz_usb_connect(0, 0x36, 0x20000200, 0);
        syz_usb_control_io(r[0], 0, 0);
        *(uint32_t*)0x20000300 = 0x24;
        *(uint64_t*)0x20000304 = 0;
        *(uint64_t*)0x2000030c = 0;
        *(uint64_t*)0x20000314 = 0x200001c0;
        *(uint8_t*)0x200001c0 = 0;
        *(uint8_t*)0x200001c1 = 0x22;
        *(uint32_t*)0x200001c2 = 5;
        STORE_BY_BITMASK(uint8_t, , 0x200001c6, 3, 0, 2);
        STORE_BY_BITMASK(uint8_t, , 0x200001c6, 0, 2, 2);
        STORE_BY_BITMASK(uint8_t, , 0x200001c6, 0, 4, 4);
        memcpy((void*)0x200001c7, "\x65\xe9\x5e\x9d", 4);
        *(uint64_t*)0x2000031c = 0;
        syz_usb_control_io(r[0], 0x20000300, 0);
        syz_usb_ep_write(r[0], 0, 5, (long) "\x8e\xc5\x44\xbc\x66");
        return 0;
}
----------------------------------------

Since applying below diff does not help, I don't think that
this problem can be avoided by modifying tty code.

----------------------------------------
diff --git a/drivers/tty/vt/keyboard.c b/drivers/tty/vt/keyboard.c
index 77638629c562..25e6d52f5de6 100644
--- a/drivers/tty/vt/keyboard.c
+++ b/drivers/tty/vt/keyboard.c
@@ -323,12 +323,14 @@ int kbd_rate(struct kbd_repeat *rpt)
  */
 static void put_queue(struct vc_data *vc, int ch)
 {
+	return;
 	tty_insert_flip_char(&vc->port, ch, 0);
 	tty_schedule_flip(&vc->port);
 }
 
 static void puts_queue(struct vc_data *vc, const char *cp)
 {
+	return;
 	tty_insert_flip_string(&vc->port, cp, strlen(cp));
 	tty_schedule_flip(&vc->port);
 }
@@ -657,7 +659,7 @@ static void k_spec(struct vc_data *vc, unsigned char value, char up_flag)
 	     kbd->kbdmode == VC_OFF) &&
 	     value != KVAL(K_SAK))
 		return;		/* SAK is allowed even in raw mode */
-	fn_handler[value](vc);
+	//fn_handler[value](vc);
 }
 
 static void k_lowercase(struct vc_data *vc, unsigned char value, char up_flag)
@@ -1393,6 +1395,7 @@ static void kbd_keycode(unsigned int keycode, int down, bool hw_raw)
 	struct keyboard_notifier_param param = { .vc = vc, .value = keycode, .down = down };
 	int rc;
 
+	return;
 	tty = vc->port.tty;
 
 	if (tty && (!tty->driver_data)) {
@@ -1509,7 +1512,7 @@ static void kbd_keycode(unsigned int keycode, int down, bool hw_raw)
 	if ((raw_mode || kbd->kbdmode == VC_OFF) && type != KT_SPEC && type != KT_SHIFT)
 		return;
 
-	(*k_handler[type])(vc, keysym & 0xff, !down);
+	//(*k_handler[type])(vc, keysym & 0xff, !down);
 
 	param.ledstate = kbd->ledflagstate;
 	atomic_notifier_call_chain(&keyboard_notifier_list, KBD_POST_KEYSYM, &param);
----------------------------------------

Running the reproducer with

  dbus-monitor --system > /dev/ttyprintk

reports that systemd's shutdown service is requested when syz_usb_ep_write() is called.
I can't understand why the command "\x8e\xc5\x44\xbc\x66" leads to this result.

----------------------------------------
[   62.382763][   T47] usb 5-1: new high-speed USB device number 2 using dummy_hcd
[   62.745091][   T47] usb 5-1: config 0 interface 0 altsetting 0 endpoint 0x81 has an invalid bInterval 0, changing to 7
[   62.749179][   T47] usb 5-1: New USB device found, idVendor=0926, idProduct=3333, bcdDevice= 0.40
[   62.753184][   T47] usb 5-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[   62.755699][   T47] usb 5-1: config 0 descriptor??
[   63.234744][   T47] keytouch 0003:0926:3333.0002: fixing up Keytouch IEC report descriptor
[   63.238348][   T47] input: HID 0926:3333 as /devices/platform/dummy_hcd.0/usb5/5-1/5-1:0.0/0003:0926:3333.0002/input/input5
[   63.303922][   T47] keytouch 0003:0926:3333.0002: input,hidraw1: USB HID v0.00 Keyboard [HID 0926:3333] on usb-dummy_hcd.0-1/input0
[   63.455055][ T6657] [U] method call time=1618757344.787542 sender=:1.4 -> destination=org.freedesktop.systemd1 serial=62 path=/org/freedesktop/systemd1/unit/poweroff_2etarget; interface=org.freedesktop.DBus.Properties; member=Get
[   63.517372][ T6657] [U]    string "org.freedesktop.systemd1.Unit"
[   63.519572][ T6657] [U]    string "LoadState"
[   63.521683][ T6657] [U] method return time=1618757344.854169 sender=:1.1 -> destination=:1.4 serial=539 reply_serial=62
[   63.526490][ T6657] [U]    variant       string "loaded"
[   63.541841][ T6657] [U] signal time=1618757344.874316 sender=:1.4 -> destination=(null destination) serial=63 path=/org/freedesktop/login1; interface=org.freedesktop.login1.Manager; member=PrepareForShutdown
[   63.553667][ T6657] [U]    boolean true
[   63.557131][ T6657] [U] signal time=1618757344.889621 sender=:1.1 -> destination=(null destination) serial=540 path=/org/freedesktop/systemd1; interface=org.freedesktop.systemd1.Manager; member=UnitNew
[   63.570075][ T6657] [U]    string "snapd.system-shutdown.service"
[   63.573237][ T6657] [U]    object path "/org/freedesktop/systemd1/unit/snapd_2esystem_2dshutdown_2eservice"
[   63.579551][ T6657] [U] signal time=1618757344.912040 sender=:1.1 -> destination=(null destination) serial=541 path=/org/freedesktop/systemd1; interface=org.freedesktop.systemd1.Manager; member=UnitRemoved
[   63.590224][ T6657] [U]    string "snapd.system-shutdown.service"
[   63.595151][ T5520] usb 5-1: USB disconnect, device number 2
[   64.416748][    T1] systemd-shutdown[1]: Syncing filesystems and block devices.
[   64.442933][    T1] systemd-shutdown[1]: Sending SIGTERM to remaining processes...
[   64.455565][ T5479] systemd-journald[5479]: Received SIGTERM from PID 1 (systemd-shutdow).
[   64.685854][    T1] systemd-shutdown[1]: Sending SIGKILL to remaining processes...
[   64.700991][    T1] systemd-shutdown[1]: Unmounting file systems.
[   64.710744][ T7247] [7247]: Remounting '/' read-only in with options 'errors=remount-ro'.
----------------------------------------

Running the reproducer with

  strace -qttf -s 256 -o /dev/ttyprintk -p 1

reports that systemd accesses service files related to shutdown operation
and actually performs shutdown when syz_usb_ep_write() is called.

----------------------------------------
[   81.439176][   T25] usb 5-1: new high-speed USB device number 2 using dummy_hcd
[   81.810488][   T25] usb 5-1: config 0 interface 0 altsetting 0 endpoint 0x81 has an invalid bInterval 0, changing to 7
[   81.814352][   T25] usb 5-1: New USB device found, idVendor=0926, idProduct=3333, bcdDevice= 0.40
[   81.817830][   T25] usb 5-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
[   81.821033][   T25] usb 5-1: config 0 descriptor??
[   82.298058][   T25] keytouch 0003:0926:3333.0002: fixing up Keytouch IEC report descriptor
[   82.314739][   T25] input: HID 0926:3333 as /devices/platform/dummy_hcd.0/usb5/5-1/5-1:0.0/0003:0926:3333.0002/input/input5
[   82.399716][   T25] keytouch 0003:0926:3333.0002: input,hidraw1: USB HID v0.00 Keyboard [HID 0926:3333] on usb-dummy_hcd.0-1/input0
[   82.521650][ T6702] [U] 1     23:55:59.696753 epoll_wait(4, [{EPOLLIN, {u32=1595287216, u64=94362026780336}}], 82, -1) = 1
[   82.526627][ T6702] [U] 1     23:56:01.028146 recvmsg(63, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="l\1\0\0012\0\0\0(\0\0\0\265\0\0\0\1\1o\0000\0\0\0", iov_len=24}], msg_iovlen=1, msg_controllen=0, msg_flags=MSG_CMSG_CLOEXEC}, MSG_DONTWAIT|MSG_CMSG_CLOEXEC) = 24
[   82.536638][ T6702] [U] 1     23:56:01.038156 recvmsg(63, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="/org/freedesktop/systemd1/unit/poweroff_2etarget\0\0\0\0\0\0\0\0\3\1s\0\3\0\0\0Get\0\0\0\0\0\2\1s\0\37\0\0\0org.freedesktop.DBus.Properties\0\6\1s\0\30\0\0\0org.freedesktop.systemd1\0\0\0\0\0\0\0\0\10\1g\0\2ss\0\7\1s\0\4\0\0\0:1.4\0\0\0\0\35\0\0\0org.freedesktop.systemd1.Unit\0\0\0\t\0\0\0LoadState\0", iov_len=226}], msg_iovlen=1, msg_controllen=0, msg_flags=MSG_CMSG_CLOEXEC}, MSG_DONTWAIT|MSG_CMSG_CLOEXEC) = 226
[   82.558307][ T6702] [U] 1     23:56:01.059814 stat("/etc/systemd/system", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
[   82.562924][ T6702] [U] 1     23:56:01.064464 stat("/etc/systemd/system.attached", 0x7fff5a8c5380) = -1 ENOENT (No such file or directory)
[   82.568439][ T6702] [U] 1     23:56:01.069990 stat("/run/systemd/system", {st_mode=S_IFDIR|0755, st_size=40, ...}) = 0
[   82.572344][ T6702] [U] 1     23:56:01.073884 stat("/run/systemd/system.attached", 0x7fff5a8c5380) = -1 ENOENT (No such file or directory)
[   82.577160][ T6702] [U] 1     23:56:01.078594 stat("/usr/local/lib/systemd/system", 0x7fff5a8c5380) = -1 ENOENT (No such file or directory)
[   82.581731][ T6702] [U] 1     23:56:01.083300 stat("/lib/systemd/system", {st_mode=S_IFDIR|0755, st_size=36864, ...}) = 0
[   82.585468][ T6702] [U] 1     23:56:01.087032 stat("/usr/lib/systemd/system", 0x7fff5a8c5380) = -1 ENOENT (No such file or directory)
[   82.589930][ T6702] [U] 1     23:56:01.091488 openat(AT_FDCWD, "/lib/systemd/system/poweroff.target", O_RDONLY|O_CLOEXEC) = 12
[   82.593785][ T6702] [U] 1     23:56:01.095368 fstat(12, {st_mode=S_IFREG|0644, st_size=592, ...}) = 0
[   82.598005][ T6702] [U] 1     23:56:01.099592 fstat(12, {st_mode=S_IFREG|0644, st_size=592, ...}) = 0
[   82.601230][ T6702] [U] 1     23:56:01.102831 fstat(12, {st_mode=S_IFREG|0644, st_size=592, ...}) = 0
[   82.604831][ T6702] [U] 1     23:56:01.106074 read(12, "#  SPDX-License-Identifier: LGPL-2.1+\n#\n#  This file is part of systemd.\n#\n#  systemd is free software; you can redistribute it and/or modify it\n#  under the terms of the GNU Lesser General Public License as published by\n#  the Free Software Foundation; ei"..., 4096) = 592
[   82.614929][ T6702] [U] 1     23:56:01.116431 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.618853][ T6702] [U] 1     23:56:01.120455 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.622814][ T6702] [U] 1     23:56:01.124403 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.627687][ T6702] [U] 1     23:56:01.128512 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.631510][ T6702] [U] 1     23:56:01.133113 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.635264][ T6702] [U] 1     23:56:01.136875 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.641600][ T6702] [U] 1     23:56:01.143083 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.645731][ T6702] [U] 1     23:56:01.147328 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.649761][ T6702] [U] 1     23:56:01.151305 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.653348][ T6702] [U] 1     23:56:01.154962 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.657595][ T6702] [U] 1     23:56:01.159116 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.661289][ T6702] [U] 1     23:56:01.162902 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.664922][ T6702] [U] 1     23:56:01.166538 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.669537][ T6702] [U] 1     23:56:01.171104 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.673837][ T6702] [U] 1     23:56:01.175434 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.678120][ T6702] [U] 1     23:56:01.179733 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.682841][ T6702] [U] 1     23:56:01.184426 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.686856][ T6702] [U] 1     23:56:01.188459 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.691748][ T6702] [U] 1     23:56:01.193304 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.695430][ T6702] [U] 1     23:56:01.197045 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.700062][   T25] usb 5-1: USB disconnect, device number 2
[   82.700247][ T6702] [U] 1     23:56:01.201701 ioctl(12, TCGETS, 0x7fff5a8c5270) = -1 ENOTTY (Inappropriate ioctl for device)
[   82.706855][ T6702] [U] 1     23:56:01.208423 read(12, "", 4096) = 0
[   82.709183][ T6702] [U] 1     23:56:01.210816 close(12)         = 0
[   82.711451][ T6702] [U] 1     23:56:01.213069 openat(AT_FDCWD, "/", O_RDONLY|O_CLOEXEC|O_PATH|O_DIRECTORY) = 12
[   82.715204][ T6702] [U] 1     23:56:01.216762 openat(12, "lib", O_RDONLY|O_NOFOLLOW|O_CLOEXEC|O_PATH) = 21
[   82.719140][ T6702] [U] 1     23:56:01.220780 fstat(21, {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
[   82.723488][ T6702] [U] 1     23:56:01.225088 close(12)         = 0
[   82.726122][ T6702] [U] 1     23:56:01.227677 openat(21, "systemd", O_RDONLY|O_NOFOLLOW|O_CLOEXEC|O_PATH) = 12
[   82.729780][ T6702] [U] 1     23:56:01.231409 fstat(12, {st_mode=S_IFDIR|0755, st_size=12288, ...}) = 0
[   82.733039][ T6702] [U] 1     23:56:01.234655 close(21)         = 0
[   82.735282][ T6702] [U] 1     23:56:01.236896 openat(12, "system", O_RDONLY|O_NOFOLLOW|O_CLOEXEC|O_PATH) = 21
[   82.739585][ T6702] [U] 1     23:56:01.241182 fstat(21, {st_mode=S_IFDIR|0755, st_size=36864, ...}) = 0
[   82.742829][ T6702] [U] 1     23:56:01.244396 close(12)         = 0
[   82.745269][ T6702] [U] 1     23:56:01.246859 openat(21, "poweroff.target.wants", O_RDONLY|O_NOFOLLOW|O_CLOEXEC|O_PATH) = 12
[   82.749170][ T6702] [U] 1     23:56:01.250814 fstat(12, {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
[   82.752399][ T6702] [U] 1     23:56:01.254020 close(21)         = 0
[   82.754635][ T6702] [U] 1     23:56:01.256256 close(12)         = 0
[   82.757679][ T6702] [U] 1     23:56:01.259294 openat(AT_FDCWD, "/", O_RDONLY|O_CLOEXEC|O_PATH|O_DIRECTORY) = 12
[   82.761019][ T6702] [U] 1     23:56:01.262646 openat(12, "lib", O_RDONLY|O_NOFOLLOW|O_CLOEXEC|O_PATH) = 21
[   82.764657][ T6702] [U] 1     23:56:01.266171 fstat(21, {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
[   82.768295][ T6702] [U] 1     23:56:01.269934 close(12)         = 0
[   82.770602][ T6702] [U] 1     23:56:01.272190 openat(21, "systemd", O_RDONLY|O_NOFOLLOW|O_CLOEXEC|O_PATH) = 12
[   82.775088][ T6702] [U] 1     23:56:01.276675 fstat(12, {st_mode=S_IFDIR|0755, st_size=12288, ...}) = 0
[   82.778443][ T6702] [U] 1     23:56:01.280088 close(21)         = 0
[   82.780718][ T6702] [U] 1     23:56:01.282325 openat(12, "system", O_RDONLY|O_NOFOLLOW|O_CLOEXEC|O_PATH) = 21
[   82.784142][ T6702] [U] 1     23:56:01.285761 fstat(21, {st_mode=S_IFDIR|0755, st_size=36864, ...}) = 0
[   82.788544][ T6702] [U] 1     23:56:01.290070 close(12)         = 0
[   82.791053][ T6702] [U] 1     23:56:01.292633 openat(21, "poweroff.target.wants", O_RDONLY|O_NOFOLLOW|O_CLOEXEC|O_PATH) = 12
[   82.795373][ T6702] [U] 1     23:56:01.296955 fstat(12, {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
[   82.799346][ T6702] [U] 1     23:56:01.300947 close(21)         = 0
[   82.801691][ T6702] [U] 1     23:56:01.303300 close(12)         = 0
[   82.804436][ T6702] [U] 1     23:56:01.306025 openat(AT_FDCWD, "/lib/systemd/system/poweroff.target.wants", O_RDONLY|O_NONBLOCK|O_CLOEXEC|O_DIRECTORY) = 12
[   82.809997][ T6702] [U] 1     23:56:01.311551 fstat(12, {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
[   82.813552][ T6702] [U] 1     23:56:01.314912 getdents64(12, /* 3 entries */, 32768) = 96
[   82.816742][ T6702] [U] 1     23:56:01.318366 getdents64(12, /* 0 entries */, 32768) = 0
[   82.819549][ T6702] [U] 1     23:56:01.321196 close(12)         = 0
[   82.822115][ T6702] [U] 1     23:56:01.323577 stat("/lib/systemd/system/poweroff.target.wants/plymouth-poweroff.service", {st_mode=S_IFREG|0644, st_size=456, ...}) = 0
[   82.827300][ T6702] [U] 1     23:56:01.328916 lstat("/lib/systemd/system/poweroff.target.wants/plymouth-poweroff.service", {st_mode=S_IFLNK|0777, st_size=28, ...}) = 0
[   82.832217][ T6702] [U] 1     23:56:01.333840 readlinkat(AT_FDCWD, "/lib/systemd/system/poweroff.target.wants/plymouth-poweroff.service", "../plymouth-poweroff.service", 4096) = 28
[   82.838764][ T6702] [U] 1     23:56:01.340096 stat("/etc/systemd/system", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
[   82.842656][ T6702] [U] 1     23:56:01.344240 stat("/etc/systemd/system.attached", 0x7fff5a8c53c0) = -1 ENOENT (No such file or directory)
[   82.848056][ T6702] [U] 1     23:56:01.349642 stat("/run/systemd/system", {st_mode=S_IFDIR|0755, st_size=40, ...}) = 0
[   82.852020][ T6702] [U] 1     23:56:01.353632 stat("/run/systemd/system.attached", 0x7fff5a8c53c0) = -1 ENOENT (No such file or directory)
[   82.857260][ T6702] [U] 1     23:56:01.358867 stat("/usr/local/lib/systemd/system", 0x7fff5a8c53c0) = -1 ENOENT (No such file or directory)
[   82.861603][ T6702] [U] 1     23:56:01.363201 stat("/lib/systemd/system", {st_mode=S_IFDIR|0755, st_size=36864, ...}) = 0
[   82.865468][ T6702] [U] 1     23:56:01.367087 stat("/usr/lib/systemd/system", 0x7fff5a8c53c0) = -1 ENOENT (No such file or directory)
[   82.869655][ T6702] [U] 1     23:56:01.371270 openat(AT_FDCWD, "/lib/systemd/system/plymouth-poweroff.service", O_RDONLY|O_CLOEXEC) = 12
[   82.875689][ T6702] [U] 1     23:56:01.377298 fstat(12, {st_mode=S_IFREG|0644, st_size=456, ...}) = 0
[   82.879502][ T6702] [U] 1     23:56:01.381161 fstat(12, {st_mode=S_IFREG|0644, st_size=456, ...}) = 0
[   82.882654][ T6702] [U] 1     23:56:01.384289 fstat(12, {st_mode=S_IFREG|0644, st_size=456, ...}) = 0
[   82.886762][ T6702] [U] 1     23:56:01.388143 read(12, "[Unit]\nDescription=Show Plymouth Power Off Screen\nAfter=getty@tty1.service display-manager.service plymouth-start.service\nBefore=systemd-poweroff.service\nDefaultDependencies=no\nConditionKernelCommandLine=!plymouth.enable=0\nConditionKernelCommandLine=!nospl"..., 4096) = 456
(...snipped...)
[   92.268094][ T6702] [U] 1     23:56:10.770390 openat(AT_FDCWD, "/sys/fs/cgroup/unified/user.slice/user-0.slice/session-1.scope/cgroup.procs", O_RDONLY|O_CLOEXEC) = 53
[   92.273360][ T6702] [U] 1     23:56:10.775686 fstat(53, {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
[   92.277187][ T6702] [U] 1     23:56:10.779503 read(53, "6587\n6690\n6702\n", 4096) = 15
[   92.280196][ T6702] [U] 1     23:56:10.782300 kill(6587, SIGTERM) = 0
[   92.283209][ T6702] [U] 1     23:56:10.785535 kill(6587, SIGCONT) = 0
[   92.285894][ T6702] [U] 1     23:56:10.788075 kill(6690, SIGTERM) = 0
[   92.290119][ T6702] [U] 1     23:56:10.792427 kill(6690, SIGCONT) = 0
[   92.292635][ T6702] [U] 1     23:56:10.794992 kill(6702, SIGTERM) = 0
[   92.995331][    T1] systemd-shutdown[1]: Syncing filesystems and block devices.
[   93.029308][    T1] systemd-shutdown[1]: Sending SIGTERM to remaining processes...
[   93.037016][ T5478] systemd-journald[5478]: Received SIGTERM from PID 1 (systemd-shutdow).
[   93.058691][    T1] systemd-shutdown[1]: Sending SIGKILL to remaining processes...
[   93.067591][    T1] systemd-shutdown[1]: Unmounting file systems.
[   93.070598][ T7211] [7211]: Remounting '/' read-only in with options 'errors=remount-ro'.
[   93.077341][ T7211] EXT4-fs (sda1): re-mounted. Opts: errors=remount-ro. Quota mode: none.
----------------------------------------

This problem might be difficult to avoid from the kernel side...
