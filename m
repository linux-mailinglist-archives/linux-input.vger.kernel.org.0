Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7712B106804
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727726AbfKVI0o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:26:44 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:4485 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727020AbfKVI0m (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:26:42 -0500
IronPort-SDR: nUKXrlh/pIQZ7db4cRbqISlRDADkhgjt0NBfcWs94CBz1s+Do6639qW5uwORufKLmXvOP58Jt1
 SHV9gBrUtAdnkKDPvGXFlKxtPv0356hLzUKTVQ5I/6tIs/PtAqT+PXVVhsN9iaf7+lBSBNyOfL
 el96ThDw2fTC56NsYeGk2ANegplZrQT2l0GXoKMLdL3It/gBqApWqvBg7cfUcYPxn4+/3unYo+
 kc/DAPkJe14z1KiC5lNYxOGRQolLcLPymmJhtZIrlnidHQ1Dlzz/y1KTVhn/DmI443MpUhmmjD
 wn8=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43419513"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:26:42 -0800
IronPort-SDR: EhT1w9diO6exW+ZYwZErq89l9cksFudE+O94WET14gCjsC2dNsgjgqr2NKiW1bnjoZwOYA2O8R
 dubRfX9BtVD9gfIhlXPJLUuyMQSX0uAPbRkbwgVzpIVOWb9nDo1jliFfvHFOb3O94mINyQ1FHW
 MCCDW14ZNUZF1rTFpmT9psFiX6U1Xylfatt7RPTs9rDBlRXblG5kOE6NcHs1pJfb+Nm2H+AlAR
 K2FtjQYqvwP0RYM2dYh2WZgTGj18N5dAcj0lAcpIsyrMEBBERhECgPzbk2wHW3mj//nH5J1kZV
 xgY=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 42/48] Input: Atmel: handle ReportID "0x00" while processing T5 messages
Date:   Fri, 22 Nov 2019 17:23:56 +0900
Message-ID: <20191122082402.18173-43-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
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
index e3ed74e7c270..8d6478834fd8 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -76,6 +76,7 @@
 #define MXT_PROCI_TOUCHSEQUENCELOGGER	93
 #define MXT_TOUCH_MULTITOUCHSCREEN_T100 100
 #define MXT_PROCI_ACTIVESTYLUS_T107	107
+#define MXT_RPTID_RESERVED		0
 
 /* MXT_GEN_MESSAGE_T5 object */
 #define MXT_RPTID_NOMSG		0xff
@@ -1384,6 +1385,11 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 	u8 report_id = message[0];
 	bool dump = data->debug_enabled;
 
+	if (report_id == MXT_RPTID_RESERVED) {
+		dev_err(&data->client->dev,
+			"Received Reserved ReportID 0x00\n");
+		return -EINVAL;
+	}
 	if (report_id == MXT_RPTID_NOMSG)
 		return 0;
 
@@ -1454,6 +1460,8 @@ static int mxt_read_and_process_messages(struct mxt_data *data, u8 count)
 		ret = mxt_proc_message(data,
 			data->msg_buf + data->T5_msg_size * i);
 
+		if (ret < 0)
+			return ret;
 		if (ret == 1)
 			num_valid++;
 	}
-- 
2.17.1

