Return-Path: <linux-input+bounces-13601-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F3329B0B664
	for <lists+linux-input@lfdr.de>; Sun, 20 Jul 2025 16:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 197F716D993
	for <lists+linux-input@lfdr.de>; Sun, 20 Jul 2025 14:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C32851F1905;
	Sun, 20 Jul 2025 14:21:36 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EFF1C84D5
	for <linux-input@vger.kernel.org>; Sun, 20 Jul 2025 14:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753021296; cv=none; b=tCv/OiIhqiTY4rLztJ39kVmovmj59FAxznqdLEb4PXmMpYFX5tjcOPSDCzb1gHW83wpMsHeqVQzDPnQiQStBy4wYda6tXYnhcvK6eWjDRmz867Y9oYCKI6Et/IICcj6MCZNLSGoBSNbjnzPO/KFmXHO4JiwlR9i4SxaujU45AOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753021296; c=relaxed/simple;
	bh=jGqSMWfVCWbvO7pOAX7EnxtVOJS7LgkKfhnfHb91QhI=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=nfvGITQRSpfiP5eIwPghCUzsoi6RoqikuU6hoqDkFHVfX0NY/mCiW8ueYH6UWVlDksKF/ZuLcy9QjCm45FGAZIM1hZq3mxRS3rsFteRF5o7riTXvlHGPpnh6vUNKuHM5TYSlFFtm8wc4WLKOLhmSHbn5FsWNoTwHXAqueikzFF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3ddd90ca184so29085805ab.0
        for <linux-input@vger.kernel.org>; Sun, 20 Jul 2025 07:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753021294; x=1753626094;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=doRxomfqBH0p94N9ZVcvScde9n0lWRIqD5rJskXu700=;
        b=STqXXeUUFbTl7w57g1XoI7/4IAAwbhzXfyF3UAWFRXn/oyvAEYWAeAar5gFRTq7HXb
         xdHYFUY0KyaHxnbc3qGqZcEZifQX+JXx1TM10NsugBxQ23i3wZIQSWI/q8rPjZMY57d3
         FknOWrPxdII/d/0bEeaWTSSZnGDySrStCuOPsXQ7DrRxq4fioOlUGdaO8sJY22JdHVSv
         Ojl0mHPVN4a+/1KvzKsDDXVLLOFd+90I2eQsecH5DByAot7KvXQAHFjXacA/c91Lv2BX
         nM5grjPwOW02H4f0QU9CGla+7xQBrSEJVfFAfAVGBgv/v3TRdxMCw7BDIwEe4cnR8efS
         Gtrg==
X-Forwarded-Encrypted: i=1; AJvYcCUVaQIqWX9+fc1yngoHiSmYznoMqlWVdJ0l8aifiJ9lv1nsfGBLfNvJqXaSuf9jGR3u5TT374GpelLAkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkrwqcoOznndCOVe/mpETiFe2SK2Fg+4CoDvbG71sKLkz/y2yo
	O4O0Ee9zkn7nfMJp213UiLDYhCFm4yUSGMmMlW6I4ttfG2u9GagxRVM1vy0QqTTRs6pfxMYPOoY
	+GRItquIXGcisFinWNM0BvkyqK+ACxrAUzznGxtbB2PQTti5ZzGpIKs/mDAU=
X-Google-Smtp-Source: AGHT+IEJLIi+IIYj3KzzID8YOIG36MoEPsHgu8SSNrepT+CrAI/C82fx6Jx2/cB/WtmSXN76ZPuYBJupobp1udqROywxYvBSmg0f
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1786:b0:3e2:99f3:9c5f with SMTP id
 e9e14a558f8ab-3e299f39ddbmr83612455ab.9.1753021293917; Sun, 20 Jul 2025
 07:21:33 -0700 (PDT)
Date: Sun, 20 Jul 2025 07:21:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <687cfb6d.a70a0220.693ce.00c6.GAE@google.com>
Subject: [syzbot] [mm?] [input?] [usb?] INFO: rcu detected stall in devtmpfsd (3)
From: syzbot <syzbot+5583f599fe40b819b3e7@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, hannes@cmpxchg.org, jackmanb@google.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-usb@vger.kernel.org, mhocko@suse.com, surenb@google.com, 
	syzkaller-bugs@googlegroups.com, vbabka@suse.cz, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    155a3c003e55 Merge tag 'for-6.16/dm-fixes-2' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15d3658c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f62a2ef17395702a
dashboard link: https://syzkaller.appspot.com/bug?extid=5583f599fe40b819b3e7
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1096f58c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1686a382580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7ec1d423e273/disk-155a3c00.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4973873f0aff/vmlinux-155a3c00.xz
kernel image: https://storage.googleapis.com/syzbot-assets/76c8269d9f02/bzImage-155a3c00.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5583f599fe40b819b3e7@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
rcu: 	Tasks blocked on level-0 rcu_node (CPUs 0-1):
 P26/1:b.el
 P3584/2:b..l

