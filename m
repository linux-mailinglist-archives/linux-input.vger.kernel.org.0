Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB499FEEF
	for <lists+linux-input@lfdr.de>; Wed, 28 Aug 2019 11:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbfH1Jy1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Aug 2019 05:54:27 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46175 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbfH1Jy0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Aug 2019 05:54:26 -0400
Received: by mail-pg1-f196.google.com with SMTP id m3so1164078pgv.13
        for <linux-input@vger.kernel.org>; Wed, 28 Aug 2019 02:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SKZjvO1p102FADuTX50l2VuWSq7lWEumYWEfsQxT1MQ=;
        b=MiQlSO7lao32QTiFjAcD7dVZLnhBypomjDBPGJojU+hTc1rPQNpKivnNyuKGvngyx3
         UxE8FbtBStZ+rbOs2Wod+MrYEL7TOXi3OKcLL0IkQy0Qi5mBTeQlAzn7QlaSnbixoBDb
         ALuQtZ+D/D9GMOB07olNe71REZFlxtict0BvgELHooJWTaGHiO/kIOq7eTMeDtj4bSwd
         g0Y2tt6xs/W+36JDrOZtaPFJ2+JCKsIDF36UzOb+8d/ba+3zh6jmhDyAuv6yUHk5fcvU
         u78DfMoz0t+/vVoUP0ZPj+q6MkQP8mVYBaYUwoaZil86thrYUUTogsNKC7TRiv4etNhw
         TWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SKZjvO1p102FADuTX50l2VuWSq7lWEumYWEfsQxT1MQ=;
        b=giUGGjeW40Q19GHcX4ZGq7YYzDC49UukNMt7tF1I3hvKo6ZN+CzBWvjMP+LZQDxy0g
         ZMsrVmGHyu6IXQxtREWDwDxhZlLdNYCR9clQuCPEgU8yRcISYeRrWbm8Qus1hvB3HgfB
         5YgKIpw8FyysHcNPKjJO1iIqCcw9IT0jasxvyGzRwNU6B2U9SS6L+S5kwVnlHHHGP1+G
         cFi9RvAgK8iG0lSnpVAoeVYsmjRsPaVz55HJ4rwHxeZUboE7upxybhJBQjA1qLSHzJW6
         LmobKXWMyYanbk6SvyLFD7f2ucQ8eeD2XLdpHdLAyLu15XQtIYTtkWTiPQRDh0L2RJ6D
         yolw==
X-Gm-Message-State: APjAAAX7G9IuMqvZ0htGb94BrxEmFpAsdGrSbFVBBlrT5t5OEHp349N1
        9i7gWVb8/FaloQhMoSVgGOUz9gY6
X-Google-Smtp-Source: APXvYqzNuYXvwDFQrjinihtwOYO5sSbfrwMejXTO3MZUCUHvbJdOoWkvNhaLe1u/YsVNPSmQw/9yeg==
X-Received: by 2002:a63:6106:: with SMTP id v6mr2693793pgb.36.1566986065061;
        Wed, 28 Aug 2019 02:54:25 -0700 (PDT)
Received: from localhost.localdomain ([39.117.32.11])
        by smtp.gmail.com with ESMTPSA id m13sm2101432pgn.57.2019.08.28.02.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 02:54:24 -0700 (PDT)
From:   Jongpil Jung <jongpuls@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Jongpil Jung <jongpil19.jung@samsung.corp-partner.google.com>
Subject: [PATCH 8/8] Input: atmel_mxt_ts - enable config update from user space.
Date:   Wed, 28 Aug 2019 18:53:49 +0900
Message-Id: <20190828095349.30607-8-jongpuls@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828095349.30607-1-jongpuls@gmail.com>
References: <20190828095349.30607-1-jongpuls@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Jongpil Jung <jongpil19.jung@samsung.corp-partner.google.com>

Enable config update for atmel mxt touchscreen ic.
Here is config update step.
1. load config file from file system.
   If you want to use different config file,
   you may update config file name.
2. Make ic uninterruptable before you update config.
3. Load config and verify header inforamtion.
4. Write config into IC.
5. Backup IC register data into backup nvram.
6. Reset device.
7. Save power config and register into device driver data.

