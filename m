Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C813D00C7
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2019 20:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbfJHSoM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Oct 2019 14:44:12 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40952 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbfJHSoM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Oct 2019 14:44:12 -0400
Received: by mail-pg1-f196.google.com with SMTP id d26so10750881pgl.7
        for <linux-input@vger.kernel.org>; Tue, 08 Oct 2019 11:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=50PgqGehYViQvpXVP1tBCFAPBP0FMhsxPNRitnsJyaQ=;
        b=mKml1wYyqQzdpxHvCXyACZ+aYLcDATzTY8keF8bC9BkduD5+8x5VJqZIxLJAKUeClB
         qyklUjC8Uf3xaHBHDc66SAp7sHeHG6bpWGb1zyP52opZI3/2QKcqEm+lG+MHk8AHyo1J
         0+qOQk9IuR/y9KPA25aoWBs/AmZZryEHZgI9vTZpHMcrt8ihWv1RhU5JMEqB2MTEmqvp
         IbOOXfPizO1VF9wCtExXwpexlhKh51r8BxJxfaKGsp8EeiihuPMtMMSJ+f+jP4YQAR+5
         t3OkDyqzD0i4WXBDAdj7TnkNthe+3r92Sswlp83N9iQmqUazTMkgT/4HEO8ngOh1yPwi
         DJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=50PgqGehYViQvpXVP1tBCFAPBP0FMhsxPNRitnsJyaQ=;
        b=kWilcNtJImeTiAX6xNpNeMEh3vaWoGzsHhYbzf19LTuc8lwEXWNaQFgtrCTsWRc7AO
         a9Qu8UbKp9sq9Zm5W6RQEyaulygdgUeooAuX3DjdIrevgWvTIQFTQUGd/EbpkKHkSLol
         p3C1BswMQDOmHf8D/tuqlgcPVumXGVEo8XJvvl1bZu2rR/vVo/IRJmn21vczj/0Nqr32
         O8YRqEMwpPgejwOD6ciafB3qRHUUVktcsn0gRhi9jY9t7L6P5DPZHPY8TR6u3oqteMNu
         yrpY9RUCmh3vVYo3jdYS8AnDZz633KmP0EjKwdlLuiKbfdqmvRM+r6dIHcG9bykNJkcD
         LrrA==
X-Gm-Message-State: APjAAAWQjruZLkDyCU06sCMBNY0iKisXdMlTJXkSUTBnuj/CmKaUwwxZ
        T3KK+yo22hxNO1jOqxXYKAA=
X-Google-Smtp-Source: APXvYqy6eR/fno0b1pc5x8BuLc7sOQVFld4O2Nok6GgrV/TVbEglQKysN99opAoWUp74ai2jU1cz/A==
X-Received: by 2002:aa7:9104:: with SMTP id 4mr40933214pfh.176.1570560251105;
        Tue, 08 Oct 2019 11:44:11 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id bx18sm2134621pjb.26.2019.10.08.11.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 11:44:10 -0700 (PDT)
Date:   Tue, 8 Oct 2019 11:44:08 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Roger Quadros <rogerq@ti.com>
Cc:     Fabio Estevam <festevam@gmail.com>, linux-input@vger.kernel.org,
        jcbian@pixcir.com.cn
Subject: Re: [PATCH 1/5] Input: pixcir_i2c_ts - Remove unneeded gpio.h header
 file
Message-ID: <20191008184408.GG22365@dtor-ws>
References: <20191007121607.12545-1-festevam@gmail.com>
 <ce6d29b1-1a7c-9fa4-da07-1b1d8c2a0efa@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce6d29b1-1a7c-9fa4-da07-1b1d8c2a0efa@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 08, 2019 at 01:11:15PM +0300, Roger Quadros wrote:
> Hi,
> 
> On 07/10/2019 15:16, Fabio Estevam wrote:
> > The touchscreen device is a GPIO consumer, not a GPIO controller,
> > so there is no need to include <linux/gpio.h>.
> > 
> > Remove the unneeded header file.
> > 
> > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> 
> For all 5 patches,
> 
> Reviewed-by: Roger Quadros <rogerq@ti.com>

I guess we can also do this:

