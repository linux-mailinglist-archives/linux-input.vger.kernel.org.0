Return-Path: <linux-input+bounces-8773-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2737D9FC688
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 21:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47FFA7A1337
	for <lists+linux-input@lfdr.de>; Wed, 25 Dec 2024 20:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01A4F1B5ECB;
	Wed, 25 Dec 2024 20:56:26 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195B913D61B
	for <linux-input@vger.kernel.org>; Wed, 25 Dec 2024 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735160185; cv=none; b=VQsQ0s6TyCcZD6Tpv16m1WuO3waEAFKX8b0tkyBq68BQL0tu+Qol3o4afo4e9ZeK/F7zinQ3bIl2ID0bu/88dQ/b0PODE0ycuq+H4d5gH/lo9+pRiKZge/SatpkZ1Ujj71IW9JwGWUzGzgHXwBe2f9otjBlQ8k+VBK0icU+x3wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735160185; c=relaxed/simple;
	bh=5S24EW86UWkAAYkjVaeUQPnn522Xn6mecJ3uouuFo7Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=e7Ki0/t9zWq6Ojhrg83TY14JSp9mOR5WLoSm0WZ2GPmTWuoT14m3Kgxt/CF3fdAVcRXEAXbHb7yNB8PtRYvBdnom6s9pKhTgiMGRE+9a8cpbUEwPuWxhYXUzRN3NQupPaIeAFGCdmFu0cyr16COegAfIIurYv+W82EnzSKfy6pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3a81357cdc7so65684175ab.1
        for <linux-input@vger.kernel.org>; Wed, 25 Dec 2024 12:56:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735160183; x=1735764983;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0egcIQNFvpLTT5iBH0Sn8+eO3aOxy6ip2k0pMiMraCo=;
        b=X6IH6Va5nq+l0XDQ63t3IUgvbo6QQIdZHi+det3Ty8f816YFM3sAGOOWSe9a/I2esI
         xTVC8+T2cvBBeoP9RI3lfSANzpy+vuyaYfMAiBFAuUB3Tzh0myORa6THu4/iSIUj4U/j
         CQgapC0HxwtoVIv6WJ1GpXsjLtiGnQ8RZm0u1Cv/tXIvRIEN66aJqwXFi3XlxLZqIGAN
         ntq5On6p9WRZp2vwTq9H6F9ZYQF9+EQGw/h2fE3jUJmYw/FdKJPOXC3S1PviYquEALNU
         Qb36vLqBAQuqLR8egjVH+q72Bn6W/IV0S3fvpV5fBaOu3Nt6UGstl5R/T45XyDc5fRsv
         WiCA==
X-Forwarded-Encrypted: i=1; AJvYcCXhEb8TBBNBKWXWmCGZnDGePkMKujdt92T6d2rS4sYMxoXuoRb3WLamenua4j3v31v00x75mnwzi32rcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9cAKK2bqM0oZ6rrqXXrwu/gEHlWJVwdtuq2NEBcZi/fWUKG01
	InWPhJeFXzgAFriFuiO1vo/WuPkFbbb5XtuTzCkRsoflH0KmMUXwSxEDyBCfoK3dbGvXZQa3Kjy
	NyCGxfdku3FCa9CYK6KX3r8A3KGIzWPkOpHC/lXXjX5eDfjjPWrsm5MA=
X-Google-Smtp-Source: AGHT+IGvdKVctsWQLrwOh3IRmdLPVYHJNCjRh15iQK8KLbgRk8s9jG9T0UhpsiAZzNfDvHgFG94gm2Sm63lzA7kDq5zQY3htdq30
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1e06:b0:3a7:cff5:16d6 with SMTP id
 e9e14a558f8ab-3c2fe4458fbmr164891095ab.3.1735160183273; Wed, 25 Dec 2024
 12:56:23 -0800 (PST)
Date: Wed, 25 Dec 2024 12:56:23 -0800
In-Reply-To: <67535904.050a0220.2477f.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <676c7177.050a0220.2f3838.03ae.GAE@google.com>
Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-out-of-bounds Read in mcp2221_raw_event
From: syzbot <syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    d7123c77dc60 usb: gadget: f_tcm: Refactor goto check_condi..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=134c0cc4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c7df994a0b7c30a9
dashboard link: https://syzkaller.appspot.com/bug?extid=52c1a7d3e5b361ccd346
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=174c0cc4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ccb59f24626e/disk-d7123c77.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b51b5c87b9dc/vmlinux-d7123c77.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f66bf96bc8cc/bzImage-d7123c77.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+52c1a7d3e5b361ccd346@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in mcp2221_raw_event+0xf98/0x1030 drivers/hid/hid-mcp2221.c:852
Read of size 1 at addr ffff88811e03bfff by task kworker/1:2/2932

