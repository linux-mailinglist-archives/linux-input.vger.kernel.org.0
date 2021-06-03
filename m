Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7079139ADF6
	for <lists+linux-input@lfdr.de>; Fri,  4 Jun 2021 00:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhFCWYp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Jun 2021 18:24:45 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:39650 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231143AbhFCWYp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 3 Jun 2021 18:24:45 -0400
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id E755B1A20871;
        Fri,  4 Jun 2021 01:22:57 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     linux-input@vger.kernel.org
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Device Tree mailing list <devicetree@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jeff LaBundy <jeff@labundy.com>, Jiri Kosina <jikos@jikos.cz>,
        Patchwork Bot <patchwork-bot@kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 2/2 v3] input: add SparkFun Qwiic Joystick driver
Date:   Fri,  4 Jun 2021 01:18:03 +0300
Message-Id: <20210603221801.16586-2-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210603221801.16586-1-oleg@kaa.org.ua>
References: <20210603221801.16586-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A simple analog joystick built on Low Power ATtiny85 Microcontroller.
Directional movements are measured with two 10 kΩ potentiometers
connected with a gimbal mechanism that separates the horizontal and
vertical movements. This joystick also has a select button that is actuated
when the joystick is pressed down.

Input events polled over the I2C bus.

Product page:
https://www.sparkfun.com/products/15168
Firmware and hardware sources:
https://github.com/sparkfun/Qwiic_Joystick

Tested on RPi4B and O4-iMX-NANO boards.

Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Device Tree mailing list <devicetree@vger.kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jeff LaBundy <jeff@labundy.com>
Cc: Jiri Kosina <jikos@jikos.cz>
Cc: Patchwork Bot <patchwork-bot@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---

Changes for v3:
- update patch after code review.

Changes for v2:
- update code after code review

 drivers/input/joystick/Kconfig          |   9 ++
 drivers/input/joystick/Makefile         |   1 +
 drivers/input/joystick/qwiic-joystick.c | 147 ++++++++++++++++++++++++
 3 files changed, 157 insertions(+)
 create mode 100644 drivers/input/joystick/qwiic-joystick.c

diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
index 5e38899058c1..7dfe8ea90923 100644
--- a/drivers/input/joystick/Kconfig
+++ b/drivers/input/joystick/Kconfig
@@ -372,6 +372,15 @@ config JOYSTICK_PXRC
 	  To compile this driver as a module, choose M here: the
 	  module will be called pxrc.
 
+config JOYSTICK_QWIIC
+	tristate "SparkFun Qwiic Joystick"
+	depends on I2C
+	help
+	  Say Y here if you want to use the SparkFun Qwiic Joystick.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called qwiic-joystick.
+
 config JOYSTICK_FSIA6B
 	tristate "FlySky FS-iA6B RC Receiver"
 	select SERIO
diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Makefile
index 31d720c9e493..5174b8aba2dd 100644
--- a/drivers/input/joystick/Makefile
+++ b/drivers/input/joystick/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_JOYSTICK_MAPLE)		+= maplecontrol.o
 obj-$(CONFIG_JOYSTICK_N64)		+= n64joy.o
 obj-$(CONFIG_JOYSTICK_PSXPAD_SPI)	+= psxpad-spi.o
 obj-$(CONFIG_JOYSTICK_PXRC)		+= pxrc.o
+obj-$(CONFIG_JOYSTICK_QWIIC)		+= qwiic-joystick.o
 obj-$(CONFIG_JOYSTICK_SIDEWINDER)	+= sidewinder.o
 obj-$(CONFIG_JOYSTICK_SPACEBALL)	+= spaceball.o
 obj-$(CONFIG_JOYSTICK_SPACEORB)		+= spaceorb.o
