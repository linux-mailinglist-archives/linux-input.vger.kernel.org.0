Return-Path: <linux-input+bounces-9121-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D10BAA0824A
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 22:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F20383A6F99
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC66A204C32;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="riuX0/bQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FCA204683;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736458702; cv=none; b=epSHg42fyxGMVzAptOmkSF8OfrsgsCqSRO+qI1caBxf8v3LtR82yd0EV0VniB0/qoYjVMtffHEX8jRdm2anQC8MoiCl0909noI4a7rAHwsaA8vxKAhkH+EYSZgcAnhSB8RrXp3BQ+HO9zRpx6zFlgdOUXLI99ym/ocO0tSV1nV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736458702; c=relaxed/simple;
	bh=ZS+8fL0phx54h0vRXjl+7M0WvGit+wDYMHeBJPH1Vak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=krs096771pngKjQOEDjJcWOoyMn5HPYVloOr9ajXOOsdcltM/5Elu9+/sSDor87e41PXbOIQnDOUdriTSWA4Ab6Jzf8AaVKX3oTXeQQF3NODH109BLUFOMxDSO7CBXlzuE9p72E9XJZ1MgDks5TWq9HlFdSZBpxQY5I0KDebidI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=riuX0/bQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 537E2C4CEE3;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736458702;
	bh=ZS+8fL0phx54h0vRXjl+7M0WvGit+wDYMHeBJPH1Vak=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=riuX0/bQRabqfyIE/MGQOZGEBX3fDeuHx8KYloe4CozBydgLcX8w4Wr/d2EgAFaBd
	 BYEu7BJ8ROnQ0wQr5+jmBuS5PLtvu2jPgX9O6f8fp8TGGhTe7JcefkfgpgMqVCSfw6
	 fWfe6bsSTfe1kCxrNy9uDnxdRFGT6Now8scUzlzZijWXaOfldsim3jhR/eC9XmwCbu
	 TMqMjIOHAmFvdFVU/A3XiDN81n7Zf/HH763BCNROJ5LF6ZWKBTbUYrYaOK/6RbajkN
	 bpFVVwSQdqjXeiaiVmigKiIhsrzVM+tqKSIuvGiCoKUte+CP87KO3Y16MyuDUULMux
	 8YpGqwxRCdYsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4A6E77199;
	Thu,  9 Jan 2025 21:38:22 +0000 (UTC)
From: Vasiliy Doylov via B4 Relay <devnull+nekodevelopper.gmail.com@kernel.org>
Date: Fri, 10 Jan 2025 00:37:49 +0300
Subject: [PATCH v3 3/4] input: cyttsp5: use raw i2c instead of regmap
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-nekocwd-upstreaming-cyttsp5-v3-3-b33659c8effc@gmail.com>
References: <20250110-nekocwd-upstreaming-cyttsp5-v3-0-b33659c8effc@gmail.com>
In-Reply-To: <20250110-nekocwd-upstreaming-cyttsp5-v3-0-b33659c8effc@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 "Vasiliy Doylov (NekoCWD)" <nekodevelopper@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13700;
 i=nekodevelopper@gmail.com; h=from:subject:message-id;
 bh=/vgp8DRJqSp2g/DI2XVeFqYJgvLa+BvnGoSrWWTII5g=;
 b=owGbwMvMwCW2fZ/SFZeSpU2Mp9WSGNIbHM9k8Lwxy/NOmL29P0n4e2CQxU2ti5/fhGzvnrYjl
 FH00wrjjlIWBjEuBlkxRRabjR6zxfLDJSdNe6oAM4eVCWQIAxenAEzkLA/Db7a6KXWBG8z0nM/d
 8hGeY3JuZ8lys5ZlFds945bZ/75qpMjIMCuxivPZnZi9oaXcfDujDbZ/2u8Xrz7PtfC+z/3XYTe
 qGQE=
X-Developer-Key: i=nekodevelopper@gmail.com; a=openpgp;
 fpr=3CB1489B166F57199296E520B7BE22D44474A582
X-Endpoint-Received: by B4 Relay for nekodevelopper@gmail.com/default with
 auth_id=314
X-Original-From: "Vasiliy Doylov (NekoCWD)" <nekodevelopper@gmail.com>
Reply-To: nekodevelopper@gmail.com

From: "Vasiliy Doylov (NekoCWD)" <nekodevelopper@gmail.com>

Regmap always does operations against specific registers
and prevents doing raw i2c operations needed to handle some
hardware/firmware issues for some variants.
For example: on Huawei Mediapad T3 10 (huawei-agassi):
Some firmware variants doesn't work with mainline driver.
They starts in application mode and needs buffer flush (deassert_read).
Without flush it will always have value 2 in size reg.

