Return-Path: <linux-input+bounces-2594-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EE588E84F
	for <lists+linux-input@lfdr.de>; Wed, 27 Mar 2024 16:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC38B29FFB2
	for <lists+linux-input@lfdr.de>; Wed, 27 Mar 2024 15:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D7713E419;
	Wed, 27 Mar 2024 14:52:22 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3901313E401
	for <linux-input@vger.kernel.org>; Wed, 27 Mar 2024 14:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711551141; cv=none; b=WJU8oBZn2eGuDOGWHWAtg5Zy2sufYxNGSS5m3TeAWkdtKZsW1vPgyNW1C7PeAd/59BiiFF3jjd9yVvKP63/7LPDHIqmbdDqVnU8aTgsNiMTGYsG7sTBI7H9vwGQJzf9ZI4W3YM60fXgOFfYfgG1E87ecgR8u2LYiu1ZXD3VIDmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711551141; c=relaxed/simple;
	bh=yMK9CUyK2auY2sjJAyE//x0rIqad7kjdbCI1ABfVnmo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ohW/M1cuN0dcPJB9nl33zSST6U0P3gQ8PQgBGAXswIKnHsb4wVLKSpeKIeasBffACG7YKWvYUMUl9OxsZWdxz6/OLVn1EW1eGFXZxyM0UvQczkgp2v2/4isSRtJy0zswh28qdb0BQql/62kxJqB6iAlGvNTMZ08ASRpLBOtd7FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-366a7e3099bso66084745ab.0
        for <linux-input@vger.kernel.org>; Wed, 27 Mar 2024 07:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711551139; x=1712155939;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0xIjabR/1C/PkXnxQ3D13ioZWEvzCJ2+Fo9chdl0auo=;
        b=D9Oplr4sV0rrpTlW6Z2L8uywo71tZcL+uHp0n8Zkzg5zYBuycz1QBnDn/D9dqF5PT2
         mcsL5hFpEEcLPTkY+nX1F1UvyP5tC/vv7mYm1pgFlDi68MncqOb6LmbT73BbvU7ITktG
         giMiq7QpJjklgT7mdZw2lITYj04WpueeQxV8OmMh9jS2rIIYvzX8meM2/z4cbzQNY6Wx
         JiZzTAQL0D0lH+g7W/KGktAoikrcVl6u8PyaXgsyVslb9bpzEGrQCcJE8f/UOalxKw2I
         9dMKVTflCEvk5eX8OCL8jpd6luiAG9BsnZM8gw/So1crVahRju/f+nYZDF5oCG8C220F
         MAaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyUD5e3cG9eKxYxuM3itOhqeJpOgfiQ6XKIObx6obrqmXgfsXVklCfKEJgHxGKG0/iHQtT5OHfflWO0fPITTvX2XOrjh8XmHwTSRc=
X-Gm-Message-State: AOJu0YysvBijTDjMgrDJKEslo2usgQLnPmYxTF+vXCQzTXHR1uZ4EZLU
	fOpYgYoFOZ2RV8cIADtJXI11KdT/0mfn/Xim3ox+XJ+kk9iYkXZ9DN1USdC2liKVldljRgbk9cq
	ITptlFw0g3X7scJ8gja6caNYq6Inw1VPAUjCLRMV5o/VAi1m2halDQLw=
X-Google-Smtp-Source: AGHT+IGu6Fv+cgPe6xcSmQZWC2dGAYYjbjmJT8iSzuYALQqzKMM43yvJQWzPT2IzCWDH+Yl/C4WVxGBs+B17o9wD2zSgNPrU+X7M
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d94:b0:368:7d6b:a7cd with SMTP id
 h20-20020a056e021d9400b003687d6ba7cdmr2646ila.3.1711551139427; Wed, 27 Mar
 2024 07:52:19 -0700 (PDT)
Date: Wed, 27 Mar 2024 07:52:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ae4aa90614a58d7b@google.com>
Subject: [syzbot] [input?] WARNING in cm109_input_open/usb_submit_urb (3)
From: syzbot <syzbot+ac0f9c4cc1e034160492@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fe46a7dd189e Merge tag 'sound-6.9-rc1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14136479180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fe78468a74fdc3b7
dashboard link: https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0f7abe4afac7/disk-fe46a7dd.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/82598d09246c/vmlinux-fe46a7dd.xz
kernel image: https://storage.googleapis.com/syzbot-assets/efa23788c875/bzImage-fe46a7dd.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ac0f9c4cc1e034160492@syzkaller.appspotmail.com

