Return-Path: <linux-input+bounces-7963-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A194D9C0FE3
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 21:42:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98BA01C20BA4
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2024 20:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCEDA217F5C;
	Thu,  7 Nov 2024 20:42:29 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EBC217F4A
	for <linux-input@vger.kernel.org>; Thu,  7 Nov 2024 20:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731012149; cv=none; b=iA5UEzRniMC8MmBWf2Z8yBVe194DS97DSwLdhc9Ffi13/1a6mJHA09FLOdPFAD0OtBFKEvhd9ybCpoBiaF73Cla37Gozxe1aQ9yflYPgYlq8dwYHXH1OoJXeW9ApTnUw5j1dR629MWtME1sHrzCR9dBw3EVHH03DJN00bg21USM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731012149; c=relaxed/simple;
	bh=ZeQHiLFngkaqPHr6AA0VGHRRYMPAFDljrUJ0kxQ/kG8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=gt8X415fzHwij3yfKGqu34UbX0v3WWE7PC8jgD4Cv/gomBu6L2mChLXvMbxUxTUMl/u36Pa2R9SymZ/JJH0X3/d200Stl5kTFHSXBh+sh5RTmAihoQbmhBEU2dX4L1S1k7VvYp7J3OgYc/i+zYUOhW91ibH7Oe/hTrp+mNwNWUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a3c9886eccso16377505ab.2
        for <linux-input@vger.kernel.org>; Thu, 07 Nov 2024 12:42:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731012145; x=1731616945;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T0UkvhmVUZaqxgIdnNe4OzG8kiSa9e9VZC8CIjW5S9k=;
        b=rdtBjRVJ2wzZJLNBXCxvnkqF6aEe+a/tHjqK9+xjrOV4+SlkkreMSLp+n4Wux0TFGl
         PC+6rDOgBRa9f+ptdrjFc49qgWTk5+fTi5W9+Jrm/nONfYDs6aISQ+i4fYLrAXSy1u4N
         v0CXM8RUe5wovBgz/1oFOzvP3YszZF+PiBEkQSsHr3MmN+ZvbZvJIGYHwhYzl0P+b0Cz
         E3cwbesjn7V8l3ZytduerJg21fWMtLDqC3yCBKyuGrIrpQ+xYVTPRSqFDTQ03ij2Na4c
         ktzjm9dVh3Heq820Q/1YznGrTRsP4OOMOOPWo9MctrbIZlF3opO3OFC4BYA/OuZ+/uD5
         h5wg==
X-Forwarded-Encrypted: i=1; AJvYcCXHfc2kLRCCGoRwJ3FF4SICq0e/QXBPcUebn6EhsYwOO1SrgXCxE+bFSGc+rgdd+J6oF5dKI6XNPm4Hrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGEzwTEvfEjkwBqknArvvZKJE2de2UEXmlY+lYtsqNCMNL8xkZ
	qDtNZrQQpmpYEFl20Ky/nzfIqYCn3DkRAjxNlxppbqqL20RQD3ogXdYeweKxfxhbDP840w9daht
	2NJx88iZ61YG+MJZIiJ4IvR/B1hjkiPRHiziNy33Motqa+fEKFKmj4OA=
X-Google-Smtp-Source: AGHT+IGlfvi2uWrbVMOU5Ic5lsnZkvMaOu3RM+FZWWUXYg3sNDoJ0XCd1XPTGFmwKBkPko7+Ef/152mXXfhk/JStJd7k7xGe4ZhH
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1543:b0:3a4:e9b3:22a7 with SMTP id
 e9e14a558f8ab-3a6f18e19bdmr7120675ab.0.1731012145249; Thu, 07 Nov 2024
 12:42:25 -0800 (PST)
Date: Thu, 07 Nov 2024 12:42:25 -0800
In-Reply-To: <0000000000007a02930611d2efbb@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <672d2631.050a0220.0db4.01ab.GAE@google.com>
Subject: Re: [syzbot] [mm?] INFO: rcu detected stall in sys_syslog (2)
From: syzbot <syzbot+269f9ad9bc32451d5fb5@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-usb@vger.kernel.org, luto@kernel.org, mingo@redhat.com, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

syzbot has found a reproducer for the following issue on:

HEAD commit:    ff7afaeca1a1 Merge tag 'nfs-for-6.12-3' of git://git.linux.=
.
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=3D1530fd5f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dc0b2fb415081f28=
8
dashboard link: https://syzkaller.appspot.com/bug?extid=3D269f9ad9bc32451d5=
fb5
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D11fe8ea798000=
0
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D15fe8ea7980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6abfeaa84222/disk-=
ff7afaec.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3014a95e10d8/vmlinux-=
ff7afaec.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e3a1330ffc37/bzI=
mage-ff7afaec.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+269f9ad9bc32451d5fb5@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	1-....: (283 ticks this GP) idle=3Df034/1/0x4000000000000000 softirq=
=3D14304/14304 fqs=3D826
rcu: 	         hardirqs   softirqs   csw/system
rcu: 	 number:       10          0            0
rcu: 	cputime:        3      52317           19   =3D=3D> 52320(ms)
rcu: 	(detected by 0, t=3D10505 jiffies, g=3D7969, q=3D490 ncpus=3D2)
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 5189 Comm: klogd Not tainted 6.12.0-rc6-syzkaller-00110-=
gff7afaeca1a1 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 09/13/2024
RIP: 0010:io_serial_out+0x8f/0xb0 drivers/tty/serial/8250/8250_port.c:413
Code: 48 8d 7d 40 44 89 e1 48 b8 00 00 00 00 00 fc ff df 48 89 fa d3 e3 48 =
c1 ea 03 80 3c 02 00 75 1c 66 03 5d 40 44 89 e8 89 da ee <5b> 5d 41 5c 41 5=
d c3 cc cc cc cc e8 11 7a e3 fc eb a0 e8 9a 7a e3
RSP: 0018:ffffc90000a182b8 EFLAGS: 00000006
RAX: 0000000000000000 RBX: 00000000000003f9 RCX: 0000000000000000
RDX: 00000000000003f9 RSI: ffffffff850b8a85 RDI: ffffffff9aaeac40
RBP: ffffffff9aaeac00 R08: 0000000000000001 R09: 000000000000001f
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: ffffffff9aaeac50 R15: 00000000000001f5
FS:  00007f8cf22ef500(0000) GS:ffff8880b8700000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f68a008f0f0 CR3: 000000003486e000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <IRQ>
 serial_out drivers/tty/serial/8250/8250.h:142 [inline]
 serial8250_clear_IER+0x9b/0xc0 drivers/tty/serial/8250/8250_port.c:699
 serial8250_console_write+0x243/0x17c0 drivers/tty/serial/8250/8250_port.c:=
