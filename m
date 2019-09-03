Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBCF0A6863
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 14:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729053AbfICMMy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 08:12:54 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43407 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728938AbfICMMx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Sep 2019 08:12:53 -0400
Received: by mail-pf1-f195.google.com with SMTP id d15so1151676pfo.10
        for <linux-input@vger.kernel.org>; Tue, 03 Sep 2019 05:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i33E7WWdEboKNyevYA/anfEOPtDv0b8uFbanWM5nL2Q=;
        b=fKEgMIXFMMLDYPfNa7kGOFe2d+pAkzLTqwc6hn9AUeGqgKxLcJKc4Pe24HMO9vPJhE
         uxxRhILnRL+QBepPegjwj45ZNmeysyzznduRooz5DB8IJB4rxIa7xBbCP74YrFZDUfri
         VK+taOhMbFZ7HILzZ9PbO79hhdU9PvTeNjR9tTLaUo5VEwgQLw2b6ju19ivGeeOYWhvv
         q6C3SSTVo71T+VxXzGkLeGTBrqPnp5zG0BaITBsdGMnSmxs6Z9nuJ3pMdcEcn7HuglDy
         GJDsSjpAT3GMK8Rq+E3kmHMfGQMLklQEylM/lVUe1xKz3NpZVlSE47Z8TjcsIGWVKBz2
         kYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i33E7WWdEboKNyevYA/anfEOPtDv0b8uFbanWM5nL2Q=;
        b=H1rKYEku1sRmk/7Erd4CsDnzYtyVXXy0qQBqpFRi6EXg/lVmqXWwycx8Hiom62v5aO
         rn1nadnonoBGdaBC5O8XRUyiByoamZLa8UhqW91+2vrdrTy9vbdiYNMpF5QKNadgzdlv
         m3KvYu/sQC9Ixuva0BGPp1JPt3nLyC/Ov5D9FA1fxb3emrZZ0oDnAtx7NtBo4uF88EWb
         ihePO2iqtpasSLq1YJz654P8KXVebWbjpJxM/9r6OuGYOPfDHHhrlVIa7WaO3nuEbN9+
         6gY1C74avzZRfeq3blUXkbBL1hDswKAPixGE25cBo//jUEJSmzhks1mzGtnBPTaBLJNj
         LNIA==
X-Gm-Message-State: APjAAAWOV3yyVqoPhSV1pGJZltR41HYpeptma/vaN7L8W8Dy473gNdcL
        syaga+XqP2/44vDNflF3oDnbQL435608HWGw6C7LLyrlS/co2g24
X-Google-Smtp-Source: APXvYqyi103z0AEB0osS//f16WOxyZSwafnOdYF48RBS3SnYdJcg/hm0tFESDaFIBvNbYHZIVmoYtUK2PTaytGYAbTI=
X-Received: by 2002:aa7:8bcc:: with SMTP id s12mr24728814pfd.93.1567512772555;
 Tue, 03 Sep 2019 05:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000004070630591a4f124@google.com>
In-Reply-To: <0000000000004070630591a4f124@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 3 Sep 2019 14:12:41 +0200
Message-ID: <CAAeHK+x8NtDVnnzMgGZXfCdfvV7LwoZ9ZUuXnqSsHSDvn4JDHQ@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in usbhid_close
To:     syzbot <syzbot+90b997df76897a013829@syzkaller.appspotmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 3, 2019 at 2:08 PM syzbot
<syzbot+90b997df76897a013829@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    eea39f24 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=140a786c600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
> dashboard link: https://syzkaller.appspot.com/bug?extid=90b997df76897a013829
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+90b997df76897a013829@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KASAN: use-after-free in __lock_acquire+0x302a/0x3b50
> kernel/locking/lockdep.c:3753
> Read of size 8 at addr ffff8881d34368a0 by task syz-executor.3/10760
>
> CPU: 0 PID: 10760 Comm: syz-executor.3 Not tainted 5.3.0-rc5+ #28
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   print_address_description+0x6a/0x32c mm/kasan/report.c:351
>   __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
>   kasan_report+0xe/0x12 mm/kasan/common.c:612
>   __lock_acquire+0x302a/0x3b50 kernel/locking/lockdep.c:3753
>   lock_acquire+0x127/0x320 kernel/locking/lockdep.c:4412
>   __raw_spin_lock_irq include/linux/spinlock_api_smp.h:128 [inline]
>   _raw_spin_lock_irq+0x2d/0x40 kernel/locking/spinlock.c:167
>   spin_lock_irq include/linux/spinlock.h:363 [inline]
>   usbhid_close+0x51/0x210 drivers/hid/usbhid/hid-core.c:740
>   hid_hw_close+0xa8/0xd0 drivers/hid/hid-core.c:2046
>   drop_ref.part.0+0x32/0xe0 drivers/hid/hidraw.c:337
>   drop_ref drivers/hid/hidraw.c:360 [inline]
>   hidraw_release+0x34f/0x440 drivers/hid/hidraw.c:356
>   __fput+0x2d7/0x840 fs/file_table.c:280
>   task_work_run+0x13f/0x1c0 kernel/task_work.c:113
>   tracehook_notify_resume include/linux/tracehook.h:188 [inline]
>   exit_to_usermode_loop+0x1d2/0x200 arch/x86/entry/common.c:163
>   prepare_exit_to_usermode arch/x86/entry/common.c:194 [inline]
>   syscall_return_slowpath arch/x86/entry/common.c:274 [inline]
>   do_syscall_64+0x45f/0x580 arch/x86/entry/common.c:299
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x413561
> Code: 75 14 b8 03 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 04 1b 00 00 c3 48
> 83 ec 08 e8 0a fc ff ff 48 89 04 24 b8 03 00 00 00 0f 05 <48> 8b 3c 24 48
> 89 c2 e8 53 fc ff ff 48 89 d0 48 83 c4 08 48 3d 01
> RSP: 002b:00007ffc873b3300 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
> RAX: 0000000000000000 RBX: 0000000000000006 RCX: 0000000000413561
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000005
> RBP: 0000000000000001 R08: 0000000055395a94 R09: 0000000055395a98
> R10: 00007ffc873b33e0 R11: 0000000000000293 R12: 000000000075bfc8
> R13: 0000000000096f96 R14: 0000000000762460 R15: ffffffffffffffff
>
> The buggy address belongs to the page:
> page:ffffea00074d0d80 refcount:0 mapcount:0 mapping:0000000000000000
> index:0x0
> flags: 0x200000000000000()
> raw: 0200000000000000 0000000000000000 dead000000000122 0000000000000000
> raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>   ffff8881d3436780: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>   ffff8881d3436800: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> > ffff8881d3436880: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>                                 ^
>   ffff8881d3436900: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>   ffff8881d3436980: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ==================================================================
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

#syz dup: general protection fault in __pm_runtime_resume
