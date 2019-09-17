Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46057B4AF8
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728853AbfIQJlI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:41:08 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:19904 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728852AbfIQJlH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:41:07 -0400
IronPort-SDR: 34mWLzhuD9S6jHqyRrPy0ZvJIJ9AJ63k+vtDlwCxE9J1yFy2OZZ2h4Y1QW58zw1WkpKLgCQ4sK
 gBKQoJYWHzJcRy3UwpDjNSqnu+TWfuF7pQM2sMjSE96U7npnrAW8FFZftaGzqzHP6blLOf+Uim
 koWI7Tihgyrc0lfwDLgwpiHALXIvUrujbbgC9AYl4l0PQ8HOkSGMxuTTmnqredlJihwQ74WslS
 TQQNfNHvX5QtJZ3oft/hFPZRNshNbP1hMhy1QbOqBM8ZgdctKY+2RynFAeE0iEJFisXtuQvZf5
 QVM=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41374165"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:41:06 -0800
IronPort-SDR: 5QItbxhvx5wc/UJ617gj5cbXwybEjc9mAKO6JYakRTd8kfNBlE1s1gCPTU3wUyXEp5iB68+wcz
 +5voI7xxUtfeZmxbvfH6HyhL3Ys7ytzm65Au8Kp4NB8McCUgvdYz9psMeefP67SNRcexy59S+u
 T4UO/he6BOaaSll2lSlMei5TDtH21JpTQlP0GlCxDK9jd/gJyKUlHQJfZi2cRXdWYZA+EM3Qm/
 f2gcYGifgjlQAwhgNLq41f7g2ovoJqIV8CkCFnKQ2Ms0eW+khIfALtmbaQoVTaF2xV4bnC/Y0z
 77E=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 30/49] Input: atmel_mxt_ts - implement improved debug message interface