3358
 console_emit_next_record kernel/printk/printk.c:3092 [inline]
 console_flush_all+0x800/0xc60 kernel/printk/printk.c:3180
 __console_flush_and_unlock kernel/printk/printk.c:3239 [inline]
 console_unlock+0xd9/0x210 kernel/printk/printk.c:3279
 vprintk_emit+0x424/0x6f0 kernel/printk/printk.c:2407
 vprintk+0x7f/0xa0 kernel/printk/printk_safe.c:68
 _printk+0xc8/0x100 kernel/printk/printk.c:2432
 show_free_areas+0xc71/0x21e0 mm/show_mem.c:238
 __show_mem+0x34/0x150 mm/show_mem.c:406
 k_spec drivers/tty/vt/keyboard.c:667 [inline]
 k_spec+0xed/0x150 drivers/tty/vt/keyboard.c:656
 kbd_keycode drivers/tty/vt/keyboard.c:1522 [inline]
 kbd_event+0xcbd/0x17a0 drivers/tty/vt/keyboard.c:1541
 input_handle_events_default+0x116/0x1b0 drivers/input/input.c:2641
 input_pass_values+0x738/0x880 drivers/input/input.c:126
 input_event_dispose drivers/input/input.c:341 [inline]
 input_handle_event+0xf0b/0x14d0 drivers/input/input.c:369
 input_repeat_key+0x251/0x340 drivers/input/input.c:2316
 call_timer_fn+0x1a0/0x610 kernel/time/timer.c:1794
 expire_timers kernel/time/timer.c:1845 [inline]
 __run_timers+0x6e8/0x930 kernel/time/timer.c:2419
 __run_timer_base kernel/time/timer.c:2430 [inline]
 __run_timer_base kernel/time/timer.c:2423 [inline]
 run_timer_base+0x111/0x190 kernel/time/timer.c:2439
 run_timer_softirq+0x1a/0x40 kernel/time/timer.c:2449
 handle_softirqs+0x213/0x8f0 kernel/softirq.c:554
 __do_softirq kernel/softirq.c:588 [inline]
 invoke_softirq kernel/softirq.c:428 [inline]
 __irq_exit_rcu kernel/softirq.c:637 [inline]
 irq_exit_rcu+0xbb/0x120 kernel/softirq.c:649
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline=
]
 sysvec_apic_timer_interrupt+0xa4/0xc0 arch/x86/kernel/apic/apic.c:1049
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:=
702
RIP: 0010:preempt_count arch/x86/include/asm/preempt.h:26 [inline]
RIP: 0010:check_kcov_mode kernel/kcov.c:183 [inline]
RIP: 0010:write_comp_data+0x11/0x90 kernel/kcov.c:246
Code: cc cc cc cc 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 =
90 90 49 89 d2 49 89 f8 49 89 f1 65 48 8b 15 df 5f 76 7e <65> 8b 05 e0 5f 7=
6 7e a9 00 01 ff 00 74 1d f6 c4 01 74 67 a9 00 00
RSP: 0018:ffffc900039577e8 EFLAGS: 00000206
RAX: 0000000000000000 RBX: 0000000000000009 RCX: ffffffff8b149042
RDX: ffff88807b378000 RSI: 0000000000000075 RDI: 0000000000000001
RBP: ffffffff8cccedc0 R08: 0000000000000001 R09: 0000000000000075
R10: 0000000000000063 R11: 0000000000043998 R12: 0000000000000063
R13: 0000000000000001 R14: 000000000000000a R15: 0000000000000033
 __sanitizer_cov_trace_switch+0x54/0x90 kernel/kcov.c:351
 format_decode+0x472/0xba0 lib/vsprintf.c:2613
 vsnprintf+0x13d/0x1880 lib/vsprintf.c:2755
 snprintf+0xc8/0x100 lib/vsprintf.c:2938
 print_caller kernel/printk/printk.c:1371 [inline]
 info_print_prefix+0x135/0x350 kernel/printk/printk.c:1390
 record_print_text+0x141/0x400 kernel/printk/printk.c:1437
 syslog_print+0x4e9/0x5d0 kernel/printk/printk.c:1648
 do_syslog+0x3e1/0x6c0 kernel/printk/printk.c:1766
 __do_sys_syslog kernel/printk/printk.c:1858 [inline]
 __se_sys_syslog kernel/printk/printk.c:1856 [inline]
 __x64_sys_syslog+0x74/0xb0 kernel/printk/printk.c:1856
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8cf2450fa7
Code: 73 01 c3 48 8b 0d 81 ce 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f =
1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 67 00 00 00 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 8b 0d 51 ce 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007ffc0cce15b8 EFLAGS: 00000206 ORIG_RAX: 0000000000000067
RAX: ffffffffffffffda RBX: 00007f8cf25ef4a0 RCX: 00007f8cf2450fa7
RDX: 00000000000003ff RSI: 00007f8cf25ef4a0 RDI: 0000000000000002
RBP: 0000000000000000 R08: 0000000000000007 R09: aa3b10ba0bb0e37f
R10: 0000000000004000 R11: 0000000000000206 R12: 00007f8cf25ef4a0
R13: 00007f8cf25df212 R14: 00007f8cf25ef6f6 R15: 00007f8cf25ef6f6
 </TASK>
