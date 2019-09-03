Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1014EA686E
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 14:17:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728587AbfICMRX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 08:17:23 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36104 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727667AbfICMRX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Sep 2019 08:17:23 -0400
Received: by mail-pg1-f196.google.com with SMTP id l21so9045383pgm.3
        for <linux-input@vger.kernel.org>; Tue, 03 Sep 2019 05:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tS7e21Q8zU6SoTqi7h1ybQwBMR8qqOSIfwIoGkTB1wc=;
        b=ehuDkTcRs2ppdKX3czSEJJ7SPJl8Z9R1MRl2hdXKb+1Wl+imiSU1VV0cQ3TR1dOgDV
         Zk9naCYP7hwJEMbIOzuw/pG7ZAmKY6wLgpKnrT/25tDa83n1VhjAZeDe1+Z5fUZWxQ7v
         tvMmpl+yGpGfAfQZQ2yI4BNLHsbF227Nj62xB80IrcbmV/QM8LaDI07g8VfKfjsBkItz
         alEpg+9Fgc63PICuy9zqrV8pVx5h9Se6msREW6zi/93/oohimzQxiyb+K0Q36GlUxxK0
         YWREBsx7WApzH/t3YNP7BzLTlRf/3U61vZlhdzGOwrDIlcAFZg31DQgqMHAPDb8tnEJS
         1t6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tS7e21Q8zU6SoTqi7h1ybQwBMR8qqOSIfwIoGkTB1wc=;
        b=sLQaz/zj/QSnwD58+ww/my/3D9jJJoh3GFCTRHZ97b6U0zLtjcX4wjz33UHwtlajoZ
         OKAbpDrgzqcUPDynwoxzDL8fGPRhNotCYdiwonqjTX2FsYGeLiC1uBPzuFjn4WeJXE2G
         xmFYenOmB3Onb5gp/PRc++lvKFMlpOssR75EyHAIXee7Z60RPi5E5hgotUw1UCbBCvjE
         IeL8PsQQN0BTwtgkas6G6/Z0FUYIVLDI8crAlednJ8vyBSw6maZT9f+papszPowRCvIj
         vgwQPEBZhlIa+zVnMA9CuQlKyzr+pAs6GTpxR1c0V3NkqPwRBJ5oOIDeYSrcjWdzK+ur
         e9rA==
X-Gm-Message-State: APjAAAWt+DQPM1lNnsS5nZlVbyv/asckF4lStUQbGgLUIGG1Kv4FqxJ/
        PRgo792kPSKnIk8N7Ey3sypV+zI2Epce/4zlIKzl2g==
X-Google-Smtp-Source: APXvYqzSpv52AoWchcCyM2ALVTzrULuj1Iy2a+GTJDL6q7jhxbf1RSnfkNbI00dbKZHyudwYtRRJUq5bAGHkJDyyCfg=
X-Received: by 2002:a62:1cd2:: with SMTP id c201mr20641216pfc.51.1567513042171;
 Tue, 03 Sep 2019 05:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000001b41900591a4f149@google.com>
In-Reply-To: <0000000000001b41900591a4f149@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 3 Sep 2019 14:17:10 +0200
Message-ID: <CAAeHK+zdtLm6CZ9=vJDF4d52a=vebPj10gpFkuETcxMjvEwsNg@mail.gmail.com>
Subject: Re: WARNING: ODEBUG bug in usbhid_disconnect (2)
To:     Roderick.Colenbrander@sony.com
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        syzbot <syzbot+14b53bfeb17f2b210eb7@syzkaller.appspotmail.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 3, 2019 at 2:08 PM syzbot
<syzbot+14b53bfeb17f2b210eb7@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    eea39f24 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=173983ac600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d0c62209eedfd54e
> dashboard link: https://syzkaller.appspot.com/bug?extid=14b53bfeb17f2b210eb7
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10d36aca600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=178e208e600000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+14b53bfeb17f2b210eb7@syzkaller.appspotmail.com
>
> ------------[ cut here ]------------
> ODEBUG: free active (active state 0) object type: timer_list hint:
> hid_retry_timeout+0x0/0xd0 drivers/hid/usbhid/hid-core.c:712
> WARNING: CPU: 1 PID: 17 at lib/debugobjects.c:481
> debug_print_object+0x160/0x250 lib/debugobjects.c:481
> Kernel panic - not syncing: panic_on_warn set ...
> CPU: 1 PID: 17 Comm: kworker/1:0 Not tainted 5.3.0-rc5+ #28
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
>   invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1028
> RIP: 0010:debug_print_object+0x160/0x250 lib/debugobjects.c:481
> Code: dd 80 ef da 85 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 bf 00 00 00 48
> 8b 14 dd 80 ef da 85 48 c7 c7 c0 e4 da 85 e8 e5 dd 31 ff <0f> 0b 83 05 4b
> 0f a8 05 01 48 83 c4 20 5b 5d 41 5c 41 5d c3 48 89
> RSP: 0018:ffff8881da24f718 EFLAGS: 00010282
> RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: ffffffff81288cfd RDI: ffffed103b449ed5
> RBP: 0000000000000001 R08: ffff8881da233000 R09: fffffbfff11ad79a
> R10: fffffbfff11ad799 R11: ffffffff88d6bccf R12: ffffffff86d0dc60
> R13: ffffffff812e7b70 R14: ffff8881c9d5a8c8 R15: ffff8881cf8943f0
>   __debug_check_no_obj_freed lib/debugobjects.c:963 [inline]
>   debug_check_no_obj_freed+0x2df/0x443 lib/debugobjects.c:994
>   free_pages_prepare mm/page_alloc.c:1174 [inline]
>   __free_pages_ok+0x222/0x1d70 mm/page_alloc.c:1420
>   usbhid_disconnect+0xab/0xd0 drivers/hid/usbhid/hid-core.c:1414
>   usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
>   __device_release_driver drivers/base/dd.c:1134 [inline]
>   device_release_driver_internal+0x42f/0x500 drivers/base/dd.c:1165
>   bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
>   device_del+0x420/0xb10 drivers/base/core.c:2339
>   usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
>   usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2199
>   hub_port_connect drivers/usb/core/hub.c:4949 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
>   port_event drivers/usb/core/hub.c:5359 [inline]
>   hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   process_scheduled_works kernel/workqueue.c:2331 [inline]
>   worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> Kernel Offset: disabled
> Rebooting in 86400 seconds..
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

Roderick, FYI, this particular repro is triggering that issue in the
Sony driver AFAICS.
