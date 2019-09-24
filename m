Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71F37BC46B
	for <lists+linux-input@lfdr.de>; Tue, 24 Sep 2019 11:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729729AbfIXJDv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Sep 2019 05:03:51 -0400
Received: from inva021.nxp.com ([92.121.34.21]:51852 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729713AbfIXJDv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Sep 2019 05:03:51 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DB80420021C;
        Tue, 24 Sep 2019 11:03:48 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A25D020095F;
        Tue, 24 Sep 2019 11:03:43 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 48AEE4029F;
        Tue, 24 Sep 2019 17:03:37 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        swboyd@chromium.org, mojha@codeaurora.org,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] input: touchscreen: imx6ul_tsc: Use 'dev' instead of dereferencing it repeatedly
Date:   Tue, 24 Sep 2019 17:02:11 +0800
Message-Id: <1569315731-2387-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add helper variable dev = &pdev->dev to simply the code.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/input/touchscreen/imx6ul_tsc.c | 37 +++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index 9ed2588..4555aa9 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -361,7 +361,8 @@ static void imx6ul_tsc_close(struct input_dev *input_dev)
 
 static int imx6ul_tsc_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	struct imx6ul_tsc *tsc;
 	struct input_dev *input_dev;
 	int err;
@@ -369,11 +370,11 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 	int adc_irq;
 	u32 average_samples;
 
-	tsc = devm_kzalloc(&pdev->dev, sizeof(*tsc), GFP_KERNEL);
+	tsc = devm_kzalloc(dev, sizeof(*tsc), GFP_KERNEL);
 	if (!tsc)
 		return -ENOMEM;
 
-	input_dev = devm_input_allocate_device(&pdev->dev);
+	input_dev = devm_input_allocate_device(dev);
 	if (!input_dev)
 		return -ENOMEM;
 
@@ -389,14 +390,14 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 
 	input_set_drvdata(input_dev, tsc);
 
-	tsc->dev = &pdev->dev;
+	tsc->dev = dev;
 	tsc->input = input_dev;
 	init_completion(&tsc->completion);
 
-	tsc->xnur_gpio = devm_gpiod_get(&pdev->dev, "xnur", GPIOD_IN);
+	tsc->xnur_gpio = devm_gpiod_get(dev, "xnur", GPIOD_IN);
 	if (IS_ERR(tsc->xnur_gpio)) {
 		err = PTR_ERR(tsc->xnur_gpio);
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"failed to request GPIO tsc_X- (xnur): %d\n", err);
 		return err;
 	}
@@ -404,28 +405,28 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 	tsc->tsc_regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(tsc->tsc_regs)) {
 		err = PTR_ERR(tsc->tsc_regs);
-		dev_err(&pdev->dev, "failed to remap tsc memory: %d\n", err);
+		dev_err(dev, "failed to remap tsc memory: %d\n", err);
 		return err;
 	}
 
 	tsc->adc_regs = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(tsc->adc_regs)) {
 		err = PTR_ERR(tsc->adc_regs);
-		dev_err(&pdev->dev, "failed to remap adc memory: %d\n", err);
+		dev_err(dev, "failed to remap adc memory: %d\n", err);
 		return err;
 	}
 
-	tsc->tsc_clk = devm_clk_get(&pdev->dev, "tsc");
+	tsc->tsc_clk = devm_clk_get(dev, "tsc");
 	if (IS_ERR(tsc->tsc_clk)) {
 		err = PTR_ERR(tsc->tsc_clk);
-		dev_err(&pdev->dev, "failed getting tsc clock: %d\n", err);
+		dev_err(dev, "failed getting tsc clock: %d\n", err);
 		return err;
 	}
 
-	tsc->adc_clk = devm_clk_get(&pdev->dev, "adc");
+	tsc->adc_clk = devm_clk_get(dev, "adc");
 	if (IS_ERR(tsc->adc_clk)) {
 		err = PTR_ERR(tsc->adc_clk);
-		dev_err(&pdev->dev, "failed getting adc clock: %d\n", err);
+		dev_err(dev, "failed getting adc clock: %d\n", err);
 		return err;
 	}
 
@@ -439,18 +440,18 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 
 	err = devm_request_threaded_irq(tsc->dev, tsc_irq,
 					NULL, tsc_irq_fn, IRQF_ONESHOT,
-					dev_name(&pdev->dev), tsc);
+					dev_name(dev), tsc);
 	if (err) {
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"failed requesting tsc irq %d: %d\n",
 			tsc_irq, err);
 		return err;
 	}
 
 	err = devm_request_irq(tsc->dev, adc_irq, adc_irq_fn, 0,
-				dev_name(&pdev->dev), tsc);
+				dev_name(dev), tsc);
 	if (err) {
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"failed requesting adc irq %d: %d\n",
 			adc_irq, err);
 		return err;
@@ -484,7 +485,7 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 		tsc->average_select = ilog2(average_samples) - 2;
 		break;
 	default:
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"touchscreen-average-samples (%u) must be 1, 4, 8, 16 or 32\n",
 			average_samples);
 		return -EINVAL;
@@ -492,7 +493,7 @@ static int imx6ul_tsc_probe(struct platform_device *pdev)
 
 	err = input_register_device(tsc->input);
 	if (err) {
-		dev_err(&pdev->dev,
+		dev_err(dev,
 			"failed to register input device: %d\n", err);
 		return err;
 	}
-- 
2.7.4

