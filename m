Return-Path: <linux-input+bounces-6980-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D850E98C42D
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 19:08:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 963562846D2
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 17:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B49111C9EAA;
	Tue,  1 Oct 2024 17:08:29 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155361CB318
	for <linux-input@vger.kernel.org>; Tue,  1 Oct 2024 17:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727802509; cv=none; b=NWnrNqEUACufJvZmVE4L0Xrgvq9c03wRqnNGb/7twg4y18GE4ER1oNs1JgffjivC8VVjPsqmpuiXkYUs8HYDMN0wf4kIMt5EUIf+C+vjLEndzKVy5NQaTYY9F32FjNfc33P2bOAzWKqLeIGfn3KmH5hQhGEGl2IhkMRvsr7uz+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727802509; c=relaxed/simple;
	bh=R6LNyUD2yoioF1LiGw354ttksNLQD5fYQi4xwXPCL00=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=IUGZaRr6olDxKqgPln4J7U9G2qLV7Vzs0UTuTs0KapeqYAUs8+TxDRx4p4zUGZGe/sxC0Vps16W2ulsisOIHMvJ3Fc7hXeQ97Bn7UKt/MxvxovznTOqnRhApwjnl5ehwzVOpyAFP74/kBQbMYdq+4nPBG/SF+hguk6WRqzyH51Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a19534ac2fso85015085ab.2
        for <linux-input@vger.kernel.org>; Tue, 01 Oct 2024 10:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727802505; x=1728407305;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LQbdRLBXOViPgRiMfcY7SQ/jRj4tEI/QhgAV0rhIjK4=;
        b=Bzzqje/KlvPHZo3NFU+d/e463PKvjnCTXqREfv1TrD/nSpqaseXZeGDa2eQCF0WTf6
         ecQ1+Gwga+8Z2ni5uNUTAeG9B046NMh+j3C+4y9/LUkfl/ASa1hbuUwEaVeqVJs3nN24
         E4nqjgALGJpF7vdU7c1LjSkXjViuMGCYWOz4Rit9Er0kJFyG5uk+q3vMDcPFSO73ese3
         L+uMSLBePwrJiYq9d4kTfGQlf+JgTVfHKuLdQrUpq2tVIiL1vRp7DM704et8s1FpAgfG
         jwBhG7/UOhbmuDI5YYrLtFWhrjo7x56Wu01zNzARx6qKaFIsETNTAQQGu5C1jBoHdzIn
         hR5w==
X-Forwarded-Encrypted: i=1; AJvYcCVX+zh/3QV6nKrvLDUmjEkXvkK+CN7GohFgy4P0YBLljPs3b3/BdnlX6mTw6nHTOUEi9troRc2L9LM29A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDE1I75RmYzeSeWLhKiSMeruBmNB6eZ/1x16w1O7gMZmCYLwvb
	ZoP19HqgZCMnfHN0cg1je73Zib3ZMkzCbFfogM+/KgySRnxKm6x1bzj4iLww/3pD1Ut/ixcOA1f
	3LlReNJF/EvvM63zDkwFuCyGNumJSrQngkU8NsXo90gXAgMpmFwJX2J8=
X-Google-Smtp-Source: AGHT+IGuNgAHE2VzElCp1+oWeph3BI9M6Y60Ga/hqJddKgZEGVvyae/BP8VFhVkqHdFWQ96tWlCE/hrHs3AKGeuodcAfL+hMUAJi
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c26c:0:b0:3a0:a070:b81 with SMTP id
 e9e14a558f8ab-3a365954728mr1949025ab.23.1727802505101; Tue, 01 Oct 2024
 10:08:25 -0700 (PDT)
Date: Tue, 01 Oct 2024 10:08:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <66fc2c89.050a0220.f28ec.04be.GAE@google.com>
Subject: [syzbot] [usb?] [net?] [input?] INFO: rcu detected stall in
 unix_dgram_recvmsg (4)
From: syzbot <syzbot+0d91e83957155dac524c@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    075dbe9f6e3c Merge tag 'soc-ep93xx-dt-6.12' of git://git.k..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=145f5e27980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3d9e1c0225f14ccc
dashboard link: https://syzkaller.appspot.com/bug?extid=0d91e83957155dac524c
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17ae7a80580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/47c253223330/disk-075dbe9f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f66e6e6c457a/vmlinux-075dbe9f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3580fe941737/bzImage-075dbe9f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0d91e83957155dac524c@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected expedited stalls on CPUs/tasks: { 1-...D
 } 2670 jiffies s: 1829 root: 0x2/.
