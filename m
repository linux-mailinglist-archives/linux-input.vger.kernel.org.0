Return-Path: <linux-input+bounces-8753-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED949FB9E7
	for <lists+linux-input@lfdr.de>; Tue, 24 Dec 2024 07:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5468C7A046A
	for <lists+linux-input@lfdr.de>; Tue, 24 Dec 2024 06:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1979B13B5A9;
	Tue, 24 Dec 2024 06:38:28 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F18BEC0
	for <linux-input@vger.kernel.org>; Tue, 24 Dec 2024 06:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735022308; cv=none; b=JHG0mf0gvJ8rGc8puM19pxvzI9e40g0RQYYJlfxfZOH7gD663EsGpjLt4M9DmR+K1UryEiHr6isUR6Nhe1WgwTeEIZY1ZiQwMOQdkFnAsBq5Cev3+qfvbXfmadEvPc3aYLjwtbSpOBTnmFvwc+4X5ah2m4S5gf9/nP8AN1ThjC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735022308; c=relaxed/simple;
	bh=kPAi6jmc3u9nyj7t4Jr5t/mrDpv0qsdHzdHzHrH2oGU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=hpc4C6KhBaxQKVJJbMuq3ezCaCrgJNlfKvz8vb8omdCRYlw2z+A70UpFPUYrcUYw32lCzgZPl8+njKAt+YU5pURDu5y77I426gc8/fbakj/XKJAl74X89Erda4QtPZRWyr2p/faC25lycuzF2enIG7i4gjlUZEEmabmqba77V/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3a819a4e83dso50177805ab.1
        for <linux-input@vger.kernel.org>; Mon, 23 Dec 2024 22:38:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735022305; x=1735627105;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IKhEgnc3MniwmiQDkQbfnQDsBTkV5W+LidHmg3l9mg4=;
        b=SNLX20NFig/fC8Vp09TfJUUQEVCO7w8BdY/ZGtuQXkOVDYNylDmnoikrsLbAwvgzXw
         pbVWHUrpeoeMZCwifBtY2X0XwgZhRcOeYtY4TdN2YDp+aD8W13skCO+teS1b/8hzRnaE
         5eF1C3IvZS8jJAnospTwvkBE5uZR5GAzDc7cN6jEonNyrElit8cryalB1bX1uwmSfXMW
         rULk+mu0HSof75fagc+eTQt69n0Mu6jJU9M2bzskLmgo1t6Y/SLOkV7ZM5JLEya1q2UB
         d1RGHhTahZqcv0FN1JjbT1jYz5rCQrGSYlKVurJmFhA/y0Ij8PDbIrx2I/KPpk76PQN8
         W7MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfo7XKaCZetYCzc0GhOAdnnIpgQvMqWMPHSGPnnig5ZUtM6Gh6kEB1Dc/e66GyHtkgSdr2t9pF838pxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfZ8pI9hkqEpQwyNkmrH/i+QxwD6eSEgcD9RhwhScJAbWQhMWV
	H4FhfsZxHLT8zayE2C3O1IWldvK08SH3lmanvsDE9y2R0kihwF0zPKVtE3DyOMYVdGUbMMJEVOr
	BmtP4L5gZ84nVCVsTR7tRmd96MHRs0Qi7djhAUYgDx+Kvox/Sx4hF16s=
X-Google-Smtp-Source: AGHT+IFtSCH3bgztzzLZDpekiTIfNyBW8+30oM8dRKQ06sSxUK6SfhJ3ubPQJ0SeptZVenfJvryW4r2h/+1h6Pwkaof3Z9UW7qhb
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1747:b0:3a7:6636:eb3b with SMTP id
 e9e14a558f8ab-3c2d514f981mr105323875ab.17.1735022305540; Mon, 23 Dec 2024
 22:38:25 -0800 (PST)
Date: Mon, 23 Dec 2024 22:38:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <676a56e1.050a0220.226966.0051.GAE@google.com>
Subject: [syzbot] [input?] KASAN: null-ptr-deref Write in input_ff_create
From: syzbot <syzbot+dd5f8d6456680e55eb0a@syzkaller.appspotmail.com>
To: appsforartists@google.com, dmitry.torokhov@gmail.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8155b4ef3466 Add linux-next specific files for 20241220
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=111cafe8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9c90bb7161a56c88
dashboard link: https://syzkaller.appspot.com/bug?extid=dd5f8d6456680e55eb0a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12ea52df980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=111600c4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/98a974fc662d/disk-8155b4ef.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2dea9b72f624/vmlinux-8155b4ef.xz
kernel image: https://storage.googleapis.com/syzbot-assets/593a42b9eb34/bzImage-8155b4ef.xz

