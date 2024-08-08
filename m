Return-Path: <linux-input+bounces-5454-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BFD94C3B4
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 19:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2824BB26046
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 17:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434CC191F9A;
	Thu,  8 Aug 2024 17:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ds6WMUex"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7714191F65;
	Thu,  8 Aug 2024 17:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723138070; cv=none; b=dt8O0CE+FFwIbKPJzJbjXkm4i0J6bSOrh2ckgPhsmHiTOpwF5Qc9RW4f6Uz0Q5+afH/DOaogLwHfT8zeSRMt63UGhLsu1LtY0Vz7PDDVsjURpqux3pst8xRT4kImtB6PgnA4DPE0YKjRiJbTrLL3jds1MW1Wwcvi2zy85+PeUHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723138070; c=relaxed/simple;
	bh=JiG9JU7BMC0nbgb7xMU1fHsrYsmQ1eqXt8YVfdaVmPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HfPFWhpwVor/zRy3ui7c+T5LBjvMye6JgRFr0BPQBXmAMb+vEhSCJhTYrDFv2aenqTS6cHN0G0kjr1mlaq0PHWVY8MDuXo28E5iqvRfOiHMDFKOb7ctfg0x9q/dTZdNZN4RqD3rTD4tSx4YbtLpqhObyKPjcMFF+JWu7eXBddh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ds6WMUex; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70d1fb6c108so987853b3a.3;
        Thu, 08 Aug 2024 10:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723138068; x=1723742868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWkxNnU4sBqalSwyfrRRirCD1vzPLoXEjt3eORuHZEk=;
        b=Ds6WMUexGDZOoK3tS+xQqzmuJ+OIAKRy9m+4KBHlqB9McGCCXFQFRMfHPlM3bSFJao
         pFuCEA8tWtL+o/WXDIiceAHUH8ucTiZTIm6hxTjXoWWyNzA5Q5kDO1M1AxQwIAMVUHa+
         aQVw/0gxLmPvDasmgKF9R+9+1nTAbc+DLSPSOeKzdJ2GUrGkVqnvTSN0SsSCSi5rtH00
         WIBWd5ZJbXV9vtIhjV7KRQm+nWFCJphn9FSjL/0sTBGX6kmt73JOUG6mTKAEG7ctGhVx
         XC2kFUxUyVvZPqKROt/gLMX13j+lUPzJRH0igWOPiTbKeNaS6rAxAOvB8iKbVATq2jIe
         z6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723138068; x=1723742868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWkxNnU4sBqalSwyfrRRirCD1vzPLoXEjt3eORuHZEk=;
        b=CUmT+GpP7cpUx/fr6E9Nz+YZ4Zwejcvkbv5GGIJCXh2jI2bypv16rnCHpx3AgRYBhp
         5sguxzoZ5Hk+CvAAtY3VIQw9jsOzuSxHw0/Vd3AsoNK4g776M63tdP9tI7t9DXD/Q4WE
         b3mdyN3Mw1EBm+wri5qFHzUiekNOuHXIIHXadOyaUfL7iO7cayyfnvj55PFmNRtaJrq/
         dyJv+DwDAKfnEf7RgIsjZJRJL0OXenrGKlbhXDmqsFZLI0FthG0RIJTOT5Q/Cj1bm32o
         DkQ+ZCuOUMumPEM9M7h3Gzir0dDW6bXDI/TMuK+KDGCndD1dJLewcq3m4RMfYXjxRI/e
         wIOQ==
X-Gm-Message-State: AOJu0Yyz6jN1DfcdMTzcKhiELvbb/I7UzG4qMwGwqrWGkA1sl4danrrk
	ncpY4YL9X8NxzfA4+okTBEpzxQQEHBUNmim9tlZTFvkfG4UVbISzx4sS5Q==
X-Google-Smtp-Source: AGHT+IGtu27SHBP86xkut5jFOZP9QMYAdUvjhgVB0NYFDN61MXtxY2e+tXyMK2jpwDEu04a76CWwtg==
X-Received: by 2002:a05:6a21:998f:b0:1c4:8294:3963 with SMTP id adf61e73a8af0-1c6fcedc911mr3652636637.24.1723138067279;
        Thu, 08 Aug 2024 10:27:47 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4403:e9e1:aefe:e6e8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2e89ffsm1349829b3a.180.2024.08.08.10.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 10:27:46 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Vojtech Pavlik <vojtech@ucw.cz>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: [RFC PATCH 3/5] Input: pc110pad - remove driver
