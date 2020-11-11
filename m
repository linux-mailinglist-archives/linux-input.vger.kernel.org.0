Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDD022AF29C
	for <lists+linux-input@lfdr.de>; Wed, 11 Nov 2020 14:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbgKKNzb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Nov 2020 08:55:31 -0500
Received: from mail-il1-f199.google.com ([209.85.166.199]:34599 "EHLO
        mail-il1-f199.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727192AbgKKNz3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Nov 2020 08:55:29 -0500
Received: by mail-il1-f199.google.com with SMTP id e14so1387100ilr.1
        for <linux-input@vger.kernel.org>; Wed, 11 Nov 2020 05:55:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=eBJECi1MCWmcND7XU6JD96ghwkq64uxBYy2L3wSV0kY=;
        b=lMuI2ZJYYxwsAYQ+pQkfkOrOFHOOw2iT1AkO8D3S9q3PkJfcygmukaRsYcpV0z2NMB
         EundpS3LO72hxP7vnYbK6UpsI9UAcSU7veXytNb6SzarIeLfV043ZDA5kE8MKqF2gKNM
         N8xjW8jmiJY3oLLKcW9T3tAMuc6GacdonPkj5bE/axXN9y9WzLbYXejcO4ZqEbpsL+Iw
         8tongIuPN6iuxhI5Vcb097FE3I9aXYCbZ2f8OfIfAIVzGmERTURgOcRn4cZcrTZLQnzp
         WHTmA4yDJBXr6UedAFWY0ff4w18Dda+ilr2Dq9HGg3e7/ZUxKksyozY4LREMMAY879yW
         kLLQ==
X-Gm-Message-State: AOAM53241ADNx4eACC/OzGICWp/kLB3n8UnplvWQ58x31wcH4tt/UYEp
        0WreY/YrlnNtqkf4icKRnddk0cuKZEJN4XRQdjRRex1uChe9
X-Google-Smtp-Source: ABdhPJyqsVD/08P7KbjopKFgcEXU3rJ49JEnT/YpZLyQBbsuoA9cpDRkJxew2c6gp9ZEl+04aZ2IP0wHC6Pa5XJA9g5YPzelGxcR
MIME-Version: 1.0
X-Received: by 2002:a92:4442:: with SMTP id a2mr18160839ilm.220.1605102926926;
 Wed, 11 Nov 2020 05:55:26 -0800 (PST)
Date:   Wed, 11 Nov 2020 05:55:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c99ca505b3d525fb@google.com>
Subject: memory leak in __usbhid_submit_report
From:   syzbot <syzbot+47b26cd837ececfc666d@syzkaller.appspotmail.com>
To:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    f8394f23 Linux 5.10-rc3
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12ebbdc6500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a3f13716fa0212fd
dashboard link: https://syzkaller.appspot.com/bug?extid=47b26cd837ececfc666d
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14497b82500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1586ff14500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+47b26cd837ececfc666d@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff8881097e5ec0 (size 32):
  comm "kworker/0:1", pid 7, jiffies 4294949214 (age 33.520s)
  hex dump (first 32 bytes):
    04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<000000008296eaa1>] __usbhid_submit_report+0x116/0x490 drivers/hid/usbhid/hid-core.c:588
    [<00000000fe39f007>] usbhid_submit_report drivers/hid/usbhid/hid-core.c:638 [inline]
    [<00000000fe39f007>] usbhid_request+0x59/0xa0 drivers/hid/usbhid/hid-core.c:1272
    [<00000000428a854b>] hidinput_led_worker+0x59/0x160 drivers/hid/hid-input.c:1507
    [<000000001bb8d86d>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<000000005d9a2f9c>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<00000000dc999b29>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<0000000099d5a9ee>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

BUG: memory leak
unreferenced object 0xffff8881120200c0 (size 32):
  comm "kworker/0:1", pid 7, jiffies 4294949214 (age 33.520s)
  hex dump (first 32 bytes):
    04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<000000008296eaa1>] __usbhid_submit_report+0x116/0x490 drivers/hid/usbhid/hid-core.c:588
    [<00000000fe39f007>] usbhid_submit_report drivers/hid/usbhid/hid-core.c:638 [inline]
    [<00000000fe39f007>] usbhid_request+0x59/0xa0 drivers/hid/usbhid/hid-core.c:1272
    [<00000000428a854b>] hidinput_led_worker+0x59/0x160 drivers/hid/hid-input.c:1507
    [<000000001bb8d86d>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<000000005d9a2f9c>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<00000000dc999b29>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<0000000099d5a9ee>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

BUG: memory leak
unreferenced object 0xffff888107fa9420 (size 32):
  comm "kworker/0:1", pid 7, jiffies 4294949214 (age 33.520s)
  hex dump (first 32 bytes):
    04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<000000008296eaa1>] __usbhid_submit_report+0x116/0x490 drivers/hid/usbhid/hid-core.c:588
    [<00000000fe39f007>] usbhid_submit_report drivers/hid/usbhid/hid-core.c:638 [inline]
    [<00000000fe39f007>] usbhid_request+0x59/0xa0 drivers/hid/usbhid/hid-core.c:1272
    [<00000000428a854b>] hidinput_led_worker+0x59/0x160 drivers/hid/hid-input.c:1507
    [<000000001bb8d86d>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<000000005d9a2f9c>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<00000000dc999b29>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<0000000099d5a9ee>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

BUG: memory leak
unreferenced object 0xffff888112020b60 (size 32):
  comm "kworker/1:4", pid 8569, jiffies 4294949237 (age 33.290s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<000000008296eaa1>] __usbhid_submit_report+0x116/0x490 drivers/hid/usbhid/hid-core.c:588
    [<00000000fe39f007>] usbhid_submit_report drivers/hid/usbhid/hid-core.c:638 [inline]
    [<00000000fe39f007>] usbhid_request+0x59/0xa0 drivers/hid/usbhid/hid-core.c:1272
    [<00000000428a854b>] hidinput_led_worker+0x59/0x160 drivers/hid/hid-input.c:1507
    [<000000001bb8d86d>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<000000005d9a2f9c>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<00000000dc999b29>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<0000000099d5a9ee>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

BUG: memory leak
unreferenced object 0xffff888107fa9a20 (size 32):
  comm "kworker/1:3", pid 8559, jiffies 4294949241 (age 33.250s)
  hex dump (first 32 bytes):
    04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<000000008296eaa1>] __usbhid_submit_report+0x116/0x490 drivers/hid/usbhid/hid-core.c:588
    [<00000000fe39f007>] usbhid_submit_report drivers/hid/usbhid/hid-core.c:638 [inline]
    [<00000000fe39f007>] usbhid_request+0x59/0xa0 drivers/hid/usbhid/hid-core.c:1272
    [<00000000428a854b>] hidinput_led_worker+0x59/0x160 drivers/hid/hid-input.c:1507
    [<000000001bb8d86d>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<000000005d9a2f9c>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<00000000dc999b29>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<0000000099d5a9ee>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

BUG: memory leak
unreferenced object 0xffff888112020940 (size 32):
  comm "kworker/1:3", pid 8559, jiffies 4294949241 (age 33.250s)
  hex dump (first 32 bytes):
    04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<000000008296eaa1>] __usbhid_submit_report+0x116/0x490 drivers/hid/usbhid/hid-core.c:588
    [<00000000fe39f007>] usbhid_submit_report drivers/hid/usbhid/hid-core.c:638 [inline]
    [<00000000fe39f007>] usbhid_request+0x59/0xa0 drivers/hid/usbhid/hid-core.c:1272
    [<00000000428a854b>] hidinput_led_worker+0x59/0x160 drivers/hid/hid-input.c:1507
    [<000000001bb8d86d>] process_one_work+0x27d/0x590 kernel/workqueue.c:2272
    [<000000005d9a2f9c>] worker_thread+0x59/0x5d0 kernel/workqueue.c:2418
    [<00000000dc999b29>] kthread+0x178/0x1b0 kernel/kthread.c:292
    [<0000000099d5a9ee>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296

executing program
executing program
executing program
executing program
executing program
executing program
executing program


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
