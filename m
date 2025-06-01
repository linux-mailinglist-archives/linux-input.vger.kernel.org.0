Return-Path: <linux-input+bounces-12675-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7264AC9D6C
	for <lists+linux-input@lfdr.de>; Sun,  1 Jun 2025 02:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9BE218948B4
	for <lists+linux-input@lfdr.de>; Sun,  1 Jun 2025 00:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C63E184E;
	Sun,  1 Jun 2025 00:30:33 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF13B1FDD
	for <linux-input@vger.kernel.org>; Sun,  1 Jun 2025 00:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748737833; cv=none; b=c0xELntzWeqzCq6vlzGIsA+mrX4BXbuQeWqzwtcDa5wxINg9eDz0NlQEdsoKVaFBti1yMucBK7VAYYsx0Ij/FGjQsK0jJWoflLaOLCwj8gTFw9AMiVEYZf8c0PW2ikQ3ySsADa2RBhKp+qP4jBYLXa4FzjXtp/JsK6458x47N78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748737833; c=relaxed/simple;
	bh=tTCbf1SIgIEMyJqaa/91N7xl7SCBcwIB2zIAEZjdPUA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=kNvjDx4lqK7e/e58jOfarO5VPqQaQtWanRS2DopfnkwrooS/22FP7s38lljUhBItuowLBOOTuqbK2rJC7WzCTRHaiBukewIQowU/yZmuxE+dF5UzWk+ka0BgVyNGV0dz9qkmjDwOxnf5emWCbolRCYcxmnoCCkP18G7TnZU8pME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-86d0be481dcso143018739f.2
        for <linux-input@vger.kernel.org>; Sat, 31 May 2025 17:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748737831; x=1749342631;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e5fa6Bx1fxUvTdQ0LMroNmNiZrTxPWOsUPhI543mCWE=;
        b=cu0lXF7eGktZQXQOMqh4C7jpqVf4dm8UuVY0cOQAgb0HH/Vqm5s7afi+3YE44SyCQq
         P5BVucr/lojzHi7NNQSmjKCpN1DmuIXgm6MhQlOTkYzxXanNtywKMYk9ztElrcoNmyDz
         mtqZAaZ7xNtJiPwgImBmeZAL/raFc9sFhNEyZC+DQ28Xp/asc6a/9Y9+uxTakF8nhjZB
         /FMMt2awua2q1cLtpefTSV95rymgMgezVwagj04QA4AWhRzmOl7OC8QkwRlsSzhVxdHp
         vttyHPUIW8w10lxvlrJYySZtxwBtmbAtMjKpOX+Uu54kWxoCpwXr3zrSE2hc6YbhEPz6
         U7Vg==
X-Forwarded-Encrypted: i=1; AJvYcCU+wPOVOpACDaF0k0wmkW0f5MwZkoPWJOj64PjSgp2mLTWscxmbirwEaDGIPg6PPMkyP+blmX/YIeW6sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcl36lci3z7nf5qi6sDiHAXQEJSXkVX9LSjVciWp2KrhaAYwLQ
	c8uUwXW29J7oBlh+x8jIAar+yNJ2Yn5q25y7FO2ZclukGEg2LbPT6CW+YBp2wh3IVBfYbdldosU
	dgj7WsEiVVXut5woB5gtMQjuHrPszhxNJPscMdwKypSwLoa3QWmzya5BrMbU=
X-Google-Smtp-Source: AGHT+IEHez9TbSKXapQ329l8kU5B+0NFBSLaa89pk/FwR/50ylMo+qwfMpJV3BJ0QijmT5XPKHuf3Cob+jYrkQvJkRH+tgohRcrX
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:276a:b0:867:237f:381e with SMTP id
 ca18e2360f4ac-86d2d072dd0mr268960439f.2.1748737831060; Sat, 31 May 2025
 17:30:31 -0700 (PDT)
Date: Sat, 31 May 2025 17:30:31 -0700
In-Reply-To: <000000000000ae4aa90614a58d7b@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683b9f27.a00a0220.d8eae.0022.GAE@google.com>
Subject: Re: [syzbot] [usb?] [input?] WARNING in cm109_input_open/usb_submit_urb
 (3)
From: syzbot <syzbot+ac0f9c4cc1e034160492@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    0f70f5b08a47 Merge tag 'pull-automount' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=150e0c82580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=22765942f2e2ebcf
dashboard link: https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=103dbed4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=130e0c82580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f091df6896fd/disk-0f70f5b0.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/978b2a8699d8/vmlinux-0f70f5b0.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b6e13557ddc0/bzImage-0f70f5b0.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ac0f9c4cc1e034160492@syzkaller.appspotmail.com

cm109 2-1:0.8: invalid payload size 1024, expected 4
input: CM109 USB driver as /devices/platform/dummy_hcd.1/usb2/2-1/2-1:0.8/input/input551
------------[ cut here ]------------
URB ffff88814caed700 submitted while active
WARNING: CPU: 0 PID: 6321 at drivers/usb/core/urb.c:379 usb_submit_urb+0xfa8/0x1870 drivers/usb/core/urb.c:379
Modules linked in:

CPU: 0 UID: 0 PID: 6321 Comm: kworker/0:8 Not tainted 6.15.0-syzkaller-09161-g0f70f5b08a47 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_submit_urb+0xfa8/0x1870 drivers/usb/core/urb.c:379
Code: 00 eb 5c e8 0a 68 a8 fa e9 09 f1 ff ff e8 00 68 a8 fa c6 05 f0 aa 71 08 01 90 48 c7 c7 00 5a 32 8c 48 89 de e8 a9 41 6c fa 90 <0f> 0b 90 90 e9 d0 f0 ff ff e8 da 67 a8 fa eb 11 e8 d3 67 a8 fa bd
RSP: 0018:ffffc9000d02eb38 EFLAGS: 00010246
RAX: a79c1e2737f67a00 RBX: ffff88814caed700 RCX: ffff88801e3f0000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000002
RBP: 000000000000000f R08: ffffffff8f9f7ff7 R09: 1ffffffff1f3effe
R10: dffffc0000000000 R11: fffffbfff1f3efff R12: 1ffff1100234820a
R13: dffffc0000000000 R14: ffff88814caed708 R15: 0000000000000cc0
FS:  0000000000000000(0000) GS:ffff888125c99000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005555851e6da8 CR3: 000000002fb48000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 cm109_input_open+0x1fb/0x460 drivers/input/misc/cm109.c:566
 input_open_device+0x1c5/0x360 drivers/input/input.c:600
 kbd_connect+0xed/0x140 drivers/tty/vt/keyboard.c:1591
 input_attach_handler drivers/input/input.c:993 [inline]
 input_register_device+0xcee/0x10b0 drivers/input/input.c:2412
 cm109_usb_probe+0x118c/0x1690 drivers/input/misc/cm109.c:797
 usb_probe_interface+0x641/0xbc0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3692
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c4/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3692
 usb_new_device+0xa39/0x16c0 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5531 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x2941/0x4a00 drivers/usb/core/hub.c:5913
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xade/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