Date: Thu,  8 Aug 2024 10:27:29 -0700
Message-ID: <20240808172733.1194442-4-dmitry.torokhov@gmail.com>
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

Palm Top PC 110 is a handheld personal computer with 80486SX CPU that
was released exclusively in Japan in September 1995.

While the kernel still supports 486 CPU it is highly unlikely that
anyone is using this device with the latest kernel.

Remove the driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/mouse/Kconfig    |  10 ---
 drivers/input/mouse/Makefile   |   1 -
 drivers/input/mouse/pc110pad.c | 160 ---------------------------------
 3 files changed, 171 deletions(-)
 delete mode 100644 drivers/input/mouse/pc110pad.c

diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
index f660e6ba24c2..7b7053c57588 100644
--- a/drivers/input/mouse/Kconfig
+++ b/drivers/input/mouse/Kconfig
@@ -312,16 +312,6 @@ config MOUSE_ELAN_I2C_SMBUS
 
 	   If unsure, say Y.
 
-config MOUSE_PC110PAD
-	tristate "IBM PC110 touchpad"
-	depends on ISA
-	help
-	  Say Y if you have the IBM PC-110 micro-notebook and want its
-	  touchpad supported.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called pc110pad.
-
 config MOUSE_AMIGA
 	tristate "Amiga mouse"
 	depends on AMIGA
diff --git a/drivers/input/mouse/Makefile b/drivers/input/mouse/Makefile
index e745b64fed49..4f9fb7d87a37 100644
--- a/drivers/input/mouse/Makefile
+++ b/drivers/input/mouse/Makefile
@@ -13,7 +13,6 @@ obj-$(CONFIG_MOUSE_CYAPA)		+= cyapatp.o
 obj-$(CONFIG_MOUSE_ELAN_I2C)		+= elan_i2c.o
 obj-$(CONFIG_MOUSE_GPIO)		+= gpio_mouse.o
 obj-$(CONFIG_MOUSE_MAPLE)		+= maplemouse.o
-obj-$(CONFIG_MOUSE_PC110PAD)		+= pc110pad.o
 obj-$(CONFIG_MOUSE_PS2)			+= psmouse.o
 obj-$(CONFIG_MOUSE_RISCPC)		+= rpcmouse.o
 obj-$(CONFIG_MOUSE_SERIAL)		+= sermouse.o
