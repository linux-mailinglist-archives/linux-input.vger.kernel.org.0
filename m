Return-Path: <linux-input+bounces-13182-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC787AED41C
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 07:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C5FE18942B1
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 05:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FCF17C21C;
	Mon, 30 Jun 2025 05:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2Nm+uei"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D584A23;
	Mon, 30 Jun 2025 05:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751262771; cv=none; b=AILWGYcC5iNfyp+a1OdLRP5iglod8nsR4j0gId+M9+RYAHv0mPojlLOq6aKEfbaeVDoFMzDtZ9EdnBpK5UT3TiHiWHWv1b4OcdouXs8xW6wMCmsHslWa3RWY5St/TNcvLIh+NSxWQ3vX8wWT2AvvqOKyPnUBHYkSri+ibtf0pKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751262771; c=relaxed/simple;
	bh=0jzQ7l9bGASILY1ADhstzflAMRlcmeHwWKwSOHUKhYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vD3OrMXY3MkyH0FWogvQBpi19pjF+qqdM9NCzx9KPFoPx37zXgYg2VhbUi2hIwETRWFsbMtAd3lpFZ7TPrbRy8vis770v8JGPh9sf8PiGjv6HJ+rjpvZXbysP57Xt/A17HhZJb1SKCachNUnxnUQ/bVTR5Tr/sOJiwu4vOz76TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2Nm+uei; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74ad4533ac5so4239465b3a.0;
        Sun, 29 Jun 2025 22:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751262768; x=1751867568; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pd8FEljx8I7jBuFPplv2jr5V9bIHjiPAM5MEEyq0iyU=;
        b=X2Nm+ueie+u8afn3gm2tAvYbpKJ20F2Fxj7BbQaVYQ5VxFcMqIhGrTp+9nlLQ2PRl8
         O8Y2bM39DfAZ+lpnPy8Loa+ZViagtDdYmzIfAXVtj7bqIojUka6a/tDRsWUoZcdnh7/j
         83VFKGyNq10B1gHzwgM6uNjUHt8wY3p8/UvFBaLHK4qyjyMSThNqBQUNxoxK54QKLEjj
         e/S1ST+Fx+15CxknY29rkY9kFN++HTytqqtUoSmA8+POQ+Ih55Qk8fTD3e4z+UuKmmFv
         HZyJenFFPlzeqhTmAm1FJKWAL5vSNuq8aBaiuTpzBfywWK78Sf1NCTjVHzbzWKQREoos
         wVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751262768; x=1751867568;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pd8FEljx8I7jBuFPplv2jr5V9bIHjiPAM5MEEyq0iyU=;
        b=Dh9ei/yYZbvzwu+i4RK/RUrX0hd63WHZ84ECEvXMahk5m16u76GkiNsaqs1fpfHI3S
         JR60s2n/nZRkFo+1UcRz3SAc/QYIhHC59mdBZY3k639lUCYxBIIgaMc8QVzL6d6Uusyh
         RCun2Ujz9mN85t5oyCEEXSBiZ0hxp72eqiyo7JA7ouHKLg8JYQRX/LsjeUKmZAJnmpfg
         O5iOkEN9FNEOKiRRfGykJTvYtbPkbu1g2CJJ0aMwE0XjVjZJk4LbgkizU1lTyxQ0cLik
         5XXhrs+sZhPwKTRCev2+cOKzyIEf2H3lNd9DHIZN+fauiplSG2UHaAE364dRWPIw+Y/f
         jbdw==
X-Forwarded-Encrypted: i=1; AJvYcCVvz5Csw4d+9rdJSMvGKgDT7PCtIQ4FbuqMLDjhK/afYRhcfMiqtIabXTB4ZXRSLAppB46FTycpqRF6gA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ4Cq8BPthiYyg881dNLDd/W4il5KUvSLuaSFOy7TUluIYYXRN
	odpB2JyI3vlC0gUbCSwtSJUeLaTTEZEeglkhPl7sMWBqdZBK6wpI6i8IWpKTOA==
X-Gm-Gg: ASbGncsnr45VEK+PvLyTzBMLp6LXuGfpNn+WBbPVcsDXWb0T39Ba+zj/s8M1gYzDivc
	wWrFPkMd/goQLydqg/u9KZg12a2ckbKkI+bAhoy1OXVXjWylauD/rk8abWmkdmL8WR+98z6bNbs
	vjYTKBCAsI3M3bzRLd9uJ2MjPQ00Eu9ms2JeQkgNHYGdZxGgfDAhy+1Ba3bkA96rDw/ep0k8EuI
	q0wwg/S1qatC739/H3IYQ74H2qhB9YgCgYYqllUdv4qxa1L09TvZOl0Ct4Mn6SRdI73P/v5qOzp
	5pfYP6sN39lvj+lmbKbzQToel8KOIdiyohX+F2aZgZO9R+0RqLfGh8hb33tpJyOyoJh6czP9
