Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91FAA199421
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730815AbgCaKwy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:52:54 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43597 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730810AbgCaKwy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:52:54 -0400
IronPort-SDR: uwjge014RS0QTx2uGcl9vbYp7rBHGc1iaHwtGpkGe1BQxkrEFw1I5bD13cNnG3Jd7MWIIkeYW5
 pOjMTbDxrvbpEGW6pFe0MPatN2GBnz41n308TNbiRprrAtgYYTshDlnFj7N85iYrew2LulQOUn
 1vHArfVdHlu4adeeGMnDIM+gFWccyslAvKuvr99sdsjyD0fAOKJMn+P3QNJhn1c+gmzitPycjf
 7UPSjqlxM7ylKSqRej8cFQQKZI1KiOtEg2HInXn85rn5KI7C7t0C7ZcFb0ovo4dQCekXVSwFdO
 UQQ=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330799"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:52:53 -0800
IronPort-SDR: ohzFJPOinnaU7WizE5qg1+J0hl4ebvquRRFMAyhS2hSfZkfKe/PdUCVMKpYuzDKsgSKhVHwYnq
 6r6UGTmWluHF1lqsFEa7T9bbpJLXL0VdBzMemVphSeajtXywyWaWbhUwv3Cu/nXcDbf009Bf5F
 L5poNBhHV3PgxpEbJcEHH2W8Sb1c7mCYgIEFCXLG9kFlmMaf/+ckZLS3hhhrpYUYOGN5AluzKV
 MwM3Ezgqibf9jeTmCvKtImYCTIs9yONDHYrlUoRUy5EWqlXE3Il1FQHwFSm8k8CmNe2xLCKlqK
 Msc=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 31/55] Input: atmel_mxt_ts - delay enabling IRQ when not using regulators
Date:   Tue, 31 Mar 2020 03:50:27 -0700
Message-ID: <20200331105051.58896-32-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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
index 62f11afb26ae..c26470bcb38b 100644
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
@@ -3798,7 +3815,6 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		 client->adapter->nr, client->addr);
 
 	data->client = client;
-	data->irq = client->irq;
 	i2c_set_clientdata(client, data);
 
 	init_completion(&data->chg_completion);
@@ -3826,26 +3842,22 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
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

