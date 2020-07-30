Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4503232AC2
	for <lists+linux-input@lfdr.de>; Thu, 30 Jul 2020 06:18:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbgG3ERy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jul 2020 00:17:54 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:17855 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbgG3ERy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jul 2020 00:17:54 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Thu, 30 Jul 2020 00:17:51 EDT
IronPort-SDR: 9RkskvAB+kmOMTzUUrB64G94GReK7PVV/xTEmOO9zTNZlEqjwzEq0SxaOO1XPrtiy7NG3oxFp0
 gh/nopnq5JsZA+8WhLQdrP2r23TOeEWRvnnOR0k8IfgxmXmYVbHJmTAuy3QwOib7iXUrkkHu7x
 z1gZjMM63+ppga4PGoac5V8swoCyWv9Rk+twgbE3II2eQtbpZiJGPAqNU+k84tGRlwcov0URqz
 dVnQulXmfYELIc/pqAmLD9UnrUd8f1BLO9LTfTw8xlXqARTL7aX1BC27IoJ0jg891AGsh/L3cw
 ieU=
X-IronPort-AV: E=Sophos;i="5.75,413,1589270400"; 
   d="scan'208";a="51442063"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 29 Jul 2020 20:10:47 -0800
IronPort-SDR: bn2vMB281lyjinmdybJm5jGUzYfE01QrphUEyh+X1wmn8Sdo/v2NHC3LYdOcCBoMjeJOhYYC8a
 6HyWqFJbrbbgDMvWbO5Jds4vz5Rqi10etKx15xuoMMqOMrFbxm30qOtazB77iuHQFV9lKSbixP
 R6vV+hIj8zviIjeR9OCbZ/G54ruOJw5mG4Ch3ld8KSyp69Hgqb2dqOflGg27D5sGYqK58QkRiL
 1mUQjNJ3F04BcOt7gq3DQbfe6RnE2X65qYt4NiIRDv4zoTS9qXmJxKjgdXY2N35KXRNvDySYeZ
 ROE=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <digetx@gmail.com>, <jiada_wang@mentor.com>
Subject: [PATCH 2/2] Input: atmel_mxt_ts - output status from T42 Touch Suppression
Date:   Thu, 30 Jul 2020 13:10:39 +0900
Message-ID: <20200730041039.7646-2-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200730041039.7646-1-jiada_wang@mentor.com>
References: <20200730041039.7646-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

This patch outputs status from T42 touch suppression

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
Acked-by: Benson Leung <bleung@chromium.org>
Acked-by: Yufeng Shen <miletus@chromium.org>
(cherry picked from ndyer/linux/for-upstream commit ab95b5a309999d2c098daaa9f88d9fcfae7eb516)
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: Replace dev_info() with dev_dbg(),
	Move logical continuation to previous line to address checkpatch CHECK]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 729c8dcb9cd1..b260f8c70c11 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -160,6 +160,9 @@ struct t37_debug {
 #define MXT_T48_MSG_NOISESUP_STATCHG	BIT(4)
 #define MXT_T48_MSG_NOISESUP_NLVLCHG	BIT(5)
 
+/* Define for MXT_PROCI_TOUCHSUPPRESSION_T42 */
+#define MXT_T42_MSG_TCHSUP	BIT(0)
+
 /* T100 Multiple Touch Touchscreen */
 #define MXT_T100_CTRL		0
 #define MXT_T100_CFG1		1
@@ -326,6 +329,8 @@ struct mxt_data {
 	u8 T9_reportid_min;
 	u8 T9_reportid_max;
 	u8 T19_reportid;
+	u8 T42_reportid_min;
+	u8 T42_reportid_max;
 	u16 T44_address;
 	u8 T48_reportid;
 	u8 T100_reportid_min;
@@ -960,6 +965,17 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
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
@@ -987,6 +1003,9 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 
 	if (report_id == data->T6_reportid) {
 		mxt_proc_t6_messages(data, message);
+	} else if (report_id >= data->T42_reportid_min &&
+		   report_id <= data->T42_reportid_max) {
+		mxt_proc_t42_messages(data, message);
 	} else if (report_id == data->T48_reportid) {
 		mxt_proc_t48_messages(data, message);
 	} else if (!data->input_dev) {
@@ -1633,6 +1652,8 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T9_reportid_min = 0;
 	data->T9_reportid_max = 0;
 	data->T19_reportid = 0;
+	data->T42_reportid_min = 0;
+	data->T42_reportid_max = 0;
 	data->T44_address = 0;
 	data->T48_reportid = 0;
 	data->T100_reportid_min = 0;
@@ -1707,6 +1728,10 @@ static int mxt_parse_object_table(struct mxt_data *data,
 						object->num_report_ids - 1;
 			data->num_touchids = object->num_report_ids;
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

