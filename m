Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5300037A86A
	for <lists+linux-input@lfdr.de>; Tue, 11 May 2021 16:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbhEKOG3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 11 May 2021 10:06:29 -0400
Received: from mail.ilitek.com.tw ([60.248.80.92]:40513 "EHLO cello.ilitek.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231517AbhEKOG3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 11 May 2021 10:06:29 -0400
X-UUID: 3537985e73024e4f85589d6827c9a35c-20210511
X-UUID: 3537985e73024e4f85589d6827c9a35c-20210511
Received: from ex1.ili.com.tw [(192.168.1.131)] by cello.ilitek.com
        (envelope-from <joe_hung@ilitek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES128-GCM-SHA256 128/128)
        with ESMTP id 369680193; Tue, 11 May 2021 22:05:18 +0800
Received: from EX1.ili.com.tw (192.168.1.131) by EX1.ili.com.tw
 (192.168.1.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 11 May
 2021 22:05:17 +0800
Received: from joehung-Ilitek.mshome.net (192.168.18.73) by EX1.ili.com.tw
 (192.168.1.133) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 11 May 2021 22:05:17 +0800
From:   Joe Hung <joe_hung@ilitek.com>
To:     <dmitry.torokhov@gmail.com>, <devicetree@vger.kernel.org>
CC:     <linux-input@vger.kernel.org>, <joe_hung@ilitek.com>,
        <luca_hsu@ilitek.com>
Subject: [PATCH] Input: ilitek_ts_i2c - support firmware update
Date:   Tue, 11 May 2021 22:05:06 +0800
Message-ID: <20210511140506.378070-1-joe_hung@ilitek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Firmware upgrade via update_fw sysfs node for Lego series.
Lego series includes ILITEK 213X/23XX/25XX.

Tested/passed with evaluation board with ILI2520 IC.

Signed-off-by: Joe Hung <joe_hung@ilitek.com>
---
 drivers/input/touchscreen/ilitek_ts_i2c.c | 721 +++++++++++++++++++++-
 1 file changed, 719 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ilitek_ts_i2c.c b/drivers/input/touchscreen/ilitek_ts_i2c.c
index c5d259c76adc..b5ada9b44ab1 100644
--- a/drivers/input/touchscreen/ilitek_ts_i2c.c
+++ b/drivers/input/touchscreen/ilitek_ts_i2c.c
@@ -21,6 +21,7 @@
 #include <linux/acpi.h>
 #include <linux/input/touchscreen.h>
 #include <asm/unaligned.h>
+#include <linux/firmware.h>
 
 
 #define ILITEK_TS_NAME					"ilitek_ts"
@@ -37,14 +38,48 @@
 #define ILITEK_TP_CMD_GET_MCU_VER			0x61
 #define ILITEK_TP_CMD_GET_IC_MODE			0xC0
 
+#define ILITEK_TP_CMD_SET_MOD_CTRL			0xF0
+#define ILITEK_TP_CMD_GET_SYS_BUSY			0x80
+#define ILITEK_TP_CMD_SET_W_FLASH			0xCC
+#define ILITEK_TP_CMD_SET_AP_MODE			0xC1
+#define ILITEK_TP_CMD_SET_BL_MODE			0xC2
+#define ILITEK_TP_CMD_GET_BLK_CRC			0xCD
+#define ILITEK_TP_CMD_SET_W_DATA			0xC3
+#define ILITEK_TP_CMD_SET_DATA_LEN			0xC9
+
 #define REPORT_COUNT_ADDRESS				61
 #define ILITEK_SUPPORT_MAX_POINT			40
 
+#define ILITEK_CRC_POLY					0x8408
+#define ILITEK_HEX_UPGRADE_SIZE				(256 * 1024)
+#define ILITEK_UPGRADE_LEN				2048
+#define MOD_BL						0x55
+#define MOD_AP						0x5A
+
+#define ENTER_NORMAL_MODE				0
+#define ENTER_SUSPEND_MODE				3
+
 struct ilitek_protocol_info {
 	u16 ver;
 	u8 ver_major;
 };
 
+struct ilitek_block_info {
+	u32 start;
+	u32 end;
+	u16 ic_crc;
+	u16 fw_crc;
+	bool chk_crc;
+};
+
+struct ilitek_upgrade_info {
+	u16 fw_mcu_ver;
+	u32 map_ver;
+	u32 blk_num;
+	u32 fw_size;
+	struct ilitek_block_info *blk;
+};
+
 struct ilitek_ts_data {
 	struct i2c_client		*client;
 	struct gpio_desc		*reset_gpio;
@@ -65,6 +100,9 @@ struct ilitek_ts_data {
 	s32				screen_min_x;
 	s32				screen_min_y;
 	s32				max_tp;
+
+	/* FW Upgrade */
+	struct ilitek_upgrade_info	upg;
 };
 
 struct ilitek_protocol_map {
@@ -84,6 +122,16 @@ enum ilitek_cmds {
 	SET_IC_SLEEP,
 	SET_IC_WAKE,
 
+	SET_MOD_CTRL,
+	GET_SYS_BUSY,
+	SET_FLASH_AP,
+	SET_BL_MODE,
+	SET_AP_MODE,
+	GET_BLK_CRC,
+	SET_DATA_LEN,
+	SET_FLASH_BL,
+	SET_W_DATA,
+
 	/* ALWAYS keep at the end */
 	MAX_CMD_CNT
 };
@@ -227,6 +275,133 @@ static int api_protocol_set_cmd(struct ilitek_ts_data *ts,
 	return 0;
 }
 
+static int ilitek_check_busy(struct ilitek_ts_data *ts, u32 timeout)
+{
+	int error;
+	u8 buf[2];
+	u32 t = 0;
+
+	do {
+		error = api_protocol_set_cmd(ts, GET_SYS_BUSY, NULL, buf);
+		if (error)
+			return error;
+
+		if ((buf[0] & 0x51) == 0x50)
+			return 0;
+
+		msleep(20);
+		t += 20;
+	} while (timeout > t);
+
+	return -EBUSY;
+}
+
+static int ilitek_set_flash_BL1_8(struct ilitek_ts_data *ts, u32 start, u32 end)
+{
+	u8 inbuf[64];
+
+	inbuf[3] = start & 0xFF;
+	inbuf[4] = (start >> 8) & 0xFF;
+	inbuf[5] = (start >> 16) & 0xFF;
+	inbuf[6] = end & 0xFF;
+	inbuf[7] = (end >> 8) & 0xFF;
+	inbuf[8] = (end >> 16) & 0xFF;
+	return api_protocol_set_cmd(ts, SET_FLASH_BL, inbuf, NULL);
+}
+
+static int ilitek_set_data_len(struct ilitek_ts_data *ts, u32 data_len)
+{
+	u8 inbuf[3];
+
+	inbuf[1] = data_len & 0xFF;
+	inbuf[2] = (data_len >> 8) & 0xFF;
+	return api_protocol_set_cmd(ts, SET_DATA_LEN, inbuf, NULL);
+}
+
+static int ilitek_get_blk_crc(struct ilitek_ts_data *ts, u32 start, u32 end,
+			      u8 type, u16 *crc)
+{
+	u8 inbuf[8], outbuf[2];
+	int error;
+
+	inbuf[1] = type;
+	inbuf[2] = start & 0xFF;
+	inbuf[3] = (start >> 8) & 0xFF;
+	inbuf[4] = (start >> 16) & 0xFF;
+	inbuf[5] = end & 0xFF;
+	inbuf[6] = (end >> 8) & 0xFF;
+	inbuf[7] = (end >> 16) & 0xFF;
+
+	error = api_protocol_set_cmd(ts, GET_BLK_CRC, inbuf, outbuf);
+	if (error < 0)
+		return error;
+
+	*crc = get_unaligned_le16(outbuf);
+	return 0;
+}
+
+static int ilitek_switch_BLmode(struct ilitek_ts_data *ts, bool to_BLmode)
+{
+	int error, i;
+	struct device *dev = &ts->client->dev;
+	u8 outbuf[64];
+
+	error = api_protocol_set_cmd(ts, GET_IC_MODE, NULL, outbuf);
+	if (error < 0)
+		return error;
+
+	dev_dbg(dev, "change mode:%x to %x\n", ts->ic_mode,
+		(to_BLmode) ? MOD_BL : MOD_AP);
+
+	if ((ts->ic_mode == MOD_AP && !to_BLmode) ||
+	    (ts->ic_mode == MOD_BL && to_BLmode))
+		return 0;
+
+	for (i = 0; i < 5; i++) {
+		error = api_protocol_set_cmd(ts, SET_FLASH_AP, NULL, NULL);
+		if (error < 0)
+			return error;
+		msleep(20);
+
+		error = api_protocol_set_cmd(ts, (to_BLmode) ? SET_BL_MODE :
+					     SET_AP_MODE, NULL, NULL);
+		if (error < 0)
+			return error;
+
+		msleep(500 + i * 100);
+
+		error = api_protocol_set_cmd(ts, GET_IC_MODE, NULL, outbuf);
+		if (error < 0)
+			return error;
+
+		if ((ts->ic_mode == MOD_AP && !to_BLmode) ||
+		    (ts->ic_mode == MOD_BL && to_BLmode))
+			return 0;
+	}
+
+	dev_err(dev, "switch mode failed, current mode:%X\n", ts->ic_mode);
+
+	return -EFAULT;
+}
+
+static int ilitek_set_testmode(struct ilitek_ts_data *ts, bool testmode)
+{
+	u8 inbuf[3];
+	int error;
+
+
+	if (testmode)
+		inbuf[1] = ENTER_SUSPEND_MODE;
+	else
+		inbuf[1] = ENTER_NORMAL_MODE;
+
+	error = api_protocol_set_cmd(ts, SET_MOD_CTRL, inbuf, NULL);
+	if (error < 0)
+		return error;
+
+	return 0;
+}
+
 static int api_protocol_get_ptl_ver(struct ilitek_ts_data *ts,
 				    u16 cmd, u8 *inbuf, u8 *outbuf)
 {
@@ -351,6 +526,101 @@ static int api_protocol_set_ic_wake(struct ilitek_ts_data *ts,
 	return ilitek_i2c_write_and_read(ts, buf, 1, 0, NULL, 0);
 }
 
+static int api_protocol_set_mode_ctrl(struct ilitek_ts_data *ts, u16 cmd,
+				      u8 *inbuf, u8 *outbuf)
+{
+	inbuf[0] = cmd;
+	inbuf[2] = 0;
+
+	return ilitek_i2c_write_and_read(ts, inbuf, 3, 100, NULL, 0);
+}
+
+static int api_protocol_get_sys_busy(struct ilitek_ts_data *ts,
+				     u16 cmd, u8 *inbuf, u8 *outbuf)
+{
+	u8 buf[64];
+
+	buf[0] = cmd;
+	return ilitek_i2c_write_and_read(ts, buf, 1, 1, outbuf, 1);
+}
+
+static int api_protocol_set_write_flash_ap(struct ilitek_ts_data *ts,
+					   u16 cmd, u8 *inbuf, u8 *outbuf)
+{
+	u8 buf[64];
+
+	buf[0] = cmd;
+	buf[1] = 0x5A;
+	buf[2] = 0xA5;
+	return ilitek_i2c_write_and_read(ts, buf, 3, 0, NULL, 0);
+}
+
+static int api_protocol_set_write_flash_bl(struct ilitek_ts_data *ts,
+					   u16 cmd, u8 *inbuf, u8 *outbuf)
+{
+	inbuf[0] = cmd;
+	inbuf[1] = 0x5A;
+	inbuf[2] = 0xA5;
+	return ilitek_i2c_write_and_read(ts, inbuf, 9, 0, NULL, 0);
+}
+
+static int api_protocol_set_bl_mode(struct ilitek_ts_data *ts,
+				    u16 cmd, u8 *inbuf, u8 *outbuf)
+{
+	u8 buf[64];
+
+	buf[0] = cmd;
+	return ilitek_i2c_write_and_read(ts, buf, 1, 0, NULL, 0);
+}
+
+static int api_protocol_set_ap_mode(struct ilitek_ts_data *ts,
+				    u16 cmd, u8 *inbuf, u8 *outbuf)
+{
+	u8 buf[64];
+
+	buf[0] = cmd;
+	return ilitek_i2c_write_and_read(ts, buf, 1, 0, NULL, 0);
+}
+
+static int api_protocol_get_blk_crc(struct ilitek_ts_data *ts,
+				    u16 cmd, u8 *inbuf, u8 *outbuf)
+{
+	int ret = 0;
+
+	inbuf[0] = cmd;
+
+	/* Ask FW to calculate CRC first */
+	if (inbuf[1] == 0) {
+		ret = ilitek_i2c_write_and_read(ts, inbuf, 8, 0, NULL, 0);
+		if (ret < 0)
+			return ret;
+		ret = ilitek_check_busy(ts, 2500);
+		if (ret < 0)
+			return ret;
+	}
+
+	inbuf[1] = 1;
+	return ilitek_i2c_write_and_read(ts, inbuf, 2, 1, outbuf, 2);
+}
+
+static int api_protocol_set_data_length(struct ilitek_ts_data *ts,
+					u16 cmd, u8 *inbuf, u8 *outbuf)
+{
+
+	inbuf[0] = cmd;
+	return ilitek_i2c_write_and_read(ts, inbuf, 3, 0, NULL, 0);
+}
+
+static int api_protocol_set_write_data(struct ilitek_ts_data *ts, u16 cmd,
+				       u8 *inbuf, u8 *outbuf)
+{
+
+	inbuf[0] = cmd;
+
+	return ilitek_i2c_write_and_read(ts, inbuf, ILITEK_UPGRADE_LEN + 1, 0,
+					 NULL, 0);
+}
+
 static const struct ilitek_protocol_map ptl_func_map[] = {
 	/* common cmds */
 	[GET_PTL_VER] = {
@@ -371,11 +641,11 @@ static const struct ilitek_protocol_map ptl_func_map[] = {
 	},
 	[GET_IC_MODE] = {
 		ILITEK_TP_CMD_GET_IC_MODE, "GET_IC_MODE",
-			   api_protocol_get_ic_mode
+		api_protocol_get_ic_mode
 	},
 	[GET_MCU_VER] = {
 		ILITEK_TP_CMD_GET_MCU_VER, "GET_MOD_VER",
-			   api_protocol_get_mcu_ver
+		api_protocol_get_mcu_ver
 	},
 	[SET_IC_SLEEP] = {
 		ILITEK_TP_CMD_SET_IC_SLEEP, "SET_IC_SLEEP",
@@ -385,6 +655,42 @@ static const struct ilitek_protocol_map ptl_func_map[] = {
 		ILITEK_TP_CMD_SET_IC_WAKE, "SET_IC_WAKE",
 		api_protocol_set_ic_wake
 	},
+	[SET_MOD_CTRL] = {
+		ILITEK_TP_CMD_SET_MOD_CTRL, "SET_MOD_CTRL",
+		api_protocol_set_mode_ctrl
+	},
+	[GET_SYS_BUSY] = {
+		ILITEK_TP_CMD_GET_SYS_BUSY, "GET_SYS_BUSY",
+		api_protocol_get_sys_busy
+	},
+	[SET_FLASH_AP] = {
+		ILITEK_TP_CMD_SET_W_FLASH, "SET_FLASH_AP",
+		api_protocol_set_write_flash_ap
+	},
+	[SET_BL_MODE] = {
+		ILITEK_TP_CMD_SET_BL_MODE, "SET_BL_MODE",
+		api_protocol_set_bl_mode
+	},
+	[SET_AP_MODE] = {
+		ILITEK_TP_CMD_SET_AP_MODE, "SET_AP_MODE",
+		api_protocol_set_ap_mode
+	},
+	[GET_BLK_CRC] = {
+		ILITEK_TP_CMD_GET_BLK_CRC, "GET_BLK_CRC",
+		api_protocol_get_blk_crc
+	},
+	[SET_DATA_LEN] = {
+		ILITEK_TP_CMD_SET_DATA_LEN, "SET_DATA_LEN",
+		api_protocol_set_data_length
+	},
+	[SET_FLASH_BL] = {
+		ILITEK_TP_CMD_SET_W_FLASH, "SET_FLASH_BL",
+		api_protocol_set_write_flash_bl
+	},
+	[SET_W_DATA] = {
+		ILITEK_TP_CMD_SET_W_DATA, "SET_W_DATA",
+		api_protocol_set_write_data
+	},
 };
 
 /* Probe APIs */
@@ -532,9 +838,419 @@ static ssize_t product_id_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(product_id);
 
+static u32 ilitek_find_endaddr(u32 start, u32 end, u8 *buf, bool ap)
+{
+	u32 addr;
+	char ap_tag[16] = "ILITek AP CRC   ";
+	char blk_tag[16] = "ILITek END TAG  ";
+	char tag[32];
+
+	memset(tag, 0xff, 32);
+	if (ap)
+		memcpy(tag + 16, ap_tag, 16);
+	else
+		memcpy(tag + 16, blk_tag, 16);
+
+	for (addr = start; addr <= end - 32 &&
+	     addr < ILITEK_HEX_UPGRADE_SIZE - 32; addr++) {
+		if (!strncmp(buf + addr, tag, 32))
+			return addr + 33;
+	}
+
+	return end;
+}
+
+static int ilitek_info_mapping(struct ilitek_ts_data *ts, u32 addr, u8 *buf)
+{
+	u32 idx, i, start, end;
+	struct device *dev = &ts->client->dev;
+
+	idx = addr + 0x06;
+	ts->upg.fw_mcu_ver = get_unaligned_le16(buf + idx);
+
+	idx = addr + 0x00;
+	ts->upg.map_ver = buf[idx + 2] << 16 | buf[idx + 1] << 8 | buf[idx];
+
+	if (ts->upg.map_ver < 0x10000)
+		return -EINVAL;
+
+	ts->upg.blk_num = buf[addr + 0x50];
+
+	ts->upg.blk = kcalloc(ts->upg.blk_num, sizeof(struct ilitek_block_info),
+			      GFP_KERNEL);
+	if (!ts->upg.blk)
+		return -ENOMEM;
+
+	for (i = 0; i < ts->upg.blk_num; i++) {
+		idx = addr + 0x54 + 3 * i;
+		start = buf[idx + 2] << 16 | buf[idx + 1] << 8 | buf[idx];
+
+		if (i == ts->upg.blk_num - 1)
+			idx = addr + 123;
+		else
+			idx += 3;
+
+		end = buf[idx + 2] << 16 | buf[idx + 1] << 8 | buf[idx];
+
+		if (i == 0)
+			end = ilitek_find_endaddr(start, end, buf, true);
+		else
+			end = ilitek_find_endaddr(start, end, buf, false);
+
+		ts->upg.blk[i].start = start;
+		ts->upg.blk[i].end = end;
+
+		dev_dbg(dev, "block[%u] start: %#x, end: %#x\n", i, start, end);
+	}
+
+	return 0;
+}
+
+static u16 ilitek_update_crc(u16 crc, u8 newbyte)
+{
+	u8 i;
+
+	crc = crc ^ newbyte;
+
+	for (i = 0; i < 8; i++) {
+		if (crc & 0x01) {
+			crc = crc >> 1;
+			crc ^= ILITEK_CRC_POLY;
+		} else {
+			crc = crc >> 1;
+		}
+	}
+	return crc;
+}
+
+static u16 ilitek_get_fw_crc(u32 start, u32 end, u8 *buf)
+{
+	u16 CRC = 0;
+	u32 i = 0;
+
+	for (i = start; i <= end - 2; i++)
+		CRC = ilitek_update_crc(CRC, buf[i]);
+
+	return CRC;
+}
+
+static int ilitek_check_blk(struct ilitek_ts_data *ts, u8 *buf, bool *update)
+{
+	u32 i;
+	int error;
+	struct device *dev = &ts->client->dev;
+	struct ilitek_block_info *blk = ts->upg.blk;
+
+	for (i = 0; i < ts->upg.blk_num; i++) {
+		error = ilitek_get_blk_crc(ts, blk[i].start, blk[i].end, 0,
+					   &blk[i].ic_crc);
+		if (error < 0) {
+			dev_err(dev, "get blk crc failed, ret:%d\n", error);
+			return error;
+		}
+
+		blk[i].fw_crc = ilitek_get_fw_crc(blk[i].start,
+						   blk[i].end, buf);
+
+		if (blk[i].ic_crc != blk[i].fw_crc) {
+			blk[i].chk_crc = false;
+			*update = true;
+		} else
+			blk[i].chk_crc = true;
+
+		dev_dbg(dev, "block[%u]: start:%#x, end:%#x, ic crc:%#x, dri crc:%#x\n",
+			i, blk[i].start, blk[i].end,
+			blk[i].ic_crc, blk[i].fw_crc);
+	}
+
+	return 0;
+}
+
+static int ilitek_program_blk(struct ilitek_ts_data *ts, u8 *buf,
+			      u32 cnt, const u32 len)
+{
+	int error;
+	u32 i;
+	u8 *inbuf;
+	struct device *dev = &ts->client->dev;
+	struct ilitek_block_info *blk = ts->upg.blk;
+
+	inbuf = kmalloc(len + 1, GFP_KERNEL);
+	if (!inbuf)
+		return -ENOMEM;
+	memset(inbuf, 0xff, len + 1);
+
+	error = ilitek_set_flash_BL1_8(ts, blk[cnt].start, blk[cnt].end);
+	if (error < 0)
+		goto err_free;
+
+	for (i = blk[cnt].start; i < blk[cnt].end; i += len) {
+		memcpy(inbuf + 1, buf + i, len);
+
+		error = api_protocol_set_cmd(ts, SET_W_DATA, inbuf, NULL);
+		if (error < 0)
+			goto err_free;
+
+		error = ilitek_check_busy(ts, 2000);
+		if (error < 0) {
+			dev_err(dev, "check busy failed, ret:%d\n", error);
+			goto err_free;
+		}
+	}
+
+	error = ilitek_get_blk_crc(ts, blk[cnt].start, blk[cnt].end, 1,
+				   &blk[cnt].ic_crc);
+	if (error < 0) {
+		dev_err(dev, "get blk crc failed, ret:%d\n", error);
+		goto err_free;
+	}
+
+	if (blk[cnt].ic_crc != blk[cnt].fw_crc) {
+		dev_err(dev, "ic_crc:%x dri_crc:%x not matched\n",
+			blk[cnt].ic_crc, blk[cnt].fw_crc);
+		error = -EFAULT;
+	}
+
+err_free:
+	kfree(inbuf);
+	return error;
+}
+
+static int ilitek_upgrade_BL1_8(struct ilitek_ts_data *ts, u8 *buf)
+{
+	int error;
+	u32 cnt;
+	struct device *dev = &ts->client->dev;
+	struct ilitek_block_info *blk = ts->upg.blk;
+
+	error = ilitek_set_data_len(ts, ILITEK_UPGRADE_LEN);
+	if (error < 0)
+		return error;
+
+	for (cnt = 0; cnt < ts->upg.blk_num; cnt++) {
+		if (blk[cnt].chk_crc == true)
+			continue;
+
+		error = ilitek_program_blk(ts, buf, cnt, ILITEK_UPGRADE_LEN);
+		if (error < 0) {
+			dev_err(dev, "upgrade failed, ret:%d\n", error);
+			return error;
+		}
+	}
+
+	return 0;
+}
+
+static int ilitek_upgrade_firmware(struct ilitek_ts_data *ts, u8 *buf)
+{
+	int error, retry = 2;
+	struct device *dev = &ts->client->dev;
+	u8 outbuf[64];
+	bool need_update = false;
+
+	/* Check MCU version between device and firmware file */
+	if (ts->upg.fw_mcu_ver != ts->mcu_ver) {
+		dev_err(dev, "MCU version (MCU:%x and FW:%x) not match\n",
+			 ts->mcu_ver, ts->upg.fw_mcu_ver);
+		return -EINVAL;
+	}
+
+Retry:
+	if (--retry < 0) {
+		dev_err(dev, "retry 2 times upgrade fail, ret:%d\n", error);
+		return error;
+	}
+
+	ilitek_reset(ts, ts->reset_time);
+
+	error = ilitek_set_testmode(ts, true);
+	if (error < 0)
+		goto Retry;
+
+	error = ilitek_check_busy(ts, 1000);
+	if (error < 0)
+		goto Retry;
+
+	error = ilitek_check_blk(ts, buf, &need_update);
+	if (error < 0)
+		goto Retry;
+
+	if (need_update) {
+		error = ilitek_switch_BLmode(ts, true);
+		if (error < 0)
+			goto Retry;
+
+		/* get bootloader version */
+		error = api_protocol_set_cmd(ts, GET_PTL_VER, NULL, outbuf);
+		if (error < 0)
+			goto Retry;
+
+		error = ilitek_upgrade_BL1_8(ts, buf);
+		if (error < 0)
+			goto Retry;
+
+		error = ilitek_switch_BLmode(ts, false);
+		if (error < 0)
+			goto Retry;
+	}
+
+	/* switch back to normal mode after reset */
+	ilitek_reset(ts, ts->reset_time);
+
+	error = ilitek_protocol_init(ts);
+	if (error < 0)
+		goto Retry;
+
+	error = ilitek_read_tp_info(ts, true);
+	if (error < 0)
+		goto Retry;
+
+	return 0;
+}
+
+static int ilitek_parse_hex(struct ilitek_ts_data *ts, u32 *fw_size, u8 *fw_buf)
+{
+	int error;
+	char *fw_file;
+	const struct firmware *fw;
+	struct device *dev = &ts->client->dev;
+	u32 i, len, addr, type, exaddr = 0;
+	u8 info[4], data[16];
+
+	fw_file = kasprintf(GFP_KERNEL, "ilitek_%04x.hex", ts->mcu_ver);
+	if (!fw_file)
+		return -ENOMEM;
+
+	error = request_firmware(&fw, fw_file, dev);
+	kfree(fw_file);
+	if (error) {
+		dev_err(dev, "request firmware:%s failed, ret:%d\n",
+			fw_file, error);
+		return error;
+	}
+
+	for (i = 0; i < fw->size; i++) {
+		if (fw->data[i] == ':' ||
+		    fw->data[i] == 0x0D ||
+		    fw->data[i] == 0x0A)
+			continue;
+
+		error = hex2bin(info, fw->data + i, sizeof(info));
+		if (error)
+			goto release_fw;
+
+		len = info[0];
+		addr = get_unaligned_be16(info + 1);
+		type = info[3];
+
+		error = hex2bin(data, fw->data + i + 8, len);
+		if (error)
+			goto release_fw;
+
+		switch (type) {
+		case 0x01:
+			goto release_fw;
+		case 0x02:
+			exaddr = get_unaligned_be16(data);
+			exaddr <<= 4;
+			break;
+		case 0x04:
+			exaddr = get_unaligned_be16(data);
+			exaddr <<= 16;
+			break;
+		case 0xAC:
+		case 0xAD:
+			break;
+		case 0x00:
+			addr += exaddr;
+			memcpy(fw_buf + addr, data, len);
+			*fw_size = addr + len;
+			break;
+		default:
+			dev_err(dev, "unexpected type:%x in hex\n", type);
+			goto err_invalid;
+		}
+
+		i += 10 + (len * 2);
+	}
+
+err_invalid:
+	error = -EINVAL;
+
+release_fw:
+	release_firmware(fw);
+
+	return error;
+}
+
+
+static int ilitek_update_fw_v6(struct ilitek_ts_data *ts)
+{
+	u8 *fw_buf;
+	int error;
+	struct device *dev = &ts->client->dev;
+
+	fw_buf = vmalloc(ILITEK_HEX_UPGRADE_SIZE);
+	if (!fw_buf)
+		return -ENOMEM;
+	memset(fw_buf, 0xFF, ILITEK_HEX_UPGRADE_SIZE);
+
+	error = ilitek_parse_hex(ts, &ts->upg.fw_size, fw_buf);
+	if (error < 0) {
+		dev_err(dev, "parse fw file failed, err:%d\n", error);
+		goto err_free_buf;
+	}
+
+	error = ilitek_info_mapping(ts, 0x3020, fw_buf);
+	if (error < 0) {
+		dev_err(dev, "check hex mapping fail, ret:%d\n", error);
+		goto err_free_buf;
+	}
+
+	error = ilitek_upgrade_firmware(ts, fw_buf);
+	if (error < 0) {
+		dev_err(dev, "upgrade fail, ret:%d\n", error);
+		goto err_free_buf;
+	}
+
+	dev_dbg(dev, "update fw success\n");
+
+err_free_buf:
+	vfree(fw_buf);
+	kfree(ts->upg.blk);
+
+	return error;
+}
+
+static ssize_t update_fw_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	int error;
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ilitek_ts_data *ts = i2c_get_clientdata(client);
+
+	disable_irq(client->irq);
+
+	error = ilitek_update_fw_v6(ts);
+
+	enable_irq(client->irq);
+
+	if (error < 0) {
+		dev_err(dev, "ILITEK FW upgrade failed, ret:%d\n", error);
+		return error;
+	}
+
+	dev_dbg(dev, "firmware upgrade success !\n");
+
+	return count;
+}
+static DEVICE_ATTR_WO(update_fw);
+
 static struct attribute *ilitek_sysfs_attrs[] = {
 	&dev_attr_firmware_version.attr,
 	&dev_attr_product_id.attr,
+	&dev_attr_update_fw.attr,
 	NULL
 };
 
@@ -597,6 +1313,7 @@ static int ilitek_ts_i2c_probe(struct i2c_client *client,
 	}
 
 	error = devm_device_add_group(dev, &ilitek_attrs_group);
+
 	if (error) {
 		dev_err(dev, "sysfs create group failed: %d\n", error);
 		return error;
-- 
2.25.1


