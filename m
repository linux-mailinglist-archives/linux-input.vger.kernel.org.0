Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB0E21CA317
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:58:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbgEHF5p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:57:45 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:38668 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbgEHF5o (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:57:44 -0400
IronPort-SDR: FhaTmXxFBQFflkwhsPHp6bNpM2nqng0ezLThyFgFSN1JBK1dTEMAtjLyz91P63ipkjbAj1Rqzs
 ruVH0kPS9iURyINdF2tee70V3BcK7zyC3rrgjEesupMVXJ45lPT3V0q/iH8RZIssiQyP1T3AJo
 s6U/wyysnvFRo/u+HVMB0azBlz7DEXDAF2LLdagTdcRFFLbQwnJFuXZzeaEccsej5xW7rot05E
 C/NSKiqSfmKvBIUqMVzS3K6HgtiXtJ59A9bneE7vI+CsriMRKJ57sR41k42csokf4HcW19lJyX
 /Vc=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="50670063"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 07 May 2020 21:57:43 -0800
IronPort-SDR: TmXZ0tivA8Gceq1YeDeZ03sHiq8QqHiuj8NIa1BU944p9m3vfoVraf5Smr4kQnPjILez0ntZlq
 69xvfRriP/Cp3dujNkx4ge2iUQAyp97hpHj3PFNg7nk9zjVKXWOPmKs2re84PdfuWNuLeiheez
 nRq+0olhpPxDziZKZUzzhnx/mINZkMOIJN28aVXJ4+0pjsKa38OelABh6J+ieTlww6j+3NiwLV
 LAw1QNUUIL2mlcg06mW2cjPM3hWmYpURDD7Oodv1XYO/67Zh50ZG+G/8ZI8SKkUl+yb2Om1J3y
 BmA=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 11/56] Input: atmel_mxt_ts - add debug for T92 gesture and T93 touch seq msgs
Date:   Thu, 7 May 2020 22:56:11 -0700
Message-ID: <20200508055656.96389-12-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Karl Tsou <karl.funlab@gmail.com>

output T92 gesture and T93 touch sequence messages.

Signed-off-by: Karl Tsou <karl.funlab@gmail.com>
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
index 63db8b66eb67..6126bb8a7acc 100644
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