X-Google-Smtp-Source: AGHT+IFjl5R7oqL6A9zWhjE1ScdqLSjQF082qrxlmVGkv0Ayqcipx54YPCqGWP5LuY5zXB+koF7Uig==
X-Received: by 2002:a05:6a20:7344:b0:21f:4ecc:119d with SMTP id adf61e73a8af0-220a08dc772mr19268249637.7.1751262768123;
        Sun, 29 Jun 2025 22:52:48 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c92b:c666:1f8:990e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31da845sm7086101a12.53.2025.06.29.22.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 22:52:47 -0700 (PDT)
Date: Sun, 29 Jun 2025 22:52:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	=?utf-8?B?VG9tw6HFoSBKdcWZZW5h?= <jurenatomas@gmail.com>, linux-input@vger.kernel.org
Subject: [PATCH] Input: tca6416-keypad - remove the driver
Message-ID: <ajfsei3keh4jjasd4lshjicgqixew7bak3cmty3suoliskzgz4@vj3ijycfxy4i>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This input driver predates proper GPIO driver for the chip and now can
be replaced with the generic gpio-keys. Remove the driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/Kconfig          |  18 --
 drivers/input/keyboard/Makefile         |   1 -
 drivers/input/keyboard/tca6416-keypad.c | 305 ------------------------
 include/linux/tca6416_keypad.h          |  30 ---
 4 files changed, 354 deletions(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 721ab69e84ac..84185f080b77 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -261,24 +261,6 @@ config KEYBOARD_GPIO_POLLED
 	  To compile this driver as a module, choose M here: the
 	  module will be called gpio_keys_polled.
 
-config KEYBOARD_TCA6416
-	tristate "TCA6416/TCA6408A Keypad Support"
-	depends on I2C
-	help
-	  This driver implements basic keypad functionality
-	  for keys connected through TCA6416/TCA6408A IO expanders.
-
-	  Say Y here if your device has keys connected to
-	  TCA6416/TCA6408A IO expander. Your board-specific setup logic
-	  must also provide pin-mask details(of which TCA6416 pins
-	  are used for keypad).
-
-	  If enabled the entire TCA6416 device will be managed through
-	  this driver.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called tca6416_keypad.
-
 config KEYBOARD_TCA8418
 	tristate "TCA8418 Keypad Support"
 	depends on I2C
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
index 1e0721c30709..bc387aaa9151 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -23,7 +23,6 @@ obj-$(CONFIG_KEYBOARD_EP93XX)		+= ep93xx_keypad.o
 obj-$(CONFIG_KEYBOARD_GOLDFISH_EVENTS)	+= goldfish_events.o
 obj-$(CONFIG_KEYBOARD_GPIO)		+= gpio_keys.o
 obj-$(CONFIG_KEYBOARD_GPIO_POLLED)	+= gpio_keys_polled.o
-obj-$(CONFIG_KEYBOARD_TCA6416)		+= tca6416-keypad.o
 obj-$(CONFIG_KEYBOARD_TCA8418)		+= tca8418_keypad.o
 obj-$(CONFIG_KEYBOARD_HIL)		+= hil_kbd.o
 obj-$(CONFIG_KEYBOARD_HIL_OLD)		+= hilkbd.o
diff --git a/drivers/input/keyboard/tca6416-keypad.c b/drivers/input/keyboard/tca6416-keypad.c
deleted file mode 100644
index fbc674d7b9f0..000000000000
--- a/drivers/input/keyboard/tca6416-keypad.c
+++ /dev/null
@@ -1,305 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Driver for keys on TCA6416 I2C IO expander
- *
- * Copyright (C) 2010 Texas Instruments
- *
- * Author : Sriramakrishnan.A.G. <srk@ti.com>
- */
-
-#include <linux/types.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/delay.h>
-#include <linux/slab.h>
-#include <linux/interrupt.h>
-#include <linux/workqueue.h>
-#include <linux/i2c.h>
-#include <linux/input.h>
-#include <linux/tca6416_keypad.h>
-
-#define TCA6416_INPUT          0
-#define TCA6416_OUTPUT         1
-#define TCA6416_INVERT         2
-#define TCA6416_DIRECTION      3
-
-#define TCA6416_POLL_INTERVAL	100 /* msec */
-
-static const struct i2c_device_id tca6416_id[] = {
-	{ "tca6416-keys", 16, },
-	{ "tca6408-keys", 8, },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, tca6416_id);
-
-struct tca6416_keypad_chip {
-	uint16_t reg_output;
-	uint16_t reg_direction;
-	uint16_t reg_input;
-
-	struct i2c_client *client;
-	struct input_dev *input;
-	int io_size;
-	u16 pinmask;
-	bool use_polling;
-	struct tca6416_button buttons[];
-};
-
-static int tca6416_write_reg(struct tca6416_keypad_chip *chip, int reg, u16 val)
-{
-	int error;
-
-	error = chip->io_size > 8 ?
-		i2c_smbus_write_word_data(chip->client, reg << 1, val) :
-		i2c_smbus_write_byte_data(chip->client, reg, val);
-	if (error < 0) {
-		dev_err(&chip->client->dev,
-			"%s failed, reg: %d, val: %d, error: %d\n",
-			__func__, reg, val, error);
-		return error;
-	}
-
-	return 0;
-}
-
-static int tca6416_read_reg(struct tca6416_keypad_chip *chip, int reg, u16 *val)
-{
-	int retval;
-
-	retval = chip->io_size > 8 ?
-		 i2c_smbus_read_word_data(chip->client, reg << 1) :
-		 i2c_smbus_read_byte_data(chip->client, reg);
-	if (retval < 0) {
-		dev_err(&chip->client->dev, "%s failed, reg: %d, error: %d\n",
-			__func__, reg, retval);
-		return retval;
-	}
-
-	*val = (u16)retval;
-	return 0;
-}
-
-static void tca6416_keys_scan(struct input_dev *input)
-{
-	struct tca6416_keypad_chip *chip = input_get_drvdata(input);
-	u16 reg_val, val;
-	int error, i, pin_index;
-
-	error = tca6416_read_reg(chip, TCA6416_INPUT, &reg_val);
-	if (error)
-		return;
-
-	reg_val &= chip->pinmask;
-
-	/* Figure out which lines have changed */
-	val = reg_val ^ chip->reg_input;
-	chip->reg_input = reg_val;
-
-	for (i = 0, pin_index = 0; i < 16; i++) {
-		if (val & (1 << i)) {
-			struct tca6416_button *button = &chip->buttons[pin_index];
-			unsigned int type = button->type ?: EV_KEY;
-			int state = ((reg_val & (1 << i)) ? 1 : 0)
-						^ button->active_low;
-
-			input_event(input, type, button->code, !!state);
-			input_sync(input);
-		}
-
-		if (chip->pinmask & (1 << i))
-			pin_index++;
-	}
-}
-
-/*
- * This is threaded IRQ handler and this can (and will) sleep.
- */
-static irqreturn_t tca6416_keys_isr(int irq, void *dev_id)
-{
-	tca6416_keys_scan(dev_id);
-
-	return IRQ_HANDLED;
-}
-
-static int tca6416_keys_open(struct input_dev *dev)
-{
-	struct tca6416_keypad_chip *chip = input_get_drvdata(dev);
-
-	if (!chip->use_polling) {
-		/* Get initial device state in case it has switches */
-		tca6416_keys_scan(dev);
-		enable_irq(chip->client->irq);
-	}
-
-	return 0;
-}
-
-static void tca6416_keys_close(struct input_dev *dev)
-{
-	struct tca6416_keypad_chip *chip = input_get_drvdata(dev);
-
-	if (!chip->use_polling)
-		disable_irq(chip->client->irq);
-}
-
-static int tca6416_setup_registers(struct tca6416_keypad_chip *chip)
-{
-	int error;
-
-	error = tca6416_read_reg(chip, TCA6416_OUTPUT, &chip->reg_output);
-	if (error)
-		return error;
-
-	error = tca6416_read_reg(chip, TCA6416_DIRECTION, &chip->reg_direction);
-	if (error)
-		return error;
-
-	/* ensure that keypad pins are set to input */
-	error = tca6416_write_reg(chip, TCA6416_DIRECTION,
-				  chip->reg_direction | chip->pinmask);
-	if (error)
-		return error;
-
-	error = tca6416_read_reg(chip, TCA6416_DIRECTION, &chip->reg_direction);
-	if (error)
-		return error;
-
-	error = tca6416_read_reg(chip, TCA6416_INPUT, &chip->reg_input);
-	if (error)
-		return error;
-
-	chip->reg_input &= chip->pinmask;
-
-	return 0;
-}
-
-static int tca6416_keypad_probe(struct i2c_client *client)
-{
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
-	struct tca6416_keys_platform_data *pdata;
-	struct tca6416_keypad_chip *chip;
-	struct input_dev *input;
-	int error;
-	int i;
-
-	/* Check functionality */
-	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE)) {
-		dev_err(&client->dev, "%s adapter not supported\n",
-			dev_driver_string(&client->adapter->dev));
-		return -ENODEV;
-	}
-
-	pdata = dev_get_platdata(&client->dev);
-	if (!pdata) {
-		dev_dbg(&client->dev, "no platform data\n");
-		return -EINVAL;
-	}
-
-	chip = devm_kzalloc(&client->dev,
-			    struct_size(chip, buttons, pdata->nbuttons),
-			    GFP_KERNEL);
-	if (!chip)
-		return -ENOMEM;
-
-	input = devm_input_allocate_device(&client->dev);
-	if (!input)
-		return -ENOMEM;
-
-	chip->client = client;
-	chip->input = input;
-	chip->io_size = id->driver_data;
-	chip->pinmask = pdata->pinmask;
-	chip->use_polling = pdata->use_polling;
-
-	input->phys = "tca6416-keys/input0";
-	input->name = client->name;
-
-	input->open = tca6416_keys_open;
-	input->close = tca6416_keys_close;
-
-	input->id.bustype = BUS_HOST;
-	input->id.vendor = 0x0001;
-	input->id.product = 0x0001;
-	input->id.version = 0x0100;
-
-	/* Enable auto repeat feature of Linux input subsystem */
-	if (pdata->rep)
-		__set_bit(EV_REP, input->evbit);
-
-	for (i = 0; i < pdata->nbuttons; i++) {
-		unsigned int type;
-
-		chip->buttons[i] = pdata->buttons[i];
-		type = (pdata->buttons[i].type) ?: EV_KEY;
-		input_set_capability(input, type, pdata->buttons[i].code);
-	}
-
-	input_set_drvdata(input, chip);
-
-	/*
-	 * Initialize cached registers from their original values.
-	 * we can't share this chip with another i2c master.
-	 */
-	error = tca6416_setup_registers(chip);
-	if (error)
-		return error;
-
-	if (chip->use_polling) {
-		error = input_setup_polling(input, tca6416_keys_scan);
-		if (error) {
-			dev_err(&client->dev, "Failed to setup polling\n");
-			return error;
-		}
-
-		input_set_poll_interval(input, TCA6416_POLL_INTERVAL);
-	} else {
-		error = devm_request_threaded_irq(&client->dev, client->irq,
-						  NULL, tca6416_keys_isr,
-						  IRQF_TRIGGER_FALLING |
-							IRQF_ONESHOT |
-							IRQF_NO_AUTOEN,
-						  "tca6416-keypad", input);
-		if (error) {
-			dev_dbg(&client->dev,
-				"Unable to claim irq %d; error %d\n",
-				client->irq, error);
-			return error;
-		}
-	}
-
-	error = input_register_device(input);
-	if (error) {
-		dev_dbg(&client->dev,
-			"Unable to register input device, error: %d\n", error);
-		return error;
-	}
-
-	i2c_set_clientdata(client, chip);
-
-	return 0;
-}
-
-static struct i2c_driver tca6416_keypad_driver = {
-	.driver = {
-		.name	= "tca6416-keypad",
-	},
-	.probe		= tca6416_keypad_probe,
-	.id_table	= tca6416_id,
-};
-
-static int __init tca6416_keypad_init(void)
-{
-	return i2c_add_driver(&tca6416_keypad_driver);
-}
-
-subsys_initcall(tca6416_keypad_init);
-
-static void __exit tca6416_keypad_exit(void)
-{
-	i2c_del_driver(&tca6416_keypad_driver);
-}
-module_exit(tca6416_keypad_exit);
-
-MODULE_AUTHOR("Sriramakrishnan <srk@ti.com>");
-MODULE_DESCRIPTION("Keypad driver over tca6416 IO expander");
-MODULE_LICENSE("GPL");
diff --git a/include/linux/tca6416_keypad.h b/include/linux/tca6416_keypad.h
deleted file mode 100644
index 5cf6f6f82aa7..000000000000
--- a/include/linux/tca6416_keypad.h
+++ /dev/null
@@ -1,30 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * tca6416 keypad platform support
- *
- * Copyright (C) 2010 Texas Instruments
- *
- * Author: Sriramakrishnan <srk@ti.com>
- */
-
-#ifndef _TCA6416_KEYS_H
-#define _TCA6416_KEYS_H
-
-#include <linux/types.h>
-
-struct tca6416_button {
-	/* Configuration parameters */
-	int code;		/* input event code (KEY_*, SW_*) */
-	int active_low;
-	int type;		/* input event type (EV_KEY, EV_SW) */
-};
-
-struct tca6416_keys_platform_data {
-	struct tca6416_button *buttons;
-	int nbuttons;
-	unsigned int rep:1;	/* enable input subsystem auto repeat */
-	uint16_t pinmask;
-	uint16_t invert;
-	int use_polling;	/* use polling if Interrupt is not connected*/
-};
-#endif
-- 
2.50.0.727.gbf7dc18ff4-goog


-- 
Dmitry

