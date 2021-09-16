Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D70D440DEAE
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 17:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240310AbhIPPwa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 11:52:30 -0400
Received: from mx24.baidu.com ([111.206.215.185]:46562 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240359AbhIPPwK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 11:52:10 -0400
Received: from BJHW-Mail-Ex01.internal.baidu.com (unknown [10.127.64.11])
        by Forcepoint Email with ESMTPS id 96758C8386240ECA0D2D;
        Thu, 16 Sep 2021 23:34:46 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex01.internal.baidu.com (10.127.64.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 23:34:46 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 23:34:45 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-input@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: tegra-kbc - Make use of the helper function dev_err_probe()
Date:   Thu, 16 Sep 2021 23:34:40 +0800
Message-ID: <20210916153440.15264-1-caihuoqing@baidu.com>
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
 drivers/input/keyboard/tegra-kbc.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/tegra-kbc.c
index 570fe18c0ce9..7f8958dcc76d 100644
--- a/drivers/input/keyboard/tegra-kbc.c
+++ b/drivers/input/keyboard/tegra-kbc.c
@@ -648,16 +648,14 @@ static int tegra_kbc_probe(struct platform_device *pdev)
 		return PTR_ERR(kbc->mmio);
 
 	kbc->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(kbc->clk)) {
-		dev_err(&pdev->dev, "failed to get keyboard clock\n");
-		return PTR_ERR(kbc->clk);
-	}
+	if (IS_ERR(kbc->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(kbc->clk),
+				     "failed to get keyboard clock\n");
 
 	kbc->rst = devm_reset_control_get(&pdev->dev, "kbc");
-	if (IS_ERR(kbc->rst)) {
-		dev_err(&pdev->dev, "failed to get keyboard reset\n");
-		return PTR_ERR(kbc->rst);
-	}
+	if (IS_ERR(kbc->rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(kbc->rst),
+			       "failed to get keyboard reset\n");
 
 	/*
 	 * The time delay between two consecutive reads of the FIFO is
-- 
2.25.1

