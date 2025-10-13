Return-Path: <linux-input+bounces-15444-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 764AFBD6933
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 00:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B3FA04FEFEF
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 22:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC2C3128D4;
	Mon, 13 Oct 2025 21:58:33 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF6730BB94
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 21:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760392712; cv=none; b=GnFxSdbJARj1MsxtnXBCxRT7GLEA60bQ+pQ3Ui0RqjvYipXORpY7u14BWuA2EnMlpB3P2+L0Lr53q+m8b6hrtY+P/YkqwBTD06gsx2gTP/OGsvPWqekMe8WAz9NggP8Ir0ho3N5m0KTb+t8tVRiP9L2j8fmCOfXaKsaw34mmtR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760392712; c=relaxed/simple;
	bh=dri1T1aBIrax0bSq/AiIadftoBuhkH4eiMRYwruo3cE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=UTQcbgj5aMoji4v8cLkc1+ieGUuyhK9UQlYLmUatGnBYmrWSFO59h0MS7Hxb+IC/J2nNUvyjSlA0DA6ZeecgoL6ouZ+fy7e4ZzjYVk/8Zgz6N5ExHzPC6GIvv9jj7uPcYr8O5/mda1v93zPxNwP2IesJkgbJaUxlmxroN3lJBVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-42f81a589caso297679445ab.3
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392710; x=1760997510;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YTn5Q6x07H9U5K5DPRcQ35V2TEuBbiD24I9VW7bfNdU=;
        b=mSjUXmH9u19ZLMOJxvgG2SaXi1CLap9zDGzXT+fb3JaipGvHfI5hI7ubXpml3VN/Kj
         4HiGcg8/a+q8UHzUEGY+Ts5xAySRzSv6WIsEGzIp4i7moYB9PkwLeXF8o0gSA5fnQO82
         ONb98fP14nC64+7feH5VQQ9FauZjHytcR3Wmu8FzE/vs1mpjF5Jek2u0r57KuDEejYgf
         MemkEnR6N2iav/vqFAmj/eBW9U/03ucU54NweSvY8cBmIZa2QfI2DnJ2UyU06M1bcmYv
         1Gt6q4gXjtreketF1OErcjQJVwdvqgv9kPNcwyxu6PsoUNE6sNTEZ/7M9/YPQ5sSbZCz
         Q4sg==
X-Forwarded-Encrypted: i=1; AJvYcCWCLbdnj7AnQwK1uvkdKMQsD4Tt+eutRe2mvCC9yX7IjqqhuSqXnDR4n8GcW7Oo5XS3PcWk4QmCtO80AQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgiBMWvrHISv7taYGZeYk9NVcQ7ezMwtgtyj6dF208435JA1g/
	TBQxVrNfIT8FUpg/HTLsrFxgwx9bUF5tV4Y3JKnk/6/Ghx/FPjisWruAt6dw0abORObxsHCz1ya
	/WQs9wQDlaPZdwNhTbocm/87b8dkHhgH0XoM+U/A1DjQXYlqpgcXI+S1HqA0=
X-Google-Smtp-Source: AGHT+IHaxpFguq/B66A1ghbKvobMUaCj15kcEDOHi2za6akQMyPJ/+1vXW71RktKndoNDpowFCWRPKI/5+QbV/obtxSFvOh2rfZC
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1707:b0:424:7bb:775c with SMTP id
 e9e14a558f8ab-42f8741c253mr222225565ab.31.1760392710286; Mon, 13 Oct 2025
 14:58:30 -0700 (PDT)
Date: Mon, 13 Oct 2025 14:58:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ed7606.a70a0220.b3ac9.0020.GAE@google.com>
Subject: [syzbot] [input?] BUG: unable to handle kernel paging request in uinput_destroy_device
From: syzbot <syzbot+51f9b5e3c5a307417c1b@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2b763d465239 Add linux-next specific files for 20251010
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12f06542580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d4057daadbd2196b
dashboard link: https://syzkaller.appspot.com/bug?extid=51f9b5e3c5a307417c1b
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13cbf458580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5ca8031cf31f/disk-2b763d46.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/00ba418b156f/vmlinux-2b763d46.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a18ef5d6f602/bzImage-2b763d46.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+51f9b5e3c5a307417c1b@syzkaller.appspotmail.com

BUG: unable to handle page fault for address: fffffffffffffff8
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD df3d067 
P4D df3d067 
PUD df3f067 
PMD 0 

