Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 118BA8874B
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 02:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730032AbfHJAVP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 20:21:15 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34604 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729924AbfHJAUu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 20:20:50 -0400
Received: by mail-pf1-f193.google.com with SMTP id b13so46872160pfo.1;
        Fri, 09 Aug 2019 17:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dvhZdXENHq2QaBGBIWPhSRwLYmEUcD7XmTccriSY6Bw=;
        b=BiBbnRRePNJyWMs56x/GsxpmOHKB1kK1mOBSjTDiyXI8sCW0/TW/U/srHEOhML89SJ
         fIvJcG2EHyVhyDv0l7gxszZMFfqOE1iJo7FTp4Z27+LUsl3MJqpCLGUyGBaN6167PuR9
         9Qurpziz9ihJdY1pgo/qKLqG66Honw3dT9wrIXJw+arVuG8qrS3Hbuv2jnjGz0dlqZtw
         7vNr7Q2U3ziHpDJ9GC0I5sdonuZQ7wDFxBQ0gACLpw07QjlnmAcpruICO/ipFmL753RI
         /CYPFyR+lJr/Qwhgcb1JhnFR7VTBEmvlgDuRJXD8uoj+33lAvV7h2Hu1FH/pJ89mrKnF
         szkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dvhZdXENHq2QaBGBIWPhSRwLYmEUcD7XmTccriSY6Bw=;
        b=ZajDFJQY/L+x9sxjd/AzKpjDXZtwbzt1pH4eT1/v1i0zzRsuiIXunyVUq5dVXIWuxS
         NZBUeI3B1X6pwRduKSKEvoHlUEScIJFEs3BBDagWBL2e7Go6dJ3EVfFKRhCnHenpVGUb
         f/Ivs8EpiVmNyjbkRFQILzcypmik1QkUffxYeIzqsMdh4GOgAjRh1maWBiTblfm/Ra5Z
         0xXaKTgp30Ph6pS/gvEB5X1cxPvPUmuMpyz/0AxXiJkcupcLIc7chNksT2syG1E3l9iC
         J2h2pQaK9KHULOb1b1TIOA/yTIeBE+MhDD4rjpgdidoI2RtUyXWFNmKnGBUhI310t3B2
         9ITA==
X-Gm-Message-State: APjAAAVH141yOP6ehJQkpJeFxoOm9f+PQY4vXPaVjzgVtbTqgcTQSM2C
        51wpv+D0DaIUDeTPC9t8NtQ=
X-Google-Smtp-Source: APXvYqwm1Oxs3K1AQn8EhI3IezuLSEnhURnWB+fVPuxrqWU+M190HYSXH5nrkcrY5G2etETJtKsNDA==
X-Received: by 2002:a17:90a:d996:: with SMTP id d22mr12106348pjv.86.1565396449056;
        Fri, 09 Aug 2019 17:20:49 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v185sm110701150pfb.14.2019.08.09.17.20.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 17:20:48 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] Input: bu21013_ts - remove support for platform data
Date:   Fri,  9 Aug 2019 17:20:35 -0700
Message-Id: <20190810002039.95876-8-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
References: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There are no current users of the platform data in the tree, and
any new users should either use device tree, or static device
properties to describe the device.

This change drop the platform data definition and handling and moves the
driver over to generic device properties API. We also drop support for the
external clock. If it is needed we will have to extend the bindings to
supply the clock reference and handle it properly in the driver.

Also, wakeup setting should be coming from I2C client.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/bu21013_ts.c | 109 +++++++++----------------
 include/linux/input/bu21013.h          |  30 -------
 2 files changed, 37 insertions(+), 102 deletions(-)
 delete mode 100644 include/linux/input/bu21013.h

diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index 4b6f9544e94a..79de7327a460 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -4,18 +4,18 @@
  * Author: Naveen Kumar G <naveen.gaddipati@stericsson.com> for ST-Ericsson
  */
 
-#include <linux/kernel.h>
+#include <linux/bitops.h>
 #include <linux/delay.h>
-#include <linux/interrupt.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
-#include <linux/workqueue.h>
 #include <linux/input.h>
