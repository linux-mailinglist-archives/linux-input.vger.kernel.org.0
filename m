Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78BA1B4AC0
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:38:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728189AbfIQJhm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:37:42 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:22003 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfIQJhl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:37:41 -0400
IronPort-SDR: xw17gOPBiFqvq51peR38c4D+4STpjjEzAN/q5hoJ5FjZ1ZyL8sqynAbswPqt6jd5lAjicQ9dPC
 4aFIJvIWbtspflNK7PaROiR6ULWI8Idogsuj2KizvwFm4RCR/I/qeDkPGAMpYw3YBZ8gtAQYjV
 DSi9G3IGg1eaTv0toH/J1ZWEYTaUHwZ6T2eqAU0BsZXuoM+gKmkoTPuNo8c8tkSMO2I7FXtUNY
 0wwsM5Wo3bkQsKj6C+KviOL97BxLEfot5CQDr8qe11Z57T0/cqu+AC3AsMQemjQOPkvE913A2I
 Fp0=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41423047"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:37:41 -0800
IronPort-SDR: lZRSJXgwfl7bIR9I5AdH3O2eDjCefzPacpTx0e0QikldvRpAVOI2dnwjgKPKbz/otfK8IlAs7Z
 HYJ07f8SYfbX/M7dtpZIQ//okW9512EHJ7VP1smWCXIL+6XD57Xoek98L/R7VnSy98KJMCwY0H
 3+AtH4TCXoL27AeSS8eTDi3udwoO1gi8CHun4OI4q167okO7TyusY5SivPU0vq11phjtjZacPf
 FZ3sZ38/a0nQAb5n2MGZ43gbdgFU9bsWFsUAp5nytX9dE6mue2XFd6THMI67Q80Yl36RFH4LJW
 NGo=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 12/49] Input: atmel_mxt_ts - add debug for T92 gesture and T93 touch seq msgs
Date:   Tue, 17 Sep 2019 18:36:27 +0900
Message-ID: <20190917093704.18439-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190917093704.18439-1-jiada_wang@mentor.com>
References: <20190917093704.18439-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-09.mgc.mentorg.com (147.34.90.209) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Karl Tsou <karl.funlab@gmail.com>

output T92 gesture and T93 touch sequence messages.

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit cb98986f8342107bf4a536aed4160b20839e97c1)
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 40 ++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 4e237209cb34..9dae1c2dd9d9 100644
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
+	dev_debug(dev, "T92 long stroke LSTR=%d %d\n",
+		 (status & 0x80) ? 1 : 0,
+		 status & 0x0F);
+}
+
+static void mxt_proc_t93_messages(struct mxt_data *data, u8 *msg)
+{
+	struct device *dev = &data->client->dev;
+	u8 status = msg[1];
+
+	dev_debug(dev, "T93 report double tap %d\n", status);
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