Oops: Oops: 0000 [#1] SMP KASAN PTI
CPU: 1 UID: 0 PID: 6106 Comm: syz.0.45 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/02/2025
RIP: 0010:swake_up_locked kernel/sched/swait.c:30 [inline]
RIP: 0010:complete_with_flags kernel/sched/completion.c:29 [inline]
RIP: 0010:complete+0x99/0x1b0 kernel/sched/completion.c:52
Code: 89 e7 e8 8a 4e 8b 00 4d 8b 3c 24 4d 39 e7 0f 84 d4 00 00 00 49 8d 7f f8 48 89 f8 48 c1 e8 03 80 3c 28 00 74 05 e8 67 4e 8b 00 <49> 8b 7f f8 be 03 00 00 00 31 d2 e8 17 5c f6 ff 4c 89 ff e8 9f eb
RSP: 0018:ffffc90003a3fcd8 EFLAGS: 00010046

RAX: 1fffffffffffffff RBX: ffffc90003bafa58 RCX: dffffc0000000000
RDX: 0000000000000001 RSI: 0000000000000004 RDI: fffffffffffffff8
RBP: dffffc0000000000 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff52000747f78 R12: ffffc90003bafa98
R13: 0000000000000001 R14: 0000000000000a06 R15: 0000000000000000
FS:  0000555564ca1500(0000) GS:ffff888125e2b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffffffffffffff8 CR3: 000000007959e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 uinput_flush_requests drivers/input/misc/uinput.c:213 [inline]
 uinput_destroy_device+0x11a/0x8c0 drivers/input/misc/uinput.c:298
 uinput_release+0x3b/0x50 drivers/input/misc/uinput.c:758
 __fput+0x44c/0xa70 fs/file_table.c:468
 task_work_run+0x1d4/0x260 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop+0xe9/0x130 kernel/entry/common.c:43
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 do_syscall_64+0x2bd/0xfa0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fe54718eec9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe72996ff8 EFLAGS: 00000246
 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 000000000001bc2c RCX: 00007fe54718eec9
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007fe5473e7da0 R08: 0000000000000001 R09: 00000006729972ef
R10: 0000001b2f220000 R11: 0000000000000246 R12: 00007fe5473e5fac
R13: 00007fe5473e5fa0 R14: ffffffffffffffff R15: 00007ffe72997110
 </TASK>
Modules linked in:
CR2: fffffffffffffff8
---[ end trace 0000000000000000 ]---
RIP: 0010:swake_up_locked kernel/sched/swait.c:30 [inline]
RIP: 0010:complete_with_flags kernel/sched/completion.c:29 [inline]
RIP: 0010:complete+0x99/0x1b0 kernel/sched/completion.c:52
Code: 89 e7 e8 8a 4e 8b 00 4d 8b 3c 24 4d 39 e7 0f 84 d4 00 00 00 49 8d 7f f8 48 89 f8 48 c1 e8 03 80 3c 28 00 74 05 e8 67 4e 8b 00 <49> 8b 7f f8 be 03 00 00 00 31 d2 e8 17 5c f6 ff 4c 89 ff e8 9f eb
RSP: 0018:ffffc90003a3fcd8 EFLAGS: 00010046

RAX: 1fffffffffffffff RBX: ffffc90003bafa58 RCX: dffffc0000000000
RDX: 0000000000000001 RSI: 0000000000000004 RDI: fffffffffffffff8
RBP: dffffc0000000000 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffff52000747f78 R12: ffffc90003bafa98
R13: 0000000000000001 R14: 0000000000000a06 R15: 0000000000000000
FS:  0000555564ca1500(0000) GS:ffff888125e2b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffffffffffffff8 CR3: 000000007959e000 CR4: 00000000003526f0
----------------
Code disassembly (best guess):
   0:	89 e7                	mov    %esp,%edi
   2:	e8 8a 4e 8b 00       	call   0x8b4e91
   7:	4d 8b 3c 24          	mov    (%r12),%r15
   b:	4d 39 e7             	cmp    %r12,%r15
   e:	0f 84 d4 00 00 00    	je     0xe8
  14:	49 8d 7f f8          	lea    -0x8(%r15),%rdi
  18:	48 89 f8             	mov    %rdi,%rax
  1b:	48 c1 e8 03          	shr    $0x3,%rax
  1f:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
  23:	74 05                	je     0x2a
  25:	e8 67 4e 8b 00       	call   0x8b4e91
* 2a:	49 8b 7f f8          	mov    -0x8(%r15),%rdi <-- trapping instruction
  2e:	be 03 00 00 00       	mov    $0x3,%esi
  33:	31 d2                	xor    %edx,%edx
  35:	e8 17 5c f6 ff       	call   0xfff65c51
  3a:	4c 89 ff             	mov    %r15,%rdi
  3d:	e8                   	.byte 0xe8
  3e:	9f                   	lahf
  3f:	eb                   	.byte 0xeb


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

