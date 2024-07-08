Return-Path: <linux-input+bounces-4894-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CC387929CF1
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 09:17:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 590841F21811
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 07:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E105E381BD;
	Mon,  8 Jul 2024 07:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsiDSzZE"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC6D2C694;
	Mon,  8 Jul 2024 07:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720422973; cv=none; b=CBmC4MOccS+IFq91ysWchrWnCWPvONQj322p3Ko2a09CwTQ/xtb0SKNsArmw354cb4ML/YI+GoSffJjKuYAURMvCK3GorZlZBPtuW7Yf+J18YpC5YQGeOj+wRtzXz4ZcV+FdwBw8fcdv6UcfnQl0qkjSWfE6JPkiXweAE2eHzoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720422973; c=relaxed/simple;
	bh=yOX+W+4UFfjm7aIIDqbdd1jZIgnWT/b322lNMxg98U8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pCyQ5b8LSKINduhw+bNXgYbKqrNpDLJF6hExWFgtiY3+9D3KlmCf8jR9bW8nxORr4yJ2v0RUKqcFiMGimxuJAO2md9JjaEIjrxOlYjkvwgtUVmpeaz+88iVFtUQRBatFL2SmbBSfP3GTvA5NAUi+kQNR/GQcYEZhr9pn/LK02n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsiDSzZE; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4255fa23f7bso23839925e9.2;
        Mon, 08 Jul 2024 00:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720422971; x=1721027771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvhvTdVpDZ79yvlH1+XJiOzGxkpYhrLPBWh5+/JeQbw=;
        b=RsiDSzZEIkmDOvGFKwHp+z2k2I64b7beUeqsfRU0aEVmIcYIIEgwPum0yOW1gtS9Dp
         6BC9HKpxpGVSu4HaZ/ogsU8LekaBQMmoXtsU8EMfMbVzcwpBmq56j/e2F9UPUd9q65un
         un4V/g1jKNN/DQyuFXz+PfkAKekx9oqlfiuxTL2Yn8jDZ+qgvJuHcARGMZTVbRfB0AsC
         1wyS3sa4mmvYux8+N5+osjA+dRN1KjJ6VS5RRRJwHomMVYLfa4ei1+/CPw0S63sY9BwK
         7TjxitDflv45UdAoQZiUK6PEPagVWYoxaEMS9f1RUbG7q+pTBOXr4XM6j4mFBf9OlkTe
         p1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720422971; x=1721027771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvhvTdVpDZ79yvlH1+XJiOzGxkpYhrLPBWh5+/JeQbw=;
        b=aLtFKF0xTx7/PR3kG/sJQSEyHzG9SZQPQdSW0vfiGKrtXf8Kwmx8+CHM1jNpMYsvFJ
         c/BXYM1R0KgdEdJDJElb+SyvXSFf0dvqjivHmNVg2hFif38tzJ5eLGkmpd6GX72BwbII
         Iy3AEEYkhsURjI3UsbEw4r96nGoxJiuq51XiRc0DOvgujuHvSr8N9qs+OYOC414/pD3e
         VA8JCMUCmxOUJDC7kjcDIXVZdKP8QNMT94oTH+eQNYNsAeJtoKJ2jeRw4uywRjqbofhF
         zf1rxqdlSAHOzCm12fGp7sASBxt5GVfgjMWYdzY+UrvK/18/y5fNQZqf8JGpyXZ5mmpg
         JXmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUChUwJdBRDJ1yBZOvSQpKdst3AI8LU9AK2jsNjPaJ/8J51yXx3bj/sO2R0nEOiI/CnF3sczka9vWROgYdCyZZ5QcLa2SQC/Qd1JYLT7OZyvkEr+Iu8peN2ywHDgxXU1b7JtVS8noE1Sw==
X-Gm-Message-State: AOJu0YzxRJNwi65Ul8kA6q2AvTO9Fxqn6H4j6fdBJwjAx3picXgNwqrC
	3nlPTAP3FmKTt1LEpTg+TtQfLY+4mBiQdWBCWNwO/3SrdXNirEwT
