Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B59F69AF0F
	for <lists+linux-input@lfdr.de>; Fri, 17 Feb 2023 16:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbjBQPJF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Feb 2023 10:09:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbjBQPJC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Feb 2023 10:09:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 512BD1556A
        for <linux-input@vger.kernel.org>; Fri, 17 Feb 2023 07:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676646472;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=XPhtk7C1oOpAi3VblDk/kCWkonzX1AKpMMi0ccODaW8=;
        b=cmDZh2nGg/0g0pnwxzVsOP1M1Y2DmUSzEH3EJvbh2Kwnh630w8Paxyy/Wt2J6VaqEnn0EO
        +cXU8C5cXhRoaryOhCO28d4zZhfR6vYaoECco7muFmT08tToiGJRtv7s+nGWY8cVp+Q5VQ
        HPUVkOkfAJLHWF9AAp02g2QwJhn/5Mk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-sg54Fq8sPYSavQ09JBoY5A-1; Fri, 17 Feb 2023 10:07:50 -0500
X-MC-Unique: sg54Fq8sPYSavQ09JBoY5A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D215185A78B;
        Fri, 17 Feb 2023 15:07:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.199])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A87D3492C3E;
        Fri, 17 Feb 2023 15:07:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH] Input: touchscreen - Add new Novatek NVT-ts driver
Date:   Fri, 17 Feb 2023 16:07:49 +0100
Message-Id: <20230217150749.32670-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add a new driver for the Novatek i2c touchscreen controller as found
on the Acer Iconia One 7 B1-750 tablet. Unfortunately the touchscreen
controller model-number is unknown. Even with the tablet opened up it
is impossible to read the model-number.

Android calls this a "NVT-ts" touchscreen, but that may apply to other
Novatek controller models too.

This appears to be the same controller as the one supported by
https://github.com/advx9600/android/blob/master/touchscreen/NVTtouch_Android4.0/NVTtouch.c
but unfortunately that does not give us a model-number either.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 MAINTAINERS                                |   6 +
 drivers/input/touchscreen/Kconfig          |  10 +
 drivers/input/touchscreen/Makefile         |   1 +
 drivers/input/touchscreen/novatek-nvt-ts.c | 288 +++++++++++++++++++++
 4 files changed, 305 insertions(+)
 create mode 100644 drivers/input/touchscreen/novatek-nvt-ts.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 60c0ded06e3f..0c051a973e6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14835,6 +14835,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git
 F:	tools/include/nolibc/
 F:	tools/testing/selftests/nolibc/
 
+NOVATEK NVT-TS I2C TOUCHSCREEN DRIVER
+M:	Hans de Goede <hdegoede@redhat.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	drivers/input/touchscreen/novatek-nvt-ts.c
+
 NSDEPS
 M:	Matthias Maennich <maennich@google.com>
 S:	Maintained
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 68d99a112e14..59ca8bfe9a95 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -666,6 +666,16 @@ config TOUCHSCREEN_MTOUCH
 	  To compile this driver as a module, choose M here: the
 	  module will be called mtouch.
 
+config TOUCHSCREEN_NOVATEK_NVT_TS
+	tristate "Novatek NVT-ts touchscreen support"
+	depends on I2C
+	help
+	  Say Y here if you have a Novatek NVT-ts touchscreen.
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called novatek-nvt-ts.
+
 config TOUCHSCREEN_IMAGIS
 	tristate "Imagis touchscreen support"
 	depends on I2C
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 4968c370479a..41654239f89c 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -67,6 +67,7 @@ obj-$(CONFIG_TOUCHSCREEN_MMS114)	+= mms114.o
 obj-$(CONFIG_TOUCHSCREEN_MSG2638)	+= msg2638.o
 obj-$(CONFIG_TOUCHSCREEN_MTOUCH)	+= mtouch.o
 obj-$(CONFIG_TOUCHSCREEN_MK712)		+= mk712.o
+obj-$(CONFIG_TOUCHSCREEN_NOVATEK_NVT_TS)	+= novatek-nvt-ts.o
 obj-$(CONFIG_TOUCHSCREEN_HP600)		+= hp680_ts_input.o
 obj-$(CONFIG_TOUCHSCREEN_HP7XX)		+= jornada720_ts.o
 obj-$(CONFIG_TOUCHSCREEN_IPAQ_MICRO)	+= ipaq-micro-ts.o
