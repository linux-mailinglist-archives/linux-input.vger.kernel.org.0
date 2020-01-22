Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8EAA14571A
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2020 14:52:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbgAVNw3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jan 2020 08:52:29 -0500
Received: from mx2.suse.de ([195.135.220.15]:55844 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbgAVNw2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jan 2020 08:52:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 70E34AF2B;
        Wed, 22 Jan 2020 13:52:26 +0000 (UTC)
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v2] Input: add IOC3 serio driver
Date:   Wed, 22 Jan 2020 14:52:20 +0100
Message-Id: <20200122135220.22354-1-tbogendoerfer@suse.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds a platform driver for supporting keyboard and mouse
interface of SGI IOC3 chips.

Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
---
Changes in v2:
 - track that serio is started before pushing data to it

 drivers/input/serio/Kconfig   |  10 ++
 drivers/input/serio/Makefile  |   1 +
 drivers/input/serio/ioc3kbd.c | 214 ++++++++++++++++++++++++++++++++++
 3 files changed, 225 insertions(+)
 create mode 100644 drivers/input/serio/ioc3kbd.c

diff --git a/drivers/input/serio/Kconfig b/drivers/input/serio/Kconfig
index f3e18f8ef9ca..373a1646019e 100644
--- a/drivers/input/serio/Kconfig
+++ b/drivers/input/serio/Kconfig
@@ -165,6 +165,16 @@ config SERIO_MACEPS2
 	  To compile this driver as a module, choose M here: the
 	  module will be called maceps2.
 
+config SERIO_SGI_IOC3
+	tristate "SGI IOC3 PS/2 controller"
+	depends on SGI_MFD_IOC3
+	help
+	  Say Y here if you have an SGI Onyx2, SGI Octane or IOC3 PCI card
+	  and you want to attach and use a keyboard, mouse, or both.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ioc3kbd.
+
 config SERIO_LIBPS2
 	tristate "PS/2 driver library"
 	depends on SERIO_I8042 || SERIO_I8042=n
diff --git a/drivers/input/serio/Makefile b/drivers/input/serio/Makefile
index 67950a5ccb3f..6d97bad7b844 100644
--- a/drivers/input/serio/Makefile
+++ b/drivers/input/serio/Makefile
@@ -20,6 +20,7 @@ obj-$(CONFIG_HIL_MLC)		+= hp_sdc_mlc.o hil_mlc.o
 obj-$(CONFIG_SERIO_PCIPS2)	+= pcips2.o
 obj-$(CONFIG_SERIO_PS2MULT)	+= ps2mult.o
 obj-$(CONFIG_SERIO_MACEPS2)	+= maceps2.o
+obj-$(CONFIG_SERIO_SGI_IOC3)	+= ioc3kbd.o
 obj-$(CONFIG_SERIO_LIBPS2)	+= libps2.o
 obj-$(CONFIG_SERIO_RAW)		+= serio_raw.o
 obj-$(CONFIG_SERIO_AMS_DELTA)	+= ams_delta_serio.o
