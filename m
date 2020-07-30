Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9F98232AC0
	for <lists+linux-input@lfdr.de>; Thu, 30 Jul 2020 06:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbgG3ERv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jul 2020 00:17:51 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:17855 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727100AbgG3ERv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jul 2020 00:17:51 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Thu, 30 Jul 2020 00:17:51 EDT
IronPort-SDR: s3AX8Xk+eP4GHWh71n0r4MF5XfR0UP2wz5nOlHz/UqJR3tI8qt2wOQJrh72GTDOfAq5T6Tj9y5
 MYsk0fjBKdQj8efmD/6mkXMHYexEinv9t6zqIpMygV4dC9hXYenoKJ4NrbSZipMYMZAO1lSlox
 wpJChq22ZDeGyj+Ugxgj/BnJqNJd1t3CfzCih2oWQBo6e+lX6wwPkZ8G7i3K5J7rZayKZxUKhU
 n1BNdJL5mHmdoUOmDeSwT9NvYnOS7XHItLiJ9EdZq7zhjCUHwP0qjMjtwJRY1Af6OYOMVjjMhd
 tEU=
X-IronPort-AV: E=Sophos;i="5.75,413,1589270400"; 
   d="scan'208";a="51442062"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 29 Jul 2020 20:10:44 -0800
IronPort-SDR: DAHYhYVGJhfbYMeBtKq/QfJdpkuqJbWTf4IlI/h71X/sHN0fueVfCLAoLD1BqbiaR8yBlcqjQo
 /Ue9tcfc9qpBnG/bJxxTLs6Jk9PWhGI9PN2lXPXMMQZ0A0VUQk++C34UotMVFKhm/PF1yjmcCD
 ERnuyqvj5/eXLsqmwFbPLWd7k7IhlnCzi2tuzFSK73QHKh96u41KPMEt06kx5wLDiM1qZdnQQm
 6JT929Uz/vI0gXewEm58a7l4CVVT0EFJIgrangY81L5IqTwqXXmJc5XC5brRJgxZ+0ThffaPNT
 QTc=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <digetx@gmail.com>, <jiada_wang@mentor.com>
Subject: [PATCH 1/2] Input: atmel_mxt_ts - output status from T48 Noise Suppression
Date:   Thu, 30 Jul 2020 13:10:38 +0900
Message-ID: <20200730041039.7646-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

This patch outputs status from T48 Noise Suppression

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
Acked-by: Benson Leung <bleung@chromium.org>
Acked-by: Yufeng Shen <miletus@chromium.org>
(cherry picked from ndyer/linux/for-upstream commit 2895a6ff150a49f27a02938f8d262be238b296d8)
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: Replace bits with symbolic names,
	Fixed typo in commit title & message]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a2189739e30f..729c8dcb9cd1 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -153,6 +153,13 @@ struct t37_debug {
 #define MXT_RESET_VALUE		0x01
 #define MXT_BACKUP_VALUE	0x55
 
+/* Define for MXT_PROCG_NOISESUPPRESSION_T48 */
+#define MXT_T48_MSG_NOISESUP_FREQCHG	BIT(0)
+#define MXT_T48_MSG_NOISESUP_APXCHG	BIT(1)
+#define MXT_T48_MSG_NOISESUP_ALGOERR	BIT(2)
+#define MXT_T48_MSG_NOISESUP_STATCHG	BIT(4)
+#define MXT_T48_MSG_NOISESUP_NLVLCHG	BIT(5)
+
 /* T100 Multiple Touch Touchscreen */
 #define MXT_T100_CTRL		0
 #define MXT_T100_CFG1		1
@@ -320,6 +327,7 @@ struct mxt_data {
 	u8 T9_reportid_max;
 	u8 T19_reportid;
 	u16 T44_address;
+	u8 T48_reportid;
 	u8 T100_reportid_min;
 	u8 T100_reportid_max;
 
@@ -952,6 +960,24 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
 	data->update_input = true;
 }
 
+static int mxt_proc_t48_messages(struct mxt_data *data, u8 *msg)
+{
+	struct device *dev = &data->client->dev;
+	u8 status, state;
+
+	status = msg[1];
+	state  = msg[4];
+
+	dev_dbg(dev, "T48 state %d status %02X %s%s%s%s%s\n", state, status,
+		status & MXT_T48_MSG_NOISESUP_FREQCHG ? "FREQCHG " : "",
+		status & MXT_T48_MSG_NOISESUP_APXCHG ? "APXCHG " : "",
+		status & MXT_T48_MSG_NOISESUP_ALGOERR ? "ALGOERR " : "",
+		status & MXT_T48_MSG_NOISESUP_STATCHG ? "STATCHG " : "",
+		status & MXT_T48_MSG_NOISESUP_NLVLCHG ? "NLVLCHG " : "");
+
+	return 0;
+}
+
 static int mxt_proc_message(struct mxt_data *data, u8 *message)
 {
 	u8 report_id = message[0];
@@ -961,6 +987,8 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 
 	if (report_id == data->T6_reportid) {
 		mxt_proc_t6_messages(data, message);
+	} else if (report_id == data->T48_reportid) {
+		mxt_proc_t48_messages(data, message);
 	} else if (!data->input_dev) {
 		/*
 		 * Do not report events if input device
@@ -1606,6 +1634,7 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T9_reportid_max = 0;
 	data->T19_reportid = 0;
 	data->T44_address = 0;
+	data->T48_reportid = 0;
 	data->T100_reportid_min = 0;
 	data->T100_reportid_max = 0;
 	data->max_reportid = 0;
@@ -1684,6 +1713,9 @@ static int mxt_parse_object_table(struct mxt_data *data,
 		case MXT_SPT_GPIOPWM_T19:
 			data->T19_reportid = min_id;
 			break;
+		case MXT_PROCG_NOISESUPPRESSION_T48:
+			data->T48_reportid = min_id;
+			break;
 		case MXT_TOUCH_MULTITOUCHSCREEN_T100:
 			data->multitouch = MXT_TOUCH_MULTITOUCHSCREEN_T100;
 			data->T100_reportid_min = min_id;
-- 
2.17.1

