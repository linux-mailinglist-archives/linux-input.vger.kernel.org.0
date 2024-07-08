Return-Path: <linux-input+bounces-4891-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BED929CEA
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 09:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1455A28152A
	for <lists+linux-input@lfdr.de>; Mon,  8 Jul 2024 07:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACF1F224FA;
	Mon,  8 Jul 2024 07:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPxvCjxQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F039A224E8;
	Mon,  8 Jul 2024 07:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720422970; cv=none; b=dgtKVmiliegBbkl+klQm9OlAe1wJpmziTQmtOyVEtkAT8CsZABMpp72mzBIZIUrFKcf3tRQPc9hrULrbULo35u0D0ZMDdm9CkVj8r7yk+Ryxr1bb9poucc2nFFEfUjVWKQrcsz2KDT+K80FW/LCenoLvOQzvZwQKnNg3BcAPzRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720422970; c=relaxed/simple;
	bh=1X6mARo5oSNGmYKnKVnJ+bFj+6ZY6o26QyCdvdh4E6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dqeDqZK2JIIXPnVAP5W4EQvkiy5UKgrDVyTic7XMXOhMII4hjiLqLT+5OICyQ+pM2sY0p6gRVfOEifGn53QriyclC+vbLuH8Y7d8UzcIL0klKcmwzeR9o+MT45hbpWP2YW73Mlv8LnoX9nnCtkSXwlKImdxVeA+9fAFMjISNRD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPxvCjxQ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-36796d2e5a9so2388749f8f.3;
        Mon, 08 Jul 2024 00:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720422967; x=1721027767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfZNK8ph0Z0kRXxMHVT8gSKe9yd3fBGYFdN7lqgFzvQ=;
        b=MPxvCjxQixvbB4MxV05ggF0MRsDUWffDv4MgEbJb0jsrDFSX0Kcq6BpQpxDhmoIQS8
         jNJGiQFGEGhCKAiwk8pzm1cq1DR4W0/mR+vsgKT2XSDBR4GHEvrcQZQjSoPaF0EBDO0G
         sXMQTKmZoUGUK8MrzDOfvdPciuDWx8ZPDzqdaNb1xNvpZ0RnX4UpEoBIR9aC0lDAn06K
         0Um/1Y6pq4S4ZwA7wYE1FI7cg8Osy4qcu3Tki1ZJxjFeLHHxYDT2se0z3dGm2S/tmxLR
         C6TTnsDSXfu8Lv+H2xcmcdBu2X4R4A4gigN7NJTNMnq818nbhsiSByj6FCthdMAyokUX
         /h/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720422967; x=1721027767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfZNK8ph0Z0kRXxMHVT8gSKe9yd3fBGYFdN7lqgFzvQ=;
        b=TK/KTvXxZeP2TnBu7QqhfhNFxFhjgYX1lJEpDWIRK4F7z4JbCsqnXj2G3ShIvaBzQy
         p6dSzvNe3uMsvIHB2AN6Ox4FJZADEHJaeBeoTZUbyhnTM1lhT8Gvzp/IS8VdJmuqTVvl
         9cWjF67GYcB4g75hmCxY6Y1s5jHRhoj9u6Kg/ZnAwxkECno8FOZrqDzbN8bQbkxPpo7e
         yFFy2PVPg2jubfE6v40NKisAW/GumUOu7BUI+bUeJTWyhXLibqOFBsj0x38IG/20EkpF
         1lKF5eyHov3SctwCitm+UIMW/46h4LL79pttWEI75zDg5jQoywFjJk5jgntTSggED9VV
         ABHA==
X-Forwarded-Encrypted: i=1; AJvYcCVOEGMaKH8uCv+4Ajnhha1jJHJwgaaGrgDn40kfRpge/o+zWmoz1T4yFQk4W1ny8lyA+Jg1H/nkZ9MOdCEoMfMhS7jVz1/weClPJBXTgRmQtz4+3VDZjdb9pbGEgvJwUo/AZh52Tyem9Q==
X-Gm-Message-State: AOJu0YzeDnfvCjukU8FRjEM8UO4ZrdX8QATiblfYJrl+uHvZnDRppQKu
	SsCzGbCE++sVNGE5uWJvaMisYKoAP0TuN378EgW62iUQNCm7fPED
