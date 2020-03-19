Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9B318BA3E
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728591AbgCSPDn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:03:43 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:32457 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728576AbgCSPDn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:03:43 -0400
IronPort-SDR: 8EdNT4LMhqbCE+UKbRyFklJQsocCOKv41P3kMFFIwJoPvasFUSJc7sluaYN5ZNJtOCq3iUzCYh
 Nxd2WnbyRLx+bLGGE2S1s1dfjbzCfPuh1HNfKtiY/zXMI+0TXer+wmtzR9nuhfpHjkj9sLqLE8
 +fcKyil5FdPZlVDp1At90rrbGg3KOUECgxqiHXEUxzfLgaDOCIe2FDgKibagsfTztcELCmzUYD
 oi8WtB8Efs1l0BakCd9nJ2BakDF2UPsqMA9koEmfFHyR4/Ttl6S2c2qKU0sj1/iBzUHcI01NDX
 rKQ=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="46891167"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:03:42 -0800
IronPort-SDR: iMU4atmCqg4P80U8gohvrIEsXNe4By47tvZEipzNmqn5zUuI0pds3Ac28hhHW1LLNonI9Z9vWW
 XJ/HrH2j/pjMsPDwzNMch3qIBBT4MmGgH32eMJbW+mi5Tq505TlNRzY0mlkLILDoNDBlfVPd2N
 HuF+DY7iIX/B0aAPmdDDx8aqMe3Q07OYYXts+E0meCWif0be3Xd5tCj5rDNxeMxP8SBVPJBz7i
 hgCTvgxwvGqsyl+sBytu8SfI9KlEeUKW/hPTlXzK9Ygn3Av49D9Vsr7PeQ/uiTz8Mr45RNeemO
 Fww=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 51/52] Input: atmel_mxt_ts: Implement synchronization during various operation
Date:   Thu, 19 Mar 2020 08:00:15 -0700
Message-ID: <20200319150016.61398-52-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Sanjeev Chugh <sanjeev_chugh@mentor.com>

There could be scope of race conditions when sysfs is being handled
and at the same time, device removal is occurring. For example,
we don't want the device removal to begin if the Atmel device
cfg update is going on or firmware update is going on. In such
cases, wait for device update to be completed before the removal
continues.

    Thread                                          Thread 2:
=========================                       =========================
mxt_update_fw_store()                           mxt_remove()
mutex_lock(&data->lock)                         ...
mxt_initialize()                                //Tries to acquire lock
  request_firmware_nowait()                     mutex_lock(&data->lock)
...                                             ==>waits for lock()
...                                             .
...                                             .
mutex_unlock(&data->lock)                       .
                                                //Gets lock and proceeds
                                                mxt_free_input_device();
                                                ...
                                                mutex_unlock(&data->lock)
                                                //Frees atmel driver data
                                                kfree(data)

If the request_firmware_nowait() completes after the driver removal,
and callback is triggered. But kernel crashes since the module is
already removed.

This commit adds state machine to serialize such scenarios.

