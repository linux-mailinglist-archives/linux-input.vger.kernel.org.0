Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B52B218E3EB
	for <lists+linux-input@lfdr.de>; Sat, 21 Mar 2020 20:17:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727533AbgCUTRl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 21 Mar 2020 15:17:41 -0400
Received: from mail-qv1-f66.google.com ([209.85.219.66]:41338 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727264AbgCUTRl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 21 Mar 2020 15:17:41 -0400
Received: by mail-qv1-f66.google.com with SMTP id o7so2524434qvq.8;
        Sat, 21 Mar 2020 12:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uWOx6bPJNHgjIK5ZjJEtR8ACJAMLhiOnmnetRsId5Fg=;
        b=I/EQBRDfPRtl0IuTbUdeuvJxizVdtEhECMXRo4ThNuyJRWLJUopZjQOW3Ddm5q9BG6
         PO4f3+h1F98pzwn3qgplZi0LX2OJVwW37LpkQyEa6JGQeY/2LWNhbplwVzLMtGbJqaRq
         qQlroMcvX73pm9JsaSBlyLrA3yLw3zbCNe2bOSS0YzBVXyalm2cun37vr8ic69jgaE6+
         B/dI/DwhJNrf9VRgt/MnNUjZzdmX1M7+uFy77T+TqWc4bzGjUwKK/dOyK8tU1FQmVxaU
         70P4GIuXW+kTsBQ9p0o7jRYqOVXnDhYW+wwT6DqF0I+YYsDpkXG7JSU6SVtlS5txSXq4
         PbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uWOx6bPJNHgjIK5ZjJEtR8ACJAMLhiOnmnetRsId5Fg=;
        b=Uu2r0EmhXr0swXBAStvBx0Rv+z/E9LJXgRV7rCy+CW8eLU4w7L6e0WlV+/cNIJeGtK
         vKKBBbacG3EDwlkwIuCKWJ718J++vP3x08cIURBVw5pNOs3E+SAUQygmHlCGVkQUS0Hd
         0hL2lnZQKG+up5IqGDqB8WPzdjFJ3Bhdr7x1I50XKaSm30owABHCkqXQs7hLcV5Fc8LZ
         o+U9nR4uQM3klRNRtXl53DgUvcA62/vNGJYNc6UQGhhu2zjnT/xIEOgMgOWXqIJx8Cjx
         e6K3cb+lM4MRHslu+3Nh6qd93iUG3C+iYRpqeTnAqrC6rg9IG/JyBp7dCeUMBmwKTlVD
         aOqA==
X-Gm-Message-State: ANhLgQ2kiEDhbF1sAuT6rA+zFkc4vMn+6v6O74CtS0YDH6aByouwkQ3M
        0tSE+JMzFR1omjq22NJhhQ8Ub4/Aq6zJCh1FX/c=
X-Google-Smtp-Source: ADFU+vuN3+HLU6FDlcTxumoyy6uohXNJWCevieelhaK+bx6QZdQjv2vctvd/+xxnHX1GbXrWud8ONzTP/SPGosWNwlw=
X-Received: by 2002:ad4:49d1:: with SMTP id j17mr2960404qvy.80.1584818258447;
 Sat, 21 Mar 2020 12:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000ce8d2305a03b0988@google.com> <20200310031757.12780-1-hdanton@sina.com>
In-Reply-To: <20200310031757.12780-1-hdanton@sina.com>
From:   David Rheinsberg <david.rheinsberg@gmail.com>
Date:   Sat, 21 Mar 2020 20:17:27 +0100
Message-ID: <CANq1E4TiK93W+fBRUJA-gAiROJt8Shok0HW6FM_-Ggfbe6y4EQ@mail.gmail.com>
Subject: Re: INFO: trying to register non-static key in uhid_char_release
To:     Hillf Danton <hdanton@sina.com>
Cc:     syzbot <syzbot+8357fbef0d7bb602de45@syzkaller.appspotmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        ebiggers@kernel.org, Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

On Tue, Mar 10, 2020 at 4:18 AM Hillf Danton <hdanton@sina.com> wrote:
> On Mon, 09 Mar 2020 08:26:10 -0700
> > syzbot has found a reproducer for the following crash on:
> >
> > HEAD commit:    2c523b34 Linux 5.6-rc5
> > git tree:       upstream
> > console output: https://syzkaller.appspot.com/x/log.txt?x=150bce55e00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=a5295e161cd85b82
> > dashboard link: https://syzkaller.appspot.com/bug?extid=8357fbef0d7bb602de45
> > compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11b439c3e00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16dc6fb5e00000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+8357fbef0d7bb602de45@syzkaller.appspotmail.com
> >
> > INFO: trying to register non-static key.
> > the code is fine but needs lockdep annotation.
> > turning off the locking correctness validator.
> > CPU: 0 PID: 10346 Comm: syz-executor364 Not tainted 5.6.0-rc5-syzkaller #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > Call Trace:
> >  __dump_stack lib/dump_stack.c:77 [inline]
> >  dump_stack+0x1e9/0x30e lib/dump_stack.c:118
> >  register_lock_class+0x6f4/0xec0 kernel/locking/lockdep.c:443
> >  __lock_acquire+0x116/0x1bc0 kernel/locking/lockdep.c:3836
> >  lock_acquire+0x154/0x250 kernel/locking/lockdep.c:4484
> >  __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
> >  _raw_spin_lock_irqsave+0x9e/0xc0 kernel/locking/spinlock.c:159
> >  __wake_up_common_lock kernel/sched/wait.c:122 [inline]
> >  __wake_up+0xb8/0x150 kernel/sched/wait.c:142
> >  uhid_dev_destroy drivers/hid/uhid.c:563 [inline]
> >  uhid_char_release+0x99/0x600 drivers/hid/uhid.c:642
> >  __fput+0x2d8/0x730 fs/file_table.c:280
> >  task_work_run+0x176/0x1b0 kernel/task_work.c:113
> >  exit_task_work include/linux/task_work.h:22 [inline]
> >  do_exit+0x5ef/0x1f80 kernel/exit.c:801
> >  do_group_exit+0x15e/0x2c0 kernel/exit.c:899
> >  __do_sys_exit_group+0x13/0x20 kernel/exit.c:910
> >  __se_sys_exit_group+0x10/0x10 kernel/exit.c:908
> >  __x64_sys_exit_group+0x37/0x40 kernel/exit.c:908
> >  do_syscall_64+0xf3/0x1b0 arch/x86/entry/common.c:294
> >  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> > RIP: 0033:0x4403d8
> > Code: 00 00 be 3c 00 00 00 eb 19 66 0f 1f 84 00 00 00 00 00 48 89 d7 89 f0 0f 05 48 3d 00 f0 ff ff 77 21 f4 48 89 d7 44 89 c0 0f 05 <48> 3d 00 f0 ff ff 76 e0 f7 d8 64 41 89 01 eb d8 0f 1f 84 00 00 00
> > RSP: 002b:00007ffd67f7d928 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> > RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00000000004403d8
> > RDX: 0000000000000000 RSI: 000000000000003c RDI: 0000000000000000
> > RBP: 00000000004c0d90 R08: 00000000000000e7 R09: ffffffffffffffd4
> > R10: 0000000000402570 R11: 0000000000000246 R12: 0000000000000001
> > R13: 00000000006d3180 R14: 0000000000000000 R15: 0000000000000000
> > general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
> > KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> > CPU: 0 PID: 10346 Comm: syz-executor364 Not tainted 5.6.0-rc5-syzkaller #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > RIP: 0010:__wake_up_common+0x297/0x4d0 kernel/sched/wait.c:86
> > Code: fb 01 00 00 45 31 f6 eb 13 66 2e 0f 1f 84 00 00 00 00 00 4d 39 fc 0f 84 e3 01 00 00 4c 89 fb 49 8d 6f e8 4c 89 f8 48 c1 e8 03 <80> 3c 10 00 74 12 48 89 df e8 eb 4e 59 00 48 ba 00 00 00 00 00 fc
> > RSP: 0018:ffffc90001687c10 EFLAGS: 00010046
> > RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> > RDX: dffffc0000000000 RSI: 0000000000000001 RDI: ffff888091fe13c8
> > RBP: ffffffffffffffe8 R08: 0000000000000000 R09: ffffc90001687c78
> > R10: fffff520002d0f82 R11: 0000000000000000 R12: ffff888091fe1400
> > R13: 1ffff920002d0f8f R14: 0000000000000000 R15: 0000000000000000
> > FS:  00000000023ec940(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 0000000020000088 CR3: 0000000096b74000 CR4: 00000000001406f0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > Call Trace:
> >  __wake_up_common_lock kernel/sched/wait.c:123 [inline]
> >  __wake_up+0xd4/0x150 kernel/sched/wait.c:142
> >  uhid_dev_destroy drivers/hid/uhid.c:563 [inline]
> >  uhid_char_release+0x99/0x600 drivers/hid/uhid.c:642
> >  __fput+0x2d8/0x730 fs/file_table.c:280
> >  task_work_run+0x176/0x1b0 kernel/task_work.c:113
> >  exit_task_work include/linux/task_work.h:22 [inline]
> >  do_exit+0x5ef/0x1f80 kernel/exit.c:801
> >  do_group_exit+0x15e/0x2c0 kernel/exit.c:899
> >  __do_sys_exit_group+0x13/0x20 kernel/exit.c:910
> >  __se_sys_exit_group+0x10/0x10 kernel/exit.c:908
> >  __x64_sys_exit_group+0x37/0x40 kernel/exit.c:908
> >  do_syscall_64+0xf3/0x1b0 arch/x86/entry/common.c:294
> >  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> > RIP: 0033:0x4403d8
> > Code: 00 00 be 3c 00 00 00 eb 19 66 0f 1f 84 00 00 00 00 00 48 89 d7 89 f0 0f 05 48 3d 00 f0 ff ff 77 21 f4 48 89 d7 44 89 c0 0f 05 <48> 3d 00 f0 ff ff 76 e0 f7 d8 64 41 89 01 eb d8 0f 1f 84 00 00 00
> > RSP: 002b:00007ffd67f7d928 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> > RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00000000004403d8
> > RDX: 0000000000000000 RSI: 000000000000003c RDI: 0000000000000000
> > RBP: 00000000004c0d90 R08: 00000000000000e7 R09: ffffffffffffffd4
> > R10: 0000000000402570 R11: 0000000000000246 R12: 0000000000000001
> > R13: 00000000006d3180 R14: 0000000000000000 R15: 0000000000000000
> > Modules linked in:
> > ---[ end trace 6b49c4c2b7708f14 ]---
> > RIP: 0010:__wake_up_common+0x297/0x4d0 kernel/sched/wait.c:86
> > Code: fb 01 00 00 45 31 f6 eb 13 66 2e 0f 1f 84 00 00 00 00 00 4d 39 fc 0f 84 e3 01 00 00 4c 89 fb 49 8d 6f e8 4c 89 f8 48 c1 e8 03 <80> 3c 10 00 74 12 48 89 df e8 eb 4e 59 00 48 ba 00 00 00 00 00 fc
> > RSP: 0018:ffffc90001687c10 EFLAGS: 00010046
> > RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> > RDX: dffffc0000000000 RSI: 0000000000000001 RDI: ffff888091fe13c8
> > RBP: ffffffffffffffe8 R08: 0000000000000000 R09: ffffc90001687c78
> > R10: fffff520002d0f82 R11: 0000000000000000 R12: ffff888091fe1400
> > R13: 1ffff920002d0f8f R14: 0000000000000000 R15: 0000000000000000
> > FS:  00000000023ec940(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 0000000020000088 CR3: 0000000096b74000 CR4: 00000000001406f0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>
>
> --- a/drivers/hid/uhid.c
> +++ b/drivers/hid/uhid.c
> @@ -639,7 +639,9 @@ static int uhid_char_release(struct inod
>         struct uhid_device *uhid = file->private_data;
>         unsigned int i;
>
> -       uhid_dev_destroy(uhid);
> +       /* back off if anyone is taking care of uhid */
> +       if (uhid_dev_destroy(uhid))
> +               return 0;
>
>         for (i = 0; i < UHID_BUFSIZE; ++i)
>                 kfree(uhid->outq[i]);
>

That looks not correct. `uhid_dev_destroy()` returns a non-significant
error code. This is only done to make sure the ioctl that call it can
return a suitable code to user-space.

What is this trying to fix? I am having a hard-time reading the backtrace.

Thanks
David
