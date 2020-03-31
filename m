Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFE4199410
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730730AbgCaKwN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:52:13 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43515 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730740AbgCaKwN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:52:13 -0400
IronPort-SDR: 47BYIieLAyemBKJOHgJfHzKrd1eL8AiceDqSGpB2viHVQCylG4ngWiU18iZsPzGWmD8jWz2x+f
 v6fdVfI6sv+HJb3wk1D9vnEZpUIYuhKCj7OknRybwbQoINPCHgRwmYKBa4KhxJFcZHbzQSemmo
 5MjTkNLEx/K0n5XxTHoUic8GQnMfMrjcABrbcV1o2qVP7oRDWUkQP/uxyh++GPcK9k9E9n9vFg
 StgZuqSs0/ki5M7uJV1XUUef6/UV0Qm7B9gRBAjeZ6OehSeE2w23yyLS3HUvPIk//ujlX7YYWk
 2yw=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330768"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:52:12 -0800
IronPort-SDR: l84sKG6TVF94TIxMp6EHV+M0dDjoG8oXziQ7Sc0kPP7gfqBmBGukY4HvaJKq9xyIBLleuv3utV
 o0U9NGrQF6Nt8bcGWShGRvrFQR3wW4f8OJwPKJ0t89Z4Bx3KJlWWQD14BZ9oMqe+v4UQ7bVQ88
 nBBmU2O+V8S8qJ6ekblxlj9jwCa60OU/agSjsq6CskdUynj2xAgzYU44cCc+366ZrFDqMzCWHY
 4y7MfbNpjexPV+qJo/zDie/a7wmNNMS85BoSpDsue9nohslvECj4yDADUe+gVIyhIs5Rc1JHZj
 dpQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 20/55] Input: atmel_mxt_ts - handle cfg filename via pdata/sysfs
Date:   Tue, 31 Mar 2020 03:50:16 -0700
Message-ID: <20200331105051.58896-21-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

There may be multiple maXTouch chips on a single device which will require
different configuration files. Add a platform data value for the
configuration filename.

Add sysfs entry to write configuration file if the platform data is not
set.

