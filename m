Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC4BA18BA93
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727724AbgCSPIz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:08:55 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:5936 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbgCSPIz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:08:55 -0400
IronPort-SDR: hetNF/ujTtxreZ6YFVk8z9MhJnj2FR59AoDpX6cZEYvG5kV82O+khOkc5nAeHJdS4QrE9dtzdR
 nnLLOlwfFX+5eRKbPpfmL7F7DBWvtri2hzvjk2TNKCsNkQHuO5HjZ3DKo2ssmg2yuUuHOQd+Xw
 pjnBVTtBQzO8wr4d8DVwY69+Oce932q8Rp80qfzVN/wi5T+beyQbVfJ3Sc8v/8rbStwRKCKi21
 X2CCMfaG4unAAJTEnGECKU0qJQu0Uvkry1KarpvC+TbYT6c3oE5XV9p/ls1qeqfvBL6Bp3aIuR
 EKA=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="46926822"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:01:29 -0800
IronPort-SDR: gj2U72aBqKE+TZAJsODZEihCB4BZbVETygDHuXguYMA1R3K4QXnVy0Hq/hVEdmWx08bpiBtPrS
 C+dWcO18ThQPgGLd6F2C5TAxZ9tVLbl89ciKBklpIARDtzZzFUzVhD4f9DEeyC/ULbzw6pj5/s
 yUSlr2HyYtesT6J7IIQdCin07TSnHbslz0L2OUadw9SsMaTljKlryMLPIP4KWwXRFDSr/+Hmic
 CIzCrjxJpAO/i6+0oAAP8jqn9Z/tP4RXzcOGzQvdDBGhdnEwPVpLmm2cCU3n9f52dXwkeooQtL
 v/g=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 17/52] Input: atmel_mxt_ts - handle cfg filename via pdata/sysfs
Date:   Thu, 19 Mar 2020 07:59:41 -0700
Message-ID: <20200319150016.61398-18-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
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
	Change Symbolic permissions 'S_IWUSR' to 0200]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 109 +++++++++++++++++++----
 1 file changed, 94 insertions(+), 15 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 0e30ff372a43..3ef98e14c94e 100644
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
@@ -3392,6 +3412,55 @@ static ssize_t mxt_update_fw_store(struct device *dev,
 	return count;
 }
 
+static ssize_t mxt_update_cfg_store(struct device *dev,
+		struct device_attribute *attr,
+		const char *buf, size_t count)
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
 static DEVICE_ATTR(update_fw, 0200, NULL, mxt_update_fw_store);
 
 static struct attribute *mxt_fw_attrs[] = {
@@ -3406,11 +3475,13 @@ static const struct attribute_group mxt_fw_attr_group = {
 static DEVICE_ATTR(fw_version, S_IRUGO, mxt_fw_version_show, NULL);
 static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
+static DEVICE_ATTR(update_cfg, 0200, NULL, mxt_update_cfg_store);
 
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

