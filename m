Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D234A81F30
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 16:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729547AbfHEOer (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 10:34:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:43452 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728863AbfHEOeq (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 5 Aug 2019 10:34:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 9CE5BABBE;
        Mon,  5 Aug 2019 14:34:45 +0000 (UTC)
Message-ID: <1565014816.3375.1.camel@suse.com>
Subject: Re: KASAN: slab-out-of-bounds Write in lg4ff_init
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+94e2b9e9c7d1dd332345@syzkaller.appspotmail.com>,
        andreyknvl@google.com, syzkaller-bugs@googlegroups.com,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, linux-usb@vger.kernel.org
Date:   Mon, 05 Aug 2019 16:20:16 +0200
In-Reply-To: <000000000000e5742c058f5dfaef@google.com>
References: <000000000000e5742c058f5dfaef@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am Montag, den 05.08.2019, 05:38 -0700 schrieb syzbot:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=144c21dc600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> dashboard link: https://syzkaller.appspot.com/bug?extid=94e2b9e9c7d1dd332345
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=169e8542600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10ec8262600000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+94e2b9e9c7d1dd332345@syzkaller.appspotmail.com
> 
> usb 1-1: config 0 interface 0 altsetting 0 has 1 endpoint descriptor,  
> different from the interface descriptor's value: 9
> usb 1-1: New USB device found, idVendor=046d, idProduct=c298, bcdDevice=  
> 0.00
> usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> usb 1-1: config 0 descriptor??
> logitech 0003:046D:C298.0001: unknown main item tag 0x0
> logitech 0003:046D:C298.0001: unknown main item tag 0x0
> logitech 0003:046D:C298.0001: hidraw0: USB HID v0.00 Device [HID 046d:c298]  
> on usb-dummy_hcd.0-1/input0
> BUG: KASAN: slab-out-of-bounds in set_bit  
> include/asm-generic/bitops-instrumented.h:28 [inline]

#syz test: https://github.com/google/kasan.git e96407b4

From 7e7f8ce9108b69613f8bb4ff2f95c258e22c3228 Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Mon, 5 Aug 2019 16:14:47 +0200
Subject: [PATCH] hid-lg4ff: sanity check for offsets of FF effects

Malicious devices could provide huge offsets which would lead
to setting bits in random kernel memory. Adding a sanity check.

Reported-by: syzbot+94e2b9e9c7d1dd332345@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/hid/hid-lg4ff.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
index cefba038520c..f9572750d889 100644
--- a/drivers/hid/hid-lg4ff.c
+++ b/drivers/hid/hid-lg4ff.c
@@ -1327,8 +1327,12 @@ int lg4ff_init(struct hid_device *hid)
 	}
 
 	/* Set supported force feedback capabilities */
+	error = -ENODEV;
 	for (j = 0; lg4ff_devices[i].ff_effects[j] >= 0; j++)
-		set_bit(lg4ff_devices[i].ff_effects[j], dev->ffbit);
+		if (lg4ff_devices[i].ff_effects[j] <= 15)
+			set_bit(lg4ff_devices[i].ff_effects[j], dev->ffbit);
+		else
+			goto err_init;
 
 	error = input_ff_create_memless(dev, NULL, lg4ff_play);
 
-- 
2.16.4

