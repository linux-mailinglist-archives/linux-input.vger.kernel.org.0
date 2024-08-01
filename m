Return-Path: <linux-input+bounces-5268-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6729594483A
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2024 11:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A8A61C214BC
	for <lists+linux-input@lfdr.de>; Thu,  1 Aug 2024 09:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37349189B86;
	Thu,  1 Aug 2024 09:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infogain-com.20230601.gappssmtp.com header.i=@infogain-com.20230601.gappssmtp.com header.b="PzdeRxfi"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2F84594D
	for <linux-input@vger.kernel.org>; Thu,  1 Aug 2024 09:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722504329; cv=none; b=ku15mZU7/D+U81lVMf38NEzYAEaRbp7b+3Trd/YqRcoWLlgxNxpezf0MD3/A17s6FdeMSfAXDvTJPZiy9c98x5v5qWlkoonglaCe2k0Lwg+OqlMbdCNhxsGT70vknH8o7BpKwSA2rdtaKh21lauvfUFdM0uTtkjlTL2kYmtCeyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722504329; c=relaxed/simple;
	bh=lbglg/Mpx3pX8ZICFqAdxoB5ICUG9AEOHbFvgEIw740=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=k//zjYOKA+S174k5CbFRYv/Irm25CvRjEE45cGVHNv7Jx9/q46T3h1mRdp4a3Z/hh432kkt8Q1W7+ZmQtO/i3hNZvLeMudL3wPHqv8REumcX9247RUmimhEFUXr549r2OWkzIYpJttajzoGgavDZZcK7gjDmummeW13BUWwbMhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=infogain.com; spf=fail smtp.mailfrom=infogain.com; dkim=pass (2048-bit key) header.d=infogain-com.20230601.gappssmtp.com header.i=@infogain-com.20230601.gappssmtp.com header.b=PzdeRxfi; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=infogain.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=infogain.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42819654737so38808455e9.1
        for <linux-input@vger.kernel.org>; Thu, 01 Aug 2024 02:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=infogain-com.20230601.gappssmtp.com; s=20230601; t=1722504323; x=1723109123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H0CHF4pps4YreqwHY67zaT5Ce2XnYtQmLVn1IuYuhb4=;
        b=PzdeRxfiZKs/joITKuUkxkDnzelEgmaM9Lqn13VwmoRg9AMrIAb0v6F30NCkLOGi+q
         beJA4OeO2RHaam62H7CoRi66BdZnliouT+C5tdBluw0D4N8HThfMORNG+rZJJM/rrvBu
         jcKbbLeoDvYoZPiUSosWX7ETJSJ4zpjbsAgfiJbNiO+Cp9C0VBKpOVwB13xQSWVHCKqi
         IJxyXyxhXXaw3/JNczt46/eg2rzkrJwEbAkb0MteRc6vLXeafLazbXElFpmnI8mZDJES
         53gYJpC8dtrRgxzy+0atpV1euYNaINZkspYArmHRG+fq4hOoOKhV6QekncphtidfwTAx
         PGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722504323; x=1723109123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0CHF4pps4YreqwHY67zaT5Ce2XnYtQmLVn1IuYuhb4=;
        b=K8b2bSkVC+oWsXIvYVato0PYCWQwbENmnGWcHGQnTmJO7mLACE0i0JGDwrhCTT50++
         axqK4dBtbpmWeKbVOkBWb/aM2sR/JoSZb6eQKRgmOuMT/Np/rRwkO0483roCRMaOMBaR
         rjogLWFSwDuQgzj4lof5DUbsx05Ao3xdvLf4DLJF8rPXANYouLoaCZIh1KD6Sy1/2NgV
         FTmWziEy4iMnGcRt1Qct7GuGZCIVo/4H1eqBlEDNAOx0MooAFdmrEBFj/eZIfz0i8p5T
         lC3DokvQN6y7xjYgaTRjVANkeWdccqvmUILHgn3r9YXm/7nc8RReZEqifOh0VRIzgzB7
         PzwA==
