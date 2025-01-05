Return-Path: <linux-input+bounces-8887-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D92BA01880
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 09:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD8061883000
	for <lists+linux-input@lfdr.de>; Sun,  5 Jan 2025 08:31:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D41B140E38;
	Sun,  5 Jan 2025 08:31:27 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACECF13D62B
	for <linux-input@vger.kernel.org>; Sun,  5 Jan 2025 08:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736065887; cv=none; b=Mv1e61jEuJItOyFsQQcIQEY16+iwHUqgIMZsjEMmrkQdkWeQsZFe7rj3CbQGQ7baiwHe0jGpsJUGm6H3nSJt9qvQhye+utZSVXoCh8885szlhPpbtvTwKefjEPxB4JM52SAgL+Q3gKdyPkqXTCGZPiP0VpfHNsS5GqWNAyrQqeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736065887; c=relaxed/simple;
	bh=jhZpUlkxOpvg2/61y7i646ZZbuLSAplEzUxT/3uvFFs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=G2+ZMSyAtZo6b3c6D6Xf9DK5BkhaGqFfeoIoitriouWzqd/PVcw/dqMWlF4zuF3VcI5UCscJ/Tr0O1QW1Erak2ECFTjDQn6N9p7VKmIMgSGmkhvz38q4yhvGnEX/JE1Nnds0Kyp5P4SUdzSzLmF9l/GECpdqZ8lrc/DmpH7VL0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3a81684bac0so277420045ab.0
        for <linux-input@vger.kernel.org>; Sun, 05 Jan 2025 00:31:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736065881; x=1736670681;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jSwGOb2XQ/Au1ZVkxtYu8Q07PyYXghgEHLVtBItoX0s=;
        b=Q6syfvRbaQBsMd2clT/3ATz6AGNMtyrLWBC3tdN8PRN80jBTyP0np/2ZVLGi9zLtLy
         PcFzKRkRvwKsGWHcgPwJkZ/zN8Uw4ZuLaSADJ0TbxVTJdVXtM86NT87RrNUkFJj9wc2V
         4uHeaK6DGdRYJsVDPEyS+RopG8c8ZxldxkGqAS0D80Fu+QkyAWpYLUOHbA6RK3y+iTuT
         4itG+noHxqOqVkbXDLBbU3g7Bo9QB9pd+i3Q1fl0yaS3FRA5xWt1MgAC1ezHRx+i4uM0
         QRGZZl1ASp7FrnQhg4sv+UY1nMI4dzcg9vWdpSGspa+lXZNXRuBzvdy0pE4YdFe/Ajvy
         Z2Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXKsQhTEEdRpOQ+3JGdjtqqK4zSGJdY8mWIvObEu5BrSQ9axITvzIKbtHfk7NdEVNmzRvY5HinyVb/d1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU+jjZXr1k6H+gPVmWzK6Gr9XJ638MZ7Ts2sFtF5+hWlnVEe5P
	aOUmKup6g737wKZYmEVJ0fAicOBRiDpXjfX7EF9i4INwRklI6pFo18iHaDH3GtsJIWzpup/9eZO
	1SEpVXlVRBQMJLlqJ6U2//7mbZ7YYwehwf3Fp7gBd4d1g2gmmEsbfLSY=
X-Google-Smtp-Source: AGHT+IF+V7IveApb56TbBaCccJ/9xmVB6IPYDf8w5862bcQnD2gYksTHeSUDMI4fz1NahHnK6EOwYnI4sWexGXLa3nt4K3Fx/TO8
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20e8:b0:3a7:78a8:1fb4 with SMTP id
 e9e14a558f8ab-3c2d2f47732mr398254435ab.13.1736065881315; Sun, 05 Jan 2025
 00:31:21 -0800 (PST)
Date: Sun, 05 Jan 2025 00:31:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <677a4359.050a0220.380ff0.000d.GAE@google.com>
Subject: [syzbot] [input?] KASAN: null-ptr-deref Read in input_event
From: syzbot <syzbot+fddd3aa6dfcfe50c760d@syzkaller.appspotmail.com>
To: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f097a36ef88d dt-bindings: usb: qcom,dwc3: Add QCS615 to US..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=15d42d0f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c7df994a0b7c30a9
dashboard link: https://syzkaller.appspot.com/bug?extid=fddd3aa6dfcfe50c760d
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=151d56df980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17e2a8b0580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/bede28be1169/disk-f097a36e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6c75ceb4a6ea/vmlinux-f097a36e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3fdd4b8ab4d3/bzImage-f097a36e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fddd3aa6dfcfe50c760d@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: null-ptr-deref in instrument_atomic_read include/linux/instrumented.h:68 [inline]
BUG: KASAN: null-ptr-deref in _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
BUG: KASAN: null-ptr-deref in is_event_supported drivers/input/input.c:67 [inline]
BUG: KASAN: null-ptr-deref in input_event+0x42/0xa0 drivers/input/input.c:395
Read of size 8 at addr 0000000000000028 by task syz-executor199/2949

