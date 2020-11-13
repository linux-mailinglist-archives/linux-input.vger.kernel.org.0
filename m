Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A33B22B180A
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 10:18:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgKMJS4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 13 Nov 2020 04:18:56 -0500
Received: from gw.zinitix.com ([211.115.80.188]:41690 "EHLO zinitix.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726202AbgKMJSx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Nov 2020 04:18:53 -0500
rtoaddr: linux-input@vger.kernel.org
Received: (qmail 1609898 invoked by uid 11001); 13 Nov 2020 18:18:10 +0900
Hanbiro-auth: kdson@zinitix.com
Hanbiro-rcptto: linux-input@vger.kernel.org|linux-kernel@vger.kernel.org|dmitry.torokhov@gmail.com|kdson@zinitix.com
Hanbiro-remoteip: 127.0.0.1
Hanbiro-Virus: None
Hanbiro-rbl: None
HBSender: kdson@zinitix.com
Received: from unknown (HELO zinitix-H370AORUSGAMING3) (kdson@211.238.111.254)
        by 0 (qmail 1.03 + ejcp v14 + HB patch) with SMTP;
        13 Nov 2020 18:18:10 +0900
Date:   Fri, 13 Nov 2020 18:18:08 +0900
From:   KwangDeok Son <kdson@zinitix.com>
To:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     dmitry.torokhov@gmail.com, kdson@zinitix.com
Subject: Re: [PATCH] Input: add new touchpad driver for Zinitix IC
Message-ID: <20201113181808.3e4f28c9@zinitix-H370AORUSGAMING3>
Organization: Zinitix
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[Fixed Warnings.]
Add new touchpad driver for Zinitix IC 
Supports five fingers multi-touch and firmware updates.
It communicates with the device via an I2C bus.

Signed-off-by : KwangDeok Son <kdson@zinitix.com>

---
diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
index d8b6a5dab190..effd1b019b02 100644
--- a/drivers/input/mouse/Kconfig
+++ b/drivers/input/mouse/Kconfig
@@ -457,4 +457,15 @@ config MOUSE_NAVPOINT_PXA27x
 	  To compile this driver as a module, choose M here: the
 	  module will be called navpoint.
 
+config MOUSE_ZINITIX_I2C
+	tristate "ZINITIX I2C Touchpad support"
+	depends on I2C
+	help
+	  This driver adds support for Zinitix I2C Touchpad.
+
+	  Say Y here if you have a Zinitix I2C Touchpad.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called zinitix_i2c.
+
 endif
diff --git a/drivers/input/mouse/Makefile b/drivers/input/mouse/Makefile
index e49f08565076..93ffa556a311 100644
--- a/drivers/input/mouse/Makefile
+++ b/drivers/input/mouse/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_MOUSE_SERIAL)		+= sermouse.o
 obj-$(CONFIG_MOUSE_SYNAPTICS_I2C)	+= synaptics_i2c.o
 obj-$(CONFIG_MOUSE_SYNAPTICS_USB)	+= synaptics_usb.o
 obj-$(CONFIG_MOUSE_VSXXXAA)		+= vsxxxaa.o
+obj-$(CONFIG_MOUSE_ZINITIX_I2C)		+= zinitix_i2c.o
 
 cyapatp-objs := cyapa.o cyapa_gen3.o cyapa_gen5.o cyapa_gen6.o
 psmouse-objs := psmouse-base.o synaptics.o focaltech.o
