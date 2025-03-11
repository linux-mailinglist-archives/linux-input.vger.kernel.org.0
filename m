Return-Path: <linux-input+bounces-10701-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA94A5B636
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 02:51:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AB7817233D
	for <lists+linux-input@lfdr.de>; Tue, 11 Mar 2025 01:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F821EB9E3;
	Tue, 11 Mar 2025 01:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="SkE/Swuj"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5631E0E13;
	Tue, 11 Mar 2025 01:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741657820; cv=none; b=XyWk820wbipxCArS2QC7r9VlsmsMPQXNsLiPhvjdD+MGM8OfOL/HfguVRaRMJXLzZcFarKie6t6S7KlDz6xWzS3BmW4ocYyg+fOWwXEUkF8J66nAXHWLD86bapPm5JoRxR8HbOLnXasg9AzgF5A0/ZeXhI2p68M+xANKzLEdR+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741657820; c=relaxed/simple;
	bh=CKCp/ckmFDU6+hQ2TQimahXQTphOtHrAK7G6KUZSleE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nj9J0dK/T3eSQ8916q4IdQaArb2c+CKtuQgToWDEFVMVlBiWBx64S3UtcsXB4/mpDEQpdGnOZucoJmLTPwT92Yj+gICIwc49+OMEDnBx1EyYVnOObuysLTDGzWPGYv6vV+3AJYFe4rLfUmYnlwK0DpjQgPxPIxMXvWztmzlZmQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=SkE/Swuj; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=GBpDPMc7Ne/UqbYumGvsyiWcHTvdPHc82NlIZ4ispN0=; b=SkE/SwujqUG63bRO
	FNz02U1nH0TgMZ1arW8n3qAVaWpAAkTi/rOyLCN/7hGKu5XQMicZt/bwiSkp9YYfkGndQl5ni8XYS
	TGoid9TErFWZAhkOdFVVN0YewAv4PRCcIxnJWHsfxJDe7j1VYL9PXTaY6SYDUL4h1ndDrlUD0R/bZ
	PMtWv+Nov3TS2BuEKgI0SfKy9soAiHXcVx1+8jfbPkcvkKHv2bAY8rm3YCPnvfEBaT6/65FWjB3Y1
	bpueovLNm1yY0Oa/XLaJhwFTbUvd33R7w19iC0NP3Jj6q6ed0w2IY7/fJsoQSE0oTacaNyiyPJrvO
	Eg4N3Mi2VXwn00IFvQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1trokv-0042n5-1A;
	Tue, 11 Mar 2025 01:50:05 +0000
From: linux@treblig.org
To: arnd@arndb.de,
	lee@kernel.org,
	dmitry.torokhov@gmail.com,
	sre@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	deller@gmx.de,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	tsbogend@alpha.franken.de
Cc: linux-mips@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2 8/9] mfd: pcf50633: Remove irq code
Date: Tue, 11 Mar 2025 01:49:58 +0000
Message-ID: <20250311014959.743322-9-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311014959.743322-1-linux@treblig.org>
References: <20250311014959.743322-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

As part of the pcf50633 removal, take out it's irq code
(which includes one bit still called from the core, but it'll
go soon).

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/mfd/Makefile        |   2 +-
 drivers/mfd/pcf50633-core.c |   5 +-
 drivers/mfd/pcf50633-irq.c  | 312 ------------------------------------
 3 files changed, 2 insertions(+), 317 deletions(-)
 delete mode 100644 drivers/mfd/pcf50633-irq.c

diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index d769e40251c8..f1c7a15c8f7b 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -183,7 +183,7 @@ obj-$(CONFIG_MFD_MT6370)	+= mt6370.o
 mt6397-objs			:= mt6397-core.o mt6397-irq.o mt6358-irq.o
 obj-$(CONFIG_MFD_MT6397)	+= mt6397.o
 
-pcf50633-objs			:= pcf50633-core.o pcf50633-irq.o
+pcf50633-objs			:= pcf50633-core.o
 obj-$(CONFIG_MFD_PCF50633)	+= pcf50633.o
 obj-$(CONFIG_RZ_MTU3)		+= rz-mtu3.o
 obj-$(CONFIG_ABX500_CORE)	+= abx500-core.o
diff --git a/drivers/mfd/pcf50633-core.c b/drivers/mfd/pcf50633-core.c
index 014a68711b18..5605f176061a 100644
--- a/drivers/mfd/pcf50633-core.c
+++ b/drivers/mfd/pcf50633-core.c
@@ -204,8 +204,6 @@ static int pcf50633_probe(struct i2c_client *client)
 	dev_info(pcf->dev, "Probed device version %d variant %d\n",
 							version, variant);
 