rcu: blocking rcu_node structures (internal RCU debug):

Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 2531 Comm: syslogd Not tainted 6.11.0-syzkaller-11558-g075dbe9f6e3c #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:__sanitizer_cov_trace_pc+0x0/0x70 kernel/kcov.c:210
Code: 7e 60 e8 a3 ff ff ff 31 c0 c3 cc cc cc cc 66 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 <f3> 0f 1e fa 65 48 8b 15 64 0e ae 7e 65 8b 05 65 0e ae 7e a9 00 01
RSP: 0018:ffffc900001b7ba8 EFLAGS: 00000046
RAX: ffffc900001b7e60 RBX: ffffffff8728c6c0 RCX: 000000000000005b
RDX: 0000000000000000 RSI: ffffffff8728c6c0 RDI: ffffc900001b7e60
RBP: ffffc900001b7e60 R08: 0000000000000001 R09: fffff52000036fcc
R10: ffffc900001b7e60 R11: 000000000009a250 R12: ffffffff8728c6c1
R13: 0000000000000001 R14: ffffc900001b7c98 R15: 000000007fffffff
FS:  00007fcf9506a380(0000) GS:ffff8881f5900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000200012b8 CR3: 000000011565e000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <IRQ>
 vsnprintf+0x6ca/0x1880 lib/vsprintf.c:2767
 sprintf+0xcd/0x110 lib/vsprintf.c:3007
 print_time kernel/printk/printk.c:1362 [inline]
 info_print_prefix+0x25c/0x350 kernel/printk/printk.c:1388
 record_print_text+0x141/0x400 kernel/printk/printk.c:1437
 printk_get_next_message+0x2a6/0x670 kernel/printk/printk.c:2978
 console_emit_next_record kernel/printk/printk.c:3046 [inline]
 console_flush_all+0x6ec/0xc60 kernel/printk/printk.c:3180
 __console_flush_and_unlock kernel/printk/printk.c:3239 [inline]
 console_unlock+0xd9/0x210 kernel/printk/printk.c:3279
 vprintk_emit+0x424/0x6f0 kernel/printk/printk.c:2407
 vprintk+0x7f/0xa0 kernel/printk/printk_safe.c:68
 _printk+0xc8/0x100 kernel/printk/printk.c:2432
 printk_stack_address arch/x86/kernel/dumpstack.c:72 [inline]
 show_trace_log_lvl+0x1b7/0x3d0 arch/x86/kernel/dumpstack.c:285
 sched_show_task kernel/sched/core.c:7582 [inline]
 sched_show_task+0x3f0/0x5f0 kernel/sched/core.c:7557
 show_state_filter+0xee/0x320 kernel/sched/core.c:7627
 k_spec drivers/tty/vt/keyboard.c:667 [inline]
 k_spec+0xed/0x150 drivers/tty/vt/keyboard.c:656
 kbd_keycode drivers/tty/vt/keyboard.c:1522 [inline]
 kbd_event+0xcbd/0x17a0 drivers/tty/vt/keyboard.c:1541
 input_handler_events_default+0x116/0x1b0 drivers/input/input.c:2549
 input_pass_values+0x777/0x8e0 drivers/input/input.c:126
 input_event_dispose drivers/input/input.c:352 [inline]
 input_handle_event+0xb30/0x14d0 drivers/input/input.c:369
 input_event drivers/input/input.c:398 [inline]
 input_event+0x83/0xa0 drivers/input/input.c:390
 hidinput_hid_event+0xa12/0x2410 drivers/hid/hid-input.c:1719
 hid_process_event+0x4b7/0x5e0 drivers/hid/hid-core.c:1540
 hid_input_array_field+0x330/0x710 drivers/hid/hid-core.c:1644
 hid_process_report drivers/hid/hid-core.c:1694 [inline]
 hid_report_raw_event+0xa02/0x11c0 drivers/hid/hid-core.c:2040
 __hid_input_report.constprop.0+0x341/0x440 drivers/hid/hid-core.c:2110
 hid_irq_in+0x35e/0x870 drivers/hid/usbhid/hid-core.c:285
 __usb_hcd_giveback_urb+0x389/0x6e0 drivers/usb/core/hcd.c:1650
 usb_hcd_giveback_urb+0x396/0x450 drivers/usb/core/hcd.c:1734
 dummy_timer+0x17c3/0x38d0 drivers/usb/gadget/udc/dummy_hcd.c:1988
 __run_hrtimer kernel/time/hrtimer.c:1691 [inline]
 __hrtimer_run_queues+0x20c/0xcc0 kernel/time/hrtimer.c:1755
 hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1772
 handle_softirqs+0x206/0x8d0 kernel/softirq.c:554
 __do_softirq kernel/softirq.c:588 [inline]
 invoke_softirq kernel/softirq.c:428 [inline]
 __irq_exit_rcu kernel/softirq.c:637 [inline]
 irq_exit_rcu+0xac/0x110 kernel/softirq.c:649
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1037 [inline]
 sysvec_apic_timer_interrupt+0x90/0xb0 arch/x86/kernel/apic/apic.c:1037
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:preempt_count arch/x86/include/asm/preempt.h:26 [inline]
RIP: 0010:preempt_count_sub+0x48/0x160 kernel/sched/core.c:5810
Code: 48 c1 e9 03 83 c0 03 0f b6 14 11 38 d0 7c 08 84 d2 0f 85 df 00 00 00 8b 0d 65 ff 21 12 85 c9 75 1b 65 8b 05 e2 d9 db 7e 89 c2 <81> e2 ff ff ff 7f 39 d3 7f 17 81 fb fe 00 00 00 76 71 f7 db 65 01
RSP: 0018:ffffc900017d74e8 EFLAGS: 00000246
RAX: 0000000080000001 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 0000000080000001 RSI: 0000000000000001 RDI: 0000000000000001
RBP: ffffc900017d0000 R08: ffffc900017d759c R09: ffffffff8ab27d4c
R10: ffffc900017d7568 R11: 000000000000419c R12: ffffc900017d75b8
R13: ffffc900017d7568 R14: ffffc900017d7698 R15: ffffc900017d7690
 unwind_next_frame+0xe5d/0x20c0 arch/x86/kernel/unwind_orc.c:672
 arch_stack_walk+0x95/0x100 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x95/0xd0 kernel/stacktrace.c:122
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:579
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x37/0x50 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:230 [inline]
 slab_free_hook mm/slub.c:2343 [inline]
 slab_free mm/slub.c:4580 [inline]
 kfree+0x130/0x480 mm/slub.c:4728
 skb_kfree_head net/core/skbuff.c:1086 [inline]
 skb_free_head+0x108/0x1d0 net/core/skbuff.c:1098
 skb_release_data+0x760/0x910 net/core/skbuff.c:1125
 skb_release_all net/core/skbuff.c:1190 [inline]
 __kfree_skb net/core/skbuff.c:1204 [inline]
 consume_skb net/core/skbuff.c:1436 [inline]
 consume_skb+0xbf/0x100 net/core/skbuff.c:1430
 __unix_dgram_recvmsg+0x81c/0xdd0 net/unix/af_unix.c:2520
 unix_dgram_recvmsg+0xd0/0x110 net/unix/af_unix.c:2537
 sock_recvmsg_nosec net/socket.c:1052 [inline]
 sock_recvmsg+0x1f6/0x250 net/socket.c:1074
 sock_read_iter+0x2bb/0x3b0 net/socket.c:1144
 new_sync_read fs/read_write.c:488 [inline]
 vfs_read+0xa3b/0xbd0 fs/read_write.c:569
 ksys_read+0x1fa/0x260 fs/read_write.c:712
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcf951beb6a
Code: 00 3d 00 00 41 00 75 0d 50 48 8d 3d 2d 08 0a 00 e8 ea 7d 01 00 31 c0 e9 07 ff ff ff 64 8b 04 25 18 00 00 00 85 c0 75 1b 0f 05 <48> 3d 00 f0 ff ff 76 6c 48 8b 15 8f a2 0d 00 f7 d8 64 89 02 48 83
RSP: 002b:00007ffdca56fd88 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007fcf951beb6a
RDX: 00000000000000ff RSI: 0000562251bd6300 RDI: 0000000000000000
RBP: 0000562251bd62c0 R08: 0000000000000001 R09: 0000000000000000
R10: 00007fcf9535d3a3 R11: 0000000000000246 R12: 0000562251bd634e
R13: 0000562251bd6300 R14: 0000000000000000 R15: 00007fcf953a1a80
 </TASK>
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/R-usbip state:I stack:30096 pid:741   tgid:741   ppid:2      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 rescuer_thread+0x946/0xe20 kernel/workqueue.c:3541
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/1:2     state:I stack:20880 pid:803   tgid:803   ppid:2      flags:0x00004000
Workqueue:  0x0 (events)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 worker_thread+0x2de/0xf00 kernel/workqueue.c:3406
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:pvrusb2-context state:S stack:29120 pid:987   tgid:987   ppid:2      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 pvr2_context_thread_func+0x631/0x970 drivers/media/usb/pvrusb2/pvrusb2-context.c:160
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/R-kvub3 state:I stack:30096 pid:1024  tgid:1024  ppid:2      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 rescuer_thread+0x946/0xe20 kernel/workqueue.c:3541
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/R-kvub3 state:I stack:30096 pid:1025  tgid:1025  ppid:2      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 rescuer_thread+0x946/0xe20 kernel/workqueue.c:3541
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/R-kvub3 state:I stack:30096 pid:1026  tgid:1026  ppid:2      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 rescuer_thread+0x946/0xe20 kernel/workqueue.c:3541
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/R-kmems state:I stack:30096 pid:1030  tgid:1030  ppid:2      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 rescuer_thread+0x946/0xe20 kernel/workqueue.c:3541
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/u8:6    state:I stack:23520 pid:1062  tgid:1062  ppid:2      flags:0x00004000
Workqueue:  0x0 (events_unbound)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 worker_thread+0x2de/0xf00 kernel/workqueue.c:3406
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/R-elous state:I stack:29960 pid:1063  tgid:1063  ppid:2      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 rescuer_thread+0x946/0xe20 kernel/workqueue.c:3541
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/u8:7    state:I stack:23216 pid:1113  tgid:1113  ppid:2      flags:0x00004000
Workqueue:  0x0 (events_unbound)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 worker_thread+0x2de/0xf00 kernel/workqueue.c:3406
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/u8:8    state:I stack:27360 pid:1159  tgid:1159  ppid:2      flags:0x00004000
Workqueue:  0x0 (events_unbound)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 worker_thread+0x2de/0xf00 kernel/workqueue.c:3406
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/0:1H    state:I stack:27568 pid:1248  tgid:1248  ppid:2      flags:0x00004000
Workqueue:  0x0 (kblockd)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 worker_thread+0x2de/0xf00 kernel/workqueue.c:3406
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/R-mld   state:I stack:30096 pid:1249  tgid:1249  ppid:2      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 rescuer_thread+0x946/0xe20 kernel/workqueue.c:3541
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/R-ipv6_ state:I stack:30096 pid:1250  tgid:1250  ppid:2      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 rescuer_thread+0x946/0xe20 kernel/workqueue.c:3541
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/0:2     state:D stack:21200 pid:2509  tgid:2509  ppid:2      flags:0x00004000
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6824
 __mutex_lock_common kernel/locking/mutex.c:684 [inline]
 __mutex_lock+0x5b8/0x9c0 kernel/locking/mutex.c:752
 __input_unregister_device+0x136/0x450 drivers/input/input.c:2272
 input_unregister_device+0xb9/0x100 drivers/input/input.c:2511
 hidinput_disconnect+0x160/0x3e0 drivers/hid/hid-input.c:2376
 hid_disconnect+0x14d/0x1b0 drivers/hid/hid-core.c:2320
 hid_hw_stop drivers/hid/hid-core.c:2369 [inline]
 hid_device_remove+0x1a8/0x260 drivers/hid/hid-core.c:2757
 device_remove+0xc8/0x170 drivers/base/dd.c:567
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1296
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:574
 device_del+0x396/0x9f0 drivers/base/core.c:3871
 hid_remove_device drivers/hid/hid-core.c:2939 [inline]
 hid_destroy_device+0xe5/0x150 drivers/hid/hid-core.c:2959
 usbhid_disconnect+0xa0/0xe0 drivers/hid/usbhid/hid-core.c:1458
 usb_unbind_interface+0x1e8/0x970 drivers/usb/core/driver.c:461
 device_remove drivers/base/dd.c:569 [inline]
 device_remove+0x122/0x170 drivers/base/dd.c:561
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1296
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:574
 device_del+0x396/0x9f0 drivers/base/core.c:3871
 usb_disable_device+0x36c/0x7f0 drivers/usb/core/message.c:1418
 usb_disconnect+0x2e1/0x920 drivers/usb/core/hub.c:2304
 hub_port_connect drivers/usb/core/hub.c:5361 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x1bed/0x4f40 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:jbd2/sda1-8     state:D stack:26480 pid:2511  tgid:2511  ppid:2      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 io_schedule+0xbf/0x130 kernel/sched/core.c:7552
 bit_wait_io+0x15/0xe0 kernel/sched/wait_bit.c:209
 __wait_on_bit+0x62/0x180 kernel/sched/wait_bit.c:49
 out_of_line_wait_on_bit+0xda/0x110 kernel/sched/wait_bit.c:64
 wait_on_bit_io include/linux/wait_bit.h:101 [inline]
 __wait_on_buffer+0x64/0x70 fs/buffer.c:123
 wait_on_buffer include/linux/buffer_head.h:414 [inline]
 jbd2_journal_commit_transaction+0x3864/0x65b0 fs/jbd2/commit.c:814
 kjournald2+0x1f8/0x760 fs/jbd2/journal.c:201
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/R-ext4- state:I stack:30816 pid:2512  tgid:2512  ppid:2      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 rescuer_thread+0x946/0xe20 kernel/workqueue.c:3541
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:syslogd         state:R  running task     stack:24992 pid:2531  tgid:2531  ppid:1      flags:0x00000008
Call Trace:
 <IRQ>
 sched_show_task kernel/sched/core.c:7582 [inline]
 sched_show_task+0x3f0/0x5f0 kernel/sched/core.c:7557
 show_state_filter+0xee/0x320 kernel/sched/core.c:7627
 k_spec drivers/tty/vt/keyboard.c:667 [inline]
 k_spec+0xed/0x150 drivers/tty/vt/keyboard.c:656
 kbd_keycode drivers/tty/vt/keyboard.c:1522 [inline]
 kbd_event+0xcbd/0x17a0 drivers/tty/vt/keyboard.c:1541
 input_handler_events_default+0x116/0x1b0 drivers/input/input.c:2549
 input_pass_values+0x777/0x8e0 drivers/input/input.c:126
 input_event_dispose drivers/input/input.c:352 [inline]
 input_handle_event+0xb30/0x14d0 drivers/input/input.c:369
 input_event drivers/input/input.c:398 [inline]
 input_event+0x83/0xa0 drivers/input/input.c:390
 hidinput_hid_event+0xa12/0x2410 drivers/hid/hid-input.c:1719
 hid_process_event+0x4b7/0x5e0 drivers/hid/hid-core.c:1540
 hid_input_array_field+0x330/0x710 drivers/hid/hid-core.c:1644
 hid_process_report drivers/hid/hid-core.c:1694 [inline]
 hid_report_raw_event+0xa02/0x11c0 drivers/hid/hid-core.c:2040
 __hid_input_report.constprop.0+0x341/0x440 drivers/hid/hid-core.c:2110
 hid_irq_in+0x35e/0x870 drivers/hid/usbhid/hid-core.c:285
 __usb_hcd_giveback_urb+0x389/0x6e0 drivers/usb/core/hcd.c:1650
 usb_hcd_giveback_urb+0x396/0x450 drivers/usb/core/hcd.c:1734
 dummy_timer+0x17c3/0x38d0 drivers/usb/gadget/udc/dummy_hcd.c:1988
 __run_hrtimer kernel/time/hrtimer.c:1691 [inline]
 __hrtimer_run_queues+0x20c/0xcc0 kernel/time/hrtimer.c:1755
 hrtimer_run_softirq+0x17d/0x350 kernel/time/hrtimer.c:1772
 handle_softirqs+0x206/0x8d0 kernel/softirq.c:554
 __do_softirq kernel/softirq.c:588 [inline]
 invoke_softirq kernel/softirq.c:428 [inline]
 __irq_exit_rcu kernel/softirq.c:637 [inline]
 irq_exit_rcu+0xac/0x110 kernel/softirq.c:649
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1037 [inline]
 sysvec_apic_timer_interrupt+0x90/0xb0 arch/x86/kernel/apic/apic.c:1037
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:preempt_count arch/x86/include/asm/preempt.h:26 [inline]
RIP: 0010:preempt_count_sub+0x48/0x160 kernel/sched/core.c:5810
Code: 48 c1 e9 03 83 c0 03 0f b6 14 11 38 d0 7c 08 84 d2 0f 85 df 00 00 00 8b 0d 65 ff 21 12 85 c9 75 1b 65 8b 05 e2 d9 db 7e 89 c2 <81> e2 ff ff ff 7f 39 d3 7f 17 81 fb fe 00 00 00 76 71 f7 db 65 01
RSP: 0018:ffffc900017d74e8 EFLAGS: 00000246
RAX: 0000000080000001 RBX: 0000000000000001 RCX: 0000000000000000
RDX: 0000000080000001 RSI: 0000000000000001 RDI: 0000000000000001
RBP: ffffc900017d0000 R08: ffffc900017d759c R09: ffffffff8ab27d4c
R10: ffffc900017d7568 R11: 000000000000419c R12: ffffc900017d75b8
R13: ffffc900017d7568 R14: ffffc900017d7698 R15: ffffc900017d7690
 unwind_next_frame+0xe5d/0x20c0 arch/x86/kernel/unwind_orc.c:672
 arch_stack_walk+0x95/0x100 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x95/0xd0 kernel/stacktrace.c:122
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:579
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x37/0x50 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:230 [inline]
 slab_free_hook mm/slub.c:2343 [inline]
 slab_free mm/slub.c:4580 [inline]
 kfree+0x130/0x480 mm/slub.c:4728
 skb_kfree_head net/core/skbuff.c:1086 [inline]
 skb_free_head+0x108/0x1d0 net/core/skbuff.c:1098
 skb_release_data+0x760/0x910 net/core/skbuff.c:1125
 skb_release_all net/core/skbuff.c:1190 [inline]
 __kfree_skb net/core/skbuff.c:1204 [inline]
 consume_skb net/core/skbuff.c:1436 [inline]
 consume_skb+0xbf/0x100 net/core/skbuff.c:1430
 __unix_dgram_recvmsg+0x81c/0xdd0 net/unix/af_unix.c:2520
 unix_dgram_recvmsg+0xd0/0x110 net/unix/af_unix.c:2537
 sock_recvmsg_nosec net/socket.c:1052 [inline]
 sock_recvmsg+0x1f6/0x250 net/socket.c:1074
 sock_read_iter+0x2bb/0x3b0 net/socket.c:1144
 new_sync_read fs/read_write.c:488 [inline]
 vfs_read+0xa3b/0xbd0 fs/read_write.c:569
 ksys_read+0x1fa/0x260 fs/read_write.c:712
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcf951beb6a
Code: 00 3d 00 00 41 00 75 0d 50 48 8d 3d 2d 08 0a 00 e8 ea 7d 01 00 31 c0 e9 07 ff ff ff 64 8b 04 25 18 00 00 00 85 c0 75 1b 0f 05 <48> 3d 00 f0 ff ff 76 6c 48 8b 15 8f a2 0d 00 f7 d8 64 89 02 48 83
RSP: 002b:00007ffdca56fd88 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007fcf951beb6a
RDX: 00000000000000ff RSI: 0000562251bd6300 RDI: 0000000000000000
RBP: 0000562251bd62c0 R08: 0000000000000001 R09: 0000000000000000
R10: 00007fcf9535d3a3 R11: 0000000000000246 R12: 0000562251bd634e
R13: 0000562251bd6300 R14: 0000000000000000 R15: 00007fcf953a1a80
 </TASK>
