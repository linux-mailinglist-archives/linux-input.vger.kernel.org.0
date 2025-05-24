Return-Path: <linux-input+bounces-12545-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B3DAC2EBD
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 12:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5110BA228B0
	for <lists+linux-input@lfdr.de>; Sat, 24 May 2025 10:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432AD19E99E;
	Sat, 24 May 2025 10:05:36 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA733158538
	for <linux-input@vger.kernel.org>; Sat, 24 May 2025 10:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748081136; cv=none; b=clP9ghjOVdVbuEgISIUFjDhOvvNVQK70I6tQ4d8AroBYV8Gm6BAe/vx14xhDnw5LuYY6dbuJJJMF0YKG/Qu9bB6vEmUqrUnkSPAKD6uN8ZOO4S9iKyKnqiwwi2tq7fwnWF37BeZSF8wKU/IfiKyyF17TNDOU+sReG1WrLg/+hRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748081136; c=relaxed/simple;
	bh=wDD1DZCIpA43AoRx4bxdv7D4QIC7i3iEgQt4rgStiSs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=huMTOHVSigaYmCOCf5woQYM0898sjbfy8CaVkQLYevw8E0Z4iLAfFXW136vzkmK4RtXZ5Tw/xSGwyT0oyjTV9LvLxbUxGK4cgdn7M4AsQ7KEfEEtuJR8qOY2nl+P/JilIfx6fMd/1dCXRUzabvdmGFhLLABrZTRamN8BOMNL1pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-85e4f920dacso55848339f.2
        for <linux-input@vger.kernel.org>; Sat, 24 May 2025 03:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748081133; x=1748685933;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OGMM8vqQo53S8+WMAMeHLLzIMp1ZuGRCd/CSYIgXJMA=;
        b=hM/OFrwrXhkHYc8C7QPmWYNFsH3vZ/C7RFgTXRRlbv4jdyJqkhYpkG3p/ZQqceTc5T
         ZFPw6L2ZM101THdttZj85MtpyqDsCtWLfF/FFEyBeEoBjYF348bEf03XI41co+/Ekx3F
         MXBsPabrT0nugk4as5vqNeX8HxZhdn42wDvEVyiyJLsZ53jY0kJHthlTFTSa9nEeh1FD
         83aowNRPjFNoO4xxxcQPu2VyLqK0K6bJ7W+PkrBKUBiWP2iCzrQbT7UDybYn7vdTqp9s
         mMJve1iHGDZlqQCpeL9UebjHiLgZGf/xaQZ4hD5ooiytjfF+kVZM+B8MSBrn4DgyxI4u
         0qTA==
X-Forwarded-Encrypted: i=1; AJvYcCUqIEjFwrxrC9DEWh6bZSdmQ6yXgg5R/b7lvRY+D/PhkaW2Tl03wBBd3aOrWz442cjFnlU9iNQKbnnNPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6/o4a7QcBG8qLbDHpSh1guBVx5GYn4FvplsdzlBbvxH5PAEtw
	7c4NtjU/oVPKfpTdupEdsaZtT0Uk/AwSkfwkWpBuAXKqMAAdi2DFkIj5MGbT8fbb8JR5Yc+tfi8
	oBYaMHD091MMAIhZyvEYvWQMkkyliL2J/JvysFqr99Z4JlE7OFTXe3JFFg9s=
X-Google-Smtp-Source: AGHT+IFdds1ob4QmfUuDdB40WRE6bOdCrgWrHqQCubhkbOMqa0O4bUta0UcfD9haq7AEJxKEwUkQ4tUUCXL2GXkuy5ecBLZspRR+
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3a11:b0:85b:3791:b2ed with SMTP id
 ca18e2360f4ac-86cbb89607cmr276919339f.8.1748081133124; Sat, 24 May 2025
 03:05:33 -0700 (PDT)
Date: Sat, 24 May 2025 03:05:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683199ed.a70a0220.29d4a0.07f6.GAE@google.com>
Subject: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in report_descriptor_read
From: syzbot <syzbot+bc537ca7a0efe33988eb@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d608703fcdd9 Merge tag 'clk-fixes-for-linus' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15dbb9f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9fd1c9848687d742
dashboard link: https://syzkaller.appspot.com/bug?extid=bc537ca7a0efe33988eb
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/764a3a4c7472/disk-d608703f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1d9ef36d4c3a/vmlinux-d608703f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/cd01e8fdd0d9/bzImage-d608703f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+bc537ca7a0efe33988eb@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in report_descriptor_read+0xb5/0x100 drivers/hid/hid-core.c:2196
Read of size 5 at addr ffff888142efe520 by task fido_id/8704

