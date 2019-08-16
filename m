Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF03E8FE22
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbfHPIib (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:38:31 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:53868 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727320AbfHPIia (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:38:30 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Aug 2019 04:38:29 EDT
IronPort-SDR: jfRDbw1S8YRBPqt+J84K8slLE4gsgaJatVotuCTLp9Hral3Y2OENz7wZr/DJSlkfWWeENTr90+
 QCa+Ztu+LyCvNxHgQUDnulaC2iUs0iEaA0g+FUrQF8FSjiRh0rkNAKLAlt++S6d3RmmPo8cq25
 uheXLL9V4eUYx8UKzPaJCMx0/jvzSKF5/NbI1OryyilBNt1aEghZVIPdHU1AdSsUCuuY0Dmyks
 qrHc2q54Z2ecQLMMIASSJiUVpdEBp8GVOmsqs2VpxLLVf14eIHL1I+lFjMA0Rj4vawswxz63tN
 dss=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="42311163"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:31:22 -0800
IronPort-SDR: /xFAlds9JZIhX3B1SMnMM9Ubdb1uxwyIAevS0jnulAsEQ4rttYm/mR2AUKI32WMnVDOUh1qc+V
 fuQIyqB5osy61oBUcQdJ/mPxFNNVIMt/v4a9HiJ3l+s8A7Rsyf+xlDWZ3YrhwIBc/qlG9iHnKp
 6MMal5VfXNvX0pDeeZjykxM60JCSRBSZDIKuJRB95vhHBMPIct1+b0BN/w2io1r7VwG8OBCAFD
 mF7nS57ejw2hN4k2szTCTXwsoWDDySYxgWWRaIYEWnAiAX08NOeWOM9cUPgRlq+JE9k1sHvRHe
 EQ0=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 05/63] Input: atmel_mxt_ts - output status from T48 Noise Supression
Date:   Fri, 16 Aug 2019 17:30:32 +0900
Message-ID: <20190816083130.18250-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
index 2d70ddf71cd9..a75c35c6f9f9 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -324,6 +324,7 @@ struct mxt_data {
 	u16 T18_address;
 	u8 T19_reportid;
 	u16 T44_address;
+	u8 T48_reportid;
 	u8 T100_reportid_min;
 	u8 T100_reportid_max;
 
@@ -977,6 +978,24 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
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
@@ -986,6 +1005,8 @@ static int mxt_proc_message(struct mxt_data *data, u8 *message)
 
 	if (report_id == data->T6_reportid) {
 		mxt_proc_t6_messages(data, message);
+	} else if (report_id == data->T48_reportid) {
+		mxt_proc_t48_messages(data, message);
 	} else if (!data->input_dev) {
 		/*
 		 * Do not report events if input device
@@ -1663,6 +1684,7 @@ static void mxt_free_object_table(struct mxt_data *data)
 	data->T18_address = 0;
 	data->T19_reportid = 0;
 	data->T44_address = 0;
+	data->T48_reportid = 0;
 	data->T100_reportid_min = 0;
 	data->T100_reportid_max = 0;
 	data->max_reportid = 0;
@@ -1744,6 +1766,9 @@ static int mxt_parse_object_table(struct mxt_data *data,
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
2.19.2

