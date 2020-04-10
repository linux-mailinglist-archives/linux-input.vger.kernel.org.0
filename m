Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF4DB1A467D
	for <lists+linux-input@lfdr.de>; Fri, 10 Apr 2020 14:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgDJMvI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Apr 2020 08:51:08 -0400
Received: from inva021.nxp.com ([92.121.34.21]:40702 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725926AbgDJMvI (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Apr 2020 08:51:08 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6295E2008E5;
        Fri, 10 Apr 2020 14:51:06 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CC0772008FF;
        Fri, 10 Apr 2020 14:51:03 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 514BD402E4;
        Fri, 10 Apr 2020 20:51:00 +0800 (SGT)
From:   haibo.chen@nxp.com
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com, haibo.chen@nxp.com
Subject: [PATCH v2 1/2] input: egalax_ts: free irq resource before request the line as GPIO
Date:   Fri, 10 Apr 2020 20:43:04 +0800
Message-Id: <1586522585-14296-1-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

If GPIO is connected to an IRQ then it should not request it as
GPIO function only when free its IRQ resource.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/input/touchscreen/egalax_ts.c | 46 ++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/egalax_ts.c b/drivers/input/touchscreen/egalax_ts.c
index 83ac8c128192..c816e03ba421 100644
--- a/drivers/input/touchscreen/egalax_ts.c
+++ b/drivers/input/touchscreen/egalax_ts.c
@@ -116,6 +116,26 @@ static irqreturn_t egalax_ts_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int egalax_irq_request(struct egalax_ts *ts)
+{
+	int ret;
+	struct i2c_client *client = ts->client;
+
+	ret = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+					egalax_ts_interrupt,
+					IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+					"egalax_ts", ts);
+	if (ret < 0)
+		dev_err(&client->dev, "Failed to register interrupt\n");
+
+	return ret;
+}
+
+static void egalax_free_irq(struct egalax_ts *ts)
+{
+	devm_free_irq(&ts->client->dev, ts->client->irq, ts);
+}
+
 /* wake up controller by an falling edge of interrupt gpio.  */
 static int egalax_wake_up_device(struct i2c_client *client)
 {
@@ -211,19 +231,16 @@ static int egalax_ts_probe(struct i2c_client *client,
 			     ABS_MT_POSITION_Y, 0, EGALAX_MAX_Y, 0, 0);
 	input_mt_init_slots(input_dev, MAX_SUPPORT_POINTS, 0);
 
-	error = devm_request_threaded_irq(&client->dev, client->irq, NULL,
-					  egalax_ts_interrupt,
-					  IRQF_TRIGGER_LOW | IRQF_ONESHOT,
-					  "egalax_ts", ts);
-	if (error < 0) {
-		dev_err(&client->dev, "Failed to register interrupt\n");
+	error = egalax_irq_request(ts);
+	if (error)
 		return error;
-	}
 
 	error = input_register_device(ts->input_dev);
 	if (error)
 		return error;
 
+	i2c_set_clientdata(client, ts);
+
 	return 0;
 }
 
@@ -251,11 +268,24 @@ static int __maybe_unused egalax_ts_suspend(struct device *dev)
 static int __maybe_unused egalax_ts_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct egalax_ts *ts = i2c_get_clientdata(client);
+	int error;
 
 	if (device_may_wakeup(dev))
 		return disable_irq_wake(client->irq);
 
-	return egalax_wake_up_device(client);
+	/* Free IRQ as IRQ pin is used as output in the suspend sequence */
+	egalax_free_irq(ts);
+
+	error = egalax_wake_up_device(client);
+	if (error) {
+		dev_err(&client->dev, "Failed to wake up the controller\n");
+		return error;
+	}
+
+	error = egalax_irq_request(ts);
+
+	return error;
 }
 
 static SIMPLE_DEV_PM_OPS(egalax_ts_pm_ops, egalax_ts_suspend, egalax_ts_resume);
-- 
2.17.1