Split out the object initialisation code from mxt_initialize() into
mxt_configure_objects() to allow this.

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
Acked-by: Yufeng Shen <miletus@chromium.org>
(cherry picked from ndyer/linux/for-upstream commit 71a2a4d1954460b949a16b607f72bafab294ca79)
[gdavis: Resolve forward port conflicts due to applying upstream
	 commit 96a938aa214e ("Input: atmel_mxt_ts - remove platform
	 data support").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
[gdavis: Squash fix from Vladimir Zapolskiy:
	 - Input: atmel_mxt_ts - fix error paths in mxt_configure_objects()]
Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
[jiada: Separate Documentation/ portion change to another commit
	Rename mxt_update_cfg_store to update_cfg_store
	Replace DEVICE_ATTR with DEVICE_ATTR_WO]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 109 +++++++++++++++++++----
 1 file changed, 94 insertions(+), 15 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 720574417219..d1865250f492 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -34,7 +34,6 @@
 #include <dt-bindings/input/atmel_mxt_ts.h>
 
 /* Configuration file */
-#define MXT_CFG_NAME		"maxtouch.cfg"
 #define MXT_CFG_MAGIC		"OBP_RAW V1"
 
 /* Registers */
@@ -335,6 +334,8 @@ struct mxt_data {
 	struct regulator *reg_vdd;
 	struct regulator *reg_avdd;
 	char *fw_name;
+	char *cfg_name;
+	const char *pcfg_name;
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -377,6 +378,9 @@ struct mxt_data {
 
 	/* Indicates whether device is in suspend */
 	bool suspended;
+
+	/* Indicates whether device is updating configuration */
+	bool updating_config;
 };
 
 struct mxt_vb2_buffer {
@@ -833,9 +837,11 @@ static void mxt_input_button(struct mxt_data *data, u8 *message)
 
 static void mxt_input_sync(struct mxt_data *data)
 {
-	input_mt_report_pointer_emulation(data->input_dev,
-					  data->t19_num_keys);
-	input_sync(data->input_dev);
+	if (data->input_dev) {
+		input_mt_report_pointer_emulation(data->input_dev,
+						  data->t19_num_keys);
+		input_sync(data->input_dev);
+	}
 }
 
 static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
@@ -2578,13 +2584,21 @@ static int mxt_initialize(struct mxt_data *data)
 	if (error)
 		return error;
 
-	error = request_firmware_nowait(THIS_MODULE, true, MXT_CFG_NAME,
-					&client->dev, GFP_KERNEL, data,
-					mxt_config_cb);
-	if (error) {
-		dev_err(&client->dev, "Failed to invoke firmware loader: %d\n",
-			error);
-		goto err_free_sysfs;
+	if (data->cfg_name) {
+		error = request_firmware_nowait(THIS_MODULE, true,
+						data->cfg_name,
+						&client->dev,
+						GFP_KERNEL, data,
+						mxt_config_cb);
+		if (error) {
+			dev_err(&client->dev, "Failed to invoke firmware loader: %d\n",
+				error);
+			goto err_free_sysfs;
+		}
+	} else {
+		error = mxt_configure_objects(data, NULL);
+		if (error)
+			goto err_free_sysfs;
 	}
 
 	return 0;
@@ -3081,19 +3095,21 @@ static int mxt_configure_objects(struct mxt_data *data,
 	error = mxt_init_t7_power_cfg(data);
 	if (error) {
 		dev_err(dev, "Failed to initialize power cfg\n");
-		return error;
+		goto err_free_object_table;
 	}
 
 	if (cfg) {
 		error = mxt_update_cfg(data, cfg);
-		if (error)
+		if (error) {
 			dev_warn(dev, "Error %d updating config\n", error);
+			goto err_free_object_table;
+		}
 	}
 
 	if (data->multitouch) {
 		error = mxt_initialize_input_device(data);
 		if (error)
-			return error;
+			goto err_free_object_table;
 	} else {
 		dev_warn(dev, "No touch object detected\n");
 	}
@@ -3101,6 +3117,10 @@ static int mxt_configure_objects(struct mxt_data *data,
 	mxt_debug_init(data);
 
 	return 0;
+
+err_free_object_table:
+	mxt_free_object_table(data);
+	return error;
 }
 
 /* Firmware Version is returned as Major.Minor.Build */
@@ -3392,6 +3412,55 @@ static ssize_t update_fw_store(struct device *dev,
 	return count;
 }
 
+static ssize_t update_cfg_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	const struct firmware *cfg;
+	int ret;
+
+	ret = mxt_update_file_name(dev, &data->cfg_name, buf, count);
+	if (ret)
+		return ret;
+
+	ret = request_firmware(&cfg, data->cfg_name, dev);
+	if (ret < 0) {
+		dev_err(dev, "Failure to request config file %s\n",
+			data->cfg_name);
+		ret = -ENOENT;
+		goto out;
+	}
+
+	data->updating_config = true;
+
+	mxt_free_input_device(data);
+
+	if (data->suspended) {
+		if (data->suspend_mode == MXT_SUSPEND_REGULATOR) {
+			enable_irq(data->irq);
+			mxt_regulator_enable(data);
+		} else if (data->suspend_mode == MXT_SUSPEND_DEEP_SLEEP) {
+			mxt_set_t7_power_cfg(data, MXT_POWER_CFG_RUN);
+			mxt_acquire_irq(data);
+		}
+
+		data->suspended = false;
+	}
+
+	ret = mxt_configure_objects(data, cfg);
+	if (ret)
+		goto release;
+
+	ret = count;
+
+release:
+	release_firmware(cfg);
+out:
+	data->updating_config = false;
+	return ret;
+}
+
 static DEVICE_ATTR_WO(update_fw);
 
 static struct attribute *mxt_fw_attrs[] = {
@@ -3406,11 +3475,13 @@ static const struct attribute_group mxt_fw_attr_group = {
 static DEVICE_ATTR_RO(fw_version);
 static DEVICE_ATTR_RO(hw_version);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
+static DEVICE_ATTR_WO(update_cfg);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
 	&dev_attr_hw_version.attr,
 	&dev_attr_object.attr,
+	&dev_attr_update_cfg.attr,
 	NULL
 };
 
@@ -3511,7 +3582,7 @@ static int mxt_stop(struct mxt_data *data)
 {
 	int ret;
 
-	if (data->suspended || data->in_bootloader)
+	if (data->suspended || data->in_bootloader || data->updating_config)
 		return 0;
 
 	switch (data->suspend_mode) {
@@ -3580,6 +3651,8 @@ static int mxt_parse_device_properties(struct mxt_data *data)
 	int n_keys;
 	int error;
 
+	device_property_read_string(dev, "atmel,cfg_name", &data->pcfg_name);
+
 	if (device_property_present(dev, keymap_property)) {
 		n_keys = device_property_count_u32(dev, keymap_property);
 		if (n_keys <= 0) {
@@ -3705,6 +3778,12 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (error)
 		return error;
 
+	if (data->pcfg_name)
+		mxt_update_file_name(&data->client->dev,
+				     &data->cfg_name,
+				     data->pcfg_name,
+				     strlen(data->pcfg_name));
+
 	data->reset_gpio = devm_gpiod_get_optional(&client->dev,
 						   "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(data->reset_gpio)) {
-- 
2.17.1

