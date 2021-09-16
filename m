Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6E0240DE7C
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 17:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240049AbhIPPtQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 11:49:16 -0400
Received: from mx22.baidu.com ([220.181.50.185]:44468 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240042AbhIPPtN (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 11:49:13 -0400
Received: from BC-Mail-EX04.internal.baidu.com (unknown [172.31.51.44])
        by Forcepoint Email with ESMTPS id 72910AEFD602EC20741F;
        Thu, 16 Sep 2021 23:31:54 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-EX04.internal.baidu.com (172.31.51.44) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 16 Sep 2021 23:31:54 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 23:31:53 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: colibri-vf50-ts - Make use of the helper function dev_err_probe()
Date:   Thu, 16 Sep 2021 23:31:48 +0800
Message-ID: <20210916153148.14045-1-caihuoqing@baidu.com>
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
 drivers/input/touchscreen/colibri-vf50-ts.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/colibri-vf50-ts.c b/drivers/input/touchscreen/colibri-vf50-ts.c
index aa829725ded7..98d5b2ba63fb 100644
--- a/drivers/input/touchscreen/colibri-vf50-ts.c
+++ b/drivers/input/touchscreen/colibri-vf50-ts.c
@@ -239,14 +239,10 @@ static void vf50_ts_close(struct input_dev *dev_input)
 static int vf50_ts_get_gpiod(struct device *dev, struct gpio_desc **gpio_d,
 			     const char *con_id, enum gpiod_flags flags)
 {
-	int error;
-
 	*gpio_d = devm_gpiod_get(dev, con_id, flags);
-	if (IS_ERR(*gpio_d)) {
-		error = PTR_ERR(*gpio_d);
-		dev_err(dev, "Could not get gpio_%s %d\n", con_id, error);
-		return error;
-	}
+	if (IS_ERR(*gpio_d))
+		return dev_err_probe(dev, PTR_ERR(*gpio_d),
+				     "Could not get gpio_%s\n", con_id);
 
 	return 0;
 }
-- 
2.25.1

