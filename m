Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2B2286681
	for <lists+linux-input@lfdr.de>; Wed,  7 Oct 2020 20:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728668AbgJGSFz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Oct 2020 14:05:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728621AbgJGSFt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Oct 2020 14:05:49 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55CECC0613D2;
        Wed,  7 Oct 2020 11:05:48 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id l11so3363421wmh.2;
        Wed, 07 Oct 2020 11:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zZnusIultPXcYgplAo9lKaKnrhQMBy44zK70bzv6x5I=;
        b=qlm8ABgV740AqCXEJybxoRiS5CG4ev9DFagP+83dk9AYtMDbPZD/i+jUnqbT9eJrWn
         bYVgvc7F49dtPIWrN9JAtOs3GsQFNMBd+4fB+NR9GHePH0Btg3cqolBBrLn1AN730gyw
         hDvSjLnCd5h4gumsfhfIt+CLOKuEkY7eOfCeXU12jFrpoIHIv1T6Bz+TaXFnly0Bb55F
         Is0dVuDOyPbbrq+q10gtdk/XLHdk+Ea8u/kr5RuBJ13JniurpIo1jalZBowcxayksjUp
         92LwhsfF4BTaCQy7Z8BnGBw03+OfneEiDr//pXs2eGtFIMDuUw+6iq1mYm76CkOnX9bT
         Rnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zZnusIultPXcYgplAo9lKaKnrhQMBy44zK70bzv6x5I=;
        b=hguoYySyaJaqas3c9j/ZbRbJJZWOhCIOQLqL3AUDh1iaSr9SAXxcHx49IvpkPGe15Q
         tEI0IGv374AwlvsGtzyrZptSJZStRyAXCoRp9NpCLEXNE4NG2s2v0Zo+zsyDWeBnzTEQ
         NkCKoxG3b7g+RN5bbMar0UoTw/IZ8cyw7yCGuOIPRzzOtfmpV6QA8g5cRKrMiaMiUR6V
         cilNgCSskf8idyP2MHDm3qvx785s/Me7iR/T/H3H/OqMK2peKPnQegRUmfYz06VO7Epc
         CLJXoajG4SxL9suwhU9KVvQnNEIFrHMJPGqhsltAFom7Eti+G2XRMsoGcXnyWTsMXbNb
         ms0g==
X-Gm-Message-State: AOAM5334N60eRFJA9EyBF0216Aqi/OhqU5DwXdr/hisEEvJQ/HUt/kWb
        wLvYA6fzi5SDUQ+IIxHC0sJnO2ei2mSNRg==
X-Google-Smtp-Source: ABdhPJyVFBQ1QhJmDVaXopgvb00AvTzAQEssdOo2BC0GZ1qmQvMZJVDGKeJuU/ygKWZrxQejOdfntw==
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr3683422wmf.121.1602093946670;
        Wed, 07 Oct 2020 11:05:46 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id a17sm3814496wra.29.2020.10.07.11.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 11:05:46 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org
Subject: [PATCH v3 2/3] Input: Add Novatek NT36xxx touchscreen driver
Date:   Wed,  7 Oct 2020 20:05:39 +0200
Message-Id: <20201007180540.322257-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007180540.322257-1-kholk11@gmail.com>
References: <20201007180540.322257-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This is a driver for the Novatek in-cell touch controller and
supports various chips from the NT36xxx family, currently
including NT36525, NT36672A, NT36676F, NT36772 and NT36870.

Functionality like wake gestures and firmware flashing is not
included: I am not aware of any of these DrIC+Touch combo
chips not including a non-volatile memory and it should be
highly unlikely to find one, since the touch firmware is
embedded into the DriverIC one, which is obviously necessary
to drive the display unit.

However, the necessary address for the firmware update
procedure was included into the address table in this driver
so, in the event that someone finds the need to implement it
for a reason or another, it will be pretty straightforward to.

This driver is lightly based on the downstream implementation [1].
[1] https://github.com/Rasenkai/caf-tsoft-Novatek-nt36xxx

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/input/touchscreen/Kconfig   |  12 +
 drivers/input/touchscreen/Makefile  |   1 +
 drivers/input/touchscreen/nt36xxx.c | 816 ++++++++++++++++++++++++++++
 3 files changed, 829 insertions(+)
 create mode 100644 drivers/input/touchscreen/nt36xxx.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index 35c867b2d9a7..6d118b967021 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -605,6 +605,18 @@ config TOUCHSCREEN_MTOUCH
 	  To compile this driver as a module, choose M here: the
 	  module will be called mtouch.
 
