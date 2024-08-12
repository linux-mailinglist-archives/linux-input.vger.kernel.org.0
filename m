Return-Path: <linux-input+bounces-5513-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCBD94E616
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 07:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A4061F2127C
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2024 05:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB5913665B;
	Mon, 12 Aug 2024 05:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8Ol7BWn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A864D8CE;
	Mon, 12 Aug 2024 05:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723439751; cv=none; b=HVTR5GuAzlgfY//kDpM8aPaOr/+n2D+XbU1wNhCzCGvqR9Mtvz/iOpOD3e/iERuZhwdVzXoDdjmNcEHtkshGGKwdIRgLTHMOvnyLppQJfgybQeFChOTuk/e0x69VJ2AEYvz7DvuuqjpKcCjVQrhP+i3fv/Uo/cmqmldguSOsvNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723439751; c=relaxed/simple;
	bh=HbTRGaB4atDQeu/HSFieopHFy6fLV16/kw8ulnZn9V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXgeMB7arTYBDonNt1/nFTtZ1W6EWgQ1Wu06XKkZ3Bw77iK7ksVF8ZhMOXaEIaDdd1ShjkMzic8Nfm3aEnrb7Ltl7/xT/1DuWH53IVIphQUvjsUXXM3E2zagASThXhL398nLGhAVEmd+9M939132G3+MBThPKRcR/gs0ip89z2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8Ol7BWn; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-710d0995e21so2414797b3a.1;
        Sun, 11 Aug 2024 22:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723439748; x=1724044548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NlwPNPOXC5Xd0Kc86K7pj4TibrTcFwuEalbSXZtQZCY=;
        b=A8Ol7BWnoWNs9bfCYDUGykYIlByEU1Sx0OY8LSo8cG8ubKcLSrVVXFkrLaP6yYfFue
         lu7b8TTNEn9MaHQHZWOqeXJM22btQl7fHRnYwwMGNubI8Vl2vKnf/zWyjpaXSdsw+T+c
         4+Ar539qtCKOzWni8/X3LZHye0gJtRQNDPuoNbw0HHaUxNV/Tdmo/U4mwOGTjbYqjiSF
         p7WwCBoTf0I2r6iREnXOPeDbsdKCIX8Fu5k0BbgevIhcCJQ0TCGOhd89XQbTa7OsJRuf
         ilEd/75jRYk7u/OP9hGBkqAjv6ZWb9AYxIB6Fz4xf+a01O6pEkplIQmRvF+DpSvJkxwN
         FLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723439748; x=1724044548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlwPNPOXC5Xd0Kc86K7pj4TibrTcFwuEalbSXZtQZCY=;
        b=cshokWELG7J2Td7ruLpRJfI8enYT2AYjvpptkEH5S15dnwHqbpGbp6rlCgLDa8DqlC
         sOgJOK4Hkp3tkq+RZG7twAb6Zj3pdQTv5LLX4UyAYTGSJCvMifyu1P7K/2wtlGA5sqj2
         PMYuVQ02Fp1FCyabVSB1NGdHHjzL6a5gM/R073GaBhEzpQqYQwn5wcgeMxNJKqim7x7X
         xw4m1i3WpMQ8BrQWva2kylS65LWiskDceT6Z40ZESqJXZtj7aQYaIRnuJlNlzH4WuIVO
         dz9cVZvh2i8yKtXcZWkN6JBBrAjYlHyxDRF2hw80270F/IlEDMOO8Y7OjbL+TtK7bGLs
         Pgnw==
X-Forwarded-Encrypted: i=1; AJvYcCWBOPJpBNSbN2GBWoEWXtQgefPwc0DnEjiMJbBqZdEgTtd5gQ1ty+Hn/qgfQ8pjok20DKx+a+gKK+/5b6idJzf0AeJ/XOUHzthX3GzN
X-Gm-Message-State: AOJu0YzdnVCSVy/r3RPZFvWWVAanttkfhc9E2AzepvAJKd5FXOsH/GWu
	5ooWKzbtBv52b0q6YiHQaGLgl9s9cy2PtKWKlGPISqSh/hNKXrGd4hS04Q==
X-Google-Smtp-Source: AGHT+IEkB32CaPqr10r5voUlNiEdb0mMuz6wm9l+GBMJZbMi877mSGsVNNw9ZHF3IOwoxi+3a+D7Xg==
X-Received: by 2002:a05:6a00:180c:b0:70d:2fb5:f996 with SMTP id d2e1a72fcca58-710dc666edemr7824088b3a.11.1723439747991;
        Sun, 11 Aug 2024 22:15:47 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d735:aa04:8b70:6332])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5a43821sm3136581b3a.120.2024.08.11.22.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 22:15:47 -0700 (PDT)
Date: Sun, 11 Aug 2024 22:15:44 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: syzbot <syzbot+e8b864815e5e34554211@syzkaller.appspotmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com, Boqun Feng <boqun.feng@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [syzbot] [input?] possible deadlock in psmouse_handle_byte
Message-ID: <ZrmagEKn_vJ15-52@google.com>
References: <000000000000c4d780061f3eedaf@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000c4d780061f3eedaf@google.com>

