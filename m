Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E397139FF4
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2020 04:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728924AbgAND1l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 22:27:41 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:37340 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728802AbgAND1l (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 22:27:41 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="34182974"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 14 Jan 2020 11:27:38 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(2816:0:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Tue, 14 Jan 2020 11:27:37 +0800 (CST)
Received: from 42.73.233.242
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2481:0:AUTH_LOGIN)
        (envelope-from <dave.wang@emc.com.tw>); Tue, 14 Jan 2020 11:27:35 +0800 (CST)
From:   Dave Wang <dave.wang@emc.com.tw>
To:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Cc:     phoenix@emc.com.tw, josh.chen@emc.com.tw, jingle.wu@emc.com.tw,
        kai.heng.feng@canonical.com, Dave Wang <dave.wang@emc.com.tw>
Subject: [PATCH 2/3] Input: elan_i2c - High resolution report for new pattern 2
Date:   Mon, 13 Jan 2020 22:23:09 -0500
Message-Id: <20200114032309.5921-1-dave.wang@emc.com.tw>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Due to the higer resolution touchpads would be produced,
The mainly modifications were as below:
1. the former resolution bits were not enough. Extend the
resolution bits from 12 to 16 bits.
2. Increase the report ID 0x60 for higher resoltion of touchpads.
3. Move the position of mk value in report packet.

Signed-off-by: Dave Wang <dave.wang@emc.com.tw>
---
 drivers/input/mouse/elan_i2c.h       |   4 +-
 drivers/input/mouse/elan_i2c_core.c  | 131 +++++++++++++++++++++++----
 drivers/input/mouse/elan_i2c_i2c.c   |  35 +++++--
 drivers/input/mouse/elan_i2c_smbus.c |  29 ++++--
 4 files changed, 165 insertions(+), 34 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c.h b/drivers/input/mouse/elan_i2c.h
index a9074ac9364f..aa0c6cfd2690 100644
--- a/drivers/input/mouse/elan_i2c.h
+++ b/drivers/input/mouse/elan_i2c.h
@@ -78,7 +78,9 @@ struct elan_transport_ops {
 	int (*finish_fw_update)(struct i2c_client *client,
 				struct completion *reset_done);
 
-	int (*get_report)(struct i2c_client *client, u8 *report);
+	int (*get_report_length)(struct i2c_client *client, int *report_len);
+	int (*get_report)(struct i2c_client *client, u8 *report,
+					int report_len);
 	int (*get_pressure_adjustment)(struct i2c_client *client,
 				       int *adjustment);
 	int (*get_pattern)(struct i2c_client *client, u8 *pattern);
diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 53444edb5069..e212ff4099ae 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -42,6 +42,8 @@
 
 #define DRIVER_NAME		"elan_i2c"
 #define ELAN_VENDOR_ID		0x04f3
+#define ELAN_I2C_INTERFACE	1
+#define ELAN_SMBUS_INTERFACE	2
 #define ETP_MAX_PRESSURE	255
 #define ETP_FWIDTH_REDUCE	90
 #define ETP_FINGER_WIDTH	15
@@ -50,12 +52,13 @@
 #define ETP_MAX_FINGERS		5
 #define ETP_FINGER_DATA_LEN	5
 #define ETP_REPORT_ID		0x5D
+#define ETP_REPORT_ID2		0x60
 #define ETP_TP_REPORT_ID	0x5E
 #define ETP_REPORT_ID_OFFSET	2
 #define ETP_TOUCH_INFO_OFFSET	3
 #define ETP_FINGER_DATA_OFFSET	4
 #define ETP_HOVER_INFO_OFFSET	30
-#define ETP_MAX_REPORT_LEN	34
+#define ETP_MAX_REPORT_LEN	39
 
 /* The main device structure */
 struct elan_tp_data {
@@ -72,6 +75,8 @@ struct elan_tp_data {
 
 	struct mutex		sysfs_mutex;
 
+	int			interface;
+
 	unsigned int		max_x;
 	unsigned int		max_y;
 	unsigned int		width_x;
@@ -85,6 +90,7 @@ struct elan_tp_data {
 	u8			sm_version;
 	u8			iap_version;
 	u16			fw_checksum;
+	int			report_len;
 	int			pressure_adjustment;
 	u8			mode;
 	u16			ic_type;
@@ -336,6 +342,10 @@ static int elan_query_device_info(struct elan_tp_data *data)
 	if (error)
 		return error;
 
+	error = data->ops->get_report_length(data->client, &data->report_len);
+	if (error)
+		return error;
+
 	error = elan_get_fwinfo(data, &data->fw_validpage_count,
 				&data->fw_signature_address);
 	if (error)
@@ -346,16 +356,21 @@ static int elan_query_device_info(struct elan_tp_data *data)
 	return 0;
 }
 
-static unsigned int elan_convert_resolution(u8 val)
+static unsigned int elan_convert_resolution(u8 val, u8 pattern)
 {
 	/*
-	 * (value from firmware) * 10 + 790 = dpi
-	 *
+	 * pattern <= 0x01:
+	 *	(value from firmware) * 10 + 790 = dpi
+	 * else
+	 *	((value from firmware) + 3) * 100 = dpi
 	 * We also have to convert dpi to dots/mm (*10/254 to avoid floating
 	 * point).
 	 */
 
-	return ((int)(char)val * 10 + 790) * 10 / 254;
+	if (pattern <= 0x01)
+		return ((int)(char)val * 10 + 790) * 10 / 254;
+	else
+		return (((int)(char)val + 3) * 100) * 10 / 254;
 }
 
 static int elan_query_device_parameters(struct elan_tp_data *data)
@@ -404,8 +419,8 @@ static int elan_query_device_parameters(struct elan_tp_data *data)
 		if (error)
 			return error;
 
-		data->x_res = elan_convert_resolution(hw_x_res);
-		data->y_res = elan_convert_resolution(hw_y_res);
+		data->x_res = elan_convert_resolution(hw_x_res, data->pattern);
+		data->y_res = elan_convert_resolution(hw_y_res, data->pattern);
 	} else {
 		data->x_res = (data->max_x + 1) / x_mm;
 		data->y_res = (data->max_y + 1) / y_mm;
@@ -937,7 +952,72 @@ static void elan_report_contact(struct elan_tp_data *data,
 	}
 }
 
-static void elan_report_absolute(struct elan_tp_data *data, u8 *packet)
+/* higher resolution report for report id 0x60 */
+static void elan_report_contact_ID2(struct elan_tp_data *data,
+				int contact_num, bool contact_valid,
+				u8 *finger_data)
+{
+	struct input_dev *input = data->input;
+	unsigned int pos_x, pos_y;
+	unsigned int pressure, mk_x = 0, mk_y = 0;
+	unsigned int area_x, area_y, major = 0, minor = 0;
+	unsigned int scaled_pressure;
+
+	if (contact_valid) {
+		pos_x = (finger_data[0] << 8) |	finger_data[1];
+		pos_y = (finger_data[2] << 8) |	finger_data[3];
+
+		/* smbus report with high resolution is lack of mk values */
+		if (data->interface != ELAN_SMBUS_INTERFACE) {
+			mk_x = (finger_data[29 - 4 * contact_num] & 0x0f);
+			mk_y = (finger_data[29 - 4 * contact_num] >> 4);
+		}
+
+		pressure = finger_data[4];
+
+		if (pos_x > data->max_x || pos_y > data->max_y) {
+			dev_dbg(input->dev.parent,
+				"[%d] x=%d y=%d over max (%d, %d)",
+				contact_num, pos_x, pos_y,
+				data->max_x, data->max_y);
+			return;
+		}
+
+		/*
+		 * To avoid treating large finger as palm, let's reduce the
+		 * width x and y per trace.
+		 */
+		if (data->interface != ELAN_SMBUS_INTERFACE) {
+			area_x = mk_x * (data->width_x - ETP_FWIDTH_REDUCE);
+			area_y = mk_y * (data->width_y - ETP_FWIDTH_REDUCE);
+
+			major = max(area_x, area_y);
+			minor = min(area_x, area_y);
+		}
+
+		scaled_pressure = pressure + data->pressure_adjustment;
+
+		if (scaled_pressure > ETP_MAX_PRESSURE)
+			scaled_pressure = ETP_MAX_PRESSURE;
+
+		input_mt_slot(input, contact_num);
+		input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
+		input_report_abs(input, ABS_MT_POSITION_X, pos_x);
+		input_report_abs(input, ABS_MT_POSITION_Y, data->max_y - pos_y);
+		input_report_abs(input, ABS_MT_PRESSURE, scaled_pressure);
+		if (data->interface != ELAN_SMBUS_INTERFACE) {
+			input_report_abs(input, ABS_TOOL_WIDTH, mk_x);
+			input_report_abs(input, ABS_MT_TOUCH_MAJOR, major);
+			input_report_abs(input, ABS_MT_TOUCH_MINOR, minor);
+		}
+	} else {
+		input_mt_slot(input, contact_num);
+		input_mt_report_slot_state(input, MT_TOOL_FINGER, false);
+	}
+}
+
+static void elan_report_absolute(struct elan_tp_data *data, u8 *packet,
+							u8 report_id)
 {
 	struct input_dev *input = data->input;
 	u8 *finger_data = &packet[ETP_FINGER_DATA_OFFSET];
@@ -949,7 +1029,12 @@ static void elan_report_absolute(struct elan_tp_data *data, u8 *packet)
 	hover_event = hover_info & 0x40;
 	for (i = 0; i < ETP_MAX_FINGERS; i++) {
 		contact_valid = tp_info & (1U << (3 + i));
-		elan_report_contact(data, i, contact_valid, finger_data);
+		if (report_id == ETP_REPORT_ID)
+			elan_report_contact(data, i, contact_valid,
+					finger_data);
+		else
+			elan_report_contact_ID2(data, i, contact_valid,
+					finger_data);
 
 		if (contact_valid)
 			finger_data += ETP_FINGER_DATA_LEN;
@@ -1007,7 +1092,7 @@ static irqreturn_t elan_isr(int irq, void *dev_id)
 		goto out;
 	}
 
-	error = data->ops->get_report(data->client, report);
+	error = data->ops->get_report(data->client, report, data->report_len);
 	if (error)
 		goto out;
 
@@ -1015,7 +1100,10 @@ static irqreturn_t elan_isr(int irq, void *dev_id)
 
 	switch (report[ETP_REPORT_ID_OFFSET]) {
 	case ETP_REPORT_ID:
-		elan_report_absolute(data, report);
+		elan_report_absolute(data, report, ETP_REPORT_ID);
+		break;
+	case ETP_REPORT_ID2:
+		elan_report_absolute(data, report, ETP_REPORT_ID2);
 		break;
 	case ETP_TP_REPORT_ID:
 		elan_report_trackpoint(data, report);
@@ -1106,7 +1194,10 @@ static int elan_setup_input_device(struct elan_tp_data *data)
 	input_abs_set_res(input, ABS_X, data->x_res);
 	input_abs_set_res(input, ABS_Y, data->y_res);
 	input_set_abs_params(input, ABS_PRESSURE, 0, ETP_MAX_PRESSURE, 0, 0);
-	input_set_abs_params(input, ABS_TOOL_WIDTH, 0, ETP_FINGER_WIDTH, 0, 0);
+	/* smbus report with pattern 2 is lack of mk values */
+	if (data->pattern <= 0x01 || data->interface != ELAN_SMBUS_INTERFACE)
+		input_set_abs_params(input, ABS_TOOL_WIDTH, 0,
+					ETP_FINGER_WIDTH, 0, 0);
 	input_set_abs_params(input, ABS_DISTANCE, 0, 1, 0, 0);
 
 	/* And MT parameters */
@@ -1116,10 +1207,13 @@ static int elan_setup_input_device(struct elan_tp_data *data)
 	input_abs_set_res(input, ABS_MT_POSITION_Y, data->y_res);
 	input_set_abs_params(input, ABS_MT_PRESSURE, 0,
 			     ETP_MAX_PRESSURE, 0, 0);
-	input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0,
-			     ETP_FINGER_WIDTH * max_width, 0, 0);
-	input_set_abs_params(input, ABS_MT_TOUCH_MINOR, 0,
-			     ETP_FINGER_WIDTH * min_width, 0, 0);
+	/* smbus report with pattern 2 is lack of mk values */
+	if (data->pattern <= 0x01 || data->interface != ELAN_SMBUS_INTERFACE) {
+		input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0,
+					ETP_FINGER_WIDTH * max_width, 0, 0);
+		input_set_abs_params(input, ABS_MT_TOUCH_MINOR, 0,
+					ETP_FINGER_WIDTH * min_width, 0, 0);
+	}
 
 	data->input = input;
 
@@ -1140,16 +1234,18 @@ static int elan_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct elan_tp_data *data;
 	unsigned long irqflags;
-	int error;
+	int interface, error;
 
 	if (IS_ENABLED(CONFIG_MOUSE_ELAN_I2C_I2C) &&
 	    i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
+		interface = ELAN_I2C_INTERFACE;
 		transport_ops = &elan_i2c_ops;
 	} else if (IS_ENABLED(CONFIG_MOUSE_ELAN_I2C_SMBUS) &&
 		   i2c_check_functionality(client->adapter,
 					   I2C_FUNC_SMBUS_BYTE_DATA |
 						I2C_FUNC_SMBUS_BLOCK_DATA |
 						I2C_FUNC_SMBUS_I2C_BLOCK)) {
+		interface = ELAN_SMBUS_INTERFACE;
 		transport_ops = &elan_smbus_ops;
 	} else {
 		dev_err(dev, "not a supported I2C/SMBus adapter\n");
@@ -1164,6 +1260,7 @@ static int elan_probe(struct i2c_client *client,
 
 	data->ops = transport_ops;
 	data->client = client;
+	data->interface = interface;
 	init_completion(&data->fw_completion);
 	mutex_init(&data->sysfs_mutex);
 
diff --git a/drivers/input/mouse/elan_i2c_i2c.c b/drivers/input/mouse/elan_i2c_i2c.c
index 249d48057423..188b4915fe82 100644
--- a/drivers/input/mouse/elan_i2c_i2c.c
+++ b/drivers/input/mouse/elan_i2c_i2c.c
@@ -55,6 +55,7 @@
 #define ETP_I2C_MIN_BASELINE_CMD	0x0318
 
 #define ETP_I2C_REPORT_LEN		34
+#define ETP_I2C_REPORT_LEN_ID2		39
 #define ETP_I2C_DESC_LENGTH		30
 #define ETP_I2C_REPORT_DESC_LENGTH	158
 #define ETP_I2C_INF_LENGTH		2
@@ -393,7 +394,7 @@ static int elan_i2c_get_max(struct i2c_client *client,
 		return error;
 	}
 
-	*max_x = le16_to_cpup((__le16 *)val) & 0x0fff;
+	*max_x = le16_to_cpup((__le16 *)val) & 0xffff;
 
 	error = elan_i2c_read_cmd(client, ETP_I2C_MAX_Y_AXIS_CMD, val);
 	if (error) {
@@ -401,7 +402,7 @@ static int elan_i2c_get_max(struct i2c_client *client,
 		return error;
 	}
 
-	*max_y = le16_to_cpup((__le16 *)val) & 0x0fff;
+	*max_y = le16_to_cpup((__le16 *)val) & 0xffff;
 
 	return 0;
 }
@@ -663,20 +664,41 @@ static int elan_i2c_finish_fw_update(struct i2c_client *client,
 	return 0;
 }
 
-static int elan_i2c_get_report(struct i2c_client *client, u8 *report)
+static int elan_i2c_get_report_length(struct i2c_client *client,
+					int *report_len)
+{
+	int error;
+	u8 pattern_ver;
+
+	error = elan_i2c_get_pattern(client, &pattern_ver);
+	if (error) {
+		dev_err(&client->dev, "failed to get pattern version\n");
+		return error;
+	}
+
+	if (pattern_ver <= 0x01)
+		*report_len = ETP_I2C_REPORT_LEN;
+	else
+		*report_len = ETP_I2C_REPORT_LEN_ID2;
+
+	return 0;
+}
+
+static int elan_i2c_get_report(struct i2c_client *client,
+					u8 *report, int report_len)
 {
 	int len;
 
-	len = i2c_master_recv(client, report, ETP_I2C_REPORT_LEN);
+	len = i2c_master_recv(client, report, report_len);
 	if (len < 0) {
 		dev_err(&client->dev, "failed to read report data: %d\n", len);
 		return len;
 	}
 
-	if (len != ETP_I2C_REPORT_LEN) {
+	if (len != report_len) {
 		dev_err(&client->dev,
 			"wrong report length (%d vs %d expected)\n",
-			len, ETP_I2C_REPORT_LEN);
+			len, report_len);
 		return -EIO;
 	}
 
@@ -713,5 +735,6 @@ const struct elan_transport_ops elan_i2c_ops = {
 
 	.get_pattern		= elan_i2c_get_pattern,
 
+	.get_report_length	= elan_i2c_get_report_length,
 	.get_report		= elan_i2c_get_report,
 };
diff --git a/drivers/input/mouse/elan_i2c_smbus.c b/drivers/input/mouse/elan_i2c_smbus.c
index 8c3185d54c73..de14345c5f34 100644
--- a/drivers/input/mouse/elan_i2c_smbus.c
+++ b/drivers/input/mouse/elan_i2c_smbus.c
@@ -153,9 +153,9 @@ static int elan_smbus_get_version(struct i2c_client *client,
 	u8 val[I2C_SMBUS_BLOCK_MAX] = {0};
 
 	error = i2c_smbus_read_block_data(client,
-					  iap ? ETP_SMBUS_IAP_VERSION_CMD :
-						ETP_SMBUS_FW_VERSION_CMD,
-					  val);
+			iap ? ETP_SMBUS_IAP_VERSION_CMD :
+			ETP_SMBUS_FW_VERSION_CMD,
+			val);
 	if (error < 0) {
 		dev_err(&client->dev, "failed to get %s version: %d\n",
 			iap ? "IAP" : "FW", error);
@@ -174,7 +174,7 @@ static int elan_smbus_get_sm_version(struct i2c_client *client,
 	u8 val[I2C_SMBUS_BLOCK_MAX] = {0};
 
 	error = i2c_smbus_read_block_data(client,
-					  ETP_SMBUS_SM_VERSION_CMD, val);
+					ETP_SMBUS_SM_VERSION_CMD, val);
 	if (error < 0) {
 		dev_err(&client->dev, "failed to get SM version: %d\n", error);
 		return error;
@@ -192,7 +192,7 @@ static int elan_smbus_get_product_id(struct i2c_client *client, u16 *id)
 	u8 val[I2C_SMBUS_BLOCK_MAX] = {0};
 
 	error = i2c_smbus_read_block_data(client,
-					  ETP_SMBUS_UNIQUEID_CMD, val);
+					ETP_SMBUS_UNIQUEID_CMD, val);
 	if (error < 0) {
 		dev_err(&client->dev, "failed to get product ID: %d\n", error);
 		return error;
@@ -209,9 +209,9 @@ static int elan_smbus_get_checksum(struct i2c_client *client,
 	u8 val[I2C_SMBUS_BLOCK_MAX] = {0};
 
 	error = i2c_smbus_read_block_data(client,
-					  iap ? ETP_SMBUS_FW_CHECKSUM_CMD :
-						ETP_SMBUS_IAP_CHECKSUM_CMD,
-					  val);
+				iap ? ETP_SMBUS_FW_CHECKSUM_CMD :
+					ETP_SMBUS_IAP_CHECKSUM_CMD,
+					val);
 	if (error < 0) {
 		dev_err(&client->dev, "failed to get %s checksum: %d\n",
 			iap ? "IAP" : "FW", error);
@@ -415,7 +415,7 @@ static int elan_smbus_prepare_fw_update(struct i2c_client *client)
 
 
 static int elan_smbus_write_fw_block(struct i2c_client *client,
-				     const u8 *page, u16 checksum, int idx)
+					 const u8 *page, u16 checksum, int idx)
 {
 	struct device *dev = &client->dev;
 	int error;
@@ -469,7 +469,15 @@ static int elan_smbus_write_fw_block(struct i2c_client *client,
 	return 0;
 }
 
-static int elan_smbus_get_report(struct i2c_client *client, u8 *report)
+static int elan_smbus_get_report_length(struct i2c_client *client,
+					int *report_len)
+{
+	*report_len = ETP_SMBUS_REPORT_LEN;
+	return 0;
+}
+
+static int elan_smbus_get_report(struct i2c_client *client,
+				u8 *report, int report_len)
 {
 	int len;
 
@@ -534,6 +542,7 @@ const struct elan_transport_ops elan_smbus_ops = {
 	.write_fw_block		= elan_smbus_write_fw_block,
 	.finish_fw_update	= elan_smbus_finish_fw_update,
 
+	.get_report_length	= elan_smbus_get_report_length,
 	.get_report		= elan_smbus_get_report,
 	.get_pattern		= elan_smbus_get_pattern,
 };
-- 
2.17.1