CPU: 1 UID: 0 PID: 2932 Comm: kworker/1:2 Not tainted 6.13.0-rc4-syzkaller-00068-gd7123c77dc60 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Workqueue: events_power_efficient gc_worker
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:489
 kasan_report+0xd9/0x110 mm/kasan/report.c:602
 mcp2221_raw_event+0xf98/0x1030 drivers/hid/hid-mcp2221.c:852
 __hid_input_report.constprop.0+0x312/0x440 drivers/hid/hid-core.c:2111
 hid_irq_in+0x35e/0x870 drivers/hid/usbhid/hid-core.c:285
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
RIP: 0010:__seqprop_spinlock_sequence include/linux/seqlock.h:227 [inline]
RIP: 0010:nf_conntrack_get_ht include/net/netfilter/nf_conntrack.h:345 [inline]
RIP: 0010:gc_worker+0x2e1/0x1760 net/netfilter/nf_conntrack_core.c:1534
Code: 00 00 48 c7 c7 28 51 56 8a e8 5b a6 2e fb 9c 5b 81 e3 00 02 00 00 31 ff 48 89 de e8 e9 d5 51 fb 48 85 db 58 0f 85 3d 10 00 00 <e8> 6a d3 51 fb eb 07 e8 63 d3 51 fb f3 90 44 8b 35 ca b8 4c 04 44
RSP: 0018:ffffc9000140fbc8 EFLAGS: 00000293
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff8609a3fa
RDX: ffff88810732d7c0 RSI: ffffffff8609a409 RDI: 0000000000000007
RBP: ffff888112200000 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000003 R12: 0000000000012f2e
R13: dffffc0000000000 R14: 0000000000025e5b R15: 0000000000040000
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>

Allocated by task 2832:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4298 [inline]
 __kmalloc_node_track_caller_noprof+0x20b/0x4c0 mm/slub.c:4317
 kmalloc_reserve+0xef/0x2c0 net/core/skbuff.c:609
 __alloc_skb+0x164/0x380 net/core/skbuff.c:678
 alloc_skb include/linux/skbuff.h:1323 [inline]
 alloc_skb_with_frags+0xe4/0x850 net/core/skbuff.c:6612
 sock_alloc_send_pskb+0x7f1/0x980 net/core/sock.c:2881
 unix_dgram_sendmsg+0x467/0x1920 net/unix/af_unix.c:2027
 sock_sendmsg_nosec net/socket.c:711 [inline]
 __sock_sendmsg net/socket.c:726 [inline]
 __sys_sendto+0x488/0x4f0 net/socket.c:2197
 __do_sys_sendto net/socket.c:2204 [inline]
 __se_sys_sendto net/socket.c:2200 [inline]
 __x64_sys_sendto+0xe0/0x1c0 net/socket.c:2200
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 2825:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:582
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x37/0x50 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2353 [inline]
 slab_free mm/slub.c:4613 [inline]
 kfree+0x130/0x470 mm/slub.c:4761
 skb_kfree_head net/core/skbuff.c:1086 [inline]
 skb_free_head+0x108/0x1d0 net/core/skbuff.c:1098
 skb_release_data+0x760/0x910 net/core/skbuff.c:1125
 skb_release_all net/core/skbuff.c:1190 [inline]
 __kfree_skb net/core/skbuff.c:1204 [inline]
 consume_skb net/core/skbuff.c:1436 [inline]
 consume_skb+0xbf/0x100 net/core/skbuff.c:1430
 __unix_dgram_recvmsg+0x81c/0xdd0 net/unix/af_unix.c:2521
 unix_dgram_recvmsg+0xd0/0x110 net/unix/af_unix.c:2538
 sock_recvmsg_nosec net/socket.c:1033 [inline]
 sock_recvmsg+0x1f6/0x250 net/socket.c:1055
 sock_read_iter+0x2bb/0x3b0 net/socket.c:1125
 new_sync_read fs/read_write.c:484 [inline]
 vfs_read+0xa4c/0xbe0 fs/read_write.c:565
 ksys_read+0x207/0x250 fs/read_write.c:708
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88811e03bc00
 which belongs to the cache kmalloc-cg-512 of size 512
