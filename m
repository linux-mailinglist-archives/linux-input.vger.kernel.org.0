Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B2AC8FDF8
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726882AbfHPIg7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:36:59 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:36109 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfHPIg6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:36:58 -0400
IronPort-SDR: DiYysd6yvNtLf0bMDyWvxoGBCiMDI3MYcjOfCaJArQsKeVTWf03P6QE6mLdvzMEzcM5eAtAxPz
 NxKQznCEA4U8T+/DTaD3DQZP2C2CBTP0Tb66U10fFrBS/nwiNOVI/iWt4lGQaQc5eBP7tbhhax
 vcuxO5wNUUUSjcYc/JvRb5aeqV4bUbj8vEmbaK8WzvB34WvRtWPAJkMuz0uoY1ImtWv83GvdSC
 YQVb+dBjl0YaL/xsCMsv2zMPs+X8VduiHCDOElOt81dU5QLefFVd1zbSnxxmBZRwlkjpQY0G4k
 Gzo=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40518975"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:29:51 -0800
IronPort-SDR: GDG+4iOkebz3YHOdHYnujUGG4uFTLsHyhYK4bsWcvb38apiLbtAc8zOFQ7rq2xjzqKqmvVSFQi
 mMYBiMU6wtXJ6VbMQk5pGXrSvTPruf/bb+R7wjQWap5Fk4FapLw86WFOWJTDgWmion0sLDPo4E
 87Hf685h1B0yqYsYx1eDVFdYKgA/BCyqiIw/f4s+uIi3xjx/pNdqky09qifQZ77wSYeYDknRHE
 cR0Dx7LSkoEbgAj2RC/LXoRl+CJtA+b8+QcrrMrPezYSuh0aTynJb48P6B0+RtuH74KCgz29Wg
 1nI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 02/63] Input: atmel_mxt_ts - rework sysfs init/remove
Date:   Fri, 16 Aug 2019 17:28:51 +0900
Message-ID: <20190816082952.17985-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816082952.17985-1-jiada_wang@mentor.com>
References: <20190816082952.17985-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 71 +++++++++++++++++++-----
 1 file changed, 57 insertions(+), 14 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 573b94a049b2..79e35c929857 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2090,6 +2090,9 @@ static int mxt_initialize_input_device(struct mxt_data *data)
 	return error;
 }
 
+static int mxt_sysfs_init(struct mxt_data *data);
+static void mxt_sysfs_remove(struct mxt_data *data);
+
 static int mxt_configure_objects(struct mxt_data *data,
 				 const struct firmware *cfg);
 
@@ -2141,16 +2144,24 @@ static int mxt_initialize(struct mxt_data *data)
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
@@ -2803,6 +2814,7 @@ static int mxt_load_fw(struct device *dev, const char *fn)
 		if (ret)
 			goto release_firmware;
 
+		mxt_sysfs_remove(data);
 		mxt_free_input_device(data);
 		mxt_free_object_table(data);
 	} else {
@@ -2909,16 +2921,25 @@ static ssize_t mxt_update_fw_store(struct device *dev,
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
 
@@ -2926,6 +2947,28 @@ static const struct attribute_group mxt_attr_group = {
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
@@ -3109,22 +3152,21 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		msleep(MXT_RESET_INVALID_CHG);
 	}
 
-	error = mxt_initialize(data);
-	if (error)
-		return error;
-
-	error = sysfs_create_group(&client->dev.kobj, &mxt_attr_group);
+	error = sysfs_create_group(&client->dev.kobj, &mxt_fw_attr_group);
 	if (error) {
-		dev_err(&client->dev, "Failure %d creating sysfs group\n",
+		dev_err(&client->dev, "Failure %d creating fw sysfs group\n",
 			error);
-		goto err_free_object;
+		return error;
 	}
 
+	error = mxt_initialize(data);
+	if (error)
+		goto err_sysfs_remove_group;
+
 	return 0;
 
-err_free_object:
-	mxt_free_input_device(data);
-	mxt_free_object_table(data);
+err_sysfs_remove_group:
+	sysfs_remove_group(&client->dev.kobj, &mxt_fw_attr_group);
 	return error;
 }
 
@@ -3133,7 +3175,8 @@ static int mxt_remove(struct i2c_client *client)
 	struct mxt_data *data = i2c_get_clientdata(client);
 
 	disable_irq(data->irq);
-	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
+	sysfs_remove_group(&client->dev.kobj, &mxt_fw_attr_group);
+	mxt_sysfs_remove(data);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
 
-- 
2.19.2

