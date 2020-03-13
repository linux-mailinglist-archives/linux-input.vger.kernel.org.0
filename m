Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E16018412A
	for <lists+linux-input@lfdr.de>; Fri, 13 Mar 2020 08:05:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgCMHFu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Mar 2020 03:05:50 -0400
Received: from inva020.nxp.com ([92.121.34.13]:36290 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726060AbgCMHFu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Mar 2020 03:05:50 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8A2ED1A1282;
        Fri, 13 Mar 2020 08:05:48 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4B7461A132F;
        Fri, 13 Mar 2020 08:05:43 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 340FF40245;
        Fri, 13 Mar 2020 15:05:37 +0800 (SGT)
From:   Anson Huang <Anson.Huang@nxp.com>
To:     dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        robh@kernel.org, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
Subject: [PATCH] input: keyboard: imx_sc_key: Use devm_add_action_or_reset() to handle all cleanups
Date:   Fri, 13 Mar 2020 14:59:11 +0800
Message-Id: <1584082751-17047-1-git-send-email-Anson.Huang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use devm_add_action_or_reset() to handle all cleanups of failure in
.probe and .remove, then .remove callback can be dropped.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/input/keyboard/imx_sc_key.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/drivers/input/keyboard/imx_sc_key.c b/drivers/input/keyboard/imx_sc_key.c
index 2672fd4..eab5dfb 100644
--- a/drivers/input/keyboard/imx_sc_key.c
+++ b/drivers/input/keyboard/imx_sc_key.c
@@ -96,6 +96,15 @@ static void imx_sc_check_for_events(struct work_struct *work)
 				      msecs_to_jiffies(REPEAT_INTERVAL));
 }
 
+static void imx_sc_key_action(void *data)
+{
+	struct imx_key_drv_data *priv = data;
+
+	imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE, SC_IRQ_BUTTON, false);
+	imx_scu_irq_unregister_notifier(&priv->key_notifier);
+	cancel_delayed_work_sync(&priv->check_work);
+}
+
 static int imx_sc_key_probe(struct platform_device *pdev)
 {
 	struct imx_key_drv_data *priv;
@@ -146,27 +155,16 @@ static int imx_sc_key_probe(struct platform_device *pdev)
 		return error;
 	}
 
+	error = devm_add_action_or_reset(&pdev->dev, imx_sc_key_action, &priv);
+	if (error)
+		return error;
+
 	priv->key_notifier.notifier_call = imx_sc_key_notify;
 	error = imx_scu_irq_register_notifier(&priv->key_notifier);
-	if (error) {
-		imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE, SC_IRQ_BUTTON,
-					 false);
+	if (error)
 		dev_err(&pdev->dev, "failed to register scu notifier\n");
-		return error;
-	}
-
-	return 0;
-}
-
-static int imx_sc_key_remove(struct platform_device *pdev)
-{
-	struct imx_key_drv_data *priv = platform_get_drvdata(pdev);
-
-	imx_scu_irq_group_enable(SC_IRQ_GROUP_WAKE, SC_IRQ_BUTTON, false);
-	imx_scu_irq_unregister_notifier(&priv->key_notifier);
-	cancel_delayed_work_sync(&priv->check_work);
 
-	return 0;
+	return error;
 }
 
 static const struct of_device_id imx_sc_key_ids[] = {
@@ -181,7 +179,6 @@ static struct platform_driver imx_sc_key_driver = {
 		.of_match_table = imx_sc_key_ids,
 	},
 	.probe = imx_sc_key_probe,
-	.remove = imx_sc_key_remove,
 };
 module_platform_driver(imx_sc_key_driver);
 
-- 
2.7.4

