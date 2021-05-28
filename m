Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0B2393F00
	for <lists+linux-input@lfdr.de>; Fri, 28 May 2021 10:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234651AbhE1Ixv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 May 2021 04:53:51 -0400
Received: from smtp.220.in.ua ([89.184.67.205]:54686 "EHLO smtp.220.in.ua"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235684AbhE1Ixu (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 May 2021 04:53:50 -0400
X-Greylist: delayed 395 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 May 2021 04:53:49 EDT
Received: from oleh-pc.lan (unknown [95.67.115.55])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp.220.in.ua (Postfix) with ESMTPSA id 3361A1A205CB;
        Fri, 28 May 2021 11:45:39 +0300 (EEST)
From:   Oleh Kravchenko <oleg@kaa.org.ua>
To:     linux-input@vger.kernel.org
Cc:     Oleh Kravchenko <oleg@kaa.org.ua>
Subject: [PATCH] input: add SparkFun Qwiic Joystick driver
Date:   Fri, 28 May 2021 11:44:22 +0300
Message-Id: <20210528084421.24869-1-oleg@kaa.org.ua>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Directional movements are simply measured with two 10 kΩ potentiometers,
connected with a gimbal mechanism that separates the horizontal
and vertical movements. This joystick also has a select button
that is actuated when the joystick is pressed down.

This chip is plugged on an I2C bus.
Tested on RPi4B and O4-iMX-NANO boards.

Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
---

Link to product page:
  https://www.sparkfun.com/products/15168

 .../bindings/input/qwiic-joystick.yaml        |  30 ++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/input/joystick/Kconfig                |   9 +
 drivers/input/joystick/Makefile               |   1 +
 drivers/input/joystick/qwiic-joystick.c       | 164 ++++++++++++++++++
 5 files changed, 206 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/qwiic-joystick.yaml
 create mode 100644 drivers/input/joystick/qwiic-joystick.c

diff --git a/Documentation/devicetree/bindings/input/qwiic-joystick.yaml b/Documentation/devicetree/bindings/input/qwiic-joystick.yaml
new file mode 100644
index 000000000000..03549689e288
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/qwiic-joystick.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2021 Oleh Kravchenko
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/input/qwiic-joystick.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: SparkFun Qwiic Joystick
+
+maintainers:
+  - Oleh Kravchenko <oleg@kaa.org.ua>
+
+description: |
+  Bindings for SparkFun Qwiic Joystick (COM-15168).
+
+properties:
+  compatible:
+    const: sparkfun,qwiic-joystick
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    qwiic@20 {
+        compatible = "sparkfun,qwiic-joystick";
+        reg = <0x20>;
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b868cefc7c55..30e9a0817e21 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1076,6 +1076,8 @@ patternProperties:
     description: Sony Corporation
   "^spansion,.*":
     description: Spansion Inc.
+  "^sparkfun,.*":
+    description: SparkFun Electronics
   "^sprd,.*":
     description: Spreadtrum Communications Inc.
   "^sst,.*":
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
index 000000000000..8e0efeeb1f8a
--- /dev/null
+++ b/drivers/input/joystick/qwiic-joystick.c
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2021 Oleh Kravchenko <oleg@kaa.org.ua>
+
+#include <linux/bits.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input-polldev.h>
+#include <linux/module.h>
+
+#define QWIIC_JSK_REG_VERS	0
+#define QWIIC_JSK_REG_DATA	3
+
+#define QWIIC_JSK_MAX_AXIS	GENMASK(10, 0)
+#define QWIIC_JSK_FUZZ		2
+#define QWIIC_JSK_FLAT		2
+
+struct qwiic_jsk {
+	char			phys[32];
+	struct input_dev	*dev;
+	struct i2c_client	*i2c;
+};
+
+struct qwiic_ver {
+	u8 addr;
+	u8 major;
+	u8 minor;
+} __packed;
+
+struct qwiic_data {
+	u8 hx;
+	u8 lx;
+	u8 hy;
+	u8 ly;
+	u8 thumb;
+} __packed;
+
+static void qwiic_poll(struct input_dev *input)
+{
+	struct qwiic_jsk	*priv;
+	struct qwiic_data	data;
+	int			ret;
+	int			x, y, btn;
+
+	priv = input_get_drvdata(input);
+
+	ret = i2c_smbus_read_i2c_block_data(priv->i2c, QWIIC_JSK_REG_DATA,
+					    sizeof(data), (u8 *)&data);
+	if (ret == sizeof(data)) {
+		x = (data.hx << 8 | data.lx) >> 6;
+		y = (data.hy << 8 | data.ly) >> 6;
+		btn = !!!data.thumb;
+
+		input_report_abs(input, ABS_X, x);
+		input_report_abs(input, ABS_Y, y);
+		input_report_key(input, BTN_THUMBL, btn);
+
+		input_sync(input);
+	}
+}
+
+static int qwiic_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
+{
+	struct qwiic_jsk	*priv;
+	struct qwiic_ver	vers;
+	int			ret;
+
+	ret = i2c_smbus_read_i2c_block_data(i2c, QWIIC_JSK_REG_VERS,
+					    sizeof(vers), (u8 *)&vers);
+	if (ret != sizeof(vers)) {
+		ret = -EIO;
+		goto err;
+	}
+
+	if (i2c->addr != vers.addr) {
+		dev_err(&i2c->dev, "address doesn't match!\n");
+		ret = -ENODEV;
+		goto err;
+	}
+
+	dev_info(&i2c->dev, "SparkFun Qwiic Joystick, FW: %d.%d\n",
+		 vers.major, vers.minor);
+
+	priv = devm_kzalloc(&i2c->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	priv->i2c = i2c;
+	snprintf(priv->phys, sizeof(priv->phys), "i2c/%s", dev_name(&i2c->dev));
+	i2c_set_clientdata(i2c, priv);
+
+	priv->dev = devm_input_allocate_device(&i2c->dev);
+	if (!priv->dev) {
+		dev_err(&i2c->dev, "failed to allocate input device\n");
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	priv->dev->dev.parent = &i2c->dev;
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
+	ret = input_setup_polling(priv->dev, qwiic_poll);
+	if (ret) {
+		dev_err(&i2c->dev, "failed to set up polling: %d\n", ret);
+		goto err;
+	}
+	input_set_poll_interval(priv->dev, 16);
+	input_set_min_poll_interval(priv->dev, 8);
+	input_set_max_poll_interval(priv->dev, 32);
+
+	ret = input_register_device(priv->dev);
+	if (ret)
+		dev_err(&i2c->dev, "failed to register joystick: %d\n", ret);
+
+err:
+	return ret;
+}
+
+static int qwiic_remove(struct i2c_client *i2c)
+{
+	struct qwiic_jsk *priv;
+
+	priv = i2c_get_clientdata(i2c);
+	input_unregister_device(priv->dev);
+
+	return 0;
+}
+
+static const struct of_device_id of_qwiic_match[] = {
+	{ .compatible = "sparkfun,qwiic-joystick", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_qwiic_match);
+
+static const struct i2c_device_id qwiic_id_table[] = {
+	{ KBUILD_MODNAME, 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, qwiic_id_table);
+
+static struct i2c_driver qwiic_driver = {
+	.driver = {
+		.name		= KBUILD_MODNAME,
+		.of_match_table	= of_match_ptr(of_qwiic_match),
+	},
+	.id_table	= qwiic_id_table,
+	.probe		= qwiic_probe,
+	.remove		= qwiic_remove,
+};
+module_i2c_driver(qwiic_driver);
+
+MODULE_AUTHOR("Oleh Kravchenko <oleg@kaa.org.ua>");
+MODULE_DESCRIPTION("SparkFun Qwiic Joystick driver");
+MODULE_LICENSE("GPL v2");
-- 
2.26.3

