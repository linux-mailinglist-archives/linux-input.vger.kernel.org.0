Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA8C1302A33
	for <lists+linux-input@lfdr.de>; Mon, 25 Jan 2021 19:29:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbhAYS1v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Jan 2021 13:27:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbhAYS0L (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jan 2021 13:26:11 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F70C0613ED
        for <linux-input@vger.kernel.org>; Mon, 25 Jan 2021 10:25:31 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1l46YL-00041I-2u; Mon, 25 Jan 2021 19:25:29 +0100
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: [PATCH v3 2/5] Input: exc3000 - factor out vendor data request
Date:   Mon, 25 Jan 2021 19:25:24 +0100
Message-Id: <20210125182527.1225245-3-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210125182527.1225245-1-l.stach@pengutronix.de>
References: <20210125182527.1225245-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Factor out the vendor data i2c request handling to make it reusable
for other functions. Also don't cache the model and firmware version
string in the device private data as we never use the cached version,
but always read from the device.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 drivers/input/touchscreen/exc3000.c | 122 ++++++++++++----------------
 1 file changed, 54 insertions(+), 68 deletions(-)

diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index c3fc78185793..b008adc1031d 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -25,6 +25,7 @@
 #define EXC3000_NUM_SLOTS		10
 #define EXC3000_SLOTS_PER_FRAME		5
 #define EXC3000_LEN_FRAME		66
+#define EXC3000_LEN_VENDOR_REQUEST	68
 #define EXC3000_LEN_POINT		10
 
 #define EXC3000_LEN_MODEL_NAME		16
@@ -77,9 +78,6 @@ struct exc3000_data {
 	u8 buf[2 * EXC3000_LEN_FRAME];
 	struct completion wait_event;
 	struct mutex query_lock;
-	int query_result;
-	char model[EXC3000_LEN_MODEL_NAME];
-	char fw_version[EXC3000_LEN_FW_VERSION];
 };
 
 static void exc3000_report_slots(struct input_dev *input,
@@ -185,23 +183,6 @@ static int exc3000_handle_mt_event(struct exc3000_data *data)
 	return ret;
 }
 
-static int exc3000_query_interrupt(struct exc3000_data *data)
-{
-	u8 *buf = data->buf;
-
-	if (buf[0] != 'B')
-		return -EPROTO;
-
-	if (buf[4] == 'E')
-		strlcpy(data->model, buf + 5, sizeof(data->model));
-	else if (buf[4] == 'D')
-		strlcpy(data->fw_version, buf + 5, sizeof(data->fw_version));
-	else
-		return -EPROTO;
-
-	return 0;
-}
-
 static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
 {
 	struct exc3000_data *data = dev_id;
@@ -217,7 +198,6 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
 
 	switch (buf[2]) {
 		case EXC3000_VENDOR_EVENT:
-			data->query_result = exc3000_query_interrupt(data);
 			complete(&data->wait_event);
 			break;
 		case EXC3000_MT1_EVENT:
@@ -232,73 +212,75 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static ssize_t fw_version_show(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+static int exc3000_vendor_data_request(struct exc3000_data *data, u8 *request,
+				       u8 request_len, u8 *response, int timeout)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct exc3000_data *data = i2c_get_clientdata(client);
-	static const u8 request[68] = {
-		0x67, 0x00, 0x42, 0x00, 0x03, 0x01, 'D', 0x00
-	};
-	int error;
+	u8 buf[EXC3000_LEN_VENDOR_REQUEST] = { 0x67, 0x00, 0x42, 0x00, 0x03 };
+	int ret;
 
 	mutex_lock(&data->query_lock);
 
-	data->query_result = -ETIMEDOUT;
 	reinit_completion(&data->wait_event);
 
-	error = i2c_master_send(client, request, sizeof(request));
-	if (error < 0) {
-		mutex_unlock(&data->query_lock);
-		return error;
+	buf[5] = request_len;
+	memcpy(&buf[6], request, request_len);
+
+	ret = i2c_master_send(data->client, buf, EXC3000_LEN_VENDOR_REQUEST);
+	if (ret < 0)
+		goto out_unlock;
+
+	if (response) {
+		ret = wait_for_completion_timeout(&data->wait_event,
+						  timeout * HZ);
+		if (ret <= 0) {
+			ret = -ETIMEDOUT;
+			goto out_unlock;
+		}
+
+		if (data->buf[3] >= EXC3000_LEN_FRAME) {
+			ret = -ENOSPC;
+			goto out_unlock;
+		}
+
+		memcpy(response, &data->buf[4], data->buf[3]);
+		ret = data->buf[3];
 	}
 
-	wait_for_completion_interruptible_timeout(&data->wait_event, 1 * HZ);
+out_unlock:
 	mutex_unlock(&data->query_lock);
 
-	if (data->query_result < 0)
-		return data->query_result;
-
-	return sprintf(buf, "%s\n", data->fw_version);
+	return ret;
 }
-static DEVICE_ATTR_RO(fw_version);
 
-static ssize_t exc3000_get_model(struct exc3000_data *data)
+static ssize_t fw_version_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
-	static const u8 request[68] = {
-		0x67, 0x00, 0x42, 0x00, 0x03, 0x01, 'E', 0x00
-	};
-	struct i2c_client *client = data->client;
-	int error;
-
-	mutex_lock(&data->query_lock);
-	data->query_result = -ETIMEDOUT;
-	reinit_completion(&data->wait_event);
-
-	error = i2c_master_send(client, request, sizeof(request));
-	if (error < 0) {
-		mutex_unlock(&data->query_lock);
-		return error;
-	}
+	struct i2c_client *client = to_i2c_client(dev);
+	struct exc3000_data *data = i2c_get_clientdata(client);
+	u8 response[EXC3000_LEN_FRAME];
+	int ret;
 
-	wait_for_completion_interruptible_timeout(&data->wait_event, 1 * HZ);
-	mutex_unlock(&data->query_lock);
+	ret = exc3000_vendor_data_request(data, (u8[]){'D'}, 1, response, 1);
+	if (ret < 0)
+		return ret;
 
-	return data->query_result;
+	return sprintf(buf, "%s\n", &response[1]);
 }
+static DEVICE_ATTR_RO(fw_version);
 
 static ssize_t model_show(struct device *dev,
 			  struct device_attribute *attr, char *buf)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct exc3000_data *data = i2c_get_clientdata(client);
-	int error;
+	u8 response[EXC3000_LEN_FRAME];
+	int ret;
 
-	error = exc3000_get_model(data);
-	if (error < 0)
-		return error;
+	ret = exc3000_vendor_data_request(data, (u8[]){'E'}, 1, response, 1);
+	if (ret < 0)
+		return ret;
 
-	return sprintf(buf, "%s\n", data->model);
+	return sprintf(buf, "%s\n", &response[1]);
 }
 static DEVICE_ATTR_RO(model);
 
@@ -384,9 +366,15 @@ static int exc3000_probe(struct i2c_client *client)
 	 * or two touch events anyways).
 	 */
 	for (retry = 0; retry < 3; retry++) {
-		error = exc3000_get_model(data);
-		if (!error)
+		u8 response[EXC3000_LEN_FRAME];
+
+		error = exc3000_vendor_data_request(data, (u8[]){'E'}, 1,
+						    response, 1);
+		if (error > 0) {
+			dev_dbg(&client->dev, "TS Model: %s", &response[1]);
+			error = 0;
 			break;
+		}
 		dev_warn(&client->dev, "Retry %d get EETI EXC3000 model: %d\n",
 			 retry + 1, error);
 	}
@@ -394,8 +382,6 @@ static int exc3000_probe(struct i2c_client *client)
 	if (error)
 		return error;
 
-	dev_dbg(&client->dev, "TS Model: %s", data->model);
-
 	i2c_set_clientdata(client, data);
 
 	error = devm_device_add_group(&client->dev, &exc3000_attribute_group);
-- 
2.20.1

