Return-Path: <linux-input+bounces-5452-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CBB94C3B0
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 19:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E4BAE1F23FEF
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 17:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E591917D9;
	Thu,  8 Aug 2024 17:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDL6Jbwy"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B5E18E740;
	Thu,  8 Aug 2024 17:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723138067; cv=none; b=eV1pFYGW4fyB53yDRgR/GJD+j7fsb5gx9w8DQaoHH8HWZbWzprwd6s7VGUKRcSvzRNlCgtW5NbXpojRlTRWQTZcDgSFT6eXBGaM48rceJCeU/KxyaGotyiQ1adwGOiIXl1bWu0VoHzXyth6ODQQa6piL/nXjTacytMEEtApmRWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723138067; c=relaxed/simple;
	bh=lZgCGE2JH573K2NAkhL4/zSicSgUSNOwnDRrFSN8yYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YQ4HKwetLZ6aeSlxJkly1f/ehFbaBEA6oT+hglolQ4ZrzKPn1xKVLB5V6w8mo08/KQyhsipLY2of8TqXD4N5lRqG1RHjd2qNTXTzlLUkspLracfgrm05hLmhLSzOIdmgkCOL0Gsiio7kbCS5w7fS0bPgxqUinxy8jRJIp1Kfey4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDL6Jbwy; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-710afd56c99so973020b3a.0;
        Thu, 08 Aug 2024 10:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723138065; x=1723742865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUhyJiY4BdJGXiYkCxfj6FYUu6YAuBztn0Q47pWM934=;
        b=gDL6JbwyYaqn4dectJoSTf5HhJw2UqhzIWBSvPzpd9wJsvX+TkZkfaXjCaRNBvmycG
         WkoqTpWVh4U2JnW5nuA/CeJDxE9R+Y4kHsPZaWSOgV059beOxEh0B5heMZPQGY6m1ugk
         UziNxXgKejsiqOJnzMppRbgMq6cJVVo8UqquOY4sKfl1KDiM+basqzMwwaMZmQD2OmhY
         GmxB9oa2JpdGUoQOtbeR15nlJHh/mzpnVUGdZ0em7TXg2CVYRoCwVI+KzVRMckMhSyDe
         cxS0DsN++l3mLYw1vkFN1vAwfdmJpbaxgM7/hMKC2a2jPHzUKofTqBUeCUweWw10um/S
         VDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723138065; x=1723742865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HUhyJiY4BdJGXiYkCxfj6FYUu6YAuBztn0Q47pWM934=;
        b=oV3XKUjrDdjoH/fuk/cUBPds8+BmMCkBI9MG1aXYVu1W+PQmUiHZ45wmFY56P9EmPg
         aJdWGJ2lwez7daQkv0uCk/Xo/GNkwbKv0rYgcPcy6hnFdObQgHV8M86pDSDtZu3BeVeq
         x3ZKMgAeQV0Wn5F2DSm6y55v2wgCLNo8bRNyWPBKpXPSg5w10zglliQA8eW6O1UJzpqv
         2muPN+NMO3qzku21PwMulaykJal/+c6mGMv2gCtYzMCWopCLgj6w5BYIlgs+JSUKcYw8
         8bM1EGVkXiQ2KpCUnxaIFGLJI0fyM13bYfdXeUO/G8dLfczD5MR4eojCfDosHc7UOmAu
         y0Ow==
X-Gm-Message-State: AOJu0YyfGftaYC5QAIk5QYdA48+2y14k8u5CCzFoNwlSAzE1r+gRwAxN
	Z1vYfD67RlG3kBLB8jSONSTM3pCbGiJwMIEXx5k/VSBbZtJ1+A5DWjBl9g==
X-Google-Smtp-Source: AGHT+IFY8crf+yUSRdJCT/zJ10D/kiTeYHaQwPKkdwU/fnEa5MTdPm0GQsgV4bW1clmJ8quFjtN3Dg==
X-Received: by 2002:aa7:8d53:0:b0:705:d6ad:2495 with SMTP id d2e1a72fcca58-710cc90db8cmr3788996b3a.12.1723138065009;
        Thu, 08 Aug 2024 10:27:45 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4403:e9e1:aefe:e6e8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2e89ffsm1349829b3a.180.2024.08.08.10.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 10:27:44 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Vojtech Pavlik <vojtech@ucw.cz>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: [RFC PATCH 1/5] Input: inport - remove driver
Date: Thu,  8 Aug 2024 10:27:27 -0700
Message-ID: <20240808172733.1194442-2-dmitry.torokhov@gmail.com>
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

Inport (ATI XL and Microsoft) mice use specialized bus interface
implemented via an ISA add-in card. Have been superseded by PS/2 and
then USB, and are historical curiosity by now.

