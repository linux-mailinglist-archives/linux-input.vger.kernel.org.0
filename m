Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21C56132CD2
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2020 18:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728348AbgAGRRn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jan 2020 12:17:43 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56001 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728262AbgAGRRn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Jan 2020 12:17:43 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1iosU9-00057y-Bl; Tue, 07 Jan 2020 18:17:41 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, patchwork-lst@pengutronix.de,
        kernel@pengutronix.de, Chris Healy <cphealy@gmail.com>
Subject: [PATCH 2/4] Input: exc3000: query and show type, model and firmware revision info
Date:   Tue,  7 Jan 2020 18:17:38 +0100
Message-Id: <20200107171741.10856-2-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200107171741.10856-1-l.stach@pengutronix.de>
References: <20200107171741.10856-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It's very useful to have this information in the log, as differences in
behavior can be tied to the controller firmware.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/input/touchscreen/exc3000.c | 116 ++++++++++++++++++++++++++--
 1 file changed, 110 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index 3458d02310dd..accee4fd1b97 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -22,7 +22,9 @@
 #define EXC3000_NUM_SLOTS		10
 #define EXC3000_SLOTS_PER_FRAME		5
 #define EXC3000_LEN_FRAME		66
+#define EXC3000_LEN_VENDOR_REQUEST	68
 #define EXC3000_LEN_POINT		10
+#define EXC3000_VENDOR_EVENT		3
 #define EXC3000_MT_EVENT		6
 #define EXC3000_TIMEOUT_MS		100
 
@@ -32,6 +34,9 @@ struct exc3000_data {
 	struct touchscreen_properties prop;
 	struct timer_list timer;
 	u8 buf[2 * EXC3000_LEN_FRAME];
+	struct mutex vendor_data_lock;
+	struct completion vendor_data_done;
+	char *type, *model, *fw_rev;
 };
 
 static void exc3000_report_slots(struct input_dev *input,
@@ -136,6 +141,13 @@ static int exc3000_handle_mt_event(struct exc3000_data *data)
 	return ret;
 }
 
+static int exc3000_handle_vendor_event(struct exc3000_data *data)
+{
+	complete(&data->vendor_data_done);
+
+	return 0;
+}
+
 static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
 {
 	struct exc3000_data *data = dev_id;
@@ -153,6 +165,9 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
 		case EXC3000_MT_EVENT:
 			exc3000_handle_mt_event(data);
 			break;
+		case EXC3000_VENDOR_EVENT:
+			exc3000_handle_vendor_event(data);
+			break;
 		default:
 			break;
 	}
@@ -161,6 +176,89 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int exc3000_vendor_data_request(struct exc3000_data *data, u8 *request,
+				       u8 request_len, u8 *response)
+{
+	u8 buf[EXC3000_LEN_VENDOR_REQUEST] = { 0x67, 0x00, 0x42, 0x00, 0x03 };
+	int ret;
+
+	mutex_lock(&data->vendor_data_lock);
+
+	reinit_completion(&data->vendor_data_done);
+
+	buf[5] = request_len;
+	memcpy(&buf[6], request, request_len);
+
+	ret = i2c_master_send(data->client, buf, EXC3000_LEN_VENDOR_REQUEST);
+	if (ret < 0)
+		goto out_unlock;
+
+	if (response) {
+		wait_for_completion(&data->vendor_data_done);
+		memcpy(response, &data->buf[4], data->buf[3]);
+		ret = data->buf[3];
+	}
+
+out_unlock:
+	mutex_unlock(&data->vendor_data_lock);
+
+	return ret;
+}
+static int exc3000_populate_device_info(struct exc3000_data *data)
+{
+	struct device *dev = &data->client->dev;
+	u8 response[EXC3000_LEN_FRAME];
+	int ret;
+
+	/* query type info */
+	ret = exc3000_vendor_data_request(data, (u8[]){0x46}, 1, response);
+	if (ret < 0)
+		return -ENODEV;
+
+	data->type = devm_kmemdup(dev, &response[1], ret - 1, GFP_KERNEL);
+
+	/* query model info */
+	ret = exc3000_vendor_data_request(data, (u8[]){0x45}, 1, response);
+	if (ret < 0)
+		return -ENODEV;
+
+	data->model = devm_kmemdup(dev, &response[1], ret - 1, GFP_KERNEL);
+
+	/* query bootloader info */
+	ret = exc3000_vendor_data_request(data,
+					  (u8[]){0x39, 0x02}, 2, response);
+	if (ret < 0)
+		return -ENODEV;
+
+	/*
+	 * If the bootloader version is non-zero then the device is in
+	 * bootloader mode and won't answer a query for the application FW
+	 * version, so we just use the bootloader version info.
+	 */
+	if (response[2] || response[3]) {
+		char bl_version[8];
+
+		snprintf(bl_version, 8, "%d.%d", response[2], response[3]);
+		data->fw_rev = devm_kmemdup(dev, bl_version,
+					    strlen(bl_version), GFP_KERNEL);
+	} else {
+		/* query application firmware version */
+		ret = exc3000_vendor_data_request(data,
+						  (u8[]){0x44}, 1, response);
+		if (ret < 0)
+			return -ENODEV;
+
+		data->fw_rev = devm_kmemdup(dev, &response[1],
+					    ret - 1, GFP_KERNEL);
+	}
+
+	dev_info(&data->client->dev,
+		 "found type %s, model %s, firmware revision %s",
+		 data->type, data->model, data->fw_rev);
+
+	return 0;
+}
+
 static int exc3000_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -174,6 +272,18 @@ static int exc3000_probe(struct i2c_client *client,
 
 	data->client = client;
 	timer_setup(&data->timer, exc3000_timer, 0);
+	mutex_init(&data->vendor_data_lock);
+	init_completion(&data->vendor_data_done);
+
+	error = devm_request_threaded_irq(&client->dev, client->irq,
+					  NULL, exc3000_interrupt, IRQF_ONESHOT,
+					  client->name, data);
+	if (error)
+		return error;
+
+	error = exc3000_populate_device_info(data);
+	if (error)
+		return error;
 
 	input = devm_input_allocate_device(&client->dev);
 	if (!input)
@@ -197,12 +307,6 @@ static int exc3000_probe(struct i2c_client *client,
 	if (error)
 		return error;
 
-	error = devm_request_threaded_irq(&client->dev, client->irq,
-					  NULL, exc3000_interrupt, IRQF_ONESHOT,
-					  client->name, data);
-	if (error)
-		return error;
-
 	return 0;
 }
 
-- 
2.20.1

