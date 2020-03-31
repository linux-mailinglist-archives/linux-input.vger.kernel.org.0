Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8CC41993EB
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730334AbgCaKvG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:51:06 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43515 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730424AbgCaKvF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:51:05 -0400
IronPort-SDR: aCB4JxTxc9Y9tMj++e/S06rHfbdDp+Kkl7YKkyw4Ngh23QbMawaxUDjULDtjj4Ah01rHBWk4fg
 knJKrZeNpcXJoOby1JRzrs3m1u8TRyjHVW0LH1k7/8uE1u6nYY0IDc7/XnSbsueM/W/XP+OaHE
 fmVVfWnt1Hq4mpGnVUbh/H00/S0zQQRebfB9n7zRZV9eL6VbtdeupPmFl0BykelVeIq8Dg9BE4
 t8/poVrxgqfpj5zE3kJkbhepU6Mx3msP9ds/QA8z/TUksSyzhnZovEBJcWke8BuUmvQRQZR4+G
 EPs=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330711"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:51:05 -0800
IronPort-SDR: Ak8knzeVk6K0E0AAhx/lR2fhhdqTYizAMAmRReciaM4aHa8b8x5oJuqR5M8amu1ma1aD6NGS3P
 u1ruG12rtKC05ttS5aTCnxudQ4h82FXEY0eBm63py05x/oNFAZPG591s4viTFkLngiKzlVdgyQ
 5HYg8mz7iCKXJu1oQK97agBp4ABtfgBUhcnWieoVvt7SBzagKWNg+whB9QqLc0zFaSEJfCD0V7
 uFLqRYVxjpGis7KvWuo7sWOA+OnvqhaRdL9i+fRMSqWI56RvhHlhA6EI0GAVGjMPSEHwzz+vzZ
 V+g=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 02/55] Input: atmel_mxt_ts - rework sysfs init/remove
Date:   Tue, 31 Mar 2020 03:49:58 -0700
Message-ID: <20200331105051.58896-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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
[jiada: keep call mxt_initialize() before sysfs creation
	replace S_IWUSR with 0200]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 64 +++++++++++++++++++-----
 1 file changed, 52 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a2189739e30f..49bdf5cf3a0d 100644
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
 
+static DEVICE_ATTR(update_fw, 0200, NULL, mxt_update_fw_store);
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

