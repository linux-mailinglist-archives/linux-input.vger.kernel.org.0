Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF84C89EB4
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 14:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbfHLMsS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 08:48:18 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43474 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726543AbfHLMsS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 08:48:18 -0400
Received: by mail-pg1-f195.google.com with SMTP id r26so13476814pgl.10
        for <linux-input@vger.kernel.org>; Mon, 12 Aug 2019 05:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b0QVDbwzpD6p/rhtAsac9CPlvi66FPJCbH2ofPwqDsM=;
        b=vk6xeIpkeBpLmcpzbPM6kVLX+aCnMfkjDOpH/FhTv+ylmcDq6QVuceYu4hiWLkiPSv
         CRN56U+s/v5ZeGnycV35/TVv57LzdRzeWvM0CshoVIE+Uw584T21KP2EMtRWArAxbdTv
         KSVOyjWnRrnAwbFh1e2iKNEFu2862m6yzVyppGSSVFE+MtcSOPAhpLIWB004v8erkNGO
         vCVGaPqmVCSUI0V4yf7qveW+PCZ1ZMeecpC0mJ4PuOa/iGPIlc7qDWPxz3EL3vY3oi3m
         WzbDUrhAUudYVIYt4b3TEPwEJHf5dgyZMAdYd3mGHPT6B2R6rEzJbJ+wTpoJHg20rkCt
         SLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b0QVDbwzpD6p/rhtAsac9CPlvi66FPJCbH2ofPwqDsM=;
        b=pXVj7uoyezYENCRT8aCmS2bZxX/tC4LDxtanyGYY2PVJZM6O2oCE2U+BMDt1icWoux
         VxKp9ZUXQh5DRgbXngOXGj9Cx7ELk8WK/pEqPeDzPMpoeSPv/Sk3lxm8lE9vVD6h3ArD
         GPwBlHygtw9V/yRUS1onHfC+YjShWa4YipuNSn9nTHE2Bejc8HbYBbrvd/iWKLbt/o5R
         4tFKVla325Wxc2T2C8mzgexpA3Exks8pWo+ilLrChDGraAWQu/9SW5hzQh35zKoRT/y1
         CX1mBpfevf3EHEWWaCsGKBcdmFj/1hFKgj9+pbKsEInleO5DLmH8TYmZYAc9ZLiQjr4T
         xp3A==
X-Gm-Message-State: APjAAAXtdvgXJk99EyYyeus+9iVhGeX9dI+iuBnFXcTmIU1xJOdAjvOi
        Bg/aBkNr3B3nmN0jPWbciAJ1DLY9jd3Wpdb+LMN5Nw==
X-Google-Smtp-Source: APXvYqxtIVI1KaxF0rbj0wYhVgaq3ncNIGrBEB0+V7+P6aKtIGSm2hz2pfSXGgLw0ttE9UdsILI1z8gXlizIvkVQek0=
X-Received: by 2002:aa7:9e0a:: with SMTP id y10mr11679648pfq.93.1565614097528;
 Mon, 12 Aug 2019 05:48:17 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000005ff828058f9a5480@google.com>
In-Reply-To: <0000000000005ff828058f9a5480@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 12 Aug 2019 14:48:06 +0200
Message-ID: <CAAeHK+wGZ+KpYKR1Ybc9Eu72fWMA+JCfVq=qYU-sq8dNQJ7iyg@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in usbhid_raw_request
To:     syzbot <syzbot+75e6910bf03e266a277f@syzkaller.appspotmail.com>
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

On Thu, Aug 8, 2019 at 2:38 PM syzbot
<syzbot+75e6910bf03e266a277f@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=16000516600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> dashboard link: https://syzkaller.appspot.com/bug?extid=75e6910bf03e266a277f
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
>
> Unfortunately, I don't have any reproducer for this crash yet.
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+75e6910bf03e266a277f@syzkaller.appspotmail.com
>
> ==================================================================
> BUG: KASAN: use-after-free in usbhid_get_raw_report
> drivers/hid/usbhid/hid-core.c:865 [inline]
> BUG: KASAN: use-after-free in usbhid_raw_request+0x5f2/0x640
> drivers/hid/usbhid/hid-core.c:1263
> Read of size 8 at addr ffff8881c8702270 by task syz-executor.4/8993
>
> CPU: 0 PID: 8993 Comm: syz-executor.4 Not tainted 5.3.0-rc2+ #25
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 01/01/2011
> Call Trace:
>   __dump_stack lib/dump_stack.c:77 [inline]
>   dump_stack+0xca/0x13e lib/dump_stack.c:113
>   print_address_description+0x6a/0x32c mm/kasan/report.c:351
>   __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
>   kasan_report+0xe/0x12 mm/kasan/common.c:612
>   usbhid_get_raw_report drivers/hid/usbhid/hid-core.c:865 [inline]
>   usbhid_raw_request+0x5f2/0x640 drivers/hid/usbhid/hid-core.c:1263
>   hid_hw_raw_request include/linux/hid.h:1079 [inline]
>   hidraw_get_report drivers/hid/hidraw.c:228 [inline]
>   hidraw_ioctl+0x936/0xae0 drivers/hid/hidraw.c:426

