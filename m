Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 285B240DE67
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 17:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232100AbhIPPsL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 11:48:11 -0400
Received: from mx22.baidu.com ([220.181.50.185]:43838 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238634AbhIPPsL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 11:48:11 -0400
X-Greylist: delayed 939 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 Sep 2021 11:48:10 EDT
Received: from BC-Mail-Ex05.internal.baidu.com (unknown [172.31.51.45])
        by Forcepoint Email with ESMTPS id 953F91D5A16DBAE0E792;
        Thu, 16 Sep 2021 23:31:39 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex05.internal.baidu.com (172.31.51.45) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 16 Sep 2021 23:31:39 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 23:31:38 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: bu21013_ts - Make use of the helper function dev_err_probe()
Date:   Thu, 16 Sep 2021 23:31:33 +0800
Message-ID: <20210916153134.13939-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex11.internal.baidu.com (172.31.51.51) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When possible use dev_err_probe help to properly deal with the
PROBE_DEFER error, the benefit is that DEFER issue will be logged
in the devices_deferred debugfs file.
Using dev_err_probe() can reduce code size, and the error value
gets printed.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/input/touchscreen/bu21013_ts.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/drivers/input/touchscreen/bu21013_ts.c b/drivers/input/touchscreen/bu21013_ts.c
index 2f1f0d7607f8..43cc7efd4e38 100644
--- a/drivers/input/touchscreen/bu21013_ts.c
+++ b/drivers/input/touchscreen/bu21013_ts.c
@@ -477,10 +477,9 @@ static int bu21013_probe(struct i2c_client *client,
 	}
 
 	ts->regulator = devm_regulator_get(&client->dev, "avdd");
-	if (IS_ERR(ts->regulator)) {
-		dev_err(&client->dev, "regulator_get failed\n");
-		return PTR_ERR(ts->regulator);
-	}
+	if (IS_ERR(ts->regulator))
+		return dev_err_probe(&client->dev, PTR_ERR(ts->regulator),
+				     "regulator_get failed\n");
 
 	error = regulator_enable(ts->regulator);
 	if (error) {
@@ -497,11 +496,9 @@ static int bu21013_probe(struct i2c_client *client,
 	/* Named "CS" on the chip, DT binding is "reset" */
 	ts->cs_gpiod = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_HIGH);
 	error = PTR_ERR_OR_ZERO(ts->cs_gpiod);
-	if (error) {
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev, "failed to get CS GPIO\n");
-		return error;
-	}
+	if (error)
+		return dev_err_probe(&client->dev, error,
+				     "failed to get CS GPIO\n");
 	gpiod_set_consumer_name(ts->cs_gpiod, "BU21013 CS");
 
 	error = devm_add_action_or_reset(&client->dev,
@@ -516,11 +513,8 @@ static int bu21013_probe(struct i2c_client *client,
 	ts->int_gpiod = devm_gpiod_get_optional(&client->dev,
 						"touch", GPIOD_IN);
 	error = PTR_ERR_OR_ZERO(ts->int_gpiod);
-	if (error) {
-		if (error != -EPROBE_DEFER)
-			dev_err(&client->dev, "failed to get INT GPIO\n");
-		return error;
-	}
+	if (error)
+		return dev_err_probe(&client->dev, error, "failed to get INT GPIO\n");
 
 	if (ts->int_gpiod)
 		gpiod_set_consumer_name(ts->int_gpiod, "BU21013 INT");
-- 
2.25.1