rcu: 	(detected by 0, t=10502 jiffies, g=13645, q=1327 ncpus=2)
task:kworker/1:2     state:R
  running task     stack:19608 pid:3584  tgid:3584  ppid:2      task_flags:0x4208060 flags:0x00004000
Workqueue: mld mld_dad_work

Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5397 [inline]
 __schedule+0x16f5/0x4d00 kernel/sched/core.c:6786
 preempt_schedule_notrace+0xd1/0x110 kernel/sched/core.c:7059
 preempt_schedule_notrace_thunk+0x16/0x30 arch/x86/entry/thunk.S:13
 rcu_is_watching+0x7f/0xb0 kernel/rcu/tree.c:746
 trace_lock_release include/trace/events/lock.h:69 [inline]
 lock_release+0x4b/0x3e0 kernel/locking/lockdep.c:5882
 rcu_lock_release include/linux/rcupdate.h:341 [inline]
 rcu_read_unlock include/linux/rcupdate.h:871 [inline]
 class_rcu_destructor include/linux/rcupdate.h:1155 [inline]
 unwind_next_frame+0x19a9/0x2390 arch/x86/kernel/unwind_orc.c:680
 arch_stack_walk+0x11c/0x150 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x9c/0xe0 kernel/stacktrace.c:122
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 unpoison_slab_object mm/kasan/common.c:319 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:345
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4148 [inline]
 slab_alloc_node mm/slub.c:4197 [inline]
 kmem_cache_alloc_noprof+0x1c1/0x3c0 mm/slub.c:4204
 dst_alloc+0x105/0x170 net/core/dst.c:89
 ip6_dst_alloc net/ipv6/route.c:342 [inline]
 icmp6_dst_alloc+0x75/0x420 net/ipv6/route.c:3324
 mld_sendpack+0x678/0xd80 net/ipv6/mcast.c:1857
 mld_dad_work+0x45/0x520 net/ipv6/mcast.c:2308
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
task:kdevtmpfs       state:R
  running task     stack:26216 pid:26    tgid:26    ppid:2      task_flags:0x208140 flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5397 [inline]
 __schedule+0x16f5/0x4d00 kernel/sched/core.c:6786
 preempt_schedule_irq+0xb5/0x150 kernel/sched/core.c:7109
 irqentry_exit+0x6f/0x90 kernel/entry/common.c:307
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
RIP: 0010:lock_acquire+0x175/0x360 kernel/locking/lockdep.c:5875
Code: 00 00 00 00 9c 8f 44 24 30 f7 44 24 30 00 02 00 00 0f 85 cd 00 00 00 f7 44 24 08 00 02 00 00 74 01 fb 65 48 8b 05 9b 13 02 11 <48> 3b 44 24 58 0f 85 f2 00 00 00 48 83 c4 60 5b 41 5c 41 5d 41 5e
RSP: 0018:ffffc90000a173b8 EFLAGS: 00000206