X-Google-Smtp-Source: AGHT+IENCKvfCZxO2Rt6KDsB7M0kjjFGMdi6MvfCYZJU7eP3x5K0nZi26KF8OMrrBBbNgihafqwRFw==
X-Received: by 2002:a05:600c:4f0f:b0:425:5ec3:570b with SMTP id 5b1f17b1804b1-4264a428ec4mr69226885e9.35.1720422970695;
        Mon, 08 Jul 2024 00:16:10 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:a786:d603:1c55:ced1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679dd5ea09sm9994564f8f.65.2024.07.08.00.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 00:16:10 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: nick@shmanahar.org,
	dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linus.walleij@linaro.org,
	francesco.dolcini@toradex.com,
	joao.goncalves@toradex.com
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v5 4/4] Input: atmel_mxt_ts - add support for poweroff-sleep
Date: Mon,  8 Jul 2024 09:15:51 +0200
Message-ID: <20240708071601.7571-5-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240708071601.7571-1-eichest@gmail.com>
References: <20240708071601.7571-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Add support for poweroff-sleep to the Atmel maXTouch driver. This allows
us to power off the input device entirely and only power it on when it
is opened. This will also automatically power it off when we suspend the
system.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 59 ++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 85f3c685bf526..3bcdbb58a24e6 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -265,6 +265,7 @@ enum v4l_dbg_inputs {
 enum mxt_suspend_mode {
 	MXT_SUSPEND_DEEP_SLEEP	= 0,
 	MXT_SUSPEND_T9_CTRL	= 1,
+	MXT_SUSPEND_POWEROFF	= 2,
 };
 
 /* Config update context */
@@ -2273,8 +2274,38 @@ static int mxt_configure_objects(struct mxt_data *data,
 
 static void mxt_config_cb(const struct firmware *cfg, void *ctx)
 {
+	struct mxt_data *data = ctx;
+
 	mxt_configure_objects(ctx, cfg);
 	release_firmware(cfg);
+
+	if ((data->suspend_mode == MXT_SUSPEND_POWEROFF) && !data->in_bootloader) {
+		disable_irq(data->irq);
+		mxt_power_off(data);
+	}
+}
+
+static void mxt_initialize_after_resume(struct mxt_data *data)
+{
+	int error;
+
+	error = mxt_power_on(data);
+	if (error) {
+		dev_err(&data->client->dev, "Failed to power on device\n");
+		return;
+	}
+
+	error = mxt_acquire_irq(data);
+	if (error) {
+		dev_err(&data->client->dev, "Failed to acquire IRQ\n");
+		return;
+	}
+
+	error = mxt_configure_objects(data, NULL);
+	if (error) {
+		dev_err(&data->client->dev, "Failed to configure objects\n");
+		return;
+	}
 }
 
 static void mxt_debug_init(struct mxt_data *data);
@@ -3089,6 +3120,12 @@ static ssize_t mxt_update_fw_store(struct device *dev,
 	struct mxt_data *data = dev_get_drvdata(dev);
 	int error;
 
+	if ((data->suspend_mode == MXT_SUSPEND_POWEROFF) && !data->in_bootloader) {
+		error = mxt_power_on(data);
+		if (error)
+			return error;
+	}
+
 	error = mxt_load_fw(dev, MXT_FW_NAME);
 	if (error) {
 		dev_err(dev, "The firmware update failed(%d)\n", error);
@@ -3123,7 +3160,10 @@ static const struct attribute_group mxt_attr_group = {
 
 static void mxt_start(struct mxt_data *data)
 {
-	mxt_wakeup_toggle(data->client, true, false);
+	if (data->suspend_mode == MXT_SUSPEND_POWEROFF)
+		mxt_initialize_after_resume(data);
+	else
+		mxt_wakeup_toggle(data->client, true, false);
 
 	switch (data->suspend_mode) {
 	case MXT_SUSPEND_T9_CTRL:
@@ -3135,6 +3175,7 @@ static void mxt_start(struct mxt_data *data)
 				MXT_TOUCH_MULTI_T9, MXT_T9_CTRL, 0x83);
 		break;
 
+	case MXT_SUSPEND_POWEROFF:
 	case MXT_SUSPEND_DEEP_SLEEP:
 	default:
 		mxt_set_t7_power_cfg(data, MXT_POWER_CFG_RUN);
@@ -3160,7 +3201,12 @@ static void mxt_stop(struct mxt_data *data)
 		break;
 	}
 
-	mxt_wakeup_toggle(data->client, false, false);
+	if (data->suspend_mode == MXT_SUSPEND_POWEROFF) {
+		disable_irq(data->irq);
+		mxt_power_off(data);
+	} else {
+		mxt_wakeup_toggle(data->client, false, false);
+	}
 }
 
 static int mxt_input_open(struct input_dev *dev)
@@ -3357,6 +3403,9 @@ static int mxt_probe(struct i2c_client *client)
 	if (error)
 		return error;
 
+	if (device_property_read_bool(&client->dev, "atmel,poweroff-sleep"))
+		data->suspend_mode = MXT_SUSPEND_POWEROFF;
+
 	/*
 	 * Controllers like mXT1386 have a dedicated WAKE line that could be
 	 * connected to a GPIO or to I2C SCL pin, or permanently asserted low.
@@ -3406,7 +3455,8 @@ static void mxt_remove(struct i2c_client *client)
 	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
-	mxt_power_off(data);
+	if (!(data->suspend_mode == MXT_SUSPEND_POWEROFF))
+		mxt_power_off(data);
 }
 
 static int mxt_suspend(struct device *dev)
@@ -3439,7 +3489,8 @@ static int mxt_resume(struct device *dev)
 	if (!input_dev)
 		return 0;
 
-	enable_irq(data->irq);
+	if (!(data->suspend_mode == MXT_SUSPEND_POWEROFF))
+		enable_irq(data->irq);
 
 	mutex_lock(&input_dev->mutex);
 
-- 
2.43.0