The buggy address is located 511 bytes to the right of
 allocated 512-byte region [ffff88811e03bc00, ffff88811e03be00)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x11e038
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
memcg:ffff88810334f001
anon flags: 0x200000000000040(head|node=0|zone=2)
page_type: f5(slab)
raw: 0200000000000040 ffff88810004f140 ffffea000473e200 dead000000000003
raw: 0000000000000000 0000000000100010 00000001f5000000 ffff88810334f001
head: 0200000000000040 ffff88810004f140 ffffea000473e200 dead000000000003
head: 0000000000000000 0000000000100010 00000001f5000000 ffff88810334f001
head: 0200000000000002 ffffea0004780e01 ffffffffffffffff 0000000000000000
head: 0000000000000004 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5837, tgid 5837 (udevd), ts 428785915799, free_ts 427670559123
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1558
 prep_new_page mm/page_alloc.c:1566 [inline]
 get_page_from_freelist+0xe76/0x2b90 mm/page_alloc.c:3476
 __alloc_pages_noprof+0x21c/0x22a0 mm/page_alloc.c:4753
 alloc_pages_mpol_noprof+0xeb/0x400 mm/mempolicy.c:2269
 alloc_slab_page mm/slub.c:2423 [inline]
 allocate_slab mm/slub.c:2589 [inline]
 new_slab+0x2c9/0x410 mm/slub.c:2642
 ___slab_alloc+0xd1d/0x16e0 mm/slub.c:3830
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3920
 __slab_alloc_node mm/slub.c:3995 [inline]
 slab_alloc_node mm/slub.c:4156 [inline]
 __do_kmalloc_node mm/slub.c:4297 [inline]
 __kmalloc_node_track_caller_noprof+0x157/0x4c0 mm/slub.c:4317
 kmalloc_reserve+0xef/0x2c0 net/core/skbuff.c:609
 __alloc_skb+0x164/0x380 net/core/skbuff.c:678
 alloc_skb include/linux/skbuff.h:1323 [inline]
 alloc_skb_with_frags+0xe4/0x850 net/core/skbuff.c:6612
 sock_alloc_send_pskb+0x7f1/0x980 net/core/sock.c:2881
 unix_dgram_sendmsg+0x467/0x1920 net/unix/af_unix.c:2027
 sock_sendmsg_nosec net/socket.c:711 [inline]
 __sock_sendmsg net/socket.c:726 [inline]
 sock_write_iter+0x4fe/0x5b0 net/socket.c:1147
 new_sync_write fs/read_write.c:586 [inline]
 vfs_write+0x5ae/0x1150 fs/read_write.c:679
 ksys_write+0x207/0x250 fs/read_write.c:731
page last free pid 2843 tgid 2843 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_unref_page+0x661/0xe40 mm/page_alloc.c:2659
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4e/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x4e/0x70 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:250 [inline]
 slab_post_alloc_hook mm/slub.c:4119 [inline]
 slab_alloc_node mm/slub.c:4168 [inline]
 kmem_cache_alloc_noprof+0x154/0x3b0 mm/slub.c:4175
 getname_flags.part.0+0x4c/0x550 fs/namei.c:139
 getname_flags include/linux/audit.h:322 [inline]
 getname+0x8d/0xe0 fs/namei.c:223
 do_sys_openat2+0x104/0x1e0 fs/open.c:1396
 do_sys_open fs/open.c:1417 [inline]
 __do_sys_openat fs/open.c:1433 [inline]
 __se_sys_openat fs/open.c:1428 [inline]
 __x64_sys_openat+0x175/0x210 fs/open.c:1428
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88811e03be80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88811e03bf00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>ffff88811e03bf80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                                                ^
 ffff88811e03c000: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff88811e03c080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
==================================================================
----------------
Code disassembly (best guess):
   0:	00 00                	add    %al,(%rax)
   2:	48 c7 c7 28 51 56 8a 	mov    $0xffffffff8a565128,%rdi
   9:	e8 5b a6 2e fb       	call   0xfb2ea669
   e:	9c                   	pushf
   f:	5b                   	pop    %rbx
  10:	81 e3 00 02 00 00    	and    $0x200,%ebx
  16:	31 ff                	xor    %edi,%edi
  18:	48 89 de             	mov    %rbx,%rsi
  1b:	e8 e9 d5 51 fb       	call   0xfb51d609
  20:	48 85 db             	test   %rbx,%rbx
  23:	58                   	pop    %rax
  24:	0f 85 3d 10 00 00    	jne    0x1067
* 2a:	e8 6a d3 51 fb       	call   0xfb51d399 <-- trapping instruction
  2f:	eb 07                	jmp    0x38
  31:	e8 63 d3 51 fb       	call   0xfb51d399
  36:	f3 90                	pause
  38:	44 8b 35 ca b8 4c 04 	mov    0x44cb8ca(%rip),%r14d        # 0x44cb909
  3f:	44                   	rex.R


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