Node 0 DMA free:15360kB boost:0kB min:208kB low:260kB high:312kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2461 2461 0 0
Node 0 DMA32 free:1849620kB boost:0kB min:34168kB low:42708kB high:51248kB =
reserved_highatomic:0KB active_anon:19472kB inactive_anon:0kB active_file:0=
kB inactive_file:90908kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2549172kB mlocked:0kB bounce:0kB free_pcp:1208kB local_pcp:680k=
B free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 Normal free:4kB boost:0kB min:4kB low:4kB high:4kB reserved_highatom=
ic:0KB active_anon:32kB inactive_anon:0kB active_file:0kB inactive_file:308=
kB unevictable:0kB writepending:0kB present:1048580kB managed:364kB mlocked=
:0kB bounce:0kB free_pcp:20kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3906908kB boost:0kB min:55728kB low:69660kB high:83592kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:80kB unevictable:1536kB writepending:0kB present:4194300kB ma=
naged:4111164kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 717*4kB (UME) 1034*8kB (UE) 413*16kB (UE) 5*32kB (UE) 21*64kB=
 (UME) 5*128kB (UME) 3*256kB (ME) 2*512kB (UE) 1*1024kB (M) 2*2048kB (UM) 4=
45*4096kB (M) =3D 1849524kB
Node 0 Normal: 1*4kB (M) 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB=
 0*1024kB 0*2048kB 0*4096kB =3D 4kB
Node 1 Normal: 241*4kB (UME) 57*8kB (UME) 41*16kB (UME) 238*32kB (UME) 90*6=
4kB (UME) 28*128kB (UE) 17*256kB (UME) 9*512kB (UM) 8*1024kB (UME) 6*2048kB=
 (UE) 942*4096kB (M) =3D 3906908kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
24234 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
428036 pages reserved
0 pages cma reserved
sched: DL replenish lagged too much
Mem-Info:
active_anon:4876 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:22824 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:10780 slab_unreclaimable:82857
 mapped:2166 shmem:1410 pagetables:599
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1442973 free_pcp:307 free_cma:0
Node 0 active_anon:19504kB inactive_anon:0kB active_file:0kB inactive_file:=
91216kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:866=
4kB dirty:0kB writeback:0kB shmem:4104kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:9776kB pagetables:2396kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:208kB low:260kB high:312kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2461 2461 0 0
Node 0 DMA32 free:1849620kB boost:0kB min:34168kB low:42708kB high:51248kB =
reserved_highatomic:0KB active_anon:19472kB inactive_anon:0kB active_file:0=
kB inactive_file:90908kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2549172kB mlocked:0kB bounce:0kB free_pcp:1208kB local_pcp:680k=
B free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 Normal free:4kB boost:0kB min:4kB low:4kB high:4kB reserved_highatom=
ic:0KB active_anon:32kB inactive_anon:0kB active_file:0kB inactive_file:308=
kB unevictable:0kB writepending:0kB present:1048580kB managed:364kB mlocked=
:0kB bounce:0kB free_pcp:20kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3906908kB boost:0kB min:55728kB low:69660kB high:83592kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:80kB unevictable:1536kB writepending:0kB present:4194300kB ma=
naged:4111164kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 717*4kB (UME) 1034*8kB (UE) 413*16kB (UE) 5*32kB (UE) 21*64kB=
 (UME) 5*128kB (UME) 3*256kB (ME) 2*512kB (UE) 1*1024kB (M) 2*2048kB (UM) 4=
45*4096kB (M) =3D 1849524kB
Node 0 Normal: 1*4kB (M) 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB=
 0*1024kB 0*2048kB 0*4096kB =3D 4kB
Node 1 Normal: 241*4kB (UME) 57*8kB (UME) 41*16kB (UME) 238*32kB (UME) 90*6=
4kB (UME) 28*128kB (UE) 17*256kB (UME) 9*512kB (UM) 8*1024kB (UME) 6*2048kB=
 (UE) 942*4096kB (M) =3D 3906908kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
24234 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
428036 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:4876 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:22824 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:10780 slab_unreclaimable:82857
 mapped:2166 shmem:1410 pagetables:599
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1442973 free_pcp:291 free_cma:0
Node 0 active_anon:19504kB inactive_anon:0kB active_file:0kB inactive_file:=
91216kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:866=
4kB dirty:0kB writeback:0kB shmem:4104kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:9776kB pagetables:2396kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:208kB low:260kB high:312kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2461 2461 0 0
Node 0 DMA32 free:1849620kB boost:0kB min:34168kB low:42708kB high:51248kB =
reserved_highatomic:0KB active_anon:19472kB inactive_anon:0kB active_file:0=
kB inactive_file:90908kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2549172kB mlocked:0kB bounce:0kB free_pcp:1144kB local_pcp:680k=
B free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 Normal free:4kB boost:0kB min:4kB low:4kB high:4kB reserved_highatom=
ic:0KB active_anon:32kB inactive_anon:0kB active_file:0kB inactive_file:308=
kB unevictable:0kB writepending:0kB present:1048580kB managed:364kB mlocked=
:0kB bounce:0kB free_pcp:20kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3906908kB boost:0kB min:55728kB low:69660kB high:83592kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:80kB unevictable:1536kB writepending:0kB present:4194300kB ma=
naged:4111164kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 717*4kB (UME) 1034*8kB (UE) 413*16kB (UE) 5*32kB (UE) 21*64kB=
 (UME) 5*128kB (UME) 3*256kB (ME) 2*512kB (UE) 1*1024kB (M) 2*2048kB (UM) 4=
45*4096kB (M) =3D 1849524kB
Node 0 Normal: 1*4kB (M) 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB=
 0*1024kB 0*2048kB 0*4096kB =3D 4kB
Node 1 Normal: 241*4kB (UME) 57*8kB (UME) 41*16kB (UME) 238*32kB (UME) 90*6=
4kB (UME) 28*128kB (UE) 17*256kB (UME) 9*512kB (UM) 8*1024kB (UME) 6*2048kB=
 (UE) 942*4096kB (M) =3D 3906908kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
