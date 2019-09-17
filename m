Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48770B4B10
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729255AbfIQJmy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:42:54 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:22250 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727126AbfIQJmx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:42:53 -0400
IronPort-SDR: JTIjc3XrehbU7QSLvG2j9/NVPz8KVK5ARLoIvH0vQiHl0hBnBHXLWxynATDMavAr8MvNsYN5Vj
 AYEeVZIJUuBuiwxS/PrEwfSqHW21UTrPSn3XSlJ2tumD7IEtaFm4XpHTergqS+AIVQQUjRAs1S
 Kt2jUgsX8x2ceJTegL99NyAIkfAlBhaBxbLmaWzsWbTKQULrUvkKo69OgdYA+55jVJN8xM44ja
 7NwM+HJ36awE1VCfEAh2CL1Yj3EBnMiK0tDOgLcDzvTgy2jWbJ0nssgzRuIW5hYGaHGcFDhWjx
 iYQ=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41423284"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:42:52 -0800
IronPort-SDR: Dlt9K7ao993RuUoAbQZUryvhS5kLHm9AFXEYFCssWsMmTenSHSanH1Y3UDCw142zf2Lxy8jjst
 vLSVoRA3loEaIcFmBCBg1P2HFvCaPnzwemjdK8vFKT8nIHJoeg9yBUfdtfidNmgD+jQ+i9bhHx
 m+wDdrZZT2BezK6DECfApBwQiZ61E5Aul814DSrxpGvOu26CjDdJgUM9dUAeES1R2nbU8qioeg
 AAYDI1SPfRprvYJRTpeknby2zd///Pbk+BvoT/uY9zqNbihLYurN2DfE5+fKXGSM/Dpb166EQ4
 oHs=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 43/49] Input: Atmel: handle ReportID "0x00" while processing T5 messages
Date:   Tue, 17 Sep 2019 18:42:19 +0900
Message-ID: <20190917094225.18927-5-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190917094225.18927-1-jiada_wang@mentor.com>
References: <20190917094225.18927-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
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
index a13d6938de1e..93bb19cad7e1 100644
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
2.19.2