+config TOUCHSCREEN_NT36XXX
+	tristate "Novatek NT36XXX In-Cell I2C touchscreen controller"
+	depends on I2C
+	help
+	  Say Y here if you have a Novatek NT36xxx series In-Cell
+	  touchscreen connected to your system over I2C.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called nt36xxx.
+
 config TOUCHSCREEN_IMX6UL_TSC
 	tristate "Freescale i.MX6UL touchscreen controller"
 	depends on (OF && GPIOLIB) || COMPILE_TEST
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 30d1e1b42492..424a555e03d5 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_TOUCHSCREEN_MIGOR)		+= migor_ts.o
 obj-$(CONFIG_TOUCHSCREEN_MMS114)	+= mms114.o
 obj-$(CONFIG_TOUCHSCREEN_MTOUCH)	+= mtouch.o
 obj-$(CONFIG_TOUCHSCREEN_MK712)		+= mk712.o
+obj-$(CONFIG_TOUCHSCREEN_NT36XXX)	+= nt36xxx.o
 obj-$(CONFIG_TOUCHSCREEN_HP600)		+= hp680_ts_input.o
 obj-$(CONFIG_TOUCHSCREEN_HP7XX)		+= jornada720_ts.o
 obj-$(CONFIG_TOUCHSCREEN_IPAQ_MICRO)	+= ipaq-micro-ts.o