24234 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
428036 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:4876 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:22824 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:10780 slab_unreclaimable:82857
 mapped:2166 shmem:1410 pagetables:599
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1442973 free_pcp:291 free_cma:0
Node 0 active_anon:19504kB inactive_anon:0kB active_file:0kB inactive_file:=
91216kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:866=
4kB dirty:0kB writeback:0kB shmem:4104kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:9776kB pagetables:2396kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:208kB low:260kB high:312kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2461 2461 0 0
Node 0 DMA32 free:1849620kB boost:0kB min:34168kB low:42708kB high:51248kB =
reserved_highatomic:0KB active_anon:19472kB inactive_anon:0kB active_file:0=
kB inactive_file:90908kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2549172kB mlocked:0kB bounce:0kB free_pcp:1144kB local_pcp:680k=
B free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 Normal free:4kB boost:0kB min:4kB low:4kB high:4kB reserved_highatom=
ic:0KB active_anon:32kB inactive_anon:0kB active_file:0kB inactive_file:308=
kB unevictable:0kB writepending:0kB present:1048580kB managed:364kB mlocked=
:0kB bounce:0kB free_pcp:20kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3906908kB boost:0kB min:55728kB low:69660kB high:83592kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:80kB unevictable:1536kB writepending:0kB present:4194300kB ma=
naged:4111164kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 717*4kB (UME) 1034*8kB (UE) 413*16kB (UE) 5*32kB (UE) 21*64kB=
 (UME) 5*128kB (UME) 3*256kB (ME) 2*512kB (UE) 1*1024kB (M) 2*2048kB (UM) 4=
45*4096kB (M) =3D 1849524kB
Node 0 Normal: 1*4kB (M) 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB=
 0*1024kB 0*2048kB 0*4096kB =3D 4kB
Node 1 Normal: 241*4kB (UME) 57*8kB (UME) 41*16kB (UME) 238*32kB (UME) 90*6=
4kB (UME) 28*128kB (UE) 17*256kB (UME) 9*512kB (UM) 8*1024kB (UME) 6*2048kB=
 (UE) 942*4096kB (M) =3D 3906908kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
24234 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
428036 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:4876 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:22824 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:10780 slab_unreclaimable:82857
 mapped:2166 shmem:1410 pagetables:599
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1442973 free_pcp:291 free_cma:0
Node 0 active_anon:19504kB inactive_anon:0kB active_file:0kB inactive_file:=
91216kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:866=
4kB dirty:0kB writeback:0kB shmem:4104kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:9776kB pagetables:2396kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:208kB low:260kB high:312kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2461 2461 0 0
Node 0 DMA32 free:1849620kB boost:0kB min:34168kB low:42708kB high:51248kB =
reserved_highatomic:0KB active_anon:19472kB inactive_anon:0kB active_file:0=
kB inactive_file:90908kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2549172kB mlocked:0kB bounce:0kB free_pcp:1144kB local_pcp:680k=
B free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 Normal free:4kB boost:0kB min:4kB low:4kB high:4kB reserved_highatom=
ic:0KB active_anon:32kB inactive_anon:0kB active_file:0kB inactive_file:308=
kB unevictable:0kB writepending:0kB present:1048580kB managed:364kB mlocked=
:0kB bounce:0kB free_pcp:20kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3906908kB boost:0kB min:55728kB low:69660kB high:83592kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:80kB unevictable:1536kB writepending:0kB present:4194300kB ma=
naged:4111164kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 717*4kB (UME) 1034*8kB (UE) 413*16kB (UE) 5*32kB (UE) 21*64kB=
 (UME) 5*128kB (UME) 3*256kB (ME) 2*512kB (UE) 1*1024kB (M) 2*2048kB (UM) 4=
45*4096kB (M) =3D 1849524kB
Node 0 Normal: 1*4kB (M) 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB=
 0*1024kB 0*2048kB 0*4096kB =3D 4kB
Node 1 Normal: 241*4kB (UME) 57*8kB (UME) 41*16kB (UME) 238*32kB (UME) 90*6=
4kB (UME) 28*128kB (UE) 17*256kB (UME) 9*512kB (UM) 8*1024kB (UME) 6*2048kB=
 (UE) 942*4096kB (M) =3D 3906908kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
24234 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
428036 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:4876 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:22824 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:10780 slab_unreclaimable:82857
 mapped:2166 shmem:1410 pagetables:599
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1442973 free_pcp:291 free_cma:0
Node 0 active_anon:19504kB inactive_anon:0kB active_file:0kB inactive_file:=
91216kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:866=
4kB dirty:0kB writeback:0kB shmem:4104kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:9776kB pagetables:2396kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:208kB low:260kB high:312kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2461 2461 0 0
Node 0 DMA32 free:1849620kB boost:0kB min:34168kB low:42708kB high:51248kB =
reserved_highatomic:0KB active_anon:19472kB inactive_anon:0kB active_file:0=
kB inactive_file:90908kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2549172kB mlocked:0kB bounce:0kB free_pcp:1144kB local_pcp:680k=
B free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 Normal free:4kB boost:0kB min:4kB low:4kB high:4kB reserved_highatom=
ic:0KB active_anon:32kB inactive_anon:0kB active_file:0kB inactive_file:308=
kB unevictable:0kB writepending:0kB present:1048580kB managed:364kB mlocked=
:0kB bounce:0kB free_pcp:20kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3906908kB boost:0kB min:55728kB low:69660kB high:83592kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:80kB unevictable:1536kB writepending:0kB present:4194300kB ma=
naged:4111164kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 717*4kB (UME) 1034*8kB (UE) 413*16kB (UE) 5*32kB (UE) 21*64kB=
 (UME) 5*128kB (UME) 3*256kB (ME) 2*512kB (UE) 1*1024kB (M) 2*2048kB (UM) 4=
45*4096kB (M) =3D 1849524kB
Node 0 Normal: 1*4kB (M) 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB=
 0*1024kB 0*2048kB 0*4096kB =3D 4kB
Node 1 Normal: 241*4kB (UME) 57*8kB (UME) 41*16kB (UME) 238*32kB (UME) 90*6=
4kB (UME) 28*128kB (UE) 17*256kB (UME) 9*512kB (UM) 8*1024kB (UME) 6*2048kB=
 (UE) 942*4096kB (M) =3D 3906908kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
