Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B311B8FE09
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbfHPIhu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:37:50 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1938 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbfHPIhu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:37:50 -0400
IronPort-SDR: 5OZnd0+IWRtCYMBQ9pRV0crmdquDlfRHSnJSrj7lVOFefzi/iLPOoBAKUVZZudax+Hx9Ti4FOz
 v3gLB6C93O3PHLRNPAozH3XziJpAGa5YlDm18UJXZqGxkVXNW66GgKwEJR1kqaPye9fkTg/LJA
 8ypKMyItCeTpo6o47fivpl1/DR+Ih5odiFBlCDLHVzLEP+fFjFSvxPPHULnXSH0Y6rv7LMWaEB
 e17GWecwNae8o1p/C32zOkYDoeEZBkOpssLY0IQ7o+SRU+rzvpoB3gcuvLM10YWlETm1u98JmL
 Qjc=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484267"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:34:44 -0800
IronPort-SDR: FO3knajk6ks0egcJg/gYdS+8eGqB28S17MTWXWTkvmmDK4kr6kmUjVFqJSxipm4Bf4U5RXgAEf
 bWAnPj9KlRsB2YBpl8C5uqAq/s7UMIpGMvdv5uL5tZmTPtZV2jAIaIUWCNffpL4grwfSc70Twe
 UEy4f24wny1k3WqBWX/b/K4L2EWIFyYkyj9pvjhDrWvHl0ZuPJnDyCB+WGhKuo0Ml6AxtP1Plt
 CQUz54WE/rBHihlHFiERyvvZm4JlKv+S/qbmXEc4yWXgY0BZKOWUZQA+TEhtSgcBn/teZ1TNQx
 5/U=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 30/63] Input: atmel_mxt_ts - implement debug output for messages
Date:   Fri, 16 Aug 2019 17:34:18 +0900
Message-ID: <20190816083451.18947-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

Add a debug switch which causes all messages from the touch controller to
be dumped to the dmesg log with a set prefix "MXT MSG:". This is used by
Atmel user-space utilities to debug touch operation. Enabling this output
does impact touch performance.

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit 3c3fcfdd4889dfeb1c80ae8cd94a622c6342b06a)
[gdavis: Forward port and fix conflicts.]
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 44 ++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index ba608d04ee82..e317900279ed 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -335,6 +335,7 @@ struct mxt_data {
 	u8 t100_aux_ampl;
 	u8 t100_aux_area;
 	u8 t100_aux_vect;
+	bool debug_enabled;
 	u8 max_reportid;
 	u32 config_crc;
 	u32 info_crc;
@@ -460,8 +461,8 @@ static bool mxt_object_readable(unsigned int type)
 
 static void mxt_dump_message(struct mxt_data *data, u8 *message)
 {
-	dev_dbg(&data->client->dev, "message: %*ph\n",
-		data->T5_msg_size, message);
+	dev_dbg(&data->client->dev, "MXT MSG: %*ph\n",
+		       data->T5_msg_size, message);
 }
 
 static int mxt_wait_for_completion(struct mxt_data *data,
@@ -1213,6 +1214,7 @@ static void mxt_proc_t93_messages(struct mxt_data *data, u8 *msg)
 static int mxt_proc_message(struct mxt_data *data, u8 *message)
 {
 	u8 report_id = message[0];
+	bool dump = data->debug_enabled;
 
 	if (report_id == MXT_RPTID_NOMSG)
 		return 0;
@@ -1247,9 +1249,12 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 	} else if (report_id == data->T93_reportid) {
 		mxt_proc_t93_messages(data, message);
 	} else {
-		mxt_dump_message(data, message);
+		dump = true;
 	}
 
+	if (dump)
+		mxt_dump_message(data, message);
+
 	return 1;
 }
 
@@ -3518,6 +3523,36 @@ static ssize_t mxt_update_cfg_store(struct device *dev,
 	return ret;
 }
 
+static ssize_t mxt_debug_enable_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	char c;
+
+	c = data->debug_enabled ? '1' : '0';
+	return scnprintf(buf, PAGE_SIZE, "%c\n", c);
+}
+
+static ssize_t mxt_debug_enable_store(struct device *dev,
+	struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	u8 i;
+	ssize_t ret;
+
+	if (kstrtou8(buf, 0, &i) == 0 && i < 2) {
+		data->debug_enabled = (i == 1);
+
+		dev_dbg(dev, "%s\n", i ? "debug enabled" : "debug disabled");
+		ret = count;
+	} else {
+		dev_dbg(dev, "debug_enabled write error\n");
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
 static DEVICE_ATTR(update_fw, S_IWUSR, NULL, mxt_update_fw_store);
 
 static struct attribute *mxt_fw_attrs[] = {
@@ -3534,6 +3569,8 @@ static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
 static DEVICE_ATTR(update_cfg, S_IWUSR, NULL, mxt_update_cfg_store);
 static DEVICE_ATTR(config_crc, S_IRUGO, mxt_config_crc_show, NULL);
+static DEVICE_ATTR(debug_enable, S_IWUSR | S_IRUSR, mxt_debug_enable_show,
+		   mxt_debug_enable_store);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
@@ -3541,6 +3578,7 @@ static struct attribute *mxt_attrs[] = {
 	&dev_attr_object.attr,
 	&dev_attr_update_cfg.attr,
 	&dev_attr_config_crc.attr,
+	&dev_attr_debug_enable.attr,
 	NULL
 };
 
-- 
2.19.2

