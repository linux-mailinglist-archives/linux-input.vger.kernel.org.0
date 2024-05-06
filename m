Return-Path: <linux-input+bounces-3487-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAF08BCE13
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 14:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D1C1B2534E
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 12:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE4118C19;
	Mon,  6 May 2024 12:38:22 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E7F1DA23
	for <linux-input@vger.kernel.org>; Mon,  6 May 2024 12:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714999102; cv=none; b=qbdLyIvrT+srjizyFybTE/DxoZlk4kWIZgBH6gNzz05tHs7MMxB1lj2NKSWL+xJk3Z8/Lqe5ukyiaUG8vuIZDxETyER7fbiYATQbb8ESvJpfbw/hKKdPPjbFXCfYRIvcPWTT4hvqd74TMHgaTpCIOzlVk6hbKdMpsgcm6pgJmSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714999102; c=relaxed/simple;
	bh=PRXUBkliFGTGfr1tfr+DfmQxur1Pm/bGLIvgJ7Ir7+g=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=urgOVFjqIjIfBAvlqFFrcmR8HahjQGrSH1fo6pVQ1RjM/P5myeCJP/K2ON9HMhHJIw/nJxzfsJo3vbgfgaETfVaW7BN+GMeG+0a3UVqK5yf0P74yW9VzjRQrhKE+I0Lf5OGfSzX7Qo3QBBPPQAA6IxLfoSvXFnqpPy2l8tNLTo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-7def44d6078so301128239f.1
        for <linux-input@vger.kernel.org>; Mon, 06 May 2024 05:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714999100; x=1715603900;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Abg+C12vuc3bVok6svAeKzuLYYKsi9nik57pnOtqBbY=;
        b=YDkyEczqdEhXbvTOrH/DwAZbfSsN6vf8L2eldjpCck43uN8o4ZJ2UHZx5RWffbEkD9
         kEivbh7sbF7clWJHF184r8mNIH4e6xrLeKi1W+uFB58KVnfL+L9zdmvjOArts+FAOX1t
         h5VNuXCzqIoz79zcInEYhpcshTZr66yx94AmGd8XIQVtyS1hj/ZeQbkdnkTa88JN5/9B
         fJsqCvhXr8AXAWpkXYzU3Z//EPfGEQFB7io2QUFVlucBQAjDaN/3iPnjNNSVB9VQmE4t
         5EnguP/1Eo+1AKtc/I1BLpZExSwdps1KpaQy5GSBy1ZyGJV4xSpG9ghe4BC+nnV18efz
         ygvA==
X-Forwarded-Encrypted: i=1; AJvYcCXZh9amLa5KL0Gdg1zWWFdakZWKZv51OCzX1rROp1RXOkQJzxulWf1IQg9ipkfnwIO/PfyLokMVuHsR5hYqPwWAHvucyjm+DX/KilY=
X-Gm-Message-State: AOJu0YyVs6HyE+C4W1Qjarej8NdCXF6ZnxnKbSze+4Jyrk2KJZc8Pthr
	fnkeRcuLUsXtO9FK3LydXOp+lVd9j/tBzzl/fveBZbC0eb4lHjtSphVB+qpBeSXL1mzu9y9CQsZ
	6Fue/E0oUu2qCtr7aKeBQk2/Goui8/XhCfrDdojKgdnnXENwLv7zux/w=
X-Google-Smtp-Source: AGHT+IHwU5f2yNHyWU2SkxS5iF84+HzbZt6CXFgp5MAZWVUYbr3F/z6SINyGOROcs1QGUmbzpDmofV6JFC90c5mYUHvjPM2bNt+B
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c50a:0:b0:36c:6080:753d with SMTP id
 r10-20020a92c50a000000b0036c6080753dmr209113ilg.1.1714999100425; Mon, 06 May
 2024 05:38:20 -0700 (PDT)
Date: Mon, 06 May 2024 05:38:20 -0700
In-Reply-To: <000000000000ae4aa90614a58d7b@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002bde520617c85875@google.com>
Subject: Re: [syzbot] [input?] WARNING in cm109_input_open/usb_submit_urb (3)
From: syzbot <syzbot+ac0f9c4cc1e034160492@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    dd5a440a31fa Linux 6.9-rc7
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1792e8a7180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6d14c12b661fb43
dashboard link: https://syzkaller.appspot.com/bug?extid=ac0f9c4cc1e034160492
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10b7d354980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/58e2a4900479/disk-dd5a440a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/246a109c32d6/vmlinux-dd5a440a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d2719f7eb672/bzImage-dd5a440a.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ac0f9c4cc1e034160492@syzkaller.appspotmail.com