task:acpid           state:S stack:25632 pid:2534  tgid:2534  ppid:1      flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 schedule_hrtimeout_range_clock+0x369/0x3b0 kernel/time/hrtimer.c:2272
 poll_schedule_timeout.constprop.0+0xba/0x190 fs/select.c:241
 do_select+0x12ec/0x17b0 fs/select.c:604
 core_sys_select+0x459/0xb80 fs/select.c:678
 do_pselect.constprop.0+0x1a0/0x1f0 fs/select.c:760
 __do_sys_pselect6 fs/select.c:803 [inline]
 __se_sys_pselect6 fs/select.c:794 [inline]
 __x64_sys_pselect6+0x183/0x240 fs/select.c:794
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f839ac9a591
RSP: 002b:00007ffcd37dd2a0 EFLAGS: 00000246 ORIG_RAX: 000000000000010e
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f839ac9a591
RDX: 0000000000000000 RSI: 00007ffcd37dd398 RDI: 000000000000000d
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000561b73137178 R14: 0000000000000000 R15: 000000000000000c
 </TASK>
task:klogd           state:S stack:25408 pid:2538  tgid:2538  ppid:1      flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 schedule_timeout+0x258/0x2a0 kernel/time/timer.c:2591
 unix_wait_for_peer+0x247/0x280 net/unix/af_unix.c:1529
 unix_dgram_sendmsg+0x1749/0x1920 net/unix/af_unix.c:2131
 sock_sendmsg_nosec net/socket.c:730 [inline]
 __sock_sendmsg net/socket.c:745 [inline]
 __sys_sendto+0x479/0x4d0 net/socket.c:2210
 __do_sys_sendto net/socket.c:2222 [inline]
 __se_sys_sendto net/socket.c:2218 [inline]
 __x64_sys_sendto+0xe0/0x1c0 net/socket.c:2218
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f3477ce19b5
RSP: 002b:00007ffce3032a98 EFLAGS: 00000246 ORIG_RAX: 000000000000002c
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f3477ce19b5
RDX: 0000000000000051 RSI: 000055d1c9ea0ba0 RDI: 0000000000000003
RBP: 000055d1c9e9a2c0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000004000 R11: 0000000000000246 R12: 0000000000000013
R13: 00007f3477e6f212 R14: 00007ffce3032b98 R15: 0000000000000000
 </TASK>
