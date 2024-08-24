Return-Path: <linux-input+bounces-5820-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AECC95DC12
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 07:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 539352815AD
	for <lists+linux-input@lfdr.de>; Sat, 24 Aug 2024 05:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968C317920C;
	Sat, 24 Aug 2024 05:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lr6opexQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18931714B8;
	Sat, 24 Aug 2024 05:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724478669; cv=none; b=Bmn5eeyZlcZQyGQXppGbAvFlJn8XFNfQ/33CMAIMTb9w0eQWi7p/T0LzJafG2QDZ/apFehzT3yXeTLleov4T2sqtmAatJuQtVK0xNlt9WRh52hzdO4MVv+yCbf/XP3vJXjq1EsIRWEvmFraAawAiQZm63aoxPglSP3rk+TAa6ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724478669; c=relaxed/simple;
	bh=kAin8AmcWz03gVn0Hk/ibmc/ZZ18NkBhN8ORD+wN100=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LuEmY1rR2Rulb7uzyu1M7kIQCLE0Tr/uvLFYUuyz85RBUICFZhNQ0x6fRGsFjDfGyKyoR/n4gznGWWR6hd9ljqwB6LKjBbVdFeH2UJB+6582J9lOBCldzUQBPti7apEe9lt8rhoetoXPKrAa5kExeNK5WrPRBEZ8JYNZRS8Z0ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lr6opexQ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-202089e57d8so17384955ad.0;
        Fri, 23 Aug 2024 22:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724478667; x=1725083467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbiWBzDjwLyTeI3RfiJIlPq9VBW7gMqHkiL4ai+n1sY=;
        b=lr6opexQpNO6pWcYXVkyMc2YILt3LS2iKRKPP77PJAApM/6YBvSg47W75oiJYxR7eU
         ni9yK3Yy1es6VX+P4GilR0iRSC6buJXkXBaCVJDLeeqcIf1rEKtp0jYyPmeEerFU2gV2
         DzrQvitexrCDzv2ENXOx9nfxQKRCUX4iChReL7b3n3IWR1n0jHPA8Wvdd4n+b2MqNuOS
         Kt6CKNBScsOTezesdXuXh6NNxb2AMyBSSex0IcyLUlAHjrSR7ZIA6vyIsUBYFODm3glU
         68D7v5W55kwGK7aMkPvvU8pcwcGwLTjmOE6CwCr0QjJJmiwELTa+76e50mmE5J2TmdHN
         bJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724478667; x=1725083467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qbiWBzDjwLyTeI3RfiJIlPq9VBW7gMqHkiL4ai+n1sY=;
        b=TbMS19swWHFROSRNFYmJAx7oZkmE393u/9EPZAvyimq03ARCOJuRLuKgHt0oFQzWel
         B2klUD4AG+AvJvNDjaJt5Lf7v7Zea6MnaG25C751/J3T8cqyYvebYh9OFccYcBavWT06
         ZpdcYoR7t12QK5JMijSNGpMG8el5wzZjMAG4KRr+VV1aNYYAkSiP0igdXVfnDJtnYUNy
         nA4wNYgyadRatpXpTbVAoeKzgl3HsuW7BndjwxXBEsOUHmyscgbJ1sgOjQ6ebtPLSgIm
         8uPu1ag3hrwBcouXc8ONjPOrmVjuq71AvWXOjqf1g1FU+b7/3Z1aQcCbjaikcjag1arU
         kkfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa0S5mKvjInxHyf8GTKWs0a//r0ERzf2oJqABHxt7FHiPIVh90qxqzXGU1G1ehuLJHdTad0geAQoYqDQ==@vger.kernel.org, AJvYcCUsKw+m3/0ggDM5ZYwe1XhrpBSC2X3k/rnd+rFZpkcOilVjmj8glBeDef5j9ILVksp+HE8Wqdji9KrjGrZ1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6kQmSA6udfAojRivRDfplbBuUG8QDXBHYXqBdR8LJ7Uu6+KmY
	d9Gx93L+lX0q/0oOdjRFuoKsPo6CvHyED6qEFJw63FQeL+CPRDV0caKzPA==
