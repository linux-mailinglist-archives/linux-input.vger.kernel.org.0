Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62AA5B4AE4
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728718AbfIQJkU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:40:20 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:20545 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727534AbfIQJkU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:40:20 -0400
IronPort-SDR: Ekppn3Ko7y0Kqrzl3fNcHN/RpWG2fAkT33rMW6rbj+4zuUvY6oFBJM6bbmLei08UR4pBlPwqCl
 0KgMHEtfkvaBT0pCj7GjvbhgmtUFH40etKnnsNkgK6xHDTbWmt8MEGm4C51y+7RXyygHZixDgV
 cdWesKTHmAIzwjn/0R7MwGNVa/KWJjh2c+GAcB648v882CSwkqhz+HKOIe1X3MmTmxtotx7roW
 E0Tg+yESrjRI3rqSibWvIVO6b8EXOVIjKaRKZ/pyYjagPe4ilBHw2Hv40oPxG8VCv6WKrzFCfi
 5ow=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41416536"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:40:00 -0800
IronPort-SDR: NxQL+RykyzPw+QJPCKBXk1uLYhYC40gcDKfTFHNtO9QEU8lOWiMyIZqW3ilGaHMY7kSTkm+2Sa
 FqiItPs6pBmbaNFSgV2LqM8Wl2sTOsPcbvBRk5gT7a8dBPEgGoPgnRLeXISA3hOUIO22gnjGGq
 uIHGi9cWNH1WlqESalhWeFnjYn48QuGnyG9hE41p+ZgZqzd6r4ZzSvkQQxyJgb3XH/E6q8S4t+
 3uY0diyeZraPYxJGbJ+EVBjASNqtwadnUmRY1GwatmvGRrzPONWX1qh2JL5JQ4SegY30QHe06/
 Q0Y=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 26/49] Input: atmel_mxt_ts - delay enabling IRQ when not using regulators
Date:   Tue, 17 Sep 2019 18:38:52 +0900
Message-ID: <20190917093915.18645-7-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190917093915.18645-1-jiada_wang@mentor.com>
References: <20190917093915.18645-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) To
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
index 49d06eb0c6ee..0ff144529eda 100644
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
@@ -3801,7 +3818,6 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		 client->adapter->nr, client->addr);
 
 	data->client = client;
-	data->irq = client->irq;
 	i2c_set_clientdata(client, data);
 
 	init_completion(&data->chg_completion);
@@ -3829,26 +3845,22 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
2.19.2