Signed-off-by: Sanjeev Chugh <sanjeev_chugh@mentor.com>
Signed-off-by: Bhuvanesh Surachari <bhuvanesh_surachari@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 222 ++++++++++++++++++++---
 1 file changed, 196 insertions(+), 26 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 50b3cc194196..a8e80e77624d 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -224,6 +224,7 @@ enum t100_type {
 #define MXT_POWERON_DELAY	150	/* msec */
 #define MXT_BOOTLOADER_WAIT	36E5	/* 1 minute */
 #define MXT_WATCHDOG_TIMEOUT	1000	/* msec */
+#define MXT_CONFIG_TIMEOUT	36E5	/* msec */
 
 /* Command to unlock bootloader */
 #define MXT_UNLOCK_CMD_MSB	0xaa
@@ -247,6 +248,20 @@ enum t100_type {
 
 #define DEBUG_MSG_MAX		200
 
+enum device_state {
+	MXT_STATE_READY,
+	MXT_STATE_UPDATING_CONFIG,
+	MXT_STATE_UPDATING_CONFIG_ASYNC,
+	MXT_STATE_START,
+	MXT_STATE_STOP,
+	MXT_STATE_GOING_AWAY
+};
+
+enum mxt_cmd {
+	UPDATE_CFG,
+	UPDATE_FW
+};
+
 struct mxt_info {
 	u8 family_id;
 	u8 variant_id;
@@ -426,11 +441,15 @@ struct mxt_data {
 	/* Indicates whether device is in suspend */
 	bool suspended;
 
-	/* Indicates whether device is updating configuration */
-	bool updating_config;
+	struct mutex lock;
 
 	unsigned int mtu;
 	bool t25_status;
+
+	/* State handling for probe/remove, open/close and config update */
+	enum device_state e_state;
+
+	struct completion update_cfg_completion;
 };
 
 struct mxt_vb2_buffer {
@@ -1654,6 +1673,7 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 	struct mxt_data *data = dev_id;
 	int ret;
 
+	mutex_lock(&data->lock);
 	data->mxt_status.intp_triggered = true;
 
 	if (data->in_bootloader) {
@@ -1681,6 +1701,8 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 
 exit:
 	data->mxt_status.intp_triggered = false;
+	mutex_unlock(&data->lock);
+
 	return ret;
 }
 
@@ -2263,6 +2285,8 @@ static void mxt_free_object_table(struct mxt_data *data)
 	video_unregister_device(&data->dbg.vdev);
 	v4l2_device_unregister(&data->dbg.v4l2);
 #endif
+	mutex_lock(&data->lock);
+
 	data->object_table = NULL;
 	kfree(data->info);
 	data->info = NULL;
@@ -2292,6 +2316,8 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T100_reportid_min = 0;
 	data->T100_reportid_max = 0;
 	data->max_reportid = 0;
+
+	mutex_unlock(&data->lock);
 }
 
 static int mxt_parse_object_table(struct mxt_data *data,
@@ -2973,8 +2999,15 @@ static int mxt_configure_objects(struct mxt_data *data,
 
 static void mxt_config_cb(const struct firmware *cfg, void *ctx)
 {
+	struct mxt_data *data = ctx;
+
 	mxt_configure_objects(ctx, cfg);
 	release_firmware(cfg);
+	complete(&data->update_cfg_completion);
+	mutex_lock(&data->lock);
+	if (data->e_state != MXT_STATE_GOING_AWAY)
+		data->e_state = MXT_STATE_READY;
+	mutex_unlock(&data->lock);
 }
 
 static int mxt_bootloader_status(struct mxt_data *data)
@@ -3090,6 +3123,15 @@ static int mxt_initialize(struct mxt_data *data)
 		goto err_free_sysfs;
 
 	if (data->cfg_name) {
+		mutex_lock(&data->lock);
+		if (data->e_state != MXT_STATE_GOING_AWAY) {
+			data->e_state = MXT_STATE_UPDATING_CONFIG_ASYNC;
+		} else {
+			mutex_unlock(&data->lock);
+			return -EBUSY;
+		}
+		reinit_completion(&data->update_cfg_completion);
+		mutex_unlock(&data->lock);
 		error = request_firmware_nowait(THIS_MODULE, true,
 						data->cfg_name,
 						&client->dev,
@@ -3869,30 +3911,58 @@ static int mxt_update_file_name(struct device *dev, char **file_name,
 	return 0;
 }
 
+static int mxt_process_operation(struct mxt_data *data,
+				 enum mxt_cmd cmd,
+				 void *cmd_data);
+
 static ssize_t mxt_update_fw_store(struct device *dev,
-					struct device_attribute *attr,
-					const char *buf, size_t count)
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
 {
 	struct mxt_data *data = dev_get_drvdata(dev);
+	char *filename = NULL;
+	int ret;
+
+	ret = mxt_update_file_name(dev, &filename, buf, count);
+	if (ret)
+		goto out;
+
+	ret = mxt_process_operation(data, UPDATE_FW, filename);
+	kfree(filename);
+
+	if (ret)
+		goto out;
+
+	return count;
+out:
+	return ret;
+}
+
+static int mxt_fw_update(struct mxt_data *data,
+			 const char *filename)
+{
+	struct device *dev = &data->client->dev;
+	unsigned int len = 0;
 	int error;
 
-	error = mxt_update_file_name(dev, &data->fw_name, buf, count);
+	len = strlen(filename);
+	error = mxt_update_file_name(dev, &data->fw_name, filename, len);
 	if (error)
 		return error;
 
 	error = mxt_load_fw(dev);
 	if (error) {
 		dev_err(dev, "The firmware update failed(%d)\n", error);
-		count = error;
-	} else {
-		dev_info(dev, "The firmware update succeeded\n");
-
-		error = mxt_initialize(data);
-		if (error)
-			return error;
+		return error;
 	}
 
-	return count;
+	error = mxt_initialize(data);
+	if (error)
+		return error;
+
+	dev_info(dev, "The firmware update succeeded\n");
+
+	return error;
 }
 
 static ssize_t mxt_update_cfg_store(struct device *dev,
@@ -3900,14 +3970,38 @@ static ssize_t mxt_update_cfg_store(struct device *dev,
 		const char *buf, size_t count)
 {
 	struct mxt_data *data = dev_get_drvdata(dev);
+	char *filename = NULL;
+	int ret;
+
+	ret = mxt_update_file_name(dev, &filename, buf, count);
+	if (ret)
+		goto out;
+
+	ret = mxt_process_operation(data, UPDATE_CFG, filename);
+	kfree(filename);
+
+	if (ret)
+		goto out;
+
+	return count;
+out:
+	return ret;
+}
+
+static int mxt_cfg_update(struct mxt_data *data,
+			  char *filename)
+{
+	struct device *dev = &data->client->dev;
 	const struct firmware *cfg;
+	unsigned int len = 0;
 	int ret;
 
-	ret = mxt_update_file_name(dev, &data->cfg_name, buf, count);
+	len = strlen(filename);
+	ret = mxt_update_file_name(dev, &data->cfg_name, filename, len);
 	if (ret)
 		return ret;
 
-	ret = request_firmware(&cfg, data->cfg_name, dev);
+	ret = request_firmware(&cfg, data->cfg_name, &data->client->dev);
 	if (ret < 0) {
 		dev_err(dev, "Failure to request config file %s\n",
 			data->cfg_name);
@@ -3915,8 +4009,6 @@ static ssize_t mxt_update_cfg_store(struct device *dev,
 		goto out;
 	}
 
-	data->updating_config = true;
-
 	mxt_free_input_device(data);
 
 	if (data->suspended) {
@@ -3932,15 +4024,8 @@ static ssize_t mxt_update_cfg_store(struct device *dev,
 	}
 
 	ret = mxt_configure_objects(data, cfg);
-	if (ret)
-		goto release;
-
-	ret = count;
-
-release:
 	release_firmware(cfg);
 out:
-	data->updating_config = false;
 	return ret;
 }
 
@@ -4204,8 +4289,17 @@ static int mxt_start(struct mxt_data *data)
 {
 	int ret = 0;
 
-	if (!data->suspended || data->in_bootloader)
+	mutex_lock(&data->lock);
+	if (!data->suspended) {
+		mutex_unlock(&data->lock);
 		return 0;
+	}
+	if (data->in_bootloader || data->e_state != MXT_STATE_READY) {
+		mutex_unlock(&data->lock);
+		return -EBUSY;
+	}
+	data->e_state = MXT_STATE_START;
+	mutex_unlock(&data->lock);
 
 	switch (data->suspend_mode) {
 	case MXT_SUSPEND_T9_CTRL:
@@ -4249,8 +4343,12 @@ static int mxt_start(struct mxt_data *data)
 		ret = mxt_acquire_irq(data);
 	}
 
+	mutex_lock(&data->lock);
 	if (!ret)
 		data->suspended = false;
+	if (data->e_state != MXT_STATE_GOING_AWAY)
+		data->e_state = MXT_STATE_READY;
+	mutex_unlock(&data->lock);
 
 	return ret;
 }
@@ -4259,8 +4357,19 @@ static int mxt_stop(struct mxt_data *data)
 {
 	int ret;
 
-	if (data->suspended || data->in_bootloader || data->updating_config)
+	mutex_lock(&data->lock);
+	if (data->suspended || data->e_state == MXT_STATE_UPDATING_CONFIG) {
+		mutex_unlock(&data->lock);
 		return 0;
+	}
+	if ((data->e_state != MXT_STATE_READY &&
+	     data->e_state != MXT_STATE_GOING_AWAY)) {
+		mutex_unlock(&data->lock);
+		return -EBUSY;
+	}
+	if (data->e_state != MXT_STATE_GOING_AWAY)
+		data->e_state = MXT_STATE_STOP;
+	mutex_unlock(&data->lock);
 
 	switch (data->suspend_mode) {
 	case MXT_SUSPEND_T9_CTRL:
@@ -4290,8 +4399,15 @@ static int mxt_stop(struct mxt_data *data)
 		break;
 	}
 
+	mutex_lock(&data->lock);
 	data->suspended = true;
+
+	if (data->e_state != MXT_STATE_GOING_AWAY)
+		data->e_state = MXT_STATE_READY;
+	mutex_unlock(&data->lock);
+
 	return 0;
+
 }
 
 static int mxt_input_open(struct input_dev *dev)
@@ -4446,12 +4562,15 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	snprintf(data->phys, sizeof(data->phys), "i2c-%u-%04x/input0",
 		 client->adapter->nr, client->addr);
 
+	mutex_init(&data->lock);
+
 	data->client = client;
 	i2c_set_clientdata(client, data);
 
 	init_completion(&data->chg_completion);
 	init_completion(&data->reset_completion);
 	init_completion(&data->crc_completion);
+	init_completion(&data->update_cfg_completion);
 	mutex_init(&data->debug_msg_lock);
 
 	data->suspend_mode = dmi_check_system(chromebook_T9_suspend_dmi) ?
@@ -4545,6 +4664,18 @@ static int mxt_remove(struct i2c_client *client)
 {
 	struct mxt_data *data = i2c_get_clientdata(client);
 
+	mutex_lock(&data->lock);
+	if (data->e_state == MXT_STATE_UPDATING_CONFIG_ASYNC ||
+	    data->e_state == MXT_STATE_UPDATING_CONFIG) {
+		data->e_state = MXT_STATE_GOING_AWAY;
+		mutex_unlock(&data->lock);
+		mxt_wait_for_completion(data, &data->update_cfg_completion,
+					MXT_CONFIG_TIMEOUT);
+	} else {
+		data->e_state = MXT_STATE_GOING_AWAY;
+		mutex_unlock(&data->lock);
+	}
+
 	disable_irq(data->irq);
 	sysfs_remove_group(&client->dev.kobj, &mxt_fw_attr_group);
 	if (data->reset_gpio) {
@@ -4605,6 +4736,45 @@ static int __maybe_unused mxt_resume(struct device *dev)
 	return ret;
 }
 
+static int mxt_process_operation(struct mxt_data *data,
+				 enum mxt_cmd cmd,
+				 void *cmd_data)
+{
+	int ret = 0;
+
+	mutex_lock(&data->lock);
+	if (data->e_state != MXT_STATE_READY) {
+		mutex_unlock(&data->lock);
+		dev_err(&data->client->dev, "Atmel touch device is shutting down\n");
+		return -EBUSY;
+	}
+	data->e_state = MXT_STATE_UPDATING_CONFIG;
+	reinit_completion(&data->update_cfg_completion);
+	mutex_unlock(&data->lock);
+
+	switch (cmd) {
+	case UPDATE_CFG:
+	case UPDATE_FW:
+		if (cmd == UPDATE_CFG)
+			ret = mxt_cfg_update(data, (char *)cmd_data);
+		else
+			ret = mxt_fw_update(data, (char *)cmd_data);
+		break;
+
+	default:
+		break;
+	}
+	mutex_lock(&data->lock);
+	if (data->e_state != MXT_STATE_UPDATING_CONFIG_ASYNC) {
+		complete(&data->update_cfg_completion);
+		if (data->e_state != MXT_STATE_GOING_AWAY)
+			data->e_state = MXT_STATE_READY;
+	}
+	mutex_unlock(&data->lock);
+
+	return ret;
+}
+
 static SIMPLE_DEV_PM_OPS(mxt_pm_ops, mxt_suspend, mxt_resume);
 
 static const struct of_device_id mxt_of_match[] = {
-- 
2.17.1

