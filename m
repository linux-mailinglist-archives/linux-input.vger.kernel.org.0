Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487272F2814
	for <lists+linux-input@lfdr.de>; Tue, 12 Jan 2021 06:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730137AbhALF5d (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jan 2021 00:57:33 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:11007 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727202AbhALF5d (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jan 2021 00:57:33 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DFKYx44g8zj5kG;
        Tue, 12 Jan 2021 13:55:49 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.202.10) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Tue, 12 Jan 2021 13:56:42 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>
CC:     <linuxarm@openeuler.org>, Barry Song <song.bao.hua@hisilicon.com>,
        "Daniel Quinlan" <quinlan@pathname.com>,
        Vojtech Pavlik <vojtech@suse.cz>
Subject: [PATCH v2] input - mk712: remove the driver as it is obsolete and causes kernel crash
Date:   Tue, 12 Jan 2021 18:51:29 +1300
Message-ID: <20210112055129.7840-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.126.202.10]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

While debugging other issues, I enabled mk712 then I got the below crash
during arm64 linux boot:
[    1.150412] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
[    1.150541] pc : logic_outb+0x3c/0xa8
[    1.150657] lr : mk712_init+0x74/0x1ec
[    1.150745] sp : ffff800011efbd40
[    1.150950] x29: ffff800011efbd40 x28: 0000000000000000
[    1.151098] x27: ffff800011681078 x26: ffff8000115d04b8
[    1.151192] x25: ffff8000116ff6b4 x24: ffff8000115bac10
[    1.151287] x23: ffff800011dfa000 x22: ffff800011b8dbe0
[    1.151421] x21: ffff800011eac000 x20: 0000000000000000
[    1.151527] x19: fffffbfffe800266 x18: 0000000000000000
[    1.151674] x17: ffff800010a7bc38 x16: ffff800010a7b0e0
[    1.151944] x15: 0000a0d665e7ee58 x14: 000000000000011a
[    1.152060] x13: 0000000000000001 x12: 0000000000000000
[    1.152149] x11: 0000000000000000 x10: 0000000000000a60
[    1.152291] x9 : 0000000000000000 x8 : ffff0000c0a2a480
[    1.152429] x7 : 0000000000000000 x6 : ffff0000c0b0c9b8
[    1.152522] x5 : 0000000000001000 x4 : ffff0000c03613b0
[    1.152614] x3 : 0000000000000267 x2 : 0000000000000260
[    1.152731] x1 : fffffbfffe800000 x0 : 0000000000ffbffe
[    1.153135] Call trace:
[    1.153342]  logic_outb+0x3c/0xa8
[    1.153434]  mk712_init+0x74/0x1ec
[    1.153571]  do_one_initcall+0x54/0x1b8
[    1.153705]  kernel_init_freeable+0x1d0/0x238
[    1.153860]  kernel_init+0x14/0x118
[    1.153960]  ret_from_fork+0x10/0x30
[    1.154304] Code: d2bfd001 f2df7fe1 f2ffffe1 8b010273 (39000274)
[    1.155013] ---[ end trace f9b157c311d20edd ]---
[    1.155854] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    1.156236] SMP: stopping secondary CPUs

The driver is very old and resources are totally hardcoded, no bus model.
And it seems there is no way to stop users from enabling it in Kconfig.
Plus, it is likely that there is no "Gateway AOL Connected Touchpad
computers" running 5.x kernel any more. So remove this driver.

Cc: Daniel Quinlan <quinlan@pathname.com>
Cc: Vojtech Pavlik <vojtech@suse.cz>
Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 drivers/input/touchscreen/Kconfig  |  11 --
 drivers/input/touchscreen/Makefile |   1 -
 drivers/input/touchscreen/mk712.c  | 215 -----------------------------
 3 files changed, 227 deletions(-)
 delete mode 100644 drivers/input/touchscreen/mk712.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index cc18f54ea887..0638ec5d1bd7 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -630,17 +630,6 @@ config TOUCHSCREEN_INEXIO
 	  To compile this driver as a module, choose M here: the
 	  module will be called inexio.
 
-config TOUCHSCREEN_MK712
-	tristate "ICS MicroClock MK712 touchscreen"
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
index 6233541e9173..75a60b8282b4 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -60,7 +60,6 @@ obj-$(CONFIG_TOUCHSCREEN_MELFAS_MIP4)	+= melfas_mip4.o
 obj-$(CONFIG_TOUCHSCREEN_MIGOR)		+= migor_ts.o
 obj-$(CONFIG_TOUCHSCREEN_MMS114)	+= mms114.o
 obj-$(CONFIG_TOUCHSCREEN_MTOUCH)	+= mtouch.o
-obj-$(CONFIG_TOUCHSCREEN_MK712)		+= mk712.o
 obj-$(CONFIG_TOUCHSCREEN_HP600)		+= hp680_ts_input.o
 obj-$(CONFIG_TOUCHSCREEN_HP7XX)		+= jornada720_ts.o
 obj-$(CONFIG_TOUCHSCREEN_IPAQ_MICRO)	+= ipaq-micro-ts.o
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
2.25.1

