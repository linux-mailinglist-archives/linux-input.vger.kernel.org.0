Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F66D1CA375
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 08:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgEHGAZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 02:00:25 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:38783 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728355AbgEHGAW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 02:00:22 -0400
IronPort-SDR: zRUYmsZZPSxNxX4Z50ro5AXViG/e1JaFQIaX9DK6RCxFMAnJNt1MHTH93Wml7YmHZCmBve8+yN
 pvfcPqIIoW0urVcPfYKz01U0YK9vUNOwvEx7B9MFGvxZtIc6uS+RnQM0snN1UpR0JkV1XiKFdW
 Fntez61FSwRV2zERtHqFk9IXfJ5ECVd0d7tQfM2eHdo2ZS6O0/l4swuPJK0blQC5Pii4Z0aCop
 HxZSE53HPtwAL3krKvB8S0urIvHgklD89WB9QjXdum9b2XqW9Bo9+DctYDKZCjnD/BT6u1xjeM
 jIM=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="50670183"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 07 May 2020 22:00:20 -0800
IronPort-SDR: gU4bK9ym6Z/u/E4F3DIAA+BkzjYHJZY4hrRF00RWyu7dn8A84IG+st+/o0HBUV+RBvI50Yacsf
 Dtv7EZzMCRONL9c6033y2rPZRMd/teW4APt7aN359taQvGkSjYL1KRy2PNTmNHs+RUIY7AZDXE
 vp3XfhoR6WsLRPdpZciJv1ZSOsNpuuhMeOO74mNiXWe8K0k1YP7BQFKtZaeTH2Eeq5oiveAsza
 ALZrBZHroqOIsRANmQL4CLhQERAjQahZ5s1TtVeJW11ME6G8Ep1cNdUFvT48om7Qjv01TkcRsn
 dUE=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 53/56] input: touchscreen: atmel_mxt_ts: Added sysfs entry for touchscreen status
Date:   Thu, 7 May 2020 22:56:53 -0700
Message-ID: <20200508055656.96389-54-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Naveen Chakka <Naveen.Chakka@in.bosch.com>

To know the current communication status of the touch controller during
runtime, sysfs interface is added

sysfs interface: /sys/class/i2c-dev/i2c-*/device/*/touch_dev_stat
Executing the above sysfs interface provides two output values

1)Status of the touch device
	value 0 represents device is inactive
	value 1 represents device is active
2)Error counter
	value represents the number of times device in inactive since last read

New module_param "debug_state" is introduced, by set its value,
a watchdog work is scheduled to periodically check device state.
default value is false.

Signed-off-by: Naveen Chakka <Naveen.Chakka@in.bosch.com>
Signed-off-by: Sanjeev Chugh <sanjeev_chugh@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 85 +++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 20d6ada778e5..5c2f4ea1a362 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -223,6 +223,7 @@ enum t100_type {
 #define MXT_CHG_DELAY		100	/* msec */
 #define MXT_POWERON_DELAY	150	/* msec */
 #define MXT_BOOTLOADER_WAIT	36E5	/* 1 minute */
+#define MXT_WATCHDOG_TIMEOUT	1000	/* msec */
 
 /* Command to unlock bootloader */
 #define MXT_UNLOCK_CMD_MSB	0xaa
