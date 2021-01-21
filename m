Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3612FE91A
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 12:44:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728743AbhAULnx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 06:43:53 -0500
Received: from msg-1.mailo.com ([213.182.54.11]:39168 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730703AbhAULk4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 06:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1611229174; bh=aXsqRcHMbGjYj9Aaywi8Gtiq0MXG1Y2exm6T6ZJlpqI=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding;
        b=Y0m380B/3AhQ1po1fYIa1WAL4lj4xv8L3w4aNwYqYuh3Y6HOFFSZD9cx+qLJ05Omw
         qnZypbWrzOJ414Mzv0sF+KdfPzUGTzsZxMFG17h7STU8Cg7xFEYa98Ewz2FNMH2Xz6
         bT0OUEvbfOQBxtXzRhtvI2HVZiTr4dkHOf8mYbko=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Thu, 21 Jan 2021 12:39:34 +0100 (CET)
X-EA-Auth: Pqe0KFyK/sQxQNelU3TO8vG04bVal9oed1JqNVWLScpQr7jc69dracXraBnCpVL3g/P1DK/jJj3HBqvHhFyiwgYBNv3LwvR6CNtaEaCLWZw=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Vincent Knecht <vincent.knecht@mailoo.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 2/2] Input: add MStar msg26xx touchscreen driver
Date:   Thu, 21 Jan 2021 12:38:53 +0100
Message-Id: <20210121113904.1272852-2-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121113904.1272852-1-vincent.knecht@mailoo.org>
References: <20210121113904.1272852-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for the msg26xx touchscreen IC from MStar.
This driver reuses zinitix.c structure, while the checksum and irq handler
functions are based on out-of-tree driver for Alcatel Idol 3 (4.7").

Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
Changed in v2:
- don't use bitfields in packet struct, to prevent endian-ness related problems (Dmitry)
- fix reset gpiod calls order in mstar_power_on() (Dmitry)
---
 drivers/input/touchscreen/Kconfig   |  12 +
 drivers/input/touchscreen/Makefile  |   1 +
 drivers/input/touchscreen/msg26xx.c | 369 ++++++++++++++++++++++++++++
 3 files changed, 382 insertions(+)
 create mode 100644 drivers/input/touchscreen/msg26xx.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index f012fe746df0..bc4f604b4841 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -1334,4 +1334,16 @@ config TOUCHSCREEN_ZINITIX
 	  To compile this driver as a module, choose M here: the
 	  module will be called zinitix.
 
+config TOUCHSCREEN_MSG26XX
+	tristate "MStar msg26xx touchscreen support"
+	depends on I2C
+	depends on GPIOLIB || COMPILE_TEST
+	help
+	  Say Y here if you have an I2C touchscreen using MStar msg26xx.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called msg26xx.
+
 endif
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 6233541e9173..830ebf4973cb 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -112,3 +112,4 @@ obj-$(CONFIG_TOUCHSCREEN_ROHM_BU21023)	+= rohm_bu21023.o
 obj-$(CONFIG_TOUCHSCREEN_RASPBERRYPI_FW)	+= raspberrypi-ts.o
 obj-$(CONFIG_TOUCHSCREEN_IQS5XX)	+= iqs5xx.o
 obj-$(CONFIG_TOUCHSCREEN_ZINITIX)	+= zinitix.o
+obj-$(CONFIG_TOUCHSCREEN_MSG26XX)	+= msg26xx.o
diff --git a/drivers/input/touchscreen/msg26xx.c b/drivers/input/touchscreen/msg26xx.c
new file mode 100644
index 000000000000..6c1b1dd3c1ae
--- /dev/null
+++ b/drivers/input/touchscreen/msg26xx.c
@@ -0,0 +1,369 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Driver for MStar msg26xx touchscreens
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
+struct msg26xx_ts_data {
+	struct i2c_client *client;
+	struct input_dev *input_dev;
+	struct touchscreen_properties prop;
+	struct regulator_bulk_data supplies[2];
+	struct gpio_desc *reset_gpiod;
+};
+
+static int mstar_init_regulators(struct msg26xx_ts_data *msg26xx)
+{
+	struct i2c_client *client = msg26xx->client;
+	int error;
+
+	msg26xx->supplies[0].supply = "vdd";
+	msg26xx->supplies[1].supply = "vddio";
+	error = devm_regulator_bulk_get(&client->dev,
+					ARRAY_SIZE(msg26xx->supplies),
+					msg26xx->supplies);
+	if (error < 0) {
+		dev_err(&client->dev, "Failed to get regulators: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static void mstar_power_on(struct msg26xx_ts_data *msg26xx)
+{
+	gpiod_set_value(msg26xx->reset_gpiod, 1);
+	mdelay(10);
+	gpiod_set_value(msg26xx->reset_gpiod, 0);
+	mdelay(FIRMWARE_ON_DELAY);
+
+	enable_irq(msg26xx->client->irq);
+}
+
+static void mstar_report_finger(struct msg26xx_ts_data *msg26xx, int slot,
+				const struct point_coord *pc)
+{
+	input_mt_slot(msg26xx->input_dev, slot);
+	input_mt_report_slot_state(msg26xx->input_dev, MT_TOOL_FINGER, true);
+	touchscreen_report_pos(msg26xx->input_dev, &msg26xx->prop, pc->x, pc->y, true);
+	input_report_abs(msg26xx->input_dev, ABS_MT_TOUCH_MAJOR, 1);
+}
+
+static u8 mstar_checksum(u8 *data, u32 length)
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
+static irqreturn_t mstar_ts_irq_handler(int irq, void *msg26xx_handler)
+{
+	struct msg26xx_ts_data *msg26xx = msg26xx_handler;
+	struct i2c_client *client = msg26xx->client;
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
+	if (mstar_checksum((u8 *)&touch_event, len - 1) != touch_event.checksum) {
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
+		coord.x = (((p->xy_hi & 0xF0) << 4) | p->x_low) * msg26xx->prop.max_x / TPD_WIDTH;
+		coord.y = (((p->xy_hi & 0x0F) << 8) | p->y_low) * msg26xx->prop.max_y / TPD_HEIGHT;
+		mstar_report_finger(msg26xx, i, &coord);
+	}
+
+	input_mt_sync_frame(msg26xx->input_dev);
+	input_sync(msg26xx->input_dev);
+
+out:
+	return IRQ_HANDLED;
+}
+
+static int mstar_start(struct msg26xx_ts_data *msg26xx)
+{
+	int error;
+
+	error = regulator_bulk_enable(ARRAY_SIZE(msg26xx->supplies),
+				      msg26xx->supplies);
+	if (error) {
+		dev_err(&msg26xx->client->dev,
+			"Failed to enable regulators: %d\n", error);
+		return error;
+	}
+
+	msleep(CHIP_ON_DELAY);
+
+	mstar_power_on(msg26xx);
+
+	return 0;
+}
+
+static int mstar_stop(struct msg26xx_ts_data *msg26xx)
+{
+	int error;
+
+	disable_irq(msg26xx->client->irq);
+
+	error = regulator_bulk_disable(ARRAY_SIZE(msg26xx->supplies),
+				       msg26xx->supplies);
+	if (error) {
+		dev_err(&msg26xx->client->dev,
+			"Failed to disable regulators: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int mstar_input_open(struct input_dev *dev)
+{
+	struct msg26xx_ts_data *msg26xx = input_get_drvdata(dev);
+
+	return mstar_start(msg26xx);
+}
+
+static void mstar_input_close(struct input_dev *dev)
+{
+	struct msg26xx_ts_data *msg26xx = input_get_drvdata(dev);
+
+	mstar_stop(msg26xx);
+}
+
+static int mstar_init_input_dev(struct msg26xx_ts_data *msg26xx)
+{
+	struct input_dev *input_dev;
+	int error;
+
+	input_dev = devm_input_allocate_device(&msg26xx->client->dev);
+	if (!input_dev) {
+		dev_err(&msg26xx->client->dev,
+			"Failed to allocate input device.");
+		return -ENOMEM;
+	}
+
+	input_set_drvdata(input_dev, msg26xx);
+	msg26xx->input_dev = input_dev;
+
+	input_dev->name = "MStar TouchScreen";
+	input_dev->phys = "input/ts";
+	input_dev->id.bustype = BUS_I2C;
+	input_dev->open = mstar_input_open;
+	input_dev->close = mstar_input_close;
+
+	input_set_capability(input_dev, EV_ABS, ABS_MT_POSITION_X);
+	input_set_capability(input_dev, EV_ABS, ABS_MT_POSITION_Y);
+	input_set_abs_params(input_dev, ABS_MT_WIDTH_MAJOR, 0, 15, 0, 0);
+	input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
+
+	touchscreen_parse_properties(input_dev, true, &msg26xx->prop);
+	if (!msg26xx->prop.max_x || !msg26xx->prop.max_y) {
+		dev_err(&msg26xx->client->dev,
+			"touchscreen-size-x and/or touchscreen-size-y not set in dts\n");
+		return -EINVAL;
+	}
+
+	error = input_mt_init_slots(input_dev, MAX_SUPPORTED_FINGER_NUM,
+				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+	if (error) {
+		dev_err(&msg26xx->client->dev,
+			"Failed to initialize MT slots: %d", error);
+		return error;
+	}
+
+	error = input_register_device(input_dev);
+	if (error) {
+		dev_err(&msg26xx->client->dev,
+			"Failed to register input device: %d", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int mstar_ts_probe(struct i2c_client *client)
+{
+	struct msg26xx_ts_data *msg26xx;
+	int error;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_err(&client->dev,
+			"Failed to assert adapter's support for plain I2C.\n");
+		return -ENXIO;
+	}
+
+	msg26xx = devm_kzalloc(&client->dev, sizeof(*msg26xx), GFP_KERNEL);
+	if (!msg26xx)
+		return -ENOMEM;
+
+	msg26xx->client = client;
+	i2c_set_clientdata(client, msg26xx);
+
+	error = mstar_init_regulators(msg26xx);
+	if (error) {
+		dev_err(&client->dev,
+			"Failed to initialize regulators: %d\n", error);
+		return error;
+	}
+
+	msg26xx->reset_gpiod = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(msg26xx->reset_gpiod)) {
+		error = PTR_ERR(msg26xx->reset_gpiod);
+		dev_err(&client->dev, "Failed to request reset GPIO: %d\n", error);
+		return error;
+	}
+
+	error = mstar_init_input_dev(msg26xx);
+	if (error) {
+		dev_err(&client->dev,
+			"Failed to initialize input device: %d\n", error);
+		return error;
+	}
+
+	irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
+	error = devm_request_threaded_irq(&client->dev, client->irq,
+					  NULL, mstar_ts_irq_handler,
+					  IRQF_ONESHOT, client->name, msg26xx);
+	if (error) {
+		dev_err(&client->dev, "Failed to request IRQ: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused mstar_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct msg26xx_ts_data *msg26xx = i2c_get_clientdata(client);
+
+	mutex_lock(&msg26xx->input_dev->mutex);
+
+	if (input_device_enabled(msg26xx->input_dev))
+		mstar_stop(msg26xx);
+
+	mutex_unlock(&msg26xx->input_dev->mutex);
+
+	return 0;
+}
+
+static int __maybe_unused mstar_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct msg26xx_ts_data *msg26xx = i2c_get_clientdata(client);
+	int ret = 0;
+
+	mutex_lock(&msg26xx->input_dev->mutex);
+
+	if (input_device_enabled(msg26xx->input_dev))
+		ret = mstar_start(msg26xx);
+
+	mutex_unlock(&msg26xx->input_dev->mutex);
+
+	return ret;
+}
+
+static SIMPLE_DEV_PM_OPS(mstar_pm_ops, mstar_suspend, mstar_resume);
+
+#ifdef CONFIG_OF
+static const struct of_device_id mstar_of_match[] = {
+	{ .compatible = "mstar,msg26xx" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mstar_of_match);
+#endif
+
+static struct i2c_driver mstar_ts_driver = {
+	.probe_new = mstar_ts_probe,
+	.driver = {
+		.name = "MStar-TS",
+		.pm = &mstar_pm_ops,
+		.of_match_table = of_match_ptr(mstar_of_match),
+	},
+};
+module_i2c_driver(mstar_ts_driver);
+
+MODULE_AUTHOR("Vincent Knecht <vincent.knecht@mailoo.org>");
+MODULE_DESCRIPTION("MStar touchscreen driver");
+MODULE_LICENSE("GPL v2");
-- 
2.29.2