------------[ cut here ]------------
URB ffff8880293d7f00 submitted while active
WARNING: CPU: 0 PID: 1141 at drivers/usb/core/urb.c:379 usb_submit_urb+0x1039/0x18c0 drivers/usb/core/urb.c:379
Modules linked in:
CPU: 0 PID: 1141 Comm: kworker/0:2 Not tainted 6.9.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
Workqueue: usb_hub_wq hub_event
RIP: 0010:usb_submit_urb+0x1039/0x18c0 drivers/usb/core/urb.c:379
Code: 00 eb 66 e8 59 f2 7c fa e9 79 f0 ff ff e8 4f f2 7c fa c6 05 8f 7e 7a 08 01 90 48 c7 c7 a0 74 6c 8c 4c 89 ee e8 58 64 3f fa 90 <0f> 0b 90 90 e9 40 f0 ff ff e8 29 f2 7c fa eb 12 e8 22 f2 7c fa 41
RSP: 0018:ffffc90004926b48 EFLAGS: 00010246
RAX: 12b779fa952e9100 RBX: 0000000000000cc0 RCX: ffff8880229e8000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffff8880293d7f08 R08: ffffffff81587d32 R09: 1ffffffff25e6abf
R10: dffffc0000000000 R11: fffffbfff25e6ac0 R12: 1ffff11005d6920a
R13: ffff8880293d7f00 R14: dffffc0000000000 R15: ffff88802eb49010
FS:  0000000000000000(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055555b1af938 CR3: 000000007c014000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 cm109_input_open+0x1f9/0x470 drivers/input/misc/cm109.c:572
 input_open_device+0x193/0x2e0 drivers/input/input.c:654
 kbd_connect+0xe9/0x130 drivers/tty/vt/keyboard.c:1593
 input_attach_handler drivers/input/input.c:1064 [inline]
 input_register_device+0xcfc/0x1090 drivers/input/input.c:2396
 cm109_usb_probe+0x10cd/0x1600 drivers/input/misc/cm109.c:806
 usb_probe_interface+0x647/0xbb0 drivers/usb/core/driver.c:399
 really_probe+0x2ba/0xad0 drivers/base/dd.c:656
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:798
 driver_probe_device+0x50/0x430 drivers/base/dd.c:828
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:956
 bus_for_each_drv+0x250/0x2e0 drivers/base/bus.c:457
 __device_attach+0x333/0x520 drivers/base/dd.c:1028
 bus_probe_device+0x189/0x260 drivers/base/bus.c:532
 device_add+0x8ff/0xca0 drivers/base/core.c:3720
 usb_set_configuration+0x1976/0x1fb0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x88/0x140 drivers/usb/core/generic.c:254
 usb_probe_device+0x1ba/0x380 drivers/usb/core/driver.c:294
 really_probe+0x2ba/0xad0 drivers/base/dd.c:656
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:798
 driver_probe_device+0x50/0x430 drivers/base/dd.c:828
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:956
 bus_for_each_drv+0x250/0x2e0 drivers/base/bus.c:457
 __device_attach+0x333/0x520 drivers/base/dd.c:1028
 bus_probe_device+0x189/0x260 drivers/base/bus.c:532
 device_add+0x8ff/0xca0 drivers/base/core.c:3720
 usb_new_device+0x104a/0x19a0 drivers/usb/core/hub.c:2652
 hub_port_connect drivers/usb/core/hub.c:5522 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5662 [inline]
 port_event drivers/usb/core/hub.c:5822 [inline]
 hub_event+0x2d6a/0x5150 drivers/usb/core/hub.c:5904
 process_one_work kernel/workqueue.c:3267 [inline]
 process_scheduled_works+0xa12/0x17c0 kernel/workqueue.c:3348
 worker_thread+0x86d/0xd70 kernel/workqueue.c:3429
 kthread+0x2f2/0x390 kernel/kthread.c:388
 ret_from_fork+0x4d/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

