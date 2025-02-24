Return-Path: <linux-input+bounces-10296-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F118A42796
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 17:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFA0C7A63AB
	for <lists+linux-input@lfdr.de>; Mon, 24 Feb 2025 16:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736E324EF78;
	Mon, 24 Feb 2025 16:15:35 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33CC17799F
	for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 16:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740413735; cv=none; b=PV5CpNg/usdVHI0Ua8vy7rBrgZHWcN53tjdl3UFHX0yAmj1Cge6MZVPEN3iysI3BH7+2RiTHJ1QzgdfKixgfjACEDJrNUH3TTke9ci2VGEW8nra9LG83rL7DmitILA4pCZPMOBXOLL8mY4HCokHNJj6ciFsY5VdIzkE0Ulzig7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740413735; c=relaxed/simple;
	bh=ydXaMC6zS9e4LSddJroFvhRyHHAr7tsNfPBCVg94X7Y=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=RMIVCFOeUQN1xl+9J34iWwBC/pdDr1CL0zTsqj1WBoPuniNlA9aTxdth2qHXgE0n4WC2PvDaY3OiiGpz1bgexKJCBK4LLG210Yr7C4PAmDBBrTt/GJaBsjOEjymhZPHxnUA1YFyEIB68veJo9WFtsSQR8niLZQ/TOwWb5Gk+A/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3d2aba48f44so46779525ab.0
        for <linux-input@vger.kernel.org>; Mon, 24 Feb 2025 08:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740413733; x=1741018533;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q94TLh93rwphFT6Rw5s+2aRbj+FkZ2+KBTTzXF1Vz/A=;
        b=mwDS3y/2nQli+6qBe9UypqE+u+mrXDQQM+5URE3FT0NxcipBh/5+hWPMYqsaSbZ1SI
         e0S7mhe93ARKC3Z7be3+yLdMDng1qloNtw2GzijCgunkmHKATGOipO4tLJmZM9gOcAHd
         M2NaGWD1sxCohZpgD+spQFC/2C4sbiP13lspZhOxku9wAdte3jZ9RvY6hbVG+abrORXF
         g9hfJsqIatrh9g6ugsTNwGpGw1aJUJzzWlUvR6eD9nrMM6hU2hheost0QYHdKEMYbeua
         hhdEv86t8x3AorZt4tz0+kkNKyFr2nMKZOCpIYpKqnOeyc2kdI5FgsdofKKG+D22PdYe
         2V8g==
X-Forwarded-Encrypted: i=1; AJvYcCVOHcY+/ikLrIDQvz6QIyz9MEHA8j0gZItDo5f9xg67aQFoYW6zFFInBuODUm4uV8UT3l+j57qHYnWO7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBQJix2gI0pnUkJHJFapTT1UykGkRd9KvVsG0zjTRW8AXdWaHG
	FzJ4yDqbWA2UbL98kTU/XkZIdBddSK3hArbYZD6cm1jgJQamxFEYva6K75+H18cflFb7oUkzym0
	+qCeL7rkux54lZn4i/dhQSVArhzYrZpeZsVPAu3kBtNPWQmVDxxqdfK8=
X-Google-Smtp-Source: AGHT+IFvHqikWUSpJ7okF8fU05+4z27G+fhPH+6u1seiHFbMdxzpSz/ddpywMj8xOz1tS7XdMwMEd9IZ2tbLz/ffeaZrZl0Fk+LV
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d9e:b0:3a9:cde3:2ecc with SMTP id
 e9e14a558f8ab-3d2c020d145mr200185565ab.6.1740413732695; Mon, 24 Feb 2025
 08:15:32 -0800 (PST)
