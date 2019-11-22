Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09C611067C4
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfKVIY1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:24:27 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:52461 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbfKVIYY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:24:24 -0500
IronPort-SDR: ewDxBn7sC45V0HzpCQoh7CeQW+cmbnBrOPikYepscSHphyelcghCvauDv5JHXOwhmXlrA6rS2a
 FsZ5jD5PF3VvJu4FFUa4Cbp6QYqoXUsaPVvkyWh17VNHPaLt4KXZu5Itb1k7H5sqa814dt1E00
 N41rCPJQWXBHimB97uo70OftC/sBQaB+JRAxmpcfoVeyIUZk/IydgIsug5CgJslvGX/y44vvQQ
 5npqm1XB0HW0dIHa28pw3zTeoW3l7E++WKj5iv9c052h38GxJ8fdZ/LasF5E4vU5vicuiCV2j5
 +oQ=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43358897"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:24:24 -0800
IronPort-SDR: MrR4zNjtpf45UUZ275EPPwhlhjrWVr6lRivcHlinQUmyym7E5Tr2GvnhPLcQSDCkatvTKoCq0m
 tXK38pE/4Eyam/bU/fJB6zk3k69aEQjw9ldpWlKVPtRH1kxuVXEm+LDY14F3kkBFsqBrssEr8d
 7bO/8OragAiTVuD8iGT3jMw4xox+G5+a0VLALiWJIYVh5tj/sxhzWTfK4+AkXuLyaa78YF/Zuu
 esngP0v+lJYe70alknXdDv5jPDt2mHX/HDypunZ9QM7JHRdT1AX/b3dtEsjnkOuICDeiE70G3z
 XuA=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 05/48] Input: atmel_mxt_ts - output status from T48 Noise Supression
Date:   Fri, 22 Nov 2019 17:23:19 +0900
Message-ID: <20191122082402.18173-6-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
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
(cherry picked from ndyer/linux/for-upstream commit 2895a6ff150a49f27a02938f8d262be238b296d8)
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 25 ++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 9088b2d3266b..41a69ec5395a 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -324,6 +324,7 @@ struct mxt_data {
 	u16 T18_address;
 	u8 T19_reportid;
 	u16 T44_address;
+	u8 T48_reportid;
 	u8 T100_reportid_min;
 	u8 T100_reportid_max;
 
@@ -978,6 +979,24 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
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
+		status & 0x01 ? "FREQCHG " : "",
+		status & 0x02 ? "APXCHG " : "",
+		status & 0x04 ? "ALGOERR " : "",
+		status & 0x10 ? "STATCHG " : "",
+		status & 0x20 ? "NLVLCHG " : "");
+
+	return 0;
+}
+
 static int mxt_proc_message(struct mxt_data *data, u8 *message)
 {
 	u8 report_id = message[0];
@@ -987,6 +1006,8 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 
 	if (report_id == data->T6_reportid) {
 		mxt_proc_t6_messages(data, message);
+	} else if (report_id == data->T48_reportid) {
+		mxt_proc_t48_messages(data, message);
 	} else if (!data->input_dev) {
 		/*
 		 * Do not report events if input device
@@ -1666,6 +1687,7 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T18_address = 0;
 	data->T19_reportid = 0;
 	data->T44_address = 0;
+	data->T48_reportid = 0;
 	data->T100_reportid_min = 0;
 	data->T100_reportid_max = 0;
 	data->max_reportid = 0;
@@ -1747,6 +1769,9 @@ static int mxt_parse_object_table(struct mxt_data *data,
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

