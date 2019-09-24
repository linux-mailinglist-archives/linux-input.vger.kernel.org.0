Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 358C4BC473
	for <lists+linux-input@lfdr.de>; Tue, 24 Sep 2019 11:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729685AbfIXJF7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Sep 2019 05:05:59 -0400
Received: from inva020.nxp.com ([92.121.34.13]:38736 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729641AbfIXJF7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Sep 2019 05:05:59 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F37031A0274;
        Tue, 24 Sep 2019 11:05:56 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BDC021A0169;
        Tue, 24 Sep 2019 11:05:51 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C4E4C402B4;
        Tue, 24 Sep 2019 17:05:45 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        swboyd@chromium.org, mojha@codeaurora.org,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] input: keyboard: imx_keypad: Use 'dev' instead of dereferencing it repeatedly
Date:   Tue, 24 Sep 2019 17:04:19 +0800
Message-Id: <1569315859-7046-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add helper variable dev = &pdev->dev to simply the code.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/input/keyboard/imx_keypad.c | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/input/keyboard/imx_keypad.c b/drivers/input/keyboard/imx_keypad.c
index 5a46d11..3024d2a 100644
--- a/drivers/input/keyboard/imx_keypad.c
+++ b/drivers/input/keyboard/imx_keypad.c
@@ -418,14 +418,15 @@ MODULE_DEVICE_TABLE(of, imx_keypad_of_match);
 
 static int imx_keypad_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	const struct matrix_keymap_data *keymap_data =
-			dev_get_platdata(&pdev->dev);
+			dev_get_platdata(dev);
 	struct imx_keypad *keypad;
 	struct input_dev *input_dev;
 	int irq, error, i, row, col;
 
-	if (!keymap_data && !pdev->dev.of_node) {
-		dev_err(&pdev->dev, "no keymap defined\n");
+	if (!keymap_data && !dev->of_node) {
+		dev_err(dev, "no keymap defined\n");
 		return -EINVAL;
 	}
 
@@ -433,15 +434,15 @@ static int imx_keypad_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	input_dev = devm_input_allocate_device(&pdev->dev);
+	input_dev = devm_input_allocate_device(dev);
 	if (!input_dev) {
-		dev_err(&pdev->dev, "failed to allocate the input device\n");
+		dev_err(dev, "failed to allocate the input device\n");
 		return -ENOMEM;
 	}
 
-	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
+	keypad = devm_kzalloc(dev, sizeof(*keypad), GFP_KERNEL);
 	if (!keypad) {
-		dev_err(&pdev->dev, "not enough memory for driver data\n");
+		dev_err(dev, "not enough memory for driver data\n");
 		return -ENOMEM;
 	}
 
@@ -456,16 +457,16 @@ static int imx_keypad_probe(struct platform_device *pdev)
 	if (IS_ERR(keypad->mmio_base))
 		return PTR_ERR(keypad->mmio_base);
 
-	keypad->clk = devm_clk_get(&pdev->dev, NULL);
+	keypad->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(keypad->clk)) {
-		dev_err(&pdev->dev, "failed to get keypad clock\n");
+		dev_err(dev, "failed to get keypad clock\n");
 		return PTR_ERR(keypad->clk);
 	}
 
 	/* Init the Input device */
 	input_dev->name = pdev->name;
 	input_dev->id.bustype = BUS_HOST;
-	input_dev->dev.parent = &pdev->dev;
+	input_dev->dev.parent = dev;
 	input_dev->open = imx_keypad_open;
 	input_dev->close = imx_keypad_close;
 
@@ -474,7 +475,7 @@ static int imx_keypad_probe(struct platform_device *pdev)
 					   MAX_MATRIX_KEY_COLS,
 					   keypad->keycodes, input_dev);
 	if (error) {
-		dev_err(&pdev->dev, "failed to build keymap\n");
+		dev_err(dev, "failed to build keymap\n");
 		return error;
 	}
 
@@ -488,8 +489,8 @@ static int imx_keypad_probe(struct platform_device *pdev)
 			}
 		}
 	}
-	dev_dbg(&pdev->dev, "enabled rows mask: %x\n", keypad->rows_en_mask);
-	dev_dbg(&pdev->dev, "enabled cols mask: %x\n", keypad->cols_en_mask);
+	dev_dbg(dev, "enabled rows mask: %x\n", keypad->rows_en_mask);
+	dev_dbg(dev, "enabled cols mask: %x\n", keypad->cols_en_mask);
 
 	__set_bit(EV_REP, input_dev->evbit);
 	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
@@ -502,22 +503,22 @@ static int imx_keypad_probe(struct platform_device *pdev)
 	imx_keypad_inhibit(keypad);
 	clk_disable_unprepare(keypad->clk);
 
-	error = devm_request_irq(&pdev->dev, irq, imx_keypad_irq_handler, 0,
+	error = devm_request_irq(dev, irq, imx_keypad_irq_handler, 0,
 			    pdev->name, keypad);
 	if (error) {
-		dev_err(&pdev->dev, "failed to request IRQ\n");
+		dev_err(dev, "failed to request IRQ\n");
 		return error;
 	}
 
 	/* Register the input device */
 	error = input_register_device(input_dev);
 	if (error) {
-		dev_err(&pdev->dev, "failed to register input device\n");
+		dev_err(dev, "failed to register input device\n");
 		return error;
 	}
 
 	platform_set_drvdata(pdev, keypad);
-	device_init_wakeup(&pdev->dev, 1);
+	device_init_wakeup(dev, 1);
 
 	return 0;
 }
-- 
2.7.4

