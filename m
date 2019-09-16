Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD9EEB3B4E
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 15:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733106AbfIPN3L (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 09:29:11 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:52900 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733222AbfIPN3L (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 09:29:11 -0400
Received: by mail-io1-f71.google.com with SMTP id g8so5840741iop.19
        for <linux-input@vger.kernel.org>; Mon, 16 Sep 2019 06:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=SxErCaoipc4qR6AbkxYQ34p7V9bqMpiyVCAvn4RQDdM=;
        b=QsYIn4j90MGXNo9eg7Zb3eJAUPA1xuJnS14fOGrfPF7Q41wKxPYVAy/Dm2GMJjrICn
         EnnATSlbPsNEdHy7UWPrLrfHOR8OrpVdtsCDrkyhHi6TYWOazYjfFy9tvqBPzg0T3p7Y
         HsI6RgDQKpE1gpLLM6MRM+p3B8c675lMvaHT22sa7SwCNTA3UV41pUCAapeh2dGa0OP+
         FjR7QVAmi8cyIDSuRifSOUj2emyCb21bcc8QlUW041/FgvLjDW9VMqCCpjs3XamxIUP3
         WnGa2/IT2PYqw382aT9bM6tQZl2yLVHVpjgYMqiimubN6mYpZpRucoT02w2uLsWVhPO6
         PnNg==
X-Gm-Message-State: APjAAAWR2Bli6/lJQEDXX7BnvIStXGRSdB2idTMHgeHlkbr6NRxnxrLB
        cedsUHx/kp90FJFapJ5FbY4ofn5BfFThKn9XoAKNdBIX5Sy6
X-Google-Smtp-Source: APXvYqx3+vh42Me/WY1PJ2O+8uJiq98zlHZ/LV6DA92+uX4JvNLPIbb6ya5UT+EU4TQxC85tYQMpfTWXTKIeE+a2FOLUl52IGiQV
MIME-Version: 1.0
X-Received: by 2002:a02:5585:: with SMTP id e127mr51965020jab.25.1568640550636;
 Mon, 16 Sep 2019 06:29:10 -0700 (PDT)
Date:   Mon, 16 Sep 2019 06:29:10 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000cd1def0592ab9697@google.com>
Subject: KASAN: slab-out-of-bounds Write in ga_probe
From:   syzbot <syzbot+403741a091bf41d4ae79@syzkaller.appspotmail.com>
To:     andreyknvl@google.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    f0df5c1b usb-fuzzer: main usb gadget fuzzer driver
git tree:       https://github.com/google/kasan.git usb-fuzzer
console output: https://syzkaller.appspot.com/x/log.txt?x=14045831600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c6633fa4ed00be5
dashboard link: https://syzkaller.appspot.com/bug?extid=403741a091bf41d4ae79
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c1e62d600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=166a3a95600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+403741a091bf41d4ae79@syzkaller.appspotmail.com

usb 1-1: config 0 interface 0 altsetting 0 has 1 endpoint descriptor,  
different from the interface descriptor's value: 9
usb 1-1: New USB device found, idVendor=0e8f, idProduct=0012, bcdDevice=  
0.00
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
greenasia 0003:0E8F:0012.0001: unknown main item tag 0x0
greenasia 0003:0E8F:0012.0001: hidraw0: USB HID v0.00 Device [HID  
0e8f:0012] on usb-dummy_hcd.0-1/input0
==================================================================
BUG: KASAN: slab-out-of-bounds in set_bit  
include/asm-generic/bitops-instrumented.h:28 [inline]
BUG: KASAN: slab-out-of-bounds in gaff_init drivers/hid/hid-gaff.c:97  
[inline]
BUG: KASAN: slab-out-of-bounds in ga_probe+0x1fd/0x6f0  
drivers/hid/hid-gaff.c:146
Write of size 8 at addr ffff8881d9acafc0 by task kworker/1:1/78

CPU: 1 PID: 78 Comm: kworker/1:1 Not tainted 5.3.0-rc7+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0xca/0x13e lib/dump_stack.c:113
  print_address_description+0x6a/0x32c mm/kasan/report.c:351
  __kasan_report.cold+0x1a/0x33 mm/kasan/report.c:482
  kasan_report+0xe/0x12 mm/kasan/common.c:618
  check_memory_region_inline mm/kasan/generic.c:185 [inline]
  check_memory_region+0x128/0x190 mm/kasan/generic.c:192
  set_bit include/asm-generic/bitops-instrumented.h:28 [inline]
  gaff_init drivers/hid/hid-gaff.c:97 [inline]
  ga_probe+0x1fd/0x6f0 drivers/hid/hid-gaff.c:146
  hid_device_probe+0x2be/0x3f0 drivers/hid/hid-core.c:2209
  really_probe+0x281/0x6d0 drivers/base/dd.c:548
  driver_probe_device+0x101/0x1b0 drivers/base/dd.c:721
  __device_attach_driver+0x


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
