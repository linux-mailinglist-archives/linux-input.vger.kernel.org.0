Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0F7C3C841B
	for <lists+linux-input@lfdr.de>; Wed, 14 Jul 2021 13:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbhGNLzY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Jul 2021 07:55:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230467AbhGNLzX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Jul 2021 07:55:23 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2327FC06175F
        for <linux-input@vger.kernel.org>; Wed, 14 Jul 2021 04:52:32 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 141so2978082ljj.2
        for <linux-input@vger.kernel.org>; Wed, 14 Jul 2021 04:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x5F+oiLoZDgz4n1rikeDdN1fS2gjJBwHi7b7Xx8hd2Y=;
        b=tu3LQQpQWm9hHemK3WDPskwHFsqiNatU2JBezkXHuZOoP5vQs7YQ+aLoAnYKS9c9Pb
         E7EkIMlCMEtTPPJzWP7ZoclgYgp3fAyROxZCsVTM7rJrckuD/XYvUlAD4lD1+vh8S/mC
         KpQodgbuDyNJjg0IkFe3sessciisxqUq1B14mX944eEo6dAz56AyGBo5fPy448CCptMz
         GruuFLf31niK/96X+L7q2YChqnUNF4AdpBt0g0v29cVHR37jkxymNsdKaGcXdGoOeS+a
         /j+R8nQ9eW3wmUSbsLrVSCvGBaw3Q6ZfX+Xz1U8b/v9YUkZwhkx+ntMV3nk7ucik4KIJ
         wpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x5F+oiLoZDgz4n1rikeDdN1fS2gjJBwHi7b7Xx8hd2Y=;
        b=VKU/u6RpgYa85EdkaxBa7YWCQDRjIR44Phr84o2Y1g/4xDx3HIM3loLdiLhWBlGd7F
         QJSfuFbaseRjy1N71UnbL0nTOab9x715n7/nQ7nKiVkqy0k3xcQsGKHCYxn4fOAcStUt
         hyytPkqmj/gq2rdB6knyYqo8ne0WONZq8/xEAmys/f3u8sbratj/JTVlnMGq6q4HEFhS
         N8O+3kbYIALY271FkNyeqc75ut2WDRx8/ni1/wERMGmOIO/YH3t4rvIx1Eu/VtJWkatz
         /nh1GtIQptrbjloiP2cS3qxRcho+l0/hs9OeI3dikD8yU3ORns21njFW90RDsvO2wY/G
         DLqg==
X-Gm-Message-State: AOAM531LcfFHO6kVan6/w2VrmO4hjxjP9OAtB3HSTBFda1vb0ZdWIayY
        XE9E5BRfKFlg2chX4Vp0F0YWRQ==
X-Google-Smtp-Source: ABdhPJzviuQ881WlNasF73kT4/bmHr/DwxbZqLDNTVi89KYNPo+TmvjkUrOKLB8ZSxtE3sw2lVfUOw==
X-Received: by 2002:a2e:868f:: with SMTP id l15mr8534711lji.420.1626263550439;
        Wed, 14 Jul 2021 04:52:30 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id z19sm147593lfq.241.2021.07.14.04.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 04:52:30 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: [PATCH] Input: ixp4xx-beeper - Delete driver
Date:   Wed, 14 Jul 2021 13:50:28 +0200
Message-Id: <20210714115028.916360-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The NSLU2 has been migrated to devicetree and there we use
the gpio-beeper.c driver instead, the boardfile will be deleted
for kernel v5.15 so drop this custom and now unneeded driver.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Imre Kaloz <kaloz@openwrt.org>
Cc: Krzysztof Halasa <khalasa@piap.pl>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/misc/Kconfig         |  12 --
 drivers/input/misc/Makefile        |   1 -
 drivers/input/misc/ixp4xx-beeper.c | 208 -----------------------------
 3 files changed, 221 deletions(-)
 delete mode 100644 drivers/input/misc/ixp4xx-beeper.c

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 97f0455c2aee..ae01507b7afd 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -309,18 +309,6 @@ config INPUT_GPIO_VIBRA
 	  To compile this driver as a module, choose M here: the module will be
 	  called gpio-vibra.
 
