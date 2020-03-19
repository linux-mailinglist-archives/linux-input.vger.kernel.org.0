Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA2818BA3A
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728568AbgCSPDj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:03:39 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:32457 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728557AbgCSPDj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:03:39 -0400
IronPort-SDR: Or07yC/Eowb8qlGVB/6Cf/JUYv1qPy+miL14lv0yrBEk2oQJcKx7HNz33N6SFNh9Kyt14HgHxF
 Ot+bstdxI6Jo6tu/83La4qSZcAYXY16EciCuoy8CMkjqhotGUbrCP7tHWDyirJdLzq9GQppkOU
 aV2iVHkO854dzcqcRwhQSWGh1jBqDRPEUYT2BhG+rI5sK5rgZ3X46x3ww8KtDm70RZ7QtF4LAa
 wDG1ERTHj0LnlbJsT0W647MEq5WyzeSHpPYMONmrJP5hRN3u8Zm9+IeaFkTlg/vvYlM+SNlO9A
 fpY=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="46891153"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:03:38 -0800
IronPort-SDR: tTdy9z1UjJ75ZkK/hix1SV8rftCDx2ifYZ8MFd6bbGBErur0oETmnma8In0xky0Mxu7hmlX2zG
 HkU6DWywk1odNl8uSa0ymI7VTAIsjwCliTPqad8qZI/k3GTtb+sQYPsXti6cPVj7f4vuzM51nB
 ZnWhO/ZB+rriz45UFZOHjBeCXW/388ZUKHQOHBFLvWmN/MzBdpfLXEDMWPuD426xSYxKHW+TZO
 0exRWnz+6SLQrELL8C/tPCCAjgliDhn9J2PvHBoBayTkih5geJWz3rjQRMdunBn1zpit4xkXcL
 swA=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 50/52] input: atmel_mxt_ts: added sysfs interface to update atmel T38 data
Date:   Thu, 19 Mar 2020 08:00:14 -0700
Message-ID: <20200319150016.61398-51-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Naveen Chakka <Naveen.Chakka@in.bosch.com>

Atmel touch controller contains T38 object where a user can store its own
data of length 64 bytes. T38 data will not be part of checksum
calculation on executing T6 BACKUP command.

format used to update the T38 data is given below:

<offset> <length> <actual_data>

offset: offset address of the data to be written in the t38 object
	(in decimal)

length: length of the data to be written into the t38 object(in decimal)

data: actual data bytes to be written into the t38 object
      (values should be in hex)

Ex:
1. 0 2 10 20
updates first two bytes of the t38 data with values 10 and 20

2. 19 6 10 2f 30 4a 50 60
updates 6 bytes of t38 data from the index 19-24 with hex values

Signed-off-by: Naveen Chakka <Naveen.Chakka@in.bosch.com>
Signed-off-by: Sanjeev Chugh <sanjeev_chugh@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 102 +++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a0f90113a98d..50b3cc194196 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4029,6 +4029,106 @@ static ssize_t mxt_touch_device_status(struct device *dev, struct
 	return ret;
 }
 
+static ssize_t mxt_t38_data_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	struct mxt_object *object;
+	size_t count = 0, size;
+	u8 i, *t38_buf;
+
+	if (!data->object_table)
+		return -ENXIO;
+
+	object = mxt_get_object(data, MXT_SPT_USERDATA_T38);
+	size = mxt_obj_size(object);
+
+	/* Pre-allocate buffer large enough to hold max size of t38 object.*/
+	t38_buf = kmalloc(size, GFP_KERNEL);
+	if (!t38_buf)
+		return -ENOMEM;
+
+	count = __mxt_read_reg(data->client, object->start_address,
+			       size, t38_buf);
+	if (count)
+		goto end;
+
+	for (i = 0; i < size; i++)
+		count += scnprintf(buf + count, PAGE_SIZE - count,
+				   "[%2u]: %02x\n", i, t38_buf[i]);
+	count += scnprintf(buf + count, PAGE_SIZE - count, "\n");
+end:
+	kfree(t38_buf);
+	return count;
+}
+
+static ssize_t mxt_t38_data_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	struct mxt_object *object;
+	ssize_t ret = 0, pos, offset;
+	unsigned int i, len, index;
+	u8 *t38_buf;
+
+	if (!data->object_table)
+		return -ENXIO;
+
+	object = mxt_get_object(data, MXT_SPT_USERDATA_T38);
+
+	/* Pre-allocate buffer large enough to hold max size of t38 object.*/
+	t38_buf = kmalloc(mxt_obj_size(object), GFP_KERNEL);
+	if (!t38_buf)
+		return -ENOMEM;
+
+	ret = sscanf(buf, "%zd %d%zd", &offset, &len, &pos);
+	if (ret != 2) {
+		dev_err(dev, "Bad format: Invalid parameter to update t38\n");
+		ret = -EINVAL;
+		goto end;
+	}
+
+	if (len == 0) {
+		dev_err(dev,
+			"Bad format: Data length should not be equal to 0\n");
+		ret = -EINVAL;
+		goto end;
+	}
+
+	if (offset < 0 || ((offset + len) > 64)) {
+		dev_err(dev, "Invalid offset value to update t38\n");
+		ret = -EINVAL;
+		goto end;
+	}
+
+	index = pos;
+	for (i = 0; i < len; i++) {
+		ret = sscanf(buf + index, "%hhx%zd", t38_buf + i, &pos);
+		if (ret != 1) {
+			dev_err(dev, "Bad format: Invalid Data\n");
+			ret = -EINVAL;
+			goto end;
+		}
+		index += pos;
+	}
+
+	ret = __mxt_write_reg(data->client, object->start_address + offset,
+			      len, t38_buf);
+	if (ret)
+		goto end;
+
+	ret = mxt_t6_command(data, MXT_COMMAND_BACKUPNV, MXT_BACKUP_VALUE,
+			     true);
+	if (ret)
+		dev_err(dev, "backup command failed\n");
+	else
+		ret = count;
+end:
+	kfree(t38_buf);
+	return ret;
+}
+
 static DEVICE_ATTR(fw_version, S_IRUGO, mxt_fw_version_show, NULL);
 static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
@@ -4041,6 +4141,7 @@ static DEVICE_ATTR(debug_v2_enable, 0600, NULL,
 static DEVICE_ATTR(debug_notify, 0444, mxt_debug_notify_show, NULL);
 static DEVICE_ATTR(t25, 0600, mxt_t25_selftest_show, mxt_t25_selftest_store);
 static DEVICE_ATTR(touch_dev_stat, 0444, mxt_touch_device_status, NULL);
+static DEVICE_ATTR(t38_data, 0600, mxt_t38_data_show, mxt_t38_data_store);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
@@ -4053,6 +4154,7 @@ static struct attribute *mxt_attrs[] = {
 	&dev_attr_debug_notify.attr,
 	&dev_attr_t25.attr,
 	&dev_attr_touch_dev_stat.attr,
+	&dev_attr_t38_data.attr,
 	NULL
 };
 
-- 
2.17.1

