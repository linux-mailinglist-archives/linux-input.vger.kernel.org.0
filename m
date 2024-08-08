Return-Path: <linux-input+bounces-5453-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B92494C3B2
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 19:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBE29B2595B
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 17:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFD6E191F6E;
	Thu,  8 Aug 2024 17:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JXVDjK5W"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474071917CB;
	Thu,  8 Aug 2024 17:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723138068; cv=none; b=s+be3twrxUsrUGeiCzKM9Pw9TVyFQXpiGd+mOVsTQ4Qq9xenzpwxvgk/8RhanMWcYQ6nqQZxWcaZ5CfHm79Dy6Nor162F/7RxOovCDx9Ea7GXWjL3teqEj4kXGOFJatToWeHzl5wueuCCFI+3mssuKblNdTMp9gAklfyiGU4ceY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723138068; c=relaxed/simple;
	bh=z7CmfIlggHc6GW4Pq7QEHM6q1SCKYulgju9o3siiY7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HSiX9C0d3sUSH5PuQ+cMrplZOMjr+E9aQfeKtUFs7y+OpmPfG96z0s3Xko2WKsOOE2XR1AFU9fi+KoTautAd+KvE1her9xPfka0C4A9e/EZQ0wPoTpXjNdt8Y01rTx+fdwXAipyN6jGTf715cr6Cz8kAxKgkAtP/kVZPfeZoGH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JXVDjK5W; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70d162eef54so1002528b3a.3;
        Thu, 08 Aug 2024 10:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723138066; x=1723742866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9glaQj2klfmBtUR/sEp1TdcmyuE2YttOBf1sYIJp+nM=;
        b=JXVDjK5WFGoTwBSsRqcNF0CBsm3teiYAodraHM32lm5KV4JuPZ7Cp2CvETSR6oMZEO
         cXMoNbv89uf7eYGp0XJEJCSMXmgixi6CoczkdvLvDP+7IlG40EwwswnWmtHsrtgxWo8w
         6muy21mpB+dpFgxuQmaj0lbMpnuE5uHJDHt7jJbuWLYnkrRFq3gQQrjwuaSPmc39XUX2
         Ji5pmXdcfRWO5J0+Jr0AvtEF/91qhkoZb5dtcmH2BhvnW3W/nIHqQMsui6lxRRfdJ0zV
         I9a2GvXfs5oQmx7wc7G6vZLGlhk2DUefhXkN6tGBnk9PtAYRPckX19oBxKUEXHwcANMT
         IOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723138066; x=1723742866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9glaQj2klfmBtUR/sEp1TdcmyuE2YttOBf1sYIJp+nM=;
        b=EotNdrlhyBx0gWROoql40BAH94xNSWceA9XPaQQ80v61YaZm50SCPlwfX/6RCjLTZl
         h5+k3YIju+52FDfTq+bDcAPl5ITP8e58rVbfnmfAFtSZkoAvuHePaebjcBurzT8tqk37
         0SpyqwMVdeosaUp1SWtMGGS6tTUDaP0jiEvv88Gs5+0mrmLdSgvLScsFVautjLR3IqON
         TjQPts1dAsHu72NFs4Z7ezGSnaoqT/JL0iXLiopVZyUvQUiHRHUNNN/OnM67r3ivsua6
         h8rBZB7vLEiO+EFX91ek3j3+JdJsM62i6IX81isquLAItYe67WO68QVBmQe0YLBkGZSw
         8xIw==
X-Gm-Message-State: AOJu0YypkFRdkco4FvuqzvILIZ70mGZEDho9VpgYTe7LvJ3rCMlx/EiC
	SzIGpDDAbwNgyH8I2GDSZ1zsF9wvRObtODMhuKv1dAIrtWwiTztX+Wxjmg==
X-Google-Smtp-Source: AGHT+IHP3F3O0c6NqSNKit6DywisiVCSnwyzlEpNaJREXf7VL1IIBJAV9xatV3Rg2P5K/6LZ/uzYuA==
X-Received: by 2002:a05:6a00:2293:b0:70b:2efd:7bee with SMTP id d2e1a72fcca58-710cae1c228mr3497809b3a.21.1723138066205;
        Thu, 08 Aug 2024 10:27:46 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4403:e9e1:aefe:e6e8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2e89ffsm1349829b3a.180.2024.08.08.10.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 10:27:45 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Vojtech Pavlik <vojtech@ucw.cz>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: [RFC PATCH 2/5] Input: logibm - remove driver
Date: Thu,  8 Aug 2024 10:27:28 -0700
Message-ID: <20240808172733.1194442-3-dmitry.torokhov@gmail.com>
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

Bus mice use specialized bus interface implemented via an ISA add-in
cards. They were superseded by PS/2 and later USB.

