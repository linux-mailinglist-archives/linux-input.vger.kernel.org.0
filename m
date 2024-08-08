Return-Path: <linux-input+bounces-5455-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C09294C3B6
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 19:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EF21B221D4
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 17:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DCF1922DA;
	Thu,  8 Aug 2024 17:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jlwgd9YV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA8B191F89;
	Thu,  8 Aug 2024 17:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723138070; cv=none; b=QlNyN2YRJuTZW6AV0MZUkkA1OQYC6t71SzDZcqq8+liQekB2cJqKeaRjCWvafPyS6IC6KCMRe1+nvO7wd6gGfRxxReIGbbjOzjv48FwKD8Yrk5JSt76KSi7/SY07nNUT7EJ3Hgo0uaorF1RP4z+5TRr15wXKQJuFp/LvfETJe80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723138070; c=relaxed/simple;
	bh=3ZsKmwzrlZfB2YYTxc4oG+oooZiVbr6oeemLdO/TzAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mh3VeW/mbvgrPe8hsrxpTTP9+6K0addr1GD0UEfypXlbMn7ut+U8aw2SvP55SwqMBrIacO/ZnbCzFlsYWqKy1aPWjEeNGCweETl34D4K+aKGLQb3YET+f0L0m9iiHPxUMu6i0rK7JVWG5LdmulAySIbGWoRkCo+NdR2W7zxw8As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jlwgd9YV; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-710afd56c99so973074b3a.0;
        Thu, 08 Aug 2024 10:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723138068; x=1723742868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdvbvAUR0z2Nufq0kmY32p/2v+6ROcGHOdtM6kL6rew=;
        b=Jlwgd9YVQ5vn05OleB3V5rRA1tOZt+VvzujZVbvMI7W07TYw6KwQOLLY4pGWMUfNch
         Qsfli/m78DZuH3eXGCLu496NRRWE1iGeF8YJ6PhyARRd3fCDr0EWXve+V3Hub0byHA+A
         oNSu5YlwhkU6XljO0+hYCx7i+Ol/Tsosyqwcya5s7teeUgEynlRmHFp8377u3HEvcHWq
         VFgCUt7sYCLHr8X1/1vy4xBdZ4hED4WzPRx7M5wlUhRWWtCSSzQRM4Qs6iR8TfAchmK7
         4FkYUlyubzxJHj5lucaqXbdIroHLHoePPqslIu7E5ghTVqBvq9kQSkT5NYAqfYb7/UU8
         VLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723138068; x=1723742868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vdvbvAUR0z2Nufq0kmY32p/2v+6ROcGHOdtM6kL6rew=;
        b=N5YvsAHSWsNFn46j3Ocj9wdGhPhW7YIQqhiybxlqO50lYJmKAoZr3SI/LnWNfIUeTB
         5ERuf6+yooU7trjLzbAP4HGfrbo3FSmE/qsBnBDqRSpXCPEpgK0KjIRfdllkVT9iD6q7
         QTutXfhr2un7D792GejWyn1CxL60tC6yNbxfKz94qVrB2h/5k2g8yflrQgogOMq1NdB/
         2E3PiDyyGg6qhjexs4PjLDDbgdbMiUWjcmFItlslvvGWlePGv32A3LHZ5/J6/gk5xctc
         cTvicEXMouZCMj5tEDsQ8xK///Yo9t4VF4F7ipksN5Hp9nJgmQJU6x8k5fIwuTnqzVYF
         6P4A==
X-Gm-Message-State: AOJu0Yw+Ki9utX7C61VGRj0WrTB4Is9nXUgmXPbvYPrJvErNnxGgxNeL
	Xr+CSB1vHbydc771RI+G6R/UrBkyQDzUc6OKdXHuYoHx2ZsMOebWAWwguQ==
X-Google-Smtp-Source: AGHT+IEKh9p5SSTF7S+TymiO0GmRZV06egORQLFN1Dv4EbCZYUe4lJ/7OUlzqlQka8ISkWpsUIuANw==
X-Received: by 2002:a05:6a00:3a06:b0:70e:aa44:39df with SMTP id d2e1a72fcca58-710cc6f7d3amr3706574b3a.1.1723138068286;
        Thu, 08 Aug 2024 10:27:48 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4403:e9e1:aefe:e6e8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2e89ffsm1349829b3a.180.2024.08.08.10.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 10:27:47 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Vojtech Pavlik <vojtech@ucw.cz>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: [RFC PATCH 4/5] Input: mk712 - remove driver
Date: Thu,  8 Aug 2024 10:27:30 -0700
Message-ID: <20240808172733.1194442-5-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
In-Reply-To: <20240808172733.1194442-1-dmitry.torokhov@gmail.com>
References: <20240808172733.1194442-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This touchscreen controller was used om Gateway AOL Connected Touchpad
released in 2000 and, according to Wikipedia, removed from the market
in October 2001 due to slow sales.

It looks like it can still be bought on eBay for $1000 but I really
doubt anyone will actually use it.

