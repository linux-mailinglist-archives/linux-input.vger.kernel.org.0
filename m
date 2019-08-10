Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B44A088742
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 02:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729721AbfHJAUq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 20:20:46 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33173 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729445AbfHJAUp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 20:20:45 -0400
Received: by mail-pl1-f195.google.com with SMTP id c14so45491771plo.0;
        Fri, 09 Aug 2019 17:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wJIxEPvH2bf63/Jsd4SwkQpSS2ia5erdko+RwrgAnJA=;
        b=pHEwCBz+NADDc/FDOz25gOQm/I9RSwxXvJiFC5VJkjvvhAf0RYKYZF1tRrOU9WobzJ
         75Md4MaoTWLK3qWgKPK0rtXn2D0WfF580ollLYz8Hxt6VGP9sAjWUiUu6LRDxajW7qGH
         ILEd/SjDiQxGjnMjlT8zHukesgllz+0XOevSa9C22h1rg9a3gwjDNXpU9EtcH4H1Nxoa
         3KDj5X09juEpjDTjuGLJmQbPa+zi+LCDE7y3dJvzP9c2q/zeuCUJVl5xBK1Zky0LbbWN
         6V2phURfDJpid+kyhCiWKx0fMRapkwI44J9pAnzlQg0v3ohWKawzERVJXlme+y3IGDzG
         WbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wJIxEPvH2bf63/Jsd4SwkQpSS2ia5erdko+RwrgAnJA=;
        b=QyI9eow8zEqEFu/vq8IFXykAKYz74StAwQyn0FGhu4y5OVXZIpUQCoQBBbVwkjD3GC
         usP4tSM6o2oVCrl9xZub9w33VbvrMV0bukuw7YyCZfejtoM74wuOTFeBtee3qSvguvLA
         oCxCxypsdTV4MMUTImBXPCZ9UyPRkzBuPV0uz6JttPeIA1D4/SDv9/NhddC7bLW5hhnK
         AxW7swUSxWlp0rxJ95GPXc6H8IjrW2QXioysf/9Zk91+o0MpEnGIX6XCaR7EsuPNA8tc
         HQfkO30tXUOJ9idZm43rggo983A8gXVYdj1P0eCL6l2+BAeuOtoAxjT6BjdXN5bvU253
         KY6g==
X-Gm-Message-State: APjAAAWVSW+QcRzRzh/w4AO752DsxnXmayMpWIiFwf5Rp3adb9vrRki6
        TAA7crCsbSJ8ZijjmhSxefz5TWgg
X-Google-Smtp-Source: APXvYqx7a4u756zMlLZ3QznqiWyvtR896ffQB8Y8wuDn/rlS+isCYO2lZOkyQ3vJe8o4SAEwKCZ/4g==
X-Received: by 2002:a17:902:b413:: with SMTP id x19mr19075359plr.121.1565396444181;
        Fri, 09 Aug 2019 17:20:44 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v185sm110701150pfb.14.2019.08.09.17.20.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 17:20:43 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] Input: bu21013_ts - convert to use GPIO descriptors
Date:   Fri,  9 Aug 2019 17:20:30 -0700
Message-Id: <20190810002039.95876-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
References: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

This driver can use GPIO descriptors rather than GPIO numbers
without any problems, convert it. Name the field variables after
the actual pins on the chip rather than the "reset" and "touch"
names from the devicetree bindings that are vaguely inaccurate.

No in-tree users pass GPIO numbers in platform data so drop
this. Descriptor tables can be used to get these GPIOs from a board
file if need be.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 .../bindings/input/touchscreen/bu21013.txt    |  5 +-
 drivers/input/touchscreen/bu21013_ts.c        | 86 ++++++++-----------
 include/linux/input/bu21013.h                 |  4 -
 3 files changed, 41 insertions(+), 54 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt b/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
index 56d835242af2..43899fc36ecf 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
@@ -2,10 +2,11 @@
 
 Required properties:
  - compatible              : "rohm,bu21013_tp"