input: CM109 USB driver as /devices/platform/dummy_hcd.0/usb1/1-1/1-1:0.8/input/input8
------------[ cut here ]------------
URB ffff8880285c2100 submitted while active
WARNING: CPU: 1 PID: 5112 at drivers/usb/core/urb.c:379 usb_submit_urb+0x1039/0x18c0 drivers/usb/core/urb.c:379
Modules linked in:
CPU: 1 PID: 5112 Comm: kworker/1:3 Not tainted 6.8.0-syzkaller-08951-gfe46a7dd189e #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/29/2024
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_submit_urb+0x1039/0x18c0 drivers/usb/core/urb.c:379
Code: 00 eb 66 e8 b9 b2 86 fa e9 79 f0 ff ff e8 af b2 86 fa c6 05 1e 90 63 08 01 90 48 c7 c7 c0 96 4b 8c 4c 89 ee e8 c8 86 49 fa 90 <0f> 0b 90 90 e9 40 f0 ff ff e8 89 b2 86 fa eb 12 e8 82 b2 86 fa 41
RSP: 0018:ffffc90004a0eb48 EFLAGS: 00010246
RAX: e879a53475439e00 RBX: 0000000000000cc0 RCX: 0000000000040000
RDX: ffffc900134bb000 RSI: 000000000003ffff RDI: 0000000000040000
RBP: ffff8880285c2108 R08: ffffffff8157cc12 R09: 1ffff110172a51a2
R10: dffffc0000000000 R11: ffffed10172a51a3 R12: 1ffff11005a65a0a
R13: ffff8880285c2100 R14: dffffc0000000000 R15: ffff88802d32d010
FS:  0000000000000000(0000) GS:ffff8880b9500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020002024 CR3: 0000000068c66000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 cm109_input_open+0x1f9/0x470 drivers/input/misc/cm109.c:572
 input_open_device+0x193/0x2e0 drivers/input/input.c:654
 kbd_connect+0xe9/0x130 drivers/tty/vt/keyboard.c:1593
 input_attach_handler drivers/input/input.c:1064 [inline]
 input_register_device+0xcfc/0x1090 drivers/input/input.c:2396
 cm109_usb_probe+0x10cd/0x1600 drivers/input/misc/cm109.c:806
 usb_probe_interface+0x5cd/0xb00 drivers/usb/core/driver.c:399
 really_probe+0x2a0/0xc50 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x3e0 drivers/base/dd.c:800
 driver_probe_device+0x50/0x430 drivers/base/dd.c:830
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
 bus_for_each_drv+0x250/0x2e0 drivers/base/bus.c:457
 __device_attach+0x333/0x520 drivers/base/dd.c:1030
 bus_probe_device+0x189/0x260 drivers/base/bus.c:532
 device_add+0x8ff/0xca0 drivers/base/core.c:3639
 usb_set_configuration+0x1976/0x1fb0 drivers/usb/core/message.c:2207
 usb_generic_driver_probe+0x88/0x140 drivers/usb/core/generic.c:254
 usb_probe_device+0x140/0x2d0 drivers/usb/core/driver.c:294
 really_probe+0x2a0/0xc50 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x3e0 drivers/base/dd.c:800
 driver_probe_device+0x50/0x430 drivers/base/dd.c:830
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
 bus_for_each_drv+0x250/0x2e0 drivers/base/bus.c:457
 __device_attach+0x333/0x520 drivers/base/dd.c:1030
 bus_probe_device+0x189/0x260 drivers/base/bus.c:532
 device_add+0x8ff/0xca0 drivers/base/core.c:3639
 usb_new_device+0x104a/0x19a0 drivers/usb/core/hub.c:2614
 hub_port_connect drivers/usb/core/hub.c:5483 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5623 [inline]
 port_event drivers/usb/core/hub.c:5783 [inline]
 hub_event+0x2d13/0x50f0 drivers/usb/core/hub.c:5865
 process_one_work kernel/workqueue.c:3254 [inline]
 process_scheduled_works+0xa02/0x1770 kernel/workqueue.c:3335
 worker_thread+0x86d/0xd70 kernel/workqueue.c:3416
 kthread+0x2f2/0x390 kernel/kthread.c:388
 ret_from_fork+0x4d/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:243
 </TASK>


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