task:udevd           state:S stack:26944 pid:2549  tgid:2549  ppid:1      flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 schedule_hrtimeout_range_clock+0x369/0x3b0 kernel/time/hrtimer.c:2272
 ep_poll fs/eventpoll.c:2062 [inline]
 do_epoll_wait+0x139b/0x1a90 fs/eventpoll.c:2459
 __do_sys_epoll_wait fs/eventpoll.c:2471 [inline]
 __se_sys_epoll_wait fs/eventpoll.c:2466 [inline]
 __x64_sys_epoll_wait+0x194/0x290 fs/eventpoll.c:2466
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f11f08d4457
RSP: 002b:00007ffdd06cb0c8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e8
RAX: ffffffffffffffda RBX: 00007ffdd06cb1c8 RCX: 00007f11f08d4457
RDX: 0000000000000008 RSI: 00007ffdd06cb1c8 RDI: 000000000000000b
RBP: 000055b99ed65450 R08: 0000000000000007 R09: 232ec8ace83fa83e
R10: 00000000ffffffff R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
task:dbus-daemon     state:S stack:28032 pid:2571  tgid:2571  ppid:1      flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 schedule_hrtimeout_range_clock+0x369/0x3b0 kernel/time/hrtimer.c:2272
 ep_poll fs/eventpoll.c:2062 [inline]
 do_epoll_wait+0x139b/0x1a90 fs/eventpoll.c:2459
 __do_sys_epoll_wait fs/eventpoll.c:2471 [inline]
 __se_sys_epoll_wait fs/eventpoll.c:2466 [inline]
 __x64_sys_epoll_wait+0x194/0x290 fs/eventpoll.c:2466
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f25dbbb0457
RSP: 002b:00007fff8bc0b4f8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e8
RAX: ffffffffffffffda RBX: 00007fff8bc0b508 RCX: 00007f25dbbb0457
RDX: 0000000000000040 RSI: 00007fff8bc0b508 RDI: 0000000000000003
RBP: 00007fff8bc0b898 R08: 0000000000000ade R09: 00007f25dbd25080
R10: 00000000ffffffff R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007fff8bc0b898 R15: 00007fff8bc0bba8
 </TASK>