-config INPUT_IXP4XX_BEEPER
-	tristate "IXP4XX Beeper support"
-	depends on ARCH_IXP4XX || COMPILE_TEST
-	help
-	  If you say yes here, you can connect a beeper to the
-	  ixp4xx gpio pins. This is used by the LinkSys NSLU2.
-
-	  If unsure, say Y.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called ixp4xx-beeper.
-
 config INPUT_COBALT_BTNS
 	tristate "Cobalt button interface"
 	depends on MIPS_COBALT
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index f593beed7e05..2a0943507467 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -44,7 +44,6 @@ obj-$(CONFIG_HP_SDC_RTC)		+= hp_sdc_rtc.o
 obj-$(CONFIG_INPUT_IMS_PCU)		+= ims-pcu.o
 obj-$(CONFIG_INPUT_IQS269A)		+= iqs269a.o
 obj-$(CONFIG_INPUT_IQS626A)		+= iqs626a.o
-obj-$(CONFIG_INPUT_IXP4XX_BEEPER)	+= ixp4xx-beeper.o
 obj-$(CONFIG_INPUT_KEYSPAN_REMOTE)	+= keyspan_remote.o
 obj-$(CONFIG_INPUT_KXTJ9)		+= kxtj9.o
 obj-$(CONFIG_INPUT_M68K_BEEP)		+= m68kspkr.o
