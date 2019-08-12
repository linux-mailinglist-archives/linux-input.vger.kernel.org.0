Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 820E889DB1
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 14:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbfHLMIP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 08:08:15 -0400
Received: from mail-ot1-f72.google.com ([209.85.210.72]:40388 "EHLO
        mail-ot1-f72.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728585AbfHLMII (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 08:08:08 -0400
Received: by mail-ot1-f72.google.com with SMTP id o21so16064255otj.7
        for <linux-input@vger.kernel.org>; Mon, 12 Aug 2019 05:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Ywj85VvT42ExBz1omSPQeO7VLLMCmBGtLJt3+nZQbNo=;
        b=RTDIBSZRc0FMQWhGhDAixDXj/G1ptNdFdgjU9ZQWgL7g9XoDn0xVbr4Tq6xUVmr/Tx
         e8KcgcTeGQZAgyeeS7SUOE7DiBIUX+p82eg17FJuMedI+m7RhK6pEo/HpG/HqVj7W0FY
         2+He7dGiih4YNc6BjkMyJcRAHJkIbCnns7MdNHFI06sMnNdDRwx1IdpAUqfi9GLFk8Li
         HEA+KiSiu90v5JwxHo3wKghD3mMq2CQfEXsNYHJZc+2Kk3EAdDW0HwphOPOJ7oIdYoMG
         ILDhLTMkdua/4SSY7L8As11lflKs+DwDiBKQufIN+JN7K8uA511PPjTC16lMrQurNAub
         C5gw==
X-Gm-Message-State: APjAAAWsDjOCW2qoTG0bmIfdPu0cXAqnRRkutKxIdkyNRLLq0Ch+EbJ2
        7HazqTFiX+XxqjW5fyj46O5eCZI86r42TAek0DM4nqfdFRUS
X-Google-Smtp-Source: APXvYqw57Z0WD+ihkt6puj9Q98EY0wy6sFf1kTwmhhtxdW9KPPfqxuVsgwRXQa90DCSpwlbWwlKgaveug83sQqr4/eEstXeWMz/M
MIME-Version: 1.0
X-Received: by 2002:a6b:7909:: with SMTP id i9mr33373116iop.8.1565611687290;
 Mon, 12 Aug 2019 05:08:07 -0700 (PDT)
Date:   Mon, 12 Aug 2019 05:08:07 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000007a3d3b058fea6016@google.com>
Subject: KMSAN: uninit-value in gtco_probe
From:   syzbot <syzbot+bb54195a43a54b1e5e5e@syzkaller.appspotmail.com>
To:     dmitry.torokhov@gmail.com, glider@google.com,
        granthernandez@google.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    61ccdad1 Revert "drm/bochs: Use shadow buffer for bochs fr..
git tree:       kmsan
console output: https://syzkaller.appspot.com/x/log.txt?x=15e29b26600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=27abc558ecb16a3b
dashboard link: https://syzkaller.appspot.com/bug?extid=bb54195a43a54b1e5e5e
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+bb54195a43a54b1e5e5e@syzkaller.appspotmail.com

usb 6-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 6-1: config 0 descriptor??
gtco 6-1:0.219: Collection level already at zero
==================================================================
BUG: KMSAN: uninit-value in parse_hid_report_descriptor  
drivers/input/tablet/gtco.c:297 [inline]
BUG: KMSAN: uninit-value in gtco_probe+0x18c7/0x3520  
drivers/input/tablet/gtco.c:938
CPU: 1 PID: 12046 Comm: kworker/1:0 Not tainted 5.3.0-rc3+ #17
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Workqueue: usb_hub_wq hub_event
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x191/0x1f0 lib/dump_stack.c:113
  kmsan_report+0x162/0x2d0 mm/kmsan/kmsan_report.c:109
  __msan_warning+0x75/0xe0 mm/kmsan/kmsan_instr.c:294
  parse_hid_report_descriptor drivers/input/tablet/gtco.c:297 [inline]
  gtco_probe+0x18c7/0x3520 drivers/input/tablet/gtco.c:938
  usb_probe_interface+0xd19/0x1310 drivers/usb/core/driver.c:361
  really_probe+0x1373/0x1dc0 drivers/base/dd.c:552
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:709
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:816
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
  __device_attach+0x489/0x750 drivers/base/dd.c:882
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:929
  bus_probe_device+0x131/0x390 drivers/base/bus.c:514
  device_add+0x25b5/0x2df0 drivers/base/core.c:2114
  usb_set_configuration+0x309f/0x3710 drivers/usb/core/message.c:2027
  generic_probe+0xe7/0x280 drivers/usb/core/generic.c:210
  usb_probe_device+0x146/0x200 drivers/usb/core/driver.c:266
  really_probe+0x1373/0x1dc0 drivers/base/dd.c:552
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:709
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:816
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
  __device_attach+0x489/0x750 drivers/base/dd.c:882
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:929
  bus_probe_device+0x131/0x390 drivers/base/bus.c:514
  device_add+0x25b5/0x2df0 drivers/base/core.c:2114
  usb_new_device+0x23e5/0x2fb0 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x581d/0x72f0 drivers/usb/core/hub.c:5441
  process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
  worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
  kthread+0x4b5/0x4f0 kernel/kthread.c:256
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355

Uninit was stored to memory at:
  kmsan_save_stack_with_flags mm/kmsan/kmsan.c:187 [inline]
  kmsan_internal_chain_origin+0xcc/0x150 mm/kmsan/kmsan.c:345
  __msan_chain_origin+0x6b/0xe0 mm/kmsan/kmsan_instr.c:190
  parse_hid_report_descriptor drivers/input/tablet/gtco.c:298 [inline]
  gtco_probe+0x1a7c/0x3520 drivers/input/tablet/gtco.c:938
  usb_probe_interface+0xd19/0x1310 drivers/usb/core/driver.c:361
  really_probe+0x1373/0x1dc0 drivers/base/dd.c:552
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:709
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:816
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
  __device_attach+0x489/0x750 drivers/base/dd.c:882
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:929
  bus_probe_device+0x131/0x390 drivers/base/bus.c:514
  device_add+0x25b5/0x2df0 drivers/base/core.c:2114
  usb_set_configuration+0x309f/0x3710 drivers/usb/core/message.c:2027
  generic_probe+0xe7/0x280 drivers/usb/core/generic.c:210
  usb_probe_device+0x146/0x200 drivers/usb/core/driver.c:266
  really_probe+0x1373/0x1dc0 drivers/base/dd.c:552
  driver_probe_device+0x1ba/0x510 drivers/base/dd.c:709
  __device_attach_driver+0x5b8/0x790 drivers/base/dd.c:816
  bus_for_each_drv+0x28e/0x3b0 drivers/base/bus.c:454
  __device_attach+0x489/0x750 drivers/base/dd.c:882
  device_initial_probe+0x4a/0x60 drivers/base/dd.c:929
  bus_probe_device+0x131/0x390 drivers/base/bus.c:514
  device_add+0x25b5/0x2df0 drivers/base/core.c:2114
  usb_new_device+0x23e5/0x2fb0 drivers/usb/core/hub.c:2536
  hub_port_connect drivers/usb/core/hub.c:5098 [inline]
  hub_port_connect_change drivers/usb/core/hub.c:5213 [inline]
  port_event drivers/usb/core/hub.c:5359 [inline]
  hub_event+0x581d/0x72f0 drivers/usb/core/hub.c:5441
  process_one_work+0x1572/0x1ef0 kernel/workqueue.c:2269
  worker_thread+0x111b/0x2460 kernel/workqueue.c:2415
  kthread+0x4b5/0x4f0 kernel/kthread.c:256
  ret_from_fork+0x35/0x40 arch/x86/entry/entry_64.S:355

Local variable description: ----globalval.i@gtco_probe
Variable was created at:
  parse_hid_report_descriptor drivers/input/tablet/gtco.c:221 [inline]
  gtco_probe+0xcd6/0x3520 drivers/input/tablet/gtco.c:938
  usb_probe_interface+0xd19/0x1310 drivers/usb/core/driver.c:361
==================================================================


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
