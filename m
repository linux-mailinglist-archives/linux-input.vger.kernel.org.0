Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4ECD199456
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731032AbgCaKyO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:54:14 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:28112 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731003AbgCaKyN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:54:13 -0400
IronPort-SDR: fP+CHhHOtu0jj/MFMzpPHfyD4cEkO1lb6qnq9win5YBQ0VOa5GBzGRaIic2Knu7lZ7B+0cKbF1
 1m6EigS7BmmRB7L9dvqGrK/bpRaPemxr9avwzIcY7Y+LLWdd+HWnh/WwHRwXEA3Rn40qF6qKX8
 5M7+0oCJFVg3fZ3adrAaJR0+nhnqw1utgdtjXBld9g62EnLutzuXfllLd8CSJiZ32s3/39J6tn
 5+Bn3VQ4lJt1u2ElA4/Xi4SZz6/5PaYOh41+9Crfu3c9ha8xAX4fJVtTu2THEWcesbF2vQMdw+
 mHc=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47293538"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:54:13 -0800
IronPort-SDR: zhaGSYVqUzraej9GcJ0tN5iX/VqNOYz9ish0CJvGWGtm/OhkqanQN80KcsGeztP2SkvW8xruKp
 ramrbVuE/MEGSvZM/qAr5Cx5xslK5n1UIsIA156UyVVTDgwaXF7oZIKULuu8uz/nXjjese7fey
 9L2B0OBptPSmKSOakvOwgGrgXGet/twdgaYVg/XaawA4KcXrBkjzQyFB9Ft6JdOzRxeRW9HF2y
 0cmzLldLtNMeC6R4nCCPPelRTWVo3WqcocHN0KaHGmQfSXkUkJL2aGEKAGgERNq1gZeqtwf+mM
 VzI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 52/55] input: touchscreen: atmel_mxt_ts: Added sysfs entry for touchscreen status
Date:   Tue, 31 Mar 2020 03:50:48 -0700
Message-ID: <20200331105051.58896-53-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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
[jiada: Rename mxt_touch_device_status to touch_dev_stat_show
	Replace DEVICE_ATTR to DEVICE_ATTR_RO]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 90 ++++++++++++++++++++++--
 1 file changed, 83 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 14bd64d194b0..dda10bb51cb3 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -222,6 +222,7 @@ enum t100_type {
 #define MXT_CHG_DELAY		100	/* msec */
 #define MXT_POWERON_DELAY	150	/* msec */
 #define MXT_BOOTLOADER_WAIT	36E5	/* 1 minute */
+#define MXT_WATCHDOG_TIMEOUT	1000	/* msec */
 
 /* Command to unlock bootloader */
 #define MXT_UNLOCK_CMD_MSB	0xaa
@@ -245,6 +246,9 @@ enum t100_type {
 
 #define DEBUG_MSG_MAX		200
 
+#define MXT_DEBUG_STATE		false
+static bool debug_state = MXT_DEBUG_STATE;
+
 struct mxt_info {
 	u8 family_id;
 	u8 variant_id;
@@ -317,6 +321,12 @@ struct mxt_flash {
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
@@ -372,6 +382,8 @@ struct mxt_data {
 	const char *pcfg_name;
 	const char *input_name;
 	struct mxt_flash *flash;
+	struct delayed_work watchdog_work;
+	struct mxt_statusinfo mxt_status;
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -1626,6 +1638,8 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 	struct mxt_data *data = dev_id;
 	int ret;
 
+	data->mxt_status.intp_triggered = true;
+
 	if (data->in_bootloader) {
 		complete(&data->chg_completion);
 
@@ -1633,21 +1647,25 @@ static irqreturn_t mxt_interrupt(int irq, void *dev_id)
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
@@ -2969,6 +2987,31 @@ static int mxt_bootloader_status(struct mxt_data *data)
 	return 0;
 }
 
+static void mxt_watchdog_work(struct work_struct *work)
+{
+	struct mxt_data *data =
+		container_of(work, struct mxt_data, watchdog_work.work);
+	u16 info_buf;
+	int ret;
+
+	if (data->suspended || data->in_bootloader ||
+	    data->mxt_status.intp_triggered)
+		goto sched_work;
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
+sched_work:
+	schedule_delayed_work(&data->watchdog_work,
+			      msecs_to_jiffies(MXT_WATCHDOG_TIMEOUT));
+}
+
 static int mxt_initialize(struct mxt_data *data)
 {
 	struct i2c_client *client = data->client;
@@ -3956,6 +3999,22 @@ static const struct attribute_group mxt_fw_attr_group = {
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
@@ -3965,6 +4024,7 @@ static DEVICE_ATTR_RW(debug_enable);
 static DEVICE_ATTR_RW(debug_v2_enable);
 static DEVICE_ATTR_RO(debug_notify);
 static DEVICE_ATTR_RW(t25_selftest);
+static DEVICE_ATTR_RO(touch_dev_stat);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
@@ -3976,6 +4036,7 @@ static struct attribute *mxt_attrs[] = {
 	&dev_attr_debug_v2_enable.attr,
 	&dev_attr_debug_notify.attr,
 	&dev_attr_t25_selftest.attr,
+	&dev_attr_touch_dev_stat.attr,
 	NULL
 };
 
@@ -4329,6 +4390,12 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
@@ -4343,6 +4410,8 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	return 0;
 
 err_free_object:
+	if (debug_state)
+		cancel_delayed_work_sync(&data->watchdog_work);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
 	if (data->reset_gpio) {
@@ -4367,6 +4436,9 @@ static int mxt_remove(struct i2c_client *client)
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
 
+	if (debug_state)
+		cancel_delayed_work_sync(&data->watchdog_work);
+
 	return 0;
 }
 
@@ -4463,3 +4535,7 @@ module_i2c_driver(mxt_driver);
 MODULE_AUTHOR("Joonyoung Shim <jy0922.shim@samsung.com>");
 MODULE_DESCRIPTION("Atmel maXTouch Touchscreen driver");
 MODULE_LICENSE("GPL");
+
+module_param(debug_state, bool, 0);
+MODULE_PARM_DESC(debug_state, "Enable/Disable watchdog work to check device state (default="
+		 __MODULE_STRING(MXT_DEBUG_STATE) ")");
-- 
2.17.1

