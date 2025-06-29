Return-Path: <linux-input+bounces-13171-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 036B5AED142
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 23:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECEFB3AA74A
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 21:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B784F2253AE;
	Sun, 29 Jun 2025 21:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="RDgh0QVc"
X-Original-To: linux-input@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DD220E71D;
	Sun, 29 Jun 2025 21:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751232509; cv=none; b=eVVi6rn1bC5LgZHbp1Wg1HGNxvc2n4P5QdmvFJykYNo896qkto5LpscY7/0Op5+Kk+SkBeo+KzeP5kA6joU6Vjyq+k8+qocEfO4ugNvfeQJlUpjnfEoxy9A5N3i5h96jVGUthio6Lvt8lNreSJKGZVaylAghi5klfs2IBOScKjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751232509; c=relaxed/simple;
	bh=0GDCXP9hPDzJpOpQl6VuCswD1cK7eL0zqx6KEcbSgis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=di8gzEFHCys3B2eRrvscNWnR62KPGLpmNt+cY/x34W+0JvfjrQtD/OqdFBknjlAM4jpXev6PcuxexvyBW+/Q8GcV618j5QgJAdtYVgZO4Noq5z+SwloL+PMReaWz/S/7NIKZl/BB1wYzWmcf1I5IKqPL6MvJ3ODUHnapTvsx5Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=RDgh0QVc; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=VZn7DM19jfl0bs+hbAfDvHbiQxOWB5pW/wl5OJBKaag=; b=RDgh0QVcW0j/vLD3
	80fkBJ6NkbwG/IMPhCxiOBRS1fPgeFvxxey7YdPpSbdS5ecBFJDE28dpP2Su+MNAT8CI2Uxwf1pgS
	ptKhb3Q8NMma5lKf6ciZfSoKXIUZneXZlvQc0cNk9Tzc2OySQX0UlCMVUSV0iOZe3aTw8l15hLFvq
	AIt+mjwFSFgFAz6HHrKH+jAq2laQt+TzAqHdZf3IwTk8aV6EMU+6ruSOZDj8Kz1fKpUaz2sPPqOQ8
	G/ClwTvNwfeQCjSG2EpwvvtzTi4TWGBkeXNAPeuZ7jCHYdtUHdeL5h272IzccilexpAA85KwFyEhM
	+qSyKcKwxaR6vy0Maw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uVzZV-00Cqe6-0j;
	Sun, 29 Jun 2025 21:28:21 +0000
From: linux@treblig.org
To: dmitry.torokhov@gmail.com,
	lee@kernel.org,
	linux-input@vger.kernel.org,
	arnd@arndb.de
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] Input: pcf50633-input - Remove
Date: Sun, 29 Jun 2025 22:28:20 +0100
Message-ID: <20250629212820.319584-1-linux@treblig.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The pcf50633 was used as part of the OpenMoko devices but
the support for its main chip was recently removed in:
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")

Remove the input code.

This was originally posted as a set of pcf50633 removals in March,
and is the only major component that hasn't been picked up.
https://lore.kernel.org/all/20250311014959.743322-1-linux@treblig.org/

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/input/misc/Kconfig          |   7 --
 drivers/input/misc/Makefile         |   1 -
 drivers/input/misc/pcf50633-input.c | 113 ----------------------------
 3 files changed, 121 deletions(-)
 delete mode 100644 drivers/input/misc/pcf50633-input.c

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index f5496ca0c0d2..0fb21c99a5e3 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -584,13 +584,6 @@ config INPUT_PALMAS_PWRBUTTON
 	  To compile this driver as a module, choose M here. The module will
 	  be called palmas_pwrbutton.
 
-config INPUT_PCF50633_PMU
-	tristate "PCF50633 PMU events"
-	depends on MFD_PCF50633
-	help
-	 Say Y to include support for delivering  PMU events via  input
-	 layer on NXP PCF50633.
-
 config INPUT_PCF8574
 	tristate "PCF8574 Keypad input device"
 	depends on I2C
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 6d91804d0a6f..d468c8140b93 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -59,7 +59,6 @@ obj-$(CONFIG_INPUT_MC13783_PWRBUTTON)	+= mc13783-pwrbutton.o
 obj-$(CONFIG_INPUT_MMA8450)		+= mma8450.o
 obj-$(CONFIG_INPUT_PALMAS_PWRBUTTON)	+= palmas-pwrbutton.o
 obj-$(CONFIG_INPUT_PCAP)		+= pcap_keys.o
