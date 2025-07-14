Return-Path: <linux-input+bounces-13531-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F88B04633
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 19:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7AC6A1A63995
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 17:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF82C26136D;
	Mon, 14 Jul 2025 17:10:34 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f80.google.com (mail-io1-f80.google.com [209.85.166.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2345625D8E8
	for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 17:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752513034; cv=none; b=fNwF13YJyvsn4x8EkI9oQwOAgNkdQ/aMr1D8ChxT0rV8giN5elXkXld+z8iA+xT/h0Jwv9vSNBr/SFgnRwcnmoYZIt5+5gcLHCSjIvZtNLf/bOEAnNh3fQgNQcea6pgQs6r3Y7TPN02Ha7eeQSRKIPiJ/nmx/DydjLixDDKdmTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752513034; c=relaxed/simple;
	bh=0lKaue4Q/CodZJ43BE+2ERHP0tt8CkDwoKR/aeIu+bY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=DP31GPKCygz/glAsXZIsS2Elcm1z2LWuMPjaztkeabVEiLa/pEO+ai31Z6LNQOPRtOYgAhGmYLnke6CAMlGpffBVAbxfNnzqhYFO0jk+NoCt0CD7PZm3tZcQ47tgRB+yydER3XqRMthYO4KKn9qC3SSPUo8JKrLQVpMx4pgwhhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f80.google.com with SMTP id ca18e2360f4ac-869e9667f58so1046997439f.3
        for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 10:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752513032; x=1753117832;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yEqYN+Sq66jPT1atBJx2sN18zNV7H4Qomhnbx5nCbYY=;
        b=RuRXbpb6EMK0WAJt+s3M/JtESkESwaOaYGTcI/D745xJeVEz7ZdVSSL0RJJCaNevGw
         acWPtSve4paowRXKHg/fonpxUR04W2N0OFmXtns5Q9vhMt8Fs+XauCTAGk92IwYuZ0Qf
         4UbSSGHgpQRepimimd6qHsRBJ/u3f773lvN0ypwhrm1ioxe2gzOTASw3JVF0gWi3+8SZ
         6oqu4rRZu8llezyl+zQk2Tts01SbWQ8YRemZ15XGr0QTySNfmKMqnE7GT3vVpeEukaK4
         9O8isub480Yq2IUSEpZIZ1JtXBnVDqwG3x0rE0bwAM0ujnEEXcQRoWVkK6kG0HTq9xQ4
         7XTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrpEthQQJzm/+2Q1fInGNXxidPGNx+SWsFY4sYG5e4+sHEU0kJKwe7ZBrN2QUOX0RedE8VouzGcSmErQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwzqZc5vGsZbvSMILviyZymRI5+05GYWYeHjYNuu2WjbaVSwMP
	Id7r3MMpbZq8wThgoD4yKZ4HAvfBY+2xTF1TbOGVwLb95z/LJNx53x5wCmJ0C+DwbiQQiG5wFAE
	Q27ggStcIv2FV6V95FjShgFUWGyLxF4juabtTWH54GAvA73zp+55aHbYAyuA=
X-Google-Smtp-Source: AGHT+IH/WRScfN7dW3JFoDVyXS3WSTkXzALNIo+J1byjOIvna/aSlspqHWDQ2OrSbTux9AVCHS9jqEqoAyd6gOYCAes20kXbW0Td
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:15c9:b0:86c:f9f4:6aa6 with SMTP id
 ca18e2360f4ac-879787d8f28mr1526841439f.7.1752513032251; Mon, 14 Jul 2025
 10:10:32 -0700 (PDT)
Date: Mon, 14 Jul 2025 10:10:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68753a08.050a0220.33d347.0008.GAE@google.com>
Subject: [syzbot] [input?] [usb?] UBSAN: shift-out-of-bounds in s32ton (2)
From: syzbot <syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    b4b4dbfa96de media: stk1160: use usb_alloc_noncoherent/usb..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=15a830f0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=28729dff5d03ad1
dashboard link: https://syzkaller.appspot.com/bug?extid=b63d677d63bcac06cf90
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1614418c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1257dd82580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7301552ad828/disk-b4b4dbfa.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c559b38fa1b6/vmlinux-b4b4dbfa.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9c1da8b2a83f/bzImage-b4b4dbfa.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b63d677d63bcac06cf90@syzkaller.appspotmail.com

usb 4-1: config 0 interface 0 altsetting 0 has 1 endpoint descriptor, different from the interface descriptor's value: 9
usb 4-1: New USB device found, idVendor=045e, idProduct=07da, bcdDevice= 0.00
usb 4-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 4-1: config 0 descriptor??
microsoft 0003:045E:07DA.0001: ignoring exceeding usage max
microsoft 0003:045E:07DA.0001: unsupported Resolution Multiplier 0
------------[ cut here ]------------
UBSAN: shift-out-of-bounds in drivers/hid/hid-core.c:69:16
shift exponent 4294967295 is too large for 32-bit type 'int'
CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Not tainted 6.16.0-rc4-syzkaller-00314-gb4b4dbfa96de #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
 ubsan_epilogue lib/ubsan.c:233 [inline]
 __ubsan_handle_shift_out_of_bounds+0x27f/0x420 lib/ubsan.c:494
 s32ton.cold+0x37/0x9c drivers/hid/hid-core.c:69
 hid_output_field drivers/hid/hid-core.c:1841 [inline]
 hid_output_report+0x36f/0x4a0 drivers/hid/hid-core.c:1874
 __hid_request+0x1e0/0x3c0 drivers/hid/hid-core.c:1987
 hidinput_change_resolution_multipliers drivers/hid/hid-input.c:1950 [inline]
 hidinput_connect+0x1ada/0x2bd0 drivers/hid/hid-input.c:2327
 hid_connect+0x13f3/0x1a60 drivers/hid/hid-core.c:2239
 hid_hw_start drivers/hid/hid-core.c:2354 [inline]
 hid_hw_start+0xaa/0x140 drivers/hid/hid-core.c:2345
 ms_probe+0x195/0x500 drivers/hid/hid-microsoft.c:391
 __hid_device_probe drivers/hid/hid-core.c:2724 [inline]
 hid_device_probe+0x363/0x720 drivers/hid/hid-core.c:2761
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3692
 hid_add_device+0x373/0xa60 drivers/hid/hid-core.c:2907
 usbhid_probe+0xd38/0x13f0 drivers/hid/usbhid/hid-core.c:1435
 usb_probe_interface+0x303/0x9c0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3692
 usb_set_configuration+0x1187/0x1e20 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:250
 usb_probe_device+0xef/0x3e0 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:657
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:957
 bus_for_each_drv+0x156/0x1e0 drivers/base/bus.c:462
 __device_attach+0x1e4/0x4b0 drivers/base/dd.c:1029
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:537
 device_add+0x1148/0x1a70 drivers/base/core.c:3692
 usb_new_device+0xd07/0x1a20 drivers/usb/core/hub.c:2694
 hub_port_connect drivers/usb/core/hub.c:5566 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 port_event drivers/usb/core/hub.c:5866 [inline]
 hub_event+0x2f85/0x5030 drivers/usb/core/hub.c:5948
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x5b3/0x6c0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
---[ end trace ]---


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

