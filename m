Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38C6D1A0F6B
	for <lists+linux-input@lfdr.de>; Tue,  7 Apr 2020 16:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729082AbgDGOib (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Apr 2020 10:38:31 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39060 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729092AbgDGOib (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Apr 2020 10:38:31 -0400
Received: by mail-pf1-f193.google.com with SMTP id k15so892799pfh.6
        for <linux-input@vger.kernel.org>; Tue, 07 Apr 2020 07:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1AKdxI0Ga8KgSm00s/LalubIX2DaX0rMxjOX/JSy41E=;
        b=t7LItNipB68bbzTCJoAxcqtB3y4HywW9BS1ZJd+kE7tqcGnYEeLxqPqRez4h8ZdgXl
         7+3lMhiEsMqfzU08wS5rDxKUySSlbIg7t68udWWLqF5tHrYypJrgPk27f/ZIPDuNlFwp
         Z8S2NQQXfPpBz0VIx98E7sokI8aZNafdZefM8BPftB1HrjUAIeDFJI1Jp4Gk0YFZq1bZ
         9CTaz9bwagW3veA20MbqVFT0jEfMCXYZfhGFIBg2DOWlqE1ZKc7M1YUkK49cB0mU3tqf
         v41la7zUl9wujx4Pa8P2EHvigqnSJTrFWtLMH9FiNijSmz7UKT3YJ056Q/PUkyiIQJgH
         MF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1AKdxI0Ga8KgSm00s/LalubIX2DaX0rMxjOX/JSy41E=;
        b=RIZPlW60epjutkxOgVPyL/+6Bwcp52iJB0hymUp1KUjtzSspvNbxflgJFozXCkhKE3
         CgjQOKL2W1/ZvV0r7hPKBkby285e/ImMo7JAuoXCymxdcxmJuhFx8YfmjWw45cQ3hpSt
         z4Fu/HLpbZrPzjIobVo1Gr/ls10YzZ3GvqAMUBYI3wAoXhuApKnySVV/uFpDf8fFGIkD
         8Y+qZehRKazsc6Iw+KnYLXPq99BAfr/Qd0FQFJkWlBi7QxInexYWzDyM0sXB8++4WY2I
         1HXIrzdjDmlRWvO4eIxWnVEHHC5it/DmgtDlLVlQapRpGlvIPTBLM/RLncDQYuCOWBes
         fUVg==
X-Gm-Message-State: AGi0PuaGfNAsYDICbSvr+netOp2YtEydEVJsEpQbx1mD63dgA0/u6qW2
        jv3Ptgn//DuuRD2JGHCk92VN8Kk1aN2xgJ0Z3fuDFQ==
X-Google-Smtp-Source: APiQypK8I+ny54ZCw1dkNJHgsK+c83ghADl5gJPeWgZfX+gtkUm4MkhfG4dLSL9gcGo3JxS0cB2hsGUXJyWOPDJYKiw=
X-Received: by 2002:a63:cf02:: with SMTP id j2mr2411345pgg.130.1586270309075;
 Tue, 07 Apr 2020 07:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000fdc98405a2b44a8c@google.com>
In-Reply-To: <000000000000fdc98405a2b44a8c@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 7 Apr 2020 16:38:17 +0200
Message-ID: <CAAeHK+wV_cpN9GbJDq4qprAFcL8-svb_8xgXxzFz8gtdykN=sA@mail.gmail.com>
Subject: Re: WARNING in add_taint/usb_submit_urb
To:     syzbot <syzbot+f44561cfce4cc0e75b89@syzkaller.appspotmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vladis Dronov <vdronov@redhat.com>,
        Johan Hovold <johan@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        ingrassia@epigenesys.com, LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 7, 2020 at 4:35 PM syzbot
<syzbot+f44561cfce4cc0e75b89@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    0fa84af8 Merge tag 'usb-serial-5.7-rc1' of https://git.ker..
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=11cce12be00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6b9c154b0c23aecf
> dashboard link: https://syzkaller.appspot.com/bug?extid=f44561cfce4cc0e75b89
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17a8312be00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14e35d8fe00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+f44561cfce4cc0e75b89@syzkaller.appspotmail.com
>
> ------------[ cut here ]------------
> usb 1-1: BOGUS urb xfer, pipe 1 != type 3
> WARNING: CPU: 1 PID: 384 at drivers/usb/core/urb.c:478 usb_submit_urb+0x1188/0x1460 drivers/usb/core/urb.c:478
> Kernel panic - not syncing: panic_on_warn set ...
> CPU: 1 PID: 384 Comm: systemd-udevd Not tainted 5.6.0-rc7-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0xef/0x16e lib/dump_stack.c:118
>  usb_submit_urb+0x10b0/0x1460 drivers/usb/core/urb.c:363
>  panic+0x2aa/0x6e1 kernel/panic.c:221
>  add_taint.cold+0x16/0x16 kernel/panic.c:434
>  set_bit include/asm-generic/bitops/instrumented-atomic.h:28 [inline]
>  set_ti_thread_flag include/linux/thread_info.h:55 [inline]
>  set_fs arch/x86/include/asm/uaccess.h:33 [inline]
>  __probe_kernel_read+0x188/0x1d0 mm/maccess.c:67
>  __warn.cold+0x14/0x30 kernel/panic.c:581
>  __warn+0xd5/0x1c8 kernel/panic.c:574
>  usb_submit_urb+0x1188/0x1460 drivers/usb/core/urb.c:478
>  __warn.cold+0x2f/0x30 kernel/panic.c:582
>  usb_submit_urb+0x1188/0x1460 drivers/usb/core/urb.c:478
>  report_bug+0x27b/0x2f0 lib/bug.c:195
>  fixup_bug arch/x86/kernel/traps.c:174 [inline]
>  fixup_bug arch/x86/kernel/traps.c:169 [inline]
>  do_error_trap+0x12b/0x1e0 arch/x86/kernel/traps.c:267
>  usb_submit_urb+0x1188/0x1460 drivers/usb/core/urb.c:478
>  do_invalid_op+0x32/0x40 arch/x86/kernel/traps.c:286
>  usb_submit_urb+0x1188/0x1460 drivers/usb/core/urb.c:478
>  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1027
> RIP: 0010:usb_submit_urb+0x1188/0x1460 drivers/usb/core/urb.c:478
> Code: 4d 85 e
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

+GTCO maintainers.

Proper report:

input: GTCO_CalComp as
/devices/platform/dummy_hcd.0/usb1/1-1/1-1:0.219/input/input4
------------[ cut here ]------------
usb 1-1: BOGUS urb xfer, pipe 1 != type 3
WARNING: CPU: 0 PID: 892 at drivers/usb/core/urb.c:478
usb_submit_urb+0x1189/0x1460
Modules linked in:
CPU: 0 PID: 892 Comm: systemd-udevd Not tainted 5.6.0+ #167
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1 04/01/2014
RIP: 0010:usb_submit_urb+0x1189/0x1460 drivers/usb/core/urb.c:478
Code: 4d 85 ed 74 46 e8 d7 b5 d7 fd 4c 89 f7 e8 0f b4 16 ff 41 89 d8
44 89 e1 4c 89 ea 48 89 c6 48 c7 c7d
RSP: 0018:ffff888062f4f7f8 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff8129eb6d RDI: ffffed100c5e9ef1
RBP: ffff8880689aeb80 R08: ffff888069670000 R09: ffffed100d9443c9
R10: ffff88806ca21e43 R11: ffffed100d9443c8 R12: 0000000000000001
R13: ffff888065fa9f00 R14: ffff888068d390a0 R15: ffff88806bf67d00
FS:  00007f4b1048b8c0(0000) GS:ffff88806ca00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055ad85210280 CR3: 000000005fccc000 CR4: 00000000000006f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 gtco_input_open+0xd5/0x130 drivers/input/tablet/gtco.c:560
 input_open_device+0x171/0x2d0 drivers/input/input.c:624
 evdev_open_device drivers/input/evdev.c:414
 evdev_open+0x3eb/0x4f0 drivers/input/evdev.c:496
 chrdev_open+0x219/0x5c0 fs/char_dev.c:414
 do_dentry_open+0x4ac/0x1180 fs/open.c:797
 do_open fs/namei.c:3229
 path_openat+0x19dd/0x26f0 fs/namei.c:3346
 do_filp_open+0x203/0x260 fs/namei.c:3375
 do_sys_openat2+0x598/0x790 fs/open.c:1148
 do_sys_open+0xc3/0x140 fs/open.c:1164
 do_syscall_64+0xb6/0x5a0 arch/x86/entry/common.c:295
 entry_SYSCALL_64_after_hwframe+0x49/0xb3 arch/x86/entry/entry_64.S:175
RIP: 0033:0x7f4b0f5d2840
Code: 73 01 c3 48 8b 0d 68 77 20 00 f7 d8 64 89 01 48 83 c8 ff c3 66
0f 1f 44 00 00 83 3d 89 bb 20 00 004
RSP: 002b:00007ffce57653c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 000055ad852c88e0 RCX: 00007f4b0f5d2840
RDX: 0000000000000000 RSI: 0000000000080000 RDI: 000055ad852d12a0
RBP: 000055ad852d12a0 R08: 000055ad83f4afe3 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000020
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
irq event stamp: 6960
hardirqs last  enabled at (6959): [<ffffffff81299621>]
console_unlock+0x911/0xca0
hardirqs last disabled at (6960): [<ffffffff81004721>]
trace_hardirqs_off_thunk+0x1a/0x1c
softirqs last  enabled at (6290): [<ffffffff85c00678>] __do_softirq+0x678/0x9a5
softirqs last disabled at (6281): [<ffffffff8115a258>] irq_exit+0x178/0x1a0
---[ end trace 066086d0cefb4362 ]---
