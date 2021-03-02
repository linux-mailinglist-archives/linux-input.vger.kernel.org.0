Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8ECE32B4CB
	for <lists+linux-input@lfdr.de>; Wed,  3 Mar 2021 06:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354229AbhCCF25 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 00:28:57 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:13042 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2361093AbhCBXTa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 18:19:30 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Dqsqf6HvhzMgMj;
        Wed,  3 Mar 2021 06:53:34 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.201.99) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Mar 2021 06:55:33 +0800
From:   Barry Song <song.bao.hua@hisilicon.com>
To:     <tglx@linutronix.de>, <dmitry.torokhov@gmail.com>,
        <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     <maz@kernel.org>, <gregkh@linuxfoundation.org>,
        <linuxarm@openeuler.org>, <jonathan.cameron@huawei.com>,
        Barry Song <song.bao.hua@hisilicon.com>
Subject: [PATCH v5 2/2] Input: move to use request_irq by IRQF_NO_AUTOEN flag
Date:   Wed, 3 Mar 2021 11:49:16 +1300
Message-ID: <20210302224916.13980-3-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20210302224916.13980-1-song.bao.hua@hisilicon.com>
References: <20210302224916.13980-1-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.126.201.99]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

disable_irq() after request_irq() still has a time gap in which
interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
disable IRQ auto-enable because of requesting.

On the other hand, request_irq() after setting IRQ_NOAUTOEN as
below
irq_set_status_flags(irq, IRQ_NOAUTOEN);
request_irq(dev, irq...);
can also be replaced by request_irq() with IRQF_NO_AUTOEN flag.

Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 drivers/input/keyboard/tca6416-keypad.c  | 3 +--
 drivers/input/keyboard/tegra-kbc.c       | 5 ++---
 drivers/input/touchscreen/ar1021_i2c.c   | 5 +----
 drivers/input/touchscreen/atmel_mxt_ts.c | 5 ++---
 drivers/input/touchscreen/bu21029_ts.c   | 4 ++--
 drivers/input/touchscreen/cyttsp_core.c  | 5 ++---
 drivers/input/touchscreen/melfas_mip4.c  | 5 ++---
 drivers/input/touchscreen/mms114.c       | 4 ++--
 drivers/input/touchscreen/stmfts.c       | 3 +--
 drivers/input/touchscreen/wm831x-ts.c    | 3 +--
 drivers/input/touchscreen/zinitix.c      | 4 ++--
 11 files changed, 18 insertions(+), 28 deletions(-)

diff --git a/drivers/input/keyboard/tca6416-keypad.c b/drivers/input/keyboard/tca6416-keypad.c
index 9b0f9665dcb0..2a9755910065 100644
--- a/drivers/input/keyboard/tca6416-keypad.c
+++ b/drivers/input/keyboard/tca6416-keypad.c
@@ -274,7 +274,7 @@ static int tca6416_keypad_probe(struct i2c_client *client,
 		error = request_threaded_irq(chip->irqnum, NULL,
 					     tca6416_keys_isr,
 					     IRQF_TRIGGER_FALLING |
-						IRQF_ONESHOT,
+					     IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					     "tca6416-keypad", chip);
 		if (error) {
 			dev_dbg(&client->dev,
@@ -282,7 +282,6 @@ static int tca6416_keypad_probe(struct i2c_client *client,
 				chip->irqnum, error);
 			goto fail1;
 		}
-		disable_irq(chip->irqnum);
 	}
 
 	error = input_register_device(input);
diff --git a/drivers/input/keyboard/tegra-kbc.c b/drivers/input/keyboard/tegra-kbc.c
index 9671842a082a..570fe18c0ce9 100644
--- a/drivers/input/keyboard/tegra-kbc.c
+++ b/drivers/input/keyboard/tegra-kbc.c
@@ -694,14 +694,13 @@ static int tegra_kbc_probe(struct platform_device *pdev)
 	input_set_drvdata(kbc->idev, kbc);
 
 	err = devm_request_irq(&pdev->dev, kbc->irq, tegra_kbc_isr,
-			       IRQF_TRIGGER_HIGH, pdev->name, kbc);
+			       IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
+			       pdev->name, kbc);
 	if (err) {
 		dev_err(&pdev->dev, "failed to request keyboard IRQ\n");
 		return err;
 	}
 