Date:   Tue, 17 Sep 2019 18:40:31 +0900
Message-ID: <20190917094050.18771-2-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190917094050.18771-1-jiada_wang@mentor.com>
References: <20190917094050.18771-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit 078569c13c88dcb6f8d882bfe17168587712df7d)
[gdavis: Resolve forward port conflicts due to v4.14.51 commit
	 960fe000b1d3 ("Input: atmel_mxt_ts - fix the firmware
	 update").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
[gdavis: Squash fixes from Dirk Behme:
	 - Input: atmel_mxt_ts - add missing unlock in error path
	 - Input: atmel_mxt_ts - add missing unlock in error path
	 - Input: atmel_mxt_ts - call mxt_debug_msg_remove() in error path
	 - Input: atmel_mxt_ts - protect debug_v2_enabled by mutex
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
[gdavis: Squash fix from Vladimir Zapolskiy:
	 - Input: atmel_mxt_ts - simplify debug_msg binary attribute
	   handling]
Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
Notes:
- Squash fixes from Dirk Behme:
  + Input: atmel_mxt_ts - add missing unlock in error path

    Unlock the mutex in case the function is exited in the error case.
  + Input: atmel_mxt_ts - add missing unlock in error path
  + Input: atmel_mxt_ts - protect debug_v2_enabled by mutex

    Put the modification of debug_v2_enabled into the protected section.
    Same as in mxt_debug_msg_enable().
  + Input: atmel_mxt_ts - call mxt_debug_msg_remove() in error path

    Add the missing mxt_debug_msg_remove() to the error path.
- Squash fix from Vladimir Zapolskiy:
  + Input: atmel_mxt_ts - simplify debug_msg binary attribute handling

    The change introduces several updates, but all of them are related to
    "debug_msg" binary attribute:

    * removed dynamic initialization of data->debug_msg_attr
    * removed mxt_debug_msg_write callback
    * removed wrong check in mxt_debug_msg_remove()
    * mxt_debug_msg_remove() now is not called from mxt_free_object_table()
      avoiding multiple double deallocations.

[jiada: Add NULL check for sysfs attribute debug_msg_attr]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 194 ++++++++++++++++++++++-
 1 file changed, 192 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 7cc127a529fc..b3152aaaed63 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -242,6 +242,8 @@ enum t100_type {
 
 #define MXT_PIXELS_PER_MM	20
 
+#define DEBUG_MSG_MAX		200
+
 struct mxt_info {
 	u8 family_id;
 	u8 variant_id;
@@ -336,6 +338,11 @@ struct mxt_data {
 	u8 t100_aux_area;
 	u8 t100_aux_vect;
 	bool debug_enabled;
+	bool debug_v2_enabled;
+	u8 *debug_msg_data;
+	u16 debug_msg_count;
+	struct bin_attribute *debug_msg_attr;
+	struct mutex debug_msg_lock;
 	u8 max_reportid;
 	u32 config_crc;
 	u32 info_crc;
@@ -468,6 +475,144 @@ static void mxt_dump_message(struct mxt_data *data, u8 *message)
 		       data->T5_msg_size, message);
 }
 
+static void mxt_debug_msg_enable(struct mxt_data *data)
+{
+	struct device *dev = &data->client->dev;
+
+	if (data->debug_v2_enabled)
+		return;
+
+	mutex_lock(&data->debug_msg_lock);
+
+	data->debug_msg_data = kcalloc(DEBUG_MSG_MAX,
+				data->T5_msg_size, GFP_KERNEL);
+	if (!data->debug_msg_data) {
+		mutex_unlock(&data->debug_msg_lock);
+		return;
+	}
+
+	data->debug_v2_enabled = true;
+	mutex_unlock(&data->debug_msg_lock);
+
+	dev_dbg(dev, "Enabled message output\n");
+}
+
+static void mxt_debug_msg_disable(struct mxt_data *data)
+{
+	struct device *dev = &data->client->dev;
+
+	if (!data->debug_v2_enabled)
+		return;
+
+	mutex_lock(&data->debug_msg_lock);
+
+	data->debug_v2_enabled = false;
+
+	kfree(data->debug_msg_data);
+	data->debug_msg_data = NULL;
+	data->debug_msg_count = 0;
+	mutex_unlock(&data->debug_msg_lock);
+	dev_dbg(dev, "Disabled message output\n");
+}
+
+static void mxt_debug_msg_add(struct mxt_data *data, u8 *msg)
+{
+	struct device *dev = &data->client->dev;
+
+	mutex_lock(&data->debug_msg_lock);
+
+	if (!data->debug_msg_data) {
+		mutex_unlock(&data->debug_msg_lock);
+		dev_err(dev, "No buffer!\n");
+		return;
+	}
+
+	if (data->debug_msg_count < DEBUG_MSG_MAX) {
+		memcpy(data->debug_msg_data +
+		       data->debug_msg_count * data->T5_msg_size,
+		       msg,
+		       data->T5_msg_size);
+		data->debug_msg_count++;
+	} else {
+		dev_dbg(dev, "Discarding %u messages\n", data->debug_msg_count);
+		data->debug_msg_count = 0;
+	}
+
+	mutex_unlock(&data->debug_msg_lock);
+
+	sysfs_notify(&data->client->dev.kobj, NULL, "debug_notify");
+}
+
+static ssize_t mxt_debug_msg_read(struct file *filp, struct kobject *kobj,
+	struct bin_attribute *bin_attr, char *buf, loff_t off, size_t bytes)
+{
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct mxt_data *data = dev_get_drvdata(dev);
+	int count;
+	size_t bytes_read;
+
+	if (!data->debug_msg_data) {
+		dev_err(dev, "No buffer!\n");
+		return 0;
+	}
+
+	count = bytes / data->T5_msg_size;
+
+	if (count > DEBUG_MSG_MAX)
+		count = DEBUG_MSG_MAX;
+
+	mutex_lock(&data->debug_msg_lock);
+
+	if (count > data->debug_msg_count)
+		count = data->debug_msg_count;
+
+	bytes_read = count * data->T5_msg_size;
+
+	memcpy(buf, data->debug_msg_data, bytes_read);
+	data->debug_msg_count = 0;
+
+	mutex_unlock(&data->debug_msg_lock);
+
+	return bytes_read;
+}
+
+static struct bin_attribute debug_msg_attr = {
+	.attr = {
+		.name = "debug_msg",
+		.mode = 0444,
+	},
+	.read = mxt_debug_msg_read,
+};
+
+static int mxt_debug_msg_init(struct mxt_data *data)
+{
+	/*
+	 * Binary attribute is not used in callback, removal is done by name,
+	 * so it is safe to update a single struct bin_attribute entity
+	 */
+	debug_msg_attr.size = data->T5_msg_size * DEBUG_MSG_MAX;
+
+	if (sysfs_create_bin_file(&data->client->dev.kobj,
+				  &debug_msg_attr) < 0) {
+		dev_err(&data->client->dev, "Failed to create %s\n",
+			debug_msg_attr.attr.name);
+		return -EINVAL;
+	}
+
+	data->debug_msg_attr = &debug_msg_attr;
+
+	return 0;
+}
+
+static void mxt_debug_msg_remove(struct mxt_data *data)
+{
+	if (data->debug_msg_attr) {
+		sysfs_remove_bin_file(&data->client->dev.kobj,
+				      data->debug_msg_attr);
+		data->debug_msg_attr = NULL;
+	}
+}
+
 static int mxt_wait_for_completion(struct mxt_data *data,
 				   struct completion *comp,
 				   unsigned int timeout_ms)
@@ -1259,6 +1404,9 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 	if (dump)
 		mxt_dump_message(data, message);
 
+	if (data->debug_v2_enabled)
+		mxt_debug_msg_add(data, message);
+
 	return 1;
 }
 
@@ -2677,6 +2825,10 @@ static int mxt_initialize(struct mxt_data *data)
 	if (error)
 		return error;
 
+	error = mxt_debug_msg_init(data);
+	if (error)
+		goto err_free_sysfs;
+
 	if (data->cfg_name) {
 		error = request_firmware_nowait(THIS_MODULE, true,
 						data->cfg_name,
@@ -2686,16 +2838,18 @@ static int mxt_initialize(struct mxt_data *data)
 		if (error) {
 			dev_err(&client->dev, "Failed to invoke firmware loader: %d\n",
 				error);
-			goto err_free_sysfs;
+			goto err_free_dbg_msg;
 		}
 	} else {
 		error = mxt_configure_objects(data, NULL);
 		if (error)
-			goto err_free_sysfs;
+			goto err_free_dbg_msg;
 	}
 
 	return 0;
 
+err_free_dbg_msg:
+	mxt_debug_msg_remove(data);
 err_free_sysfs:
 	mxt_sysfs_remove(data);
 	return error;
@@ -3357,6 +3511,7 @@ static int mxt_enter_bootloader(struct mxt_data *data)
 			return ret;
 
 		data->in_bootloader = true;
+		mxt_debug_msg_remove(data);
 		mxt_sysfs_remove(data);
 		mxt_free_input_device(data);
 		mxt_free_object_table(data);
@@ -3540,6 +3695,34 @@ static ssize_t mxt_debug_enable_show(struct device *dev,
 	return scnprintf(buf, PAGE_SIZE, "%c\n", c);
 }
 
+static ssize_t mxt_debug_notify_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "0\n");
+}
+
+static ssize_t mxt_debug_v2_enable_store(struct device *dev,
+	struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	u8 i;
+	ssize_t ret;
+
+	if (kstrtou8(buf, 0, &i) == 0 && i < 2) {
+		if (i == 1)
+			mxt_debug_msg_enable(data);
+		else
+			mxt_debug_msg_disable(data);
+
+		ret = count;
+	} else {
+		dev_dbg(dev, "debug_enabled write error\n");
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
 static ssize_t mxt_debug_enable_store(struct device *dev,
 	struct device_attribute *attr, const char *buf, size_t count)
 {
@@ -3578,6 +3761,9 @@ static DEVICE_ATTR(update_cfg, S_IWUSR, NULL, mxt_update_cfg_store);
 static DEVICE_ATTR(config_crc, S_IRUGO, mxt_config_crc_show, NULL);
 static DEVICE_ATTR(debug_enable, S_IWUSR | S_IRUSR, mxt_debug_enable_show,
 		   mxt_debug_enable_store);
+static DEVICE_ATTR(debug_v2_enable, S_IWUSR | S_IRUSR, NULL,
+		   mxt_debug_v2_enable_store);
+static DEVICE_ATTR(debug_notify, S_IRUGO, mxt_debug_notify_show, NULL);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
@@ -3586,6 +3772,8 @@ static struct attribute *mxt_attrs[] = {
 	&dev_attr_update_cfg.attr,
 	&dev_attr_config_crc.attr,
 	&dev_attr_debug_enable.attr,
+	&dev_attr_debug_v2_enable.attr,
+	&dev_attr_debug_notify.attr,
 	NULL
 };
 
@@ -3875,6 +4063,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	init_completion(&data->chg_completion);
 	init_completion(&data->reset_completion);
 	init_completion(&data->crc_completion);
+	mutex_init(&data->debug_msg_lock);
 
 	data->suspend_mode = dmi_check_system(chromebook_T9_suspend_dmi) ?
 		MXT_SUSPEND_T9_CTRL : MXT_SUSPEND_DEEP_SLEEP;
@@ -3933,6 +4122,7 @@ static int mxt_remove(struct i2c_client *client)
 
 	disable_irq(data->irq);
 	sysfs_remove_group(&client->dev.kobj, &mxt_fw_attr_group);
+	mxt_debug_msg_remove(data);
 	mxt_sysfs_remove(data);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
-- 
2.19.2

