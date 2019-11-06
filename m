Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C43BF0FAF
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 08:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731280AbfKFHEd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 02:04:33 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:8807 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728291AbfKFHEc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 02:04:32 -0500
IronPort-SDR: FxYz7odkc1Sj5WCdjQ5uSoIK/iFgedRfmR2yLZwLhb0A07ki3pLQqVK4VehxaL1XksnDEv3zdL
 NdogYycdaPDOV28I7pM4BPvMkQzssb4OuLaCUwgFt5yhGStlb8B4Uoe4voBSREJT1+vRDAgFwP
 c6pZKfHhVwx+bZyE4VNeXNsH+ZDCFGWZZtsTKAi6P+s7TzdZD6InnbgEGiYEYWItIB8/EKnlxy
 9VviXe7guRUR02PDJODUFI6+6k3Gl6xi7RGCFiZAXyACA0lFlYLcQ15nBmtI+fzY9/gmfIOc+F
 A9k=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="42908680"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 05 Nov 2019 23:04:32 -0800
IronPort-SDR: OHciighVuPMdA9ioFhmqPkTdgjoqyy1ZQLABEbuH4ns5jz/8uHMwBirPdVYuqZtNS7smFdCT+1
 NrYMYv1FNiwfOqRmPK+bzKfwu9eXzYwk9LaLNA3MU4RCirqbwMqx0F5NhSsP1PX9u0+bOdwXrD
 YtGyJEBjdMBWz6kWRVk+yRNMVoCDft/eiHsuHZvxFnMIKvOo+v8IscqIktE0KXO4UEvt+XFXFO
 cqrn/iPnaNHDP5XLoLPuedesuqo8k57/f5x5HLATkeTrHtxkW/3Fu16ZqMmiTXj1NYflkZ5joS
 M/Q=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v5 42/48] Input: Atmel: handle ReportID "0x00" while processing T5 messages
Date:   Wed, 6 Nov 2019 16:01:40 +0900
Message-ID: <20191106070146.18759-43-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106070146.18759-1-jiada_wang@mentor.com>
References: <20191106070146.18759-1-jiada_wang@mentor.com>
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