Remove the driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/Kconfig  |  16 ----
 drivers/input/mouse/Makefile |   1 -
 drivers/input/mouse/inport.c | 177 -----------------------------------
 3 files changed, 194 deletions(-)
 delete mode 100644 drivers/input/mouse/inport.c

diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
index 8a27a20d04b0..9c3102fa8e3c 100644
--- a/drivers/input/mouse/Kconfig
+++ b/drivers/input/mouse/Kconfig
@@ -312,22 +312,6 @@ config MOUSE_ELAN_I2C_SMBUS
 
 	   If unsure, say Y.
 
-config MOUSE_INPORT
-	tristate "InPort/MS/ATIXL busmouse"
-	depends on ISA
-	help
-	  Say Y here if you have an InPort, Microsoft or ATI XL busmouse.
-	  They are rather rare these days.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called inport.
-
-config MOUSE_ATIXL
-	bool "ATI XL variant"
-	depends on MOUSE_INPORT
-	help
-	  Say Y here if your mouse is of the ATI XL variety.
-
 config MOUSE_LOGIBM
 	tristate "Logitech busmouse"
 	depends on ISA
diff --git a/drivers/input/mouse/Makefile b/drivers/input/mouse/Makefile
index 563029551529..ef96db1fc945 100644
--- a/drivers/input/mouse/Makefile
+++ b/drivers/input/mouse/Makefile
@@ -12,7 +12,6 @@ obj-$(CONFIG_MOUSE_BCM5974)		+= bcm5974.o
 obj-$(CONFIG_MOUSE_CYAPA)		+= cyapatp.o
 obj-$(CONFIG_MOUSE_ELAN_I2C)		+= elan_i2c.o
 obj-$(CONFIG_MOUSE_GPIO)		+= gpio_mouse.o
-obj-$(CONFIG_MOUSE_INPORT)		+= inport.o
 obj-$(CONFIG_MOUSE_LOGIBM)		+= logibm.o
 obj-$(CONFIG_MOUSE_MAPLE)		+= maplemouse.o
 obj-$(CONFIG_MOUSE_PC110PAD)		+= pc110pad.o
