Return-Path: <linux-input+bounces-5456-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF03894C3B9
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 19:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 634771F260C6
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 17:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B2A1922FC;
	Thu,  8 Aug 2024 17:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bv6ExeEa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9066B1922CC;
	Thu,  8 Aug 2024 17:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723138072; cv=none; b=FZnkwiuTkU7qtpGrPlixp0kroCMScf4xZJUoI6VDdj3ztVlyCDJ8xsPH1ZpF9uR/P0bcvuKd056g/crTcUZGwSE6rY/k+urbtkSAWbLC9nL4l4BVhvEPbqeSNqKwAFvOHinOqidYNouT491BvHyfJ424Gy/GIgrs4AQTllZ0dB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723138072; c=relaxed/simple;
	bh=dRi5Uxsw1SqVcQJw/OCgJPsOMrveCqLhXgGtzkccVgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGw9J2GEp7EZqBStTDn6RCJzLfYvQ7ZRsUcY9FnJIfofCR6laMb7C+rdeB7W9+LEcHxO2wn1N3MTdCorju72XiJZ7SrUQKjhn57f2Xd5XmOGNrY5tXyau5wX95rVKgLdFnf4XFWu6SYkSaepICoua82JTi68hCsjOPgeh1Y0XyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bv6ExeEa; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70d19d768c2so927926b3a.3;
        Thu, 08 Aug 2024 10:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723138069; x=1723742869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieJFhFzS+sS6bkrY7PwRdr8dfJifoCFcuPsanvyTTx4=;
        b=bv6ExeEaWmnpkxI25x76wfWUbj+caCx6GIMObZFmgwUzAsY3/KuBwwzkmmoUWn+cWa
         TKLKetw81PM/ZCrI9O8RsOY3gaF2CGhdOhs22xnvd+/4+bkiK3PVvjBbaoKbjKZNkLAu
         y0NTPf66DmmVtL2Anh/bKfS63kG0b0WY2OlpRg7z13eamk2vJU0iOL0dRjLSxwAt42Ef
         HRObVbNBIVC+AopfQDI/7//6elYe7s5zLPAG2fM+g3S+ynnrgX/Scew5qTaVUmuGk7yI
         pF5bgFoLe76oLuDjA/Lb3pkWNHxRelS7FofftrUbv3EKxBElOAnmvkKwaeEuSqGlW7xo
         Knog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723138069; x=1723742869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieJFhFzS+sS6bkrY7PwRdr8dfJifoCFcuPsanvyTTx4=;
        b=Wx937voY4w5q4xWVMT1KejPfXs/T7TzuH1IbG3LCNE2qPNteB6Crj8+mrLrTCySU7Q
         ThyrUKUdmb5YanqmQb8siEZFWf6N5TW+r5cC6B0sZCH2ghtUwAPaanBD10J4KRLok3g4
         QxqfVcawtNZfi1kRc8CjBfQvA+Rgf7m3glk+zOSRfpFuSQv4FgohmFiyUe8YXFEn8muV
         kAFQ3cZGYuLUNu6uYPWRp5am+DQKG6TFAZ88V3XersOtJ73t2DJ9OSK08dQalHKDyF8Q
         xtXRAVJNciV/QWe7rksruLHrEpCsFQ6opIBS2CsZeZiLWaENJUL85ZIvUqonxpYYAXGI
         en4Q==
X-Gm-Message-State: AOJu0YzoTSTcsZ8ytyM2+fV90sigCjFVY+drVJzX5xm8A3kmz+PYIUAZ
	Cyr2YjK7mVPHqqHYURbP5ZECsWyIQ/57HOcI62qsgmELnopW7gY6p7ly4w==
X-Google-Smtp-Source: AGHT+IGRqKhzo1rj7EBGIhV/ltFdLdkwa2qFpyqB4gD9vhJObVyG1+HA4pNjsEv/ifYUyf2tlfzUgw==
X-Received: by 2002:a05:6a20:12d5:b0:1c2:a722:92b2 with SMTP id adf61e73a8af0-1c6fcf9c861mr3142375637.45.1723138069434;
        Thu, 08 Aug 2024 10:27:49 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4403:e9e1:aefe:e6e8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2e89ffsm1349829b3a.180.2024.08.08.10.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 10:27:48 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Vojtech Pavlik <vojtech@ucw.cz>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: [RFC PATCH 5/5] Input: ct82c710 - remove driver
Date: Thu,  8 Aug 2024 10:27:31 -0700
Message-ID: <20240808172733.1194442-6-dmitry.torokhov@gmail.com>
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

This is a PS/2 mouse interface chip from Chips & Technologies that was
used in TI TravelMate and Gateway Nomad laptops, which used 386 and 486
CPUs. While the kernel still supports 486 CPU it is highly unlikely that
anyone is using these devices with the latest kernel.

Remove the driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/serio/Kconfig    |  13 --
 drivers/input/serio/Makefile   |   1 -
 drivers/input/serio/ct82c710.c | 239 ---------------------------------
 3 files changed, 253 deletions(-)
 delete mode 100644 drivers/input/serio/ct82c710.c

