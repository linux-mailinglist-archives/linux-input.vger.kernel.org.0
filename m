Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3039124331C
	for <lists+linux-input@lfdr.de>; Thu, 13 Aug 2020 06:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbgHMEMR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Aug 2020 00:12:17 -0400
Received: from mail-il1-f197.google.com ([209.85.166.197]:47704 "EHLO
        mail-il1-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbgHMEMR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Aug 2020 00:12:17 -0400
Received: by mail-il1-f197.google.com with SMTP id e12so3449435ile.14
        for <linux-input@vger.kernel.org>; Wed, 12 Aug 2020 21:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=fLaCGHGgT3wqRkpWLRL3dQ2c0G5xWbLrSnsnvPdBuKY=;
        b=aevrOmETsSjjGc1ILX6JlD0t04ckH6cXZAkT6vBMTTC/uNyd/3WLyZeXRF5Baandg8
         wJO+9TByffFoZvGkOfeJHRKmv+CKiGT4BJpVaMG1HelaCESpIKRRf9D2uIIGz4HcsJp6
         TrHbpQ/ZsRqi1JStyTZAxcS4wXoKjsD65W0BJuiEceWozbIZzeTphtCh4aScV94hjbD9
         dhmQ2tcBm7Zygc5BS0zpl1zwMYXAMEa1qje+HQbgDCDcWDHVZvq13Q/sY2hiiDFmtBM4
         7pjsPtgrbEXgBougw7lyeBP7TUrjOhUucUiIbFQVaQbBpDDN3jz31BYu54lpAR7AkoXP
         GzHQ==
X-Gm-Message-State: AOAM533t49MWe4taZ7rW3/F5kRE0sQ00jZbxX11gV9tzODg+9xSoLqX1
        snR7ksKHdvK5Q08ffZoC3lmohY2bNO/dhZC9jfI/c75ANfxW
X-Google-Smtp-Source: ABdhPJxrZ/akRosvNiyLsSh0xjc7hpy58bbdmFwt0MLxpTnT6JmfrK4nwTqpsl/wwi/bao4wDkugmY7vjJcoL/UofK6+g02jAtCe
MIME-Version: 1.0
X-Received: by 2002:a92:ba17:: with SMTP id o23mr2957896ili.198.1597291936463;
 Wed, 12 Aug 2020 21:12:16 -0700 (PDT)
Date:   Wed, 12 Aug 2020 21:12:16 -0700
In-Reply-To: <000000000000eb931405ac9d164f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000079c37a05acba82d0@google.com>
Subject: Re: KMSAN: uninit-value in joydev_connect
From:   syzbot <syzbot+6a1bb5a33a0b128085bc@syzkaller.appspotmail.com>
To:     dmitry.torokhov@gmail.com, glider@google.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot has found a reproducer for the following issue on:

HEAD commit:    ce8056d1 wip: changed copy_from_user where instrumented
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=127b9fba900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3afe005fb99591f
dashboard link: https://syzkaller.appspot.com/bug?extid=6a1bb5a33a0b128085bc
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1472674e900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15a1339a900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6a1bb5a33a0b128085bc@syzkaller.appspotmail.com

usb 1-1: config 0 interface 219 altsetting 0 endpoint 0xA has invalid wMaxPacketSize 0
usb 1-1: New USB device found, idVendor=078c, idProduct=1002, bcdDevice=e6.47
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
gtco 1-1:0.219: Collection level already at zero
input: GTCO_CalComp as /devices/platform/dummy_hcd.0/usb1/1-1/1-1:0.219/input/input5
=====================================================
BUG: KMSAN: uninit-value in joydev_connect+0x10c0/0x1920 drivers/input/joydev.c:958
CPU: 1 PID: 27 Comm: kworker/1:1 Not tainted 5.8.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:118
 kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:121
 __msan_warning+0x58/0xa0 mm/kmsan/kmsan_instr.c:215
 joydev_connect+0x10c0/0x1920 drivers/input/joydev.c:958
 input_attach_handler drivers/input/input.c:1031 [inline]
 input_register_device+0x1d7b/0x21c0 drivers/input/input.c:2229
 gtco_probe+0x32ce/0x39b0 drivers/input/tablet/gtco.c:990
 usb_probe_interface+0xece/0x1550 drivers/usb/core/driver.c:374
 really_probe+0xf20/0x20b0 drivers/base/dd.c:529
 driver_probe_device+0x293/0x390 drivers/base/dd.c:701
 __device_attach_driver+0x63f/0x830 drivers/base/dd.c:807
 bus_for_each_drv+0x2ca/0x3f0 drivers/base/bus.c:431
 __device_attach+0x4e2/0x7f0 drivers/base/dd.c:873
 devic