- - reg                     :  I2C device address
+ - reg                     : I2C device address
+ - reset-gpios             : GPIO pin enabling (selecting) chip (CS)
 
 Optional properties:
- - touch-gpio              : GPIO pin registering a touch event
+ - touch-gpios             : GPIO pin registering a touch event
  - <supply_name>-supply    : Phandle to a regulator supply
  - rohm,touch-max-x        : Maximum outward permitted limit in the X axis
  - rohm,touch-max-y        : Maximum outward permitted limit in the Y axis
diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index 1d703e230ac3..c20f86f98ffc 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -14,11 +14,9 @@
 #include <linux/slab.h>
 #include <linux/regulator/consumer.h>
 #include <linux/module.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 
-#define PEN_DOWN_INTR	0
 #define MAX_FINGERS	2
 #define RESET_DELAY	30
 #define PENUP_TIMEOUT	(10)
@@ -143,8 +141,9 @@
  * @touch_stopped: touch stop flag
  * @chip: pointer to the touch panel controller
  * @in_dev: pointer to the input device structure
- * @intr_pin: interrupt pin value
  * @regulator: pointer to the Regulator used for touch screen
+ * @cs_gpiod: chip select GPIO line
+ * @int_gpiod: touch interrupt GPIO line
  *
  * Touch panel device data structure
  */
@@ -154,8 +153,9 @@ struct bu21013_ts_data {
 	const struct bu21013_platform_device *chip;
 	struct input_dev *in_dev;
 	struct regulator *regulator;
+	struct gpio_desc *cs_gpiod;
+	struct gpio_desc *int_gpiod;
 	unsigned int irq;
-	unsigned int intr_pin;
 	bool touch_stopped;
 };
 
@@ -257,20 +257,21 @@ static irqreturn_t bu21013_gpio_irq(int irq, void *device_data)
 {
 	struct bu21013_ts_data *data = device_data;
 	struct i2c_client *i2c = data->client;
+	int keep_polling;
 	int retval;
 
 	do {
 		retval = bu21013_do_touch_report(data);
 		if (retval < 0) {
 			dev_err(&i2c->dev, "bu21013_do_touch_report failed\n");
-			return IRQ_NONE;
+			break;
 		}
 
-		data->intr_pin = gpio_get_value(data->chip->touch_pin);
-		if (data->intr_pin == PEN_DOWN_INTR)
+		keep_polling = gpiod_get_value(data->int_gpiod);
+		if (keep_polling)
 			wait_event_timeout(data->wait, data->touch_stopped,
 					   msecs_to_jiffies(2));
-	} while (!data->intr_pin && !data->touch_stopped);
+	} while (keep_polling && !data->touch_stopped);
 
 	return IRQ_HANDLED;
 }
@@ -425,28 +426,6 @@ static void bu21013_free_irq(struct bu21013_ts_data *bu21013_data)
 	free_irq(bu21013_data->irq, bu21013_data);
 }
 
-/**
- * bu21013_cs_disable() - deconfigures the touch panel controller
- * @bu21013_data: device structure pointer
- *
- * This function is used to deconfigure the chip selection
- * for touch panel controller.
- */
-static void bu21013_cs_disable(struct bu21013_ts_data *bu21013_data)
-{
-	int error;
-
-	error = gpio_direction_output(bu21013_data->chip->cs_pin, 0);
-	if (error < 0)
-		dev_warn(&bu21013_data->client->dev,
-			 "%s: gpio direction failed, error: %d\n",
-			 __func__, error);
-	else
-		gpio_set_value(bu21013_data->chip->cs_pin, 0);
-
-	gpio_free(bu21013_data->chip->cs_pin);
-}
-
 #ifdef CONFIG_OF
 static const struct bu21013_platform_device *
 bu21013_parse_dt(struct device *dev)
