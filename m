Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32D41BC46F
	for <lists+linux-input@lfdr.de>; Tue, 24 Sep 2019 11:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729728AbfIXJEn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Sep 2019 05:04:43 -0400
Received: from inva020.nxp.com ([92.121.34.13]:37278 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729704AbfIXJEn (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Sep 2019 05:04:43 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 43CB21A0169;
        Tue, 24 Sep 2019 11:04:40 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A0B511A00D4;
        Tue, 24 Sep 2019 11:04:37 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 15DE7402ED;
        Tue, 24 Sep 2019 17:04:34 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     dmitry.torokhov@gmail.com, swboyd@chromium.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] input: keyboard: snvs_pwrkey: Use 'dev' instead of dereferencing it repeatedly
Date:   Tue, 24 Sep 2019 17:03:08 +0800
Message-Id: <1569315788-4295-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add helper variable dev = &pdev->dev to simply the code.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/input/keyboard/snvs_pwrkey.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index e76b7a4..23b203f 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -90,29 +90,30 @@ static void imx_snvs_pwrkey_act(void *pdata)
 
 static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct pwrkey_drv_data *pdata = NULL;
 	struct input_dev *input = NULL;
 	struct device_node *np;
 	int error;
 
 	/* Get SNVS register Page */
-	np = pdev->dev.of_node;
+	np = dev->of_node;
 	if (!np)
 		return -ENODEV;
 
-	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
+	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
 
 	pdata->snvs = syscon_regmap_lookup_by_phandle(np, "regmap");
 	if (IS_ERR(pdata->snvs)) {
-		dev_err(&pdev->dev, "Can't get snvs syscon\n");
+		dev_err(dev, "Can't get snvs syscon\n");
 		return PTR_ERR(pdata->snvs);
 	}
 
 	if (of_property_read_u32(np, "linux,keycode", &pdata->keycode)) {
 		pdata->keycode = KEY_POWER;
-		dev_warn(&pdev->dev, "KEY_POWER without setting in dts\n");
+		dev_warn(dev, "KEY_POWER without setting in dts\n");
 	}
 
 	pdata->wakeup = of_property_read_bool(np, "wakeup-source");
@@ -128,9 +129,9 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 
 	timer_setup(&pdata->check_timer, imx_imx_snvs_check_for_events, 0);
 
-	input = devm_input_allocate_device(&pdev->dev);
+	input = devm_input_allocate_device(dev);
 	if (!input) {
-		dev_err(&pdev->dev, "failed to allocate the input device\n");
+		dev_err(dev, "failed to allocate the input device\n");
 		return -ENOMEM;
 	}
 
@@ -141,34 +142,34 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	input_set_capability(input, EV_KEY, pdata->keycode);
 
 	/* input customer action to cancel release timer */
-	error = devm_add_action(&pdev->dev, imx_snvs_pwrkey_act, pdata);
+	error = devm_add_action(dev, imx_snvs_pwrkey_act, pdata);
 	if (error) {
-		dev_err(&pdev->dev, "failed to register remove action\n");
+		dev_err(dev, "failed to register remove action\n");
 		return error;
 	}
 
 	pdata->input = input;
 	platform_set_drvdata(pdev, pdata);
 
-	error = devm_request_irq(&pdev->dev, pdata->irq,
+	error = devm_request_irq(dev, pdata->irq,
 			       imx_snvs_pwrkey_interrupt,
 			       0, pdev->name, pdev);
 
 	if (error) {
-		dev_err(&pdev->dev, "interrupt not available.\n");
+		dev_err(dev, "interrupt not available.\n");
 		return error;
 	}
 
 	error = input_register_device(input);
 	if (error < 0) {
-		dev_err(&pdev->dev, "failed to register input device\n");
+		dev_err(dev, "failed to register input device\n");
 		return error;
 	}
 
-	device_init_wakeup(&pdev->dev, pdata->wakeup);
-	error = dev_pm_set_wake_irq(&pdev->dev, pdata->irq);
+	device_init_wakeup(dev, pdata->wakeup);
+	error = dev_pm_set_wake_irq(dev, pdata->irq);
 	if (error)
-		dev_err(&pdev->dev, "irq wake enable failed.\n");
+		dev_err(dev, "irq wake enable failed.\n");
 
 	return 0;
 }
-- 
2.7.4

