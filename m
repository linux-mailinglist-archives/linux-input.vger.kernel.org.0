Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8519FB9117
	for <lists+linux-input@lfdr.de>; Fri, 20 Sep 2019 15:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387500AbfITNv2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Sep 2019 09:51:28 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39683 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387502AbfITNv1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Sep 2019 09:51:27 -0400
Received: by mail-pf1-f194.google.com with SMTP id i1so4550780pfa.6
        for <linux-input@vger.kernel.org>; Fri, 20 Sep 2019 06:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ChYm0rSxkHeTelj445/TNxzeQNewmWLsg9BaWUylQuo=;
        b=AWx2bCyuUgsAgAcV7tyidybSThxrHop46UV6pi4QauhIsKZ0YHlX+qe20M7KVkqCWm
         GnECkr8DPAz1TpF1HdY9Nk67+kLJQQ0yPgc3WbF1pNXEjHAf+I79NZEKFlTFLUJu4oCQ
         1L15YOOsv8EqgNqY1Vcf7raTUww89iziJtRboSpoXiWhu5ACubi/Hw55zwrEHgFqlbyb
         iAsrLwt5Kcrl9pOJSIpO8rF5x0lb1EZY1TxooeKlWjFHzAih3Su+w6LuwwGxW2riHwjZ
         NinyXwyx+5wiOFgpEzoUCcrSXQMyStf8yJbk4JhcsjPYQuWGByJscYCcVr0ozXTVv5sP
         xFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ChYm0rSxkHeTelj445/TNxzeQNewmWLsg9BaWUylQuo=;
        b=fpc4GN6lg6XuYOkz0INsNs4DmZ8cCVLvzxxcYrxUuKvrGYKGKo/sSSj6xyyFIeCmou
         8wCR82cWeyMpXamLVcQY+0rZ93P8O7l6UxyVauhSn0fxbF8II5NKhLUFxtdpyrGt1V49
         aaQ2DCjfYlcFciUkwiAmsdyHsmizdyuggzhjkyjpojg4QOFk3kc4+gmb1D1Ff1Wx++WB
         PmjZSrFDhXYgoConVFxnYafas9euuLGQDnmL7TKyTvOrbetHQR79upJN0YkeCo3RT+9x
         fk2M7kHl4W3KFD/p6VI2RacVPkHHGXttUofPeI4vIahEnvQgpRRL0aNyvReaEV+2/tXl
         uQ6w==
X-Gm-Message-State: APjAAAWnO7oX2wqkQiDKATHLRWB63TMRQfi6Z3I6cWvwhZUUxhGwYJQO
        K8rCwnSROq5F4bQner0Vq+nb7BIQ/jaGQkw5ttC7Fw==
X-Google-Smtp-Source: APXvYqx6Aed/0Pv/s/rCKUHNZpFKwJLfhe7l/VecirMXX2Kq0Mxau/j27DKibUBdWOKvrYe1oPXZ6Eog57C8VKsw1B0=
X-Received: by 2002:a63:d1a:: with SMTP id c26mr11493802pgl.286.1568987485269;
 Fri, 20 Sep 2019 06:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000006c06df0592fc55ea@google.com>
In-Reply-To: <0000000000006c06df0592fc55ea@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 20 Sep 2019 15:51:14 +0200
Message-ID: <CAAeHK+yKB_Ny41E2W=huz7vakvP_4UdZg2heCN2Mxt0=rsDG6g@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Write in hiddev_ioctl_usage
To:     syzbot <syzbot+34ee1b45d88571c2fa8b@syzkaller.appspotmail.com>
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

