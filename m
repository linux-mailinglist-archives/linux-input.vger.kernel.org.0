Return-Path: <linux-input+bounces-16431-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A728C98641
	for <lists+linux-input@lfdr.de>; Mon, 01 Dec 2025 18:01:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 35229342F9E
	for <lists+linux-input@lfdr.de>; Mon,  1 Dec 2025 17:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 603D4336EC2;
	Mon,  1 Dec 2025 17:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b="bMaf6Jh+"
X-Original-To: linux-input@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB1332D0D4;
	Mon,  1 Dec 2025 17:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764608474; cv=none; b=C2JUB4u2WZG6hWJB8ZMjted+/HRKGv/97Q8iWp9drSQSea3OLstKhMN7WPGcaNU2oMN0bSmQ20jhxhb1U84ybNC0sX+G0sZfcFnpF50sIyxuu1B/l6usCPXaZHa3ZoA0dc1Xta1ZlmjfIBGc6muFw2/mGre5cgo8u8DYW9rmbM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764608474; c=relaxed/simple;
	bh=WEFUtLlIl8YQvmJeaiSk1UTLY1wT2AapN+BELZYqYYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZDG6qQj1dBCZ/vOSMD20KfFqVQYcJbzRCGUnhptBSZfH6r6JCrZr/tDGlvu0UOb3iDbEjGcglhH+50wRA2ulYyON3q5pxckLxtsNnzvMjQWqCDZt8F0Q93dZzve5oqTp00JYBg5haTbNg8ie/J7lHM+4pZChwywSPwQJKIUBKCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=hendrik-noack@gmx.de header.b=bMaf6Jh+; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1764608459; x=1765213259; i=hendrik-noack@gmx.de;
	bh=y8T4Eath8KqH3yFWZ09JM5/VctuP4EIhIMwOsBQkbMs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bMaf6Jh+VGpny2AXMl3OYGurr634/m1dUonfgo/mSPZ9Nv9HUU3HH6eZqDWHrm+S
	 KGZefcgDpi0YYGdU00OuymmInm9BWZcEHey6exUnwqWNc6/Xvraryt9lecUApNd9q
	 N7RDgohO2CkKyhb8h84RS6LXAcFoeCHXQXwW9spi55TqzuW+6dThqIdiNF7cbTQLY
	 Fr/iOamJQJkXMu2pZP0IgcxMWTBvcp8h/xeNfrWUXlX6TvsIH8H2U1nvIJfdxNPyD
	 qp2bdKqXOo2DmsJA2t+UBvg927+j7JfI2s6SBI8D4VmCxCGhHohhNBd2bRrUxY5bp
	 yAniVZ8GG7SbWk3V1A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from guguhost.ddns.net ([217.85.36.251]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1OXT-1w60aP3CFn-011w5y; Mon, 01
 Dec 2025 18:00:58 +0100
From: Hendrik Noack <hendrik-noack@gmx.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Hendrik Noack <hendrik-noack@gmx.de>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] Input: Add support for Wacom W9000-series penabled touchscreens
Date: Mon,  1 Dec 2025 18:00:43 +0100
Message-ID: <20251201170047.125307-1-hendrik-noack@gmx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201135552.93540-1-hendrik-noack@gmx.de>
References: <20251201135552.93540-1-hendrik-noack@gmx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FMK6xuKJRwmjVNBJjc6H2CJi+9yddVLqmk7e6o087ZQ1ynIVC9t
 yXAEnWH7EaIEyCvmWG8dusL78i8Q2MWHKu2znYbBNFLU1D/NweBOT/jf18AeqABYCYxhIKV
 jxCe8zm/+y30M393mNCGzTsNgqRTvIhM1/VyQnXoAcHFR1hZdGFOyG82T/uzYYOoTTVYg37
 lBmphf5+YqUjopm8myWCw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BJ8cuwkfpLM=;IiH9NGzANUkShNIiRndtbjWil8Q
 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

Add driver for two Wacom W9007A variants. These are penabled touchscreens
supporting passive Wacom Pens and use I2C.

Signed-off-by: Hendrik Noack <hendrik-noack@gmx.de>
=2D--
 drivers/input/touchscreen/Kconfig       |  12 +
 drivers/input/touchscreen/Makefile      |   1 +
 drivers/input/touchscreen/wacom_w9000.c | 479 ++++++++++++++++++++++++
 3 files changed, 492 insertions(+)
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
index 000000000000..615358db9d03
=2D-- /dev/null
+++ b/drivers/input/touchscreen/wacom_w9000.c
@@ -0,0 +1,479 @@
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