Input: pixcir_i2c_ts - remove platform data

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Previous change moved platform data definition into the driver, making it
unusable for users. Given that we want to move away from custom platform
data structures, and always use device properties (DT, ACPI or static) to
configure devices, let's complete the removal.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/pixcir_i2c_ts.c |  100 +++++++----------------------
 1 file changed, 25 insertions(+), 75 deletions(-)

diff --git a/drivers/input/touchscreen/pixcir_i2c_ts.c b/drivers/input/touchscreen/pixcir_i2c_ts.c
index ec768ab6148e..9aa098577350 100644
--- a/drivers/input/touchscreen/pixcir_i2c_ts.c
+++ b/drivers/input/touchscreen/pixcir_i2c_ts.c
@@ -62,7 +62,7 @@ enum pixcir_int_mode {
 #define PIXCIR_INT_POL_HIGH	(1UL << 2)
 
 /**
- * struct pixcir_irc_chip_data - chip related data
+ * struct pixcir_i2c_chip_data - chip related data
  * @max_fingers:	Max number of fingers reported simultaneously by h/w
  * @has_hw_ids:		Hardware supports finger tracking IDs
  *
@@ -72,12 +72,6 @@ struct pixcir_i2c_chip_data {
 	bool has_hw_ids;
 };
 
-struct pixcir_ts_platform_data {
-	int x_max;
-	int y_max;
-	struct pixcir_i2c_chip_data chip;
-};
-
 struct pixcir_i2c_ts_data {
 	struct i2c_client *client;
 	struct input_dev *input;
@@ -87,7 +81,6 @@ struct pixcir_i2c_ts_data {
 	struct gpio_desc *gpio_wake;
 	const struct pixcir_i2c_chip_data *chip;
 	struct touchscreen_properties prop;
-	int max_fingers;	/* Max fingers supported in this instance */
 	bool running;
 };
 
