Return-Path: <linux-input+bounces-16476-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89250CAAC6B
	for <lists+linux-input@lfdr.de>; Sat, 06 Dec 2025 19:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D0639304229D
	for <lists+linux-input@lfdr.de>; Sat,  6 Dec 2025 18:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5DC2D063F;
	Sat,  6 Dec 2025 18:43:28 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3FF2D0C6C
	for <linux-input@vger.kernel.org>; Sat,  6 Dec 2025 18:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765046608; cv=none; b=stesUX9dfnXsl2oJd3BtKg3LPKG8Y78yepW3VYliV/rZ+PmKP4HvkSAfnWv629KMvEPpvhJsPiLPOoBxl+S0HdKlet+ts658jC8xvlKByQWEx9Jw3pKcna3dapvAdqMAA8XUlQ0khpl++RLEUT6wXG2+Zxew+vnqVexda+tlYfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765046608; c=relaxed/simple;
	bh=mdMrjc4h5pvS1zSyuVuLFdmSNOl0SIsXb1MbnbEdyX4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=pB7doI9MeK2oWmV/Wtr8xyrG+GRXJJBJFbLCwSZWyfl4pe7iKDF+N/GlFG0R7sgunjDzL3gHM90BB3JbJOkXNv73yHUUDsdV5l7EN7kS+TAd5shHsSJZ0QBq6lBuLZt6ck72yh+NFmPKKZioQGJ1ugUts7JKDSxkGTedAswa51s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-65716511512so3764706eaf.1
        for <linux-input@vger.kernel.org>; Sat, 06 Dec 2025 10:43:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765046605; x=1765651405;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HrnUl006fZneJtVvzqzuGNHqS4IXSc9Tpbbms7ul/tU=;
        b=sOqaCJk0RdPUtrcrtj6bFaU3Ns7v8bqznga3ZqbRK8XzU2lcVsHNHKZtaE67T5pKXg
         JPvAvSGAU4MX/w84ADViXr4hd9q+54hGz/oawZASMPGprt2tgHNPwedAJzTKQNRHOkJg
         CVduCpo/mPw0duko66KVH4VCTNzApaXuKr47SbMsA+CyE0qNub7JFDrL4aE093AeyrRq
         4NWmgFGUg1CMMReNpJDmzLTRboZzix63Zd2M7sUxhZ4DdxF4iThbhw70HraPTfDAwpHK
         sJuJJuumYAO0ftR9LeNj6AC7x3W1h3gpPa8+lbUX/OnP5qYLFqFuoDJ1GPBBDERxBY3w
         hH/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEb5wPf8+QNRw9ikVT/8zjsHDryRFAfH6fp120TQnLJtnUi8m0OF+perjxO9AdPfmZep6+PorIPI+0gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUfmyCL9TwdyLPaIVl+CBnnlnMOolzWO8xhWXmAPreG0ND2bII
	Ye5YUQlGTMgG6buDhpDo+846iAjRRZpjnxwkWZovr3NlK/1Tg+PDtIjoQRNQe4lEDYSOK/7NAE0
	+ErbYzheblu9rcbpe3wuMzdLBhK3axC8zUMUMXn/8nyO/RTOaFk1u6X3f7Co=
X-Google-Smtp-Source: AGHT+IGCN2TMcutC2LIqP+lgJPJ5D5CzQL76MRaZMZqhiy1P8zAdpDv0Qemu2l/7thiXQojd23u5d+aReYdJmc3oOBF5CW64xih7
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2911:b0:659:9a49:9077 with SMTP id
 006d021491bc7-6599a97d923mr1169885eaf.66.1765046605709; Sat, 06 Dec 2025
 10:43:25 -0800 (PST)
