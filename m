Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9856621AEDE
	for <lists+linux-input@lfdr.de>; Fri, 10 Jul 2020 07:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725966AbgGJFl1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jul 2020 01:41:27 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:52165 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbgGJFl0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jul 2020 01:41:26 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="36373010"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 10 Jul 2020 13:41:21 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(135397:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 10 Jul 2020 13:41:20 +0800 (CST)
Received: from 101.12.61.182
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2482:2:AUTH_LOGIN)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 10 Jul 2020 13:41:18 +0800 (CST)
From:   Jingle Wu <jingle.wu@emc.com.tw>
To:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Cc:     phoenix@emc.com.tw, josh.chen@emc.com.tw, dave.wang@emc.com.tw,
        Jingle Wu <jingle.wu@emc.com.tw>
Subject: [PATCH 2/2] Input: elan_i2c - High resolution report for new pattern 2.
Date:   Fri, 10 Jul 2020 01:41:16 -0400
Message-Id: <20200710054116.5529-1-jingle.wu@emc.com.tw>
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
3. Move the position of mk value in the report packet.

Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>
---
 drivers/input/mouse/elan_i2c.h       |   7 +-
 drivers/input/mouse/elan_i2c_core.c  | 134 +++++++++++++++++++++++----
 drivers/input/mouse/elan_i2c_i2c.c   |  48 +++++++---
 drivers/input/mouse/elan_i2c_smbus.c |  14 ++-
 4 files changed, 170 insertions(+), 33 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c.h b/drivers/input/mouse/elan_i2c.h
index f28b747978f5..71fff2cef8b5 100644
--- a/drivers/input/mouse/elan_i2c.h
+++ b/drivers/input/mouse/elan_i2c.h
@@ -78,9 +78,12 @@ struct elan_transport_ops {
 	int (*write_fw_block)(struct i2c_client *client, u16 fw_page_size,
 			      const u8 *page, u16 checksum, int idx);
 	int (*finish_fw_update)(struct i2c_client *client,
-				struct completion *reset_done);
+				struct completion *reset_done,
+				int report_len);
 
-	int (*get_report)(struct i2c_client *client, u8 *report);
+	int (*get_report_length)(struct i2c_client *client, int *report_len);
+	int (*get_report)(struct i2c_client *client, u8 *report,
+					int report_len);
 	int (*get_pressure_adjustment)(struct i2c_client *client,
 				       int *adjustment);
 	int (*get_pattern)(struct i2c_client *client, u8 *pattern);
diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 0703f7d0d02d..a1bdb25c2450 100644
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
@@ -354,6 +360,10 @@ static int elan_query_device_info(struct elan_tp_data *data)
 	if (error)
 		return error;
 
