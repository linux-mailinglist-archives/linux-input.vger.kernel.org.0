Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECB8A18DAE7
	for <lists+linux-input@lfdr.de>; Fri, 20 Mar 2020 23:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbgCTWL1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Mar 2020 18:11:27 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:45143 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbgCTWL0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Mar 2020 18:11:26 -0400
Received: by mail-lj1-f193.google.com with SMTP id y17so8102328ljk.12
        for <linux-input@vger.kernel.org>; Fri, 20 Mar 2020 15:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LxXpXBns5qpw1V0u5tpG6YAfTjnFACGOFdGvDu3Dcro=;
        b=Vs/nOxNVUSx7MzwovTJkVdP0otuJBzfgpDhF34jdzcdQp8Jb3CywmUI1p38Lkpa7S/
         l9hTqpXW4w/2sQe/TEAg6xolW2AntOkt9dkBLUb5cbsibGVZ2ACCxXXSND6/6x3g/PbE
         Mk6Z8WQlTQmsxJVps44O5W8lvl9JrteGwmmnH+rX7ssAE2+jTjCYesLctJaqMPZA4lnw
         ArFKz4vbaBWYJ+ObBg9XK5j3WWuKefOQe0gJBIC2N/mpgZZ3e80nnQxhqr2jMxZgCz0S
         tFOXsr6KB1LPxWrCgNAGMPatm+pekZxJNKamWTou3ue5+xWOh3FB1URoxxOUaMXLuN7b
         CsnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LxXpXBns5qpw1V0u5tpG6YAfTjnFACGOFdGvDu3Dcro=;
        b=q1IinaqfkzxYqqLTaph241nwMi1cv20Q53sT/G/0a1heFHPwMgvwekuwfAVjmY+4hr
         i7p+nuOAB18ApHc+X46UZ2miC2OJYil2dc+38Ww3KuZkjKXoGqAOkPNKaEc7ot5rAPpf
         +ICcRdP6dimO121IwvoM28gAB9GMqu44ToABgmzNxoQ207jYvg91mmbIEXTpZyNCYu4H
         TR0XFMPI94OfCXnrm17g1P7oCUv1CVmHfCuQoc/PKkWXtabNtAV82z4EoSZ2t7dFUcPU
         5dgFQIc7aDnFwykiyESJ8X9eOBo/Xy37LCMZnDKnAM/ykwT5V2duKcBRZ9NHhC0wHCgw
         dWKw==
X-Gm-Message-State: ANhLgQ0gAI0rFCS3BruU2bj1Mr6+b4MWWpK73xz1lzlcfb7fIGbD5EI6
        yWps7hh6Z8QQkuKh2CEx+/mzxg==
X-Google-Smtp-Source: ADFU+vtMoXCNOc069EamoWuThQqwgJhwdD4RH2ZhpVZ8OiCCtqTVMxTc4lCjAELeWq7+90m8n9hqkA==
X-Received: by 2002:a2e:3c01:: with SMTP id j1mr6648018lja.175.1584742283538;
        Fri, 20 Mar 2020 15:11:23 -0700 (PDT)
Received: from localhost.bredbandsbolaget (c-5ac9225c.014-348-6c756e10.bbcust.telenor.se. [92.34.201.90])
        by smtp.gmail.com with ESMTPSA id r12sm4203448ljd.6.2020.03.20.15.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 15:11:22 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH] Input: Delete unused GP2AP002A00F driver
Date:   Fri, 20 Mar 2020 23:11:18 +0100
Message-Id: <20200320221118.2437-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is now an IIO driver for GP2AP002A00F and
GP2AP002S00F in drivers/iio/light/gp2ap002.c.

Delete this driver, it is unused in the kernel tree
and new users can make use of the IIO driver.

Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/misc/Kconfig        |  11 --
 drivers/input/misc/Makefile       |   1 -
 drivers/input/misc/gp2ap002a00f.c | 281 ------------------------------
 3 files changed, 293 deletions(-)
 delete mode 100644 drivers/input/misc/gp2ap002a00f.c

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 7e2e658d551c..293e55fb7a4e 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -265,17 +265,6 @@ config INPUT_APANEL
 	 To compile this driver as a module, choose M here: the module will
 	 be called apanel.
 
-config INPUT_GP2A
-	tristate "Sharp GP2AP002A00F I2C Proximity/Opto sensor driver"
-	depends on I2C
-	depends on GPIOLIB || COMPILE_TEST
-	help
-	  Say Y here if you have a Sharp GP2AP002A00F proximity/als combo-chip
-	  hooked to an I2C bus.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called gp2ap002a00f.
-
 config INPUT_GPIO_BEEPER
 	tristate "Generic GPIO Beeper support"
 	depends on GPIOLIB || COMPILE_TEST
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 8fd187f314bd..1db1815ce803 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -33,7 +33,6 @@ obj-$(CONFIG_INPUT_E3X0_BUTTON)		+= e3x0-button.o
 obj-$(CONFIG_INPUT_DRV260X_HAPTICS)	+= drv260x.o
 obj-$(CONFIG_INPUT_DRV2665_HAPTICS)	+= drv2665.o
 obj-$(CONFIG_INPUT_DRV2667_HAPTICS)	+= drv2667.o
