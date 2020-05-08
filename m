Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30CBD1CA35D
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 08:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727107AbgEHF76 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:59:58 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:22062 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727104AbgEHF7S (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:59:18 -0400
IronPort-SDR: Ef7ooS/g+dUBxga/7WSmWDbeAMsS/BZITWmQnYCoEU8Tu5FqQMogSADT9IrufU0VHPhoACSnic
 JcySAcnNnmhHsp85ER/xqzUhbaf5I7fUx/D7Wkjs+xRRIF2P6Rifcl/dSapiz21CmbRCiGmmwF
 BiCzQn5SejSRnxW8asn9POa5d0cY1cL2muKJ0YgFDAu+wcvr10tCh3/CPWJCu2ONQzH1H/Q2IX
 OtKkvHDB1v1CtSWblsA/tBuEfgquHdEfFmLl5liXbTZuLlK8FqhXDl5RsuAHMJK72WTAc+EBzf
 Peo=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="48589120"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 07 May 2020 21:59:17 -0800
IronPort-SDR: /151iejCQ14UkWcq1PC2SpC2EGv6MEZlEhO+H4MrdNPMSdiDiKHosyb/L1NP2kFFslHfnf5NzY
 o4K28EdsRSpuIXVJLXmCxVt6X+kJ7hmO8FBlUrNX/HQ+8YLIlyJlFJbX13qknUJwkyNiWgrxql
 PS0rGM/trQPStR7NQ5VZCGGh+4a3tBeYjOsskeTzu00Yoajxak3tCyPGvDkBVYPGlUE8OYIDEj
 yJJWCb8jgY5bA9C3EGQsacxuAH+9CDRE++UkZJkVft7gEnNSDoJbW0iF4784neiZxj2LRvSue4
 ak4=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 36/56] Input: atmel_mxt_ts - implement debug output for messages
Date:   Thu, 7 May 2020 22:56:36 -0700
Message-ID: <20200508055656.96389-37-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
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
[jiada: Rename mxt_debug_enable_store to debug_enable_store
	Rename mxt_debug_enable_show to debug_enable_show
	Replace DEVICE_ATTR with DEVICE_ATTR_RW]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 46 ++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 1027ebbc3978..7d48c4d1f57d 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -336,6 +336,7 @@ struct mxt_data {
 	u8 t100_aux_ampl;
 	u8 t100_aux_area;
 	u8 t100_aux_vect;
+	bool debug_enabled;
 	u8 max_reportid;
 	u32 config_crc;
 	u32 info_crc;
@@ -461,8 +462,11 @@ static bool mxt_object_readable(unsigned int type)
 
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
@@ -1212,6 +1216,7 @@ static void mxt_proc_t93_messages(struct mxt_data *data, u8 *msg)
 static int mxt_proc_message(struct mxt_data *data, u8 *message)
 {
 	u8 report_id = message[0];
+	bool dump = data->debug_enabled;
 
 	if (report_id == MXT_RPTID_NOMSG)
 		return 0;
@@ -1246,9 +1251,12 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
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
 
@@ -3498,6 +3506,36 @@ static ssize_t update_cfg_store(struct device *dev,
 	return ret;
 }
 
+static ssize_t debug_enable_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	char c;
+
+	c = data->debug_enabled ? '1' : '0';
+	return scnprintf(buf, PAGE_SIZE, "%c\n", c);
+}
+
+static ssize_t debug_enable_store(struct device *dev,
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
 static DEVICE_ATTR_WO(update_fw);
 
 static struct attribute *mxt_fw_attrs[] = {
@@ -3514,6 +3552,7 @@ static DEVICE_ATTR_RO(hw_version);
 static DEVICE_ATTR_RO(object);
 static DEVICE_ATTR_WO(update_cfg);
 static DEVICE_ATTR_RO(config_crc);
+static DEVICE_ATTR_RW(debug_enable);
 
 static struct attribute *mxt_attrs[] = {
 	&dev_attr_fw_version.attr,
@@ -3521,6 +3560,7 @@ static struct attribute *mxt_attrs[] = {
 	&dev_attr_object.attr,
 	&dev_attr_update_cfg.attr,
 	&dev_attr_config_crc.attr,
+	&dev_attr_debug_enable.attr,
 	NULL
 };
 
-- 
2.17.1