diff --git a/drivers/input/touchscreen/novatek-nvt-ts.c b/drivers/input/touchscreen/novatek-nvt-ts.c
new file mode 100644
index 000000000000..2464c758ca14
--- /dev/null
+++ b/drivers/input/touchscreen/novatek-nvt-ts.c
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for Novatek i2c touchscreen controller as found on
+ * the Acer Iconia One 7 B1-750 tablet. The Touchscreen controller
+ * model-number is unknown. Android calls this a "NVT-ts" touchscreen,
+ * but that may apply to other Novatek controller models too.
+ *
+ * Copyright (c) 2023 Hans de Goede <hdegoede@redhat.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/interrupt.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/module.h>
+
+#include <asm/unaligned.h>
+
+#define NVT_TS_TOUCH_START		0x00
+#define NVT_TS_TOUCH_SIZE		6
+
+#define NVT_TS_PARAMETERS_START		0x78
+/* These are offsets from NVT_TS_PARAMETERS_START */
+#define NVT_TS_PARAMS_WIDTH		0x04
+#define NVT_TS_PARAMS_HEIGHT		0x06
+#define NVT_TS_PARAMS_MAX_TOUCH		0x09
+#define NVT_TS_PARAMS_MAX_BUTTONS	0x0a
+#define NVT_TS_PARAMS_IRQ_TYPE		0x0b
+#define NVT_TS_PARAMS_WAKE_TYPE		0x0c
+#define NVT_TS_PARAMS_CHIP_ID		0x0e
+#define NVT_TS_PARAMS_SIZE		0x0f
+
+#define NVT_TS_SUPPORTED_WAKE_TYPE	0x05
+#define NVT_TS_SUPPORTED_CHIP_ID	0x05
+
+#define NVT_TS_MAX_TOUCHES		10
+#define NVT_TS_MAX_SIZE			4096
+
+#define NVT_TS_TOUCH_NEW		1
+#define NVT_TS_TOUCH_UPDATE		2
+#define NVT_TS_TOUCH_RELEASE		3
+
+static const int nvt_ts_irq_type[4] = {
+	IRQF_TRIGGER_RISING,
+	IRQF_TRIGGER_FALLING,
+	IRQF_TRIGGER_LOW,
+	IRQF_TRIGGER_HIGH
+};
+
+struct nvt_ts_data {
+	struct i2c_client *client;
+	struct input_dev *input;
+	struct gpio_desc *reset_gpio;
+	struct touchscreen_properties prop;
+	int max_touches;
+	u8 buf[NVT_TS_TOUCH_SIZE * NVT_TS_MAX_TOUCHES];
+};
+
+static int nvt_ts_read_data(struct i2c_client *client, u8 reg, u8 *data, int count)
+{
+	struct i2c_msg msg[2] = {
+		{
+			.addr = client->addr,
+			.len = 1,
+			.buf = &reg
+		},
+		{
+			.addr = client->addr,
+			.flags = I2C_M_RD,
+			.len = count,
+			.buf = data,
+		}
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, msg, 2);
+	if (ret != 2) {
+		dev_err(&client->dev, "Error reading from 0x%02x: %d\n", reg, ret);
+		return (ret < 0) ? ret : -EIO;
+	}
+
+	return 0;
+}
+
+static irqreturn_t nvt_ts_irq(int irq, void *dev_id)
+{
+	struct nvt_ts_data *data = dev_id;
+	struct device *dev = &data->client->dev;
+	int i, ret, slot, x, y;
+	bool active;
+	u8 *touch;
+
+	ret = nvt_ts_read_data(data->client, NVT_TS_TOUCH_START, data->buf,
+			       data->max_touches * NVT_TS_TOUCH_SIZE);
+	if (ret)
+		return IRQ_HANDLED;
+
+	for (i = 0; i < data->max_touches; i++) {
+		touch = &data->buf[i * NVT_TS_TOUCH_SIZE];
+
+		/* 0xff means no touch */
+		if (touch[0] == 0xff)
+			continue;
+
+		slot = touch[0] >> 3;
+		if (slot < 1 || slot > data->max_touches) {
+			dev_warn(dev, "slot %d out of range, ignoring\n", slot);
+			continue;
+		}
+
+		switch (touch[0] & 7) {
+		case NVT_TS_TOUCH_NEW:
+		case NVT_TS_TOUCH_UPDATE:
+			active = true;
+			break;
+		case NVT_TS_TOUCH_RELEASE:
+			active = false;
+			break;
+		default:
+			dev_warn(dev, "slot %d unknown state %d\n", slot, touch[0] & 7);
+			continue;
+		}
+
+		slot--;
+		x = (touch[1] << 4) | (touch[3] >> 4);
+		y = (touch[2] << 4) | (touch[3] & 0x0f);
+
+		input_mt_slot(data->input, slot);
+		input_mt_report_slot_state(data->input, MT_TOOL_FINGER, active);
+		touchscreen_report_pos(data->input, &data->prop, x, y, true);
+	}
+
+	input_mt_sync_frame(data->input);
+	input_sync(data->input);
+
+	return IRQ_HANDLED;
+}
+
+static int nvt_ts_start(struct input_dev *dev)
+{
+	struct nvt_ts_data *data = input_get_drvdata(dev);
+
+	enable_irq(data->client->irq);
+	gpiod_set_value_cansleep(data->reset_gpio, 0);
+
+	return 0;
+}
+
+static void nvt_ts_stop(struct input_dev *dev)
+{
+	struct nvt_ts_data *data = input_get_drvdata(dev);
+
+	disable_irq(data->client->irq);
+	gpiod_set_value_cansleep(data->reset_gpio, 1);
+}
+
+static int nvt_ts_suspend(struct device *dev)
+{
+	struct nvt_ts_data *data = i2c_get_clientdata(to_i2c_client(dev));
+
+	mutex_lock(&data->input->mutex);
+	if (input_device_enabled(data->input))
+		nvt_ts_stop(data->input);
+	mutex_unlock(&data->input->mutex);
+
+	return 0;
+}
+
+static int nvt_ts_resume(struct device *dev)
+{
+	struct nvt_ts_data *data = i2c_get_clientdata(to_i2c_client(dev));
+
+	mutex_lock(&data->input->mutex);
+	if (input_device_enabled(data->input))
+		nvt_ts_start(data->input);
+	mutex_unlock(&data->input->mutex);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(nvt_ts_pm_ops, nvt_ts_suspend, nvt_ts_resume);
+
+static int nvt_ts_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	int ret, width, height, irq_type;
+	struct nvt_ts_data *data;
+	struct input_dev *input;
+
+	if (!client->irq) {
+		dev_err(dev, "Error no irq specified\n");
+		return -EINVAL;
+	}
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->client = client;
+	i2c_set_clientdata(client, data);
+
+	data->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(data->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(data->reset_gpio), "requesting reset GPIO\n");
+
+	/* Wait for controller to come out of reset before params read */
+	msleep(100);
+	ret = nvt_ts_read_data(data->client, NVT_TS_PARAMETERS_START, data->buf,
+			       NVT_TS_PARAMS_SIZE);
+	gpiod_set_value_cansleep(data->reset_gpio, 1); /* Put back in reset */
+	if (ret)
+		return ret;
+
+	width  = get_unaligned_be16(&data->buf[NVT_TS_PARAMS_WIDTH]);
+	height = get_unaligned_be16(&data->buf[NVT_TS_PARAMS_HEIGHT]);
+	data->max_touches = data->buf[NVT_TS_PARAMS_MAX_TOUCH];
+	irq_type = data->buf[NVT_TS_PARAMS_IRQ_TYPE];
+
+	if (width > NVT_TS_MAX_SIZE || height >= NVT_TS_MAX_SIZE ||
+	    data->max_touches > NVT_TS_MAX_TOUCHES ||
+	    irq_type >= ARRAY_SIZE(nvt_ts_irq_type) ||
+	    data->buf[NVT_TS_PARAMS_WAKE_TYPE] != NVT_TS_SUPPORTED_WAKE_TYPE ||
+	    data->buf[NVT_TS_PARAMS_CHIP_ID] != NVT_TS_SUPPORTED_CHIP_ID) {
+		dev_err(dev, "Unsupported touchscreen parameters: %*ph\n",
+			NVT_TS_PARAMS_SIZE, data->buf);
+		return -EIO;
+	}
+
+	dev_info(dev, "Detected %dx%d touchscreen with %d max touches\n",
+		 width, height, data->max_touches);
+
+	if (data->buf[NVT_TS_PARAMS_MAX_BUTTONS])
+		dev_warn(dev, "Touchscreen buttons are not supported\n");
+
+	input = devm_input_allocate_device(dev);
+	if (!input)
+		return -ENOMEM;
+
+	input->name = client->name;
+	input->id.bustype = BUS_I2C;
+	input->open = nvt_ts_start;
+	input->close = nvt_ts_stop;
+	input->dev.parent = dev;
+
+	input_set_abs_params(input, ABS_MT_POSITION_X, 0, width - 1, 0, 0);
+	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, height - 1, 0, 0);
+	touchscreen_parse_properties(input, true, &data->prop);
+
+	ret = input_mt_init_slots(input, data->max_touches,
+				  INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+	if (ret)
+		return ret;
+
+	data->input = input;
+	input_set_drvdata(input, data);
+
+	ret = devm_request_threaded_irq(dev, client->irq, NULL, nvt_ts_irq,
+					IRQF_ONESHOT | IRQF_NO_AUTOEN | nvt_ts_irq_type[irq_type],
+					client->name, data);
+	if (ret)
+		return dev_err_probe(dev, ret, "requesting irq\n");
+
+	return input_register_device(input);
+}
+
+static const struct i2c_device_id nvt_ts_i2c_id[] = {
+	{ "NVT-ts" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, nvt_ts_i2c_id);
+
+static struct i2c_driver nvt_ts_driver = {
+	.driver = {
+		.name	= "novatek-nvt-ts",
+		.pm	= &nvt_ts_pm_ops,
+	},
+	.probe_new = nvt_ts_probe,
+	.id_table = nvt_ts_i2c_id,
+};
+
+module_i2c_driver(nvt_ts_driver);
+
+MODULE_DESCRIPTION("Novatek NVT-ts touchscreen driver");
+MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
+MODULE_LICENSE("GPL");
-- 
2.39.1

