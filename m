Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8DF9108B87
	for <lists+linux-input@lfdr.de>; Mon, 25 Nov 2019 11:20:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbfKYKU2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Nov 2019 05:20:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:57509 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727266AbfKYKU2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Nov 2019 05:20:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574677226;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2wR4OFQfcEj7YLzQ//B/iHKD1Qfb7mvI/2MnuS9L5go=;
        b=BdAFn0Sx+1qLePH9alQi5UrzDgMRp7FMb9aWPGQtR0RL5sBffwKbPen1u7X6F1uyoR1W0+
        KoUwksqI9RJxmpAC6Ai0BMHAT7FuRHMs4JGJU7TZoGW6DD3Iom/C8fMxrsKpocbyy5ebBu
        h/WyoXiONGIsYsmMVMfFGN3SGyJAG3Y=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-SGGBqYUyM7KXwyHyaWuO4Q-1; Mon, 25 Nov 2019 05:20:24 -0500
Received: by mail-qk1-f197.google.com with SMTP id r2so9336516qkb.2
        for <linux-input@vger.kernel.org>; Mon, 25 Nov 2019 02:20:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8U50CXQajfYBd8TsMCcrA8zf8mz+7xB7aMs6wuHKVyI=;
        b=rZaflOKGT6i3/kovNjxCtf+f0G1sEFlNL4dKpTPlc6vPyWrVRtjCVhOXfwP/5vksMk
         kk7xv5xqXNkZWGcTqLMlWP83Q9PXIvbcmrzM6D7Q2rwy7tQs9LGwzoez3rp8qWfZCYyx
         xBaN86sX7cncGxKtpLFnU2dWTgmT80KZ5qWV6Pqnv7xX2SGbXxUKoV6Qg/UYVFwEluRI
         PLSHDwPa+M6uP/3bNhYiWyhe0rXwCixYp0B2AiETRejNlrqDd+4kEGBNWc+LlKfjXmjQ
         aVc9x0EPvAoF9x2UnsoGbd0kNLtF2tydRG94Bgoh6SOW+7pXCE8ZSNfFAhU1ipBKycnh
         ygdw==
X-Gm-Message-State: APjAAAWfjf4Lpvc5VDRgLXPTf2pwRn6e5ngrM3Onr3vKzTOthQ3YzZWX
        9m3M04FONWvm4W7fHqKwvmrII3yP1gHkdlpWPeXEG6D9ygVIWH5F9fK4AfPpwpGfF7h8l2xHBuf
        G2d62OP8OnW9inJAixG9JnLqPMaJ+wDSw7PrLh2A=
X-Received: by 2002:a37:7d05:: with SMTP id y5mr24566864qkc.27.1574677223843;
        Mon, 25 Nov 2019 02:20:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwm9i0GUK7omwPoIGZMyVsKS4j2CDmbdL/IlwU//AsG5CTm/glSzLGcZAcSs7b+KGizjB6KaPzaqF301/N4o2s=
X-Received: by 2002:a37:7d05:: with SMTP id y5mr24566847qkc.27.1574677223492;
 Mon, 25 Nov 2019 02:20:23 -0800 (PST)
MIME-Version: 1.0
References: <CAO-hwJJYucLrBSYqK4UM08XBgPTn_gLYRyJO=RxKscX90JG+MQ@mail.gmail.com>
 <00000000000079cbad05982905f4@google.com>
In-Reply-To: <00000000000079cbad05982905f4@google.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 25 Nov 2019 11:20:12 +0100
Message-ID: <CAO-hwJL_P92-PvyDO2gEPovAQ3vmoH4jpQd-9w5G2ug1UPjc7A@mail.gmail.com>
Subject: Re: Re: KMSAN: uninit-value in lg4ff_set_autocenter_default
To:     syzbot <syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com>
Cc:     glider@google.com, Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
X-MC-Unique: SGGBqYUyM7KXwyHyaWuO4Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Another try:

#syz test: https://github.com/google/kmsan.git master

5.4-rc8 as in this kmsan.git tree should have
d9d4b1e46d9543a82c23f6df03f4ad697dab361b (was included in 5.4-rc6 when
the original syzbot issue was based on a 5.4-rc3)

Cheers,
Benjamin

