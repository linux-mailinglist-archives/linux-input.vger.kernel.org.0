Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCBE35E1D0
	for <lists+linux-input@lfdr.de>; Tue, 13 Apr 2021 16:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344913AbhDMOpT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Apr 2021 10:45:19 -0400
Received: from smtpcmd15177.aruba.it ([62.149.156.177]:46494 "EHLO
        smtpcmd15177.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344744AbhDMOpP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Apr 2021 10:45:15 -0400
Received: from ubuntu.localdomain ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id WKHXlmrLILwkNWKHZlJXu3; Tue, 13 Apr 2021 16:44:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1618325089; bh=McrV4uq/FwaRzcRI4pGPekFqSZXDjpsYiMuLHnfBDUY=;
        h=From:To:Subject:Date:MIME-Version:Content-Type;
        b=jQubukGYsX/UmD+A+50/tEUJ0FT/JE6eSTB/oO2Som/F+cEzAKxeBNgsIu/KFXGrT
         8DASEJLd2gfgUP+8r12by5qdBp9my9hU7oQfWr1cIRBdGrCbN31ihIquD0CErCuUya
         VhfEgsc/X2tCQ4i48RwST/CQSkOcTR5EjUrd/0Iyqi/ryoN7E2H6y/MgiV9AoI58vW
         Da281FK6wpUBmxdT15fj2o+4w0VOhZzFlVnc7ktCZAYbNGCI8rkMFHHKG+ZhUOKQ/Q
         gX14xVvuQJHgmbGm+K0E9DeqBN0y/dmv79KoPTT0gVapopyLsPloC+SfdWVOUHAsyi
         1PDYZKTNp0VSg==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: [PATCH v7 3/3] Input: add driver for the Hycon HY46XX touchpanel series
Date:   Tue, 13 Apr 2021 16:44:46 +0200
Message-Id: <20210413144446.2277817-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413144446.2277817-1-giulio.benetti@benettiengineering.com>
References: <CAL_JsqK6Bm==DaCMD3PruZoFO9iv0Te_KBVPnb9ZU0L8yDYF5Q@mail.gmail.com>
 <20210413144446.2277817-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfE8wZGv3MBqoMApu0NukcYI2Ko/+zltVFuSpAc4yQiVTE8WU12ZDI+iU49dl6VOzWVG+zb0lSKflTwZSM0o5SO1nbsW/wk7U+KTTZzXLKEXYjjarnDUJ
 SsM1QcaEheShYQdS2SjdbQXmX0KpAhdYCNfxstslQv0ruanQXQW0g4iTu/ICczzrFW7f3DW+ohrPjaVIU0or/UBl9V2vVn0qeavo+Q2CqOqmRaZ4cFjXouuA
 IDEZ/WTTczx3VZslEpIc2j7RN8oMOMpS70jb2j3nVMF+1W9kT5jYLsGGQB3gAuweBr9xkS7MGRj12LpHV9j719mxrmlQ2fo79mHXneJb9tJeilKLZ8jui6k9
 /yIqjGgSGfSlL1514qs8Kmr7gQQTGvYUTftJJ3e1i+Y9znOK8DVdbSPGA9+Yd5GR62WutajjHviRI+Y6yekjYR1QSkIH4w5d1WJGj7P0CzTPLkCVYa7Hhlwq
 Y1dJhamIsnMf9Cg/JByDIMUCltiwNIAxmQikZg==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for Hycon HY46XX.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* removed proximity-sensor-switch property according to previous patch
As suggested by Dmitry Torokhov
* moved i2c communaction to regmap use
* added macro to avoid magic number
* removed cmd variable that could uninitiliazed since we're using regmap now
* removed useless byte masking
* removed useless struct hycon_hy46xx_i2c_chip_data
* used IRQF_ONESHOT only for isr
V2->V3:
As suggested by Jonathan Neuschäfer:
* fixed Kconfig description
* fixed DT properties by preprending "hycon,"
* changed MODULE_AUTHOR() e-mail according to SoB and authorship
V4->V5:
As suggested by Rob Herring according to dt-bindings:
* drop hycon- prefix from compatible
* change hycon,power-noise-enable property name to hycon,noise-filter-enable
  and change power_noise_enable variable name to noise_filter_enable
V5->V6:
* changed report-speed property name into report-speed-hz according to
Rob Herring's suggestion
---
 MAINTAINERS                              |   1 +
 drivers/input/touchscreen/Kconfig        |  11 +
 drivers/input/touchscreen/Makefile       |   1 +
 drivers/input/touchscreen/hycon-hy46xx.c | 591 +++++++++++++++++++++++
 4 files changed, 604 insertions(+)
 create mode 100644 drivers/input/touchscreen/hycon-hy46xx.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 18a50942c019..588ca21cfc09 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8255,6 +8255,7 @@ M:	Giulio Benetti <giulio.benetti@benettiengineering.com>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
+F:	drivers/input/touchscreen/hy46xx.c
 
 HYGON PROCESSOR SUPPORT
 M:	Pu Wen <puwen@hygon.cn>
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 529614d364fe..fe1468b74530 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -1335,4 +1335,15 @@ config TOUCHSCREEN_ZINITIX
 	  To compile this driver as a module, choose M here: the
 	  module will be called zinitix.
 
+config TOUCHSCREEN_HYCON_HY46XX
+	tristate "Hycon hy46xx touchscreen support"
+	depends on I2C
+	help
+	  Say Y here if you have a touchscreen using Hycon hy46xx
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called hycon-hy46xx.
+
 endif
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 6233541e9173..8b68cf3a3e6d 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -112,3 +112,4 @@ obj-$(CONFIG_TOUCHSCREEN_ROHM_BU21023)	+= rohm_bu21023.o
 obj-$(CONFIG_TOUCHSCREEN_RASPBERRYPI_FW)	+= raspberrypi-ts.o
 obj-$(CONFIG_TOUCHSCREEN_IQS5XX)	+= iqs5xx.o
 obj-$(CONFIG_TOUCHSCREEN_ZINITIX)	+= zinitix.o
+obj-$(CONFIG_TOUCHSCREEN_HYCON_HY46XX)	+= hycon-hy46xx.o
diff --git a/drivers/input/touchscreen/hycon-hy46xx.c b/drivers/input/touchscreen/hycon-hy46xx.c
new file mode 100644
index 000000000000..4afc88dd0293
--- /dev/null
+++ b/drivers/input/touchscreen/hycon-hy46xx.c
@@ -0,0 +1,591 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021
+ * Author(s): Giulio Benetti <giulio.benetti@benettiengineering.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/irq.h>
+#include <linux/regulator/consumer.h>
+#include <linux/regmap.h>
+
+#include <asm/unaligned.h>
+
+#define HY46XX_CHKSUM_CODE		0x1
+#define HY46XX_FINGER_NUM		0x2
+#define HY46XX_CHKSUM_LEN		0x7
+#define HY46XX_THRESHOLD		0x80
+#define HY46XX_GLOVE_EN			0x84
+#define HY46XX_REPORT_SPEED		0x88
+#define HY46XX_PWR_NOISE_EN		0x89
+#define HY46XX_FILTER_DATA		0x8A
+#define HY46XX_GAIN			0x92
+#define HY46XX_EDGE_OFFSET		0x93
+#define HY46XX_RX_NR_USED		0x94
+#define HY46XX_TX_NR_USED		0x95
+#define HY46XX_PWR_MODE			0xA5
+#define HY46XX_FW_VERSION		0xA6
+#define HY46XX_LIB_VERSION		0xA7
+#define HY46XX_TP_INFO			0xA8
+#define HY46XX_TP_CHIP_ID		0xA9
+#define HY46XX_BOOT_VER			0xB0
+
+#define HY46XX_TPLEN			0x6
+#define HY46XX_REPORT_PKT_LEN		0x44
+
+#define HY46XX_MAX_SUPPORTED_POINTS	11
+
+#define TOUCH_EVENT_DOWN		0x00
+#define TOUCH_EVENT_UP			0x01
+#define TOUCH_EVENT_CONTACT		0x02
+#define TOUCH_EVENT_RESERVED		0x03
+
+struct hycon_hy46xx_data {
+	struct i2c_client *client;
+	struct input_dev *input;
+	struct touchscreen_properties prop;
+	struct regulator *vcc;
+
+	struct gpio_desc *reset_gpio;
+
+	struct mutex mutex;
+	struct regmap *regmap;
+
+	int threshold;
+	bool glove_enable;
+	int report_speed;
+	bool noise_filter_enable;
+	int filter_data;
+	int gain;
+	int edge_offset;
+	int rx_number_used;
+	int tx_number_used;
+	int power_mode;
+	int fw_version;
+	int lib_version;
+	int tp_information;
+	int tp_chip_id;
+	int bootloader_version;
+};
+
+static const struct regmap_config hycon_hy46xx_i2c_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+};
+
+static bool hycon_hy46xx_check_checksum(struct hycon_hy46xx_data *tsdata, u8 *buf)
+{
+	u8 chksum = 0;
+	int i;
+
+	for (i = 2; i < buf[HY46XX_CHKSUM_LEN]; i++)
+		chksum += buf[i];
+
+	if (chksum == buf[HY46XX_CHKSUM_CODE])
+		return true;
+
+	dev_err_ratelimited(&tsdata->client->dev,
+			    "checksum error: 0x%02x expected, got 0x%02x\n",
+			    chksum, buf[HY46XX_CHKSUM_CODE]);
+
+	return false;
+}
+
+static irqreturn_t hycon_hy46xx_isr(int irq, void *dev_id)
+{
+	struct hycon_hy46xx_data *tsdata = dev_id;
+	struct device *dev = &tsdata->client->dev;
+	u8 rdbuf[HY46XX_REPORT_PKT_LEN];
+	int i, x, y, id;
+	int error;
+
+	memset(rdbuf, 0, sizeof(rdbuf));
+
+	error = regmap_bulk_read(tsdata->regmap, 0, rdbuf, sizeof(rdbuf));
+	if (error) {
+		dev_err_ratelimited(dev, "Unable to fetch data, error: %d\n",
+				    error);
+		goto out;
+	}
+
+	if (!hycon_hy46xx_check_checksum(tsdata, rdbuf))
+		goto out;
+
+	for (i = 0; i < HY46XX_MAX_SUPPORTED_POINTS; i++) {
+		u8 *buf = &rdbuf[3 + (HY46XX_TPLEN * i)];
+		int type = buf[0] >> 6;
+
+		if (type == TOUCH_EVENT_RESERVED)
+			continue;
+
+		x = get_unaligned_be16(buf) & 0x0fff;
+		y = get_unaligned_be16(buf + 2) & 0x0fff;
+
+		id = buf[2] >> 4;
+
+		input_mt_slot(tsdata->input, id);
+		if (input_mt_report_slot_state(tsdata->input, MT_TOOL_FINGER,
+					       type != TOUCH_EVENT_UP))
+			touchscreen_report_pos(tsdata->input, &tsdata->prop,
+					       x, y, true);
+	}
+
+	input_mt_report_pointer_emulation(tsdata->input, true);
+	input_sync(tsdata->input);
+
+out:
+	return IRQ_HANDLED;
+}
+
+struct hycon_hy46xx_attribute {
+	struct device_attribute dattr;
+	size_t field_offset;
+	u8 address;
+	u8 limit_low;
+	u8 limit_high;
+};
+
+#define HYCON_ATTR_U8(_field, _mode, _address, _limit_low, _limit_high)	\
+	struct hycon_hy46xx_attribute hycon_hy46xx_attr_##_field = {		\
+		.dattr = __ATTR(_field, _mode,				\
+				hycon_hy46xx_setting_show,			\
+				hycon_hy46xx_setting_store),			\
+		.field_offset = offsetof(struct hycon_hy46xx_data, _field),	\
+		.address = _address,					\
+		.limit_low = _limit_low,				\
+		.limit_high = _limit_high,				\
+	}
+
+#define HYCON_ATTR_BOOL(_field, _mode, _address)			\
+	struct hycon_hy46xx_attribute hycon_hy46xx_attr_##_field = {		\
+		.dattr = __ATTR(_field, _mode,				\
+				hycon_hy46xx_setting_show,			\
+				hycon_hy46xx_setting_store),			\
+		.field_offset = offsetof(struct hycon_hy46xx_data, _field),	\
+		.address = _address,					\
+		.limit_low = false,					\
+		.limit_high = true,					\
+	}
+
+static ssize_t hycon_hy46xx_setting_show(struct device *dev,
+				   struct device_attribute *dattr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct hycon_hy46xx_data *tsdata = i2c_get_clientdata(client);
+	struct hycon_hy46xx_attribute *attr =
+			container_of(dattr, struct hycon_hy46xx_attribute, dattr);
+	u8 *field = (u8 *)tsdata + attr->field_offset;
+	size_t count = 0;
+	int error = 0;
+	int val;
+
+	mutex_lock(&tsdata->mutex);
+
+	error = regmap_read(tsdata->regmap, attr->address, &val);
+	if (error < 0) {
+		dev_err(&tsdata->client->dev,
+			"Failed to fetch attribute %s, error %d\n",
+			dattr->attr.name, error);
+		goto out;
+	}
+
+	if (val != *field) {
+		dev_warn(&tsdata->client->dev,
+			 "%s: read (%d) and stored value (%d) differ\n",
+			 dattr->attr.name, val, *field);
+		*field = val;
+	}
+
+	count = scnprintf(buf, PAGE_SIZE, "%d\n", val);
+
+out:
+	mutex_unlock(&tsdata->mutex);
+	return error ?: count;
+}
+
+static ssize_t hycon_hy46xx_setting_store(struct device *dev,
+					struct device_attribute *dattr,
+					const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct hycon_hy46xx_data *tsdata = i2c_get_clientdata(client);
+	struct hycon_hy46xx_attribute *attr =
+			container_of(dattr, struct hycon_hy46xx_attribute, dattr);
+	u8 *field = (u8 *)tsdata + attr->field_offset;
+	unsigned int val;
+	int error;
+
+	mutex_lock(&tsdata->mutex);
+
+	error = kstrtouint(buf, 0, &val);
+	if (error)
+		goto out;
+
+	if (val < attr->limit_low || val > attr->limit_high) {
+		error = -ERANGE;
+		goto out;
+	}
+
+	error = regmap_write(tsdata->regmap, attr->address, val);
+	if (error < 0) {
+		dev_err(&tsdata->client->dev,
+			"Failed to update attribute %s, error: %d\n",
+			dattr->attr.name, error);
+		goto out;
+	}
+	*field = val;
+
+out:
+	mutex_unlock(&tsdata->mutex);
+	return error ?: count;
+}
+
+static HYCON_ATTR_U8(threshold, 0644, HY46XX_THRESHOLD, 0, 255);
+static HYCON_ATTR_BOOL(glove_enable, 0644, HY46XX_GLOVE_EN);
+static HYCON_ATTR_U8(report_speed, 0644, HY46XX_REPORT_SPEED, 0, 255);
+static HYCON_ATTR_BOOL(noise_filter_enable, 0644, HY46XX_PWR_NOISE_EN);
+static HYCON_ATTR_U8(filter_data, 0644, HY46XX_FILTER_DATA, 0, 5);
+static HYCON_ATTR_U8(gain, 0644, HY46XX_GAIN, 0, 5);
+static HYCON_ATTR_U8(edge_offset, 0644, HY46XX_EDGE_OFFSET, 0, 5);
+static HYCON_ATTR_U8(fw_version, 0444, HY46XX_FW_VERSION, 0, 255);
+static HYCON_ATTR_U8(lib_version, 0444, HY46XX_LIB_VERSION, 0, 255);
+static HYCON_ATTR_U8(tp_information, 0444, HY46XX_TP_INFO, 0, 255);
+static HYCON_ATTR_U8(tp_chip_id, 0444, HY46XX_TP_CHIP_ID, 0, 255);
+static HYCON_ATTR_U8(bootloader_version, 0444, HY46XX_BOOT_VER, 0, 255);
+
+static struct attribute *hycon_hy46xx_attrs[] = {
+	&hycon_hy46xx_attr_threshold.dattr.attr,
+	&hycon_hy46xx_attr_glove_enable.dattr.attr,
+	&hycon_hy46xx_attr_report_speed.dattr.attr,
+	&hycon_hy46xx_attr_noise_filter_enable.dattr.attr,
+	&hycon_hy46xx_attr_filter_data.dattr.attr,
+	&hycon_hy46xx_attr_gain.dattr.attr,
+	&hycon_hy46xx_attr_edge_offset.dattr.attr,
+	&hycon_hy46xx_attr_fw_version.dattr.attr,
+	&hycon_hy46xx_attr_lib_version.dattr.attr,
+	&hycon_hy46xx_attr_tp_information.dattr.attr,
+	&hycon_hy46xx_attr_tp_chip_id.dattr.attr,
+	&hycon_hy46xx_attr_bootloader_version.dattr.attr,
+	NULL
+};
+
+static const struct attribute_group hycon_hy46xx_attr_group = {
+	.attrs = hycon_hy46xx_attrs,
+};
+
+static void hycon_hy46xx_get_defaults(struct device *dev, struct hycon_hy46xx_data *tsdata)
+{
+	bool val_bool;
+	int error;
+	u32 val;
+
+	error = device_property_read_u32(dev, "hycon,threshold", &val);
+	if (!error) {
+		error = regmap_write(tsdata->regmap, HY46XX_THRESHOLD, val);
+		if (error < 0)
+			goto out;
+
+		tsdata->threshold = val;
+	}
+
+	val_bool = device_property_read_bool(dev, "hycon,glove-enable");
+	error = regmap_write(tsdata->regmap, HY46XX_GLOVE_EN, val_bool);
+	if (error < 0)
+		goto out;
+	tsdata->glove_enable = val_bool;
+
+	error = device_property_read_u32(dev, "hycon,report-speed-hz", &val);
+	if (!error) {
+		error = regmap_write(tsdata->regmap, HY46XX_REPORT_SPEED, val);
+		if (error < 0)
+			goto out;
+
+		tsdata->report_speed = val;
+	}
+
+	val_bool = device_property_read_bool(dev, "hycon,noise-filter-enable");
+	error = regmap_write(tsdata->regmap, HY46XX_PWR_NOISE_EN, val_bool);
+	if (error < 0)
+		goto out;
+	tsdata->noise_filter_enable = val_bool;
+
+	error = device_property_read_u32(dev, "hycon,filter-data", &val);
+	if (!error) {
+		error = regmap_write(tsdata->regmap, HY46XX_FILTER_DATA, val);
+		if (error < 0)
+			goto out;
+
+		tsdata->filter_data = val;
+	}
+
+	error = device_property_read_u32(dev, "hycon,gain", &val);
+	if (!error) {
+		error = regmap_write(tsdata->regmap, HY46XX_GAIN, val);
+		if (error < 0)
+			goto out;
+
+		tsdata->gain = val;
+	}
+
+	error = device_property_read_u32(dev, "hycon,edge-offset", &val);
+	if (!error) {
+		error = regmap_write(tsdata->regmap, HY46XX_EDGE_OFFSET, val);
+		if (error < 0)
+			goto out;
+
+		tsdata->edge_offset = val;
+	}
+
+	return;
+out:
+	dev_err(&tsdata->client->dev, "Failed to set default settings");
+}
+
+static void hycon_hy46xx_get_parameters(struct hycon_hy46xx_data *tsdata)
+{
+	int error;
+	u32 val;
+
+	error = regmap_read(tsdata->regmap, HY46XX_THRESHOLD, &val);
+	if (error < 0)
+		goto out;
+	tsdata->threshold = val;
+
+	error = regmap_read(tsdata->regmap, HY46XX_GLOVE_EN, &val);
+	if (error < 0)
+		goto out;
+	tsdata->glove_enable = val;
+
+	error = regmap_read(tsdata->regmap, HY46XX_REPORT_SPEED, &val);
+	if (error < 0)
+		goto out;
+	tsdata->report_speed = val;
+
+	error = regmap_read(tsdata->regmap, HY46XX_PWR_NOISE_EN, &val);
+	if (error < 0)
+		goto out;
+	tsdata->noise_filter_enable = val;
+
+	error = regmap_read(tsdata->regmap, HY46XX_FILTER_DATA, &val);
+	if (error < 0)
+		goto out;
+	tsdata->filter_data = val;
+
+	error = regmap_read(tsdata->regmap, HY46XX_GAIN, &val);
+	if (error < 0)
+		goto out;
+	tsdata->gain = val;
+
+	error = regmap_read(tsdata->regmap, HY46XX_EDGE_OFFSET, &val);
+	if (error < 0)
+		goto out;
+	tsdata->edge_offset = val;
+
+	error = regmap_read(tsdata->regmap, HY46XX_RX_NR_USED, &val);
+	if (error < 0)
+		goto out;
+	tsdata->rx_number_used = val;
+
+	error = regmap_read(tsdata->regmap, HY46XX_TX_NR_USED, &val);
+	if (error < 0)
+		goto out;
+	tsdata->tx_number_used = val;
+
+	error = regmap_read(tsdata->regmap, HY46XX_PWR_MODE, &val);
+	if (error < 0)
+		goto out;
+	tsdata->power_mode = val;
+
+	error = regmap_read(tsdata->regmap, HY46XX_FW_VERSION, &val);
+	if (error < 0)
+		goto out;
+	tsdata->fw_version = val;
+
+	error = regmap_read(tsdata->regmap, HY46XX_LIB_VERSION, &val);
+	if (error < 0)
+		goto out;
+	tsdata->lib_version = val;
+
+	error = regmap_read(tsdata->regmap, HY46XX_TP_INFO, &val);
+	if (error < 0)
+		goto out;
+	tsdata->tp_information = val;
+
+	error = regmap_read(tsdata->regmap, HY46XX_TP_CHIP_ID, &val);
+	if (error < 0)
+		goto out;
+	tsdata->tp_chip_id = val;
+
+	error = regmap_read(tsdata->regmap, HY46XX_BOOT_VER, &val);
+	if (error < 0)
+		goto out;
+	tsdata->bootloader_version = val;
+
+	return;
+out:
+	dev_err(&tsdata->client->dev, "Failed to read default settings");
+}
+
+static void hycon_hy46xx_disable_regulator(void *arg)
+{
+	struct hycon_hy46xx_data *data = arg;
+
+	regulator_disable(data->vcc);
+}
+
+static int hycon_hy46xx_probe(struct i2c_client *client,
+					 const struct i2c_device_id *id)
+{
+	struct hycon_hy46xx_data *tsdata;
+	struct input_dev *input;
+	int error;
+
+	dev_dbg(&client->dev, "probing for HYCON HY46XX I2C\n");
+
+	tsdata = devm_kzalloc(&client->dev, sizeof(*tsdata), GFP_KERNEL);
+	if (!tsdata)
+		return -ENOMEM;
+
+	tsdata->vcc = devm_regulator_get(&client->dev, "vcc");
+	if (IS_ERR(tsdata->vcc)) {
+		error = PTR_ERR(tsdata->vcc);
+		if (error != -EPROBE_DEFER)
+			dev_err(&client->dev,
+				"failed to request regulator: %d\n", error);
+		return error;
+	}
+
+	error = regulator_enable(tsdata->vcc);
+	if (error < 0) {
+		dev_err(&client->dev, "failed to enable vcc: %d\n", error);
+		return error;
+	}
+
+	error = devm_add_action_or_reset(&client->dev,
+					 hycon_hy46xx_disable_regulator,
+					 tsdata);
+	if (error)
+		return error;
+
+	tsdata->reset_gpio = devm_gpiod_get_optional(&client->dev,
+						     "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(tsdata->reset_gpio)) {
+		error = PTR_ERR(tsdata->reset_gpio);
+		dev_err(&client->dev,
+			"Failed to request GPIO reset pin, error %d\n", error);
+		return error;
+	}
+
+	if (tsdata->reset_gpio) {
+		usleep_range(5000, 6000);
+		gpiod_set_value_cansleep(tsdata->reset_gpio, 1);
+		usleep_range(5000, 6000);
+		gpiod_set_value_cansleep(tsdata->reset_gpio, 0);
+		msleep(1000);
+	}
+
+	input = devm_input_allocate_device(&client->dev);
+	if (!input) {
+		dev_err(&client->dev, "failed to allocate input device.\n");
+		return -ENOMEM;
+	}
+
+	mutex_init(&tsdata->mutex);
+	tsdata->client = client;
+	tsdata->input = input;
+
+	tsdata->regmap = devm_regmap_init_i2c(client,
+					      &hycon_hy46xx_i2c_regmap_config);
+	if (IS_ERR(tsdata->regmap)) {
+		dev_err(&client->dev, "regmap allocation failed\n");
+		return PTR_ERR(tsdata->regmap);
+	}
+
+	hycon_hy46xx_get_defaults(&client->dev, tsdata);
+	hycon_hy46xx_get_parameters(tsdata);
+
+	input->name = "Hycon Capacitive Touch";
+	input->id.bustype = BUS_I2C;
+	input->dev.parent = &client->dev;
+
+	input_set_abs_params(input, ABS_MT_POSITION_X, 0, -1, 0, 0);
+	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, -1, 0, 0);
+
+	touchscreen_parse_properties(input, true, &tsdata->prop);
+
+	error = input_mt_init_slots(input, HY46XX_MAX_SUPPORTED_POINTS,
+				INPUT_MT_DIRECT);
+	if (error) {
+		dev_err(&client->dev, "Unable to init MT slots.\n");
+		return error;
+	}
+
+	i2c_set_clientdata(client, tsdata);
+
+	error = devm_request_threaded_irq(&client->dev, client->irq,
+					  NULL, hycon_hy46xx_isr, IRQF_ONESHOT,
+					  client->name, tsdata);
+	if (error) {
+		dev_err(&client->dev, "Unable to request touchscreen IRQ.\n");
+		return error;
+	}
+
+	error = devm_device_add_group(&client->dev, &hycon_hy46xx_attr_group);
+	if (error)
+		return error;
+
+	error = input_register_device(input);
+	if (error)
+		return error;
+
+	dev_dbg(&client->dev,
+		"HYCON HY46XX initialized: IRQ %d, Reset pin %d.\n",
+		client->irq,
+		tsdata->reset_gpio ? desc_to_gpio(tsdata->reset_gpio) : -1);
+
+	return 0;
+}
+
+static const struct i2c_device_id hycon_hy46xx_id[] = {
+	{ .name = "hy4613" },
+	{ .name = "hy4614" },
+	{ .name = "hy4621" },
+	{ .name = "hy4623" },
+	{ .name = "hy4633" },
+	{ .name = "hy4635" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, hycon_hy46xx_id);
+
+static const struct of_device_id hycon_hy46xx_of_match[] = {
+	{ .compatible = "hycon,hy4613" },
+	{ .compatible = "hycon,hy4614" },
+	{ .compatible = "hycon,hy4621" },
+	{ .compatible = "hycon,hy4623" },
+	{ .compatible = "hycon,hy4633" },
+	{ .compatible = "hycon,hy4635" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, hycon_hy46xx_of_match);
+
+static struct i2c_driver hycon_hy46xx_driver = {
+	.driver = {
+		.name = "hycon_hy46xx",
+		.of_match_table = hycon_hy46xx_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.id_table = hycon_hy46xx_id,
+	.probe    = hycon_hy46xx_probe,
+};
+
+module_i2c_driver(hycon_hy46xx_driver);
+
+MODULE_AUTHOR("Giulio Benetti <giulio.benetti@benettiengineering.com>");
+MODULE_DESCRIPTION("HYCON HY46XX I2C Touchscreen Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

