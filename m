Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535FE1CA36C
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 08:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgEHGA1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 02:00:27 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:38783 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727821AbgEHGA0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 02:00:26 -0400
IronPort-SDR: IkpAWn62KR0fw969MitX4+q9TPB3s0wpBcR9mtMWtIDt2evr7ebiLUxRekajz9EILO5LE+f87g
 E+RW/OxGHAcG1bDUHFSZ+hzBPjKcqXf3VsFbmpIQKz/Wq9k4bJYzbyy6dpaGnlqwJzXi5iOuVE
 l12BRH9RvxbxNJxhtNqKa5cXtY05w7ReqVnw+oStyihJa87HNGbTh1+ogpXVWcV2oIUjK7a68Y
 JqZrAcwVGPtfUy3TU5vPDRLn4UN+nJ3p6JdzLTfIYfbuROIndTdG60X6eBa3f1zt+aGZORu/pE
 fQ4=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="50670188"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 07 May 2020 22:00:24 -0800
IronPort-SDR: cjYdFAztbFgCCa3SWi5XjmoVuAYgIv+Xc3HCMYzITM6BSyVg5bweOt00QXwyQW2ee5ILH5VrJf
 5tO584Lk4Bq2iWsIZgYeh5JyULK1TY0n7oTaXuXvDzvOinhTACA0ddMNMn7IEJd9Nl8XBnG1Ag
 JP5kByLmmyaA06F7tKfBqTzaYW/IgLImvSHqwqGlEFXdDSw7wsE3KDuI2/PNOBRRLzZim1YWsE
 RIUfN79DhXpkOt1sw641NEp8q/rjNxzs+FrpgiJ+09k1ojlcn5WIehXX98ItUYTRTU+wSZzrrB
 ncM=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 54/56] input: atmel_mxt_ts: added sysfs interface to update atmel T38 data
Date:   Thu, 7 May 2020 22:56:54 -0700
Message-ID: <20200508055656.96389-55-jiada_wang@mentor.com>
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
[jiada: Rename mxt_t38_data_show to t38_data_show
	Rename mxt_t38_data_store to t38_data_store
	Replace DEVICE_ATTR with DEVICE_ATTR_RW]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 102 +++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 5c2f4ea1a362..e75a7e5b0c59 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3989,6 +3989,106 @@ static ssize_t touch_dev_stat_show(struct device *dev, struct
 	return ret;
 }
 
+static ssize_t t38_data_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
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
+static ssize_t t38_data_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
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
 static DEVICE_ATTR_RO(fw_version);
 static DEVICE_ATTR_RO(hw_version);
 static DEVICE_ATTR_RO(object);
@@ -3999,6 +4099,7 @@ static DEVICE_ATTR_RW(debug_v2_enable);
 static DEVICE_ATTR_RO(debug_notify);
 static DEVICE_ATTR_RW(t25_selftest);
 static DEVICE_ATTR_RO(touch_dev_stat);
+static DEVICE_ATTR_RW(t38_data);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
@@ -4011,6 +4112,7 @@ static struct attribute *mxt_attrs[] = {
 	&dev_attr_debug_notify.attr,
 	&dev_attr_t25_selftest.attr,
 	&dev_attr_touch_dev_stat.attr,
+	&dev_attr_t38_data.attr,
 	NULL
 };
 
-- 
2.17.1

