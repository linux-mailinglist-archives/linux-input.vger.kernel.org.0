Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09026B4B1D
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726965AbfIQJnp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:43:45 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:20022 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729312AbfIQJnp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:43:45 -0400
IronPort-SDR: I8a2oKjKdsL9m/k+Z4kyttleu52TjimNQ/oJ2VqC0VMl6OKyoTf5sD1aJ6LjB63G7cRmlRB4Zp
 3U6KOPmXfU1J1u9d/GFD/YhVu7UQXwU2Is+q8AeapohB5hXCzI8AUEpW/oprbBSG6yqj4t0r/n
 qP4otu6oldZVIYQMW2Pj+Uvq9hZM9EpftC+1SRqs0pr/+YsC0wSqyNQKGfKROjMtWaLbXz/HBD
 HTrSIxaxpPaVgXsU1mLYlkrpLnEZIZtdQ5ceigZN647mII5dapQ6myWYq/11QysdRo0z8BQeJc
 10Q=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41374292"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:43:44 -0800
IronPort-SDR: RyooQKJ8cUw8bCERWgthznZw8oKm1dXQMjEtPKvp3OT0xNkb5STPkYQfvbjuPrBxOp6c5xQozo
 zoyByUkgHB56QOb082u0ULRWcecBhcrW5qOU/Lh0gr1BrKMC3syJDImVn9mp5fas3+YzPTSnxl
 9u6tNSeGvw81NTCD5K726Etr/NxFoHWla9jLND+0EYkhRgxBZtpgkfo02nE46/W5ngi8kwyknJ
 GDmUSBfS2iA20JUYEL+CbMVfrAoEqEa9pkJ9nQHKFuBE5NYEiR6rCtRaL6wPYvDIC1k+iLBA/4
 3/Y=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 47/49] input: atmel_mxt_ts: added sysfs interface to update atmel T38 data
Date:   Tue, 17 Sep 2019 18:43:17 +0900
Message-ID: <20190917094319.18996-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190917094319.18996-1-jiada_wang@mentor.com>
References: <20190917094319.18996-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
index e67c29f0e0ca..db4ad3b82650 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -4027,6 +4027,106 @@ static ssize_t mxt_touch_device_status(struct device *dev, struct
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
@@ -4039,6 +4139,7 @@ static DEVICE_ATTR(debug_v2_enable, S_IWUSR | S_IRUSR, NULL,
 static DEVICE_ATTR(debug_notify, S_IRUGO, mxt_debug_notify_show, NULL);
 static DEVICE_ATTR(t25, 0600, mxt_t25_selftest_show, mxt_t25_selftest_store);
 static DEVICE_ATTR(touch_dev_stat, 0444, mxt_touch_device_status, NULL);
+static DEVICE_ATTR(t38_data, 0600, mxt_t38_data_show, mxt_t38_data_store);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
@@ -4051,6 +4152,7 @@ static struct attribute *mxt_attrs[] = {
 	&dev_attr_debug_notify.attr,
 	&dev_attr_t25.attr,
 	&dev_attr_touch_dev_stat.attr,
+	&dev_attr_t38_data.attr,
 	NULL
 };
 
-- 
2.19.2