diff --git a/drivers/input/mouse/zinitix_i2c.c b/drivers/input/mouse/zinitix_i2c.c
index e69de29bb2d1..d441b1cb1274 100755
--- a/drivers/input/mouse/zinitix_i2c.c
+++ b/drivers/input/mouse/zinitix_i2c.c
@@ -0,0 +1,1491 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Zinitics I2C Touchpad driver
+ *
+ * Copyright (c) 2020 ZINITIX Co.,Ltd
+ *
+ * Author: KwangDeok Son <kdson@zinitix.com>
+ *
+ * Based on elan driver:
+ * Copyright (c) 2011-2013 ELAN Microelectronics Corp.
+ * copyright (c) 2011-2012 Cypress Semiconductor, Inc.
+ * copyright (c) 2011-2012 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published
+ * by the Free Software Foundation.
+ *
+ * Trademarks are the property of their respective owners.
+ */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/kernel.h>
+#include <linux/sched.h>
+#include <linux/input.h>
+#include <linux/uaccess.h>
+#include <linux/jiffies.h>
+#include <linux/completion.h>
+#include <linux/of.h>
+#include <asm/unaligned.h>
+
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/i2c.h>
+#include <linux/input/mt.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/regulator/consumer.h>
+#include "zinitix_i2c.h"
+
+static int zinitix_i2c_read(struct i2c_client *client, u16 reg, u8 *val, u16 len)
+{
+	__le16 buf[] = {
+		cpu_to_le16(reg),
+	};
+	struct i2c_msg msgs[] = {
+		{
+			.addr = client->addr,
+			.flags = client->flags & I2C_M_TEN,
+			.len = sizeof(buf),
+			.buf = (u8 *)buf,
+		},
+		{
+			.addr = client->addr,
+			.flags = (client->flags & I2C_M_TEN) | I2C_M_RD,
+			.len = len,
+			.buf = val,
+		}
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+
+	return ret == ARRAY_SIZE(msgs) ? 0 : (ret < 0 ? ret : -EIO);
+}
+
+static int zinitix_i2c_write(struct i2c_client *client, u16 reg, u16 cmd)
+{
+	__le16 buf[] = {
+		cpu_to_le16(reg),
+		cpu_to_le16(cmd),
+	};
+	struct i2c_msg msg = {
+		.addr = client->addr,
+		.flags = client->flags & I2C_M_TEN,
+		.len = sizeof(buf),
+		.buf = (u8 *)buf,
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	if (ret != 1) {
+		if (ret >= 0)
+			ret = -EIO;
+		dev_err(&client->dev, "writing cmd (0x%04x) failed: %d\n", reg, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int zinitix_i2c_read_buf(struct i2c_client *client, u8 *buf, u16 bufsize, u8 *val, u16 len)
+{
+	struct i2c_msg msgs[] = {
+		{
+			.addr = client->addr,
+			.flags = client->flags & I2C_M_TEN,
+			.len = bufsize,
+			.buf = buf,
+		},
+		{
+			.addr = client->addr,
+			.flags = (client->flags & I2C_M_TEN) | I2C_M_RD,
+			.len = len,
+			.buf = val,
+		}
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+
+	return ret == ARRAY_SIZE(msgs) ? 0 : (ret < 0 ? ret : -EIO);
+}
+
+static int zinitix_i2c_write_buf(struct i2c_client *client, u8 *buf, u8 bufsize)
+{
+	struct i2c_msg msg = {
+		.addr = client->addr,
+		.flags = client->flags & I2C_M_TEN,
+		.len = bufsize,
+		.buf = buf,
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	if (ret != 1) {
+		if (ret >= 0)
+			ret = -EIO;
+		dev_err(&client->dev, "writing cmd (%s) failed: %d\n",
+			buf, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+int zinitix_i2c_write_reg(struct i2c_client *client, u16 reg, u16 value)
+{
+	int errno = 0;
+	u8 buf[22] = {0x80, 0x01, 0x14, 0x00, 0x06, 0x00, };
+
+	buf[6] = reg & 0xFF;
+	buf[7] = (reg>>8)&0xFF;
+	buf[8] = value & 0xFF;
+	buf[9] = (value>>8)&0xFF;
+
+	errno = zinitix_i2c_write_buf(client, buf, 22);
+
+	return errno;
+}
+
+int zinitix_i2c_write_data(struct i2c_client *client, u16 reg, const u8 *value, u16 size)
+{
+	int errno = 0;
+	u8 buf[22] = {0x80, 0x01, 0x14, 0x00, 0x06, 0x00, };
+
+	buf[5] = size & 0xFF;
+	buf[6] = reg & 0xFF;
+	buf[7] = (reg>>8)&0xFF;
+	memcpy(&buf[8], value, size);
+
+	errno = zinitix_i2c_write_buf(client, buf, 22);
+
+	return errno;
+}
+
+int zinitix_i2c_write_fwdata(struct i2c_client *client, u16 reg, const u8 *value, u16 size)
+{
+	int errno = 0;
+	u8 buf[22] = {0x80, 0x01, 0x14, 0x00, 0x06, 0x00, };
+
+	buf[5] = size & 0xFF;
+
+	memcpy(&buf[6], value, size);
+
+	errno = zinitix_i2c_write_buf(client, buf, 22);
+
+	return errno;
+}
+
+u16 zinitix_i2c_read_reg(struct i2c_client *client, u16 reg, u16 *value)
+{
+	u16 retval = 0;
+	u8 outBuf[26] = {0x94, 0x1, 0x26, 0x3, 0x96, 0x1, 0x14, 0, 0x6, 0x1, };
+	u8 inBuf[8] = {0, };
+
+	//Sample
+	outBuf[10] = reg & 0xFF;
+	outBuf[11] = (reg>>8)&0xFF;
+	//Send
+	retval = (u16)zinitix_i2c_write_buf(client, outBuf, 26);
+	//Recv
+	outBuf[2] = 0x16;
+	outBuf[3] = 0x02;
+	retval = (u16)zinitix_i2c_read_buf(client, outBuf, 6, inBuf, 8);
+	if (retval < 0) {
+		dev_err(&client->dev, "reading cmd (0x%04x) fail.\n", reg);
+		return retval;
+	}
+
+	*value = (inBuf[6]&0xFF) | ((inBuf[7]<<8)&0xFF00);
+
+	return retval;
+}
+
+u16 zinitix_i2c_read_data(struct i2c_client *client, u16 reg, u8 *verify_data)
+{
+	u16 retval = 0;
+	u8 outBuf[26] = {0x94, 0x1, 0x26, 0x3, 0x96, 0x1, 0x14, 0, 0x6, 0x1, };
+	u8 inBuf[20] = {0, };
+
+	//Sample
+	outBuf[10] = reg & 0xFF;
+	outBuf[11] = (reg>>8)&0xFF;
+	//Send
+	retval = (u16)zinitix_i2c_write_buf(client, outBuf, 26);
+	//Recv
+	outBuf[2] = 0x16;
+	outBuf[3] = 0x02;
+	retval = (u16)zinitix_i2c_read_buf(client, outBuf, 6, inBuf, 20);
+	if (retval < 0) {
+		dev_err(&client->dev, "reading cmd (0x%04x) fail.\n", reg);
+		return retval;
+	}
+
+	memcpy(verify_data, &inBuf[4], SECTOR_SZ);
+
+	return retval;
+}
+
+static int zinitix_sleep_control(struct i2c_client *client, u16 mode)
+{
+	int error;
+
+		error = zinitix_i2c_write(client, ZINITIX_STANDARD_CMD, mode);
+		if (error)
+			dev_err(&client->dev, "device wake up failed: %d\n", error);
+		else
+			msleep(100); /* Wait for the device to control */
+
+	return error;
+}
+
+static int zinitix_reset(struct i2c_client *client)
+{
+	int error;
+	u8 val[12];
+
+	error = zinitix_i2c_write(client, ZINITIX_STANDARD_CMD, ZINITIX_RESET);
+	if (error)
+		dev_err(&client->dev, "device reset failed: %d\n", error);
+	else {
+		msleep(100);    /* Wait for the device to reset */
+
+		error = i2c_master_recv(client, val, 12);
+		if (error < 0) {
+			dev_err(&client->dev, "failed read reset response: %d\n", error);
+			return -EIO;
+		}
+	}
+
+	return 0;
+}
+
+static int get_descriptor(struct i2c_client *client, u8 *val)
+{
+	struct touchpad_data *data = i2c_get_clientdata(client);
+	int error;
+
+	error = zinitix_i2c_read(client, ZINITIX_GET_DESC, val, ZINITIX_DESC_LENGTH);
+	if (error)
+		dev_err(&client->dev, "can't get descriptor: %d\n", error);
+	else
+		data->chip_code = (u16)(val[16] + (val[17]<<8));
+
+	return error;
+}
+
+static int get_report_descriptor(struct i2c_client *client)
+{
+	int error = 0;
+	u8 val[ZINITIX_REPORT_DESC_LENGTH] = {0,};
+	struct touchpad_data *data = i2c_get_clientdata(client);
+
+	//Get HID Report Descriptor
+	error = zinitix_i2c_read(client, ZINITIX_GET_REPORT_DESC, val, sizeof(val));
+
+	//Get infomation to parse desc
+	data->phy_x = *((u16 *)&val[ZINITIX_PHY_X_OFFSET]);
+	data->phy_y = *((u16 *)&val[ZINITIX_PHY_Y_OFFSET]);
+	return error;
+}
+
+static int set_report(struct i2c_client *client, u8 mode, u8 data)
+{
+	int error;
+	u8 buf[10] = {0x94, 0x01, 0x34, 0x03, 0x96, 0x01, 0x04, 0x00,};
+
+	buf[2] = 0x30 | (mode & 0x0F);
+	buf[8] = mode;
+	buf[9] = data;
+
+	error = zinitix_i2c_write_buf(client, buf, 10);
+
+	if (error)
+		dev_err(&client->dev, "set report desc fail: %d\n", error);
+
+	return error;
+}
+
+static int get_mode(struct i2c_client *client, int *data)
+{
+	int error;
+	u8 val[4];
+	u8 buf[6] = {0x94, 0x01, 0x32, 0x04, 0x96, 0x01 };
+
+	error = zinitix_i2c_read_buf(client, buf, 6, val, 4);
+	if (error)
+		dev_err(&client->dev, "### Get Mode : %d", (int)val[3]);
+	else
+		*data = val[3];
+	return error;
+}
+
+static int zinitix_i2c_initialize(struct i2c_client *client)
+{
+	int error, mode;
+	u8 val[512];
+
+	//Sleep
+	error = zinitix_sleep_control(client, ZINITIX_SLEEP);
+	if (error)
+		return error;
+	//Get HID Descriptor
+	error = get_descriptor(client, val);
+	if (error)
+		return error;
+	//HID_CMD_WAKEUP
+	error = zinitix_sleep_control(client, ZINITIX_WAKE_UP);
+	if (error)
+		return error;
+	//HID_CMD_RESET
+	error = zinitix_reset(client);
+	if (error)
+		return error;
+	//Get HID Report Descriptor
+	error = get_report_descriptor(client);
+	if (error)
+		return error;
+	//Get Mode
+	error = get_mode(client, &mode);
+	if (error)
+		return error;
+	//CMD
+	error = set_report(client, REPORT_SWITCH, SWITCH_BOTH);
+	if (error)
+		return error;
+	error = set_report(client, REPORT_INPUT, INPUT_PTP);
+	if (error)
+		return error;
+	error = set_report(client, REPORT_LATENCY, LATENCY_NORMAL);
+	if (error)
+		return error;
+	return 0;
+}
+
+static int zinitix_i2c_get_max(struct i2c_client *client,
+			    unsigned int *max_x, unsigned int *max_y)
+{
+	int error;
+
+	error = zinitix_i2c_read_reg(client, ZINITIX_MAX_X_REG, (u16 *)max_x);
+	if (error) {
+		dev_err(&client->dev, "failed to get X dimension: %d\n", error);
+		return error;
+	}
+
+	error = zinitix_i2c_read_reg(client, ZINITIX_MAX_Y_REG, (u16 *)max_y);
+	if (error) {
+		dev_err(&client->dev, "failed to get Y dimension: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int zinitix_i2c_get_num_channel(struct i2c_client *client,
+				   unsigned short *chennel_x,
+				   unsigned short *chennel_y)
+{
+	int error;
+
+	error = zinitix_i2c_read_reg(client, ZINITIX_CH_X_REG, chennel_x);
+	if (error) {
+		dev_err(&client->dev, "failed to get CH X: %d\n", error);
+		return error;
+	}
+
+	error = zinitix_i2c_read_reg(client, ZINITIX_CH_Y_REG, chennel_y);
+	if (error) {
+		dev_err(&client->dev, "failed to get CH Y: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int zinitix_i2c_prepare_fw_update(struct i2c_client *client)
+{
+	u16 u16_lsb, u16_msb;
+	u16 Bootloader_ver;
+	u16 ver_major, ver_minor, ver_rel;
+	u32 info_checksum;
+	u32 core_checksum;
+	int error = 0;
+
+	error = zinitix_i2c_read_reg(client, REG_FWVERSION_MAJOR, &ver_major);
+	error = zinitix_i2c_read_reg(client, REG_FWVERSION_MINOR, &ver_minor);
+	error = zinitix_i2c_read_reg(client, REG_FWVERSION_RELEASE, &ver_rel);
+
+	//get Checksum
+	error = zinitix_i2c_read_reg(client, 0x00E4, &u16_lsb);
+	error = zinitix_i2c_read_reg(client, 0x00E5, &u16_msb);
+	info_checksum = (u16_msb<<16) | u16_lsb;
+
+	error = zinitix_i2c_read_reg(client, 0x00E6, &u16_lsb);
+	error = zinitix_i2c_read_reg(client, 0x00E7, &u16_msb);
+	core_checksum = (u16_msb<<16) | u16_lsb;
+
+	error = zinitix_i2c_write_reg(client, FWUPGRADE_MODE, 0x0001);
+	error = zinitix_i2c_read_reg(client, REG_FWVERSION_RELEASE, &Bootloader_ver);
+
+	error = zinitix_i2c_write_reg(client, FWUPGRADE_MODE, 0x0002);
+	error = zinitix_i2c_read_reg(client, REG_FWVERSION_RELEASE, &Bootloader_ver);
+
+	//init download
+	zinitix_i2c_write_reg(client, VENDOR_CMD_ENABLE, 0x0001);
+	msleep(20);
+
+	zinitix_i2c_write_reg(client, INIT_NVM, 0x0001);
+	msleep(20);
+
+	zinitix_i2c_write_reg(client, DISABLE_NVM_WP, 0x0001);
+	msleep(20);
+
+	zinitix_i2c_write_reg(client, FWUPGRADE_INIT, 0x0000);
+
+	return 0;
+}
+
+static int zinitix_i2c_read_fw_block(struct i2c_client *client,
+				   u8 *page, int idx)
+{
+	struct device *dev = &client->dev;
+	int ret, error;
+
+	ret = zinitix_i2c_read_data(client, FWUPGRADE_READ, page);
+	if (ret != 0) {
+		dev_err(dev, "Failed to read page %d: %d\n", idx, error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int zinitix_i2c_write_fw_block(struct i2c_client *client,
+				   const u8 *page, u16 checksum, int idx)
+{
+	struct device *dev = &client->dev;
+	int ret, error;
+
+	ret = zinitix_i2c_write_fwdata(client, FWUPGRADE_PGM, page, checksum);
+	if (ret != 0) {
+		dev_err(dev, "Failed to write page %d: %d\n", idx, error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int zinitix_i2c_finish_fw_update(struct i2c_client *client,
+				     struct completion *completion)
+{
+	struct device *dev = &client->dev;
+	int error;
+	u16 ver_major, ver_minor, ver_rel;
+	u16 retry_cnt = 100;
+	u16 checksum = 0, temp = 0, value = 0;
+
+	enable_irq(client->irq);
+
+	error = zinitix_i2c_write_reg(client, HW_RESET, 0);
+	if (error)
+		dev_err(dev, "device reset failed: %d\n", error);
+
+	msleep(1500);
+
+	disable_irq(client->irq);
+
+	if (error) {
+		dev_err(dev, "fw_update Fail :%d", error);
+		return error;
+	}
+
+	//Touchpad Mode Enter
+	error = zinitix_i2c_read_reg(client, 0x10, &value);
+	if (error) {
+		dev_err(dev, "zinitix_i2c_read_reg reg: 0x10 err: %d\n", error);
+		return error;
+	}
+	msleep(20);
+
+	error = zinitix_i2c_read_reg(client, REG_FWVERSION_MAJOR, &ver_major);
+	error = zinitix_i2c_read_reg(client, REG_FWVERSION_MINOR, &ver_minor);
+	error = zinitix_i2c_read_reg(client, REG_FWVERSION_RELEASE, &ver_rel);
+	error = zinitix_i2c_read_reg(client, REG_FWCHECKSUM, &checksum);
+	error = zinitix_i2c_write_reg(client, 0x00F0, 0x2000);
+	error = zinitix_i2c_write_reg(client, 0x00F0, 0x2000);
+	if (error) {
+		dev_err(dev, "write[0x00F0][0x2000] err: %d\n", error);
+		return error;
+	}
+
+	while (retry_cnt-- > 0) {
+		error = zinitix_i2c_write_reg(client, 0x00F0, 0x2000);
+		if (error) {
+			dev_err(dev, "write[0x00F0],[0x2000] err: %d\n", error);
+			return error;
+		}
+		error = zinitix_i2c_read_reg(client, 0x00F0, &temp);
+		if (error) {
+			dev_err(dev, "read[0x00F0] err: %d\n", error);
+			return error;
+		}
+		if (temp == 0x2000)
+			break;
+	}
+
+	zinitix_i2c_write_reg(client, 0x13F0, 0x0001);
+
+	if (retry_cnt > 0) {
+		const u8 DataBuf[2] = {0xDA, 0xCA};
+
+		zinitix_i2c_write_data(client, 0x0006, DataBuf, 0x0002);
+		msleep(50);
+		retry_cnt = 100;
+		while (retry_cnt-- > 0) {
+			error = zinitix_i2c_read_reg(client, 0x0018, &temp);
+			if (error) {
+				dev_err(dev, "read 0x0018, err: %d\n", error);
+				return error;
+			}
+			if (temp == 0xFFFE)
+				break;
+			msleep(20);
+		}
+
+		if (retry_cnt > 0) {
+			//save_cal_data
+			zinitix_i2c_write_reg(client, 0x0008, 0x0000);
+			msleep(500);
+			//Interrupt Enable
+			zinitix_i2c_write_reg(client, 0x00F0, 0x880F);
+			zinitix_i2c_write_reg(client, 0x00F0, 0x880F);
+
+			retry_cnt = 100;
+			while (retry_cnt-- > 0) {
+				zinitix_i2c_write_reg(client, 0x00F0, 0x880F);
+				zinitix_i2c_read_reg(client, 0x00F0, &temp);
+				if (temp == 0x880F)
+					break;
+			}
+
+			if (retry_cnt > 0) {
+				zinitix_i2c_read_reg(client, 0x0018, &temp);
+				dev_err(dev, "HW_calibration done(0x%X)\n", temp);
+			}
+		}
+	}
+
+	zinitix_i2c_write_reg(client, 0x13F0, 0x0000);	//NVM Write Disable
+
+	return 0;
+}
+
+static int zinitix_i2c_get_report(struct i2c_client *client, u8 *report)
+{
+	int len;
+
+	len = i2c_master_recv(client, report, ZINITIX_I2C_REPORT_LEN);
+	if (len < 0) {
+		dev_err(&client->dev, "failed to read report data: %d\n", len);
+		return len;
+	}
+
+	if (len != ZINITIX_I2C_REPORT_LEN) {
+		dev_err(&client->dev,
+			"wrong report length (%d vs %d expected)\n",
+			len, ZINITIX_I2C_REPORT_LEN);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+const struct zinitix_transport_ops zinitix_i2c_ops = {
+	.initialize		= zinitix_i2c_initialize,
+	.sleep_control		= zinitix_sleep_control,
+	.reset		        = zinitix_reset,
+	.get_max		= zinitix_i2c_get_max,
+	.get_num_channel        = zinitix_i2c_get_num_channel,
+	.prepare_fw_update	= zinitix_i2c_prepare_fw_update,
+	.write_fw_block		= zinitix_i2c_write_fw_block,
+	.read_fw_block		= zinitix_i2c_read_fw_block,
+	.finish_fw_update	= zinitix_i2c_finish_fw_update,
+	.get_report		= zinitix_i2c_get_report,
+};
+
+static int zinitix_enable_power(struct touchpad_data *data)
+{
+	int repeat = ZINITIX_RETRY_COUNT;
+	int error = regulator_enable(data->vcc);
+
+	if (error) {
+		dev_err(&data->client->dev,
+			"failed to enable regulator: %d\n", error);
+		return error;
+	}
+
+	do {
+		error = data->ops->sleep_control(data->client, true);
+		if (error >= 0)
+			return 0;
+
+		msleep(30);
+	} while (--repeat > 0);
+
+	dev_err(&data->client->dev, "failed to enable power: %d\n", error);
+	return error;
+}
+
+static int zinitix_disable_power(struct touchpad_data *data)
+{
+	int repeat = ZINITIX_RETRY_COUNT;
+	int error = 0;
+
+	do {
+		error = data->ops->sleep_control(data->client, false);
+		if (!error) {
+			error = regulator_disable(data->vcc);
+			if (error) {
+				dev_err(&data->client->dev,
+					"failed to disable regulator: %d\n",
+					error);
+				/* Attempt to power the chip back up */
+				data->ops->sleep_control(data->client, true);
+				break;
+			}
+
+			return 0;
+		}
+
+		msleep(30);
+	} while (--repeat > 0);
+
+	dev_err(&data->client->dev, "failed to disable power: %d\n", error);
+	return error;
+}
+
+static int zinitix_sleep(struct touchpad_data *data)
+{
+	int repeat = ZINITIX_RETRY_COUNT;
+	int error;
+
+	do {
+		error = data->ops->sleep_control(data->client, true);
+		if (!error)
+			return 0;
+
+		msleep(30);
+	} while (--repeat > 0);
+
+	return error;
+}
+
+static int zinitix_initialize(struct touchpad_data *data)
+{
+	struct i2c_client *client = data->client;
+	int repeat = ZINITIX_RETRY_COUNT;
+	int error;
+
+	do {
+		error = data->ops->initialize(client);
+		if (!error)
+			return 0;
+
+		dev_err(&client->dev, "device initialize failed: %d\n", error);
+		msleep(30);
+	} while (--repeat > 0);
+
+	return error;
+}
+
+static unsigned int zinitix_get_resolution(u16 val)
+{
+	return (val * 10 + 300) * 10 / 254;
+}
+
+static int zinitix_query_device_parameters(struct touchpad_data *data)
+{
+	unsigned short ch_x, ch_y;
+	int error;
+
+	error = data->ops->get_max(data->client, &data->max_x, &data->max_y);
+	if (error)
+		return error;
+
+	error = data->ops->get_num_channel(data->client, &ch_x, &ch_y);
+	if (error)
+		return error;
+
+	data->width_x = data->max_x / ch_x;
+	data->width_y = data->max_y / ch_y;
+
+	data->x_res = zinitix_get_resolution(data->max_x / data->phy_x);
+	data->y_res = zinitix_get_resolution(data->max_y / data->phy_y);
+
+	//pressure level
+	data->pressure_adjustment = 0x0011;
+	return 0;
+}
+
+/*
+ **********************************************************
+ * firmware update
+ **********************************************************
+ */
+static int zinitix_read_fw_block(struct touchpad_data *data,
+					u8 *page, int idx)
+{
+	int error;
+	int retry = ZINITIX_RETRY_COUNT;
+
+	do {
+		error = data->ops->read_fw_block(data->client, page, idx);
+		if (!error)
+			return 0;
+
+		dev_dbg(&data->client->dev,
+			"retrying read page %d (error: %d)\n", idx, error);
+
+	} while (--retry > 0);
+
+	return error;
+}
+
+static int zinitix_write_fw_block(struct touchpad_data *data,
+			       const u8 *page, u16 checksum, int idx)
+{
+	int error;
+	int retry = ZINITIX_RETRY_COUNT;
+
+	do {
+		error = data->ops->write_fw_block(data->client, page, checksum, idx);
+		if (!error)
+			return 0;
+
+		dev_dbg(&data->client->dev,
+		"retrying write page %d (error: %d)\n", idx, error);
+	} while (--retry > 0);
+
+	return error;
+}
+
+static int get_fw_sizeinfo(const struct firmware *fw, struct fw_info *info)
+{
+	union nvm_binary_info *bin_info = (union nvm_binary_info *)&fw->data[0];
+
+	info->info_size = (u32)TO_LITTLE_ENDIAN(bin_info->val.info_size[1],
+						bin_info->val.info_size[2],
+						bin_info->val.info_size[3]);
+	info->core_size = (u32)TO_LITTLE_ENDIAN(bin_info->val.core_size[1],
+						bin_info->val.core_size[2],
+						bin_info->val.core_size[3]);
+	info->cust_size = (u32)TO_LITTLE_ENDIAN(bin_info->val.custom_size[1],
+						bin_info->val.custom_size[2],
+						bin_info->val.custom_size[3]);
+	info->regi_size = (u32)TO_LITTLE_ENDIAN(bin_info->val.register_size[1],
+						bin_info->val.register_size[2],
+						bin_info->val.register_size[3]);
+
+	info->end_address = info->info_size + info->core_size + info->cust_size + info->regi_size;
+	info->start_address = info->info_size + info->core_size;
+	return 0;
+}
+
+static int zinitix_flash_erase(struct i2c_client *client, int flash_addr)
+{
+	u8 data[4] = {0x00, 0x00, 0x00, 0x00};
+	int i = 0;
+
+	for (i = flash_addr; i < 32; i++) {
+		data[2] = i;
+		zinitix_i2c_write_data(client, FWUPGRADE_BLOCK_ERASE, data, 4);
+		msleep(60);
+	}
+
+	data[0] = 1;
+	for (i = 1; i < 4; i++) {
+		data[2] = i;
+		zinitix_i2c_write_data(client, FWUPGRADE_BLOCK_ERASE, data, 4);
+		msleep(60);
+	}
+
+	return 0;
+}
+
+static int __zinitix_update_firmware(struct touchpad_data *data,
+				  const struct firmware *fw)
+{
+	struct i2c_client *client = data->client;
+	struct device *dev = &client->dev;
+	int i, error, page_size;
+	int fw_addr;
+	struct fw_info flash;
+
+	page_size  = 1024;
+	error = data->ops->prepare_fw_update(client);
+	if (error) {
+		dev_err(dev, "prepare fw upadate err:%d\n", error);
+		return error;
+	}
+
+	//get firmware info
+	get_fw_sizeinfo(fw, &flash);
+	zinitix_flash_erase(client, flash.start_address);
+
+	//write firmware
+	fw_addr = (flash.info_size + flash.core_size) / 1024;
+
+	zinitix_i2c_write_reg(client, FWUPGRADE_INIT, 0x0000);
+	zinitix_i2c_write_reg(client, FWUPGRADE_START_PAGE, fw_addr);
+	for (fw_addr = flash.start_address; fw_addr < flash.end_address; ) {
+		for (i = 0; i < page_size / SECTOR_SZ; i++) {
+			error = zinitix_write_fw_block(data, &fw->data[fw_addr], SECTOR_SZ, i);
+			if (error) {
+				dev_err(dev, "fw write %d err:%d\n", i, error);
+				return error;
+			}
+
+			fw_addr += SECTOR_SZ;
+		}
+		msleep(20);
+	}
+
+	fw_addr = (flash.info_size + flash.core_size) / 1024;
+	zinitix_i2c_write_reg(client, FWUPGRADE_INIT, 0x0000);
+	zinitix_i2c_write_reg(client, FWUPGRADE_START_PAGE, fw_addr);
+	msleep(20);
+
+	//verify
+	fw_addr = flash.start_address;
+	for (; fw_addr < flash.end_address; ) {
+		u8 verify[16] = {0,};
+
+		for (i = 0; i < page_size / SECTOR_SZ; i++) {
+			zinitix_read_fw_block(data, verify, i);
+			if (error) {
+				dev_err(dev, "err verify read : %d\n", error);
+				return error;
+			}
+
+			if (memcmp(&fw->data[fw_addr], verify, SECTOR_SZ)) {
+				dev_err(dev, "err verify cmp : %d\n", error);
+				return error;
+			}
+
+			fw_addr += SECTOR_SZ;
+		}
+	} //verify success
+
+	//complete fw update
+	error = data->ops->finish_fw_update(client, &data->fw_completion);
+	if (error) {
+		dev_err(dev, "err finish_fw_update: %d\n", error);
+		return error;
+	}
+	return 0;
+}
+
+static int zinitix_update_firmware(struct touchpad_data *data,
+				const struct firmware *fw)
+{
+	int retval = 0;
+	struct i2c_client *client = data->client;
+
+	disable_irq(client->irq);
+	data->in_fw_update = true;
+	zinitix_i2c_write_reg(client, 0xff, 0x01);
+	retval = __zinitix_update_firmware(data, fw);
+	if (retval) {
+		dev_err(&client->dev, "fw update failed: %d\n", retval);
+		data->ops->reset(client);
+	} else {
+		/* Reinitialize TP after fw is updated */
+		zinitix_initialize(data);
+		dev_err(&client->dev, "fw update Success!!!: %d\n", retval);
+	}
+
+	data->in_fw_update = false;
+	enable_irq(client->irq);
+
+	return retval;
+}
+
+//probe or init
+static int zinitix_check_update_firmware(struct device *dev)
+{
+	int retval = 0;
+	int error = 0;
+	char *fw_name;
+	union nvm_binary_info *fw_info;
+	const struct firmware *fw;
+	u16 fw_ver = 0;
+	u16 dev_ver = 0;
+
+	struct i2c_client *client = to_i2c_client(dev);
+
+	fw_name = kasprintf(GFP_KERNEL, ZINITIX_FW_NAME);
+	if (!fw_name) {
+		dev_err(dev, "failed to allocate memory for firmware name\n");
+		return -ENOMEM;
+	}
+
+
+	//1. Check FW Bin file
+	error = request_firmware(&fw, fw_name, dev);	//linux Kernel API
+	kfree(fw_name);
+	if (error) {
+		dev_err(dev, "failed to request firmware: %d\n", error);
+		return error;
+	}
+
+	//2. Check FW version
+	fw_info = (union nvm_binary_info *)&fw[0];
+	fw_ver = fw_info->val.minor_ver;
+	error = zinitix_i2c_read_reg(client, REG_FWVERSION_MINOR, &dev_ver);
+
+	if (dev_ver <= fw_ver) { //3. Current Version < New Version
+		dev_info(dev, "check FW[0x%X : 0x%X] boot!\n", fw_ver, dev_ver);
+	} else {
+		dev_info(dev, "checked No Firmware in boot Sequence T_T\n");
+	}
+
+	release_firmware(fw);
+	return retval;
+}
+
+/*
+ *********
+ * SYSFS
+ */
+static ssize_t update_fw_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct touchpad_data *data = dev_get_drvdata(dev);
+	const struct firmware *fw;
+	char *fw_name;
+	int error;
+
+	fw_name = kasprintf(GFP_KERNEL, ZINITIX_FW_NAME);
+	if (!fw_name) {
+		dev_err(dev, "failed to allocate memory for firmware name\n");
+		return -ENOMEM;
+	}
+
+	error = request_firmware(&fw, fw_name, dev);	//linux Kernel API
+	kfree(fw_name);
+	if (error) {
+		dev_err(dev, "failed to request firmware: %d\n", error);
+		return error;
+	}
+
+	error = mutex_lock_interruptible(&data->sysfs_mutex);
+	if (error)
+		goto out_release_fw;
+
+	error = zinitix_update_firmware(data, fw);
+
+	mutex_unlock(&data->sysfs_mutex);
+
+out_release_fw:
+	release_firmware(fw);
+	return error ?: count;
+}
+
+static DEVICE_ATTR_WO(update_fw);
+
+static ssize_t send_data_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct touchpad_data *data = i2c_get_clientdata(client);
+	u16 cmd, reg_addr, reg_val;
+	int error, nsize = 0;
+
+	cmd = (buf[0]&0x00FF) | (buf[1]<<8 & 0xFF00);
+	reg_addr = (buf[2]&0x00FF) | (buf[3]<<8 & 0xFF00);
+
+	switch (cmd) {
+	case WRITE_REG:
+		reg_val = (buf[4]&0x00FF) | (buf[5]<<8 & 0xFF00);
+		zinitix_i2c_write_reg(client, reg_addr, reg_val);
+	break;
+
+	case READ_REG:
+		nsize = count + 2;
+		if (nsize >= 512)
+			nsize = 512;
+		memset(data->userbuffer, 0, nsize);
+		zinitix_i2c_read_reg(client, reg_addr, &reg_val);
+		data->userbuffer[0] = reg_val & 0xFF;
+		data->userbuffer[1] = (reg_val>>8) & 0xFF;
+		data->ready_userbuffer = true;
+		data->recv_data_size = count;
+	break;
+
+	case VENDOR_COMMAND_READ:
+		nsize = count + 2;
+		memset(data->userbuffer, 0, nsize);
+		zinitix_i2c_read_data(client, reg_addr, data->userbuffer);
+		data->ready_userbuffer = true;
+		data->recv_data_size = count;
+	break;
+
+	case VENDOR_COMMAND_WRITE:
+		zinitix_i2c_write_data(client, reg_addr, &buf[sizeof(u16)*2], count);
+		data->ready_userbuffer = true;
+		data->recv_data_size = count;
+	break;
+
+	case FIRMWARE_WRITE:
+		zinitix_write_fw_block(data, &buf[2], SECTOR_SZ, 0);
+	break;
+
+	case DEVICE_INIT:
+		error = data->ops->initialize(client);
+		if (error) {
+			dev_err(&client->dev, "dev init failed: %d\n", error);
+			return error;
+		}
+	break;
+
+	default:
+		break;
+	}
+
+	return count;
+}
+static DEVICE_ATTR_WO(send_data);
+
+static ssize_t recv_data_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct touchpad_data *data = i2c_get_clientdata(client);
+	int size = 0;
+
+	u16 cmd = (buf[0]&0x00FF) | (buf[1]<<8 & 0xFF00);
+
+	switch (cmd) {
+	case GET_INFO_CHIPID:
+		memcpy(buf, &data->chip_code, sizeof(u16));
+		break;
+	default:
+		break;
+	}
+
+	size = data->recv_data_size;
+	data->userbuffer[size] = '\0';
+
+	memcpy(buf, data->userbuffer, size);
+
+	data->ready_userbuffer = false;
+	return size;
+}
+
+static DEVICE_ATTR_RO(recv_data);
+
+static struct attribute *zinitix_sysfs_entries[] = {
+	&dev_attr_update_fw.attr,
+	&dev_attr_send_data.attr,
+	&dev_attr_recv_data.attr,
+	NULL,
+};
+
+static const struct attribute_group zinitix_sysfs_group = {
+	.attrs = zinitix_sysfs_entries,
+};
+
+static const struct attribute_group *zinitix_sysfs_groups[] = {
+	&zinitix_sysfs_group,
+	NULL
+};
+
+/*
+ **************
+ * Zinitix isr
+ */
+
+static void zinitix_report_contact(struct touchpad_data *data, int contact_num, bool contact_valid, u8 *finger_data)
+{
+	struct input_dev *input = data->input;
+	unsigned int pos_x, pos_y;
+	unsigned int mk_x, mk_y;
+	unsigned int area_x, area_y, major, minor;
+
+	if (contact_valid) {
+		pos_x = finger_data[0] | finger_data[1] << 8;
+		pos_y = finger_data[2] | finger_data[3] << 8;
+
+		mk_x = mk_y = 0x2;	//임의값으로 테스트 후 제거
+
+		if (pos_x > data->max_x || pos_y > data->max_y) {
+			dev_dbg(input->dev.parent,
+				"[%d] x=%d y=%d over max (%d, %d)",
+				contact_num, pos_x, pos_y,
+				data->max_x, data->max_y);
+			return;
+		}
+
+		area_x = mk_x * (data->width_x - ZINITIX_FWIDTH_REDUCE);
+		area_y = mk_y * (data->width_y - ZINITIX_FWIDTH_REDUCE);
+
+		major = max(area_x, area_y);
+		minor = min(area_x, area_y);
+
+		input_mt_slot(input, contact_num);
+		input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
+		input_report_abs(input, ABS_MT_POSITION_X, pos_x);
+		input_report_abs(input, ABS_MT_POSITION_Y, pos_y);
+		input_report_abs(input, ABS_MT_PRESSURE, ZINITIX_TP_PRESS);
+		input_report_abs(input, ABS_TOOL_WIDTH, mk_x);
+		input_report_abs(input, ABS_MT_TOUCH_MAJOR, major);
+		input_report_abs(input, ABS_MT_TOUCH_MINOR, minor);
+	} else {
+		input_mt_slot(input, contact_num);
+		input_mt_report_slot_state(input, MT_TOOL_FINGER, false);
+	}
+}
+
+static void zinitix_report_absolute(struct touchpad_data *data, u8 *packet, bool lastPacket)
+{
+	struct input_dev *input = data->input;
+	u8 *finger_data = &packet[ZINITIX_FINGER_DATA_OFFSET];
+	u8 btn = packet[ZINITIX_BUTTON_OFFSET];
+	int contact_id;
+	struct zinitix_contact_status *contact_info;
+	bool contact_valid = true;
+
+	contact_info = (struct zinitix_contact_status *)&packet[3];
+
+	if (contact_info->confidence)
+		contact_valid = contact_info->tip;
+	else
+		contact_valid = false;
+
+	contact_id =  (packet[3]>>2) + 1;
+	zinitix_report_contact(data, contact_id, contact_valid, finger_data);
+
+	if (true == lastPacket)	{
+		input_report_key(input, BTN_LEFT, (btn) & 0x01);
+		input_report_abs(input, ABS_DISTANCE, false);
+		input_mt_report_pointer_emulation(input, true);
+		input_sync(input);
+	}
+}
+
+static irqreturn_t zinitix_isr(int irq, void *dev_id)
+{
+	struct touchpad_data *data = dev_id;
+	struct device *dev = &data->client->dev;
+	int error;
+	int isrCnt;
+	u8 report[ZINITIX_MAX_REPORT_LEN];
+	bool lastPacket = false;
+
+	if (data->in_fw_update) {
+		complete(&data->fw_completion);
+		goto out;
+	}
+
+	do {
+		error = data->ops->get_report(data->client, report);
+		if (error)
+			goto out;
+		if (report[ZINITIX_REPORT_ID_OFFSET] == ZINITIX_REPORT_ID) {
+			if (report[10] > 0)
+				isrCnt = report[10];
+
+			isrCnt--;
+
+			if (isrCnt <= 0)
+				lastPacket = true;
+
+			zinitix_report_absolute(data, report, lastPacket);
+		} else {
+			dev_err(dev, "Exception (ID : 0x%x)!!\n", report[ZINITIX_REPORT_ID_OFFSET]);
+			goto out;
+		}
+	} while (isrCnt > 0);
+out:
+	return IRQ_HANDLED;
+}
+
+/*
+ ***************
+ * Zinitix init
+ */
+static int zinitix_setup_input_device(struct touchpad_data *data)
+{
+	struct device *dev = &data->client->dev;
+	struct input_dev *input;
+	unsigned int max_width = max(data->width_x, data->width_y);
+	unsigned int min_width = min(data->width_x, data->width_y);
+	int error;
+	int finger_width = 15;
+
+	input = devm_input_allocate_device(dev);
+	if (!input)
+		return -ENOMEM;
+
+	input->name = "Zinitix Touchpad";
+	input->id.bustype = BUS_I2C;
+	input->id.vendor = ZINITIX_VENDOR_ID;
+	input->id.product = data->product_id;
+	input_set_drvdata(input, data);
+
+	error = input_mt_init_slots(input, ZINITIX_MAX_FINGERS,
+				    INPUT_MT_POINTER | INPUT_MT_DROP_UNUSED);
+	if (error) {
+		dev_err(dev, "failed to initialize MT slots: %d\n", error);
+		return error;
+	}
+
+	__set_bit(EV_ABS, input->evbit);
+	__set_bit(INPUT_PROP_POINTER, input->propbit);
+	__set_bit(INPUT_PROP_BUTTONPAD, input->propbit);
+	__set_bit(BTN_LEFT, input->keybit);
+
+	/* Set up ST parameters */
+	input_set_abs_params(input, ABS_X, 0, data->max_x, 0, 0);
+	input_set_abs_params(input, ABS_Y, 0, data->max_y, 0, 0);
+	input_abs_set_res(input, ABS_X, data->x_res);
+	input_abs_set_res(input, ABS_Y, data->y_res);
+	input_set_abs_params(input, ABS_PRESSURE, 0, ZINITIX_TP_PRESS, 0, 0);
+	input_set_abs_params(input, ABS_TOOL_WIDTH, 0, finger_width, 0, 0);
+	input_set_abs_params(input, ABS_DISTANCE, 0, 1, 0, 0);
+
+	/* And MT parameters */
+	input_set_abs_params(input, ABS_MT_POSITION_X, 0, data->max_x, 0, 0);
+	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, data->max_y, 0, 0);
+	input_abs_set_res(input, ABS_MT_POSITION_X, data->x_res);
+	input_abs_set_res(input, ABS_MT_POSITION_Y, data->y_res);
+	input_set_abs_params(input, ABS_MT_PRESSURE, 0, ZINITIX_TP_PRESS, 0, 0);
+
+	input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0, finger_width * max_width, 0, 0);
+
+	input_set_abs_params(input, ABS_MT_TOUCH_MINOR, 0, finger_width * min_width, 0, 0);
+
+	data->input = input;
+
+	return 0;
+}
+
+static void zinitix_disable_regulator(void *_data)
+{
+	struct touchpad_data *data = _data;
+
+	regulator_disable(data->vcc);
+}
+
+static void zinitix_remove_sysfs_groups(void *_data)
+{
+	struct touchpad_data *data = _data;
+
+	sysfs_remove_groups(&data->client->dev.kobj, zinitix_sysfs_groups);
+}
+
+static int zinitix_touchpad_probe(struct i2c_client *client,
+		      const struct i2c_device_id *dev_id)
+{
+	const struct zinitix_transport_ops *transport_ops;
+	struct device *dev = &client->dev;
+	struct touchpad_data *data;
+	unsigned long irqflags;
+	int error;
+
+	if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		transport_ops = &zinitix_i2c_ops;
+	} else {
+		dev_err(dev, "not a supported I2C/SMBus adapter\n");
+		return -EIO;
+	}
+	data = devm_kzalloc(dev, sizeof(struct touchpad_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	i2c_set_clientdata(client, data);
+
+	data->ops = transport_ops;
+	data->client = client;
+	data->userbuffer = kmalloc(1024, GFP_KERNEL);
+
+	init_completion(&data->fw_completion);
+	mutex_init(&data->sysfs_mutex);
+	data->vcc = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(data->vcc)) {
+		error = PTR_ERR(data->vcc);
+		if (error != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get 'vcc' regulator: %d\n",
+				error);
+		return error;
+	}
+	error = regulator_enable(data->vcc);
+	if (error) {
+		dev_err(dev, "Failed to enable regulator: %d\n", error);
+		return error;
+	}
+	error = devm_add_action(dev, zinitix_disable_regulator, data);
+	if (error) {
+		regulator_disable(data->vcc);
+		dev_err(dev, "Failed to add disable regulator action: %d\n",
+			error);
+		return error;
+	}
+	/* Initialize the touchpad. */
+	error = zinitix_initialize(data);
+	if (error)
+		return error;
+	error = zinitix_check_update_firmware(dev);
+
+	error = zinitix_query_device_parameters(data);
+	if (error)
+		dev_err(&client->dev, "query_device_parameters Fail!!!");
+
+	error = zinitix_setup_input_device(data);
+	if (error)
+		return error;
+	irqflags = irq_get_trigger_type(client->irq);
+	if (!irqflags)
+		irqflags = IRQF_TRIGGER_FALLING;
+
+	error = devm_request_threaded_irq(dev, client->irq, NULL, zinitix_isr,
+					  irqflags | IRQF_ONESHOT,
+					  client->name, data);
+	if (error) {
+		dev_err(dev, "cannot register irq=%d\n", client->irq);
+		return error;
+	}
+	error = sysfs_create_groups(&dev->kobj, zinitix_sysfs_groups);
+	if (error) {
+		dev_err(dev, "failed to create sysfs attributes: %d\n", error);
+		return error;
+	}
+	error = devm_add_action(dev, zinitix_remove_sysfs_groups, data);
+	if (error) {
+		zinitix_remove_sysfs_groups(data);
+		dev_err(dev, "Failed to add sysfs cleanup action: %d\n",
+			error);
+		return error;
+	}
+	error = input_register_device(data->input);
+	if (error) {
+		dev_err(dev, "failed to register input device: %d\n", error);
+		return error;
+	}
+	if (!dev->of_node)
+		device_init_wakeup(dev, true);
+	return 0;
+}
+
+static int __maybe_unused zinitix_touchpad_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct touchpad_data *data = i2c_get_clientdata(client);
+	int ret;
+
+	ret = mutex_lock_interruptible(&data->sysfs_mutex);
+	if (ret)
+		return ret;
+
+	disable_irq(client->irq);
+
+	if (device_may_wakeup(dev)) {
+		ret = zinitix_sleep(data);
+		/* Enable wake from IRQ */
+		data->irq_wake = (enable_irq_wake(client->irq) == 0);
+	} else {
+		ret = zinitix_disable_power(data);
+	}
+
+	mutex_unlock(&data->sysfs_mutex);
+	return ret;
+}
+
+static int __maybe_unused zinitix_touchpad_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct touchpad_data *data = i2c_get_clientdata(client);
+	int error;
+
+	if (device_may_wakeup(dev) && data->irq_wake) {
+		disable_irq_wake(client->irq);
+		data->irq_wake = false;
+	}
+
+	error = zinitix_enable_power(data);
+	if (error) {
+		dev_err(dev, "power up when resuming failed: %d\n", error);
+		goto err;
+	}
+
+	error = zinitix_initialize(data);
+	if (error)
+		dev_err(dev, "initialize when resuming failed: %d\n", error);
+
+err:
+	enable_irq(data->client->irq);
+	return error;
+}
+
+static SIMPLE_DEV_PM_OPS(zinitix_pm_ops, zinitix_touchpad_suspend, zinitix_touchpad_resume);
+
+static const struct i2c_device_id zinitix_touchpad_id[] = {
+	{ ZINITIX_TOUCHPAD_DRIVER_NAME, 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, zinitix_touchpad_id);
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id zinitix_acpi_id[] = {
+{ "ZNT0002", 0 },
+{ "ZNT0003", 0 },
+{ "ZNT0004", 0 },
+{ "ZNT0005", 0 },
+{ "ZNT0006", 0 },
+{ "ZNT0007", 0 },
+{ "ZNT0008", 0 },
+{ "ZNT0009", 0 },
+{ "ZNT000A", 0 },
+{ "ACPI0C50", 0 },
+{ "PNP0C50", 0 },
+{  },
+};
+MODULE_DEVICE_TABLE(acpi, zinitix_acpi_id);
+#endif
+
+#ifdef CONFIG_OF
+static const struct of_device_id zinitix_of_match[] = {
+	{ .compatible = "zinitix, zntxtp" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, zinitix_of_match);
+#endif
+
+static struct i2c_driver zinitix_touchpad_driver = {
+	.driver = {
+		.name	                = ZINITIX_TOUCHPAD_DRIVER_NAME,
+		.pm	                = &zinitix_pm_ops,
+		.acpi_match_table       = ACPI_PTR(zinitix_acpi_id),
+		.of_match_table         = of_match_ptr(zinitix_of_match),
+		.probe_type             = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe		                = zinitix_touchpad_probe,
+	.id_table	                = zinitix_touchpad_id,
+};
+
+module_i2c_driver(zinitix_touchpad_driver);
+
+MODULE_AUTHOR("<kdson@zinitix.com>");
+MODULE_DESCRIPTION("ZINITIX I2C Touchpad driver");
+MODULE_LICENSE("GPL");
+MODULE_VERSION(ZINITIX_DRIVER_VERSION);
+
+
diff --git a/drivers/input/mouse/zinitix_i2c.h b/drivers/input/mouse/zinitix_i2c.h
index e69de29bb2d1..c33dcdcaab00 100755
--- a/drivers/input/mouse/zinitix_i2c.h
+++ b/drivers/input/mouse/zinitix_i2c.h
@@ -0,0 +1,255 @@
+/*
+ * ZINITIX I2C Touchpad driver
+ *
+ * Copyright (c) 2020 ZINITIX Co.,Ltd
+ *
+ * Author: KwangDeok Son <kdson@zinitix.com>
+ *
+ * Based on cyapa driver:
+ * copyright (c) 2011-2013 ELAN Microelectronics Corp.
+ * copyright (c) 2011-2012 Cypress Semiconductor, Inc.
+ * copyright (c) 2011-2012 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published
+ * by the Free Software Foundation.
+ *
+ * Trademarks are the property of their respective owners.
+ */
+
+#ifndef _ZINITIX_I2C_H
+#define _ZINITIX_I2C_H
+
+#include <linux/types.h>
+
+#define ZINITIX_TOUCHPAD_DRIVER_NAME	"zinitix_i2c_touchpad"
+#define ZINITIX_DRIVER_VERSION  	"1.0.0"
+#define ZINITIX_VENDOR_ID		0x14E5
+
+#define ZINITIX_TP_PRESS	        128
+
+#define ZINITIX_FWIDTH_REDUCE	        90
+#define ZINITIX_RETRY_COUNT	        3
+
+#define ZINITIX_MAX_FINGERS		5
+#define ZINITIX_REPORT_ID		0x01
+#define ZINITIX_REPORT_ID_OFFSET	2
+#define ZINITIX_FINGER_DATA_OFFSET	4
+#define ZINITIX_BUTTON_OFFSET           11
+#define ZINITIX_MAX_REPORT_LEN	        12
+
+
+#define ZINITIX_PTP_MODE		0x0001
+#define ZINITIX_DISABLE_POWER		0x0001
+
+#define ZINITIX_FW_NAME		"zinitix_i2c_tp_fw.bin"
+
+/* Zinitix i2c commands */
+#define ZINITIX_MAX_X_REG		0x00C1	//Long dist
+#define ZINITIX_MAX_Y_REG		0x00C0	//short dist
+#define ZINITIX_CH_X_REG		0x0065
+#define ZINITIX_CH_Y_REG		0x0164
+#define ZINITIX_GET_DESC		0x000E
+#define ZINITIX_GET_REPORT_DESC		0x001E
+#define ZINITIX_REPORT_DESC_LENGTH	0x013E
+#define ZINITIX_PHY_X_OFFSET            0x009F
+#define ZINITIX_PHY_Y_OFFSET            0x00A9
+
+#define ZINITIX_STANDARD_CMD		0x0194
+#define ZINITIX_RESET			0x0100
+#define ZINITIX_WAKE_UP			0x0800
+#define ZINITIX_SLEEP			0x0801
+#define ZINITIX_I2C_POWER_CMD		0x0307
+
+#define ZINITIX_I2C_INF_LENGTH		2
+#define ZINITIX_I2C_REPORT_LEN		12
+#define ZINITIX_DESC_LENGTH		30
+
+
+#define WRITE_REG   			0x0000
+#define READ_REG    			0x0001
+#define VENDOR_COMMAND_READ		0x0002
+#define VENDOR_COMMAND_WRITE	        0x0003
+#define FIRMWARE_WRITE			0x0004
+#define DEVICE_INIT			0x0005
+#define GET_INFO_CHIPID 		0x0006
+
+#define REPORT_INPUT                    0x04
+#define REPORT_SWITCH                   0x09
+#define REPORT_LATENCY                  0x0A
+
+
+#define INPUT_MOUSE                     0x00
+#define INPUT_PTP                       0x03
+
+#define SWITCH_NONE                     0x00
+#define SWITCH_BUTTON                   0x01
+#define SWITCH_SURFACE                  0x02
+#define SWITCH_BOTH                     0x03
+
+#define LATENCY_NORMAL                  0x00
+#define LATENCY_HIGH                    0x01
+
+struct i2c_client;
+struct completion;
+
+enum tp_mode {
+	IAP_MODE = 1,
+	MAIN_MODE
+};
+
+struct zinitix_contact_status {
+	u8 tip : 1;
+	u8 confidence : 1;
+	u8 contact_id : 1;
+	u8 reserved : 5;
+};
+
+struct zinitix_transport_ops {
+	int (*initialize)(struct i2c_client *client);
+	int (*sleep_control)(struct i2c_client *, u16 mode);
+	int (*set_mode)(struct i2c_client *client, u8 mode);
+
+	int (*get_max)(struct i2c_client *client,
+		       unsigned int *max_x, unsigned int *max_y);
+	int (*get_num_channel)(struct i2c_client *client,
+			      unsigned short *x_tracenum,
+			      unsigned short *y_tracenum);
+	
+	int (*reset)(struct i2c_client *client);
+
+	int (*prepare_fw_update)(struct i2c_client *client);
+	int (*write_fw_block)(struct i2c_client *client,
+			      const u8 *page, u16 checksum, int idx);
+	int (*read_fw_block)(struct i2c_client *client,
+			      u8 *page, int idx);
+	int (*finish_fw_update)(struct i2c_client *client,
+				struct completion *reset_done);
+
+	int (*get_report)(struct i2c_client *client, u8 *report);
+	int (*get_pressure_adjustment)(struct i2c_client *client,
+				       int *adjustment);
+	int (*get_pattern)(struct i2c_client *client, u8 *pattern);
+};
+
+extern const struct zinitix_transport_ops zinitix_i2c_ops;
+
+#define TO_LITTLE_ENDIAN(n1, n2, n3) (((u32)n1<<16 & 0x00FF0000) | ((u32)n2<<8 & 0x0000FF00) | ((u32)n3 & 0x000000FF))
+#define SECTOR_SZ		        (8 * 2)
+#define FW_BUFF_SIZE                    (1024*48) // 48K
+#define FW_BUFF_SIZE_650                (1024*128) // 128K
+#define FW_REWRITE_LIMIT	        8
+
+/* Zinitix i2c HID commands */
+#define FWUPGRADE_INIT		0x20F0
+#define FWUPGRADE_PGM		0x21F0
+#define FWUPGRADE_READ		0x22F0
+#define FWUPGRADE_MODE		0x25F0
+#define FWUPGRADE_WRITE_MODE		0x27F0
+#define FWUPGRADE_MERASE		0x28F0
+#define FWUPGRADE_START_PAGE		0x29F0
+#define FWUPGRADE_BLOCK_ERASE	0x2AF0
+
+#define HW_RESET			0x04F0
+
+#define REG_FWVERSION_MAJOR		0x0012
+#define REG_FWVERSION_MINOR		0x0121
+#define REG_FWVERSION_RELEASE		0x0013
+#define REG_FWCHECKSUM			0x012C
+
+#define VENDOR_CMD_ENABLE		0x10F0
+#define INIT_NVM			0x12F0
+#define DISABLE_NVM_WP		        0x13F0
+
+
+enum FWUPGRADE_PROGMODE
+{
+	FWUPGRADE_PROGRAM	= 0,
+	FWUPGRADE_ONLYWRITE	= 1,
+	FWUPGRADE_WRITEREPEAT	= 2,
+};
+
+union nvm_binary_info
+{
+	u16 buff16[128*1024/2];
+	u32 buff32[128*1024/4]; //128*1024byte
+	struct _val
+	{
+		u32 RESERVED0;		// 0
+		u32 auto_boot_flag1;	// 1
+		u32 auto_boot_flag2;	// 2
+		u32 slave_addr_flag;	// 3
+		u32 RESERVED1[4];	// 4
+		u32 info_checksum;	// 8
+		u32 core_checksum;	// 9
+		u32 custom_checksum;	// 10
+		u32 register_checksum;	// 11
+		u16 hw_id;		// 12
+		u16 RESERVED2;
+		u16 major_ver;		// 13
+		u16 RESERVED3;
+		u16 minor_ver;		// 14
+		u16 RESERVED4;
+		u16 release_ver;	// 15
+		u16 RESERVED5;
+		u16 chip_id;		// 16
+		u16 chip_id_reverse;
+		u16 chip_naming_number;	// 17
+		u16 RESERVED6[9];
+		u8  info_size[4];	// 21
+		u8  core_size[4];	// 22
+		u8  custom_size[4];	// 23
+		u8  register_size[4];	// 24
+		u8  total_size[4];	// 25
+		u32 RESERVED7[5];	// 26
+
+		u32 RESERVED8[32736];	// 32
+	}val;
+};
+
+struct fw_info {
+	u32 info_size;
+	u32 core_size;
+	u32 cust_size;
+	u32 regi_size;
+	u32 start_address;
+	u32 end_address;
+};
+
+/* The main device structure */
+
+struct touchpad_data {
+	struct i2c_client	*client;
+	struct input_dev	*input;
+	struct regulator	*vcc;
+
+	const struct zinitix_transport_ops *ops;
+	/* for fw update */
+	struct completion	fw_completion;
+	bool			in_fw_update;
+	struct mutex		sysfs_mutex;
+	unsigned int		phy_x;
+	unsigned int		phy_y;
+	unsigned int		max_x;
+	unsigned int		max_y;
+	unsigned int		width_x;
+	unsigned int		width_y;
+	unsigned int		x_res;
+	unsigned int		y_res;
+
+	u16			product_id;
+	int			pressure_adjustment;
+	bool			irq_wake;
+	u8			*userbuffer;
+	bool 		        ready_userbuffer;
+	u16 		        recv_data_size;
+	u16 		        chip_code;
+};
+
+u16 zinitix_i2c_read_reg(struct i2c_client *client, u16 reg, u16 *value);
+u16 zinitix_i2c_read_data(struct i2c_client *client, u16 reg, u8 *verify_data);
+int zinitix_i2c_write_reg(struct i2c_client *client, u16 reg, u16 value);
+int zinitix_i2c_write_data(struct i2c_client *client, u16 reg, const u8* value, u16 size);
+
+#endif /* _ZINITIX_I2C_H */
+
diff --git a/drivers/input/mouse/Kconfig b/drivers/input/mouse/Kconfig
index d8b6a5dab190..effd1b019b02 100644
--- a/drivers/input/mouse/Kconfig
+++ b/drivers/input/mouse/Kconfig
@@ -457,4 +457,15 @@ config MOUSE_NAVPOINT_PXA27x
 	  To compile this driver as a module, choose M here: the
 	  module will be called navpoint.
 
+config MOUSE_ZINITIX_I2C
+	tristate "ZINITIX I2C Touchpad support"
+	depends on I2C
+	help
+	  This driver adds support for Zinitix I2C Touchpad.
+
+	  Say Y here if you have a Zinitix I2C Touchpad.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called zinitix_i2c.
+
 endif
diff --git a/drivers/input/mouse/Makefile b/drivers/input/mouse/Makefile
index e49f08565076..93ffa556a311 100644
--- a/drivers/input/mouse/Makefile
+++ b/drivers/input/mouse/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_MOUSE_SERIAL)		+= sermouse.o
 obj-$(CONFIG_MOUSE_SYNAPTICS_I2C)	+= synaptics_i2c.o
 obj-$(CONFIG_MOUSE_SYNAPTICS_USB)	+= synaptics_usb.o
 obj-$(CONFIG_MOUSE_VSXXXAA)		+= vsxxxaa.o
+obj-$(CONFIG_MOUSE_ZINITIX_I2C)		+= zinitix_i2c.o
 
 cyapatp-objs := cyapa.o cyapa_gen3.o cyapa_gen5.o cyapa_gen6.o
 psmouse-objs := psmouse-base.o synaptics.o focaltech.o
diff --git a/drivers/input/mouse/zinitix_i2c.c b/drivers/input/mouse/zinitix_i2c.c
index e69de29bb2d1..d441b1cb1274 100755
--- a/drivers/input/mouse/zinitix_i2c.c
+++ b/drivers/input/mouse/zinitix_i2c.c
@@ -0,0 +1,1491 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Zinitics I2C Touchpad driver
+ *
+ * Copyright (c) 2020 ZINITIX Co.,Ltd
+ *
+ * Author: KwangDeok Son <kdson@zinitix.com>
+ *
+ * Based on elan driver:
+ * Copyright (c) 2011-2013 ELAN Microelectronics Corp.
+ * copyright (c) 2011-2012 Cypress Semiconductor, Inc.
+ * copyright (c) 2011-2012 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published
+ * by the Free Software Foundation.
+ *
+ * Trademarks are the property of their respective owners.
+ */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/kernel.h>
+#include <linux/sched.h>
+#include <linux/input.h>
+#include <linux/uaccess.h>
+#include <linux/jiffies.h>
+#include <linux/completion.h>
+#include <linux/of.h>
+#include <asm/unaligned.h>
+
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/i2c.h>
+#include <linux/input/mt.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/regulator/consumer.h>
+#include "zinitix_i2c.h"
+
+static int zinitix_i2c_read(struct i2c_client *client, u16 reg, u8 *val, u16 len)
+{
+	__le16 buf[] = {
+		cpu_to_le16(reg),
+	};
+	struct i2c_msg msgs[] = {
+		{
+			.addr = client->addr,
+			.flags = client->flags & I2C_M_TEN,
+			.len = sizeof(buf),
+			.buf = (u8 *)buf,
+		},
+		{
+			.addr = client->addr,
+			.flags = (client->flags & I2C_M_TEN) | I2C_M_RD,
+			.len = len,
+			.buf = val,
+		}
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+
+	return ret == ARRAY_SIZE(msgs) ? 0 : (ret < 0 ? ret : -EIO);
+}
+
+static int zinitix_i2c_write(struct i2c_client *client, u16 reg, u16 cmd)
+{
+	__le16 buf[] = {
+		cpu_to_le16(reg),
+		cpu_to_le16(cmd),
+	};
+	struct i2c_msg msg = {
+		.addr = client->addr,
+		.flags = client->flags & I2C_M_TEN,
+		.len = sizeof(buf),
+		.buf = (u8 *)buf,
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	if (ret != 1) {
+		if (ret >= 0)
+			ret = -EIO;
+		dev_err(&client->dev, "writing cmd (0x%04x) failed: %d\n", reg, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int zinitix_i2c_read_buf(struct i2c_client *client, u8 *buf, u16 bufsize, u8 *val, u16 len)
+{
+	struct i2c_msg msgs[] = {
+		{
+			.addr = client->addr,
+			.flags = client->flags & I2C_M_TEN,
+			.len = bufsize,
+			.buf = buf,
+		},
+		{
+			.addr = client->addr,
+			.flags = (client->flags & I2C_M_TEN) | I2C_M_RD,
+			.len = len,
+			.buf = val,
+		}
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+
+	return ret == ARRAY_SIZE(msgs) ? 0 : (ret < 0 ? ret : -EIO);
+}
+
+static int zinitix_i2c_write_buf(struct i2c_client *client, u8 *buf, u8 bufsize)
+{
+	struct i2c_msg msg = {
+		.addr = client->addr,
+		.flags = client->flags & I2C_M_TEN,
+		.len = bufsize,
+		.buf = buf,
+	};
+	int ret;
+
+	ret = i2c_transfer(client->adapter, &msg, 1);
+	if (ret != 1) {
+		if (ret >= 0)
+			ret = -EIO;
+		dev_err(&client->dev, "writing cmd (%s) failed: %d\n",
+			buf, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+int zinitix_i2c_write_reg(struct i2c_client *client, u16 reg, u16 value)
+{
+	int errno = 0;
+	u8 buf[22] = {0x80, 0x01, 0x14, 0x00, 0x06, 0x00, };
+
+	buf[6] = reg & 0xFF;
+	buf[7] = (reg>>8)&0xFF;
+	buf[8] = value & 0xFF;
+	buf[9] = (value>>8)&0xFF;
+
+	errno = zinitix_i2c_write_buf(client, buf, 22);
+
+	return errno;
+}
+
+int zinitix_i2c_write_data(struct i2c_client *client, u16 reg, const u8 *value, u16 size)
+{
+	int errno = 0;
+	u8 buf[22] = {0x80, 0x01, 0x14, 0x00, 0x06, 0x00, };
+
+	buf[5] = size & 0xFF;
+	buf[6] = reg & 0xFF;
+	buf[7] = (reg>>8)&0xFF;
+	memcpy(&buf[8], value, size);
+
+	errno = zinitix_i2c_write_buf(client, buf, 22);
+
+	return errno;
+}
+
+int zinitix_i2c_write_fwdata(struct i2c_client *client, u16 reg, const u8 *value, u16 size)
+{
+	int errno = 0;
+	u8 buf[22] = {0x80, 0x01, 0x14, 0x00, 0x06, 0x00, };
+
+	buf[5] = size & 0xFF;
+
+	memcpy(&buf[6], value, size);
+
+	errno = zinitix_i2c_write_buf(client, buf, 22);
+
+	return errno;
+}
+
+u16 zinitix_i2c_read_reg(struct i2c_client *client, u16 reg, u16 *value)
+{
+	u16 retval = 0;
+	u8 outBuf[26] = {0x94, 0x1, 0x26, 0x3, 0x96, 0x1, 0x14, 0, 0x6, 0x1, };
+	u8 inBuf[8] = {0, };
+
+	//Sample
+	outBuf[10] = reg & 0xFF;
+	outBuf[11] = (reg>>8)&0xFF;
+	//Send
+	retval = (u16)zinitix_i2c_write_buf(client, outBuf, 26);
+	//Recv
+	outBuf[2] = 0x16;
+	outBuf[3] = 0x02;
+	retval = (u16)zinitix_i2c_read_buf(client, outBuf, 6, inBuf, 8);
+	if (retval < 0) {
+		dev_err(&client->dev, "reading cmd (0x%04x) fail.\n", reg);
+		return retval;
+	}
+
+	*value = (inBuf[6]&0xFF) | ((inBuf[7]<<8)&0xFF00);
+
+	return retval;
+}
+
+u16 zinitix_i2c_read_data(struct i2c_client *client, u16 reg, u8 *verify_data)
+{
+	u16 retval = 0;
+	u8 outBuf[26] = {0x94, 0x1, 0x26, 0x3, 0x96, 0x1, 0x14, 0, 0x6, 0x1, };
+	u8 inBuf[20] = {0, };
+
+	//Sample
+	outBuf[10] = reg & 0xFF;
+	outBuf[11] = (reg>>8)&0xFF;
+	//Send
+	retval = (u16)zinitix_i2c_write_buf(client, outBuf, 26);
+	//Recv
+	outBuf[2] = 0x16;
+	outBuf[3] = 0x02;
+	retval = (u16)zinitix_i2c_read_buf(client, outBuf, 6, inBuf, 20);
+	if (retval < 0) {
+		dev_err(&client->dev, "reading cmd (0x%04x) fail.\n", reg);
+		return retval;
+	}
+
+	memcpy(verify_data, &inBuf[4], SECTOR_SZ);
+
+	return retval;
+}
+
+static int zinitix_sleep_control(struct i2c_client *client, u16 mode)
+{
+	int error;
+
+		error = zinitix_i2c_write(client, ZINITIX_STANDARD_CMD, mode);
+		if (error)
+			dev_err(&client->dev, "device wake up failed: %d\n", error);
+		else
+			msleep(100); /* Wait for the device to control */
+
+	return error;
+}
+
+static int zinitix_reset(struct i2c_client *client)
+{
+	int error;
+	u8 val[12];
+
+	error = zinitix_i2c_write(client, ZINITIX_STANDARD_CMD, ZINITIX_RESET);
+	if (error)
+		dev_err(&client->dev, "device reset failed: %d\n", error);
+	else {
+		msleep(100);    /* Wait for the device to reset */
+
+		error = i2c_master_recv(client, val, 12);
+		if (error < 0) {
+			dev_err(&client->dev, "failed read reset response: %d\n", error);
+			return -EIO;
+		}
+	}
+
+	return 0;
+}
+
+static int get_descriptor(struct i2c_client *client, u8 *val)
+{
+	struct touchpad_data *data = i2c_get_clientdata(client);
+	int error;
+
+	error = zinitix_i2c_read(client, ZINITIX_GET_DESC, val, ZINITIX_DESC_LENGTH);
+	if (error)
+		dev_err(&client->dev, "can't get descriptor: %d\n", error);
+	else
+		data->chip_code = (u16)(val[16] + (val[17]<<8));
+
+	return error;
+}
+
+static int get_report_descriptor(struct i2c_client *client)
+{
+	int error = 0;
+	u8 val[ZINITIX_REPORT_DESC_LENGTH] = {0,};
+	struct touchpad_data *data = i2c_get_clientdata(client);
+
+	//Get HID Report Descriptor
+	error = zinitix_i2c_read(client, ZINITIX_GET_REPORT_DESC, val, sizeof(val));
+
+	//Get infomation to parse desc
+	data->phy_x = *((u16 *)&val[ZINITIX_PHY_X_OFFSET]);
+	data->phy_y = *((u16 *)&val[ZINITIX_PHY_Y_OFFSET]);
+	return error;
+}
+
+static int set_report(struct i2c_client *client, u8 mode, u8 data)
+{
+	int error;
+	u8 buf[10] = {0x94, 0x01, 0x34, 0x03, 0x96, 0x01, 0x04, 0x00,};
+
+	buf[2] = 0x30 | (mode & 0x0F);
+	buf[8] = mode;
+	buf[9] = data;
+
+	error = zinitix_i2c_write_buf(client, buf, 10);
+
+	if (error)
+		dev_err(&client->dev, "set report desc fail: %d\n", error);
+
+	return error;
+}
+
+static int get_mode(struct i2c_client *client, int *data)
+{
+	int error;
+	u8 val[4];
+	u8 buf[6] = {0x94, 0x01, 0x32, 0x04, 0x96, 0x01 };
+
+	error = zinitix_i2c_read_buf(client, buf, 6, val, 4);
+	if (error)
+		dev_err(&client->dev, "### Get Mode : %d", (int)val[3]);
+	else
+		*data = val[3];
+	return error;
+}
+
+static int zinitix_i2c_initialize(struct i2c_client *client)
+{
+	int error, mode;
+	u8 val[512];
+
+	//Sleep
+	error = zinitix_sleep_control(client, ZINITIX_SLEEP);
+	if (error)
+		return error;
+	//Get HID Descriptor
+	error = get_descriptor(client, val);
+	if (error)
+		return error;
+	//HID_CMD_WAKEUP
+	error = zinitix_sleep_control(client, ZINITIX_WAKE_UP);
+	if (error)
+		return error;
+	//HID_CMD_RESET
+	error = zinitix_reset(client);
+	if (error)
+		return error;
+	//Get HID Report Descriptor
+	error = get_report_descriptor(client);
+	if (error)
+		return error;
+	//Get Mode
+	error = get_mode(client, &mode);
+	if (error)
+		return error;
+	//CMD
+	error = set_report(client, REPORT_SWITCH, SWITCH_BOTH);
+	if (error)
+		return error;
+	error = set_report(client, REPORT_INPUT, INPUT_PTP);
+	if (error)
+		return error;
+	error = set_report(client, REPORT_LATENCY, LATENCY_NORMAL);
+	if (error)
+		return error;
+	return 0;
+}
+
+static int zinitix_i2c_get_max(struct i2c_client *client,
+			    unsigned int *max_x, unsigned int *max_y)
+{
+	int error;
+
+	error = zinitix_i2c_read_reg(client, ZINITIX_MAX_X_REG, (u16 *)max_x);
+	if (error) {
+		dev_err(&client->dev, "failed to get X dimension: %d\n", error);
+		return error;
+	}
+
+	error = zinitix_i2c_read_reg(client, ZINITIX_MAX_Y_REG, (u16 *)max_y);
+	if (error) {
+		dev_err(&client->dev, "failed to get Y dimension: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int zinitix_i2c_get_num_channel(struct i2c_client *client,
+				   unsigned short *chennel_x,
+				   unsigned short *chennel_y)
+{
+	int error;
+
+	error = zinitix_i2c_read_reg(client, ZINITIX_CH_X_REG, chennel_x);
+	if (error) {
+		dev_err(&client->dev, "failed to get CH X: %d\n", error);
+		return error;
+	}
+
+	error = zinitix_i2c_read_reg(client, ZINITIX_CH_Y_REG, chennel_y);
+	if (error) {
+		dev_err(&client->dev, "failed to get CH Y: %d\n", error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int zinitix_i2c_prepare_fw_update(struct i2c_client *client)
+{
+	u16 u16_lsb, u16_msb;
+	u16 Bootloader_ver;
+	u16 ver_major, ver_minor, ver_rel;
+	u32 info_checksum;
+	u32 core_checksum;
+	int error = 0;
+
+	error = zinitix_i2c_read_reg(client, REG_FWVERSION_MAJOR, &ver_major);
+	error = zinitix_i2c_read_reg(client, REG_FWVERSION_MINOR, &ver_minor);
+	error = zinitix_i2c_read_reg(client, REG_FWVERSION_RELEASE, &ver_rel);
+
+	//get Checksum
+	error = zinitix_i2c_read_reg(client, 0x00E4, &u16_lsb);
+	error = zinitix_i2c_read_reg(client, 0x00E5, &u16_msb);
+	info_checksum = (u16_msb<<16) | u16_lsb;
+
+	error = zinitix_i2c_read_reg(client, 0x00E6, &u16_lsb);
+	error = zinitix_i2c_read_reg(client, 0x00E7, &u16_msb);
+	core_checksum = (u16_msb<<16) | u16_lsb;
+
+	error = zinitix_i2c_write_reg(client, FWUPGRADE_MODE, 0x0001);
+	error = zinitix_i2c_read_reg(client, REG_FWVERSION_RELEASE, &Bootloader_ver);
+
+	error = zinitix_i2c_write_reg(client, FWUPGRADE_MODE, 0x0002);
+	error = zinitix_i2c_read_reg(client, REG_FWVERSION_RELEASE, &Bootloader_ver);
+
+	//init download
+	zinitix_i2c_write_reg(client, VENDOR_CMD_ENABLE, 0x0001);
+	msleep(20);
+
+	zinitix_i2c_write_reg(client, INIT_NVM, 0x0001);
+	msleep(20);
+
+	zinitix_i2c_write_reg(client, DISABLE_NVM_WP, 0x0001);
+	msleep(20);
+
+	zinitix_i2c_write_reg(client, FWUPGRADE_INIT, 0x0000);
+
+	return 0;
+}
+
+static int zinitix_i2c_read_fw_block(struct i2c_client *client,
+				   u8 *page, int idx)
+{
+	struct device *dev = &client->dev;
+	int ret, error;
+
+	ret = zinitix_i2c_read_data(client, FWUPGRADE_READ, page);
+	if (ret != 0) {
+		dev_err(dev, "Failed to read page %d: %d\n", idx, error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int zinitix_i2c_write_fw_block(struct i2c_client *client,
+				   const u8 *page, u16 checksum, int idx)
+{
+	struct device *dev = &client->dev;
+	int ret, error;
+
+	ret = zinitix_i2c_write_fwdata(client, FWUPGRADE_PGM, page, checksum);
+	if (ret != 0) {
+		dev_err(dev, "Failed to write page %d: %d\n", idx, error);
+		return error;
+	}
+
+	return 0;
+}
+
+static int zinitix_i2c_finish_fw_update(struct i2c_client *client,
+				     struct completion *completion)
+{
+	struct device *dev = &client->dev;
+	int error;
+	u16 ver_major, ver_minor, ver_rel;
+	u16 retry_cnt = 100;
+	u16 checksum = 0, temp = 0, value = 0;
+
+	enable_irq(client->irq);
+
+	error = zinitix_i2c_write_reg(client, HW_RESET, 0);
+	if (error)
+		dev_err(dev, "device reset failed: %d\n", error);
+
+	msleep(1500);
+
+	disable_irq(client->irq);
+
+	if (error) {
+		dev_err(dev, "fw_update Fail :%d", error);
+		return error;
+	}
+
+	//Touchpad Mode Enter
+	error = zinitix_i2c_read_reg(client, 0x10, &value);
+	if (error) {
+		dev_err(dev, "zinitix_i2c_read_reg reg: 0x10 err: %d\n", error);
+		return error;
+	}
+	msleep(20);
+
+	error = zinitix_i2c_read_reg(client, REG_FWVERSION_MAJOR, &ver_major);
+	error = zinitix_i2c_read_reg(client, REG_FWVERSION_MINOR, &ver_minor);
+	error = zinitix_i2c_read_reg(client, REG_FWVERSION_RELEASE, &ver_rel);
+	error = zinitix_i2c_read_reg(client, REG_FWCHECKSUM, &checksum);
+	error = zinitix_i2c_write_reg(client, 0x00F0, 0x2000);
+	error = zinitix_i2c_write_reg(client, 0x00F0, 0x2000);
+	if (error) {
+		dev_err(dev, "write[0x00F0][0x2000] err: %d\n", error);
+		return error;
+	}
+
+	while (retry_cnt-- > 0) {
+		error = zinitix_i2c_write_reg(client, 0x00F0, 0x2000);
+		if (error) {
+			dev_err(dev, "write[0x00F0],[0x2000] err: %d\n", error);
+			return error;
+		}
+		error = zinitix_i2c_read_reg(client, 0x00F0, &temp);
+		if (error) {
+			dev_err(dev, "read[0x00F0] err: %d\n", error);
+			return error;
+		}
+		if (temp == 0x2000)
+			break;
+	}
+
+	zinitix_i2c_write_reg(client, 0x13F0, 0x0001);
+
+	if (retry_cnt > 0) {
+		const u8 DataBuf[2] = {0xDA, 0xCA};
+
+		zinitix_i2c_write_data(client, 0x0006, DataBuf, 0x0002);
+		msleep(50);
+		retry_cnt = 100;
+		while (retry_cnt-- > 0) {
+			error = zinitix_i2c_read_reg(client, 0x0018, &temp);
+			if (error) {
+				dev_err(dev, "read 0x0018, err: %d\n", error);
+				return error;
+			}
+			if (temp == 0xFFFE)
+				break;
+			msleep(20);
+		}
+
+		if (retry_cnt > 0) {
+			//save_cal_data
+			zinitix_i2c_write_reg(client, 0x0008, 0x0000);
+			msleep(500);
+			//Interrupt Enable
+			zinitix_i2c_write_reg(client, 0x00F0, 0x880F);
+			zinitix_i2c_write_reg(client, 0x00F0, 0x880F);
+
+			retry_cnt = 100;
+			while (retry_cnt-- > 0) {
+				zinitix_i2c_write_reg(client, 0x00F0, 0x880F);
+				zinitix_i2c_read_reg(client, 0x00F0, &temp);
+				if (temp == 0x880F)
+					break;
+			}
+
+			if (retry_cnt > 0) {
+				zinitix_i2c_read_reg(client, 0x0018, &temp);
+				dev_err(dev, "HW_calibration done(0x%X)\n", temp);
+			}
+		}
+	}
+
+	zinitix_i2c_write_reg(client, 0x13F0, 0x0000);	//NVM Write Disable
+
+	return 0;
+}
+
+static int zinitix_i2c_get_report(struct i2c_client *client, u8 *report)
+{
+	int len;
+
+	len = i2c_master_recv(client, report, ZINITIX_I2C_REPORT_LEN);
+	if (len < 0) {
+		dev_err(&client->dev, "failed to read report data: %d\n", len);
+		return len;
+	}
+
+	if (len != ZINITIX_I2C_REPORT_LEN) {
+		dev_err(&client->dev,
+			"wrong report length (%d vs %d expected)\n",
+			len, ZINITIX_I2C_REPORT_LEN);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+const struct zinitix_transport_ops zinitix_i2c_ops = {
+	.initialize		= zinitix_i2c_initialize,
+	.sleep_control		= zinitix_sleep_control,
+	.reset		        = zinitix_reset,
+	.get_max		= zinitix_i2c_get_max,
+	.get_num_channel        = zinitix_i2c_get_num_channel,
+	.prepare_fw_update	= zinitix_i2c_prepare_fw_update,
+	.write_fw_block		= zinitix_i2c_write_fw_block,
+	.read_fw_block		= zinitix_i2c_read_fw_block,
+	.finish_fw_update	= zinitix_i2c_finish_fw_update,
+	.get_report		= zinitix_i2c_get_report,
+};
+
+static int zinitix_enable_power(struct touchpad_data *data)
+{
+	int repeat = ZINITIX_RETRY_COUNT;
+	int error = regulator_enable(data->vcc);
+
+	if (error) {
+		dev_err(&data->client->dev,
+			"failed to enable regulator: %d\n", error);
+		return error;
+	}
+
+	do {
+		error = data->ops->sleep_control(data->client, true);
+		if (error >= 0)
+			return 0;
+
+		msleep(30);
+	} while (--repeat > 0);
+
+	dev_err(&data->client->dev, "failed to enable power: %d\n", error);
+	return error;
+}
+
+static int zinitix_disable_power(struct touchpad_data *data)
+{
+	int repeat = ZINITIX_RETRY_COUNT;
+	int error = 0;
+
+	do {
+		error = data->ops->sleep_control(data->client, false);
+		if (!error) {
+			error = regulator_disable(data->vcc);
+			if (error) {
+				dev_err(&data->client->dev,
+					"failed to disable regulator: %d\n",
+					error);
+				/* Attempt to power the chip back up */
+				data->ops->sleep_control(data->client, true);
+				break;
+			}
+
+			return 0;
+		}
+
+		msleep(30);
+	} while (--repeat > 0);
+
+	dev_err(&data->client->dev, "failed to disable power: %d\n", error);
+	return error;
+}
+
+static int zinitix_sleep(struct touchpad_data *data)
+{
+	int repeat = ZINITIX_RETRY_COUNT;
+	int error;
+
+	do {
+		error = data->ops->sleep_control(data->client, true);
+		if (!error)
+			return 0;
+
+		msleep(30);
+	} while (--repeat > 0);
+
+	return error;
+}
+
+static int zinitix_initialize(struct touchpad_data *data)
+{
+	struct i2c_client *client = data->client;
+	int repeat = ZINITIX_RETRY_COUNT;
+	int error;
+
+	do {
+		error = data->ops->initialize(client);
+		if (!error)
+			return 0;
+
+		dev_err(&client->dev, "device initialize failed: %d\n", error);
+		msleep(30);
+	} while (--repeat > 0);
+
+	return error;
+}
+
+static unsigned int zinitix_get_resolution(u16 val)
+{
+	return (val * 10 + 300) * 10 / 254;
+}
+
+static int zinitix_query_device_parameters(struct touchpad_data *data)
+{
+	unsigned short ch_x, ch_y;
+	int error;
+
+	error = data->ops->get_max(data->client, &data->max_x, &data->max_y);
+	if (error)
+		return error;
+
+	error = data->ops->get_num_channel(data->client, &ch_x, &ch_y);
+	if (error)
+		return error;
+
+	data->width_x = data->max_x / ch_x;
+	data->width_y = data->max_y / ch_y;
+
+	data->x_res = zinitix_get_resolution(data->max_x / data->phy_x);
+	data->y_res = zinitix_get_resolution(data->max_y / data->phy_y);
+
+	//pressure level
+	data->pressure_adjustment = 0x0011;
+	return 0;
+}
+
+/*
+ **********************************************************
+ * firmware update
+ **********************************************************
+ */
+static int zinitix_read_fw_block(struct touchpad_data *data,
+					u8 *page, int idx)
+{
+	int error;
+	int retry = ZINITIX_RETRY_COUNT;
+
+	do {
+		error = data->ops->read_fw_block(data->client, page, idx);
+		if (!error)
+			return 0;
+
+		dev_dbg(&data->client->dev,
+			"retrying read page %d (error: %d)\n", idx, error);
+
+	} while (--retry > 0);
+
+	return error;
+}
+
+static int zinitix_write_fw_block(struct touchpad_data *data,
+			       const u8 *page, u16 checksum, int idx)
+{
+	int error;
+	int retry = ZINITIX_RETRY_COUNT;
+
+	do {
+		error = data->ops->write_fw_block(data->client, page, checksum, idx);
+		if (!error)
+			return 0;
+
+		dev_dbg(&data->client->dev,
+		"retrying write page %d (error: %d)\n", idx, error);
+	} while (--retry > 0);
+
+	return error;
+}
+
+static int get_fw_sizeinfo(const struct firmware *fw, struct fw_info *info)
+{
+	union nvm_binary_info *bin_info = (union nvm_binary_info *)&fw->data[0];
+
+	info->info_size = (u32)TO_LITTLE_ENDIAN(bin_info->val.info_size[1],
+						bin_info->val.info_size[2],
+						bin_info->val.info_size[3]);
+	info->core_size = (u32)TO_LITTLE_ENDIAN(bin_info->val.core_size[1],
+						bin_info->val.core_size[2],
+						bin_info->val.core_size[3]);
+	info->cust_size = (u32)TO_LITTLE_ENDIAN(bin_info->val.custom_size[1],
+						bin_info->val.custom_size[2],
+						bin_info->val.custom_size[3]);
+	info->regi_size = (u32)TO_LITTLE_ENDIAN(bin_info->val.register_size[1],
+						bin_info->val.register_size[2],
+						bin_info->val.register_size[3]);
+
+	info->end_address = info->info_size + info->core_size + info->cust_size + info->regi_size;
+	info->start_address = info->info_size + info->core_size;
+	return 0;
+}
+
+static int zinitix_flash_erase(struct i2c_client *client, int flash_addr)
+{
+	u8 data[4] = {0x00, 0x00, 0x00, 0x00};
+	int i = 0;
+
+	for (i = flash_addr; i < 32; i++) {
+		data[2] = i;
+		zinitix_i2c_write_data(client, FWUPGRADE_BLOCK_ERASE, data, 4);
+		msleep(60);
+	}
+
+	data[0] = 1;
+	for (i = 1; i < 4; i++) {
+		data[2] = i;
+		zinitix_i2c_write_data(client, FWUPGRADE_BLOCK_ERASE, data, 4);
+		msleep(60);
+	}
+
+	return 0;
+}
+
+static int __zinitix_update_firmware(struct touchpad_data *data,
+				  const struct firmware *fw)
+{
+	struct i2c_client *client = data->client;
+	struct device *dev = &client->dev;
+	int i, error, page_size;
+	int fw_addr;
+	struct fw_info flash;
+
+	page_size  = 1024;
+	error = data->ops->prepare_fw_update(client);
+	if (error) {
+		dev_err(dev, "prepare fw upadate err:%d\n", error);
+		return error;
+	}
+
+	//get firmware info
+	get_fw_sizeinfo(fw, &flash);
+	zinitix_flash_erase(client, flash.start_address);
+
+	//write firmware
+	fw_addr = (flash.info_size + flash.core_size) / 1024;
+
+	zinitix_i2c_write_reg(client, FWUPGRADE_INIT, 0x0000);
+	zinitix_i2c_write_reg(client, FWUPGRADE_START_PAGE, fw_addr);
+	for (fw_addr = flash.start_address; fw_addr < flash.end_address; ) {
+		for (i = 0; i < page_size / SECTOR_SZ; i++) {
+			error = zinitix_write_fw_block(data, &fw->data[fw_addr], SECTOR_SZ, i);
+			if (error) {
+				dev_err(dev, "fw write %d err:%d\n", i, error);
+				return error;
+			}
+
+			fw_addr += SECTOR_SZ;
+		}
+		msleep(20);
+	}
+
+	fw_addr = (flash.info_size + flash.core_size) / 1024;
+	zinitix_i2c_write_reg(client, FWUPGRADE_INIT, 0x0000);
+	zinitix_i2c_write_reg(client, FWUPGRADE_START_PAGE, fw_addr);
+	msleep(20);
+
+	//verify
+	fw_addr = flash.start_address;
+	for (; fw_addr < flash.end_address; ) {
+		u8 verify[16] = {0,};
+
+		for (i = 0; i < page_size / SECTOR_SZ; i++) {
+			zinitix_read_fw_block(data, verify, i);
+			if (error) {
+				dev_err(dev, "err verify read : %d\n", error);
+				return error;
+			}
+
+			if (memcmp(&fw->data[fw_addr], verify, SECTOR_SZ)) {
+				dev_err(dev, "err verify cmp : %d\n", error);
+				return error;
+			}
+
+			fw_addr += SECTOR_SZ;
+		}
+	} //verify success
+
+	//complete fw update
+	error = data->ops->finish_fw_update(client, &data->fw_completion);
+	if (error) {
+		dev_err(dev, "err finish_fw_update: %d\n", error);
+		return error;
+	}
+	return 0;
+}
+
+static int zinitix_update_firmware(struct touchpad_data *data,
+				const struct firmware *fw)
+{
+	int retval = 0;
+	struct i2c_client *client = data->client;
+
+	disable_irq(client->irq);
+	data->in_fw_update = true;
+	zinitix_i2c_write_reg(client, 0xff, 0x01);
+	retval = __zinitix_update_firmware(data, fw);
+	if (retval) {
+		dev_err(&client->dev, "fw update failed: %d\n", retval);
+		data->ops->reset(client);
+	} else {
+		/* Reinitialize TP after fw is updated */
+		zinitix_initialize(data);
+		dev_err(&client->dev, "fw update Success!!!: %d\n", retval);
+	}
+
+	data->in_fw_update = false;
+	enable_irq(client->irq);
+
+	return retval;
+}
+
+//probe or init
+static int zinitix_check_update_firmware(struct device *dev)
+{
+	int retval = 0;
+	int error = 0;
+	char *fw_name;
+	union nvm_binary_info *fw_info;
+	const struct firmware *fw;
+	u16 fw_ver = 0;
+	u16 dev_ver = 0;
+
+	struct i2c_client *client = to_i2c_client(dev);
+
+	fw_name = kasprintf(GFP_KERNEL, ZINITIX_FW_NAME);
+	if (!fw_name) {
+		dev_err(dev, "failed to allocate memory for firmware name\n");
+		return -ENOMEM;
+	}
+
+
+	//1. Check FW Bin file
+	error = request_firmware(&fw, fw_name, dev);	//linux Kernel API
+	kfree(fw_name);
+	if (error) {
+		dev_err(dev, "failed to request firmware: %d\n", error);
+		return error;
+	}
+
+	//2. Check FW version
+	fw_info = (union nvm_binary_info *)&fw[0];
+	fw_ver = fw_info->val.minor_ver;
+	error = zinitix_i2c_read_reg(client, REG_FWVERSION_MINOR, &dev_ver);
+
+	if (dev_ver <= fw_ver) { //3. Current Version < New Version
+		dev_info(dev, "check FW[0x%X : 0x%X] boot!\n", fw_ver, dev_ver);
+	} else {
+		dev_info(dev, "checked No Firmware in boot Sequence T_T\n");
+	}
+
+	release_firmware(fw);
+	return retval;
+}
+
+/*
+ *********
+ * SYSFS
+ */
+static ssize_t update_fw_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct touchpad_data *data = dev_get_drvdata(dev);
+	const struct firmware *fw;
+	char *fw_name;
+	int error;
+
+	fw_name = kasprintf(GFP_KERNEL, ZINITIX_FW_NAME);
+	if (!fw_name) {
+		dev_err(dev, "failed to allocate memory for firmware name\n");
+		return -ENOMEM;
+	}
+
+	error = request_firmware(&fw, fw_name, dev);	//linux Kernel API
+	kfree(fw_name);
+	if (error) {
+		dev_err(dev, "failed to request firmware: %d\n", error);
+		return error;
+	}
+
+	error = mutex_lock_interruptible(&data->sysfs_mutex);
+	if (error)
+		goto out_release_fw;
+
+	error = zinitix_update_firmware(data, fw);
+
+	mutex_unlock(&data->sysfs_mutex);
+
+out_release_fw:
+	release_firmware(fw);
+	return error ?: count;
+}
+
+static DEVICE_ATTR_WO(update_fw);
+
+static ssize_t send_data_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct touchpad_data *data = i2c_get_clientdata(client);
+	u16 cmd, reg_addr, reg_val;
+	int error, nsize = 0;
+
+	cmd = (buf[0]&0x00FF) | (buf[1]<<8 & 0xFF00);
+	reg_addr = (buf[2]&0x00FF) | (buf[3]<<8 & 0xFF00);
+
+	switch (cmd) {
+	case WRITE_REG:
+		reg_val = (buf[4]&0x00FF) | (buf[5]<<8 & 0xFF00);
+		zinitix_i2c_write_reg(client, reg_addr, reg_val);
+	break;
+
+	case READ_REG:
+		nsize = count + 2;
+		if (nsize >= 512)
+			nsize = 512;
+		memset(data->userbuffer, 0, nsize);
+		zinitix_i2c_read_reg(client, reg_addr, &reg_val);
+		data->userbuffer[0] = reg_val & 0xFF;
+		data->userbuffer[1] = (reg_val>>8) & 0xFF;
+		data->ready_userbuffer = true;
+		data->recv_data_size = count;
+	break;
+
+	case VENDOR_COMMAND_READ:
+		nsize = count + 2;
+		memset(data->userbuffer, 0, nsize);
+		zinitix_i2c_read_data(client, reg_addr, data->userbuffer);
+		data->ready_userbuffer = true;
+		data->recv_data_size = count;
+	break;
+
+	case VENDOR_COMMAND_WRITE:
+		zinitix_i2c_write_data(client, reg_addr, &buf[sizeof(u16)*2], count);
+		data->ready_userbuffer = true;
+		data->recv_data_size = count;
+	break;
+
+	case FIRMWARE_WRITE:
+		zinitix_write_fw_block(data, &buf[2], SECTOR_SZ, 0);
+	break;
+
+	case DEVICE_INIT:
+		error = data->ops->initialize(client);
+		if (error) {
+			dev_err(&client->dev, "dev init failed: %d\n", error);
+			return error;
+		}
+	break;
+
+	default:
+		break;
+	}
+
+	return count;
+}
+static DEVICE_ATTR_WO(send_data);
+
+static ssize_t recv_data_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct touchpad_data *data = i2c_get_clientdata(client);
+	int size = 0;
+
+	u16 cmd = (buf[0]&0x00FF) | (buf[1]<<8 & 0xFF00);
+
+	switch (cmd) {
+	case GET_INFO_CHIPID:
+		memcpy(buf, &data->chip_code, sizeof(u16));
+		break;
+	default:
+		break;
+	}
+
+	size = data->recv_data_size;
+	data->userbuffer[size] = '\0';
+
+	memcpy(buf, data->userbuffer, size);
+
+	data->ready_userbuffer = false;
+	return size;
+}
+
+static DEVICE_ATTR_RO(recv_data);
+
+static struct attribute *zinitix_sysfs_entries[] = {
+	&dev_attr_update_fw.attr,
+	&dev_attr_send_data.attr,
+	&dev_attr_recv_data.attr,
+	NULL,
+};
+
+static const struct attribute_group zinitix_sysfs_group = {
+	.attrs = zinitix_sysfs_entries,
+};
+
+static const struct attribute_group *zinitix_sysfs_groups[] = {
+	&zinitix_sysfs_group,
+	NULL
+};
+
+/*
+ **************
+ * Zinitix isr
+ */
+
+static void zinitix_report_contact(struct touchpad_data *data, int contact_num, bool contact_valid, u8 *finger_data)
+{
+	struct input_dev *input = data->input;
+	unsigned int pos_x, pos_y;
+	unsigned int mk_x, mk_y;
+	unsigned int area_x, area_y, major, minor;
+
+	if (contact_valid) {
+		pos_x = finger_data[0] | finger_data[1] << 8;
+		pos_y = finger_data[2] | finger_data[3] << 8;
+
+		mk_x = mk_y = 0x2;	//임의값으로 테스트 후 제거
+
+		if (pos_x > data->max_x || pos_y > data->max_y) {
+			dev_dbg(input->dev.parent,
+				"[%d] x=%d y=%d over max (%d, %d)",
+				contact_num, pos_x, pos_y,
+				data->max_x, data->max_y);
+			return;
+		}
+
+		area_x = mk_x * (data->width_x - ZINITIX_FWIDTH_REDUCE);
+		area_y = mk_y * (data->width_y - ZINITIX_FWIDTH_REDUCE);
+
+		major = max(area_x, area_y);
+		minor = min(area_x, area_y);
+
+		input_mt_slot(input, contact_num);
+		input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
+		input_report_abs(input, ABS_MT_POSITION_X, pos_x);
+		input_report_abs(input, ABS_MT_POSITION_Y, pos_y);
+		input_report_abs(input, ABS_MT_PRESSURE, ZINITIX_TP_PRESS);
+		input_report_abs(input, ABS_TOOL_WIDTH, mk_x);
+		input_report_abs(input, ABS_MT_TOUCH_MAJOR, major);
+		input_report_abs(input, ABS_MT_TOUCH_MINOR, minor);
+	} else {
+		input_mt_slot(input, contact_num);
+		input_mt_report_slot_state(input, MT_TOOL_FINGER, false);
+	}
+}
+
+static void zinitix_report_absolute(struct touchpad_data *data, u8 *packet, bool lastPacket)
+{
+	struct input_dev *input = data->input;
+	u8 *finger_data = &packet[ZINITIX_FINGER_DATA_OFFSET];
+	u8 btn = packet[ZINITIX_BUTTON_OFFSET];
+	int contact_id;
+	struct zinitix_contact_status *contact_info;
+	bool contact_valid = true;
+
+	contact_info = (struct zinitix_contact_status *)&packet[3];
+
+	if (contact_info->confidence)
+		contact_valid = contact_info->tip;
+	else
+		contact_valid = false;
+
+	contact_id =  (packet[3]>>2) + 1;
+	zinitix_report_contact(data, contact_id, contact_valid, finger_data);
+
+	if (true == lastPacket)	{
+		input_report_key(input, BTN_LEFT, (btn) & 0x01);
+		input_report_abs(input, ABS_DISTANCE, false);
+		input_mt_report_pointer_emulation(input, true);
+		input_sync(input);
+	}
+}
+
+static irqreturn_t zinitix_isr(int irq, void *dev_id)
+{
+	struct touchpad_data *data = dev_id;
+	struct device *dev = &data->client->dev;
+	int error;
+	int isrCnt;
+	u8 report[ZINITIX_MAX_REPORT_LEN];
+	bool lastPacket = false;
+
+	if (data->in_fw_update) {
+		complete(&data->fw_completion);
+		goto out;
+	}
+
+	do {
+		error = data->ops->get_report(data->client, report);
+		if (error)
+			goto out;
+		if (report[ZINITIX_REPORT_ID_OFFSET] == ZINITIX_REPORT_ID) {
+			if (report[10] > 0)
+				isrCnt = report[10];
+
+			isrCnt--;
+
+			if (isrCnt <= 0)
+				lastPacket = true;
+
+			zinitix_report_absolute(data, report, lastPacket);
+		} else {
+			dev_err(dev, "Exception (ID : 0x%x)!!\n", report[ZINITIX_REPORT_ID_OFFSET]);
+			goto out;
+		}
+	} while (isrCnt > 0);
+out:
+	return IRQ_HANDLED;
+}
+
+/*
+ ***************
+ * Zinitix init
+ */
+static int zinitix_setup_input_device(struct touchpad_data *data)
+{
+	struct device *dev = &data->client->dev;
+	struct input_dev *input;
+	unsigned int max_width = max(data->width_x, data->width_y);
+	unsigned int min_width = min(data->width_x, data->width_y);
+	int error;
+	int finger_width = 15;
+
+	input = devm_input_allocate_device(dev);
+	if (!input)
+		return -ENOMEM;
+
+	input->name = "Zinitix Touchpad";
+	input->id.bustype = BUS_I2C;
+	input->id.vendor = ZINITIX_VENDOR_ID;
+	input->id.product = data->product_id;
+	input_set_drvdata(input, data);
+
+	error = input_mt_init_slots(input, ZINITIX_MAX_FINGERS,
+				    INPUT_MT_POINTER | INPUT_MT_DROP_UNUSED);
+	if (error) {
+		dev_err(dev, "failed to initialize MT slots: %d\n", error);
+		return error;
+	}
+
+	__set_bit(EV_ABS, input->evbit);
+	__set_bit(INPUT_PROP_POINTER, input->propbit);
+	__set_bit(INPUT_PROP_BUTTONPAD, input->propbit);
+	__set_bit(BTN_LEFT, input->keybit);
+
+	/* Set up ST parameters */
+	input_set_abs_params(input, ABS_X, 0, data->max_x, 0, 0);
+	input_set_abs_params(input, ABS_Y, 0, data->max_y, 0, 0);
+	input_abs_set_res(input, ABS_X, data->x_res);
+	input_abs_set_res(input, ABS_Y, data->y_res);
+	input_set_abs_params(input, ABS_PRESSURE, 0, ZINITIX_TP_PRESS, 0, 0);
+	input_set_abs_params(input, ABS_TOOL_WIDTH, 0, finger_width, 0, 0);
+	input_set_abs_params(input, ABS_DISTANCE, 0, 1, 0, 0);
+
+	/* And MT parameters */
+	input_set_abs_params(input, ABS_MT_POSITION_X, 0, data->max_x, 0, 0);
+	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, data->max_y, 0, 0);
+	input_abs_set_res(input, ABS_MT_POSITION_X, data->x_res);
+	input_abs_set_res(input, ABS_MT_POSITION_Y, data->y_res);
+	input_set_abs_params(input, ABS_MT_PRESSURE, 0, ZINITIX_TP_PRESS, 0, 0);
+
+	input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0, finger_width * max_width, 0, 0);
+
+	input_set_abs_params(input, ABS_MT_TOUCH_MINOR, 0, finger_width * min_width, 0, 0);
+
+	data->input = input;
+
+	return 0;
+}
+
+static void zinitix_disable_regulator(void *_data)
+{
+	struct touchpad_data *data = _data;
+
+	regulator_disable(data->vcc);
+}
+
+static void zinitix_remove_sysfs_groups(void *_data)
+{
+	struct touchpad_data *data = _data;
+
+	sysfs_remove_groups(&data->client->dev.kobj, zinitix_sysfs_groups);
+}
+
+static int zinitix_touchpad_probe(struct i2c_client *client,
+		      const struct i2c_device_id *dev_id)
+{
+	const struct zinitix_transport_ops *transport_ops;
+	struct device *dev = &client->dev;
+	struct touchpad_data *data;
+	unsigned long irqflags;
+	int error;
+
+	if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		transport_ops = &zinitix_i2c_ops;
+	} else {
+		dev_err(dev, "not a supported I2C/SMBus adapter\n");
+		return -EIO;
+	}
+	data = devm_kzalloc(dev, sizeof(struct touchpad_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	i2c_set_clientdata(client, data);
+
+	data->ops = transport_ops;
+	data->client = client;
+	data->userbuffer = kmalloc(1024, GFP_KERNEL);
+
+	init_completion(&data->fw_completion);
+	mutex_init(&data->sysfs_mutex);
+	data->vcc = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(data->vcc)) {
+		error = PTR_ERR(data->vcc);
+		if (error != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get 'vcc' regulator: %d\n",
+				error);
+		return error;
+	}
+	error = regulator_enable(data->vcc);
+	if (error) {
+		dev_err(dev, "Failed to enable regulator: %d\n", error);
+		return error;
+	}
+	error = devm_add_action(dev, zinitix_disable_regulator, data);
+	if (error) {
+		regulator_disable(data->vcc);
+		dev_err(dev, "Failed to add disable regulator action: %d\n",
+			error);
+		return error;
+	}
+	/* Initialize the touchpad. */
+	error = zinitix_initialize(data);
+	if (error)
+		return error;
+	error = zinitix_check_update_firmware(dev);
+
+	error = zinitix_query_device_parameters(data);
+	if (error)
+		dev_err(&client->dev, "query_device_parameters Fail!!!");
+
+	error = zinitix_setup_input_device(data);
+	if (error)
+		return error;
+	irqflags = irq_get_trigger_type(client->irq);
+	if (!irqflags)
+		irqflags = IRQF_TRIGGER_FALLING;
+
+	error = devm_request_threaded_irq(dev, client->irq, NULL, zinitix_isr,
+					  irqflags | IRQF_ONESHOT,
+					  client->name, data);
+	if (error) {
+		dev_err(dev, "cannot register irq=%d\n", client->irq);
+		return error;
+	}
+	error = sysfs_create_groups(&dev->kobj, zinitix_sysfs_groups);
+	if (error) {
+		dev_err(dev, "failed to create sysfs attributes: %d\n", error);
+		return error;
+	}
+	error = devm_add_action(dev, zinitix_remove_sysfs_groups, data);
+	if (error) {
+		zinitix_remove_sysfs_groups(data);
+		dev_err(dev, "Failed to add sysfs cleanup action: %d\n",
+			error);
+		return error;
+	}
+	error = input_register_device(data->input);
+	if (error) {
+		dev_err(dev, "failed to register input device: %d\n", error);
+		return error;
+	}
+	if (!dev->of_node)
+		device_init_wakeup(dev, true);
+	return 0;
+}
+
+static int __maybe_unused zinitix_touchpad_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct touchpad_data *data = i2c_get_clientdata(client);
+	int ret;
+
+	ret = mutex_lock_interruptible(&data->sysfs_mutex);
+	if (ret)
+		return ret;
+
+	disable_irq(client->irq);
+
+	if (device_may_wakeup(dev)) {
+		ret = zinitix_sleep(data);
+		/* Enable wake from IRQ */
+		data->irq_wake = (enable_irq_wake(client->irq) == 0);
+	} else {
+		ret = zinitix_disable_power(data);
+	}
+
+	mutex_unlock(&data->sysfs_mutex);
+	return ret;
+}
+
+static int __maybe_unused zinitix_touchpad_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct touchpad_data *data = i2c_get_clientdata(client);
+	int error;
+
+	if (device_may_wakeup(dev) && data->irq_wake) {
+		disable_irq_wake(client->irq);
+		data->irq_wake = false;
+	}
+
+	error = zinitix_enable_power(data);
+	if (error) {
+		dev_err(dev, "power up when resuming failed: %d\n", error);
+		goto err;
+	}
+
+	error = zinitix_initialize(data);
+	if (error)
+		dev_err(dev, "initialize when resuming failed: %d\n", error);
+
+err:
+	enable_irq(data->client->irq);
+	return error;
+}
+
+static SIMPLE_DEV_PM_OPS(zinitix_pm_ops, zinitix_touchpad_suspend, zinitix_touchpad_resume);
+
+static const struct i2c_device_id zinitix_touchpad_id[] = {
+	{ ZINITIX_TOUCHPAD_DRIVER_NAME, 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, zinitix_touchpad_id);
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id zinitix_acpi_id[] = {
+{ "ZNT0002", 0 },
+{ "ZNT0003", 0 },
+{ "ZNT0004", 0 },
+{ "ZNT0005", 0 },
+{ "ZNT0006", 0 },
+{ "ZNT0007", 0 },
+{ "ZNT0008", 0 },
+{ "ZNT0009", 0 },
+{ "ZNT000A", 0 },
+{ "ACPI0C50", 0 },
+{ "PNP0C50", 0 },
+{  },
+};
+MODULE_DEVICE_TABLE(acpi, zinitix_acpi_id);
+#endif
+
+#ifdef CONFIG_OF
+static const struct of_device_id zinitix_of_match[] = {
+	{ .compatible = "zinitix, zntxtp" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, zinitix_of_match);
+#endif
+
+static struct i2c_driver zinitix_touchpad_driver = {
+	.driver = {
+		.name	                = ZINITIX_TOUCHPAD_DRIVER_NAME,
+		.pm	                = &zinitix_pm_ops,
+		.acpi_match_table       = ACPI_PTR(zinitix_acpi_id),
+		.of_match_table         = of_match_ptr(zinitix_of_match),
+		.probe_type             = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe		                = zinitix_touchpad_probe,
+	.id_table	                = zinitix_touchpad_id,
+};
+
+module_i2c_driver(zinitix_touchpad_driver);
+
+MODULE_AUTHOR("<kdson@zinitix.com>");
+MODULE_DESCRIPTION("ZINITIX I2C Touchpad driver");
+MODULE_LICENSE("GPL");
+MODULE_VERSION(ZINITIX_DRIVER_VERSION);
+
+
diff --git a/drivers/input/mouse/zinitix_i2c.h b/drivers/input/mouse/zinitix_i2c.h
index e69de29bb2d1..c33dcdcaab00 100755
--- a/drivers/input/mouse/zinitix_i2c.h
+++ b/drivers/input/mouse/zinitix_i2c.h
@@ -0,0 +1,255 @@
+/*
+ * ZINITIX I2C Touchpad driver
+ *
+ * Copyright (c) 2020 ZINITIX Co.,Ltd
+ *
+ * Author: KwangDeok Son <kdson@zinitix.com>
+ *
+ * Based on cyapa driver:
+ * copyright (c) 2011-2013 ELAN Microelectronics Corp.
+ * copyright (c) 2011-2012 Cypress Semiconductor, Inc.
+ * copyright (c) 2011-2012 Google, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License version 2 as published
+ * by the Free Software Foundation.
+ *
+ * Trademarks are the property of their respective owners.
+ */
+
+#ifndef _ZINITIX_I2C_H
+#define _ZINITIX_I2C_H
+
+#include <linux/types.h>
+
+#define ZINITIX_TOUCHPAD_DRIVER_NAME	"zinitix_i2c_touchpad"
+#define ZINITIX_DRIVER_VERSION  	"1.0.0"
+#define ZINITIX_VENDOR_ID		0x14E5
+
+#define ZINITIX_TP_PRESS	        128
+
+#define ZINITIX_FWIDTH_REDUCE	        90
+#define ZINITIX_RETRY_COUNT	        3
+
+#define ZINITIX_MAX_FINGERS		5
+#define ZINITIX_REPORT_ID		0x01
+#define ZINITIX_REPORT_ID_OFFSET	2
+#define ZINITIX_FINGER_DATA_OFFSET	4
+#define ZINITIX_BUTTON_OFFSET           11
+#define ZINITIX_MAX_REPORT_LEN	        12
+
+
+#define ZINITIX_PTP_MODE		0x0001
+#define ZINITIX_DISABLE_POWER		0x0001
+
+#define ZINITIX_FW_NAME		"zinitix_i2c_tp_fw.bin"
+
+/* Zinitix i2c commands */
+#define ZINITIX_MAX_X_REG		0x00C1	//Long dist
+#define ZINITIX_MAX_Y_REG		0x00C0	//short dist
+#define ZINITIX_CH_X_REG		0x0065
+#define ZINITIX_CH_Y_REG		0x0164
+#define ZINITIX_GET_DESC		0x000E
+#define ZINITIX_GET_REPORT_DESC		0x001E
+#define ZINITIX_REPORT_DESC_LENGTH	0x013E
+#define ZINITIX_PHY_X_OFFSET            0x009F
+#define ZINITIX_PHY_Y_OFFSET            0x00A9
+
+#define ZINITIX_STANDARD_CMD		0x0194
+#define ZINITIX_RESET			0x0100
+#define ZINITIX_WAKE_UP			0x0800
+#define ZINITIX_SLEEP			0x0801
+#define ZINITIX_I2C_POWER_CMD		0x0307
+
+#define ZINITIX_I2C_INF_LENGTH		2
+#define ZINITIX_I2C_REPORT_LEN		12
+#define ZINITIX_DESC_LENGTH		30
+
+
+#define WRITE_REG   			0x0000
+#define READ_REG    			0x0001
+#define VENDOR_COMMAND_READ		0x0002
+#define VENDOR_COMMAND_WRITE	        0x0003
+#define FIRMWARE_WRITE			0x0004
+#define DEVICE_INIT			0x0005
+#define GET_INFO_CHIPID 		0x0006
+
+#define REPORT_INPUT                    0x04
+#define REPORT_SWITCH                   0x09
+#define REPORT_LATENCY                  0x0A
+
+
+#define INPUT_MOUSE                     0x00
+#define INPUT_PTP                       0x03
+
+#define SWITCH_NONE                     0x00
+#define SWITCH_BUTTON                   0x01
+#define SWITCH_SURFACE                  0x02
+#define SWITCH_BOTH                     0x03
+
+#define LATENCY_NORMAL                  0x00
+#define LATENCY_HIGH                    0x01
+
+struct i2c_client;
+struct completion;
+
+enum tp_mode {
+	IAP_MODE = 1,
+	MAIN_MODE
+};
+
+struct zinitix_contact_status {
+	u8 tip : 1;
+	u8 confidence : 1;
+	u8 contact_id : 1;
+	u8 reserved : 5;
+};
+
+struct zinitix_transport_ops {
+	int (*initialize)(struct i2c_client *client);
+	int (*sleep_control)(struct i2c_client *, u16 mode);
+	int (*set_mode)(struct i2c_client *client, u8 mode);
+
+	int (*get_max)(struct i2c_client *client,
+		       unsigned int *max_x, unsigned int *max_y);
+	int (*get_num_channel)(struct i2c_client *client,
+			      unsigned short *x_tracenum,
+			      unsigned short *y_tracenum);
+	
+	int (*reset)(struct i2c_client *client);
+
+	int (*prepare_fw_update)(struct i2c_client *client);
+	int (*write_fw_block)(struct i2c_client *client,
+			      const u8 *page, u16 checksum, int idx);
+	int (*read_fw_block)(struct i2c_client *client,
+			      u8 *page, int idx);
+	int (*finish_fw_update)(struct i2c_client *client,
+				struct completion *reset_done);
+
+	int (*get_report)(struct i2c_client *client, u8 *report);
+	int (*get_pressure_adjustment)(struct i2c_client *client,
+				       int *adjustment);
+	int (*get_pattern)(struct i2c_client *client, u8 *pattern);
+};
+
+extern const struct zinitix_transport_ops zinitix_i2c_ops;
+
+#define TO_LITTLE_ENDIAN(n1, n2, n3) (((u32)n1<<16 & 0x00FF0000) | ((u32)n2<<8 & 0x0000FF00) | ((u32)n3 & 0x000000FF))
+#define SECTOR_SZ		        (8 * 2)
+#define FW_BUFF_SIZE                    (1024*48) // 48K
+#define FW_BUFF_SIZE_650                (1024*128) // 128K
+#define FW_REWRITE_LIMIT	        8
+
+/* Zinitix i2c HID commands */
+#define FWUPGRADE_INIT		0x20F0
+#define FWUPGRADE_PGM		0x21F0
+#define FWUPGRADE_READ		0x22F0
+#define FWUPGRADE_MODE		0x25F0
+#define FWUPGRADE_WRITE_MODE		0x27F0
+#define FWUPGRADE_MERASE		0x28F0
+#define FWUPGRADE_START_PAGE		0x29F0
+#define FWUPGRADE_BLOCK_ERASE	0x2AF0
+
+#define HW_RESET			0x04F0
+
+#define REG_FWVERSION_MAJOR		0x0012
+#define REG_FWVERSION_MINOR		0x0121
+#define REG_FWVERSION_RELEASE		0x0013
+#define REG_FWCHECKSUM			0x012C
+
+#define VENDOR_CMD_ENABLE		0x10F0
+#define INIT_NVM			0x12F0
+#define DISABLE_NVM_WP		        0x13F0
+
+
+enum FWUPGRADE_PROGMODE
+{
+	FWUPGRADE_PROGRAM	= 0,
+	FWUPGRADE_ONLYWRITE	= 1,
+	FWUPGRADE_WRITEREPEAT	= 2,
+};
+
+union nvm_binary_info
+{
+	u16 buff16[128*1024/2];
+	u32 buff32[128*1024/4]; //128*1024byte
+	struct _val
+	{
+		u32 RESERVED0;		// 0
+		u32 auto_boot_flag1;	// 1
+		u32 auto_boot_flag2;	// 2
+		u32 slave_addr_flag;	// 3
+		u32 RESERVED1[4];	// 4
+		u32 info_checksum;	// 8
+		u32 core_checksum;	// 9
+		u32 custom_checksum;	// 10
+		u32 register_checksum;	// 11
+		u16 hw_id;		// 12
+		u16 RESERVED2;
+		u16 major_ver;		// 13
+		u16 RESERVED3;
+		u16 minor_ver;		// 14
+		u16 RESERVED4;
+		u16 release_ver;	// 15
+		u16 RESERVED5;
+		u16 chip_id;		// 16
+		u16 chip_id_reverse;
+		u16 chip_naming_number;	// 17
+		u16 RESERVED6[9];
+		u8  info_size[4];	// 21
+		u8  core_size[4];	// 22
+		u8  custom_size[4];	// 23
+		u8  register_size[4];	// 24
+		u8  total_size[4];	// 25
+		u32 RESERVED7[5];	// 26
+
+		u32 RESERVED8[32736];	// 32
+	}val;
+};
+
+struct fw_info {
+	u32 info_size;
+	u32 core_size;
+	u32 cust_size;
+	u32 regi_size;
+	u32 start_address;
+	u32 end_address;
+};
+
+/* The main device structure */
+
+struct touchpad_data {
+	struct i2c_client	*client;
+	struct input_dev	*input;
+	struct regulator	*vcc;
+
+	const struct zinitix_transport_ops *ops;
+	/* for fw update */
+	struct completion	fw_completion;
+	bool			in_fw_update;
+	struct mutex		sysfs_mutex;
+	unsigned int		phy_x;
+	unsigned int		phy_y;
+	unsigned int		max_x;
+	unsigned int		max_y;
+	unsigned int		width_x;
+	unsigned int		width_y;
+	unsigned int		x_res;
+	unsigned int		y_res;
+
+	u16			product_id;
+	int			pressure_adjustment;
+	bool			irq_wake;
+	u8			*userbuffer;
+	bool 		        ready_userbuffer;
+	u16 		        recv_data_size;
+	u16 		        chip_code;
+};
+
+u16 zinitix_i2c_read_reg(struct i2c_client *client, u16 reg, u16 *value);
+u16 zinitix_i2c_read_data(struct i2c_client *client, u16 reg, u8 *verify_data);
+int zinitix_i2c_write_reg(struct i2c_client *client, u16 reg, u16 value);
+int zinitix_i2c_write_data(struct i2c_client *client, u16 reg, const u8* value, u16 size);
+
+#endif /* _ZINITIX_I2C_H */
+


