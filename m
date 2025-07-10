Return-Path: <linux-input+bounces-13448-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF15AAFF849
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 07:01:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C128168A8C
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 05:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC26199BC;
	Thu, 10 Jul 2025 05:01:41 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C120721516E
	for <linux-input@vger.kernel.org>; Thu, 10 Jul 2025 05:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752123701; cv=none; b=QwQPbOFQ9GxKs9GyD9dqIgL+BMM/3u/KX8SrqG2gHpH+WXKNyq5vtQimstQ6v7hyuqMBft2OPa3i3SRJPMKKfnEgMd/pD0UH5CH41xHD5ngha7Qz3n7SXUw3Ekn+L5mIoIrrQzI/JuD/T0Z39yggCyr40zJaGHdEuwIe59yPYxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752123701; c=relaxed/simple;
	bh=xTWfKQIIZ41M6baz6IAELijnUUHkbU/vVFKVS7CR+3g=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QK299XTxW/l8gp5igXOEg7Ynl7+JlLq/tMnHKuTHJ/fYDpHCENg1oO5f+MzXxzuBhYECIrbYuO9euY0nt+j2nPmNRoQcSbQAUxXeBDriHyvICO2LkHKbEHHIW5eci0qWT/G0IMZfEkj7YZ2J61zG1ZEzMcLiECD879L3TDb8llM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3ddcfea00afso8712015ab.0
        for <linux-input@vger.kernel.org>; Wed, 09 Jul 2025 22:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752123699; x=1752728499;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bCEiVpSgRHQFuAGiv12yYI7VN2M+R1XWegrkUiNhdKY=;
        b=v8BNrZfU3gMi8Iy4fOJreh/ATu1U48NTv+RMUdj/E4MyEz/+ouQnRkD3QCPUg9s9wv
         hfxv9diKqactLE7cJu9XF+9fOOJllCsip9N0pj6fQVMwGtV3EKrBvpFFK9rPxSQGuH26
         nF2M2iYbucXAoEG1zU0/+peBwQbzwU5q3GXCEU2ISMGAGWIQRwOaVanFlZW3f7AmOoUq
         ueSxpsK0wcZxyZKJrIJmdxiuDUSN+UyI+64CkMNfVB8M8+U7x0GqC7pDtC5aLSSo2xXL
         V8ITLEW/XXdefHsxNSTPZIii5+1Np821+qV+flv34ZsmEAIZ7jEj7uUKHh6RqANmALHw
         N2dg==
X-Forwarded-Encrypted: i=1; AJvYcCU1Yzt6UTErgSira7Kqsnyfdu4CraLHLyxAWO7bDWA1AQRV3PXzpEzG5ZV3uVGPd+0cLyr43cus5FwuXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNVoKrHhoJqHCpYzhavVJNCuhK7JFh/jrKo3jIwcF9bOzx8y0w
	nafqiTo0C2Nm3trifDGZAerBu9T7UXA/kuXvIoO4eX+ov2hRJ4IjGEiuIizQti+qSh+eZc2vxR0
	ED3fUuS/20g8chEPmE2EPl5fsTa1B8BjxkvTDeJTOXD13v982mjId/QuPWw0=
X-Google-Smtp-Source: AGHT+IGeXN3chGLEQ6sMdLWudq7HNgjIqHit9EEVXRxOszKa9RnsZDqAlN0IouUOMZd6MnYYZ+eCpkn3PFwljnhoKLDLhoBKX7Kf
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3992:b0:3dc:8b57:b750 with SMTP id
 e9e14a558f8ab-3e2461e8093mr12244735ab.17.1752123698855; Wed, 09 Jul 2025
 22:01:38 -0700 (PDT)
Date: Wed, 09 Jul 2025 22:01:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686f4932.050a0220.385921.0028.GAE@google.com>
Subject: [syzbot] [input?] WARNING in cm109_submit_buzz_toggle/usb_submit_urb (2)
From: syzbot <syzbot+4dc9622046108c10b6e6@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    733923397fd9 Merge tag 'pwm/for-6.16-rc6-fixes' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13811a8c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=84eae426cbd8669c
dashboard link: https://syzkaller.appspot.com/bug?extid=4dc9622046108c10b6e6
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-73392339.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/343415a883fb/vmlinux-73392339.xz
kernel image: https://storage.googleapis.com/syzbot-assets/46225910a4d1/bzImage-73392339.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4dc9622046108c10b6e6@syzkaller.appspotmail.com