The issue was bisected to:

commit 5203b3a18c1bbf50ec5fff27489da8e9bce48ddb
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Thu Nov 7 07:15:29 2024 +0000

    Input: ff-core - make use of __free() cleanup facility

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14ffd2df980000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=16ffd2df980000
console output: https://syzkaller.appspot.com/x/log.txt?x=12ffd2df980000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dd5f8d6456680e55eb0a@syzkaller.appspotmail.com
Fixes: 5203b3a18c1b ("Input: ff-core - make use of __free() cleanup facility")

usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
usb 1-1: Product: syz
usb 1-1: Manufacturer: syz
usb 1-1: SerialNumber: syz
usb 1-1: config 0 descriptor??
==================================================================
BUG: KASAN: null-ptr-deref in instrument_write include/linux/instrumented.h:40 [inline]
BUG: KASAN: null-ptr-deref in ___set_bit include/asm-generic/bitops/instrumented-non-atomic.h:28 [inline]
BUG: KASAN: null-ptr-deref in input_ff_create+0x1aa/0x2f0 drivers/input/ff-core.c:325
Write of size 8 at addr 0000000000000040 by task kworker/0:2/975

CPU: 0 UID: 0 PID: 975 Comm: kworker/0:2 Not tainted 6.13.0-rc3-next-20241220-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/25/2024
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_report+0xe8/0x550 mm/kasan/report.c:492
 kasan_report+0x143/0x180 mm/kasan/report.c:602
 kasan_check_range+0x282/0x290 mm/kasan/generic.c:189
 instrument_write include/linux/instrumented.h:40 [inline]
 ___set_bit include/asm-generic/bitops/instrumented-non-atomic.h:28 [inline]
 input_ff_create+0x1aa/0x2f0 drivers/input/ff-core.c:325
 input_ff_create_memless+0x133/0x630 drivers/input/ff-memless.c:522
 xpad_init_ff drivers/input/joystick/xpad.c:1562 [inline]
 xpad_init_input+0xcef/0x1440 drivers/input/joystick/xpad.c:1960
 xpad_probe+0x1427/0x1b90 drivers/input/joystick/xpad.c:2143
 usb_probe_interface+0x641/0xbb0 drivers/usb/core/driver.c:396
 really_probe+0x2b9/0xad0 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:800
 driver_probe_device+0x50/0x430 drivers/base/dd.c:830
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:459
 __device_attach+0x333/0x520 drivers/base/dd.c:1030
 bus_probe_device+0x189/0x260 drivers/base/bus.c:534
 device_add+0x856/0xbf0 drivers/base/core.c:3665
 usb_set_configuration+0x1976/0x1fb0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x88/0x140 drivers/usb/core/generic.c:254
 usb_probe_device+0x1b8/0x380 drivers/usb/core/driver.c:291
 really_probe+0x2b9/0xad0 drivers/base/dd.c:658
 __driver_probe_device+0x1a2/0x390 drivers/base/dd.c:800
 driver_probe_device+0x50/0x430 drivers/base/dd.c:830
 __device_attach_driver+0x2d6/0x530 drivers/base/dd.c:958
 bus_for_each_drv+0x24e/0x2e0 drivers/base/bus.c:459
 __device_attach+0x333/0x520 drivers/base/dd.c:1030
 bus_probe_device+0x189/0x260 drivers/base/bus.c:534
 device_add+0x856/0xbf0 drivers/base/core.c:3665
 usb_new_device+0x104a/0x19a0 drivers/usb/core/hub.c:2651
 hub_port_connect drivers/usb/core/hub.c:5521 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x2d6d/0x5150 drivers/usb/core/hub.c:5903
 process_one_work kernel/workqueue.c:3229 [inline]
 process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3310
 worker_thread+0x870/0xd30 kernel/workqueue.c:3391
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
==================================================================


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

