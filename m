Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 271CD9DE0E
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbfH0Gbc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:31:32 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:48284 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfH0Gb3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:31:29 -0400
IronPort-SDR: kJg/PeYwtuRp9P8WJixfLshCUcI97NAVanBRp/46Zt0iu3mVKOMk32vnR8LY6mmtzoJU9M80R+
 Z+7hgmFYdLAQkAv8TXJcIy01L+LcR+q9Y11bd2HWwAW701kI/uJr3wZiXiEM3mNFYMc90Hs4i9
 kHnHS79QBSp+KcZ3zkX2K7NUz8sumwCsCGkq+/lbP9n4a3bvr+JaXmBX3+AGt9jdJdt2nHQiXx
 prcW0FsQ99ZPbpyCpctQT0U5K/NcEtje4Sgm78ENj2om4KnmyGTioj3G0p2TrB4AuOgh6OwoIH
 xwo=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="40784646"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:31:28 -0800
IronPort-SDR: 51GY4Hsbt/sz/lnFakBoTsV/6LMxA0DvbIlDjdkZSx8/YCuOLTS6qc/ocoIO46sqFf04YJzin2
 6ICY8iFcfe4sHTKGv8z9rCpUs7l67T/VX/7f4iVERW+Ze7WswGsnitIaMB3dn7Z3z5y2mHJ6u2
 GfLRmY5RLxkcRFRQd2UsmIHwl8XHygJb/pxN0KdPXiMSJGqZ/81k6RnSWv14p/+tuj1KX5oUA8
 CYwz59wbrvN66wUKee3g15yUu8xfHNqN7V9sbf9sbzHGKKxJESKjV9GzzZwYnpr4LyhlC93Xvy
 fdE=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 43/49] Input: Atmel: handle ReportID "0x00" while processing T5 messages
Date:   Tue, 27 Aug 2019 15:31:24 +0900
Message-ID: <20190827063130.20969-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190827063130.20969-1-jiada_wang@mentor.com>
References: <20190827063130.20969-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-09.mgc.mentorg.com (147.34.90.209) To
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
index 41d92d765aa2..b6f50fee3695 100644
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
2.19.2