task:dhcpcd          state:S stack:25984 pid:2586  tgid:2586  ppid:1      flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 schedule_hrtimeout_range_clock+0x272/0x3b0 kernel/time/hrtimer.c:2281
 poll_schedule_timeout.constprop.0+0xba/0x190 fs/select.c:241
 do_poll fs/select.c:964 [inline]
 do_sys_poll+0xad5/0xde0 fs/select.c:1015
 __do_sys_ppoll fs/select.c:1121 [inline]
 __se_sys_ppoll fs/select.c:1101 [inline]
 __x64_sys_ppoll+0x25a/0x2d0 fs/select.c:1101
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4d0b7e1ad5
RSP: 002b:00007fff2bfa5270 EFLAGS: 00000246 ORIG_RAX: 000000000000010f
RAX: ffffffffffffffda RBX: 00005580815e6ee0 RCX: 00007f4d0b7e1ad5
RDX: 00007fff2bfa5290 RSI: 0000000000000004 RDI: 00005580815f0e70
RBP: 00007fff2bfa55c0 R08: 0000000000000008 R09: 00007f4d0b8ca080
R10: 00007fff2bfa55c0 R11: 0000000000000246 R12: 00007fff2bfa52b8
R13: 000055807a005610 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
task:dhcpcd          state:S stack:25008 pid:2587  tgid:2587  ppid:2586   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 schedule_hrtimeout_range_clock+0x369/0x3b0 kernel/time/hrtimer.c:2272
 poll_schedule_timeout.constprop.0+0xba/0x190 fs/select.c:241
 do_poll fs/select.c:964 [inline]
 do_sys_poll+0xad5/0xde0 fs/select.c:1015
 __do_sys_ppoll fs/select.c:1121 [inline]
 __se_sys_ppoll fs/select.c:1101 [inline]
 __x64_sys_ppoll+0x25a/0x2d0 fs/select.c:1101
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4d0b7e1ad5
RSP: 002b:00007fff2bfa5270 EFLAGS: 00000246 ORIG_RAX: 000000000000010f
RAX: ffffffffffffffda RBX: 00005580815e6ee0 RCX: 00007f4d0b7e1ad5
RDX: 0000000000000000 RSI: 0000000000000003 RDI: 00005580815e6ec0
RBP: 00007fff2bfa55c0 R08: 0000000000000008 R09: cdb04e69bddb7801
R10: 00007fff2bfa55c0 R11: 0000000000000246 R12: 0000000000000000
R13: 000055807a005610 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
task:dhcpcd          state:S stack:27984 pid:2588  tgid:2588  ppid:2586   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 schedule_hrtimeout_range_clock+0x369/0x3b0 kernel/time/hrtimer.c:2272
 poll_schedule_timeout.constprop.0+0xba/0x190 fs/select.c:241
 do_poll fs/select.c:964 [inline]
 do_sys_poll+0xad5/0xde0 fs/select.c:1015
 __do_sys_ppoll fs/select.c:1121 [inline]
 __se_sys_ppoll fs/select.c:1101 [inline]
 __x64_sys_ppoll+0x25a/0x2d0 fs/select.c:1101
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4d0b7e1ad5
RSP: 002b:00007fff2bfa5270 EFLAGS: 00000246 ORIG_RAX: 000000000000010f
RAX: ffffffffffffffda RBX: 00005580815e6ee0 RCX: 00007f4d0b7e1ad5
RDX: 0000000000000000 RSI: 0000000000000004 RDI: 00005580815effe0
RBP: 00007fff2bfa55c0 R08: 0000000000000008 R09: 000055807a0053d0
R10: 00007fff2bfa55c0 R11: 0000000000000246 R12: 0000000000000000
R13: 000055807a005610 R14: 0000000000000003 R15: 0000000000000000
 </TASK>
task:dhcpcd          state:S stack:27504 pid:2589  tgid:2589  ppid:2586   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 schedule_hrtimeout_range_clock+0x369/0x3b0 kernel/time/hrtimer.c:2272
 poll_schedule_timeout.constprop.0+0xba/0x190 fs/select.c:241
 do_poll fs/select.c:964 [inline]
 do_sys_poll+0xad5/0xde0 fs/select.c:1015
 __do_sys_ppoll fs/select.c:1121 [inline]
 __se_sys_ppoll fs/select.c:1101 [inline]
 __x64_sys_ppoll+0x25a/0x2d0 fs/select.c:1101
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4d0b7e1ad5
RSP: 002b:00007fff2bfa5270 EFLAGS: 00000246 ORIG_RAX: 000000000000010f
RAX: ffffffffffffffda RBX: 00005580815e6ee0 RCX: 00007f4d0b7e1ad5
RDX: 0000000000000000 RSI: 0000000000000005 RDI: 00005580815effe0
RBP: 00007fff2bfa55c0 R08: 0000000000000008 R09: 000055807a0053d0
R10: 00007fff2bfa55c0 R11: 0000000000000246 R12: 0000000000000000
R13: 000055807a005610 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
task:dhcpcd          state:S stack:26432 pid:2605  tgid:2605  ppid:2587   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 schedule_hrtimeout_range_clock+0x369/0x3b0 kernel/time/hrtimer.c:2272
 poll_schedule_timeout.constprop.0+0xba/0x190 fs/select.c:241
 do_poll fs/select.c:964 [inline]
 do_sys_poll+0xad5/0xde0 fs/select.c:1015
 __do_sys_ppoll fs/select.c:1121 [inline]
 __se_sys_ppoll fs/select.c:1101 [inline]
 __x64_sys_ppoll+0x25a/0x2d0 fs/select.c:1101
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4d0b7e1ad5
RSP: 002b:00007fff2bfa5270 EFLAGS: 00000246 ORIG_RAX: 000000000000010f
RAX: ffffffffffffffda RBX: 00005580815e6ee0 RCX: 00007f4d0b7e1ad5
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 00005580815f1d50
RBP: 00007fff2bfa55c0 R08: 0000000000000008 R09: 0000000000000000
R10: 00007fff2bfa55c0 R11: 0000000000000246 R12: 0000000000000000
R13: 000055807a005610 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
task:sshd            state:S stack:27008 pid:2607  tgid:2607  ppid:1      flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 schedule_hrtimeout_range_clock+0x369/0x3b0 kernel/time/hrtimer.c:2272
 poll_schedule_timeout.constprop.0+0xba/0x190 fs/select.c:241
 do_poll fs/select.c:964 [inline]
 do_sys_poll+0xad5/0xde0 fs/select.c:1015
 __do_sys_ppoll fs/select.c:1121 [inline]
 __se_sys_ppoll fs/select.c:1101 [inline]
 __x64_sys_ppoll+0x25a/0x2d0 fs/select.c:1101
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f03144f9ad5
RSP: 002b:00007ffe0e04e310 EFLAGS: 00000246 ORIG_RAX: 000000000000010f
RAX: ffffffffffffffda RBX: 0000558b914d9ab0 RCX: 00007f03144f9ad5
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000558b914df490
RBP: 0000000000000064 R08: 0000000000000008 R09: 0000000000000000
R10: 00007ffe0e04e4c8 R11: 0000000000000246 R12: 0000558b914df490
R13: 00007ffe0e04e4c8 R14: 0000000000000002 R15: 0000558b914dab0c
 </TASK>
