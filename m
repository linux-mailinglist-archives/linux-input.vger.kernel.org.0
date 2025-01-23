Return-Path: <linux-input+bounces-9488-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D63BA1A499
	for <lists+linux-input@lfdr.de>; Thu, 23 Jan 2025 13:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41377169097
	for <lists+linux-input@lfdr.de>; Thu, 23 Jan 2025 12:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAAF20F064;
	Thu, 23 Jan 2025 12:57:25 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C3420E6F0
	for <linux-input@vger.kernel.org>; Thu, 23 Jan 2025 12:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737637045; cv=none; b=omqQwB1kXxkH7HzUl/CUviwFN0QcI6mnimRIoiOtwqBctrCOXvYp64F1x4jhkcHRXWpNjIT2GDD6EDW+4Rdd3FAEoZ+i2SKmRXC1EOtOgPW2rtvonyl5iEdlwjwaWk61zHZ3qVBQ++IdO1KKeFKJEdLvYFt5r+S0I+1YuSpPFtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737637045; c=relaxed/simple;
	bh=SfkTUfqccaZVf6d/CJzSczL3wj2DC5ZEZqg/AAVj1oE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=idsGnG/jIeH51Txa/Zs2n8rgAKVGelvFLpYQYbkNqBoCNwyp2Uh6y6R27bG0MjESXXNoJGFoXbzJq07f422ewa0mgQeLNV6SNxqNh5e82vST3Jaw4+jyl84w4XHGSIqoyJomGl8uctkiAvZVYlqa7jm6v7gPxwPlvwPHVu1aI24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3a9d4ea9e0cso6022425ab.0
        for <linux-input@vger.kernel.org>; Thu, 23 Jan 2025 04:57:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737637042; x=1738241842;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yOnhm+dzJp1QNGrRtlT9jWJZwF9Tk+o1YQ+snJlZUro=;
        b=CnNpweoRM0x5tZOgIc4GEQLUlTNgnbGhVDPYRzU5bjy/plsCA1o7FTNUIl0ftoUdC6
         2PrrPtX4VjT+3FUJ5KqYlVafw/1ZCa2uiEd4eq4MUkCfkDqsHK2Hp5ose8cM80ZDk4ez
         rDf0hHsUwagdMFg1RAy0jHpGuPps6VI617hOkb6hfxGeluYp0ypgn3TNiaqrVGdm7DW0
         yScv5xVQhb68ASr+EGsPXQA2RT0AEkmB4/Pxj06ftmNDP/+2I8IsJBtG/z0PIBpp5PsY
         oW9HMsJZo0YIq5HPHLisqTW0nzG+MQldt5Se9PCc7ITBCcFitq54pxLbRkW86Au3ITCA
         Nj2g==
X-Forwarded-Encrypted: i=1; AJvYcCW5UCF/3cwxrszQkfRA6rZtME5inGJF3k3TMnRGuGoGO/9ipIRA2gaKZSxqjWG1iRXIXDn0Uk/EqhJQlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfpnzkuSO6m9aSYfiNC/+Z1dk1Ik1cCq6pGs5JSY7SG8D6W37a
	c1sgvBkzcfw1I2inD2eG3y7RXgdazBeRBFmgc8VIM8IEhFEaJ0sl2k7Ibmv94kmUKdLzzRpgWJw
	7nqaAwCTH6FSgkjxQ/1Z12jqNofz0XlIQ1wQEI2815QOPUhs8znNhSfo=
X-Google-Smtp-Source: AGHT+IHKRmYwtgBc3KoGLrzd0l0HJsIuTGk6kxSw0xDRrOivFpsN9973uzLhdON+DQIOMeJMb5GKaRLrB520ay66tkGynWztGNDA
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20e7:b0:3ce:7fc3:9f76 with SMTP id
 e9e14a558f8ab-3cf743eae5amr198779245ab.6.1737637042609; Thu, 23 Jan 2025
 04:57:22 -0800 (PST)
Date: Thu, 23 Jan 2025 04:57:22 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67923cb2.050a0220.2eae65.0006.GAE@google.com>
Subject: [syzbot] [input?] [usb?] WARNING: ODEBUG bug in devres_release_group
From: syzbot <syzbot+cf5f2dd02bbd4d2d411c@syzkaller.appspotmail.com>
To: bentiss@kernel.org, gregkh@linuxfoundation.org, jikos@kernel.org, 
	jkosina@suse.com, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, rafael@kernel.org, stuart.a.hayhurst@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c4b9570cfb63 Merge tag 'audit-pr-20250121' of git://git.ke..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=14d2cab0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5d46425e33fe266e
