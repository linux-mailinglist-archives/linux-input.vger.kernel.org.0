Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68DF540DE88
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 17:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240123AbhIPPuO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 11:50:14 -0400
Received: from mx24.baidu.com ([111.206.215.185]:45106 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240119AbhIPPuM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 11:50:12 -0400
Received: from BC-Mail-Ex23.internal.baidu.com (unknown [172.31.51.17])
        by Forcepoint Email with ESMTPS id B4C5DE97F8BD8513450B;
        Thu, 16 Sep 2021 23:33:09 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex23.internal.baidu.com (172.31.51.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 16 Sep 2021 23:33:09 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 23:33:09 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: ps2-gpio - Make use of the helper function dev_err_probe()
Date:   Thu, 16 Sep 2021 23:33:03 +0800
Message-ID: <20210916153304.14575-1-caihuoqing@baidu.com>
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
 drivers/input/serio/ps2-gpio.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/input/serio/ps2-gpio.c b/drivers/input/serio/ps2-gpio.c
index 8970b49ea09a..d46355f868fd 100644
--- a/drivers/input/serio/ps2-gpio.c
+++ b/drivers/input/serio/ps2-gpio.c
@@ -323,18 +323,14 @@ static int ps2_gpio_get_props(struct device *dev,
 				 struct ps2_gpio_data *drvdata)
 {
 	drvdata->gpio_data = devm_gpiod_get(dev, "data", GPIOD_IN);
-	if (IS_ERR(drvdata->gpio_data)) {
-		dev_err(dev, "failed to request data gpio: %ld",
-			PTR_ERR(drvdata->gpio_data));
-		return PTR_ERR(drvdata->gpio_data);
-	}
+	if (IS_ERR(drvdata->gpio_data))
+		return dev_err_probe(dev, PTR_ERR(drvdata->gpio_data),
+				     "failed to request data gpio: %ld")
 
 	drvdata->gpio_clk = devm_gpiod_get(dev, "clk", GPIOD_IN);
-	if (IS_ERR(drvdata->gpio_clk)) {
-		dev_err(dev, "failed to request clock gpio: %ld",
-			PTR_ERR(drvdata->gpio_clk));
-		return PTR_ERR(drvdata->gpio_clk);
-	}
+	if (IS_ERR(drvdata->gpio_clk))
+		return dev_err_probe(dev, PTR_ERR(drvdata->gpio_clk),
+				     "failed to request clock gpio");
 
 	drvdata->write_enable = device_property_read_bool(dev,
 				"write-enable");
-- 
2.25.1

