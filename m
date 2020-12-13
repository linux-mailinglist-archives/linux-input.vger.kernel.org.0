Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4C262D9137
	for <lists+linux-input@lfdr.de>; Mon, 14 Dec 2020 00:44:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403793AbgLMXnv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 13 Dec 2020 18:43:51 -0500
Received: from mail-io1-f69.google.com ([209.85.166.69]:49424 "EHLO
        mail-io1-f69.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbgLMXnv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 13 Dec 2020 18:43:51 -0500
Received: by mail-io1-f69.google.com with SMTP id m19so9867243iow.16
        for <linux-input@vger.kernel.org>; Sun, 13 Dec 2020 15:43:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=s2gFcE0JO5IbAYsTllPGaj7DKv5TX9Tw8jj2GUsTpwE=;
        b=RXkP5VPUdTyjxpnERZTHWIcG621vgbIFNNIiInZHhl7IS8Pzp8xzlvY/bE5+JlcPFE
         Lw2ct3qIc/uqC+v4RRCjSD7VpxEJi2rP4Rz2MiFqrg4ndEugIaj1NkK7vaa39h8G63pz
         oeMeNT+oYN6PP1kyE9yjdyryYVhgb48/T5++44b+pKmr9xaVxcOJQb3dUnjuGp6EXkuz
         LJPyArE4bmv5fBlWxA1sKMvHVO7hIgT20/boM73BHcp9+8hhVUIEvSpYfSe7aW3nSE9q
         Y+lRsh9ACeZFxsr04YPMg0lKmkWZ8e7e+XJI8LlfzcA45y8c6I9FPVIe/8BqsbHjEMji
         X34A==
X-Gm-Message-State: AOAM530tdHiIDvZwvarIGTwls827wA6byLXMyjVRnksH8GG85vUmCiNz
        eEwRFm8Jb6FwkL0ozzJ7o+ko+mgOBxOW5nt681t86tDBXeO8
X-Google-Smtp-Source: ABdhPJyU/XPgbndriEj8RBAS1kFXcE2RkPXHa+AfM6tq8YwmQFDZWQD0UNj02M0FSdWiW5Xbn27zsz0JQbr/w2DlRdSIEzHaKGei
MIME-Version: 1.0
X-Received: by 2002:a92:2801:: with SMTP id l1mr31110100ilf.124.1607902990708;
 Sun, 13 Dec 2020 15:43:10 -0800 (PST)
Date:   Sun, 13 Dec 2020 15:43:10 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000098361105b6611620@google.com>
Subject: UBSAN: shift-out-of-bounds in snto32
From:   syzbot <syzbot+1e911ad71dd4ea72e04a@syzkaller.appspotmail.com>
To:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    a9e26cb5 Add linux-next specific files for 20201208
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1198c937500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e259434a8eaf0206
dashboard link: https://syzkaller.appspot.com/bug?extid=1e911ad71dd4ea72e04a
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13ba5f07500000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=122a9613500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1e911ad71dd4ea72e04a@syzkaller.appspotmail.com

================================================================================
UBSAN: shift-out-of-bounds in drivers/hid/hid-core.c:1315:20
shift exponent 4294967295 is too large for 32-bit type 'int'
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.10.0-rc7-next-20201208-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <IRQ>
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:120
 ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
 __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x181 lib/ubsan.c:395
 snto32.cold+0x37/0x3c drivers/hid/hid-core.c:1315
 hid_input_field drivers/hid/hid-core.c:1548 [inline]
 hid_report_raw_event+0x7a9/0x11b0 drivers/hid/hid-core.c:1783
 hid_input_report+0x360/0x4c0 drivers/hid/hid-core.c:1850
 hid_irq_in+0x50e/0x690 drivers/hid/usbhid/hid-core.c:284
 __usb_hcd_giveback_urb+0x2b0/0x5c0 drivers/usb/core/hcd.c:1657
 usb_hcd_giveback_urb+0x38c/0x430 drivers/usb/core/hcd.c:1728
 dummy_timer+0x11f4/0x32a0 drivers/usb/gadget/udc/dummy_hcd.c:1971
 call_timer_fn+0x1a5/0x710 kernel/time/timer.c:1417
 expire_timers kernel/time/timer.c:1462 [inline]
 __run_timers.part.0+0x692/0xa80 kernel/time/timer.c:1731


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches
