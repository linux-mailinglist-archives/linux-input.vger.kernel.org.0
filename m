Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67975F0FD2
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 08:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731419AbfKFHCh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 02:02:37 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:18550 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbfKFHCg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 02:02:36 -0500
IronPort-SDR: rG2M5fTk9K0JBZ/i+jF0CltrurD4hP6UwBfXwtoibZsfIHxY7Dz0SzIcPaWD5Rj6+XAhj6xhYk
 uz6OmwXoNGgQTQ04Y0C44VWoTUrMC5KfkI9S7sar2p4qUHLHSCD+4pocC2NCDB7NneIXgu0kbi
 Rdgf1bj3CXW3E7d6YrQTokpaMiEefkfUkzw/9DKZfd5WP7kToWOVslVgJvYD4l68lO1EapHURt
 8jcs9C8406WQzmNBg5HfyMDIoYpdt9hnvngjDO4WxjvKcRbi2k5r3xEz/y/60bqTt7KTgIPvEh
 btM=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="44759225"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 05 Nov 2019 23:02:35 -0800
IronPort-SDR: 6qKX6YjvZ3Pjwwu3Hejy5VxBvWEN/fCNoc+Iqveia9gXoq7a0X1jutFNuD7nyhzSrYSmT8ptYI
 /kmc2vi4oc0XmcaklhtBf+EbsGLpS6TE+EeBEmLc/VBe6yr66ZMxE5ZDBr8JUod/brYhaq39TN
 VWEOpqaxtaRB376rb9k7ObrOSvFD8KD6laE4rRoa7+Zt3ntBv5LYqUHlLUIMbQo9hSzKk1T3Hi
 A9aQUB6BKkil2v0qIhVSevVX0pHeqpq4uy9v8W5zewVJR3w9k/a1Zzwe3MRTQr+YlK/BnPCCCW
 0vw=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v5 11/48] Input: atmel_mxt_ts - add debug for T92 gesture and T93 touch seq msgs
Date:   Wed, 6 Nov 2019 16:01:09 +0900
Message-ID: <20191106070146.18759-12-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106070146.18759-1-jiada_wang@mentor.com>
References: <20191106070146.18759-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Karl Tsou <karl.funlab@gmail.com>

output T92 gesture and T93 touch sequence messages.

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit cb98986f8342107bf4a536aed4160b20839e97c1)
Signed-off-by: George G. Davis <george_davis@mentor.com>
Reported-by: kbuild test robot <lkp@intel.com>
[jiada: changed dev_debug() to dev_info()]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 0557aea20067..1498342c3d98 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -71,6 +71,8 @@
 #define MXT_SPT_MESSAGECOUNT_T44	44
 #define MXT_SPT_CTECONFIG_T46		46
 #define MXT_SPT_DYNAMICCONFIGURATIONCONTAINER_T71 71
+#define MXT_PROCI_SYMBOLGESTUREPROCESSOR	92
+#define MXT_PROCI_TOUCHSEQUENCELOGGER	93
 #define MXT_TOUCH_MULTITOUCHSCREEN_T100 100
 #define MXT_PROCI_ACTIVESTYLUS_T107	107
 
@@ -349,6 +351,10 @@ struct mxt_data {
 	u8 T42_reportid_max;
 	u16 T44_address;
 	u8 T48_reportid;
+	u16 T92_address;
+	u8 T92_reportid;
+	u16 T93_address;
+	u8 T93_reportid;
 	u8 T100_reportid_min;
 	u8 T100_reportid_max;
 	u16 T107_address;
@@ -1113,6 +1119,24 @@ static int mxt_proc_t48_messages(struct mxt_data *data, u8 *msg)
 	return 0;
 }
 
+static void mxt_proc_t92_messages(struct mxt_data *data, u8 *msg)
+{
+	struct device *dev = &data->client->dev;
+	u8 status = msg[1];
+
+	dev_info(dev, "T92 long stroke LSTR=%d %d\n",
+		 (status & 0x80) ? 1 : 0,
+		 status & 0x0F);
+}
+
+static void mxt_proc_t93_messages(struct mxt_data *data, u8 *msg)
+{
+	struct device *dev = &data->client->dev;
+	u8 status = msg[1];
+
+	dev_info(dev, "T93 report double tap %d\n", status);
+}
+
 static int mxt_proc_message(struct mxt_data *data, u8 *message)
 {
 	u8 report_id = message[0];
@@ -1145,6 +1169,10 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 	} else if (report_id >= data->T15_reportid_min
 		   && report_id <= data->T15_reportid_max) {
 		mxt_proc_t15_messages(data, message);
+	} else if (report_id == data->T92_reportid) {
+		mxt_proc_t92_messages(data, message);
+	} else if (report_id == data->T93_reportid) {
+		mxt_proc_t93_messages(data, message);
 	} else {
 		mxt_dump_message(data, message);
 	}
@@ -1814,6 +1842,10 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T42_reportid_max = 0;
 	data->T44_address = 0;
 	data->T48_reportid = 0;
+	data->T92_reportid = 0;
+	data->T92_address = 0;
+	data->T93_reportid = 0;
+	data->T93_address = 0;
 	data->T100_reportid_min = 0;
 	data->T100_reportid_max = 0;
 	data->max_reportid = 0;
@@ -1906,6 +1938,14 @@ static int mxt_parse_object_table(struct mxt_data *data,
 		case MXT_PROCG_NOISESUPPRESSION_T48:
 			data->T48_reportid = min_id;
 			break;
+		case MXT_PROCI_SYMBOLGESTUREPROCESSOR:
+			data->T92_reportid = min_id;
+			data->T92_address = object->start_address;
+			break;
+		case MXT_PROCI_TOUCHSEQUENCELOGGER:
+			data->T93_reportid = min_id;
+			data->T93_address = object->start_address;
+			break;
 		case MXT_TOUCH_MULTITOUCHSCREEN_T100:
 			data->multitouch = MXT_TOUCH_MULTITOUCHSCREEN_T100;
 			data->T100_reportid_min = min_id;
-- 
2.17.1