X-Google-Smtp-Source: AGHT+IEfXpYJIxjWfYoWwblocqz4NtB/iP3ACED3Sw9nHHRXtj08ueId6szvEj11L3N2y52np3X2sw==
X-Received: by 2002:adf:a1da:0:b0:367:4dd7:288b with SMTP id ffacd0b85a97d-3679dd34fe1mr8019816f8f.29.1720422967317;
        Mon, 08 Jul 2024 00:16:07 -0700 (PDT)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:a786:d603:1c55:ced1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3679dd5ea09sm9994564f8f.65.2024.07.08.00.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 00:16:07 -0700 (PDT)
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
Subject: [PATCH v5 1/4] Input: atmel_mxt_ts - add power off and power on functions
Date: Mon,  8 Jul 2024 09:15:48 +0200
Message-ID: <20240708071601.7571-2-eichest@gmail.com>
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

Add a separate function for power off and power on instead of calling
regulator_bulk_enable and regulator_bulk_disable directly.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Reviewed-by: Joao Paulo Goncalves <joao.goncalves@toradex.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 59 +++++++++++++++---------
 1 file changed, 37 insertions(+), 22 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 8a606bd441ae6..4fc83a4cabd9b 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1307,6 +1307,38 @@ static int mxt_soft_reset(struct mxt_data *data)
 	return 0;
 }
 
+static int mxt_power_on(struct mxt_data *data)
+{
+	int error;
+
+	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators),
+				      data->regulators);
+	if (error) {
+		dev_err(&data->client->dev, "failed to enable regulators: %d\n",
+			error);
+		return error;
+	}
+
+	msleep(MXT_BACKUP_TIME);
+
+	if (data->reset_gpio) {
+		/* Wait a while and then de-assert the RESET GPIO line */
+		msleep(MXT_RESET_GPIO_TIME);
+		gpiod_set_value(data->reset_gpio, 0);
+		msleep(MXT_RESET_INVALID_CHG);
+	}
+
+	return 0;
+}
+
+static void mxt_power_off(struct mxt_data *data)
+{
+	if (data->reset_gpio)
+		gpiod_set_value(data->reset_gpio, 1);
+
+	regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
+}
+
 static void mxt_update_crc(struct mxt_data *data, u8 cmd, u8 value)
 {
 	/*
@@ -3305,25 +3337,9 @@ static int mxt_probe(struct i2c_client *client)
 		return error;
 	}
 
-	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators),
-				      data->regulators);
-	if (error) {
-		dev_err(&client->dev, "failed to enable regulators: %d\n",
-			error);
+	error = mxt_power_on(data);
+	if (error)
 		return error;
-	}
-	/*
-	 * The device takes 40ms to come up after power-on according
-	 * to the mXT224 datasheet, page 13.
-	 */
-	msleep(MXT_BACKUP_TIME);
-
-	if (data->reset_gpio) {
-		/* Wait a while and then de-assert the RESET GPIO line */
-		msleep(MXT_RESET_GPIO_TIME);
-		gpiod_set_value(data->reset_gpio, 0);
-		msleep(MXT_RESET_INVALID_CHG);
-	}
 
 	/*
 	 * Controllers like mXT1386 have a dedicated WAKE line that could be
@@ -3361,8 +3377,8 @@ static int mxt_probe(struct i2c_client *client)
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
 err_disable_regulators:
-	regulator_bulk_disable(ARRAY_SIZE(data->regulators),
-			       data->regulators);
+	mxt_power_off(data);
+
 	return error;
 }
 
@@ -3374,8 +3390,7 @@ static void mxt_remove(struct i2c_client *client)
 	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
-	regulator_bulk_disable(ARRAY_SIZE(data->regulators),
-			       data->regulators);
+	mxt_power_off(data);
 }
 
 static int mxt_suspend(struct device *dev)
-- 
2.43.0


