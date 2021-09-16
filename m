Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDBDC40DE9B
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 17:50:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240323AbhIPPvT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 11:51:19 -0400
Received: from mx24.baidu.com ([111.206.215.185]:45782 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240206AbhIPPvL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 11:51:11 -0400
Received: from BJHW-Mail-Ex05.internal.baidu.com (unknown [10.127.64.15])
        by Forcepoint Email with ESMTPS id 1862C66FE8035105EDA5;
        Thu, 16 Sep 2021 23:34:09 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex05.internal.baidu.com (10.127.64.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 23:34:09 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 23:34:08 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: regulator-haptic - Make use of the helper function dev_err_probe()
Date:   Thu, 16 Sep 2021 23:34:02 +0800
Message-ID: <20210916153403.14999-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex11.internal.baidu.com (172.31.51.51) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex05_2021-09-16 23:34:09:165
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
 drivers/input/misc/regulator-haptic.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/input/misc/regulator-haptic.c b/drivers/input/misc/regulator-haptic.c
index a661e77545c5..6e6f1a390a00 100644
--- a/drivers/input/misc/regulator-haptic.c
+++ b/drivers/input/misc/regulator-haptic.c
@@ -169,10 +169,9 @@ static int regulator_haptic_probe(struct platform_device *pdev)
 	}
 
 	haptic->regulator = devm_regulator_get_exclusive(&pdev->dev, "haptic");
-	if (IS_ERR(haptic->regulator)) {
-		dev_err(&pdev->dev, "failed to get regulator\n");
-		return PTR_ERR(haptic->regulator);
-	}
+	if (IS_ERR(haptic->regulator))
+		return dev_err_probe(&pdev->dev, PTR_ERR(haptic->regulator),
+				     "failed to get regulator\n");
 
 	input_dev = devm_input_allocate_device(&pdev->dev);
 	if (!input_dev)
-- 
2.25.1

