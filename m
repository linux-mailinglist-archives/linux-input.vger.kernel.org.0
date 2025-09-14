Return-Path: <linux-input+bounces-14698-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE9EB56973
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 15:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B886D3AC8A7
	for <lists+linux-input@lfdr.de>; Sun, 14 Sep 2025 13:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374FB1DF985;
	Sun, 14 Sep 2025 13:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERUlvflY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B4D1EFF80
	for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 13:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757857529; cv=none; b=N1lnIv5pSjEr5iWzYQv8v384/9XD45VVw4Mc+dHTrL8MDDl79RnfNIV0G3bMqeh+aMKG8KeYMbXjj4eIOlFc1hwY0KOPeOnh4DZTnyEq0j+jCkSkCRn7njyTNI/1rUVpY6iSqQtWziJGbhdUg59b8te6Fxlo5LK+8THBEq6EiuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757857529; c=relaxed/simple;
	bh=mhlqPe+rYAdqQ2489lVPW8Nz3WhM6I/OuGV4Y0trFXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EgE159zg+ammTfsoPFLag0y3zfDDcGZJ7ce9QzdAFvLqqb1A8FryXsWPoE49X8T0A17OLtg656tX2X0z2MBzds+m1UQicaQsJlqQRqFduuBNKuQrxmF6lT6Iq+sGjvU5ah28M+/9wRSeEHp9wOUQfhXzE9Oru6TBWw3F4dZHn70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERUlvflY; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3df35a67434so2025440f8f.3
        for <linux-input@vger.kernel.org>; Sun, 14 Sep 2025 06:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757857525; x=1758462325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1C66At/iPHB+YbOfF0ahn3G5fgbhry39+iH3jn1wwY=;
        b=ERUlvflYYGBSummwCm8InAPQRET0dtwD/5uN0cuclq8KZ3CLDl4+sTxsmUbflhnPMV
         9/4vYIWQqDSPg1rxk8v+o5x/pZqIhdKJrM/WePAIg5SlbiuwRLM4P+sgB0QQ5c5T5nAs
         J8ftvydhVckkrs3/0wGldr0jJc31gEJc/frwyA3F0ypmPVPPSWp+2BN58tu2gT4WzQtq
         /AcAl9m+IcduahL+q3/Im+atrB/9/YJO2r8PLK/3trK0YxHK8Ff29ctZWpgEpcGTPbJu
         EtNVqpIk/m6HuScJ8Wchfa9CxW2RqFiyAfTMtVlY9lqsukdsp8Goj8kNtGhaH8Q4BjzS
         I5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757857525; x=1758462325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1C66At/iPHB+YbOfF0ahn3G5fgbhry39+iH3jn1wwY=;
        b=aEk+e02u5o+AkgK6AoUmTyHG27UVN5Pp4FOsC6jqO4d7YGmsTBsj5LeB3rJmRL2x8E
         w2aGugvB8YHG33J4jy5FXm9dPYM1lbQ2g3TTzHL+dwzTstQAEUus8iwlTC2WK6CQnUO3
         f83SqXBr5ldZyvfkEQAHgHIMJtzpgFRUf/hTiOdia54uhhOVsv3mFl0lpm8FpHc6gF2C
         2q/0bcch9TVpPNxb9Yk0uAsCOPI/jhVCbs0CExkijm9ilycJ6wkRn8AfCAnx0p/3m+F6
         ijrZ1aZTlR48vj0dssztYKjRrvyTat0GBQvJZErfw3vAwOgP+Zcwut39KqNoIKdMMH6+
         9b8g==
X-Forwarded-Encrypted: i=1; AJvYcCV00+gJQp38AI5d+QGH/ujI8JZuAq5I7717aMBkG2Y+p7DGoyAnCQvoXgSis7qKDvvjkuvN+9O3RabT+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoRMKn1SuUCTv2FeH5HUfDtcOdNxyKNEIm4Drr3Oz1XWdCGcj+
	iPAJ1CsVYwcy4HABNsgqsEDmHgXW/jhIFvlCCqxEZESlVMsqga4nEA7s
