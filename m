Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42C343CFE48
	for <lists+linux-input@lfdr.de>; Tue, 20 Jul 2021 17:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235267AbhGTPOD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Jul 2021 11:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241166AbhGTOlD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Jul 2021 10:41:03 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF34EC061574
        for <linux-input@vger.kernel.org>; Tue, 20 Jul 2021 08:21:40 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id g8so30457198lfh.8
        for <linux-input@vger.kernel.org>; Tue, 20 Jul 2021 08:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=drHNoHgECizLbSv1BVVUSH3AiqXUzqLsJwCaGwqbPQU=;
        b=ScNYcPxDzY7xeghNHsZuT7tBT6Sl2VJBcuxOVlGPx+VU2QsYw0w2gOp3mDbsySm6JU
         5yUIGeoW1z2eVyuht9gIA2DrYbUYesngZgno1xuoLocrVIxs7dgASD2SaUMReRAjn+hs
         zsVxZzPbCsYNnD1YSWq9hVSsYd2vxB8Nr+Xc5ryDOAnMt9lUDawkU0VNitqOq26jBMQX
         ikpV5NhG9HAkkMAa6ZFJE+vibQEavRKOzC7X9jtkCei8KYAuVJmYUJbsOosEs7eK3m/4
         I7vRqsev7U0sI3aG1krW0jV+BCWhIi58kUjE3dccdkPKrAGtuYaeCdjN1G3oVUxqQxeZ
         OLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=drHNoHgECizLbSv1BVVUSH3AiqXUzqLsJwCaGwqbPQU=;
        b=am9GkEv3HyK7g88/UuQpopoRMyLvh7+UGK1QUs3kcgJEF2JcX3lXxbCBCA/8hj5e6m
         C2T4um16DRw5Rp99cLv5UaFHppYF9l9Xt9jRPLps9yfVh7IioOaG78Ukzs2dG18T51kv
         ptbXlXZC/nKNPJ+gYbGU3UbgxggobRtIwd/kO30oIRU8zfQeVuVjuUm0EnEAoNwTaZ+t
         rt71CXbG87jt6IOoZnlpFDtgJJEh+zqfa66Z3QAIcPHGIPQuroytydbbq/S0eR5AwWA9
         IfJZhVlQm0OBYcYPsf+ahQC14Upjx0xyxDN6MilL+3XFOXXwYiJWs4C7Ml60Vna5T5BY
         NfPA==
X-Gm-Message-State: AOAM532BNv4+7RtRVqgnzgdg3wK1HVvx0dkgHDHYGweqCWiOR0IyG8rY
        J2xvLisA/bAcLb/SoYLgZJ6BPg==
X-Google-Smtp-Source: ABdhPJyaiMmApHYH38UdSXlz+At9BC1VoPm5yEud1sCYivhRwQAp4AR8CJh1v6KcIUG1ZLZuljPqqw==
X-Received: by 2002:a05:6512:da:: with SMTP id c26mr23207712lfp.390.1626794499175;
        Tue, 20 Jul 2021 08:21:39 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id f2sm1551355lft.225.2021.07.20.08.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 08:21:38 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: [PATCH v2] Input: ixp4xx-beeper - Delete driver
Date:   Tue, 20 Jul 2021 17:19:36 +0200
Message-Id: <20210720151936.1528933-1-linus.walleij@linaro.org>
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
ChangeLog v1->v2:
- Squash out other patches this patch depended on, test
  on a clean v5.14-rc1, sorry for the fuzz.
---
 drivers/input/misc/Kconfig         |  12 --
 drivers/input/misc/Makefile        |   1 -
 drivers/input/misc/ixp4xx-beeper.c | 183 -----------------------------
 3 files changed, 196 deletions(-)
 delete mode 100644 drivers/input/misc/ixp4xx-beeper.c

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 498cde376981..ae01507b7afd 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -309,18 +309,6 @@ config INPUT_GPIO_VIBRA
 	  To compile this driver as a module, choose M here: the module will be
 	  called gpio-vibra.
 
-config INPUT_IXP4XX_BEEPER
-	tristate "IXP4XX Beeper support"
-	depends on ARCH_IXP4XX
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
index 05018d0c97c7..000000000000
--- a/drivers/input/misc/ixp4xx-beeper.c
+++ /dev/null
@@ -1,183 +0,0 @@
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
-#include <mach/hardware.h>
-
-MODULE_AUTHOR("Alessandro Zummo <a.zummo@towertech.it>");
-MODULE_DESCRIPTION("ixp4xx beeper driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:ixp4xx-beeper");
-
-static DEFINE_SPINLOCK(beep_lock);
-
-static int ixp4xx_timer2_irq;
-
-static void ixp4xx_spkr_control(unsigned int pin, unsigned int count)
-{
-	unsigned long flags;
-
-	spin_lock_irqsave(&beep_lock, flags);
-
-	if (count) {
-		gpio_direction_output(pin, 0);
-		*IXP4XX_OSRT2 = (count & ~IXP4XX_OST_RELOAD_MASK) | IXP4XX_OST_ENABLE;
-	} else {
-		gpio_direction_output(pin, 1);
-		gpio_direction_input(pin);
-		*IXP4XX_OSRT2 = 0;
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
-		count = (ixp4xx_timer_freq / (value * 4)) - 1;
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
-	*IXP4XX_OSST = IXP4XX_OSST_TIMER_2_PEND;
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

