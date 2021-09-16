Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 349A040DE7A
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 17:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240033AbhIPPtM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 11:49:12 -0400
Received: from mx24.baidu.com ([111.206.215.185]:44472 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240042AbhIPPtM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 11:49:12 -0400
Received: from BC-Mail-Ex30.internal.baidu.com (unknown [172.31.51.24])
        by Forcepoint Email with ESMTPS id 78815FFD970470A56F06;
        Thu, 16 Sep 2021 23:32:17 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex30.internal.baidu.com (172.31.51.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 16 Sep 2021 23:32:16 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 23:32:16 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: drv2665 - Make use of the helper function dev_err_probe()
Date:   Thu, 16 Sep 2021 23:32:10 +0800
Message-ID: <20210916153211.14204-1-caihuoqing@baidu.com>
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
 drivers/input/misc/drv2665.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/input/misc/drv2665.c b/drivers/input/misc/drv2665.c
index 21913e8085d7..5f66cfdd9908 100644
--- a/drivers/input/misc/drv2665.c
+++ b/drivers/input/misc/drv2665.c
@@ -167,12 +167,9 @@ static int drv2665_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	haptics->regulator = devm_regulator_get(&client->dev, "vbat");
-	if (IS_ERR(haptics->regulator)) {
-		error = PTR_ERR(haptics->regulator);
-		dev_err(&client->dev,
-			"unable to get regulator, error: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(haptics->regulator))
+		return dev_err_probe(&client->dev, PTR_ERR(haptics->regulator),
+				     "unable to get regulator\n");
 
 	haptics->input_dev = devm_input_allocate_device(&client->dev);
 	if (!haptics->input_dev) {
-- 
2.25.1

