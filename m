Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4FE19DDC8
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbfH0G1w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:27:52 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:11303 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfH0G1w (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:27:52 -0400
IronPort-SDR: 8L/n9om6DQj2ZhU9Q5nY0XiHx6cBPpTei2q8sOJubxsYAdUEVbfh7ajrJtu2OQ3tf4WyVCHzjl
 /GpJvQoiJ3tsBuuJOpwcVn0J8XOUgFPkRhdxxK62kKExvErr//Hr7JFcnasrreV/hJEzmKmPXd
 tbIxgyQZSVkHtBu8IdoppOYJZoQwvH/UcqyxrufKO0npcosbheHK2EvI0rV3x8e/g1FVmwF2Sk
 YSA6b3Z9eNwtBIoSTdf41mNTI3rnD9fqmgP0viaB09cgBK8kiGYdDUgUz1elcCke18BmnF3cyb
 ZuQ=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="42589347"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:27:51 -0800
IronPort-SDR: b05IUv7Tc4c9Z0TaATr5D0m8ntk56jXCqWK4KpQw9FI9k/QSGLw7QjVZ7j8WcfhNPAzsG7u1T5
 fbEevv5T0QoLarWUN8SkCr2jA6O4KkL/Tl4csw5/Qd9L1JFMo5jL7IHOtnGWCODtjhVRqiIuMv
 ijPxytUXASE+eRtjCJUbCaHy2SKdbH8R/K1ml+jx0F1aVTe11JSFkhz2dcWL41WL9lCb65csMY
 pW3PFDesSHcj/zPosiB0C6FPqolqkX8Pz5Kib9YR9/rYy19wKiunU3UmnG/lEyMdwFwEPrSVkJ
 13g=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 12/49] Input: atmel_mxt_ts - add debug for T92 gesture and T93 touch seq msgs
Date:   Tue, 27 Aug 2019 15:27:19 +0900
Message-ID: <20190827062756.20380-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190827062756.20380-1-jiada_wang@mentor.com>
References: <20190827062756.20380-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-08.mgc.mentorg.com (147.34.90.208) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Karl Tsou <karl.funlab@gmail.com>

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit cb98986f8342107bf4a536aed4160b20839e97c1)
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 4e237209cb34..26861252c088 100644
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
2.19.2