24234 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
428036 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:4876 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:22824 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:10780 slab_unreclaimable:82873
 mapped:2166 shmem:1410 pagetables:599
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1442973 free_pcp:291 free_cma:0
Node 0 active_anon:19504kB inactive_anon:0kB active_file:0kB inactive_file:=
91216kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:866=
4kB dirty:0kB writeback:0kB shmem:4104kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:9776kB pagetables:2396kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:208kB low:260kB high:312kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2461 2461 0 0
Node 0 DMA32 free:1849620kB boost:0kB min:34168kB low:42708kB high:51248kB =
reserved_highatomic:0KB active_anon:19472kB inactive_anon:0kB active_file:0=
kB inactive_file:90908kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2549172kB mlocked:0kB bounce:0kB free_pcp:1144kB local_pcp:680k=
B free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 Normal free:4kB boost:0kB min:4kB low:4kB high:4kB reserved_highatom=
ic:0KB active_anon:32kB inactive_anon:0kB active_file:0kB inactive_file:308=
kB unevictable:0kB writepending:0kB present:1048580kB managed:364kB mlocked=
:0kB bounce:0kB free_pcp:20kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3906908kB boost:0kB min:55728kB low:69660kB high:83592kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:80kB unevictable:1536kB writepending:0kB present:4194300kB ma=
naged:4111164kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 717*4kB (UME) 1034*8kB (UE) 413*16kB (UE) 5*32kB (UE) 21*64kB=
 (UME) 5*128kB (UME) 3*256kB (ME) 2*512kB (UE) 1*1024kB (M) 2*2048kB (UM) 4=
45*4096kB (M) =3D 1849524kB
Node 0 Normal: 1*4kB (M) 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB=
 0*1024kB 0*2048kB 0*4096kB =3D 4kB
Node 1 Normal: 241*4kB (UME) 57*8kB (UME) 41*16kB (UME) 238*32kB (UME) 90*6=
4kB (UME) 28*128kB (UE) 17*256kB (UME) 9*512kB (UM) 8*1024kB (UME) 6*2048kB=
 (UE) 942*4096kB (M) =3D 3906908kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
24234 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
428036 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:4876 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:22824 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:10780 slab_unreclaimable:82873
 mapped:2166 shmem:1410 pagetables:599
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1442973 free_pcp:291 free_cma:0
Node 0 active_anon:19504kB inactive_anon:0kB active_file:0kB inactive_file:=
91216kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:866=
4kB dirty:0kB writeback:0kB shmem:4104kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:9776kB pagetables:2396kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:208kB low:260kB high:312kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2461 2461 0 0
Node 0 DMA32 free:1849620kB boost:0kB min:34168kB low:42708kB high:51248kB =
reserved_highatomic:0KB active_anon:19472kB inactive_anon:0kB active_file:0=
kB inactive_file:90908kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2549172kB mlocked:0kB bounce:0kB free_pcp:1144kB local_pcp:680k=
B free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 Normal free:4kB boost:0kB min:4kB low:4kB high:4kB reserved_highatom=
ic:0KB active_anon:32kB inactive_anon:0kB active_file:0kB inactive_file:308=
kB unevictable:0kB writepending:0kB present:1048580kB managed:364kB mlocked=
:0kB bounce:0kB free_pcp:20kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3906908kB boost:0kB min:55728kB low:69660kB high:83592kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:80kB unevictable:1536kB writepending:0kB present:4194300kB ma=
naged:4111164kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 717*4kB (UME) 1034*8kB (UE) 413*16kB (UE) 5*32kB (UE) 21*64kB=
 (UME) 5*128kB (UME) 3*256kB (ME) 2*512kB (UE) 1*1024kB (M) 2*2048kB (UM) 4=
45*4096kB (M) =3D 1849524kB
Node 0 Normal: 1*4kB (M) 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB=
 0*1024kB 0*2048kB 0*4096kB =3D 4kB
Node 1 Normal: 241*4kB (UME) 57*8kB (UME) 41*16kB (UME) 238*32kB (UME) 90*6=
4kB (UME) 28*128kB (UE) 17*256kB (UME) 9*512kB (UM) 8*1024kB (UME) 6*2048kB=
 (UE) 942*4096kB (M) =3D 3906908kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
24234 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
428036 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:4876 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:22824 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:10780 slab_unreclaimable:82873
 mapped:2166 shmem:1410 pagetables:599
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1442973 free_pcp:291 free_cma:0
Node 0 active_anon:19504kB inactive_anon:0kB active_file:0kB inactive_file:=
91216kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:866=
4kB dirty:0kB writeback:0kB shmem:4104kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:9776kB pagetables:2396kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:208kB low:260kB high:312kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2461 2461 0 0
Node 0 DMA32 free:1849620kB boost:0kB min:34168kB low:42708kB high:51248kB =
reserved_highatomic:0KB active_anon:19472kB inactive_anon:0kB active_file:0=
kB inactive_file:90908kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2549172kB mlocked:0kB bounce:0kB free_pcp:1144kB local_pcp:680k=
B free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 Normal free:4kB boost:0kB min:4kB low:4kB high:4kB reserved_highatom=
ic:0KB active_anon:32kB inactive_anon:0kB active_file:0kB inactive_file:308=
kB unevictable:0kB writepending:0kB present:1048580kB managed:364kB mlocked=
:0kB bounce:0kB free_pcp:20kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3906908kB boost:0kB min:55728kB low:69660kB high:83592kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:80kB unevictable:1536kB writepending:0kB present:4194300kB ma=
naged:4111164kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 717*4kB (UME) 1034*8kB (UE) 413*16kB (UE) 5*32kB (UE) 21*64kB=
 (UME) 5*128kB (UME) 3*256kB (ME) 2*512kB (UE) 1*1024kB (M) 2*2048kB (UM) 4=
45*4096kB (M) =3D 1849524kB
Node 0 Normal: 1*4kB (M) 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB=
 0*1024kB 0*2048kB 0*4096kB =3D 4kB
Node 1 Normal: 241*4kB (UME) 57*8kB (UME) 41*16kB (UME) 238*32kB (UME) 90*6=
4kB (UME) 28*128kB (UE) 17*256kB (UME) 9*512kB (UM) 8*1024kB (UME) 6*2048kB=
 (UE) 942*4096kB (M) =3D 3906908kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
