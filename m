Return-Path: <linux-input+bounces-7247-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC63C998BEE
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 17:41:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC5D11C24956
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2024 15:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6641CBEAF;
	Thu, 10 Oct 2024 15:41:01 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F13188CAD;
	Thu, 10 Oct 2024 15:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728574860; cv=none; b=HSiFOWNYQIgPMXqACAPE4EBZXrCsQ/5OGI+/+32vNGmDMUA3bRrUt91uklXZQpj9gBd/Cdrt80/YgnkQeYAmIe1UreWFhp9fOoAM0lnLSb8Goap3HsBnxFS+bpn84tz+8Ozr3hecLuOWlJa/btCC5g+qqTBCPyJoqHdbLxeDZh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728574860; c=relaxed/simple;
	bh=Ema+f7OxkHzYngA/e7dmo+PAXT5IYRXJkiSuCkFyKDQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=chvJ/zSds6UqUe/aU3l/QflJWekDfj5161909e97GY5ZqwzM9XvId27ewgt7UKtXoVHHtlnsKpNIlCs4jZkF4xYTRRgx4dahIfSJ58rZUOv/vrAGnn33o0SJ+Yf+aQf6OfjSMO12lGVOBsvTF1i5H+rt+Qmb5w0aligshJmCXnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4XPYnl5nDpzpWbs;
	Thu, 10 Oct 2024 23:38:51 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 586251800CF;
	Thu, 10 Oct 2024 23:40:51 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 10 Oct
 2024 23:40:50 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <dmitry.torokhov@gmail.com>, <oliver.graute@kococonnector.com>,
	<u.kleine-koenig@pengutronix.de>, <felix@kaechele.ca>,
	<ye.xingchen@zte.com.cn>, <joelselvaraj.oss@gmail.com>,
	<andreas@kemnade.info>, <viro@zeniv.linux.org.uk>,
	<dario.binacchi@amarulasolutions.com>
CC: <lizetao1@huawei.com>, <linux-input@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: edt-ft5x06 - fix memleak when rmmod edt_ft5x06
Date: Thu, 10 Oct 2024 23:40:10 +0800
Message-ID: <20241010154010.3228450-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemd500012.china.huawei.com (7.221.188.25)

When insmod and rmmod the edt_ft5x06 driver, kmemleak reported a
memory leak issue:
  $ modprobe edt-ft5x06
    edt_ft5x06 0-0004: touchscreen probe failed
  $ modprobe -r edt-ft5x06

  unreferenced object 0xffff88810b38c8a0 (size 8):
    comm "modprobe", pid 23672, jiffies 4295355205
    hex dump (first 8 bytes):
      93 00 00 00 00 00 00 00                          ........
    backtrace (crc a10fb312):
      [<ffffffff81e12f70>] __kmalloc_noprof+0x2f0/0x3d0
      [<ffffffff8368c3b6>] __regmap_init+0x2d26/0x4810
      [<ffffffffc06b4875>] __regmap_init_i2c+0x65/0x80 [regmap_i2c]
      [<ffffffffc07108a6>] edt_ft5x06_ts_probe+0xd6/0x3410 [edt_ft5x06]
      [<ffffffff83bd85d1>] i2c_device_probe+0x3c1/0x8b0
	...

This is caused by not releasing the tsdata->regmap resource in time on
the probe failure path. By adding the err_regmap_exit label, execute
regmap_exit on the error path to release map resources. However, it
should be noted that during the ts identify stage, regmap_exit may be
performed first and then regmap may be reinitialized, so when
edt_ft5x06_ts_identify() returns an error, it need to check whether the
regmap initialization failed.

Fixes: 9dfd9708ffba ("Input: edt-ft5x06 - convert to use regmap API")
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/input/touchscreen/edt-ft5x06.c | 40 ++++++++++++++++----------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index fda49b2fe088..c2004f6e2317 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1159,15 +1159,18 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 		chip_data = (const struct edt_i2c_chip_data *)id->driver_data;
 	if (!chip_data || !chip_data->max_support_points) {
 		dev_err(&client->dev, "invalid or missing chip data\n");
-		return -EINVAL;
+		error = -EINVAL;
+		goto err_regmap_exit;
 	}
 
 	tsdata->max_support_points = chip_data->max_support_points;
 
 	tsdata->vcc = devm_regulator_get(&client->dev, "vcc");
