Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E35A29DDD3
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728988AbfH0G2f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:28:35 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:48162 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727999AbfH0G2e (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:28:34 -0400
IronPort-SDR: 2CMj6qdDODsqFWjidZR25GRPs6x4bN/YaSdpn228DHTgsGfUHSvglK774+6TaILCdWJT5zyrFW
 abKC67kPWCrSNMAEYsXzSl2MOMGgbmw8z2GMivBD+Kyvpc/yQIQFIlbWURMTjnLKB8Txjo5dBS
 Y22EaFN+XF8aJf7gy6RVjJNneeNHvvsSKOE3crLwHjxVVPSIEm4ZuGcDj+00+bXGjVujSN+UcO
 HvgQKVgQU5FPchoctwIb2BhacJgrFxFXxXvaTyAICrFO0OYnR/9GfQs4kHlL/gW0tNKNb+iYd1
 nv4=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="40784491"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:28:33 -0800
IronPort-SDR: tblcGJ+R1mnFYYCm2JkBz+DWFHjQQ4KsQrrW8sRwhr67p8G/2KAcxCrZzVr2WSKDzHOVucjFR9
 83wyERKMVpwby7n6/p94JNgH3fs/aDgFRDK8XS2/FCBzDgfU9E8izzq8Pmdd3kSV1Abr3sw+pw
 10yCosnV9g3kNhgN+M313voRGQ7SEB3qyHXfvuor3VgDa3bw93vYk1uNNNsyCOf9n+qw58yklb
 45bII+wVKI5RLwm7gqAizk93csn7lB1si/TeaQNkeaqh5ZVXwsXootqw99Xdu8eTk4VDn3iS3O
 Y+A=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 17/49] Input: atmel_mxt_ts - handle cfg filename via pdata/sysfs
Date:   Tue, 27 Aug 2019 15:28:02 +0900
Message-ID: <20190827062834.20494-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190827062834.20494-1-jiada_wang@mentor.com>
References: <20190827062834.20494-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
---
Notes:
- Squash fix from Vladimir Zapolskiy:
  + Input: atmel_mxt_ts - fix error paths in mxt_configure_objects()

    Fail in mxt_update_cfg() is critical, because the driver state machine
    is broken and it can not be safely used afterwards.

[jiada: Squash fix from ndyer/linux/for-upstream commit c909ada856861f305653b127db3ea0fa60264331
	- Input: atmel_mxt_ts - check data->input_dev is not null in mxt_input_sync()]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 .../bindings/input/atmel,maxtouch.txt         |   3 +
 drivers/input/touchscreen/atmel_mxt_ts.c      | 109 +++++++++++++++---
 2 files changed, 97 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
index e28139ce3cae..713ce870805c 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -37,6 +37,9 @@ Optional properties for main touchpad device:
     MXT_SUSPEND_REGULATOR - use regulators to power down device during suspend
     Definitions are in <dt-bindings/input/atmel_mxt_ts.h>.
 
+- atmel,cfg_name: Provide name of configuration file in OBP_RAW format. This
+    will be downloaded from the firmware loader on probe to the device.
+
 Example:
 
 	touch@4b {
diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 14f665f12778..c6be716a974c 100644
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
 static DEVICE_ATTR(update_fw, S_IWUSR, NULL, mxt_update_fw_store);
 
 static struct attribute *mxt_fw_attrs[] = {
@@ -3406,11 +3475,13 @@ static const struct attribute_group mxt_fw_attr_group = {
 static DEVICE_ATTR(fw_version, S_IRUGO, mxt_fw_version_show, NULL);
 static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
+static DEVICE_ATTR(update_cfg, S_IWUSR, NULL, mxt_update_cfg_store);
 
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
 		n_keys = device_property_read_u32_array(dev, keymap_property,
 							NULL, 0);
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
2.19.2

