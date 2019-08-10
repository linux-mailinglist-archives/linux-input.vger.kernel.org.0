Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34C2B88749
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 02:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726125AbfHJAVK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 20:21:10 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:39241 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730032AbfHJAUx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 20:20:53 -0400
Received: by mail-pg1-f195.google.com with SMTP id u17so46619848pgi.6;
        Fri, 09 Aug 2019 17:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bP866RJhE0Aw3c4PzYQXFFenn8Oj6jLB5TldzC/ljuY=;
        b=Dla7mIvHWr+cir1J4FvT0qPq4gF4X4gwataq5NcMBqZv1mLp3kO/uL9IgI4Br1UrIR
         ej56pHLkTEkY/tE4vwrhbUwyzKZD0Kng/9VOVDVQYgd/qY6l4wg70/GuhEyj/0VSKEiq
         ZlaSC4aTU/QG+GQOWkx4+HiVLjSYSIF8n2ZZNz7oRN8tE9WiZrD9qh8BeNEZ53ssvV24
         ox6TAh9XNiPTBqwWD7kqe50ezfbVH70egnkbpMuYQB9uP8fjFXjAJthRBQKFH/Yj7kcl
         UN8GxatoyvoHU9w5/n4Zykz+zlpopTrq7bf+jZtggVTV3Ssl3zVPa2x5TqVxcodMaBGl
         mviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bP866RJhE0Aw3c4PzYQXFFenn8Oj6jLB5TldzC/ljuY=;
        b=p342h6RumphUos+qw1LU16609o+BHsEN5b/dhVR5AhEV9sgbYccmTb59M/+BMHYrVB
         4ZKKx3Gz7ASKFjA2ySd3x0pdntl67nTsNQ24Rvvg3h5Nj5thFgR7GloSzM9qjqlkfnWE
         0hqjQhXDTtFETv0M4XuPOaKk12S7ZRBRjBGmrsfOEzUwIY7s5NIy90HsSgq9FSoOaiCK
         2txcL+2VtUYj5v3mWax1FHFnJ50XpNba6pWjcMowTPhoBBdaU381qClheSp9idyqIJwF
         Thu+oXqnfPhw2w1qYusNu88zGvJu7LByn9Hixor4O5qWFReuD+TYVUlMRqV5xoHF9T4D
         rmRQ==
X-Gm-Message-State: APjAAAWsZ2WXUl2sRI+c76pKGA3qqqkEFQ88YZokpGvxSqh39DcYefAj
        WnQUL8LuodHQC3F72bdcdJw=
X-Google-Smtp-Source: APXvYqyTldKJFNlvC64ZnOefDoIGzLwP5EmqZGy588f633Q2BAGx6NUtzmTi8Nzj1B0suONepHMlJw==
X-Received: by 2002:a62:3103:: with SMTP id x3mr23876544pfx.107.1565396451898;
        Fri, 09 Aug 2019 17:20:51 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v185sm110701150pfb.14.2019.08.09.17.20.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 17:20:51 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] Input: bu21013_ts - switch to using standard touchscreen properties
Date:   Fri,  9 Aug 2019 17:20:39 -0700
Message-Id: <20190810002039.95876-12-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
In-Reply-To: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
References: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This switches the driver over to the standard touchscreen properties for
coordinate transformation, while keeping old bindings working as well.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 .../bindings/input/touchscreen/bu21013.txt    | 16 ++++--
 drivers/input/touchscreen/bu21013_ts.c        | 54 +++++++++++--------
 2 files changed, 46 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt b/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
index 7ddb5de8343d..da4c9d8b99b1 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/bu21013.txt
@@ -10,6 +10,16 @@ Required properties:
 Optional properties:
  - touch-gpios             : GPIO pin registering a touch event
  - <supply_name>-supply    : Phandle to a regulator supply
+ - touchscreen-size-x      : General touchscreen binding, see [1].
+ - touchscreen-size-y      : General touchscreen binding, see [1].
+ - touchscreen-inverted-x  : General touchscreen binding, see [1].
+ - touchscreen-inverted-y  : General touchscreen binding, see [1].
+ - touchscreen-swapped-x-y : General touchscreen binding, see [1].
+
+[1] All general touchscreen properties are described in
+    Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt.
+
+Deprecated properties:
  - rohm,touch-max-x        : Maximum outward permitted limit in the X axis
  - rohm,touch-max-y        : Maximum outward permitted limit in the Y axis
  - rohm,flip-x             : Flip touch coordinates on the X axis
@@ -26,8 +36,8 @@ Example:
 			touch-gpio = <&gpio2 20 GPIO_ACTIVE_LOW>;
 			avdd-supply = <&ab8500_ldo_aux1_reg>;
 
-			rohm,touch-max-x = <384>;
-			rohm,touch-max-y = <704>;
-			rohm,flip-y;
+			touchscreen-size-x = <384>;
+			touchscreen-size-y = <704>;
+			touchscreen-inverted-y;
 		};
 	};
diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index 2c534aa61687..c89a00a6e67c 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -10,6 +10,7 @@
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -139,6 +140,7 @@
  * struct bu21013_ts - touch panel data structure
  * @client: pointer to the i2c client
  * @in_dev: pointer to the input device structure
+ * @props: the device coordinate transformation properties
  * @regulator: pointer to the Regulator used for touch screen
  * @cs_gpiod: chip select GPIO line
  * @int_gpiod: touch interrupt GPIO line
@@ -155,6 +157,7 @@
 struct bu21013_ts {
 	struct i2c_client *client;
 	struct input_dev *in_dev;
+	struct touchscreen_properties props;
 	struct regulator *regulator;
 	struct gpio_desc *cs_gpiod;
 	struct gpio_desc *int_gpiod;
@@ -201,19 +204,13 @@ static int bu21013_do_touch_report(struct bu21013_ts *ts)
 
 	for (i = 0; i < MAX_FINGERS; i++) {
 		const u8 *data = &buf[4 * i + 3];
-		struct input_mt_pos *p = &pos[finger_down_count];
+		unsigned int x, y;
 
-		p->x = data[0] << SHIFT_2 | (data[1] & MASK_BITS);
-		p->y = data[2] << SHIFT_2 | (data[3] & MASK_BITS);
-		if (p->x == 0 || p->y == 0)
-			continue;
-
-		finger_down_count++;
-
-		if (ts->x_flip)
-			p->x = ts->touch_x_max - p->x;
-		if (ts->y_flip)
-			p->y = ts->touch_y_max - p->y;
+		x = data[0] << SHIFT_2 | (data[1] & MASK_BITS);
+		y = data[2] << SHIFT_2 | (data[3] & MASK_BITS);
+		if (x != 0 && y != 0)
+			touchscreen_set_mt_pos(&pos[finger_down_count++],
+					       &ts->props, x, y);
 	}
 
 	if (finger_down_count == 2 &&
@@ -412,6 +409,8 @@ static int bu21013_probe(struct i2c_client *client,
 {
 	struct bu21013_ts *ts;
 	struct input_dev *in_dev;
+	struct input_absinfo *info;
+	u32 max_x = 0, max_y = 0;
 	int error;
 
 	if (!i2c_check_functionality(client->adapter,
@@ -434,11 +433,6 @@ static int bu21013_probe(struct i2c_client *client,
 	ts->x_flip = device_property_read_bool(&client->dev, "rohm,flip-x");
 	ts->y_flip = device_property_read_bool(&client->dev, "rohm,flip-y");
 
-	device_property_read_u32(&client->dev, "rohm,touch-max-x",
-				 &ts->touch_x_max);
-	device_property_read_u32(&client->dev, "rohm,touch-max-y",
-				 &ts->touch_y_max);
-
 	in_dev = devm_input_allocate_device(&client->dev);
 	if (!in_dev) {
 		dev_err(&client->dev, "device memory alloc failed\n");
@@ -451,10 +445,28 @@ static int bu21013_probe(struct i2c_client *client,
 	in_dev->name = DRIVER_TP;
 	in_dev->id.bustype = BUS_I2C;
 
-	input_set_abs_params(in_dev, ABS_MT_POSITION_X,
-			     0, ts->touch_x_max, 0, 0);
-	input_set_abs_params(in_dev, ABS_MT_POSITION_Y,
-			     0, ts->touch_y_max, 0, 0);
+	device_property_read_u32(&client->dev, "rohm,touch-max-x", &max_x);
+	device_property_read_u32(&client->dev, "rohm,touch-max-y", &max_y);
+
+	input_set_abs_params(in_dev, ABS_MT_POSITION_X, 0, max_x, 0, 0);
+	input_set_abs_params(in_dev, ABS_MT_POSITION_Y, 0, max_y, 0, 0);
+
+	touchscreen_parse_properties(in_dev, true, &ts->props);
+
+	/* Adjust for the legacy "flip" properties, if present */
+	if (!ts->props.invert_x &&
+	    device_property_read_bool(&client->dev, "rohm,flip-x")) {
+		info = &in_dev->absinfo[ABS_MT_POSITION_X];
+		info->maximum -= info->minimum;
+		info->minimum = 0;
+	}
+
+	if (!ts->props.invert_y &&
+	    device_property_read_bool(&client->dev, "rohm,flip-y")) {
+		info = &in_dev->absinfo[ABS_MT_POSITION_Y];
+		info->maximum -= info->minimum;
+		info->minimum = 0;
+	}
 
 	error = input_mt_init_slots(in_dev, MAX_FINGERS,
 				    INPUT_MT_DIRECT | INPUT_MT_TRACK |
-- 
2.23.0.rc1.153.gdeed80330f-goog