CPU: 1 UID: 0 PID: 8704 Comm: fido_id Not tainted 6.15.0-rc7-syzkaller-00014-gd608703fcdd9 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:408 [inline]
 print_report+0xb4/0x290 mm/kasan/report.c:521
 kasan_report+0x118/0x150 mm/kasan/report.c:634
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x29a/0x2b0 mm/kasan/generic.c:189
 __asan_memcpy+0x29/0x70 mm/kasan/shadow.c:105
 report_descriptor_read+0xb5/0x100 drivers/hid/hid-core.c:2196
 kernfs_file_read_iter fs/kernfs/file.c:251 [inline]
 kernfs_fop_read_iter+0x3fb/0x640 fs/kernfs/file.c:280
 new_sync_read fs/read_write.c:489 [inline]
 vfs_read+0x4cd/0x980 fs/read_write.c:570
 ksys_read+0x145/0x250 fs/read_write.c:713
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f2ca54a7407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffcf4e82d40 EFLAGS: 00000202 ORIG_RAX: 0000000000000000
RAX: ffffffffffffffda RBX: 00007f2ca5bb9880 RCX: 00007f2ca54a7407
RDX: 0000000000001000 RSI: 00007ffcf4e82d90 RDI: 0000000000000004
RBP: 000055976aef1730 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 000055976aef0930
R13: 00007ffcf4e82d90 R14: 0000000000000004 R15: 00005597608214d8
 </TASK>

Allocated by task 10:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4327 [inline]
 __kmalloc_node_track_caller_noprof+0x271/0x4e0 mm/slub.c:4346
 kmemdup_noprof+0x2b/0x70 mm/util.c:137
 _Z14kmemdup_noprofPKvU25pass_dynamic_object_size0mj include/linux/fortify-string.h:765 [inline]
 hid_open_report+0x208/0xee0 drivers/hid/hid-core.c:1290
 hid_parse include/linux/hid.h:1126 [inline]
 bigben_probe+0xbc/0x7f0 drivers/hid/hid-bigbenff.c:386
 __hid_device_probe drivers/hid/hid-core.c:2717 [inline]
 hid_device_probe+0x397/0x710 drivers/hid/hid-core.c:2754
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3692
 hid_add_device+0x398/0x540 drivers/hid/hid-core.c:2900
 usbhid_probe+0xe13/0x12a0 drivers/hid/usbhid/hid-core.c:1432
 usb_probe_interface+0x641/0xbc0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3692
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c1/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3692
 usb_new_device+0xa39/0x16c0 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5531 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x2941/0x4a00 drivers/usb/core/hub.c:5913
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xadb/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 10:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2380 [inline]
 slab_free mm/slub.c:4642 [inline]
 kfree+0x193/0x440 mm/slub.c:4841
 hid_close_report+0x632/0x720 drivers/hid/hid-core.c:727
 __hid_device_probe drivers/hid/hid-core.c:2734 [inline]
 hid_device_probe+0x5e3/0x710 drivers/hid/hid-core.c:2754
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3692
 hid_add_device+0x398/0x540 drivers/hid/hid-core.c:2900
 usbhid_probe+0xe13/0x12a0 drivers/hid/usbhid/hid-core.c:1432
 usb_probe_interface+0x641/0xbc0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3692
 usb_set_configuration+0x1a87/0x20e0 drivers/usb/core/message.c:2210
 usb_generic_driver_probe+0x8d/0x150 drivers/usb/core/generic.c:250
 usb_probe_device+0x1c1/0x390 drivers/usb/core/driver.c:291
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x26a/0x9a0 drivers/base/dd.c:657
 __driver_probe_device+0x18c/0x2f0 drivers/base/dd.c:799
 driver_probe_device+0x4f/0x430 drivers/base/dd.c:829
 __device_attach_driver+0x2ce/0x530 drivers/base/dd.c:957
 bus_for_each_drv+0x251/0x2e0 drivers/base/bus.c:462
 __device_attach+0x2b8/0x400 drivers/base/dd.c:1029
 bus_probe_device+0x185/0x260 drivers/base/bus.c:537
 device_add+0x7b6/0xb50 drivers/base/core.c:3692
 usb_new_device+0xa39/0x16c0 drivers/usb/core/hub.c:2663
 hub_port_connect drivers/usb/core/hub.c:5531 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5671 [inline]
 port_event drivers/usb/core/hub.c:5831 [inline]
 hub_event+0x2941/0x4a00 drivers/usb/core/hub.c:5913
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xadb/0x17a0 kernel/workqueue.c:3319
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff888142efe520
 which belongs to the cache kmalloc-8 of size 8
