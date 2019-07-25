Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8052374E59
	for <lists+linux-input@lfdr.de>; Thu, 25 Jul 2019 14:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388596AbfGYMnP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jul 2019 08:43:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:46026 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388335AbfGYMnP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jul 2019 08:43:15 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id DD53AAE8C;
        Thu, 25 Jul 2019 12:43:13 +0000 (UTC)
Message-ID: <1564058593.14544.3.camel@suse.com>
Subject: Re: general protection fault in holtek_kbd_input_event
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+965152643a75a56737be@syzkaller.appspotmail.com>,
        andreyknvl@google.com, syzkaller-bugs@googlegroups.com,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Date:   Thu, 25 Jul 2019 14:43:13 +0200
In-Reply-To: <00000000000040d299058e8047c2@google.com>
References: <00000000000040d299058e8047c2@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am Donnerstag, den 25.07.2019, 05:08 -0700 schrieb syzbot:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    6a3599ce usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=14e6d3d0600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
> dashboard link: https://syzkaller.appspot.com/bug?extid=965152643a75a56737be
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1663f8cc600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=145f2978600000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+965152643a75a56737be@syzkaller.appspotmail.com

#syz test: https://github.com/google/kasan.git usb-fuzzer-usb-testing-2019.07.11

From 93eb5c925a204804b82a7526a8b9252a102fd339 Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Thu, 25 Jul 2019 14:37:53 +0200
Subject: [PATCH] holtek: test for sanity of intfdata

The ioctl handler uses the intfdata of a second interface,
which may not be present in a broken or malicious device, hence
the intfdata needs to be checked for NULL.

Reported-by: syzbot+965152643a75a56737be@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/hid/hid-holtek-kbd.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-holtek-kbd.c b/drivers/hid/hid-holtek-kbd.c
index b3d502421b79..67ce75dfa9a4 100644
--- a/drivers/hid/hid-holtek-kbd.c
+++ b/drivers/hid/hid-holtek-kbd.c
@@ -123,9 +123,14 @@ static int holtek_kbd_input_event(struct input_dev *dev, unsigned int type,
 
 	/* Locate the boot interface, to receive the LED change events */
 	struct usb_interface *boot_interface = usb_ifnum_to_if(usb_dev, 0);
-
-	struct hid_device *boot_hid = usb_get_intfdata(boot_interface);
-	struct hid_input *boot_hid_input = list_first_entry(&boot_hid->inputs,
+	struct hid_device *boot_hid;
+	struct hid_input *boot_hid_input;
+
+	if (unlikely(boot_interface == NULL))
+		return -ENODEV;
+       
+	boot_hid = usb_get_intfdata(boot_interface);
+	boot_hid_input = list_first_entry(&boot_hid->inputs,
 		struct hid_input, list);
 
 	return boot_hid_input->input->event(boot_hid_input->input, type, code,
-- 
2.16.4

