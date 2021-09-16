Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78B2140DE9F
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 17:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240126AbhIPPvX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 11:51:23 -0400
Received: from mx22.baidu.com ([220.181.50.185]:45788 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240219AbhIPPvL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 11:51:11 -0400
Received: from BJHW-Mail-Ex02.internal.baidu.com (unknown [10.127.64.12])
        by Forcepoint Email with ESMTPS id 0167768B4BC93712A29F;
        Thu, 16 Sep 2021 23:34:39 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex02.internal.baidu.com (10.127.64.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 23:34:38 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 23:34:38 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: st-keyscan - Make use of the helper function dev_err_probe()
Date:   Thu, 16 Sep 2021 23:34:32 +0800
Message-ID: <20210916153433.15211-1-caihuoqing@baidu.com>
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
 drivers/input/keyboard/st-keyscan.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/st-keyscan.c b/drivers/input/keyboard/st-keyscan.c
index a045d61165ac..7600402b1a5a 100644
--- a/drivers/input/keyboard/st-keyscan.c
+++ b/drivers/input/keyboard/st-keyscan.c
@@ -173,10 +173,9 @@ static int keyscan_probe(struct platform_device *pdev)
 		return PTR_ERR(keypad_data->base);
 
 	keypad_data->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(keypad_data->clk)) {
-		dev_err(&pdev->dev, "cannot get clock\n");
-		return PTR_ERR(keypad_data->clk);
-	}
+	if (IS_ERR(keypad_data->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(keypad_data->clk),
+				     "cannot get clock\n");
 
 	error = clk_enable(keypad_data->clk);
 	if (error) {
-- 
2.25.1