@@ -246,6 +247,9 @@ enum t100_type {
 
 #define DEBUG_MSG_MAX		200
 
+#define MXT_DEBUG_STATE		false
+static bool debug_state = MXT_DEBUG_STATE;
+
 struct mxt_info {
 	u8 family_id;
 	u8 variant_id;
@@ -318,6 +322,11 @@ struct mxt_flash {
 	struct delayed_work work;
 };
 
+struct mxt_statusinfo {
+	bool dev_status;
+	u32 error_count;
+};
+
 /* Each client has this additional data */
 struct mxt_data {
 	struct i2c_client *client;
@@ -373,6 +382,8 @@ struct mxt_data {
 	const char *pcfg_name;
 	const char *input_name;
 	struct mxt_flash *flash;
+	struct delayed_work watchdog_work;
+	struct mxt_statusinfo mxt_status;
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -2956,6 +2967,26 @@ static int mxt_bootloader_status(struct mxt_data *data)
 	return 0;
 }
 
+static void mxt_watchdog_work(struct work_struct *work)
+{
+	struct mxt_data *data =
+		container_of(work, struct mxt_data, watchdog_work.work);
+	u16 info_buf;
+	int ret;
+
+	ret = __mxt_read_reg(data->client, 0, sizeof(info_buf), &info_buf);
+
+	if (ret) {
+		data->mxt_status.error_count++;
+		data->mxt_status.dev_status = false;
+	} else {
+		data->mxt_status.dev_status = true;
+	}
+
+	schedule_delayed_work(&data->watchdog_work,
+			      msecs_to_jiffies(MXT_WATCHDOG_TIMEOUT));
+}
+
 static int mxt_initialize(struct mxt_data *data)
 {
 	struct i2c_client *client = data->client;
@@ -3730,6 +3761,9 @@ static int mxt_load_fw(struct device *dev)
 	INIT_DELAYED_WORK(&data->flash->work, mxt_fw_work);
 	reinit_completion(&data->flash->flash_completion);
 
+	if (debug_state)
+		cancel_delayed_work_sync(&data->watchdog_work);
+
 	if (!data->in_bootloader) {
 		ret = mxt_enter_bootloader(data);
 		if (ret)
@@ -3749,6 +3783,9 @@ static int mxt_load_fw(struct device *dev)
 	cancel_delayed_work_sync(&data->flash->work);
 	data->in_bootloader = false;
 release_firmware:
+	if (debug_state)
+		schedule_delayed_work(&data->watchdog_work,
+				      msecs_to_jiffies(MXT_WATCHDOG_TIMEOUT));
 	release_firmware(data->flash->fw);
 free:
 	devm_kfree(dev, data->flash);
@@ -3936,6 +3973,22 @@ static const struct attribute_group mxt_fw_attr_group = {
 	.attrs = mxt_fw_attrs,
 };
 
+static ssize_t touch_dev_stat_show(struct device *dev, struct
+				   device_attribute * attr, char *buf)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (data->mxt_status.dev_status)
+		data->mxt_status.error_count = 0;
+
+	ret =  snprintf(buf, PAGE_SIZE, "%d %d\n", data->mxt_status.dev_status,
+			data->mxt_status.error_count);
+	/* clear the error counter once it is read */
+	data->mxt_status.error_count = 0;
+	return ret;
+}
+
 static DEVICE_ATTR_RO(fw_version);
 static DEVICE_ATTR_RO(hw_version);
 static DEVICE_ATTR_RO(object);
@@ -3945,6 +3998,7 @@ static DEVICE_ATTR_RW(debug_enable);
 static DEVICE_ATTR_RW(debug_v2_enable);
 static DEVICE_ATTR_RO(debug_notify);
 static DEVICE_ATTR_RW(t25_selftest);
+static DEVICE_ATTR_RO(touch_dev_stat);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
@@ -3956,6 +4010,7 @@ static struct attribute *mxt_attrs[] = {
 	&dev_attr_debug_v2_enable.attr,
 	&dev_attr_debug_notify.attr,
 	&dev_attr_t25_selftest.attr,
+	&dev_attr_touch_dev_stat.attr,
 	NULL
 };
 
@@ -4050,10 +4105,16 @@ static int mxt_start(struct mxt_data *data)
 		ret = mxt_acquire_irq(data);
 	}
 
-	if (!ret)
-		data->suspended = false;
+	if (ret)
+		return ret;
 
-	return ret;
+	if (debug_state)
+		schedule_delayed_work(&data->watchdog_work,
+				      msecs_to_jiffies(MXT_WATCHDOG_TIMEOUT));
+
+	data->suspended = false;
+
+	return 0;
 }
 
 static int mxt_stop(struct mxt_data *data)
@@ -4063,6 +4124,9 @@ static int mxt_stop(struct mxt_data *data)
 	if (data->suspended || data->in_bootloader || data->updating_config)
 		return 0;
 
+	if (debug_state)
+		cancel_delayed_work_sync(&data->watchdog_work);
+
 	switch (data->suspend_mode) {
 	case MXT_SUSPEND_T9_CTRL:
 		/* Touch disable */
@@ -4313,6 +4377,12 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		msleep(MXT_RESET_TIME);
 	}
 
+	if (debug_state) {
+		INIT_DELAYED_WORK(&data->watchdog_work, mxt_watchdog_work);
+		schedule_delayed_work(&data->watchdog_work,
+				      msecs_to_jiffies(MXT_WATCHDOG_TIMEOUT));
+	}
+
 	error = mxt_initialize(data);
 	if (error)
 		goto err_free_object;
@@ -4327,6 +4397,8 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	return 0;
 
 err_free_object:
+	if (debug_state)
+		cancel_delayed_work_sync(&data->watchdog_work);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
 	if (data->reset_gpio) {
@@ -4346,6 +4418,10 @@ static int mxt_remove(struct i2c_client *client)
 		sysfs_remove_link(&client->dev.kobj, "reset");
 		gpiod_unexport(data->reset_gpio);
 	}
+
+	if (debug_state)
+		cancel_delayed_work_sync(&data->watchdog_work);
+
 	mxt_debug_msg_remove(data);
 	mxt_sysfs_remove(data);
 	mxt_free_input_device(data);
@@ -4447,3 +4523,6 @@ module_i2c_driver(mxt_driver);
 MODULE_AUTHOR("Joonyoung Shim <jy0922.shim@samsung.com>");
 MODULE_DESCRIPTION("Atmel maXTouch Touchscreen driver");
 MODULE_LICENSE("GPL");
+
+module_param(debug_state, bool, 0);
+MODULE_PARM_DESC(debug_state, "Enable/Disable watchdog work to check device state (default=false)");
-- 
2.17.1