diff --git a/drivers/input/serio/Kconfig b/drivers/input/serio/Kconfig
index 17edc1597446..cf449f7cbaa5 100644
--- a/drivers/input/serio/Kconfig
+++ b/drivers/input/serio/Kconfig
@@ -55,19 +55,6 @@ config SERIO_SERPORT
 	  To compile this driver as a module, choose M here: the
 	  module will be called serport.
 
-config SERIO_CT82C710
-	tristate "ct82c710 Aux port controller"
-	depends on X86
-	help
-	  Say Y here if you have a Texas Instruments TravelMate notebook
-	  equipped with the ct82c710 chip and want to use a mouse connected
-	  to the "QuickPort".
-
-	  If unsure, say N.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called ct82c710.
-
 config SERIO_Q40KBD
 	tristate "Q40 keyboard controller"
 	depends on Q40
diff --git a/drivers/input/serio/Makefile b/drivers/input/serio/Makefile
index 6d97bad7b844..8ab98f4aa28d 100644
--- a/drivers/input/serio/Makefile
+++ b/drivers/input/serio/Makefile
@@ -9,7 +9,6 @@ obj-$(CONFIG_SERIO)		+= serio.o
 obj-$(CONFIG_SERIO_I8042)	+= i8042.o
 obj-$(CONFIG_SERIO_PARKBD)	+= parkbd.o
 obj-$(CONFIG_SERIO_SERPORT)	+= serport.o
-obj-$(CONFIG_SERIO_CT82C710)	+= ct82c710.o
 obj-$(CONFIG_SERIO_RPCKBD)	+= rpckbd.o
 obj-$(CONFIG_SERIO_SA1111)	+= sa1111ps2.o
 obj-$(CONFIG_SERIO_AMBAKMI)	+= ambakmi.o
