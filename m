Return-Path: <linux-input+bounces-5041-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3218A9317B7
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2024 17:34:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC3D7282AB0
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2024 15:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E350191F79;
	Mon, 15 Jul 2024 15:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2A08qQR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2450190698;
	Mon, 15 Jul 2024 15:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721057623; cv=none; b=CgnlaQD04IjVzOCUMSlg13JnTz+yjh4AAapJ3N7MZpSfh3QaK+6zL3ooiSQGHRD+7wBWUq2fh46zzrb57Gz69QPKf0W8okVS1WSNrot5VtcdqI4ra9rZUdjeCEKj9Vn0+B9Xd1gc0yn6p7mzL82hBcfpfHtpSFzMQL0So5r8ap8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721057623; c=relaxed/simple;
	bh=wZEPi49ckDisN0y/9/bQlWJRFcnYmxT77NL/4Hr5jUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UFxH0L0cW0VWf6cJPtdFw9KLmnUAQONFKtyIWX5XQsdlbh8HIftWTv6OSiK5hYqIodyFSmMBXMXF17ZpqMynTZKQYgMNF0xlbXA6aOzW+OrOWs+mxMmCl2klcJJMaFbP+oGSywHOrCp1WHfI9YNKsz/kZL3ibsyiU1oqDsYidxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2A08qQR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-36799a67d9cso3631589f8f.0;
        Mon, 15 Jul 2024 08:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721057620; x=1721662420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wixUMSPfbRUA5ff8Q7KbeB+Bn7dETuvtQK3RDPocxSU=;
        b=c2A08qQR3CCYmtArnziiNHJQ0vsDHfFqmb3nYZSLoBRFKI++TYpJBMoK0hLFrizfnx
         PocHctDrUD2ZWqBMUAczlCChE5cYBBxdkXNmXMn1P6XDtsVm0c+ZeoqAjzPVDsEYr+FN
         JyqFh58chWFc4UY6lmftaCEmSq3mCvTk4bD06gflTVJ6nkpgi6n8n4b9avWWo33PWZjd
         sWl5l0ALDlU/4SYGC/cKQd5TeFmy2ItwDbWjTvzJ7kY477q54rEslVaACivxmEPYKL2J
         N2l5IoRUiXBCLCpI35yc+wwY2hoftBujskwiIOQxmMz2Z1zl/BdxczhQefzoEcAlNoUr
         ND2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721057620; x=1721662420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wixUMSPfbRUA5ff8Q7KbeB+Bn7dETuvtQK3RDPocxSU=;
        b=cqrwwHewF6xTG8XfIuq8LX6QwYjJk5iJ5AbMn1FATQ4wVVdkkjjLkbVsjntOm9VrXA
         l60bzAVh7paYFRoa3dkcibhX+qbiBLHC4fcVO3N6fz4TVod+kzwyen7RsFq9hOyd6Mbx
         +4n/xILVJJMHi7caSHOMqZSf7tGPq2Wd1lqfrr1ke+qQr2OCFoVC5cy7a3j+mfuqi0J6
         x+2V4ZayUhlkPmmREH034yc5kCC5P9wyLFTpJpnaCSYNQjLK4UjtZiREWqcvnKf6Lv4P
         bRIds+9gcd5RSs6e5HDTy22tQc96wwjj2N7uegR8ZvPU39sZwb9KA2+DRbt8FgigH85k
         7IOg==
X-Forwarded-Encrypted: i=1; AJvYcCVOK65REzpNRu7oLKwU5HJVkcHQAtNLu5QuyyoATdxfGJdg35sWFRn3C/Jy1MNorsBf8FS51Aq9/CkVhuGTmHlUl0JTongkEa0TznabnknAL832PNG/o71k5Vy2gaog/wPkK8Ytbtqqpw==
X-Gm-Message-State: AOJu0YyKiUYyTRoyKQjgjCOm0pxMSlgbY1CVR3MdO4YVnMQWSoN2etsz
	zNrWrJ1a0dbCoX2sQ/uEYB63vvXnOoMF+6YKGU0FT1kTl6U1DRGS
