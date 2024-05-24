Return-Path: <linux-input+bounces-3813-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C528CE0EF
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 08:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA69A2816D2
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 06:18:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846FE128366;
	Fri, 24 May 2024 06:18:29 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f205.google.com (mail-il1-f205.google.com [209.85.166.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432BF2230C
	for <linux-input@vger.kernel.org>; Fri, 24 May 2024 06:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716531509; cv=none; b=NKziormIMkYJBKU5oz9N0772qJHYsdynGrs1NT/W7bv2+OsT2UN3rlfSwskfFYUGng/9183vEGAYqvw8wPtV/8um1o43FCb5ByxdK3gUl9UlDjdHXBCH7egRNVFwx4JQ+bn4rNdGlkkwa9hFJxdCNGitkzUFTZZKv308U4hSDTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716531509; c=relaxed/simple;
	bh=irwvMJuabM/LE3ZP5E9X062DdIUthg83LdFaKiToKyQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=r2O7sz+i19g5i3uAEV0MxiqtAFXl2frciJd31J4NvFzfrIyslmO30TbCaZZyK8UPV17fe7a8XaeSzeI6AI/Zyxvb0mkGmeO/jZuZeaB+gYiBRFjhvzpAqRA8eWjpFgHMT0cbC9rGDrUTQVdfAZr+J8f7LceeLaQp0wFPsszmz7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f205.google.com with SMTP id e9e14a558f8ab-3713862bcefso21004605ab.0
        for <linux-input@vger.kernel.org>; Thu, 23 May 2024 23:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716531506; x=1717136306;
        h=content-transfer-encoding:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BNgu4oddCQYnVQUvBsGea594F0HKpe6UHOO7M9fsFuc=;
        b=pLpSwkecfx63aU9YnYiE1FtAhiXQPW79KqYFp1L6cwRP42dQmfdOlwHK9Bm7D+kSkr
         vSlRZauIYXknOIq+DSYuxgFwl5w0VG8LlbfYZ5bFtG4l3ef2Ls9CzVVsu3u/Qo/zL7i0
         /Efb7OdnKi2QBJmqaF7RYPVEpE45wLQrxCdnGYpSnelEFqeYkQA1HwBC40Kmi8nIJzXm
         RM5wsG4erAp8A0ez7x1BXEi8+HOSdJs8XJ0se2p6G5TzX/h8lTI+XF6VZRAVavNosEaB
         0GBkxt6KeutRPi+U0+sJZuIfpm8P9MuE3z1+2ymWWDtKOeavaj2+Cp26PVpVVZkKGrSj
         AMeg==
X-Forwarded-Encrypted: i=1; AJvYcCW+DmqA4xoSPYDFeEHpOY5rWmhUth010oEP+yYS12YX7V3l+FmdFUzj+lp2pzj93N0Na1CdUiY9/11Bat9NT/cZxI+wzTXzvIWyM6s=
X-Gm-Message-State: AOJu0YxB2atHElDRJsDoE/unSzRxOS2rzBt3AXC31dNN5t1sNAfQN8e8
	MpDHSz1jta2aWXLC65caZPhAMgzUlUT6PB4VrfMazC5+0aTTN0H2gKyzkuVNgvuCGT2V+lG8op1
	mdWikoVFjDX6+/yNtjInP9/YlsEImDpVaNc7bCd0ID6tXOAiE8MBCBfE=
X-Google-Smtp-Source: AGHT+IGX/IoYA4ysHtyGmoHYjoFauld/xbpuOYFS7/TY05ffRVlnIETC6a1+jU0LC3iGAjmOdg0Fm6EhTUdO1YhxZQN0MnNWUi3m
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1887:b0:371:a225:45b5 with SMTP id
 e9e14a558f8ab-3737ac8695emr1192695ab.1.1716531506472; Thu, 23 May 2024
 23:18:26 -0700 (PDT)
Date: Thu, 23 May 2024 23:18:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b07bfb06192d228b@google.com>
Subject: [syzbot] [net?] [input?] [usb?] INFO: rcu detected stall in sendmsg (4)
From: syzbot <syzbot+9c0539eda655673bdaa4@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot found the following issue on:

HEAD commit:    61307b7be41a Merge tag 'mm-stable-2024-05-17-19-19' of git.=
.
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=3D13f55634980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3De7d2f006659b877
dashboard link: https://syzkaller.appspot.com/bug?extid=3D9c0539eda655673bd=
aa4
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D10311eb298000=
0
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D12e9f1dc980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0de598381836/disk-=
61307b7b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/69ea7aec70a4/vmlinux-=
61307b7b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/07111fc20846/bzI=
mage-61307b7b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+9c0539eda655673bdaa4@syzkaller.appspotmail.com

rcu: INFO: rcu_preempt self-detected stall on CPU
rcu: 	0-...!: (7 ticks this GP) idle=3D5024/1/0x4000000000000000 softirq=3D=
8175/8175 fqs=3D0
rcu: 	(t=3D11029 jiffies g=3D8665 q=3D111 ncpus=3D2)
rcu: rcu_preempt kthread starved for 11029 jiffies! g8665 f0x0 RCU_GP_WAIT_=
FQS(5) ->state=3D0x0 ->cpu=3D0
rcu: 	Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expec=
ted behavior.
rcu: RCU grace-period kthread stack dump:
task:rcu_preempt     state:R  running task     stack:28752 pid:17    tgid:1=
7    ppid:2      flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5408 [inline]
 __schedule+0xf15/0x5d00 kernel/sched/core.c:6745
 __schedule_loop kernel/sched/core.c:6822 [inline]
 schedule+0xe7/0x350 kernel/sched/core.c:6837
 schedule_timeout+0x136/0x2a0 kernel/time/timer.c:2581
 rcu_gp_fqs_loop+0x1eb/0xb00 kernel/rcu/tree.c:2000
 rcu_gp_kthread+0x271/0x380 kernel/rcu/tree.c:2202
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
CPU: 0 PID: 4533 Comm: udevd Not tainted 6.9.0-syzkaller-09429-g61307b7be41=
a #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 04/02/2024
RIP: 0010:__raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:152=
 [inline]
RIP: 0010:_raw_spin_unlock_irqrestore+0x31/0x80 kernel/locking/spinlock.c:1=
94
Code: f5 53 48 8b 74 24 10 48 89 fb 48 83 c7 18 e8 16 10 82 f6 48 89 df e8 =
fe 8c 82 f6 f7 c5 00 02 00 00 75 23 9c 58 f6 c4 02 75 37 <bf> 01 00 00 00 e=
8 75 cd 73 f6 65 8b 05 06 1b 1a 75 85 c0 74 16 5b
RSP: 0018:ffffc90000007a48 EFLAGS: 00000246
RAX: 0000000000000002 RBX: ffff888023414000 RCX: 1ffffffff285644e
RDX: 0000000000000000 RSI: ffffffff8b2cab60 RDI: ffffffff8b8faa00
RBP: 0000000000000246 R08: 0000000000000001 R09: fffffbfff284be6a
R10: ffffffff9425f357 R11: 0000000000000003 R12: ffff8880243de478
R13: ffff8880243de480 R14: dffffc0000000000 R15: ffff8880243de478
FS:  00007f58b93bdc80(0000) GS:ffff8880b9200000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f58b9410d80 CR3: 000000007cfb8000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <IRQ>
 spin_unlock_irqrestore include/linux/spinlock.h:406 [inline]
 dummy_timer+0x1e16/0x3940 drivers/usb/gadget/udc/dummy_hcd.c:2001
 call_timer_fn+0x1a0/0x610 kernel/time/timer.c:1792
 expire_timers kernel/time/timer.c:1843 [inline]
 __run_timers+0x74b/0xaf0 kernel/time/timer.c:2417
 __run_timer_base kernel/time/timer.c:2428 [inline]
 __run_timer_base kernel/time/timer.c:2421 [inline]
 run_timer_base+0x111/0x190 kernel/time/timer.c:2437
 run_timer_softirq+0x1a/0x40 kernel/time/timer.c:2447
 handle_softirqs+0x216/0x8f0 kernel/softirq.c:554
 __do_softirq kernel/softirq.c:588 [inline]
 invoke_softirq kernel/softirq.c:428 [inline]
 __irq_exit_rcu kernel/softirq.c:637 [inline]
 irq_exit_rcu+0xbb/0x120 kernel/softirq.c:649
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1043 [inline=
]
 sysvec_apic_timer_interrupt+0x95/0xb0 arch/x86/kernel/apic/apic.c:1043
 </IRQ>
 <TASK>
 asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:=
702
RIP: 0010:arch_static_branch arch/x86/include/asm/jump_label.h:27 [inline]
RIP: 0010:__slub_debug_enabled mm/slab.h:510 [inline]
RIP: 0010:kmem_cache_debug_flags mm/slab.h:531 [inline]
RIP: 0010:kmem_cache_debug mm/slub.c:230 [inline]
RIP: 0010:__slab_free+0x39/0x4d0 mm/slub.c:4253
Code: 41 54 53 48 83 e4 f0 48 83 c4 80 48 89 54 24 08 48 8d 54 24 40 48 89 =
7c 24 30 48 89 d7 48 89 4c 24 10 b9 08 00 00 00 f3 48 ab <0f> 1f 44 00 00 4=
8 c7 04 24 00 00 00 00 c6 44 24 3e 00 66 44 89 44
RSP: 0018:ffffc90003d27730 EFLAGS: 00000287
RAX: 0000000000000000 RBX: ffff888015442140 RCX: 0000000000000000
RDX: ffffc90003d27770 RSI: ffffea00008e5200 RDI: ffffc90003d277b0
RBP: ffffc90003d277e0 R08: 0000000000000001 R09: ffffffff81e9db49
R10: 0000000000000000 R11: 0000000000000001 R12: ffff888078e4a000
R13: 0000000000000000 R14: ffffc90003d27828 R15: ffffea00008e5200
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4e/0x140 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x192/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:322
 kasan_slab_alloc include/linux/kasan.h:201 [inline]
 slab_post_alloc_hook mm/slub.c:3940 [inline]
 slab_alloc_node mm/slub.c:4000 [inline]
 kmem_cache_alloc_node_noprof+0x153/0x310 mm/slub.c:4043
 kmalloc_reserve+0x18b/0x2c0 net/core/skbuff.c:575
 __alloc_skb+0x164/0x380 net/core/skbuff.c:666
 alloc_skb include/linux/skbuff.h:1308 [inline]
 netlink_alloc_large_skb+0x69/0x130 net/netlink/af_netlink.c:1210
 netlink_sendmsg+0x689/0xd70 net/netlink/af_netlink.c:1880
 sock_sendmsg_nosec net/socket.c:730 [inline]
 __sock_sendmsg net/socket.c:745 [inline]
 ____sys_sendmsg+0xab5/0xc90 net/socket.c:2585
 ___sys_sendmsg+0x135/0x1e0 net/socket.c:2639
 __sys_sendmsg+0x117/0x1f0 net/socket.c:2668
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcf/0x260 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f58b8f24a4b
Code: ff 89 ef 48 89 04 24 e8 22 56 f9 ff 48 8b 04 24 48 83 c4 20 5d c3 c3 =
64 8b 04 25 18 00 00 00 85 c0 75 20 b8 2e 00 00 00 0f 05 <48> 3d 00 f0 ff f=
f 76 6d 48 8b 15 ae c3 0c 00 f7 d8 64 89 02 48 83
RSP: 002b:00007ffe73c0e2d8 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 00005610f4ae1240 RCX: 00007f58b8f24a4b
RDX: 0000000000000000 RSI: 00007ffe73c0e2e8 RDI: 0000000000000004
RBP: 00005610f4b0e290 R08: 0000000000000001 R09: 3039abbe55c8e597
R10: 1999999999999999 R11: 0000000000000246 R12: 0000000000000000
R13: 00000000000000c4 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Mem-Info:
active_anon:3729 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:15360 isolated_file:0
 unevictable:768 dirty:3 writeback:0
 slab_reclaimable:9244 slab_unreclaimable:79848
 mapped:2131 shmem:1251 pagetables:547
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1491166 free_pcp:372 free_cma:0
Node 0 active_anon:14916kB inactive_anon:0kB active_file:0kB inactive_file:=
61364kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:852=
4kB dirty:8kB writeback:0kB shmem:3468kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:8496kB pagetables:2188kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:76kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
4kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:204kB low:252kB high:300kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2565 2567 0 0
Node 0 DMA32 free:1992068kB boost:0kB min:35052kB low:43812kB high:52572kB =
reserved_highatomic:0KB active_anon:14892kB inactive_anon:0kB active_file:0=
kB inactive_file:59552kB unevictable:1536kB writepending:8kB present:312933=
2kB managed:2654792kB mlocked:0kB bounce:0kB free_pcp:1456kB local_pcp:760k=
B free_cma:0kB
lowmem_reserve[]: 0 0 1 0 0
Node 0 Normal free:28kB boost:0kB min:24kB low:28kB high:32kB reserved_high=
atomic:0KB active_anon:24kB inactive_anon:0kB active_file:0kB inactive_file=
:1812kB unevictable:0kB writepending:0kB present:1048576kB managed:1896kB m=
locked:0kB bounce:0kB free_pcp:32kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3957208kB boost:0kB min:54828kB low:68532kB high:82236kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:76kB unevictable:1536kB writepending:4kB present:4194304kB ma=
naged:4109120kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 724*4kB (UM) 1149*8kB (UME) 213*16kB (UME) 15*32kB (UME) 5*64=
kB (E) 1*128kB (U) 3*256kB (ME) 1*512kB (U) 2*1024kB (ME) 1*2048kB (E) 481*=
4096kB (M) =3D 1991976kB
Node 0 Normal: 1*4kB (M) 1*8kB (M) 1*16kB (M) 0*32kB 0*64kB 0*128kB 0*256kB=
 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 28kB
Node 1 Normal: 6*4kB (UM) 8*8kB (UM) 8*16kB (UM) 12*32kB (UM) 6*64kB (U) 2*=
128kB (U) 1*256kB (M) 2*512kB (UM) 0*1024kB 1*2048kB (U) 965*4096kB (M) =3D=
 3957208kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
16611 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
401759 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:3734 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:15360 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:9186 slab_unreclaimable:79492
 mapped:2131 shmem:1229 pagetables:570
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1491784 free_pcp:96 free_cma:0
Node 0 active_anon:14936kB inactive_anon:0kB active_file:0kB inactive_file:=
61364kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:852=
4kB dirty:0kB writeback:0kB shmem:3380kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:8624kB pagetables:2280kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:76kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:204kB low:252kB high:300kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2565 2567 0 0
Node 0 DMA32 free:1994540kB boost:0kB min:35052kB low:43812kB high:52572kB =
reserved_highatomic:0KB active_anon:14912kB inactive_anon:0kB active_file:0=
kB inactive_file:59552kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2654792kB mlocked:0kB bounce:0kB free_pcp:352kB local_pcp:160kB=
 free_cma:0kB
lowmem_reserve[]: 0 0 1 0 0
Node 0 Normal free:28kB boost:0kB min:24kB low:28kB high:32kB reserved_high=
atomic:0KB active_anon:24kB inactive_anon:0kB active_file:0kB inactive_file=
:1812kB unevictable:0kB writepending:0kB present:1048576kB managed:1896kB m=
locked:0kB bounce:0kB free_pcp:32kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3957208kB boost:0kB min:54828kB low:68532kB high:82236kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:76kB unevictable:1536kB writepending:0kB present:4194304kB ma=
naged:4109120kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 815*4kB (UM) 1206*8kB (UME) 56*16kB (UME) 58*32kB (UME) 49*64=
kB (UME) 3*128kB (UM) 2*256kB (ME) 1*512kB (U) 2*1024kB (ME) 1*2048kB (E) 4=
81*4096kB (M) =3D 1994476kB
Node 0 Normal: 1*4kB (M) 1*8kB (M) 1*16kB (M) 0*32kB 0*64kB 0*128kB 0*256kB=
 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 28kB
Node 1 Normal: 6*4kB (UM) 8*8kB (UM) 8*16kB (UM) 12*32kB (UM) 6*64kB (U) 2*=
128kB (U) 1*256kB (M) 2*512kB (UM) 0*1024kB 1*2048kB (U) 965*4096kB (M) =3D=
 3957208kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
16589 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
401759 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:3734 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:15360 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:9186 slab_unreclaimable:79492
 mapped:2131 shmem:1229 pagetables:570
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1491583 free_pcp:285 free_cma:0
Node 0 active_anon:14936kB inactive_anon:0kB active_file:0kB inactive_file:=
61364kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:852=
4kB dirty:0kB writeback:0kB shmem:3380kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:8652kB pagetables:2280kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:76kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:204kB low:252kB high:300kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2565 2567 0 0
Node 0 DMA32 free:1993736kB boost:0kB min:35052kB low:43812kB high:52572kB =
reserved_highatomic:0KB active_anon:14912kB inactive_anon:0kB active_file:0=
kB inactive_file:59552kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2654792kB mlocked:0kB bounce:0kB free_pcp:1108kB local_pcp:916k=
B free_cma:0kB
lowmem_reserve[]: 0 0 1 0 0
Node 0 Normal free:28kB boost:0kB min:24kB low:28kB high:32kB reserved_high=
atomic:0KB active_anon:24kB inactive_anon:0kB active_file:0kB inactive_file=
:1812kB unevictable:0kB writepending:0kB present:1048576kB managed:1896kB m=
locked:0kB bounce:0kB free_pcp:32kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3957208kB boost:0kB min:54828kB low:68532kB high:82236kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:76kB unevictable:1536kB writepending:0kB present:4194304kB ma=
naged:4109120kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 654*4kB (UM) 1192*8kB (UME) 56*16kB (UME) 58*32kB (UME) 49*64=
kB (UME) 3*128kB (UM) 2*256kB (ME) 1*512kB (U) 2*1024kB (ME) 1*2048kB (E) 4=
81*4096kB (M) =3D 1993720kB
Node 0 Normal: 1*4kB (M) 1*8kB (M) 1*16kB (M) 0*32kB 0*64kB 0*128kB 0*256kB=
 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 28kB
Node 1 Normal: 6*4kB (UM) 8*8kB (UM) 8*16kB (UM) 12*32kB (UM) 6*64kB (U) 2*=
128kB (U) 1*256kB (M) 2*512kB (UM) 0*1024kB 1*2048kB (U) 965*4096kB (M) =3D=
 3957208kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
16589 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
401759 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:3721 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:15360 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:9222 slab_unreclaimable:79492
 mapped:2131 shmem:1239 pagetables:556
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1491351 free_pcp:502 free_cma:0
Node 0 active_anon:14884kB inactive_anon:0kB active_file:0kB inactive_file:=
61364kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:852=
4kB dirty:0kB writeback:0kB shmem:3420kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:8624kB pagetables:2224kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:76kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:204kB low:252kB high:300kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2565 2567 0 0
Node 0 DMA32 free:1992808kB boost:0kB min:35052kB low:43812kB high:52572kB =
reserved_highatomic:0KB active_anon:14860kB inactive_anon:0kB active_file:0=
kB inactive_file:59552kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2654792kB mlocked:0kB bounce:0kB free_pcp:1976kB local_pcp:1008=
kB free_cma:0kB
lowmem_reserve[]: 0 0 1 0 0
Node 0 Normal free:28kB boost:0kB min:24kB low:28kB high:32kB reserved_high=
atomic:0KB active_anon:24kB inactive_anon:0kB active_file:0kB inactive_file=
:1812kB unevictable:0kB writepending:0kB present:1048576kB managed:1896kB m=
locked:0kB bounce:0kB free_pcp:32kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3957208kB boost:0kB min:54828kB low:68532kB high:82236kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:76kB unevictable:1536kB writepending:0kB present:4194304kB ma=
naged:4109120kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 638*4kB (UM) 1185*8kB (UE) 13*16kB (UM) 62*32kB (UE) 49*64kB =
(UME) 3*128kB (UM) 1*256kB (E) 1*512kB (U) 2*1024kB (ME) 1*2048kB (E) 481*4=
096kB (M) =3D 1992784kB
Node 0 Normal: 1*4kB (M) 1*8kB (M) 1*16kB (M) 0*32kB 0*64kB 0*128kB 0*256kB=
 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 28kB
Node 1 Normal: 6*4kB (UM) 8*8kB (UM) 8*16kB (UM) 12*32kB (UM) 6*64kB (U) 2*=
128kB (U) 1*256kB (M) 2*512kB (UM) 0*1024kB 1*2048kB (U) 965*4096kB (M) =3D=
 3957208kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
16599 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
401759 pages reserved
0 pages cma reserved
Mem-Info:
active_anon:3748 inactive_anon:0 isolated_anon:0
 active_file:0 inactive_file:15360 isolated_file:0
 unevictable:768 dirty:0 writeback:0
 slab_reclaimable:9238 slab_unreclaimable:79752
 mapped:2131 shmem:1237 pagetables:570
 sec_pagetables:0 bounce:0
 kernel_misc_reclaimable:0
 free:1491436 free_pcp:153 free_cma:0
Node 0 active_anon:14992kB inactive_anon:0kB active_file:0kB inactive_file:=
61364kB unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:852=
4kB dirty:0kB writeback:0kB shmem:3412kB shmem_thp:0kB shmem_pmdmapped:0kB =
anon_thp:0kB writeback_tmp:0kB kernel_stack:8624kB pagetables:2280kB sec_pa=
getables:0kB all_unreclaimable? no
Node 1 active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:76kB=
 unevictable:1536kB isolated(anon):0kB isolated(file):0kB mapped:0kB dirty:=
0kB writeback:0kB shmem:1536kB shmem_thp:0kB shmem_pmdmapped:0kB anon_thp:0=
kB writeback_tmp:0kB kernel_stack:16kB pagetables:0kB sec_pagetables:0kB al=
l_unreclaimable? no
Node 0 DMA free:15360kB boost:0kB min:204kB low:252kB high:300kB reserved_h=
ighatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_fi=
le:0kB unevictable:0kB writepending:0kB present:15992kB managed:15360kB mlo=
cked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
lowmem_reserve[]: 0 2565 2567 0 0
Node 0 DMA32 free:1993148kB boost:0kB min:35052kB low:43812kB high:52572kB =
reserved_highatomic:0KB active_anon:14968kB inactive_anon:0kB active_file:0=
kB inactive_file:59552kB unevictable:1536kB writepending:0kB present:312933=
2kB managed:2654792kB mlocked:0kB bounce:0kB free_pcp:580kB local_pcp:0kB f=
ree_cma:0kB
lowmem_reserve[]: 0 0 1 0 0
Node 0 Normal free:28kB boost:0kB min:24kB low:28kB high:32kB reserved_high=
atomic:0KB active_anon:24kB inactive_anon:0kB active_file:0kB inactive_file=
:1812kB unevictable:0kB writepending:0kB present:1048576kB managed:1896kB m=
locked:0kB bounce:0kB free_pcp:32kB local_pcp:8kB free_cma:0kB
lowmem_reserve[]: 0 0 0 0 0
Node 1 Normal free:3957208kB boost:0kB min:54828kB low:68532kB high:82236kB=
 reserved_highatomic:0KB active_anon:0kB inactive_anon:0kB active_file:0kB =
inactive_file:76kB unevictable:1536kB writepending:0kB present:4194304kB ma=
naged:4109120kB mlocked:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:=
0kB
lowmem_reserve[]: 0 0 0 0 0
Node 0 DMA: 0*4kB 0*8kB 0*16kB 0*32kB 0*64kB 0*128kB 0*256kB 0*512kB 1*1024=
kB (U) 1*2048kB (M) 3*4096kB (M) =3D 15360kB
Node 0 DMA32: 975*4kB (UM) 1198*8kB (UME) 281*16kB (UE) 30*32kB (UME) 6*64k=
B (UE) 2*128kB (UM) 3*256kB (UME) 1*512kB (U) 2*1024kB (ME) 2*2048kB (UE) 4=
80*4096kB (M) =3D 1993084kB
Node 0 Normal: 1*4kB (M) 1*8kB (M) 1*16kB (M) 0*32kB 0*64kB 0*128kB 0*256kB=
 0*512kB 0*1024kB 0*2048kB 0*4096kB =3D 28kB
Node 1 Normal: 6*4kB (UM) 8*8kB (UM) 8*16kB (UM) 12*32kB (UM) 6*64kB (U) 2*=
128kB (U) 1*256kB (M) 2*512kB (UM) 0*1024kB 1*2048kB (U) 965*4096kB (M) =3D=
 3957208kB
Node 0 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 0 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
Node 1 hugepages_total=3D0 hugepages_free=3D0 hugepages_surp=3D0 hugepages_=
size=3D1048576kB
Node 1 hugepages_total=3D2 hugepages_free=3D2 hugepages_surp=3D0 hugepages_=
size=3D2048kB
16597 total pagecache pages
0 pages in swap cache
Free swap  =3D 0kB
Total swap =3D 0kB
2097051 pages RAM
0 pages HighMem/MovableOnly
401759 pages reserved
0 pages cma reserved


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