Change-Id: Ied53bff486d04133602761efc5e9ea933e4f741e
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 678 ++++++++++++++++++++++-
 1 file changed, 673 insertions(+), 5 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 2f1013c97433..09bcaf49abfb 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -70,6 +70,7 @@
 #define MXT_SPT_MESSAGECOUNT_T44	44
 #define MXT_SPT_CTECONFIG_T46		46
 #define MXT_SPT_DYNAMICCONFIGURATIONCONTAINER_T71 71
+#define MXT_SPT_TOUCHSCREENHOVER_T101	101
 #define MXT_TOUCH_MULTITOUCHSCREEN_T100 100
 
 /* MXT_GEN_MESSAGE_T5 object */
@@ -105,7 +106,7 @@ struct t7_config {
 #define MXT_T9_XSIZE		3
 #define MXT_T9_YSIZE		4
 #define MXT_T9_ORIENT		9
-#define MXT_T9_RANGE		18
+#define MXT_T9_XRANGE_LSB	18
 
 /* MXT_TOUCH_MULTI_T9 status */
 #define MXT_T9_UNGRIP		BIT(0)
@@ -157,19 +158,27 @@ struct t37_debug {
 /* T100 Multiple Touch Touchscreen */
 #define MXT_T100_CTRL		0
 #define MXT_T100_CFG1		1
-#define MXT_T100_TCHAUX		3
+#define MXT_T100_SCRAUX 	2
+#define MXT_T100_TCHAUX 	3
 #define MXT_T100_XSIZE		9
-#define MXT_T100_XRANGE		13
+#define MXT_T100_XRANGE 	13
 #define MXT_T100_YSIZE		20
-#define MXT_T100_YRANGE		24
+#define MXT_T100_YRANGE 	24
 
 #define MXT_T100_CFG_SWITCHXY	BIT(5)
+
+#define MXT_T100_SRCAUX_NUMRPTTCH	BIT(0)
+#define MXT_T100_SRCAUX_TCHAREA 	BIT(1)
+#define MXT_T100_SRCAUX_ATCHAREA	BIT(2)
+#define MXT_T100_SRCAUX_INTTHRAREA	BIT(3)
+
 #define MXT_T100_CFG_INVERTY	BIT(6)
 #define MXT_T100_CFG_INVERTX	BIT(7)
 
 #define MXT_T100_TCHAUX_VECT	BIT(0)
 #define MXT_T100_TCHAUX_AMPL	BIT(1)
 #define MXT_T100_TCHAUX_AREA	BIT(2)
+#define MXT_T100_TCHAUX_PEAK	BIT(4)
 
 #define MXT_T100_DETECT		BIT(7)
 #define MXT_T100_TYPE_MASK	0x70
@@ -214,11 +223,21 @@ enum t100_type {
 #define MXT_BOOT_EXTENDED_ID	BIT(5)
 #define MXT_BOOT_ID_MASK	0x1f
 
+/* Touch orient bits */
+#define MXT_XY_SWITCH		(1 << 0)
+
 /* Touchscreen absolute values */
 #define MXT_MAX_AREA		0xff
 
 #define MXT_PIXELS_PER_MM	20
 
+struct mxt_cfg_file_line {
+	struct list_head list;
+	u16 addr;
+	u8 size;
+	u8 *content;
+};
+
 struct mxt_info {
 	u8 family_id;
 	u8 variant_id;
@@ -287,6 +306,10 @@ struct mxt_data {
 	unsigned int irq;
 	unsigned int max_x;
 	unsigned int max_y;
+
+	/* max touchscreen area in terms of pixels and channels */
+	unsigned int max_area_pixels;
+	unsigned int max_area_channels;
 	bool invertx;
 	bool inverty;
 	bool xy_switch;
@@ -300,6 +323,10 @@ struct mxt_data {
 	u8 max_reportid;
 	u32 config_crc;
 	u32 info_crc;
+
+	bool has_T9;
+	bool has_T100;
+
 	u8 bootloader_addr;
 	u8 *msg_buf;
 	u8 t6_status;
@@ -308,6 +335,21 @@ struct mxt_data {
 	u8 num_touchids;
 	u8 multitouch;
 	struct t7_config t7_cfg;
+	bool t7_cfg_valid;
+
+	u8 T101_ctrl;
+	bool T101_ctrl_valid;
+
+	/* Saved T42 Touch Suppression field */
+	u8 T42_ctrl;
+	bool T42_ctrl_valid;
+
+	/* Saved T19 GPIO config */
+	u8 T19_ctrl;
+	bool T19_ctrl_valid;
+
+	u8 T19_status;
+
 	struct mxt_dbg dbg;
 	struct gpio_desc *reset_gpio;
 
@@ -325,6 +367,16 @@ struct mxt_data {
 	u8 T100_reportid_min;
 	u8 T100_reportid_max;
 
+	/* T100 Configuration.  Which calculations are enabled*/
+	bool T100_enabled_num_reportable_touches;
+	bool T100_enabled_touch_area;
+	bool T100_enabled_antitouch_area;
+	bool T100_enabled_internal_tracking_area;
+	bool T100_enabled_vector;
+	bool T100_enabled_amplitude;
+	bool T100_enabled_area;
+	bool T100_enabled_peak;
+
 	/* for fw update in bootloader */
 	struct completion bl_completion;
 
@@ -334,6 +386,12 @@ struct mxt_data {
 	/* for config update handling */
 	struct completion crc_completion;
 
+	/*
+	 * Protects from concurrent firmware/config updates and
+	 * suspending/resuming.
+	 */
+	struct mutex fw_mutex;
+
 	/* firmware file name */
 	char *fw_file;
 
@@ -351,6 +409,15 @@ struct mxt_vb2_buffer {
 	struct list_head	list;
 };
 
+/* Define Global Functions in here */
+static int mxt_calc_resolution_T9(struct mxt_data *data);
+static int mxt_calc_resolution_T100(struct mxt_data *data);
+static void mxt_save_power_config(struct mxt_data *data);
+static void mxt_save_aux_regs(struct mxt_data *data);
+static void mxt_start(struct mxt_data *data);
+static void mxt_stop(struct mxt_data *data);
+static int mxt_get_config_from_chip(struct mxt_data *data);
+
 static size_t mxt_obj_size(const struct mxt_object *obj)
 {
 	return obj->size_minus_one + 1;
@@ -396,6 +463,14 @@ static bool mxt_object_readable(unsigned int type)
 	}
 }
 
+static inline bool is_hovering_supported(struct mxt_data *data)
+{
+	struct mxt_info *info = &data->info;
+	/* vairant_id: 337t(164.17), 2954t2(164.13) */
+	return ((info->family_id == 164) &&
+		((info->variant_id == 13) || (info->variant_id == 17)));
+}
+
 static void mxt_dump_message(struct mxt_data *data, u8 *message)
 {
 	dev_dbg(&data->client->dev, "message: %*ph\n",
@@ -1853,7 +1928,7 @@ static int mxt_read_t9_resolution(struct mxt_data *data)
 		return error;
 
 	error = __mxt_read_reg(client,
-			       object->start_address + MXT_T9_RANGE,
+			       object->start_address + MXT_T9_XRANGE_LSB,
 			       sizeof(range), &range);
 	if (error)
 		return error;
@@ -2687,6 +2762,547 @@ static int mxt_configure_objects(struct mxt_data *data,
 	return 0;
 }
 
+static int mxt_save_regs(struct mxt_data *data, u8 type, u8 instance,
+			 u8 offset, u8 *val, u16 size)
+{
+	struct mxt_object *object;
+	u16 addr;
+	int ret;
+
+	object = mxt_get_object(data, type);
+	if (!object)
+		return -EINVAL;
+
+	addr = object->start_address + instance * mxt_obj_size(object) + offset;
+	ret = __mxt_read_reg(data->client, addr, size, val);
+	if (ret)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void mxt_save_power_config(struct mxt_data *data)
+{
+	struct device *dev = &data->client->dev;
+	int ret;
+
+	/* Save 3 bytes T7 Power config */
+	ret = mxt_save_regs(data, MXT_GEN_POWER_T7, 0, 0,
+			    (u8 *)&data->t7_cfg, sizeof(struct t7_config));
+	if (ret)
+		dev_err(dev, "Save T7 Power config failed, %d\n", ret);
+
+	data->t7_cfg_valid = (ret == 0);
+}
+
+static void mxt_save_aux_regs(struct mxt_data *data)
+{
+	struct device *dev = &data->client->dev;
+	int ret;
+
+	if (is_hovering_supported(data)) {
+		/* Save 1 byte T101 Ctrl config */
+		ret = mxt_save_regs(data, MXT_SPT_TOUCHSCREENHOVER_T101, 0, 0,
+				    &data->T101_ctrl, 1);
+		if (ret)
+			dev_err(dev, "Save T101 ctrl config failed, %d\n", ret);
+		data->T101_ctrl_valid = (ret == 0);
+	}
+
+	ret = mxt_save_regs(data, MXT_PROCI_TOUCHSUPPRESSION_T42, 0, 0,
+			    &data->T42_ctrl, 1);
+	if (ret)
+		dev_err(dev, "Save T42 ctrl config failed, %d\n", ret);
+	data->T42_ctrl_valid = (ret == 0);
+
+	ret = mxt_save_regs(data, MXT_SPT_GPIOPWM_T19, 0, 0,
+			    &data->T19_ctrl, 1);
+	if (ret)
+		dev_err(dev, "Save T19 ctrl config failed, %d\n", ret);
+	data->T19_ctrl_valid = (ret == 0);
+}
+
+static int mxt_update_setting_T100(struct mxt_data *data)
+{
+	struct i2c_client *client = data->client;
+	struct mxt_object *T100;
+	u8 srcaux, tchaux;
+	int ret;
+
+	T100 = mxt_get_object(data, MXT_TOUCH_MULTITOUCHSCREEN_T100);
+	if (!T100)
+		return -EINVAL;
+
+	/* Get SRCAUX Setting */
+	ret = __mxt_read_reg(client, T100->start_address + MXT_T100_SCRAUX,
+			1, &srcaux);
+	if (ret)
+		return ret;
+	data->T100_enabled_num_reportable_touches =
+			(srcaux & MXT_T100_SRCAUX_NUMRPTTCH);
+	data->T100_enabled_touch_area = (srcaux & MXT_T100_SRCAUX_TCHAREA);
+	data->T100_enabled_antitouch_area = (srcaux & MXT_T100_SRCAUX_ATCHAREA);
+	data->T100_enabled_internal_tracking_area =
+			(srcaux & MXT_T100_SRCAUX_INTTHRAREA);
+
+	/* Get TCHAUX Setting */
+	ret = __mxt_read_reg(client, T100->start_address + MXT_T100_TCHAUX,
+			 1, &tchaux);
+	if (ret)
+		return ret;
+	data->T100_enabled_vector = (tchaux & MXT_T100_TCHAUX_VECT);
+	data->T100_enabled_amplitude = (tchaux & MXT_T100_TCHAUX_AMPL);
+	data->T100_enabled_area = (tchaux & MXT_T100_TCHAUX_AREA);
+	data->T100_enabled_peak = (tchaux & MXT_T100_TCHAUX_PEAK);
+
+	dev_info(&client->dev, "T100 Config: SCRAUX : %X, TCHAUX : %X",
+		 srcaux, tchaux);
+
+	return 0;
+}
+
+static int mxt_calc_resolution_T100(struct mxt_data *data)
+{
+	struct i2c_client *client = data->client;
+	u8 orient;
+	__le16 xyrange[2];
+	unsigned int max_x, max_y;
+	u8 xylines[2];
+	int ret;
+
+	struct mxt_object *T100 = mxt_get_object(
+		data, MXT_TOUCH_MULTITOUCHSCREEN_T100);
+	if (!T100)
+		return -EINVAL;
+
+	/* Get touchscreen resolution */
+	ret = __mxt_read_reg(client, T100->start_address + MXT_T100_XRANGE,
+			2, &xyrange[0]);
+	if (ret)
+		return ret;
+
+	ret = __mxt_read_reg(client, T100->start_address + MXT_T100_YRANGE,
+			2, &xyrange[1]);
+	if (ret)
+		return ret;
+
+	ret = __mxt_read_reg(client, T100->start_address + MXT_T100_CFG1,
+			1, &orient);
+	if (ret)
+		return ret;
+
+	ret = __mxt_read_reg(client, T100->start_address + MXT_T100_XSIZE,
+			1, &xylines[0]);
+	if (ret)
+		return ret;
+
+	ret = __mxt_read_reg(client, T100->start_address + MXT_T100_YSIZE,
+			1, &xylines[1]);
+	if (ret)
+		return ret;
+
+	/* TODO: Read the TCHAUX field and save the VECT/AMPL/AREA config. */
+
+	max_x = le16_to_cpu(xyrange[0]);
+	max_y = le16_to_cpu(xyrange[1]);
+
+	if (max_x == 0)
+		max_x = 1023;
+
+	if (max_y == 0)
+		max_y = 1023;
+
+	if (orient & MXT_T100_CFG_SWITCHXY) {
+		data->max_x = max_y;
+		data->max_y = max_x;
+	} else {
+		data->max_x = max_x;
+		data->max_y = max_y;
+	}
+
+	data->max_area_pixels = max_x * max_y;
+	data->max_area_channels = xylines[0] * xylines[1];
+
+	dev_info(&client->dev,
+		 "T100 Config: XSIZE %u, YSIZE %u, XLINE %u, YLINE %u",
+		 max_x, max_y, xylines[0], xylines[1]);
+
+	return 0;
+}
+
+static int mxt_calc_resolution_T9(struct mxt_data *data)
+{
+	struct i2c_client *client = data->client;
+	u8 orient;
+	__le16 xyrange[2];
+	unsigned int max_x, max_y;
+	u8 xylines[2];
+	int ret;
+
+	struct mxt_object *T9 = mxt_get_object(data, MXT_TOUCH_MULTI_T9);
+	if (T9 == NULL)
+		return -EINVAL;
+
+	/* Get touchscreen resolution */
+	ret = __mxt_read_reg(client, T9->start_address + MXT_T9_XRANGE_LSB,
+			4, xyrange);
+	if (ret)
+		return ret;
+
+	ret = __mxt_read_reg(client, T9->start_address + MXT_T9_ORIENT,
+			1, &orient);
+	if (ret)
+		return ret;
+
+	ret = __mxt_read_reg(client, T9->start_address + MXT_T9_XSIZE,
+			2, xylines);
+	if (ret)
+		return ret;
+
+	max_x = le16_to_cpu(xyrange[0]);
+	max_y = le16_to_cpu(xyrange[1]);
+
+	if (orient & MXT_XY_SWITCH) {
+		data->max_x = max_y;
+		data->max_y = max_x;
+	} else {
+		data->max_x = max_x;
+		data->max_y = max_y;
+	}
+
+	data->max_area_pixels = max_x * max_y;
+	data->max_area_channels = xylines[0] * xylines[1];
+
+	dev_info(&client->dev,
+		 "T9 Config: XSIZE %u, YSIZE %u, XLINE %u, YLINE %u",
+		 max_x, max_y, xylines[0], xylines[1]);
+
+	return 0;
+}
+
+/*
+ * Atmel Raw Config File Format
+ *
+ * The first four lines of the raw config file contain:
+ *  1) Version
+ *  2) Chip ID Information (first 7 bytes of device memory)
+ *  3) Chip Information Block 24-bit CRC Checksum
+ *  4) Chip Configuration 24-bit CRC Checksum
+ *
+ * The rest of the file consists of one line per object instance:
+ *   <TYPE> <INSTANCE> <SIZE> <CONTENTS>
+ *
+ *  <TYPE> - 2-byte object type as hex
+ *  <INSTANCE> - 2-byte object instance number as hex
+ *  <SIZE> - 2-byte object size as hex
+ *  <CONTENTS> - array of <SIZE> 1-byte hex values
+ */
+static int mxt_cfg_verify_hdr(struct mxt_data *data, char **config)
+{
+	struct i2c_client *client = data->client;
+	struct device *dev = &client->dev;
+	struct mxt_info info;
+	char *token;
+	int ret = 0;
+	u32 crc;
+
+	/* Process the first four lines of the file*/
+	/* 1) Version */
+	token = strsep(config, "\n");
+	dev_info(dev, "Config File: Version = %s\n", token ?: "<null>");
+	if (!token ||
+	    strncmp(token, MXT_CFG_MAGIC, strlen(MXT_CFG_MAGIC))) {
+		dev_err(dev, "Invalid config file: Bad Version\n");
+		return -EINVAL;
+	}
+
+	/* 2) Chip ID */
+	token = strsep(config, "\n");
+	if (!token) {
+		dev_err(dev, "Invalid config file: No Chip ID\n");
+		return -EINVAL;
+	}
+	ret = sscanf(token, "%hhx %hhx %hhx %hhx %hhx %hhx %hhx",
+		     &info.family_id, &info.variant_id,
+		     &info.version, &info.build, &info.matrix_xsize,
+		     &info.matrix_ysize, &info.object_num);
+	dev_info(dev, "Config File: Chip ID = %02x %02x %02x %02x %02x %02x %02x\n",
+		info.family_id, info.variant_id, info.version, info.build,
+		info.matrix_xsize, info.matrix_ysize, info.object_num);
+	if (ret != 7 ||
+	    info.family_id != data->info.family_id ||
+	    info.variant_id != data->info.variant_id ||
+	    info.version != data->info.version ||
+	    info.build != data->info.build ||
+	    info.object_num != data->info.object_num) {
+		dev_err(dev, "Invalid config file: Chip ID info mismatch\n");
+		dev_err(dev, "Chip Info: %02x %02x %02x %02x %02x %02x %02x\n",
+			data->info.family_id, data->info.variant_id,
+			data->info.version, data->info.build,
+			data->info.matrix_xsize, data->info.matrix_ysize,
+			data->info.object_num);
+		return -EINVAL;
+	}
+
+	/* 3) Info Block CRC */
+	token = strsep(config, "\n");
+	if (!token) {
+		dev_err(dev, "Invalid config file: No Info Block CRC\n");
+		return -EINVAL;
+	}
+
+	if (info.matrix_xsize != data->info.matrix_xsize ||
+	    info.matrix_ysize != data->info.matrix_ysize) {
+		/*
+		 * Matrix xsize and ysize depend on the state of T46 byte 1
+		 * for the XY Mode. A mismatch is possible due to
+		 * a corrupted register set. The config update should proceed
+		 * to correct the problem. In this condition, the info block
+		 * CRC check should be skipped.
+		 */
+		dev_info(dev, "Matrix Xsize and Ysize mismatch. Updating.\n");
+		dev_info(dev, "Chip Info: %02x %02x %02x %02x %02x %02x %02x\n",
+			 data->info.family_id, data->info.variant_id,
+			 data->info.version, data->info.build,
+			 data->info.matrix_xsize, data->info.matrix_ysize,
+			 data->info.object_num);
+		goto config_crc;
+	}
+
+	ret = sscanf(token, "%x", &crc);
+	if (ret != 1 || crc != data->info_crc) {
+		dev_err(dev, "Config File: Info Block info_csum: %06x != %06x\n",
+			 crc, data->info_crc);
+		dev_err(dev, "Invalid config file: Bad Info Block CRC\n");
+		return -EINVAL;
+	}
+
+config_crc:
+	/* 4) Config CRC */
+	/*
+	 * Parse but don't verify against current config;
+	 * TODO: Verify against CRC of rest of file?
+	 */
+	token = strsep(config, "\n");
+	if (!token) {
+		dev_err(dev, "Invalid config file: No Config CRC\n");
+		return -EINVAL;
+	}
+	ret = sscanf(token, "%x", &crc);
+	dev_info(dev, "Config File: Config CRC = %06x\n", crc);
+	if (ret != 1) {
+		dev_err(dev, "Invalid config file: Bad Config CRC\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mxt_cfg_proc_line(struct mxt_data *data, const char *line,
+			     struct list_head *cfg_list)
+{
+	struct i2c_client *client = data->client;
+	struct device *dev = &client->dev;
+	int ret;
+	u16 type, instance, size;
+	int len;
+	struct mxt_cfg_file_line *cfg_line;
+	struct mxt_object *object;
+	u8 *content;
+	size_t i;
+
+	ret = sscanf(line, "%hx %hx %hx%n", &type, &instance, &size, &len);
+	/* Skip unparseable lines */
+	if (ret < 3)
+		return 0;
+	/* Only support 1-byte types */
+	if (type > 0xff) {
+		dev_err(dev, "Invalid type = %X\n", type);
+		return -EINVAL;
+	}
+
+	/* Supplied object MUST be a valid instance and match object size */
+	object = mxt_get_object(data, type);
+	if (!object) {
+		dev_err(dev, "Can't get object\n");
+		return -EINVAL;
+	}
+
+	if (instance > mxt_obj_instances(object)) {
+		dev_err(dev, "Too many instances.  Type=%x (%u > %zu)\n",
+			type, instance, mxt_obj_instances(object));
+		return -EINVAL;
+	}
+
+	if (size != mxt_obj_size(object)) {
+		dev_err(dev, "Incorrect obect size. Type=%x (%u != %zu)\n",
+			type, size, mxt_obj_size(object));
+		return -EINVAL;
+	}
+
+	content = kmalloc(size, GFP_KERNEL);
+	if (!content)
+		return -ENOMEM;
+
+	for (i = 0; i < size; i++) {
+		line += len;
+		ret = sscanf(line, "%hhx%n", &content[i], &len);
+		if (ret < 1) {
+			ret = -EINVAL;
+			goto free_content;
+		}
+	}
+
+	cfg_line = kzalloc(sizeof(*cfg_line), GFP_KERNEL);
+	if (!cfg_line) {
+		ret = -ENOMEM;
+		goto free_content;
+	}
+	INIT_LIST_HEAD(&cfg_line->list);
+	cfg_line->addr = object->start_address +
+		instance * mxt_obj_size(object);
+	cfg_line->size = mxt_obj_size(object);
+	cfg_line->content = content;
+	list_add_tail(&cfg_line->list, cfg_list);
+
+	return 0;
+
+free_content:
+	kfree(content);
+	return ret;
+}
+
+static int mxt_cfg_proc_data(struct mxt_data *data, char **config)
+{
+	struct i2c_client *client = data->client;
+	struct device *dev = &client->dev;
+	char *line;
+	int ret = 0;
+	struct list_head cfg_lines;
+	struct mxt_cfg_file_line *cfg_line, *cfg_line_tmp;
+
+	INIT_LIST_HEAD(&cfg_lines);
+
+	while ((line = strsep(config, "\n"))) {
+		ret = mxt_cfg_proc_line(data, line, &cfg_lines);
+		if (ret < 0)
+			goto free_objects;
+	}
+
+	list_for_each_entry(cfg_line, &cfg_lines, list) {
+		dev_dbg(dev, "Addr = %u Size = %u\n",
+			cfg_line->addr, cfg_line->size);
+		print_hex_dump(KERN_DEBUG, "atmel_mxt_ts: ", DUMP_PREFIX_OFFSET,
+			       16, 1, cfg_line->content, cfg_line->size, false);
+
+		ret = __mxt_write_reg(client, cfg_line->addr, cfg_line->size,
+				cfg_line->content);
+		if (ret)
+			break;
+	}
+
+free_objects:
+	list_for_each_entry_safe(cfg_line, cfg_line_tmp, &cfg_lines, list) {
+		list_del(&cfg_line->list);
+		kfree(cfg_line->content);
+		kfree(cfg_line);
+	}
+	return ret;
+}
+
+static int mxt_load_config(struct mxt_data *data, const struct firmware *fw)
+{
+	struct device *dev = &data->client->dev;
+	int ret, ret2;
+	char *cfg_copy = NULL;
+	char *running;
+
+	ret = mutex_lock_interruptible(&data->fw_mutex);
+	if (ret)
+		return ret;
+
+	/* Make a mutable, '\0'-terminated copy of the config file */
+	cfg_copy = kmalloc(fw->size + 1, GFP_KERNEL);
+	if (!cfg_copy) {
+		ret = -ENOMEM;
+		goto err_alloc_copy;
+	}
+	memcpy(cfg_copy, fw->data, fw->size);
+	cfg_copy[fw->size] = '\0';
+
+	/* Verify config file header (after which running points to data) */
+	running = cfg_copy;
+	ret = mxt_cfg_verify_hdr(data, &running);
+	if (ret) {
+		dev_err(dev, "Error verifying config header (%d)\n", ret);
+		goto free_cfg_copy;
+	}
+
+	disable_irq(data->irq);
+
+	if (data->input_dev) {
+		input_unregister_device(data->input_dev);
+		data->input_dev = NULL;
+	}
+
+	/* Write configuration */
+	ret = mxt_cfg_proc_data(data, &running);
+	if (ret) {
+		dev_err(dev, "Error writing config file (%d)\n", ret);
+		goto register_input_dev;
+	}
+
+	/* Backup nvram */
+	ret = mxt_write_object(data, MXT_GEN_COMMAND_T6,
+			       MXT_COMMAND_BACKUPNV,
+			       MXT_BACKUP_VALUE);
+	if (ret) {
+		dev_err(dev, "Error backup to nvram (%d)\n", ret);
+		goto register_input_dev;
+	}
+	msleep(MXT_BACKUP_TIME);
+
+	/* Reset device */
+	ret = mxt_write_object(data, MXT_GEN_COMMAND_T6,
+			       MXT_COMMAND_RESET, 1);
+	if (ret) {
+		dev_err(dev, "Error resetting device (%d)\n", ret);
+		goto register_input_dev;
+	}
+	msleep(MXT_RESET_TIME);
+
+	mxt_save_power_config(data);
+	mxt_save_aux_regs(data);
+	mxt_stop(data);
+
+register_input_dev:
+	ret2 = mxt_get_config_from_chip(data);
+	if (ret2) {
+		dev_err(dev, "Failed to fetch config from chip (%d)\n", ret2);
+		ret = ret2;
+	}
+
+	ret2 = mxt_initialize_input_device(data);
+	if (ret2) {
+		dev_err(dev, "Error creating input_dev (%d)\n", ret2);
+		ret = ret2;
+	}
+
+	/* Clear message buffer */
+	ret2 = mxt_process_messages_until_invalid(data);
+	if (ret2) {
+		dev_err(dev, "Error clearing msg buffer (%d)\n", ret2);
+		ret = ret2;
+	}
+
+	enable_irq(data->irq);
+free_cfg_copy:
+	kfree(cfg_copy);
+err_alloc_copy:
+	mutex_unlock(&data->fw_mutex);
+	return ret;
+}
+
 static int mxt_update_file_name(struct device *dev, char **file_name,
 				const char *buf, size_t count)
 {
@@ -2896,6 +3512,35 @@ static ssize_t mxt_object_show(struct device *dev,
 	return error ?: count;
 }
 
+static ssize_t mxt_update_config_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct mxt_data *data = i2c_get_clientdata(client);
+	const struct firmware *fw;
+	int error;
+
+	error = request_firmware(&fw, data->config_file, dev);
+	if (error) {
+		dev_err(dev, "Unable to open config file %s, %d\n",
+			data->config_file, error);
+		return error;
+	}
+
+	dev_info(dev, "Using config file %s (size = %zu)\n",
+		 data->config_file, fw->size);
+
+	error = mxt_load_config(data, fw);
+	if (error)
+		dev_err(dev, "The config update failed (%d)\n", error);
+	else
+		dev_dbg(dev, "The config update succeeded\n");
+
+	release_firmware(fw);
+	return error ?: count;
+}
+
 static int mxt_check_firmware_format(struct device *dev,
 				     const struct firmware *fw)
 {
@@ -3075,6 +3720,7 @@ static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
 static DEVICE_ATTR(info_csum, S_IRUGO, mxt_info_csum_show, NULL);
 static DEVICE_ATTR(matrix_size, S_IRUGO, mxt_matrix_size_show, NULL);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
+static DEVICE_ATTR(update_config, S_IWUSR, NULL, mxt_update_config_store);
 static DEVICE_ATTR(update_fw, S_IWUSR, NULL, mxt_update_fw_store);
 
 static struct attribute *mxt_attrs[] = {
@@ -3088,6 +3734,7 @@ static struct attribute *mxt_attrs[] = {
 	&dev_attr_info_csum.attr,
 	&dev_attr_matrix_size.attr,
 	&dev_attr_object.attr,
+	&dev_attr_update_config.attr,
 	&dev_attr_update_fw.attr,
 	NULL
 };
@@ -3202,6 +3849,25 @@ static const struct dmi_system_id chromebook_T9_suspend_dmi[] = {
 	{ }
 };
 
+static int mxt_get_config_from_chip(struct mxt_data *data)
+{
+	int error;
+
+	error = data->has_T9 ? mxt_calc_resolution_T9(data) :
+			       mxt_calc_resolution_T100(data);
+	if (error)
+		return error;
+
+	/* Update T100 settings */
+	if (data->has_T100) {
+		error = mxt_update_setting_T100(data);
+		if (error)
+			return error;
+	}
+
+	return 0;
+}
+
 static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	struct mxt_data *data;
@@ -3243,6 +3909,8 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	data->irq = client->irq;
 	i2c_set_clientdata(client, data);
 
+	mutex_init(&data->fw_mutex);
+
 	init_completion(&data->bl_completion);
 	init_completion(&data->reset_completion);
 	init_completion(&data->crc_completion);
-- 
2.17.1

