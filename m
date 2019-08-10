Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 291A28873C
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 02:20:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729892AbfHJAUt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 20:20:49 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36987 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729860AbfHJAUt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 20:20:49 -0400
Received: by mail-pf1-f196.google.com with SMTP id 19so46858113pfa.4;
        Fri, 09 Aug 2019 17:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cNDE711K4VOJSIGZbYD1NFgiJGml0MdHNvMWvdhK/x4=;
        b=svTBFUQcBCJWu2nj2Gcyf0OTy4E6Vvg/mBr/Mlulcwkdws1gxd9iCeFPEHJlTIT7R6
         tBdUOgddUnJV1gNZR7Rt5CtUoENCH4zLVGZYjjyENmlr0uNEGkR8Puamap6TKoDLxdKK
         JKR9dkpI2pxlGN03W+8p+8u7RPmBb+lHIqgZZisYbKKgCZ9EetGYTDFwf3Yhd7wOQ5SG
         TJi2gwKlgeQnNxmNlAe2TTaF4LjbFsxj/5mGlL1w7vWLI86yD3076NUAukl3i3KSmyAv
         8217uLqKNXn60X4gnNDZ5g2l/Sf8tgvxVopkTyqwgO7NjZAqFbIHq1gC8rcCi4fDGwE1
         Y8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cNDE711K4VOJSIGZbYD1NFgiJGml0MdHNvMWvdhK/x4=;
        b=r90uUX09X+NQs36P8C6OnyO4MuXHSCoxo8Z86DUshULYf9HDAhrWfkKTxCl5pXXs+T
         DYw5fMJffVnHKE+iZqZLB0W78Frjqtb7M2c5evF9n6quWB4OifTXMkOCUo7wzxjdwOlo
         jkf2f4MKnoj4+vsKYhcAz9OCq8C2D/VovupsBDtobzIBmnTIu+oFuSuroU+cWQOwO5D7
         NK+bqBawFTWc/PDZr57bLao3NHPgO6+SxqSIJGZvnD/EJr51NY+2ahKiiIibUM52WD2d
         K50LC7P5GW4Js5kSkKeiDD1tIys0AUhjCpim191KBBsxdrXinucN9qWbqHBWwgxL5Sqd
         suOA==
X-Gm-Message-State: APjAAAXJA2AlpYRAv/57Zv6086GjzsQMyzlnxUSabsaRTgt4QzFwkG+K
        O3mXbnxliUKlZqrsyGb10MA=
X-Google-Smtp-Source: APXvYqz9ke2xEUxICoZWMmT/1xlaFGmZS65YIWFfWEdvpg1a4egovM+v0KYGY/dy4Eq2tZqiYyh5JA==
X-Received: by 2002:a17:90a:9386:: with SMTP id q6mr11847066pjo.81.1565396448186;
        Fri, 09 Aug 2019 17:20:48 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v185sm110701150pfb.14.2019.08.09.17.20.46
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 17:20:46 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] Input: bu21013_ts - convert to using managed resources
Date:   Fri,  9 Aug 2019 17:20:34 -0700
Message-Id: <20190810002039.95876-7-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
References: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This allows trimming error unwinding and device removal handling.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/bu21013_ts.c | 182 ++++++++++++-------------
 1 file changed, 84 insertions(+), 98 deletions(-)

diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index a5230f6ea5f0..4b6f9544e94a 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -137,7 +137,6 @@
 /**
  * struct bu21013_ts - touch panel data structure
  * @client: pointer to the i2c client
- * @wait: variable to wait_queue_head_t structure
  * @touch_stopped: touch stop flag
  * @chip: pointer to the touch panel controller
  * @in_dev: pointer to the input device structure
@@ -149,7 +148,6 @@
  */
 struct bu21013_ts {
 	struct i2c_client *client;
-	wait_queue_head_t wait;
 	const struct bu21013_platform_device *chip;
 	struct input_dev *in_dev;
 	struct regulator *regulator;
@@ -242,11 +240,13 @@ static irqreturn_t bu21013_gpio_irq(int irq, void *device_data)
 			break;
 		}
 
+		if (unlikely(ts->touch_stopped))
+			break;
+
 		keep_polling = gpiod_get_value(ts->int_gpiod);
 		if (keep_polling)
-			wait_event_timeout(ts->wait, ts->touch_stopped,
-					   msecs_to_jiffies(2));
-	} while (keep_polling && !ts->touch_stopped);
+			usleep_range(2000, 2500);
+	} while (keep_polling);
 
 	return IRQ_HANDLED;
 }
