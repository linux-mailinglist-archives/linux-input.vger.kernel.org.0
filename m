Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C3E23D2AC
	for <lists+linux-input@lfdr.de>; Wed,  5 Aug 2020 22:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729872AbgHEUOo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Aug 2020 16:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbgHEQXZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Aug 2020 12:23:25 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B03C0C001FDA;
        Wed,  5 Aug 2020 09:10:29 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 7C7E3299005
Received: by jupiter.universe (Postfix, from userid 1000)
        id 437F548011C; Wed,  5 Aug 2020 18:05:21 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCHv4 4/4] Input: EXC3000: Add support to query model and fw_version
Date:   Wed,  5 Aug 2020 18:05:20 +0200
Message-Id: <20200805160520.456570-5-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200805160520.456570-1-sebastian.reichel@collabora.com>
References: <20200805160520.456570-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Expose model and fw_version via sysfs. Also query the model
in probe to make sure, that the I2C communication with the
device works before successfully probing the driver.

This is a bit complicated, since EETI devices do not have
a sync interface. Sending the commands and directly reading
does not work. Sending the command and waiting for some time
is also not an option, since there might be touch events in
the mean time.

Last but not least we do not cache the results, since this
interface can be used to check the I2C communication is still
working as expected.

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../ABI/testing/sysfs-driver-input-exc3000    |  15 ++
 drivers/input/touchscreen/exc3000.c           | 154 +++++++++++++++++-
 2 files changed, 168 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-input-exc3000

diff --git a/Documentation/ABI/testing/sysfs-driver-input-exc3000 b/Documentation/ABI/testing/sysfs-driver-input-exc3000
new file mode 100644
index 000000000000..3d316d54f81c
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-driver-input-exc3000
@@ -0,0 +1,15 @@
+What:		/sys/bus/i2c/devices/xxx/fw_version
+Date:		Aug 2020
+Contact:	linux-input@vger.kernel.org
+Description:    Reports the firmware version provided by the touchscreen, for example "00_T6" on a EXC80H60
+
+		Access: Read
+		Valid values: Represented as string
+
+What:		/sys/bus/i2c/devices/xxx/model
+Date:		Aug 2020
+Contact:	linux-input@vger.kernel.org
+Description:    Reports the model identification provided by the touchscreen, for example "Orion_1320" on a EXC80H60
+
+		Access: Read
+		Valid values: Represented as string
diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
index 203f50acaab7..2e5fdbc9878a 100644
--- a/drivers/input/touchscreen/exc3000.c
+++ b/drivers/input/touchscreen/exc3000.c
@@ -27,6 +27,9 @@
 #define EXC3000_LEN_FRAME		66
 #define EXC3000_LEN_POINT		10
 
+#define EXC3000_LEN_MODEL_NAME		16
+#define EXC3000_LEN_FW_VERSION		16
+
 #define EXC3000_MT1_EVENT		0x06
 #define EXC3000_MT2_EVENT		0x18
 