X-Google-Smtp-Source: AGHT+IG+p7mUgs29QXGW6vDzpdT1cAhBKDRl4uDUB7qml+2dMbB5omhfCWb8x0y0AAzKovVgBoWVUQ==
X-Received: by 2002:adf:e54e:0:b0:366:e986:22ef with SMTP id ffacd0b85a97d-36824078b02mr102969f8f.4.1721057620011;
        Mon, 15 Jul 2024 08:33:40 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:564b:c18:f4fc:19ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafbf4bsm6720866f8f.73.2024.07.15.08.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 08:33:39 -0700 (PDT)
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
Subject: [PATCH v6 3/3] Input: atmel_mxt_ts - add support for poweroff-sleep
Date: Mon, 15 Jul 2024 17:31:23 +0200
Message-ID: <20240715153330.91979-4-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715153330.91979-1-eichest@gmail.com>
References: <20240715153330.91979-1-eichest@gmail.com>
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
 drivers/input/touchscreen/atmel_mxt_ts.c | 82 ++++++++++++++++++++----
 1 file changed, 70 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 9416de53bf9af..46ed3dbf0c5ed 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -265,6 +265,7 @@ enum v4l_dbg_inputs {
 enum mxt_suspend_mode {
 	MXT_SUSPEND_DEEP_SLEEP	= 0,
 	MXT_SUSPEND_T9_CTRL	= 1,
+	MXT_SUSPEND_POWEROFF	= 2,
 };
 
 /* Config update context */
@@ -1311,6 +1312,10 @@ static int mxt_power_on(struct mxt_data *data)
 {
 	int error;
 
+	/* Make sure the device is in reset before enabling power */
+	if (data->reset_gpio)
+		gpiod_set_value_cansleep(data->reset_gpio, 1);
+
 	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators),
 				      data->regulators);
 	if (error) {
@@ -2270,8 +2275,38 @@ static int mxt_configure_objects(struct mxt_data *data,
 
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
 
 static int mxt_initialize(struct mxt_data *data)
@@ -2828,15 +2863,18 @@ static int mxt_configure_objects(struct mxt_data *data,
 			dev_warn(dev, "Error %d updating config\n", error);
 	}
 
-	if (data->multitouch) {
-		error = mxt_initialize_input_device(data);
-		if (error)
-			return error;
-	} else {
-		dev_warn(dev, "No touch object detected\n");
-	}
+	/* Do not initialize and register input device twice */
+	if (!data->input_dev) {
+		if (data->multitouch) {
+			error = mxt_initialize_input_device(data);
+			if (error)
+				return error;
+		} else {
+			dev_warn(dev, "No touch object detected\n");
+		}
 
-	mxt_debug_init(data);
+		mxt_debug_init(data);
+	}
 
 	return 0;
 }
@@ -3070,6 +3108,12 @@ static ssize_t mxt_update_fw_store(struct device *dev,
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
@@ -3104,7 +3148,10 @@ static const struct attribute_group mxt_attr_group = {
 
 static void mxt_start(struct mxt_data *data)
 {
-	mxt_wakeup_toggle(data->client, true, false);
+	if (data->suspend_mode == MXT_SUSPEND_POWEROFF)
+		mxt_initialize_after_resume(data);
+	else
+		mxt_wakeup_toggle(data->client, true, false);
 
 	switch (data->suspend_mode) {
 	case MXT_SUSPEND_T9_CTRL:
@@ -3116,6 +3163,7 @@ static void mxt_start(struct mxt_data *data)
 				MXT_TOUCH_MULTI_T9, MXT_T9_CTRL, 0x83);
 		break;
 
+	case MXT_SUSPEND_POWEROFF:
 	case MXT_SUSPEND_DEEP_SLEEP:
 	default:
 		mxt_set_t7_power_cfg(data, MXT_POWER_CFG_RUN);
@@ -3141,7 +3189,12 @@ static void mxt_stop(struct mxt_data *data)
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
@@ -3338,6 +3391,9 @@ static int mxt_probe(struct i2c_client *client)
 	if (error)
 		return error;
 
+	if (device_property_read_bool(&client->dev, "atmel,poweroff-sleep"))
+		data->suspend_mode = MXT_SUSPEND_POWEROFF;
+
 	/*
 	 * Controllers like mXT1386 have a dedicated WAKE line that could be
 	 * connected to a GPIO or to I2C SCL pin, or permanently asserted low.
@@ -3387,7 +3443,8 @@ static void mxt_remove(struct i2c_client *client)
 	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
-	mxt_power_off(data);
+	if (!(data->suspend_mode == MXT_SUSPEND_POWEROFF))
+		mxt_power_off(data);
 }
 
 static int mxt_suspend(struct device *dev)
@@ -3420,7 +3477,8 @@ static int mxt_resume(struct device *dev)
 	if (!input_dev)
 		return 0;
 
-	enable_irq(data->irq);
+	if (!(data->suspend_mode == MXT_SUSPEND_POWEROFF))
+		enable_irq(data->irq);
 
 	mutex_lock(&input_dev->mutex);
 
-- 
2.43.0