cm109 6-1:0.8: cm109_urb_ctl_callback: urb status -71
------------[ cut here ]------------
URB ffff8880232ba400 submitted while active
WARNING: CPU: 0 PID: 15 at drivers/usb/core/urb.c:379 usb_submit_urb+0x152b/0x1790 drivers/usb/core/urb.c:379
Modules linked in:
CPU: 0 UID: 0 PID: 15 Comm: ksoftirqd/0 Not tainted 6.16.0-rc5-syzkaller-00038-g733923397fd9 #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:usb_submit_urb+0x152b/0x1790 drivers/usb/core/urb.c:379
Code: fd eb cb bb fe ff ff ff e9 70 f3 ff ff e8 9d 48 89 fa c6 05 e5 d9 5f 09 01 90 48 c7 c7 00 1c 73 8c 48 89 de e8 86 94 48 fa 90 <0f> 0b 90 90 e9 b6 fe ff ff bb f8 ff ff ff e9 40 f3 ff ff 48 89 ef
RSP: 0018:ffffc90000007a68 EFLAGS: 00010086
RAX: 0000000000000000 RBX: ffff8880232ba400 RCX: ffffffff817ab108
RDX: ffff88801daec880 RSI: ffffffff817ab115 RDI: 0000000000000001
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000000 R14: ffff88804dcaf058 R15: 0000000000000004
FS:  0000000000000000(0000) GS:ffff888097521000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 0000000013c28000 CR4: 0000000000352ef0
Call Trace:
 <IRQ>
 cm109_submit_buzz_toggle+0xd9/0x180 drivers/input/misc/cm109.c:351
 cm109_urb_ctl_callback+0x362/0x4c0 drivers/input/misc/cm109.c:463
 __usb_hcd_giveback_urb+0x38a/0x6e0 drivers/usb/core/hcd.c:1650
 usb_hcd_giveback_urb+0x39b/0x450 drivers/usb/core/hcd.c:1734
 dummy_timer+0x180e/0x3a20 drivers/usb/gadget/udc/dummy_hcd.c:1995
 __run_hrtimer kernel/time/hrtimer.c:1761 [inline]
 __hrtimer_run_queues+0x202/0xad0 kernel/time/hrtimer.c:1825
 hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1842
 handle_softirqs+0x219/0x8e0 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0x109/0x170 kernel/softirq.c:680
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1050 [inline]
 sysvec_apic_timer_interrupt+0xa4/0xc0 arch/x86/kernel/apic/apic.c:1050
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:finish_task_switch.isra.0+0x22a/0xc10 kernel/sched/core.c:5269
Code: fb 09 00 00 44 8b 05 a9 55 20 0f 45 85 c0 0f 85 be 01 00 00 4c 89 e7 e8 a4 f6 ff ff e8 6f bc 39 00 fb 65 48 8b 1d 7e 79 46 12 <48> 8d bb 18 16 00 00 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1
RSP: 0018:ffffc9000041fbe8 EFLAGS: 00000202
RAX: 0000000000164fb9 RBX: ffff88801daec880 RCX: ffffffff81c331ff
RDX: 0000000000000000 RSI: ffffffff8de2be6b RDI: ffffffff8c1578e0
RBP: ffffc9000041fc30 R08: 0000000000000001 R09: 0000000000000001
R10: ffffffff90a99a57 R11: 0000000000000001 R12: ffff88802b23a400
R13: ffff8880262f2440 R14: ffff88801daec880 R15: ffff88802b23b270
 context_switch kernel/sched/core.c:5404 [inline]
 __schedule+0x1172/0x5de0 kernel/sched/core.c:6790
 __schedule_loop kernel/sched/core.c:6868 [inline]
 schedule+0xe7/0x3a0 kernel/sched/core.c:6883
 smpboot_thread_fn+0x8e6/0xae0 kernel/smpboot.c:160
 kthread+0x3c2/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d7/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	fb                   	sti
   1:	09 00                	or     %eax,(%rax)
   3:	00 44 8b 05          	add    %al,0x5(%rbx,%rcx,4)
   7:	a9 55 20 0f 45       	test   $0x450f2055,%eax
   c:	85 c0                	test   %eax,%eax
   e:	0f 85 be 01 00 00    	jne    0x1d2
  14:	4c 89 e7             	mov    %r12,%rdi
  17:	e8 a4 f6 ff ff       	call   0xfffff6c0
  1c:	e8 6f bc 39 00       	call   0x39bc90
  21:	fb                   	sti
  22:	65 48 8b 1d 7e 79 46 	mov    %gs:0x1246797e(%rip),%rbx        # 0x124679a8
  29:	12
* 2a:	48 8d bb 18 16 00 00 	lea    0x1618(%rbx),%rdi <-- trapping instruction
  31:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  38:	fc ff df
  3b:	48 89 fa             	mov    %rdi,%rdx
  3e:	48                   	rex.W
  3f:	c1                   	.byte 0xc1


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

