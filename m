Return-Path: <linux-input+bounces-3468-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BED4B8BC492
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 00:36:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75B4E1F20FAF
	for <lists+linux-input@lfdr.de>; Sun,  5 May 2024 22:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDBB13FD95;
	Sun,  5 May 2024 22:36:29 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B4F13FD82
	for <linux-input@vger.kernel.org>; Sun,  5 May 2024 22:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714948589; cv=none; b=IeJLPehoYoMcFrH0omENgIEzf4GZhKYd2F+R0F6LRcbVkHzo7Lybl0X7ELFb4sRtCgmjoCtNNHkNNSHi72Hyo0fPMIkfVBVGFFpBbPMxfAw2h5ygP4Q60F1P8dPAcI7X+3LusTuQ4zLosWTf9dbCrgw2tBLE7mShTndU3SdR+0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714948589; c=relaxed/simple;
	bh=r5gu4VxP7DM0vjapPd2xEd3mEadqa/G5QY8khM4nqWM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=WkwAw++Eb9sLUZOXYPyt4w7CmX3/Gvm+ngHhh69gOcDPoVM52U8TjtFc07QV99ldRD3IpFE8HYosr12/99tYpMAreI2hm6Q6rj7J/hTgD1ySV5noHDH2EZvdMqqCSfw9HxD+WzW3+9jiK227HmfIeLYVR5k1W82tzEseT5ttB+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-36b3b387b4eso18379875ab.2
        for <linux-input@vger.kernel.org>; Sun, 05 May 2024 15:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714948587; x=1715553387;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2OC1pGNkjhP1lPtL2vW4wwZ2WsJJG9m3Rl4S11h+ars=;
        b=MZ3HXYIXMxTrvf/sU6pDRmJmzweBPQN6zR3N7PN2kBSa1KRV4oY5Yo5/gIHaRpq81q
         lO2f6gWZhuIWku0NUTi5CP/SBkodoRz7cwcWafc2mgx3JE3MAK1zNtuA1ycdiWPfcGQV
         xreN9nIwg9PoKlApC7UKY0wTvRQ+BDB45cuYbwp5tvMkFhMkawnux7K3UrGsqCI6apZx
         a4bBh1mN24KWM0P6j+1b/tj/4KfxHPJtA71grPUbKJFnfKe6tZzwLCI908f98Qp8yb+B
         kHBxnL1jOEjWjIUnXIPwcd/ekeg5ioyFZKDUeqaIbgUgfDZUsLOOu9OheQTJNGXPaeb5
         ZQlQ==
X-Forwarded-Encrypted: i=1; AJvYcCU29B3VeobUONHRKP4+yZbq085yAimDbQXhlcxdBi0G0+2/kLtNwRX5fX/APN8YSzTGJ+dSucko3XKhOwJLMqSnOyO7dqJsFTtpmb0=
X-Gm-Message-State: AOJu0Yw+2Zb7lyrv10/cK82wL6MX5Zg0L4r05qA6S4wX3ot9tnkqoQzH
	t+EcpdQ25XbyuHAEcwIvSSP0RB9A1lzYVQXZQsDSUEJPidXsOZ8IwuEzMvQ1sROtPT3TMyqBUf8
	U26WerTTmcZxcAYCLUmd9KHdSH4STPavLV7pxjwDMTBlxAOjrypHRLPE=
X-Google-Smtp-Source: AGHT+IG4abLFtNwhzBTUePKHMDhN1EtP93Ij2KhedALQLEIeEVxvEwzFsf2WMKJaEX20R8PnbVMNk+DDSDXngGsKEiFNrTgTnEzS
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d9d:b0:36c:468b:203c with SMTP id
 h29-20020a056e021d9d00b0036c468b203cmr538845ila.4.1714948587536; Sun, 05 May
 2024 15:36:27 -0700 (PDT)
Date: Sun, 05 May 2024 15:36:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005e57b10617bc951f@google.com>
Subject: [syzbot] [input?] [usb?] WARNING in hid_output_report
From: syzbot <syzbot+5186630949e3c55f0799@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    18daea77cca6 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=159f1f17180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d2f00edef461175
dashboard link: https://syzkaller.appspot.com/bug?extid=5186630949e3c55f0799
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13deb917180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1035ae87180000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4614372cf68b/disk-18daea77.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e118db95ea43/vmlinux-18daea77.xz
kernel image: https://storage.googleapis.com/syzbot-assets/998cf091eeb5/bzImage-18daea77.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5186630949e3c55f0799@syzkaller.appspotmail.com

keytouch 0003:0926:3333.0001: implement() called with too large value 8 (n: 1)! (kworker/0:0)
------------[ cut here ]------------
WARNING: CPU: 0 PID: 7 at drivers/hid/hid-core.c:1451 implement drivers/hid/hid-core.c:1451 [inline]
WARNING: CPU: 0 PID: 7 at drivers/hid/hid-core.c:1451 hid_output_report+0x548/0x760 drivers/hid/hid-core.c:1863
Modules linked in:
CPU: 0 PID: 7 Comm: kworker/0:0 Not tainted 6.9.0-rc6-syzkaller-00046-g18daea77cca6 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
Workqueue: events hidinput_led_worker
RIP: 0010:implement drivers/hid/hid-core.c:1451 [inline]
RIP: 0010:hid_output_report+0x548/0x760 drivers/hid/hid-core.c:1863
Code: a8 08 00 00 48 8b 44 24 40 48 8d b8 38 19 00 00 48 c7 c6 40 f7 aa 8c 48 c7 c2 c9 10 c9 8d 44 89 f1 45 89 e8 e8 99 e3 ca 02 90 <0f> 0b 90 44 23 74 24 18 e9 b7 fd ff ff 89 d9 80 e1 07 80 c1 03 38
RSP: 0018:ffffc900000c7a90 EFLAGS: 00010046
RAX: 65120fbe4e3ed400 RBX: 0000000000000001 RCX: 65120fbe4e3ed400
RDX: 0000000000000000 RSI: 0000000080000001 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff8176b74c R09: 1ffff92000018ea8
R10: dffffc0000000000 R11: fffff52000018ea9 R12: 0000000000000000
R13: 0000000000000001 R14: 0000000000000008 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000066c7e0 CR3: 00000000234e6000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __usbhid_submit_report drivers/hid/usbhid/hid-core.c:591 [inline]
 usbhid_submit_report+0x43d/0x9e0 drivers/hid/usbhid/hid-core.c:636
 process_one_work kernel/workqueue.c:3267 [inline]
 process_scheduled_works+0xa10/0x17c0 kernel/workqueue.c:3348
 worker_thread+0x86d/0xd70 kernel/workqueue.c:3429
 kthread+0x2f0/0x390 kernel/kthread.c:388
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
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

