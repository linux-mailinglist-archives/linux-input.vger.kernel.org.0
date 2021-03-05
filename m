Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5976E32F048
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 17:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231252AbhCEQqM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Mar 2021 11:46:12 -0500
Received: from smtpweb146.aruba.it ([62.149.158.146]:39012 "EHLO
        smtpweb146.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbhCEQps (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Mar 2021 11:45:48 -0500
Received: from ubuntu.localdomain ([146.241.168.111])
        by Aruba Outgoing Smtp  with ESMTPSA
        id IDTPlgHCw1jmzIDTSlCrCG; Fri, 05 Mar 2021 17:38:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1614962327; bh=axAvuLDbyB/hsuKONvASLGiisq8gnhddV3aZrCiB6sI=;
        h=From:To:Subject:Date:MIME-Version;
        b=HhpodNdRzi7S181f/Ue2dOATeYvc0jbBet+7sLr3XOk3RnGmiXWrjJlCfR0DwTm0+
         HHOLLOeK7JtC8l4FKWakyC57slSrDAELfGZxzp8zFK/TWToD1YkjrPXWGvCmC6chqm
         NmTRO0u2zuLbG3cACcqh5NWgsc1x1JceTn+OhjIGE94CHw4rZZqxs1YcMxOtSckd7a
         xjCkmuv3vU1oQEx684Oge9SMYjhcNQ1LTVSnHOxDcGlBUwuEsD6QCNzVvReTxXQG0y
         DSd3zV9tajHJDaDpuS3lCTVEPzMAnr7oIqPS+3HKYp64cyMrXUtRjCvwWb4TqR7H3o
         KSo+UKzURLgIQ==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>
Cc:     Giulio Benetti <giulio.benetti@micronovasrl.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH 3/3] Input: add driver for the Hycon HY46XX touchpanel series
Date:   Fri,  5 Mar 2021 17:38:34 +0100
Message-Id: <20210305163834.70924-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210305163834.70924-1-giulio.benetti@benettiengineering.com>
References: <20210305163834.70924-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfOYSAl7j1gLHOv0xKNyeAlpULsr799GMHDm3fx0OHAJ/F+laC+BHXm3JvrZukuGN+WL3rOscl+vKouJTBrWOVwcpMiT1EUGf80ovtEQGoDK0otuVezRY
 74GaxTMRc6HGsMsD3FfBXTrDdfmpGCg5vEBoOBPCgDumNsk906DiK6cKkxa/U7yTUzUOXAdpvt3LT13gVGeCpRBkcnZ3e6qFRArGtPbWtQRzowCXsxI9eAJ1
 gKjqqfi1kDQ46ee4Hsv9a7q+vKr9MPQSkfbHGjGwmaMzNWaVIJm7rKskWo+W6Wm5cEokd68i8JWL6gVISBF3U+09cwfLZg0fevM+0po4Rm+VhhsZth9Ap0D0
 PdjMfF941pmB+X8SLfIYVdJbGZPDnw==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Giulio Benetti <giulio.benetti@micronovasrl.com>

This patch adds support for Hycon HY46XX.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 MAINTAINERS                              |   1 +
 drivers/input/touchscreen/Kconfig        |  12 +
 drivers/input/touchscreen/Makefile       |   1 +
 drivers/input/touchscreen/hycon-hy46xx.c | 571 +++++++++++++++++++++++
 4 files changed, 585 insertions(+)
 create mode 100644 drivers/input/touchscreen/hycon-hy46xx.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 3f83daf6b2bf..7a1331657e4b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8250,6 +8250,7 @@ M:	Giulio Benetti <giulio.benetti@micronovasrl.com>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.yaml
+F:	drivers/input/touchscreen/hy46xx.c
 
 HYGON PROCESSOR SUPPORT
 M:	Pu Wen <puwen@hygon.cn>
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 529614d364fe..5d4751d901cb 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -1335,4 +1335,16 @@ config TOUCHSCREEN_ZINITIX
 	  To compile this driver as a module, choose M here: the
 	  module will be called zinitix.
 
+config TOUCHSCREEN_HYCON_HY46XX
+	tristate "Hycon hy46xx touchscreen support"
+	depends on I2C
+	help
+	  Say Y here if you have a touchscreen using Hycon hy46xx,
+	  or something similar enough.
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
index 000000000000..ef0dee9a43a9
--- /dev/null
+++ b/drivers/input/touchscreen/hycon-hy46xx.c
@@ -0,0 +1,571 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021
+ * Author(s): Giulio Benetti <giulio.benetti@micronovasrl.com>
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
+
+#include <asm/unaligned.h>
+
+#define HY46XX_CHKSUM_CODE		0x1
+#define HY46XX_FINGER_NUM		0x2
+#define HY46XX_CHKSUM_LEN		0x7
+#define HY46XX_THRESHOLD		0x80
+#define HY46XX_PROX_SENS_SW		0x81
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
+
+	int threshold;
+	int proximity_sensor_switch;
+	int glove_enable;
+	int report_speed;
+	int power_noise_enable;
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
+static int hycon_hy46xx_readwrite(struct i2c_client *client, u16 wr_len, u8 *wr_buf,
+			    u16 rd_len, u8 *rd_buf)
+{
+	struct i2c_msg msgs[2];
+	int i = 0;
+	int ret;
+
+	if (wr_len) {
+		msgs[i].addr  = client->addr;
+		msgs[i].flags = 0;
+		msgs[i].len = wr_len;
+		msgs[i].buf = wr_buf;
+		i++;
+	}
+	if (rd_len) {
+		msgs[i].addr  = client->addr;
+		msgs[i].flags = I2C_M_RD;
+		msgs[i].len = rd_len;
+		msgs[i].buf = rd_buf;
+		i++;
+	}
+
+	ret = i2c_transfer(client->adapter, msgs, i);
+	if (ret < 0)
+		return ret;
+	if (ret != i)
+		return -EIO;
+
+	return 0;
+}
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
+	u8 rdbuf[0x44];
+	u8 cmd;
+	int i, x, y, id;
+	int error;
+
+	memset(rdbuf, 0, sizeof(rdbuf));
+
+	error = hycon_hy46xx_readwrite(tsdata->client, 1, &cmd, sizeof(rdbuf), rdbuf);
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
+		id = (buf[2] >> 4) & 0x0f;
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
+static int hycon_hy46xx_register_write(struct hycon_hy46xx_data *tsdata, u8 addr, u8 value)
+{
+	u8 wrbuf[2];
+
+	wrbuf[0] = addr;
+	wrbuf[1] = value;
+
+	return hycon_hy46xx_readwrite(tsdata->client, 2, wrbuf, 0, NULL);
+}
+
+static int hycon_hy46xx_register_read(struct hycon_hy46xx_data *tsdata, u8 addr)
+{
+	u8 wrbyte, rdbyte;
+	int error;
+
+	wrbyte = addr;
+	error = hycon_hy46xx_readwrite(tsdata->client, 1, &wrbyte, 1, &rdbyte);
+	if (error)
+		return error;
+
+	return rdbyte;
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
+#define HYCON_ATTR(_field, _mode, _address, _limit_low, _limit_high)	\
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
+static ssize_t hycon_hy46xx_setting_show(struct device *dev,
+				   struct device_attribute *dattr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct hycon_hy46xx_data *tsdata = i2c_get_clientdata(client);
+	struct hycon_hy46xx_attribute *attr =
+			container_of(dattr, struct hycon_hy46xx_attribute, dattr);
+	u8 *field = (u8 *)tsdata + attr->field_offset;
+	int val;
+	size_t count = 0;
+	int error = 0;
+	u8 addr = attr->address;
+
+	mutex_lock(&tsdata->mutex);
+
+	val = hycon_hy46xx_register_read(tsdata, addr);
+	if (val < 0) {
+		error = val;
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
+	u8 addr = attr->address;
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
+	error = hycon_hy46xx_register_write(tsdata, addr, val);
+	if (error) {
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
+static HYCON_ATTR(threshold, 0644, HY46XX_THRESHOLD, 0, 255);
+static HYCON_ATTR(proximity_sensor_switch, 0644,  HY46XX_PROX_SENS_SW, 0, 1);
+static HYCON_ATTR(glove_enable, 0644, HY46XX_GLOVE_EN, 0, 1);
+static HYCON_ATTR(report_speed, 0644, HY46XX_REPORT_SPEED, 0, 255);
+static HYCON_ATTR(power_noise_enable, 0644, HY46XX_PWR_NOISE_EN, 0, 1);
+static HYCON_ATTR(filter_data, 0644, HY46XX_FILTER_DATA, 0, 5);
+static HYCON_ATTR(gain, 0644, HY46XX_GAIN, 0, 5);
+static HYCON_ATTR(edge_offset, 0644, HY46XX_EDGE_OFFSET, 0, 5);
+static HYCON_ATTR(fw_version, 0444, HY46XX_FW_VERSION, 0, 255);
+static HYCON_ATTR(lib_version, 0444, HY46XX_LIB_VERSION, 0, 255);
+static HYCON_ATTR(tp_information, 0444, HY46XX_TP_INFO, 0, 255);
+static HYCON_ATTR(tp_chip_id, 0444, HY46XX_TP_CHIP_ID, 0, 255);
+static HYCON_ATTR(bootloader_version, 0444, HY46XX_BOOT_VER, 0, 255);
+
+static struct attribute *hycon_hy46xx_attrs[] = {
+	&hycon_hy46xx_attr_threshold.dattr.attr,
+	&hycon_hy46xx_attr_proximity_sensor_switch.dattr.attr,
+	&hycon_hy46xx_attr_glove_enable.dattr.attr,
+	&hycon_hy46xx_attr_report_speed.dattr.attr,
+	&hycon_hy46xx_attr_power_noise_enable.dattr.attr,
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
+	u32 val;
+	int error;
+
+	error = device_property_read_u32(dev, "threshold", &val);
+	if (!error) {
+		hycon_hy46xx_register_write(tsdata, HY46XX_THRESHOLD, val);
+		tsdata->threshold = val;
+	}
+
+	error = device_property_read_u32(dev, "proximity-sensor-switch", &val);
+	if (!error) {
+		hycon_hy46xx_register_write(tsdata, HY46XX_PROX_SENS_SW, val);
+		tsdata->proximity_sensor_switch = val;
+	}
+
+	error = device_property_read_u32(dev, "glove-enable", &val);
+	if (!error) {
+		hycon_hy46xx_register_write(tsdata, HY46XX_GLOVE_EN, val);
+		tsdata->glove_enable = val;
+	}
+
+	error = device_property_read_u32(dev, "report-speed", &val);
+	if (!error) {
+		hycon_hy46xx_register_write(tsdata, HY46XX_REPORT_SPEED, val);
+		tsdata->report_speed = val;
+	}
+
+	error = device_property_read_u32(dev, "power-noise-enable", &val);
+	if (!error) {
+		hycon_hy46xx_register_write(tsdata, HY46XX_PWR_NOISE_EN, val);
+		tsdata->report_speed = val;
+	}
+
+	error = device_property_read_u32(dev, "filter-data", &val);
+	if (!error) {
+		hycon_hy46xx_register_write(tsdata, HY46XX_FILTER_DATA, val);
+		tsdata->report_speed = val;
+	}
+
+	error = device_property_read_u32(dev, "gain", &val);
+	if (!error) {
+		hycon_hy46xx_register_write(tsdata, HY46XX_GAIN, val);
+		tsdata->report_speed = val;
+	}
+
+	error = device_property_read_u32(dev, "edge-offset", &val);
+	if (!error) {
+		hycon_hy46xx_register_write(tsdata, HY46XX_EDGE_OFFSET, val);
+		tsdata->report_speed = val;
+	}
+}
+
+static void hycon_hy46xx_get_parameters(struct hycon_hy46xx_data *tsdata)
+{
+	tsdata->threshold = hycon_hy46xx_register_read(tsdata, HY46XX_THRESHOLD);
+	tsdata->proximity_sensor_switch =
+		hycon_hy46xx_register_read(tsdata, HY46XX_PROX_SENS_SW);
+	tsdata->glove_enable = hycon_hy46xx_register_read(tsdata, HY46XX_GLOVE_EN);
+	tsdata->report_speed =
+		hycon_hy46xx_register_read(tsdata, HY46XX_REPORT_SPEED);
+	tsdata->power_noise_enable =
+		hycon_hy46xx_register_read(tsdata, HY46XX_PWR_NOISE_EN);
+	tsdata->filter_data = hycon_hy46xx_register_read(tsdata, HY46XX_FILTER_DATA);
+	tsdata->gain = hycon_hy46xx_register_read(tsdata, HY46XX_GAIN);
+	tsdata->edge_offset = hycon_hy46xx_register_read(tsdata, HY46XX_EDGE_OFFSET);
+	tsdata->rx_number_used =
+		hycon_hy46xx_register_read(tsdata, HY46XX_RX_NR_USED);
+	tsdata->tx_number_used =
+		hycon_hy46xx_register_read(tsdata, HY46XX_TX_NR_USED);
+	tsdata->power_mode = hycon_hy46xx_register_read(tsdata, HY46XX_PWR_MODE);
+	tsdata->fw_version = hycon_hy46xx_register_read(tsdata, HY46XX_FW_VERSION);
+	tsdata->lib_version = hycon_hy46xx_register_read(tsdata, HY46XX_LIB_VERSION);
+	tsdata->tp_information = hycon_hy46xx_register_read(tsdata, HY46XX_TP_INFO);
+	tsdata->tp_chip_id = hycon_hy46xx_register_read(tsdata, HY46XX_TP_CHIP_ID);
+	tsdata->bootloader_version =
+		hycon_hy46xx_register_read(tsdata, HY46XX_BOOT_VER);
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
+	const struct hycon_hy46xx_i2c_chip_data *chip_data;
+	struct hycon_hy46xx_data *tsdata;
+	struct input_dev *input;
+	unsigned long irq_flags;
+	int error;
+
+	dev_dbg(&client->dev, "probing for HYCON HY46XX I2C\n");
+
+	tsdata = devm_kzalloc(&client->dev, sizeof(*tsdata), GFP_KERNEL);
+	if (!tsdata)
+		return -ENOMEM;
+
+	chip_data = device_get_match_data(&client->dev);
+	if (!chip_data)
+		chip_data = (const struct hycon_hy46xx_i2c_chip_data *)
+			     id->driver_data;
+	if (!chip_data) {
+		dev_err(&client->dev, "invalid or missing chip data\n");
+		return -EINVAL;
+	}
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
+	hycon_hy46xx_get_defaults(&client->dev, tsdata);
+	hycon_hy46xx_get_parameters(tsdata);
+
+	input->name = "Hycon Capacitive Touch";
+	input->id.bustype = BUS_I2C;
+	input->dev.parent = &client->dev;
+
+	input_set_abs_params(input, ABS_MT_POSITION_X,
+			     0, -1, 0, 0);
+	input_set_abs_params(input, ABS_MT_POSITION_Y,
+			     0, -1, 0, 0);
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
+	irq_flags = irq_get_trigger_type(client->irq);
+	if (irq_flags == IRQF_TRIGGER_NONE)
+		irq_flags = IRQF_TRIGGER_FALLING;
+	irq_flags |= IRQF_ONESHOT;
+
+	error = devm_request_threaded_irq(&client->dev, client->irq,
+					NULL, hycon_hy46xx_isr, irq_flags,
+					client->name, tsdata);
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
+	{ .name = "hycon-hy4613" },
+	{ .name = "hycon-hy4614" },
+	{ .name = "hycon-hy4621" },
+	{ .name = "hycon-hy4623" },
+	{ .name = "hycon-hy4633" },
+	{ .name = "hycon-hy4635" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(i2c, hycon_hy46xx_id);
+
+static const struct of_device_id hycon_hy46xx_of_match[] = {
+	{ .compatible = "hycon,hycon-hy4613" },
+	{ .compatible = "hycon,hycon-hy4614" },
+	{ .compatible = "hycon,hycon-hy4621" },
+	{ .compatible = "hycon,hycon-hy4623" },
+	{ .compatible = "hycon,hycon-hy4633" },
+	{ .compatible = "hycon,hycon-hy4635" },
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
+MODULE_AUTHOR("Giulio Benetti <giulio.benetti@micronovasrl.com>");
+MODULE_DESCRIPTION("HYCON HY46XX I2C Touchscreen Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