X-Gm-Gg: ASbGncs46QeqDuPzK9+ucaaiuxbqZX+ogSM0K5VQ7YsN2gHFMtrRx+FIKQ+JugSP/MP
	tAi0Dr3utkPCUHjbcc9vwBp1ANmjibFSJ9Mxq1SGoyZSF+FmieDCw4EWFcAogcuCVfcwDEGx28A
	NuOQW1Y6G/i7FNjGRzmfl+9M/2q10LKJPh+mmDoDted/JBEnE0oMaQKl4oQQllsfvAyjUk6W+iU
	o8GzfthQH1Wh7t3S5Ce+uYU49Kpy0E1EjGJA9DDmXBD3Z08gRHtx7nCIIhGqDZMG6Db/Fdd4VT+
	5FnIiwkMxawPPmJPMyY5XJVfoN0oV8+k/YZf7yAjhMwW7aVCbSGjQl4EIWa2CWy46oDPQJa1/Rj
	+9Pd5sK3rnC/o1MvNthIJIo7pIMRtfjFNzYxMwWciVVQJbXm+xPHLNDL1xWweD8OiknNjHWBXnr
	AYUQeZEybv
X-Google-Smtp-Source: AGHT+IGY5Y2KTdaZaAd3HnAGXpedRNw4b12KEMkqN57ZikiQBKfKGS5CdY+ghvCof9iN933uImvqEQ==
X-Received: by 2002:a05:6000:22ca:b0:3e9:2fea:6795 with SMTP id ffacd0b85a97d-3e92fea6b35mr2699385f8f.53.1757857524471;
        Sun, 14 Sep 2025 06:45:24 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea4b52b7fcsm1467591f8f.33.2025.09.14.06.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 06:45:24 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] Input: s6sa552 - add a driver for the Samsung A552 touchscreen controller
Date: Sun, 14 Sep 2025 16:44:57 +0300
Message-ID: <20250914134458.2624176-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914134458.2624176-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914134458.2624176-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The S6SA552 touchscreen is a capacitive multi-touch controller for
mobile use. It connects via i2c at the address 0x48.

Introduce a basic driver, which can handle initialization, touch events
and power states.

At least the firmware for this IC on Galaxy S7 differs from S6SY761
in register layout and bits, as well as some missing registers/functions,
for example for retrieving the max X/Y coordinates and the amount
of TX/RX channels.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

---
Samsung almost completely didn't mention the IC name in the vendor
drivers.. I retrieved it from a fw-update function that checks a
firmware bit and matches it with an IC model string. Otherwise
everywhere else it's called sec_ts. I believe the main difference
between samsung touchscreen controllers is the firmware they're
running on, but this one is a bit different from s6sy761, featuring
different registers and bits, as well as some missing features. I
went with calling it s6sa552 to follow the "s6s" convention, because
as far as I know, s6sy661 also exists, and the important part is after
"s6s".
---
 drivers/input/touchscreen/Kconfig   |  11 +
 drivers/input/touchscreen/Makefile  |   1 +
 drivers/input/touchscreen/s6sa552.c | 439 ++++++++++++++++++++++++++++
 3 files changed, 451 insertions(+)
 create mode 100644 drivers/input/touchscreen/s6sa552.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 196905162..2d65dd13e 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -505,6 +505,17 @@ config TOUCHSCREEN_IPROC
 	  To compile this driver as a module, choose M here: the
 	  module will be called bcm_iproc_tsc.
 
+config TOUCHSCREEN_S6SA552
+	tristate "Samsung S6SA552 Touchscreen driver"
+	depends on I2C
+	help
+	  Say Y if you have the Samsung S6SA552 driver
+
+	  If unsure, say N
+
+	  To compile this driver as module, choose M here: the
+	  module will be called s6sa552.
+
 config TOUCHSCREEN_S6SY761
 	tristate "Samsung S6SY761 Touchscreen driver"
 	depends on I2C
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 97a025c6a..d3be3e21a 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -77,6 +77,7 @@ obj-$(CONFIG_TOUCHSCREEN_PCAP)		+= pcap_ts.o
 obj-$(CONFIG_TOUCHSCREEN_PENMOUNT)	+= penmount.o
 obj-$(CONFIG_TOUCHSCREEN_PIXCIR)	+= pixcir_i2c_ts.o
 obj-$(CONFIG_TOUCHSCREEN_RM_TS)		+= raydium_i2c_ts.o
