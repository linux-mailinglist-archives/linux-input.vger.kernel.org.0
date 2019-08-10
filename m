Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFB888873A
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 02:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729821AbfHJAUs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 20:20:48 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36529 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbfHJAUr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 20:20:47 -0400
Received: by mail-pg1-f194.google.com with SMTP id l21so46614005pgm.3;
        Fri, 09 Aug 2019 17:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UfDWiqCUWtakL7ismq8XSlg35hXXX07qicwud/uYAo4=;
        b=W+gfiS++qMw/LMwetUMPVu2DETlh4Rm/twVzFh/7bxmTadvFwc3XyKBG4JUL+XjOie
         sKOjc5bHJv5Q/R6zTbKnl4VodI+JB3VCWEOLQn/I9rkeKeK+6N+mauPFtynjXC0toPjQ
         2mGuxjwww1O+hzfCOEoukRPndGfYPw9eatUQfnkoVc9RZYZxGhJ93uCUq9aIx+iC6Jps
         zhChRTTjtXQ3r2rHp0e8aOgp7Ra5F7fmLKtqKWqYwXFKv9rkCaM1rR9aLp1XUagsDKGe
         NqeVprNVFF8Cpl7JL/VYS9QsHewjDxz8s1e+C+CJIlg5933jnmGKANS8U4yspQVFlVT5
         iCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UfDWiqCUWtakL7ismq8XSlg35hXXX07qicwud/uYAo4=;
        b=RxZpVa8nRrPx89VrX937R6iHifVfCad/qh7RNzVzJv+JyAiSpi9Y1HLxd5lSMKJ/br
         QTxLzfC7+VYFD0K2ws6PQmax8nOeVzwoee/CvZ0daN4Gq7q9zceexA8r3LhtMW05+wKL
         SrySxuMi8xeK2Rdk+ppevsYFM+PEwpXQpLuOy8c7a/sey6KHZWHv26Q6FtGL/18eR6Qy
         07CwuDRgdKVyeNCYgvyWcyxSD1psdFCUkp4sr68CRL497pve2wgQJmAda8nMgqL6Bolg
         wWn+iywf+5LhhVxRUU9SaeFFzLOEP9ySknXAEeG1VLaV9VPkqRIR4EiNFdNvWwqkd0L1
         ZDrg==
X-Gm-Message-State: APjAAAX/kJATv2ByZsuTSQqCdWdlwni5ccmQXKj449chiWVJpEa0XXvZ
        Jn3OHDwKTdT7sWwofxMe0kI=
X-Google-Smtp-Source: APXvYqxtPBKP2QJGdUWa7jedrGGK1fAKGJJhiEQqOhNGXY5xiCm2+RZuAf3smYSK4ZP5g+XqN0LGdw==
X-Received: by 2002:a62:483:: with SMTP id 125mr25005579pfe.245.1565396444830;
        Fri, 09 Aug 2019 17:20:44 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v185sm110701150pfb.14.2019.08.09.17.20.44
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 17:20:44 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] Input: bu21013_ts - rename some variables
Date:   Fri,  9 Aug 2019 17:20:31 -0700
Message-Id: <20190810002039.95876-4-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
References: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

"bu21013_data" and "struct bu21013_ts_data" are a tad long, let's call them
"ts" and "struct bu21013_ts".

Also rename retval to error in bu21013_init_chip() and adjust formatting;
i2c_smbus_write_byte_data() returns negative on error and 0 on success, so
we simply test if whether erro is 0 or not.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/bu21013_ts.c | 376 +++++++++++++------------
 1 file changed, 190 insertions(+), 186 deletions(-)

diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index c20f86f98ffc..e9cb020ed725 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -135,7 +135,7 @@
 #define DRIVER_TP	"bu21013_tp"
 
 /**
- * struct bu21013_ts_data - touch panel data structure
+ * struct bu21013_ts - touch panel data structure
  * @client: pointer to the i2c client
  * @wait: variable to wait_queue_head_t structure
  * @touch_stopped: touch stop flag
@@ -147,7 +147,7 @@
  *
  * Touch panel device data structure
  */