+	error = data->ops->get_report_length(data->client, &data->report_len);
+	if (error)
+		return error;
+
 	error = elan_get_fwinfo(data->ic_type, data->iap_version, 
 				&data->fw_validpage_count,
 				&data->fw_signature_address,
@@ -366,16 +376,21 @@ static int elan_query_device_info(struct elan_tp_data *data)
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
@@ -424,8 +439,8 @@ static int elan_query_device_parameters(struct elan_tp_data *data)
 		if (error)
 			return error;
 
-		data->x_res = elan_convert_resolution(hw_x_res);
-		data->y_res = elan_convert_resolution(hw_y_res);
+		data->x_res = elan_convert_resolution(hw_x_res, data->pattern);
+		data->y_res = elan_convert_resolution(hw_y_res, data->pattern);
 	} else {
 		data->x_res = (data->max_x + 1) / x_mm;
 		data->y_res = (data->max_y + 1) / y_mm;
@@ -502,7 +517,8 @@ static int __elan_update_firmware(struct elan_tp_data *data,
 	/* Wait WDT reset and power on reset */
 	msleep(600);
 
-	error = data->ops->finish_fw_update(client, &data->fw_completion);
+	error = data->ops->finish_fw_update(client, &data->fw_completion,
+						data->report_len);
 	if (error)
 		return error;
 
@@ -958,7 +974,72 @@ static void elan_report_contact(struct elan_tp_data *data,
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
@@ -970,7 +1051,12 @@ static void elan_report_absolute(struct elan_tp_data *data, u8 *packet)
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
@@ -1028,7 +1114,7 @@ static irqreturn_t elan_isr(int irq, void *dev_id)
 		goto out;
 	}
 
-	error = data->ops->get_report(data->client, report);
+	error = data->ops->get_report(data->client, report, data->report_len);
 	if (error)
 		goto out;
 
@@ -1036,7 +1122,10 @@ static irqreturn_t elan_isr(int irq, void *dev_id)
 
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
@@ -1127,7 +1216,10 @@ static int elan_setup_input_device(struct elan_tp_data *data)
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
@@ -1137,10 +1229,13 @@ static int elan_setup_input_device(struct elan_tp_data *data)
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
 
@@ -1161,16 +1256,18 @@ static int elan_probe(struct i2c_client *client,
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
@@ -1185,6 +1282,7 @@ static int elan_probe(struct i2c_client *client,
 
 	data->ops = transport_ops;
 	data->client = client;
+	data->interface = interface;
 	init_completion(&data->fw_completion);
 	mutex_init(&data->sysfs_mutex);
 
diff --git a/drivers/input/mouse/elan_i2c_i2c.c b/drivers/input/mouse/elan_i2c_i2c.c
index 91ef0c7bda43..8f6e7302d699 100644
--- a/drivers/input/mouse/elan_i2c_i2c.c
+++ b/drivers/input/mouse/elan_i2c_i2c.c
@@ -59,6 +59,7 @@
 #define ETP_I2C_IAP_TYPE_CMD	0x0304
 
 #define ETP_I2C_REPORT_LEN		34
+#define ETP_I2C_REPORT_LEN_ID2		39
 #define ETP_I2C_DESC_LENGTH		30
 #define ETP_I2C_REPORT_DESC_LENGTH	158
 #define ETP_I2C_INF_LENGTH		2
@@ -281,7 +282,7 @@ static int elan_i2c_get_version(struct i2c_client *client,
 	else
 		iap_cmd = ETP_I2C_IAP_VERSION_CMD_OLD;
 
-	error = elan_i2c_read_cmd(client,
+        error = elan_i2c_read_cmd(client,
 				  iap ? iap_cmd :
 					ETP_I2C_FW_VERSION_CMD,
 				  val);
@@ -407,7 +408,7 @@ static int elan_i2c_get_max(struct i2c_client *client,
 		return error;
 	}
 
-	*max_x = le16_to_cpup((__le16 *)val) & 0x0fff;
+	*max_x = le16_to_cpup((__le16 *)val) & 0xffff;
 
 	error = elan_i2c_read_cmd(client, ETP_I2C_MAX_Y_AXIS_CMD, val);
 	if (error) {
@@ -687,15 +688,16 @@ static int elan_i2c_write_fw_block(struct i2c_client *client, u16 fw_page_size,
 }
 
 static int elan_i2c_finish_fw_update(struct i2c_client *client,
-				     struct completion *completion)
+				     struct completion *completion,
+				     int report_len)
 {
 	struct device *dev = &client->dev;
-	int error;
+	int error = 0;
 	int len;
-	u8 buffer[ETP_I2C_REPORT_LEN];
+	u8 *buffer = kcalloc(1, report_len, GFP_KERNEL);
 
-	len = i2c_master_recv(client, buffer, ETP_I2C_REPORT_LEN);
-	if (len != ETP_I2C_REPORT_LEN) {
+	len = i2c_master_recv(client, buffer, report_len);
+	if (len != report_len) {
 		error = len < 0 ? len : -EIO;
 		dev_warn(dev, "failed to read I2C data after FW WDT reset: %d (%d)\n",
 			error, len);
@@ -723,26 +725,49 @@ static int elan_i2c_finish_fw_update(struct i2c_client *client,
 		error = len < 0 ? len : -EIO;
 		dev_err(dev, "failed to read INT signal: %d (%d)\n",
 			error, len);
+		goto exit;
+	}
+
+exit:
+	kfree(buffer);
+	return error;
+}
+
+static int elan_i2c_get_report_length(struct i2c_client *client,
+					int *report_len)
+{
+	int error;
+	u8 pattern_ver;
+
+	error = elan_i2c_get_pattern(client, &pattern_ver);
+	if (error) {
+		dev_err(&client->dev, "failed to get pattern version\n");
 		return error;
 	}
 
+	if (pattern_ver <= 0x01)
+		*report_len = ETP_I2C_REPORT_LEN;
+	else
+		*report_len = ETP_I2C_REPORT_LEN_ID2;
+
 	return 0;
 }
 
-static int elan_i2c_get_report(struct i2c_client *client, u8 *report)
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
 
@@ -779,5 +804,6 @@ const struct elan_transport_ops elan_i2c_ops = {
 
 	.get_pattern		= elan_i2c_get_pattern,
 
+	.get_report_length	= elan_i2c_get_report_length,
 	.get_report		= elan_i2c_get_report,
 };
diff --git a/drivers/input/mouse/elan_i2c_smbus.c b/drivers/input/mouse/elan_i2c_smbus.c
index 1e762c90c894..04f0fea670a0 100644
--- a/drivers/input/mouse/elan_i2c_smbus.c
+++ b/drivers/input/mouse/elan_i2c_smbus.c
@@ -469,7 +469,15 @@ static int elan_smbus_write_fw_block(struct i2c_client *client, u16 fw_page_size
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
 
@@ -494,7 +502,8 @@ static int elan_smbus_get_report(struct i2c_client *client, u8 *report)
 }
 
 static int elan_smbus_finish_fw_update(struct i2c_client *client,
-				       struct completion *fw_completion)
+				       struct completion *fw_completion,
+				       int report_len)
 {
 	/* No special handling unlike I2C transport */
 	return 0;
@@ -534,6 +543,7 @@ const struct elan_transport_ops elan_smbus_ops = {
 	.write_fw_block		= elan_smbus_write_fw_block,
 	.finish_fw_update	= elan_smbus_finish_fw_update,
 
+	.get_report_length	= elan_smbus_get_report_length,
 	.get_report		= elan_smbus_get_report,
 	.get_pattern		= elan_smbus_get_pattern,
 };
-- 
2.17.1

