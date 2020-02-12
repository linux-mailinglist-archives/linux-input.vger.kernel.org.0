Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB7AD15A3E9
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:51:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728554AbgBLIuV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:50:21 -0500
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:20070 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728478AbgBLIuV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:50:21 -0500
IronPort-SDR: 0ebU/gbnJ0WoFyY0OnIPia69Q4yiksaR2nOUnjphhO9nkQBbcTV3Fe8I16Qwb4AKd5TyhXPqqz
 HXYDWOoDAIo5mDJlDVEbMPHU1RY/CONdyHlCQIQA0pWQtRl3JcygfzotElwdIn1aWf8mbBUBs1
 J9dhju6JrSRAtF0oUvek8RY/Htp13LJIx+Xl0DYsker0l3Y/5TX1vDlEHxQzcyLOxjjZpWQLP5
 QNo574WvHGQ/vNVQ1TwQH8SqjLKy7Qcb7ErM3d+3PJK0QDXjTBZO0RZQZIZbA9dka5eNmmAwAk
 RxM=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="45799262"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:43:14 -0800
IronPort-SDR: of/dYvF3ME2Vp9LjplnC8Av27YIxk/mpHs9ohO8KO35KmHryloGV9uSBd8EBV37fbluAi8ygON
 7RhSkAx0eyfjp4ArglQmeG2Le8ROeDwXryE1QUEeR7fP+z0vUs6bVzd/UrmAEZy7Ctk2jnVsuG
 xIBlAfZTlhCaWKren78k269sNSZGqlIgVAtbxopzna3esltF03guwWJFi4nzJWVKmbqjUTtzFq
 XXK4sFdbPQSV/+OpiJ/z0EMFSMJIZvM6fgA2Jf+ovVJcHfKeIPzxblI7pk+6wIwmtOr/fMGwOV
 tMQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 06/48] Input: atmel_mxt_ts - output status from T42 Touch Suppression
Date:   Wed, 12 Feb 2020 00:41:36 -0800
Message-ID: <20200212084218.32344-7-jiada_wang@mentor.com>
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

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
Acked-by: Benson Leung <bleung@chromium.org>
Acked-by: Yufeng Shen <miletus@chromium.org>
(cherry picked from ndyer/linux/for-upstream commit ab95b5a309999d2c098daaa9f88d9fcfae7eb516)
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: Replace dev_info() with dev_dbg()]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 59ee743ec8d7..fe58bffda224 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -155,6 +155,9 @@ struct t37_debug {
 #define MXT_RESET_VALUE		0x01
 #define MXT_BACKUP_VALUE	0x55
 
+/* Define for MXT_PROCI_TOUCHSUPPRESSION_T42 */
+#define MXT_T42_MSG_TCHSUP	BIT(0)
+
 /* T100 Multiple Touch Touchscreen */
 #define MXT_T100_CTRL		0
 #define MXT_T100_CFG1		1
@@ -323,6 +326,8 @@ struct mxt_data {
 	u8 T9_reportid_max;
 	u16 T18_address;
 	u8 T19_reportid;
+	u8 T42_reportid_min;
+	u8 T42_reportid_max;
 	u16 T44_address;
 	u8 T48_reportid;
 	u8 T100_reportid_min;
@@ -979,6 +984,17 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
 	data->update_input = true;
 }
 
+static void mxt_proc_t42_messages(struct mxt_data *data, u8 *msg)
+{
+	struct device *dev = &data->client->dev;
+	u8 status = msg[1];
+
+	if (status & MXT_T42_MSG_TCHSUP)
+		dev_dbg(dev, "T42 suppress\n");
+	else
+		dev_dbg(dev, "T42 normal\n");
+}
+
 static int mxt_proc_t48_messages(struct mxt_data *data, u8 *msg)
 {
 	struct device *dev = &data->client->dev;
@@ -1006,6 +1022,9 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 
 	if (report_id == data->T6_reportid) {
 		mxt_proc_t6_messages(data, message);
+	} else if (report_id >= data->T42_reportid_min
+		   && report_id <= data->T42_reportid_max) {
+		mxt_proc_t42_messages(data, message);
 	} else if (report_id == data->T48_reportid) {
 		mxt_proc_t48_messages(data, message);
 	} else if (!data->input_dev) {
@@ -1686,6 +1705,8 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T9_reportid_max = 0;
 	data->T18_address = 0;
 	data->T19_reportid = 0;
+	data->T42_reportid_min = 0;
+	data->T42_reportid_max = 0;
 	data->T44_address = 0;
 	data->T48_reportid = 0;
 	data->T100_reportid_min = 0;
@@ -1763,6 +1784,10 @@ static int mxt_parse_object_table(struct mxt_data *data,
 		case MXT_SPT_COMMSCONFIG_T18:
 			data->T18_address = object->start_address;
 			break;
+		case MXT_PROCI_TOUCHSUPPRESSION_T42:
+			data->T42_reportid_min = min_id;
+			data->T42_reportid_max = max_id;
+			break;
 		case MXT_SPT_MESSAGECOUNT_T44:
 			data->T44_address = object->start_address;
 			break;
-- 
2.17.1