task:getty           state:S stack:25408 pid:2609  tgid:2609  ppid:1      flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 schedule_timeout+0x258/0x2a0 kernel/time/timer.c:2591
 wait_woken+0x175/0x1c0 kernel/sched/wait.c:423
 n_tty_read+0x10fb/0x1480 drivers/tty/n_tty.c:2277
 iterate_tty_read drivers/tty/tty_io.c:859 [inline]
 tty_read+0x30e/0x5b0 drivers/tty/tty_io.c:934
 new_sync_read fs/read_write.c:488 [inline]
 vfs_read+0x86e/0xbd0 fs/read_write.c:569
 ksys_read+0x12f/0x260 fs/read_write.c:712
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f518ffecb6a
RSP: 002b:00007ffd9e076a58 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 0000559c5c7592c0 RCX: 00007f518ffecb6a
RDX: 0000000000000001 RSI: 00007ffd9e076a70 RDI: 0000000000000000
RBP: 0000559c5c759320 R08: 0000000000000000 R09: e023360b5e23a721
R10: 0000000000000010 R11: 0000000000000246 R12: 0000559c5c75935c
R13: 00007ffd9e076a70 R14: 0000000000000000 R15: 0000559c5c75935c
 </TASK>
task:sshd            state:S stack:25408 pid:2648  tgid:2648  ppid:2607   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 schedule_hrtimeout_range_clock+0x272/0x3b0 kernel/time/hrtimer.c:2281
 poll_schedule_timeout.constprop.0+0xba/0x190 fs/select.c:241
 do_poll fs/select.c:964 [inline]
 do_sys_poll+0xad5/0xde0 fs/select.c:1015
 __do_sys_ppoll fs/select.c:1121 [inline]
 __se_sys_ppoll fs/select.c:1101 [inline]
 __x64_sys_ppoll+0x25a/0x2d0 fs/select.c:1101
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8981f9ead5
RSP: 002b:00007ffeacbe5240 EFLAGS: 00000246 ORIG_RAX: 000000000000010f
RAX: ffffffffffffffda RBX: 00000000000668a0 RCX: 00007f8981f9ead5
RDX: 00007ffeacbe5260 RSI: 0000000000000004 RDI: 000055c9f23b3b00
RBP: 000055c9f23b25c0 R08: 0000000000000008 R09: 0000000000000000
R10: 00007ffeacbe5348 R11: 0000000000000246 R12: 000055c9f1ccaaa4
R13: 0000000000000001 R14: 000055c9f1ccb3e8 R15: 00007ffeacbe52c8
 </TASK>
task:syz-execprog    state:S stack:25376 pid:2650  tgid:2650  ppid:2648   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 do_wait+0x1dd/0x570 kernel/exit.c:1697
 kernel_waitid+0x116/0x180 kernel/exit.c:1775
 __do_sys_waitid+0x212/0x250 kernel/exit.c:1788
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x40714e
RSP: 002b:000000c000077d60 EFLAGS: 00000212 ORIG_RAX: 00000000000000f7
RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 000000000040714e
RDX: 000000c000077e48 RSI: 0000000000000a5f RDI: 0000000000000001
RBP: 000000c000077da0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000001000004 R11: 0000000000000212 R12: 000000c000077e90
R13: 0000000000000000 R14: 000000c001cbb880 R15: 0000000000000001
 </TASK>
task:syz-execprog    state:S stack:27856 pid:2651  tgid:2650  ppid:2648   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 futex_wait_queue+0xfc/0x1f0 kernel/futex/waitwake.c:370
 __futex_wait+0x291/0x3c0 kernel/futex/waitwake.c:669
 futex_wait+0xe9/0x380 kernel/futex/waitwake.c:697
 do_futex+0x22b/0x350 kernel/futex/syscalls.c:102
 __do_sys_futex kernel/futex/syscalls.c:179 [inline]
 __se_sys_futex kernel/futex/syscalls.c:160 [inline]
 __x64_sys_futex+0x1e1/0x4c0 kernel/futex/syscalls.c:160
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x476403
RSP: 002b:000000c000061e80 EFLAGS: 00000202 ORIG_RAX: 00000000000000ca
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000476403
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 000000000403c0a0
RBP: 000000c000061ec8 R08: 0000000000000000 R09: 0000000000000000
R10: 000000c000061eb8 R11: 0000000000000202 R12: 000000c000061eb8
R13: 000000c00007e008 R14: 000000c000006540 R15: 0fffffffffffffff
 </TASK>
task:syz-execprog    state:S stack:26224 pid:2652  tgid:2650  ppid:2648   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 futex_wait_queue+0xfc/0x1f0 kernel/futex/waitwake.c:370
 __futex_wait+0x291/0x3c0 kernel/futex/waitwake.c:669
 futex_wait+0xe9/0x380 kernel/futex/waitwake.c:697
 do_futex+0x22b/0x350 kernel/futex/syscalls.c:102
 __do_sys_futex kernel/futex/syscalls.c:179 [inline]
 __se_sys_futex kernel/futex/syscalls.c:160 [inline]
 __x64_sys_futex+0x1e1/0x4c0 kernel/futex/syscalls.c:160
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x476403
RSP: 002b:000000c000097cf8 EFLAGS: 00000286 ORIG_RAX: 00000000000000ca
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000476403
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 000000c00007e948
RBP: 000000c000097d40 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000286 R12: 0000000000000020
R13: 0000000000000001 R14: 000000c0000068c0 R15: 0000000000000001
 </TASK>
task:syz-execprog    state:S stack:27360 pid:2653  tgid:2650  ppid:2648   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 futex_wait_queue+0xfc/0x1f0 kernel/futex/waitwake.c:370
 __futex_wait+0x291/0x3c0 kernel/futex/waitwake.c:669
 futex_wait+0xe9/0x380 kernel/futex/waitwake.c:697
 do_futex+0x22b/0x350 kernel/futex/syscalls.c:102
 __do_sys_futex kernel/futex/syscalls.c:179 [inline]
 __se_sys_futex kernel/futex/syscalls.c:160 [inline]
 __x64_sys_futex+0x1e1/0x4c0 kernel/futex/syscalls.c:160
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x476403
RSP: 002b:000000c000093e48 EFLAGS: 00000286 ORIG_RAX: 00000000000000ca
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000476403
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 000000c00007f148
RBP: 000000c000093e90 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000286 R12: 00000000004483a0
R13: 000000c000079f94 R14: 000000c000006c40 R15: 0007ffffffffffff
 </TASK>
task:syz-execprog    state:S stack:27360 pid:2654  tgid:2650  ppid:2648   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 futex_wait_queue+0xfc/0x1f0 kernel/futex/waitwake.c:370
 __futex_wait+0x291/0x3c0 kernel/futex/waitwake.c:669
 futex_wait+0xe9/0x380 kernel/futex/waitwake.c:697
 do_futex+0x22b/0x350 kernel/futex/syscalls.c:102
 __do_sys_futex kernel/futex/syscalls.c:179 [inline]
 __se_sys_futex kernel/futex/syscalls.c:160 [inline]
 __x64_sys_futex+0x1e1/0x4c0 kernel/futex/syscalls.c:160
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x476403
RSP: 002b:000000c00007a6e0 EFLAGS: 00000286 ORIG_RAX: 00000000000000ca
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000476403
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00000000040af7e0
RBP: 000000c00007a728 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000286 R12: 00000000004726a0
R13: 000000c000d7f808 R14: 000000c001f381c0 R15: 0fffffffffffffff
 </TASK>
