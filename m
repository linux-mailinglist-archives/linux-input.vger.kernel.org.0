Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67CE340DE78
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 17:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240044AbhIPPtL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 11:49:11 -0400
Received: from mx24.baidu.com ([111.206.215.185]:44416 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239169AbhIPPtK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 11:49:10 -0400
Received: from BC-Mail-Ex31.internal.baidu.com (unknown [172.31.51.25])
        by Forcepoint Email with ESMTPS id 28C033B0B119AADD30E2;
        Thu, 16 Sep 2021 23:32:10 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex31.internal.baidu.com (172.31.51.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 16 Sep 2021 23:32:09 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 23:32:09 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: drv260x - Make use of the helper function dev_err_probe()
Date:   Thu, 16 Sep 2021 23:32:03 +0800
Message-ID: <20210916153204.14151-1-caihuoqing@baidu.com>
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
 drivers/input/misc/drv260x.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/input/misc/drv260x.c b/drivers/input/misc/drv260x.c
index 0efe56f49aa9..f21e05e4e035 100644
--- a/drivers/input/misc/drv260x.c
+++ b/drivers/input/misc/drv260x.c
@@ -470,10 +470,8 @@ static int drv260x_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	error = device_property_read_u32(dev, "mode", &haptics->mode);
-	if (error) {
-		dev_err(dev, "Can't fetch 'mode' property: %d\n", error);
-		return error;
-	}
+	if (error)
+		return dev_err_probe(dev, error, "Can't fetch 'mode' property\n");
 
 	if (haptics->mode < DRV260X_LRA_MODE ||
 	    haptics->mode > DRV260X_ERM_MODE) {
@@ -482,10 +480,8 @@ static int drv260x_probe(struct i2c_client *client,
 	}
 
 	error = device_property_read_u32(dev, "library-sel", &haptics->library);
-	if (error) {
-		dev_err(dev, "Can't fetch 'library-sel' property: %d\n", error);
-		return error;
-	}
+	if (error)
+		return dev_err_probe(dev, error, "Can't fetch 'library-sel' property\n");
 
 	if (haptics->library < DRV260X_LIB_EMPTY ||
 	    haptics->library > DRV260X_ERM_LIB_F) {
@@ -517,11 +513,9 @@ static int drv260x_probe(struct i2c_client *client,
 					     drv260x_calculate_voltage(voltage);
 
 	haptics->regulator = devm_regulator_get(dev, "vbat");
-	if (IS_ERR(haptics->regulator)) {
-		error = PTR_ERR(haptics->regulator);
-		dev_err(dev, "unable to get regulator, error: %d\n", error);
-		return error;
-	}
+	if (IS_ERR(haptics->regulator))
+		return dev_err_probe(dev, PTR_ERR(haptics->regulator),
+				     "unable to get regulator\n");
 
 	haptics->enable_gpio = devm_gpiod_get_optional(dev, "enable",
 						       GPIOD_OUT_HIGH);
-- 
2.25.1

