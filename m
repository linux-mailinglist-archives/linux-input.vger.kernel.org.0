Return-Path: <linux-input+bounces-16472-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58656CA8709
	for <lists+linux-input@lfdr.de>; Fri, 05 Dec 2025 17:55:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C3683014AF8
	for <lists+linux-input@lfdr.de>; Fri,  5 Dec 2025 16:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A1A21E08D;
	Fri,  5 Dec 2025 16:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b="T4lqYnbZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0162633B6C3;
	Fri,  5 Dec 2025 16:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764953439; cv=none; b=gbdnl2gf6ZMxXSxjmHm87FIeRwt9e0TXOUvMkIp7eUbueqPg2ewjFzqcnM77m0wwROt0FvEfl7I9UKB8CpUO+Ep/SMY3E4uLQb6aJo8rorE+iZJlgoNXGWSCgq5vPRwgsQB7Ay06FTQmvaqmRdtzMS2ert6Nn9sz8Yilu0n3DDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764953439; c=relaxed/simple;
	bh=EUaOnd0fCk0yeeKzL13nTJmJErkeKxBYXmw6lbCEpYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jmtESTpuVVBAvTAeMOaDXyb4LOfuqvZGBuhohJ+Y+RrpVWeuN7PG8QgA8t5jsAFFxwqJjt0uC+CBULbOtyoIZmMJ2alp/72t7g+5tOQfXWP23tpnHIEVzTvahx0BZSxvC9dqan8uYswoljgULMd3iNXc8dDRVrAjUqQSElkE61c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b=T4lqYnbZ; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1764953429; x=1765558229; i=hendrik-noack@gmx.de;
	bh=FfwA1JFbC/R2ZxUIPkKbx4ELxbiBB+uGHxNBazWeen0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=T4lqYnbZ9W/MFuvz7B1F5qQR0osSAdJMicyF8CEAVmVyvRjO3mMZF19IIz+FE+Aa
	 WOrRMQoSHRrZ5pjedwDWh7k+EC9b3eS9mCL8vUdR5ziVSfuM7m9UNfM0XvazRrFYU
	 UDm2nV6Dd03QIGdJ8iZiaT4JQEy4frPDwxst5ObZHyfoJwQS0MX4u+CVP73AD3Fnt
	 aRZ5Vl2V28RF/3caowLJ87VslD82GhJK5/RBSmtVuGBnr/TPDqsmCX0PCEoOr9lSb
	 I9BxX1EeFgimTqU2ZaH3dPHheFod7LcSaqO2RPWxZLOh9gA1B2cE+vu1+b6MDriJX
	 YvY+IRpYszRGMTy5UA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from Hendrik-Linux ([217.85.36.251]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Ml6qC-1vvQC02wqy-00cOTw; Fri, 05
 Dec 2025 17:50:28 +0100
From: Hendrik Noack <hendrik-noack@gmx.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Hendrik Noack <hendrik-noack@gmx.de>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Input: Add support for Wacom W9000-series penabled touchscreens
Date: Fri,  5 Dec 2025 17:49:52 +0100
Message-ID: <20251205164952.17709-1-hendrik-noack@gmx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205152858.14415-1-hendrik-noack@gmx.de>
References: <20251205152858.14415-1-hendrik-noack@gmx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DEANJCP0R0m+YTL9M0y2GS8gWtQkgUwwWQoALrayuoIgfFjVKP5
 TOolJzf6BI+Zksx43uuRxuZPdRrjbn8mE2x50p5EZW70Sr4CZiq1ig6drZqqHZzeYa/tv1u
 y0BQeSq6cB8pM/qhr2E7aKQGjXb0jsoKYJM9QNqftkAiCtZhCeyUWJA/dG4Od8G1D7iX2Wm
 cCdqg7lRt1hDJhTcJB5Lw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lEfE2VZBlcM=;RFczuCT5QvQ6Ma1XieKrGwkAUY1
 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

Add driver for two Wacom W9007A variants. These are penabled touchscreens
supporting passive Wacom Pens and use I2C.

Signed-off-by: Hendrik Noack <hendrik-noack@gmx.de>
=2D--
 drivers/input/touchscreen/Kconfig       |  12 +
 drivers/input/touchscreen/Makefile      |   1 +
 drivers/input/touchscreen/wacom_w9000.c | 480 ++++++++++++++++++++++++
 3 files changed, 493 insertions(+)
 create mode 100644 drivers/input/touchscreen/wacom_w9000.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen=
/Kconfig
index 7d5b72ee07fa..40f7af0a681a 100644
=2D-- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -610,6 +610,18 @@ config TOUCHSCREEN_WACOM_I2C
 	  To compile this driver as a module, choose M here: the module
 	  will be called wacom_i2c.
=20
+config TOUCHSCREEN_WACOM_W9000
+	tristate "Wacom W9000-series penabled touchscreen (I2C)"
+	depends on I2C
+	help
+	  Say Y here if you have a Wacom W9000-series penabled I2C touchscreen.
+	  This driver supports model W9007A.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called wacom_w9000.
+
 config TOUCHSCREEN_LPC32XX
 	tristate "LPC32XX touchscreen controller"
 	depends on ARCH_LPC32XX
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscree=
n/Makefile
index ab9abd151078..aa3915df83b2 100644
=2D-- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -102,6 +102,7 @@ tsc2007-$(CONFIG_TOUCHSCREEN_TSC2007_IIO)	+=3D tsc2007=
_iio.o
 obj-$(CONFIG_TOUCHSCREEN_TSC2007)	+=3D tsc2007.o
 obj-$(CONFIG_TOUCHSCREEN_WACOM_W8001)	+=3D wacom_w8001.o
 obj-$(CONFIG_TOUCHSCREEN_WACOM_I2C)	+=3D wacom_i2c.o
+obj-$(CONFIG_TOUCHSCREEN_WACOM_W9000)	+=3D wacom_w9000.o
 obj-$(CONFIG_TOUCHSCREEN_WDT87XX_I2C)	+=3D wdt87xx_i2c.o
 obj-$(CONFIG_TOUCHSCREEN_WM831X)	+=3D wm831x-ts.o
 obj-$(CONFIG_TOUCHSCREEN_WM97XX)	+=3D wm97xx-ts.o
diff --git a/drivers/input/touchscreen/wacom_w9000.c b/drivers/input/touch=
screen/wacom_w9000.c
new file mode 100644
index 000000000000..05c928646bc3
=2D-- /dev/null
+++ b/drivers/input/touchscreen/wacom_w9000.c
@@ -0,0 +1,480 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Wacom W9000-series penabled I2C touchscreen driver
+ *
+ * Copyright (c) 2025 Hendrik Noack <hendrik-noack@gmx.de>
+ *
+ * Partially based on vendor driver:
+ *	Copyright (C) 2012, Samsung Electronics Co. Ltd.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/input/touchscreen.h>
+#include <linux/unaligned.h>
+
+// Message length
+#define COM_COORD_NUM_MAX	12
+#define COM_QUERY_NUM_MAX	9
+
+// Commands
+#define COM_QUERY		0x2a
+
+struct wacom_w9000_variant {
+	int com_coord_num;
+	int com_query_num;
+	char *name;
+};
+
+struct wacom_w9000_data {
+	struct i2c_client *client;
+	struct input_dev *input_dev;
+	const struct wacom_w9000_variant *variant;
+	unsigned int fw_version;
+
+	struct touchscreen_properties prop;
+	unsigned int max_pressure;
+
+	struct regulator *regulator;
+
+	struct gpio_desc *flash_mode_gpio;
+	struct gpio_desc *pen_inserted_gpio;
+
+	unsigned int irq;
+	unsigned int pen_insert_irq;
+
+	bool pen_inserted;
+	bool pen_proximity;
+};
+
+static int wacom_w9000_read(struct i2c_client *client, u8 command, int le=
n, char *data)
+{
+	struct i2c_msg xfer[2];
+	bool retried =3D false;
+	int ret;
+
+	/* Write register */
+	xfer[0].addr =3D client->addr;
+	xfer[0].flags =3D 0;
+	xfer[0].len =3D 1;
+	xfer[0].buf =3D &command;
+
+	/* Read data */
+	xfer[1].addr =3D client->addr;
+	xfer[1].flags =3D I2C_M_RD;
+	xfer[1].len =3D len;
+	xfer[1].buf =3D data;
+
+retry:
+	ret =3D i2c_transfer(client->adapter, xfer, 2);
+	if (ret =3D=3D 2) {
+		ret =3D 0;
+	} else if (!retried) {
+		retried =3D true;
+		goto retry;
+	} else {
+		if (ret >=3D 0)
+			ret =3D -EIO;
+		dev_err(&client->dev, "%s: i2c transfer failed (%d)\n", __func__, ret);
+	}
+
+	return ret;
+}
+
+static int wacom_w9000_query(struct wacom_w9000_data *wacom_data)
+{
+	struct i2c_client *client =3D wacom_data->client;
+	struct device *dev =3D &wacom_data->client->dev;
+	bool retried =3D false;
+	int ret;
+	u8 data[COM_QUERY_NUM_MAX];
+
+retry:
+	ret =3D wacom_w9000_read(client, COM_QUERY, wacom_data->variant->com_que=
ry_num, data);
+	if (ret)
+		return ret;
+
+	if (data[0] =3D=3D 0x0f) {
+		wacom_data->fw_version =3D get_unaligned_be16(&data[7]);
+	} else if (!retried) {
+		retried =3D true;
+		goto retry;
+	} else {
+		return -EIO;
+	}
+
+	dev_dbg(dev, "query: %X, %X, %X, %X, %X, %X, %X, %X, %X, %d\n", data[0],=
 data[1], data[2],
+		data[3], data[4], data[5], data[6], data[7], data[8], retried);
+
+	wacom_data->prop.max_x =3D get_unaligned_be16(&data[1]);
+	wacom_data->prop.max_y =3D get_unaligned_be16(&data[3]);
+	wacom_data->max_pressure =3D get_unaligned_be16(&data[5]);
+
+	dev_dbg(dev, "max_x:%d, max_y:%d, max_pressure:%d, fw:0x%X", wacom_data-=
>prop.max_x,
+		wacom_data->prop.max_y, wacom_data->max_pressure,
+		wacom_data->fw_version);
+
+	return 0;
+}
+
+static void wacom_w9000_coord(struct wacom_w9000_data *wacom_data)
+{
+	struct i2c_client *client =3D wacom_data->client;
+	struct device *dev =3D &wacom_data->client->dev;
+	int ret;
+	u8 data[COM_COORD_NUM_MAX];
+	bool touch, rubber, side_button;
+	u16 x, y, pressure;
+	u8 distance;
+
+	ret =3D i2c_master_recv(client, data, wacom_data->variant->com_coord_num=
);
+	if (ret !=3D wacom_data->variant->com_coord_num) {
+		if (ret >=3D 0)
+			ret =3D -EIO;
+		dev_err(dev, "%s: i2c receive failed (%d)\n", __func__, ret);
+		return;
+	}
+
+	dev_dbg(dev, "data: %X, %X, %X, %X, %X, %X, %X, %X, %X, %X, %X, %X", dat=
a[0], data[1],
+		data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9],=
 data[10],
+		data[11]);
+
+	if (data[0] & BIT(7)) {
+		wacom_data->pen_proximity =3D 1;
+
+		touch =3D !!(data[0] & BIT(4));
+		side_button =3D !!(data[0] & BIT(5));
+		rubber =3D !!(data[0] & BIT(6));
+
+		x =3D get_unaligned_be16(&data[1]);
+		y =3D get_unaligned_be16(&data[3]);
+		pressure =3D get_unaligned_be16(&data[5]);
+		distance =3D data[7];
+
+		if (!((x <=3D wacom_data->prop.max_x) && (y <=3D wacom_data->prop.max_y=
))) {
+			dev_warn(dev, "Coordinates out of range x=3D%d, y=3D%d", x, y);
+			return;
+		}
+
+		touchscreen_report_pos(wacom_data->input_dev, &wacom_data->prop, x, y, =
false);
+		input_report_abs(wacom_data->input_dev, ABS_PRESSURE, pressure);
+		input_report_abs(wacom_data->input_dev, ABS_DISTANCE, distance);
+		input_report_key(wacom_data->input_dev, BTN_STYLUS, side_button);
+		input_report_key(wacom_data->input_dev, BTN_TOUCH, touch);
+		input_report_key(wacom_data->input_dev, BTN_TOOL_PEN, !rubber);
+		input_report_key(wacom_data->input_dev, BTN_TOOL_RUBBER, rubber);
+		input_sync(wacom_data->input_dev);
+	} else {
+		if (wacom_data->pen_proximity) {
+			input_report_abs(wacom_data->input_dev, ABS_PRESSURE, 0);
+			input_report_abs(wacom_data->input_dev, ABS_DISTANCE, 0);
+			input_report_key(wacom_data->input_dev, BTN_STYLUS, 0);
+			input_report_key(wacom_data->input_dev, BTN_TOUCH, 0);
+			input_report_key(wacom_data->input_dev, BTN_TOOL_PEN, 0);
+			input_report_key(wacom_data->input_dev, BTN_TOOL_RUBBER, 0);
+			input_sync(wacom_data->input_dev);
+
+			wacom_data->pen_proximity =3D 0;
+		}
+	}
+}
+
+static irqreturn_t wacom_w9000_interrupt(int irq, void *dev_id)
+{
+	struct wacom_w9000_data *wacom_data =3D dev_id;
+
+	wacom_w9000_coord(wacom_data);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t wacom_w9000_interrupt_pen_insert(int irq, void *dev_id=
)
+{
+	struct wacom_w9000_data *wacom_data =3D dev_id;
+	struct device *dev =3D &wacom_data->client->dev;
+	int ret;
+
+	wacom_data->pen_inserted =3D gpiod_get_value(wacom_data->pen_inserted_gp=
io);
+
+	input_report_switch(wacom_data->input_dev, SW_PEN_INSERTED, wacom_data->=
pen_inserted);
+	input_sync(wacom_data->input_dev);
+
+	if (!wacom_data->pen_inserted && !regulator_is_enabled(wacom_data->regul=
ator)) {
+		ret =3D regulator_enable(wacom_data->regulator);
+		if (ret) {
+			dev_err(dev, "Failed to enable regulators: %d\n", ret);
+			return IRQ_HANDLED;
+		}
+		msleep(200);
+		enable_irq(wacom_data->irq);
+	} else if (wacom_data->pen_inserted && regulator_is_enabled(wacom_data->=
regulator)) {
+		disable_irq(wacom_data->irq);
+		regulator_disable(wacom_data->regulator);
+	}
+
+	dev_dbg(dev, "Pen inserted changed to %d", wacom_data->pen_inserted);
+
+	return IRQ_HANDLED;
+}
+
+static int wacom_w9000_open(struct input_dev *dev)
+{
+	struct wacom_w9000_data *wacom_data =3D input_get_drvdata(dev);
+	int ret;
+
+	if (!wacom_data->pen_inserted && !regulator_is_enabled(wacom_data->regul=
ator)) {
+		ret =3D regulator_enable(wacom_data->regulator);
+		if (ret) {
+			dev_err(&wacom_data->client->dev, "Failed to enable regulators: %d\n",
+				ret);
+			return ret;
+		}
+		msleep(200);
+		enable_irq(wacom_data->irq);
+	}
+	return 0;
+}
+
+static void wacom_w9000_close(struct input_dev *dev)
+{
+	struct wacom_w9000_data *wacom_data =3D input_get_drvdata(dev);
+
+	if (regulator_is_enabled(wacom_data->regulator)) {
+		disable_irq(wacom_data->irq);
+		regulator_disable(wacom_data->regulator);
+	}
+}
+
+static int wacom_w9000_probe(struct i2c_client *client)
+{
+	struct device *dev =3D &client->dev;
+	struct wacom_w9000_data *wacom_data;
+	struct input_dev *input_dev;
+	int ret;
+	u32 val;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_err(dev, "i2c_check_functionality error\n");
+		return -EIO;
+	}
+
+	wacom_data =3D devm_kzalloc(dev, sizeof(*wacom_data), GFP_KERNEL);
+	if (!wacom_data)
+		return -ENOMEM;
+
+	wacom_data->variant =3D i2c_get_match_data(client);
+
+	wacom_data->client =3D client;
+
+	input_dev =3D devm_input_allocate_device(dev);
+	if (!input_dev)
+		return -ENOMEM;
+	wacom_data->input_dev =3D input_dev;
+
+	wacom_data->irq =3D client->irq;
+	i2c_set_clientdata(client, wacom_data);
+
+	wacom_data->regulator =3D devm_regulator_get(dev, "vdd");
+	if (IS_ERR(wacom_data->regulator))
+		return dev_err_probe(dev, PTR_ERR(wacom_data->regulator),
+				     "Failed to get regulators\n");
+
+	wacom_data->flash_mode_gpio =3D devm_gpiod_get_optional(dev, "flash-mode=
", GPIOD_OUT_LOW);
+	if (IS_ERR(wacom_data->flash_mode_gpio))
+		return dev_err_probe(dev, PTR_ERR(wacom_data->flash_mode_gpio),
+				     "Failed to get flash-mode gpio\n");
+
+	wacom_data->pen_inserted_gpio =3D devm_gpiod_get_optional(dev, "pen-inse=
rted", GPIOD_IN);
+	if (IS_ERR(wacom_data->pen_inserted_gpio))
+		return dev_err_probe(dev, PTR_ERR(wacom_data->pen_inserted_gpio),
+				     "Failed to get pen-insert gpio\n");
+
+	ret =3D regulator_enable(wacom_data->regulator);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable regulators\n");
+
+	msleep(200);
+
+	ret =3D wacom_w9000_query(wacom_data);
+	if (ret)
+		goto err_disable_regulators;
+
+	input_dev->name =3D wacom_data->variant->name;
+	input_dev->id.bustype =3D BUS_I2C;
+	input_dev->dev.parent =3D dev;
+	input_dev->id.vendor =3D 0x56a;
+	input_dev->id.version =3D wacom_data->fw_version;
+	input_dev->open =3D wacom_w9000_open;
+	input_dev->close =3D wacom_w9000_close;
+
+	input_set_capability(input_dev, EV_KEY, BTN_TOUCH);
+	input_set_capability(input_dev, EV_KEY, BTN_TOOL_PEN);
+	input_set_capability(input_dev, EV_KEY, BTN_TOOL_RUBBER);
+	input_set_capability(input_dev, EV_KEY, BTN_STYLUS);
+
+	// Calculate x and y resolution from size in devicetree
+	ret =3D device_property_read_u32(dev, "touchscreen-x-mm", &val);
+	if (ret)
+		input_abs_set_res(input_dev, ABS_X, 100);
+	else
+		input_abs_set_res(input_dev, ABS_X, wacom_data->prop.max_x / val);
+	ret =3D device_property_read_u32(dev, "touchscreen-y-mm", &val);
+	if (ret)
+		input_abs_set_res(input_dev, ABS_Y, 100);
+	else
+		input_abs_set_res(input_dev, ABS_Y, wacom_data->prop.max_y / val);
+
+	input_set_abs_params(input_dev, ABS_X, 0, wacom_data->prop.max_x, 4, 0);
+	input_set_abs_params(input_dev, ABS_Y, 0, wacom_data->prop.max_y, 4, 0);
+	input_set_abs_params(input_dev, ABS_PRESSURE, 0, wacom_data->max_pressur=
e, 0, 0);
+	input_set_abs_params(input_dev, ABS_DISTANCE, 0, 255, 0, 0);
+
+	touchscreen_parse_properties(input_dev, false, &wacom_data->prop);
+
+	ret =3D devm_request_threaded_irq(dev, wacom_data->irq, NULL, wacom_w900=
0_interrupt,
+					IRQF_ONESHOT | IRQF_NO_AUTOEN, client->name, wacom_data);
+	if (ret) {
+		dev_err(dev, "Failed to register interrupt\n");
+		goto err_disable_regulators;
+	}
+
+	if (wacom_data->pen_inserted_gpio) {
+		input_set_capability(input_dev, EV_SW, SW_PEN_INSERTED);
+		wacom_data->pen_insert_irq =3D gpiod_to_irq(wacom_data->pen_inserted_gp=
io);
+		ret =3D devm_request_threaded_irq(dev, wacom_data->pen_insert_irq, NULL=
,
+						wacom_w9000_interrupt_pen_insert, IRQF_ONESHOT |
+						IRQF_NO_AUTOEN | IRQF_TRIGGER_RISING |
+						IRQF_TRIGGER_FALLING, "wacom_pen_insert",
+						wacom_data);
+		if (ret) {
+			dev_err(dev, "Failed to register pen-insert interrupt\n");
+			goto err_disable_regulators;
+		}
+
+		wacom_data->pen_inserted =3D gpiod_get_value(wacom_data->pen_inserted_g=
pio);
+		if (wacom_data->pen_inserted)
+			regulator_disable(wacom_data->regulator);
+		else
+			enable_irq(wacom_data->irq);
+	} else {
+		enable_irq(wacom_data->irq);
+	}
+
+	input_set_drvdata(input_dev, wacom_data);
+
+	input_report_switch(wacom_data->input_dev, SW_PEN_INSERTED, wacom_data->=
pen_inserted);
+	input_sync(wacom_data->input_dev);
+
+	if (wacom_data->pen_inserted_gpio)
+		enable_irq(wacom_data->pen_insert_irq);
+
+	ret =3D input_register_device(wacom_data->input_dev);
+	if (ret) {
+		dev_err(dev, "Failed to register input device: %d\n", ret);
+		goto err_disable_regulators;
+	}
+
+	return 0;
+
+err_disable_regulators:
+	regulator_disable(wacom_data->regulator);
+	return ret;
+}
+
+static void wacom_w9000_remove(struct i2c_client *client)
+{
+	struct wacom_w9000_data *wacom_data =3D i2c_get_clientdata(client);
+
+	if (regulator_is_enabled(wacom_data->regulator))
+		regulator_disable(wacom_data->regulator);
+}
+
+static int wacom_w9000_suspend(struct device *dev)
+{
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct wacom_w9000_data *wacom_data =3D i2c_get_clientdata(client);
+	struct input_dev *input_dev =3D wacom_data->input_dev;
+
+	mutex_lock(&input_dev->mutex);
+
+	if (regulator_is_enabled(wacom_data->regulator)) {
+		disable_irq(wacom_data->irq);
+		regulator_disable(wacom_data->regulator);
+	}
+
+	mutex_unlock(&input_dev->mutex);
+
+	return 0;
+}
+
+static int wacom_w9000_resume(struct device *dev)
+{
+	struct i2c_client *client =3D to_i2c_client(dev);
+	struct wacom_w9000_data *wacom_data =3D i2c_get_clientdata(client);
+	struct input_dev *input_dev =3D wacom_data->input_dev;
+	int ret =3D 0;
+
+	mutex_lock(&input_dev->mutex);
+
+	if (!wacom_data->pen_inserted && !regulator_is_enabled(wacom_data->regul=
ator)) {
+		ret =3D regulator_enable(wacom_data->regulator);
+		if (ret) {
+			dev_err(&wacom_data->client->dev, "Failed to enable regulators: %d\n",
+				ret);
+		} else {
+			msleep(200);
+			enable_irq(wacom_data->irq);
+		}
+	}
+
+	mutex_unlock(&input_dev->mutex);
+
+	return ret;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(wacom_w9000_pm, wacom_w9000_suspend, waco=
m_w9000_resume);
+
+static const struct wacom_w9000_variant w9007a_lt03 =3D {
+	.com_coord_num	=3D 8,
+	.com_query_num	=3D 9,
+	.name =3D "Wacom W9007 LT03 Digitizer",
+};
+
+static const struct wacom_w9000_variant w9007a_v1 =3D {
+	.com_coord_num	=3D 12,
+	.com_query_num	=3D 9,
+	.name =3D "Wacom W9007 V1 Digitizer",
+};
+
+static const struct of_device_id wacom_w9000_of_match[] =3D {
+	{ .compatible =3D "wacom,w9007a-lt03", .data =3D &w9007a_lt03, },
+	{ .compatible =3D "wacom,w9007a-v1", .data =3D &w9007a_v1, },
+	{},
+};
+MODULE_DEVICE_TABLE(of, wacom_w9000_of_match);
+
+static const struct i2c_device_id wacom_w9000_id[] =3D {
+	{ .name =3D "w9007a-lt03", .driver_data =3D (kernel_ulong_t)&w9007a_lt03=
 },
+	{ .name =3D "w9007a-v1", .driver_data =3D (kernel_ulong_t)&w9007a_v1 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, wacom_w9000_id);
+
+static struct i2c_driver wacom_w9000_driver =3D {
+	.driver =3D {
+		.name	=3D "wacom_w9000",
+		.of_match_table =3D wacom_w9000_of_match,
+		.pm	=3D pm_sleep_ptr(&wacom_w9000_pm),
+	},
+	.probe		=3D wacom_w9000_probe,
+	.remove		=3D wacom_w9000_remove,
+	.id_table	=3D wacom_w9000_id,
+};
+module_i2c_driver(wacom_w9000_driver);
+
+/* Module information */
+MODULE_AUTHOR("Hendrik Noack <hendrik-noack@gmx.de>");
+MODULE_DESCRIPTION("Wacom W9000-series penabled touchscreen driver");
+MODULE_LICENSE("GPL");
=2D-=20
2.43.0