diff --git a/drivers/input/serio/ct82c710.c b/drivers/input/serio/ct82c710.c
deleted file mode 100644
index 6834440b37f6..000000000000
--- a/drivers/input/serio/ct82c710.c
+++ /dev/null
@@ -1,239 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (c) 1999-2001 Vojtech Pavlik
- */
-
-/*
- *  82C710 C&T mouse port chip driver for Linux
- */
-
-#include <linux/delay.h>
-#include <linux/module.h>
-#include <linux/ioport.h>
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/serio.h>
-#include <linux/errno.h>
-#include <linux/err.h>
-#include <linux/platform_device.h>
-#include <linux/slab.h>
-
-#include <asm/io.h>
-
-MODULE_AUTHOR("Vojtech Pavlik <vojtech@ucw.cz>");
-MODULE_DESCRIPTION("82C710 C&T mouse port chip driver");
-MODULE_LICENSE("GPL");
-
-/*
- * ct82c710 interface
- */
-
-#define CT82C710_DEV_IDLE     0x01		/* Device Idle */
-#define CT82C710_RX_FULL      0x02		/* Device Char received */
-#define CT82C710_TX_IDLE      0x04		/* Device XMIT Idle */
-#define CT82C710_RESET        0x08		/* Device Reset */
-#define CT82C710_INTS_ON      0x10		/* Device Interrupt On */
-#define CT82C710_ERROR_FLAG   0x20		/* Device Error */
-#define CT82C710_CLEAR        0x40		/* Device Clear */
-#define CT82C710_ENABLE       0x80		/* Device Enable */
-
-#define CT82C710_IRQ          12
-
-#define CT82C710_DATA         ct82c710_iores.start
-#define CT82C710_STATUS       (ct82c710_iores.start + 1)
-
-static struct serio *ct82c710_port;
-static struct platform_device *ct82c710_device;
-static struct resource ct82c710_iores;
-
-/*
- * Interrupt handler for the 82C710 mouse port. A character
- * is waiting in the 82C710.
- */
-
-static irqreturn_t ct82c710_interrupt(int cpl, void *dev_id)
-{
-	return serio_interrupt(ct82c710_port, inb(CT82C710_DATA), 0);
-}
-
-/*
- * Wait for device to send output char and flush any input char.
- */
-
-static int ct82c170_wait(void)
-{
-	int timeout = 60000;
-
-	while ((inb(CT82C710_STATUS) & (CT82C710_RX_FULL | CT82C710_TX_IDLE | CT82C710_DEV_IDLE))
-		       != (CT82C710_DEV_IDLE | CT82C710_TX_IDLE) && timeout) {
-
-		if (inb_p(CT82C710_STATUS) & CT82C710_RX_FULL) inb_p(CT82C710_DATA);
-
-		udelay(1);
-		timeout--;
-	}
-
-	return !timeout;
-}
-
-static void ct82c710_close(struct serio *serio)
-{
-	if (ct82c170_wait())
-		printk(KERN_WARNING "ct82c710.c: Device busy in close()\n");
-
-	outb_p(inb_p(CT82C710_STATUS) & ~(CT82C710_ENABLE | CT82C710_INTS_ON), CT82C710_STATUS);
-
-	if (ct82c170_wait())
-		printk(KERN_WARNING "ct82c710.c: Device busy in close()\n");
-
-	free_irq(CT82C710_IRQ, NULL);
-}
-
-static int ct82c710_open(struct serio *serio)
-{
-	unsigned char status;
-	int err;
-
-	err = request_irq(CT82C710_IRQ, ct82c710_interrupt, 0, "ct82c710", NULL);
-	if (err)
-		return err;
-
-	status = inb_p(CT82C710_STATUS);
-
-	status |= (CT82C710_ENABLE | CT82C710_RESET);
-	outb_p(status, CT82C710_STATUS);
-
-	status &= ~(CT82C710_RESET);
-	outb_p(status, CT82C710_STATUS);
-
-	status |= CT82C710_INTS_ON;
-	outb_p(status, CT82C710_STATUS);	/* Enable interrupts */
-
-	while (ct82c170_wait()) {
-		printk(KERN_ERR "ct82c710: Device busy in open()\n");
-		status &= ~(CT82C710_ENABLE | CT82C710_INTS_ON);
-		outb_p(status, CT82C710_STATUS);
-		free_irq(CT82C710_IRQ, NULL);
-		return -EBUSY;
-	}
-
-	return 0;
-}
-
-/*
- * Write to the 82C710 mouse device.
- */
-
-static int ct82c710_write(struct serio *port, unsigned char c)
-{
-	if (ct82c170_wait()) return -1;
-	outb_p(c, CT82C710_DATA);
-	return 0;
-}
-
-/*
- * See if we can find a 82C710 device. Read mouse address.
- */
-
-static int __init ct82c710_detect(void)
-{
-	outb_p(0x55, 0x2fa);				/* Any value except 9, ff or 36 */
-	outb_p(0xaa, 0x3fa);				/* Inverse of 55 */
-	outb_p(0x36, 0x3fa);				/* Address the chip */
-	outb_p(0xe4, 0x3fa);				/* 390/4; 390 = config address */
-	outb_p(0x1b, 0x2fa);				/* Inverse of e4 */
-	outb_p(0x0f, 0x390);				/* Write index */
-	if (inb_p(0x391) != 0xe4)			/* Config address found? */
-		return -ENODEV;				/* No: no 82C710 here */
-
-	outb_p(0x0d, 0x390);				/* Write index */
-	ct82c710_iores.start = inb_p(0x391) << 2;	/* Get mouse I/O address */
-	ct82c710_iores.end = ct82c710_iores.start + 1;
-	ct82c710_iores.flags = IORESOURCE_IO;
-	outb_p(0x0f, 0x390);
-	outb_p(0x0f, 0x391);				/* Close config mode */
-
-	return 0;
-}
-
-static int ct82c710_probe(struct platform_device *dev)
-{
-	ct82c710_port = kzalloc(sizeof(*ct82c710_port), GFP_KERNEL);
-	if (!ct82c710_port)
-		return -ENOMEM;
-
-	ct82c710_port->id.type = SERIO_8042;
-	ct82c710_port->dev.parent = &dev->dev;
-	ct82c710_port->open = ct82c710_open;
-	ct82c710_port->close = ct82c710_close;
-	ct82c710_port->write = ct82c710_write;
-	strscpy(ct82c710_port->name, "C&T 82c710 mouse port",
-		sizeof(ct82c710_port->name));
-	snprintf(ct82c710_port->phys, sizeof(ct82c710_port->phys),
-		 "isa%16llx/serio0", (unsigned long long)CT82C710_DATA);
-
-	serio_register_port(ct82c710_port);
-
-	printk(KERN_INFO "serio: C&T 82c710 mouse port at %#llx irq %d\n",
-		(unsigned long long)CT82C710_DATA, CT82C710_IRQ);
-
-	return 0;
-}
-
-static void ct82c710_remove(struct platform_device *dev)
-{
-	serio_unregister_port(ct82c710_port);
-}
-
-static struct platform_driver ct82c710_driver = {
-	.driver		= {
-		.name	= "ct82c710",
-	},
-	.probe		= ct82c710_probe,
-	.remove_new	= ct82c710_remove,
-};
-
-
-static int __init ct82c710_init(void)
-{
-	int error;
-
-	error = ct82c710_detect();
-	if (error)
-		return error;
-
-	error = platform_driver_register(&ct82c710_driver);
-	if (error)
-		return error;
-
-	ct82c710_device = platform_device_alloc("ct82c710", -1);
-	if (!ct82c710_device) {
-		error = -ENOMEM;
-		goto err_unregister_driver;
-	}
-
-	error = platform_device_add_resources(ct82c710_device, &ct82c710_iores, 1);
-	if (error)
-		goto err_free_device;
-
-	error = platform_device_add(ct82c710_device);
-	if (error)
-		goto err_free_device;
-
-	return 0;
-
- err_free_device:
-	platform_device_put(ct82c710_device);
- err_unregister_driver:
-	platform_driver_unregister(&ct82c710_driver);
-	return error;
-}
-
-static void __exit ct82c710_exit(void)
-{
-	platform_device_unregister(ct82c710_device);
-	platform_driver_unregister(&ct82c710_driver);
-}
-
-module_init(ct82c710_init);
-module_exit(ct82c710_exit);
-- 
2.46.0.76.ge559c4bf1a-goog