X-Google-Smtp-Source: AGHT+IGk13vtLLreaqEgGc+/X6hs4tT+DqRzFLThl8NQ7dFX1PtiLM18q7pWCL21H43CjxfXkO37tw==
X-Received: by 2002:a17:902:cec8:b0:202:2f22:2fac with SMTP id d9443c01a7336-2037ee1f8bemr133205485ad.8.1724478666584;
        Fri, 23 Aug 2024 22:51:06 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:75c:5a5a:d7dc:18f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20395ef904dsm23398615ad.31.2024.08.23.22.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 22:51:06 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	linux-input@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/18] Input: zforce_ts - use dev_err_probe() where appropriate
Date: Fri, 23 Aug 2024 22:50:36 -0700
Message-ID: <20240824055047.1706392-13-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
References: <20240824055047.1706392-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dev_err_probe() helper to log deferrals in the devices_deferred
debugfs file and avoid extra messages in the logs.

Also rename "ret" variables holding error codes only to "error".

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/zforce_ts.c | 245 ++++++++++++--------------
 1 file changed, 113 insertions(+), 132 deletions(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index 0d06dda311d4..78f561510f8d 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -171,7 +171,7 @@ static int zforce_send_wait(struct zforce_ts *ts, const char *buf, int len)
 	ret = i2c_master_send(client, buf, len);
 	if (ret < 0) {
 		dev_err(&client->dev, "i2c send data request error: %d\n", ret);
-		return ret;;
+		return ret;
 	}
 
 	dev_dbg(&client->dev, "waiting for result for command 0x%x\n", buf[2]);
@@ -187,7 +187,7 @@ static int zforce_command_wait(struct zforce_ts *ts, u8 cmd)
 {
 	struct i2c_client *client = ts->client;
 	char buf[3];
-	int ret;
+	int error;
 
 	dev_dbg(&client->dev, "%s: 0x%x\n", __func__, cmd);
 
@@ -195,10 +195,11 @@ static int zforce_command_wait(struct zforce_ts *ts, u8 cmd)
 	buf[1] = 1; /* data size, command only */
 	buf[2] = cmd;
 
-	ret = zforce_send_wait(ts, &buf[0], ARRAY_SIZE(buf));
-	if (ret < 0) {
-		dev_err(&client->dev, "i2c send data request error: %d\n", ret);
-		return ret;
+	error = zforce_send_wait(ts, &buf[0], ARRAY_SIZE(buf));
+	if (error) {
+		dev_err(&client->dev, "i2c send data request error: %d\n",
+			error);
+		return error;
 	}
 
 	return 0;
@@ -246,40 +247,40 @@ static int zforce_setconfig(struct zforce_ts *ts, char b1)
 static int zforce_start(struct zforce_ts *ts)
 {
 	struct i2c_client *client = ts->client;
-	int ret;
+	int error;
 
 	dev_dbg(&client->dev, "starting device\n");
 
-	ret = zforce_command_wait(ts, COMMAND_INITIALIZE);
-	if (ret) {
-		dev_err(&client->dev, "Unable to initialize, %d\n", ret);
-		return ret;
+	error = zforce_command_wait(ts, COMMAND_INITIALIZE);
+	if (error) {
+		dev_err(&client->dev, "Unable to initialize, %d\n", error);
+		return error;
 	}
 
-	ret = zforce_resolution(ts, ts->prop.max_x, ts->prop.max_y);
-	if (ret) {
-		dev_err(&client->dev, "Unable to set resolution, %d\n", ret);
-		goto error;
+	error = zforce_resolution(ts, ts->prop.max_x, ts->prop.max_y);
+	if (error) {
+		dev_err(&client->dev, "Unable to set resolution, %d\n", error);
+		goto err_deactivate;
 	}
 
-	ret = zforce_scan_frequency(ts, 10, 50, 50);
-	if (ret) {
+	error = zforce_scan_frequency(ts, 10, 50, 50);
+	if (error) {
 		dev_err(&client->dev, "Unable to set scan frequency, %d\n",
-			ret);
-		goto error;
+			error);
+		goto err_deactivate;
 	}
 
-	ret = zforce_setconfig(ts, SETCONFIG_DUALTOUCH);
-	if (ret) {
+	error = zforce_setconfig(ts, SETCONFIG_DUALTOUCH);
+	if (error) {
 		dev_err(&client->dev, "Unable to set config\n");
-		goto error;
+		goto err_deactivate;
 	}
 
 	/* start sending touch events */
-	ret = zforce_command(ts, COMMAND_DATAREQUEST);
-	if (ret) {
+	error = zforce_command(ts, COMMAND_DATAREQUEST);
+	if (error) {
 		dev_err(&client->dev, "Unable to request data\n");
-		goto error;
+		goto err_deactivate;
 	}
 
 	/*
@@ -290,24 +291,24 @@ static int zforce_start(struct zforce_ts *ts)
 
 	return 0;
 
-error:
+err_deactivate:
 	zforce_command_wait(ts, COMMAND_DEACTIVATE);
-	return ret;
+	return error;
 }
 
 static int zforce_stop(struct zforce_ts *ts)
 {
 	struct i2c_client *client = ts->client;
-	int ret;
+	int error;
 
 	dev_dbg(&client->dev, "stopping device\n");
 
 	/* Deactivates touch sensing and puts the device into sleep. */
-	ret = zforce_command_wait(ts, COMMAND_DEACTIVATE);
-	if (ret != 0) {
+	error = zforce_command_wait(ts, COMMAND_DEACTIVATE);
+	if (error) {
 		dev_err(&client->dev, "could not deactivate device, %d\n",
-			ret);
-		return ret;
+			error);
+		return error;
 	}
 
 	return 0;
@@ -451,7 +452,7 @@ static irqreturn_t zforce_irq_thread(int irq, void *dev_id)
 {
 	struct zforce_ts *ts = dev_id;
 	struct i2c_client *client = ts->client;
-	int ret;
+	int error;
 	u8 payload_buffer[FRAME_MAXSIZE];
 	u8 *payload;
 	bool suspending;
@@ -482,10 +483,10 @@ static irqreturn_t zforce_irq_thread(int irq, void *dev_id)
 	 *    no IRQ any more)
 	 */
 	do {
-		ret = zforce_read_packet(ts, payload_buffer);
-		if (ret < 0) {
+		error = zforce_read_packet(ts, payload_buffer);
+		if (error) {
 			dev_err(&client->dev,
-				"could not read packet, ret: %d\n", ret);
+				"could not read packet, ret: %d\n", error);
 			break;
 		}
 
@@ -570,20 +571,18 @@ static void zforce_input_close(struct input_dev *dev)
 {
 	struct zforce_ts *ts = input_get_drvdata(dev);
 	struct i2c_client *client = ts->client;
-	int ret;
+	int error;
 
-	ret = zforce_stop(ts);
-	if (ret)
+	error = zforce_stop(ts);
+	if (error)
 		dev_warn(&client->dev, "stopping zforce failed\n");
-
-	return;
 }
 
 static int __zforce_suspend(struct zforce_ts *ts)
 {
 	struct i2c_client *client = ts->client;
 	struct input_dev *input = ts->input;
-	int ret;
+	int error;
 
 	guard(mutex)(&input->mutex);
 
@@ -596,9 +595,9 @@ static int __zforce_suspend(struct zforce_ts *ts)
 
 		/* Need to start device, if not open, to be a wakeup source. */
 		if (!input_device_enabled(input)) {
-			ret = zforce_start(ts);
-			if (ret)
-				return ret;
+			error = zforce_start(ts);
+			if (error)
+				return error;
 		}
 
 		enable_irq_wake(client->irq);
@@ -606,9 +605,9 @@ static int __zforce_suspend(struct zforce_ts *ts)
 		dev_dbg(&client->dev,
 			"suspend without being a wakeup source\n");
 
-		ret = zforce_stop(ts);
-		if (ret)
-			return ret;
+		error = zforce_stop(ts);
+		if (error)
+			return error;
 
 		disable_irq(client->irq);
 	}
@@ -639,7 +638,7 @@ static int zforce_resume(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct zforce_ts *ts = i2c_get_clientdata(client);
 	struct input_dev *input = ts->input;
-	int ret;
+	int error;
 
 	guard(mutex)(&input->mutex);
 
@@ -652,18 +651,18 @@ static int zforce_resume(struct device *dev)
 
 		/* need to stop device if it was not open on suspend */
 		if (!input_device_enabled(input)) {
-			ret = zforce_stop(ts);
-			if (ret)
-				return ret;
+			error = zforce_stop(ts);
+			if (error)
+				return error;
 		}
 	} else if (input_device_enabled(input)) {
 		dev_dbg(&client->dev, "resume without being a wakeup source\n");
 
 		enable_irq(client->irq);
 
-		ret = zforce_start(ts);
-		if (ret < 0)
-			return ret;
+		error = zforce_start(ts);
+		if (error)
+			return error;
 	}
 
 	return 0;
@@ -699,7 +698,7 @@ static int zforce_probe(struct i2c_client *client)
 {
 	struct zforce_ts *ts;
 	struct input_dev *input_dev;
-	int ret;
+	int error;
 
 	ts = devm_kzalloc(&client->dev, sizeof(struct zforce_ts), GFP_KERNEL);
 	if (!ts)
@@ -707,22 +706,18 @@ static int zforce_probe(struct i2c_client *client)
 
 	ts->gpio_rst = devm_gpiod_get_optional(&client->dev, "reset",
 					       GPIOD_OUT_HIGH);
-	if (IS_ERR(ts->gpio_rst)) {
-		ret = PTR_ERR(ts->gpio_rst);
-		dev_err(&client->dev,
-			"failed to request reset GPIO: %d\n", ret);
-		return ret;
-	}
+	error = PTR_ERR_OR_ZERO(ts->gpio_rst);
+	if (error)
+		return dev_err_probe(&client->dev, error,
+				     "failed to request reset GPIO\n");
 
 	if (ts->gpio_rst) {
 		ts->gpio_int = devm_gpiod_get_optional(&client->dev, "irq",
 						       GPIOD_IN);
-		if (IS_ERR(ts->gpio_int)) {
-			ret = PTR_ERR(ts->gpio_int);
-			dev_err(&client->dev,
-				"failed to request interrupt GPIO: %d\n", ret);
-			return ret;
-		}
+		error = PTR_ERR_OR_ZERO(ts->gpio_int);
+		if (error)
+			return dev_err_probe(&client->dev, error,
+					     "failed to request interrupt GPIO\n");
 	} else {
 		/*
 		 * Deprecated GPIO handling for compatibility
@@ -732,33 +727,31 @@ static int zforce_probe(struct i2c_client *client)
 		/* INT GPIO */
 		ts->gpio_int = devm_gpiod_get_index(&client->dev, NULL, 0,
 						    GPIOD_IN);
-		if (IS_ERR(ts->gpio_int)) {
-			ret = PTR_ERR(ts->gpio_int);
-			dev_err(&client->dev,
-				"failed to request interrupt GPIO: %d\n", ret);
-			return ret;
-		}
+
+		error = PTR_ERR_OR_ZERO(ts->gpio_int);
+		if (error)
+			return dev_err_probe(&client->dev, error,
+					     "failed to request interrupt GPIO\n");
 
 		/* RST GPIO */
 		ts->gpio_rst = devm_gpiod_get_index(&client->dev, NULL, 1,
 					    GPIOD_OUT_HIGH);
-		if (IS_ERR(ts->gpio_rst)) {
-			ret = PTR_ERR(ts->gpio_rst);
-			dev_err(&client->dev,
-				"failed to request reset GPIO: %d\n", ret);
-			return ret;
-		}
+		error = PTR_ERR_OR_ZERO(ts->gpio_rst);
+		if (error)
+			return dev_err_probe(&client->dev, error,
+					     "failed to request reset GPIO\n");
 	}
 
 	ts->reg_vdd = devm_regulator_get_optional(&client->dev, "vdd");
-	if (IS_ERR(ts->reg_vdd)) {
-		ret = PTR_ERR(ts->reg_vdd);
-		if (ret != -ENOENT)
-			return ret;
+	error = PTR_ERR_OR_ZERO(ts->gpio_rst);
+	if (error) {
+		if (error != -ENOENT)
+			return dev_err_probe(&client->dev, error,
+					     "failed to request vdd supply\n");
 	} else {
-		ret = regulator_enable(ts->reg_vdd);
-		if (ret)
-			return ret;
+		error = regulator_enable(ts->reg_vdd);
+		if (error)
+			return error;
 
 		/*
 		 * according to datasheet add 100us grace time after regular
@@ -767,23 +760,18 @@ static int zforce_probe(struct i2c_client *client)
 		udelay(100);
 	}
 
-	ret = devm_add_action_or_reset(&client->dev, zforce_reset, ts);
-	if (ret) {
-		dev_err(&client->dev, "failed to register reset action, %d\n",
-			ret);
-
-		/* hereafter the regulator will be disabled by the action */
-		return ret;
-	}
+	error = devm_add_action_or_reset(&client->dev, zforce_reset, ts);
+	if (error)
+		return dev_err_probe(&client->dev, error,
+				     "failed to register reset action\n");
 
 	snprintf(ts->phys, sizeof(ts->phys),
 		 "%s/input0", dev_name(&client->dev));
 
 	input_dev = devm_input_allocate_device(&client->dev);
-	if (!input_dev) {
-		dev_err(&client->dev, "could not allocate input device\n");
-		return -ENOMEM;
-	}
+	if (!input_dev)
+		return dev_err_probe(&client->dev, -ENOMEM,
+				     "could not allocate input device\n");
 
 	ts->client = client;
 	ts->input = input_dev;
@@ -797,10 +785,8 @@ static int zforce_probe(struct i2c_client *client)
 
 	zforce_ts_parse_legacy_properties(ts);
 	touchscreen_parse_properties(input_dev, true, &ts->prop);
-	if (ts->prop.max_x == 0 || ts->prop.max_y == 0) {
-		dev_err(&client->dev, "no size specified\n");
-		return -EINVAL;
-	}
+	if (ts->prop.max_x == 0 || ts->prop.max_y == 0)
+		return dev_err_probe(&client->dev, -EINVAL, "no size specified");
 
 	input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR, 0,
 			     ZFORCE_MAX_AREA, 0, 0);
@@ -808,10 +794,10 @@ static int zforce_probe(struct i2c_client *client)
 			     ZFORCE_MAX_AREA, 0, 0);
 	input_set_abs_params(input_dev, ABS_MT_ORIENTATION, 0, 1, 0, 0);
 
-	ret = input_mt_init_slots(input_dev, ZFORCE_REPORT_POINTS,
+	error = input_mt_init_slots(input_dev, ZFORCE_REPORT_POINTS,
 				  INPUT_MT_DIRECT);
-	if (ret)
-		return ret;
+	if (error)
+		return error;
 
 	input_set_drvdata(ts->input, ts);
 
@@ -824,14 +810,13 @@ static int zforce_probe(struct i2c_client *client)
 	 * Therefore we can trigger the interrupt anytime it is low and do
 	 * not need to limit it to the interrupt edge.
 	 */
-	ret = devm_request_threaded_irq(&client->dev, client->irq,
-					zforce_irq, zforce_irq_thread,
-					IRQF_TRIGGER_LOW | IRQF_ONESHOT,
-					input_dev->name, ts);
-	if (ret) {
-		dev_err(&client->dev, "irq %d request failed\n", client->irq);
-		return ret;
-	}
+	error = devm_request_threaded_irq(&client->dev, client->irq,
+					  zforce_irq, zforce_irq_thread,
+					  IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+					  input_dev->name, ts);
+	if (error)
+		return dev_err_probe(&client->dev, error,
+				     "irq %d request failed\n", client->irq);
 
 	i2c_set_clientdata(client, ts);
 
@@ -843,33 +828,29 @@ static int zforce_probe(struct i2c_client *client)
 		dev_warn(&client->dev, "bootcomplete timed out\n");
 
 	/* need to start device to get version information */
-	ret = zforce_command_wait(ts, COMMAND_INITIALIZE);
-	if (ret) {
-		dev_err(&client->dev, "unable to initialize, %d\n", ret);
-		return ret;
-	}
+	error = zforce_command_wait(ts, COMMAND_INITIALIZE);
+	if (error)
+		return dev_err_probe(&client->dev, error, "unable to initialize\n");
 
 	/* this gets the firmware version among other information */
-	ret = zforce_command_wait(ts, COMMAND_STATUS);
-	if (ret < 0) {
-		dev_err(&client->dev, "couldn't get status, %d\n", ret);
+	error = zforce_command_wait(ts, COMMAND_STATUS);
+	if (error) {
+		dev_err_probe(&client->dev, error, "couldn't get status\n");
 		zforce_stop(ts);
-		return ret;
+		return error;
 	}
 
 	/* stop device and put it into sleep until it is opened */
-	ret = zforce_stop(ts);
-	if (ret < 0)
-		return ret;
+	error = zforce_stop(ts);
+	if (error)
+		return error;
 
 	device_set_wakeup_capable(&client->dev, true);
 
-	ret = input_register_device(input_dev);
-	if (ret) {
-		dev_err(&client->dev, "could not register input device, %d\n",
-			ret);
-		return ret;
-	}
+	error = input_register_device(input_dev);
+	if (error)
+		return dev_err_probe(&client->dev, error,
+				     "could not register input device\n");
 
 	return 0;
 }
-- 
2.46.0.295.g3b9ea8a38a-goog