Date: Mon, 24 Feb 2025 08:15:32 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67bc9b24.050a0220.bbfd1.008e.GAE@google.com>
Subject: [syzbot] [kernel?] INFO: task hung in __fput
From: syzbot <syzbot+5014f30b0de0d4b77ae3@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, benjamin.tissoires@redhat.com, 
	bristot@redhat.com, bsegall@google.com, corbet@lwn.net, 
	david.rheinsberg@gmail.com, dietmar.eggemann@arm.com, frederic@kernel.org, 
	jiangshanlai@gmail.com, jikos@kernel.org, juri.lelli@redhat.com, 
	linux-doc@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com, 
	peterz@infradead.org, rostedt@goodmis.org, syzkaller-bugs@googlegroups.com, 
	tglx@linutronix.de, tj@kernel.org, vincent.guittot@linaro.org, 
	vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d082ecbc71e9 Linux 6.14-rc4
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=164ae7a4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8de9cc84d5960254
dashboard link: https://syzkaller.appspot.com/bug?extid=5014f30b0de0d4b77ae3
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=114ae7a4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2538edcc866d/disk-d082ecbc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/fe2b2d244cf7/vmlinux-d082ecbc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/471967bae80b/bzImage-d082ecbc.xz

The issue was bisected to:

commit 616db8779b1e3f93075df691432cccc5ef3c3ba0
Author: Tejun Heo <tj@kernel.org>
Date:   Thu May 18 03:02:08 2023 +0000

    workqueue: Automatically mark CPU-hogging work items CPU_INTENSIVE

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1217e7a4580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1117e7a4580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1617e7a4580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5014f30b0de0d4b77ae3@syzkaller.appspotmail.com
Fixes: 616db8779b1e ("workqueue: Automatically mark CPU-hogging work items CPU_INTENSIVE")

INFO: task syz.0.22:6033 blocked for more than 152 seconds.
      Not tainted 6.14.0-rc4-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.22        state:D stack:25656 pid:6033  tgid:6033  ppid:5937   task_flags:0x400040 flags:0x00000004
 <TASK>
 __schedule_loop kernel/sched/core.c:6842 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6857
 schedule_timeout+0xb0/0x290 kernel/time/sleep_timeout.c:75
 __cancel_work_sync+0xbc/0x110 kernel/workqueue.c:4362
 uhid_dev_destroy drivers/hid/uhid.c:584 [inline]
 uhid_char_release+0xac/0x600 drivers/hid/uhid.c:662
 __fput+0x3e9/0x9f0 fs/file_table.c:464
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x13f/0x340 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0f6998d169
RSP: 002b:00007ffe4cd3e698 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 0000000000019525 RCX: 00007f0f6998d169
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007f0f69ba7ba0 R08: 0000000000000001 R09: 000000024cd3e98f
R10: 00007f0f69800000 R11: 0000000000000246 R12: 00007f0f69ba5fac
R13: 00007f0f69ba5fa0 R14: ffffffffffffffff R15: 00007ffe4cd3e7b0
 </TASK>
INFO: task syz.2.18:6035 blocked for more than 156 seconds.
      Not tainted 6.14.0-rc4-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.2.18        state:D stack:25984 pid:6035  tgid:6035  ppid:5945   task_flags:0x400040 flags:0x00000004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5378 [inline]
 __schedule+0x18bc/0x4c40 kernel/sched/core.c:6765
 __schedule_loop kernel/sched/core.c:6842 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6857
 schedule_timeout+0xb0/0x290 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:95 [inline]
 __wait_for_common kernel/sched/completion.c:116 [inline]
 wait_for_common kernel/sched/completion.c:127 [inline]
 wait_for_completion+0x355/0x620 kernel/sched/completion.c:148
 __flush_work+0xa47/0xc60 kernel/workqueue.c:4242
 __fput+0x3e9/0x9f0 fs/file_table.c:464
 task_work_run+0x24f/0x310 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x13f/0x340 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
RIP: 0033:0x7f4cedb8d169
RAX: 0000000000000000 RBX: 0000000000019540 RCX: 00007f4cedb8d169
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007f4cedda7ba0 R08: 0000000000000001 R09: 0000000243e0cb6f
R10: 00007f4ceda00000 R11: 0000000000000246 R12: 00007f4cedda5fac
      Not tainted 6.14.0-rc4-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.1.17        state:D
 stack:25984 pid:6037  tgid:6037  ppid:5940   task_flags:0x400040 flags:0x00000004
 context_switch kernel/sched/core.c:5378 [inline]
 __schedule+0x18bc/0x4c40 kernel/sched/core.c:6765


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