@@ -388,20 +388,6 @@ static int bu21013_init_chip(struct bu21013_ts *ts)
 	return 0;
 }
 
-/**
- * bu21013_free_irq() - frees IRQ registered for touchscreen
- * @ts: device structure pointer
- *
- * This function signals interrupt thread to stop processing and
- * frees interrupt.
- */
-static void bu21013_free_irq(struct bu21013_ts *ts)
-{
-	ts->touch_stopped = true;
-	wake_up(&ts->wait);
-	free_irq(ts->irq, ts);
-}
-
 #ifdef CONFIG_OF
 static const struct bu21013_platform_device *
 bu21013_parse_dt(struct device *dev)
@@ -439,6 +425,20 @@ bu21013_parse_dt(struct device *dev)
 }
 #endif
 
+static void bu21013_power_off(void *_ts)
+{
+	struct bu21013_ts *ts = ts;
+
+	regulator_disable(ts->regulator);
+}
+
+static void bu21013_disable_chip(void *_ts)
+{
+	struct bu21013_ts *ts = ts;
+
+	gpiod_set_value(ts->cs_gpiod, 0);
+}
+
 static int bu21013_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -460,133 +460,119 @@ static int bu21013_probe(struct i2c_client *client,
 			return PTR_ERR(pdata);
 	}
 
-	ts = kzalloc(sizeof(*ts), GFP_KERNEL);
-	in_dev = input_allocate_device();
-	if (!ts || !in_dev) {
+	ts = devm_kzalloc(&client->dev, sizeof(*ts), GFP_KERNEL);
+	if (!ts)
+		return -ENOMEM;
+
+	ts->chip = pdata;
+	ts->client = client;
+
+	in_dev = devm_input_allocate_device(&client->dev);
+	if (!in_dev) {
 		dev_err(&client->dev, "device memory alloc failed\n");
-		error = -ENOMEM;
-		goto err_free_mem;
+		return -ENOMEM;
 	}
+	ts->in_dev = in_dev;
 
-	/* Named "INT" on the chip, DT binding is "touch" */
-	ts->int_gpiod = gpiod_get(&client->dev, "touch", GPIOD_IN);
-	error = PTR_ERR_OR_ZERO(ts->int_gpiod);
-	if (error) {
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev, "failed to get INT GPIO\n");
-		goto err_free_mem;
-	}
-	gpiod_set_consumer_name(ts->int_gpiod, "BU21013 INT");
+	/* register the device to input subsystem */
+	in_dev->name = DRIVER_TP;
+	in_dev->id.bustype = BUS_I2C;
 
-	ts->in_dev = in_dev;
-	ts->chip = pdata;
-	ts->client = client;
-	ts->irq = gpiod_to_irq(ts->int_gpiod);
+	__set_bit(EV_SYN, in_dev->evbit);
+	__set_bit(EV_KEY, in_dev->evbit);
+	__set_bit(EV_ABS, in_dev->evbit);
+
+	input_set_abs_params(in_dev, ABS_MT_POSITION_X,
+			     0, pdata->touch_x_max, 0, 0);
+	input_set_abs_params(in_dev, ABS_MT_POSITION_Y,
+			     0, pdata->touch_y_max, 0, 0);
+	input_set_drvdata(in_dev, ts);
 
-	ts->regulator = regulator_get(&client->dev, "avdd");
+	ts->regulator = devm_regulator_get(&client->dev, "avdd");
 	if (IS_ERR(ts->regulator)) {
 		dev_err(&client->dev, "regulator_get failed\n");
-		error = PTR_ERR(ts->regulator);
-		goto err_put_int_gpio;
+		return PTR_ERR(ts->regulator);
 	}
 
 	error = regulator_enable(ts->regulator);
