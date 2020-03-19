Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9B2918BA55
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:06:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbgCSPG1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:06:27 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:5803 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727858AbgCSPG1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:06:27 -0400
IronPort-SDR: dyBhasTIP4xAvkPQjy4XzWktdg0cjcjW/uXVrM6WgRmIZJ7ebsxKSSIN9V6y6kEaZVfxore488
 NFgKFDnFR/iWWjBczAgSmkagFnc9XU7Rfy9NEuzDK8Tkh7zGLw/Bw776b7JD8TbPrre0rU+C8P
 DR4STE0EQG17A1YyY7crbhUGLeIiBiSCIMaKs7fOnMbVAp8FPTLeNqmUT9VP6poICfrGB8BKcw
 Dbv4LmY6i2bkV966PFnQyAJuGDrRXtfVAYmcnWdwMsT9lkyb5/fVC7XPyrDEvteMrXQPEgIR0k
 xpg=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="46927060"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:03:22 -0800
IronPort-SDR: zaOb566Jh7wRAf/JNK7/8EMUwTtcK+da1BnPD+80152hVdLeVfxLObvn4+dK1EzA+GYQM4aUH3
 d6R9vGtF4tuWrf1NbIEQZ6KRLo2gMh2sF3OD95Aw+53XP08p8+SmrbPK1GiVao9quqvcMCyAdx
 Pon1Ml+KYwHstuqkQZdNXw5HjBqTjLs1odB7N8fUxaZMAacuD76RIj9A7e6uP5E5lYFtIiRaTX
 QMlzad6znJtuHHg8EQCBVc3DAZlJE8vkBRvSdw9iicl3xfoz7uHdTYPxSEa3PGLPoWfdJL3l/9
 vws=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 46/52] Input: Atmel: handle ReportID "0x00" while processing T5 messages
Date:   Thu, 19 Mar 2020 08:00:10 -0700
Message-ID: <20200319150016.61398-47-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
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
index 994232c43554..6b4809903ee8 100644
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

