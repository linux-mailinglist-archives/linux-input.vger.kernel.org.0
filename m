Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0935F9DDC0
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbfH0G1S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:27:18 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:48109 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728680AbfH0G1R (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:27:17 -0400
IronPort-SDR: orlQHwcq1zVCudeQOtxMu3EkUBpXbvnEegaTR2mqejmzXN7tQJN82VyK3JWxJGuwZEQs9uiXt/
 fe2wPJ+wK9Llik0PkulUs9HhEP1gK4MmjOvMl/lFOa2M4FXrYiMg8sppJ/GLcO6QSRseJi+Zu9
 SyAeUjVP44bjSXdu63lsiP7A73J5p0mw4ayix7+WCVRTbFjCNuQhM8B4xyVR35+jxHhcWgX/MR
 sSPSOo69Epz98h9+baWygh8FY7MwlF84r/jbFkWnSt450U/Zz+eL6vQ7nAVbqefU+0NzsUCJTY
 9ng=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="40784458"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:27:16 -0800
IronPort-SDR: QlUlGzlYXEXcpn7lTxRNECzUmFdHvGMB4gdRG5QzXEqM+uwgFxphh6l4VlFSBxHELV3e3K4OAD
 gTWBaGROY1Pd6kpFxS3zfCyIb1WRNNZCighTFrbduU6Sfn6jeIauV+qCHWhaeaG7HHy31uqPcl
 KLW2SLvvfSOb46y2jknKSHQH56eQGKFyH+eLpiVY618wMnD5sX/iJSMfvRfHu5geaR0m66IEe7
 gWfsj1SHcDCov2EeTBCpR9S66OEzohxAZr55lmCPmy0C7aH1/VNv1gE0k0nKo+7Z1DDwFHri9V
 CbI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 08/49] Input: atmel_mxt_ts - implement T9 vector/orientation support
Date:   Tue, 27 Aug 2019 15:26:33 +0900
Message-ID: <20190827062714.20266-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190827062714.20266-1-jiada_wang@mentor.com>
References: <20190827062714.20266-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

The atmel touch messages contain orientation information as a byte in a
packed format which can be passed straight on to Android if the input
device configuration is correct.

This requires vector reports to be enabled in maXTouch config (zero
DISVECT bit 3 in T9 CTRL field)

Android converts the format in InputReader.cpp, search for
ORIENTATION_CALIBRATION_VECTOR.

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
Acked-by: Benson Leung <bleung@chromium.org>
Acked-by: Yufeng Shen <miletus@chromium.org>
(cherry picked from ndyer/linux/for-upstream commit a6f0ee919d2631678169b23fb18f55b6dbabcd4c)
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 19fa3e58269a..68c8237f7932 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -817,6 +817,7 @@ static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
 	int y;
 	int area;
 	int amplitude;
+	u8 vector;
 
 	id = message[0] - data->T9_reportid_min;
 	status = message[1];
@@ -831,9 +832,10 @@ static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
 
 	area = message[5];
 	amplitude = message[6];
+	vector = message[7];
 
 	dev_dbg(dev,
-		"[%u] %c%c%c%c%c%c%c%c x: %5u y: %5u area: %3u amp: %3u\n",
+		"[%u] %c%c%c%c%c%c%c%c x: %5u y: %5u area: %3u amp: %3u vector: %02X\n",
 		id,
 		(status & MXT_T9_DETECT) ? 'D' : '.',
 		(status & MXT_T9_PRESS) ? 'P' : '.',
@@ -843,7 +845,7 @@ static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
 		(status & MXT_T9_AMP) ? 'A' : '.',
 		(status & MXT_T9_SUPPRESS) ? 'S' : '.',
 		(status & MXT_T9_UNGRIP) ? 'U' : '.',
-		x, y, area, amplitude);
+		x, y, area, amplitude, vector);
 
 	input_mt_slot(input_dev, id);
 
@@ -868,6 +870,7 @@ static void mxt_proc_t9_message(struct mxt_data *data, u8 *message)
 		input_report_abs(input_dev, ABS_MT_POSITION_Y, y);
 		input_report_abs(input_dev, ABS_MT_PRESSURE, amplitude);
 		input_report_abs(input_dev, ABS_MT_TOUCH_MAJOR, area);
+		input_report_abs(input_dev, ABS_MT_ORIENTATION, vector);
 	} else {
 		/* Touch no longer active, close out slot */
 		input_mt_report_slot_inactive(input_dev);
@@ -2180,8 +2183,9 @@ static int mxt_initialize_input_device(struct mxt_data *data)
 				     0, 255, 0, 0);
 	}
 
-	if (data->multitouch == MXT_TOUCH_MULTITOUCHSCREEN_T100 &&
-	    data->t100_aux_vect) {
+	if (data->multitouch == MXT_TOUCH_MULTI_T9 ||
+	    (data->multitouch == MXT_TOUCH_MULTITOUCHSCREEN_T100 &&
+	    data->t100_aux_vect)) {
 		input_set_abs_params(input_dev, ABS_MT_ORIENTATION,
 				     0, 255, 0, 0);
 	}
-- 
2.19.2

