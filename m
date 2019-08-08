Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2C5A8649B
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2019 16:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732427AbfHHOpG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Aug 2019 10:45:06 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:35769 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730170AbfHHOpG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Aug 2019 10:45:06 -0400
Received: by mail-lf1-f66.google.com with SMTP id p197so67018814lfa.2
        for <linux-input@vger.kernel.org>; Thu, 08 Aug 2019 07:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vo+4b/94wyTNIgB3lNmRTmsTzucD11SdqB8FnxWLYkQ=;
        b=rARixpYkd7LZAN+5PNCaoUGXaY7kb/PrFaehu7pYgiyTBxqZkVJG7STC/vJ+FSYSOb
         pWgj4UahMVVdkNIDLF7SDXTpSCOtC6HuzdB811O1UNQo+1+U0H7ASwGI57HH4VM0yegU
         05FhBhAtPlGFvDT+S+c8dtJ2UNOjr97S7nmfQdsQP9qEjgP89UrPs9dlvK31n7X0bA/n
         23g5W+/XMJ7t2ODp1tmua9bcM74UKd4lrjzuypAtQNvlRFOtvdES2e3sckC+n38pFdoj
         jZlJQ9MW9s9LugnBV/4F1fwmpY6bGCLme15NdXlf5Mj4RtxlbBa1Pyv6mBwgdM+0ELxY
         059A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vo+4b/94wyTNIgB3lNmRTmsTzucD11SdqB8FnxWLYkQ=;
        b=QXasda0xYA1dhkc6PCojR8p9VT2VYQ38YkPTDSFbttXJRmaJOE9G0fRw7Hwo5jHOa/
         acEBcI8wfHfvmqLMrp+KBYJnHH0KLsometdNAZ6wWfXJh7kr5E5LHo5fl6vVPsIJmz8b
         VC8OHbsLghBadN6v2EWyMtIL5js6qNOjlEw381+KTMe1brh97GIwywNbL9TWotZSigUb
         efnK/6XV03J63XJ3HW/quDl+IGV3haayBfnE+XYPF3Qz2lL8IonMx7LM7yUV/BoBPPc/
         Ryyf+rRNji+4MeUFsodEjF70R7KoCfqSilI6dX/6By5SL6PVPm9ZUL4Huqun5RqvFn7F
         o98A==
X-Gm-Message-State: APjAAAUR7agBPGxc0UkfFo2cUWl3myuYx0cZbPUOvmMKICvgVgOdTbmZ
        w8ARwiw3VEWkWv++qIFxEOBjuQX9ySI=
X-Google-Smtp-Source: APXvYqzMtjXmKg8q1DEI/XBa2G2pP4VGogrrg56GpHS/uwf6yVX8I8Hh6qD7hWxOBhGidVoynC//dg==
X-Received: by 2002:a19:5503:: with SMTP id n3mr8933133lfe.168.1565275503457;
        Thu, 08 Aug 2019 07:45:03 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id r8sm5062493lfc.39.2019.08.08.07.45.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 08 Aug 2019 07:45:02 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] Input: bu21013_ts: Convert to use GPIO descriptors
Date:   Thu,  8 Aug 2019 16:44:58 +0200
Message-Id: <20190808144458.1258-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This driver can use GPIO descriptors rather than GPIO numbers
without any problems, convert it. Name the field variables after
the actual pins on the chip rather than the "reset" and "touch"
names from the devicetree bindings that are vaguely inaccurate.

No in-tree users pass GPIO numbers in platform data so drop
this. Descriptor tables can be used to get these GPIOs from a board
file if need be.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/input/touchscreen/bu21013_ts.c | 47 ++++++++++++++------------
 include/linux/input/bu21013.h          |  4 ---
 2 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index 1d703e230ac3..48e26543aace 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -14,9 +14,8 @@
 #include <linux/slab.h>
 #include <linux/regulator/consumer.h>
 #include <linux/module.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 
 #define PEN_DOWN_INTR	0
 #define MAX_FINGERS	2
@@ -145,6 +144,8 @@
  * @in_dev: pointer to the input device structure
  * @intr_pin: interrupt pin value
  * @regulator: pointer to the Regulator used for touch screen
+ * @cs_gpiod: chip select GPIO line
+ * @int_gpiod: touch interrupt GPIO line
  *
  * Touch panel device data structure
  */