-	if (IS_ERR(tsdata->vcc))
-		return dev_err_probe(&client->dev, PTR_ERR(tsdata->vcc),
-				     "failed to request regulator\n");
+	if (IS_ERR(tsdata->vcc)) {
+		error = dev_err_probe(&client->dev, PTR_ERR(tsdata->vcc),
+				      "failed to request regulator\n");
+		goto err_regmap_exit;
+	}
 
 	tsdata->iovcc = devm_regulator_get(&client->dev, "iovcc");
 	if (IS_ERR(tsdata->iovcc)) {
@@ -1175,13 +1178,13 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 		if (error != -EPROBE_DEFER)
 			dev_err(&client->dev,
 				"failed to request iovcc regulator: %d\n", error);
-		return error;
+		goto err_regmap_exit;
 	}
 
 	error = regulator_enable(tsdata->iovcc);
 	if (error < 0) {
 		dev_err(&client->dev, "failed to enable iovcc: %d\n", error);
-		return error;
+		goto err_regmap_exit;
 	}
 
 	/* Delay enabling VCC for > 10us (T_ivd) after IOVCC */
@@ -1191,14 +1194,14 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 	if (error < 0) {
 		dev_err(&client->dev, "failed to enable vcc: %d\n", error);
 		regulator_disable(tsdata->iovcc);
-		return error;
+		goto err_regmap_exit;
 	}
 
 	error = devm_add_action_or_reset(&client->dev,
 					 edt_ft5x06_disable_regulators,
 					 tsdata);
 	if (error)
-		return error;
+		goto err_regmap_exit;
 
 	tsdata->reset_gpio = devm_gpiod_get_optional(&client->dev,
 						     "reset", GPIOD_OUT_HIGH);
@@ -1206,7 +1209,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 		error = PTR_ERR(tsdata->reset_gpio);
 		dev_err(&client->dev,
 			"Failed to request GPIO reset pin, error %d\n", error);
-		return error;
+		goto err_regmap_exit;
 	}
 
 	tsdata->wake_gpio = devm_gpiod_get_optional(&client->dev,
@@ -1215,7 +1218,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 		error = PTR_ERR(tsdata->wake_gpio);
 		dev_err(&client->dev,
 			"Failed to request GPIO wake pin, error %d\n", error);
-		return error;
+		goto err_regmap_exit;
 	}
 
 	/*
@@ -1246,7 +1249,8 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 	input = devm_input_allocate_device(&client->dev);
 	if (!input) {
 		dev_err(&client->dev, "failed to allocate input device.\n");
-		return -ENOMEM;
+		error = -ENOMEM;
+		goto err_regmap_exit;
 	}
 
 	mutex_init(&tsdata->mutex);
@@ -1258,7 +1262,9 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 	error = edt_ft5x06_ts_identify(client, tsdata);
 	if (error) {
 		dev_err(&client->dev, "touchscreen probe failed\n");
-		return error;
+		if (IS_ERR(tsdata->regmap))
+			return error;
+		goto err_regmap_exit;
 	}
 
 	/*
@@ -1311,7 +1317,7 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 				    INPUT_MT_DIRECT);
 	if (error) {
 		dev_err(&client->dev, "Unable to init MT slots.\n");
-		return error;
+		goto err_regmap_exit;
 	}
 
 	irq_flags = irq_get_trigger_type(client->irq);
@@ -1324,12 +1330,12 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 					  client->name, tsdata);
 	if (error) {
 		dev_err(&client->dev, "Unable to request touchscreen IRQ.\n");
-		return error;
+		goto err_regmap_exit;
 	}
 
 	error = input_register_device(input);
 	if (error)
-		return error;
+		goto err_regmap_exit;
 
 	edt_ft5x06_ts_prepare_debugfs(tsdata, dev_driver_string(&client->dev));
 
@@ -1340,6 +1346,10 @@ static int edt_ft5x06_ts_probe(struct i2c_client *client)
 		tsdata->reset_gpio ? desc_to_gpio(tsdata->reset_gpio) : -1);
 
 	return 0;
+
+err_regmap_exit:
+	regmap_exit(tsdata->regmap);
+	return error;
 }
 
 static void edt_ft5x06_ts_remove(struct i2c_client *client)
-- 
2.34.1


