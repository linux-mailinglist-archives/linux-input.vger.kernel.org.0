Return-Path: <linux-input+bounces-16066-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AA42AC55A92
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 05:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 44B3B4E17CA
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 04:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FC33002DE;
	Thu, 13 Nov 2025 04:38:30 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2592FF668
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 04:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763008710; cv=none; b=d7mR9RZwGQpfQdfza1Nwin9lw6ll4aVv3KndZj8UTK2Z48WvUmQoF6GcZboljK4/i6rCR4prIIcHP9ru9bTOPk+gZciyY7ysd2NWPuPFJFKqFfpfNuN3IV5JsnfKOoOTQ6fmeL8LscZkZlnQGlT2SOaDfNvxwPK3pKpB+W5+EdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763008710; c=relaxed/simple;
	bh=u4u+sSazYqabZAc7hbMiiOjWUH71MWq0EYF7rKOkCn4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=cRsP3kdmixcG/4u7qkhE8W/rgah85fJqwAxKgIGGy1aw8LnDDTHjAZSNBowaPlAIRz2zyhWH3tvSoNmKeP/KaXTex6A7D9QEU55mrvB4fcxmkj4shcQkP7JzKxlG2oA93YuyfL1LW71gk5F9E4gGatHSg/LllmN/NWV8qCGxRSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-432f8352633so14656545ab.0
        for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 20:38:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763008708; x=1763613508;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uqEdPYImH11oIYQwbpCJG1OiZMqycbT4DrjcTtnisxQ=;
        b=ekz8zHvteWAjK7ZgphYh6aGkFDIR6On7PChJ8zrIfjWfGQ92JfnFwHDtRuqZhlQMMK
         Rq1yq0omMG6JBsctEoMVKE45yAQqc0JNVykq9ip1s54zm1aP8ZUgrzplQOJN02ekv4I1
         PwqWOPGbm5ooFhD7dvJvorefbKgeYvKUU0DOYRAvPbJRjv2weTrkKR/Gpv6gXbcboExu
         njVhQCRsKaF6/t4vWs/S+TPiBgI/39r38Y9zlNzNQ573fIjBjBlrnGyajbN1vAxbMlzy
         QLbDVKQzOhaF07h/nA9XYPAy2x1R2VgVj5IzDIyiRWXr6A/IiTwGBuhJ7SRbOVOr/zTK
         N24w==
X-Forwarded-Encrypted: i=1; AJvYcCVz4lRXpjOWSlYxm4GmC9pMLp2BeDUXsEdjUr/8u36STp1l4gddHsMwUg4IZIazPI4Dw655JTAYWuRjoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEhKPyrNCCUUL6FLEx+VqFMh/ycnMXiaWhRp0EQOYGJggyj3fe
	CMYOsyS2B7KyLG1Sp1G9JGzdRwpHbwe0GO/81oEBgwUEqgRtwKNxhp0zYSzimBN43ASf4fVHryQ
	gDxjC3xa5dmPG5FP9szKmGs3b9gAbhn7/MyrTXtbkBv9Z851VK5XJdzH/f8U=
X-Google-Smtp-Source: AGHT+IFPUUaBMBYWYmEpm1xGnfuQrzXbwLufkiiyezvFTZNvYIsKGLRFMHVEBvqQGgN+x8CLdPzU4H84GrkAqbcGEMTIrmbpdPMQ
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:349b:b0:434:6f6a:fb99 with SMTP id
 e9e14a558f8ab-43473d71af5mr74866775ab.21.1763008708115; Wed, 12 Nov 2025
 20:38:28 -0800 (PST)
Date: Wed, 12 Nov 2025 20:38:28 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <691560c4.a70a0220.3124cb.0019.GAE@google.com>
Subject: [syzbot] [input?] [usb?] memory leak in dualshock4_get_calibration_data
From: syzbot <syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com>
To: bentiss@kernel.org, jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    24172e0d7990 Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12a44692580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb128cd5cb439809
dashboard link: https://syzkaller.appspot.com/bug?extid=4f5f81e1456a1f645bf8
compiler:       gcc (Debian 12.2.0-14+deb12u1) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1508c658580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1051897c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ded911fa4408/disk-24172e0d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a1f3e61cb784/vmlinux-24172e0d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b92fd0e25cb7/bzImage-24172e0d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4f5f81e1456a1f645bf8@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff8881192f9a40 (size 64):
  comm "kworker/1:0", pid 23, jiffies 4294944710
  hex dump (first 32 bytes):
    02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc c51b5d6b):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    __kmalloc_cache_noprof+0x3a6/0x5b0 mm/slub.c:5766
    kmalloc_noprof include/linux/slab.h:957 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    dualshock4_get_calibration_data+0x437/0x500 drivers/hid/hid-playstation.c:1919
    dualshock4_create drivers/hid/hid-playstation.c:2747 [inline]
    ps_probe drivers/hid/hid-playstation.c:2845 [inline]
    ps_probe+0x747/0x17d0 drivers/hid/hid-playstation.c:2821
    __hid_device_probe drivers/hid/hid-core.c:2775 [inline]
    hid_device_probe+0x298/0x3b0 drivers/hid/hid-core.c:2812
    call_driver_probe drivers/base/dd.c:581 [inline]
    really_probe+0x12f/0x430 drivers/base/dd.c:659
    __driver_probe_device+0xc3/0x1a0 drivers/base/dd.c:801
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:831
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:959
    bus_for_each_drv+0xcf/0x120 drivers/base/bus.c:462
    __device_attach+0xf9/0x290 drivers/base/dd.c:1031
    bus_probe_device+0xcd/0xe0 drivers/base/bus.c:537
    device_add+0x983/0xc80 drivers/base/core.c:3689
    hid_add_device+0x140/0x250 drivers/hid/hid-core.c:2951
    usbhid_probe+0x5ed/0x950 drivers/hid/usbhid/hid-core.c:1435
    usb_probe_interface+0x173/0x3f0 drivers/usb/core/driver.c:396
    call_driver_probe drivers/base/dd.c:581 [inline]
    really_probe+0x12f/0x430 drivers/base/dd.c:659

