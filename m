Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FD211FC68D
	for <lists+linux-input@lfdr.de>; Wed, 17 Jun 2020 09:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725773AbgFQHA6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jun 2020 03:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbgFQHAx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jun 2020 03:00:53 -0400
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 17 Jun 2020 00:00:52 PDT
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E4CC061573
        for <linux-input@vger.kernel.org>; Wed, 17 Jun 2020 00:00:51 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:b57b:2191:a081:571d])
        by laurent.telenet-ops.be with bizsmtp
        id s6vm2200J1Jlgh2016vmGp; Wed, 17 Jun 2020 08:55:47 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jlRz8-0007Mj-Dh; Wed, 17 Jun 2020 08:55:46 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jlRz8-0006j4-Cb; Wed, 17 Jun 2020 08:55:46 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-sh@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] sh: Remove SH5-based Cayman platform
Date:   Wed, 17 Jun 2020 08:55:38 +0200
Message-Id: <20200617065539.25805-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200617065539.25805-1-geert+renesas@glider.be>
References: <20200617065539.25805-1-geert+renesas@glider.be>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since the removal of core support for SH5, Cayman support can no longer
be selected.

Fixes: 37744feebc086908 ("sh: remove sh5 support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/sh/Kconfig                     |   5 +-
 arch/sh/Makefile                    |   5 -
 arch/sh/boards/Kconfig              |   6 -
 arch/sh/boards/mach-cayman/Makefile |   5 -
 arch/sh/boards/mach-cayman/irq.c    | 148 -----------------------
 arch/sh/boards/mach-cayman/panic.c  |  46 -------
 arch/sh/boards/mach-cayman/setup.c  | 181 ----------------------------
 arch/sh/configs/cayman_defconfig    |  66 ----------
 arch/sh/drivers/pci/Makefile        |   1 -
 arch/sh/drivers/pci/fixups-cayman.c |  78 ------------
 arch/sh/tools/mach-types            |   1 -
 11 files changed, 2 insertions(+), 540 deletions(-)
 delete mode 100644 arch/sh/boards/mach-cayman/Makefile
 delete mode 100644 arch/sh/boards/mach-cayman/irq.c
 delete mode 100644 arch/sh/boards/mach-cayman/panic.c
 delete mode 100644 arch/sh/boards/mach-cayman/setup.c
 delete mode 100644 arch/sh/configs/cayman_defconfig
 delete mode 100644 arch/sh/drivers/pci/fixups-cayman.c

diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 9fc2b010e938c94a..d8b097cbb6ed182a 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -123,8 +123,8 @@ config ARCH_HAS_ILOG2_U64
 
 config NO_IOPORT_MAP
 	def_bool !PCI
-	depends on !SH_CAYMAN && !SH_SH4202_MICRODEV && !SH_SHMIN && \
-		   !SH_HP6XX && !SH_SOLUTION_ENGINE
+	depends on !SH_SH4202_MICRODEV && !SH_SHMIN && !SH_HP6XX && \
+		   !SH_SOLUTION_ENGINE
 
 config IO_TRAPPED
 	bool
@@ -726,7 +726,6 @@ config ZERO_PAGE_OFFSET
 config BOOT_LINK_OFFSET
 	hex
 	default "0x00210000" if SH_SHMIN
-	default "0x00400000" if SH_CAYMAN
 	default "0x00810000" if SH_7780_SOLUTION_ENGINE
 	default "0x009e0000" if SH_TITAN
 	default "0x01800000" if SH_SDK7780
diff --git a/arch/sh/Makefile b/arch/sh/Makefile
index da9cf952f33c1520..2faebfd72ecab5a4 100644
--- a/arch/sh/Makefile
+++ b/arch/sh/Makefile
@@ -15,11 +15,7 @@ ifneq ($(SUBARCH),$(ARCH))
   endif
 endif
 
-ifeq ($(ARCH),sh)
 KBUILD_DEFCONFIG	:= shx3_defconfig
-else
-KBUILD_DEFCONFIG	:= cayman_defconfig
-endif
 
 isa-y					:= any
 isa-$(CONFIG_SH_DSP)			:= sh
@@ -143,7 +139,6 @@ machdir-$(CONFIG_SH_SH7763RDP)			+= mach-sh7763rdp
 machdir-$(CONFIG_SH_SH4202_MICRODEV)		+= mach-microdev
 machdir-$(CONFIG_SH_LANDISK)			+= mach-landisk
 machdir-$(CONFIG_SH_LBOX_RE2)			+= mach-lboxre2
-machdir-$(CONFIG_SH_CAYMAN)			+= mach-cayman
 machdir-$(CONFIG_SH_RSK)			+= mach-rsk
 
 ifneq ($(machdir-y),)
diff --git a/arch/sh/boards/Kconfig b/arch/sh/boards/Kconfig
index fb0ca0c1efe11dce..83bcb6d2dacadd4a 100644
--- a/arch/sh/boards/Kconfig
+++ b/arch/sh/boards/Kconfig
@@ -340,12 +340,6 @@ config SH_MAGIC_PANEL_R2
 	help
 	  Select Magic Panel R2 if configuring for Magic Panel R2.
 
-config SH_CAYMAN
-	bool "Hitachi Cayman"
-	depends on CPU_SUBTYPE_SH5_101 || CPU_SUBTYPE_SH5_103
-	select HAVE_PCI
-	select ARCH_MIGHT_HAVE_PC_SERIO
-
 config SH_POLARIS
 	bool "SMSC Polaris"
 	select CPU_HAS_IPR_IRQ
diff --git a/arch/sh/boards/mach-cayman/Makefile b/arch/sh/boards/mach-cayman/Makefile
deleted file mode 100644
index 775a4be57434b6a4..0000000000000000
--- a/arch/sh/boards/mach-cayman/Makefile
+++ /dev/null
@@ -1,5 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Makefile for the Hitachi Cayman specific parts of the kernel
-#
-obj-y := setup.o irq.o panic.o
diff --git a/arch/sh/boards/mach-cayman/irq.c b/arch/sh/boards/mach-cayman/irq.c
deleted file mode 100644
index 0305d0b51730015d..0000000000000000
--- a/arch/sh/boards/mach-cayman/irq.c
+++ /dev/null
@@ -1,148 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * arch/sh/mach-cayman/irq.c - SH-5 Cayman Interrupt Support
- *
- * This file handles the board specific parts of the Cayman interrupt system
- *
- * Copyright (C) 2002 Stuart Menefy
- */
-#include <linux/io.h>
-#include <linux/irq.h>
-#include <linux/interrupt.h>
-#include <linux/signal.h>
-#include <cpu/irq.h>
-#include <asm/page.h>
-
-/* Setup for the SMSC FDC37C935 / LAN91C100FD */
-#define SMSC_IRQ         IRQ_IRL1
-
-/* Setup for PCI Bus 2, which transmits interrupts via the EPLD */
-#define PCI2_IRQ         IRQ_IRL3
-
-unsigned long epld_virt;
-
-#define EPLD_BASE        0x04002000
-#define EPLD_STATUS_BASE (epld_virt + 0x10)
-#define EPLD_MASK_BASE   (epld_virt + 0x20)
-
-/* Note the SMSC SuperIO chip and SMSC LAN chip interrupts are all muxed onto
-   the same SH-5 interrupt */
-
-static irqreturn_t cayman_interrupt_smsc(int irq, void *dev_id)
-{
-        printk(KERN_INFO "CAYMAN: spurious SMSC interrupt\n");
-	return IRQ_NONE;
-}
-
-static irqreturn_t cayman_interrupt_pci2(int irq, void *dev_id)
-{
-        printk(KERN_INFO "CAYMAN: spurious PCI interrupt, IRQ %d\n", irq);
-	return IRQ_NONE;
-}
-
-static void enable_cayman_irq(struct irq_data *data)
-{
-	unsigned int irq = data->irq;
-	unsigned long flags;
-	unsigned long mask;
-	unsigned int reg;
-	unsigned char bit;
-
-	irq -= START_EXT_IRQS;
-	reg = EPLD_MASK_BASE + ((irq / 8) << 2);
-	bit = 1<<(irq % 8);
-	local_irq_save(flags);
-	mask = __raw_readl(reg);
-	mask |= bit;
-	__raw_writel(mask, reg);
-	local_irq_restore(flags);
-}
-
-static void disable_cayman_irq(struct irq_data *data)
-{
-	unsigned int irq = data->irq;
-	unsigned long flags;
-	unsigned long mask;
-	unsigned int reg;
-	unsigned char bit;
-
-	irq -= START_EXT_IRQS;
-	reg = EPLD_MASK_BASE + ((irq / 8) << 2);
-	bit = 1<<(irq % 8);
-	local_irq_save(flags);
-	mask = __raw_readl(reg);
-	mask &= ~bit;
-	__raw_writel(mask, reg);
-	local_irq_restore(flags);
-}
-
-struct irq_chip cayman_irq_type = {
-	.name		= "Cayman-IRQ",
-	.irq_unmask	= enable_cayman_irq,
-	.irq_mask	= disable_cayman_irq,
-};
-
-int cayman_irq_demux(int evt)
-{
-	int irq = intc_evt_to_irq[evt];
-
-	if (irq == SMSC_IRQ) {
-		unsigned long status;
-		int i;
-
-		status = __raw_readl(EPLD_STATUS_BASE) &
-			 __raw_readl(EPLD_MASK_BASE) & 0xff;
-		if (status == 0) {
-			irq = -1;
-		} else {
-			for (i=0; i<8; i++) {
-				if (status & (1<<i))
-					break;
-			}
-			irq = START_EXT_IRQS + i;
-		}
-	}
-
-	if (irq == PCI2_IRQ) {
-		unsigned long status;
-		int i;
-
-		status = __raw_readl(EPLD_STATUS_BASE + 3 * sizeof(u32)) &
-			 __raw_readl(EPLD_MASK_BASE + 3 * sizeof(u32)) & 0xff;
-		if (status == 0) {
-			irq = -1;
-		} else {
-			for (i=0; i<8; i++) {
-				if (status & (1<<i))
-					break;
-			}
-			irq = START_EXT_IRQS + (3 * 8) + i;
-		}
-	}
-
-	return irq;
-}
-
-void init_cayman_irq(void)
-{
-	int i;
-
-	epld_virt = (unsigned long)ioremap(EPLD_BASE, 1024);
-	if (!epld_virt) {
-		printk(KERN_ERR "Cayman IRQ: Unable to remap EPLD\n");
-		return;
-	}
-
-	for (i = 0; i < NR_EXT_IRQS; i++) {
-		irq_set_chip_and_handler(START_EXT_IRQS + i,
-					 &cayman_irq_type, handle_level_irq);
-	}
-
-	/* Setup the SMSC interrupt */
-	if (request_irq(SMSC_IRQ, cayman_interrupt_smsc, 0, "Cayman SMSC Mux",
-			NULL))
-		pr_err("Failed to register Cayman SMSC Mux interrupt\n");
-	if (request_irq(PCI2_IRQ, cayman_interrupt_pci2, 0, "Cayman PCI2 Mux",
-			NULL))
-		pr_err("Failed to register Cayman PCI2 Mux interrupt\n");
-}
diff --git a/arch/sh/boards/mach-cayman/panic.c b/arch/sh/boards/mach-cayman/panic.c
deleted file mode 100644
index cfc46314e7d98c7d..0000000000000000
--- a/arch/sh/boards/mach-cayman/panic.c
+++ /dev/null
@@ -1,46 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2003  Richard Curnow, SuperH UK Limited
- */
-
-#include <linux/kernel.h>
-#include <linux/io.h>
-#include <cpu/registers.h>
-
-/* THIS IS A PHYSICAL ADDRESS */
-#define HDSP2534_ADDR (0x04002100)
-
-static void poor_mans_delay(void)
-{
-	int i;
-
-	for (i = 0; i < 2500000; i++)
-		cpu_relax();
-}
-
-static void show_value(unsigned long x)
-{
-	int i;
-	unsigned nibble;
-	for (i = 0; i < 8; i++) {
-		nibble = ((x >> (i * 4)) & 0xf);
-
-		__raw_writeb(nibble + ((nibble > 9) ? 55 : 48),
-			  HDSP2534_ADDR + 0xe0 + ((7 - i) << 2));
-	}
-}
-
-void
-panic_handler(unsigned long panicPC, unsigned long panicSSR,
-	      unsigned long panicEXPEVT)
-{
-	while (1) {
-		/* This piece of code displays the PC on the LED display */
-		show_value(panicPC);
-		poor_mans_delay();
-		show_value(panicSSR);
-		poor_mans_delay();
-		show_value(panicEXPEVT);
-		poor_mans_delay();
-	}
-}
diff --git a/arch/sh/boards/mach-cayman/setup.c b/arch/sh/boards/mach-cayman/setup.c
deleted file mode 100644
index 8ef76e288da00cbf..0000000000000000
--- a/arch/sh/boards/mach-cayman/setup.c
+++ /dev/null
@@ -1,181 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * arch/sh/mach-cayman/setup.c
- *
- * SH5 Cayman support
- *
- * Copyright (C) 2002  David J. Mckay & Benedict Gaster
- * Copyright (C) 2003 - 2007  Paul Mundt
- */
-#include <linux/init.h>
-#include <linux/io.h>
-#include <linux/kernel.h>
-#include <cpu/irq.h>
-
-/*
- * Platform Dependent Interrupt Priorities.
- */
-
-/* Using defaults defined in irq.h */
-#define	RES NO_PRIORITY		/* Disabled */
-#define IR0 IRL0_PRIORITY	/* IRLs */
-#define IR1 IRL1_PRIORITY
-#define IR2 IRL2_PRIORITY
-#define IR3 IRL3_PRIORITY
-#define PCA INTA_PRIORITY	/* PCI Ints */
-#define PCB INTB_PRIORITY
-#define PCC INTC_PRIORITY
-#define PCD INTD_PRIORITY
-#define SER TOP_PRIORITY
-#define ERR TOP_PRIORITY
-#define PW0 TOP_PRIORITY
-#define PW1 TOP_PRIORITY
-#define PW2 TOP_PRIORITY
-#define PW3 TOP_PRIORITY
-#define DM0 NO_PRIORITY		/* DMA Ints */
-#define DM1 NO_PRIORITY
-#define DM2 NO_PRIORITY
-#define DM3 NO_PRIORITY
-#define DAE NO_PRIORITY
-#define TU0 TIMER_PRIORITY	/* TMU Ints */
-#define TU1 NO_PRIORITY
-#define TU2 NO_PRIORITY
-#define TI2 NO_PRIORITY
-#define ATI NO_PRIORITY		/* RTC Ints */
-#define PRI NO_PRIORITY
-#define CUI RTC_PRIORITY
-#define ERI SCIF_PRIORITY	/* SCIF Ints */
-#define RXI SCIF_PRIORITY
-#define BRI SCIF_PRIORITY
-#define TXI SCIF_PRIORITY
-#define ITI TOP_PRIORITY	/* WDT Ints */
-
-/* Setup for the SMSC FDC37C935 */
-#define SMSC_SUPERIO_BASE	0x04000000
-#define SMSC_CONFIG_PORT_ADDR	0x3f0
-#define SMSC_INDEX_PORT_ADDR	SMSC_CONFIG_PORT_ADDR
-#define SMSC_DATA_PORT_ADDR	0x3f1
-
-#define SMSC_ENTER_CONFIG_KEY	0x55
-#define SMSC_EXIT_CONFIG_KEY	0xaa
-
-#define SMCS_LOGICAL_DEV_INDEX	0x07
-#define SMSC_DEVICE_ID_INDEX	0x20
-#define SMSC_DEVICE_REV_INDEX	0x21
-#define SMSC_ACTIVATE_INDEX	0x30
-#define SMSC_PRIMARY_BASE_INDEX  0x60
-#define SMSC_SECONDARY_BASE_INDEX 0x62
-#define SMSC_PRIMARY_INT_INDEX	0x70
-#define SMSC_SECONDARY_INT_INDEX 0x72
-
-#define SMSC_IDE1_DEVICE	1
-#define SMSC_KEYBOARD_DEVICE	7
-#define SMSC_CONFIG_REGISTERS	8
-
-#define SMSC_SUPERIO_READ_INDEXED(index) ({ \
-	outb((index), SMSC_INDEX_PORT_ADDR); \
-	inb(SMSC_DATA_PORT_ADDR); })
-#define SMSC_SUPERIO_WRITE_INDEXED(val, index) ({ \
-	outb((index), SMSC_INDEX_PORT_ADDR); \
-	outb((val),   SMSC_DATA_PORT_ADDR); })
-
-#define IDE1_PRIMARY_BASE	0x01f0
-#define IDE1_SECONDARY_BASE	0x03f6
-
-unsigned long smsc_superio_virt;
-
-int platform_int_priority[NR_INTC_IRQS] = {
-	IR0, IR1, IR2, IR3, PCA, PCB, PCC, PCD,	/* IRQ  0- 7 */
-	RES, RES, RES, RES, SER, ERR, PW3, PW2,	/* IRQ  8-15 */
-	PW1, PW0, DM0, DM1, DM2, DM3, DAE, RES,	/* IRQ 16-23 */
-	RES, RES, RES, RES, RES, RES, RES, RES,	/* IRQ 24-31 */
-	TU0, TU1, TU2, TI2, ATI, PRI, CUI, ERI,	/* IRQ 32-39 */
-	RXI, BRI, TXI, RES, RES, RES, RES, RES,	/* IRQ 40-47 */
-	RES, RES, RES, RES, RES, RES, RES, RES,	/* IRQ 48-55 */
-	RES, RES, RES, RES, RES, RES, RES, ITI,	/* IRQ 56-63 */
-};
-
-static int __init smsc_superio_setup(void)
-{
-	unsigned char devid, devrev;
-
-	smsc_superio_virt = (unsigned long)ioremap(SMSC_SUPERIO_BASE, 1024);
-	if (!smsc_superio_virt) {
-		panic("Unable to remap SMSC SuperIO\n");
-	}
-
-	/* Initially the chip is in run state */
-	/* Put it into configuration state */
-	outb(SMSC_ENTER_CONFIG_KEY, SMSC_CONFIG_PORT_ADDR);
-	outb(SMSC_ENTER_CONFIG_KEY, SMSC_CONFIG_PORT_ADDR);
-
-	/* Read device ID info */
-	devid = SMSC_SUPERIO_READ_INDEXED(SMSC_DEVICE_ID_INDEX);
-	devrev = SMSC_SUPERIO_READ_INDEXED(SMSC_DEVICE_REV_INDEX);
-	printk("SMSC SuperIO devid %02x rev %02x\n", devid, devrev);
-
-	/* Select the keyboard device */
-	SMSC_SUPERIO_WRITE_INDEXED(SMSC_KEYBOARD_DEVICE, SMCS_LOGICAL_DEV_INDEX);
-
-	/* enable it */
-	SMSC_SUPERIO_WRITE_INDEXED(1, SMSC_ACTIVATE_INDEX);
-
-	/* Select the interrupts */
-	/* On a PC keyboard is IRQ1, mouse is IRQ12 */
-	SMSC_SUPERIO_WRITE_INDEXED(1, SMSC_PRIMARY_INT_INDEX);
-	SMSC_SUPERIO_WRITE_INDEXED(12, SMSC_SECONDARY_INT_INDEX);
-
-	/*
-	 * Only IDE1 exists on the Cayman
-	 */
-
-	/* Power it on */
-	SMSC_SUPERIO_WRITE_INDEXED(1 << SMSC_IDE1_DEVICE, 0x22);
-
-	SMSC_SUPERIO_WRITE_INDEXED(SMSC_IDE1_DEVICE, SMCS_LOGICAL_DEV_INDEX);
-	SMSC_SUPERIO_WRITE_INDEXED(1, SMSC_ACTIVATE_INDEX);
-
-	SMSC_SUPERIO_WRITE_INDEXED(IDE1_PRIMARY_BASE >> 8,
-				   SMSC_PRIMARY_BASE_INDEX + 0);
-	SMSC_SUPERIO_WRITE_INDEXED(IDE1_PRIMARY_BASE & 0xff,
-				   SMSC_PRIMARY_BASE_INDEX + 1);
-
-	SMSC_SUPERIO_WRITE_INDEXED(IDE1_SECONDARY_BASE >> 8,
-				   SMSC_SECONDARY_BASE_INDEX + 0);
-	SMSC_SUPERIO_WRITE_INDEXED(IDE1_SECONDARY_BASE & 0xff,
-				   SMSC_SECONDARY_BASE_INDEX + 1);
-
-	SMSC_SUPERIO_WRITE_INDEXED(14, SMSC_PRIMARY_INT_INDEX);
-
-	SMSC_SUPERIO_WRITE_INDEXED(SMSC_CONFIG_REGISTERS,
-				   SMCS_LOGICAL_DEV_INDEX);
-
-	SMSC_SUPERIO_WRITE_INDEXED(0x00, 0xc2); /* GP42 = nIDE1_OE */
-	SMSC_SUPERIO_WRITE_INDEXED(0x01, 0xc5); /* GP45 = IDE1_IRQ */
-	SMSC_SUPERIO_WRITE_INDEXED(0x00, 0xc6); /* GP46 = nIOROP */
-	SMSC_SUPERIO_WRITE_INDEXED(0x00, 0xc7); /* GP47 = nIOWOP */
-
-	/* Exit the configuration state */
-	outb(SMSC_EXIT_CONFIG_KEY, SMSC_CONFIG_PORT_ADDR);
-
-	return 0;
-}
-device_initcall(smsc_superio_setup);
-
-static void __iomem *cayman_ioport_map(unsigned long port, unsigned int len)
-{
-	if (port < 0x400) {
-		extern unsigned long smsc_superio_virt;
-		return (void __iomem *)((port << 2) | smsc_superio_virt);
-	}
-
-	return (void __iomem *)port;
-}
-
-extern void init_cayman_irq(void);
-
-static struct sh_machine_vector mv_cayman __initmv = {
-	.mv_name		= "Hitachi Cayman",
-	.mv_ioport_map		= cayman_ioport_map,
-	.mv_init_irq		= init_cayman_irq,
-};
diff --git a/arch/sh/configs/cayman_defconfig b/arch/sh/configs/cayman_defconfig
deleted file mode 100644
index 911437c163c76af5..0000000000000000
--- a/arch/sh/configs/cayman_defconfig
+++ /dev/null
@@ -1,66 +0,0 @@
-CONFIG_POSIX_MQUEUE=y
-CONFIG_LOG_BUF_SHIFT=14
-# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
-CONFIG_SLAB=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_FORCE_MAX_ZONEORDER=11
-CONFIG_MEMORY_START=0x80000000
-CONFIG_MEMORY_SIZE=0x00400000
-CONFIG_FLATMEM_MANUAL=y
-CONFIG_CACHE_OFF=y
-CONFIG_SH_PCLK_FREQ=50000000
-CONFIG_HEARTBEAT=y
-CONFIG_PREEMPT=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_INET=y
-CONFIG_IP_PNP=y
-# CONFIG_IPV6 is not set
-# CONFIG_FW_LOADER is not set
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_RAM=y
-CONFIG_SCSI=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_SCSI_MULTI_LUN=y
-CONFIG_SCSI_SPI_ATTRS=y
-CONFIG_NETDEVICES=y
-CONFIG_NET_ETHERNET=y
-# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-CONFIG_HW_RANDOM=y
-CONFIG_I2C=m
-CONFIG_WATCHDOG=y
-CONFIG_FB=y
-CONFIG_FIRMWARE_EDID=y
-CONFIG_FB_MODE_HELPERS=y
-CONFIG_FB_SH_MOBILE_LCDC=m
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_FONTS=y
-CONFIG_FONT_8x16=y
-CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
-# CONFIG_LOGO_LINUX_CLUT224 is not set
-# CONFIG_LOGO_SUPERH_MONO is not set
-# CONFIG_LOGO_SUPERH_VGA16 is not set
-CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
-# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-CONFIG_MINIX_FS=y
-CONFIG_ROMFS_FS=y
-CONFIG_NFS_FS=y
-CONFIG_NFS_V3=y
-CONFIG_ROOT_NFS=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_FS=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_DETECT_HUNG_TASK=y
-CONFIG_SCHEDSTATS=y
-CONFIG_FRAME_POINTER=y
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
diff --git a/arch/sh/drivers/pci/Makefile b/arch/sh/drivers/pci/Makefile
index a5c1e9066f831481..d313fd3ce7091e03 100644
--- a/arch/sh/drivers/pci/Makefile
+++ b/arch/sh/drivers/pci/Makefile
@@ -25,4 +25,3 @@ obj-$(CONFIG_SH_7780_SOLUTION_ENGINE)	+= fixups-sdk7780.o
 obj-$(CONFIG_SH_TITAN)			+= fixups-titan.o
 obj-$(CONFIG_SH_LANDISK)		+= fixups-landisk.o
 obj-$(CONFIG_SH_LBOX_RE2)		+= fixups-rts7751r2d.o
