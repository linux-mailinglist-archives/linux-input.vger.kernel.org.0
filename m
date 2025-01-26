Return-Path: <linux-input+bounces-9555-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F02A3A1C702
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 09:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F6FA1669B5
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 08:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EAE78F2D;
	Sun, 26 Jan 2025 08:30:24 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B199528691
	for <linux-input@vger.kernel.org>; Sun, 26 Jan 2025 08:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737880224; cv=none; b=uENnylPx1Wjim8kcldAejXJj5buuPjSK84+J3Bh9Q96iA6bKaVCNRdbuzMINjfOS3qDOwXHDL4G3HQEafUgwitAUGRXLS9NXIKmDJ1Xyn7nBHbeuPDCgFMrx+7EExknh+dW+pBGx+Q1qwwrrGcxwa4paR3PIxOVK9LSuQK3o/TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737880224; c=relaxed/simple;
	bh=Y7bYupkBA0LEosqXCE4P2mrt/Luq5NdMGpakGaqfXP8=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=N9Q4GxR51pcEpkdCt98zuDlbjDlFYA4+yml6YekHTIO0yrS1+2p9yIaYV5j0cmwQcpI1sJpF4N30VTx6EZVUa87ZBfv88J2LcuzYS5Mo0w5OBHkJ2gW8w+Bo9zGF9ozYdJ/c3HFIZi8GrAnz6SWgulvA4lW6AfqjimEKrEXec1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3cdd61a97easo23208885ab.2
        for <linux-input@vger.kernel.org>; Sun, 26 Jan 2025 00:30:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737880222; x=1738485022;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zBiJAXlpG1PKN3njcl87YuOUJg3iB0pDSlzaGyAH8E8=;
        b=Fp6xVrrQlf+NYPStZUDPQOTNwSC+PJZqDH22V4BZmVDJfT+tUv7NBOnTqQvMLnHRVg
         U8Mi2I41O9Wd6f9RsC+2UkziWQ4ob91AKuu04UirKwE7mH9kOeufJtcQopvAKxOGqLsT
         YmutaQor/DqF9qbkNQ8v/+u+wLaws+D+ERKkkuiaKNpnqtAPJYstbJ3hAx1Yy7xiNdjk
         BnbQx1RX8SmHlFJEJTOIPcp2eKNhcZJdqlwbZrNtadXfoTz4oHTwF+mINGrc5TTnz0hL
         kQafT4Q0lecUUdWCBdKDBi9yAF8+fHTemyvdHYLfw/qzLDTnBLYBHOXNbiCl9PkR22c+
         FXvA==
X-Forwarded-Encrypted: i=1; AJvYcCW1V3m1v3arm1u3ojD//6ziE1Dl3QmvlxaYUfs4p6RGzC9fYSYOdjTYvhfu/6zT2GLmot7Q82VTA0LOfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaH2UXYnd8uNbd9Q4WUXzB8BGEVz0rxmpez9SuW3nm3UyW5fgX
	vlZih5mY0cKsQiyJa5pmXJ3aVA1h3oEYNyB71S9wHeDXIAhlJ3N5VnnL0pbxboGPwiU3A1SVzA/
	bOx1V3zezJQBzyjwMqVLOfje2iu0/Oze3B/OyB4qrz2p5mGK5l3s1cHk=
X-Google-Smtp-Source: AGHT+IHqC+XLPkbLE8xaU/O+erCmx4Lyz632jriv8ySm0V16QKHhF1RD9GnJhuaDQrnYWMGtO09Y6fsmDBorKhsSDr2+E6QYfjK1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:339a:b0:3cf:c9b9:3eb with SMTP id
 e9e14a558f8ab-3cfc9b907f0mr68933595ab.0.1737880221869; Sun, 26 Jan 2025
 00:30:21 -0800 (PST)