-	disable_irq(kbc->irq);
-
 	err = input_register_device(kbc->idev);
 	if (err) {
 		dev_err(&pdev->dev, "failed to register input device\n");
diff --git a/drivers/input/touchscreen/ar1021_i2c.c b/drivers/input/touchscreen/ar1021_i2c.c
index c0d5c2413356..dc6a85362a40 100644
--- a/drivers/input/touchscreen/ar1021_i2c.c
+++ b/drivers/input/touchscreen/ar1021_i2c.c
@@ -125,7 +125,7 @@ static int ar1021_i2c_probe(struct i2c_client *client,
 
 	error = devm_request_threaded_irq(&client->dev, client->irq,
 					  NULL, ar1021_i2c_irq,
-					  IRQF_ONESHOT,
+					  IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					  "ar1021_i2c", ar1021);
 	if (error) {
 		dev_err(&client->dev,
@@ -133,9 +133,6 @@ static int ar1021_i2c_probe(struct i2c_client *client,
 		return error;
 	}
 
-	/* Disable the IRQ, we'll enable it in ar1021_i2c_open() */
-	disable_irq(client->irq);
-
 	error = input_register_device(ar1021->input);
 	if (error) {
 		dev_err(&client->dev,
diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 383a848eb601..3c837c7b24b3 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3156,15 +3156,14 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	}
 
 	error = devm_request_threaded_irq(&client->dev, client->irq,
-					  NULL, mxt_interrupt, IRQF_ONESHOT,
+					  NULL, mxt_interrupt,
+					  IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					  client->name, data);
 	if (error) {
 		dev_err(&client->dev, "Failed to register interrupt\n");
 		return error;
 	}
 
-	disable_irq(client->irq);
-
 	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators),
 				      data->regulators);
 	if (error) {
diff --git a/drivers/input/touchscreen/bu21029_ts.c b/drivers/input/touchscreen/bu21029_ts.c
index 341925edb8e6..392950aa7856 100644
--- a/drivers/input/touchscreen/bu21029_ts.c
+++ b/drivers/input/touchscreen/bu21029_ts.c
@@ -401,10 +401,10 @@ static int bu21029_probe(struct i2c_client *client,
 
 	input_set_drvdata(in_dev, bu21029);
 
-	irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
 	error = devm_request_threaded_irq(&client->dev, client->irq,
 					  NULL, bu21029_touch_soft_irq,
-					  IRQF_ONESHOT, DRIVER_NAME, bu21029);
+					  IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					  DRIVER_NAME, bu21029);
 	if (error) {
 		dev_err(&client->dev,
 			"unable to request touch irq: %d\n", error);
diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index 73c854f35f33..d5c933604168 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -652,7 +652,8 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
 	}
 
 	error = devm_request_threaded_irq(dev, ts->irq, NULL, cyttsp_irq,
-					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+					  IRQF_TRIGGER_FALLING | IRQF_ONESHOT |
+					  IRQF_NO_AUTOEN,
 					  "cyttsp", ts);
 	if (error) {
 		dev_err(ts->dev, "failed to request IRQ %d, err: %d\n",
@@ -660,8 +661,6 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
 		return ERR_PTR(error);
 	}
 
-	disable_irq(ts->irq);
-
 	cyttsp_hard_reset(ts);
 
 	error = cyttsp_power_on(ts);
diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
index 225796a3f546..2745bf1aee38 100644
--- a/drivers/input/touchscreen/melfas_mip4.c
+++ b/drivers/input/touchscreen/melfas_mip4.c
@@ -1502,7 +1502,8 @@ static int mip4_probe(struct i2c_client *client, const struct i2c_device_id *id)
 
 	error = devm_request_threaded_irq(&client->dev, client->irq,
 					  NULL, mip4_interrupt,
-					  IRQF_ONESHOT, MIP4_DEVICE_NAME, ts);
+					  IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					  MIP4_DEVICE_NAME, ts);
 	if (error) {
 		dev_err(&client->dev,
 			"Failed to request interrupt %d: %d\n",
@@ -1510,8 +1511,6 @@ static int mip4_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return error;
 	}
 
-	disable_irq(client->irq);
-
 	error = input_register_device(input);
 	if (error) {
 		dev_err(&client->dev,
diff --git a/drivers/input/touchscreen/mms114.c b/drivers/input/touchscreen/mms114.c
index 16557f51b09d..7043f57ea2dd 100644
--- a/drivers/input/touchscreen/mms114.c
+++ b/drivers/input/touchscreen/mms114.c
@@ -530,13 +530,13 @@ static int mms114_probe(struct i2c_client *client,
 	}
 
 	error = devm_request_threaded_irq(&client->dev, client->irq,
-					  NULL, mms114_interrupt, IRQF_ONESHOT,
+					  NULL, mms114_interrupt,
+					  IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					  dev_name(&client->dev), data);
 	if (error) {
 		dev_err(&client->dev, "Failed to register interrupt\n");
 		return error;
 	}
-	disable_irq(client->irq);
 
 	error = input_register_device(data->input_dev);
 	if (error) {
diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 9a64e1dbc04a..bc11203c9cf7 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -691,10 +691,9 @@ static int stmfts_probe(struct i2c_client *client,
 	 * interrupts. To be on the safe side it's better to not enable
 	 * the interrupts during their request.
 	 */
-	irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
 	err = devm_request_threaded_irq(&client->dev, client->irq,
 					NULL, stmfts_irq_handler,
-					IRQF_ONESHOT,
+					IRQF_ONESHOT | IRQF_NO_AUTOEN,
 					"stmfts_irq", sdata);
 	if (err)
 		return err;
diff --git a/drivers/input/touchscreen/wm831x-ts.c b/drivers/input/touchscreen/wm831x-ts.c
index bb1699e0d3c7..319f57fb9af5 100644
--- a/drivers/input/touchscreen/wm831x-ts.c
+++ b/drivers/input/touchscreen/wm831x-ts.c
@@ -317,14 +317,13 @@ static int wm831x_ts_probe(struct platform_device *pdev)
 
 	error = request_threaded_irq(wm831x_ts->data_irq,
 				     NULL, wm831x_ts_data_irq,
-				     irqf | IRQF_ONESHOT,
+				     irqf | IRQF_ONESHOT | IRQF_NO_AUTOEN,
 				     "Touchscreen data", wm831x_ts);
 	if (error) {
 		dev_err(&pdev->dev, "Failed to request data IRQ %d: %d\n",
 			wm831x_ts->data_irq, error);
 		goto err_alloc;
 	}
-	disable_irq(wm831x_ts->data_irq);
 
 	if (pdata && pdata->pd_irqf)
 		irqf = pdata->pd_irqf;
diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
index 3b636beb583c..b8d901099378 100644
--- a/drivers/input/touchscreen/zinitix.c
+++ b/drivers/input/touchscreen/zinitix.c
@@ -513,10 +513,10 @@ static int zinitix_ts_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
 	error = devm_request_threaded_irq(&client->dev, client->irq,
 					  NULL, zinitix_ts_irq_handler,
-					  IRQF_ONESHOT, client->name, bt541);
+					  IRQF_ONESHOT | IRQF_NO_AUTOEN,
+					  client->name, bt541);
 	if (error) {
 		dev_err(&client->dev, "Failed to request IRQ: %d\n", error);
 		return error;
-- 
2.25.1

