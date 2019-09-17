Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70E8FB4DA3
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 14:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbfIQMQl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 08:16:41 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46958 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725270AbfIQMQl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 08:16:41 -0400
Received: by mail-pg1-f193.google.com with SMTP id a3so1910736pgm.13
        for <linux-input@vger.kernel.org>; Tue, 17 Sep 2019 05:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bzl9kq0Jg8oIIzeiJQPPdQDGdBllChqs2f3RNfDgHM4=;
        b=RyHwwSQvM5j2nfzMB4TkeFWQlXdtArAZnqGOKdB1Hk9cHbjh9r0prknnJYvHeWVj0A
         j3JH7zVuxn1M5W3snVeZwCETZslRNYSkp4Klkm7mnM5xkgjp1xo+HKsoXAJjALWX/rgZ
         J4BUVHC48TeRj4BU1LLZzVBRhKEO5NOdlwBRFkOSCQQwZG/VUMKBZpUx5mzg6bRdBdu0
         krNc3j+NKhDTsLLG4RR82opNa3yEbtlG0DJ7pGMkKf5S/6liHObd0ZWVp63IlkrUMx7b
         Wa8tbscoLV7KK4/d7BtbhvKTYTusJOWdbuYDvI03l9xPWJDANNH2Y2lr7FLxSDDH/OI/
         e+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bzl9kq0Jg8oIIzeiJQPPdQDGdBllChqs2f3RNfDgHM4=;
        b=gkXWpOnVbQMTD47fj7ubLk3i9rKYLeEXmdbjUXTZsdlMJeGzQeAaapY4IpMvL8rns7
         kF1r3rfxgZOsCgnUMCwD0Z7604BjXjw1uVnAnnwldv+HmjZtEoz3SBJ/IGOR2M04ZJBf
         OLavy8Dq/bvFQmh5R8G9CHparjfVFvgqFMUQdg2/l692qOeri6agxGfbM4ZQz0rNeTl5
         vbQoNxYlIqQoTzUJvfqUB+jis9VRzFlYy+0PhtHb7c7HPtGXcR5x7Kywn4hTih8+4w7X
         S8ZgYrVCTReFCp4EqqZi9tsBNC1LR5v9xEWAzN4A9QXHaBYgkYHfdh9zeSUNaKqLMCSD
         yNaw==
X-Gm-Message-State: APjAAAUlVonAB5VDIuLKe84arbfAuimExDDMKW4zNUhYE9XexyaR/5+z
        ZFcDTpLCl3FPiBh2bmK/0zRdjJjXCNLtBTO4E7tiQA==
X-Google-Smtp-Source: APXvYqw34zxeyZVB8IxSDBtV0JJsv/E50HjmxxOj9RT3xFgczdQntX8qeztkfu1Q96DLic6LttpDyWIDFxILXYP+J+Y=
X-Received: by 2002:a63:5c26:: with SMTP id q38mr3007407pgb.130.1568722598099;
 Tue, 17 Sep 2019 05:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000048baec0592b00f00@google.com>
In-Reply-To: <00000000000048baec0592b00f00@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 17 Sep 2019 14:16:26 +0200
Message-ID: <CAAeHK+xePBQbGCHgxh9tVrqQ_HLezHrUFuiO-S8zWTkxTWs2Wg@mail.gmail.com>
Subject: Re: WARNING: ODEBUG bug in usbhid_probe
To:     syzbot <syzbot+d534bb48eb6d94062cfa@syzkaller.appspotmail.com>
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

On Mon, Sep 16, 2019 at 8:49 PM syzbot
<syzbot+d534bb48eb6d94062cfa@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=14982e6e600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
> dashboard link: https://syzkaller.appspot.com/bug?extid=d534bb48eb6d94062cfa
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+d534bb48eb6d94062cfa@syzkaller.appspotmail.com
>
> usbhid 5-1:1.0: can't add hid device: -71
> ------------[ cut here ]------------
> ODEBUG: free active (active state 0) object type: timer_list hint:
> hid_retry_timeout+0x0/0xd0 drivers/hid/usbhid/hid-core.c:712
> WARNING: CPU: 0 PID: 12 at lib/debugobjects.c:481
> debug_print_object+0x160/0x250 lib/debugobjects.c:481
> Kernel panic - not syncing: panic_on_warn set ...
> CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.3.0-rc7+ #0
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
> Code: dd 40 f6 da 85 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 bf 00 00 00 48
> 8b 14 dd 40 f6 da 85 48 c7 c7 80 eb da 85 e8 25 c5 31 ff <0f> 0b 83 05 0b
> fc a7 05 01 48 83 c4 20 5b 5d 41 5c 41 5d c3 48 89
> RSP: 0018:ffff8881da20f178 EFLAGS: 00010282
> RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000000
> RDX: 0000000000040000 RSI: ffffffff81288ddd RDI: ffffed103b441e21
> RBP: 0000000000000001 R08: ffff8881da1f9800 R09: ffffed103b645d58
> R10: ffffed103b645d57 R11: ffff8881db22eabf R12: ffffffff86d0dd60
> R13: ffffffff812e7c20 R14: ffff8881cfebe8c8 R15: ffff8881d412fa80
>   __debug_check_no_obj_freed lib/debugobjects.c:963 [inline]
>   debug_check_no_obj_freed+0x2df/0x443 lib/debugobjects.c:994
>   free_pages_prepare mm/page_alloc.c:1174 [inline]
>   __free_pages_ok+0x222/0x1d70 mm/page_alloc.c:1420
>   usbhid_probe+0xcd1/0xfa0 drivers/hid/usbhid/hid-core.c:1395
>   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
>   really_probe+0x281/0x6d0 drivers/base/dd.c:548
>   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2165
>   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>   really_probe+0x281/0x6d0 drivers/base/dd.c:548
>   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2165
>   usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
>   hub_port_connect drivers/usb/core/hub.c:5098 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
>   port_event drivers/usb/core/hub.c:5359 [inline]
>   hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
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

#syz dup: WARNING: ODEBUG bug in usbhid_disconnect (2)

https://syzkaller.appspot.com/bug?id=5e81f32e8180bafcf73dd3f41197283d275eb9e3