diff --git a/drivers/input/serio/ioc3kbd.c b/drivers/input/serio/ioc3kbd.c
new file mode 100644
index 000000000000..3decbaff40cc
--- /dev/null
+++ b/drivers/input/serio/ioc3kbd.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * SGI IOC3 PS/2 controller driver for linux
+ *
+ * Copyright (C) 2019 Thomas Bogendoerfer <tbogendoerfer@suse.de>
+ *
+ * Based on code Copyright (C) 2005 Stanislaw Skowronek <skylark@unaligned.org>
+ *               Copyright (C) 2009 Johannes Dickgreber <tanzy@gmx.de>
+ */
+
+#include <linux/delay.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/serio.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#include <asm/sn/ioc3.h>
+
+struct ioc3kbd_data {
+	struct ioc3_serioregs __iomem *regs;
+	struct serio *kbd, *aux;
+	bool kbd_exists, aux_exists;
+	int irq;
+};
+
+static int ioc3kbd_wait(struct ioc3_serioregs __iomem *regs, u32 mask)
+{
+	unsigned long timeout = 0;
+
+	while ((readl(&regs->km_csr) & mask) && (timeout < 250)) {
+		udelay(50);
+		timeout++;
+	}
+	return (timeout >= 250) ? -ETIMEDOUT : 0;
+}
+
+static int ioc3kbd_write(struct serio *dev, u8 val)
+{
+	struct ioc3kbd_data *d = dev->port_data;
+	int ret;
+
+	ret = ioc3kbd_wait(d->regs, KM_CSR_K_WRT_PEND);
+	if (ret)
+		return ret;
+
+	writel(val, &d->regs->k_wd);
+
+	return 0;
+}
+
+static int ioc3kbd_start(struct serio *dev)
+{
+	struct ioc3kbd_data *d = dev->port_data;
+
+	d->kbd_exists = true;
+	return 0;
+}
+
+static void ioc3kbd_stop(struct serio *dev)
+{
+	struct ioc3kbd_data *d = dev->port_data;
+
+	d->kbd_exists = false;
+}
+
+static int ioc3aux_write(struct serio *dev, u8 val)
+{
+	struct ioc3kbd_data *d = dev->port_data;
+	int ret;
+
+	ret = ioc3kbd_wait(d->regs, KM_CSR_M_WRT_PEND);
+	if (ret)
+		return ret;
+
+	writel(val, &d->regs->m_wd);
+
+	return 0;
+}
+
+static int ioc3aux_start(struct serio *dev)
+{
+	struct ioc3kbd_data *d = dev->port_data;
+
+	d->aux_exists = true;
+	return 0;
+}
+
+static void ioc3aux_stop(struct serio *dev)
+{
+	struct ioc3kbd_data *d = dev->port_data;
+
+	d->aux_exists = false;
+}
+
+static void ioc3kbd_process_data(struct serio *dev, u32 data)
+{
+	if (data & KM_RD_VALID_0)
+		serio_interrupt(dev, (data >> KM_RD_DATA_0_SHIFT) & 0xff, 0);
+	if (data & KM_RD_VALID_1)
+		serio_interrupt(dev, (data >> KM_RD_DATA_1_SHIFT) & 0xff, 0);
+	if (data & KM_RD_VALID_2)
+		serio_interrupt(dev, (data >> KM_RD_DATA_2_SHIFT) & 0xff, 0);
+}
+
+static irqreturn_t ioc3kbd_intr(int itq, void *dev_id)
+{
+	struct ioc3kbd_data *d = dev_id;
+	u32 data_k, data_m;
+
+	data_k = readl(&d->regs->k_rd);
+	if (d->kbd_exists)
+		ioc3kbd_process_data(d->kbd, data_k);
+
+	data_m = readl(&d->regs->m_rd);
+	if (d->aux_exists)
+		ioc3kbd_process_data(d->aux, data_m);
+
+	return IRQ_HANDLED;
+}
+
+static int ioc3kbd_probe(struct platform_device *pdev)
+{
+	struct ioc3_serioregs __iomem *regs;
+	struct device *dev = &pdev->dev;
+	struct ioc3kbd_data *d;
+	struct serio *sk, *sa;
+	int irq, ret;
+
+	regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return -ENXIO;
+
+	d = devm_kzalloc(dev, sizeof(*d), GFP_KERNEL);
+	if (!d)
+		return -ENOMEM;
+
+	sk = kzalloc(sizeof(*sk), GFP_KERNEL);
+	if (!sk)
+		return -ENOMEM;
+
+	sa = kzalloc(sizeof(*sa), GFP_KERNEL);
+	if (!sa) {
+		kfree(sk);
+		return -ENOMEM;
+	}
+
+	sk->id.type = SERIO_8042;
+	sk->write = ioc3kbd_write;
+	sk->start = ioc3kbd_start;
+	sk->stop = ioc3kbd_stop;
+	snprintf(sk->name, sizeof(sk->name), "IOC3 keyboard %d", pdev->id);
+	snprintf(sk->phys, sizeof(sk->phys), "ioc3/serio%dkbd", pdev->id);
+	sk->port_data = d;
+	sk->dev.parent = dev;
+
+	sa->id.type = SERIO_8042;
+	sa->write = ioc3aux_write;
+	sa->start = ioc3aux_start;
+	sa->stop = ioc3aux_stop;
+	snprintf(sa->name, sizeof(sa->name), "IOC3 auxiliary %d", pdev->id);
+	snprintf(sa->phys, sizeof(sa->phys), "ioc3/serio%daux", pdev->id);
+	sa->port_data = d;
+	sa->dev.parent = dev;
+
+	d->regs = regs;
+	d->kbd = sk;
+	d->aux = sa;
+	d->irq = irq;
+
+	platform_set_drvdata(pdev, d);
+	serio_register_port(d->kbd);
+	serio_register_port(d->aux);
+
+	ret = request_irq(irq, ioc3kbd_intr, IRQF_SHARED, "ioc3-kbd", d);
+	if (ret) {
+		dev_err(dev, "could not request IRQ %d\n", irq);
+		serio_unregister_port(d->kbd);
+		serio_unregister_port(d->aux);
+		return ret;
+	}
+
+	/* enable ports */
+	writel(KM_CSR_K_CLAMP_3 | KM_CSR_M_CLAMP_3, &regs->km_csr);
+
+	return 0;
+}
+
+static int ioc3kbd_remove(struct platform_device *pdev)
+{
+	struct ioc3kbd_data *d = platform_get_drvdata(pdev);
+
+	free_irq(d->irq, d);
+	serio_unregister_port(d->kbd);
+	serio_unregister_port(d->aux);
+	return 0;
+}
+
+static struct platform_driver ioc3kbd_driver = {
+	.probe          = ioc3kbd_probe,
+	.remove         = ioc3kbd_remove,
+	.driver = {
+		.name = "ioc3-kbd",
+	},
+};
+module_platform_driver(ioc3kbd_driver);
+
+MODULE_AUTHOR("Thomas Bogendoerfer <tbogendoerfer@suse.de>");
+MODULE_DESCRIPTION("SGI IOC3 serio driver");
+MODULE_LICENSE("GPL");
-- 
2.24.1

