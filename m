Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 748918FE3E
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbfHPIjO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:39:14 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:42050 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727478AbfHPIjB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:39:01 -0400
IronPort-SDR: b8lMd1Nm5w/9/nW1OpxPT4lXXzuUeI8QIRi1t5VHBwAwga6GNWZhUDgOLp7dOgfPVcVr+Qu1Ld
 F2GrtN2XqtO+4Ourq7j3qclYjhBNNSzE3PzepqKHollgryDiKweKES5uV/WMH3In5PhXFoQpq3
 yFREa4wA5Faf4oqCB2e/3jkNla+9p+hs3U5+Xrv4HVAfcSdH22+/H2b98aiYCTYHjrnBTw59pd
 Zmk1UazzaQyCD5JvTdgj6ltTlFwnehADxCeC//3phr+5PoD2JPC/2xOs+QJjtXQkdfLzeXxE/7
 GbY=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40507261"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:39:00 -0800
IronPort-SDR: IlZL1vsqFJNmAi4VrJ9Um0lLPLfHLgClgIXvK8O2IkGFH2Kll35/g71yG6nDWbGBPnoIeVwHd/
 Y6GM9Gf4QM7FMHX0zpBCn35gHtjBHCHBvs7Ykc/s9E03vNtvyzOltdbRXdM8yzAXprgFRp5N2H
 D9TwuoXJrZP7VFowv+uUGqAaVLfEPb/o1E9zra5QkrxXsIKl5aw3FLFxPABl4g2Zs76bpEIaks
 rUvtezlVd1WhWypEZ36+MIWgvyv3IF18AgIvocwQdDHkzRk2NAe+5Gz8dcQotss9YbVPyjjMN1
 lpo=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 62/63] Input: atmel_mxt_ts: Implement synchronization during various operation
Date:   Fri, 16 Aug 2019 17:39:01 +0900
Message-ID: <20190816083902.19659-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083902.19659-1-jiada_wang@mentor.com>
References: <20190816083902.19659-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-09.mgc.mentorg.com (147.34.90.209) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
index 1179f90a8077..6e5fad91c379 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -224,6 +224,7 @@ enum t100_type {
 #define MXT_POWERON_DELAY	150	/* msec */
 #define MXT_BOOTLOADER_WAIT	36E5	/* 1 minute */
 #define MXT_WATCHDOG_TIMEOUT	1000	/* msec */
+#define MXT_CONFIG_TIMEOUT	1000	/* msec */
 
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
@@ -427,8 +442,7 @@ struct mxt_data {
 	/* Indicates whether device is in suspend */
 	bool suspended;
 
-	/* Indicates whether device is updating configuration */
-	bool updating_config;
+	struct mutex lock;
 
 	unsigned long gpio_input_pin_status;
 	struct attribute_group gpio_attrs;
@@ -436,6 +450,11 @@ struct mxt_data {
 	unsigned int mtu;
 
 	bool t25_status;
+
+	/* State handling for probe/remove, open/close and config update */
+	enum device_state e_state;
+
+	struct completion update_cfg_completion;
 };
 
 struct mxt_gpio_attr {
@@ -1664,6 +1683,7 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 	struct mxt_data *data = dev_id;
 	int ret;
 
+	mutex_lock(&data->lock);
 	data->mxt_status.intp_triggered = true;
 
 	if (data->in_bootloader) {
@@ -1691,6 +1711,8 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 
 exit:
 	data->mxt_status.intp_triggered = false;
+	mutex_unlock(&data->lock);
+
 	return ret;
 }
 
@@ -2275,6 +2297,8 @@ static void mxt_free_object_table(struct mxt_data *data)
 	video_unregister_device(&data->dbg.vdev);
 	v4l2_device_unregister(&data->dbg.v4l2);
 #endif
+	mutex_lock(&data->lock);
+
 	data->object_table = NULL;
 	kfree(data->info);
 	data->info = NULL;
@@ -2304,6 +2328,8 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T100_reportid_min = 0;
 	data->T100_reportid_max = 0;
 	data->max_reportid = 0;
+
+	mutex_unlock(&data->lock);
 }
 
 static int mxt_parse_object_table(struct mxt_data *data,
@@ -2995,8 +3021,15 @@ static int mxt_configure_objects(struct mxt_data *data,
 
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
@@ -3109,6 +3142,15 @@ static int mxt_initialize(struct mxt_data *data)
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
@@ -3888,30 +3930,58 @@ static int mxt_update_file_name(struct device *dev, char **file_name,
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
@@ -3919,14 +3989,38 @@ static ssize_t mxt_update_cfg_store(struct device *dev,
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
@@ -3934,8 +4028,6 @@ static ssize_t mxt_update_cfg_store(struct device *dev,
 		goto out;
 	}
 
-	data->updating_config = true;
-
 	mxt_free_input_device(data);
 
 	if (data->suspended) {
@@ -3951,15 +4043,8 @@ static ssize_t mxt_update_cfg_store(struct device *dev,
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
 
@@ -4296,8 +4381,17 @@ static int mxt_start(struct mxt_data *data)
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
@@ -4341,8 +4435,12 @@ static int mxt_start(struct mxt_data *data)
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
@@ -4351,8 +4449,19 @@ static int mxt_stop(struct mxt_data *data)
 {
 	int ret;
 
-	if (data->suspended || data->in_bootloader || data->updating_config)
+	mutex_lock(&data->lock);
+	if (data->suspended) {
+		mutex_unlock(&data->lock);
 		return 0;
+	}
+	if (data->in_bootloader || (data->e_state != MXT_STATE_READY &&
+		data->e_state != MXT_STATE_GOING_AWAY)) {
+		mutex_unlock(&data->lock);
+		return -EBUSY;
+	}
+	if (data->e_state != MXT_STATE_GOING_AWAY)
+		data->e_state = MXT_STATE_STOP;
+	mutex_unlock(&data->lock);
 
 	switch (data->suspend_mode) {
 	case MXT_SUSPEND_T9_CTRL:
@@ -4382,8 +4491,15 @@ static int mxt_stop(struct mxt_data *data)
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
@@ -4637,6 +4753,8 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	snprintf(data->phys, sizeof(data->phys), "i2c-%u-%04x/input0",
 		 client->adapter->nr, client->addr);
 
+	mutex_init(&data->lock);
+
 	irq_set_status_flags(client->irq, IRQ_DISABLE_UNLAZY);
 
 	data->client = client;
@@ -4645,6 +4763,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	init_completion(&data->chg_completion);
 	init_completion(&data->reset_completion);
 	init_completion(&data->crc_completion);
+	init_completion(&data->update_cfg_completion);
 	mutex_init(&data->debug_msg_lock);
 
 	data->suspend_mode = dmi_check_system(chromebook_T9_suspend_dmi) ?
@@ -4743,6 +4862,18 @@ static int mxt_remove(struct i2c_client *client)
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
@@ -4801,6 +4932,45 @@ static int __maybe_unused mxt_resume(struct device *dev)
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
2.19.2