@@ -111,7 +104,7 @@ static void pixcir_ts_parse(struct pixcir_i2c_ts_data *tsdata,
 	memset(report, 0, sizeof(struct pixcir_report_data));
 
 	i = chip->has_hw_ids ? 1 : 0;
-	readsize = 2 + tsdata->max_fingers * (4 + i);
+	readsize = 2 + tsdata->chip->max_fingers * (4 + i);
 	if (readsize > sizeof(rdbuf))
 		readsize = sizeof(rdbuf);
 
@@ -132,8 +125,8 @@ static void pixcir_ts_parse(struct pixcir_i2c_ts_data *tsdata,
 	}
 
 	touch = rdbuf[0] & 0x7;
-	if (touch > tsdata->max_fingers)
-		touch = tsdata->max_fingers;
+	if (touch > tsdata->chip->max_fingers)
+		touch = tsdata->chip->max_fingers;
 
 	report->num_touches = touch;
 	bufptr = &rdbuf[2];
@@ -469,31 +462,9 @@ static int __maybe_unused pixcir_i2c_ts_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(pixcir_dev_pm_ops,
 			 pixcir_i2c_ts_suspend, pixcir_i2c_ts_resume);
 
-#ifdef CONFIG_OF
-static const struct of_device_id pixcir_of_match[];
-
-static int pixcir_parse_dt(struct device *dev,
-			   struct pixcir_i2c_ts_data *tsdata)
-{
-	tsdata->chip = of_device_get_match_data(dev);
-	if (!tsdata->chip)
-		return -EINVAL;
-
-	return 0;
-}
-#else
-static int pixcir_parse_dt(struct device *dev,
-			   struct pixcir_i2c_ts_data *tsdata)
-{
-	return -EINVAL;
-}
-#endif
-
 static int pixcir_i2c_ts_probe(struct i2c_client *client,
 			       const struct i2c_device_id *id)
 {
-	const struct pixcir_ts_platform_data *pdata =
-			dev_get_platdata(&client->dev);
 	struct device *dev = &client->dev;
 	struct pixcir_i2c_ts_data *tsdata;
 	struct input_dev *input;
@@ -503,19 +474,11 @@ static int pixcir_i2c_ts_probe(struct i2c_client *client,
 	if (!tsdata)
 		return -ENOMEM;
 
-	if (pdata) {
-		tsdata->chip = &pdata->chip;
-	} else if (dev->of_node) {
-		error = pixcir_parse_dt(dev, tsdata);
-		if (error)
-			return error;
-	} else {
-		dev_err(dev, "platform data not defined\n");
-		return -EINVAL;
-	}
-
-	if (!tsdata->chip->max_fingers) {
-		dev_err(dev, "Invalid max_fingers in chip data\n");
+	tsdata->chip = device_get_match_data(dev);
+	if (!tsdata->chip && id)
+		tsdata->chip = (const void *)id->driver_data;
+	if (!tsdata->chip) {
+		dev_err(dev, "can't locate chip data\n");
 		return -EINVAL;
 	}
 
@@ -532,30 +495,17 @@ static int pixcir_i2c_ts_probe(struct i2c_client *client,
 	input->id.bustype = BUS_I2C;
 	input->open = pixcir_input_open;
 	input->close = pixcir_input_close;
-	input->dev.parent = dev;
-
-	if (pdata) {
-		input_set_abs_params(input, ABS_MT_POSITION_X, 0, pdata->x_max, 0, 0);
-		input_set_abs_params(input, ABS_MT_POSITION_Y, 0, pdata->y_max, 0, 0);
-	} else {
-		input_set_capability(input, EV_ABS, ABS_MT_POSITION_X);
-		input_set_capability(input, EV_ABS, ABS_MT_POSITION_Y);
-		touchscreen_parse_properties(input, true, &tsdata->prop);
-		if (!input_abs_get_max(input, ABS_MT_POSITION_X) ||
-		    !input_abs_get_max(input, ABS_MT_POSITION_Y)) {
-			dev_err(dev, "Touchscreen size is not specified\n");
-			return -EINVAL;
-		}
-	}
 
-	tsdata->max_fingers = tsdata->chip->max_fingers;
-	if (tsdata->max_fingers > PIXCIR_MAX_SLOTS) {
-		tsdata->max_fingers = PIXCIR_MAX_SLOTS;
-		dev_info(dev, "Limiting maximum fingers to %d\n",
-			 tsdata->max_fingers);
+	input_set_capability(input, EV_ABS, ABS_MT_POSITION_X);
+	input_set_capability(input, EV_ABS, ABS_MT_POSITION_Y);
+	touchscreen_parse_properties(input, true, &tsdata->prop);
+	if (!input_abs_get_max(input, ABS_MT_POSITION_X) ||
+	    !input_abs_get_max(input, ABS_MT_POSITION_Y)) {
+		dev_err(dev, "Touchscreen size is not specified\n");
+		return -EINVAL;
 	}
 
-	error = input_mt_init_slots(input, tsdata->max_fingers,
+	error = input_mt_init_slots(input, tsdata->chip->max_fingers,
 				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
 	if (error) {
 		dev_err(dev, "Error initializing Multi-Touch slots\n");
@@ -635,14 +585,6 @@ static int pixcir_i2c_ts_probe(struct i2c_client *client,
 	return 0;
 }
 
-static const struct i2c_device_id pixcir_i2c_ts_id[] = {
-	{ "pixcir_ts", 0 },
-	{ "pixcir_tangoc", 0 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, pixcir_i2c_ts_id);
-
-#ifdef CONFIG_OF
 static const struct pixcir_i2c_chip_data pixcir_ts_data = {
 	.max_fingers = 2,
 	/* no hw id support */
@@ -653,6 +595,14 @@ static const struct pixcir_i2c_chip_data pixcir_tangoc_data = {
 	.has_hw_ids = true,
 };
 
+static const struct i2c_device_id pixcir_i2c_ts_id[] = {
+	{ "pixcir_ts", (unsigned long) &pixcir_ts_data },
+	{ "pixcir_tangoc", (unsigned long) &pixcir_tangoc_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, pixcir_i2c_ts_id);
+
+#ifdef CONFIG_OF
 static const struct of_device_id pixcir_of_match[] = {
 	{ .compatible = "pixcir,pixcir_ts", .data = &pixcir_ts_data },
 	{ .compatible = "pixcir,pixcir_tangoc", .data = &pixcir_tangoc_data },



Thanks.

-- 
Dmitry