dashboard link: https://syzkaller.appspot.com/bug?extid=cf5f2dd02bbd4d2d411c
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14f89824580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1331c9f8580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e34aaf236292/disk-c4b9570c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9fa1c2b70c0a/vmlinux-c4b9570c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/12feb0aae53d/bzImage-c4b9570c.xz

The issue was bisected to:

commit 6ea2a6fd3872e60a4d500b548ad65ed94e459ddd
Author: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
Date:   Tue Oct 8 23:30:29 2024 +0000

    HID: corsair-void: Add Corsair Void headset family driver

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10afcab0580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=12afcab0580000
console output: https://syzkaller.appspot.com/x/log.txt?x=14afcab0580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cf5f2dd02bbd4d2d411c@syzkaller.appspotmail.com
Fixes: 6ea2a6fd3872 ("HID: corsair-void: Add Corsair Void headset family driver")

WARNING: CPU: 0 PID: 1206 at lib/debugobjects.c:615 debug_print_object+0x17a/0x1f0 lib/debugobjects.c:612
Modules linked in:
CPU: 0 UID: 0 PID: 1206 Comm: kworker/0:2 Not tainted 6.13.0-syzkaller-02526-gc4b9570cfb63 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Workqueue: usb_hub_wq hub_event
RIP: 0010:debug_print_object+0x17a/0x1f0 lib/debugobjects.c:612
Code: e8 4b 10 38 fd 4c 8b 0b 48 c7 c7 40 1e 60 8c 48 8b 74 24 08 48 89 ea 44 89 e1 4d 89 f8 ff 34 24 e8 bb 3e 92 fc 48 83 c4 08 90 <0f> 0b 90 90 ff 05 28 de 4c 0b 48 83 c4 10 5b 41 5c 41 5d 41 5e 41
RSP: 0018:ffffc9000451eeb8 EFLAGS: 00010286
RAX: 6e3a10eb39cc4d00 RBX: ffffffff8c0ca540 RCX: ffff8880279c8000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffffff8c601fc0 R08: ffffffff81603132 R09: fffffbfff1cfa638
R10: dffffc0000000000 R11: fffffbfff1cfa638 R12: 0000000000000000
R13: ffffffff8c601ed8 R14: dffffc0000000000 R15: ffff8880309f51a8
FS:  0000000000000000(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555571005650 CR3: 0000000032228000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __debug_check_no_obj_freed lib/debugobjects.c:1099 [inline]
 debug_check_no_obj_freed+0x45b/0x580 lib/debugobjects.c:1129
 slab_free_hook mm/slub.c:2284 [inline]
 slab_free mm/slub.c:4613 [inline]
 kfree+0x115/0x430 mm/slub.c:4761
 release_nodes drivers/base/devres.c:506 [inline]
 devres_release_group+0x328/0x350 drivers/base/devres.c:689
 hid_device_remove+0x250/0x370 drivers/hid/hid-core.c:2779
 device_remove drivers/base/dd.c:567 [inline]
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x4a9/0x7c0 drivers/base/dd.c:1296
 bus_remove_device+0x34f/0x420 drivers/base/bus.c:576
 device_del+0x57a/0x9b0 drivers/base/core.c:3854
 hid_remove_device drivers/hid/hid-core.c:2958 [inline]
 hid_destroy_device+0x6a/0x1b0 drivers/hid/hid-core.c:2980
 usbhid_disconnect+0x9e/0xc0 drivers/hid/usbhid/hid-core.c:1458
 usb_unbind_interface+0x25b/0x940 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:569 [inline]
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x503/0x7c0 drivers/base/dd.c:1296
 bus_remove_device+0x34f/0x420 drivers/base/bus.c:576
 device_del+0x57a/0x9b0 drivers/base/core.c:3854
 usb_disable_device+0x3bf/0x850 drivers/usb/core/message.c:1418
 usb_disconnect+0x340/0x950 drivers/usb/core/hub.c:2304
 hub_port_connect drivers/usb/core/hub.c:5363 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5663 [inline]
 port_event drivers/usb/core/hub.c:5823 [inline]
 hub_event+0x1ebc/0x5150 drivers/usb/core/hub.c:5905
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3317
 worker_thread+0x870/0xd30 kernel/workqueue.c:3398
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