RAX: 520cf176917d9000 RBX: 0000000000000000 RCX: 520cf176917d9000
RDX: 0000000000000000 RSI: ffffffff8db869c3 RDI: ffffffff8be29d80
RBP: ffffffff8172aae5 R08: 0000000000000000 R09: ffffffff8172aae5
R10: ffffc90000a17578 R11: ffffffff81ad00a0 R12: 0000000000000002
R13: ffffffff8e13f0e0 R14: 0000000000000000 R15: 0000000000000246
 rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 rcu_read_lock include/linux/rcupdate.h:841 [inline]
 class_rcu_constructor include/linux/rcupdate.h:1155 [inline]
 unwind_next_frame+0xc2/0x2390 arch/x86/kernel/unwind_orc.c:479
 arch_stack_walk+0x11c/0x150 arch/x86/kernel/stacktrace.c:25
 stack_trace_save+0x9c/0xe0 kernel/stacktrace.c:122
 save_stack+0xf5/0x1f0 mm/page_owner.c:156
 __reset_page_owner+0x71/0x1f0 mm/page_owner.c:308
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1248 [inline]
 __free_frozen_pages+0xc71/0xe70 mm/page_alloc.c:2706
 __slab_free+0x326/0x400 mm/slub.c:4554
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x97/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4148 [inline]
 slab_alloc_node mm/slub.c:4197 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kmalloc_noprof+0x224/0x4f0 mm/slub.c:4340
 kmalloc_noprof include/linux/slab.h:909 [inline]
 kmalloc_array_noprof include/linux/slab.h:948 [inline]
 security_inode_init_security+0x107/0x3f0 security/security.c:1829
 shmem_mknod+0x1f6/0x3e0 mm/shmem.c:3851
 vfs_mknod+0x37f/0x3c0 fs/namei.c:4244
 handle_create drivers/base/devtmpfs.c:233 [inline]
 handle drivers/base/devtmpfs.c:389 [inline]
 devtmpfs_work_loop+0x98b/0xd20 drivers/base/devtmpfs.c:404
 devtmpfsd+0x4d/0x50 drivers/base/devtmpfs.c:446
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
rcu: rcu_preempt kthread starved for 3775 jiffies! g13645 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=0
rcu: 	Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.
rcu: RCU grace-period kthread stack dump:
task:rcu_preempt     state:R
  running task     stack:26792 pid:16    tgid:16    ppid:2      task_flags:0x208040 flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5397 [inline]
 __schedule+0x16f5/0x4d00 kernel/sched/core.c:6786
 __schedule_loop kernel/sched/core.c:6864 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:6879
 schedule_timeout+0x12b/0x270 kernel/time/sleep_timeout.c:99
 rcu_gp_fqs_loop+0x301/0x1540 kernel/rcu/tree.c:2054
 rcu_gp_kthread+0x99/0x390 kernel/rcu/tree.c:2256
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
rcu: Stack dump where RCU GP kthread last ran:
CPU: 0 UID: 0 PID: 6170 Comm: syz.1.17 Not tainted 6.16.0-rc6-syzkaller-00002-g155a3c003e55 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:csd_lock_wait kernel/smp.c:340 [inline]
RIP: 0010:smp_call_function_many_cond+0xf69/0x12d0 kernel/smp.c:885
Code: 00 45 8b 2f 44 89 ee 83 e6 01 31 ff e8 d0 78 0b 00 41 83 e5 01 49 bd 00 00 00 00 00 fc ff df 75 07 e8 7b 74 0b 00 eb 37 f3 90 <43> 0f b6 04 2c 84 c0 75 10 41 f7 07 01 00 00 00 74 1e e8 60 74 0b
RSP: 0018:ffffc90003aaf360 EFLAGS: 00000293

RAX: ffffffff81b4bf10 RBX: ffff8880b863b1c0 RCX: ffff88802b8b9e00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffffc90003aaf4c0 R08: ffffffff8fa1f5f7 R09: 1ffffffff1f43ebe
R10: dffffc0000000000 R11: fffffbfff1f43ebf R12: 1ffff110170e7f5d
R13: dffffc0000000000 R14: 0000000000000001 R15: ffff8880b873fae8
FS:  0000000000000000(0000) GS:ffff888125c1b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fd071f81ab8 CR3: 000000000df38000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 on_each_cpu_cond_mask+0x3f/0x80 kernel/smp.c:1052
 __flush_tlb_multi arch/x86/include/asm/paravirt.h:91 [inline]
 flush_tlb_multi arch/x86/mm/tlb.c:1361 [inline]
 flush_tlb_mm_range+0x6b1/0x12c0 arch/x86/mm/tlb.c:1451
 tlb_flush arch/x86/include/asm/tlb.h:23 [inline]
 tlb_flush_mmu_tlbonly include/asm-generic/tlb.h:490 [inline]
 tlb_flush_mmu+0x1a7/0x680 mm/mmu_gather.c:403
 tlb_finish_mmu+0xc3/0x1d0 mm/mmu_gather.c:497
 free_ldt_pgtables+0x17b/0x320 arch/x86/kernel/ldt.c:411
 arch_exit_mmap arch/x86/include/asm/mmu_context.h:234 [inline]
 exit_mmap+0x17c/0xb50 mm/mmap.c:1270
 __mmput+0x118/0x420 kernel/fork.c:1121
 exit_mm+0x1da/0x2c0 kernel/exit.c:581
 do_exit+0x648/0x22e0 kernel/exit.c:952
 do_group_exit+0x21c/0x2d0 kernel/exit.c:1105
 get_signal+0x1286/0x1340 kernel/signal.c:3034
 arch_do_signal_or_restart+0x9a/0x750 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop+0x75/0x110 kernel/entry/common.c:111
 exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7efe165c11e5
Code: Unable to access opcode bytes at 0x7efe165c11bb.
RSP: 002b:00007ffe8f0552d0 EFLAGS: 00000293
 ORIG_RAX: 00000000000000e6
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 00007efe165c11e5
RDX: 00007ffe8f055310 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000001 R08: 0000000000000000 R09: 0000000000000001
R10: 0000000000000000 R11: 0000000000000293 R12: 00007ffe8f055368
R13: 0000200000000080 R14: 00007efe167b5fa0 R15: 0000000000000003
 </TASK>
sched: DL replenish lagged too much


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

