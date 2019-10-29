Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 089B3E81FE
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 08:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727756AbfJ2HUX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 03:20:23 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:41229 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727516AbfJ2HUW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 03:20:22 -0400
IronPort-SDR: VT+647qhEJJGOYMPGQaIEp2W25qM/E/M/6KNprivRIx//rMwP6weafSY1sbSHvp9NmedjEv35p
 T/L5zvtsaaLr8L74uBvCSAWXO5ikCrPvwyprA4G7B+t94w4T4ZunKn6IGAfaQFs2NEIIR7Kvp2
 Dpq0QWjtR1ofbe6BYLSoqQT3ZAMYPpE1+/TBCzTTfeiBg6fgkz4qcfzpLY7TixUElcsMVWxCe+
 xVET0Jhh8tu49Fj6DySsrlbwJU+Af0p1B+EoPz8h3t8euE2fOovg54Wa91166KW1Nu7DOHYAVH
 apQ=
X-IronPort-AV: E=Sophos;i="5.68,243,1569312000"; 
   d="scan'208";a="42663205"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 28 Oct 2019 23:20:22 -0800
IronPort-SDR: pr/h9N3LJN0Lbm0Qp6EeBEEJPacwLnHKfkbcRioWcFwCh8WR/ONM5IScvwbfRbAsarXlOy7Seo
 k2SUjYC4EDu/j3Gb4EsuxM9/2pOdcJd5+lQVnd8hxNYXYBL884zR9372/mkBlqkzhO3wb7OQeS
 zU6Rf8r9drsgW8tfcSuoSkse5085lry8yaCCWcF+um6M8L4gM7vcVDX3d0z4LPYsQ6XZVfVnnT
 cD+u/ht5c3tYM3jAMLLzj+cc9gTHKJpIQXJOx70+SqsD4teeD7J1KTwfXY2R2QL/j0y284X0AL
 lAw=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v4 02/48] Input: atmel_mxt_ts - rework sysfs init/remove
Date:   Tue, 29 Oct 2019 16:19:24 +0900
Message-ID: <20191029072010.8492-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029072010.8492-1-jiada_wang@mentor.com>
References: <20191029072010.8492-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

An error in the sysfs init may otherwise interfere with the async return
from the firmware loader

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit 3114584ae77c2b03b6dad87174f010d002e9c05d)
[gdavis: Forward port and fixup conflicts. Also fixed sysfs leaks in
	 both the mxt_initialize() and mxt_probe() error return cases.]
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: keep call mxt_initialize() before sysfs creation]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 64 +++++++++++++++++++-----
 1 file changed, 52 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 6e758af343ea..ffe8a80f4d0a 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2086,10 +2086,14 @@ static int mxt_initialize_input_device(struct mxt_data *data)
 	return 0;
 
 err_free_mem:
+	data->input_dev = NULL;
 	input_free_device(input_dev);
 	return error;
 }
 
+static int mxt_sysfs_init(struct mxt_data *data);
+static void mxt_sysfs_remove(struct mxt_data *data);
+
 static int mxt_configure_objects(struct mxt_data *data,
 				 const struct firmware *cfg);
 
@@ -2141,16 +2145,24 @@ static int mxt_initialize(struct mxt_data *data)
 	if (error)
 		return error;
 
+	error = mxt_sysfs_init(data);
+	if (error)
+		return error;
+
 	error = request_firmware_nowait(THIS_MODULE, true, MXT_CFG_NAME,
 					&client->dev, GFP_KERNEL, data,
 					mxt_config_cb);
 	if (error) {
 		dev_err(&client->dev, "Failed to invoke firmware loader: %d\n",
 			error);
-		return error;
+		goto err_free_sysfs;
 	}
 
 	return 0;
+
+err_free_sysfs:
+	mxt_sysfs_remove(data);
+	return error;
 }
 
 static int mxt_set_t7_power_cfg(struct mxt_data *data, u8 sleep)
@@ -2803,6 +2815,7 @@ static int mxt_load_fw(struct device *dev, const char *fn)
 		if (ret)
 			goto release_firmware;
 
+		mxt_sysfs_remove(data);
 		mxt_free_input_device(data);
 		mxt_free_object_table(data);
 	} else {
@@ -2909,16 +2922,25 @@ static ssize_t mxt_update_fw_store(struct device *dev,
 	return count;
 }
 
+static DEVICE_ATTR(update_fw, S_IWUSR, NULL, mxt_update_fw_store);
+
+static struct attribute *mxt_fw_attrs[] = {
+	&dev_attr_update_fw.attr,
+	NULL
+};
+
+static const struct attribute_group mxt_fw_attr_group = {
+	.attrs = mxt_fw_attrs,
+};
+
 static DEVICE_ATTR(fw_version, S_IRUGO, mxt_fw_version_show, NULL);
 static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
-static DEVICE_ATTR(update_fw, S_IWUSR, NULL, mxt_update_fw_store);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
 	&dev_attr_hw_version.attr,
 	&dev_attr_object.attr,
-	&dev_attr_update_fw.attr,
 	NULL
 };
 
@@ -2926,6 +2948,28 @@ static const struct attribute_group mxt_attr_group = {
 	.attrs = mxt_attrs,
 };
 
+static int mxt_sysfs_init(struct mxt_data *data)
+{
+	struct i2c_client *client = data->client;
+	int error;
+
+	error = sysfs_create_group(&client->dev.kobj, &mxt_attr_group);
+	if (error) {
+		dev_err(&client->dev, "Failure %d creating sysfs group\n",
+			error);
+		return error;
+	}
+
+	return 0;
+}
+
+static void mxt_sysfs_remove(struct mxt_data *data)
+{
+	struct i2c_client *client = data->client;
+
+	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
+}
+
 static void mxt_start(struct mxt_data *data)
 {
 	switch (data->suspend_mode) {
@@ -3112,19 +3156,14 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (error)
 		return error;
 
-	error = sysfs_create_group(&client->dev.kobj, &mxt_attr_group);
+	error = sysfs_create_group(&client->dev.kobj, &mxt_fw_attr_group);
 	if (error) {
-		dev_err(&client->dev, "Failure %d creating sysfs group\n",
+		dev_err(&client->dev, "Failure %d creating fw sysfs group\n",
 			error);
-		goto err_free_object;
+		return error;
 	}
 
 	return 0;
-
-err_free_object:
-	mxt_free_input_device(data);
-	mxt_free_object_table(data);
-	return error;
 }
 
 static int mxt_remove(struct i2c_client *client)
@@ -3132,7 +3171,8 @@ static int mxt_remove(struct i2c_client *client)
 	struct mxt_data *data = i2c_get_clientdata(client);
 
 	disable_irq(data->irq);
-	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
+	sysfs_remove_group(&client->dev.kobj, &mxt_fw_attr_group);
+	mxt_sysfs_remove(data);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
 
-- 
2.17.1

