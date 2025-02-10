Return-Path: <linux-input+bounces-9868-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C886A2E279
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 04:03:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED1303A36D8
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2025 03:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B4843A8D0;
	Mon, 10 Feb 2025 03:03:24 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9265A46B8
	for <linux-input@vger.kernel.org>; Mon, 10 Feb 2025 03:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739156604; cv=none; b=ALivisQEwIW+YDaodgfCMV6nwXyyjwwOiEGxbGcRby2ttrS85xXFTwYE3DTjxxkzpB7PvLS0qxegoNXoQxf5ZKhnj77GezaQP6ICrAsIKzsxlbv3oeXwuiiF4IiCdC1ChsKdVvF5lqQFpECIrDwvgZARw2+tNWbkBX3rnGfXQ5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739156604; c=relaxed/simple;
	bh=XmMAPUUl6UrrOhu4gf9m3BrrIGTrCUtCKZN6E/Uwhf4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=ajRyfuST9na1SwGy+iaEW3pk4uXIyfdqf0rW0id67Y9GhM+JV/ZsQwUR9uubeTE93WbrmNoOrZYy1C8QpaG6ULm+Lu/W1K2fK7T9lzV/M5haQxbh65m9mrK+uLu8HHNJfn0WVVrkMZCuHYoxHbQU7VHwmaZ14XwIlMvx2uQYqtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d14c647935so37697965ab.0
        for <linux-input@vger.kernel.org>; Sun, 09 Feb 2025 19:03:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739156601; x=1739761401;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0e7ulM3071NpQz74IyAtk9x9tmxHHxE+ERRDrOeCGQQ=;
        b=Ba9ejqDicEbZyJLNsfRuEo26P8vL1ADDqP7NJi0jQG/ncgrOnd/UHLLMJa/TsovoIO
         Eum+ixo357fusG2tcipN/InRnB2/mge8UnHY5ZyE9HEktTPr47CEGyq+a08v2tj+Kqwj
         SKE05ILBKr7Dn/NwHDDqlvicXFle4JgZoEGkx41ADEEbYvBibAEdA8B8teRt19KFAXRh
         kSh5ankbE69Wx5eXcOM5zZFO379DdJ1LJyqZHNgKRE2A5xKhONych1yN4u/qxaqbfbDt
         t+O+qFK9IZs+mallgE1ZelbXrgxdsxFCzMfRN/vEoDfk2BRsYchFT1kzB9ySkrfe/pGG
         PJ5A==
X-Forwarded-Encrypted: i=1; AJvYcCWmxW5oW4ffrBIeXgIPsp6HhfZ3ExFUR/FkMHLRwKmnyR4w0Q0xVOYseFM7r+SheNym0wIH935spRKldg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywly32tvaSE8EMVWhBTFvHulxR4x0ZI5sB9/k607TDEiGKAxeZp
	+relQNv77XIYryl8b8u3ZbiW00rrYKG2owSHXtWk3a+COm7mTpNEzA/QLx007VGBqk3BxyIZOal
	ghKYMqM5YRqwLk1x0C2bY/4AWDMkwZQRSaYwfSbusCyzSXCmXc4bIedc=
X-Google-Smtp-Source: AGHT+IGgG4qIkK9N0cdGQ1hIkgyZVLzZee3wmVcIGY49GhQWoVAZpNxkUi3EwDNnb2LdbzQh+70z8NtE0s+vJj8e30m4bcNvDH5S
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:cd8d:0:b0:3d0:4b3d:75ce with SMTP id
 e9e14a558f8ab-3d13df0fdeamr82045025ab.17.1739156601757; Sun, 09 Feb 2025
 19:03:21 -0800 (PST)
Date: Sun, 09 Feb 2025 19:03:21 -0800
In-Reply-To: <67535904.050a0220.2477f.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a96c79.050a0220.110943.0025.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-out-of-bounds Read in mcp2221_raw_event
From: syzbot <syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    9682c35ff6ec usb: typec: thunderbolt: Remove IS_ERR check ..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=10b0c2a4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ed7570f7f6046a71
dashboard link: https://syzkaller.appspot.com/bug?extid=52c1a7d3e5b361ccd346
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c93b18580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=124a6bdf980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/3c194e311f90/disk-9682c35f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/daad45c8e7c8/vmlinux-9682c35f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8a4e74467d7e/bzImage-9682c35f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: null-ptr-deref in mcp2221_raw_event+0xc1f/0x1030 drivers/hid/hid-mcp2221.c:818
Write of size 141 at addr 0000000000000000 by task swapper/1/0

CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.14.0-rc1-syzkaller-g9682c35ff6ec #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 kasan_report+0xd9/0x110 mm/kasan/report.c:602
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0xef/0x1a0 mm/kasan/generic.c:189
 __asan_memcpy+0x3c/0x60 mm/kasan/shadow.c:106
 mcp2221_raw_event+0xc1f/0x1030 drivers/hid/hid-mcp2221.c:818
 __hid_input_report.constprop.0+0x312/0x440 drivers/hid/hid-core.c:2113
 hid_irq_in+0x35e/0x870 drivers/hid/usbhid/hid-core.c:285
 __usb_hcd_giveback_urb+0x389/0x6e0 drivers/usb/core/hcd.c:1650
 usb_hcd_giveback_urb+0x396/0x450 drivers/usb/core/hcd.c:1734
 dummy_timer+0x17f7/0x3960 drivers/usb/gadget/udc/dummy_hcd.c:1994
 __run_hrtimer kernel/time/hrtimer.c:1738 [inline]
 __hrtimer_run_queues+0x20a/0xae0 kernel/time/hrtimer.c:1802
 hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1819
 handle_softirqs+0x206/0x8d0 kernel/softirq.c:561
 __do_softirq kernel/softirq.c:595 [inline]
 invoke_softirq kernel/softirq.c:435 [inline]
 __irq_exit_rcu+0xfa/0x160 kernel/softirq.c:662
 irq_exit_rcu+0x9/0x30 kernel/softirq.c:678
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0x90/0xb0 arch/x86/kernel/apic/apic.c:1049
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:native_irq_disable arch/x86/include/asm/irqflags.h:37 [inline]
RIP: 0010:arch_local_irq_disable arch/x86/include/asm/irqflags.h:92 [inline]
RIP: 0010:acpi_safe_halt+0x1a/0x20 drivers/acpi/processor_idle.c:112
Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 65 48 8b 05 78 dd ec 78 48 8b 00 a8 08 75 0c 66 90 0f 00 2d 48 9d 39 00 fb f4 <fa> c3 cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 0018:ffffc9000014fd58 EFLAGS: 00000246
RAX: 0000000000004000 RBX: 0000000000000001 RCX: ffffffff8716c579
RDX: 0000000000000001 RSI: ffff888106a98800 RDI: ffff888106a98864
RBP: ffff888106a98864 R08: 0000000000000001 R09: ffffed103eb26f35
R10: ffff8881f59379ab R11: 0000000000000000 R12: ffff8881013d8000
R13: ffffffff8934ea40 R14: 0000000000000001 R15: 0000000000000000
 acpi_idle_enter+0xc5/0x160 drivers/acpi/processor_idle.c:699
 cpuidle_enter_state+0xaa/0x4f0 drivers/cpuidle/cpuidle.c:268
 cpuidle_enter+0x4e/0xa0 drivers/cpuidle/cpuidle.c:389
 cpuidle_idle_call kernel/sched/idle.c:230 [inline]
 do_idle+0x310/0x3f0 kernel/sched/idle.c:325
 cpu_startup_entry+0x4f/0x60 kernel/sched/idle.c:423
 start_secondary+0x222/0x2b0 arch/x86/kernel/smpboot.c:315
 common_startup_64+0x12c/0x138
 </TASK>
==================================================================
----------------
Code disassembly (best guess):
   0:	90                   	nop
   1:	90                   	nop
   2:	90                   	nop
   3:	90                   	nop
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	65 48 8b 05 78 dd ec 	mov    %gs:0x78ecdd78(%rip),%rax        # 0x78ecdd90
  17:	78
  18:	48 8b 00             	mov    (%rax),%rax
  1b:	a8 08                	test   $0x8,%al
  1d:	75 0c                	jne    0x2b
  1f:	66 90                	xchg   %ax,%ax
  21:	0f 00 2d 48 9d 39 00 	verw   0x399d48(%rip)        # 0x399d70
  28:	fb                   	sti
  29:	f4                   	hlt
* 2a:	fa                   	cli <-- trapping instruction
  2b:	c3                   	ret
  2c:	cc                   	int3
  2d:	cc                   	int3
  2e:	cc                   	int3
  2f:	cc                   	int3
  30:	90                   	nop
  31:	90                   	nop
  32:	90                   	nop
  33:	90                   	nop
  34:	90                   	nop
  35:	90                   	nop
  36:	90                   	nop
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