24234 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
428036 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:4876 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:22824 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:10780 slab_unreclaimable:82873
 mapped:2166 shmem:1410 pagetables:599
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1442973 free_pcp:291 free_cma:0
Node 0 active_anon:19504kB inactive_anon:0kB active_file:0kB inactive_file:=
91216kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:866=
4kB dirty:0kB writeback:0kB shmem:4104kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:9776kB pagetables:2396kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:208kB low:260kB high:312kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2461 2461 0 0
Node 0 DMA32 free:1849620kB boost:0kB min:34168kB low:42708kB high:51248kB =
reserved_highatomic:0KB active_anon:19472kB inactive_anon:0kB active_file:0=
kB inactive_file:90908kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2549172kB mlocked:0kB bounce:0kB free_pcp:1144kB local_pcp:680k=
B free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 Normal free:4kB boost:0kB min:4kB low:4kB high:4kB reserved_highatom=
ic:0KB active_anon:32kB inactive_anon:0kB active_file:0kB inactive_file:308=
kB unevictable:0kB writepending:0kB present:1048580kB managed:364kB mlocked=
:0kB bounce:0kB free_pcp:20kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3906908kB boost:0kB min:55728kB low:69660kB high:83592kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:80kB unevictable:1536kB writepending:0kB present:4194300kB ma=
naged:4111164kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 717*4kB (UME) 1034*8kB (UE) 413*16kB (UE) 5*32kB (UE) 21*64kB=
 (UME) 5*128kB (UME) 3*256kB (ME) 2*512kB (UE) 1*1024kB (M) 2*2048kB (UM) 4=
45*4096kB (M) =3D 1849524kB
Node 0 Normal: 1*4kB (M) 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB=
 0*1024kB 0*2048kB 0*4096kB =3D 4kB
Node 1 Normal: 241*4kB (UME) 57*8kB (UME) 41*16kB (UME) 238*32kB (UME) 90*6=
4kB (UME) 28*128kB (UE) 17*256kB (UME) 9*512kB (UM) 8*1024kB (UME) 6*2048kB=
 (UE) 942*4096kB (M) =3D 3906908kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
24234 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
428036 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:4876 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:22824 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:10780 slab_unreclaimable:82809
 mapped:2166 shmem:1410 pagetables:599
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1443141 free_pcp:199 free_cma:0
Node 0 active_anon:19504kB inactive_anon:0kB active_file:0kB inactive_file:=
91216kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:866=
4kB dirty:0kB writeback:0kB shmem:4104kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:9776kB pagetables:2396kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:208kB low:260kB high:312kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2461 2461 0 0
Node 0 DMA32 free:1850292kB boost:0kB min:34168kB low:42708kB high:51248kB =
reserved_highatomic:0KB active_anon:19472kB inactive_anon:0kB active_file:0=
kB inactive_file:90908kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2549172kB mlocked:0kB bounce:0kB free_pcp:776kB local_pcp:680kB=
 free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 Normal free:4kB boost:0kB min:4kB low:4kB high:4kB reserved_highatom=
ic:0KB active_anon:32kB inactive_anon:0kB active_file:0kB inactive_file:308=
kB unevictable:0kB writepending:0kB present:1048580kB managed:364kB mlocked=
:0kB bounce:0kB free_pcp:20kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3906908kB boost:0kB min:55728kB low:69660kB high:83592kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:80kB unevictable:1536kB writepending:0kB present:4194300kB ma=
naged:4111164kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 777*4kB (UME) 1034*8kB (UE) 425*16kB (UE) 14*32kB (UE) 21*64k=
B (UME) 5*128kB (UME) 3*256kB (ME) 2*512kB (UE) 1*1024kB (M) 2*2048kB (UM) =
445*4096kB (M) =3D 1850244kB
Node 0 Normal: 1*4kB (M) 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB=
 0*1024kB 0*2048kB 0*4096kB =3D 4kB
Node 1 Normal: 241*4kB (UME) 57*8kB (UME) 41*16kB (UME) 238*32kB (UME) 90*6=
4kB (UME) 28*128kB (UE) 17*256kB (UME) 9*512kB (UM) 8*1024kB (UME) 6*2048kB=
 (UE) 942*4096kB (M) =3D 3906908kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
24234 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
428036 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:4876 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:22824 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:10780 slab_unreclaimable:82809
 mapped:2166 shmem:1410 pagetables:599
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1443141 free_pcp:199 free_cma:0
Node 0 active_anon:19504kB inactive_anon:0kB active_file:0kB inactive_file:=
91216kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:866=
4kB dirty:0kB writeback:0kB shmem:4104kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:9776kB pagetables:2396kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:208kB low:260kB high:312kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2461 2461 0 0
Node 0 DMA32 free:1850292kB boost:0kB min:34168kB low:42708kB high:51248kB =
reserved_highatomic:0KB active_anon:19472kB inactive_anon:0kB active_file:0=
kB inactive_file:90908kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2549172kB mlocked:0kB bounce:0kB free_pcp:776kB local_pcp:680kB=
 free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 Normal free:4kB boost:0kB min:4kB low:4kB high:4kB reserved_highatom=
ic:0KB active_anon:32kB inactive_anon:0kB active_file:0kB inactive_file:308=
kB unevictable:0kB writepending:0kB present:1048580kB managed:364kB mlocked=
:0kB bounce:0kB free_pcp:20kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3906908kB boost:0kB min:55728kB low:69660kB high:83592kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:80kB unevictable:1536kB writepending:0kB present:4194300kB ma=
naged:4111164kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 777*4kB (UME) 1034*8kB (UE) 425*16kB (UE) 14*32kB (UE) 21*64k=
B (UME) 5*128kB (UME) 3*256kB (ME) 2*512kB (UE) 1*1024kB (M) 2*2048kB (UM) =
445*4096kB (M) =3D 1850244kB
Node 0 Normal: 1*4kB (M) 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB=
 0*1024kB 0*2048kB 0*4096kB =3D 4kB
Node 1 Normal: 241*4kB (UME) 57*8kB (UME) 41*16kB (UME) 238*32kB (UME) 90*6=
4kB (UME) 28*128kB (UE) 17*256kB (UME) 9*512kB (UM) 8*1024kB (UME) 6*2048kB=
 (UE) 942*4096kB (M) =3D 3906908kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
