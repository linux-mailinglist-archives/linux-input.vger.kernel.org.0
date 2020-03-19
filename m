Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 558B818BA21
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728313AbgCSPCw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:02:52 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:16159 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728317AbgCSPCv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:02:51 -0400
IronPort-SDR: aw8MG52B+1v/Y8gbwF/Jdz4zS7+BPvSmJKzQhqWXsovUMDK+/MejbCE5tRs3S4JHlISGRT8cpk
 2jKZ+Zs5enXxVnNLB7Ra29m1j3mjr56UILCIF8yj4DdWrWU686omacGWzR8LTMi7lbbEGs6hAN
 8fqotZXWPRwRXcVVpqj0j+QX8nEASO8JEqsVTNEXguLMAtoymk0vOszWaoaoX4kE06OLZSGiM3
 OA0FA6fPn/AVsTYJn1edQ9y2XQlopEgnlU68IElqIDg4hP4nXVpctN2E+YFzhef7rtBb8Xuncr
 LQo=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="48850401"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:02:50 -0800
IronPort-SDR: WdpMbYcntqpRPPikVRRsCEISuGsRZYeKRXlaX+Oj2CxcoArcjwyTMuVb/mUFDa32j9PDp0ZWkC
 9l1dqF2cfpbAjEK9/QZND4avs+GdUJv4HiDrQaDh1bbnQXMeK2xC4WigrmVYvtTsie4NVjEOZp
 VPg3Y8CPbgWibNQenY6OofIYC3HN/SwCUwr+vWdyU4ojGX9+iv5ojfOD8yvE3fDv22HRars9yi
 1PutEi7EGGC1C0e6zmUceF25z405Qqt3x4Jt2qfCHOrJGx5dJD7OKT7NXfFg87lwEkXT9LVZy0
 CJY=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 38/52] Input: atmel_mxt_ts: Add support for run self-test routine.
Date:   Thu, 19 Mar 2020 08:00:02 -0700
Message-ID: <20200319150016.61398-39-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
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
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 113 +++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index edffdec0d2a2..fe646d7edccf 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -336,6 +336,9 @@ struct mxt_data {
 	u8 t100_aux_ampl;
 	u8 t100_aux_area;
 	u8 t100_aux_vect;
+	u16 T25_address;
+	u8  T25_reportid;
+	u8  t25_msg[6];
 	bool debug_enabled;
 	bool debug_v2_enabled;
 	u8 *debug_msg_data;
@@ -413,6 +416,8 @@ struct mxt_data {
 
 	/* Indicates whether device is updating configuration */
 	bool updating_config;
+
+	bool t25_status;
 };
 
 struct mxt_vb2_buffer {
@@ -1356,6 +1361,24 @@ static void mxt_proc_t93_messages(struct mxt_data *data, u8 *msg)
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
@@ -1386,6 +1409,8 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 	} else if (report_id == data->T19_reportid) {
 		mxt_input_button(data, message);
 		data->update_input = true;
+	} else if (report_id == data->T25_reportid) {
+		mxt_proc_t25_messages(data, message);
 	} else if (report_id >= data->T15_reportid_min
 		   && report_id <= data->T15_reportid_max) {
 		mxt_proc_t15_messages(data, message);
@@ -1610,6 +1635,86 @@ static int mxt_t6_command(struct mxt_data *data, u16 cmd_offset,
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
+static ssize_t mxt_t25_selftest_show(struct device *dev, struct
+				     device_attribute * attr, char *buf)
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
+static ssize_t mxt_t25_selftest_store(struct device *dev, struct
+				      device_attribute * attr, const char *buf,
+				      size_t count)
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
@@ -2088,6 +2193,8 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T15_reportid_max = 0;
 	data->T18_address = 0;
 	data->T19_reportid = 0;
+	data->T25_address = 0;
+	data->T25_reportid = 0;
 	data->T42_reportid_min = 0;
 	data->T42_reportid_max = 0;
 	data->T44_address = 0;
@@ -2175,6 +2282,10 @@ static int mxt_parse_object_table(struct mxt_data *data,
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
@@ -3761,6 +3872,7 @@ static DEVICE_ATTR(debug_enable, 0600, mxt_debug_enable_show,
 static DEVICE_ATTR(debug_v2_enable, 0600, NULL,
 		   mxt_debug_v2_enable_store);
 static DEVICE_ATTR(debug_notify, 0444, mxt_debug_notify_show, NULL);
+static DEVICE_ATTR(t25, 0600, mxt_t25_selftest_show, mxt_t25_selftest_store);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
@@ -3771,6 +3883,7 @@ static struct attribute *mxt_attrs[] = {
 	&dev_attr_debug_enable.attr,
 	&dev_attr_debug_v2_enable.attr,
 	&dev_attr_debug_notify.attr,
+	&dev_attr_t25.attr,
 	NULL
 };
 
-- 
2.17.1