Co-developed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Vasiliy Doylov (NekoCWD) <nekodevelopper@gmail.com>
---
 drivers/input/touchscreen/cyttsp5.c | 228 ++++++++++++++++++++++--------------
 1 file changed, 143 insertions(+), 85 deletions(-)

diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
index 4b73b1abc7e449b2dd0c453b816ce7887d9ddb0e..4860ce751c913c605d5f72dad66d1eba9825a900 100644
--- a/drivers/input/touchscreen/cyttsp5.c
+++ b/drivers/input/touchscreen/cyttsp5.c
@@ -20,7 +20,6 @@
 #include <linux/i2c.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/regmap.h>
 #include <linux/unaligned.h>
 
 #define CYTTSP5_NAME				"cyttsp5"
@@ -68,6 +67,7 @@
 #define HID_BTN_REPORT_ID			0x3
 #define HID_APP_RESPONSE_REPORT_ID		0x1F
 #define HID_APP_OUTPUT_REPORT_ID		0x2F
+#define HID_BL_REPORT_ID			0xFF
 #define HID_BL_RESPONSE_REPORT_ID		0x30
 #define HID_BL_OUTPUT_REPORT_ID			0x40
 #define HID_RESPONSE_REPORT_ID			0xF0
@@ -206,7 +206,6 @@ struct cyttsp5 {
 	struct input_dev *input;
 	char phys[NAME_MAX];
 	int num_prv_rec;
-	struct regmap *regmap;
 	struct touchscreen_properties prop;
 	struct regulator_bulk_data supplies[2];
 };