#syz dup: WARNING in usbhid_raw_request/usb_submit_urb

>   vfs_ioctl fs/ioctl.c:46 [inline]
>   file_ioctl fs/ioctl.c:509 [inline]
>   do_vfs_ioctl+0xd2d/0x1330 fs/ioctl.c:696
>   ksys_ioctl+0x9b/0xc0 fs/ioctl.c:713
>   __do_sys_ioctl fs/ioctl.c:720 [inline]
>   __se_sys_ioctl fs/ioctl.c:718 [inline]
>   __x64_sys_ioctl+0x6f/0xb0 fs/ioctl.c:718
>   do_syscall_64+0xb7/0x580 arch/x86/entry/common.c:296
>   entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x459829
> Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7
> 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff
> ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
> RSP: 002b:00007f7f49878c78 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000000459829
> RDX: 0000000020000180 RSI: 00000000c0404807 RDI: 0000000000000004
> RBP: 000000000075bf20 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f7f498796d4
> R13: 00000000004c2152 R14: 00000000004d54f8 R15: 00000000ffffffff
>
> Allocated by task 83:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_kmalloc mm/kasan/common.c:487 [inline]
>   __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:460
>   kmalloc include/linux/slab.h:552 [inline]
>   kzalloc include/linux/slab.h:748 [inline]
>   usb_set_configuration+0x2c4/0x1670 drivers/usb/core/message.c:1846
>   generic_probe+0x9d/0xd5 drivers/usb/core/generic.c:210
>   usb_probe_device+0x99/0x100 drivers/usb/core/driver.c:266
>   really_probe+0x281/0x650 drivers/base/dd.c:548
>   driver_probe_device+0x101/0x1b0 drivers/base/dd.c:709
>   __device_attach_driver+0x1c2/0x220 drivers/base/dd.c:816
>   bus_for_each_drv+0x15c/0x1e0 drivers/base/bus.c:454
>   __device_attach+0x217/0x360 drivers/base/dd.c:882
>   bus_probe_device+0x1e4/0x290 drivers/base/bus.c:514
>   device_add+0xae6/0x16f0 drivers/base/core.c:2114
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
> Freed by task 83:
>   save_stack+0x1b/0x80 mm/kasan/common.c:69
>   set_track mm/kasan/common.c:77 [inline]
>   __kasan_slab_free+0x130/0x180 mm/kasan/common.c:449
>   slab_free_hook mm/slub.c:1423 [inline]
>   slab_free_freelist_hook mm/slub.c:1470 [inline]
>   slab_free mm/slub.c:3012 [inline]
>   kfree+0xe4/0x2f0 mm/slub.c:3953
>   device_release+0x71/0x200 drivers/base/core.c:1064
>   kobject_cleanup lib/kobject.c:693 [inline]
>   kobject_release lib/kobject.c:722 [inline]
>   kref_put include/linux/kref.h:65 [inline]
>   kobject_put+0x171/0x280 lib/kobject.c:739
>   put_device+0x1b/0x30 drivers/base/core.c:2213
>   usb_disable_device+0x2ce/0x690 drivers/usb/core/message.c:1244
>   usb_disconnect+0x284/0x8d0 drivers/usb/core/hub.c:2199
>   hub_port_connect drivers/usb/core/hub.c:4949 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
>   port_event drivers/usb/core/hub.c:5359 [inline]
>   hub_event+0x1454/0x3640 drivers/usb/core/hub.c:5441
>   process_one_work+0x92b/0x1530 kernel/workqueue.c:2269
>   worker_thread+0x96/0xe20 kernel/workqueue.c:2415
>   kthread+0x318/0x420 kernel/kthread.c:255
>   ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
>
> The buggy address belongs to the object at ffff8881c8702200
>   which belongs to the cache kmalloc-2k of size 2048
> The buggy address is located 112 bytes inside of
>   2048-byte region [ffff8881c8702200, ffff8881c8702a00)
> The buggy address belongs to the page:
> page:ffffea000721c000 refcount:1 mapcount:0 mapping:ffff8881da00c000
> index:0x0 compound_mapcount: 0
> flags: 0x200000000010200(slab|head)
> raw: 0200000000010200 dead000000000100 dead000000000122 ffff8881da00c000
> raw: 0000000000000000 00000000000f000f 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>   ffff8881c8702100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff8881c8702180: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> > ffff8881c8702200: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                                               ^
>   ffff8881c8702280: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>   ffff8881c8702300: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
