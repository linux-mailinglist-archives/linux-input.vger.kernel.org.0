Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9768718BA15
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728129AbgCSPCY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:02:24 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:16097 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbgCSPCY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:02:24 -0400
IronPort-SDR: Bv49ZsGTTNOxYrDxlZi43iL1dBnPC1rLdbrwd9rCzcB68DK1Pely9KV9zPSK61rBkqSJ6fJ60K
 c1ggTCpMVJht3wFQzFcmZ54WtISbqGLoQNDc2Pf+3WkALroF9QBehJTn55lIv/EVxbzds4Huzo
 S7FmnGv1/fpJNY4utwKOV+Pn8bSmopRliVp+EiiFUUxtLhLz3vIThINWLmgwTAmK1ZKsykov0s
 8sFSRmBEnhBH3bIlrRTjPUtajza7Xhg0ZEPVrYrrNxryug6kZSeTaXgdbIwhBpb+nSPIRTGsva
 Rrg=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="48850347"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:02:23 -0800
IronPort-SDR: OhiAWB4TLJDcXnwdj0IrUqS8MTXx3b1Be1OUlqFd+GjkmwtnedSafK6Q21PeUWxBeo1c1lwnHg
 gHzzIhvTqakO9bnnYh7woP6dVZufH0kgnBjTv1f2aPe79Zd/dnwmvcgDiyqryJ4Ools0pcaag3
 63o6zqCD4sKBIgonuszlecKGOV794+xtterg/1J+4QzHwDR4Gs55zD0M+1SOCTwFZU9WqvjoMl
 CWAByLYVIYgESEctvggX5GQ/l9rH7U4xquCyRSLKRR34QeX4ZTGU4gpCxrQtj4Jv4nkdI7+z58
 7sY=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 31/52] Input: atmel_mxt_ts - implement debug output for messages
Date:   Thu, 19 Mar 2020 07:59:55 -0700
Message-ID: <20200319150016.61398-32-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
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
[jiada: Replace symbolic permissions 'S_IWUSR | S_IRUSR' with 0600]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 47 ++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 2c3a59ff70c4..10da40c6c91b 100644
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
@@ -460,8 +461,11 @@ static bool mxt_object_readable(unsigned int type)
 
 static void mxt_dump_message(struct mxt_data *data, u8 *message)
 {
-	dev_dbg(&data->client->dev, "message: %*ph\n",
-		data->T5_msg_size, message);
+	/* debug message with prefix 'MXT MSG:' used by
+	 * Atmel user-space utilities to debug touch operation
+	 */
+	dev_dbg(&data->client->dev, "MXT MSG: %*ph\n",
+		       data->T5_msg_size, message);
 }
 
 static int mxt_wait_for_completion(struct mxt_data *data,
@@ -1211,6 +1215,7 @@ static void mxt_proc_t93_messages(struct mxt_data *data, u8 *msg)
 static int mxt_proc_message(struct mxt_data *data, u8 *message)
 {
 	u8 report_id = message[0];
+	bool dump = data->debug_enabled;
 
 	if (report_id == MXT_RPTID_NOMSG)
 		return 0;
@@ -1245,9 +1250,12 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
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
 
@@ -3519,6 +3527,36 @@ static ssize_t mxt_update_cfg_store(struct device *dev,
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
 static DEVICE_ATTR(update_fw, 0200, NULL, mxt_update_fw_store);
 
 static struct attribute *mxt_fw_attrs[] = {
@@ -3535,6 +3573,8 @@ static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
 static DEVICE_ATTR(update_cfg, 0200, NULL, mxt_update_cfg_store);
 static DEVICE_ATTR(config_crc, 0444, mxt_config_crc_show, NULL);
+static DEVICE_ATTR(debug_enable, 0600, mxt_debug_enable_show,
+		   mxt_debug_enable_store);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
@@ -3542,6 +3582,7 @@ static struct attribute *mxt_attrs[] = {
 	&dev_attr_object.attr,
 	&dev_attr_update_cfg.attr,
 	&dev_attr_config_crc.attr,
+	&dev_attr_debug_enable.attr,
 	NULL
 };
 
-- 
2.17.1