-obj-$(CONFIG_SH_CAYMAN)			+= fixups-cayman.o
diff --git a/arch/sh/drivers/pci/fixups-cayman.c b/arch/sh/drivers/pci/fixups-cayman.c
deleted file mode 100644
index c797bfbe2e983c60..0000000000000000
--- a/arch/sh/drivers/pci/fixups-cayman.c
+++ /dev/null
@@ -1,78 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/pci.h>
-#include <linux/types.h>
-#include <cpu/irq.h>
-#include "pci-sh5.h"
-
-int pcibios_map_platform_irq(const struct pci_dev *dev, u8 slot, u8 pin)
-{
-	int result = -1;
-
-	/* The complication here is that the PCI IRQ lines from the Cayman's 2
-	   5V slots get into the CPU via a different path from the IRQ lines
-	   from the 3 3.3V slots.  Thus, we have to detect whether the card's
-	   interrupts go via the 5V or 3.3V path, i.e. the 'bridge swizzling'
-	   at the point where we cross from 5V to 3.3V is not the normal case.
-
-	   The added complication is that we don't know that the 5V slots are
-	   always bus 2, because a card containing a PCI-PCI bridge may be
-	   plugged into a 3.3V slot, and this changes the bus numbering.
-
-	   Also, the Cayman has an intermediate PCI bus that goes a custom
-	   expansion board header (and to the secondary bridge).  This bus has
-	   never been used in practice.
-
-	   The 1ary onboard PCI-PCI bridge is device 3 on bus 0
-	   The 2ary onboard PCI-PCI bridge is device 0 on the 2ary bus of
-	   the 1ary bridge.
-	   */
-
-	struct slot_pin {
-		int slot;
-		int pin;
-	} path[4];
-	int i=0;
-
-	while (dev->bus->number > 0) {
-
-		slot = path[i].slot = PCI_SLOT(dev->devfn);
-		pin = path[i].pin = pci_swizzle_interrupt_pin(dev, pin);
-		dev = dev->bus->self;
-		i++;
-		if (i > 3) panic("PCI path to root bus too long!\n");
-	}
-
-	slot = PCI_SLOT(dev->devfn);
-	/* This is the slot on bus 0 through which the device is eventually
-	   reachable. */
-
-	/* Now work back up. */
-	if ((slot < 3) || (i == 0)) {
-		/* Bus 0 (incl. PCI-PCI bridge itself) : perform the final
-		   swizzle now. */
-		result = IRQ_INTA + pci_swizzle_interrupt_pin(dev, pin) - 1;
-	} else {
-		i--;
-		slot = path[i].slot;
-		pin  = path[i].pin;
-		if (slot > 0) {
-			panic("PCI expansion bus device found - not handled!\n");
-		} else {
-			if (i > 0) {
-				/* 5V slots */
-				i--;
-				slot = path[i].slot;
-				pin  = path[i].pin;
-				/* 'pin' was swizzled earlier wrt slot, don't do it again. */
-				result = IRQ_P2INTA + (pin - 1);
-			} else {
-				/* IRQ for 2ary PCI-PCI bridge : unused */
-				result = -1;
-			}
-		}
-	}
-
-	return result;
-}
diff --git a/arch/sh/tools/mach-types b/arch/sh/tools/mach-types
index 569977e52c91dbac..29e648855d509f6a 100644
--- a/arch/sh/tools/mach-types
+++ b/arch/sh/tools/mach-types
@@ -46,7 +46,6 @@ X3PROTO			SH_X3PROTO
 MAGICPANELR2		SH_MAGIC_PANEL_R2
 R2D_PLUS		RTS7751R2D_PLUS
 R2D_1			RTS7751R2D_1
-CAYMAN			SH_CAYMAN
 SDK7780			SH_SDK7780
 MIGOR			SH_MIGOR
 RSK7201			SH_RSK7201
-- 
2.17.1

