Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFF2A683A
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 14:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729096AbfICMJA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 08:09:00 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:47029 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729088AbfICMIL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Sep 2019 08:08:11 -0400
Received: by mail-io1-f70.google.com with SMTP id o3so8640543iom.13
        for <linux-input@vger.kernel.org>; Tue, 03 Sep 2019 05:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=+TyJ0OG+pPp/DvJlej8bfcgO9uWPlVMHlJBQUM4x4e4=;
        b=YyhwLfP0MiL79nh0yG2/9ztBuToES4aBPHNqRKUZMK1mLZFte6JpTh1QVtPoAv9fai
         Cld3FIoHs3DnQC/db0PawaW58P+dRwO8FBKYrlEzjXNoSVWxu9Tw4pUVbv0CnjyoFF0K
         jm4YZAjydTOzEigSQp2zIHiX+atnTPISb3XQbNrH0AafWiQ3LjtCESlOKd+pxtwXCjO0
         ZsggoWcpeGqULYsgGdGag7uUXDElPbjvefWoLqZ6pd118f4/8RuLJStsh25yERY7PDHY
         jjlFHalosqJ0pzf2bJ3lx2eddBYC3wLxWAJfbHzWz0auEZ+9j2VyVrAyj5QFhJuodcpk
         Sq/g==
X-Gm-Message-State: APjAAAVhk2VXmpnyg8xplnp4a7Moud1TBhwaQaW5lxT8NLdrasjrL1s+
        N8qLXXDVnk3CSJ2uizCdtMI9QgWTpNWaGOYWsT5iBkiPBUgF
X-Google-Smtp-Source: APXvYqwoaPI8LWTk3EClq2Sd2SgccAwr6DL1QApT7yvnOxkC1F2kOs7555u/MDme+whxIW+TPpWRqTspOTNuEf+TULLMgC0UsAcx
MIME-Version: 1.0
X-Received: by 2002:a5e:d80e:: with SMTP id l14mr10372843iok.217.1567512490089;
 Tue, 03 Sep 2019 05:08:10 -0700 (PDT)
Date:   Tue, 03 Sep 2019 05:08:10 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002725f40591a4f118@google.com>
Subject: general protection fault in pk_probe
From:   syzbot <syzbot+1088533649dafa1c9004@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    eea39f24 usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=14c3589e600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
dashboard link: https://syzkaller.appspot.com/bug?extid=1088533649dafa1c9004
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1667cc66600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10f30dbc600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+1088533649dafa1c9004@syzkaller.appspotmail.com

prodikeys 0003:041E:2801.0001: unknown main item tag 0x0
prodikeys 0003:041E:2801.0001: unknown main item tag 0x0
prodikeys 0003:041E:2801.0001: hidraw0: USB HID v0.00 Device [HID  
041e:2801] on usb-dummy_hcd.0-1/input1
kasan: CONFIG_KASAN_INLINE enabled
kasan: GPF could be caused by NULL-ptr deref or user memory access
general protection fault: 0000 [#1] SMP KASAN
CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.3.0-rc5+ #28
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
RIP: 0010:pcmidi_submit_output_report drivers/hid/hid-prodikeys.c:300  
[inline]
RIP: 0010:pcmidi_set_operational drivers/hid/hid-prodikeys.c:558 [inline]
RIP: 0010:pcmidi_snd_initialise drivers/hid/hid-prodikeys.c:686 [inline]
RIP: 0010:pk_probe+0xb51/0xfd0 drivers/hid/hid-prodikeys.c:836
Code: 0f 85 50 04 00 00 48 8b 04 24 4c 89 7d 10 48 8b 58 08 e8 b2 53 e4 fc  
48 8b 54 24 20 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 0f  
85 13 04 00 00 48 ba 00 00 00 00 00 fc ff df 49 8b
RSP: 0018:ffff8881da20ee10 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff8881d2d40000 RCX: ffffffff8459833e
RDX: 0000000000000006 RSI: ffffffff8459862e RDI: ffff8881d2aee610
RBP: ffff8881d2aee600 R08: ffff8881da1f9800 R09: ffffed103b64677c
R10: ffffed103b64677b R11: ffff8881db233bdb R12: ffff8881d2d40000
R13: 0000000000000000 R14: ffff8881d4ec4ab0 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2fc6afa518 CR3: 00000001d099d000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
  hid_device_probe+0x2be/0x3f0 drivers/hid/hid-core.c:2209
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2165
  hid_add_device+0x33c/0x990 drivers/hid/hid-core.c:2365
  usbhid_probe+0xa81/0xfa0 drivers/hid/usbhid/hid-core.c:1386
  usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2165
  usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
  generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
  usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
  __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
  bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
  __device_attach+0x217/0x360 drivers/base/dd.c:894
  bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
  device_add+0xae6/0x16f0 drivers/base/core.c:2165
  usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
  process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
  worker_thread+0x96/0xe20 kernel/workqueue.c:2415
  kthread+0x318/0x420 kernel/kthread.c:255
  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace 57a1aecde3464295 ]---
RIP: 0010:pcmidi_submit_output_report drivers/hid/hid-prodikeys.c:300  
[inline]
RIP: 0010:pcmidi_set_operational drivers/hid/hid-prodikeys.c:558 [inline]
RIP: 0010:pcmidi_snd_initialise drivers/hid/hid-prodikeys.c:686 [inline]
RIP: 0010:pk_probe+0xb51/0xfd0 drivers/hid/hid-prodikeys.c:836
Code: 0f 85 50 04 00 00 48 8b 04 24 4c 89 7d 10 48 8b 58 08 e8 b2 53 e4 fc  
48 8b 54 24 20 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 <80> 3c 02 00 0f  
85 13 04 00 00 48 ba 00 00 00 00 00 fc ff df 49 8b
RSP: 0018:ffff8881da20ee10 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff8881d2d40000 RCX: ffffffff8459833e
RDX: 0000000000000006 RSI: ffffffff8459862e RDI: ffff8881d2aee610
RBP: ffff8881d2aee600 R08: ffff8881da1f9800 R09: ffffed103b64677c
R10: ffffed103b64677b R11: ffff8881db233bdb R12: ffff8881d2d40000
R13: 0000000000000000 R14: ffff8881d4ec4ab0 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8881db200000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2fc6afa518 CR3: 00000001d099d000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
