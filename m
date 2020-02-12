Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A12F915A39A
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbgBLIpg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:45:36 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:18970 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728493AbgBLIpg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:45:36 -0500
IronPort-SDR: 1Big0VSGyw7CJIt4ymO9u94ck1e4b5qs1WRNBPrHOcWd0FJkj0tDPe5jjIkpKLGT3LlHMJViek
 5o5YR5JvrRafSPVJ+mF++veDk1NL/mZcsvP34TKYYU+b7K08ElQwQ2zY+BViykZVS/6AHPLlEt
 yKASyXR4mhtyQi2ToFIYcsr+SgoBHq+Ui2za67AeMTMZjiyNw8kY2BZj/fn4JlJQNIU4iK0RTL
 Ac4OJ+RD6F5BLpC5efNyIYi5YEBukG1Qqu6TLDvmTWpME34SGrjUH0eWYi72d02JH9T+ZSqj+p
 jn0=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="45742572"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:45:36 -0800
IronPort-SDR: nm0JlDvgQccknzsRt2ndlrRSl5qQEP9q2zxTnm7TQow9NBy+2TsCUe5hBEwWgOWG+OOC4DX8vP
 olcDxqbBccAiBA8bC6+HGIKedBI+1ZA+ixgKphV11b6qbbhpDQx0xu4yKL0uS0kvtgLXMviJQA
 jne1tOe+XEBjM90mR5ldRxI6ERCmOy9Ksf9VRYgEQNbYh2YthaZtUcwi8AQjH1uROUxMev7ZSM
 Dcbwed0JlEfd9rCcxT9zCHUC0TjAJCLH1mBiBb5kAQfYJ1+/s2jrfzp5jMEX70hXNVprkyZilS
 oNY=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 25/48] Input: atmel_mxt_ts - delay enabling IRQ when not using regulators
Date:   Wed, 12 Feb 2020 00:41:55 -0800
Message-ID: <20200212084218.32344-26-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

The path of enabling the IRQ in the probe function is not safe in level
triggered operation, if it was already powered up and there is a message
waiting on the device (eg finger down) because the object table has not yet
been read. This forces the ISR into a hard loop.

Delay enabling the interrupt until it is first needed.

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit 64c9dadc4a3250a185baf06ab0f628be45d5d9a0)
[gdavis: Resolve forward port conflicts due to v4.14-rc1 commit
	 8cc8446b9b62 ("Input: atmel_mxt_ts - use more managed
	 resources") and applying upstream commit 96a938aa214e ("Input:
	 atmel_mxt_ts - remove platform data support").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 40 +++++++++++++++---------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 07601539ac27..ff9a801e9e5e 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1448,9 +1448,24 @@ static int mxt_acquire_irq(struct mxt_data *data)
 {
 	int error;
 
-	enable_irq(data->irq);
+	if (!data->irq) {
+		error = devm_request_threaded_irq(&data->client->dev,
+						  data->client->irq,
+						  NULL, mxt_interrupt,
+						  IRQF_ONESHOT,
+						  data->client->name, data);
+		if (error) {
+			dev_err(&data->client->dev, "Error requesting irq\n");
+			return error;
+		}
 
-	if (data->use_retrigen_workaround) {
+		/* Presence of data->irq means IRQ initialised */
+		data->irq = data->client->irq;
+	} else {
+		enable_irq(data->irq);
+	}
+
+	if (data->object_table && data->use_retrigen_workaround) {
 		error = mxt_process_messages_until_invalid(data);
 		if (error)
 			return error;
@@ -3370,7 +3385,9 @@ static int mxt_load_fw(struct device *dev)
 			goto release_firmware;
 	}
 
-	enable_irq(data->irq);
+	ret = mxt_acquire_irq(data);
+	if (ret)
+		goto release_firmware;
 
 	/* Poll after 0.1s if no interrupt received */
 	schedule_delayed_work(&data->flash->work, msecs_to_jiffies(100));
@@ -3797,7 +3814,6 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		 client->adapter->nr, client->addr);
 
 	data->client = client;
-	data->irq = client->irq;
 	i2c_set_clientdata(client, data);
 
 	init_completion(&data->chg_completion);
@@ -3825,26 +3841,22 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return error;
 	}
 
-	error = devm_request_threaded_irq(&client->dev, client->irq,
-					  NULL, mxt_interrupt, IRQF_ONESHOT,
-					  client->name, data);
-	if (error) {
-		dev_err(&client->dev, "Failed to register interrupt\n");
-		return error;
-	}
-
 	if (data->suspend_mode == MXT_SUSPEND_REGULATOR) {
+		error = mxt_acquire_irq(data);
+		if (error)
+			return error;
+
 		error = mxt_probe_regulators(data);
 		if (error)
 			return error;
+
+		disable_irq(data->irq);
 	} else if (data->reset_gpio) {
 		msleep(MXT_RESET_GPIO_TIME);
 		gpiod_set_value(data->reset_gpio, 1);
 		msleep(MXT_RESET_INVALID_CHG);
 	}
 
-	disable_irq(data->irq);
-
 	error = mxt_initialize(data);
 	if (error)
 		return error;
-- 
2.17.1