diff --git a/drivers/input/touchscreen/nt36xxx.c b/drivers/input/touchscreen/nt36xxx.c
new file mode 100644
index 000000000000..ced649a4e769
--- /dev/null
+++ b/drivers/input/touchscreen/nt36xxx.c
@@ -0,0 +1,816 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2010 - 2017 Novatek, Inc.
+ * Copyright (C) 2020 AngeloGioacchino Del Regno <kholk11@gmail.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/of_gpio.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/regulator/consumer.h>
+
+/* FW Param address */
+#define NT36XXX_FW_ADDR 0x01
+
+/* Number of bytes for chip identification */
+#define NT36XXX_ID_LEN_MAX	6
+
+/* Touch info */
+#define TOUCH_DEFAULT_MAX_WIDTH  1080
+#define TOUCH_DEFAULT_MAX_HEIGHT 2246
+#define TOUCH_MAX_FINGER_NUM	 10
+#define TOUCH_MAX_PRESSURE	 1000
+
+/* Point data length */
+#define POINT_DATA_LEN		65
+
+/* Global pages */
+#define NT36XXX_PAGE_CHIP_INFO	0x0001f64e
+#define NT36XXX_PAGE_CRC	0x0003f135
+
+/* Misc */
+#define NT36XXX_NUM_SUPPLIES	 2
+#define NT36XXX_MAX_RETRIES	 5
+#define NT36XXX_MAX_FW_RST_RETRY 50
+
+struct nt36xxx_abs_object {
+	u16 x;
+	u16 y;
+	u16 z;
+	u8 tm;
+};
+
+struct nt36xxx_fw_info {
+	u8 fw_ver;
+	u8 x_num;
+	u8 y_num;
+	u8 max_buttons;
+	u16 abs_x_max;
+	u16 abs_y_max;
+	u16 nvt_pid;
+};
+
+struct nt36xxx_mem_map {
+	u32 evtbuf_addr;
+	u32 pipe0_addr;
+	u32 pipe1_addr;
+	u32 flash_csum_addr;
+	u32 flash_data_addr;
+};
+
+struct nt36xxx_i2c {
+	struct i2c_client *hw_client;
+	struct i2c_client *fw_client;
+	struct regmap *regmap;
+	struct regmap *fw_regmap;
+	struct input_dev *input;
+	struct regulator_bulk_data *supplies;
+	struct gpio_desc *reset_gpio;
+
+	struct mutex lock;
+
+	struct touchscreen_properties prop;
+	struct nt36xxx_fw_info fw_info;
+	struct nt36xxx_abs_object abs_obj;
+
+	const struct nt36xxx_mem_map *mmap;
+};
+
+enum nt36xxx_chips {
+	NT36525_IC = 0,
+	NT36672A_IC,
+	NT36676F_IC,
+	NT36772_IC,
+	NT36870_IC,
+	NTMAX_IC,
+};
+
+struct nt36xxx_trim_table {
+	u8 id[NT36XXX_ID_LEN_MAX];
+	u8 mask[NT36XXX_ID_LEN_MAX];
+	enum nt36xxx_chips mapid;
+};
+
+enum nt36xxx_cmds {
+	NT36XXX_CMD_ENTER_SLEEP = 0x11,
+	NT36XXX_CMD_ENTER_WKUP_GESTURE = 0x13,
+	NT36XXX_CMD_UNLOCK = 0x35,
+	NT36XXX_CMD_BOOTLOADER_RESET = 0x69,
+	NT36XXX_CMD_SW_RESET = 0xa5,
+	NT36XXX_CMD_SET_PAGE = 0xff,
+};
+
+enum nt36xxx_fw_state {
+	NT36XXX_STATE_INIT = 0xa0,	/* IC reset */
+	NT36XXX_STATE_REK,		/* ReK baseline */
+	NT36XXX_STATE_REK_FINISH,	/* Baseline is ready */
+	NT36XXX_STATE_NORMAL_RUN,	/* Normal run */
+	NT36XXX_STATE_MAX = 0xaf
+};
+
+enum nt36xxx_i2c_events {
+	NT36XXX_EVT_REPORT = 0x00,
+	NT36XXX_EVT_CRC = 0x35,
+	NT36XXX_EVT_CHIPID = 0x4e,
+	NT36XXX_EVT_HOST_CMD = 0x50,
+	NT36XXX_EVT_HS_OR_SUBCMD = 0x51,   /* Handshake or subcommand byte */
+	NT36XXX_EVT_RESET_COMPLETE = 0x60,
+	NT36XXX_EVT_FWINFO = 0x78,
+	NT36XXX_EVT_PROJECTID = 0x9a,
+};
+
+static const struct nt36xxx_mem_map nt36xxx_memory_maps[] = {
+	[NT36525_IC]  = { 0x11a00, 0x10000, 0x12000, 0x14000, 0x14002 },
+	[NT36672A_IC] = { 0x21c00, 0x20000, 0x23000, 0x24000, 0x24002 },
+	[NT36676F_IC] = { 0x11a00, 0x10000, 0x12000, 0x14000, 0x14002 },
+	[NT36772_IC]  = { 0x11e00, 0x10000, 0x12000, 0x14000, 0x14002 },
+	[NT36870_IC]  = { 0x25000, 0x20000, 0x23000, 0x24000, 0x24002 },
+};
+
+static const struct nt36xxx_trim_table trim_id_table[] = {
+	{
+	 .id = { 0x0A, 0xFF, 0xFF, 0x72, 0x66, 0x03 },
+	 .mask = { 1, 0, 0, 1, 1, 1 },
+	 .mapid = NT36672A_IC,
+	},
+	{
+	 .id = { 0x55, 0x00, 0xFF, 0x00, 0x00, 0x00 },
+	 .mask = { 1, 1, 0, 1, 1, 1 },
+	 .mapid = NT36772_IC,
+	},
+	{
+	 .id = { 0x55, 0x72, 0xFF, 0x00, 0x00, 0x00 },
+	 .mask = { 1, 1, 0, 1, 1, 1 },
+	 .mapid = NT36772_IC,
+	},
+	{
+	 .id = { 0xAA, 0x00, 0xFF, 0x00, 0x00, 0x00 },
+	 .mask = { 1, 1, 0, 1, 1, 1 },
+	 .mapid = NT36772_IC,
+	},
+	{
+	 .id = { 0xAA, 0x72, 0xFF, 0x00, 0x00, 0x00 },
+	 .mask = { 1, 1, 0, 1, 1, 1 },
+	 .mapid = NT36772_IC,
+	},
+	{
+	 .id = { 0xFF, 0xFF, 0xFF, 0x72, 0x67, 0x03 },
+	 .mask = { 0, 0, 0, 1, 1, 1 },
+	 .mapid = NT36772_IC,
+	},
+	{
+	 .id = { 0xFF, 0xFF, 0xFF, 0x70, 0x66, 0x03 },
+	 .mask = { 0, 0, 0, 1, 1, 1 },
+	 .mapid = NT36772_IC,
+	},
+	{
+	 .id = { 0xFF, 0xFF, 0xFF, 0x70, 0x67, 0x03 },
+	 .mask = { 0, 0, 0, 1, 1, 1 },
+	 .mapid = NT36772_IC,
+	},
+	{
+	 .id = { 0xFF, 0xFF, 0xFF, 0x72, 0x66, 0x03 },
+	 .mask = { 0, 0, 0, 1, 1, 1 },
+	 .mapid = NT36772_IC,
+	},
+	{
+	 .id = { 0xFF, 0xFF, 0xFF, 0x25, 0x65, 0x03 },
+	 .mask = { 0, 0, 0, 1, 1, 1 },
+	 .mapid = NT36772_IC,
+	},
+	{
+	 .id = { 0xFF, 0xFF, 0xFF, 0x70, 0x68, 0x03 },
+	 .mask = { 0, 0, 0, 1, 1, 1 },
+	 .mapid = NT36772_IC,
+	},
+	{
+	 .id = { 0xFF, 0xFF, 0xFF, 0x76, 0x66, 0x03 },
+	 .mask = { 0, 0, 0, 1, 1, 1 },
+	 .mapid = NT36676F_IC,
+	},
+};
+
+static int nt36xxx_set_page(struct nt36xxx_i2c *ts, u32 pageaddr)
+{
+	u32 data = cpu_to_be32(pageaddr) >> 8;
+	int ret;
+
+	ret = regmap_noinc_write(ts->fw_regmap, NT36XXX_CMD_SET_PAGE,
+				 &data, sizeof(data));
+	if (ret == 0)
+		usleep_range(100, 200);
+
+	return ret;
+}
+
+static int nt36xxx_sw_reset_idle(struct nt36xxx_i2c *ts)
+{
+	int ret;
+
+	ret = regmap_write(ts->regmap, ts->hw_client->addr,
+			   NT36XXX_CMD_SW_RESET);
+
+	usleep_range(15000, 16000);
+	return ret;
+}
+
+static int nt36xxx_bootloader_reset(struct nt36xxx_i2c *ts)
+{
+	int ret;
+
+	ret = regmap_write(ts->regmap, ts->hw_client->addr,
+			   NT36XXX_CMD_BOOTLOADER_RESET);
+
+	msleep(35);
+	return ret;
+}
+
+static int nt36xxx_check_reset_state(struct nt36xxx_i2c *ts,
+				     enum nt36xxx_fw_state fw_state)
+{
+	u8 buf[2] = { 0 };
+	int ret, retry = NT36XXX_MAX_FW_RST_RETRY;
+
+	do {
+		ret = regmap_noinc_read(ts->fw_regmap,
+					NT36XXX_EVT_RESET_COMPLETE,
+					buf, sizeof(buf));
+		if (likely(ret == 0) &&
+		    (buf[0] >= fw_state) &&
+		    (buf[0] <= NT36XXX_STATE_MAX)) {
+			ret = 0;
+			break;
+		}
+		usleep_range(10000, 11000);
+	} while (--retry);
+
+	if (!retry) {
+		dev_err(&ts->hw_client->dev, "Firmware reset failed.\n");
+		ret = -EBUSY;
+	}
+
+	return ret;
+}
+
+static int nt36xxx_read_pid(struct nt36xxx_i2c *ts)
+{
+	u8 buf[2] = { 0 };
+	int ret = 0;
+
+	ret = nt36xxx_set_page(ts, ts->mmap->evtbuf_addr);
+	if (unlikely(ret < 0))
+		return ret;
+
+	ret = regmap_noinc_read(ts->fw_regmap, NT36XXX_EVT_PROJECTID,
+				buf, sizeof(buf));
+	if (unlikely(ret < 0))
+		return ret;
+
+	ts->fw_info.nvt_pid = (buf[1] << 8) + buf[0];
+
+	return 0;
+}
+
+static int __nt36xxx_get_fw_info(struct nt36xxx_i2c *ts)
+{
+	struct nt36xxx_fw_info *fwi = &ts->fw_info;
+	u8 buf[11] = { 0 };
+	int ret = 0;
+
+	ret = nt36xxx_set_page(ts, ts->mmap->evtbuf_addr);
+	if (unlikely(ret < 0))
+		return ret;
+
+	ret = regmap_noinc_read(ts->fw_regmap, NT36XXX_EVT_FWINFO,
+				buf, sizeof(buf));
+	if (ret)
+		return ret;
+
+	fwi->fw_ver = buf[0];
+	fwi->x_num = buf[2];
+	fwi->y_num = buf[3];
+	fwi->abs_x_max = (u16)((buf[4] << 8) | buf[5]);
+	fwi->abs_y_max = (u16)((buf[6] << 8) | buf[7]);
+	fwi->max_buttons = buf[10];
+
+	/* Check fw info integrity and clear x_num, y_num if broken */
+	if ((buf[0] + buf[1]) != 0xFF) {
+		dev_err(&ts->hw_client->dev,
+			"FW info is broken! fw_ver=0x%02X, ~fw_ver=0x%02X\n",
+			buf[0], buf[1]);
+		fwi->fw_ver = 0;
+		fwi->x_num = 18;
+		fwi->y_num = 32;
+		fwi->abs_x_max = TOUCH_DEFAULT_MAX_WIDTH;
+		fwi->abs_y_max = TOUCH_DEFAULT_MAX_HEIGHT;
+		fwi->max_buttons = 0;
+		return -EINVAL;
+	}
+
+	/* Get Novatek ProjectID */
+	return nt36xxx_read_pid(ts);
+}
+
+static int nt36xxx_get_fw_info(struct nt36xxx_i2c *ts)
+{
+	struct nt36xxx_fw_info *fwi = &ts->fw_info;
+	int i, ret = 0;
+
+	for (i = 0; i < NT36XXX_MAX_RETRIES; i++) {
+		ret = __nt36xxx_get_fw_info(ts);
+		if (ret == 0)
+			break;
+	}
+
+	dev_dbg(&ts->hw_client->dev,
+		"FW Info: PID=0x%x, ver=0x%x res=%ux%u max=%ux%u buttons=%u",
+		fwi->nvt_pid, fwi->fw_ver, fwi->x_num, fwi->y_num,
+		fwi->abs_x_max, fwi->abs_y_max, fwi->max_buttons);
+
+	return ret;
+}
+
+static void nt36xxx_report(struct nt36xxx_i2c *ts)
+{
+	struct nt36xxx_abs_object *obj = &ts->abs_obj;
+	struct input_dev *input = ts->input;
+	u8 input_id = 0;
+	u8 point[POINT_DATA_LEN + 1] = { 0 };
+	unsigned int ppos = 0;
+	int i, ret, finger_cnt = 0;
+
+	mutex_lock(&ts->lock);
+
+	ret = regmap_noinc_read(ts->fw_regmap, NT36XXX_EVT_REPORT,
+				point, sizeof(point));
+	if (unlikely(ret < 0)) {
+		dev_err(&ts->hw_client->dev,
+			"Cannot read touch point data: %d\n", ret);
+		goto xfer_error;
+	}
+
+	for (i = 0; i < TOUCH_MAX_FINGER_NUM; i++) {
+		ppos = 6 * i;
+		input_id = point[ppos + 0] >> 3;
+		if ((input_id == 0) || (input_id > TOUCH_MAX_FINGER_NUM))
+			continue;
+
+		if (((point[ppos] & 0x07) == 0x01) ||
+		    ((point[ppos] & 0x07) == 0x02)) {
+			obj->x = (point[ppos + 1] << 4) +
+				 (point[ppos + 3] >> 4);
+			obj->y = (point[ppos + 2] << 4) +
+				 (point[ppos + 3] & 0xf);
+			if ((obj->x > ts->prop.max_x) ||
+			    (obj->y > ts->prop.max_y))
+				continue;
+
+			obj->tm = point[ppos + 4];
+			if (obj->tm == 0)
+				obj->tm = 1;
+
+			obj->z = point[ppos + 5];
+			if (i < 2) {
+				obj->z += point[i + 63] << 8;
+				if (obj->z > TOUCH_MAX_PRESSURE)
+					obj->z = TOUCH_MAX_PRESSURE;
+			}
+
+			if (obj->z == 0)
+				obj->z = 1;
+
+			input_mt_slot(input, input_id - 1);
+			input_mt_report_slot_state(input,
+						   MT_TOOL_FINGER, true);
+			touchscreen_report_pos(input, &ts->prop, obj->x,
+					       obj->y, true);
+
+			input_report_abs(input, ABS_MT_TOUCH_MAJOR, obj->tm);
+			input_report_abs(input, ABS_MT_PRESSURE, obj->z);
+
+			finger_cnt++;
+		}
+	}
+	input_mt_sync_frame(input);
+	input_sync(input);
+
+xfer_error:
+	enable_irq(ts->hw_client->irq);
+
+	mutex_unlock(&ts->lock);
+}
+
+static irqreturn_t nt36xxx_i2c_irq_handler(int irq, void *dev_id)
+{
+	struct nt36xxx_i2c *ts = dev_id;
+
+	disable_irq_nosync(ts->hw_client->irq);
+	nt36xxx_report(ts);
+
+	return IRQ_HANDLED;
+}
+
+static int nvt_stop_crc_reboot(struct nt36xxx_i2c *ts)
+{
+	u8 buf[3] = { 0 };
+	u8 val;
+	int ret, retry = NT36XXX_MAX_RETRIES;
+
+	/* Read dummy buffer to check CRC fail reboot is happening or not */
+
+	/* Change I2C index to prevent getting 0xFF, but not 0xFC */
+	ret = nt36xxx_set_page(ts, NT36XXX_PAGE_CHIP_INFO);
+	if (ret) {
+		dev_dbg(&ts->hw_client->dev,
+			"CRC reset failed: Cannot select page.\n");
+		return ret;
+	}
+
+	/* If ChipID command returns 0xFC or 0xFF, the MCU is in CRC reboot */
+	ret = regmap_noinc_read(ts->fw_regmap, NT36XXX_EVT_CHIPID,
+				buf, sizeof(buf));
+	if (ret)
+		return ret;
+
+	if (((buf[0] == 0xFC) && (buf[1] == 0xFC) && (buf[2] == 0xFC)) ||
+	    ((buf[0] == 0xFF) && (buf[1] == 0xFF) && (buf[2] == 0xFF))) {
+		/* IC is in CRC fail reboot loop, needs to be stopped! */
+		do {
+			/* Special reset-idle sequence for CRC failure */
+			ret = regmap_write(ts->regmap, ts->hw_client->addr,
+					   NT36XXX_CMD_SW_RESET);
+			ret += regmap_write(ts->regmap, ts->hw_client->addr,
+					   NT36XXX_CMD_SW_RESET);
+			if (ret)
+				dev_dbg(&ts->hw_client->dev,
+					"SW Reset failed: may not recover\n");
+			usleep_range(1000, 1100);
+
+			/* Clear CRC_ERR_FLAG */
+			ret = nt36xxx_set_page(ts, NT36XXX_PAGE_CRC);
+			if (ret)
+				continue;
+
+			val = 0xA5;
+			ret = regmap_raw_write(ts->fw_regmap, NT36XXX_EVT_CRC,
+					       &val, sizeof(val));
+			if (ret)
+				continue;
+
+			/* Check CRC_ERR_FLAG */
+			ret = nt36xxx_set_page(ts, NT36XXX_PAGE_CRC);
+			if (ret)
+				continue;
+
+			ret = regmap_noinc_read(ts->fw_regmap, NT36XXX_EVT_CRC,
+						&buf, 2);
+			if (ret)
+				continue;
+
+			if (buf[0] == 0xA5)
+				break;
+		} while (--retry);
+
+		if (retry == 0) {
+			dev_err(&ts->hw_client->dev,
+				"CRC reset failed: buf=0x%02x%02x\n",
+				buf[0], buf[1]);
+		}
+	}
+
+	return 0;
+}
+
+static int nt36xxx_i2c_chip_version_init(struct nt36xxx_i2c *ts)
+{
+	u8 buf[7] = { 0 };
+	int retry = NT36XXX_MAX_RETRIES;
+	int sz = sizeof(trim_id_table) / sizeof(struct nt36xxx_trim_table);
+	int i, list, mapid, ret;
+
+	ret = nt36xxx_bootloader_reset(ts);
+	if (ret < 0) {
+		dev_err(&ts->hw_client->dev, "Can't reset the nvt IC\n");
+		return ret;
+	}
+
+	do {
+		ret = nt36xxx_sw_reset_idle(ts);
+		if (ret < 0)
+			continue;
+
+		ret = regmap_write(ts->regmap, ts->hw_client->addr, NT36XXX_CMD_UNLOCK);
+		if (ret)
+			continue;
+		usleep_range(10000, 11000);
+
+		ret = nt36xxx_set_page(ts, NT36XXX_PAGE_CHIP_INFO);
+		if (ret)
+			continue;
+
+		memset(buf, 0, ARRAY_SIZE(buf));
+		ret = regmap_noinc_read(ts->fw_regmap, NT36XXX_EVT_CHIPID,
+					buf, sizeof(buf));
+		if (ret)
+			continue;
+
+		/* Compare read chip id with trim list */
+		for (list = 0; list < sz; list++) {
+			/* Compare each not masked byte */
+			for (i = 0; i < NT36XXX_ID_LEN_MAX; i++) {
+				if (trim_id_table[list].mask[i] &&
+				    buf[i] != trim_id_table[list].id[i])
+					break;
+			}
+
+			if (i == NT36XXX_ID_LEN_MAX) {
+				mapid = trim_id_table[list].mapid;
+				ts->mmap = &nt36xxx_memory_maps[mapid];
+				return 0;
+			}
+
+			ts->mmap = NULL;
+			ret = -ENOENT;
+		}
+
+		/* Stop CRC check to prevent IC auto reboot */
+		if (((buf[1] == 0xFC) && (buf[2] == 0xFC) &&
+		     (buf[3] == 0xFC)) ||
+		    ((buf[1] == 0xFF) && (buf[2] == 0xFF) &&
+		     (buf[3] == 0xFF))) {
+			ret = nvt_stop_crc_reboot(ts);
+			if (ret < 0)
+				continue;
+		}
+
+		usleep_range(10000, 11000);
+	} while (--retry);
+
+	return ret;
+}
+
+static const struct regmap_config nt36xxx_i2c_regmap_hw_config = {
+	.name = "nt36xxx_i2c_hw",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.cache_type = REGCACHE_NONE,
+};
+
+static const struct regmap_config nt36xxx_i2c_regmap_fw_config = {
+	.name = "nt36xxx_i2c_fw",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.cache_type = REGCACHE_NONE,
+};
+
+static void nt36xxx_disable_regulators(void *data)
+{
+	struct nt36xxx_i2c *ts = data;
+
+	regulator_bulk_disable(NT36XXX_NUM_SUPPLIES, ts->supplies);
+}
+
+static int nt36xxx_i2c_probe(struct i2c_client *hw_client,
+			     const struct i2c_device_id *id)
+{
+	struct nt36xxx_i2c *ts;
+	struct input_dev *input;
+	int ret;
+
+	if (!i2c_check_functionality(hw_client->adapter, I2C_FUNC_I2C)) {
+		dev_err(&hw_client->dev, "i2c_check_functionality error\n");
+		return -EIO;
+	}
+
+	if (!hw_client->irq) {
+		dev_err(&hw_client->dev, "No irq specified\n");
+		return -EINVAL;
+	}
+
+	ts = devm_kzalloc(&hw_client->dev, sizeof(struct nt36xxx_i2c), GFP_KERNEL);
+	if (!ts)
+		return -ENOMEM;
+
+	ts->supplies = devm_kcalloc(&hw_client->dev,
+				    NT36XXX_NUM_SUPPLIES,
+				    sizeof(struct regulator_bulk_data),
+				    GFP_KERNEL);
+	if (!ts->supplies)
+		return -ENOMEM;
+
+	input = devm_input_allocate_device(&hw_client->dev);
+	if (!input)
+		return -ENOMEM;
+
+	ts->fw_client = i2c_new_dummy_device(hw_client->adapter,
+					     NT36XXX_FW_ADDR);
+	if (IS_ERR(ts->fw_client)) {
+		dev_err(&hw_client->dev, "Cannot add FW I2C device\n");
+		return PTR_ERR(ts->fw_client);
+	}
+
+	ts->hw_client = hw_client;
+	ts->input = input;
+	i2c_set_clientdata(ts->hw_client, ts);
+	i2c_set_clientdata(ts->fw_client, ts);
+
+	ts->reset_gpio = devm_gpiod_get_optional(&hw_client->dev, "reset",
+						 GPIOD_OUT_HIGH);
+	if (IS_ERR(ts->reset_gpio))
+		return PTR_ERR(ts->reset_gpio);
+	if (ts->reset_gpio)
+		gpiod_set_consumer_name(ts->reset_gpio, "nt36xxx reset");
+
+	/* These supplies are optional */
+	ts->supplies[0].supply = "vdd";
+	ts->supplies[1].supply = "vio";
+	ret = devm_regulator_bulk_get(&hw_client->dev,
+				      NT36XXX_NUM_SUPPLIES,
+				      ts->supplies);
+	if (ret != 0) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(&hw_client->dev,
+				"Cannot get supplies: %d\n", ret);
+		return ret;
+	}
+
+	ts->regmap = devm_regmap_init_i2c(ts->hw_client,
+					  &nt36xxx_i2c_regmap_hw_config);
+	if (IS_ERR(ts->regmap)) {
+		dev_err(&hw_client->dev, "regmap (hw-addr) init failed\n");
+		return PTR_ERR(ts->regmap);
+	}
+
+	ts->fw_regmap = devm_regmap_init_i2c(ts->fw_client,
+					     &nt36xxx_i2c_regmap_fw_config);
+	if (IS_ERR(ts->fw_regmap)) {
+		dev_err(&hw_client->dev, "regmap (fw-addr) init failed\n");
+		return PTR_ERR(ts->fw_regmap);
+	}
+
+	ret = regulator_bulk_enable(NT36XXX_NUM_SUPPLIES, ts->supplies);
+	if (ret)
+		return ret;
+
+	usleep_range(10000, 11000);
+
+	ret = devm_add_action_or_reset(&hw_client->dev,
+				       nt36xxx_disable_regulators, ts);
+	if (ret)
+		return ret;
+
+	mutex_init(&ts->lock);
+
+	/* Set memory maps for the specific chip version */
+	ret = nt36xxx_i2c_chip_version_init(ts);
+	if (ret) {
+		dev_err(&hw_client->dev, "Failed to check chip version\n");
+		return ret;
+	}
+
+	/* Reset the MCU */
+	ret = nt36xxx_bootloader_reset(ts);
+	if (unlikely(ret < 0))
+		return ret;
+
+	/* Check and eventually wait until the MCU goes in reset state */
+	ret = nt36xxx_check_reset_state(ts, NT36XXX_STATE_INIT);
+	if (unlikely(ret < 0))
+		return ret;
+
+	/* Get informations from the TS firmware */
+	ret = nt36xxx_get_fw_info(ts);
+	if (unlikely(ret < 0))
+		return ret;
+
+	input->phys = devm_kasprintf(&hw_client->dev, GFP_KERNEL,
+				     "%s/input0", dev_name(&hw_client->dev));
+
+	input->name = "Novatek NT36XXX Touchscreen";
+	input->id.bustype = BUS_I2C;
+	input->dev.parent = &hw_client->dev;
+
+	__set_bit(EV_KEY, input->evbit);
+	__set_bit(EV_ABS, input->evbit);
+	input_set_capability(input, EV_KEY, BTN_TOUCH);
+
+	ret = input_mt_init_slots(input, TOUCH_MAX_FINGER_NUM,
+				  INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
+	if (ret) {
+		dev_err(&hw_client->dev, "Cannot init MT slots (%d)\n", ret);
+		return ret;
+	}
+
+	input_set_abs_params(input, ABS_MT_PRESSURE, 0,
+			     TOUCH_MAX_PRESSURE, 0, 0);
+	input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
+
+	input_set_abs_params(input, ABS_MT_POSITION_X, 0,
+			     ts->fw_info.abs_x_max - 1, 0, 0);
+	input_set_abs_params(input, ABS_MT_POSITION_Y, 0,
+			     ts->fw_info.abs_y_max - 1, 0, 0);
+
+	/* Override the firmware defaults, if needed */
+	touchscreen_parse_properties(input, true, &ts->prop);
+
+	input_set_drvdata(input, ts);
+
+	ret = input_register_device(ts->input);
+	if (ret) {
+		dev_err(&hw_client->dev, "Failed to register input device: %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = devm_request_threaded_irq(&hw_client->dev, hw_client->irq, NULL,
+					nt36xxx_i2c_irq_handler, IRQF_ONESHOT,
+					hw_client->name, ts);
+	if (ret) {
+		dev_err(&hw_client->dev, "request irq failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused nt36xxx_i2c_suspend(struct device *dev)
+{
+	struct nt36xxx_i2c *ts = i2c_get_clientdata(to_i2c_client(dev));
+	int ret;
+
+	disable_irq(ts->hw_client->irq);
+
+	ret = regmap_write(ts->fw_regmap, NT36XXX_EVT_HOST_CMD,
+			   NT36XXX_CMD_ENTER_SLEEP);
+	if (unlikely(ret)) {
+		dev_err(&ts->hw_client->dev, "Cannot enter suspend!!\n");
+		return ret;
+	}
+
+	if (ts->reset_gpio)
+		gpiod_set_value(ts->reset_gpio, 1);
+
+	return 0;
+}
+
+static int __maybe_unused nt36xxx_i2c_resume(struct device *dev)
+{
+	struct nt36xxx_i2c *ts = i2c_get_clientdata(to_i2c_client(dev));
+	int ret;
+
+	mutex_lock(&ts->lock);
+
+	if (ts->reset_gpio)
+		gpiod_set_value(ts->reset_gpio, 0);
+
+	/* Reboot the MCU (also recalibrates the TS) */
+	ret = nt36xxx_bootloader_reset(ts);
+	if (ret < 0)
+		goto end;
+
+	ret = nt36xxx_check_reset_state(ts, NT36XXX_STATE_REK);
+	if (ret < 0)
+		goto end;
+
+	enable_irq(ts->hw_client->irq);
+end:
+	mutex_unlock(&ts->lock);
+	return ret;
+}
+
+static SIMPLE_DEV_PM_OPS(nt36xxx_i2c_pm,
+			 nt36xxx_i2c_suspend, nt36xxx_i2c_resume);
+
+#ifdef CONFIG_OF
+static const struct of_device_id nt36xxx_of_match[] = {
+	{ .compatible = "novatek,nt36xxx" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nt36xxx_of_match);
+#endif
+
+static const struct i2c_device_id nt36xxx_i2c_ts_id[] = {
+	{ "NVT-ts", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, nt36xxx_i2c_ts_id);
+
+static struct i2c_driver nt36xxx_i2c_ts_driver = {
+	.driver = {
+		.name	= "nt36xxx_ts",
+		.pm	= &nt36xxx_i2c_pm,
+		.of_match_table = of_match_ptr(nt36xxx_of_match),
+	},
+	.probe		= nt36xxx_i2c_probe,
+	.id_table	= nt36xxx_i2c_ts_id,
+};
+module_i2c_driver(nt36xxx_i2c_ts_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Novatek NT36XXX Touchscreen Driver");
+
-- 
2.28.0