Remove the driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/Kconfig  |  12 --
 drivers/input/touchscreen/Makefile |   1 -
 drivers/input/touchscreen/mk712.c  | 215 -----------------------------
 3 files changed, 228 deletions(-)
 delete mode 100644 drivers/input/touchscreen/mk712.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 1ac26fc2e3eb..4685660faaf6 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -687,18 +687,6 @@ config TOUCHSCREEN_INEXIO
 	  To compile this driver as a module, choose M here: the
 	  module will be called inexio.
 
-config TOUCHSCREEN_MK712
-	tristate "ICS MicroClock MK712 touchscreen"
-	depends on ISA
-	help
-	  Say Y here if you have the ICS MicroClock MK712 touchscreen
-	  controller chip in your system.
-
-	  If unsure, say N.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called mk712.
-
 config TOUCHSCREEN_HP600
 	tristate "HP Jornada 6xx touchscreen"
 	depends on SH_HP6XX && SH_ADC
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 82bc837ca01e..23d19ba7dc6e 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -65,7 +65,6 @@ obj-$(CONFIG_TOUCHSCREEN_MIGOR)		+= migor_ts.o
 obj-$(CONFIG_TOUCHSCREEN_MMS114)	+= mms114.o
 obj-$(CONFIG_TOUCHSCREEN_MSG2638)	+= msg2638.o
 obj-$(CONFIG_TOUCHSCREEN_MTOUCH)	+= mtouch.o
-obj-$(CONFIG_TOUCHSCREEN_MK712)		+= mk712.o
 obj-$(CONFIG_TOUCHSCREEN_NOVATEK_NVT_TS)	+= novatek-nvt-ts.o
 obj-$(CONFIG_TOUCHSCREEN_HP600)		+= hp680_ts_input.o
 obj-$(CONFIG_TOUCHSCREEN_HP7XX)		+= jornada720_ts.o
