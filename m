Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9048FE58
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727178AbfHPIkW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:40:22 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1960 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727335AbfHPIic (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:38:32 -0400
IronPort-SDR: +VQYS8sXDqQMMs3w/N4UgK2NTEeaCDi5AW7m9T/lzhd7UYlF72etEpIaqFsjm3KqpQEpqYjDrs
 lFOELRcCJEyw8GbVjVXmHFCmmfDzzWN2/i+yYyTvjhZtWEgdFXFdeSRMSFYTKT+SePM9d93cWi
 npP/UPqAqnMXzdpr2n6o+N0pqOJY2oI3eDC1NVUIsw9J7IwWYU0rva2Un88Mul2m44o3lOQFnD
 umMphEfKYX/v//4JU8M28eHpyD2kSZECG+MR+I2PbJzbtDov9e2OC/J6Gv12zqhIq7OteBqeTY
 k/k=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484311"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:35:27 -0800
IronPort-SDR: YGfsRRE+LXHNF9z38ZcrqFDrAZcaSzYEZbVHJee/hl/JE3OWF5Nr5KbpjSBsN6x8ZcoZvx68K0
 IVacZXZ7C0GUzixalTwvyx8DFJADA3zVanx76pusxRml51GNBwrtfv1ewvhI5TA4PQU28gU1xz
 KI/32jtl/Iiqguw4bB670mln81vVRj51ZFsU6CrkSiNjwYOApGMYIZbg2+1TL5XtGnc1gKinND
 edKmtfatUV0mkFPLI4PcnzEPN73FIiF5njzV6EzOObLzeE+uZtYvmCAvmxi2DinsRFab0bDpga
 DKU=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 38/63] Input: atmel_mxt_ts: Add support for run self-test routine.
Date:   Fri, 16 Aug 2019 17:35:00 +0900
Message-ID: <20190816083525.19071-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083525.19071-1-jiada_wang@mentor.com>
References: <20190816083525.19071-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nikhil Ravindran <Nikhil.Ravindran@in.bosch.com>

The self test object T25 runs self test routines in device to find faults
Sysfs entry add to start self test routine and read back the test results
for atmel touchcontrollers.The feature will be used for A-IVI and CAF projects.

Signed-off-by: Nikhil Ravindran <Nikhil.Ravindran@in.bosch.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 111 +++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index def9f94d73ef..be63002c2b31 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -336,6 +336,9 @@ struct mxt_data {
 	u8 t100_aux_ampl;
 	u8 t100_aux_area;
 	u8 t100_aux_vect;
+	u16 T25_address;
+	u8  T25_reportid;
+	u8  t25_msg[6];
 	struct bin_attribute mem_access_attr;
 	bool debug_enabled;
 	bool debug_v2_enabled;
@@ -418,6 +421,8 @@ struct mxt_data {
 	unsigned long gpio_input_pin_status;
 	struct attribute_group gpio_attrs;
 	unsigned long gpio_input_pin_status_default;
+
+	bool t25_status;
 };
 
 struct mxt_gpio_attr {
@@ -1360,6 +1365,24 @@ static void mxt_proc_t93_messages(struct mxt_data *data, u8 *msg)
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
@@ -1391,6 +1414,8 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 		mxt_input_button(data, message);
 		data->update_input = true;
 		data->gpio_input_pin_status = message[1];
+	} else if (report_id == data->T25_reportid) {
+		mxt_proc_t25_messages(data, message);
 	} else if (report_id >= data->T15_reportid_min
 		   && report_id <= data->T15_reportid_max) {
 		mxt_proc_t15_messages(data, message);
@@ -1615,6 +1640,84 @@ static int mxt_t6_command(struct mxt_data *data, u16 cmd_offset,
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
+				     device_attribute *attr, char *buf)
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
+				      device_attribute *attr, const char *buf,
+				      size_t count)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	u32 cmd;
+
+	if (sscanf(buf, "%x", &cmd) == 1) {
+		if (mxt_t25_command(data, (u8)cmd, 1) == 0)
+			return count;
+
+		dev_dbg(dev, "mxt_t25_cmd_store write cmd %x error\n", cmd);
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static int mxt_acquire_irq(struct mxt_data *data)
 {
 	int error;
@@ -2091,6 +2194,8 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T15_reportid_max = 0;
 	data->T18_address = 0;
 	data->T19_reportid = 0;
+	data->T25_address = 0;
+	data->T25_reportid = 0;
 	data->T42_reportid_min = 0;
 	data->T42_reportid_max = 0;
 	data->T44_address = 0;
@@ -2178,6 +2283,10 @@ static int mxt_parse_object_table(struct mxt_data *data,
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
@@ -3823,6 +3932,7 @@ static DEVICE_ATTR(debug_enable, S_IWUSR | S_IRUSR, mxt_debug_enable_show,
 static DEVICE_ATTR(debug_v2_enable, S_IWUSR | S_IRUSR, NULL,
 		   mxt_debug_v2_enable_store);
 static DEVICE_ATTR(debug_notify, S_IRUGO, mxt_debug_notify_show, NULL);
+static DEVICE_ATTR(t25, 0600, mxt_t25_selftest_show, mxt_t25_selftest_store);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
@@ -3833,6 +3943,7 @@ static struct attribute *mxt_attrs[] = {
 	&dev_attr_debug_enable.attr,
 	&dev_attr_debug_v2_enable.attr,
 	&dev_attr_debug_notify.attr,
+	&dev_attr_t25.attr,
 	NULL
 };
 
-- 
2.19.2

