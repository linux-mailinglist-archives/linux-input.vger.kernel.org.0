Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38E6C192A2E
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbgCYNhJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:37:09 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:34650 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728150AbgCYNhI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:37:08 -0400
IronPort-SDR: YrbTvNW9E+iPlMBenf+6J8gON1v0Tvbk3sl1zjjxSev92CpxySOzsg0JARiiZSqf2SJPjz/Gm+
 SmP23Am0hFzhgcvczpNDzU2yOXCFXbGFhPOH3HeIdu5nJGaGFygmki7KDRJL9DMhdxDfsG0mbB
 3sbLJtOh0YE4miLn4HRooT+O0hHqaWxg9HmyBCWrrOqj3fNjF7rXmtvtNKJ1c9UMGvRx/Vpevi
 dKxmEzh+l7H3FualfmLtBLeDFv3sr5DTRsS9IjWQzKgvf212qRtIe0WjkA5TD0tVxhC7iPaqxL
 sQo=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47143565"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:37:08 -0800
IronPort-SDR: ixKe6D8LQ1VM26PLOiYIoYTI9G0uEJF5mWinRJuN4rGjgIB72ahnyyXlqLNxepIsFqgJweIe8O
 ZdjrMIVABTaQL8dZxh030doa+1ews5fN0Do0CC+Zu7criAfPrxVupV00neQ3awSuNX59K4ugtP
 6r4zl4TXYHkreskskrCn6GB68iWNmZXZFKr5iclRJh2YZruiL1xWiGDqH+KtYO0b4HRQ6QVQNv
 CjHlYoYv+WGtnWMVg+nbVdS9NodNt4lKtKZqfM2LDjPfy7EaVuBcmG1gM4+Gk5fqj39Ooi7APF
 FrI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 52/55] input: touchscreen: atmel_mxt_ts: Added sysfs entry for touchscreen status
Date:   Wed, 25 Mar 2020 06:33:31 -0700
Message-ID: <20200325133334.19346-53-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
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

Signed-off-by: Naveen Chakka <Naveen.Chakka@in.bosch.com>
Signed-off-by: Sanjeev Chugh <sanjeev_chugh@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: Rename mxt_touch_device_status to touch_dev_stat_show
	Replace DEVICE_ATTR to DEVICE_ATTR_RO]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 112 +++++++++++++++++++++--
 1 file changed, 105 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 14bd64d194b0..0cd807988382 100644
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
 #define MXT_CHG_DELAY		100	/* msec */
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
@@ -372,6 +380,9 @@ struct mxt_data {
 	const char *pcfg_name;
 	const char *input_name;
 	struct mxt_flash *flash;
+	struct work_struct watchdog_work;
+	struct timer_list watchdog_timer;
+	struct mxt_statusinfo mxt_status;
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -1621,11 +1632,30 @@ static int mxt_process_messages(struct mxt_data *data)
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
 
@@ -1633,21 +1663,25 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
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
@@ -2969,6 +3003,39 @@ static int mxt_bootloader_status(struct mxt_data *data)
 	return 0;
 }
 
+static void mxt_watchdog_timer(struct timer_list *t)
+{
+	struct mxt_data *data = from_timer(data, t, watchdog_timer);
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
+	if (data->suspended || data->in_bootloader)
+		return;
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
@@ -3956,6 +4023,22 @@ static const struct attribute_group mxt_fw_attr_group = {
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
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
@@ -3965,6 +4048,7 @@ static DEVICE_ATTR_RW(debug_enable);
 static DEVICE_ATTR_RW(debug_v2_enable);
 static DEVICE_ATTR_RO(debug_notify);
 static DEVICE_ATTR_RW(t25_selftest);
+static DEVICE_ATTR_RO(touch_dev_stat);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
@@ -3976,6 +4060,7 @@ static struct attribute *mxt_attrs[] = {
 	&dev_attr_debug_v2_enable.attr,
 	&dev_attr_debug_notify.attr,
 	&dev_attr_t25_selftest.attr,
+	&dev_attr_touch_dev_stat.attr,
 	NULL
 };
 
@@ -4329,6 +4414,13 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		msleep(MXT_RESET_TIME);
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
@@ -4343,8 +4435,11 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	return 0;
 
 err_free_object:
+	cancel_work_sync(&data->watchdog_work);
+	mxt_stop_wd_timer(data);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
+	del_timer(&data->watchdog_timer);
 	if (data->reset_gpio) {
 		sysfs_remove_link(&client->dev.kobj, "reset");
 		gpiod_unexport(data->reset_gpio);
@@ -4367,6 +4462,9 @@ static int mxt_remove(struct i2c_client *client)
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
 
+	cancel_work_sync(&data->watchdog_work);
+	mxt_stop_wd_timer(data);
+
 	return 0;
 }
 
-- 
2.17.1