24234 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
428036 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:4876 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:22824 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:10780 slab_unreclaimable:82785
 mapped:2166 shmem:1410 pagetables:599
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1443153 free_pcp:199 free_cma:0
Node 0 active_anon:19504kB inactive_anon:0kB active_file:0kB inactive_file:=
91216kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:866=
4kB dirty:0kB writeback:0kB shmem:4104kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:9776kB pagetables:2396kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:208kB low:260kB high:312kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2461 2461 0 0
Node 0 DMA32 free:1850340kB boost:0kB min:34168kB low:42708kB high:51248kB =
reserved_highatomic:0KB active_anon:19472kB inactive_anon:0kB active_file:0=
kB inactive_file:90908kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2549172kB mlocked:0kB bounce:0kB free_pcp:776kB local_pcp:680kB=
 free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 Normal free:4kB boost:0kB min:4kB low:4kB high:4kB reserved_highatom=
ic:0KB active_anon:32kB inactive_anon:0kB active_file:0kB inactive_file:308=
kB unevictable:0kB writepending:0kB present:1048580kB managed:364kB mlocked=
:0kB bounce:0kB free_pcp:20kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3906908kB boost:0kB min:55728kB low:69660kB high:83592kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:80kB unevictable:1536kB writepending:0kB present:4194300kB ma=
naged:4111164kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 777*4kB (UME) 1034*8kB (UE) 425*16kB (UE) 14*32kB (UE) 21*64k=
B (UME) 5*128kB (UME) 3*256kB (ME) 2*512kB (UE) 1*1024kB (M) 2*2048kB (UM) =
445*4096kB (M) =3D 1850244kB
Node 0 Normal: 1*4kB (M) 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB=
 0*1024kB 0*2048kB 0*4096kB =3D 4kB
Node 1 Normal: 241*4kB (UME) 57*8kB (UME) 41*16kB (UME) 238*32kB (UME) 90*6=
4kB (UME) 28*128kB (UE) 17*256kB (UME) 9*512kB (UM) 8*1024kB (UME) 6*2048kB=
 (UE) 942*4096kB (M) =3D 3906908kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
24234 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
428036 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:4876 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:22824 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:10780 slab_unreclaimable:82785
 mapped:2166 shmem:1410 pagetables:599
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1443153 free_pcp:199 free_cma:0
Node 0 active_anon:19504kB inactive_anon:0kB active_file:0kB inactive_file:=
91216kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:866=
4kB dirty:0kB writeback:0kB shmem:4104kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:9776kB pagetables:2396kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:208kB low:260kB high:312kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2461 2461 0 0
Node 0 DMA32 free:1850340kB boost:0kB min:34168kB low:42708kB high:51248kB =
reserved_highatomic:0KB active_anon:19472kB inactive_anon:0kB active_file:0=
kB inactive_file:90908kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2549172kB mlocked:0kB bounce:0kB free_pcp:776kB local_pcp:680kB=
 free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 Normal free:4kB boost:0kB min:4kB low:4kB high:4kB reserved_highatom=
ic:0KB active_anon:32kB inactive_anon:0kB active_file:0kB inactive_file:308=
kB unevictable:0kB writepending:0kB present:1048580kB managed:364kB mlocked=
:0kB bounce:0kB free_pcp:20kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3906908kB boost:0kB min:55728kB low:69660kB high:83592kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:80kB unevictable:1536kB writepending:0kB present:4194300kB ma=
naged:4111164kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 777*4kB (UME) 1034*8kB (UE) 425*16kB (UE) 14*32kB (UE) 21*64k=
B (UME) 5*128kB (UME) 3*256kB (ME) 2*512kB (UE) 1*1024kB (M) 2*2048kB (UM) =
445*4096kB (M) =3D 1850244kB
Node 0 Normal: 1*4kB (M) 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB=
 0*1024kB 0*2048kB 0*4096kB =3D 4kB
Node 1 Normal: 241*4kB (UME) 57*8kB (UME) 41*16kB (UME) 238*32kB (UME) 90*6=
4kB (UME) 28*128kB (UE) 17*256kB (UME) 9*512kB (UM) 8*1024kB (UME) 6*2048kB=
 (UE) 942*4096kB (M) =3D 3906908kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
24234 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
428036 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:4876 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:22824 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:10780 slab_unreclaimable:82785
 mapped:2166 shmem:1410 pagetables:599
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1443153 free_pcp:199 free_cma:0
Node 0 active_anon:19504kB inactive_anon:0kB active_file:0kB inactive_file:=
91216kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:866=
4kB dirty:0kB writeback:0kB shmem:4104kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:9776kB pagetables:2396kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:208kB low:260kB high:312kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2461 2461 0 0
Node 0 DMA32 free:1850340kB boost:0kB min:34168kB low:42708kB high:51248kB =
reserved_highatomic:0KB active_anon:19472kB inactive_anon:0kB active_file:0=
kB inactive_file:90908kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2549172kB mlocked:0kB bounce:0kB free_pcp:776kB local_pcp:680kB=
 free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 Normal free:4kB boost:0kB min:4kB low:4kB high:4kB reserved_highatom=
ic:0KB active_anon:32kB inactive_anon:0kB active_file:0kB inactive_file:308=
kB unevictable:0kB writepending:0kB present:1048580kB managed:364kB mlocked=
:0kB bounce:0kB free_pcp:20kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3906908kB boost:0kB min:55728kB low:69660kB high:83592kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:80kB unevictable:1536kB writepending:0kB present:4194300kB ma=
naged:4111164kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 777*4kB (UME) 1034*8kB (UE) 425*16kB (UE) 14*32kB (UE) 21*64k=
B (UME) 5*128kB (UME) 3*256kB (ME) 2*512kB (UE) 1*1024kB (M) 2*2048kB (UM) =
445*4096kB (M) =3D 1850244kB
Node 0 Normal: 1*4kB (M) 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB=
 0*1024kB 0*2048kB 0*4096kB =3D 4kB
Node 1 Normal: 241*4kB (UME) 57*8kB (UME) 41*16kB (UME) 238*32kB (UME) 90*6=
4kB (UME) 28*128kB (UE) 17*256kB (UME) 9*512kB (UM) 8*1024kB (UME) 6*2048kB=
 (UE) 942*4096kB (M) =3D 3906908kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