-obj-$(CONFIG_INPUT_PCF50633_PMU)	+= pcf50633-input.o
 obj-$(CONFIG_INPUT_PCF8574)		+= pcf8574_keypad.o
 obj-$(CONFIG_INPUT_PCSPKR)		+= pcspkr.o
 obj-$(CONFIG_INPUT_PM8941_PWRKEY)	+= pm8941-pwrkey.o
diff --git a/drivers/input/misc/pcf50633-input.c b/drivers/input/misc/pcf50633-input.c
deleted file mode 100644
index 6d046e236ba6..000000000000
--- a/drivers/input/misc/pcf50633-input.c
+++ /dev/null
@@ -1,113 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* NXP PCF50633 Input Driver
- *
- * (C) 2006-2008 by Openmoko, Inc.
- * Author: Balaji Rao <balajirrao@openmoko.org>
- * All rights reserved.
- *
- * Broken down from monstrous PCF50633 driver mainly by
- * Harald Welte, Andy Green and Werner Almesberger
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/device.h>
-#include <linux/platform_device.h>
-#include <linux/input.h>
-#include <linux/slab.h>
-
-#include <linux/mfd/pcf50633/core.h>
-
-#define PCF50633_OOCSTAT_ONKEY	0x01
-#define PCF50633_REG_OOCSTAT	0x12
-#define PCF50633_REG_OOCMODE	0x10
-
-struct pcf50633_input {
-	struct pcf50633 *pcf;
-	struct input_dev *input_dev;
-};
-
-static void
-pcf50633_input_irq(int irq, void *data)
-{
-	struct pcf50633_input *input;
-	int onkey_released;
-
-	input = data;
-
-	/* We report only one event depending on the key press status */
-	onkey_released = pcf50633_reg_read(input->pcf, PCF50633_REG_OOCSTAT)
-						& PCF50633_OOCSTAT_ONKEY;
-
-	if (irq == PCF50633_IRQ_ONKEYF && !onkey_released)
-		input_report_key(input->input_dev, KEY_POWER, 1);
-	else if (irq == PCF50633_IRQ_ONKEYR && onkey_released)
-		input_report_key(input->input_dev, KEY_POWER, 0);
-
-	input_sync(input->input_dev);
-}
-
-static int pcf50633_input_probe(struct platform_device *pdev)
-{
-	struct pcf50633_input *input;
-	struct input_dev *input_dev;
-	int ret;
-
-
-	input = kzalloc(sizeof(*input), GFP_KERNEL);
-	if (!input)
-		return -ENOMEM;
-
-	input_dev = input_allocate_device();
-	if (!input_dev) {
-		kfree(input);
-		return -ENOMEM;
-	}
-
-	platform_set_drvdata(pdev, input);
-	input->pcf = dev_to_pcf50633(pdev->dev.parent);
-	input->input_dev = input_dev;
-
-	input_dev->name = "PCF50633 PMU events";
-	input_dev->id.bustype = BUS_I2C;
-	input_dev->evbit[0] = BIT(EV_KEY) | BIT(EV_PWR);
-	set_bit(KEY_POWER, input_dev->keybit);
-
-	ret = input_register_device(input_dev);
-	if (ret) {
-		input_free_device(input_dev);
-		kfree(input);
-		return ret;
-	}
-	pcf50633_register_irq(input->pcf, PCF50633_IRQ_ONKEYR,
-				pcf50633_input_irq, input);
-	pcf50633_register_irq(input->pcf, PCF50633_IRQ_ONKEYF,
-				pcf50633_input_irq, input);
-
-	return 0;
-}
-
-static void pcf50633_input_remove(struct platform_device *pdev)
-{
-	struct pcf50633_input *input  = platform_get_drvdata(pdev);
-
-	pcf50633_free_irq(input->pcf, PCF50633_IRQ_ONKEYR);
-	pcf50633_free_irq(input->pcf, PCF50633_IRQ_ONKEYF);
-
-	input_unregister_device(input->input_dev);
-	kfree(input);
-}
-
-static struct platform_driver pcf50633_input_driver = {
-	.driver = {
-		.name = "pcf50633-input",
-	},
-	.probe = pcf50633_input_probe,
-	.remove = pcf50633_input_remove,
-};
-module_platform_driver(pcf50633_input_driver);
-
-MODULE_AUTHOR("Balaji Rao <balajirrao@openmoko.org>");
-MODULE_DESCRIPTION("PCF50633 input driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:pcf50633-input");
-- 
2.50.0