CPU: 0 UID: 0 PID: 2949 Comm: syz-executor199 Not tainted 6.13.0-rc4-syzkaller-00076-gf097a36ef88d #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 kasan_report+0xd9/0x110 mm/kasan/report.c:602
 check_region_inline mm/kasan/generic.c:183 [inline]
 kasan_check_range+0xef/0x1a0 mm/kasan/generic.c:189
 instrument_atomic_read include/linux/instrumented.h:68 [inline]
 _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
 is_event_supported drivers/input/input.c:67 [inline]
 input_event+0x42/0xa0 drivers/input/input.c:395
 input_report_key include/linux/input.h:439 [inline]
 key_down drivers/hid/hid-appleir.c:159 [inline]
 appleir_raw_event+0x3e5/0x5e0 drivers/hid/hid-appleir.c:232
 __hid_input_report.constprop.0+0x312/0x440 drivers/hid/hid-core.c:2111
 hid_ctrl+0x49f/0x550 drivers/hid/usbhid/hid-core.c:484
 __usb_hcd_giveback_urb+0x389/0x6e0 drivers/usb/core/hcd.c:1650
 usb_hcd_giveback_urb+0x396/0x450 drivers/usb/core/hcd.c:1734
 dummy_timer+0x17f7/0x3960 drivers/usb/gadget/udc/dummy_hcd.c:1993
 __run_hrtimer kernel/time/hrtimer.c:1739 [inline]
 __hrtimer_run_queues+0x20a/0xae0 kernel/time/hrtimer.c:1803
 hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1820
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
RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:152 [inline]
RIP: 0010:_raw_spin_unlock_irqrestore+0x31/0x80 kernel/locking/spinlock.c:194
Code: f5 53 48 8b 74 24 10 48 89 fb 48 83 c7 18 e8 e6 04 45 fa 48 89 df e8 2e 84 45 fa f7 c5 00 02 00 00 75 23 9c 58 f6 c4 02 75 37 <bf> 01 00 00 00 e8 85 9d 39 fa 65 8b 05 86 86 10 79 85 c0 74 16 5b
RSP: 0018:ffffc90000537a00 EFLAGS: 00000246
RAX: 0000000000000002 RBX: ffff8881f582a680 RCX: 1ffffffff1f5f36c
RDX: 0000000000000000 RSI: ffffffff8727fee0 RDI: ffffffff874735a0
RBP: 0000000000000293 R08: 0000000000000001 R09: fffffbfff1f579d7
R10: ffffffff8fabcebf R11: 0000000000000001 R12: 00000000ffff99eb
R13: 0000000000000000 R14: ffff8881f582a680 R15: 00000000ffffffff
 __mod_timer+0x8f6/0xdc0 kernel/time/timer.c:1185
 add_timer+0x62/0x90 kernel/time/timer.c:1295
 schedule_timeout+0x11f/0x280 kernel/time/sleep_timeout.c:98
 usbhid_wait_io+0x1c7/0x380 drivers/hid/usbhid/hid-core.c:645
 usbhid_init_reports+0x19f/0x390 drivers/hid/usbhid/hid-core.c:784
 hiddev_ioctl+0x1133/0x15b0 drivers/hid/usbhid/hiddev.c:794
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl fs/ioctl.c:892 [inline]
 __x64_sys_ioctl+0x190/0x200 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f05d1cf05a9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 51 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f05d1c86228 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f05d1d773f8 RCX: 00007f05d1cf05a9
RDX: 0000000000000000 RSI: 00000000d01c4813 RDI: 0000000000000004
RBP: 00007f05d1d773f0 R08: 00007f05d1c866c0 R09: 00007f05d1c866c0
R10: 00007f05d1c866c0 R11: 0000000000000246 R12: 00007f05d1d773fc
R13: 00007f05d1d440d8 R14: 04ed000000080000 R15: 00007ffe6e0843e8
 </TASK>
==================================================================
----------------
Code disassembly (best guess):
   0:	f5                   	cmc
   1:	53                   	push   %rbx
   2:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
   7:	48 89 fb             	mov    %rdi,%rbx
   a:	48 83 c7 18          	add    $0x18,%rdi
   e:	e8 e6 04 45 fa       	call   0xfa4504f9
  13:	48 89 df             	mov    %rbx,%rdi
  16:	e8 2e 84 45 fa       	call   0xfa458449
  1b:	f7 c5 00 02 00 00    	test   $0x200,%ebp
  21:	75 23                	jne    0x46
  23:	9c                   	pushf
  24:	58                   	pop    %rax
  25:	f6 c4 02             	test   $0x2,%ah
  28:	75 37                	jne    0x61
* 2a:	bf 01 00 00 00       	mov    $0x1,%edi <-- trapping instruction
  2f:	e8 85 9d 39 fa       	call   0xfa399db9
  34:	65 8b 05 86 86 10 79 	mov    %gs:0x79108686(%rip),%eax        # 0x791086c1
  3b:	85 c0                	test   %eax,%eax
  3d:	74 16                	je     0x55
  3f:	5b                   	pop    %rbx


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