24234 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
428036 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:4876 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:22824 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:10780 slab_unreclaimable:82785
 mapped:2166 shmem:1410 pagetables:599
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1443153 free_pcp:199 free_cma:0
Node 0 active_anon:19504kB inactive_anon:0kB active_file:0kB inactive_file:=
91216kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:866=
4kB dirty:0kB writeback:0kB shmem:4104kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:9776kB pagetables:2396kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:208kB low:260kB high:312kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2461 2461 0 0
Node 0 DMA32 free:1850340kB boost:0kB min:34168kB low:42708kB high:51248kB =
reserved_highatomic:0KB active_anon:19472kB inactive_anon:0kB active_file:0=
kB inactive_file:90908kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2549172kB mlocked:0kB bounce:0kB free_pcp:776kB local_pcp:680kB=
 free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 Normal free:4kB boost:0kB min:4kB low:4kB high:4kB reserved_highatom=
ic:0KB active_anon:32kB inactive_anon:0kB active_file:0kB inactive_file:308=
kB unevictable:0kB writepending:0kB present:1048580kB managed:364kB mlocked=
:0kB bounce:0kB free_pcp:20kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3906908kB boost:0kB min:55728kB low:69660kB high:83592kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:80kB unevictable:1536kB writepending:0kB present:4194300kB ma=
naged:4111164kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 777*4kB (UME) 1034*8kB (UE) 425*16kB (UE) 14*32kB (UE) 21*64k=
B (UME) 5*128kB (UME) 3*256kB (ME) 2*512kB (UE) 1*1024kB (M) 2*2048kB (UM) =
445*4096kB (M) =3D 1850244kB
Node 0 Normal: 1*4kB (M) 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB=
 0*1024kB 0*2048kB 0*4096kB =3D 4kB
Node 1 Normal: 241*4kB (UME) 57*8kB (UME) 41*16kB (UME) 238*32kB (UME) 90*6=
4kB (UME) 28*128kB (UE) 17*256kB (UME) 9*512kB (UM) 8*1024kB (UME) 6*2048kB=
 (UE) 942*4096kB (M) =3D 3906908kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
24234 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
428036 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:4876 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:22824 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:10780 slab_unreclaimable:82785
 mapped:2166 shmem:1410 pagetables:599
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1443153 free_pcp:199 free_cma:0
Node 0 active_anon:19504kB inactive_anon:0kB active_file:0kB inactive_file:=
91216kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:866=
4kB dirty:0kB writeback:0kB shmem:4104kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:9776kB pagetables:2396kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:208kB low:260kB high:312kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2461 2461 0 0
Node 0 DMA32 free:1850340kB boost:0kB min:34168kB low:42708kB high:51248kB =
reserved_highatomic:0KB active_anon:19472kB inactive_anon:0kB active_file:0=
kB inactive_file:90908kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2549172kB mlocked:0kB bounce:0kB free_pcp:776kB local_pcp:680kB=
 free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 Normal free:4kB boost:0kB min:4kB low:4kB high:4kB reserved_highatom=
ic:0KB active_anon:32kB inactive_anon:0kB active_file:0kB inactive_file:308=
kB unevictable:0kB writepending:0kB present:1048580kB managed:364kB mlocked=
:0kB bounce:0kB free_pcp:20kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3906908kB boost:0kB min:55728kB low:69660kB high:83592kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:80kB unevictable:1536kB writepending:0kB present:4194300kB ma=
naged:4111164kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 777*4kB (UME) 1034*8kB (UE) 425*16kB (UE) 14*32kB (UE) 21*64k=
B (UME) 5*128kB (UME) 3*256kB (ME) 2*512kB (UE) 1*1024kB (M) 2*2048kB (UM) =
445*4096kB (M) =3D 1850244kB
Node 0 Normal: 1*4kB (M) 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB=
 0*1024kB 0*2048kB 0*4096kB =3D 4kB
Node 1 Normal: 241*4kB (UME) 57*8kB (UME) 41*16kB (UME) 238*32kB (UME) 90*6=
4kB (UME) 28*128kB (UE) 17*256kB (UME) 9*512kB (UM) 8*1024kB (UME) 6*2048kB=
 (UE) 942*4096kB (M) =3D 3906908kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
24234 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
428036 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:4876 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:22824 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:10780 slab_unreclaimable:82785
 mapped:2166 shmem:1410 pagetables:599
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1443153 free_pcp:199 free_cma:0
Node 0 active_anon:19504kB inactive_anon:0kB active_file:0kB inactive_file:=
91216kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:866=
4kB dirty:0kB writeback:0kB shmem:4104kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:9776kB pagetables:2396kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:80kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:208kB low:260kB high:312kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2461 2461 0 0
Node 0 DMA32 free:1850340kB boost:0kB min:34168kB low:42708kB high:51248kB =
reserved_highatomic:0KB active_anon:19472kB inactive_anon:0kB active_file:0=
kB inactive_file:90908kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2549172kB mlocked:0kB bounce:0kB free_pcp:776kB local_pcp:680kB=
 free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 Normal free:4kB boost:0kB min:4kB low:4kB high:4kB reserved_highatom=
ic:0KB active_anon:32kB inactive_anon:0kB active_file:0kB inactive_file:308=
kB unevictable:0kB writepending:0kB present:1048580kB managed:364kB mlocked=
:0kB bounce:0kB free_pcp:20kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3906908kB boost:0kB min:55728kB low:69660kB high:83592kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:80kB unevictable:1536kB writepending:0kB present:4194300kB ma=
naged:4111164kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 777*4kB (UME) 1034*8kB (UE) 425*16kB (UE) 14*32kB (UE) 21*64k=
B (UME) 5*128kB (UME) 3*256kB (ME) 2*512kB (UE) 1*1024kB (M) 2*2048kB (UM) =
445*4096kB (M) =3D 1850244kB
Node 0 Normal: 1*4kB (M) 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB=
 0*1024kB 0*2048kB 0*4096kB =3D 4kB
Node 1 Normal: 241*4kB (UME) 57*8kB (UME) 41*16kB (UME) 238*32kB (UME) 90*6=
4kB (UME) 28*128kB (UE) 17*256kB (UME) 9*512kB (UM) 8*1024kB (UME) 6*2048kB=
 (UE) 942*4096kB (M) =3D 3906908kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
24234 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RA

---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