-obj-$(CONFIG_INPUT_GP2A)		+= gp2ap002a00f.o
 obj-$(CONFIG_INPUT_GPIO_BEEPER)		+= gpio-beeper.o
 obj-$(CONFIG_INPUT_GPIO_DECODER)	+= gpio_decoder.o
 obj-$(CONFIG_INPUT_GPIO_VIBRA)		+= gpio-vibra.o
diff --git a/drivers/input/misc/gp2ap002a00f.c b/drivers/input/misc/gp2ap002a00f.c
deleted file mode 100644
index 90abda8eea67..000000000000
--- a/drivers/input/misc/gp2ap002a00f.c
+++ /dev/null
@@ -1,281 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) 2011 Sony Ericsson Mobile Communications Inc.
- *
- * Author: Courtney Cavin <courtney.cavin@sonyericsson.com>
- * Prepared for up-stream by: Oskar Andero <oskar.andero@sonyericsson.com>
- */
-
-#include <linux/i2c.h>
-#include <linux/irq.h>
-#include <linux/slab.h>
-#include <linux/input.h>
-#include <linux/module.h>
-#include <linux/interrupt.h>
-#include <linux/gpio.h>
-#include <linux/delay.h>
-#include <linux/input/gp2ap002a00f.h>
-
-struct gp2a_data {
-	struct input_dev *input;
-	const struct gp2a_platform_data *pdata;
-	struct i2c_client *i2c_client;
-};
-
-enum gp2a_addr {
-	GP2A_ADDR_PROX	= 0x0,
-	GP2A_ADDR_GAIN	= 0x1,
-	GP2A_ADDR_HYS	= 0x2,
-	GP2A_ADDR_CYCLE	= 0x3,
-	GP2A_ADDR_OPMOD	= 0x4,
-	GP2A_ADDR_CON	= 0x6
-};
-
-enum gp2a_controls {
-	/* Software Shutdown control: 0 = shutdown, 1 = normal operation */
-	GP2A_CTRL_SSD	= 0x01
-};
-
-static int gp2a_report(struct gp2a_data *dt)
-{
-	int vo = gpio_get_value(dt->pdata->vout_gpio);
-
-	input_report_switch(dt->input, SW_FRONT_PROXIMITY, !vo);
-	input_sync(dt->input);
-
-	return 0;
-}
-
-static irqreturn_t gp2a_irq(int irq, void *handle)
-{
-	struct gp2a_data *dt = handle;
-
-	gp2a_report(dt);
-
-	return IRQ_HANDLED;
-}
-
-static int gp2a_enable(struct gp2a_data *dt)
-{
-	return i2c_smbus_write_byte_data(dt->i2c_client, GP2A_ADDR_OPMOD,
-					 GP2A_CTRL_SSD);
-}
-
-static int gp2a_disable(struct gp2a_data *dt)
-{
-	return i2c_smbus_write_byte_data(dt->i2c_client, GP2A_ADDR_OPMOD,
-					 0x00);
-}
-
-static int gp2a_device_open(struct input_dev *dev)
-{
-	struct gp2a_data *dt = input_get_drvdata(dev);
-	int error;
-
-	error = gp2a_enable(dt);
-	if (error < 0) {
-		dev_err(&dt->i2c_client->dev,
-			"unable to activate, err %d\n", error);
-		return error;
-	}
-
-	gp2a_report(dt);
-
-	return 0;
-}
-
-static void gp2a_device_close(struct input_dev *dev)
-{
-	struct gp2a_data *dt = input_get_drvdata(dev);
-	int error;
-
-	error = gp2a_disable(dt);
-	if (error < 0)
-		dev_err(&dt->i2c_client->dev,
-			"unable to deactivate, err %d\n", error);
-}
-
-static int gp2a_initialize(struct gp2a_data *dt)
-{
-	int error;
-
-	error = i2c_smbus_write_byte_data(dt->i2c_client, GP2A_ADDR_GAIN,
-					  0x08);
-	if (error < 0)
-		return error;
-
-	error = i2c_smbus_write_byte_data(dt->i2c_client, GP2A_ADDR_HYS,
-					  0xc2);
-	if (error < 0)
-		return error;
-
-	error = i2c_smbus_write_byte_data(dt->i2c_client, GP2A_ADDR_CYCLE,
-					  0x04);
-	if (error < 0)
-		return error;
-
-	error = gp2a_disable(dt);
-
-	return error;
-}
-
-static int gp2a_probe(struct i2c_client *client,
-				const struct i2c_device_id *id)
-{
-	const struct gp2a_platform_data *pdata = dev_get_platdata(&client->dev);
-	struct gp2a_data *dt;
-	int error;
-
-	if (!pdata)
-		return -EINVAL;
-
-	if (pdata->hw_setup) {
-		error = pdata->hw_setup(client);
-		if (error < 0)
-			return error;
-	}
-
-	error = gpio_request_one(pdata->vout_gpio, GPIOF_IN, GP2A_I2C_NAME);
-	if (error)
-		goto err_hw_shutdown;
-
-	dt = kzalloc(sizeof(struct gp2a_data), GFP_KERNEL);
-	if (!dt) {
-		error = -ENOMEM;
-		goto err_free_gpio;
-	}
-
-	dt->pdata = pdata;
-	dt->i2c_client = client;
-
-	error = gp2a_initialize(dt);
-	if (error < 0)
-		goto err_free_mem;
-
-	dt->input = input_allocate_device();
-	if (!dt->input) {
-		error = -ENOMEM;
-		goto err_free_mem;
-	}
-
-	input_set_drvdata(dt->input, dt);
-
-	dt->input->open = gp2a_device_open;
-	dt->input->close = gp2a_device_close;
-	dt->input->name = GP2A_I2C_NAME;
-	dt->input->id.bustype = BUS_I2C;
-	dt->input->dev.parent = &client->dev;
-
-	input_set_capability(dt->input, EV_SW, SW_FRONT_PROXIMITY);
-
-	error = request_threaded_irq(client->irq, NULL, gp2a_irq,
-			IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING |
-				IRQF_ONESHOT,
-			GP2A_I2C_NAME, dt);
-	if (error) {
-		dev_err(&client->dev, "irq request failed\n");
-		goto err_free_input_dev;
-	}
-
-	error = input_register_device(dt->input);
-	if (error) {
-		dev_err(&client->dev, "device registration failed\n");
-		goto err_free_irq;
-	}
-
-	device_init_wakeup(&client->dev, pdata->wakeup);
-	i2c_set_clientdata(client, dt);
-
-	return 0;
-
-err_free_irq:
-	free_irq(client->irq, dt);
-err_free_input_dev:
-	input_free_device(dt->input);
-err_free_mem:
-	kfree(dt);
-err_free_gpio:
-	gpio_free(pdata->vout_gpio);
-err_hw_shutdown:
-	if (pdata->hw_shutdown)
-		pdata->hw_shutdown(client);
-	return error;
-}
-
-static int gp2a_remove(struct i2c_client *client)
-{
-	struct gp2a_data *dt = i2c_get_clientdata(client);
-	const struct gp2a_platform_data *pdata = dt->pdata;
-
-	free_irq(client->irq, dt);
-
-	input_unregister_device(dt->input);
-	kfree(dt);
-
-	gpio_free(pdata->vout_gpio);
-
-	if (pdata->hw_shutdown)
-		pdata->hw_shutdown(client);
-
-	return 0;
-}
-
-static int __maybe_unused gp2a_suspend(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct gp2a_data *dt = i2c_get_clientdata(client);
-	int retval = 0;
-
-	if (device_may_wakeup(&client->dev)) {
-		enable_irq_wake(client->irq);
-	} else {
-		mutex_lock(&dt->input->mutex);
-		if (dt->input->users)
-			retval = gp2a_disable(dt);
-		mutex_unlock(&dt->input->mutex);
-	}
-
-	return retval;
-}
-
-static int __maybe_unused gp2a_resume(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct gp2a_data *dt = i2c_get_clientdata(client);
-	int retval = 0;
-
-	if (device_may_wakeup(&client->dev)) {
-		disable_irq_wake(client->irq);
-	} else {
-		mutex_lock(&dt->input->mutex);
-		if (dt->input->users)
-			retval = gp2a_enable(dt);
-		mutex_unlock(&dt->input->mutex);
-	}
-
-	return retval;
-}
-
-static SIMPLE_DEV_PM_OPS(gp2a_pm, gp2a_suspend, gp2a_resume);
-
-static const struct i2c_device_id gp2a_i2c_id[] = {
-	{ GP2A_I2C_NAME, 0 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, gp2a_i2c_id);
-
-static struct i2c_driver gp2a_i2c_driver = {
-	.driver = {
-		.name	= GP2A_I2C_NAME,
-		.pm	= &gp2a_pm,
-	},
-	.probe		= gp2a_probe,
-	.remove		= gp2a_remove,
-	.id_table	= gp2a_i2c_id,
-};
-
-module_i2c_driver(gp2a_i2c_driver);
-
-MODULE_AUTHOR("Courtney Cavin <courtney.cavin@sonyericsson.com>");
-MODULE_DESCRIPTION("Sharp GP2AP002A00F I2C Proximity/Opto sensor driver");
-MODULE_LICENSE("GPL v2");
-- 
2.21.1