diff --git a/drivers/input/misc/ixp4xx-beeper.c b/drivers/input/misc/ixp4xx-beeper.c
deleted file mode 100644
index b31c04a9e683..000000000000
--- a/drivers/input/misc/ixp4xx-beeper.c
+++ /dev/null
@@ -1,208 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Generic IXP4xx beeper driver
- *
- * Copyright (C) 2005 Tower Technologies
- *
- * based on nslu2-io.c
- *  Copyright (C) 2004 Karen Spearel
- *
- * Author: Alessandro Zummo <a.zummo@towertech.it>
- * Maintainers: http://www.nslu2-linux.org/
- */
-
-#include <linux/module.h>
-#include <linux/input.h>
-#include <linux/delay.h>
-#include <linux/platform_device.h>
-#include <linux/interrupt.h>
-#include <linux/gpio.h>
-
-MODULE_AUTHOR("Alessandro Zummo <a.zummo@towertech.it>");
-MODULE_DESCRIPTION("ixp4xx beeper driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:ixp4xx-beeper");
-
-static DEFINE_SPINLOCK(beep_lock);
-
-static int ixp4xx_timer2_irq;
-static void __iomem *ixp4xx_spkr_regs;
-static int ixp4xx_spkr_timer_freq;
-
-#define IXP4XX_OSRT2_OFFSET		0x10 /* Timer 2 Reload */
-#define IXP4XX_OSST_OFFSET		0x20 /* Timer Status */
-
-#define IXP4XX_OST_ENABLE		0x00000001
-#define IXP4XX_OST_RELOAD_MASK		0x00000003
-
-#define IXP4XX_OSST_TIMER_2_PEND	0x00000002
-
-static void ixp4xx_spkr_control(unsigned int pin, unsigned int count)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&beep_lock, flags);
-
-	if (count) {
-		gpio_direction_output(pin, 0);
-		__raw_writel((count & ~IXP4XX_OST_RELOAD_MASK) | IXP4XX_OST_ENABLE,
-			     ixp4xx_spkr_regs + IXP4XX_OSRT2_OFFSET);
-	} else {
-		gpio_direction_output(pin, 1);
-		gpio_direction_input(pin);
-		__raw_writel(0, ixp4xx_spkr_regs + IXP4XX_OSRT2_OFFSET);
-	}
-
-	spin_unlock_irqrestore(&beep_lock, flags);
-}
-
-static int ixp4xx_spkr_event(struct input_dev *dev, unsigned int type, unsigned int code, int value)
-{
-	unsigned int pin = (unsigned int) input_get_drvdata(dev);
-	unsigned int count = 0;
-
-	if (type != EV_SND)
-		return -1;
-
-	switch (code) {
-		case SND_BELL:
-			if (value)
-				value = 1000;
-		case SND_TONE:
-			break;
-		default:
-			return -1;
-	}
-
-	if (value > 20 && value < 32767)
-		count = (ixp4xx_spkr_timer_freq / (value * 4)) - 1;
-
-	ixp4xx_spkr_control(pin, count);
-
-	return 0;
-}
-
-static irqreturn_t ixp4xx_spkr_interrupt(int irq, void *dev_id)
-{
-	unsigned int pin = (unsigned int) dev_id;
-
-	/* clear interrupt */
-	__raw_writel(IXP4XX_OSST_TIMER_2_PEND, ixp4xx_spkr_regs + IXP4XX_OSST_OFFSET);
-
-	/* flip the beeper output */
-	gpio_set_value(pin, !gpio_get_value(pin));
-
-	return IRQ_HANDLED;
-}
-
-static int ixp4xx_spkr_probe(struct platform_device *dev)
-{
-	struct input_dev *input_dev;
-	struct resource *res;
-	int irq;
-	int err;
-
-	input_dev = input_allocate_device();
-	if (!input_dev)
-		return -ENOMEM;
-
-	input_set_drvdata(input_dev, (void *) dev->id);
-
-	input_dev->name = "ixp4xx beeper";
-	input_dev->phys = "ixp4xx/gpio";
-	input_dev->id.bustype = BUS_HOST;
-	input_dev->id.vendor  = 0x001f;
-	input_dev->id.product = 0x0001;
-	input_dev->id.version = 0x0100;
-	input_dev->dev.parent = &dev->dev;
-
-	input_dev->evbit[0] = BIT_MASK(EV_SND);
-	input_dev->sndbit[0] = BIT_MASK(SND_BELL) | BIT_MASK(SND_TONE);
-	input_dev->event = ixp4xx_spkr_event;
-
-	irq = platform_get_irq(dev, 0);
-	if (irq < 0) {
-		err = irq;
-		goto err_free_device;
-	}
-
-	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
-	if (!res) {
-		err = -ENXIO;
-		goto err_free_device;
-	}
-	/* note: don't call request_mem_region because of conflict */
-	ixp4xx_spkr_regs = devm_ioremap(&dev->dev, res->start, resource_size(res));
-	if (!ixp4xx_spkr_regs) {
-		err = -ENXIO;
-		goto err_free_device;
-	}
-
-	ixp4xx_spkr_timer_freq = (uintptr_t)dev_get_platdata(&dev->dev);
-
-	err = gpio_request(dev->id, "ixp4-beeper");
-	if (err)
-		goto err_free_device;
-
-	err = request_irq(irq, &ixp4xx_spkr_interrupt,
-			  IRQF_NO_SUSPEND, "ixp4xx-beeper",
-			  (void *) dev->id);
-	if (err)
-		goto err_free_gpio;
-	ixp4xx_timer2_irq = irq;
-
-	err = input_register_device(input_dev);
-	if (err)
-		goto err_free_irq;
-
-	platform_set_drvdata(dev, input_dev);
-
-	return 0;
-
- err_free_irq:
-	free_irq(irq, (void *)dev->id);
- err_free_gpio:
-	gpio_free(dev->id);
- err_free_device:
-	input_free_device(input_dev);
-
-	return err;
-}
-
-static int ixp4xx_spkr_remove(struct platform_device *dev)
-{
-	struct input_dev *input_dev = platform_get_drvdata(dev);
-	unsigned int pin = (unsigned int) input_get_drvdata(input_dev);
-
-	input_unregister_device(input_dev);
-
-	/* turn the speaker off */
-	disable_irq(ixp4xx_timer2_irq);
-	ixp4xx_spkr_control(pin, 0);
-
-	free_irq(ixp4xx_timer2_irq, (void *)dev->id);
-	gpio_free(dev->id);
-
-	return 0;
-}
-
-static void ixp4xx_spkr_shutdown(struct platform_device *dev)
-{
-	struct input_dev *input_dev = platform_get_drvdata(dev);
-	unsigned int pin = (unsigned int) input_get_drvdata(input_dev);
-
-	/* turn off the speaker */
-	disable_irq(ixp4xx_timer2_irq);
-	ixp4xx_spkr_control(pin, 0);
-}
-
-static struct platform_driver ixp4xx_spkr_platform_driver = {
-	.driver		= {
-		.name	= "ixp4xx-beeper",
-	},
-	.probe		= ixp4xx_spkr_probe,
-	.remove		= ixp4xx_spkr_remove,
-	.shutdown	= ixp4xx_spkr_shutdown,
-};
-module_platform_driver(ixp4xx_spkr_platform_driver);
-
-- 
2.31.1

