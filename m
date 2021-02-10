Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DF16316CF0
	for <lists+linux-input@lfdr.de>; Wed, 10 Feb 2021 18:38:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232500AbhBJRhT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Feb 2021 12:37:19 -0500
Received: from msg-1.mailo.com ([213.182.54.11]:35640 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232975AbhBJRft (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Feb 2021 12:35:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1612978468; bh=hwwNb5pHGySLsYtfoSI6tWuUZtlnwEsyOk44vuG5Y8o=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=Kw6yKzWjeIb/ggkmosQ1KEWppJJ4nyvufK5JQwAoPO32P03rs+b1WEATX1pX34exR
         AUDjn2DgivdT6MAp3g48Dg24H0i1rSUTndQ4B1jojE4bP8R8C+9mqkoJJU9TpCvMWE
         LJXatAJSzCkz8my67x4dQ1Te6VK14Oj7vyoFTMp0=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Wed, 10 Feb 2021 18:34:27 +0100 (CET)
X-EA-Auth: Vhf3gTQNdNTvxCY3jW16AxHk3RXqxLQWWaTHN6IYTBXnK1DvTBm0aNoWi8RXlDmK4EIf5bkHvgD43k1OBqgRdvhpoWHpo6rtF9XNEyn66Hk=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v4 2/2] Input: add MStar MSG2638 touchscreen driver
Date:   Wed, 10 Feb 2021 18:33:52 +0100
Message-Id: <20210210173403.667482-2-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210173403.667482-1-vincent.knecht@mailoo.org>
References: <20210210173403.667482-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for the msg2638 touchscreen IC from MStar.
This driver reuses zinitix.c structure, while the checksum and irq handler
functions are based on out-of-tree driver for Alcatel Idol 3 (4.7").

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
Changed in v4:
- rename from msg26xx to msg2638, following compatible string change
- rename mstar_* functions to msg2638_* for consistency
- add RESET_DELAY define and use it in msg2638_power_on()
- change a few dev_err() calls to be on one line only
- add missing \n in a few dev_err() strings
Changed in v3:
- no change
Changed in v2:
- don't use bitfields in packet struct, to prevent endian-ness related problems (Dmitry)
- fix reset gpiod calls order in mstar_power_on() (Dmitry)
---
 drivers/input/touchscreen/Kconfig   |  12 +
 drivers/input/touchscreen/Makefile  |   1 +
 drivers/input/touchscreen/msg2638.c | 362 ++++++++++++++++++++++++++++
 3 files changed, 375 insertions(+)
 create mode 100644 drivers/input/touchscreen/msg2638.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index f012fe746df0..fefbe1c1bb10 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -1334,4 +1334,16 @@ config TOUCHSCREEN_ZINITIX
 	  To compile this driver as a module, choose M here: the
 	  module will be called zinitix.
 
+config TOUCHSCREEN_MSG2638
+	tristate "MStar msg2638 touchscreen support"
+	depends on I2C
+	depends on GPIOLIB || COMPILE_TEST
+	help
+	  Say Y here if you have an I2C touchscreen using MStar msg2638.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called msg2638.
+
 endif
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 6233541e9173..83e516cb3d33 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -112,3 +112,4 @@ obj-$(CONFIG_TOUCHSCREEN_ROHM_BU21023)	+= rohm_bu21023.o
 obj-$(CONFIG_TOUCHSCREEN_RASPBERRYPI_FW)	+= raspberrypi-ts.o
 obj-$(CONFIG_TOUCHSCREEN_IQS5XX)	+= iqs5xx.o
 obj-$(CONFIG_TOUCHSCREEN_ZINITIX)	+= zinitix.o
+obj-$(CONFIG_TOUCHSCREEN_MSG2638)	+= msg2638.o
diff --git a/drivers/input/touchscreen/msg2638.c b/drivers/input/touchscreen/msg2638.c
new file mode 100644
index 000000000000..e00cff923fe2
--- /dev/null
+++ b/drivers/input/touchscreen/msg2638.c
@@ -0,0 +1,362 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for MStar msg2638 touchscreens
+ *
+ * Copyright (c) 2021 Vincent Knecht <vincent.knecht@mailoo.org>
+ *
+ * Checksum and IRQ handler based on mstar_drv_common.c and mstar_drv_mutual_fw_control.c
+ * Copyright (c) 2006-2012 MStar Semiconductor, Inc.
+ *
+ * Driver structure based on zinitix.c by Michael Srba <Michael.Srba@seznam.cz>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+#define MODE_DATA_RAW			0x5A
+
+#define TPD_WIDTH			2048
+#define TPD_HEIGHT			2048
+
+#define MAX_SUPPORTED_FINGER_NUM	5
+
+#define CHIP_ON_DELAY			15 // ms
+#define FIRMWARE_ON_DELAY		50 // ms
+#define RESET_DELAY			10 // ms
+
+struct point_coord {
+	u16	x;
+	u16	y;
+};
+
+struct packet {
+	u8	xy_hi; /* higher bits of x and y coordinates */
+	u8	x_low;
+	u8	y_low;
+	u8	pressure;
+};
+
+struct touch_event {
+	u8	mode;
+	struct	packet pkt[MAX_SUPPORTED_FINGER_NUM];
+	u8	proximity;
+	u8	checksum;
+};
+
+struct msg2638_ts_data {
+	struct i2c_client *client;
+	struct input_dev *input_dev;
+	struct touchscreen_properties prop;
+	struct regulator_bulk_data supplies[2];
+	struct gpio_desc *reset_gpiod;
+};
+
+static int msg2638_init_regulators(struct msg2638_ts_data *msg2638)
+{
+	struct i2c_client *client = msg2638->client;
+	int error;
+
+	msg2638->supplies[0].supply = "vdd";
+	msg2638->supplies[1].supply = "vddio";
+	error = devm_regulator_bulk_get(&client->dev,
+					ARRAY_SIZE(msg2638->supplies),
+					msg2638->supplies);
+	if (error < 0) {
+		dev_err(&client->dev, "Failed to get regulators: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static void msg2638_power_on(struct msg2638_ts_data *msg2638)
+{
+	gpiod_set_value(msg2638->reset_gpiod, 1);
+	mdelay(RESET_DELAY);
+	gpiod_set_value(msg2638->reset_gpiod, 0);
+	mdelay(FIRMWARE_ON_DELAY);
+
+	enable_irq(msg2638->client->irq);
+}
+
+static void msg2638_report_finger(struct msg2638_ts_data *msg2638, int slot,
+				const struct point_coord *pc)
+{
+	input_mt_slot(msg2638->input_dev, slot);
+	input_mt_report_slot_state(msg2638->input_dev, MT_TOOL_FINGER, true);
+	touchscreen_report_pos(msg2638->input_dev, &msg2638->prop, pc->x, pc->y, true);
+	input_report_abs(msg2638->input_dev, ABS_MT_TOUCH_MAJOR, 1);
+}
+
+static u8 msg2638_checksum(u8 *data, u32 length)
+{
+	s32 sum = 0;
+	u32 i;
+
+	for (i = 0; i < length; i++)
+		sum += data[i];
+
+	return (u8)((-sum) & 0xFF);
+}
+
+static irqreturn_t msg2638_ts_irq_handler(int irq, void *msg2638_handler)
+{
+	struct msg2638_ts_data *msg2638 = msg2638_handler;
+	struct i2c_client *client = msg2638->client;
+	struct touch_event touch_event;
+	struct point_coord coord;
+	struct i2c_msg msg[1];
+	struct packet *p;
+	u32 len;
+	int ret;
+	int i;
+
+	len = sizeof(struct touch_event);
+	memset(&touch_event, 0, len);
+
+	msg[0].addr = client->addr;
+	msg[0].flags = I2C_M_RD;
+	msg[0].len = len;
+	msg[0].buf = (u8 *)&touch_event;
+
+	ret = i2c_transfer(client->adapter, msg, 1);
+	if (ret != 1) {
+		dev_err(&client->dev, "Failed I2C transfer in irq handler!\n");
+		goto out;
+	}
+
+	if (touch_event.mode != MODE_DATA_RAW)
+		goto out;
+
+	if (msg2638_checksum((u8 *)&touch_event, len - 1) != touch_event.checksum) {
+		dev_err(&client->dev, "Failed checksum!\n");
+		goto out;
+	}
+
+	for (i = 0; i < MAX_SUPPORTED_FINGER_NUM; i++) {
+		p = &touch_event.pkt[i];
+		/* Ignore non-pressed finger data */
+		if (p->xy_hi == 0xFF && p->x_low == 0xFF && p->y_low == 0xFF)
+			continue;
+
+		coord.x = (((p->xy_hi & 0xF0) << 4) | p->x_low) * msg2638->prop.max_x / TPD_WIDTH;
+		coord.y = (((p->xy_hi & 0x0F) << 8) | p->y_low) * msg2638->prop.max_y / TPD_HEIGHT;
+		msg2638_report_finger(msg2638, i, &coord);
+	}
+
+	input_mt_sync_frame(msg2638->input_dev);
+	input_sync(msg2638->input_dev);
+
+out:
+	return IRQ_HANDLED;
+}
+
+static int msg2638_start(struct msg2638_ts_data *msg2638)
+{
+	int error;
+
+	error = regulator_bulk_enable(ARRAY_SIZE(msg2638->supplies),
+				      msg2638->supplies);
+	if (error) {
+		dev_err(&msg2638->client->dev, "Failed to enable regulators: %d\n", error);
+		return error;
+	}
+
+	msleep(CHIP_ON_DELAY);
+
+	msg2638_power_on(msg2638);
+
+	return 0;
+}
+
+static int msg2638_stop(struct msg2638_ts_data *msg2638)
+{
+	int error;
+
+	disable_irq(msg2638->client->irq);
+
+	error = regulator_bulk_disable(ARRAY_SIZE(msg2638->supplies),
+				       msg2638->supplies);
+	if (error) {
+		dev_err(&msg2638->client->dev, "Failed to disable regulators: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int msg2638_input_open(struct input_dev *dev)
+{
+	struct msg2638_ts_data *msg2638 = input_get_drvdata(dev);
+
+	return msg2638_start(msg2638);
+}
+
+static void msg2638_input_close(struct input_dev *dev)
+{
+	struct msg2638_ts_data *msg2638 = input_get_drvdata(dev);
+
+	msg2638_stop(msg2638);
+}
+
+static int msg2638_init_input_dev(struct msg2638_ts_data *msg2638)
+{
+	struct input_dev *input_dev;
+	int error;
+
+	input_dev = devm_input_allocate_device(&msg2638->client->dev);
+	if (!input_dev) {
+		dev_err(&msg2638->client->dev, "Failed to allocate input device.\n");
+		return -ENOMEM;
+	}
+
+	input_set_drvdata(input_dev, msg2638);
+	msg2638->input_dev = input_dev;
+
+	input_dev->name = "MStar TouchScreen";
+	input_dev->phys = "input/ts";
+	input_dev->id.bustype = BUS_I2C;
+	input_dev->open = msg2638_input_open;
+	input_dev->close = msg2638_input_close;
+
+	input_set_capability(input_dev, EV_ABS, ABS_MT_POSITION_X);
+	input_set_capability(input_dev, EV_ABS, ABS_MT_POSITION_Y);
+	input_set_abs_params(input_dev, ABS_MT_WIDTH_MAJOR, 0, 15, 0, 0);
+	input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
+
+	touchscreen_parse_properties(input_dev, true, &msg2638->prop);
+	if (!msg2638->prop.max_x || !msg2638->prop.max_y) {
+		dev_err(&msg2638->client->dev,
+			"touchscreen-size-x and/or touchscreen-size-y not set in dts\n");
+		return -EINVAL;
+	}
+
+	error = input_mt_init_slots(input_dev, MAX_SUPPORTED_FINGER_NUM,
+				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+	if (error) {
+		dev_err(&msg2638->client->dev, "Failed to initialize MT slots: %d\n", error);
+		return error;
+	}
+
+	error = input_register_device(input_dev);
+	if (error) {
+		dev_err(&msg2638->client->dev, "Failed to register input device: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int msg2638_ts_probe(struct i2c_client *client)
+{
+	struct msg2638_ts_data *msg2638;
+	int error;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_err(&client->dev, "Failed to assert adapter's support for plain I2C.\n");
+		return -ENXIO;
+	}
+
+	msg2638 = devm_kzalloc(&client->dev, sizeof(*msg2638), GFP_KERNEL);
+	if (!msg2638)
+		return -ENOMEM;
+
+	msg2638->client = client;
+	i2c_set_clientdata(client, msg2638);
+
+	error = msg2638_init_regulators(msg2638);
+	if (error) {
+		dev_err(&client->dev, "Failed to initialize regulators: %d\n", error);
+		return error;
+	}
+
+	msg2638->reset_gpiod = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(msg2638->reset_gpiod)) {
+		error = PTR_ERR(msg2638->reset_gpiod);
+		dev_err(&client->dev, "Failed to request reset GPIO: %d\n", error);
+		return error;
+	}
+
+	error = msg2638_init_input_dev(msg2638);
+	if (error) {
+		dev_err(&client->dev, "Failed to initialize input device: %d\n", error);
+		return error;
+	}
+
+	irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
+	error = devm_request_threaded_irq(&client->dev, client->irq,
+					  NULL, msg2638_ts_irq_handler,
+					  IRQF_ONESHOT, client->name, msg2638);
+	if (error) {
+		dev_err(&client->dev, "Failed to request IRQ: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused msg2638_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct msg2638_ts_data *msg2638 = i2c_get_clientdata(client);
+
+	mutex_lock(&msg2638->input_dev->mutex);
+
+	if (input_device_enabled(msg2638->input_dev))
+		msg2638_stop(msg2638);
+
+	mutex_unlock(&msg2638->input_dev->mutex);
+
+	return 0;
+}
+
+static int __maybe_unused msg2638_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct msg2638_ts_data *msg2638 = i2c_get_clientdata(client);
+	int ret = 0;
+
+	mutex_lock(&msg2638->input_dev->mutex);
+
+	if (input_device_enabled(msg2638->input_dev))
+		ret = msg2638_start(msg2638);
+
+	mutex_unlock(&msg2638->input_dev->mutex);
+
+	return ret;
+}
+
+static SIMPLE_DEV_PM_OPS(msg2638_pm_ops, msg2638_suspend, msg2638_resume);
+
+#ifdef CONFIG_OF
+static const struct of_device_id msg2638_of_match[] = {
+	{ .compatible = "mstar,msg2638" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, msg2638_of_match);
+#endif
+
+static struct i2c_driver msg2638_ts_driver = {
+	.probe_new = msg2638_ts_probe,
+	.driver = {
+		.name = "MStar-TS",
+		.pm = &msg2638_pm_ops,
+		.of_match_table = of_match_ptr(msg2638_of_match),
+	},
+};
+module_i2c_driver(msg2638_ts_driver);
+
+MODULE_AUTHOR("Vincent Knecht <vincent.knecht@mailoo.org>");
+MODULE_DESCRIPTION("MStar MSG2638 touchscreen driver");
+MODULE_LICENSE("GPL v2");
-- 
2.29.2