task:syz-execprog    state:S stack:28992 pid:2656  tgid:2650  ppid:2648   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 futex_wait_queue+0xfc/0x1f0 kernel/futex/waitwake.c:370
 __futex_wait+0x291/0x3c0 kernel/futex/waitwake.c:669
 futex_wait+0xe9/0x380 kernel/futex/waitwake.c:697
 do_futex+0x22b/0x350 kernel/futex/syscalls.c:102
 __do_sys_futex kernel/futex/syscalls.c:179 [inline]
 __se_sys_futex kernel/futex/syscalls.c:160 [inline]
 __x64_sys_futex+0x1e1/0x4c0 kernel/futex/syscalls.c:160
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x476403
RSP: 002b:000000c0014b5ef0 EFLAGS: 00000286 ORIG_RAX: 00000000000000ca
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000476403
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00000000040af658
RBP: 000000c0014b5f38 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000286 R12: 00000000004726a0
R13: 000000c000d7f008 R14: 000000c001f38000 R15: 00003fffffffffff
 </TASK>
task:syz-execprog    state:S stack:26000 pid:2657  tgid:2650  ppid:2648   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 schedule_hrtimeout_range_clock+0x272/0x3b0 kernel/time/hrtimer.c:2281
 ep_poll fs/eventpoll.c:2062 [inline]
 do_epoll_wait+0x139b/0x1a90 fs/eventpoll.c:2459
 do_compat_epoll_pwait.part.0+0x26/0x1d0 fs/eventpoll.c:2493
 do_epoll_pwait fs/eventpoll.c:2500 [inline]
 __do_sys_epoll_pwait fs/eventpoll.c:2506 [inline]
 __se_sys_epoll_pwait fs/eventpoll.c:2500 [inline]
 __x64_sys_epoll_pwait+0x20c/0x330 fs/eventpoll.c:2500
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x40714e
RSP: 002b:000000c001f556d0 EFLAGS: 00000246 ORIG_RAX: 0000000000000119
RAX: ffffffffffffffda RBX: 0000000000000004 RCX: 000000000040714e
RDX: 0000000000000080 RSI: 000000c001f55774 RDI: 0000000000000004
RBP: 000000c001f55718 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000000002d4 R11: 0000000000000246 R12: 000000c001f557a8
R13: 0000000000000001 R14: 000000c001f38540 R15: 0000000000000001
 </TASK>
task:syz-execprog    state:S stack:26800 pid:2658  tgid:2650  ppid:2648   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 futex_wait_queue+0xfc/0x1f0 kernel/futex/waitwake.c:370
 __futex_wait+0x291/0x3c0 kernel/futex/waitwake.c:669
 futex_wait+0xe9/0x380 kernel/futex/waitwake.c:697
 do_futex+0x22b/0x350 kernel/futex/syscalls.c:102
 __do_sys_futex kernel/futex/syscalls.c:179 [inline]
 __se_sys_futex kernel/futex/syscalls.c:160 [inline]
 __x64_sys_futex+0x1e1/0x4c0 kernel/futex/syscalls.c:160
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x476403
RSP: 002b:000000c002507cf8 EFLAGS: 00000286 ORIG_RAX: 00000000000000ca
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 0000000000476403
RDX: 0000000000000000 RSI: 0000000000000080 RDI: 000000c0024ec148
RBP: 000000c002507d40 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000286 R12: 000000c000066008
R13: 0000000000000001 R14: 000000c0024b7340 R15: 0000000000000001
 </TASK>
task:syz-executor    state:D stack:23472 pid:2655  tgid:2655  ppid:2653   flags:0x00000002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 io_schedule+0xbf/0x130 kernel/sched/core.c:7552
 bit_wait_io+0x15/0xe0 kernel/sched/wait_bit.c:209
 __wait_on_bit+0x62/0x180 kernel/sched/wait_bit.c:49
 out_of_line_wait_on_bit+0xda/0x110 kernel/sched/wait_bit.c:64
 wait_on_bit_io include/linux/wait_bit.h:101 [inline]
 do_get_write_access+0x933/0x1270 fs/jbd2/transaction.c:1096
 jbd2_journal_get_write_access+0x1d6/0x280 fs/jbd2/transaction.c:1245
 __ext4_journal_get_write_access+0x6a/0x390 fs/ext4/ext4_jbd2.c:239
 ext4_reserve_inode_write+0x13b/0x270 fs/ext4/inode.c:5773
 __ext4_mark_inode_dirty+0x1a6/0x890 fs/ext4/inode.c:5947
 ext4_dirty_inode+0xd9/0x130 fs/ext4/inode.c:5984
 __mark_inode_dirty+0x1f6/0xe60 fs/fs-writeback.c:2493
 generic_update_time+0xcf/0xf0 fs/inode.c:2041
 inode_update_time fs/inode.c:2054 [inline]
 __file_update_time fs/inode.c:2243 [inline]
 file_update_time+0x12e/0x160 fs/inode.c:2273
 ext4_page_mkwrite+0x368/0x1760 fs/ext4/inode.c:6102
 do_page_mkwrite+0x177/0x380 mm/memory.c:3162
 wp_page_shared mm/memory.c:3563 [inline]
 do_wp_page+0xaa0/0x3fa0 mm/memory.c:3713
 handle_pte_fault mm/memory.c:5767 [inline]
 __handle_mm_fault+0xd92/0x3390 mm/memory.c:5894
 handle_mm_fault+0x3fa/0xaa0 mm/memory.c:6062
 do_user_addr_fault+0x613/0x12c0 arch/x86/mm/fault.c:1338
 handle_page_fault arch/x86/mm/fault.c:1481 [inline]
 exc_page_fault+0x5c/0xc0 arch/x86/mm/fault.c:1539
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:623
RIP: 0033:0x7feb51416325
RSP: 002b:00007ffd10e33670 EFLAGS: 00010206
RAX: 00007feb4effffc0 RBX: 00007ffd10e33770 RCX: 0000000000000000
RDX: 00007feb4effffbc RSI: 0000000000000008 RDI: 00007ffd10e33770
RBP: 00000000000003e6 R08: 0000000000000000 R09: 0000000000000000
R10: 00007ffd10e33750 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000040 R14: ffffffffffffffc0 R15: 0000000000000040
 </TASK>