On Fri, Aug 09, 2024 at 05:03:17AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    de9c2c66ad8e Linux 6.11-rc2
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=105ac8f3980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=505ed4a1dd93463a
> dashboard link: https://syzkaller.appspot.com/bug?extid=e8b864815e5e34554211
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/dc943231c101/disk-de9c2c66.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/c48115bc34cd/vmlinux-de9c2c66.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/f08b2b00add3/bzImage-de9c2c66.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+e8b864815e5e34554211@syzkaller.appspotmail.com

Looks like similar issue with between input_dev->event_lock and
f->f_owner.lock was supposed to be handled by:

8d1ddb5e7937 ("fcntl: Fix potential deadlock in send_sig{io, urg}()")
2f488f698fda ("fcntl: fix potential deadlock for &fasync_struct.fa_lock")

It seems that we keep adding "irqsave" to more and more locks. Is there
a better way?

CCing patch authors....

> 
> =====================================================
> WARNING: HARDIRQ-safe -> HARDIRQ-unsafe lock order detected
> 6.11.0-rc2-syzkaller #0 Not tainted
> -----------------------------------------------------
> syz.2.1316/10260 [HC0[0]:SC0[0]:HE0:SE1] is trying to acquire:
> 
> and this task is already holding:
> which would create a new lock dependency:
> 
> but this new dependency connects a HARDIRQ-irq-safe lock:
>  (&dev->event_lock#2){-.-.}-{2:2}
> 
> ... which became HARDIRQ-irq-safe at:
>   psmouse_handle_byte+0x44/0x570 drivers/input/mouse/psmouse-base.c:279
>   psmouse_receive_byte+0x243/0xe20 drivers/input/mouse/psmouse-base.c:426
>   ps2_interrupt+0x20b/0x5b0 drivers/input/serio/libps2.c:613
>   serio_interrupt+0x8f/0x150 drivers/input/serio/serio.c:998
>   i8042_interrupt+0x3f5/0x8a0 drivers/input/serio/i8042.c:606
>   __handle_irq_event_percpu+0x229/0x7c0 kernel/irq/handle.c:158
>   handle_irq_event_percpu kernel/irq/handle.c:193 [inline]
>   handle_irq_event+0xab/0x1e0 kernel/irq/handle.c:210
>   handle_edge_irq+0x263/0xd10 kernel/irq/chip.c:831
>   generic_handle_irq_desc include/linux/irqdesc.h:173 [inline]
>   handle_irq arch/x86/kernel/irq.c:247 [inline]
>   call_irq_handler arch/x86/kernel/irq.c:259 [inline]
>   __common_interrupt+0xdf/0x250 arch/x86/kernel/irq.c:285
>   common_interrupt+0xab/0xd0 arch/x86/kernel/irq.c:278
>   asm_common_interrupt+0x26/0x40 arch/x86/include/asm/idtentry.h:693
>   __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
>   _raw_spin_unlock_irqrestore+0x31/0x80 kernel/locking/spinlock.c:194
>   spin_unlock_irqrestore include/linux/spinlock.h:406 [inline]
>   i8042_command drivers/input/serio/i8042.c:356 [inline]
>   i8042_aux_write+0x11a/0x180 drivers/input/serio/i8042.c:391
>   serio_write include/linux/serio.h:125 [inline]
>   ps2_do_sendbyte+0x264/0x6f0 drivers/input/serio/libps2.c:58
>   ps2_sendbyte+0x59/0x150 drivers/input/serio/libps2.c:113
>   cypress_ps2_sendbyte+0x2c/0xf0 drivers/input/mouse/cypress_ps2.c:43
>   cypress_ps2_read_cmd_status drivers/input/mouse/cypress_ps2.c:111 [inline]
>   cypress_send_ext_cmd+0x1dc/0xa30 drivers/input/mouse/cypress_ps2.c:182
>   cypress_detect+0x8c/0x1a0 drivers/input/mouse/cypress_ps2.c:195
>   psmouse_do_detect drivers/input/mouse/psmouse-base.c:1006 [inline]
>   psmouse_try_protocol+0x21b/0x380 drivers/input/mouse/psmouse-base.c:1020
>   psmouse_extensions+0x61a/0x960 drivers/input/mouse/psmouse-base.c:1143
>   psmouse_switch_protocol+0x538/0x750 drivers/input/mouse/psmouse-base.c:1537
>   psmouse_connect+0x5cc/0xf80 drivers/input/mouse/psmouse-base.c:1626
>   serio_connect_driver drivers/input/serio/serio.c:44 [inline]
>   serio_driver_probe+0x74/0xa0 drivers/input/serio/serio.c:775
>   call_driver_probe drivers/base/dd.c:578 [inline]
>   really_probe+0x23e/0xa90 drivers/base/dd.c:657
>   __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
>   driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
>   __driver_attach+0x283/0x580 drivers/base/dd.c:1215
>   bus_for_each_dev+0x13c/0x1d0 drivers/base/bus.c:368
>   serio_attach_driver drivers/input/serio/serio.c:804 [inline]
>   serio_handle_event+0x2bb/0xa90 drivers/input/serio/serio.c:224
>   process_one_work+0x9c5/0x1b40 kernel/workqueue.c:3231
>   process_scheduled_works kernel/workqueue.c:3312 [inline]
>   worker_thread+0x6c8/0xf20 kernel/workqueue.c:3390
>   kthread+0x2c1/0x3a0 kernel/kthread.c:389
>   ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
> 
> to a HARDIRQ-irq-unsafe lock:
>  (tasklist_lock){.+.+}-{2:2}
> 
> ... which became HARDIRQ-irq-unsafe at:
> ...
>   lock_acquire kernel/locking/lockdep.c:5759 [inline]
>   lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
>   __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
>   _raw_read_lock+0x5f/0x70 kernel/locking/spinlock.c:228
>   __do_wait+0x105/0x890 kernel/exit.c:1591
>   do_wait+0x219/0x570 kernel/exit.c:1635
>   kernel_wait+0xa0/0x160 kernel/exit.c:1811
>   call_usermodehelper_exec_sync kernel/umh.c:137 [inline]
>   call_usermodehelper_exec_work+0xf1/0x170 kernel/umh.c:164
>   process_one_work+0x9c5/0x1b40 kernel/workqueue.c:3231
>   process_scheduled_works kernel/workqueue.c:3312 [inline]
>   worker_thread+0x6c8/0xf20 kernel/workqueue.c:3390
>   kthread+0x2c1/0x3a0 kernel/kthread.c:389
>   ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
> 
> other info that might help us debug this:
> 
> Chain exists of:
>   &dev->event_lock#2 --> &f->f_owner.lock --> tasklist_lock
> 
>  Possible interrupt unsafe locking scenario:
> 
>        CPU0                    CPU1
>        ----                    ----
>   lock(tasklist_lock);
>                                local_irq_disable();
>                                lock(&dev->event_lock#2);
>                                lock(&f->f_owner.lock);
>   <Interrupt>
>     lock(&dev->event_lock#2);
> 
>  *** DEADLOCK ***
> 
> 6 locks held by syz.2.1316/10260:
>  #0: ffff88807ac80420 (sb_writers#6){.+.+}-{0:0}, at: vfs_truncate+0xea/0x4e0 fs/open.c:84
>  #1: ffffffff8dfcf7b0 (file_rwsem){++++}-{0:0}, at: break_lease include/linux/filelock.h:431 [inline]
>  #1: ffffffff8dfcf7b0 (file_rwsem){++++}-{0:0}, at: break_lease include/linux/filelock.h:421 [inline]
>  #1: ffffffff8dfcf7b0 (file_rwsem){++++}-{0:0}, at: vfs_truncate+0x32e/0x4e0 fs/open.c:105
>  #2: ffff88807c2cd018 (&ctx->flc_lock){+.+.}-{2:2}, at: spin_lock include/linux/spinlock.h:351 [inline]
>  #2: ffff88807c2cd018 (&ctx->flc_lock){+.+.}-{2:2}, at: __break_lease+0x49b/0x17d0 fs/locks.c:1564
>  #3: ffffffff8ddb5ca0 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:326 [inline]
>  #3: ffffffff8ddb5ca0 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock include/linux/rcupdate.h:838 [inline]
>  #3: ffffffff8ddb5ca0 (rcu_read_lock){....}-{1:2}, at: kill_fasync fs/fcntl.c:1048 [inline]
>  #3: ffffffff8ddb5ca0 (rcu_read_lock){....}-{1:2}, at: kill_fasync+0x6d/0x4f0 fs/fcntl.c:1042
>  #4: ffff888023e29210 (&new->fa_lock){....}-{2:2}, at: kill_fasync_rcu fs/fcntl.c:1028 [inline]
>  #4: ffff888023e29210 (&new->fa_lock){....}-{2:2}, at: kill_fasync fs/fcntl.c:1049 [inline]
>  #4: ffff888023e29210 (&new->fa_lock){....}-{2:2}, at: kill_fasync+0x138/0x4f0 fs/fcntl.c:1042
>  #5: ffff88805dc6d518 (&f->f_owner.lock){....}-{2:2}, at: send_sigio+0x28/0x3c0 fs/fcntl.c:816
> 
> the dependencies between HARDIRQ-irq-safe lock and the holding lock:
>   -> (&dev->event_lock#2){-.-.}-{2:2} {
>      IN-HARDIRQ-W at:
>                         lock_acquire kernel/locking/lockdep.c:5759 [inline]
>                         lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
>                         __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
>                         _raw_spin_lock_irqsave+0x3a/0x60 kernel/locking/spinlock.c:162
>                         input_event drivers/input/input.c:397 [inline]
>                         input_event+0x70/0xa0 drivers/input/input.c:390
>                         input_report_key include/linux/input.h:426 [inline]
>                         psmouse_report_standard_buttons+0x30/0x80 drivers/input/mouse/psmouse-base.c:128
>                         psmouse_report_standard_packet drivers/input/mouse/psmouse-base.c:146 [inline]
>                         psmouse_process_byte+0x39c/0x8a0 drivers/input/mouse/psmouse-base.c:237
>                         psmouse_handle_byte+0x44/0x570 drivers/input/mouse/psmouse-base.c:279
>                         psmouse_receive_byte+0x243/0xe20 drivers/input/mouse/psmouse-base.c:426
>                         ps2_interrupt+0x20b/0x5b0 drivers/input/serio/libps2.c:613
>                         serio_interrupt+0x8f/0x150 drivers/input/serio/serio.c:998
>                         i8042_interrupt+0x3f5/0x8a0 drivers/input/serio/i8042.c:606
>                         __handle_irq_event_percpu+0x229/0x7c0 kernel/irq/handle.c:158
>                         handle_irq_event_percpu kernel/irq/handle.c:193 [inline]
>                         handle_irq_event+0xab/0x1e0 kernel/irq/handle.c:210
>                         handle_edge_irq+0x263/0xd10 kernel/irq/chip.c:831
>                         generic_handle_irq_desc include/linux/irqdesc.h:173 [inline]
>                         handle_irq arch/x86/kernel/irq.c:247 [inline]
>                         call_irq_handler arch/x86/kernel/irq.c:259 [inline]
>                         __common_interrupt+0xdf/0x250 arch/x86/kernel/irq.c:285
>                         common_interrupt+0xab/0xd0 arch/x86/kernel/irq.c:278
>                         asm_common_interrupt+0x26/0x40 arch/x86/include/asm/idtentry.h:693
>                         __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:151 [inline]
>                         _raw_spin_unlock_irqrestore+0x31/0x80 kernel/locking/spinlock.c:194
>                         spin_unlock_irqrestore include/linux/spinlock.h:406 [inline]
>                         i8042_command drivers/input/serio/i8042.c:356 [inline]
>                         i8042_aux_write+0x11a/0x180 drivers/input/serio/i8042.c:391
>                         serio_write include/linux/serio.h:125 [inline]
>                         ps2_do_sendbyte+0x264/0x6f0 drivers/input/serio/libps2.c:58
>                         ps2_sendbyte+0x59/0x150 drivers/input/serio/libps2.c:113
>                         cypress_ps2_sendbyte+0x2c/0xf0 drivers/input/mouse/cypress_ps2.c:43
>                         cypress_ps2_read_cmd_status drivers/input/mouse/cypress_ps2.c:111 [inline]
>                         cypress_send_ext_cmd+0x1dc/0xa30 drivers/input/mouse/cypress_ps2.c:182
>                         cypress_detect+0x8c/0x1a0 drivers/input/mouse/cypress_ps2.c:195
>                         psmouse_do_detect drivers/input/mouse/psmouse-base.c:1006 [inline]
>                         psmouse_try_protocol+0x21b/0x380 drivers/input/mouse/psmouse-base.c:1020
>                         psmouse_extensions+0x61a/0x960 drivers/input/mouse/psmouse-base.c:1143
>                         psmouse_switch_protocol+0x538/0x750 drivers/input/mouse/psmouse-base.c:1537
>                         psmouse_connect+0x5cc/0xf80 drivers/input/mouse/psmouse-base.c:1626
>                         serio_connect_driver drivers/input/serio/serio.c:44 [inline]
>                         serio_driver_probe+0x74/0xa0 drivers/input/serio/serio.c:775
>                         call_driver_probe drivers/base/dd.c:578 [inline]
>                         really_probe+0x23e/0xa90 drivers/base/dd.c:657
>                         __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
>                         driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
>                         __driver_attach+0x283/0x580 drivers/base/dd.c:1215
>                         bus_for_each_dev+0x13c/0x1d0 drivers/base/bus.c:368
>                         serio_attach_driver drivers/input/serio/serio.c:804 [inline]
>                         serio_handle_event+0x2bb/0xa90 drivers/input/serio/serio.c:224
>                         process_one_work+0x9c5/0x1b40 kernel/workqueue.c:3231
>                         process_scheduled_works kernel/workqueue.c:3312 [inline]
>                         worker_thread+0x6c8/0xf20 kernel/workqueue.c:3390
>                         kthread+0x2c1/0x3a0 kernel/kthread.c:389
>                         ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>                         ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>      IN-SOFTIRQ-W at:
>                         lock_acquire kernel/locking/lockdep.c:5759 [inline]
>                         lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
>                         __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
>                         _raw_spin_lock_irqsave+0x3a/0x60 kernel/locking/spinlock.c:162
>                         input_inject_event+0xa4/0x370 drivers/input/input.c:423
>                         __led_set_brightness drivers/leds/led-core.c:52 [inline]
>                         led_set_brightness_nopm drivers/leds/led-core.c:323 [inline]
>                         led_set_brightness_nosleep drivers/leds/led-core.c:354 [inline]
>                         led_set_brightness+0x211/0x290 drivers/leds/led-core.c:316
>                         led_trigger_event drivers/leds/led-triggers.c:407 [inline]
>                         led_trigger_event+0xda/0x270 drivers/leds/led-triggers.c:395
>                         kbd_propagate_led_state drivers/tty/vt/keyboard.c:1080 [inline]
>                         kbd_bh+0x21b/0x300 drivers/tty/vt/keyboard.c:1269
>                         tasklet_action_common.constprop.0+0x24c/0x3e0 kernel/softirq.c:785
>                         handle_softirqs+0x216/0x8f0 kernel/softirq.c:554
>                         __do_softirq kernel/softirq.c:588 [inline]
>                         invoke_softirq kernel/softirq.c:428 [inline]
>                         __irq_exit_rcu kernel/softirq.c:637 [inline]
>                         irq_exit_rcu+0xbb/0x120 kernel/softirq.c:649
>                         instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1043 [inline]
>                         sysvec_apic_timer_interrupt+0x95/0xb0 arch/x86/kernel/apic/apic.c:1043
>                         asm_sysvec_apic_timer_interrupt+0x1a/0x20 arch/x86/include/asm/idtentry.h:702
>                         lock_acquire+0xef/0x560 kernel/locking/lockdep.c:5732
>                         rcu_lock_acquire include/linux/rcupdate.h:326 [inline]
>                         rcu_read_lock_sched include/linux/rcupdate.h:930 [inline]
>                         pfn_valid include/linux/mmzone.h:2024 [inline]
>                         page_table_check_clear mm/page_table_check.c:70 [inline]
>                         __page_table_check_pte_clear+0x1c0/0x580 mm/page_table_check.c:169
>                         page_table_check_pte_clear include/linux/page_table_check.h:49 [inline]
>                         ptep_get_and_clear_full arch/x86/include/asm/pgtable.h:1284 [inline]
>                         get_and_clear_full_ptes include/linux/pgtable.h:678 [inline]
>                         zap_present_folio_ptes mm/memory.c:1493 [inline]
>                         zap_present_ptes mm/memory.c:1576 [inline]
>                         zap_pte_range mm/memory.c:1618 [inline]
>                         zap_pmd_range mm/memory.c:1736 [inline]
>                         zap_pud_range mm/memory.c:1765 [inline]
>                         zap_p4d_range mm/memory.c:1786 [inline]
>                         unmap_page_range+0x21ac/0x3c10 mm/memory.c:1807
>                         unmap_single_vma+0x194/0x2b0 mm/memory.c:1853
>                         unmap_vmas+0x22f/0x490 mm/memory.c:1897
>                         exit_mmap+0x1b8/0xb20 mm/mmap.c:3412
>                         __mmput+0x12a/0x480 kernel/fork.c:1345
>                         mmput+0x62/0x70 kernel/fork.c:1367
>                         exit_mm kernel/exit.c:571 [inline]
>                         do_exit+0x9bf/0x2bb0 kernel/exit.c:869
>                         do_group_exit+0xd3/0x2a0 kernel/exit.c:1031
>                         get_signal+0x25fd/0x2770 kernel/signal.c:2917
>                         arch_do_signal_or_restart+0x90/0x7e0 arch/x86/kernel/signal.c:310
>                         exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
>                         exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
>                         __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
>                         syscall_exit_to_user_mode+0x150/0x2a0 kernel/entry/common.c:218
>                         do_syscall_64+0xda/0x250 arch/x86/entry/common.c:89
>                         entry_SYSCALL_64_after_hwframe+0x77/0x7f
>      INITIAL USE at:
>                        lock_acquire kernel/locking/lockdep.c:5759 [inline]
>                        lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
>                        __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
>                        _raw_spin_lock_irqsave+0x3a/0x60 kernel/locking/spinlock.c:162
>                        input_inject_event+0xa4/0x370 drivers/input/input.c:423
>                        __led_set_brightness drivers/leds/led-core.c:52 [inline]
>                        led_set_brightness_nopm drivers/leds/led-core.c:323 [inline]
>                        led_set_brightness_nosleep drivers/leds/led-core.c:354 [inline]
>                        led_set_brightness+0x211/0x290 drivers/leds/led-core.c:316
>                        kbd_led_trigger_activate+0xcb/0x110 drivers/tty/vt/keyboard.c:1036
>                        led_trigger_set+0x59a/0xc60 drivers/leds/led-triggers.c:212
>                        led_match_default_trigger drivers/leds/led-triggers.c:269 [inline]
>                        led_match_default_trigger drivers/leds/led-triggers.c:263 [inline]
>                        led_trigger_set_default drivers/leds/led-triggers.c:287 [inline]
>                        led_trigger_set_default+0x1bd/0x2a0 drivers/leds/led-triggers.c:276
>                        led_classdev_register_ext+0x78c/0x9e0 drivers/leds/led-class.c:555
>                        led_classdev_register include/linux/leds.h:273 [inline]
>                        input_leds_connect+0x54a/0x8e0 drivers/input/input-leds.c:145
>                        input_attach_handler.isra.0+0x181/0x260 drivers/input/input.c:1027
>                        input_register_device+0xa8e/0x1140 drivers/input/input.c:2473
>                        atkbd_connect+0x5e2/0xa20 drivers/input/keyboard/atkbd.c:1342
>                        serio_connect_driver drivers/input/serio/serio.c:44 [inline]
>                        serio_driver_probe+0x74/0xa0 drivers/input/serio/serio.c:775
>                        call_driver_probe drivers/base/dd.c:578 [inline]
>                        really_probe+0x23e/0xa90 drivers/base/dd.c:657
>                        __driver_probe_device+0x1de/0x440 drivers/base/dd.c:799
>                        driver_probe_device+0x4c/0x1b0 drivers/base/dd.c:829
>                        __driver_attach+0x283/0x580 drivers/base/dd.c:1215
>                        bus_for_each_dev+0x13c/0x1d0 drivers/base/bus.c:368
>                        serio_attach_driver drivers/input/serio/serio.c:804 [inline]
>                        serio_handle_event+0x2bb/0xa90 drivers/input/serio/serio.c:224
>                        process_one_work+0x9c5/0x1b40 kernel/workqueue.c:3231
>                        process_scheduled_works kernel/workqueue.c:3312 [inline]
>                        worker_thread+0x6c8/0xf20 kernel/workqueue.c:3390
>                        kthread+0x2c1/0x3a0 kernel/kthread.c:389
>                        ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>                        ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>    }
>    ... key      at: [<ffffffff951ecaa0>] __key.7+0x0/0x40
>  -> (&new->fa_lock){....}-{2:2} {
>     INITIAL USE at:
>                      lock_acquire kernel/locking/lockdep.c:5759 [inline]
>                      lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
>                      __raw_write_lock_irq include/linux/rwlock_api_smp.h:195 [inline]
>                      _raw_write_lock_irq+0x36/0x50 kernel/locking/spinlock.c:326
>                      fasync_remove_entry+0xb9/0x1f0 fs/fcntl.c:905
>                      fasync_helper+0xaf/0xd0 fs/fcntl.c:1008
>                      sock_fasync+0x98/0x140 net/socket.c:1446
>                      __fput+0x94a/0xbb0 fs/file_table.c:419
>                      task_work_run+0x14e/0x250 kernel/task_work.c:228
>                      resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
>                      exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
>                      exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
>                      __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
>                      syscall_exit_to_user_mode+0x27b/0x2a0 kernel/entry/common.c:218
>                      do_syscall_64+0xda/0x250 arch/x86/entry/common.c:89
>                      entry_SYSCALL_64_after_hwframe+0x77/0x7f
>     INITIAL READ USE at:
>                           lock_acquire kernel/locking/lockdep.c:5759 [inline]
>                           lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
>                           __raw_read_lock_irqsave include/linux/rwlock_api_smp.h:160 [inline]
>                           _raw_read_lock_irqsave+0x74/0x90 kernel/locking/spinlock.c:236
>                           kill_fasync_rcu fs/fcntl.c:1028 [inline]
>                           kill_fasync fs/fcntl.c:1049 [inline]
>                           kill_fasync+0x138/0x4f0 fs/fcntl.c:1042
>                           sock_wake_async+0x132/0x160 net/socket.c:1475
>                           sk_wake_async include/net/sock.h:2440 [inline]
>                           sk_wake_async include/net/sock.h:2436 [inline]
>                           unix_release_sock+0xb1d/0x1280 net/unix/af_unix.c:713
>                           unix_release+0x91/0xf0 net/unix/af_unix.c:1112
>                           __sock_release+0xb0/0x270 net/socket.c:659
>                           sock_close+0x1c/0x30 net/socket.c:1421
>                           __fput+0x408/0xbb0 fs/file_table.c:422
>                           task_work_run+0x14e/0x250 kernel/task_work.c:228
>                           get_signal+0x1ca/0x2770 kernel/signal.c:2689
>                           arch_do_signal_or_restart+0x90/0x7e0 arch/x86/kernel/signal.c:310
>                           exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
>                           exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
>                           __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
>                           syscall_exit_to_user_mode+0x150/0x2a0 kernel/entry/common.c:218
>                           do_syscall_64+0xda/0x250 arch/x86/entry/common.c:89
>                           entry_SYSCALL_64_after_hwframe+0x77/0x7f
>   }
>   ... key      at: [<ffffffff94f37c00>] __key.0+0x0/0x40
>   ... acquired at:
>    __raw_read_lock_irqsave include/linux/rwlock_api_smp.h:160 [inline]
>    _raw_read_lock_irqsave+0x74/0x90 kernel/locking/spinlock.c:236
>    kill_fasync_rcu fs/fcntl.c:1028 [inline]
>    kill_fasync fs/fcntl.c:1049 [inline]
>    kill_fasync+0x138/0x4f0 fs/fcntl.c:1042
>    mousedev_notify_readers+0x6d9/0xa30 drivers/input/mousedev.c:309
>    mousedev_event+0x84e/0x1490 drivers/input/mousedev.c:394
>    input_handler_events_default+0x116/0x1b0 drivers/input/input.c:2552
>    input_pass_values+0x777/0x8e0 drivers/input/input.c:126
>    input_event_dispose drivers/input/input.c:341 [inline]
>    input_handle_event+0xf0b/0x14d0 drivers/input/input.c:369
>    input_inject_event+0x1bb/0x370 drivers/input/input.c:428
>    evdev_write+0x450/0x750 drivers/input/evdev.c:521
>    vfs_write+0x29a/0x1140 fs/read_write.c:588
>    ksys_write+0x1f8/0x260 fs/read_write.c:643
>    do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>    do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>    entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> -> (&f->f_owner.lock){....}-{2:2} {
>    INITIAL USE at:
>                    lock_acquire kernel/locking/lockdep.c:5759 [inline]
>                    lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
>                    __raw_write_lock_irq include/linux/rwlock_api_smp.h:195 [inline]
>                    _raw_write_lock_irq+0x36/0x50 kernel/locking/spinlock.c:326
>                    f_modown+0x2a/0x380 fs/fcntl.c:93
>                    __f_setown fs/fcntl.c:112 [inline]
>                    f_setown+0xd4/0x2a0 fs/fcntl.c:140
>                    do_fcntl+0x11f7/0x1380 fs/fcntl.c:412
>                    __do_sys_fcntl fs/fcntl.c:492 [inline]
>                    __se_sys_fcntl fs/fcntl.c:477 [inline]
>                    __x64_sys_fcntl+0x174/0x200 fs/fcntl.c:477
>                    do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>                    do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>                    entry_SYSCALL_64_after_hwframe+0x77/0x7f
>    INITIAL READ USE at:
>                         lock_acquire kernel/locking/lockdep.c:5759 [inline]
>                         lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
>                         __raw_read_lock_irq include/linux/rwlock_api_smp.h:169 [inline]
>                         _raw_read_lock_irq+0x67/0x80 kernel/locking/spinlock.c:244
>                         f_getown_ex fs/fcntl.c:214 [inline]
>                         do_fcntl+0x787/0x1380 fs/fcntl.c:415
>                         __do_sys_fcntl fs/fcntl.c:492 [inline]
>                         __se_sys_fcntl fs/fcntl.c:477 [inline]
>                         __x64_sys_fcntl+0x174/0x200 fs/fcntl.c:477
>                         do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>                         do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>                         entry_SYSCALL_64_after_hwframe+0x77/0x7f
>  }
>  ... key      at: [<ffffffff94f36ea0>] __key.2+0x0/0x40
>  ... acquired at:
>    __raw_read_lock_irqsave include/linux/rwlock_api_smp.h:160 [inline]
>    _raw_read_lock_irqsave+0x74/0x90 kernel/locking/spinlock.c:236
>    send_sigio+0x28/0x3c0 fs/fcntl.c:816
>    kill_fasync_rcu fs/fcntl.c:1035 [inline]
>    kill_fasync fs/fcntl.c:1049 [inline]
>    kill_fasync+0x1f6/0x4f0 fs/fcntl.c:1042
>    sock_wake_async+0x132/0x160 net/socket.c:1475
>    sk_wake_async include/net/sock.h:2440 [inline]
>    sk_wake_async include/net/sock.h:2436 [inline]
>    unix_release_sock+0xb1d/0x1280 net/unix/af_unix.c:713
>    unix_release+0x91/0xf0 net/unix/af_unix.c:1112
>    __sock_release+0xb0/0x270 net/socket.c:659
>    sock_close+0x1c/0x30 net/socket.c:1421
>    __fput+0x408/0xbb0 fs/file_table.c:422
>    task_work_run+0x14e/0x250 kernel/task_work.c:228
>    get_signal+0x1ca/0x2770 kernel/signal.c:2689
>    arch_do_signal_or_restart+0x90/0x7e0 arch/x86/kernel/signal.c:310
>    exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
>    exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
>    __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
>    syscall_exit_to_user_mode+0x150/0x2a0 kernel/entry/common.c:218
>    do_syscall_64+0xda/0x250 arch/x86/entry/common.c:89
>    entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> 
> the dependencies between the lock to be acquired
>  and HARDIRQ-irq-unsafe lock:
> -> (tasklist_lock){.+.+}-{2:2} {
>    HARDIRQ-ON-R at:
>                     lock_acquire kernel/locking/lockdep.c:5759 [inline]
>                     lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
>                     __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
>                     _raw_read_lock+0x5f/0x70 kernel/locking/spinlock.c:228
>                     __do_wait+0x105/0x890 kernel/exit.c:1591
>                     do_wait+0x219/0x570 kernel/exit.c:1635
>                     kernel_wait+0xa0/0x160 kernel/exit.c:1811
>                     call_usermodehelper_exec_sync kernel/umh.c:137 [inline]
>                     call_usermodehelper_exec_work+0xf1/0x170 kernel/umh.c:164
>                     process_one_work+0x9c5/0x1b40 kernel/workqueue.c:3231
>                     process_scheduled_works kernel/workqueue.c:3312 [inline]
>                     worker_thread+0x6c8/0xf20 kernel/workqueue.c:3390
>                     kthread+0x2c1/0x3a0 kernel/kthread.c:389
>                     ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>                     ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>    SOFTIRQ-ON-R at:
>                     lock_acquire kernel/locking/lockdep.c:5759 [inline]
>                     lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
>                     __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
>                     _raw_read_lock+0x5f/0x70 kernel/locking/spinlock.c:228
>                     __do_wait+0x105/0x890 kernel/exit.c:1591
>                     do_wait+0x219/0x570 kernel/exit.c:1635
>                     kernel_wait+0xa0/0x160 kernel/exit.c:1811
>                     call_usermodehelper_exec_sync kernel/umh.c:137 [inline]
>                     call_usermodehelper_exec_work+0xf1/0x170 kernel/umh.c:164
>                     process_one_work+0x9c5/0x1b40 kernel/workqueue.c:3231
>                     process_scheduled_works kernel/workqueue.c:3312 [inline]
>                     worker_thread+0x6c8/0xf20 kernel/workqueue.c:3390
>                     kthread+0x2c1/0x3a0 kernel/kthread.c:389
>                     ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>                     ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>    INITIAL USE at:
>                    lock_acquire kernel/locking/lockdep.c:5759 [inline]
>                    lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
>                    __raw_write_lock_irq include/linux/rwlock_api_smp.h:195 [inline]
>                    _raw_write_lock_irq+0x36/0x50 kernel/locking/spinlock.c:326
>                    copy_process+0x4420/0x8de0 kernel/fork.c:2500
>                    kernel_clone+0xfd/0x980 kernel/fork.c:2781
>                    user_mode_thread+0xb4/0xf0 kernel/fork.c:2859
>                    rest_init+0x23/0x2b0 init/main.c:712
>                    start_kernel+0x3df/0x4c0 init/main.c:1103
>                    x86_64_start_reservations+0x18/0x30 arch/x86/kernel/head64.c:507
>                    x86_64_start_kernel+0xb2/0xc0 arch/x86/kernel/head64.c:488
>                    common_startup_64+0x13e/0x148
>    INITIAL READ USE at:
>                         lock_acquire kernel/locking/lockdep.c:5759 [inline]
>                         lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
>                         __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
>                         _raw_read_lock+0x5f/0x70 kernel/locking/spinlock.c:228
>                         __do_wait+0x105/0x890 kernel/exit.c:1591
>                         do_wait+0x219/0x570 kernel/exit.c:1635
>                         kernel_wait+0xa0/0x160 kernel/exit.c:1811
>                         call_usermodehelper_exec_sync kernel/umh.c:137 [inline]
>                         call_usermodehelper_exec_work+0xf1/0x170 kernel/umh.c:164
>                         process_one_work+0x9c5/0x1b40 kernel/workqueue.c:3231
>                         process_scheduled_works kernel/workqueue.c:3312 [inline]
>                         worker_thread+0x6c8/0xf20 kernel/workqueue.c:3390
>                         kthread+0x2c1/0x3a0 kernel/kthread.c:389
>                         ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>                         ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>  }
>  ... key      at: [<ffffffff8da0a098>] tasklist_lock+0x18/0x40
>  ... acquired at:
>    lock_acquire kernel/locking/lockdep.c:5759 [inline]
>    lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
>    __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
>    _raw_read_lock+0x5f/0x70 kernel/locking/spinlock.c:228
>    send_sigio+0xb4/0x3c0 fs/fcntl.c:830
>    kill_fasync_rcu fs/fcntl.c:1035 [inline]
>    kill_fasync fs/fcntl.c:1049 [inline]
>    kill_fasync+0x1f6/0x4f0 fs/fcntl.c:1042
>    lease_break_callback+0x23/0x30 fs/locks.c:558
>    __break_lease+0x67c/0x17d0 fs/locks.c:1592
>    break_lease include/linux/filelock.h:431 [inline]
>    break_lease include/linux/filelock.h:421 [inline]
>    vfs_truncate+0x32e/0x4e0 fs/open.c:105
>    do_sys_truncate fs/open.c:134 [inline]
>    __do_sys_truncate fs/open.c:146 [inline]
>    __se_sys_truncate fs/open.c:144 [inline]
>    __x64_sys_truncate+0x174/0x1e0 fs/open.c:144
>    do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>    do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>    entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> 
> stack backtrace:
> CPU: 0 UID: 0 PID: 10260 Comm: syz.2.1316 Not tainted 6.11.0-rc2-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:93 [inline]
>  dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:119
>  print_bad_irq_dependency kernel/locking/lockdep.c:2625 [inline]
>  check_irq_usage+0xe3c/0x1490 kernel/locking/lockdep.c:2864
>  check_prev_add kernel/locking/lockdep.c:3137 [inline]
>  check_prevs_add kernel/locking/lockdep.c:3252 [inline]
>  validate_chain kernel/locking/lockdep.c:3868 [inline]
>  __lock_acquire+0x2503/0x3cb0 kernel/locking/lockdep.c:5142
>  lock_acquire kernel/locking/lockdep.c:5759 [inline]
>  lock_acquire+0x1b1/0x560 kernel/locking/lockdep.c:5724
>  __raw_read_lock include/linux/rwlock_api_smp.h:150 [inline]
>  _raw_read_lock+0x5f/0x70 kernel/locking/spinlock.c:228
>  send_sigio+0xb4/0x3c0 fs/fcntl.c:830
>  kill_fasync_rcu fs/fcntl.c:1035 [inline]
>  kill_fasync fs/fcntl.c:1049 [inline]
>  kill_fasync+0x1f6/0x4f0 fs/fcntl.c:1042
>  lease_break_callback+0x23/0x30 fs/locks.c:558
>  __break_lease+0x67c/0x17d0 fs/locks.c:1592
>  break_lease include/linux/filelock.h:431 [inline]
>  break_lease include/linux/filelock.h:421 [inline]
>  vfs_truncate+0x32e/0x4e0 fs/open.c:105
>  do_sys_truncate fs/open.c:134 [inline]
>  __do_sys_truncate fs/open.c:146 [inline]
>  __se_sys_truncate fs/open.c:144 [inline]
>  __x64_sys_truncate+0x174/0x1e0 fs/open.c:144
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fab6db779f9
> Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fab6e94d048 EFLAGS: 00000246 ORIG_RAX: 000000000000004c
> RAX: ffffffffffffffda RBX: 00007fab6dd05f80 RCX: 00007fab6db779f9
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000020000040
> RBP: 00007fab6dbe58ee R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 000000000000000b R14: 00007fab6dd05f80 R15: 00007fff86339048
>  </TASK>
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup

-- 
Dmitry

