Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB9478B9BE
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2019 15:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728992AbfHMNM7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Aug 2019 09:12:59 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39080 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727607AbfHMNM7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Aug 2019 09:12:59 -0400
Received: by mail-pg1-f194.google.com with SMTP id u17so51242459pgi.6
        for <linux-input@vger.kernel.org>; Tue, 13 Aug 2019 06:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M4yC4xxf7HHhY83Tsjzd2oLWRvGfccu1vv450hTOufI=;
        b=J18xRW5cHmENHZkY1Pojt43C+r7J0hFGXA254znYXF4D1PudPwQYvQ0eukblN+Orre
         r7ENEz7jM2zcE4vIh6oC7xhjFwfCk4kco/q8RxpuTI+2QBO4Gxo76h5VXGFoWdtwAPgg
         0r0kc0A/6aFpxeiDfSl+XgEWEKD+nM5Mv7JQCA9DUdWpfwOrWUv1MDvQHR6lQjvm8knN
         YH6yfXqHRIGqp/LrzrGeeNPVSlGiQiPzWMk1BXVEQmL8cOmr9DU07mgjcUa5lfx+rgtK
         nroig8ph5D9Dlig1jMvUdFMP4GifpKUovnoqySm/JKFjUOxNdTk4PygUFTYEloflTOYm
         73PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M4yC4xxf7HHhY83Tsjzd2oLWRvGfccu1vv450hTOufI=;
        b=ko3pWVIOK+RqZgV7eddJ8ziMnsa0dloiuOUydkpw2GyYpCcS/++qq0+in44WgXqJWh
         1fe4X1v0mjDjfLSGuCMRGbfQuEt1P5/h0Nt+9F/uFNrdjTMspGy9oww/kfF6/vBK5g7C
         O/96bUDKxl8BjTGBl98uFRyfcO585MEFUh5BvNJNLH9II5xGRYJtwARNEKL/4K9lfZ1q
         3QW8va8qxyxWaU7/WrKZ1xADyWmuftUsVIynpKpFAz/wV88A200KI/FlfI4Pquknsl3Y
         xOR3TfHFwBzgN2fP3Bvusy7fBsBQ5FHlp/JkYIadZP+FTPW5OMCr3w+L+0+uQ/oodq4H
         kThw==
X-Gm-Message-State: APjAAAV2QfK0Mod3wnN1zA5nX4LF+yk+HandAUvFdabcJWGq07Gvit5K
        P7GKZbWLtghnpSe/oVRuZpx2OIrzC992WAqPTprSiw==
X-Google-Smtp-Source: APXvYqxiMsoLr99dFyzUIJJy+54RKRDpYAGRJnBkj1+1NBqdnaH0AsVcu5UVehhSWp8iU4iWD+1oJqwVd/AHWJfHUGg=
X-Received: by 2002:a17:90a:858c:: with SMTP id m12mr2175012pjn.129.1565701978037;
 Tue, 13 Aug 2019 06:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000c8bea1058f5d6bf6@google.com>
In-Reply-To: <000000000000c8bea1058f5d6bf6@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 13 Aug 2019 15:12:47 +0200
Message-ID: <CAAeHK+zczjS33oWa+FsD+sHt37m5eCEPf8HMtE4m-PH=3GyXUg@mail.gmail.com>
Subject: Re: WARNING in usbtouch_reset_resume
To:     syzbot <syzbot+91f7bbcce580376d784e@syzkaller.appspotmail.com>
Cc:     allison@lohutok.net, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>, rfontana@redhat.com,
        Henrik Rydberg <rydberg@bitmath.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 5, 2019 at 1:58 PM syzbot
<syzbot+91f7bbcce580376d784e@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=1104baf8600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> dashboard link: https://syzkaller.appspot.com/bug?extid=91f7bbcce580376d784e
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14199a62600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17d94aaa600000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+91f7bbcce580376d784e@syzkaller.appspotmail.com
>
> input: USB Touchscreen 0eef:0002 as
> /devices/platform/dummy_hcd.0/usb1/1-1/1-1:0.180/input/input5
> usb 1-1: reset high-speed USB device number 2 using dummy_hcd
> usb 1-1: Using ep0 maxpacket: 32
> ------------[ cut here ]------------
> DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> WARNING: CPU: 0 PID: 12 at kernel/locking/mutex.c:912 __mutex_lock_common
> kernel/locking/mutex.c:912 [inline]
> WARNING: CPU: 0 PID: 12 at kernel/locking/mutex.c:912
> __mutex_lock+0xd31/0x1360 kernel/locking/mutex.c:1077
> Kernel panic - not syncing: panic_on_warn set ...
> CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.3.0-rc2+ #25
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Workqueue: usb_hub_wq hub_event
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   panic+0x2a3/0x6da kernel/panic.c:219
>   __warn.cold+0x20/0x4a kernel/panic.c:576
>   report_bug+0x262/0x2a0 lib/bug.c:186
>   fixup_bug arch/x86/kernel/traps.c:179 [inline]
>   fixup_bug arch/x86/kernel/traps.c:174 [inline]
>   do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:272
>   do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:291
>   invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1026
> RIP: 0010:__mutex_lock_common kernel/locking/mutex.c:912 [inline]
> RIP: 0010:__mutex_lock+0xd31/0x1360 kernel/locking/mutex.c:1077
> Code: d2 0f 85 f6 05 00 00 44 8b 05 7b de 1c 02 45 85 c0 0f 85 0a f4 ff ff
> 48 c7 c6 c0 92 c6 85 48 c7 c7 60 90 c6 85 e8 f4 c4 a6 fb <0f> 0b e9 f0 f3
> ff ff 65 48 8b 1c 25 00 ef 01 00 be 08 00 00 00 48
> RSP: 0018:ffff8881da20f6b0 EFLAGS: 00010286
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: ffffffff8128a0fd RDI: ffffed103b441ec8
> RBP: ffff8881da20f820 R08: ffff8881da1f9800 R09: fffffbfff0d9ee35
> R10: fffffbfff0d9ee34 R11: ffffffff86cf71a3 R12: 0000000000000000
> R13: dffffc0000000000 R14: ffff8881d2e291c8 R15: ffff8881d2fba228
>   usbtouch_reset_resume+0xb1/0x170
> drivers/input/touchscreen/usbtouchscreen.c:1611
>   usb_resume_interface drivers/usb/core/driver.c:1242 [inline]
>   usb_resume_interface.isra.0+0x184/0x390 drivers/usb/core/driver.c:1210
>   usb_resume_both+0x26a/0x7b0 drivers/usb/core/driver.c:1412
>   __rpm_callback+0x27e/0x3c0 drivers/base/power/runtime.c:355
>   rpm_callback+0x18f/0x230 drivers/base/power/runtime.c:485
>   rpm_resume+0x10f7/0x1870 drivers/base/power/runtime.c:849
>   __pm_runtime_resume+0x103/0x180 drivers/base/power/runtime.c:1076
>   pm_runtime_get_sync include/linux/pm_runtime.h:226 [inline]
>   usb_autoresume_device+0x1e/0x60 drivers/usb/core/driver.c:1599
>   usb_remote_wakeup+0x7b/0xb0 drivers/usb/core/hub.c:3603
>   hub_port_connect_change drivers/usb/core/hub.c:5199 [inline]
>   port_event drivers/usb/core/hub.c:5359 [inline]
>   hub_event+0x246c/0x3640 drivers/usb/core/hub.c:5441
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> Kernel Offset: disabled
> Rebooting in 86400 seconds..

#syz dup: WARNING in usbtouch_open

>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches
