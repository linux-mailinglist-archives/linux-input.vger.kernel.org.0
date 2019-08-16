Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D36B8FE5C
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727329AbfHPIia (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:38:30 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:42029 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727319AbfHPIi3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:38:29 -0400
IronPort-SDR: onTg/jMwgLY3WfH9G3+ZOGmQ7xnNgt118nuGmrYtMlKKBDJa/P6r5yxql9LX9YW9ipwrhvxTKn
 CEi/1lP/t8vt+EpGkeESJl67uI3DNVCDVSe6d5cT+wtWZfWdMDCV3IaswyIqbRWSE4UtMsKHAW
 nDF8lv0bxTCha0wtdVTDuZEF1+hHC2hEAUqOs09z6K09Cqn2KxGnpEfXPeFSQt8/QK7Q9Ah4D/
 sQBNy0vVJw9Nao6FxcSnvv1pNHXdsq/67nBqydNXwed4GXyKQ3KYYFTpmLhnzlnSYkMv3nMnns
 LKI=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40507247"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:38:27 -0800
IronPort-SDR: DNgBvGw+k+ek8yM5XMem4mMRsDpg38mq+Nf/DYrr6D53TaHI+DCU5i+FOzQ42bqoLI0o8+5LqK
 fRoPjNnHaEu/IRaIJQt0bVP38EcuoyRHNrpt/zexw+j2uZIv6Ro2jsMjbVpc1XwdF1Rktx5Ar8
 0sAoy+JGc8SVzqxBbcZqWyQk13D+43Y8CoLVY+cpPicjU77tW1IKO7xt32d3umZms22BNNjY4T
 dak5r4XaNSRzNa/T44Tcsx3byP9XryJlEOzVukQ9q1bWaK9KmMLBGwv/vXrmfioZiwHpS08J/C
 Q3w=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 57/63] input: touchscreen: atmel_mxt_ts: Added sysfs entry for touchscreen status
Date:   Fri, 16 Aug 2019 17:38:24 +0900
Message-ID: <20190816083830.19553-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083830.19553-1-jiada_wang@mentor.com>
References: <20190816083830.19553-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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

Signed-off-by: Naveen Chakka <Naveen.Chakka@in.bosch.com>
Signed-off-by: Sanjeev Chugh <sanjeev_chugh@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 111 +++++++++++++++++++++--
 1 file changed, 104 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 64a1a6815d56..234e3031ba42 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -25,6 +25,7 @@
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/gpio/consumer.h>
+#include <linux/timer.h>
 #include <asm/unaligned.h>
 #include <linux/regulator/consumer.h>
 #include <linux/workqueue.h>
@@ -222,6 +223,7 @@ enum t100_type {
 #define MXT_CHG_DELAY	        100	/* msec */
 #define MXT_POWERON_DELAY	150	/* msec */
 #define MXT_BOOTLOADER_WAIT	36E5	/* 1 minute */
+#define MXT_WATCHDOG_TIMEOUT	1000	/* msec */
 
 /* Command to unlock bootloader */
 #define MXT_UNLOCK_CMD_MSB	0xaa
@@ -317,6 +319,12 @@ struct mxt_flash {
 	struct delayed_work work;
 };
 
+struct mxt_statusinfo {
+	bool dev_status;
+	bool intp_triggered;
+	u32 error_count;
+};
+
 /* Each client has this additional data */
 struct mxt_data {
 	struct i2c_client *client;
@@ -373,6 +381,9 @@ struct mxt_data {
 	const char *pcfg_name;
 	const char *input_name;
 	struct mxt_flash *flash;
+	struct work_struct watchdog_work;
+	struct timer_list watchdog_timer;
+	struct mxt_statusinfo mxt_status;
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -1626,11 +1637,30 @@ static int mxt_process_messages(struct mxt_data *data)
 	return total_handled;
 }
 
+static void mxt_start_wd_timer(struct mxt_data *data)
+{
+	mod_timer(&data->watchdog_timer, jiffies +
+			msecs_to_jiffies(MXT_WATCHDOG_TIMEOUT));
+}
+
+static void mxt_stop_wd_timer(struct mxt_data *data)
+{
+	/*
+	 * Ensure we wait until the watchdog timer
+	 * running on a different CPU finishes
+	 */
+	del_timer_sync(&data->watchdog_timer);
+	cancel_work_sync(&data->watchdog_work);
+	del_timer_sync(&data->watchdog_timer);
+}
+
 static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 {
 	struct mxt_data *data = dev_id;
 	int ret;
 
+	data->mxt_status.intp_triggered = true;
+
 	if (data->in_bootloader) {
 		complete(&data->chg_completion);
 
@@ -1638,21 +1668,25 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 			cancel_delayed_work_sync(&data->flash->work);
 
 		ret = mxt_check_bootloader(data);
-		return IRQ_RETVAL(ret);
+		ret = IRQ_RETVAL(ret);
+		goto exit;
 	}
 
-	if (!data->object_table)
-		return IRQ_HANDLED;
+	if (!data->object_table) {
+		ret = IRQ_HANDLED;
+		goto exit;
+	}
 
 	if (data->T44_address)
 		ret = mxt_process_messages_t44(data);
 	else
 		ret = mxt_process_messages(data);
 
-	if (ret <= 0)
-		return IRQ_NONE;
-	else
-		return IRQ_HANDLED;
+	ret = (ret <= 0) ? IRQ_NONE : IRQ_HANDLED;
+
+exit:
+	data->mxt_status.intp_triggered = false;
+	return ret;
 }
 
 static int mxt_t6_command(struct mxt_data *data, u16 cmd_offset,
@@ -2983,6 +3017,38 @@ static int mxt_bootloader_status(struct mxt_data *data)
 	return 0;
 }
 
+static void mxt_watchdog_timer(struct timer_list *t)
+{
+	struct mxt_data *data = from_timer(data, t, watchdog_timer);
+
+	dev_dbg(&data->client->dev, "%s: Timer triggered\n", __func__);
+
+	if (!work_pending(&data->watchdog_work)) {
+		if (!data->mxt_status.intp_triggered)
+			schedule_work(&data->watchdog_work);
+	}
+
+	mxt_start_wd_timer(data);
+}
+
+static void mxt_watchdog_work(struct work_struct *work)
+{
+	struct mxt_data *data =
+		container_of(work, struct mxt_data, watchdog_work);
+	u16 info_buf;
+	int ret = 0;
+	u8 size = 2;
+
+	ret = __mxt_read_reg(data->client, 0, size, &info_buf);
+
+	if (ret) {
+		data->mxt_status.error_count++;
+		data->mxt_status.dev_status = false;
+	} else {
+		data->mxt_status.dev_status = true;
+	}
+}
+
 static int mxt_initialize(struct mxt_data *data)
 {
 	struct i2c_client *client = data->client;
@@ -4010,6 +4076,22 @@ static const struct attribute_group mxt_fw_attr_group = {
 	.attrs = mxt_fw_attrs,
 };
 
+static ssize_t mxt_touch_device_status(struct device *dev, struct
+				       device_attribute *attr, char *buf)
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
 static DEVICE_ATTR(fw_version, S_IRUGO, mxt_fw_version_show, NULL);
 static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
@@ -4021,6 +4103,7 @@ static DEVICE_ATTR(debug_v2_enable, S_IWUSR | S_IRUSR, NULL,
 		   mxt_debug_v2_enable_store);
 static DEVICE_ATTR(debug_notify, S_IRUGO, mxt_debug_notify_show, NULL);
 static DEVICE_ATTR(t25, 0600, mxt_t25_selftest_show, mxt_t25_selftest_store);
+static DEVICE_ATTR(touch_dev_stat, 0444, mxt_touch_device_status, NULL);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
@@ -4032,6 +4115,7 @@ static struct attribute *mxt_attrs[] = {
 	&dev_attr_debug_v2_enable.attr,
 	&dev_attr_debug_notify.attr,
 	&dev_attr_t25.attr,
+	&dev_attr_touch_dev_stat.attr,
 	NULL
 };
 
@@ -4518,6 +4602,13 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		return error;
 	}
 
+	INIT_WORK(&data->watchdog_work, mxt_watchdog_work);
+
+	/* setup watchdog timer */
+	timer_setup(&data->watchdog_timer, mxt_watchdog_timer, 0);
+
+	mxt_start_wd_timer(data);
+
 	error = mxt_initialize(data);
 	if (error)
 		goto err_free_object;
@@ -4525,8 +4616,11 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	return 0;
 
 err_free_object:
+	cancel_work_sync(&data->watchdog_work);
+	mxt_stop_wd_timer(data);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
+	del_timer(&data->watchdog_timer);
 	sysfs_remove_group(&client->dev.kobj, &mxt_fw_attr_group);
 	if (data->reset_gpio) {
 		sysfs_remove_link(&client->dev.kobj, "reset");
@@ -4554,6 +4648,9 @@ static int mxt_remove(struct i2c_client *client)
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
 
+	cancel_work_sync(&data->watchdog_work);
+	mxt_stop_wd_timer(data);
+
 	return 0;
 }
 
-- 
2.19.2

