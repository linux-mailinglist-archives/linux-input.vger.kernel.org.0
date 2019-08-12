Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC11F8A591
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 20:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfHLSVH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 14:21:07 -0400
Received: from mail-ot1-f71.google.com ([209.85.210.71]:37044 "EHLO
        mail-ot1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbfHLSVH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 14:21:07 -0400
Received: by mail-ot1-f71.google.com with SMTP id x5so85873842otb.4
        for <linux-input@vger.kernel.org>; Mon, 12 Aug 2019 11:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=sT2xLk+0Un+bRMWjiKMtddMew8Oxq3tg/Abd8beDHHI=;
        b=SKCPjgJmxi3XLQbXsr6F6l0nujT7ux0+5VMrJfewX0oa8fmD5YFKoDvAnsUjgi/oHM
         1Ibe24gPnE+kiHk0yQeDq4QSmC1VJQMyMENWX6aH7KLgsKoAZkHpw1guIrO7U2SW1WMq
         u7bFODMqEA0bp3PVfHTEmUPk87FihA/KlDqo27uxsBAj6k4UVMiaMRzss3fXCGceHYmu
         UyO31zRvoToYR1frGplbOwTG+AKqgnvXBAln03t128nDQ/s8vmuD9r3SBd/U3lY76tR2
         +Tc8CXHZFVHBIl5lY6tifkdCKCv7kKMUTKXj0quBPGHUaKfrfrH0NSDhn617KWxKZPQk
         vT6g==
X-Gm-Message-State: APjAAAUeH38FYSKz+oMRAuDuPpnK/OIB2FSKwEiQmJiZIEn40VnY1KII
        2OapXXPjmY2eh0+RWao/88xDcP0Y2pTFRuPj3c+C8XZgrwFl
X-Google-Smtp-Source: APXvYqw8ggwmlHFXB0d4+J8cXKtIDVQgnB5+93oBKsifZkuJ5qdqbT9lNG1WDXaurKPN8qM9p4KdTzmJVnQkzjQEDa4WmpynDhc/
MIME-Version: 1.0
X-Received: by 2002:a5e:9701:: with SMTP id w1mr36295739ioj.294.1565634065769;
 Mon, 12 Aug 2019 11:21:05 -0700 (PDT)
Date:   Mon, 12 Aug 2019 11:21:05 -0700
In-Reply-To: <0000000000007a3d3b058fea6016@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000056b055058fef9679@google.com>
Subject: Re: KMSAN: uninit-value in gtco_probe
From:   syzbot <syzbot+bb54195a43a54b1e5e5e@syzkaller.appspotmail.com>
To:     dmitry.torokhov@gmail.com, glider@google.com,
        granthernandez@google.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    61ccdad1 Revert "drm/bochs: Use shadow buffer for bochs fr..
git tree:       kmsan
console output: https://syzkaller.appspot.com/x/log.txt?x=106e8536600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=27abc558ecb16a3b
dashboard link: https://syzkaller.appspot.com/bug?extid=bb54195a43a54b1e5e5e
compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
80fee25776c2fb61e74c1ecb1a523375c2500b69)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1766194a600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13d5879a600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+bb54195a43a54b1e5e5e@syzkaller.appspotmail.com

usb 1-1: config 0 has no interface number 0
usb 1-1: New USB device found, idVendor=078c, idProduct=1002,  
bcdDevice=e6.47
usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
usb 1-1: config 0 descriptor??
gtco 1-1:0.219: Collection level already at zero
==================================================================
BUG: KMSAN: uninit-value in parse_hid_report_descriptor  
drivers/input/tablet/gtco.c:297 [inline]
BUG: KMSAN: uninit-value in gtco_probe+0x18c7/0x3520  
drivers/input/tablet/gtco.c:938
CPU: 1 PID: 621 Comm: kworker/1:1 Not tainted 5.3.0-rc3+ #17
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