+obj-$(CONFIG_TOUCHSCREEN_S6SA552)	+= s6sa552.o
 obj-$(CONFIG_TOUCHSCREEN_S6SY761)	+= s6sy761.o
 obj-$(CONFIG_TOUCHSCREEN_SILEAD)	+= silead.o
 obj-$(CONFIG_TOUCHSCREEN_SIS_I2C)	+= sis_i2c.o
diff --git a/drivers/input/touchscreen/s6sa552.c b/drivers/input/touchscreen/s6sa552.c
new file mode 100644
index 000000000..32ef338de
--- /dev/null
+++ b/drivers/input/touchscreen/s6sa552.c
@@ -0,0 +1,439 @@
+// SPDX-License-Identifier: GPL-2.0
+// Samsung S6SA552 Touchscreen device driver
+//
+// Copyright (c) 2025 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+//
+// Based on the s6sy761 driver:
+//   Copyright (c) 2017 Samsung Electronics Co., Ltd.
+//   Copyright (c) 2017 Andi Shyti <andi@etezian.org>
+
+#include <linux/unaligned.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <linux/regulator/consumer.h>
+
+/* commands */
+#define S6SA552_SENSE_ON		0x40
+#define S6SA552_SENSE_OFF		0x41
+#define S6SA552_TOUCH_FUNCTION		0x63
+#define S6SA552_DEVICE_ID		0x52
+#define S6SA552_BOOT_STATUS		0x55
+#define S6SA552_READ_ONE_EVENT		0x71
+#define S6SA552_CLEAR_EVENT_STACK	0x60
+#define S6SA552_PANEL_INFO		0x23
+
+/* acknowledge events */
+#define S6SA552_EVENT_ACK_BOOT		0x0c
+
+/* status event types */
+#define S6SA552_EVENT_TYPE_ACK		0x01
+#define S6SA552_EVENT_TYPE_ERR		0x02
+#define S6SA552_EVENT_TYPE_INFO		0x03
+#define S6SA552_EVENT_TYPE_GEST		0x06
+#define S6SA552_EVENT_TYPE_SPONGE	0x5a
+
+/* boot status (BS) */
+#define S6SA552_BS_APPLICATION		0x20
+
+/* event id */
+#define S6SA552_EVENT_ID_COORDINATE	0x01
+#define S6SA552_EVENT_ID_STATUS		0x00
+
+/* event register masks */
+#define S6SA552_MASK_TID		0x0f  /* byte 1, lower 4 bits */
+#define S6SA552_MASK_NT			0xf0  /* byte 1, upper 4 bits */
+#define S6SA552_MASK_EID		0xc0  /* byte 0, bits 6-7 */
+#define S6SA552_MASK_TOUCH_STATE	0x07  /* byte 0, bits 0-2 */
+#define S6SA552_MASK_TOUCH_TYPE		0x38  /* byte 0, bits 3-5 */
+
+/* touch states */
+#define S6SA552_TS_NONE			0x00
+#define S6SA552_TS_PRESS		0x01
+#define S6SA552_TS_MOVE			0x02
+#define S6SA552_TS_RELEASE		0x03
+
+#define S6SA552_EVENT_SIZE		8
+#define S6SA552_DEVID_SIZE		3
+#define S6SA552_PANEL_ID_SIZE		11
+#define S6SA552_MAX_FINGERS		10
+
+/*
+ * Hardcoded values, since at least on herolte, the subid register doesn't
+ * read/exist.
+ */
+#define S6SA552_MAX_X			4095
+#define S6SA552_MAX_Y			4095
+#define S6SA552_TX_CHANNELS		16
+
+#define S6SA552_DEV_NAME		"s6sa552"
+
+enum s6sa552_regulators {
+	S6SA552_REGULATOR_VDD,
+	S6SA552_REGULATOR_AVDD,
+};
+
+struct s6sa552_data {
+	struct i2c_client *client;
+	struct regulator_bulk_data regulators[2];
+	struct input_dev *input;
+	struct touchscreen_properties prop;
+
+	u8 data[S6SA552_EVENT_SIZE];
+
+	u16 devid;
+	u8 tx_channel;
+};
+
+static void s6sa552_report_coordinates(struct s6sa552_data *sdata,
+				       u8 *event, u8 tid)
+{
+	u8 major = event[6];
+	u8 minor = event[7];
+	u8 z = event[5];
+	u16 x = (event[2] << 4) | ((event[4] >> 4) & 0x0F);
+	u16 y = (event[3] << 4) | (event[4] & 0x0F);
+
+	input_mt_slot(sdata->input, tid);
+
+	input_mt_report_slot_state(sdata->input, MT_TOOL_FINGER, true);
+	input_report_abs(sdata->input, ABS_MT_POSITION_X, x);
+	input_report_abs(sdata->input, ABS_MT_POSITION_Y, y);
+	input_report_abs(sdata->input, ABS_MT_TOUCH_MAJOR, major);
+	input_report_abs(sdata->input, ABS_MT_TOUCH_MINOR, minor);
+	input_report_abs(sdata->input, ABS_MT_PRESSURE, z);
+
+	input_sync(sdata->input);
+}
+
+static void s6sa552_report_release(struct s6sa552_data *sdata, u8 tid)
+{
+	input_mt_slot(sdata->input, tid);
+	input_mt_report_slot_state(sdata->input, MT_TOOL_FINGER, false);
+
+	input_sync(sdata->input);
+}
+
+static void s6sa552_handle_coordinates(struct s6sa552_data *sdata, u8 *event)
+{
+	u8 tid;
+	u8 touch_state;
+
+	if (unlikely(!(event[1] & S6SA552_MASK_TID)))
+		return;
+
+	tid = (event[1] & S6SA552_MASK_TID) - 1;
+	touch_state = event[0] & S6SA552_MASK_TOUCH_STATE;
+
+	switch (touch_state) {
+	case S6SA552_TS_PRESS:
+	case S6SA552_TS_MOVE:
+		s6sa552_report_coordinates(sdata, event, tid);
+		break;
+	case S6SA552_TS_RELEASE:
+		s6sa552_report_release(sdata, tid);
+		break;
+	case S6SA552_TS_NONE:
+	default:
+		break;
+	}
+}
+
+static irqreturn_t s6sa552_irq_handler(int irq, void *dev)
+{
+	struct s6sa552_data *sdata = dev;
+	int ret;
+	u8 event_id;
+
+	ret = i2c_smbus_read_i2c_block_data(sdata->client,
+					    S6SA552_READ_ONE_EVENT,
+					    S6SA552_EVENT_SIZE,
+					    sdata->data);
+	if (ret < 0) {
+		dev_err(&sdata->client->dev, "failed to read event\n");
+		return IRQ_HANDLED;
+	}
+
+	if (!sdata->data[0])
+		return IRQ_HANDLED;
+
+	event_id = sdata->data[0] >> 6;
+
+	switch (event_id) {
+	case S6SA552_EVENT_ID_COORDINATE:
+		s6sa552_handle_coordinates(sdata, sdata->data);
+		break;
+	case S6SA552_EVENT_ID_STATUS:
+		break;
+	default:
+		break;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int s6sa552_input_open(struct input_dev *dev)
+{
+	struct s6sa552_data *sdata = input_get_drvdata(dev);
+
+	return i2c_smbus_write_byte(sdata->client, S6SA552_SENSE_ON);
+}
+
+static void s6sa552_input_close(struct input_dev *dev)
+{
+	struct s6sa552_data *sdata = input_get_drvdata(dev);
+	int ret;
+
+	ret = i2c_smbus_write_byte(sdata->client, S6SA552_SENSE_OFF);
+	if (ret)
+		dev_err(&sdata->client->dev, "failed to turn off sensing\n");
+}
+
+static ssize_t s6sa552_sysfs_devid(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct s6sa552_data *sdata = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%#x\n", sdata->devid);
+}
+
+static DEVICE_ATTR(devid, 0444, s6sa552_sysfs_devid, NULL);
+
+static struct attribute *s6sa552_sysfs_attrs[] = {
+	&dev_attr_devid.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(s6sa552_sysfs);
+
+static int s6sa552_power_on(struct s6sa552_data *sdata)
+{
+	u8 buffer[S6SA552_EVENT_SIZE];
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(sdata->regulators),
+				    sdata->regulators);
+	if (ret)
+		return ret;
+
+	msleep(140);
+
+	/* double check whether the touch is functional */
+	ret = i2c_smbus_read_i2c_block_data(sdata->client,
+					    S6SA552_READ_ONE_EVENT,
+					    S6SA552_EVENT_SIZE,
+					    buffer);
+	if (ret < 0)
+		return ret;
+
+	if (buffer[0] != S6SA552_EVENT_TYPE_ACK ||
+	    buffer[1] != S6SA552_EVENT_ACK_BOOT) {
+		return -ENODEV;
+	}
+
+	ret = i2c_smbus_read_byte_data(sdata->client, S6SA552_BOOT_STATUS);
+	if (ret < 0)
+		return ret;
+
+	/* for some reasons the device might be stuck in the bootloader */
+	if (ret != S6SA552_BS_APPLICATION)
+		return -ENODEV;
+
+	/* enable touch functionality */
+	ret = i2c_smbus_write_byte_data(sdata->client,
+					S6SA552_TOUCH_FUNCTION, 0x01);
+	if (ret)
+		return ret;
+
+	mdelay(20); /* make sure everything is up */
+
+	return 0;
+}
+
+static int s6sa552_hw_init(struct s6sa552_data *sdata)
+{
+	u8 buffer[S6SA552_DEVID_SIZE];
+	int ret;
+
+	ret = s6sa552_power_on(sdata);
+	if (ret)
+		return ret;
+
+	ret = i2c_smbus_read_i2c_block_data(sdata->client,
+					    S6SA552_DEVICE_ID,
+					    S6SA552_DEVID_SIZE,
+					    buffer);
+	if (ret < 0)
+		return ret;
+
+	sdata->devid = get_unaligned_be16(buffer + 1);
+
+	return 0;
+}
+
+static void s6sa552_power_off(void *data)
+{
+	struct s6sa552_data *sdata = data;
+
+	disable_irq(sdata->client->irq);
+	regulator_bulk_disable(ARRAY_SIZE(sdata->regulators),
+			       sdata->regulators);
+}
+
+static int s6sa552_probe(struct i2c_client *client)
+{
+	struct s6sa552_data *sdata;
+	int err;
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
+						I2C_FUNC_SMBUS_BYTE_DATA |
+						I2C_FUNC_SMBUS_I2C_BLOCK))
+		return -ENODEV;
+
+	sdata = devm_kzalloc(&client->dev, sizeof(*sdata), GFP_KERNEL);
+	if (!sdata)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, sdata);
+	sdata->client = client;
+
+	sdata->regulators[S6SA552_REGULATOR_VDD].supply = "vdd";
+	sdata->regulators[S6SA552_REGULATOR_AVDD].supply = "avdd";
+	err = devm_regulator_bulk_get(&client->dev,
+				      ARRAY_SIZE(sdata->regulators),
+				      sdata->regulators);
+	if (err)
+		return err;
+
+	err = devm_add_action_or_reset(&client->dev, s6sa552_power_off, sdata);
+	if (err)
+		return err;
+
+	err = s6sa552_hw_init(sdata);
+	if (err)
+		return err;
+
+	sdata->input = devm_input_allocate_device(&client->dev);
+	if (!sdata->input)
+		return -ENOMEM;
+
+	sdata->input->name = S6SA552_DEV_NAME;
+	sdata->input->id.bustype = BUS_I2C;
+	sdata->input->open = s6sa552_input_open;
+	sdata->input->close = s6sa552_input_close;
+
+	input_set_abs_params(sdata->input, ABS_MT_POSITION_X, 0, S6SA552_MAX_X,
+			     0, 0);
+	input_set_abs_params(sdata->input, ABS_MT_POSITION_Y, 0, S6SA552_MAX_Y,
+			     0, 0);
+	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
+	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MINOR, 0, 255, 0, 0);
+	input_set_abs_params(sdata->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
+
+	touchscreen_parse_properties(sdata->input, true, &sdata->prop);
+
+	if (!input_abs_get_max(sdata->input, ABS_X) ||
+	    !input_abs_get_max(sdata->input, ABS_Y)) {
+		dev_warn(&client->dev, "the axis have not been set\n");
+	}
+
+	err = input_mt_init_slots(sdata->input, S6SA552_TX_CHANNELS,
+				  INPUT_MT_DIRECT);
+	if (err)
+		return err;
+
+	input_set_drvdata(sdata->input, sdata);
+
+	err = input_register_device(sdata->input);
+	if (err)
+		return err;
+
+	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+					s6sa552_irq_handler,
+					IRQF_TRIGGER_LOW | IRQF_ONESHOT,
+					"s6sa552_irq", sdata);
+	if (err)
+		return err;
+
+	pm_runtime_enable(&client->dev);
+
+	return 0;
+}
+
+static void s6sa552_remove(struct i2c_client *client)
+{
+	pm_runtime_disable(&client->dev);
+}
+
+static int s6sa552_runtime_suspend(struct device *dev)
+{
+	struct s6sa552_data *sdata = dev_get_drvdata(dev);
+
+	return i2c_smbus_write_byte(sdata->client, S6SA552_SENSE_OFF);
+}
+
+static int s6sa552_runtime_resume(struct device *dev)
+{
+	struct s6sa552_data *sdata = dev_get_drvdata(dev);
+
+	return i2c_smbus_write_byte(sdata->client, S6SA552_SENSE_ON);
+}
+
+static int s6sa552_suspend(struct device *dev)
+{
+	struct s6sa552_data *sdata = dev_get_drvdata(dev);
+
+	s6sa552_power_off(sdata);
+
+	return 0;
+}
+
+static int s6sa552_resume(struct device *dev)
+{
+	struct s6sa552_data *sdata = dev_get_drvdata(dev);
+
+	enable_irq(sdata->client->irq);
+
+	return s6sa552_power_on(sdata);
+}
+
+static const struct dev_pm_ops s6sa552_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(s6sa552_suspend, s6sa552_resume)
+	RUNTIME_PM_OPS(s6sa552_runtime_suspend, s6sa552_runtime_resume, NULL)
+};
+
+#ifdef CONFIG_OF
+static const struct of_device_id s6sa552_of_match[] = {
+	{ .compatible = "samsung,s6sa552", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, s6sa552_of_match);
+#endif
+
+static const struct i2c_device_id s6sa552_id[] = {
+	{ "s6sa552" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, s6sa552_id);
+
+static struct i2c_driver s6sa552_driver = {
+	.driver = {
+		.name = S6SA552_DEV_NAME,
+		.dev_groups = s6sa552_sysfs_groups,
+		.of_match_table = of_match_ptr(s6sa552_of_match),
+		.pm = pm_ptr(&s6sa552_pm_ops),
+	},
+	.probe = s6sa552_probe,
+	.remove = s6sa552_remove,
+	.id_table = s6sa552_id,
+};
+
+module_i2c_driver(s6sa552_driver);
+
+MODULE_AUTHOR("Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>");
+MODULE_DESCRIPTION("Samsung S6SA552 Touch Screen");
+MODULE_LICENSE("GPL");
-- 
2.43.0


