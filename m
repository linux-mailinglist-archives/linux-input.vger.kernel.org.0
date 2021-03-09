Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9340533243A
	for <lists+linux-input@lfdr.de>; Tue,  9 Mar 2021 12:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbhCILjl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Mar 2021 06:39:41 -0500
Received: from mail.ilitek.com.tw ([60.248.80.92]:37724 "EHLO cello.ilitek.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229837AbhCILjL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 9 Mar 2021 06:39:11 -0500
X-UUID: 83396746749543179d24586d889c93a9-20210309
X-UUID: 83396746749543179d24586d889c93a9-20210309
Received: from ex2.ili.com.tw [(192.168.1.132)] by cello.ilitek.com
        (envelope-from <joe_hung@ilitek.com>)
        (Cellopoint E-mail Firewall v4.1.12 Build 0701 with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
        with ESMTP id 1976207829; Tue, 09 Mar 2021 19:39:06 +0800
Received: from EX1.ili.com.tw (192.168.1.131) by EX2.ili.com.tw
 (192.168.1.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 9 Mar 2021
 19:39:05 +0800
Received: from joehung-Ilitek.ili.com.tw (192.168.18.73) by EX1.ili.com.tw
 (192.168.1.133) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 9 Mar 2021 19:39:05 +0800
From:   Joe Hung <joe_hung@ilitek.com>
To:     <dmitry.torokhov@gmail.com>, <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <linux-input@vger.kernel.org>, <joe_hung@ilitek.com>,
        <luca_hsu@ilitek.com>
Subject: [PATCH v6 2/2] input: touchscreen: Add support for ILITEK Lego Series
Date:   Tue, 9 Mar 2021 19:39:14 +0800
Message-ID: <20210309113914.1862049-2-joe_hung@ilitek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210309113914.1862049-1-joe_hung@ilitek.com>
References: <20210309113914.1862049-1-joe_hung@ilitek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for ILITEK Lego series of touch devices.
Lego series includes ILITEK 213X/23XX/25XX.

Tested/passed with evaluation board with ILI2520/2322 IC.

Signed-off-by: Joe Hung <joe_hung@ilitek.com>
---
Changes in v6:
  - None

Changes in v5:
  - None

Changes in v4:
  - Remove unused inlcude header file
  - Remove parenthesis for scalar values
  - Place to use standard macro DIV_ROUND_UP
  - Remove unused/unrequired member of struct
  - Remove retries when I2C transfer
  - Remove irq_disable/enable wrapper
  - Remove key handler
  - Adjust to use get_unaligned_le16/be16
  - Modify ilitek_reset() to leave reset gpio in-active finally
  - Remove null check for input argument that should not happen
  - Modify return value for read_tp_info()
  - Modify to use common touchscreen_* api
  - Add error handling for input_mt_init_slots
  - Modify input flag for irq request, and parse it from ACPI/DTS
  - Return stored value instead of querying via I2C in *_show api
  - Modify to use devm_* APIs and get rid of remove api
  - Add PM (suspend/resume) handling

Changes in v3:
  - None

Changes in v2:
  - Remove irq-gpio and related flow

 drivers/input/touchscreen/Kconfig         |  12 +
 drivers/input/touchscreen/Makefile        |   1 +
 drivers/input/touchscreen/ilitek_ts_i2c.c | 761 ++++++++++++++++++++++
 3 files changed, 774 insertions(+)
 create mode 100644 drivers/input/touchscreen/ilitek_ts_i2c.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index f012fe746df0..03a16852d4bc 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -1334,4 +1334,16 @@ config TOUCHSCREEN_ZINITIX
 	  To compile this driver as a module, choose M here: the
 	  module will be called zinitix.

+config TOUCHSCREEN_ILITEK
+	tristate "Ilitek I2C 213X/23XX/25XX/Lego Series Touch ICs"
+	depends on I2C
+	help
+	  Say Y here if you have touchscreen with ILITEK touch IC,
+	  it supports 213X/23XX/25XX and other Lego series.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ilitek_ts_i2c.
+
 endif
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 6233541e9173..1622e66c4eaa 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -112,3 +112,4 @@ obj-$(CONFIG_TOUCHSCREEN_ROHM_BU21023)	+= rohm_bu21023.o
 obj-$(CONFIG_TOUCHSCREEN_RASPBERRYPI_FW)	+= raspberrypi-ts.o
 obj-$(CONFIG_TOUCHSCREEN_IQS5XX)	+= iqs5xx.o
 obj-$(CONFIG_TOUCHSCREEN_ZINITIX)	+= zinitix.o
+obj-$(CONFIG_TOUCHSCREEN_ILITEK)	+= ilitek_ts_i2c.o
diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
new file mode 100644
index 000000000000..2014a8c1250d
--- /dev/null
+++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
@@ -0,0 +1,761 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ILITEK Touch IC driver for 23XX, 25XX and Lego series
+ *
+ * Copyright (C) 2011 ILI Technology Corporation.
+ * Copyright (C) 2020 Luca Hsu <luca_hsu@ilitek.com>
+ * Copyright (C) 2021 Joe Hung <joe_hung@ilitek.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/i2c.h>
+#include <linux/slab.h>
+#include <linux/delay.h>
+#include <linux/interrupt.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/errno.h>
+#include <linux/acpi.h>
+#include <linux/input/touchscreen.h>
+#include <asm/unaligned.h>
+
+
+#define ILITEK_TS_NAME					"ilitek_ts"
+#define BL_V1_8						0x108
+#define BL_V1_7						0x107
+#define BL_V1_6						0x106
+
+#define ILITEK_TP_CMD_GET_TP_RES			0x20
+#define ILITEK_TP_CMD_GET_SCRN_RES			0x21
+#define ILITEK_TP_CMD_SET_IC_SLEEP			0x30
+#define ILITEK_TP_CMD_SET_IC_WAKE			0x31
+#define ILITEK_TP_CMD_GET_FW_VER			0x40
+#define ILITEK_TP_CMD_GET_PRL_VER			0x42
+#define ILITEK_TP_CMD_GET_MCU_VER			0x61
+#define ILITEK_TP_CMD_GET_IC_MODE			0xC0
+
+#define REPORT_ADDRESS_COUNT				61
+#define ILITEK_SUPPORT_MAX_POINT			40
+
+#define PTL_V3						0x03
+#define PTL_V6						0x06
+
+#define MOD_AP						0x5A
+#define MOD_BL						0x55
+
+
+struct ilitek_protocol_info {
+	u16 ver;
+	u8 ver_major;
+	u8 flag;
+};
+
+struct ilitek_touch_info {
+	u16 id;
+	u16 x;
+	u16 y;
+	u16 p;
+	u16 w;
+	u16 h;
+	u16 status;
+};
+
+struct ilitek_ts_data {
+	struct i2c_client		*client;
+	struct gpio_desc		*reset_gpio;
+	struct input_dev		*input_dev;
+	struct touchscreen_properties	prop;
+
+	int (*process_and_report)(struct ilitek_ts_data *ilitek_data);
+
+	struct PROTOCOL_MAP		*ptl_cb_func;
+	struct ilitek_protocol_info	ptl;
+
+	struct ilitek_touch_info	tpinfo[ILITEK_SUPPORT_MAX_POINT];
+
+	char				product_id[30];
+	u16				mcu_ver;
+	u8				ic_mode;
+	u8				firmware_ver[8];
+
+	s32				reset_time;
+	s32				screen_max_x;
+	s32				screen_max_y;
+	s32				screen_min_x;
+	s32				screen_min_y;
+	s32				max_tp;
+};
+
+enum ilitek_cmds {
+	/* common cmds */
+	GET_PTL_VER = 0,
+	GET_FW_VER,
+	GET_SCRN_RES,
+	GET_TP_RES,
+	GET_IC_MODE,
+	GET_MCU_VER,
+	SET_IC_SLEEP,
+	SET_IC_WAKE,
+
+	/* ALWAYS keep at the end */
+	MAX_CMD_CNT
+};
+
+typedef int protocol_func(struct ilitek_ts_data *ilitek_data,
+			  u16 cmd, u8 *inbuf, u8 *outbuf);
+
+struct PROTOCOL_MAP {
+	u16 cmd;
+	const char *name;
+	protocol_func *func;
+	u8 flag;
+};
+
+/* ILITEK I2C R/W APIs */
+static int ilitek_i2c_write_and_read(struct ilitek_ts_data *ilitek_data,
+				     u8 *cmd, int write_len, int delay,
+				     u8 *data, int read_len)
+{
+	int ret = 0;
+	struct i2c_client *client = ilitek_data->client;
+	struct i2c_msg msgs[2] = {
+		{.addr = client->addr, .flags = 0,
+		 .len = write_len, .buf = cmd,},
+		{.addr = client->addr, .flags = I2C_M_RD,
+		 .len = read_len, .buf = data,}
+	};
+
+	if (delay == 0 && write_len > 0 && read_len > 0) {
+		ret = i2c_transfer(client->adapter, msgs, 2);
+		if (ret < 0)
+			return ret;
+	} else {
+		if (write_len > 0) {
+			ret = i2c_transfer(client->adapter, msgs, 1);
+			if (ret < 0)
+				return ret;
+		}
+		if (delay > 0)
+			mdelay(delay);
+		if (read_len > 0) {
+			ret = i2c_transfer(client->adapter, msgs + 1, 1);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+/* ILITEK ISR APIs */
+static void ilitek_touch_down(struct ilitek_ts_data *ilitek_data,
+			      int id, int x, int y, int p, int h, int w)
+{
+	struct input_dev *input = ilitek_data->input_dev;
+
+	input_report_key(input, BTN_TOUCH, 1);
+
+	input_mt_slot(input, id);
+	input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
+
+	touchscreen_report_pos(input, &ilitek_data->prop, x, y, true);
+
+	input_event(input, EV_ABS, ABS_MT_TOUCH_MAJOR, h);
+	input_event(input, EV_ABS, ABS_MT_WIDTH_MAJOR, w);
+
+	ilitek_data->tpinfo[id].status = 1;
+	ilitek_data->tpinfo[id].id = id;
+	ilitek_data->tpinfo[id].x = x;
+	ilitek_data->tpinfo[id].y = y;
+	ilitek_data->tpinfo[id].p = p;
+	ilitek_data->tpinfo[id].h = h;
+	ilitek_data->tpinfo[id].w = w;
+}
+
+static void ilitek_touch_release(struct ilitek_ts_data *ilitek_data, int id)
+{
+	struct input_dev *input = ilitek_data->input_dev;
+
+	if (ilitek_data->tpinfo[id].status == 1) {
+		input_mt_slot(input, id);
+		input_mt_report_slot_state(input, MT_TOOL_FINGER, false);
+		ilitek_data->tpinfo[id].status = 0;
+	}
+}
+
+static void ilitek_touch_release_all(struct ilitek_ts_data *ilitek_data)
+{
+	struct input_dev *input = ilitek_data->input_dev;
+	int i = 0;
+
+	for (i = 0; i < ilitek_data->max_tp; i++)
+		ilitek_touch_release(ilitek_data, i);
+	input_report_key(input, BTN_TOUCH, 0);
+	input_sync(input);
+}
+
+static int ilitek_process_and_report_v6(struct ilitek_ts_data *ilitek_data)
+{
+	int ret = 0;
+	u8 buf[512] = {0};
+	int packet_len = 5;
+	int packet_max_point = 10;
+	int report_max_point = 6;
+	int release_point = 0;
+	int i = 0, count = 0;
+	struct input_dev *input = ilitek_data->input_dev;
+	struct device *dev = &ilitek_data->client->dev;
+	u16 x, y, p = 10, w = 10, h = 10, status, id;
+
+	ret = ilitek_i2c_write_and_read(ilitek_data, NULL, 0, 0, buf, 64);
+	if (ret < 0) {
+		dev_err(dev, "get touch info failed, err:%d\n", ret);
+		goto err_release_touch_and_key;
+	}
+
+	report_max_point = buf[REPORT_ADDRESS_COUNT];
+	if (report_max_point > ilitek_data->max_tp) {
+		dev_err(dev, "FW report max point:%d > panel info. max:%d\n",
+			report_max_point, ilitek_data->max_tp);
+		ret = -EINVAL;
+		goto err_release_touch_and_key;
+	}
+
+	count = DIV_ROUND_UP(report_max_point, packet_max_point);
+	for (i = 1; i < count; i++) {
+		ret = ilitek_i2c_write_and_read(ilitek_data, NULL, 0, 0,
+			buf + i * 64, 64);
+		if (ret < 0) {
+			dev_err(dev, "get touch info. err, count=%d\n", count);
+			goto err_release_touch_and_key;
+		}
+	}
+
+	for (i = 0; i < report_max_point; i++) {
+		status = buf[i * packet_len + 1] & 0x40;
+		id = buf[i * packet_len + 1] & 0x3F;
+
+		if (!status) {
+			release_point++;
+			ilitek_touch_release(ilitek_data, id);
+			continue;
+		}
+
+		x = get_unaligned_le16(buf + i * packet_len + 2);
+		y = get_unaligned_le16(buf + i * packet_len + 4);
+
+		if (x > ilitek_data->screen_max_x ||
+		    y > ilitek_data->screen_max_y ||
+		    x < ilitek_data->screen_min_x ||
+		    y < ilitek_data->screen_min_y)
+			continue;
+
+		ilitek_touch_down(ilitek_data, id, x, y, p, h, w);
+	}
+
+	if (release_point == report_max_point)
+		ilitek_touch_release_all(ilitek_data);
+
+	input_sync(input);
+	return 0;
+
+err_release_touch_and_key:
+	ilitek_touch_release_all(ilitek_data);
+	input_sync(input);
+	return ret;
+}
+
+
+/* APIs of cmds for ILITEK Touch IC */
+static int api_protocol_set_cmd(struct ilitek_ts_data *ilitek_data,
+				u16 idx, u8 *inbuf, u8 *outbuf)
+{
+	u16 cmd;
+	int ret = 0;
+
+	if (idx >= MAX_CMD_CNT)
+		return -EINVAL;
+
+	/* check if cmd is supported by its protocol version */
+	if (!(ilitek_data->ptl.flag & ilitek_data->ptl_cb_func[idx].flag))
+		return -EINVAL;
+
+	cmd = ilitek_data->ptl_cb_func[idx].cmd;
+	ret = ilitek_data->ptl_cb_func[idx].func(ilitek_data, cmd,
+						 inbuf, outbuf);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int api_protocol_get_ptl_ver(struct ilitek_ts_data *ilitek_data,
+				    u16 cmd, u8 *inbuf, u8 *outbuf)
+{
+	int ret = 0;
+	u8 buf[64] = {0};
+
+	buf[0] = cmd;
+	ret = ilitek_i2c_write_and_read(ilitek_data, buf, 1, 5, outbuf, 3);
+	if (ret < 0)
+		return ret;
+
+	ilitek_data->ptl.ver = get_unaligned_be16(outbuf);
+	ilitek_data->ptl.ver_major = outbuf[0];
+
+	return ret;
+}
+
+static int api_protocol_get_mcu_ver(struct ilitek_ts_data *ilitek_data,
+				    u16 cmd, u8 *inbuf, u8 *outbuf)
+{
+	int ret = 0;
+	u8 buf[64] = {0};
+
+	buf[0] = cmd;
+	ret = ilitek_i2c_write_and_read(ilitek_data, buf, 1, 5, outbuf, 32);
+	if (ret < 0)
+		return ret;
+
+	ilitek_data->mcu_ver = get_unaligned_le16(outbuf);
+	memset(ilitek_data->product_id, 0, sizeof(ilitek_data->product_id));
+	memcpy(ilitek_data->product_id, outbuf+6, 26);
+
+	return ret;
+}
+
+static int api_protocol_get_fw_ver(struct ilitek_ts_data *ilitek_data,
+				   u16 cmd, u8 *inbuf, u8 *outbuf)
+{
+	int ret = 0;
+	u8 buf[64] = {0};
+
+	buf[0] = cmd;
+	ret = ilitek_i2c_write_and_read(ilitek_data, buf, 1, 5, outbuf, 8);
+	if (ret < 0)
+		return ret;
+
+	memcpy(ilitek_data->firmware_ver, outbuf, 8);
+
+	return ret;
+}
+
+static int api_protocol_get_scrn_res(struct ilitek_ts_data *ilitek_data,
+				     u16 cmd, u8 *inbuf, u8 *outbuf)
+{
+	int ret = 0;
+	u8 buf[64] = {0};
+
+	buf[0] = cmd;
+	ret = ilitek_i2c_write_and_read(ilitek_data, buf, 1, 5, outbuf, 8);
+	if (ret < 0)
+		return ret;
+
+	ilitek_data->screen_min_x = get_unaligned_le16(outbuf);
+	ilitek_data->screen_min_y = get_unaligned_le16(outbuf + 2);
+	ilitek_data->screen_max_x = get_unaligned_le16(outbuf + 4);
+	ilitek_data->screen_max_y = get_unaligned_le16(outbuf + 6);
+
+	return ret;
+}
+
+static int api_protocol_get_tp_res(struct ilitek_ts_data *ilitek_data,
+				      u16 cmd, u8 *inbuf, u8 *outbuf)
+{
+	int ret = 0;
+	u8 buf[64] = {0};
+
+	buf[0] = cmd;
+	ret = ilitek_i2c_write_and_read(ilitek_data, buf, 1, 5, outbuf, 15);
+	if (ret < 0)
+		return ret;
+
+	ilitek_data->max_tp = outbuf[8];
+
+	if (ilitek_data->max_tp > ILITEK_SUPPORT_MAX_POINT) {
+		dev_err(&ilitek_data->client->dev, "Invalid MAX_TP:%d from FW\n",
+			ilitek_data->max_tp);
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+static int api_protocol_get_ic_mode(struct ilitek_ts_data *ilitek_data,
+				    u16 cmd, u8 *inbuf, u8 *outbuf)
+{
+	int ret = 0;
+	u8 buf[64] = {0};
+
+	buf[0] = cmd;
+	ret = ilitek_i2c_write_and_read(ilitek_data, buf, 1, 5, outbuf, 2);
+	if (ret < 0)
+		return ret;
+
+	ilitek_data->ic_mode = outbuf[0];
+	return ret;
+}
+
+static int api_protocol_set_ic_sleep(struct ilitek_ts_data *ilitek_data,
+				    u16 cmd, u8 *inbuf, u8 *outbuf)
+{
+	u8 buf[64] = {0};
+
+	buf[0] = cmd;
+	return ilitek_i2c_write_and_read(ilitek_data, buf, 1, 0, NULL, 0);
+}
+
+static int api_protocol_set_ic_wake(struct ilitek_ts_data *ilitek_data,
+				    u16 cmd, u8 *inbuf, u8 *outbuf)
+{
+	u8 buf[64] = {0};
+
+	buf[0] = cmd;
+	return ilitek_i2c_write_and_read(ilitek_data, buf, 1, 0, NULL, 0);
+}
+
+struct PROTOCOL_MAP ptl_func_map[] = {
+	/* common cmds */
+	[GET_PTL_VER]	= {ILITEK_TP_CMD_GET_PRL_VER, "GET_PTL_VER",
+			   api_protocol_get_ptl_ver, PTL_V3 | PTL_V6},
+	[GET_FW_VER]	= {ILITEK_TP_CMD_GET_FW_VER, "GET_FW_VER",
+			   api_protocol_get_fw_ver, PTL_V3 | PTL_V6},
+	[GET_SCRN_RES]	= {ILITEK_TP_CMD_GET_SCRN_RES, "GET_SCRN_RES",
+			   api_protocol_get_scrn_res, PTL_V3 | PTL_V6},
+	[GET_TP_RES]	= {ILITEK_TP_CMD_GET_TP_RES, "GET_TP_RES",
+			   api_protocol_get_tp_res, PTL_V3 | PTL_V6},
+	[GET_IC_MODE]	= {ILITEK_TP_CMD_GET_IC_MODE, "GET_IC_MODE",
+			   api_protocol_get_ic_mode, PTL_V3 | PTL_V6},
+	[GET_MCU_VER]	= {ILITEK_TP_CMD_GET_MCU_VER, "GET_MOD_VER",
+			   api_protocol_get_mcu_ver, PTL_V3 | PTL_V6},
+	[SET_IC_SLEEP]	= {ILITEK_TP_CMD_SET_IC_SLEEP, "SET_IC_SLEEP",
+			   api_protocol_set_ic_sleep, PTL_V3 | PTL_V6},
+	[SET_IC_WAKE]	= {ILITEK_TP_CMD_SET_IC_WAKE, "SET_IC_WAKE",
+			   api_protocol_set_ic_wake, PTL_V3 | PTL_V6},
+};
+
+/* Probe APIs */
+static void ilitek_reset(struct ilitek_ts_data *ilitek_data,
+			 int delay, bool boot)
+{
+	if (!boot)
+		disable_irq_nosync(ilitek_data->client->irq);
+
+	if (ilitek_data->reset_gpio) {
+		gpiod_set_value(ilitek_data->reset_gpio, 1);
+		mdelay(10);
+
+		gpiod_set_value(ilitek_data->reset_gpio, 0);
+		mdelay(delay);
+	}
+
+	if (!boot)
+		enable_irq(ilitek_data->client->irq);
+}
+
+static int ilitek_protocol_init(struct ilitek_ts_data *ilitek_data)
+{
+	int ret = 0;
+	u8 outbuf[64] = {0};
+
+	ilitek_data->ptl.flag = PTL_V6;
+	ilitek_data->ptl_cb_func = ptl_func_map;
+	ilitek_data->process_and_report = ilitek_process_and_report_v6;
+	ilitek_data->reset_time = 600;
+
+	ret = api_protocol_set_cmd(ilitek_data, GET_PTL_VER, NULL, outbuf);
+	if (ret < 0)
+		return ret;
+
+	/* Protocol v3 is not support currently */
+	if (ilitek_data->ptl.ver_major == 0x3 ||
+	    ilitek_data->ptl.ver == BL_V1_6 ||
+	    ilitek_data->ptl.ver == BL_V1_7)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int ilitek_read_tp_info(struct ilitek_ts_data *ilitek_data, bool boot)
+{
+	u8 outbuf[256] = {0};
+	int error = 0;
+
+	error = api_protocol_set_cmd(ilitek_data, GET_PTL_VER, NULL, outbuf);
+	if (error < 0)
+		return error;
+
+	error = api_protocol_set_cmd(ilitek_data, GET_MCU_VER, NULL, outbuf);
+	if (error < 0)
+		return error;
+
+	error = api_protocol_set_cmd(ilitek_data, GET_FW_VER, NULL, outbuf);
+	if (error < 0)
+		return error;
+
+	if (boot) {
+		error = api_protocol_set_cmd(ilitek_data, GET_SCRN_RES, NULL,
+					     outbuf);
+		if (error < 0)
+			return error;
+	}
+
+	error = api_protocol_set_cmd(ilitek_data, GET_TP_RES, NULL, outbuf);
+	if (error < 0)
+		return error;
+
+	error = api_protocol_set_cmd(ilitek_data, GET_IC_MODE, NULL, outbuf);
+	if (error < 0)
+		return error;
+
+	return 0;
+}
+
+static int ilitek_input_dev_init(struct device *dev,
+				 struct ilitek_ts_data *ilitek_data)
+{
+	int ret = 0;
+	struct input_dev *input = NULL;
+
+	input = devm_input_allocate_device(dev);
+	if (!input)
+		return -ENOMEM;
+
+	ilitek_data->input_dev = input;
+	input->name = ILITEK_TS_NAME;
+	input->id.bustype = BUS_I2C;
+
+	__set_bit(INPUT_PROP_DIRECT, input->propbit);
+	input->evbit[0] = BIT_MASK(EV_KEY) | BIT_MASK(EV_ABS);
+	input->keybit[BIT_WORD(BTN_TOUCH)] = BIT_MASK(BTN_TOUCH);
+
+	input_set_abs_params(input, ABS_MT_POSITION_X,
+			     ilitek_data->screen_min_x,
+			     ilitek_data->screen_max_x, 0, 0);
+	input_set_abs_params(input, ABS_MT_POSITION_Y,
+			     ilitek_data->screen_min_y,
+			     ilitek_data->screen_max_y, 0, 0);
+	input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
+	input_set_abs_params(input, ABS_MT_WIDTH_MAJOR, 0, 255, 0, 0);
+
+	touchscreen_parse_properties(input, true, &ilitek_data->prop);
+
+	ret = input_mt_init_slots(input, ilitek_data->max_tp, INPUT_MT_DIRECT);
+	if (ret) {
+		dev_err(dev, "failed to initialize MT slots, err:%d\n", ret);
+		return ret;
+	}
+
+	ret = input_register_device(input);
+	if (ret) {
+		dev_err(dev, "failed to register input device, err:%d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static irqreturn_t ilitek_i2c_isr(int irq, void *dev_id)
+{
+	struct ilitek_ts_data *ilitek_data = dev_id;
+	int ret = 0;
+
+	ret = ilitek_data->process_and_report(ilitek_data);
+
+	if (ret < 0) {
+		dev_err(&ilitek_data->client->dev, "process and report point failed, err:%d\n",
+			ret);
+		return IRQ_NONE;
+	}
+
+	return IRQ_HANDLED;
+}
+
+static ssize_t firmware_version_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ilitek_ts_data *ilitek_data = i2c_get_clientdata(client);
+
+	return scnprintf(buf, PAGE_SIZE,
+			 "%d.%d.%d.%d.%d.%d.%d.%d\n",
+			 ilitek_data->firmware_ver[0],
+			 ilitek_data->firmware_ver[1],
+			 ilitek_data->firmware_ver[2],
+			 ilitek_data->firmware_ver[3],
+			 ilitek_data->firmware_ver[4],
+			 ilitek_data->firmware_ver[5],
+			 ilitek_data->firmware_ver[6],
+			 ilitek_data->firmware_ver[7]);
+}
+static DEVICE_ATTR_RO(firmware_version);
+
+static ssize_t product_id_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ilitek_ts_data *ilitek_data = i2c_get_clientdata(client);
+
+	return scnprintf(buf, PAGE_SIZE, "%s\n", ilitek_data->product_id);
+}
+static DEVICE_ATTR_RO(product_id);
+
+static struct attribute *ilitek_sysfs_attrs[] = {
+	&dev_attr_firmware_version.attr,
+	&dev_attr_product_id.attr,
+	NULL
+};
+
+static struct attribute_group ilitek_attrs_group[] = {
+	{.attrs = ilitek_sysfs_attrs},
+};
+
+static int ilitek_ts_i2c_probe(struct i2c_client *client,
+			       const struct i2c_device_id *id)
+{
+	struct ilitek_ts_data *ilitek_data = NULL;
+	struct device *dev = &client->dev;
+	int ret = 0;
+
+	ilitek_data = devm_kzalloc(dev, sizeof(*ilitek_data), GFP_KERNEL);
+	if (!ilitek_data)
+		return -ENOMEM;
+
+	ilitek_data->client = client;
+	i2c_set_clientdata(client, ilitek_data);
+
+	ilitek_data->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(ilitek_data->reset_gpio)) {
+		ret = PTR_ERR(ilitek_data->reset_gpio);
+		dev_err(dev, "request gpiod failed, err:%d", ret);
+		return ret;
+	}
+
+	ilitek_reset(ilitek_data, 1000, true);
+	ret = ilitek_protocol_init(ilitek_data);
+	if (ret < 0) {
+		dev_err(dev, "protocol init failed, err:%d", ret);
+		return ret;
+	}
+
+	ret = ilitek_read_tp_info(ilitek_data, true);
+	if (ret < 0) {
+		dev_err(dev, "read tp info failed, err:%d", ret);
+		return ret;
+	}
+
+	ret = ilitek_input_dev_init(dev, ilitek_data);
+	if (ret < 0) {
+		dev_err(dev, "input dev init failed, err:%d", ret);
+		return ret;
+	}
+
+	ret = devm_request_threaded_irq(dev, ilitek_data->client->irq, NULL,
+					ilitek_i2c_isr, IRQF_ONESHOT,
+					"ilitek_touch_irq", ilitek_data);
+	if (ret) {
+		dev_err(dev, "request threaded irq failed, err:%d\n", ret);
+		return ret;
+	}
+
+	ret = devm_device_add_group(dev, ilitek_attrs_group);
+	if (ret) {
+		dev_err(dev, "sysfs create group failed, err:%d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused ilitek_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ilitek_ts_data *ilitek_data = i2c_get_clientdata(client);
+	int error = 0;
+
+	disable_irq(client->irq);
+
+	if (device_may_wakeup(dev)) {
+		enable_irq_wake(client->irq);
+	} else {
+		error = api_protocol_set_cmd(ilitek_data, SET_IC_SLEEP,
+					     NULL, NULL);
+		if (error < 0)
+			return error;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused ilitek_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ilitek_ts_data *ilitek_data = i2c_get_clientdata(client);
+	int error = 0;
+
+	if (device_may_wakeup(dev)) {
+		disable_irq_wake(client->irq);
+	} else {
+		error = api_protocol_set_cmd(ilitek_data, SET_IC_WAKE,
+					     NULL, NULL);
+		if (error < 0)
+			return error;
+	}
+
+	ilitek_reset(ilitek_data, ilitek_data->reset_time, false);
+	enable_irq(client->irq);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(ilitek_pm_ops, ilitek_suspend, ilitek_resume);
+
+static const struct i2c_device_id ilitek_ts_i2c_id[] = {
+	{ILITEK_TS_NAME, 0},
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, ilitek_ts_i2c_id);
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id ilitekts_acpi_id[] = {
+	{ "ILTK0001", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, ilitekts_acpi_id);
+#endif
+
+#ifdef CONFIG_OF
+static const struct of_device_id ilitek_ts_i2c_match[] = {
+	{.compatible = "ilitek,ili2130",},
+	{.compatible = "ilitek,ili2131",},
+	{.compatible = "ilitek,ili2132",},
+	{.compatible = "ilitek,ili2316",},
+	{.compatible = "ilitek,ili2322",},
+	{.compatible = "ilitek,ili2323",},
+	{.compatible = "ilitek,ili2326",},
+	{.compatible = "ilitek,ili2520",},
+	{.compatible = "ilitek,ili2521",},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ilitek_ts_i2c_match);
+#endif
+
+static struct i2c_driver ilitek_ts_i2c_driver = {
+	.driver = {
+		.name = ILITEK_TS_NAME,
+		.pm = &ilitek_pm_ops,
+		.of_match_table = of_match_ptr(ilitek_ts_i2c_match),
+		.acpi_match_table = ACPI_PTR(ilitekts_acpi_id),
+	},
+	.probe = ilitek_ts_i2c_probe,
+	.id_table = ilitek_ts_i2c_id,
+};
+
+module_i2c_driver(ilitek_ts_i2c_driver);
+
+MODULE_AUTHOR("ILITEK");
+MODULE_DESCRIPTION("ILITEK I2C Touchscreen Driver");
+MODULE_LICENSE("GPL");
--
2.25.1