-	pcf50633_irq_init(pcf, client->irq);
-
 	/* Create sub devices */
 	pcf50633_client_dev_register(pcf, "pcf50633-input", &pcf->input_pdev);
 	pcf50633_client_dev_register(pcf, "pcf50633-rtc", &pcf->rtc_pdev);
@@ -258,7 +256,6 @@ static void pcf50633_remove(struct i2c_client *client)
 	int i;
 
 	sysfs_remove_group(&client->dev.kobj, &pcf_attr_group);
-	pcf50633_irq_free(pcf);
 
 	platform_device_unregister(pcf->input_pdev);
 	platform_device_unregister(pcf->rtc_pdev);
@@ -279,7 +276,7 @@ MODULE_DEVICE_TABLE(i2c, pcf50633_id_table);
 static struct i2c_driver pcf50633_driver = {
 	.driver = {
 		.name	= "pcf50633",
-		.pm	= pm_sleep_ptr(&pcf50633_pm),
+		/* going.... .pm	= pm_sleep_ptr(&pcf50633_pm), */
 	},
 	.id_table = pcf50633_id_table,
 	.probe = pcf50633_probe,
diff --git a/drivers/mfd/pcf50633-irq.c b/drivers/mfd/pcf50633-irq.c
deleted file mode 100644
index e85af7f1cb0b..000000000000
--- a/drivers/mfd/pcf50633-irq.c
+++ /dev/null
@@ -1,312 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* NXP PCF50633 Power Management Unit (PMU) driver
- *
- * (C) 2006-2008 by Openmoko, Inc.
- * Author: Harald Welte <laforge@openmoko.org>
- * 	   Balaji Rao <balajirrao@openmoko.org>
- * All rights reserved.
- */
-
-#include <linux/i2c.h>
-#include <linux/interrupt.h>
-#include <linux/kernel.h>
-#include <linux/mutex.h>
-#include <linux/export.h>
-#include <linux/slab.h>
-
-#include <linux/mfd/pcf50633/core.h>
-#include <linux/mfd/pcf50633/mbc.h>
-
-int pcf50633_register_irq(struct pcf50633 *pcf, int irq,
-			void (*handler) (int, void *), void *data)
-{
-	if (irq < 0 || irq >= PCF50633_NUM_IRQ || !handler)
-		return -EINVAL;
-
-	if (WARN_ON(pcf->irq_handler[irq].handler))
-		return -EBUSY;
-
-	mutex_lock(&pcf->lock);
-	pcf->irq_handler[irq].handler = handler;
-	pcf->irq_handler[irq].data = data;
-	mutex_unlock(&pcf->lock);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(pcf50633_register_irq);
-
-int pcf50633_free_irq(struct pcf50633 *pcf, int irq)
-{
-	if (irq < 0 || irq >= PCF50633_NUM_IRQ)
-		return -EINVAL;
-
-	mutex_lock(&pcf->lock);
-	pcf->irq_handler[irq].handler = NULL;
-	mutex_unlock(&pcf->lock);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(pcf50633_free_irq);
-
-static int __pcf50633_irq_mask_set(struct pcf50633 *pcf, int irq, u8 mask)
-{
-	u8 reg, bit;
-	int idx;
-
-	idx = irq >> 3;
-	reg = PCF50633_REG_INT1M + idx;
-	bit = 1 << (irq & 0x07);
-
-	pcf50633_reg_set_bit_mask(pcf, reg, bit, mask ? bit : 0);
-
-	mutex_lock(&pcf->lock);
-
-	if (mask)
-		pcf->mask_regs[idx] |= bit;
-	else
-		pcf->mask_regs[idx] &= ~bit;
-
-	mutex_unlock(&pcf->lock);
-
-	return 0;
-}
-
-int pcf50633_irq_mask(struct pcf50633 *pcf, int irq)
-{
-	dev_dbg(pcf->dev, "Masking IRQ %d\n", irq);
-
-	return __pcf50633_irq_mask_set(pcf, irq, 1);
-}
-EXPORT_SYMBOL_GPL(pcf50633_irq_mask);
-
-int pcf50633_irq_unmask(struct pcf50633 *pcf, int irq)
-{
-	dev_dbg(pcf->dev, "Unmasking IRQ %d\n", irq);
-
-	return __pcf50633_irq_mask_set(pcf, irq, 0);
-}
-EXPORT_SYMBOL_GPL(pcf50633_irq_unmask);
-
-int pcf50633_irq_mask_get(struct pcf50633 *pcf, int irq)
-{
-	u8 reg, bits;
-
-	reg =  irq >> 3;
-	bits = 1 << (irq & 0x07);
-
-	return pcf->mask_regs[reg] & bits;
-}
-EXPORT_SYMBOL_GPL(pcf50633_irq_mask_get);
-
-static void pcf50633_irq_call_handler(struct pcf50633 *pcf, int irq)
-{
-	if (pcf->irq_handler[irq].handler)
-		pcf->irq_handler[irq].handler(irq, pcf->irq_handler[irq].data);
-}
-
-/* Maximum amount of time ONKEY is held before emergency action is taken */
-#define PCF50633_ONKEY1S_TIMEOUT 8
-
-static irqreturn_t pcf50633_irq(int irq, void *data)
-{
-	struct pcf50633 *pcf = data;
-	int ret, i, j;
-	u8 pcf_int[5], chgstat;
-
-	/* Read the 5 INT regs in one transaction */
-	ret = pcf50633_read_block(pcf, PCF50633_REG_INT1,
-						ARRAY_SIZE(pcf_int), pcf_int);
-	if (ret != ARRAY_SIZE(pcf_int)) {
-		dev_err(pcf->dev, "Error reading INT registers\n");
-
-		/*
-		 * If this doesn't ACK the interrupt to the chip, we'll be
-		 * called once again as we're level triggered.
-		 */
-		goto out;
-	}
-
-	/* defeat 8s death from lowsys on A5 */
-	pcf50633_reg_write(pcf, PCF50633_REG_OOCSHDWN,  0x04);
-
-	/* We immediately read the usb and adapter status. We thus make sure
-	 * only of USBINS/USBREM IRQ handlers are called */
-	if (pcf_int[0] & (PCF50633_INT1_USBINS | PCF50633_INT1_USBREM)) {
-		chgstat = pcf50633_reg_read(pcf, PCF50633_REG_MBCS2);
-		if (chgstat & (0x3 << 4))
-			pcf_int[0] &= ~PCF50633_INT1_USBREM;
-		else
-			pcf_int[0] &= ~PCF50633_INT1_USBINS;
-	}
-
-	/* Make sure only one of ADPINS or ADPREM is set */
-	if (pcf_int[0] & (PCF50633_INT1_ADPINS | PCF50633_INT1_ADPREM)) {
-		chgstat = pcf50633_reg_read(pcf, PCF50633_REG_MBCS2);
-		if (chgstat & (0x3 << 4))
-			pcf_int[0] &= ~PCF50633_INT1_ADPREM;
-		else
-			pcf_int[0] &= ~PCF50633_INT1_ADPINS;
-	}
-
-	dev_dbg(pcf->dev, "INT1=0x%02x INT2=0x%02x INT3=0x%02x "
-			"INT4=0x%02x INT5=0x%02x\n", pcf_int[0],
-			pcf_int[1], pcf_int[2], pcf_int[3], pcf_int[4]);
-
-	/* Some revisions of the chip don't have a 8s standby mode on
-	 * ONKEY1S press. We try to manually do it in such cases. */
-	if ((pcf_int[0] & PCF50633_INT1_SECOND) && pcf->onkey1s_held) {
-		dev_info(pcf->dev, "ONKEY1S held for %d secs\n",
-							pcf->onkey1s_held);
-		if (pcf->onkey1s_held++ == PCF50633_ONKEY1S_TIMEOUT)
-			if (pcf->pdata->force_shutdown)
-				pcf->pdata->force_shutdown(pcf);
-	}
-
-	if (pcf_int[2] & PCF50633_INT3_ONKEY1S) {
-		dev_info(pcf->dev, "ONKEY1S held\n");
-		pcf->onkey1s_held = 1 ;
-
-		/* Unmask IRQ_SECOND */
-		pcf50633_reg_clear_bits(pcf, PCF50633_REG_INT1M,
-						PCF50633_INT1_SECOND);
-
-		/* Unmask IRQ_ONKEYR */
-		pcf50633_reg_clear_bits(pcf, PCF50633_REG_INT2M,
-						PCF50633_INT2_ONKEYR);
-	}
-
-	if ((pcf_int[1] & PCF50633_INT2_ONKEYR) && pcf->onkey1s_held) {
-		pcf->onkey1s_held = 0;
-
-		/* Mask SECOND and ONKEYR interrupts */
-		if (pcf->mask_regs[0] & PCF50633_INT1_SECOND)
-			pcf50633_reg_set_bit_mask(pcf,
-					PCF50633_REG_INT1M,
-					PCF50633_INT1_SECOND,
-					PCF50633_INT1_SECOND);
-
-		if (pcf->mask_regs[1] & PCF50633_INT2_ONKEYR)
-			pcf50633_reg_set_bit_mask(pcf,
-					PCF50633_REG_INT2M,
-					PCF50633_INT2_ONKEYR,
-					PCF50633_INT2_ONKEYR);
-	}
-
-	/* Have we just resumed ? */
-	if (pcf->is_suspended) {
-		pcf->is_suspended = 0;
-
-		/* Set the resume reason filtering out non resumers */
-		for (i = 0; i < ARRAY_SIZE(pcf_int); i++)
-			pcf->resume_reason[i] = pcf_int[i] &
-						pcf->pdata->resumers[i];
-
-		/* Make sure we don't pass on any ONKEY events to
-		 * userspace now */
-		pcf_int[1] &= ~(PCF50633_INT2_ONKEYR | PCF50633_INT2_ONKEYF);
-	}
-
-	for (i = 0; i < ARRAY_SIZE(pcf_int); i++) {
-		/* Unset masked interrupts */
-		pcf_int[i] &= ~pcf->mask_regs[i];
-
-		for (j = 0; j < 8 ; j++)
-			if (pcf_int[i] & (1 << j))
-				pcf50633_irq_call_handler(pcf, (i * 8) + j);
-	}
-
-out:
-	return IRQ_HANDLED;
-}
-
-static int pcf50633_suspend(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct pcf50633 *pcf = i2c_get_clientdata(client);
-	int ret;
-	int i;
-	u8 res[5];
-
-
-	/* Make sure our interrupt handlers are not called
-	 * henceforth */
-	disable_irq(pcf->irq);
-
-	/* Save the masks */
-	ret = pcf50633_read_block(pcf, PCF50633_REG_INT1M,
-				ARRAY_SIZE(pcf->suspend_irq_masks),
-					pcf->suspend_irq_masks);
-	if (ret < 0) {
-		dev_err(pcf->dev, "error saving irq masks\n");
-		goto out;
-	}
-
-	/* Write wakeup irq masks */
-	for (i = 0; i < ARRAY_SIZE(res); i++)
-		res[i] = ~pcf->pdata->resumers[i];
-
-	ret = pcf50633_write_block(pcf, PCF50633_REG_INT1M,
-					ARRAY_SIZE(res), &res[0]);
-	if (ret < 0) {
-		dev_err(pcf->dev, "error writing wakeup irq masks\n");
-		goto out;
-	}
-
-	pcf->is_suspended = 1;
-
-out:
-	return ret;
-}
-
-static int pcf50633_resume(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct pcf50633 *pcf = i2c_get_clientdata(client);
-	int ret;
-
-	/* Write the saved mask registers */
-	ret = pcf50633_write_block(pcf, PCF50633_REG_INT1M,
-				ARRAY_SIZE(pcf->suspend_irq_masks),
-					pcf->suspend_irq_masks);
-	if (ret < 0)
-		dev_err(pcf->dev, "Error restoring saved suspend masks\n");
-
-	enable_irq(pcf->irq);
-
-	return ret;
-}
-
-EXPORT_GPL_SIMPLE_DEV_PM_OPS(pcf50633_pm, pcf50633_suspend, pcf50633_resume);
-
-int pcf50633_irq_init(struct pcf50633 *pcf, int irq)
-{
-	int ret;
-
-	pcf->irq = irq;
-
-	/* Enable all interrupts except RTC SECOND */
-	pcf->mask_regs[0] = 0x80;
-	pcf50633_reg_write(pcf, PCF50633_REG_INT1M, pcf->mask_regs[0]);
-	pcf50633_reg_write(pcf, PCF50633_REG_INT2M, 0x00);
-	pcf50633_reg_write(pcf, PCF50633_REG_INT3M, 0x00);
-	pcf50633_reg_write(pcf, PCF50633_REG_INT4M, 0x00);
-	pcf50633_reg_write(pcf, PCF50633_REG_INT5M, 0x00);
-
-	ret = request_threaded_irq(irq, NULL, pcf50633_irq,
-					IRQF_TRIGGER_LOW | IRQF_ONESHOT,
-					"pcf50633", pcf);
-
-	if (ret)
-		dev_err(pcf->dev, "Failed to request IRQ %d\n", ret);
-
-	if (enable_irq_wake(irq) < 0)
-		dev_err(pcf->dev, "IRQ %u cannot be enabled as wake-up source"
-			"in this hardware revision", irq);
-
-	return ret;
-}
-
-void pcf50633_irq_free(struct pcf50633 *pcf)
-{
-	free_irq(pcf->irq, pcf);
-}
-- 
2.48.1


