Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81641BB18E
	for <lists+linux-input@lfdr.de>; Mon, 23 Sep 2019 11:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407133AbfIWJmJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Sep 2019 05:42:09 -0400
Received: from mail-io1-f72.google.com ([209.85.166.72]:46149 "EHLO
        mail-io1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407126AbfIWJmJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Sep 2019 05:42:09 -0400
Received: by mail-io1-f72.google.com with SMTP id t11so22747357ioc.13
        for <linux-input@vger.kernel.org>; Mon, 23 Sep 2019 02:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=4+ztzVpKpSVoWg0X7M5GKr1swegFXw8MLLifDFebvSY=;
        b=jc/vYB19ibvKFw18NEmfaF6UIt2zI0S5HLOKjJ/ynZ4mwDtJY5AVH0B+SucOKhkvtk
         PQcQw9Hwpj8+OgCORFsPXNaqr4ZFATIFkkZ46i3blo4bnka2LhDCVVZ4/JZQ2lUcNFe1
         21BanZqR9Oi7E1PB/nYEH2U9HzL4Elwm0w371e2Hst7a6BbPqQL5zc8BgPtdQmk/EJeK
         ZOZBptMp6UeeU4Bk7CcNyW2XdY1Owss+I5uJzg0QpRfdPec348Zw0V+YsYJM1Ayms61n
         R/5oraxIblPKMUpr/+LPLeA5kkwoZMmrhN4TSasxca0st8Pv+yLOIjgythsUNVf7lhYq
         OEjA==
X-Gm-Message-State: APjAAAVksdOy8BSGwy/GtW2vF28RNFm/o6lDpuRNUiprwH7qCq7oX7Qy
        xXUaFeJ8uTLk+HtFj5a7OUCFLNcWP9oWoKlQRzWQ/7NHuEN5
X-Google-Smtp-Source: APXvYqwkvJ/FVZBcNq8yxwgdO9+vwZ5zJgqwR4Z4RusibJ5Kk2gssv3OLkSPO8te8fYHyy50DCi+dEseyZceo6IbC+TgPm7RRlVY
MIME-Version: 1.0
X-Received: by 2002:a6b:7116:: with SMTP id q22mr16602639iog.280.1569231727539;
 Mon, 23 Sep 2019 02:42:07 -0700 (PDT)
Date:   Mon, 23 Sep 2019 02:42:07 -0700
In-Reply-To: <CAL411-o09wBhiPtRixFo4=6pB1rAmUsTKc2sBQmn4MjQcPBy2A@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b0c6560593353b17@google.com>
Subject: Re: Re: KASAN: use-after-free Read in usb_anchor_resume_wakeups
From:   syzbot <syzbot+58e201002fe1e775e1ae@syzkaller.appspotmail.com>
To:     Peter Chen <hzpeterchen@gmail.com>
Cc:     aicommander@gmail.com, allison@lohutok.net, andreyknvl@google.com,
        dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, hzpeterchen@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, ramzeto@gmail.com, rfontana@redhat.com,
        syzkaller-bugs@googlegroups.com, tglx@linutronix.de,
        tom@steelseries.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

>> On Tue, Jul 9, 2019 at 2:27 PM syzbot
>> <syzbot+58e201002fe1e775e1ae@syzkaller.appspotmail.com> wrote:
>> >
>> > Hello,
>> >
>> > syzbot found the following crash on:
>> >
>> > HEAD commit:    7829a896 usb-fuzzer: main usb gadget fuzzer driver
>> > git tree:       https://github.com/google/kasan.git usb-fuzzer
>> > console output:  
>> https://syzkaller.appspot.com/x/log.txt?x=118d136da00000
>> > kernel config:   
>> https://syzkaller.appspot.com/x/.config?x=f6d4561982f71f63
>> > dashboard link:  
>> https://syzkaller.appspot.com/bug?extid=58e201002fe1e775e1ae
>> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>> >
>> > Unfortunately, I don't have any reproducer for this crash yet.
>> >
>> > IMPORTANT: if you fix the bug, please add the following tag to the  
>> commit:
>> > Reported-by: syzbot+58e201002fe1e775e1ae@syzkaller.appspotmail.com
>> >
>> > dummy_hcd dummy_hcd.5: no ep configured for urb 00000000c6093b7b
>> > xpad 6-1:0.169: xpad_irq_out - usb_submit_urb failed with result -19
>> > ==================================================================
>> > BUG: KASAN: use-after-free in debug_spin_lock_before
>> > kernel/locking/spinlock_debug.c:83 [inline]
>> > BUG: KASAN: use-after-free in do_raw_spin_lock+0x24d/0x280
>> > kernel/locking/spinlock_debug.c:112
>> > Read of size 4 at addr ffff8881d0e584dc by task kworker/1:4/2786
>> >

> It should due to URB is freed at xpad_disconnect, but xpad_irq_out
> still tries to access
> freed URB.

> Peter

> #syz test: https://github.com/google/kasan.git 7829a896

This crash does not have a reproducer. I cannot test it.


> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 6b40a1c68f9f..32b7a199b580 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -1850,6 +1850,7 @@ static void xpad_disconnect(struct usb_interface  
> *intf)

>          xpad_deinit_input(xpad);

> +       usb_kill_urb(xpad->irq_out);
>          /*
>           * Now that both input device and LED device are gone we can
>           * stop output URB.


>> > CPU: 1 PID: 2786 Comm: kworker/1:4 Not tainted 5.2.0-rc6+ #13
>> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
>> > Google 01/01/2011
>> > Workqueue: usb_hub_wq hub_event
>> > Call Trace:
>> >   <IRQ>
>> >   __dump_stack lib/dump_stack.c:77 [inline]
>> >   dump_stack+0xca/0x13e lib/dump_stack.c:113
>> >   print_address_description+0x67/0x231 mm/kasan/report.c:188
>> >   __kasan_report.cold+0x1a/0x32 mm/kasan/report.c:317
>> >   kasan_report+0xe/0x20 mm/kasan/common.c:614
>> >   debug_spin_lock_before kernel/locking/spinlock_debug.c:83 [inline]
>> >   do_raw_spin_lock+0x24d/0x280 kernel/locking/spinlock_debug.c:112
>> >   __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:117 [inline]
>> >   _raw_spin_lock_irqsave+0x3a/0x50 kernel/locking/spinlock.c:159
>> >   __wake_up_common_lock+0xb0/0x170 kernel/sched/wait.c:121
>> >   __usb_unanchor_urb drivers/usb/core/urb.c:154 [inline]
>> >   usb_anchor_resume_wakeups+0xbe/0xe0 drivers/usb/core/urb.c:148
>> >   __usb_hcd_giveback_urb+0x1fa/0x470 drivers/usb/core/hcd.c:1760
>> >   usb_hcd_giveback_urb+0x34a/0x400 drivers/usb/core/hcd.c:1823
>> >   dummy_timer+0x1022/0x2df4 drivers/usb/gadget/udc/dummy_hcd.c:1965
>> >   call_timer_fn+0x15e/0x5e0 kernel/time/timer.c:1322
>> >   expire_timers kernel/time/timer.c:1366 [inline]
>> >   __run_timers kernel/time/timer.c:1685 [inline]
>> >   __run_timers kernel/time/timer.c:1653 [inline]
>> >   run_timer_softirq+0x597/0x1410 kernel/time/timer.c:1698
>> >   __do_softirq+0x219/0x8b0 kernel/softirq.c:292
>> >   invoke_softirq kernel/softirq.c:373 [inline]
>> >   irq_exit+0x17c/0x1a0 kernel/softirq.c:413
>> >   exiting_irq arch/x86/include/asm/apic.h:536 [inline]
>> >   smp_apic_timer_interrupt+0xe2/0x480 arch/x86/kernel/apic/apic.c:1068
>> >   apic_timer_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:806
>> >   </IRQ>
>> > RIP: 0010:arch_local_irq_restore arch/x86/include/asm/irqflags.h:85  
>> [inline]
>> > RIP: 0010:console_unlock+0x9db/0xbf0 kernel/printk/printk.c:2471
>> > Code: 00 89 ee 48 c7 c7 e0 eb f2 86 e8 50 a4 03 00 65 ff 0d 51 56 da  
>> 7e e9
>> > 11 fa ff ff e8 af 43 15 00 e8 ba 69 1a 00 ff 74 24 30 9d <e9> 31 fe ff  
>> ff
>> > e8 9b 43 15 00 48 8b bc 24 80 00 00 00 c7 05 d9 e6
>> > RSP: 0018:ffff8881d251ecb8 EFLAGS: 00000212 ORIG_RAX: ffffffffffffff13
>> > RAX: 0000000000000007 RBX: 0000000000000200 RCX: 1ffff11039d43729
>> > RDX: 0000000000000000 RSI: ffff8881cea1b928 RDI: ffff8881cea1b834
>> > RBP: 0000000000000000 R08: ffff8881cea1b000 R09: 0000000000000000
>> > R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000046
>> > R13: ffffffff828cb580 R14: ffffffff8726a520 R15: dffffc0000000000
>> >   vprintk_emit+0x171/0x3e0 kernel/printk/printk.c:1986
>> >   vprintk_func+0x75/0x113 kernel/printk/printk_safe.c:386
>> >   printk+0xba/0xed kernel/printk/printk.c:2046
>> >   really_probe.cold+0x69/0x122 drivers/base/dd.c:577
>> >   driver_probe_device+0x104/0x210 drivers/base/dd.c:670
>> >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
>> >   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>> >   __device_attach+0x217/0x360 drivers/base/dd.c:843
>> >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>> >   device_add+0xae6/0x16f0 drivers/base/core.c:2111
>> >   usb_serial_probe.cold+0x13e6/0x25d0  
>> drivers/usb/serial/usb-serial.c:1057
>> >   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
>> >   really_probe+0x281/0x660 drivers/base/dd.c:509
>> >   driver_probe_device+0x104/0x210 drivers/base/dd.c:670
>> >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
>> >   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>> >   __device_attach+0x217/0x360 drivers/base/dd.c:843
>> >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>> >   device_add+0xae6/0x16f0 drivers/base/core.c:2111
>> >   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>> >   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>> >   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>> >   really_probe+0x281/0x660 drivers/base/dd.c:509
>> >   driver_probe_device+0x104/0x210 drivers/base/dd.c:670
>> >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
>> >   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>> >   __device_attach+0x217/0x360 drivers/base/dd.c:843
>> >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>> >   device_add+0xae6/0x16f0 drivers/base/core.c:2111
>> >   usb_new_device.cold+0x8c1/0x1016 drivers/usb/core/hub.c:2534
>> >   hub_port_connect drivers/usb/core/hub.c:5089 [inline]
>> >   hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
>> >   port_event drivers/usb/core/hub.c:5350 [inline]
>> >   hub_event+0x1ada/0x3590 drivers/usb/core/hub.c:5432
>> >   process_one_work+0x905/0x1570 kernel/workqueue.c:2269
>> >   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>> >   kthread+0x30b/0x410 kernel/kthread.c:255
>> >   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>> >
>> > Allocated by task 17:
>> >   save_stack+0x1b/0x80 mm/kasan/common.c:71
>> >   set_track mm/kasan/common.c:79 [inline]
>> >   __kasan_kmalloc mm/kasan/common.c:489 [inline]
>> >   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:462
>> >   kmalloc include/linux/slab.h:547 [inline]
>> >   kzalloc include/linux/slab.h:742 [inline]
>> >   xpad_probe+0x24b/0x1b20 drivers/input/joystick/xpad.c:1717
>> >   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
>> >   really_probe+0x281/0x660 drivers/base/dd.c:509
>> >   driver_probe_device+0x104/0x210 drivers/base/dd.c:670
>> >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
>> >   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>> >   __device_attach+0x217/0x360 drivers/base/dd.c:843
>> >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>> >   device_add+0xae6/0x16f0 drivers/base/core.c:2111
>> >   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>> >   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>> >   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>> >   really_probe+0x281/0x660 drivers/base/dd.c:509
>> >   driver_probe_device+0x104/0x210 drivers/base/dd.c:670
>> >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:777
>> >   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>> >   __device_attach+0x217/0x360 drivers/base/dd.c:843
>> >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>> >   device_add+0xae6/0x16f0 drivers/base/core.c:2111
>> >   usb_new_device.cold+0x8c1/0x1016 drivers/usb/core/hub.c:2534
>> >   hub_port_connect drivers/usb/core/hub.c:5089 [inline]
>> >   hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
>> >   port_event drivers/usb/core/hub.c:5350 [inline]
>> >   hub_event+0x1ada/0x3590 drivers/usb/core/hub.c:5432
>> >   process_one_work+0x905/0x1570 kernel/workqueue.c:2269
>> >   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>> >   kthread+0x30b/0x410 kernel/kthread.c:255
>> >   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>> >
>> > Freed by task 107:
>> >   save_stack+0x1b/0x80 mm/kasan/common.c:71
>> >   set_track mm/kasan/common.c:79 [inline]
>> >   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:451
>> >   slab_free_hook mm/slub.c:1421 [inline]
>> >   slab_free_freelist_hook mm/slub.c:1448 [inline]
>> >   slab_free mm/slub.c:2994 [inline]
>> >   kfree+0xd7/0x280 mm/slub.c:3949
>> >   xpad_disconnect+0x1cb/0x4a3 drivers/input/joystick/xpad.c:1865
>> >   usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
>> >   __device_release_driver drivers/base/dd.c:1081 [inline]
>> >   device_release_driver_internal+0x404/0x4c0 drivers/base/dd.c:1112
>> >   bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
>> >   device_del+0x460/0xb80 drivers/base/core.c:2274
>> >   usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
>> >   usb_disconnect+0x284/0x830 drivers/usb/core/hub.c:2197
>> >   hub_port_connect drivers/usb/core/hub.c:4940 [inline]
>> >   hub_port_connect_change drivers/usb/core/hub.c:5204 [inline]
>> >   port_event drivers/usb/core/hub.c:5350 [inline]
>> >   hub_event+0x1409/0x3590 drivers/usb/core/hub.c:5432
>> >   process_one_work+0x905/0x1570 kernel/workqueue.c:2269
>> >   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>> >   kthread+0x30b/0x410 kernel/kthread.c:255
>> >   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>> >
>> > The buggy address belongs to the object at ffff8881d0e58480
>> >   which belongs to the cache kmalloc-1k of size 1024
>> > The buggy address is located 92 bytes inside of
>> >   1024-byte region [ffff8881d0e58480, ffff8881d0e58880)
>> > The buggy address belongs to the page:
>> > page:ffffea0007439600 refcount:1 mapcount:0 mapping:ffff8881dac02a00
>> > index:0x0 compound_mapcount: 0
>> > flags: 0x200000000010200(slab|head)
>> > raw: 0200000000010200 0000000000000000 0000000d00000001  
>> ffff8881dac02a00
>> > raw: 0000000000000000 00000000800e000e 00000001ffffffff  
>> 0000000000000000
>> > page dumped because: kasan: bad access detected
>> >
>> > Memory state around the buggy address:
>> >   ffff8881d0e58380: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> >   ffff8881d0e58400: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>> > > ffff8881d0e58480: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> >                                                      ^
>> >   ffff8881d0e58500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> >   ffff8881d0e58580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> > ==================================================================
>> >
>> >
>> > ---
>> > This bug is generated by a bot. It may contain errors.
>> > See https://goo.gl/tpsmEJ for more information about syzbot.
>> > syzbot engineers can be reached at syzkaller@googlegroups.com.
>> >
>> > syzbot will keep track of this bug report. See:
>> > https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

>> Looks like a bug in the xpad driver, adding maintainers.
