Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4C08FE63
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727115AbfHPIku (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:40:50 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:36144 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfHPIhu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:37:50 -0400
IronPort-SDR: TNfRHd001JlxC+a7kUTnwdUAA1h1lvJV52b2AELbxvEUHxRNB1+0WB/ZPSvWyj15i7WQkoYPjc
 fZZEHufMoHeLptMHgB5/f1QokgIVXGpD5tWoUpMfyX8ZIl8O0QSNHa3exgadujF4geFLtEu35F
 VT24IHCVf2IUYYW7OdBDuvaMDq3mdFW+pfxfIJ4Wn+YgxrZGOmfiEdPQCneinEHNfR/+lutp5G
 sJ0cpe0G7N+rcE5TF/4kg11hBUVfFfnORw1ZUedo/Mjnn3BVfrFuHHEvIyRAEYv4aOmvxtvfHY
 U/8=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40519177"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:37:49 -0800
IronPort-SDR: ar4w/QkJJMYItMaCLz4GJoXWQXdx3uUbqEtBxS89GB9vVfE5zBAz/J7ANcY2oB5GWkjf31ItR5
 skikK1OEtibNGMg5JU7VdSGzkjeiRU8NASi5gNtKkIpmDuTCYXj5e5EUwIUrT3EvPhjTw2chtI
 PXJZc7p+OUI5FeM1iV87Usbuv7Lfcr2qMOIAINV5Fta15VKQmLaAUnvAvRvbZk2iOyEd3EAc2H
 iol85OFcKs9OHypn+boAcJJ3/We9jAM6JvR8r+zkNxr/cgKWt4BN5s8gDD8t0CbZ9LbpPR4FXG
 LZ4=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 50/63] Input: Atmel: handle ReportID "0x00" while processing T5 messages
Date:   Fri, 16 Aug 2019 17:37:44 +0900
Message-ID: <20190816083757.19449-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
index b17af89a4711..2041a82a4551 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -76,6 +76,7 @@
 #define MXT_PROCI_TOUCHSEQUENCELOGGER	93
 #define MXT_TOUCH_MULTITOUCHSCREEN_T100 100
 #define MXT_PROCI_ACTIVESTYLUS_T107	107
+#define MXT_RPTID_RESERVED		0
 
 /* MXT_GEN_MESSAGE_T5 object */
 #define MXT_RPTID_NOMSG		0xff
@@ -1385,6 +1386,11 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 	u8 report_id = message[0];
 	bool dump = data->debug_enabled;
 
+	if (report_id == MXT_RPTID_RESERVED) {
+		dev_err(&data->client->dev,
+			"Received Reserved ReportID 0x00\n");
+		return -EINVAL;
+	}
 	if (report_id == MXT_RPTID_NOMSG)
 		return 0;
 
@@ -1456,6 +1462,8 @@ static int mxt_read_and_process_messages(struct mxt_data *data, u8 count)
 		ret = mxt_proc_message(data,
 			data->msg_buf + data->T5_msg_size * i);
 
+		if (ret < 0)
+			return ret;
 		if (ret == 1)
 			num_valid++;
 	}
-- 
2.19.2

