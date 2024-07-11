Return-Path: <linux-input+bounces-4977-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B322E92EDB5
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 19:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D39001F223D3
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2024 17:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8653016D9BE;
	Thu, 11 Jul 2024 17:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFa4YiO7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0283742AB5;
	Thu, 11 Jul 2024 17:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720718851; cv=none; b=BJN3Bnup8rYbXXitlQlf5w4o7Yn79hYVo8KQraMt2lokHyjDqS+/wHxZYACmpF/6AqqFJhhcRrvuKk9PjhcShJSy16mDeSl3KGOI8Ndx/ZN0sjN8P3eJMUhpjJ8QGtH+0lClKJHuawHtdYRQEaXqLYYJ6YJ40o8zY5Bb+RvaOGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720718851; c=relaxed/simple;
	bh=tmeS6r0tPRTtdX3sTg3GrfedzXoARJiD6p/6ctXsE68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tyRb/b/oXnQUwMFhKoiDJ/JtBJ0fHDoF40KpzytaC5yrHsyO78uZt+uJVZ25u8S+2LQLMA9FuxuHdildDFc4IXVmytg+uyAAbFi5KGJNbgO4/LPWVIdyS/ce5pmS7DpUEUVA0QCTwwXgbTrRBLdX/UY0Rt33YJIsUkpTDkSwg2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFa4YiO7; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fbc09ef46aso9936865ad.3;
        Thu, 11 Jul 2024 10:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720718849; x=1721323649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o4p0tg8Xj5vTmnTobwa3zRdSV9mSn2dUw2iMbgYCWTU=;
        b=SFa4YiO7gkCSZoq/vJVjffloT5UC9jxMyABtTh4prbgAyUdFSAy1ftpWdA/BbKKSGa
         OtyBRn+bKcDjFphmWVRjm6/8IYJjH/My19tu8zESZ/tEHcr+9d7MHXPSMQXWR7TRPQlE
         gpL4UXo292u0djC0nV2BL7kFf21kMsD/DX2o54AuxqmToEaVr34CXEMSrbYHT9PmPGBX
         mqjUE+eWuBmM8y6WSczqE1Hxf2Dw29DiM7eNZiJMraTGkSR1mp35omFQpJ8RRkO3vwC2
         610dmHw6oo5TRu1ZX0DjfAVTDthcwg6+g/YfMQ4Raq07E/4hTCKMlB4knwaNgjB3Io0B
         DGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720718849; x=1721323649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4p0tg8Xj5vTmnTobwa3zRdSV9mSn2dUw2iMbgYCWTU=;
        b=dWR1etSKATA+AzSHvX7jcrGwFGYSL433v6kkbvURl9ZmY26b71oMc1W+Uj93vxkjv1
         vJ4Y+2P186Ponc07+lU/+GO/YNHkJPODUph4cawuPcE9W2qucWEBbQx9PkjrTSTWNxeu
         jIFyyfQW61qMG7dpvabnNTKmQlQ+0omkuXkOfTmIz4q/q9282tOaPz50v09TTUEnIIzt
         Y86HgSxRmA8XrsoUdLfOSyp3yYz2GdFeAbgoFGfCzieVdjsjhE3p5oq9G09OWMnDF7Xs
         JhniM8azO+HZycZPKMObgFX1K/j6V7zoH45iJL5/oXY9ZAMWd4xa86qhSJ9Q6agwE7b3
         +LVw==
X-Gm-Message-State: AOJu0YxwXiyQcD+ywuYb4P5uC5l9kLmOz3FJXgFQBirGsnEOQVVD+xYI
	fw2FyzQzMM20EPptG4apKtMH3H7ib5I1xVjnTfwisAJx8EbkkUP/lHae6Q==
X-Google-Smtp-Source: AGHT+IG8xOqYAWac8mg3FJ7juQmgejtaceCpbzOexT+nLRwvHvRX/bZomNoDUpb7mrkR2afaLSZSJw==
X-Received: by 2002:a17:902:6bcb:b0:1fb:55d6:bdfb with SMTP id d9443c01a7336-1fbb6d90d98mr56780175ad.67.1720718848997;
        Thu, 11 Jul 2024 10:27:28 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4761:5ea8:2da4:8299])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ac0c47sm52976845ad.192.2024.07.11.10.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 10:27:28 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] Input: tsc2004/5 - fix handling of VIO power supply
Date: Thu, 11 Jul 2024 10:27:12 -0700
Message-ID: <20240711172719.1248373-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The chip needs to be powered up before calling tsc200x_stop_scan() which
communicates with it; move the call to enable the regulator earlier in
tsc200x_probe().

At the same time switch to using devm_regulator_get_enable() to simplify
error handling. This also makes sure that regulator is not shut off too
early when unbinding the driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/tsc2004.c      |  6 ------
 drivers/input/touchscreen/tsc2005.c      |  6 ------
 drivers/input/touchscreen/tsc200x-core.c | 27 ++++--------------------
 drivers/input/touchscreen/tsc200x-core.h |  1 -
 4 files changed, 4 insertions(+), 36 deletions(-)