diff --git a/drivers/input/touchscreen/mk712.c b/drivers/input/touchscreen/mk712.c
deleted file mode 100644
index 753d9cc1de1f..000000000000
--- a/drivers/input/touchscreen/mk712.c
+++ /dev/null
@@ -1,215 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * ICS MK712 touchscreen controller driver
- *
- * Copyright (c) 1999-2002 Transmeta Corporation
- * Copyright (c) 2005 Rick Koch <n1gp@hotmail.com>
- * Copyright (c) 2005 Vojtech Pavlik <vojtech@suse.cz>
- */
-
-
-/*
- * This driver supports the ICS MicroClock MK712 TouchScreen controller,
- * found in Gateway AOL Connected Touchpad computers.
- *
- * Documentation for ICS MK712 can be found at:
- *	https://www.idt.com/general-parts/mk712-touch-screen-controller
- */
-
-/*
- * 1999-12-18: original version, Daniel Quinlan
- * 1999-12-19: added anti-jitter code, report pen-up events, fixed mk712_poll
- *             to use queue_empty, Nathan Laredo
- * 1999-12-20: improved random point rejection, Nathan Laredo
- * 2000-01-05: checked in new anti-jitter code, changed mouse protocol, fixed
- *             queue code, added module options, other fixes, Daniel Quinlan
- * 2002-03-15: Clean up for kernel merge <alan@redhat.com>
- *             Fixed multi open race, fixed memory checks, fixed resource
- *             allocation, fixed close/powerdown bug, switched to new init
- * 2005-01-18: Ported to 2.6 from 2.4.28, Rick Koch
- * 2005-02-05: Rewritten for the input layer, Vojtech Pavlik
- *
- */
-
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/errno.h>
-#include <linux/delay.h>
-#include <linux/ioport.h>
-#include <linux/interrupt.h>
-#include <linux/input.h>
-#include <asm/io.h>
-
-MODULE_AUTHOR("Daniel Quinlan <quinlan@pathname.com>, Vojtech Pavlik <vojtech@suse.cz>");
-MODULE_DESCRIPTION("ICS MicroClock MK712 TouchScreen driver");
-MODULE_LICENSE("GPL");
-
-static unsigned int mk712_io = 0x260;	/* Also 0x200, 0x208, 0x300 */
-module_param_hw_named(io, mk712_io, uint, ioport, 0);
-MODULE_PARM_DESC(io, "I/O base address of MK712 touchscreen controller");
-
-static unsigned int mk712_irq = 10;	/* Also 12, 14, 15 */
-module_param_hw_named(irq, mk712_irq, uint, irq, 0);
-MODULE_PARM_DESC(irq, "IRQ of MK712 touchscreen controller");
-
-/* eight 8-bit registers */
-#define MK712_STATUS		0
-#define MK712_X			2
-#define MK712_Y			4
-#define MK712_CONTROL		6
-#define MK712_RATE		7
-
-/* status */
-#define	MK712_STATUS_TOUCH			0x10
-#define	MK712_CONVERSION_COMPLETE		0x80
-
-/* control */
-#define MK712_ENABLE_INT			0x01
-#define MK712_INT_ON_CONVERSION_COMPLETE	0x02
-#define MK712_INT_ON_CHANGE_IN_TOUCH_STATUS	0x04
-#define MK712_ENABLE_PERIODIC_CONVERSIONS	0x10
-#define MK712_READ_ONE_POINT			0x20
-#define MK712_POWERUP				0x40
-
-static struct input_dev *mk712_dev;
-static DEFINE_SPINLOCK(mk712_lock);
-
-static irqreturn_t mk712_interrupt(int irq, void *dev_id)
-{
-	unsigned char status;
-	static int debounce = 1;
-	static unsigned short last_x;
-	static unsigned short last_y;
-
-	spin_lock(&mk712_lock);
-
-	status = inb(mk712_io + MK712_STATUS);
-
-	if (~status & MK712_CONVERSION_COMPLETE) {
-		debounce = 1;
-		goto end;
-	}
-
-	if (~status & MK712_STATUS_TOUCH) {
-		debounce = 1;
-		input_report_key(mk712_dev, BTN_TOUCH, 0);
-		goto end;
-	}
-
-	if (debounce) {
-		debounce = 0;
-		goto end;
-	}
-
-	input_report_key(mk712_dev, BTN_TOUCH, 1);
-	input_report_abs(mk712_dev, ABS_X, last_x);
-	input_report_abs(mk712_dev, ABS_Y, last_y);
-
- end:
-	last_x = inw(mk712_io + MK712_X) & 0x0fff;
-	last_y = inw(mk712_io + MK712_Y) & 0x0fff;
-	input_sync(mk712_dev);
-	spin_unlock(&mk712_lock);
-	return IRQ_HANDLED;
-}
-
-static int mk712_open(struct input_dev *dev)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&mk712_lock, flags);
-
-	outb(0, mk712_io + MK712_CONTROL); /* Reset */
-
-	outb(MK712_ENABLE_INT | MK712_INT_ON_CONVERSION_COMPLETE |
-		MK712_INT_ON_CHANGE_IN_TOUCH_STATUS |
-		MK712_ENABLE_PERIODIC_CONVERSIONS |
-		MK712_POWERUP, mk712_io + MK712_CONTROL);
-
-	outb(10, mk712_io + MK712_RATE); /* 187 points per second */
-
-	spin_unlock_irqrestore(&mk712_lock, flags);
-
-	return 0;
-}
-
-static void mk712_close(struct input_dev *dev)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&mk712_lock, flags);
-
-	outb(0, mk712_io + MK712_CONTROL);
-
-	spin_unlock_irqrestore(&mk712_lock, flags);
-}
-
-static int __init mk712_init(void)
-{
-	int err;
-
-	if (!request_region(mk712_io, 8, "mk712")) {
-		printk(KERN_WARNING "mk712: unable to get IO region\n");
-		return -ENODEV;
-	}
-
-	outb(0, mk712_io + MK712_CONTROL);
-
-	if ((inw(mk712_io + MK712_X) & 0xf000) ||	/* Sanity check */
-	    (inw(mk712_io + MK712_Y) & 0xf000) ||
-	    (inw(mk712_io + MK712_STATUS) & 0xf333)) {
-		printk(KERN_WARNING "mk712: device not present\n");
-		err = -ENODEV;
-		goto fail1;
-	}
-
-	mk712_dev = input_allocate_device();
-	if (!mk712_dev) {
-		printk(KERN_ERR "mk712: not enough memory\n");
-		err = -ENOMEM;
-		goto fail1;
-	}
-
-	mk712_dev->name = "ICS MicroClock MK712 TouchScreen";
-	mk712_dev->phys = "isa0260/input0";
-	mk712_dev->id.bustype = BUS_ISA;
-	mk712_dev->id.vendor  = 0x0005;
-	mk712_dev->id.product = 0x0001;
-	mk712_dev->id.version = 0x0100;
-
-	mk712_dev->open    = mk712_open;
-	mk712_dev->close   = mk712_close;
-
-	mk712_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
-	mk712_dev->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
-	input_set_abs_params(mk712_dev, ABS_X, 0, 0xfff, 88, 0);
-	input_set_abs_params(mk712_dev, ABS_Y, 0, 0xfff, 88, 0);
-
-	if (request_irq(mk712_irq, mk712_interrupt, 0, "mk712", mk712_dev)) {
-		printk(KERN_WARNING "mk712: unable to get IRQ\n");
-		err = -EBUSY;
-		goto fail1;
-	}
-
-	err = input_register_device(mk712_dev);
-	if (err)
-		goto fail2;
-
-	return 0;
-
- fail2:	free_irq(mk712_irq, mk712_dev);
- fail1:	input_free_device(mk712_dev);
-	release_region(mk712_io, 8);
-	return err;
-}
-
-static void __exit mk712_exit(void)
-{
-	input_unregister_device(mk712_dev);
-	free_irq(mk712_irq, mk712_dev);
-	release_region(mk712_io, 8);
-}
-
-module_init(mk712_init);
-module_exit(mk712_exit);
-- 
2.46.0.76.ge559c4bf1a-goog


