Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13CB01993F4
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730377AbgCaKvX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:51:23 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43515 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730424AbgCaKvU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:51:20 -0400
IronPort-SDR: 4rVpxID+bA2mfJoVXMtBTbdg3O4QRfjHEoJcEhUVP7p1My5NfDA8fXfsBcPDdRT2gZr3UGEnPQ
 /mwR9g1LX7rojL/XViRyJpgOCboI3uDxdVnbiyNSVjvgYpGY+q+h5n0yRf7f2i+ewge/RuRLJ1
 MhZRfx+F7D6uIeZTw1jpXQRw49GtEt309vq/13aFQVmOQ+6WzBcxF7LLONTl6nM1Z+veYIoi73
 hZaWBsX2+BOGgfwfuuKUAzuJKgR90pgM+t6nmYde1HrQEP8jvxDtBZe9Z8FaTvuksGSXt8AyMJ
 P10=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330725"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:51:20 -0800
IronPort-SDR: RZ+I+4MxsrXODsWjEBP1HPOY9RNdGXxeapsC1ki+zerD5OuzBG1IndRVXF4b6ajHOomLFxQeeN
 EHiysL6i0EEGw0Mub9nKRcrEnL6B6VHbi7oCnCUsq2lFg3X/khlRYR2d/SoUdzhWgxXdicVFPz
 fd5uHGeExe4fP7RJnB7uxf/tmPQ4fbYZwFX6fGtnRfjWlCwi9RWlXJJ7oeTydRMYmoL/7/VDMo
 HifUM8yQkT4AFQ3MaKDiJ3UnuFddIZaXLoeE2BRSI7B6Cr6jbu/cWgKix9Akhy+bUUDInRmC0i
 1QY=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 06/55] Input: atmel_mxt_ts - output status from T42 Touch Suppression
Date:   Tue, 31 Mar 2020 03:50:02 -0700
Message-ID: <20200331105051.58896-7-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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
[jiada: Replace dev_info() with dev_dbg()]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a53985a7736f..f6465edaa57e 100644
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