-#include <linux/input/bu21013.h>
-#include <linux/slab.h>
-#include <linux/regulator/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/gpio/consumer.h>
-#include <linux/of.h>
+#include <linux/property.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+#include <linux/types.h>
 
 #define MAX_FINGERS	2
 #define RESET_DELAY	30
@@ -137,23 +137,32 @@
 /**
  * struct bu21013_ts - touch panel data structure
  * @client: pointer to the i2c client
- * @touch_stopped: touch stop flag
- * @chip: pointer to the touch panel controller
  * @in_dev: pointer to the input device structure
  * @regulator: pointer to the Regulator used for touch screen
  * @cs_gpiod: chip select GPIO line
  * @int_gpiod: touch interrupt GPIO line
+ * @irq: interrupt number the device is using
+ * @touch_x_max: maximum X coordinate reported by the device
+ * @touch_y_max: maximum Y coordinate reported by the device
+ * @x_flip: indicates that the driver should invert X coordinate before
+ *	reporting
+ * @y_flip: indicates that the driver should invert Y coordinate before
+ *	reporting
+ * @touch_stopped: touch stop flag
  *
  * Touch panel device data structure
  */
 struct bu21013_ts {
 	struct i2c_client *client;
-	const struct bu21013_platform_device *chip;
 	struct input_dev *in_dev;
 	struct regulator *regulator;
 	struct gpio_desc *cs_gpiod;
 	struct gpio_desc *int_gpiod;
 	unsigned int irq;
+	u32 touch_x_max;
+	u32 touch_y_max;
+	bool x_flip;
+	bool y_flip;
 	bool touch_stopped;
 };
 
@@ -208,10 +217,10 @@ static int bu21013_do_touch_report(struct bu21013_ts *ts)
 		}
 
 		for (i = 0; i < finger_down_count; i++) {
-			if (ts->chip->x_flip)
-				pos_x[i] = ts->chip->touch_x_max - pos_x[i];
-			if (ts->chip->y_flip)
-				pos_y[i] = ts->chip->touch_y_max - pos_y[i];
+			if (ts->x_flip)
+				pos_x[i] = ts->touch_x_max - pos_x[i];
+			if (ts->y_flip)
+				pos_y[i] = ts->touch_y_max - pos_y[i];
 
 			input_report_abs(ts->in_dev,
 					 ABS_MT_POSITION_X, pos_x[i]);
@@ -304,14 +313,9 @@ static int bu21013_init_chip(struct bu21013_ts *ts)
 		return error;
 	}
 
-	if (ts->chip->ext_clk)
-		error = i2c_smbus_write_byte_data(client, BU21013_CLK_MODE_REG,
-						  BU21013_CLK_MODE_EXT |
-							BU21013_CLK_MODE_CALIB);
-	else
-		error = i2c_smbus_write_byte_data(client, BU21013_CLK_MODE_REG,
-						  BU21013_CLK_MODE_DIV |
-							BU21013_CLK_MODE_CALIB);
+	error = i2c_smbus_write_byte_data(client, BU21013_CLK_MODE_REG,
+					  BU21013_CLK_MODE_DIV |
+						BU21013_CLK_MODE_CALIB);
 	if (error) {
 		dev_err(&client->dev, "BU21013_CLK_MODE reg write failed\n");
 		return error;
@@ -388,43 +392,6 @@ static int bu21013_init_chip(struct bu21013_ts *ts)
 	return 0;
 }
 
