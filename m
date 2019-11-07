Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C294F36AC
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2019 19:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbfKGSKW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Nov 2019 13:10:22 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51900 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfKGSKW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Nov 2019 13:10:22 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 4DD55290AD6
Received: by jupiter.universe (Postfix, from userid 1000)
        id 43D1B48009B; Thu,  7 Nov 2019 19:10:17 +0100 (CET)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ahmet Inan <inan@distec.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCHv1 2/2] Input: EXC3000: Add support to query model and fw_version
Date:   Thu,  7 Nov 2019 19:10:10 +0100
Message-Id: <20191107181010.17211-2-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191107181010.17211-1-sebastian.reichel@collabora.com>
References: <20191107181010.17211-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Expose model and fw_version via sysfs. Also query the model
in probe to make sure, that the I2C communication with the
device works before successfully probing the driver.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/input/touchscreen/exc3000.c | 136 ++++++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index 7d695022082c..4c9f132629b9 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -41,6 +41,11 @@ struct exc3000_data {
 	struct touchscreen_properties prop;
 	struct timer_list timer;
 	u8 buf[2 * EXC3000_LEN_FRAME];
+	char model[11];
+	char fw_version[6];
+	struct completion wait_event;
+	struct mutex query_lock;
+	int query_result;
 };
 
 static void exc3000_report_slots(struct input_dev *input,
@@ -121,6 +126,35 @@ static int exc3000_read_data(struct i2c_client *client,
 	return 0;
 }
 
+static void exc3000_query_interrupt(struct exc3000_data *data)
+{
+	u8 *buf = data->buf;
+	int err;
+
+	data->query_result = 0;
+
+	err = i2c_master_recv(data->client, buf, EXC3000_LEN_FRAME);
+	if (err < 0) {
+		data->query_result = err;
+		goto out;
+	}
+
+	if (buf[0] == 0x42 && buf[4] == 'E') {
+		memcpy(data->model, buf+5, 10);
+		data->model[10] = '\0';
+		goto out;
+	} else if (buf[0] == 0x42 && buf[4] == 'D') {
+		memcpy(data->fw_version, buf+5, 5);
+		data->fw_version[5] = '\0';
+		goto out;
+	}
+
+	data->query_result = -EPROTO;
+
+out:
+	complete(&data->wait_event);
+}
+
 static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
 {
 	struct exc3000_data *data = dev_id;
@@ -129,6 +163,11 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
 	int slots, total_slots;
 	int error;
 
+	if (mutex_is_locked(&data->query_lock)) {
+		exc3000_query_interrupt(data);
+		goto out;
+	}
+
 	error = exc3000_read_data(data->client, buf, &total_slots);
 	if (error) {
 		/* Schedule a timer to release "stuck" contacts */
@@ -156,12 +195,92 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int exc3000_get_fw_version(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct exc3000_data *data = dev_get_drvdata(dev);
+	static const u8 request[68] =
+		{0x67, 0x00, 0x42, 0x00, 0x03, 0x01, 'D', 0x00};
+	struct i2c_client *client = data->client;
+	int err;
+
+	mutex_lock(&data->query_lock);
+
+	data->query_result = -ETIMEDOUT;
+	reinit_completion(&data->wait_event);
+
+	err = i2c_master_send(client, request, sizeof(request));
+	if (err < 0) {
+		mutex_unlock(&data->query_lock);
+		return err;
+	}
+
+	wait_for_completion_interruptible_timeout(&data->wait_event, 1*HZ);
+	mutex_unlock(&data->query_lock);
+
+	if (data->query_result < 0)
+		return data->query_result;
+
+	return sprintf(buf, "%s\n", data->fw_version);
+}
+static DEVICE_ATTR(fw_version, S_IRUGO, exc3000_get_fw_version, NULL);
+
+static ssize_t exc3000_get_model(struct exc3000_data *data)
+{
+	static const u8 request[68] =
+		{0x67, 0x00, 0x42, 0x00, 0x03, 0x01, 'E', 0x00};
+	struct i2c_client *client = data->client;
+	int err;
+
+	mutex_lock(&data->query_lock);
+	data->query_result = -ETIMEDOUT;
+	reinit_completion(&data->wait_event);
+
+	err = i2c_master_send(client, request, sizeof(request));
+	if (err < 0) {
+		mutex_unlock(&data->query_lock);
+		return err;
+	}
+
+	wait_for_completion_interruptible_timeout(&data->wait_event, 1*HZ);
+	mutex_unlock(&data->query_lock);
+
+	return data->query_result;
+}
+
+static ssize_t exc3000_get_model_sysfs(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct exc3000_data *data = dev_get_drvdata(dev);
+	int err = exc3000_get_model(data);
+
+	if (err < 0)
+		return err;
+
+	return sprintf(buf, "%s\n", data->model);
+}
+static DEVICE_ATTR(model, S_IRUGO, exc3000_get_model_sysfs, NULL);
+
+static struct attribute *sysfs_attrs[] = {
+	&dev_attr_model.attr,
+	&dev_attr_fw_version.attr,
+	NULL
+};
+
+static struct attribute_group exc3000_attribute_group = {
+	.attrs = sysfs_attrs
+};
+
+static const struct attribute_group *exc3000_attribute_groups[] = {
+	&exc3000_attribute_group,
+	NULL
+};
+
 static int exc3000_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
 	struct exc3000_data *data;
 	struct input_dev *input;
 	int error;
+	int retry;
 
 	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -170,15 +289,19 @@ static int exc3000_probe(struct i2c_client *client,
 	data->client = client;
 	data->type = id->driver_data;
 	timer_setup(&data->timer, exc3000_timer, 0);
+	init_completion(&data->wait_event);
+	mutex_init(&data->query_lock);
 
 	input = devm_input_allocate_device(&client->dev);
 	if (!input)
 		return -ENOMEM;
 
 	data->input = input;
+	input_set_drvdata(input, data);
 
 	input->name = "EETI EXC3000 Touch Screen";
 	input->id.bustype = BUS_I2C;
+	input->dev.groups = exc3000_attribute_groups;
 
 	if (data->type == EETI_EXC80Hxx) {
 		input_set_abs_params(input, ABS_MT_POSITION_X, 0, 16383, 0, 0);
@@ -204,6 +327,19 @@ static int exc3000_probe(struct i2c_client *client,
 	if (error)
 		return error;
 
+	for (retry = 0; retry < 3; ++retry) {
+		error = exc3000_get_model(data);
+		if (!error) {
+			break;
+		}
+		dev_warn(&client->dev, "Retry %d get EETI EXC3000 model: %d\n", retry + 1, error);
+	}
+
+	if (error)
+		return error;
+
+	dev_dbg(&client->dev, "TS Model: %s", data->model);
+
 	return 0;
 }
 
-- 
2.24.0.rc1

