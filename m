Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58C63158B6F
	for <lists+linux-input@lfdr.de>; Tue, 11 Feb 2020 09:46:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgBKIqz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 Feb 2020 03:46:55 -0500
Received: from inva020.nxp.com ([92.121.34.13]:58718 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727600AbgBKIqz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 Feb 2020 03:46:55 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0CF981A3123;
        Tue, 11 Feb 2020 09:46:53 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6AA351A3125;
        Tue, 11 Feb 2020 09:46:50 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id EDB89402DF;
        Tue, 11 Feb 2020 16:46:46 +0800 (SGT)
From:   haibo.chen@nxp.com
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
Cc:     haibo.chen@nxp.com, linux-imx@nxp.com
Subject: [PATCH 2/2] input: egalax_ts: free irq resource before request the line as GPIO
Date:   Tue, 11 Feb 2020 16:41:12 +0800
Message-Id: <1581410472-3225-2-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581410472-3225-1-git-send-email-haibo.chen@nxp.com>
References: <1581410472-3225-1-git-send-email-haibo.chen@nxp.com>
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
 drivers/input/touchscreen/egalax_ts.c | 44 +++++++++++++++++++--------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen/egalax_ts.c b/drivers/input/touchscreen/egalax_ts.c
index 5e35ca5edc7b..c7983104a0b9 100644
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
@@ -225,19 +245,15 @@ static int egalax_ts_probe(struct i2c_client *client,
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
 	return 0;
 }
 
@@ -253,11 +269,10 @@ static int __maybe_unused egalax_ts_suspend(struct device *dev)
 		0x3, 0x6, 0xa, 0x3, 0x36, 0x3f, 0x2, 0, 0, 0
 	};
 	struct i2c_client *client = to_i2c_client(dev);
+	struct egalax_ts *ts = i2c_get_clientdata(client);
 	int ret;
 
-	if (device_may_wakeup(dev))
-		return enable_irq_wake(client->irq);
-
+	egalax_free_irq(ts);
 	ret = i2c_master_send(client, suspend_cmd, MAX_I2C_DATA_LEN);
 	return ret > 0 ? 0 : ret;
 }
@@ -265,11 +280,14 @@ static int __maybe_unused egalax_ts_suspend(struct device *dev)
 static int __maybe_unused egalax_ts_resume(struct device *dev)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct egalax_ts *ts = i2c_get_clientdata(client);
+	int ret;
 
-	if (device_may_wakeup(dev))
-		return disable_irq_wake(client->irq);
+	ret = egalax_wake_up_device(client);
+	if (!ret)
+		ret = egalax_irq_request(ts);
 
-	return egalax_wake_up_device(client);
+	return ret;
 }
 
 static SIMPLE_DEV_PM_OPS(egalax_ts_pm_ops, egalax_ts_suspend, egalax_ts_resume);
-- 
2.17.1