diff --git a/drivers/input/touchscreen/tsc2004.c b/drivers/input/touchscreen/tsc2004.c
index b673098535ad..787f2caf4f73 100644
--- a/drivers/input/touchscreen/tsc2004.c
+++ b/drivers/input/touchscreen/tsc2004.c
@@ -42,11 +42,6 @@ static int tsc2004_probe(struct i2c_client *i2c)
 			     tsc2004_cmd);
 }
 
-static void tsc2004_remove(struct i2c_client *i2c)
-{
-	tsc200x_remove(&i2c->dev);
-}
-
 static const struct i2c_device_id tsc2004_idtable[] = {
 	{ "tsc2004" },
 	{ }
@@ -70,7 +65,6 @@ static struct i2c_driver tsc2004_driver = {
 	},
 	.id_table       = tsc2004_idtable,
 	.probe          = tsc2004_probe,
-	.remove         = tsc2004_remove,
 };
 module_i2c_driver(tsc2004_driver);
 
diff --git a/drivers/input/touchscreen/tsc2005.c b/drivers/input/touchscreen/tsc2005.c
index 1b40ce0ca1b9..6fe8b41b3ecc 100644
--- a/drivers/input/touchscreen/tsc2005.c
+++ b/drivers/input/touchscreen/tsc2005.c
@@ -64,11 +64,6 @@ static int tsc2005_probe(struct spi_device *spi)
 			     tsc2005_cmd);
 }
 
-static void tsc2005_remove(struct spi_device *spi)
-{
-	tsc200x_remove(&spi->dev);
-}
-
 #ifdef CONFIG_OF
 static const struct of_device_id tsc2005_of_match[] = {
 	{ .compatible = "ti,tsc2005" },
@@ -85,7 +80,6 @@ static struct spi_driver tsc2005_driver = {
 		.pm		= pm_sleep_ptr(&tsc200x_pm_ops),
 	},
 	.probe	= tsc2005_probe,
-	.remove	= tsc2005_remove,
 };
 module_spi_driver(tsc2005_driver);
 
diff --git a/drivers/input/touchscreen/tsc200x-core.c b/drivers/input/touchscreen/tsc200x-core.c
index a4c0e9db9bb9..39789a27f65b 100644
--- a/drivers/input/touchscreen/tsc200x-core.c
+++ b/drivers/input/touchscreen/tsc200x-core.c
@@ -104,8 +104,6 @@ struct tsc200x {
 
 	bool			pen_down;
 
-	struct regulator	*vio;
-
 	struct gpio_desc	*reset_gpio;
 	int			(*tsc200x_cmd)(struct device *dev, u8 cmd);
 	int			irq;
@@ -495,10 +493,9 @@ int tsc200x_probe(struct device *dev, int irq, const struct input_id *tsc_id,
 		return error;
 	}
 
-	ts->vio = devm_regulator_get(dev, "vio");
-	if (IS_ERR(ts->vio)) {
-		error = PTR_ERR(ts->vio);
-		dev_err(dev, "error acquiring vio regulator: %d", error);
+	error = devm_regulator_get_enable(dev, "vio");
+	if (error) {
+		dev_err(dev, "error acquiring vio regulator: %d\n", error);
 		return error;
 	}
 
@@ -554,36 +551,20 @@ int tsc200x_probe(struct device *dev, int irq, const struct input_id *tsc_id,
 		return error;
 	}
 
-	error = regulator_enable(ts->vio);
-	if (error)
-		return error;
-
 	dev_set_drvdata(dev, ts);
 
 	error = input_register_device(ts->idev);
 	if (error) {
 		dev_err(dev,
 			"Failed to register input device, err: %d\n", error);
-		goto disable_regulator;
+		return error;
 	}
 
 	irq_set_irq_wake(irq, 1);
 	return 0;
-
-disable_regulator:
-	regulator_disable(ts->vio);
-	return error;
 }
 EXPORT_SYMBOL_GPL(tsc200x_probe);
 
-void tsc200x_remove(struct device *dev)
-{
-	struct tsc200x *ts = dev_get_drvdata(dev);
-
-	regulator_disable(ts->vio);
-}
-EXPORT_SYMBOL_GPL(tsc200x_remove);
-
 static int tsc200x_suspend(struct device *dev)
 {
 	struct tsc200x *ts = dev_get_drvdata(dev);
diff --git a/drivers/input/touchscreen/tsc200x-core.h b/drivers/input/touchscreen/tsc200x-core.h
index 37de91efd78e..e76ba7a889dd 100644
--- a/drivers/input/touchscreen/tsc200x-core.h
+++ b/drivers/input/touchscreen/tsc200x-core.h
@@ -75,6 +75,5 @@ extern const struct attribute_group *tsc200x_groups[];
 int tsc200x_probe(struct device *dev, int irq, const struct input_id *tsc_id,
 		  struct regmap *regmap,
 		  int (*tsc200x_cmd)(struct device *dev, u8 cmd));
-void tsc200x_remove(struct device *dev);
 
 #endif
-- 
2.45.2.993.g49e7a77208-goog