task:kworker/1:3     state:S stack:22144 pid:5468  tgid:5468  ppid:2      flags:0x00004000
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6824
 __mutex_lock_common kernel/locking/mutex.c:684 [inline]
 __mutex_lock+0x5b8/0x9c0 kernel/locking/mutex.c:752
 input_register_device+0x997/0x1140 drivers/input/input.c:2463
 hidinput_connect+0x1d9c/0x2ba0 drivers/hid/hid-input.c:2343
 hid_connect+0x13a8/0x18a0 drivers/hid/hid-core.c:2234
 hid_hw_start drivers/hid/hid-core.c:2349 [inline]
 hid_hw_start+0xaa/0x140 drivers/hid/hid-core.c:2340
 __hid_device_probe drivers/hid/hid-core.c:2703 [inline]
 hid_device_probe+0x3e7/0x490 drivers/hid/hid-core.c:2736
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:532
 device_add+0x114b/0x1a70 drivers/base/core.c:3682
 hid_add_device+0x37f/0xa70 drivers/hid/hid-core.c:2882
 usbhid_probe+0xd3b/0x1410 drivers/hid/usbhid/hid-core.c:1431
 usb_probe_interface+0x309/0x9d0 drivers/usb/core/driver.c:399
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:532
 device_add+0x114b/0x1a70 drivers/base/core.c:3682
 usb_set_configuration+0x10cb/0x1c50 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0xb1/0x110 drivers/usb/core/generic.c:254
 usb_probe_device+0xec/0x3e0 drivers/usb/core/driver.c:294
 call_driver_probe drivers/base/dd.c:579 [inline]
 really_probe+0x23e/0xa90 drivers/base/dd.c:658
 __driver_probe_device+0x1de/0x440 drivers/base/dd.c:800
 driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:830
 __device_attach_driver+0x1df/0x310 drivers/base/dd.c:958
 bus_for_each_drv+0x157/0x1e0 drivers/base/bus.c:457
 __device_attach+0x1e8/0x4b0 drivers/base/dd.c:1030
 bus_probe_device+0x17f/0x1c0 drivers/base/bus.c:532
 device_add+0x114b/0x1a70 drivers/base/core.c:3682
 usb_new_device+0xd90/0x1a10 drivers/usb/core/hub.c:2651
 hub_port_connect drivers/usb/core/hub.c:5521 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x2e58/0x4f40 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/1:4     state:I stack:22960 pid:5492  tgid:5492  ppid:2      flags:0x00004000
Workqueue:  0x0 (events)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 worker_thread+0x2de/0xf00 kernel/workqueue.c:3406
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/1:5     state:I stack:29168 pid:5504  tgid:5504  ppid:2      flags:0x00004000
Workqueue:  0x0 (events)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 worker_thread+0x2de/0xf00 kernel/workqueue.c:3406
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/0:3     state:D stack:26384 pid:5514  tgid:5514  ppid:2      flags:0x00004000
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 schedule_timeout+0x258/0x2a0 kernel/time/timer.c:2591
 ___down_common kernel/locking/semaphore.c:225 [inline]
 __down_common+0x32d/0x730 kernel/locking/semaphore.c:246
 down+0x74/0xa0 kernel/locking/semaphore.c:63
 hid_device_remove+0x29/0x260 drivers/hid/hid-core.c:2749
 device_remove+0xc8/0x170 drivers/base/dd.c:567
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1296
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:574
 device_del+0x396/0x9f0 drivers/base/core.c:3871
 hid_remove_device drivers/hid/hid-core.c:2939 [inline]
 hid_destroy_device+0xe5/0x150 drivers/hid/hid-core.c:2959
 usbhid_disconnect+0xa0/0xe0 drivers/hid/usbhid/hid-core.c:1458
 usb_unbind_interface+0x1e8/0x970 drivers/usb/core/driver.c:461
 device_remove drivers/base/dd.c:569 [inline]
 device_remove+0x122/0x170 drivers/base/dd.c:561
 __device_release_driver drivers/base/dd.c:1273 [inline]
 device_release_driver_internal+0x44a/0x610 drivers/base/dd.c:1296
 bus_remove_device+0x22f/0x420 drivers/base/bus.c:574
 device_del+0x396/0x9f0 drivers/base/core.c:3871
 usb_disable_device+0x36c/0x7f0 drivers/usb/core/message.c:1418
 usb_disconnect+0x2e1/0x920 drivers/usb/core/hub.c:2304
 hub_port_connect drivers/usb/core/hub.c:5361 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]
 port_event drivers/usb/core/hub.c:5821 [inline]
 hub_event+0x1bed/0x4f40 drivers/usb/core/hub.c:5903
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/0:4     state:I stack:21632 pid:5518  tgid:5518  ppid:2      flags:0x00004000
Workqueue:  0x0 (events)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 worker_thread+0x2de/0xf00 kernel/workqueue.c:3406
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:kworker/0:5     state:I stack:29296 pid:7809  tgid:7809  ppid:2      flags:0x00004000
Workqueue:  0x0 (events)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 worker_thread+0x2de/0xf00 kernel/workqueue.c:3406
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
task:syz-executor    state:S stack:26128 pid:10094 tgid:10094 ppid:2655   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 do_wait+0x1dd/0x570 kernel/exit.c:1697
 kernel_wait4+0x16c/0x280 kernel/exit.c:1851
 __do_sys_wait4+0x15f/0x170 kernel/exit.c:1879
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcf20b24153
RSP: 002b:00007fffd61a9cf8 EFLAGS: 00000202 ORIG_RAX: 000000000000003d
RAX: ffffffffffffffda RBX: 0000000000002774 RCX: 00007fcf20b24153
RDX: 0000000040000000 RSI: 00007fffd61a9d0c RDI: 00000000ffffffff
RBP: 00007fffd61a9d0c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007fffd61a9d90
R13: 00007fffd61a9d98 R14: 0000000000000009 R15: 0000000000000000
 </TASK>
task:syz-executor    state:S stack:24304 pid:10095 tgid:10095 ppid:2655   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 do_wait+0x1dd/0x570 kernel/exit.c:1697
 kernel_wait4+0x16c/0x280 kernel/exit.c:1851
 __do_sys_wait4+0x15f/0x170 kernel/exit.c:1879
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fb981164153
RSP: 002b:00007ffc55da18b8 EFLAGS: 00000202 ORIG_RAX: 000000000000003d
RAX: ffffffffffffffda RBX: 0000000000002777 RCX: 00007fb981164153
RDX: 0000000040000000 RSI: 00007ffc55da18cc RDI: 00000000ffffffff
RBP: 00007ffc55da18cc R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffc55da1950
R13: 00007ffc55da1958 R14: 0000000000000009 R15: 0000000000000000
 </TASK>
task:syz-executor    state:S stack:26128 pid:10096 tgid:10096 ppid:2655   flags:0x00000000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 do_wait+0x1dd/0x570 kernel/exit.c:1697
 kernel_wait4+0x16c/0x280 kernel/exit.c:1851
 __do_sys_wait4+0x15f/0x170 kernel/exit.c:1879
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f5b00ed4153
RSP: 002b:00007ffe9a0e6a68 EFLAGS: 00000202 ORIG_RAX: 000000000000003d
RAX: ffffffffffffffda RBX: 0000000000002778 RCX: 00007f5b00ed4153
RDX: 0000000040000000 RSI: 00007ffe9a0e6a7c RDI: 00000000ffffffff
RBP: 00007ffe9a0e6a7c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 00007ffe9a0e6b00
R13: 00007ffe9a0e6b08 R14: 0000000000000009 R15: 0000000000000000
 </TASK>
task:syz-executor    state:D stack:24096 pid:10097 tgid:10097 ppid:1      flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5315 [inline]
 __schedule+0x105f/0x34b0 kernel/sched/core.c:6675
 __schedule_loop kernel/sched/core.c:6752 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6767
 exp_funnel_lock+0x344/0x3b0 kernel/rcu/tree_exp.h:320
 synchronize_rcu_expedited+0x290/0x450 kernel/rcu/tree_exp.h:976


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