Date: Sun, 26 Jan 2025 00:30:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6795f29d.050a0220.2eae65.0034.GAE@google.com>
Subject: [syzbot] [input?] [usb?] WARNING: ODEBUG bug in release_nodes
From: syzbot <syzbot+624d9e79ec456915d85d@syzkaller.appspotmail.com>
To: gregkh@linuxfoundation.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    70cd0576aa39 usb: hcd: Bump local buffer size in rh_string()
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=126159f8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8e4b3bd94cc7cf2d
dashboard link: https://syzkaller.appspot.com/bug?extid=624d9e79ec456915d85d
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14d45e18580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13eb9624580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/612846dc004d/disk-70cd0576.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2adbdc698bbb/vmlinux-70cd0576.xz
kernel image: https://storage.googleapis.com/syzbot-assets/111a4615d3e0/bzImage-70cd0576.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+624d9e79ec456915d85d@syzkaller.appspotmail.com

usb 3-1: USB disconnect, device number 2
------------[ cut here ]------------
ODEBUG: free active (active state 0) object: ffff88812426c9a8 object type: timer_list hint: corsair_void_status_work_handler+0x0/0xb0 drivers/hid/hid-corsair-void.c:533
WARNING: CPU: 0 PID: 8 at lib/debugobjects.c:612 debug_print_object+0x1a2/0x2b0 lib/debugobjects.c:612
Modules linked in:
CPU: 0 UID: 0 PID: 8 Comm: kworker/0:0 Not tainted 6.13.0-rc7-syzkaller-g70cd0576aa39 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Workqueue: usb_hub_wq hub_event
RIP: 0010:debug_print_object+0x1a2/0x2b0 lib/debugobjects.c:612
Code: fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 54 48 8b 14 dd 40 45 47 87 41 56 4c 89 e6 48 c7 c7 c0 39 47 87 e8 af b1 c0 fe 90 <0f> 0b 90 90 58 83 05 06 73 f7 07 01 48 83 c4 18 5b 5d 41 5c 41 5d
RSP: 0018:ffffc9000008f278 EFLAGS: 00010282
RAX: 0000000000000000 RBX: 0000000000000003 RCX: ffffffff811f6859
RDX: ffff8881016957c0 RSI: ffffffff811f6866 RDI: 0000000000000001
RBP: 0000000000000001 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: ffffffff87474060
R13: ffffffff872aa620 R14: ffffffff857581b0 R15: ffffc9000008f388
FS:  0000000000000000(0000) GS:ffff8881f5800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f41a9db4e10 CR3: 0000000114ce4000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __debug_check_no_obj_freed lib/debugobjects.c:1099 [inline]
 debug_check_no_obj_freed+0x4b7/0x600 lib/debugobjects.c:1129
 slab_free_hook mm/slub.c:2284 [inline]
 slab_free mm/slub.c:4613 [inline]
 kfree+0x294/0x470 mm/slub.c:4761
 release_nodes+0x11e/0x240 drivers/base/devres.c:506
 devres_release_group+0x1be/0x2a0 drivers/base/devres.c:689
 hid_device_remove+0x107/0x260 drivers/hid/hid-core.c:2779
 device_remove+0xc8/0x170 drivers/base/dd.c:567
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1296
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:576
 device_del+0x396/0x9f0 drivers/base/core.c:3854
 hid_remove_device drivers/hid/hid-core.c:2958 [inline]
 hid_destroy_device+0x19c/0x240 drivers/hid/hid-core.c:2980
 usbhid_disconnect+0xa0/0xe0 drivers/hid/usbhid/hid-core.c:1458
 usb_unbind_interface+0x1e2/0x960 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:569 [inline]
 device_remove+0x122/0x170 drivers/base/dd.c:561
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1296
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:576
 device_del+0x396/0x9f0 drivers/base/core.c:3854
 usb_disable_device+0x36c/0x7f0 drivers/usb/core/message.c:1418
 usb_disconnect+0x2e1/0x920 drivers/usb/core/hub.c:2305
 hub_port_connect drivers/usb/core/hub.c:5363 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5663 [inline]
 port_event drivers/usb/core/hub.c:5823 [inline]
 hub_event+0x1bed/0x4f40 drivers/usb/core/hub.c:5905
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3236
 process_scheduled_works kernel/workqueue.c:3317 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

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