On Fri, Sep 20, 2019 at 3:49 PM syzbot
<syzbot+34ee1b45d88571c2fa8b@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    e0bd8d79 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=17cb8255600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=8847e5384a16f66a
> dashboard link: https://syzkaller.appspot.com/bug?extid=34ee1b45d88571c2fa8b
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1151ee8d600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10ce5909600000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+34ee1b45d88571c2fa8b@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KASAN: slab-out-of-bounds in hiddev_ioctl_usage.isra.0+0x1251/0x13b0
> drivers/hid/usbhid/hiddev.c:541
> Write of size 4 at addr ffff8881d59384b4 by task syz-executor819/1731
>
> CPU: 1 PID: 1731 Comm: syz-executor819 Not tainted 5.3.0+ #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   print_address_description+0x6a/0x32c mm/kasan/report.c:351
>   __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
>   kasan_report+0xe/0x12 mm/kasan/common.c:618
>   hiddev_ioctl_usage.isra.0+0x1251/0x13b0 drivers/hid/usbhid/hiddev.c:541
>   hiddev_ioctl+0x7a1/0x1550 drivers/hid/usbhid/hiddev.c:807
>   vfs_ioctl fs/ioctl.c:46 [inline]
>   file_ioctl fs/ioctl.c:509 [inline]
>   do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
>   ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
>   __do_sys_ioctl fs/ioctl.c:720 [inline]
>   __se_sys_ioctl fs/ioctl.c:718 [inline]
>   __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
>   do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:290
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x444809
> Code: e8 bc af 02 00 48 83 c4 18 c3 0f 1f 80 00 00 00 00 48 89 f8 48 89 f7
> 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff
> ff 0f 83 1b d8 fb ff c3 66 2e 0f 1f 84 00 00 00 00
> RSP: 002b:00007ffd4d98f5b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00000000004002e0 RCX: 0000000000444809
> RDX: 00000000200008c0 RSI: 000000004018480c RDI: 0000000000000004
> RBP: 00000000006cf018 R08: 18c1180b508ac6d9 R09: 00000000004002e0
> R10: 000000000000000f R11: 0000000000000246 R12: 00000000004024b0
> R13: 0000000000402540 R14: 0000000000000000 R15: 0000000000000000
>
> Allocated by task 83:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_kmalloc mm/kasan/common.c:493 [inline]
>   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:466
>   kmalloc include/linux/slab.h:557 [inline]
>   kzalloc include/linux/slab.h:748 [inline]
>   hid_register_field drivers/hid/hid-core.c:102 [inline]
>   hid_add_field+0x444/0x11c0 drivers/hid/hid-core.c:277
>   hid_parser_main+0x6ab/0xbf0 drivers/hid/hid-core.c:579
>   hid_open_report+0x372/0x620 drivers/hid/hid-core.c:1202
>   hid_parse include/linux/hid.h:1017 [inline]
>   cmhid_probe+0xdd/0x160 drivers/hid/hid-cmedia.c:117
>   hid_device_probe+0x2be/0x3f0 drivers/hid/hid-core.c:2209
>   really_probe+0x281/0x6d0 drivers/base/dd.c:548
>   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
>   __device_attach+0x217/0x360 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
>   device_add+0xae6/0x16f0 drivers/base/core.c:2201
>   hid_add_device+0x33c/0x990 drivers/hid/hid-core.c:2365
>   usbhid_probe+0xa81/0xfa0 drivers/hid/usbhid/hid-core.c:1386
>   usb_probe_interface+0x305/0x7a0 drivers/usb/core/driver.c:361
>   really_probe+0x281/0x6d0 drivers/base/dd.c:548
>   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
>   __device_attach+0x217/0x360 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
>   device_add+0xae6/0x16f0 drivers/base/core.c:2201
>   usb_set_configuration+0xdf6/0x1670 drivers/usb/core/message.c:2023
>   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>   really_probe+0x281/0x6d0 drivers/base/dd.c:548
>   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:828
>   bus_for_each_drv+0x162/0x1e0 drivers/base/bus.c:430
>   __device_attach+0x217/0x360 drivers/base/dd.c:894
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:490
>   device_add+0xae6/0x16f0 drivers/base/core.c:2201
>   usb_new_device.cold+0x6a4/0xe79 drivers/usb/core/hub.c:2536
>   hub_port_connect drivers/usb/core/hub.c:5098 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
>   port_event drivers/usb/core/hub.c:5359 [inline]
>   hub_event+0x1b5c/0x3640 drivers/usb/core/hub.c:5441
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> Freed by task 1:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:455
>   slab_free_hook mm/slub.c:1423 [inline]
>   slab_free_freelist_hook mm/slub.c:1474 [inline]
>   slab_free mm/slub.c:3016 [inline]
>   kfree+0xe4/0x2f0 mm/slub.c:3957
>   do_new_mount fs/namespace.c:2798 [inline]
>   do_mount+0x69f/0x1af0 fs/namespace.c:3114
>   ksys_mount+0xd7/0x150 fs/namespace.c:3323
>   do_mount_root+0x32/0x1ce init/do_mounts.c:389
>   mount_block_root+0x317/0x5d3 init/do_mounts.c:418
>   mount_root+0x1cd/0x213 init/do_mounts.c:563
>   prepare_namespace+0x1ff/0x23b init/do_mounts.c:622
>   kernel_init_freeable+0x57e/0x596 init/main.c:1211
>   kernel_init+0xd/0x1bf init/main.c:1110
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> The buggy address belongs to the object at ffff8881d59383c0
>   which belongs to the cache kmalloc-256 of size 256
> The buggy address is located 244 bytes inside of
>   256-byte region [ffff8881d59383c0, ffff8881d59384c0)
> The buggy address belongs to the page:
> page:ffffea0007564e00 refcount:1 mapcount:0 mapping:ffff8881da002780
> index:0x0
> flags: 0x200000000000200(slab)
> raw: 0200000000000200 ffffea0007607e40 0000000b0000000b ffff8881da002780
> raw: 0000000000000000 00000000000c000c 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>   ffff8881d5938380: fc fc fc fc fc fc fc fc 00 00 00 00 00 00 00 00
>   ffff8881d5938400: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > ffff8881d5938480: 00 00 00 00 00 fc fc fc fc fc fc fc fc fc fc fc
>                                       ^
>   ffff8881d5938500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   ffff8881d5938580: 00 00 00 00 00 00 00 00 00 00 00 00 00 fc fc fc
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
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches

AFACT, this is not fixed by the patches currently queued on the HID tree.
