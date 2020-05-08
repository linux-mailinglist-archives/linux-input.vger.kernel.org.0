Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 956F11CA35A
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 08:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbgEHF7q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:59:46 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:38765 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728219AbgEHF7p (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:59:45 -0400
IronPort-SDR: tbKw/19s6B8qR29MddIuV3QGSNVk+VdBLw0U9kO/0k9mcucoLo1S54hGKYGvPWPLaTDg9GlJGx
 71UjqRrBrn07E2844alVLVOgL6llj4QVp4tPLmMfohzdX493tHoitmZmDAKp9eNQAc7yHlWg3t
 cmqO4wEj8yz7qJRFwN8I+elP1fvTKmD2Tp551B4yp8RBsK5yBI3yic+N1M59E4/9tifv64X6HT
 laBbLBdegFB3/UQ+Gulf2kGdcOJ/piGxP+OHS3bSGbFGnmEZ5qG1poPdRl9SDz2NXVs1hEijlX
 fJA=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="50670134"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 07 May 2020 21:59:42 -0800
IronPort-SDR: feXG//eL9hxODJRSZ3wefsqn5zwbC+DkSDfwUUm7Pf7vUxEYeZ438xSg6W9MiTGCkTXmbS/I5Q
 lh6hYung9RNAwR+VAdh+jQv5gIoOsOudL8cktZXZPAgnSOTRhI8EnwZmlDaBO0AkYz65EJ5cXV
 C9nKcyml+zuKToHC8zZpy6JvEdUuzxQUAnz6KUQnjzGKO5Uomd0LM5fl1BwJfW9jdTVxcoYc7z
 FHE84HL44RK1FyPCR0goNYRHMahMgsu60eExF7lSN9dESFvkx7Jc+udIAHVGQPj6DOS0sMoyaZ
 3FM=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 43/56] Input: atmel_mxt_ts: Add support for run self-test routine.
Date:   Thu, 7 May 2020 22:56:43 -0700
Message-ID: <20200508055656.96389-44-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nikhil Ravindran <Nikhil.Ravindran@in.bosch.com>

The self test object T25 runs self test routines in device to find faults
Sysfs entry add to start self test routine and read back the test results
for atmel touchcontrollers.The feature will be used for A-IVI and CAF
projects.

