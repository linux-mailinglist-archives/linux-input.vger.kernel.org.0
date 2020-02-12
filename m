Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08CF315A3A4
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbgBLIqB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:46:01 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:43395 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728493AbgBLIp6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:45:58 -0500
IronPort-SDR: rlIYzEL6YUiC+6Z9kVEoE+h3jjhbxtQTPKDKQ1GmvAZX9uVnu/J3mF3YMxezncVbe0Sa3hMLAy
 B4SCwq+RPkNt3TLN75ktwgRCDgPOlVRTTLJq67Ours2xKPP+PjEpnKDn4hwytLlR6og8ghV0gG
 5DaBuR6qBA5SRnx0D07oXye+dccK1HE3jmcNlZTJGOmoqFYfldttPOyAVc5z7FgjeKGx5FEbc5
 U43vwDy2gotxM0KXEH1k4qvAKP8htY+78sCVg4P1b3yPd/gZvi44knB535wGEBp6zFQe2Dn5oK
 2GA=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="47667063"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:45:57 -0800
IronPort-SDR: ONU7RM8EKjPUUKPPXv6wJ0N6FUXN7wV0Nzv4NfaIHVC2QSHPCjpiavBphbZKwOat5FXHk9LJ+N
 k/X7NIZTBKG7c2d3otLWKZ2TGJA2sHvVkj8JVg866mIMcvAdgLaSJnMWmuLA1/5QrWiul6OT9A
 YeR6JJR9GJMczGTg5L7KSIp7B5ybju0ZnGknUaq5wUFlUHUVKcPfqKXq/ky8sifILcC6EPrlRZ
 VwZ6ukxNF2GSNqd3xrZR6Qj3L3+Ll2ym98Izq/4RJbFt0Uzxv+SnN2omxZrubTpJ250XJjpI8x
 Tfk=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 28/48] Input: atmel_mxt_ts - implement debug output for messages
Date:   Wed, 12 Feb 2020 00:41:58 -0800
Message-ID: <20200212084218.32344-29-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
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
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 47 ++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 64770d646052..1652618a8daa 100644
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
 static DEVICE_ATTR(update_fw, S_IWUSR, NULL, mxt_update_fw_store);
 
 static struct attribute *mxt_fw_attrs[] = {
@@ -3535,6 +3573,8 @@ static DEVICE_ATTR(hw_version, S_IRUGO, mxt_hw_version_show, NULL);
 static DEVICE_ATTR(object, S_IRUGO, mxt_object_show, NULL);
 static DEVICE_ATTR(update_cfg, S_IWUSR, NULL, mxt_update_cfg_store);
 static DEVICE_ATTR(config_crc, S_IRUGO, mxt_config_crc_show, NULL);
+static DEVICE_ATTR(debug_enable, S_IWUSR | S_IRUSR, mxt_debug_enable_show,
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