Date: Sat, 06 Dec 2025 10:43:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6934794d.a70a0220.38f243.0034.GAE@google.com>
Subject: [syzbot] [input?] WARNING in cm109_input_open
From: syzbot <syzbot+fed3fab8533934671abc@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4a26e7032d7d Merge tag 'core-bugs-2025-12-01' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=106814c2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cabbc708f0a470fb
dashboard link: https://syzkaller.appspot.com/bug?extid=fed3fab8533934671abc
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/41d09ea4104d/disk-4a26e703.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e8c0f32d0475/vmlinux-4a26e703.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f19b39e18b64/bzImage-4a26e703.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fed3fab8533934671abc@syzkaller.appspotmail.com

------------[ cut here ]------------
URB ffff88802aa55600 submitted while active
WARNING: drivers/usb/core/urb.c:380 at 0x0, CPU#1: kworker/1:4/5904
Modules linked in:
CPU: 1 UID: 0 PID: 5904 Comm: kworker/1:4 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_submit_urb+0x7e/0x1890 drivers/usb/core/urb.c:380
Code: 89 f0 48 c1 e8 03 42 80 3c 38 00 74 08 4c 89 f7 e8 97 b3 32 fb 49 83 3e 00 74 36 e8 fc 30 cd fa 48 8d 3d c5 fe 98 08 48 89 de <67> 48 0f b9 3a b8 f0 ff ff ff e9 8b 00 00 00 e8 de 30 cd fa b8 ea
RSP: 0018:ffffc900042deaf0 EFLAGS: 00010287
RAX: ffffffff86f3b5f4 RBX: ffff88802aa55600 RCX: 0000000000100000
RDX: ffffc9001bb8f000 RSI: ffff88802aa55600 RDI: ffffffff8f8cb4c0
RBP: 000000000000000f R08: ffffffff8f801377 R09: 1ffffffff1f0026e
R10: dffffc0000000000 R11: fffffbfff1f0026f R12: 0000000000000cc0
R13: ffff88806f531048 R14: ffff88802aa55608 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8881261c5000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f9bb61a17e0 CR3: 0000000078b0f000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 cm109_input_open+0x1fe/0x4b0 drivers/input/misc/cm109.c:566
 input_open_device+0x1d3/0x390 drivers/input/input.c:601
 kbd_connect+0xed/0x140 drivers/tty/vt/keyboard.c:1584
 input_attach_handler drivers/input/input.c:994 [inline]
 input_register_device+0xd00/0x1140 drivers/input/input.c:2378
 cm109_usb_probe+0x118c/0x1690 drivers/input/misc/cm109.c:797
 usb_probe_interface+0x668/0xc30 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9e0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:831
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:959
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1031
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3689
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26d/0x9e0 drivers/base/dd.c:659
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:801
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:831
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:959
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1031
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3689
 usb_new_device+0xa39/0x16f0 drivers/usb/core/hub.c:2694
 hub_port_connect drivers/usb/core/hub.c:5566 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 port_event drivers/usb/core/hub.c:5870 [inline]
 hub_event+0x2958/0x4a20 drivers/usb/core/hub.c:5952
 process_one_work kernel/workqueue.c:3263 [inline]
 process_scheduled_works+0xad1/0x1770 kernel/workqueue.c:3346
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x52d/0xa60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	89 f0                	mov    %esi,%eax
   2:	48 c1 e8 03          	shr    $0x3,%rax
   6:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
   b:	74 08                	je     0x15
   d:	4c 89 f7             	mov    %r14,%rdi
  10:	e8 97 b3 32 fb       	call   0xfb32b3ac
  15:	49 83 3e 00          	cmpq   $0x0,(%r14)
  19:	74 36                	je     0x51
  1b:	e8 fc 30 cd fa       	call   0xfacd311c
  20:	48 8d 3d c5 fe 98 08 	lea    0x898fec5(%rip),%rdi        # 0x898feec
  27:	48 89 de             	mov    %rbx,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
  34:	e9 8b 00 00 00       	jmp    0xc4
  39:	e8 de 30 cd fa       	call   0xfacd311c
  3e:	b8                   	.byte 0xb8
  3f:	ea                   	(bad)


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