On Mon, Nov 25, 2019 at 11:14 AM syzbot
<syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com> wrote:
>
> > Pretty sure this is already fixed
>
> > #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
> > for-next
>
> KMSAN bugs can only be tested on https://github.com/google/kmsan.git tree
> because KMSAN tool is not upstreamed yet.
> See https://goo.gl/tpsmEJ#kmsan-bugs for details.
>
>
>
> > On Mon, Oct 28, 2019 at 11:32 AM syzbot
> > <syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com> wrote:
>
> >> Hello,
>
> >> syzbot found the following crash on:
>
> >> HEAD commit:    d86c1556 kmsan: add printk_test()
> >> git tree:       https://github.com/google/kmsan.git master
> >> console output: https://syzkaller.appspot.com/x/log.txt?x=3D125e96e0e0=
0000
> >> kernel config:
> >> https://syzkaller.appspot.com/x/.config?x=3Dc07a3d4f8a59e198
> >> dashboard link:
> >> https://syzkaller.appspot.com/bug?extid=3D1234691fec1b8ceba8b1
> >> compiler:       clang version 9.0.0 (/home/glider/llvm/clang
> >> 80fee25776c2fb61e74c1ecb1a523375c2500b69)
> >> syz repro:
> >> https://syzkaller.appspot.com/x/repro.syz?x=3D179da024e00000
> >> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D157f40a8e0=
0000
>
> >> IMPORTANT: if you fix the bug, please add the following tag to the
> >> commit:
> >> Reported-by: syzbot+1234691fec1b8ceba8b1@syzkaller.appspotmail.com
>
> >> logitech 0003:046D:CA03.0001: hidraw0: USB HID v0.00 Device [HID
> >> 046d:ca03]
> >> on usb-dummy_hcd.3-1/input0
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >> BUG: KMSAN: uninit-value in dev_get_drvdata include/linux/device.h:138=
8
> >> [inline]
> >> BUG: KMSAN: uninit-value in hid_get_drvdata include/linux/hid.h:628
> >> [inline]
> >> BUG: KMSAN: uninit-value in lg4ff_set_autocenter_default+0x23a/0xa20
> >> drivers/hid/hid-lg4ff.c:477
> >> CPU: 1 PID: 49 Comm: kworker/1:1 Not tainted 5.4.0-rc3+ #0
> >> Hardware name: Google Google Compute Engine/Google Compute Engine, BIO=
S
> >> Google 01/01/2011
> >> Workqueue: usb_hub_wq hub_event
> >> Call Trace:
> >>    __dump_stack lib/dump_stack.c:77 [inline]
> >>    dump_stack+0x191/0x1f0 lib/dump_stack.c:113
> >>    kmsan_report+0x128/0x220 mm/kmsan/kmsan_report.c:108
> >>    __msan_warning+0x73/0xe0 mm/kmsan/kmsan_instr.c:245
> >>    dev_get_drvdata include/linux/device.h:1388 [inline]
> >>    hid_get_drvdata include/linux/hid.h:628 [inline]
> >>    lg4ff_set_autocenter_default+0x23a/0xa20 drivers/hid/hid-lg4ff.c:47=
7
> >>    lg4ff_init+0x1e3d/0x33a0 drivers/hid/hid-lg4ff.c:1355
> >>    lg_probe+0x103d/0x1110 drivers/hid/hid-lg.c:850
> >>    hid_device_probe+0x490/0x820 drivers/hid/hid-core.c:2209
> >>    really_probe+0xcc2/0x1f90 drivers/base/dd.c:548
> >>    driver_probe_device+0x1ba/0x510 drivers/base/dd.c:721
> >>    __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:828
> >>    bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:430
> >>    __device_attach+0x489/0x750 drivers/base/dd.c:894
> >>    device_initial_probe+0x4a/0x60 drivers/base/dd.c:941
> >>    bus_probe_device+0x131/0x390 drivers/base/bus.c:490
> >>    device_add+0x25b5/0x2df0 drivers/base/core.c:2201
> >>    hid_add_device+0x12f1/0x1440 drivers/hid/hid-core.c:2365
> >>    usbhid_probe+0x152b/0x1880 drivers/hid/usbhid/hid-core.c:1386
> >>    usb_probe_interface+0xd19/0x1310 drivers/usb/core/driver.c:361
> >>    really_probe+0xd91/0x1f90 drivers/base/dd.c:552
> >>    driver_probe_device+0x1ba/0x510 drivers/base/dd.c:721
> >>    __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:828
> >>    bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:430
> >>    __device_attach+0x489/0x750 drivers/base/dd.c:894
> >>    device_initial_probe+0x4a/0x60 drivers/base/dd.c:941
> >>    bus_probe_device+0x131/0x390 drivers/base/bus.c:490
> >>    device_add+0x25b5/0x2df0 drivers/base/core.c:2201
> >>    usb_set_configuration+0x309f/0x3710 drivers/usb/core/message.c:2027
> >>    generic_probe+0xe7/0x280 drivers/usb/core/generic.c:210
> >>    usb_probe_device+0x146/0x200 drivers/usb/core/driver.c:266
> >>    really_probe+0xd91/0x1f90 drivers/base/dd.c:552
> >>    driver_probe_device+0x1ba/0x510 drivers/base/dd.c:721
> >>    __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:828
> >>    bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:430
> >>    __device_attach+0x489/0x750 drivers/base/dd.c:894
> >>    device_initial_probe+0x4a/0x60 drivers/base/dd.c:941
> >>    bus_probe_device+0x131/0x390 drivers/base/bus.c:490
> >>    device_add+0x25b5/0x2df0 drivers/base/core.c:2201
> >>    usb_new_device+0x23e5/0x2fb0 drivers/usb/core/hub.c:2536
> >>    hub_port_connect drivers/usb/core/hub.c:5098 [inline]
> >>    hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
> >>    port_event drivers/usb/core/hub.c:5359 [inline]
> >>    hub_event+0x581d/0x72f0 drivers/usb/core/hub.c:5441
> >>    process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
> >>    process_scheduled_works kernel/workqueue.c:2331 [inline]
> >>    worker_thread+0x189c/0x2460 kernel/workqueue.c:2417
> >>    kthread+0x4b5/0x4f0 kernel/kthread.c:256
> >>    ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355
>
> >> Uninit was created at:
> >>    kmsan_save_stack_with_flags+0x3f/0x90 mm/kmsan/kmsan.c:151
> >>    kmsan_internal_alloc_meta_for_pages mm/kmsan/kmsan_shadow.c:362
> >> [inline]
> >>    kmsan_alloc_page+0x153/0x360 mm/kmsan/kmsan_shadow.c:391
> >>    __alloc_pages_nodemask+0x149d/0x60c0 mm/page_alloc.c:4794
> >>    alloc_pages_current+0x68d/0x9a0 mm/mempolicy.c:2188
> >>    alloc_pages include/linux/gfp.h:511 [inline]
> >>    alloc_slab_page+0x10e/0x12c0 mm/slub.c:1536
> >>    allocate_slab mm/slub.c:1681 [inline]
> >>    new_slab+0x2ca/0x1990 mm/slub.c:1747
> >>    new_slab_objects mm/slub.c:2498 [inline]
> >>    ___slab_alloc+0x1423/0x1fb0 mm/slub.c:2649
> >>    __slab_alloc mm/slub.c:2689 [inline]
> >>    slab_alloc_node mm/slub.c:2752 [inline]
> >>    slab_alloc mm/slub.c:2801 [inline]
> >>    __kmalloc+0x356/0x430 mm/slub.c:3832
> >>    kmalloc include/linux/slab.h:561 [inline]
> >>    kzalloc+0x53/0xb0 include/linux/slab.h:690
> >>    crypto_create_tfm+0xfd/0x640 crypto/api.c:459
> >>    crypto_alloc_tfm+0x339/0x630 crypto/api.c:538
> >>    crypto_alloc_shash+0x99/0xb0 crypto/shash.c:450
> >>    ima_alloc_tfm security/integrity/ima/ima_crypto.c:87 [inline]
> >>    ima_calc_field_array_hash+0x20c/0xbb0
> >> security/integrity/ima/ima_crypto.c:519
> >>    ima_store_template security/integrity/ima/ima_api.c:109 [inline]
> >>    ima_store_measurement+0x4d6/0xd00 security/integrity/ima/ima_api.c:=
328
> >>    process_measurement+0x1f4e/0x2bd0 security/integrity/ima/ima_main.c=
:334
> >>    ima_bprm_check+0x13d/0x300 security/integrity/ima/ima_main.c:413
> >>    security_bprm_check+0x192/0x1e0 security/security.c:787
> >>    search_binary_handler+0xb2/0xac0 fs/exec.c:1646
> >>    exec_binprm fs/exec.c:1702 [inline]
> >>    __do_execve_file+0x2218/0x2e90 fs/exec.c:1822
> >>    do_execveat_common fs/exec.c:1868 [inline]
> >>    do_execve fs/exec.c:1885 [inline]
> >>    __do_sys_execve fs/exec.c:1961 [inline]
> >>    __se_sys_execve+0xec/0x110 fs/exec.c:1956
> >>    __x64_sys_execve+0x4a/0x70 fs/exec.c:1956
> >>    do_syscall_64+0xb6/0x160 arch/x86/entry/common.c:291
> >>    entry_SYSCALL_64_after_hwframe+0x63/0xe7
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>
>
> >> ---
> >> This bug is generated by a bot. It may contain errors.
> >> See https://goo.gl/tpsmEJ for more information about syzbot.
> >> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> >> syzbot will keep track of this bug report. See:
> >> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> >> syzbot can test patches for this bug, for details see:
> >> https://goo.gl/tpsmEJ#testing-patches
>

