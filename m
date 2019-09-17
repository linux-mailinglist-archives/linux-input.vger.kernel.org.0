Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 300F6B4AA8
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbfIQJgI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:36:08 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:21929 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfIQJgI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:36:08 -0400
IronPort-SDR: teX0sjMnnoUn54zVN1y20AdRM6lHxguYiC+xr7OsFC/1QwPVaogIBeQAZsQXkMokkfCFv1dj2A
 pyCGvbBuZe2GjKbQgZfC9kA/LubuBiLEAgwgFNWCDKG/EpXSe+RoB3x1xLXR3jRHYpG3s2s2KA
 j109qVIOeCy03nkpEYF0gJ3hAFQYDaMR3gGQLz9ArCtp4aMj2Le69IkcmzvvVllJHTIj/KViIv
 OmJz09RrSqOU6OZlI2LmswhyLaazAmXO/pYndjRDlPAv9LNodu1ArtHhFvbfeBAZSwB4H/rYiC
 99I=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41422998"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:36:07 -0800
IronPort-SDR: 3cKwkyYibhhAggBZo9fJ8FzLGVT3oRrjm3zPgbgDuYGu1/olZPgDqoxY17qceDRj0bL+iSm/cv
 T+zOi5p0Ua73CyFJ5VSn0mi793f+w3l2wv5qp4H+e+FrsBwHkXfHjkXbPjwHGO1CMT6iuzDTfB
 LUEuelbfIlUTae9NERWhXvVC2KXpGTD/hprj315AiseTVGP83BCMKg9tNOHZTPa9PICON3nDRC
 wr9X91evAAi8SFztMBj3azLXAl+RotRYTgZUDr2mo5K4mCVWCQDGCX3CIv3PKINlLuu+Jy9Z+R
 DSs=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 06/49] Input: atmel_mxt_ts - output status from T48 Noise Supression
Date:   Tue, 17 Sep 2019 18:35:07 +0900
Message-ID: <20190917093550.18335-2-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190917093550.18335-1-jiada_wang@mentor.com>
References: <20190917093550.18335-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
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
index 45bab5253775..351347e2eced 100644
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
2.19.2

