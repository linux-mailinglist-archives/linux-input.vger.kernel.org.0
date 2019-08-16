Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2208FDEB
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbfHPIfP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:35:15 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:36047 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfHPIfP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:35:15 -0400
X-Greylist: delayed 324 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Aug 2019 04:35:10 EDT
IronPort-SDR: CcDxfY+FIBhnO7f0fndPlq9yEpTSoPzuYUGHC4LM+bOcBrtEmtK8DIB12yEMTuhKM09YWYV4VR
 OqFcJECVAX8FWBI7slEbX1N/mVwGTSJfnVIsoAC/cEh1Q1ytxfAXW58NTuqQR49GVdIiMNLW+N
 /scrLRhccYPCoVoDrr/cMK9r8+6/RvbtVB20btNGC+mnc30DvjG2PdZOv4kVFgu6engtRro70K
 YrDZx91R2v+qLNWxzzR7+ue5HsK6aadpe5QAG8kKcDHI9jJa3yfy6RfM2CRxWslEyQ8DfmMcYu
 sdY=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40519099"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:34:13 -0800
IronPort-SDR: LjyR9TcaEqhyqQ5Akh3Tdx+6Fv2IsU/WCbfVzPPaO9ykYanjuIbUGYIuTnx72clh8uqcKcaXfo
 staUGZOjyrEDCq7+Wjt3I/0uvRjFtd6hSWzVnOWFC0V1VogmLUhDsPX9nyOmjyNj+OPbx7qnj4
 7ua1MovZiwmqR11cSYSljHbnkG4j7Cgltz7ME4tG+UlJ+YTqvjjbUwaIm8LrB9kFjCxW0uk6Ng
 HuJASxt0wzfGHYzwhz+ZxBdS8z43UbgICXBPT+HgkvA2cWVh6X86D8sW6X2ZqGiRs1Z7ajZkU6
 ZUw=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 27/63] Input: atmel_mxt_ts - delay enabling IRQ when not using regulators
Date:   Fri, 16 Aug 2019 17:33:39 +0900
Message-ID: <20190816083415.18819-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083415.18819-1-jiada_wang@mentor.com>
References: <20190816083415.18819-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-09.mgc.mentorg.com (147.34.90.209) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
index 2bc80abcbd80..d3e1cd677aa7 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1450,9 +1450,24 @@ static int mxt_acquire_irq(struct mxt_data *data)
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
@@ -3369,7 +3384,9 @@ static int mxt_load_fw(struct device *dev)
 			goto release_firmware;
 	}
 
-	enable_irq(data->irq);
+	ret = mxt_acquire_irq(data);
+	if (ret)
+		goto release_firmware;
 
 	/* Poll after 0.1s if no interrupt received */
 	schedule_delayed_work(&data->flash->work, HZ / 10);
@@ -3769,7 +3786,6 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		 client->adapter->nr, client->addr);
 
 	data->client = client;
-	data->irq = client->irq;
 	i2c_set_clientdata(client, data);
 
 	init_completion(&data->chg_completion);
@@ -3797,26 +3813,22 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
 	error = sysfs_create_group(&client->dev.kobj, &mxt_fw_attr_group);
 	if (error) {
 		dev_err(&client->dev, "Failure %d creating fw sysfs group\n",
-- 
2.19.2

