Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B1B1CA366
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 08:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbgEHGAO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 02:00:14 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:38783 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728323AbgEHGAL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 02:00:11 -0400
IronPort-SDR: sUl9fRF2fVoZs0RHja5c5kJMC8LDMYOJl/CeEYxHwLN6vljmpaZpZucAb+jLstHuGgSLtX9Z0V
 tF4S6SoW/w8wxPUSQroK4np71250S/wrBLz/tCbxj8dTu1k8pIUz/bPqCnC4Mb6KFy/KCCbzOu
 I+MJ10XLk36/90If1ZGCSSLmMmS+JyKd4RAvJI5Sb8H1ZyCvK9WSJJdi9jcPLOtyF9Spq1gqpB
 c1Ysl9KRmVEFwYZlHQhG5fdtPaWELaC1SHe1+Ho5Q+rQyoCIRXpitVGQgyCly2OUyQ2rzTHJb8
 P3Q=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="50670168"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 07 May 2020 22:00:08 -0800
IronPort-SDR: oZx0j2xcqYbijImYJojoAtAzZ+qTicxtGtQPPUvKpBLdY5tutC7BIXRd0PCT6o7dF8W0pt+7rU
 qSfQNzkTnOQEc3JxnFdIR4y2MxaXb836jgvB8p7QVfcwzL3exlwL38KMfYOSdJXlYWTMhF5POW
 +yGDpxvUu6qYoV9bLxSEf3wsKVLRw131aGPyxvo0nGqHXNOevCfdFRlADp3vPoelqfLmfjAOkQ
 g+DjWvEczzLHuxKTX2RihxjFeDm3voFRamh79qdstkWQjGXQnhZ8/lU1dDJqORXQEWjLH81Hr2
 4GM=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 50/56] Input: Atmel: handle ReportID "0x00" while processing T5 messages
Date:   Thu, 7 May 2020 22:56:50 -0700
Message-ID: <20200508055656.96389-51-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
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
index 92701bf5291f..103881911acc 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -77,6 +77,7 @@
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

