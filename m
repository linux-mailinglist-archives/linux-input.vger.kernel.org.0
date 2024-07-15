Return-Path: <linux-input+bounces-5039-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A72069317B0
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2024 17:34:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 345B01F2265A
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2024 15:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7594F18F2E4;
	Mon, 15 Jul 2024 15:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRk9l93c"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE46A18F2CA;
	Mon, 15 Jul 2024 15:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721057621; cv=none; b=q+EmRaLVvBq3LyGZnOqlxOWvQOOXlLxRT/B6l35/XiKDjD8/+QhWbj1OCyQpNtpo0/slHOqG0erjp3lll1zir9nDk9wSNc/epEy8PxQXpYqZovqnLI3+qtaSTPAGGXAgtSxRn5muHorvY0KAzQMq9KWDlsJK+H027V94rbm2YlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721057621; c=relaxed/simple;
	bh=w5gxgyW7pDD5OiYuiD/yPeV2bq0/fDV04JlwWC9nnUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SL8NJbhp4fiG1o1FrBT15++P46vL6cKtykDBHt2WOkZN6Mny82M9ADyNmJhielriVWLKFVYAyBLrB2ylILENZ9J0YKUnba51WZ/RT12jmLaYRgxIP42hfiNvK8mYrdq4WargR3X9ZbwWiAgQE8trQFQujJ51SyEHg5lMmR9rRss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRk9l93c; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-367975543a8so2738956f8f.3;
        Mon, 15 Jul 2024 08:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721057618; x=1721662418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrCU6G9DnnMkxpZ0nGUhFrVcFHRKc9c76P/tMQAhH00=;
        b=QRk9l93cTNWatUQIa+m5sUZ8RWwox3CB6U3XTabhWUVjp8RBPNPyf6LPYy/4H2sCGv
         aOaPqiyEe4KyUTJooD+pAQ8J2UXrsR2TZRVgitis+ztiMq0xcUfTcjhHnnhnR7qxWUN7
         5Mkwfvpid4r5qddTPivBshkS/NQckoUsj5pbV49brAJQf3tLi57vidJ8zDiAS1MH5enE
         bhpeEkpAeUfEDfQV4JXTZr/mGMG3GLPo+TrRszg/lOccBGlhbDHSfk7D52byIZhFAX1v
         S5aoEuSmKzMLFDzX0u9RSGVtrrdRAMJ8YUOL8WXT+gJHWxLgyVuteR+cJvRlHt+Pac2X
         JTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721057618; x=1721662418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XrCU6G9DnnMkxpZ0nGUhFrVcFHRKc9c76P/tMQAhH00=;
        b=Wb8UrAwBUHiDHRSP94EB8Ao/jpDPNXCe1hHBcYXs3Vp/Coybl4G7AdzbG48AFc/ypK
         oAL/oBc1Nr7dZXTUZsQFkNceIwJXLKfXXqFJor8ovxGLiQ9HnIVSNFi6jLyW3oPQpI4c
         Cf8CEYOSF0wq0A/SKsVP2ODA3iT7iNPThsPP6bBmvz0YovfG9Fcyctsw+sMF2DLiQzr/
         Sxgm1spymfbmSq44sLx/8F2e4aZtO3BfSC4Vtut5Dpy4K7LohznFOlZ87j+Gd5RlW2Tg
         F/jpmQb/eGIvZt1kBpe+DfOvajWorXp7AZ/wtieqCY1LrLtBW47OaNlZmCsp9megGUDK
         eZHA==
X-Forwarded-Encrypted: i=1; AJvYcCUEiuGxe6uwrwVqVCWLMq6Ya0KNXKK/8jkth5DMKn1GNk0v1DAz+DftU2fdVoPr9IINmIMgGLFg/aJO9wFoBQ2fM7wIfJwVPfU0s+tj0h/+czPDp5asVDSR2K6ZbBifV1LCuWk3BaDRig==
X-Gm-Message-State: AOJu0YzkoWkD5VZy+9rQOJ7gnsWWvmS7W/4JVV+jxyfhdawjxC/uysVC
	3G8dXXfa6op2hnB86zbQX0XMipmhAl/Uk4ft9jJ9Lwo/DJrX2uu0
X-Google-Smtp-Source: AGHT+IHFu8Io6ztt+geSSFK6mvGbGpy+kC8jppmdsA/0W5RtN9ndSF6+krNBDMfvyv6CFAl9AoiYbg==
X-Received: by 2002:a5d:6089:0:b0:367:96c5:ae70 with SMTP id ffacd0b85a97d-368240936c8mr67604f8f.31.1721057618058;
        Mon, 15 Jul 2024 08:33:38 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:564b:c18:f4fc:19ad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafbf4bsm6720866f8f.73.2024.07.15.08.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 08:33:37 -0700 (PDT)
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
Subject: [PATCH v6 1/3] Input: atmel_mxt_ts - add power off and power on functions
Date: Mon, 15 Jul 2024 17:31:21 +0200
Message-ID: <20240715153330.91979-2-eichest@gmail.com>
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

Add a separate function for power off and power on instead of calling
regulator_bulk_enable and regulator_bulk_disable directly.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Reviewed-by: Joao Paulo Goncalves <joao.goncalves@toradex.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 56 ++++++++++++++----------
 1 file changed, 34 insertions(+), 22 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 8a606bd441ae6..9416de53bf9af 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1307,6 +1307,35 @@ static int mxt_soft_reset(struct mxt_data *data)
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
+	regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
+}
+
 static void mxt_update_crc(struct mxt_data *data, u8 cmd, u8 value)
 {
 	/*
@@ -3305,25 +3334,9 @@ static int mxt_probe(struct i2c_client *client)
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
@@ -3361,8 +3374,8 @@ static int mxt_probe(struct i2c_client *client)
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
 err_disable_regulators:
-	regulator_bulk_disable(ARRAY_SIZE(data->regulators),
-			       data->regulators);
+	mxt_power_off(data);
+
 	return error;
 }
 
@@ -3374,8 +3387,7 @@ static void mxt_remove(struct i2c_client *client)
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


