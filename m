Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20454E820C
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 08:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729570AbfJ2HUt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 03:20:49 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:41247 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729275AbfJ2HUs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 03:20:48 -0400
IronPort-SDR: w8GGp0Y/Yo4JHw+sYTMo+2NumdtFExVV2JvCT19Qm5RzJBDuKLV0NRomLg7EN8Vzr0PkJBAj5c
 5VlSo2G5/qqnTvMl9/7q6g39JPkM2P1GhMdn1nwFIvEmRUg0Z5Hv5PB5/QuViF+FR9loiltZa0
 bubN/tSmrGssUu/ENDDmV+jkNAtDoeu0I+4eR/i1BsibeXQVTApIg/FnJ1EayCLtTAPSLhzHB0
 7T/u4QlO5On46rdXOA7pdBtAUizGeG/QhRGJaHlR3BU9d46gN4UpTePwpE0f6fTGLds2Yq+cj6
 BJQ=
X-IronPort-AV: E=Sophos;i="5.68,243,1569312000"; 
   d="scan'208";a="42663225"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 28 Oct 2019 23:20:47 -0800
IronPort-SDR: m4LEPrSavG1HP+GJHKKx/cCj8/XGjpMV4el82a6shVmKOpTaHOJ1CGBP9vh11WDX+e8t6Ljveh
 KTfPTTygyiwksP503bUMITohrUXctucJEzQcHC0PvYgOBCN4IepSElMaTlOUc3lgi1nQH1WUHB
 ZwYQBDgTecM6jrY4QZ88AU4PEcdx1cQ1jEi4YxqI5B4732ORuPCE+M00wuleWcqe1pqX9cY24l
 inAhtfjFBKzET6UiYpB8rf6A7WIefid5TOAJsPNcbzscohr7J96g0LtzG/1yqCbNtA2Mc18EOY
 DAI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v4 09/48] Input: atmel_mxt_ts - handle reports from T47 Stylus object
Date:   Tue, 29 Oct 2019 16:19:31 +0900
Message-ID: <20191029072010.8492-10-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029072010.8492-1-jiada_wang@mentor.com>
References: <20191029072010.8492-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
Acked-by: Benson Leung <bleung@chromium.org>
Acked-by: Yufeng Shen <miletus@chromium.org>
(cherry picked from ndyer/linux/for-upstream commit 56405a5ea08eb34cfe83f3121867c9de0a5c48c1)
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 2df3104e94b9..661bfe4a43b9 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -823,6 +823,7 @@ static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
 	int area;
 	int amplitude;
 	u8 vector;
+	int tool;
 
 	id = message[0] - data->T9_reportid_min;
 	status = message[1];
@@ -836,6 +837,7 @@ static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
 		y >>= 2;
 
 	area = message[5];
+
 	amplitude = message[6];
 	vector = message[7];
 
@@ -865,12 +867,20 @@ static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
 			mxt_input_sync(data);
 		}
 
+		/* A size of zero indicates touch is from a linked T47 Stylus */
+		if (area == 0) {
+			area = MXT_TOUCH_MAJOR_DEFAULT;
+			tool = MT_TOOL_PEN;
+		} else {
+			tool = MT_TOOL_FINGER;
+		}
+
 		/* if active, pressure must be non-zero */
 		if (!amplitude)
 			amplitude = MXT_PRESSURE_DEFAULT;
 
 		/* Touch active */
-		input_mt_report_slot_state(input_dev, MT_TOOL_FINGER, 1);
+		input_mt_report_slot_state(input_dev, tool, 1);
 		input_report_abs(input_dev, ABS_MT_POSITION_X, x);
 		input_report_abs(input_dev, ABS_MT_POSITION_Y, y);
 		input_report_abs(input_dev, ABS_MT_PRESSURE, amplitude);
-- 
2.17.1