Signed-off-by: Nikhil Ravindran <Nikhil.Ravindran@in.bosch.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: Rename mxt_t25_selftest_show to t25_selftest_show
	Rename mxt_t25_selftest_store to t25_selftest_show
	Rename attr t25 to t25_selftest
	Replace DEVICE_ATTR with DEVICE_ATTR_RW]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 113 +++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 3ffd49b383f4..c9ff450fa193 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -337,6 +337,9 @@ struct mxt_data {
 	u8 t100_aux_ampl;
 	u8 t100_aux_area;
 	u8 t100_aux_vect;
+	u16 T25_address;
+	u8  T25_reportid;
+	u8  t25_msg[6];
 	bool debug_enabled;
 	bool debug_v2_enabled;
 	u8 *debug_msg_data;
@@ -414,6 +417,8 @@ struct mxt_data {
 
 	/* Indicates whether device is updating configuration */
 	bool updating_config;
+
+	bool t25_status;
 };
 
 struct mxt_vb2_buffer {
@@ -1357,6 +1362,24 @@ static void mxt_proc_t93_messages(struct mxt_data *data, u8 *msg)
 	dev_info(dev, "T93 report double tap %d\n", status);
 }
 
+static void mxt_proc_t25_messages(struct mxt_data *data, u8 *msg)
+{
+	struct device *dev = &data->client->dev;
+
+	/* Output debug if status has changed */
+	dev_dbg(dev, "T25 Status 0x%x Info: %x %x %x %x %x\n",
+		msg[1],
+		msg[2],
+		msg[3],
+		msg[4],
+		msg[5],
+		msg[6]);
+
+	/* Save current status */
+	memcpy(&data->t25_msg[0], &msg[1], sizeof(data->t25_msg));
+	data->t25_status = false;
+}
+
 static int mxt_proc_message(struct mxt_data *data, u8 *message)
 {
 	u8 report_id = message[0];
@@ -1387,6 +1410,8 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 	} else if (report_id == data->T19_reportid) {
 		mxt_input_button(data, message);
 		data->update_input = true;
+	} else if (report_id == data->T25_reportid) {
+		mxt_proc_t25_messages(data, message);
 	} else if (report_id >= data->T15_reportid_min
 		   && report_id <= data->T15_reportid_max) {
 		mxt_proc_t15_messages(data, message);
@@ -1611,6 +1636,86 @@ static int mxt_t6_command(struct mxt_data *data, u16 cmd_offset,
 	return 0;
 }
 
+static int mxt_t25_command(struct mxt_data *data, u8 cmd, bool wait)
+{
+	u16 reg;
+	int timeout_counter = 0;
+	int ret;
+	u8  val[2];
+
+	reg = data->T25_address;
+	val[0] = 0x3;
+	val[1] = cmd;
+
+	data->t25_status = true;
+	ret = __mxt_write_reg(data->client, reg, sizeof(val), val);
+	if (ret) {
+		data->t25_status = false;
+		return ret;
+	}
+
+	if (!wait)
+		return 0;
+
+	do {
+		msleep(MXT_WAKEUP_TIME);
+		ret = __mxt_read_reg(data->client, reg + 1, 1, &val[1]);
+		if (ret)
+			return ret;
+	} while ((val[1] != 0) && (timeout_counter++ <= 100));
+
+	if (timeout_counter > 100) {
+		dev_err(&data->client->dev, "Command failed!\n");
+		data->t25_status = false;
+		return -EIO;
+	}
+	return 0;
+}
+
+/* Firmware Version is returned as Major.Minor.Build */
+static ssize_t t25_selftest_show(struct device *dev, struct
+				 device_attribute * attr, char *buf)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	ssize_t offset = 0;
+
+	if (data->t25_status)
+		return -EAGAIN;
+
+	if (data->t25_msg[0] == 0xFE)
+		offset += scnprintf(buf, PAGE_SIZE, "PASS\n");
+	else
+		offset += scnprintf(buf, PAGE_SIZE, "FAILED\n");
+
+	offset += scnprintf(buf + offset, PAGE_SIZE, "%x %x %x %x %x %x\n",
+		 data->t25_msg[0],
+		 data->t25_msg[1],
+		 data->t25_msg[2],
+		 data->t25_msg[3],
+		 data->t25_msg[4],
+		 data->t25_msg[5]);
+	return offset;
+}
+
+static ssize_t t25_selftest_store(struct device *dev, struct
+				  device_attribute * attr, const char *buf,
+				  size_t count)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	u32 cmd;
+	int ret;
+
+	ret = kstrtou32(buf, 0, &cmd);
+	if (ret)
+		return ret;
+
+	if (mxt_t25_command(data, (u8)cmd, 1) == 0)
+		return count;
+
+	dev_dbg(dev, "mxt_t25_cmd_store write cmd %x error\n", cmd);
+	return -EINVAL;
+}
+
 static int mxt_acquire_irq(struct mxt_data *data)
 {
 	int error;
@@ -2074,6 +2179,8 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T15_reportid_max = 0;
 	data->T18_address = 0;
 	data->T19_reportid = 0;
+	data->T25_address = 0;
+	data->T25_reportid = 0;
 	data->T42_reportid_min = 0;
 	data->T42_reportid_max = 0;
 	data->T44_address = 0;
@@ -2161,6 +2268,10 @@ static int mxt_parse_object_table(struct mxt_data *data,
 		case MXT_SPT_COMMSCONFIG_T18:
 			data->T18_address = object->start_address;
 			break;
+		case MXT_SPT_SELFTEST_T25:
+			data->T25_address = object->start_address;
+			data->T25_reportid = min_id;
+			break;
 		case MXT_PROCI_TOUCHSUPPRESSION_T42:
 			data->T42_reportid_min = min_id;
 			data->T42_reportid_max = max_id;
@@ -3748,6 +3859,7 @@ static DEVICE_ATTR_RO(config_crc);
 static DEVICE_ATTR_RW(debug_enable);
 static DEVICE_ATTR_RW(debug_v2_enable);
 static DEVICE_ATTR_RO(debug_notify);
+static DEVICE_ATTR_RW(t25_selftest);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
@@ -3758,6 +3870,7 @@ static struct attribute *mxt_attrs[] = {
 	&dev_attr_debug_enable.attr,
 	&dev_attr_debug_v2_enable.attr,
 	&dev_attr_debug_notify.attr,
+	&dev_attr_t25_selftest.attr,
 	NULL
 };
 
-- 
2.17.1