@@ -219,16 +218,24 @@ struct cyttsp5 {
  */
 static int cyttsp5_read(struct cyttsp5 *ts, u8 *buf, u32 max)
 {
-	int error;
+	struct i2c_client *client = to_i2c_client(ts->dev);
+	struct i2c_msg msgs[2];
+	u8 msg_count = 1;
+	int rc;
 	u32 size;
-	u8 temp[2];
 
-	/* Read the frame to retrieve the size */
-	error = regmap_bulk_read(ts->regmap, HID_INPUT_REG, temp, sizeof(temp));
-	if (error)
-		return error;
+	if (!buf)
+		return -EINVAL;
 
-	size = get_unaligned_le16(temp);
+	msgs[0].addr = client->addr;
+	msgs[0].flags = (client->flags & I2C_M_TEN) | I2C_M_RD;
+	msgs[0].len = 2;
+	msgs[0].buf = buf;
+	rc = i2c_transfer(client->adapter, msgs, msg_count);
+	if (rc < 0 || rc != msg_count)
+		return (rc < 0) ? rc : -EIO;
+
+	size = get_unaligned_le16(&buf[0]);
 	/*
 	 * Before PIP 1.7, empty buffer is 0x0002
 	 * From PIP 1.7, empty buffer is 0xFFXX
@@ -239,33 +246,37 @@ static int cyttsp5_read(struct cyttsp5 *ts, u8 *buf, u32 max)
 	if (size > max)
 		return -EINVAL;
 
-	/* Get the real value */
-	return regmap_bulk_read(ts->regmap, HID_INPUT_REG, buf, size);
+	rc = i2c_master_recv(client, buf, size);
+
+	return (rc < 0) ? rc : rc != (int)size ? -EIO : 0;
 }
 
 static int cyttsp5_write(struct cyttsp5 *ts, unsigned int reg, u8 *data,
 			 size_t size)
 {
-	u8 cmd[HID_OUTPUT_MAX_CMD_SIZE];
+	u8 cmd[HID_OUTPUT_MAX_CMD_SIZE + 2];
+	struct i2c_client *client = to_i2c_client(ts->dev);
+	struct i2c_msg msgs[2];
+	u8 msg_count = 1;
+	int rc;
 
-	if (size + 1 > HID_OUTPUT_MAX_CMD_SIZE)
+	if (size > HID_OUTPUT_MAX_CMD_SIZE + 2)
 		return -E2BIG;
 
-	/* High bytes of register address needed as first byte of cmd */
-	cmd[0] = (reg >> 8) & 0xFF;
-
 	/* Copy the rest of the data */
 	if (data)
-		memcpy(&cmd[1], data, size);
+		memcpy(&cmd[0], data, size);
 
-	/*
-	 * The hardware wants to receive a frame with the address register
-	 * contained in the first two bytes. As the regmap_write function
-	 * add the register adresse in the frame, we use the low byte as
-	 * first frame byte for the address register and the first
-	 * data byte is the high register + left of the cmd to send
-	 */
-	return regmap_bulk_write(ts->regmap, reg & 0xFF, cmd, size + 1);
+	msgs[0].addr = client->addr;
+	msgs[0].flags = client->flags & I2C_M_TEN;
+	msgs[0].len = size;
+	msgs[0].buf = cmd;
+	rc = i2c_transfer(client->adapter, msgs, msg_count);
+
+	if (rc < 0 || rc != msg_count)
+		return (rc < 0) ? rc : -EIO;
+
+	return 0;
 }
 
 static void cyttsp5_get_touch_axis(int *axis, int size, int max, u8 *xy_data,
@@ -540,22 +551,29 @@ static int cyttsp5_get_sysinfo_regs(struct cyttsp5 *ts)
 	scd->len_x = get_unaligned_le16(&scd_dev->len_x);
 	scd->len_y = get_unaligned_le16(&scd_dev->len_y);
 
+	if (scd_dev->max_num_of_tch_per_refresh_cycle == 0)
+		return -EINVAL;
+
 	return 0;
 }
 
 static int cyttsp5_hid_output_get_sysinfo(struct cyttsp5 *ts)
 {
 	int rc;
-	u8 cmd[HID_OUTPUT_GET_SYSINFO_SIZE];
+	u8 cmd[HID_OUTPUT_GET_SYSINFO_SIZE + 2];
+
+	/* Set Output register */
+	memcpy(&cmd[0], &ts->hid_desc.output_register,
+			sizeof(ts->hid_desc.output_register));
 
 	/* HI bytes of Output register address */
-	put_unaligned_le16(HID_OUTPUT_GET_SYSINFO_SIZE, cmd);
-	cmd[2] = HID_APP_OUTPUT_REPORT_ID;
-	cmd[3] = 0x0; /* Reserved */
-	cmd[4] = HID_OUTPUT_GET_SYSINFO;
+	put_unaligned_le16(HID_OUTPUT_GET_SYSINFO_SIZE, &cmd[2]);
+	cmd[4] = HID_APP_OUTPUT_REPORT_ID;
+	cmd[5] = 0x0; /* Reserved */
+	cmd[6] = HID_OUTPUT_GET_SYSINFO;
 
 	rc = cyttsp5_write(ts, HID_OUTPUT_REG, cmd,
-			   HID_OUTPUT_GET_SYSINFO_SIZE);
+			   HID_OUTPUT_GET_SYSINFO_SIZE + 2);
 	if (rc) {
 		dev_err(ts->dev, "Failed to write command %d", rc);
 		return rc;
@@ -615,21 +633,25 @@ static int cyttsp5_power_control(struct cyttsp5 *ts, bool on)
 static int cyttsp5_hid_output_bl_launch_app(struct cyttsp5 *ts)
 {
 	int rc;
-	u8 cmd[HID_OUTPUT_BL_LAUNCH_APP_SIZE];
+	u8 cmd[HID_OUTPUT_BL_LAUNCH_APP_SIZE + 2];
 	u16 crc;
 
-	put_unaligned_le16(HID_OUTPUT_BL_LAUNCH_APP_SIZE, cmd);
-	cmd[2] = HID_BL_OUTPUT_REPORT_ID;
-	cmd[3] = 0x0; /* Reserved */
-	cmd[4] = HID_OUTPUT_BL_SOP;
-	cmd[5] = HID_OUTPUT_BL_LAUNCH_APP;
-	put_unaligned_le16(0x00, &cmd[6]);
-	crc = crc_itu_t(0xFFFF, &cmd[4], 4);
-	put_unaligned_le16(crc, &cmd[8]);
-	cmd[10] = HID_OUTPUT_BL_EOP;
+	/* Set Output register */
+	memcpy(&cmd[0], &ts->hid_desc.output_register,
+			sizeof(ts->hid_desc.output_register));
+
+	put_unaligned_le16(HID_OUTPUT_BL_LAUNCH_APP_SIZE, &cmd[2]);
+	cmd[4] = HID_BL_OUTPUT_REPORT_ID;
+	cmd[5] = 0x0; /* Reserved */
+	cmd[6] = HID_OUTPUT_BL_SOP;
+	cmd[7] = HID_OUTPUT_BL_LAUNCH_APP;
+	put_unaligned_le16(0x00, &cmd[8]);
+	crc = crc_itu_t(0xFFFF, &cmd[6], 4);
+	put_unaligned_le16(crc, &cmd[10]);
+	cmd[12] = HID_OUTPUT_BL_EOP;
 
 	rc = cyttsp5_write(ts, HID_OUTPUT_REG, cmd,
-			   HID_OUTPUT_BL_LAUNCH_APP_SIZE);
+			   HID_OUTPUT_BL_LAUNCH_APP_SIZE + 2);
 	if (rc) {
 		dev_err(ts->dev, "Failed to write command %d", rc);
 		return rc;
@@ -656,9 +678,12 @@ static int cyttsp5_get_hid_descriptor(struct cyttsp5 *ts,
 				      struct cyttsp5_hid_desc *desc)
 {
 	struct device *dev = ts->dev;
+	u8 cmd[2] = { 0 };
 	int rc;
 
-	rc = cyttsp5_write(ts, HID_DESC_REG, NULL, 0);
+	put_unaligned_le16(HID_DESC_REG, cmd);
+
+	rc = cyttsp5_write(ts, HID_DESC_REG, cmd, 2);
 	if (rc) {
 		dev_err(dev, "Failed to get HID descriptor, rc=%d\n", rc);
 		return rc;
@@ -739,19 +764,38 @@ static irqreturn_t cyttsp5_handle_irq(int irq, void *handle)
 	return IRQ_HANDLED;
 }
 
+static int cyttsp5_deassert_read(struct cyttsp5 *ts, u8 *buf, int size)
+{
+	struct i2c_client *client = to_i2c_client(ts->dev);
+	int rc;
+
+	if (!buf || !size || size > CY_I2C_DATA_SIZE)
+		return -EINVAL;
+
+	rc = i2c_master_recv(client, buf, size);
+
+	return (rc < 0) ? rc : rc != size ? -EIO : 0;
+}
+
 static int cyttsp5_deassert_int(struct cyttsp5 *ts)
 {
 	u16 size;
-	u8 buf[2];
+	u8 retry = 3;
 	int error;
 
-	error = regmap_bulk_read(ts->regmap, HID_INPUT_REG, buf, sizeof(buf));
-	if (error < 0)
-		return error;
+	do {
+		error = cyttsp5_deassert_read(ts, ts->input_buf, 2);
+		if (error < 0)
+			return error;
 
-	size = get_unaligned_le16(&buf[0]);
-	if (size == 2 || size == 0 || size >= CY_PIP_1P7_EMPTY_BUF)
-		return 0;
+		size = get_unaligned_le16(&ts->input_buf[0]);
+		if (size == 2 || size == 0 || size >= CY_PIP_1P7_EMPTY_BUF)
+			return 0;
+
+		error = cyttsp5_deassert_read(ts, ts->input_buf, size);
+		if (error < 0)
+			return error;
+	} while (retry--);
 
 	return -EINVAL;
 }
@@ -785,23 +829,35 @@ static int cyttsp5_startup(struct cyttsp5 *ts)
 	error = cyttsp5_deassert_int(ts);
 	if (error) {
 		dev_err(ts->dev, "Error on deassert int r=%d\n", error);
-		return -ENODEV;
+	}
+
+	error = cyttsp5_get_hid_descriptor(ts, &ts->hid_desc);
+	if (error < 0) {
+		dev_err(ts->dev, "Error on getting HID descriptor r=%d\n", error);
+		return error;
 	}
 
 	/*
 	 * Launch the application as the device starts in bootloader mode
 	 * because of a power-on-reset
 	 */
-	error = cyttsp5_hid_output_bl_launch_app(ts);
-	if (error < 0) {
-		dev_err(ts->dev, "Error on launch app r=%d\n", error);
-		return error;
-	}
+	if (ts->hid_desc.packet_id == HID_BL_REPORT_ID) {
+		error = cyttsp5_hid_output_bl_launch_app(ts);
+		if (error < 0) {
+			dev_err(ts->dev, "Error on launch app r=%d\n", error);
+			return error;
+		}
 
-	error = cyttsp5_get_hid_descriptor(ts, &ts->hid_desc);
-	if (error < 0) {
-		dev_err(ts->dev, "Error on getting HID descriptor r=%d\n", error);
-		return error;
+		error = cyttsp5_get_hid_descriptor(ts, &ts->hid_desc);
+		if (error < 0) {
+			dev_err(ts->dev, "Error on getting HID descriptor r=%d\n", error);
+			return error;
+		}
+
+		if (ts->hid_desc.packet_id == HID_BL_REPORT_ID) {
+			dev_err(ts->dev, "Error on launch app still in bootloader\n");
+			return -EPROTO;
+		}
 	}
 
 	error = cyttsp5_fill_all_touch(ts);
@@ -826,8 +882,7 @@ static void cyttsp5_cleanup(void *data)
 	regulator_bulk_disable(ARRAY_SIZE(ts->supplies), ts->supplies);
 }
 
-static int cyttsp5_probe(struct device *dev, struct regmap *regmap, int irq,
-			 const char *name)
+static struct cyttsp5 *cyttsp5_probe(struct device *dev, int irq, const char *name)
 {
 	struct cyttsp5 *ts;
 	struct cyttsp5_sysinfo *si;
@@ -835,10 +890,9 @@ static int cyttsp5_probe(struct device *dev, struct regmap *regmap, int irq,
 
 	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
 	if (!ts)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	/* Initialize device info */
-	ts->regmap = regmap;
 	ts->dev = dev;
 	si = &ts->sysinfo;
 	dev_set_drvdata(dev, ts);
@@ -852,23 +906,23 @@ static int cyttsp5_probe(struct device *dev, struct regmap *regmap, int irq,
 					ts->supplies);
 	if (error) {
 		dev_err(ts->dev, "Failed to get regulators, error %d\n", error);
-		return error;
+		return ERR_PTR(error);
 	}
 
 	error = devm_add_action_or_reset(dev, cyttsp5_cleanup, ts);
 	if (error)
-		return error;
+		return ERR_PTR(error);
 
 	error = regulator_bulk_enable(ARRAY_SIZE(ts->supplies), ts->supplies);
 	if (error) {
 		dev_err(ts->dev, "Failed to enable regulators, error %d\n", error);
-		return error;
+		return ERR_PTR(error);
 	}
 
 	ts->input = devm_input_allocate_device(dev);
 	if (!ts->input) {
 		dev_err(dev, "Error, failed to allocate input device\n");
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 	}
 
 	ts->input->name = "cyttsp5";
@@ -881,7 +935,7 @@ static int cyttsp5_probe(struct device *dev, struct regmap *regmap, int irq,
 	if (IS_ERR(ts->reset_gpio)) {
 		error = PTR_ERR(ts->reset_gpio);
 		dev_err(dev, "Failed to request reset gpio, error %d\n", error);
-		return error;
+		return ERR_PTR(error);
 	}
 	gpiod_set_value_cansleep(ts->reset_gpio, 0);
 
@@ -889,22 +943,22 @@ static int cyttsp5_probe(struct device *dev, struct regmap *regmap, int irq,
 	msleep(20);
 
 	error = devm_request_threaded_irq(dev, irq, NULL, cyttsp5_handle_irq,
-					  IRQF_ONESHOT, name, ts);
+					  IRQF_TRIGGER_LOW | IRQF_ONESHOT, name, ts);
 	if (error) {
 		dev_err(dev, "unable to request IRQ\n");
-		return error;
+		return ERR_PTR(error);
 	}
 
 	error = cyttsp5_startup(ts);
 	if (error) {
 		dev_err(ts->dev, "Fail initial startup r=%d\n", error);
-		return error;
+		return ERR_PTR(error);
 	}
 
 	error = cyttsp5_parse_dt_key_code(dev);
 	if (error < 0) {
 		dev_err(ts->dev, "Error while parsing dts %d\n", error);
-		return error;
+		return ERR_PTR(error);
 	}
 
 	touchscreen_parse_properties(ts->input, true, &ts->prop);
@@ -913,25 +967,29 @@ static int cyttsp5_probe(struct device *dev, struct regmap *regmap, int irq,
 	for (i = 0; i < si->num_btns; i++)
 		__set_bit(si->key_code[i], ts->input->keybit);
 
-	return cyttsp5_setup_input_device(dev);
+	error = cyttsp5_setup_input_device(dev);
+	if (error < 0)
+		return ERR_PTR(error);
+
+	return ts;
 }
 
 static int cyttsp5_i2c_probe(struct i2c_client *client)
 {
-	struct regmap *regmap;
-	static const struct regmap_config config = {
-		.reg_bits = 8,
-		.val_bits = 8,
-	};
+	struct cyttsp5 *ts;
 
-	regmap = devm_regmap_init_i2c(client, &config);
-	if (IS_ERR(regmap)) {
-		dev_err(&client->dev, "regmap allocation failed: %ld\n",
-			PTR_ERR(regmap));
-		return PTR_ERR(regmap);
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		dev_err(&client->dev, "I2C functionality not Supported\n");
+		return -EIO;
 	}
 
-	return cyttsp5_probe(&client->dev, regmap, client->irq, client->name);
+	ts = cyttsp5_probe(&client->dev, client->irq, client->name);
+
+	if (IS_ERR(ts))
+		return PTR_ERR(ts);
+
+	i2c_set_clientdata(client, ts);
+	return 0;
 }
 
 static const struct of_device_id cyttsp5_of_match[] = {

-- 
2.47.1