diff --git a/drivers/input/mouse/inport.c b/drivers/input/mouse/inport.c
deleted file mode 100644
index 401d8bff8e84..000000000000
--- a/drivers/input/mouse/inport.c
+++ /dev/null
@@ -1,177 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (c) 1999-2001 Vojtech Pavlik
- *
- *  Based on the work of:
- *	Teemu Rantanen		Derrick Cole
- *	Peter Cervasio		Christoph Niemann
- *	Philip Blundell		Russell King
- *	Bob Harris
- */
-
-/*
- * Inport (ATI XL and Microsoft) busmouse driver for Linux
- */
-
-#include <linux/module.h>
-#include <linux/ioport.h>
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/input.h>
-
-#include <asm/io.h>
-#include <asm/irq.h>
-
-MODULE_AUTHOR("Vojtech Pavlik <vojtech@ucw.cz>");
-MODULE_DESCRIPTION("Inport (ATI XL and Microsoft) busmouse driver");
-MODULE_LICENSE("GPL");
-
-#define INPORT_BASE		0x23c
-#define INPORT_EXTENT		4
-
-#define INPORT_CONTROL_PORT	INPORT_BASE + 0
-#define INPORT_DATA_PORT	INPORT_BASE + 1
-#define INPORT_SIGNATURE_PORT	INPORT_BASE + 2
-
-#define INPORT_REG_BTNS	0x00
-#define INPORT_REG_X		0x01
-#define INPORT_REG_Y		0x02
-#define INPORT_REG_MODE		0x07
-#define INPORT_RESET		0x80
-
-#ifdef CONFIG_MOUSE_ATIXL
-#define INPORT_NAME		"ATI XL Mouse"
-#define INPORT_VENDOR		0x0002
-#define INPORT_SPEED_30HZ	0x01
-#define INPORT_SPEED_50HZ	0x02
-#define INPORT_SPEED_100HZ	0x03
-#define INPORT_SPEED_200HZ	0x04
-#define INPORT_MODE_BASE	INPORT_SPEED_100HZ
-#define INPORT_MODE_IRQ		0x08
-#else
-#define INPORT_NAME		"Microsoft InPort Mouse"
-#define INPORT_VENDOR		0x0001
-#define INPORT_MODE_BASE	0x10
-#define INPORT_MODE_IRQ		0x01
-#endif
-#define INPORT_MODE_HOLD	0x20
-
-#define INPORT_IRQ		5
-
-static int inport_irq = INPORT_IRQ;
-module_param_hw_named(irq, inport_irq, uint, irq, 0);
-MODULE_PARM_DESC(irq, "IRQ number (5=default)");
-
-static struct input_dev *inport_dev;
-
-static irqreturn_t inport_interrupt(int irq, void *dev_id)
-{
-	unsigned char buttons;
-
-	outb(INPORT_REG_MODE, INPORT_CONTROL_PORT);
-	outb(INPORT_MODE_HOLD | INPORT_MODE_IRQ | INPORT_MODE_BASE, INPORT_DATA_PORT);
-
-	outb(INPORT_REG_X, INPORT_CONTROL_PORT);
-	input_report_rel(inport_dev, REL_X, inb(INPORT_DATA_PORT));
-
-	outb(INPORT_REG_Y, INPORT_CONTROL_PORT);
-	input_report_rel(inport_dev, REL_Y, inb(INPORT_DATA_PORT));
-
-	outb(INPORT_REG_BTNS, INPORT_CONTROL_PORT);
-	buttons = inb(INPORT_DATA_PORT);
-
-	input_report_key(inport_dev, BTN_MIDDLE, buttons & 1);
-	input_report_key(inport_dev, BTN_LEFT,   buttons & 2);
-	input_report_key(inport_dev, BTN_RIGHT,  buttons & 4);
-
-	outb(INPORT_REG_MODE, INPORT_CONTROL_PORT);
-	outb(INPORT_MODE_IRQ | INPORT_MODE_BASE, INPORT_DATA_PORT);
-
-	input_sync(inport_dev);
-	return IRQ_HANDLED;
-}
-
-static int inport_open(struct input_dev *dev)
-{
-	if (request_irq(inport_irq, inport_interrupt, 0, "inport", NULL))
-		return -EBUSY;
-	outb(INPORT_REG_MODE, INPORT_CONTROL_PORT);
-	outb(INPORT_MODE_IRQ | INPORT_MODE_BASE, INPORT_DATA_PORT);
-
-	return 0;
-}
-
-static void inport_close(struct input_dev *dev)
-{
-	outb(INPORT_REG_MODE, INPORT_CONTROL_PORT);
-	outb(INPORT_MODE_BASE, INPORT_DATA_PORT);
-	free_irq(inport_irq, NULL);
-}
-
-static int __init inport_init(void)
-{
-	unsigned char a, b, c;
-	int err;
-
-	if (!request_region(INPORT_BASE, INPORT_EXTENT, "inport")) {
-		printk(KERN_ERR "inport.c: Can't allocate ports at %#x\n", INPORT_BASE);
-		return -EBUSY;
-	}
-
-	a = inb(INPORT_SIGNATURE_PORT);
-	b = inb(INPORT_SIGNATURE_PORT);
-	c = inb(INPORT_SIGNATURE_PORT);
-	if (a == b || a != c) {
-		printk(KERN_INFO "inport.c: Didn't find InPort mouse at %#x\n", INPORT_BASE);
-		err = -ENODEV;
-		goto err_release_region;
-	}
-
-	inport_dev = input_allocate_device();
-	if (!inport_dev) {
-		printk(KERN_ERR "inport.c: Not enough memory for input device\n");
-		err = -ENOMEM;
-		goto err_release_region;
-	}
-
-	inport_dev->name = INPORT_NAME;
-	inport_dev->phys = "isa023c/input0";
-	inport_dev->id.bustype = BUS_ISA;
-	inport_dev->id.vendor  = INPORT_VENDOR;
-	inport_dev->id.product = 0x0001;
-	inport_dev->id.version = 0x0100;
-
-	inport_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_REL);
-	inport_dev->keybit[BIT_WORD(BTN_LEFT)] = BIT_MASK(BTN_LEFT) |
-		BIT_MASK(BTN_MIDDLE) | BIT_MASK(BTN_RIGHT);
-	inport_dev->relbit[0] = BIT_MASK(REL_X) | BIT_MASK(REL_Y);
-
-	inport_dev->open  = inport_open;
-	inport_dev->close = inport_close;
-
-	outb(INPORT_RESET, INPORT_CONTROL_PORT);
-	outb(INPORT_REG_MODE, INPORT_CONTROL_PORT);
-	outb(INPORT_MODE_BASE, INPORT_DATA_PORT);
-
-	err = input_register_device(inport_dev);
-	if (err)
-		goto err_free_dev;
-
-	return 0;
-
- err_free_dev:
-	input_free_device(inport_dev);
- err_release_region:
-	release_region(INPORT_BASE, INPORT_EXTENT);
-
-	return err;
-}
-
-static void __exit inport_exit(void)
-{
-	input_unregister_device(inport_dev);
-	release_region(INPORT_BASE, INPORT_EXTENT);
-}
-
-module_init(inport_init);
-module_exit(inport_exit);
-- 
2.46.0.76.ge559c4bf1a-goog