diff --git a/drivers/input/mouse/pc110pad.c b/drivers/input/mouse/pc110pad.c
deleted file mode 100644
index efa58049f746..000000000000
--- a/drivers/input/mouse/pc110pad.c
+++ /dev/null
@@ -1,160 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (c) 2000-2001 Vojtech Pavlik
- *
- *  Based on the work of:
- *	Alan Cox	Robin O'Leary
- */
-
-/*
- * IBM PC110 touchpad driver for Linux
- */
-
-#include <linux/module.h>
-#include <linux/kernel.h>
-#include <linux/errno.h>
-#include <linux/ioport.h>
-#include <linux/input.h>
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/pci.h>
-#include <linux/delay.h>
-
-#include <asm/io.h>
-#include <asm/irq.h>
-
-MODULE_AUTHOR("Vojtech Pavlik <vojtech@ucw.cz>");
-MODULE_DESCRIPTION("IBM PC110 touchpad driver");
-MODULE_LICENSE("GPL");
-
-#define PC110PAD_OFF	0x30
-#define PC110PAD_ON	0x38
-
-static int pc110pad_irq = 10;
-static int pc110pad_io = 0x15e0;
-
-static struct input_dev *pc110pad_dev;
-static int pc110pad_data[3];
-static int pc110pad_count;
-
-static irqreturn_t pc110pad_interrupt(int irq, void *ptr)
-{
-	int value     = inb_p(pc110pad_io);
-	int handshake = inb_p(pc110pad_io + 2);
-
-	outb(handshake |  1, pc110pad_io + 2);
-	udelay(2);
-	outb(handshake & ~1, pc110pad_io + 2);
-	udelay(2);
-	inb_p(0x64);
-
-	pc110pad_data[pc110pad_count++] = value;
-
-	if (pc110pad_count < 3)
-		return IRQ_HANDLED;
-
-	input_report_key(pc110pad_dev, BTN_TOUCH,
-		pc110pad_data[0] & 0x01);
-	input_report_abs(pc110pad_dev, ABS_X,
-		pc110pad_data[1] | ((pc110pad_data[0] << 3) & 0x80) | ((pc110pad_data[0] << 1) & 0x100));
-	input_report_abs(pc110pad_dev, ABS_Y,
-		pc110pad_data[2] | ((pc110pad_data[0] << 4) & 0x80));
-	input_sync(pc110pad_dev);
-
-	pc110pad_count = 0;
-	return IRQ_HANDLED;
-}
-
-static void pc110pad_close(struct input_dev *dev)
-{
-	outb(PC110PAD_OFF, pc110pad_io + 2);
-}
-
-static int pc110pad_open(struct input_dev *dev)
-{
-	pc110pad_interrupt(0, NULL);
-	pc110pad_interrupt(0, NULL);
-	pc110pad_interrupt(0, NULL);
-	outb(PC110PAD_ON, pc110pad_io + 2);
-	pc110pad_count = 0;
-
-	return 0;
-}
-
-/*
- * We try to avoid enabling the hardware if it's not
- * there, but we don't know how to test. But we do know
- * that the PC110 is not a PCI system. So if we find any
- * PCI devices in the machine, we don't have a PC110.
- */
-static int __init pc110pad_init(void)
-{
-	int err;
-
-	if (!no_pci_devices())
-		return -ENODEV;
-
-	if (!request_region(pc110pad_io, 4, "pc110pad")) {
-		printk(KERN_ERR "pc110pad: I/O area %#x-%#x in use.\n",
-				pc110pad_io, pc110pad_io + 4);
-		return -EBUSY;
-	}
-
-	outb(PC110PAD_OFF, pc110pad_io + 2);
-
-	if (request_irq(pc110pad_irq, pc110pad_interrupt, 0, "pc110pad", NULL)) {
-		printk(KERN_ERR "pc110pad: Unable to get irq %d.\n", pc110pad_irq);
-		err = -EBUSY;
-		goto err_release_region;
-	}
-
-	pc110pad_dev = input_allocate_device();
-	if (!pc110pad_dev) {
-		printk(KERN_ERR "pc110pad: Not enough memory.\n");
-		err = -ENOMEM;
-		goto err_free_irq;
-	}
-
-	pc110pad_dev->name = "IBM PC110 TouchPad";
-	pc110pad_dev->phys = "isa15e0/input0";
-	pc110pad_dev->id.bustype = BUS_ISA;
-	pc110pad_dev->id.vendor = 0x0003;
-	pc110pad_dev->id.product = 0x0001;
-	pc110pad_dev->id.version = 0x0100;
-
-	pc110pad_dev->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
-	pc110pad_dev->absbit[0] = BIT_MASK(ABS_X) | BIT_MASK(ABS_Y);
-	pc110pad_dev->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
-
-	input_abs_set_max(pc110pad_dev, ABS_X, 0x1ff);
-	input_abs_set_max(pc110pad_dev, ABS_Y, 0x0ff);
-
-	pc110pad_dev->open = pc110pad_open;
-	pc110pad_dev->close = pc110pad_close;
-
-	err = input_register_device(pc110pad_dev);
-	if (err)
-		goto err_free_dev;
-
-	return 0;
-
- err_free_dev:
-	input_free_device(pc110pad_dev);
- err_free_irq:
-	free_irq(pc110pad_irq, NULL);
- err_release_region:
-	release_region(pc110pad_io, 4);
-
-	return err;
-}
-
-static void __exit pc110pad_exit(void)
-{
-	outb(PC110PAD_OFF, pc110pad_io + 2);
-	free_irq(pc110pad_irq, NULL);
-	input_unregister_device(pc110pad_dev);
-	release_region(pc110pad_io, 4);
-}
-
-module_init(pc110pad_init);
-module_exit(pc110pad_exit);
-- 
2.46.0.76.ge559c4bf1a-goog