@@ -471,9 +450,6 @@ bu21013_parse_dt(struct device *dev)
 	of_property_read_u32(np, "rohm,touch-max-x", &pdata->touch_x_max);
 	of_property_read_u32(np, "rohm,touch-max-y", &pdata->touch_y_max);
 
-	pdata->touch_pin = of_get_named_gpio(np, "touch-gpio", 0);
-	pdata->cs_pin = of_get_named_gpio(np, "reset-gpio", 0);
-
 	pdata->ext_clk = false;
 
 	return pdata;
@@ -516,11 +492,6 @@ static int bu21013_probe(struct i2c_client *client,
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
@@ -529,16 +500,26 @@ static int bu21013_probe(struct i2c_client *client,
 		goto err_free_mem;
 	}
 
+	/* Named "INT" on the chip, DT binding is "touch" */
+	bu21013_data->int_gpiod = gpiod_get(&client->dev, "touch", GPIOD_IN);
+	error = PTR_ERR_OR_ZERO(bu21013_data->int_gpiod);
+	if (error) {
+		if (error != -EPROBE_DEFER)
+			dev_err(&client->dev, "failed to get INT GPIO\n");
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
 		dev_err(&client->dev, "regulator_get failed\n");
 		error = PTR_ERR(bu21013_data->regulator);
-		goto err_free_mem;
+		goto err_put_int_gpio;
 	}
 
 	error = regulator_enable(bu21013_data->regulator);
@@ -550,13 +531,16 @@ static int bu21013_probe(struct i2c_client *client,
 	bu21013_data->touch_stopped = false;
 	init_waitqueue_head(&bu21013_data->wait);
 
-	/* configure the gpio pins */
-	error = gpio_request_one(pdata->cs_pin, GPIOF_OUT_INIT_HIGH,
-				 "touchp_reset");
-	if (error < 0) {
-		dev_err(&client->dev, "Unable to request gpio reset_pin\n");
+	/* Named "CS" on the chip, DT binding is "reset" */
+	bu21013_data->cs_gpiod = gpiod_get(&client->dev, "reset",
+					   GPIOD_OUT_HIGH);
+	error = PTR_ERR_OR_ZERO(bu21013_data->cs_gpiod);
+	if (error) {
+		if (error != -EPROBE_DEFER)
+			dev_err(&client->dev, "failed to get CS GPIO\n");
 		goto err_disable_regulator;
 	}
+	gpiod_set_consumer_name(bu21013_data->cs_gpiod, "BU21013 CS");
 
 	/* configure the touch panel controller */
 	error = bu21013_init_chip(bu21013_data);
@@ -604,11 +588,14 @@ static int bu21013_probe(struct i2c_client *client,
 err_free_irq:
 	bu21013_free_irq(bu21013_data);
 err_cs_disable:
-	bu21013_cs_disable(bu21013_data);
+	gpiod_set_value(bu21013_data->cs_gpiod, 0);
+	gpiod_put(bu21013_data->cs_gpiod);
 err_disable_regulator:
 	regulator_disable(bu21013_data->regulator);
 err_put_regulator:
 	regulator_put(bu21013_data->regulator);
+err_put_int_gpio:
+	gpiod_put(bu21013_data->int_gpiod);
 err_free_mem:
 	input_free_device(in_dev);
 	kfree(bu21013_data);
@@ -628,13 +615,16 @@ static int bu21013_remove(struct i2c_client *client)
 
 	bu21013_free_irq(bu21013_data);
 
-	bu21013_cs_disable(bu21013_data);
+	gpiod_set_value(bu21013_data->cs_gpiod, 0);
+	gpiod_put(bu21013_data->cs_gpiod);
 
 	input_unregister_device(bu21013_data->in_dev);
 
 	regulator_disable(bu21013_data->regulator);
 	regulator_put(bu21013_data->regulator);
 
+	gpiod_put(bu21013_data->int_gpiod);
+
 	kfree(bu21013_data);
 
 	return 0;
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
2.23.0.rc1.153.gdeed80330f-goog