-	if (error < 0) {
+	if (error) {
 		dev_err(&client->dev, "regulator enable failed\n");
-		goto err_put_regulator;
+		return error;
 	}
 
-	ts->touch_stopped = false;
-	init_waitqueue_head(&ts->wait);
+	error = devm_add_action_or_reset(&client->dev, bu21013_power_off, ts);
+	if (error) {
+		dev_err(&client->dev, "failed to install power off handler\n");
+		return error;
+	}
 
 	/* Named "CS" on the chip, DT binding is "reset" */
-	ts->cs_gpiod = gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
+	ts->cs_gpiod = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
 	error = PTR_ERR_OR_ZERO(ts->cs_gpiod);
 	if (error) {
 		if (error != -EPROBE_DEFER)
 			dev_err(&client->dev, "failed to get CS GPIO\n");
-		goto err_disable_regulator;
+		return error;
 	}
 	gpiod_set_consumer_name(ts->cs_gpiod, "BU21013 CS");
 
+	error = devm_add_action_or_reset(&client->dev,
+					 bu21013_disable_chip, ts);
+	if (error) {
+		dev_err(&client->dev,
+			"failed to install chip disable handler\n");
+		return error;
+	}
+
+	/* Named "INT" on the chip, DT binding is "touch" */
+	ts->int_gpiod = devm_gpiod_get(&client->dev, "touch", GPIOD_IN);
+	error = PTR_ERR_OR_ZERO(ts->int_gpiod);
+	if (error) {
+		if (error != -EPROBE_DEFER)
+			dev_err(&client->dev, "failed to get INT GPIO\n");
+		return error;
+	}
+	gpiod_set_consumer_name(ts->int_gpiod, "BU21013 INT");
+
 	/* configure the touch panel controller */
 	error = bu21013_init_chip(ts);
 	if (error) {
 		dev_err(&client->dev, "error in bu21013 config\n");
-		goto err_cs_disable;
+		return error;
 	}
 
-	/* register the device to input subsystem */
-	in_dev->name = DRIVER_TP;
-	in_dev->id.bustype = BUS_I2C;
-	in_dev->dev.parent = &client->dev;
-
-	__set_bit(EV_SYN, in_dev->evbit);
-	__set_bit(EV_KEY, in_dev->evbit);
-	__set_bit(EV_ABS, in_dev->evbit);
-
-	input_set_abs_params(in_dev, ABS_MT_POSITION_X,
-			     0, pdata->touch_x_max, 0, 0);
-	input_set_abs_params(in_dev, ABS_MT_POSITION_Y,
-			     0, pdata->touch_y_max, 0, 0);
-	input_set_drvdata(in_dev, ts);
-
-	error = request_threaded_irq(ts->irq, NULL, bu21013_gpio_irq,
-				     IRQF_TRIGGER_FALLING | IRQF_SHARED |
-					IRQF_ONESHOT,
-				     DRIVER_TP, ts);
+	ts->irq = gpiod_to_irq(ts->int_gpiod);
+	error = devm_request_threaded_irq(&client->dev, ts->irq,
+					  NULL, bu21013_gpio_irq,
+					  IRQF_TRIGGER_FALLING |
+						IRQF_SHARED |
+						IRQF_ONESHOT,
+					  DRIVER_TP, ts);
 	if (error) {
 		dev_err(&client->dev, "request irq %d failed\n",
 			ts->irq);
-		goto err_cs_disable;
+		return error;
 	}
 
 	error = input_register_device(in_dev);
 	if (error) {
 		dev_err(&client->dev, "failed to register input device\n");
-		goto err_free_irq;
+		return error;
 	}
 
 	device_init_wakeup(&client->dev, pdata->wakeup);
 	i2c_set_clientdata(client, ts);
 
 	return 0;
-
-err_free_irq:
-	bu21013_free_irq(ts);
-err_cs_disable:
-	gpiod_set_value(ts->cs_gpiod, 0);
-	gpiod_put(ts->cs_gpiod);
-err_disable_regulator:
-	regulator_disable(ts->regulator);
-err_put_regulator:
-	regulator_put(ts->regulator);
-err_put_int_gpio:
-	gpiod_put(ts->int_gpiod);
-err_free_mem:
-	input_free_device(in_dev);
-	kfree(ts);
-
-	return error;
 }
 
 static int bu21013_remove(struct i2c_client *client)
 {
 	struct bu21013_ts *ts = i2c_get_clientdata(client);
 
-	bu21013_free_irq(ts);
-
-	gpiod_set_value(ts->cs_gpiod, 0);
-	gpiod_put(ts->cs_gpiod);
-
-	input_unregister_device(ts->in_dev);
-
-	regulator_disable(ts->regulator);
-	regulator_put(ts->regulator);
-
-	gpiod_put(ts->int_gpiod);
-
-	kfree(ts);
+	/* Make sure IRQ will exit quickly even if there is contact */
+	ts->touch_stopped = true;
+	/* The resources will be freed by devm */
 
 	return 0;
 }
-- 
2.23.0.rc1.153.gdeed80330f-goog

