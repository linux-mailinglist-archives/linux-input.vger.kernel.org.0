Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57DC58B136
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2019 09:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727625AbfHMHgM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Aug 2019 03:36:12 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38228 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727623AbfHMHgL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Aug 2019 03:36:11 -0400
Received: by mail-ot1-f68.google.com with SMTP id r20so19131773ota.5
        for <linux-input@vger.kernel.org>; Tue, 13 Aug 2019 00:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O3qE6/36rEXpC5kdVYLguUDaxniyJ3oFqt0+6Dxu5Lg=;
        b=lUjGAaslXlAdIjqudMowLY6puZr6vXORMdS9w3MVdt1rjFfB4tpbtCt5PEAp4sop5E
         2SWz6WdXfLOIlo46pwHQBrz4j9/CajuMmuQ8z3VhC3iDRNh63J4UTQoDHbSmZ75sA8lg
         EHRJNAYNB7iaSPO8gDGd5vT/tlZKIGkpLN/S9T+4uoIWkBQAm3+YjCP74RkHDPZ+plPd
         CWsmKRzYPuBHaqghUH0+weOSMcOPX0OoTvosGH0KFjdQe0dgwUP5UKPUswX77RaTYCii
         6f9zEQOIu3WDGIS3CszgKxr+Lo01lym/quSzsNB6LtLXzCVzC0+DnJoK4LaX0dXuKyll
         U0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O3qE6/36rEXpC5kdVYLguUDaxniyJ3oFqt0+6Dxu5Lg=;
        b=BOAyUJrFxdbfRbGHvi428M6TbuhS0n5bmxk5iEE5YimnS1AJttpJyO+vL+kzZ/t4Fa
         U5sgbGMlR8Y+0dG6nBIltjXIulokq3RiiWAHhrjwfqQ4ROXtfoJyuCUco9Tg5KRCu3XM
         X+AuMyQhsRJbt62LESw1UKHUG9HB7weMY63Ww2MUXtzdsnwWfP31FuVmHv84E204kQYl
         fQyqL/18Dz3llc4viCvMDl7+4SitnmhFUIxjXsywYeUgse5u/Za4fqOKiKqEiZU98Nwj
         Yh4K4IiP4nwkusmghU+jvHlU4YK92wkM0LIHgtutoVrxdLQafspZ/+f42Q0Hax5L75mm
         Op4Q==
X-Gm-Message-State: APjAAAWutiJsjI2p+aNj9WN5oAuLqB3RltCcG9VTPEgL2tur+7cd6fZ2
        z8dzCHz1dZrnjmvzZqp4uWmed1vz273F9tP0f57IZQ==
X-Google-Smtp-Source: APXvYqwZxBaaOWHr+t2RGgjnxgeTKZ5LzQ8pXoumBiEeO2lj253vVK4Ly6mAkZnBnLk97O+OQQARUumR+nHxgAq61l4=
X-Received: by 2002:a6b:fb0f:: with SMTP id h15mr22161130iog.266.1565681769463;
 Tue, 13 Aug 2019 00:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+z-uCr-bWu9uVDynU2S=wCrtxRbuA-Cut=h5zYuYcS-Cw@mail.gmail.com>
 <20190813042649.888-1-hdanton@sina.com>
In-Reply-To: <20190813042649.888-1-hdanton@sina.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 13 Aug 2019 09:35:57 +0200
Message-ID: <CACT4Y+bsXXPughFUySsL6ReAX2x40RX7ny6SowhNhT=Q6-F90A@mail.gmail.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb
To:     Hillf Danton <hdanton@sina.com>
Cc:     syzbot <syzbot+a7a6b9c609b9457c62c6@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jiri Slaby <jirislaby@gmail.com>,
        Jiri Kosina <jkosina@suse.cz>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 13, 2019 at 6:27 AM Hillf Danton <hdanton@sina.com> wrote:
>
> [respin with the mess in Cc list cleaned up]
>
> On Mon, 12 Aug 2019 06:03:01 -0700
> > Hello,
> >
> > syzbot has tested the proposed patch but the reproducer still triggered crash:
> > KASAN: invalid-free in hcd_buffer_free
> >
> > usb 5-1: USB disconnect, device number 2
> > ==================================================================
> > BUG: KASAN: double-free or invalid-free in hcd_buffer_free+0x199/0x260
> > drivers/usb/core/buffer.c:165
> >
> > CPU: 0 PID: 1745 Comm: kworker/0:2 Not tainted 5.3.0-rc2+ #1
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> > Google 01/01/2011
> > Workqueue: usb_hub_wq hub_event
> > Call Trace:
> >   __dump_stack lib/dump_stack.c:77 [inline]
> >   dump_stack+0xca/0x13e lib/dump_stack.c:113
> >   print_address_description+0x6a/0x32c mm/kasan/report.c:351
> >   kasan_report_invalid_free+0x61/0xa0 mm/kasan/report.c:444
> >   __kasan_slab_free+0x162/0x180 mm/kasan/common.c:428
> >   slab_free_hook mm/slub.c:1423 [inline]
> >   slab_free_freelist_hook mm/slub.c:1470 [inline]
> >   slab_free mm/slub.c:3012 [inline]
> >   kfree+0xe4/0x2f0 mm/slub.c:3953
> >   hcd_buffer_free+0x199/0x260 drivers/usb/core/buffer.c:165
> >   usb_free_coherent+0x67/0x80 drivers/usb/core/usb.c:932
> >   hid_free_buffers.isra.0+0x94/0x290 drivers/hid/usbhid/hid-core.c:964
> >   usbhid_stop+0x308/0x450 drivers/hid/usbhid/hid-core.c:1224
> >   logi_dj_remove+0x107/0x210 drivers/hid/hid-logitech-dj.c:1797
> >   hid_device_remove+0xed/0x240 drivers/hid/hid-core.c:2242
> >   __device_release_driver drivers/base/dd.c:1118 [inline]
> >   device_release_driver_internal+0x206/0x4c0 drivers/base/dd.c:1151
> >   bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
> >   device_del+0x420/0xb10 drivers/base/core.c:2288
> >   hid_remove_device drivers/hid/hid-core.c:2413 [inline]
> >   hid_destroy_device+0xe1/0x150 drivers/hid/hid-core.c:2432
> >   usbhid_disconnect+0xad/0xd0 drivers/hid/usbhid/hid-core.c:1414
> >   usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
> >   __device_release_driver drivers/base/dd.c:1120 [inline]
> >   device_release_driver_internal+0x404/0x4c0 drivers/base/dd.c:1151
> >   bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
> >   device_del+0x420/0xb10 drivers/base/core.c:2288
> >   usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
> >   usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2199
> >   hub_port_connect drivers/usb/core/hub.c:4949 [inline]
> >   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
> >   port_event drivers/usb/core/hub.c:5359 [inline]
> >   hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
> >   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
> >   process_scheduled_works kernel/workqueue.c:2331 [inline]
> >   worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
> >   kthread+0x318/0x420 kernel/kthread.c:255
> >   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> >
> > Allocated by task 1745:
> >   save_stack+0x1b/0x80 mm/kasan/common.c:69
> >   set_track mm/kasan/common.c:77 [inline]
> >   __kasan_kmalloc mm/kasan/common.c:487 [inline]
> >   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
> >   kmalloc include/linux/slab.h:557 [inline]
> >   hcd_buffer_alloc+0x1ca/0x290 drivers/usb/core/buffer.c:135
> >   usb_alloc_coherent+0x5d/0x80 drivers/usb/core/usb.c:910
> >   hid_alloc_buffers drivers/hid/usbhid/hid-core.c:846 [inline]
> >   usbhid_start+0x60b/0x22f0 drivers/hid/usbhid/hid-core.c:1075
> >   hid_hw_start+0x5d/0x130 drivers/hid/hid-core.c:1976
> >   logi_dj_probe+0x808/0xcd7 drivers/hid/hid-logitech-dj.c:1703
> >   hid_device_probe+0x2be/0x3f0 drivers/hid/hid-core.c:2209
> >   really_probe+0x281/0x650 drivers/base/dd.c:548
> >   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
> >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
> >   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
> >   __device_attach+0x217/0x360 drivers/base/dd.c:882
> >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
> >   device_add+0xae6/0x16f0 drivers/base/core.c:2114
> >   hid_add_device+0x33c/0x990 drivers/hid/hid-core.c:2365
> >   usbhid_probe+0xa81/0xfa0 drivers/hid/usbhid/hid-core.c:1386
> >   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
> >   really_probe+0x281/0x650 drivers/base/dd.c:548
> >   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
> >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
> >   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
> >   __device_attach+0x217/0x360 drivers/base/dd.c:882
> >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
> >   device_add+0xae6/0x16f0 drivers/base/core.c:2114
> >   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
> >   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
> >   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
> >   really_probe+0x281/0x650 drivers/base/dd.c:548
> >   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
> >   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
> >   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
> >   __device_attach+0x217/0x360 drivers/base/dd.c:882
> >   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
> >   device_add+0xae6/0x16f0 drivers/base/core.c:2114
> >   usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
> >   hub_port_connect drivers/usb/core/hub.c:5098 [inline]
> >   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
> >   port_event drivers/usb/core/hub.c:5359 [inline]
> >   hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
> >   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
> >   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
> >   kthread+0x318/0x420 kernel/kthread.c:255
> >   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> >
> > Freed by task 1745:
> >   save_stack+0x1b/0x80 mm/kasan/common.c:69
> >   set_track mm/kasan/common.c:77 [inline]
> >   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
> >   slab_free_hook mm/slub.c:1423 [inline]
> >   slab_free_freelist_hook mm/slub.c:1470 [inline]
> >   slab_free mm/slub.c:3012 [inline]
> >   kfree+0xe4/0x2f0 mm/slub.c:3953
> >   hcd_buffer_free+0x199/0x260 drivers/usb/core/buffer.c:165
> >   usb_free_coherent+0x67/0x80 drivers/usb/core/usb.c:932
> >   hid_free_buffers.isra.0+0x94/0x290 drivers/hid/usbhid/hid-core.c:964
> >   usbhid_stop+0x308/0x450 drivers/hid/usbhid/hid-core.c:1224
> >   usbhid_disconnect+0xa5/0xd0 drivers/hid/usbhid/hid-core.c:1413
> >   usb_unbind_interface+0x1bd/0x8a0 drivers/usb/core/driver.c:423
> >   __device_release_driver drivers/base/dd.c:1120 [inline]
> >   device_release_driver_internal+0x404/0x4c0 drivers/base/dd.c:1151
> >   bus_remove_device+0x2dc/0x4a0 drivers/base/bus.c:556
> >   device_del+0x420/0xb10 drivers/base/core.c:2288
> >   usb_disable_device+0x211/0x690 drivers/usb/core/message.c:1237
> >   usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2199
> >   hub_port_connect drivers/usb/core/hub.c:4949 [inline]
> >   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
> >   port_event drivers/usb/core/hub.c:5359 [inline]
> >   hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
> >   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
> >   process_scheduled_works kernel/workqueue.c:2331 [inline]
> >   worker_thread+0x7ab/0xe20 kernel/workqueue.c:2417
> >   kthread+0x318/0x420 kernel/kthread.c:255
> >   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> >
> > The buggy address belongs to the object at ffff8881d5875500
> >   which belongs to the cache kmalloc-4k of size 4096
> > The buggy address is located 0 bytes inside of
> >   4096-byte region [ffff8881d5875500, ffff8881d5876500)
> > The buggy address belongs to the page:
> > page:ffffea0007561c00 refcount:1 mapcount:0 mapping:ffff8881da00c280
> > index:0x0 compound_mapcount: 0
> > flags: 0x200000000010200(slab|head)
> > raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da00c280
> > raw: 0000000000000000 0000000000070007 00000001ffffffff 0000000000000000
> > page dumped because: kasan: bad access detected
> >
> > Memory state around the buggy address:
> >   ffff8881d5875400: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >   ffff8881d5875480: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> > > ffff8881d5875500: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >                     ^
> >   ffff8881d5875580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >   ffff8881d5875600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> > ==================================================================
> >
> >
> > Tested on:
> >
> > commit:         7f7867ff usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan.git
> > console output: https://syzkaller.appspot.com/x/log.txt?x=13833b9a600000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=792eb47789f57810
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > patch:          https://syzkaller.appspot.com/x/patch.diff?x=167d2a0e600000
>
> Followup of commit e3e14de50dff ("HID: fix start/stop cycle in usbhid driver")
>
> --- a/drivers/hid/usbhid/hid-core.c
> +++ b/drivers/hid/usbhid/hid-core.c
> @@ -1214,6 +1214,8 @@ static void usbhid_stop(struct hid_devic
>
>         hid->claimed = 0;
>
> +       if (!usbhid->urbin) /* freeing buffers only once */
> +               return;

I have not read all the code, but the last report was a double-free,
which suggests that usbhid->urbin is actually not reset to NULL, so
this check won't help. Potentially we need both this check and reset
the fields to NULL after freeing.

>         usb_free_urb(usbhid->urbin);
>         usb_free_urb(usbhid->urbctrl);
>         usb_free_urb(usbhid->urbout);
