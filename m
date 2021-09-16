Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 169F240DE8E
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 17:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240139AbhIPPuP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 11:50:15 -0400
Received: from mx22.baidu.com ([220.181.50.185]:45116 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240125AbhIPPuN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 11:50:13 -0400
Received: from BC-Mail-Ex20.internal.baidu.com (unknown [172.31.51.14])
        by Forcepoint Email with ESMTPS id E56B11E924A499AFBDD6;
        Thu, 16 Sep 2021 23:33:31 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex20.internal.baidu.com (172.31.51.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 16 Sep 2021 23:33:31 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 23:33:31 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: mms114 - Make use of the helper function dev_err_probe()
Date:   Thu, 16 Sep 2021 23:33:25 +0800
Message-ID: <20210916153326.14734-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex09.internal.baidu.com (172.31.51.49) To
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
 drivers/input/touchscreen/mms114.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index 9fa3b0e421be..4b36db084d86 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -525,20 +525,14 @@ static int mms114_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, data);
 
 	data->core_reg = devm_regulator_get(&client->dev, "avdd");
-	if (IS_ERR(data->core_reg)) {
-		error = PTR_ERR(data->core_reg);
-		dev_err(&client->dev,
-			"Unable to get the Core regulator (%d)\n", error);
-		return error;
-	}
+	if (IS_ERR(data->core_reg))
+		return dev_err_probe(&client->dev, PTR_ERR(data->core_reg),
+				     "Unable to get the Core regulator\n");
 
 	data->io_reg = devm_regulator_get(&client->dev, "vdd");
-	if (IS_ERR(data->io_reg)) {
-		error = PTR_ERR(data->io_reg);
-		dev_err(&client->dev,
-			"Unable to get the IO regulator (%d)\n", error);
-		return error;
-	}
+	if (IS_ERR(data->io_reg))
+		return dev_err_probe(&client->dev, PTR_ERR(data->io_reg),
+				     "Unable to get the IO regulator\n");
 
 	error = devm_request_threaded_irq(&client->dev, client->irq,
 					  NULL, mms114_interrupt,
-- 
2.25.1

