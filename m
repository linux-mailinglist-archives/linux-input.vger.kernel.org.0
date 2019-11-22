Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 121FC1067E2
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:25:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbfKVIZj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:25:39 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:52499 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727495AbfKVIZi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:25:38 -0500
IronPort-SDR: MaJtDyEI/JuCOdKTvuRr0V/beitdFb6f/soCebS99Y8qx93iDsuHWkpDOXkGBZm1sIKAtxU1/W
 UOLq0ItzKJU1F+DavhEDTMV08w4uRdSvYjWssKRtU1xdAmv8K9Ndp35VOmiixwW2hdFkMlxVIh
 5LA88TILa9Q/gZgt/CN8YPODGpRoY4kJZjQ/zvaLgPgyQP1hKx5Wb66sjNU5THzLhRf9hP8O1p
 iUtJxKTZWOz3fHKnwQPsvac2Z8DyghEYMoTVfy+Tc9cEvTxvqMzZzxCWf0QvGyhJiPicWzesQ3
 lgs=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43358937"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:25:37 -0800
IronPort-SDR: qrIeMB0I+Mxk+TZMP0OwHvgsWC9BFe8NmwyvH9Of5GKRrWzdl+Qa0puWnfsQ3Jy2DUCckr35LA
 V975d81pgd9tFx+sQkNDsjw6HmJEkDlK0XQ+ozM6WTzR/JxHyeWPsXzr4D/ZPnl3ZzUa5A4IwI
 6Kwkc9NFwsBB2fuDGU7YpzWTfYnE45sliBPanZSEBBsMnhIuLtHe9UY4pQBGS5ukYnNSNRHGng
 LZdo0XYVNqsgDHU0/zlcUuzRkX6+hZOT36VcuDt9FYNnAFQyrQTId42t5RKd8NzWDiRscgsDOJ
 MYU=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 25/48] Input: atmel_mxt_ts - delay enabling IRQ when not using regulators
Date:   Fri, 22 Nov 2019 17:23:39 +0900
Message-ID: <20191122082402.18173-26-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
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
index 842d407efc86..f5d67e43a786 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1451,9 +1451,24 @@ static int mxt_acquire_irq(struct mxt_data *data)
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
+
+		/* Presence of data->irq means IRQ initialised */
+		data->irq = data->client->irq;
+	} else {
+		enable_irq(data->irq);
+	}
 
-	if (data->use_retrigen_workaround) {
+	if (data->object_table && data->use_retrigen_workaround) {
 		error = mxt_process_messages_until_invalid(data);
 		if (error)
 			return error;
@@ -3373,7 +3388,9 @@ static int mxt_load_fw(struct device *dev)
 			goto release_firmware;
 	}
 
-	enable_irq(data->irq);
+	ret = mxt_acquire_irq(data);
+	if (ret)
+		goto release_firmware;
 
 	/* Poll after 0.1s if no interrupt received */
 	schedule_delayed_work(&data->flash->work, msecs_to_jiffies(100));
@@ -3800,7 +3817,6 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		 client->adapter->nr, client->addr);
 
 	data->client = client;
-	data->irq = client->irq;
 	i2c_set_clientdata(client, data);
 
 	init_completion(&data->chg_completion);
@@ -3828,26 +3844,22 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
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

