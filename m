Return-Path: <linux-input+bounces-13552-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D31B0654F
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 19:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B2303B6082
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 17:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496582853F8;
	Tue, 15 Jul 2025 17:43:38 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f79.google.com (mail-io1-f79.google.com [209.85.166.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251FC14286
	for <linux-input@vger.kernel.org>; Tue, 15 Jul 2025 17:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752601418; cv=none; b=WE4Alr5MAgW5A57AYxdzpALtf5fcGyjRvQltki/XoYbX3VtC9fPJqmudATjooeQcsEny1KEXI/qXF1yvyugbQ7WbFS+wbDMGTydHG7kBKRtNUZCZNq/V7B2bS3QPG2KNvN2uunqslyA4CqmKToGY4w491y4qArQdBH9ByERv7XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752601418; c=relaxed/simple;
	bh=d2VxN1QyprQdQBGfF+z+e8S8P8f7BLYsXtdovkPpDWQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=L+R/AGFecA9h0oF9dyiI/AFfEJR9zBwLh2DmX3LCVGPj0umf5XyzrnJJTZ/fR0wGWECjmnvJxLl7zM00AQ7cdOYfGoupPzfPObCGgaUL1NtertZCcn4KmD4Rf7up1NfbKhu82SPXPrYV1d0NGYDYxqUCX+6nLU67ASm75H5eSJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f79.google.com with SMTP id ca18e2360f4ac-86f4f032308so1024475939f.1
        for <linux-input@vger.kernel.org>; Tue, 15 Jul 2025 10:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752601415; x=1753206215;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=30RMZ4PMjo2lxfsxJCSphJdF4cgZn2T4gszdkz+Bx2A=;
        b=kcD6Lwa/k9/ybZoRp+ApCNb0YMBt0aXV9/947c4r8FMJeLmFB7itBu0jIPHeFh1FOh
         QZx/0hLtz0QMPpm+OggVMHis+LKveuKlYE1lgrqln0IHLugOAQjCV2Obnb71KMS+pzxW
         rRkhr4rWGkBjTa8ADiPYCxMlvYruw2E1qEX5SGZ6ACrB8Hsnrp5ZA4VvGYRSS8yGW8s0
         3AC/prbpgJ3Bk5K+EMArfl4X+xmXLZYjP7N58tcrHx1d1aD0EZKpTVnjBrgds/kvCFUL
         priAbIo2DO1SjxRRr8Fl50fOeWZjfYDoEu5VPxBVuQcp5Qs1QsTKyZKE6YEJWpFWDD/7
         SCHw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ+77EvLyHpb71YCp8ZfCE+2Pr7f2V8R8ZN9uo/1NHQK4ernVRLbwXhf8ySyhQ77nNk+hSNYUTagb+Cg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVhdouwks2EaGX+GxcHUGTRVBkdTM1Cbq3dX6gPIfOc4rmB45K
	EOEKQhCWejrpEI/7oFTtVDBMz6rlHzH3eLWVshQTsZ/3qiQjf5tfAvqKhSgkPp5DHvqz1d6eiZN
	SIfjz4x6LYmXHlwBN6p61ahG+eBXAHryzfmlCSTfqxJvaD+ODhbznRswCSr8=
X-Google-Smtp-Source: AGHT+IH+HSfSIlBmQl5OvhzRW70HWtukSXsLQzSbFqkHNjRSNqA4YA1ucrNgFxwdkAuTgd0dZDBIqLlCBiOAXRrl9vYM/qhipOog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:140e:b0:879:870b:1b85 with SMTP id
 ca18e2360f4ac-879c093a47bmr32423239f.13.1752601415057; Tue, 15 Jul 2025
 10:43:35 -0700 (PDT)
Date: Tue, 15 Jul 2025 10:43:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68769347.a70a0220.693ce.0012.GAE@google.com>
Subject: [syzbot] [input?] [usb?] INFO: task hung in console_callback (6)
From: syzbot <syzbot+6027421afa74a2ba440d@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, frederic@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    155a3c003e55 Merge tag 'for-6.16/dm-fixes-2' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=122127d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f62a2ef17395702a
dashboard link: https://syzkaller.appspot.com/bug?extid=6027421afa74a2ba440d
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=153c08f0580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=133c08f0580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7ec1d423e273/disk-155a3c00.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4973873f0aff/vmlinux-155a3c00.xz
kernel image: https://storage.googleapis.com/syzbot-assets/76c8269d9f02/bzImage-155a3c00.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6027421afa74a2ba440d@syzkaller.appspotmail.com

INFO: task kworker/1:1:43 blocked for more than 142 seconds.
      Not tainted 6.16.0-rc6-syzkaller-00002-g155a3c003e55 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:1     state:D stack:21016 pid:43    tgid:43    ppid:2      task_flags:0x4208060 flags:0x00004000
Workqueue: events console_callback
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5397 [inline]
 __schedule+0x16f5/0x4d00 kernel/sched/core.c:6786
 __schedule_loop kernel/sched/core.c:6864 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:6879
 schedule_timeout+0x9a/0x270 kernel/time/sleep_timeout.c:75
 ___down_common kernel/locking/semaphore.c:268 [inline]
 __down_common+0x319/0x6a0 kernel/locking/semaphore.c:293
 down+0x80/0xd0 kernel/locking/semaphore.c:100
 console_lock+0x145/0x1b0 kernel/printk/printk.c:2849
 console_callback+0x69/0x440 drivers/tty/vt/vt.c:3202
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
INFO: task kworker/0:2:977 blocked for more than 142 seconds.
      Not tainted 6.16.0-rc6-syzkaller-00002-g155a3c003e55 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:2     state:D stack:24520 pid:977   tgid:977   ppid:2      task_flags:0x4288060 flags:0x00004000
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5397 [inline]
 __schedule+0x16f5/0x4d00 kernel/sched/core.c:6786
 __schedule_loop kernel/sched/core.c:6864 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:6879
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6936
 __mutex_lock_common kernel/locking/mutex.c:679 [inline]
 __mutex_lock+0x724/0xe80 kernel/locking/mutex.c:747
 class_mutex_constructor include/linux/mutex.h:225 [inline]
 __input_unregister_device+0x2d8/0x5e0 drivers/input/input.c:2221
 input_unregister_device+0x9b/0x100 drivers/input/input.c:2452
 hidinput_disconnect+0x226/0x2d0 drivers/hid/hid-input.c:2373
 hid_disconnect drivers/hid/hid-core.c:2325 [inline]
 hid_hw_stop drivers/hid/hid-core.c:2374 [inline]
 hid_device_remove+0x123/0x370 drivers/hid/hid-core.c:2782
 device_remove drivers/base/dd.c:567 [inline]
 __device_release_driver drivers/base/dd.c:1272 [inline]
 device_release_driver_internal+0x46f/0x7c0 drivers/base/dd.c:1295
 bus_remove_device+0x34d/0x410 drivers/base/bus.c:579
 device_del+0x511/0x8e0 drivers/base/core.c:3881
 hid_remove_device drivers/hid/hid-core.c:2964 [inline]
 hid_destroy_device+0x6b/0x1b0 drivers/hid/hid-core.c:2986
 usbhid_disconnect+0x9f/0xc0 drivers/hid/usbhid/hid-core.c:1462
 usb_unbind_interface+0x26b/0x8f0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:569 [inline]
 __device_release_driver drivers/base/dd.c:1272 [inline]
 device_release_driver_internal+0x4d6/0x7c0 drivers/base/dd.c:1295
 bus_remove_device+0x34d/0x410 drivers/base/bus.c:579
 device_del+0x511/0x8e0 drivers/base/core.c:3881
 usb_disable_device+0x3e9/0x8a0 drivers/usb/core/message.c:1418
 usb_disconnect+0x330/0x950 drivers/usb/core/hub.c:2344
 hub_port_connect drivers/usb/core/hub.c:5406 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5706 [inline]
 port_event drivers/usb/core/hub.c:5866 [inline]
 hub_event+0x1cdb/0x4a00 drivers/usb/core/hub.c:5948
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Showing all locks held in the system:
7 locks held by kworker/0:0/9:
 #0: ffff88801ced7148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff88801ced7148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3321
 #1: ffffc900000e7bc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc900000e7bc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3321
 #2: ffff88814433e198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #2: ffff88814433e198 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4a00 drivers/usb/core/hub.c:5894
 #3: ffff888143ef6198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #3: ffff888143ef6198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1004
 #4: ffff888020ac9160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #4: ffff888020ac9160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1004
 #5: ffff888031801a20 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #5: ffff888031801a20 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1004
 #6: ffffffff8ef940c8 (input_mutex){+.+.}-{4:4}, at: class_mutex_intr_constructor include/linux/mutex.h:227 [inline]
 #6: ffffffff8ef940c8 (input_mutex){+.+.}-{4:4}, at: input_register_device+0xa74/0x10b0 drivers/input/input.c:2408
7 locks held by kworker/1:0/24:
 #0: ffff88801ced7148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff88801ced7148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3321
 #1: ffffc900001e7bc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc900001e7bc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3321
 #2: ffff888144384198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #2: ffff888144384198 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4a00 drivers/usb/core/hub.c:5894
 #3: ffff888143ade198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #3: ffff888143ade198 (&dev->mutex){....}-{4:4}, at: usb_disconnect+0xf8/0x950 drivers/usb/core/hub.c:2335
 #4: ffff888144296160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #4: ffff888144296160 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1094 [inline]
 #4: ffff888144296160 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0xb6/0x7c0 drivers/base/dd.c:1292
 #5: ffff888022785a20 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #5: ffff888022785a20 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1094 [inline]
 #5: ffff888022785a20 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0xb6/0x7c0 drivers/base/dd.c:1292
 #6: ffffffff8ef940c8 (input_mutex){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:225 [inline]
 #6: ffffffff8ef940c8 (input_mutex){+.+.}-{4:4}, at: __input_unregister_device+0x2d8/0x5e0 drivers/input/input.c:2221
1 lock held by khungtaskd/31:
 #0: ffffffff8e13f0e0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8e13f0e0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8e13f0e0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6770
7 locks held by kworker/0:2/977:
 #0: ffff88801ced7148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff88801ced7148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3321
 #1: ffffc90003757bc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc90003757bc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3321
 #2: ffff888144701198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #2: ffff888144701198 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4a00 drivers/usb/core/hub.c:5894
 #3: ffff888143ef4198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #3: ffff888143ef4198 (&dev->mutex){....}-{4:4}, at: usb_disconnect+0xf8/0x950 drivers/usb/core/hub.c:2335
 #4: ffff8881442a1160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #4: ffff8881442a1160 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1094 [inline]
 #4: ffff8881442a1160 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0xb6/0x7c0 drivers/base/dd.c:1292
 #5: ffff888076ac5a20 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #5: ffff888076ac5a20 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1094 [inline]
 #5: ffff888076ac5a20 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0xb6/0x7c0 drivers/base/dd.c:1292
 #6: ffffffff8ef940c8 (input_mutex){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:225 [inline]
 #6: ffffffff8ef940c8 (input_mutex){+.+.}-{4:4}, at: __input_unregister_device+0x2d8/0x5e0 drivers/input/input.c:2221
11 locks held by kworker/1:2/1211:
 #0: ffff88801ced7148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff88801ced7148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3321
 #1: ffffc90003defbc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc90003defbc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3321
 #2: ffff8880281c4198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #2: ffff8880281c4198 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4a00 drivers/usb/core/hub.c:5894
 #3: ffff888143ae8198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #3: ffff888143ae8198 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1004
 #4: ffff888144297160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #4: ffff888144297160 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1004
 #5: ffff888034375a20 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #5: ffff888034375a20 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x400 drivers/base/dd.c:1004
 #6: ffffffff8ef940c8 (input_mutex){+.+.}-{4:4}, at: class_mutex_intr_constructor include/linux/mutex.h:227 [inline]
 #6: ffffffff8ef940c8 (input_mutex){+.+.}-{4:4}, at: input_register_device+0xa74/0x10b0 drivers/input/input.c:2408
 #7: ffff8880713028c0 (&led_cdev->led_access){+.+.}-{4:4}, at: led_classdev_register_ext+0x43d/0x930 drivers/leds/led-class.c:524
 #8: ffffffff8e8fa430 (triggers_list_lock){++++}-{4:4}, at: led_trigger_set_default+0x77/0x2a0 drivers/leds/led-triggers.c:297
 #9: ffff8880713027d8 (&led_cdev->trigger_lock){+.+.}-{4:4}, at: led_trigger_set_default+0x87/0x2a0 drivers/leds/led-triggers.c:298
 #10: ffffffff8e144bf8 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_lock kernel/rcu/tree_exp.h:304 [inline]
 #10: ffffffff8e144bf8 (rcu_state.exp_mutex){+.+.}-{4:4}, at: synchronize_rcu_expedited+0x2f6/0x730 kernel/rcu/tree_exp.h:998
2 locks held by getty/5609:
 #0: ffff88814cc2a0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc900036cb2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x43e/0x1400 drivers/tty/n_tty.c:2222
7 locks held by kworker/1:4/5864:
 #0: ffff88801ced7148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff88801ced7148 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3321
 #1: ffffc900042dfbc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc900042dfbc0 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3321
 #2: ffff88802825b198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #2: ffff88802825b198 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4a00 drivers/usb/core/hub.c:5894
 #3: ffff888143adf198 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #3: ffff888143adf198 (&dev->mutex){....}-{4:4}, at: usb_disconnect+0xf8/0x950 drivers/usb/core/hub.c:2335
 #4: ffff888143ad9160 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #4: ffff888143ad9160 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1094 [inline]
 #4: ffff888143ad9160 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0xb6/0x7c0 drivers/base/dd.c:1292
 #5: ffff888025551a20 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:884 [inline]
 #5: ffff888025551a20 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1094 [inline]
 #5: ffff888025551a20 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0xb6/0x7c0 drivers/base/dd.c:1292
 #6: ffffffff8ef940c8 (input_mutex){+.+.}-{4:4}, at: class_mutex_constructor include/linux/mutex.h:225 [inline]
 #6: ffffffff8ef940c8 (input_mutex){+.+.}-{4:4}, at: __input_unregister_device+0x2d8/0x5e0 drivers/input/input.c:2221
1 lock held by udevd/5877:
 #0: ffffffff8e144bf8 (rcu_state.exp_mutex){+.+.}-{4:4}, at: exp_funnel_lock kernel/rcu/tree_exp.h:336 [inline]
 #0: ffffffff8e144bf8 (rcu_state.exp_mutex){+.+.}-{4:4}, at: synchronize_rcu_expedited+0x3b9/0x730 kernel/rcu/tree_exp.h:998

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.16.0-rc6-syzkaller-00002-g155a3c003e55 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x39e/0x3d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x17a/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:158 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:307 [inline]
 watchdog+0xfee/0x1030 kernel/hung_task.c:470
 kthread+0x70e/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 5877 Comm: udevd Not tainted 6.16.0-rc6-syzkaller-00002-g155a3c003e55 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:__sanitizer_cov_trace_const_cmp4+0x0/0x90 kernel/kcov.c:313
Code: 7c 11 10 48 89 74 11 18 48 89 44 11 20 e9 08 ec b1 09 cc 0f 1f 80 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 <f3> 0f 1e fa 48 8b 04 24 65 48 8b 14 25 08 50 a0 92 65 8b 0d 68 18
RSP: 0018:ffffc90004407b50 EFLAGS: 00000246
RAX: 0000000000000001 RBX: ffffffff825d38ac RCX: ffff88802f443c00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: 0000000000000001 R08: 0000000000000000 R09: ffffffff825d38ac
R10: ffffc90004407d80 R11: ffffffff825d3fc0 R12: dffffc0000000000
R13: ffffffff8e29e600 R14: ffff888143fd8f00 R15: ffff888143fd8e10
FS:  00007fc64e491880(0000) GS:ffff888125c1b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fc64db45f5c CR3: 0000000076b08000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 kernfs_root+0xed/0x230 fs/kernfs/kernfs-internal.h:76
 kernfs_iop_getattr+0xa0/0x500 fs/kernfs/inode.c:189
 vfs_getattr_nosec+0x2de/0x430 fs/stat.c:213
 vfs_getattr fs/stat.c:262 [inline]
 vfs_statx_path fs/stat.c:299 [inline]
 vfs_statx+0x1b4/0x550 fs/stat.c:356
 vfs_fstatat+0x118/0x170 fs/stat.c:375
 __do_sys_newfstatat fs/stat.c:542 [inline]
 __se_sys_newfstatat fs/stat.c:536 [inline]
 __x64_sys_newfstatat+0x116/0x190 fs/stat.c:536
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc64dd11b0a
Code: 48 8b 15 f1 f2 0d 00 f7 d8 64 89 02 b8 ff ff ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 41 89 ca b8 06 01 00 00 0f 05 <3d> 00 f0 ff ff 77 07 31 c0 c3 0f 1f 40 00 48 8b 15 b9 f2 0d 00 f7
RSP: 002b:00007ffe06a96758 EFLAGS: 00000246 ORIG_RAX: 0000000000000106
RAX: ffffffffffffffda RBX: 00007ffe06a96bf0 RCX: 00007fc64dd11b0a
RDX: 00007ffe06a96760 RSI: 00007ffe06a96bf0 RDI: 00000000ffffff9c
RBP: 000055565a588910 R08: 0000000000000000 R09: 0000000000000020
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ffe06a967f0
R13: 00007ffe06a97025 R14: 000055563d43cca4 R15: 000055563d43cbcc
 </TASK>


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