X-Gm-Message-State: AOJu0YzX3OqPDeyAE5hmhpCE0WkxEmkQG7MgSMJfAy1YbGy3OlHlW0KV
	JGGe8sU9NtCs8vWVIg3ek9JZ8WzxEzj2qAJ/GqoRgpi6ADLS2zbxinVQnspKQK6w5HSZ2MqhahT
	2dP0=
X-Google-Smtp-Source: AGHT+IGUq9zsQoTDKSMx9QjPsandly5EZ2Mjoq6zYR2DwvYXRwsVUxNlCYAi/h9STkCgbhNcAg3cwg==
X-Received: by 2002:a05:600c:6c4e:b0:426:6a53:e54f with SMTP id 5b1f17b1804b1-428b032c05cmr11669725e9.33.1722504322337;
        Thu, 01 Aug 2024 02:25:22 -0700 (PDT)
Received: from localhost.localdomain (apn-31-0-3-137.dynamic.gprs.plus.pl. [31.0.3.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb1dfd6sm49105465e9.42.2024.08.01.02.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:25:21 -0700 (PDT)
From: =?UTF-8?q?Wojciech=20G=C5=82adysz?= <wojciech.gladysz@infogain.com>
To: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.torokhov@gmail.com
Cc: =?UTF-8?q?Wojciech=20G=C5=82adysz?= <wojciech.gladysz@infogain.com>
Subject: [PATCH] kernel/evdev: suppress irq bad dependency lockdep report
Date: Thu,  1 Aug 2024 11:24:57 +0200
Message-Id: <20240801092457.9982-1-wojciech.gladysz@infogain.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Lockdep connects soft irq (keyboard tasklet injecting led events)
and vfs started (lease break) locking chains. In the test scenario
the chains do not connect due to event type/code and client->fasync.

commit 45a3e24f65e9 ("Linux 6.4-rc7")
Backtrace
=====================================================
WARNING: SOFTIRQ-safe -> SOFTIRQ-unsafe lock order detected
5.10.0-syzkaller #0 Not tainted
-----------------------------------------------------
syz-executor175/2640 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
ffffffff8720b458 (tasklist_lock){.+.+}-{2:2}, at: send_sigio+0xdc/0x340

and this task is already holding:
ffff88800bc0e978 (&f->f_owner.lock){....}-{2:2}, at: send_sigio+0x31/0x340
which would create a new lock dependency:
 (&f->f_owner.lock){....}-{2:2} -> (tasklist_lock){.+.+}-{2:2}

but this new dependency connects a SOFTIRQ-irq-safe lock:
 (&client->buffer_lock){..-.}-{2:2}

... which became SOFTIRQ-irq-safe at:
  lock_acquire+0x197/0x480
  _raw_spin_lock+0x2a/0x40
  evdev_pass_values+0xef/0xaf0
  evdev_events+0x1ba/0x2f0
  input_pass_values+0x87e/0x1200
  input_handle_event+0xc17/0x1500
  input_inject_event+0x1eb/0x2f0
  kbd_update_leds_helper+0xfd/0x130
  input_handler_for_each_handle+0xdc/0x1a0
  kbd_bh+0x180/0x250
  tasklet_action_common+0x2e1/0x3d0
  tasklet_action+0x1d/0x20
  __do_softirq+0x3e6/0x94e
  run_ksoftirqd+0x96/0xf0
  smpboot_thread_fn+0x557/0x900
  kthread+0x374/0x3f0
  ret_from_fork+0x3a/0x50

to a SOFTIRQ-irq-unsafe lock:
 (tasklist_lock){.+.+}-{2:2}

... which became SOFTIRQ-irq-unsafe at:
...
  lock_acquire+0x197/0x480
  _raw_read_lock+0x32/0x50
  do_wait+0x356/0xc80
  kernel_wait+0xe5/0x240
  call_usermodehelper_exec_work+0xb7/0x220
  process_one_work+0x857/0xfd0
  worker_thread+0xafa/0x1550
  kthread+0x374/0x3f0
  ret_from_fork+0x3a/0x50

other info that might help us debug this:

Chain exists of:
  &client->buffer_lock --> &f->f_owner.lock --> tasklist_lock

 Possible interrupt unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(tasklist_lock);
                               local_irq_disable();
                               lock(&client->buffer_lock);
                               lock(&f->f_owner.lock);
  <Interrupt>
    lock(&client->buffer_lock);

 *** DEADLOCK ***

5 locks held by syz-executor175/2640:
 #0: ffffffff879b7bf0 (file_rwsem){.+.+}-{0:0}, at: __break_lease+0x186/0x1300
 #1: ffff88800f2d2dd8 (&ctx->flc_lock){+.+.}-{2:2}, at: __break_lease+0x193/0x1300
 #2: ffffffff8784ba80 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire+0x9/0x40
 #3: ffff88800ea3d9f0 (&new->fa_lock){....}-{2:2}, at: kill_fasync+0x15f/0x480
 #4: ffff88800bc0e978 (&f->f_owner.lock){....}-{2:2}, at: send_sigio+0x31/0x340

the dependencies between SOFTIRQ-irq-safe lock and the holding lock:
  -> (&client->buffer_lock){..-.}-{2:2} {
     IN-SOFTIRQ-W at:
                        lock_acquire+0x197/0x480
                        _raw_spin_lock+0x2a/0x40
                        evdev_pass_values+0xef/0xaf0
                        evdev_events+0x1ba/0x2f0
                        input_pass_values+0x87e/0x1200
                        input_handle_event+0xc17/0x1500
                        input_inject_event+0x1eb/0x2f0
                        kbd_update_leds_helper+0xfd/0x130
                        input_handler_for_each_handle+0xdc/0x1a0
                        kbd_bh+0x180/0x250
                        tasklet_action_common+0x2e1/0x3d0
                        tasklet_action+0x1d/0x20
                        __do_softirq+0x3e6/0x94e
                        run_ksoftirqd+0x96/0xf0
                        smpboot_thread_fn+0x557/0x900
                        kthread+0x374/0x3f0
                        ret_from_fork+0x3a/0x50
     INITIAL USE at:
                       lock_acquire+0x197/0x480
                       _raw_spin_lock+0x2a/0x40
                       evdev_pass_values+0xef/0xaf0
                       evdev_events+0x1ba/0x2f0
                       input_pass_values+0x87e/0x1200
                       input_handle_event+0xc17/0x1500
                       input_inject_event+0x1eb/0x2f0
                       evdev_write+0x37b/0x580
                       vfs_write+0x287/0xc90
                       ksys_write+0x17e/0x2a0
                       __x64_sys_write+0x7b/0x90
                       do_syscall_64+0x4f/0x60
                       entry_SYSCALL_64_after_hwframe+0x61/0xc6
   }
   ... key      at: [<ffffffff895f5640>] evdev_open.__key.17+0x0/0x20
 -> (&new->fa_lock){....}-{2:2} {
    INITIAL READ USE at:
                          lock_acquire+0x197/0x480
                          _raw_read_lock_irqsave+0xb8/0x100
                          kill_fasync+0x15f/0x480
                          evdev_pass_values+0x5b9/0xaf0
                          evdev_events+0x1ba/0x2f0
                          input_pass_values+0x87e/0x1200
                          input_handle_event+0xc17/0x1500
                          input_inject_event+0x1eb/0x2f0
                          evdev_write+0x37b/0x580
                          vfs_write+0x287/0xc90
                          ksys_write+0x17e/0x2a0
                          __x64_sys_write+0x7b/0x90
                          do_syscall_64+0x4f/0x60
                          entry_SYSCALL_64_after_hwframe+0x61/0xc6
  }
  ... key      at: [<ffffffff8943f5e0>] fasync_insert_entry.__key+0x0/0x20
  ... acquired at:
   lock_acquire+0x197/0x480
   _raw_read_lock_irqsave+0xb8/0x100
   kill_fasync+0x15f/0x480
   evdev_pass_values+0x5b9/0xaf0
   evdev_events+0x1ba/0x2f0
   input_pass_values+0x87e/0x1200
   input_handle_event+0xc17/0x1500
   input_inject_event+0x1eb/0x2f0
   evdev_write+0x37b/0x580
   vfs_write+0x287/0xc90
   ksys_write+0x17e/0x2a0
   __x64_sys_write+0x7b/0x90
   do_syscall_64+0x4f/0x60
   entry_SYSCALL_64_after_hwframe+0x61/0xc6

-> (&f->f_owner.lock){....}-{2:2} {
   INITIAL USE at:
                   lock_acquire+0x197/0x480
                   _raw_write_lock_irq+0xab/0xf0
                   f_modown+0x3b/0x350
                   do_fcntl+0x139b/0x1750
                   __se_sys_fcntl+0xe3/0x1c0
                   __x64_sys_fcntl+0x7b/0x90
                   do_syscall_64+0x4f/0x60
                   entry_SYSCALL_64_after_hwframe+0x61/0xc6
   INITIAL READ USE at:
                        lock_acquire+0x197/0x480
                        _raw_read_lock_irqsave+0xb8/0x100
                        send_sigio+0x31/0x340
                        kill_fasync+0x1fb/0x480
                        evdev_pass_values+0x5b9/0xaf0
                        evdev_events+0x1ba/0x2f0
                        input_pass_values+0x87e/0x1200
                        input_handle_event+0xc17/0x1500
                        input_inject_event+0x1eb/0x2f0
                        evdev_write+0x37b/0x580
                        vfs_write+0x287/0xc90
                        ksys_write+0x17e/0x2a0
                        __x64_sys_write+0x7b/0x90
                        do_syscall_64+0x4f/0x60
                        entry_SYSCALL_64_after_hwframe+0x61/0xc6
 }
 ... key      at: [<ffffffff8943e960>] __alloc_file.__key+0x0/0x10
 ... acquired at:
   lock_acquire+0x197/0x480
   _raw_read_lock_irqsave+0xb8/0x100
   send_sigio+0x31/0x340
   kill_fasync+0x1fb/0x480
   evdev_pass_values+0x5b9/0xaf0
   evdev_events+0x1ba/0x2f0
   input_pass_values+0x87e/0x1200
   input_handle_event+0xc17/0x1500
   input_inject_event+0x1eb/0x2f0
   evdev_write+0x37b/0x580
   vfs_write+0x287/0xc90
   ksys_write+0x17e/0x2a0
   __x64_sys_write+0x7b/0x90
   do_syscall_64+0x4f/0x60
   entry_SYSCALL_64_after_hwframe+0x61/0xc6

the dependencies between the lock to be acquired
 and SOFTIRQ-irq-unsafe lock:
-> (tasklist_lock){.+.+}-{2:2} {
   HARDIRQ-ON-R at:
                    lock_acquire+0x197/0x480
                    _raw_read_lock+0x32/0x50
                    do_wait+0x356/0xc80
                    kernel_wait+0xe5/0x240
                    call_usermodehelper_exec_work+0xb7/0x220
                    process_one_work+0x857/0xfd0
                    worker_thread+0xafa/0x1550
                    kthread+0x374/0x3f0
                    ret_from_fork+0x3a/0x50
   SOFTIRQ-ON-R at:
                    lock_acquire+0x197/0x480
                    _raw_read_lock+0x32/0x50
                    do_wait+0x356/0xc80
                    kernel_wait+0xe5/0x240
                    call_usermodehelper_exec_work+0xb7/0x220
                    process_one_work+0x857/0xfd0
                    worker_thread+0xafa/0x1550
                    kthread+0x374/0x3f0
                    ret_from_fork+0x3a/0x50
   INITIAL USE at:
                   lock_acquire+0x197/0x480
                   _raw_write_lock_irq+0xab/0xf0
                   copy_process+0x2192/0x3880
                   kernel_clone+0x220/0x7a0
                   kernel_thread+0x147/0x1c0
                   rest_init+0x24/0x300
                   arch_call_rest_init+0xe/0x11
                   start_kernel+0x469/0x512
                   x86_64_start_reservations+0x2a/0x2d
                   x86_64_start_kernel+0x60/0x64
                   secondary_startup_64_no_verify+0xac/0xbb
   INITIAL READ USE at:
                        lock_acquire+0x197/0x480
                        _raw_read_lock+0x32/0x50
                        do_wait+0x356/0xc80
                        kernel_wait+0xe5/0x240
                        call_usermodehelper_exec_work+0xb7/0x220
                        process_one_work+0x857/0xfd0
                        worker_thread+0xafa/0x1550
                        kthread+0x374/0x3f0
                        ret_from_fork+0x3a/0x50
 }
 ... key      at: [<ffffffff8720b458>] tasklist_lock+0x18/0x40
 ... acquired at:
   lock_acquire+0x197/0x480
   _raw_read_lock+0x32/0x50
   send_sigio+0xdc/0x340
   kill_fasync+0x1fb/0x480
   lease_break_callback+0x26/0x30
   __break_lease+0x4d1/0x1300
   do_dentry_open+0x6ac/0xf40
   vfs_open+0x73/0x80
   path_openat+0x26c5/0x3290
   do_filp_open+0x20b/0x450
   do_sys_openat2+0x124/0x460
   __x64_sys_open+0x221/0x270
   do_syscall_64+0x4f/0x60
   entry_SYSCALL_64_after_hwframe+0x61/0xc6

stack backtrace:
CPU: 2 PID: 2640 Comm: syz-executor175 Not tainted 5.10.0-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
Call Trace:
 dump_stack+0x183/0x226
 validate_chain+0x4cca/0x5870
 __lock_acquire+0x12fd/0x20d0
 lock_acquire+0x197/0x480
 _raw_read_lock+0x32/0x50
 send_sigio+0xdc/0x340
 kill_fasync+0x1fb/0x480
 lease_break_callback+0x26/0x30
 __break_lease+0x4d1/0x1300
 do_dentry_open+0x6ac/0xf40
 vfs_open+0x73/0x80
 path_openat+0x26c5/0x3290
 do_filp_open+0x20b/0x450
 do_sys_openat2+0x124/0x460
 __x64_sys_open+0x221/0x270
 do_syscall_64+0x4f/0x60
 entry_SYSCALL_64_after_hwframe+0x61/0xc6
RIP: 0033:0x7f65eb366509
Code: 28 c3 e8 1a 15 00 00 66 2e 0f 1f 84 00 00 00 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fffac3b94b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 00007f65eb3d3ed0 RCX: 00007f65eb366509
RDX: 0000000000000000 RSI: 0000000000004c01 RDI: 0000000020000240
RBP: 00007fffac3b94c8 R08: 00007f65eb3d3e40 R09: 00007f65eb3d3e40
R10: 00007f65eb3d3e40 R11: 0000000000000246 R12: 00007fffac3b94d0
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000

Signed-off-by: Wojciech Gładysz <wojciech.gladysz@infogain.com>
---
 drivers/input/evdev.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index a8ce3d140722..e579e5b98757 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -257,8 +257,13 @@ static void evdev_pass_values(struct evdev_client *client,
 	event.input_event_sec = ts.tv_sec;
 	event.input_event_usec = ts.tv_nsec / NSEC_PER_USEC;
 
-	/* Interrupts are disabled, just acquire the lock. */
-	spin_lock(&client->buffer_lock);
+	/*
+	 * Disable lockdep chain connecting with subclass based on fasync
+	 * to suppress lockdep report. No further locking for NULL fasync
+	 * (keybord_tasklet injecting input events).
+	 * Interrupts are disabled, just acquire the lock.
+	 */
+	spin_lock_nested(&client->buffer_lock, !client->fasync);
 
 	for (v = vals; v != vals + count; v++) {
 		if (__evdev_is_filtered(client, v->type, v->code))
-- 
2.35.3