The buggy address is located 0 bytes inside of
 freed 8-byte region [ffff888142efe520, ffff888142efe528)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x142efe
flags: 0x57ff00000000000(node=1|zone=2|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 057ff00000000000 ffff88801a041500 ffffea000504be80 dead000000000002
raw: 0000000000000000 0000000000800080 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x52cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP), pid 1, tgid 1 (swapper/0), ts 3299926472, free_ts 3220340853
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1d8/0x230 mm/page_alloc.c:1714
 prep_new_page mm/page_alloc.c:1722 [inline]
 get_page_from_freelist+0x21ce/0x22b0 mm/page_alloc.c:3684
 __alloc_frozen_pages_noprof+0x181/0x370 mm/page_alloc.c:4966
 alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2301
 alloc_slab_page mm/slub.c:2450 [inline]
 allocate_slab+0x8a/0x3b0 mm/slub.c:2618
 new_slab mm/slub.c:2672 [inline]
 ___slab_alloc+0xbfc/0x1480 mm/slub.c:3858
 __slab_alloc mm/slub.c:3948 [inline]
 __slab_alloc_node mm/slub.c:4023 [inline]
 slab_alloc_node mm/slub.c:4184 [inline]
 __do_kmalloc_node mm/slub.c:4326 [inline]
 __kmalloc_noprof+0x305/0x4f0 mm/slub.c:4339
 kmalloc_noprof include/linux/slab.h:909 [inline]
 acpi_ex_allocate_name_string drivers/acpi/acpica/exnames.c:66 [inline]
 acpi_ex_get_name_string+0x564/0xc70 drivers/acpi/acpica/exnames.c:367
 acpi_ds_create_operand+0x159/0x890 drivers/acpi/acpica/dsutils.c:446
 acpi_ds_evaluate_name_path+0x155/0x410 drivers/acpi/acpica/dsutils.c:771
 acpi_ds_exec_end_op+0x241/0x1120 drivers/acpi/acpica/dswexec.c:374
 acpi_ps_parse_loop+0xc30/0x1ab0 drivers/acpi/acpica/psloop.c:525
 acpi_ps_parse_aml+0x22d/0x9b0 drivers/acpi/acpica/psparse.c:475
 acpi_ps_execute_method+0x58d/0x7c0 drivers/acpi/acpica/psxface.c:190
 acpi_ns_evaluate+0x5a6/0xa20 drivers/acpi/acpica/nseval.c:205
 acpi_ut_evaluate_object+0x126/0x4c0 drivers/acpi/acpica/uteval.c:60
page last free pid 1 tgid 1 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1258 [inline]
 __free_frozen_pages+0xb0e/0xcd0 mm/page_alloc.c:2721
 __kmem_cache_do_shrink+0x319/0x390 mm/slub.c:6134
 acpi_os_purge_cache+0x15/0x20 drivers/acpi/osl.c:1605
 acpi_purge_cached_objects+0x8f/0xd0 drivers/acpi/acpica/utxface.c:239
 acpi_initialize_objects+0x2e/0xa0 drivers/acpi/acpica/utxfinit.c:250
 acpi_bus_init+0xce/0x6c0 drivers/acpi/bus.c:1367
 acpi_init+0xb4/0x240 drivers/acpi/bus.c:1454
 do_one_initcall+0x233/0x820 init/main.c:1257
 do_initcall_level+0x137/0x1f0 init/main.c:1319
 do_initcalls+0x69/0xd0 init/main.c:1335
 kernel_init_freeable+0x3d9/0x570 init/main.c:1567
 kernel_init+0x1d/0x1d0 init/main.c:1457
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888142efe400: 04 fc fc fc 00 fc fc fc 05 fc fc fc 05 fc fc fc
 ffff888142efe480: fa fc fc fc 04 fc fc fc 05 fc fc fc 05 fc fc fc
>ffff888142efe500: fa fc fc fc fa fc fc fc 05 fc fc fc 05 fc fc fc
                               ^
 ffff888142efe580: fa fc fc fc 07 fc fc fc 05 fc fc fc 05 fc fc fc
 ffff888142efe600: 04 fc fc fc fa fc fc fc 05 fc fc fc 05 fc fc fc
==================================================================


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

