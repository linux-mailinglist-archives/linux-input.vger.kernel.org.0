Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E69F5192A27
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727527AbgCYNg5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:36:57 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:34650 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727400AbgCYNg5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:36:57 -0400
IronPort-SDR: unT5YIObJSHVrTm+wc76Jn5EZYYp74kpDDpIrMdtgmPMiK5cOLJxAAfJV0RN8BODbbrO9+N2ZP
 QmUDnhWbO98TIauS1p9Ohl+jMqYVicJs8GlW2I3Z9fI8scONy0yyrHWDxBJULxFzUQBhxvND/P
 racTNUME+jufTLy5YNM6UqgO21bjDXJ/HD52GTTetVO5NoNCEbVEuVuzM7eILC9v18kilPyi5l
 mINRqABStfLUF/BFg1vb2i8CjNVsT9/whdJV69gt6pVdp26RaM01p813K6zzd1VgbhUsAjkcCY
 Lg4=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47143551"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:36:56 -0800
IronPort-SDR: ZAze9VTvt6dkJ8/VryZkJEunYH4WXywWfmZOOV1dfPjpAriGxEcEvElO9h2qd/yT2mQL5pzaNo
 AlPwBliLsrM81ZzPTLqvgalUHbHbMBw9iofZNsNxIc6kWbV5sZeUxUyX/MZlgHUVT3rN4JV25e
 Vv0a4R8VT4x0rbwsMDzoZFSZzluv/g5Nm81h+DLryYx0sp/P0P9LCvS0FgSr852scws4JsBSax
 X5ob9zr4uxl+M7dxtmaOIjfx0av8i32hdW0qZuRv0rknofGZth9xIDN7wGxdS8y5XtrUeOfykt
 Gb0=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 49/55] Input: Atmel: handle ReportID "0x00" while processing T5 messages
Date:   Wed, 25 Mar 2020 06:33:28 -0700
Message-ID: <20200325133334.19346-50-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Deepak Das <deepak_das@mentor.com>

ReportID "0x00" is reserved by Atmel and should not be used by any
Atmel touch controller.

reportID is the first byte retrieved from T5 message payload.
Currently Atmel driver continues to process the T5 messages even if
the reportID "0x00" is returned by Touch Controller.

This commit modifies Atmel touch driver to return -EINVAL if ReportID
"0x00" is received while processing T5 messages.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index ed357e958f07..496b1f67d9a5 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -76,6 +76,7 @@
 #define MXT_PROCI_TOUCHSEQUENCELOGGER	93
 #define MXT_TOUCH_MULTITOUCHSCREEN_T100 100
 #define MXT_PROCI_ACTIVESTYLUS_T107	107
+#define MXT_RPTID_RESERVED		0
 
 /* MXT_GEN_MESSAGE_T5 object */
 #define MXT_RPTID_NOMSG		0xff
@@ -1381,6 +1382,11 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 	u8 report_id = message[0];
 	bool dump = data->debug_enabled;
 
+	if (report_id == MXT_RPTID_RESERVED) {
+		dev_err(&data->client->dev,
+			"Received Reserved ReportID 0x00\n");
+		return -EINVAL;
+	}
 	if (report_id == MXT_RPTID_NOMSG)
 		return 0;
 
@@ -1451,6 +1457,8 @@ static int mxt_read_and_process_messages(struct mxt_data *data, u8 count)
 		ret = mxt_proc_message(data,
 			data->msg_buf + data->T5_msg_size * i);
 
+		if (ret < 0)
+			return ret;
 		if (ret == 1)
 			num_valid++;
 	}
-- 
2.17.1