diff --git a/drivers/input/joystick/qwiic-joystick.c b/drivers/input/joystick/qwiic-joystick.c
new file mode 100644
index 000000000000..d1748ca38de2
--- /dev/null
+++ b/drivers/input/joystick/qwiic-joystick.c
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Oleh Kravchenko <oleg@kaa.org.ua>
+ *
+ * SparkFun Qwiic Joystick
+ * Product page:https://www.sparkfun.com/products/15168
+ * Firmware and hardware sources:https://github.com/sparkfun/Qwiic_Joystick
+ */
+
+#include <linux/kernel.h>
+#include <linux/bits.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/module.h>
+
+#define DRV_NAME "qwiic-joystick"
+
+#define QWIIC_JSK_REG_VERS	1
+#define QWIIC_JSK_REG_DATA	3
+
+#define QWIIC_JSK_MAX_AXIS	GENMASK(9, 0)
+#define QWIIC_JSK_FUZZ		2
+#define QWIIC_JSK_FLAT		2
+#define QWIIC_JSK_POLL_INTERVAL	16
+#define QWIIC_JSK_POLL_MIN	8
+#define QWIIC_JSK_POLL_MAX	32
+
+struct qwiic_jsk {
+	char phys[32];
+	struct input_dev *dev;
+	struct i2c_client *client;
+};
+
+struct qwiic_ver {
+	u8 major;
+	u8 minor;
+};
+
+struct qwiic_data {
+	__be16 x;
+	__be16 y;
+	u8 thumb;
+} __packed;
+
+static void qwiic_poll(struct input_dev *input)
+{
+	struct qwiic_jsk *priv;
+	struct qwiic_data data;
+	int err;
+
+	priv = input_get_drvdata(input);
+
+	err = i2c_smbus_read_i2c_block_data(priv->client, QWIIC_JSK_REG_DATA,
+					    sizeof(data), (u8 *)&data);
+	if (err != sizeof(data))
+		return;
+
+	input_report_abs(input, ABS_X, be16_to_cpu(data.x) >> 6);
+	input_report_abs(input, ABS_Y, be16_to_cpu(data.y) >> 6);
+	input_report_key(input, BTN_THUMBL, !data.thumb);
+	input_sync(input);
+}
+
+static int qwiic_probe(struct i2c_client *client,
+		       const struct i2c_device_id *id)
+{
+	struct qwiic_jsk *priv;
+	struct qwiic_ver vers;
+	int err;
+
+	err = i2c_smbus_read_i2c_block_data(client, QWIIC_JSK_REG_VERS,
+					    sizeof(vers), (u8 *)&vers);
+	if (err < 0)
+		return err;
+	if (err != sizeof(vers))
+		return -EIO;
+
+	dev_dbg(&client->dev, "SparkFun Qwiic Joystick, FW: %u.%u\n",
+		vers.major, vers.minor);
+
+	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client = client;
+	snprintf(priv->phys, sizeof(priv->phys),
+		 "i2c/%s", dev_name(&client->dev));
+	i2c_set_clientdata(client, priv);
+
+	priv->dev = devm_input_allocate_device(&client->dev);
+	if (!priv->dev)
+		return -ENOMEM;
+
+	priv->dev->id.bustype = BUS_I2C;
+	priv->dev->name = "SparkFun Qwiic Joystick";
+	priv->dev->phys = priv->phys;
+	input_set_drvdata(priv->dev, priv);
+
+	input_set_abs_params(priv->dev, ABS_X, 0, QWIIC_JSK_MAX_AXIS,
+			     QWIIC_JSK_FUZZ, QWIIC_JSK_FLAT);
+	input_set_abs_params(priv->dev, ABS_Y, 0, QWIIC_JSK_MAX_AXIS,
+			     QWIIC_JSK_FUZZ, QWIIC_JSK_FLAT);
+	input_set_capability(priv->dev, EV_KEY, BTN_THUMBL);
+
+	err = input_setup_polling(priv->dev, qwiic_poll);
+	if (err) {
+		dev_err(&client->dev, "failed to set up polling: %d\n", err);
+		return err;
+	}
+	input_set_poll_interval(priv->dev, QWIIC_JSK_POLL_INTERVAL);
+	input_set_min_poll_interval(priv->dev, QWIIC_JSK_POLL_MIN);
+	input_set_max_poll_interval(priv->dev, QWIIC_JSK_POLL_MAX);
+
+	err = input_register_device(priv->dev);
+	if (err)
+		dev_err(&client->dev, "failed to register joystick: %d\n", err);
+
+	return err;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id of_qwiic_match[] = {
+	{ .compatible = "sparkfun,qwiic-joystick", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, of_qwiic_match);
+#endif /* CONFIG_OF */
+
+static const struct i2c_device_id qwiic_id_table[] = {
+	{ KBUILD_MODNAME, 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, qwiic_id_table);
+
+static struct i2c_driver qwiic_driver = {
+	.driver = {
+		.name		= DRV_NAME,
+		.of_match_table	= of_match_ptr(of_qwiic_match),
+	},
+	.id_table	= qwiic_id_table,
+	.probe		= qwiic_probe,
+};
+module_i2c_driver(qwiic_driver);
+
+MODULE_AUTHOR("Oleh Kravchenko <oleg@kaa.org.ua>");
+MODULE_DESCRIPTION("SparkFun Qwiic Joystick driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.3