-struct bu21013_ts_data {
+struct bu21013_ts {
 	struct i2c_client *client;
 	wait_queue_head_t wait;
 	const struct bu21013_platform_device *chip;
@@ -161,34 +161,35 @@ struct bu21013_ts_data {
 
 /**
  * bu21013_read_block_data(): read the touch co-ordinates
- * @data: bu21013_ts_data structure pointer
+ * @data: bu21013_ts structure pointer
  * @buf: byte pointer
  *
  * Read the touch co-ordinates using i2c read block into buffer
  * and returns integer.
  */
-static int bu21013_read_block_data(struct bu21013_ts_data *data, u8 *buf)
+static int bu21013_read_block_data(struct bu21013_ts *ts, u8 *buf)
 {
 	int ret, i;
 
 	for (i = 0; i < I2C_RETRY_COUNT; i++) {
-		ret = i2c_smbus_read_i2c_block_data
-			(data->client, BU21013_SENSORS_BTN_0_7_REG,
-				LENGTH_OF_BUFFER, buf);
+		ret = i2c_smbus_read_i2c_block_data(ts->client,
+						    BU21013_SENSORS_BTN_0_7_REG,
+						    LENGTH_OF_BUFFER, buf);
 		if (ret == LENGTH_OF_BUFFER)
 			return 0;
 	}
+
 	return -EINVAL;
 }
 
 /**
  * bu21013_do_touch_report(): Get the touch co-ordinates
- * @data: bu21013_ts_data structure pointer
+ * @data: bu21013_ts structure pointer
  *
  * Get the touch co-ordinates from touch sensor registers and writes
  * into device structure and returns integer.
  */
-static int bu21013_do_touch_report(struct bu21013_ts_data *data)
+static int bu21013_do_touch_report(struct bu21013_ts *ts)
 {
 	u8	buf[LENGTH_OF_BUFFER];
 	unsigned int pos_x[2], pos_y[2];
@@ -196,10 +197,7 @@ static int bu21013_do_touch_report(struct bu21013_ts_data *data)
 	int	finger_down_count = 0;
 	int	i;
 
-	if (data == NULL)
-		return -EINVAL;
-
-	if (bu21013_read_block_data(data, buf) < 0)
+	if (bu21013_read_block_data(ts, buf) < 0)
 		return -EINVAL;
 
 	has_x_sensors = hweight32(buf[0] & BU21013_SENSORS_EN_0_7);
@@ -227,21 +225,21 @@ static int bu21013_do_touch_report(struct bu21013_ts_data *data)
 		}
 
 		for (i = 0; i < finger_down_count; i++) {
-			if (data->chip->x_flip)
-				pos_x[i] = data->chip->touch_x_max - pos_x[i];
-			if (data->chip->y_flip)
-				pos_y[i] = data->chip->touch_y_max - pos_y[i];
+			if (ts->chip->x_flip)
+				pos_x[i] = ts->chip->touch_x_max - pos_x[i];
+			if (ts->chip->y_flip)
+				pos_y[i] = ts->chip->touch_y_max - pos_y[i];
 
-			input_report_abs(data->in_dev,
+			input_report_abs(ts->in_dev,
 					 ABS_MT_POSITION_X, pos_x[i]);
-			input_report_abs(data->in_dev,
+			input_report_abs(ts->in_dev,
 					 ABS_MT_POSITION_Y, pos_y[i]);
-			input_mt_sync(data->in_dev);
+			input_mt_sync(ts->in_dev);
 		}
 	} else
-		input_mt_sync(data->in_dev);
+		input_mt_sync(ts->in_dev);
 
-	input_sync(data->in_dev);
+	input_sync(ts->in_dev);
 
 	return 0;
 }
@@ -255,23 +253,22 @@ static int bu21013_do_touch_report(struct bu21013_ts_data *data)
  */
 static irqreturn_t bu21013_gpio_irq(int irq, void *device_data)
 {
-	struct bu21013_ts_data *data = device_data;
-	struct i2c_client *i2c = data->client;
+	struct bu21013_ts *ts = device_data;
 	int keep_polling;
-	int retval;
+	int error;
 
 	do {
-		retval = bu21013_do_touch_report(data);
-		if (retval < 0) {
-			dev_err(&i2c->dev, "bu21013_do_touch_report failed\n");
+		error = bu21013_do_touch_report(ts);
+		if (error) {
+			dev_err(&ts->client->dev, "%s failed\n", __func__);
 			break;
 		}
 
-		keep_polling = gpiod_get_value(data->int_gpiod);
+		keep_polling = gpiod_get_value(ts->int_gpiod);
 		if (keep_polling)
-			wait_event_timeout(data->wait, data->touch_stopped,
+			wait_event_timeout(ts->wait, ts->touch_stopped,
 					   msecs_to_jiffies(2));
-	} while (keep_polling && !data->touch_stopped);
+	} while (keep_polling && !ts->touch_stopped);
 
 	return IRQ_HANDLED;
 }
@@ -283,130 +280,138 @@ static irqreturn_t bu21013_gpio_irq(int irq, void *device_data)
  * This function is used to power on
  * the bu21013 controller and returns integer.
  */
-static int bu21013_init_chip(struct bu21013_ts_data *data)
+static int bu21013_init_chip(struct bu21013_ts *ts)
 {
-	int retval;
-	struct i2c_client *i2c = data->client;
+	struct i2c_client *client = ts->client;
+	int error;
 
-	retval = i2c_smbus_write_byte_data(i2c, BU21013_RESET_REG,
-					BU21013_RESET_ENABLE);
-	if (retval < 0) {
-		dev_err(&i2c->dev, "BU21013_RESET reg write failed\n");
-		return retval;
+	error = i2c_smbus_write_byte_data(client, BU21013_RESET_REG,
+					  BU21013_RESET_ENABLE);
+	if (error) {
+		dev_err(&client->dev, "BU21013_RESET reg write failed\n");
+		return error;
 	}
 	msleep(RESET_DELAY);
 
-	retval = i2c_smbus_write_byte_data(i2c, BU21013_SENSOR_0_7_REG,
-					BU21013_SENSORS_EN_0_7);
-	if (retval < 0) {
-		dev_err(&i2c->dev, "BU21013_SENSOR_0_7 reg write failed\n");
-		return retval;
+	error = i2c_smbus_write_byte_data(client, BU21013_SENSOR_0_7_REG,
+					  BU21013_SENSORS_EN_0_7);
+	if (error) {
+		dev_err(&client->dev, "BU21013_SENSOR_0_7 reg write failed\n");
+		return error;
 	}
 
-	retval = i2c_smbus_write_byte_data(i2c, BU21013_SENSOR_8_15_REG,
-						BU21013_SENSORS_EN_8_15);
-	if (retval < 0) {
-		dev_err(&i2c->dev, "BU21013_SENSOR_8_15 reg write failed\n");
-		return retval;
+	error = i2c_smbus_write_byte_data(client, BU21013_SENSOR_8_15_REG,
+					  BU21013_SENSORS_EN_8_15);
+	if (error) {
+		dev_err(&client->dev, "BU21013_SENSOR_8_15 reg write failed\n");
+		return error;
 	}
 
-	retval = i2c_smbus_write_byte_data(i2c, BU21013_SENSOR_16_23_REG,
-						BU21013_SENSORS_EN_16_23);
-	if (retval < 0) {
-		dev_err(&i2c->dev, "BU21013_SENSOR_16_23 reg write failed\n");
-		return retval;
+	error = i2c_smbus_write_byte_data(client, BU21013_SENSOR_16_23_REG,
+					  BU21013_SENSORS_EN_16_23);
+	if (error) {
+		dev_err(&client->dev, "BU21013_SENSOR_16_23 reg write failed\n");
+		return error;
 	}
 
-	retval = i2c_smbus_write_byte_data(i2c, BU21013_POS_MODE1_REG,
-				(BU21013_POS_MODE1_0 | BU21013_POS_MODE1_1));
-	if (retval < 0) {
-		dev_err(&i2c->dev, "BU21013_POS_MODE1 reg write failed\n");
-		return retval;
+	error = i2c_smbus_write_byte_data(client, BU21013_POS_MODE1_REG,
+					  BU21013_POS_MODE1_0 |
+						BU21013_POS_MODE1_1);
+	if (error) {
+		dev_err(&client->dev, "BU21013_POS_MODE1 reg write failed\n");
+		return error;
 	}
 
-	retval = i2c_smbus_write_byte_data(i2c, BU21013_POS_MODE2_REG,
-			(BU21013_POS_MODE2_ZERO | BU21013_POS_MODE2_AVG1 |
-			BU21013_POS_MODE2_AVG2 | BU21013_POS_MODE2_EN_RAW |
-			BU21013_POS_MODE2_MULTI));
-	if (retval < 0) {
-		dev_err(&i2c->dev, "BU21013_POS_MODE2 reg write failed\n");
-		return retval;
+	error = i2c_smbus_write_byte_data(client, BU21013_POS_MODE2_REG,
+					  BU21013_POS_MODE2_ZERO |
+						BU21013_POS_MODE2_AVG1 |
+						BU21013_POS_MODE2_AVG2 |
+						BU21013_POS_MODE2_EN_RAW |
+						BU21013_POS_MODE2_MULTI);
+	if (error) {
+		dev_err(&client->dev, "BU21013_POS_MODE2 reg write failed\n");
+		return error;
 	}
 
-	if (data->chip->ext_clk)
-		retval = i2c_smbus_write_byte_data(i2c, BU21013_CLK_MODE_REG,
-			(BU21013_CLK_MODE_EXT | BU21013_CLK_MODE_CALIB));
+	if (ts->chip->ext_clk)
+		error = i2c_smbus_write_byte_data(client, BU21013_CLK_MODE_REG,
+						  BU21013_CLK_MODE_EXT |
+							BU21013_CLK_MODE_CALIB);
 	else
-		retval = i2c_smbus_write_byte_data(i2c, BU21013_CLK_MODE_REG,
-			(BU21013_CLK_MODE_DIV | BU21013_CLK_MODE_CALIB));
-	if (retval < 0) {
-		dev_err(&i2c->dev, "BU21013_CLK_MODE reg write failed\n");
-		return retval;
+		error = i2c_smbus_write_byte_data(client, BU21013_CLK_MODE_REG,
+						  BU21013_CLK_MODE_DIV |
+							BU21013_CLK_MODE_CALIB);
+	if (error) {
+		dev_err(&client->dev, "BU21013_CLK_MODE reg write failed\n");
+		return error;
 	}
 
-	retval = i2c_smbus_write_byte_data(i2c, BU21013_IDLE_REG,
-				(BU21013_IDLET_0 | BU21013_IDLE_INTERMIT_EN));
-	if (retval < 0) {
-		dev_err(&i2c->dev, "BU21013_IDLE reg write failed\n");
-		return retval;
+	error = i2c_smbus_write_byte_data(client, BU21013_IDLE_REG,
+					  BU21013_IDLET_0 |
+						BU21013_IDLE_INTERMIT_EN);
+	if (error) {
+		dev_err(&client->dev, "BU21013_IDLE reg write failed\n");
+		return error;
 	}
 
-	retval = i2c_smbus_write_byte_data(i2c, BU21013_INT_MODE_REG,
-						BU21013_INT_MODE_LEVEL);
-	if (retval < 0) {
-		dev_err(&i2c->dev, "BU21013_INT_MODE reg write failed\n");
-		return retval;
+	error = i2c_smbus_write_byte_data(client, BU21013_INT_MODE_REG,
+					  BU21013_INT_MODE_LEVEL);
+	if (error) {
+		dev_err(&client->dev, "BU21013_INT_MODE reg write failed\n");
+		return error;
 	}
 
-	retval = i2c_smbus_write_byte_data(i2c, BU21013_FILTER_REG,
-						(BU21013_DELTA_0_6 |
-							BU21013_FILTER_EN));
-	if (retval < 0) {
-		dev_err(&i2c->dev, "BU21013_FILTER reg write failed\n");
-		return retval;
+	error = i2c_smbus_write_byte_data(client, BU21013_FILTER_REG,
+					  BU21013_DELTA_0_6 |
+						BU21013_FILTER_EN);
+	if (error) {
+		dev_err(&client->dev, "BU21013_FILTER reg write failed\n");
+		return error;
 	}
 
-	retval = i2c_smbus_write_byte_data(i2c, BU21013_TH_ON_REG,
-					BU21013_TH_ON_5);
-	if (retval < 0) {
-		dev_err(&i2c->dev, "BU21013_TH_ON reg write failed\n");
-		return retval;
+	error = i2c_smbus_write_byte_data(client, BU21013_TH_ON_REG,
+					  BU21013_TH_ON_5);
+	if (error) {
+		dev_err(&client->dev, "BU21013_TH_ON reg write failed\n");
+		return error;
 	}
 
-	retval = i2c_smbus_write_byte_data(i2c, BU21013_TH_OFF_REG,
-				BU21013_TH_OFF_4 | BU21013_TH_OFF_3);
-	if (retval < 0) {
-		dev_err(&i2c->dev, "BU21013_TH_OFF reg write failed\n");
-		return retval;
+	error = i2c_smbus_write_byte_data(client, BU21013_TH_OFF_REG,
+					  BU21013_TH_OFF_4 | BU21013_TH_OFF_3);
+	if (error) {
+		dev_err(&client->dev, "BU21013_TH_OFF reg write failed\n");
+		return error;
 	}
 
-	retval = i2c_smbus_write_byte_data(i2c, BU21013_GAIN_REG,
-					(BU21013_GAIN_0 | BU21013_GAIN_1));
-	if (retval < 0) {
-		dev_err(&i2c->dev, "BU21013_GAIN reg write failed\n");
-		return retval;
+	error = i2c_smbus_write_byte_data(client, BU21013_GAIN_REG,
+					  BU21013_GAIN_0 | BU21013_GAIN_1);
+	if (error) {
+		dev_err(&client->dev, "BU21013_GAIN reg write failed\n");
+		return error;
 	}
 
-	retval = i2c_smbus_write_byte_data(i2c, BU21013_OFFSET_MODE_REG,
-					BU21013_OFFSET_MODE_DEFAULT);
-	if (retval < 0) {
-		dev_err(&i2c->dev, "BU21013_OFFSET_MODE reg write failed\n");
-		return retval;
+	error = i2c_smbus_write_byte_data(client, BU21013_OFFSET_MODE_REG,
+					  BU21013_OFFSET_MODE_DEFAULT);
+	if (error) {
+		dev_err(&client->dev, "BU21013_OFFSET_MODE reg write failed\n");
+		return error;
 	}
 
-	retval = i2c_smbus_write_byte_data(i2c, BU21013_XY_EDGE_REG,
-				(BU21013_X_EDGE_0 | BU21013_X_EDGE_2 |
-				BU21013_Y_EDGE_1 | BU21013_Y_EDGE_3));
-	if (retval < 0) {
-		dev_err(&i2c->dev, "BU21013_XY_EDGE reg write failed\n");
-		return retval;
+	error = i2c_smbus_write_byte_data(client, BU21013_XY_EDGE_REG,
+					  BU21013_X_EDGE_0 |
+						BU21013_X_EDGE_2 |
+						BU21013_Y_EDGE_1 |
+						BU21013_Y_EDGE_3);
+	if (error) {
+		dev_err(&client->dev, "BU21013_XY_EDGE reg write failed\n");
+		return error;
 	}
 
-	retval = i2c_smbus_write_byte_data(i2c, BU21013_DONE_REG,
-							BU21013_DONE);
-	if (retval < 0) {
-		dev_err(&i2c->dev, "BU21013_REG_DONE reg write failed\n");
-		return retval;
+	error = i2c_smbus_write_byte_data(client, BU21013_DONE_REG,
+					  BU21013_DONE);
+	if (error) {
+		dev_err(&client->dev, "BU21013_REG_DONE reg write failed\n");
+		return error;
 	}
 
 	return 0;
@@ -414,16 +419,16 @@ static int bu21013_init_chip(struct bu21013_ts_data *data)
 
 /**
  * bu21013_free_irq() - frees IRQ registered for touchscreen
- * @bu21013_data: device structure pointer
+ * @ts: device structure pointer
  *
  * This function signals interrupt thread to stop processing and
  * frees interrupt.
  */
-static void bu21013_free_irq(struct bu21013_ts_data *bu21013_data)
+static void bu21013_free_irq(struct bu21013_ts *ts)
 {
-	bu21013_data->touch_stopped = true;
-	wake_up(&bu21013_data->wait);
-	free_irq(bu21013_data->irq, bu21013_data);
+	ts->touch_stopped = true;
+	wake_up(&ts->wait);
+	free_irq(ts->irq, ts);
 }
 
 #ifdef CONFIG_OF
@@ -476,12 +481,12 @@ static int bu21013_probe(struct i2c_client *client,
 {
 	const struct bu21013_platform_device *pdata =
 					dev_get_platdata(&client->dev);
-	struct bu21013_ts_data *bu21013_data;
+	struct bu21013_ts *ts;
 	struct input_dev *in_dev;
 	int error;
 
 	if (!i2c_check_functionality(client->adapter,
-					I2C_FUNC_SMBUS_BYTE_DATA)) {
+				     I2C_FUNC_SMBUS_BYTE_DATA)) {
 		dev_err(&client->dev, "i2c smbus byte data not supported\n");
 		return -EIO;
 	}
@@ -492,58 +497,57 @@ static int bu21013_probe(struct i2c_client *client,
 			return PTR_ERR(pdata);
 	}
 
-	bu21013_data = kzalloc(sizeof(struct bu21013_ts_data), GFP_KERNEL);
+	ts = kzalloc(sizeof(*ts), GFP_KERNEL);
 	in_dev = input_allocate_device();
-	if (!bu21013_data || !in_dev) {
+	if (!ts || !in_dev) {
 		dev_err(&client->dev, "device memory alloc failed\n");
 		error = -ENOMEM;
 		goto err_free_mem;
 	}
 
 	/* Named "INT" on the chip, DT binding is "touch" */
-	bu21013_data->int_gpiod = gpiod_get(&client->dev, "touch", GPIOD_IN);
-	error = PTR_ERR_OR_ZERO(bu21013_data->int_gpiod);
+	ts->int_gpiod = gpiod_get(&client->dev, "touch", GPIOD_IN);
+	error = PTR_ERR_OR_ZERO(ts->int_gpiod);
 	if (error) {
 		if (error != -EPROBE_DEFER)
 			dev_err(&client->dev, "failed to get INT GPIO\n");
 		goto err_free_mem;
 	}
-	gpiod_set_consumer_name(bu21013_data->int_gpiod, "BU21013 INT");
+	gpiod_set_consumer_name(ts->int_gpiod, "BU21013 INT");
 
-	bu21013_data->in_dev = in_dev;
-	bu21013_data->chip = pdata;
-	bu21013_data->client = client;
-	bu21013_data->irq = gpiod_to_irq(bu21013_data->int_gpiod);
+	ts->in_dev = in_dev;
+	ts->chip = pdata;
+	ts->client = client;
+	ts->irq = gpiod_to_irq(ts->int_gpiod);
 
-	bu21013_data->regulator = regulator_get(&client->dev, "avdd");
-	if (IS_ERR(bu21013_data->regulator)) {
+	ts->regulator = regulator_get(&client->dev, "avdd");
+	if (IS_ERR(ts->regulator)) {
 		dev_err(&client->dev, "regulator_get failed\n");
-		error = PTR_ERR(bu21013_data->regulator);
+		error = PTR_ERR(ts->regulator);
 		goto err_put_int_gpio;
 	}
 
-	error = regulator_enable(bu21013_data->regulator);
+	error = regulator_enable(ts->regulator);
 	if (error < 0) {
 		dev_err(&client->dev, "regulator enable failed\n");
 		goto err_put_regulator;
 	}
 
-	bu21013_data->touch_stopped = false;
-	init_waitqueue_head(&bu21013_data->wait);
+	ts->touch_stopped = false;
+	init_waitqueue_head(&ts->wait);
 
 	/* Named "CS" on the chip, DT binding is "reset" */
-	bu21013_data->cs_gpiod = gpiod_get(&client->dev, "reset",
-					   GPIOD_OUT_HIGH);
-	error = PTR_ERR_OR_ZERO(bu21013_data->cs_gpiod);
+	ts->cs_gpiod = gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
+	error = PTR_ERR_OR_ZERO(ts->cs_gpiod);
 	if (error) {
 		if (error != -EPROBE_DEFER)
 			dev_err(&client->dev, "failed to get CS GPIO\n");
 		goto err_disable_regulator;
 	}
-	gpiod_set_consumer_name(bu21013_data->cs_gpiod, "BU21013 CS");
+	gpiod_set_consumer_name(ts->cs_gpiod, "BU21013 CS");
 
 	/* configure the touch panel controller */
-	error = bu21013_init_chip(bu21013_data);
+	error = bu21013_init_chip(ts);
 	if (error) {
 		dev_err(&client->dev, "error in bu21013 config\n");
 		goto err_cs_disable;
@@ -558,19 +562,19 @@ static int bu21013_probe(struct i2c_client *client,
 	__set_bit(EV_KEY, in_dev->evbit);
 	__set_bit(EV_ABS, in_dev->evbit);
 
-	input_set_abs_params(in_dev, ABS_MT_POSITION_X, 0,
-						pdata->touch_x_max, 0, 0);
-	input_set_abs_params(in_dev, ABS_MT_POSITION_Y, 0,
-						pdata->touch_y_max, 0, 0);
-	input_set_drvdata(in_dev, bu21013_data);
+	input_set_abs_params(in_dev, ABS_MT_POSITION_X,
+			     0, pdata->touch_x_max, 0, 0);
+	input_set_abs_params(in_dev, ABS_MT_POSITION_Y,
+			     0, pdata->touch_y_max, 0, 0);
+	input_set_drvdata(in_dev, ts);
 
-	error = request_threaded_irq(bu21013_data->irq, NULL, bu21013_gpio_irq,
+	error = request_threaded_irq(ts->irq, NULL, bu21013_gpio_irq,
 				     IRQF_TRIGGER_FALLING | IRQF_SHARED |
 					IRQF_ONESHOT,
-				     DRIVER_TP, bu21013_data);
+				     DRIVER_TP, ts);
 	if (error) {
 		dev_err(&client->dev, "request irq %d failed\n",
-			bu21013_data->irq);
+			ts->irq);
 		goto err_cs_disable;
 	}
 
@@ -581,24 +585,24 @@ static int bu21013_probe(struct i2c_client *client,
 	}
 
 	device_init_wakeup(&client->dev, pdata->wakeup);
-	i2c_set_clientdata(client, bu21013_data);
+	i2c_set_clientdata(client, ts);
 
 	return 0;
 
 err_free_irq:
-	bu21013_free_irq(bu21013_data);
+	bu21013_free_irq(ts);
 err_cs_disable:
-	gpiod_set_value(bu21013_data->cs_gpiod, 0);
-	gpiod_put(bu21013_data->cs_gpiod);
+	gpiod_set_value(ts->cs_gpiod, 0);
+	gpiod_put(ts->cs_gpiod);
 err_disable_regulator:
-	regulator_disable(bu21013_data->regulator);
+	regulator_disable(ts->regulator);
 err_put_regulator:
-	regulator_put(bu21013_data->regulator);
+	regulator_put(ts->regulator);
 err_put_int_gpio:
-	gpiod_put(bu21013_data->int_gpiod);
+	gpiod_put(ts->int_gpiod);
 err_free_mem:
 	input_free_device(in_dev);
-	kfree(bu21013_data);
+	kfree(ts);
 
 	return error;
 }
@@ -611,21 +615,21 @@ static int bu21013_probe(struct i2c_client *client,
  */
 static int bu21013_remove(struct i2c_client *client)
 {
-	struct bu21013_ts_data *bu21013_data = i2c_get_clientdata(client);
+	struct bu21013_ts *ts = i2c_get_clientdata(client);
 
-	bu21013_free_irq(bu21013_data);
+	bu21013_free_irq(ts);
 
-	gpiod_set_value(bu21013_data->cs_gpiod, 0);
-	gpiod_put(bu21013_data->cs_gpiod);
+	gpiod_set_value(ts->cs_gpiod, 0);
+	gpiod_put(ts->cs_gpiod);
 
-	input_unregister_device(bu21013_data->in_dev);
+	input_unregister_device(ts->in_dev);
 
-	regulator_disable(bu21013_data->regulator);
-	regulator_put(bu21013_data->regulator);
+	regulator_disable(ts->regulator);
+	regulator_put(ts->regulator);
 
-	gpiod_put(bu21013_data->int_gpiod);
+	gpiod_put(ts->int_gpiod);
 
-	kfree(bu21013_data);
+	kfree(ts);
 
 	return 0;
 }
@@ -640,16 +644,16 @@ static int bu21013_remove(struct i2c_client *client)
  */
 static int bu21013_suspend(struct device *dev)
 {
-	struct bu21013_ts_data *bu21013_data = dev_get_drvdata(dev);
-	struct i2c_client *client = bu21013_data->client;
+	struct bu21013_ts *ts = dev_get_drvdata(dev);
+	struct i2c_client *client = ts->client;
 
-	bu21013_data->touch_stopped = true;
+	ts->touch_stopped = true;
 	if (device_may_wakeup(&client->dev))
-		enable_irq_wake(bu21013_data->irq);
+		enable_irq_wake(ts->irq);
 	else
-		disable_irq(bu21013_data->irq);
+		disable_irq(ts->irq);
 
-	regulator_disable(bu21013_data->regulator);
+	regulator_disable(ts->regulator);
 
 	return 0;
 }
@@ -663,28 +667,28 @@ static int bu21013_suspend(struct device *dev)
  */
 static int bu21013_resume(struct device *dev)
 {
-	struct bu21013_ts_data *bu21013_data = dev_get_drvdata(dev);
-	struct i2c_client *client = bu21013_data->client;
+	struct bu21013_ts *ts = dev_get_drvdata(dev);
+	struct i2c_client *client = ts->client;
 	int retval;
 
-	retval = regulator_enable(bu21013_data->regulator);
+	retval = regulator_enable(ts->regulator);
 	if (retval < 0) {
 		dev_err(&client->dev, "bu21013 regulator enable failed\n");
 		return retval;
 	}
 
-	retval = bu21013_init_chip(bu21013_data);
+	retval = bu21013_init_chip(ts);
 	if (retval < 0) {
 		dev_err(&client->dev, "bu21013 controller config failed\n");
 		return retval;
 	}
 
-	bu21013_data->touch_stopped = false;
+	ts->touch_stopped = false;
 
 	if (device_may_wakeup(&client->dev))
-		disable_irq_wake(bu21013_data->irq);
+		disable_irq_wake(ts->irq);
 	else
-		enable_irq(bu21013_data->irq);
+		enable_irq(ts->irq);
 
 	return 0;
 }
-- 
2.23.0.rc1.153.gdeed80330f-goog