Kconfig entry for the Logitech bus mice states that they "are rather
rare these days". This statement was true in 2002 and is no less true
in 2024.

Remove the driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/Kconfig  |  10 ---
 drivers/input/mouse/Makefile |   1 -
 drivers/input/mouse/logibm.c | 166 -----------------------------------
 3 files changed, 177 deletions(-)
 delete mode 100644 drivers/input/mouse/logibm.c

diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
index 9c3102fa8e3c..f660e6ba24c2 100644
--- a/drivers/input/mouse/Kconfig
+++ b/drivers/input/mouse/Kconfig
@@ -312,16 +312,6 @@ config MOUSE_ELAN_I2C_SMBUS
 
 	   If unsure, say Y.
 
-config MOUSE_LOGIBM
-	tristate "Logitech busmouse"
-	depends on ISA
-	help
-	  Say Y here if you have a Logitech busmouse.
-	  They are rather rare these days.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called logibm.
-
 config MOUSE_PC110PAD
 	tristate "IBM PC110 touchpad"
 	depends on ISA
diff --git a/drivers/input/mouse/Makefile b/drivers/input/mouse/Makefile
index ef96db1fc945..e745b64fed49 100644
--- a/drivers/input/mouse/Makefile
+++ b/drivers/input/mouse/Makefile
@@ -12,7 +12,6 @@ obj-$(CONFIG_MOUSE_BCM5974)		+= bcm5974.o
 obj-$(CONFIG_MOUSE_CYAPA)		+= cyapatp.o
 obj-$(CONFIG_MOUSE_ELAN_I2C)		+= elan_i2c.o
 obj-$(CONFIG_MOUSE_GPIO)		+= gpio_mouse.o
-obj-$(CONFIG_MOUSE_LOGIBM)		+= logibm.o
 obj-$(CONFIG_MOUSE_MAPLE)		+= maplemouse.o
 obj-$(CONFIG_MOUSE_PC110PAD)		+= pc110pad.o
 obj-$(CONFIG_MOUSE_PS2)			+= psmouse.o