@@ -157,6 +158,8 @@ struct bu21013_ts_data {
 	unsigned int irq;
 	unsigned int intr_pin;
 	bool touch_stopped;
+	struct gpio_desc *cs_gpiod;
+	struct gpio_desc *int_gpiod;
 };
 
 /**
@@ -266,7 +269,7 @@ static irqreturn_t bu21013_gpio_irq(int irq, void *device_data)
 			return IRQ_NONE;
 		}
 
-		data->intr_pin = gpio_get_value(data->chip->touch_pin);
+		data->intr_pin = gpiod_get_value(data->int_gpiod);
 		if (data->intr_pin == PEN_DOWN_INTR)
 			wait_event_timeout(data->wait, data->touch_stopped,
 					   msecs_to_jiffies(2));
@@ -436,15 +439,13 @@ static void bu21013_cs_disable(struct bu21013_ts_data *bu21013_data)
 {
 	int error;
 
-	error = gpio_direction_output(bu21013_data->chip->cs_pin, 0);
+	error = gpiod_direction_output(bu21013_data->cs_gpiod, 0);
 	if (error < 0)
 		dev_warn(&bu21013_data->client->dev,
 			 "%s: gpio direction failed, error: %d\n",
 			 __func__, error);
 	else
-		gpio_set_value(bu21013_data->chip->cs_pin, 0);
-
-	gpio_free(bu21013_data->chip->cs_pin);
+		gpiod_set_value(bu21013_data->cs_gpiod, 0);
 }
 
 #ifdef CONFIG_OF
@@ -471,9 +472,6 @@ bu21013_parse_dt(struct device *dev)
 	of_property_read_u32(np, "rohm,touch-max-x", &pdata->touch_x_max);
 	of_property_read_u32(np, "rohm,touch-max-y", &pdata->touch_y_max);
 
-	pdata->touch_pin = of_get_named_gpio(np, "touch-gpio", 0);
-	pdata->cs_pin = of_get_named_gpio(np, "reset-gpio", 0);
-
 	pdata->ext_clk = false;
 
 	return pdata;
@@ -516,11 +514,6 @@ static int bu21013_probe(struct i2c_client *client,
 			return PTR_ERR(pdata);
 	}
 
-	if (!gpio_is_valid(pdata->touch_pin)) {
-		dev_err(&client->dev, "invalid touch_pin supplied\n");
-		return -EINVAL;
-	}
-
 	bu21013_data = kzalloc(sizeof(struct bu21013_ts_data), GFP_KERNEL);
 	in_dev = input_allocate_device();
 	if (!bu21013_data || !in_dev) {
@@ -529,10 +522,20 @@ static int bu21013_probe(struct i2c_client *client,
 		goto err_free_mem;
 	}
 
+	/* Named "INT" on the chip, DT binding is "touch" */
+	bu21013_data->int_gpiod = devm_gpiod_get(&client->dev, "touch",
+						 GPIOD_IN);
+	if (!IS_ERR(bu21013_data->int_gpiod)) {
+		dev_err(&client->dev, "invalid INT GPIO supplied\n");
+		error = PTR_ERR(bu21013_data->int_gpiod);
+		goto err_free_mem;
+	}
+	gpiod_set_consumer_name(bu21013_data->int_gpiod, "BU21013 INT");
+
 	bu21013_data->in_dev = in_dev;
 	bu21013_data->chip = pdata;
 	bu21013_data->client = client;
-	bu21013_data->irq = gpio_to_irq(pdata->touch_pin);
+	bu21013_data->irq = gpiod_to_irq(bu21013_data->int_gpiod);
 
 	bu21013_data->regulator = regulator_get(&client->dev, "avdd");
 	if (IS_ERR(bu21013_data->regulator)) {
@@ -550,13 +553,15 @@ static int bu21013_probe(struct i2c_client *client,
 	bu21013_data->touch_stopped = false;
 	init_waitqueue_head(&bu21013_data->wait);
 
-	/* configure the gpio pins */
-	error = gpio_request_one(pdata->cs_pin, GPIOF_OUT_INIT_HIGH,
-				 "touchp_reset");
-	if (error < 0) {
-		dev_err(&client->dev, "Unable to request gpio reset_pin\n");
+	/* Named "CS" on the chip, DT binding is "reset" */
+	bu21013_data->cs_gpiod = devm_gpiod_get(&client->dev, "reset",
+						GPIOD_OUT_HIGH);
+	if (IS_ERR(bu21013_data->cs_gpiod)) {
+		dev_err(&client->dev, "invalid CS GPIO supplied\n");
+		error = PTR_ERR(bu21013_data->cs_gpiod);
 		goto err_disable_regulator;
 	}
+	gpiod_set_consumer_name(bu21013_data->cs_gpiod, "BU21013 CS");
 
 	/* configure the touch panel controller */
 	error = bu21013_init_chip(bu21013_data);
diff --git a/include/linux/input/bu21013.h b/include/linux/input/bu21013.h
index 7e5b7e978e8a..58b1a9d44443 100644
--- a/include/linux/input/bu21013.h
+++ b/include/linux/input/bu21013.h
@@ -11,8 +11,6 @@
  * struct bu21013_platform_device - Handle the platform data
  * @touch_x_max: touch x max
  * @touch_y_max: touch y max
- * @cs_pin: chip select pin
- * @touch_pin: touch gpio pin
  * @ext_clk: external clock flag
  * @x_flip: x flip flag
  * @y_flip: y flip flag
@@ -23,8 +21,6 @@
 struct bu21013_platform_device {
 	int touch_x_max;
 	int touch_y_max;
-	unsigned int cs_pin;
-	unsigned int touch_pin;
 	bool ext_clk;
 	bool x_flip;
 	bool y_flip;
-- 
2.21.0