@@ -71,6 +74,11 @@ struct exc3000_data {
 	struct gpio_desc *reset;
 	struct timer_list timer;
 	u8 buf[2 * EXC3000_LEN_FRAME];
+	struct completion wait_event;
+	struct mutex query_lock;
+	int query_result;
+	char model[EXC3000_LEN_MODEL_NAME];
+	char fw_version[EXC3000_LEN_FW_VERSION];
 };
 
 static void exc3000_report_slots(struct input_dev *input,
@@ -156,6 +164,28 @@ static int exc3000_read_data(struct exc3000_data *data,
 	return 0;
 }
 
+static int exc3000_query_interrupt(struct exc3000_data *data)
+{
+	u8 *buf = data->buf;
+	int err;
+
+	err = i2c_master_recv(data->client, buf, EXC3000_LEN_FRAME);
+	if (err < 0)
+		return err;
+
+	if (buf[0] != 0x42)
+		return -EPROTO;
+
+	if (buf[4] == 'E')
+		strlcpy(data->model, buf+5, sizeof(data->model));
+	else if (buf[4] == 'D')
+		strlcpy(data->fw_version, buf+5, sizeof(data->fw_version));
+	else
+		return -EPROTO;
+
+	return 0;
+}
+
 static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
 {
 	struct exc3000_data *data = dev_id;
@@ -164,6 +194,12 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
 	int slots, total_slots;
 	int error;
 
+	if (mutex_is_locked(&data->query_lock)) {
+		data->query_result = exc3000_query_interrupt(data);
+		complete(&data->wait_event);
+		goto out;
+	}
+
 	error = exc3000_read_data(data, buf, &total_slots);
 	if (error) {
 		/* Schedule a timer to release "stuck" contacts */
@@ -191,11 +227,95 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static ssize_t fw_version_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct exc3000_data *data = dev_get_drvdata(dev);
+	static const u8 request[68] = {
+		0x67, 0x00, 0x42, 0x00, 0x03, 0x01, 'D', 0x00
+	};
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
+static DEVICE_ATTR_RO(fw_version);
+
+static ssize_t exc3000_get_model(struct exc3000_data *data)
+{
+	static const u8 request[68] = {
+		0x67, 0x00, 0x42, 0x00, 0x03, 0x01, 'E', 0x00
+	};
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
+	wait_for_completion_interruptible_timeout(&data->wait_event, 1 * HZ);
+	mutex_unlock(&data->query_lock);
+
+	return data->query_result;
+}
+
+static ssize_t model_show(struct device *dev,
+			  struct device_attribute *attr, char *buf)
+{
+	struct exc3000_data *data = dev_get_drvdata(dev);
+	int err = exc3000_get_model(data);
+
+	if (err < 0)
+		return err;
+
+	return sprintf(buf, "%s\n", data->model);
+}
+static DEVICE_ATTR_RO(model);
+
+static struct attribute *sysfs_attrs[] = {
+	&dev_attr_fw_version.attr,
+	&dev_attr_model.attr,
+	NULL
+};
+
+static struct attribute_group exc3000_attribute_group = {
+	.attrs = sysfs_attrs
+};
+
+static void exc3000_unregister_sysfs(void *_dev)
+{
+	struct device *dev = _dev;
+	sysfs_remove_group(&dev->kobj, &exc3000_attribute_group);
+}
+
 static int exc3000_probe(struct i2c_client *client)
 {
 	struct exc3000_data *data;
 	struct input_dev *input;
-	int error, max_xy;
+	int error, max_xy, retry;
 
 	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -209,6 +329,8 @@ static int exc3000_probe(struct i2c_client *client)
 		data->info = &exc3000_info[eeti_dev_id];
 	}
 	timer_setup(&data->timer, exc3000_timer, 0);
+	init_completion(&data->wait_event);
+	mutex_init(&data->query_lock);
 
 	data->reset = devm_gpiod_get_optional(&client->dev, "reset",
 					      GPIOD_OUT_HIGH);
@@ -226,6 +348,7 @@ static int exc3000_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	data->input = input;
+	input_set_drvdata(input, data);
 
 	input->name = data->info->name;
 	input->id.bustype = BUS_I2C;
@@ -251,6 +374,35 @@ static int exc3000_probe(struct i2c_client *client)
 	if (error)
 		return error;
 
+	/*
+	 * I²C does not have built-in recovery, so retry on failure. This ensures,
+	 * that the device probe will not fail for temporary issues on the bus.
+	 * This is not needed for the sysfs calls (userspace will receive the error
+	 * code and can start another query) and cannot be done for touch events
+	 * (but that only means loosing one or two touch events anyways).
+	 */
+	for (retry = 0; retry < 3; ++retry) {
+		error = exc3000_get_model(data);
+		if (!error)
+			break;
+		dev_warn(&client->dev, "Retry %d get EETI EXC3000 model: %d\n",
+			 retry + 1, error);
+	}
+
+	if (error)
+		return error;
+
+	dev_dbg(&client->dev, "TS Model: %s", data->model);
+
+	i2c_set_clientdata(client, data);
+	error = sysfs_create_group(&client->dev.kobj, &exc3000_attribute_group);
+	if (error)
+		return error;
+
+	error = devm_add_action_or_reset(&client->dev, exc3000_unregister_sysfs, &client->dev);
+	if (error)
+		return error;
+
 	return 0;
 }
 
-- 
2.27.0