diff --git a/drivers/input/mouse/logibm.c b/drivers/input/mouse/logibm.c
deleted file mode 100644
index 0aab63dbc30a..000000000000
--- a/drivers/input/mouse/logibm.c
+++ /dev/null
@@ -1,166 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (c) 1999-2001 Vojtech Pavlik
- *
- *  Based on the work of:
- *	James Banks		Matthew Dillon
- *	David Giller		Nathan Laredo
- *	Linus Torvalds		Johan Myreen
- *	Cliff Matthews		Philip Blundell
- *	Russell King
- */
-
-/*
- * Logitech Bus Mouse Driver for Linux
- */
-
-#include <linux/module.h>
-#include <linux/delay.h>
-#include <linux/ioport.h>
-#include <linux/init.h>
-#include <linux/input.h>
-#include <linux/interrupt.h>
-
-#include <asm/io.h>
-#include <asm/irq.h>
-
-MODULE_AUTHOR("Vojtech Pavlik <vojtech@ucw.cz>");
-MODULE_DESCRIPTION("Logitech busmouse driver");
-MODULE_LICENSE("GPL");
-
-#define	LOGIBM_BASE		0x23c
-#define	LOGIBM_EXTENT		4
-
-#define	LOGIBM_DATA_PORT	LOGIBM_BASE + 0
-#define	LOGIBM_SIGNATURE_PORT	LOGIBM_BASE + 1
-#define	LOGIBM_CONTROL_PORT	LOGIBM_BASE + 2
-#define	LOGIBM_CONFIG_PORT	LOGIBM_BASE + 3
-
-#define	LOGIBM_ENABLE_IRQ	0x00
-#define	LOGIBM_DISABLE_IRQ	0x10
-#define	LOGIBM_READ_X_LOW	0x80
-#define	LOGIBM_READ_X_HIGH	0xa0
-#define	LOGIBM_READ_Y_LOW	0xc0
-#define	LOGIBM_READ_Y_HIGH	0xe0
-
-#define LOGIBM_DEFAULT_MODE	0x90
-#define LOGIBM_CONFIG_BYTE	0x91
-#define LOGIBM_SIGNATURE_BYTE	0xa5
-
-#define LOGIBM_IRQ		5
-
-static int logibm_irq = LOGIBM_IRQ;
-module_param_hw_named(irq, logibm_irq, uint, irq, 0);
-MODULE_PARM_DESC(irq, "IRQ number (5=default)");
-
-static struct input_dev *logibm_dev;
-
-static irqreturn_t logibm_interrupt(int irq, void *dev_id)
-{
-	char dx, dy;
-	unsigned char buttons;
-
-	outb(LOGIBM_READ_X_LOW, LOGIBM_CONTROL_PORT);
-	dx = (inb(LOGIBM_DATA_PORT) & 0xf);
-	outb(LOGIBM_READ_X_HIGH, LOGIBM_CONTROL_PORT);
-	dx |= (inb(LOGIBM_DATA_PORT) & 0xf) << 4;
-	outb(LOGIBM_READ_Y_LOW, LOGIBM_CONTROL_PORT);
-	dy = (inb(LOGIBM_DATA_PORT) & 0xf);
-	outb(LOGIBM_READ_Y_HIGH, LOGIBM_CONTROL_PORT);
-	buttons = inb(LOGIBM_DATA_PORT);
-	dy |= (buttons & 0xf) << 4;
-	buttons = ~buttons >> 5;
-
-	input_report_rel(logibm_dev, REL_X, dx);
-	input_report_rel(logibm_dev, REL_Y, dy);
-	input_report_key(logibm_dev, BTN_RIGHT,  buttons & 1);
-	input_report_key(logibm_dev, BTN_MIDDLE, buttons & 2);
-	input_report_key(logibm_dev, BTN_LEFT,   buttons & 4);
-	input_sync(logibm_dev);
-
-	outb(LOGIBM_ENABLE_IRQ, LOGIBM_CONTROL_PORT);
-	return IRQ_HANDLED;
-}
-
-static int logibm_open(struct input_dev *dev)
-{
-	if (request_irq(logibm_irq, logibm_interrupt, 0, "logibm", NULL)) {
-		printk(KERN_ERR "logibm.c: Can't allocate irq %d\n", logibm_irq);
-		return -EBUSY;
-	}
-	outb(LOGIBM_ENABLE_IRQ, LOGIBM_CONTROL_PORT);
-	return 0;
-}
-
-static void logibm_close(struct input_dev *dev)
-{
-	outb(LOGIBM_DISABLE_IRQ, LOGIBM_CONTROL_PORT);
-	free_irq(logibm_irq, NULL);
-}
-
-static int __init logibm_init(void)
-{
-	int err;
-
-	if (!request_region(LOGIBM_BASE, LOGIBM_EXTENT, "logibm")) {
-		printk(KERN_ERR "logibm.c: Can't allocate ports at %#x\n", LOGIBM_BASE);
-		return -EBUSY;
-	}
-
-	outb(LOGIBM_CONFIG_BYTE, LOGIBM_CONFIG_PORT);
-	outb(LOGIBM_SIGNATURE_BYTE, LOGIBM_SIGNATURE_PORT);
-	udelay(100);
-
-	if (inb(LOGIBM_SIGNATURE_PORT) != LOGIBM_SIGNATURE_BYTE) {
-		printk(KERN_INFO "logibm.c: Didn't find Logitech busmouse at %#x\n", LOGIBM_BASE);
-		err = -ENODEV;
-		goto err_release_region;
-	}
-
-	outb(LOGIBM_DEFAULT_MODE, LOGIBM_CONFIG_PORT);
-	outb(LOGIBM_DISABLE_IRQ, LOGIBM_CONTROL_PORT);
-
-	logibm_dev = input_allocate_device();
-	if (!logibm_dev) {
-		printk(KERN_ERR "logibm.c: Not enough memory for input device\n");
-		err = -ENOMEM;
-		goto err_release_region;
-	}
-
-	logibm_dev->name = "Logitech bus mouse";
-	logibm_dev->phys = "isa023c/input0";
-	logibm_dev->id.bustype = BUS_ISA;
-	logibm_dev->id.vendor  = 0x0003;
-	logibm_dev->id.product = 0x0001;
-	logibm_dev->id.version = 0x0100;
-
-	logibm_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_REL);
-	logibm_dev->keybit[BIT_WORD(BTN_LEFT)] = BIT_MASK(BTN_LEFT) |
-		BIT_MASK(BTN_MIDDLE) | BIT_MASK(BTN_RIGHT);
-	logibm_dev->relbit[0] = BIT_MASK(REL_X) | BIT_MASK(REL_Y);
-
-	logibm_dev->open  = logibm_open;
-	logibm_dev->close = logibm_close;
-
-	err = input_register_device(logibm_dev);
-	if (err)
-		goto err_free_dev;
-
-	return 0;
-
- err_free_dev:
-	input_free_device(logibm_dev);
- err_release_region:
-	release_region(LOGIBM_BASE, LOGIBM_EXTENT);
-
-	return err;
-}
-
-static void __exit logibm_exit(void)
-{
-	input_unregister_device(logibm_dev);
-	release_region(LOGIBM_BASE, LOGIBM_EXTENT);
-}
-
-module_init(logibm_init);
-module_exit(logibm_exit);
-- 
2.46.0.76.ge559c4bf1a-goog