-#ifdef CONFIG_OF
-static const struct bu21013_platform_device *
-bu21013_parse_dt(struct device *dev)
-{
-	struct device_node *np = dev->of_node;
-	struct bu21013_platform_device *pdata;
-
-	if (!np) {
-		dev_err(dev, "no device tree or platform data\n");
-		return ERR_PTR(-EINVAL);
-	}
-
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return ERR_PTR(-ENOMEM);
-
-	pdata->y_flip = pdata->x_flip = false;
-
-	pdata->x_flip = of_property_read_bool(np, "rohm,flip-x");
-	pdata->y_flip = of_property_read_bool(np, "rohm,flip-y");
-
-	of_property_read_u32(np, "rohm,touch-max-x", &pdata->touch_x_max);
-	of_property_read_u32(np, "rohm,touch-max-y", &pdata->touch_y_max);
-
-	pdata->ext_clk = false;
-
-	return pdata;
-}
-#else
-static inline const struct bu21013_platform_device *
-bu21013_parse_dt(struct device *dev)
-{
-	dev_err(dev, "no platform data available\n");
-	return ERR_PTR(-EINVAL);
-}
-#endif
-
 static void bu21013_power_off(void *_ts)
 {
 	struct bu21013_ts *ts = ts;
@@ -442,8 +409,6 @@ static void bu21013_disable_chip(void *_ts)
 static int bu21013_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
-	const struct bu21013_platform_device *pdata =
-					dev_get_platdata(&client->dev);
 	struct bu21013_ts *ts;
 	struct input_dev *in_dev;
 	int error;
@@ -454,19 +419,20 @@ static int bu21013_probe(struct i2c_client *client,
 		return -EIO;
 	}
 
-	if (!pdata) {
-		pdata = bu21013_parse_dt(&client->dev);
-		if (IS_ERR(pdata))
-			return PTR_ERR(pdata);
-	}
-
 	ts = devm_kzalloc(&client->dev, sizeof(*ts), GFP_KERNEL);
 	if (!ts)
 		return -ENOMEM;
 
-	ts->chip = pdata;
 	ts->client = client;
 
+	ts->x_flip = device_property_read_bool(&client->dev, "rohm,flip-x");
+	ts->y_flip = device_property_read_bool(&client->dev, "rohm,flip-y");
+
+	device_property_read_u32(&client->dev, "rohm,touch-max-x",
+				 &ts->touch_x_max);
+	device_property_read_u32(&client->dev, "rohm,touch-max-y",
+				 &ts->touch_y_max);
+
 	in_dev = devm_input_allocate_device(&client->dev);
 	if (!in_dev) {
 		dev_err(&client->dev, "device memory alloc failed\n");
@@ -483,9 +449,9 @@ static int bu21013_probe(struct i2c_client *client,
 	__set_bit(EV_ABS, in_dev->evbit);
 
 	input_set_abs_params(in_dev, ABS_MT_POSITION_X,
-			     0, pdata->touch_x_max, 0, 0);
+			     0, ts->touch_x_max, 0, 0);
 	input_set_abs_params(in_dev, ABS_MT_POSITION_Y,
-			     0, pdata->touch_y_max, 0, 0);
+			     0, ts->touch_y_max, 0, 0);
 	input_set_drvdata(in_dev, ts);
 
 	ts->regulator = devm_regulator_get(&client->dev, "avdd");
@@ -560,7 +526,6 @@ static int bu21013_probe(struct i2c_client *client,
 		return error;
 	}
 
-	device_init_wakeup(&client->dev, pdata->wakeup);
 	i2c_set_clientdata(client, ts);
 
 	return 0;
diff --git a/include/linux/input/bu21013.h b/include/linux/input/bu21013.h
deleted file mode 100644
index 58b1a9d44443..000000000000
--- a/include/linux/input/bu21013.h
+++ /dev/null
@@ -1,30 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) ST-Ericsson SA 2010
- * Author: Naveen Kumar G <naveen.gaddipati@stericsson.com> for ST-Ericsson
- */
-
-#ifndef _BU21013_H
-#define _BU21013_H
-
-/**
- * struct bu21013_platform_device - Handle the platform data
- * @touch_x_max: touch x max
- * @touch_y_max: touch y max
- * @ext_clk: external clock flag
- * @x_flip: x flip flag
- * @y_flip: y flip flag
- * @wakeup: wakeup flag
- *
- * This is used to handle the platform data
- */
-struct bu21013_platform_device {
-	int touch_x_max;
-	int touch_y_max;
-	bool ext_clk;
-	bool x_flip;
-	bool y_flip;
-	bool wakeup;
-};
-
-#endif
-- 
2.23.0.rc1.153.gdeed80330f-goog

