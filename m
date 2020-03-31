Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8935619945A
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730528AbgCaKyX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:54:23 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:28112 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731056AbgCaKyV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:54:21 -0400
IronPort-SDR: laN6siMmlOp0il+oLCd/zh4lTib7R/M1i65hp6TdgTEK8otlCqD/ktChdX+QUPPa95SS0NnGus
 HnrwAtZnDTGEBW4kPX2425Mav39uRyNdl/xkh0ETnD1r/MVM1iWdbkn0Iu9gJqkRkHJPTWFw+1
 Rrf0kLXZI7PL4Cc9lA0mEJaozVQosC7KyK4hkyWnQXdNTozinh2cMDNJ11GNaZanDkubXvVTFq
 Z1a/sbrkGd2pn+oahIz4gQv7m1DfG/Wm8K2MRw1psd7Am+ZmbDH6c6fcrFIu3dw2t6wCEL6mGX
 jhg=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47293541"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:54:20 -0800
IronPort-SDR: gIw/0vBCAW3VZsTW0GdsUuyetY9RyVxnK2P6gk5mluxSCj3fsjaTs+BHSEQYClISC8tQDHSxvf
 sySeZYzc9Z2THrnv7pfxAhmKYsRHxP0p9uxpOQGhwCwIcCiAKbUssi66PtX0X0D86ZmEkw+TLe
 UB7wvDLgCVZrmfNCgIGgxEKoc7m2qO54I7DOwPimEFvx6NV5u4qKfvnxwvbv4Oc097tEO9ykk7
 BMJXWDJNxBnIqXrjR3Qbxa76jqxldNI1GdxJyXER2Zrv3HJMGzWo5cHjippA/9Yr6uOkSppqgx
 43Q=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 54/55] Input: atmel_mxt_ts: Implement synchronization during various operation
Date:   Tue, 31 Mar 2020 03:50:50 -0700
Message-ID: <20200331105051.58896-55-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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
 drivers/input/touchscreen/atmel_mxt_ts.c | 223 ++++++++++++++++++++---
 1 file changed, 198 insertions(+), 25 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 10d6726de9c4..d244d97d134e 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -223,6 +223,7 @@ enum t100_type {
 #define MXT_POWERON_DELAY	150	/* msec */
 #define MXT_BOOTLOADER_WAIT	36E5	/* 1 minute */
 #define MXT_WATCHDOG_TIMEOUT	1000	/* msec */
+#define MXT_CONFIG_TIMEOUT	36E5	/* msec */
 
 /* Command to unlock bootloader */
 #define MXT_UNLOCK_CMD_MSB	0xaa
@@ -249,6 +250,20 @@ enum t100_type {
 #define MXT_DEBUG_STATE		false
 static bool debug_state = MXT_DEBUG_STATE;
 
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
@@ -427,11 +442,15 @@ struct mxt_data {
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
@@ -1638,6 +1657,7 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 	struct mxt_data *data = dev_id;
 	int ret;
 
+	mutex_lock(&data->lock);
 	data->mxt_status.intp_triggered = true;
 
 	if (data->in_bootloader) {
@@ -1665,6 +1685,8 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 
 exit:
 	data->mxt_status.intp_triggered = false;
+	mutex_unlock(&data->lock);
+
 	return ret;
 }
 
@@ -2247,6 +2269,8 @@ static void mxt_free_object_table(struct mxt_data *data)
 	video_unregister_device(&data->dbg.vdev);
 	v4l2_device_unregister(&data->dbg.v4l2);
 #endif
+	mutex_lock(&data->lock);
+
 	data->object_table = NULL;
 	kfree(data->info);
 	data->info = NULL;
@@ -2276,6 +2300,8 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T100_reportid_min = 0;
 	data->T100_reportid_max = 0;
 	data->max_reportid = 0;
+
+	mutex_unlock(&data->lock);
 }
 
 static int mxt_parse_object_table(struct mxt_data *data,
@@ -2957,8 +2983,15 @@ static int mxt_configure_objects(struct mxt_data *data,
 
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
@@ -2994,9 +3027,12 @@ static void mxt_watchdog_work(struct work_struct *work)
 	u16 info_buf;
 	int ret;
 
+	mutex_lock(&data->lock);
 	if (data->suspended || data->in_bootloader ||
-	    data->mxt_status.intp_triggered)
+	    data->mxt_status.intp_triggered) {
+		mutex_unlock(&data->lock);
 		goto sched_work;
+	}
 
 	ret = __mxt_read_reg(data->client, 0, sizeof(info_buf), &info_buf);
 
@@ -3066,6 +3102,15 @@ static int mxt_initialize(struct mxt_data *data)
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
@@ -3845,30 +3890,58 @@ static int mxt_update_file_name(struct device *dev, char **file_name,
 	return 0;
 }
 
+static int mxt_process_operation(struct mxt_data *data,
+				 enum mxt_cmd cmd,
+				 void *cmd_data);
+
 static ssize_t update_fw_store(struct device *dev,
 			       struct device_attribute *attr,
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
 
 static ssize_t update_cfg_store(struct device *dev,
@@ -3876,14 +3949,38 @@ static ssize_t update_cfg_store(struct device *dev,
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
@@ -3891,8 +3988,6 @@ static ssize_t update_cfg_store(struct device *dev,
 		goto out;
 	}
 
-	data->updating_config = true;
-
 	mxt_free_input_device(data);
 
 	if (data->suspended) {
@@ -3908,15 +4003,8 @@ static ssize_t update_cfg_store(struct device *dev,
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
 
@@ -4188,8 +4276,17 @@ static int mxt_start(struct mxt_data *data)
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
@@ -4233,8 +4330,12 @@ static int mxt_start(struct mxt_data *data)
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
@@ -4243,8 +4344,19 @@ static int mxt_stop(struct mxt_data *data)
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
@@ -4274,8 +4386,15 @@ static int mxt_stop(struct mxt_data *data)
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
@@ -4430,12 +4549,15 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
@@ -4527,6 +4649,18 @@ static int mxt_remove(struct i2c_client *client)
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
@@ -4587,6 +4721,45 @@ static int __maybe_unused mxt_resume(struct device *dev)
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

