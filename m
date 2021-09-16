Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D02840DE83
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 17:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240112AbhIPPuL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 11:50:11 -0400
Received: from mx24.baidu.com ([111.206.215.185]:45078 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S240091AbhIPPuK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 11:50:10 -0400
Received: from BC-Mail-Ex26.internal.baidu.com (unknown [172.31.51.20])
        by Forcepoint Email with ESMTPS id 0C95D66227D9E159F3C4;
        Thu, 16 Sep 2021 23:32:47 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex26.internal.baidu.com (172.31.51.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 16 Sep 2021 23:32:46 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Thu, 16 Sep 2021 23:32:46 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "NXP Linux Team" <linux-imx@nxp.com>,
        <linux-input@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH] Input: imx6ul_tsc - Make use of the helper function dev_err_probe()
Date:   Thu, 16 Sep 2021 23:32:40 +0800
Message-ID: <20210916153241.14416-1-caihuoqing@baidu.com>
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
 drivers/input/touchscreen/imx6ul_tsc.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index 2d4facf70cdb..47b73b4008ab 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -405,12 +405,9 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 	init_completion(&tsc->completion);
 
 	tsc->xnur_gpio = devm_gpiod_get(&pdev->dev, "xnur", GPIOD_IN);
-	if (IS_ERR(tsc->xnur_gpio)) {
-		err = PTR_ERR(tsc->xnur_gpio);
-		dev_err(&pdev->dev,
-			"failed to request GPIO tsc_X- (xnur): %d\n", err);
-		return err;
-	}
+	if (IS_ERR(tsc->xnur_gpio))
+		return dev_err_probe(&pdev->dev, PTR_ERR(tsc->xnur_gpio),
+				     "failed to request GPIO tsc_X- (xnur)\n");
 
 	tsc->tsc_regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(tsc->tsc_regs)) {
@@ -427,18 +424,14 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 	}
 
 	tsc->tsc_clk = devm_clk_get(&pdev->dev, "tsc");
-	if (IS_ERR(tsc->tsc_clk)) {
-		err = PTR_ERR(tsc->tsc_clk);
-		dev_err(&pdev->dev, "failed getting tsc clock: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(tsc->tsc_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(tsc->tsc_clk),
+				     "failed getting tsc clock\n");
 
 	tsc->adc_clk = devm_clk_get(&pdev->dev, "adc");
-	if (IS_ERR(tsc->adc_clk)) {
-		err = PTR_ERR(tsc->adc_clk);
-		dev_err(&pdev->dev, "failed getting adc clock: %d\n", err);
-		return err;
-	}
+	if (IS_ERR(tsc->adc_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(tsc->adc_clk),
+				     "failed getting adc clock\n");
 
 	tsc_irq = platform_get_irq(pdev, 0);
 	if (tsc_irq < 0)
-- 
2.25.1