BUG: memory leak
unreferenced object 0xffff8881192e7740 (size 64):
  comm "kworker/1:0", pid 23, jiffies 4294944884
  hex dump (first 32 bytes):
    02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc c51b5d6b):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    __kmalloc_cache_noprof+0x3a6/0x5b0 mm/slub.c:5766
    kmalloc_noprof include/linux/slab.h:957 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    dualshock4_get_calibration_data+0x437/0x500 drivers/hid/hid-playstation.c:1919
    dualshock4_create drivers/hid/hid-playstation.c:2747 [inline]
    ps_probe drivers/hid/hid-playstation.c:2845 [inline]
    ps_probe+0x747/0x17d0 drivers/hid/hid-playstation.c:2821
    __hid_device_probe drivers/hid/hid-core.c:2775 [inline]
    hid_device_probe+0x298/0x3b0 drivers/hid/hid-core.c:2812
    call_driver_probe drivers/base/dd.c:581 [inline]
    really_probe+0x12f/0x430 drivers/base/dd.c:659
    __driver_probe_device+0xc3/0x1a0 drivers/base/dd.c:801
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:831
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:959
    bus_for_each_drv+0xcf/0x120 drivers/base/bus.c:462
    __device_attach+0xf9/0x290 drivers/base/dd.c:1031
    bus_probe_device+0xcd/0xe0 drivers/base/bus.c:537
    device_add+0x983/0xc80 drivers/base/core.c:3689
    hid_add_device+0x140/0x250 drivers/hid/hid-core.c:2951
    usbhid_probe+0x5ed/0x950 drivers/hid/usbhid/hid-core.c:1435
    usb_probe_interface+0x173/0x3f0 drivers/usb/core/driver.c:396
    call_driver_probe drivers/base/dd.c:581 [inline]
    really_probe+0x12f/0x430 drivers/base/dd.c:659

BUG: memory leak
unreferenced object 0xffff88812484e5c0 (size 64):
  comm "kworker/0:0", pid 9, jiffies 4294945059
  hex dump (first 32 bytes):
    02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace (crc c51b5d6b):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4983 [inline]
    slab_alloc_node mm/slub.c:5288 [inline]
    __kmalloc_cache_noprof+0x3a6/0x5b0 mm/slub.c:5766
    kmalloc_noprof include/linux/slab.h:957 [inline]
    kzalloc_noprof include/linux/slab.h:1094 [inline]
    dualshock4_get_calibration_data+0x437/0x500 drivers/hid/hid-playstation.c:1919
    dualshock4_create drivers/hid/hid-playstation.c:2747 [inline]
    ps_probe drivers/hid/hid-playstation.c:2845 [inline]
    ps_probe+0x747/0x17d0 drivers/hid/hid-playstation.c:2821
    __hid_device_probe drivers/hid/hid-core.c:2775 [inline]
    hid_device_probe+0x298/0x3b0 drivers/hid/hid-core.c:2812
    call_driver_probe drivers/base/dd.c:581 [inline]
    really_probe+0x12f/0x430 drivers/base/dd.c:659
    __driver_probe_device+0xc3/0x1a0 drivers/base/dd.c:801
    driver_probe_device+0x2a/0x120 drivers/base/dd.c:831
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:959
    bus_for_each_drv+0xcf/0x120 drivers/base/bus.c:462
    __device_attach+0xf9/0x290 drivers/base/dd.c:1031
    bus_probe_device+0xcd/0xe0 drivers/base/bus.c:537
    device_add+0x983/0xc80 drivers/base/core.c:3689
    hid_add_device+0x140/0x250 drivers/hid/hid-core.c:2951
    usbhid_probe+0x5ed/0x950 drivers/hid/usbhid/hid-core.c:1435
    usb_probe_interface+0x173/0x3f0 drivers/usb/core/driver.c:396
    call_driver_probe drivers/base/dd.c:581 [inline]
    really_probe+0x12f/0x430 drivers/base/dd.c:659

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

