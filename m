Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B20EC15A3EB
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:51:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728497AbgBLIu2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:50:28 -0500
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:20079 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728478AbgBLIu1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:50:27 -0500
IronPort-SDR: VlkQiWnaA2BWQ588DHDGVzKn5Uv1XnI3qK5qIXZlcLi5mrWXnvxNpbwMf/5H/MI5aX9dqKA1Z/
 lpbSfdtnK0z2RM8GJhThMyDd+E5X/8g/wYN40658CrFFd5t+jnVMe+whXuXDDqmHgKc21RGMS9
 EJXdexmixu6IeXAJaeuwa1de6ff//gNVzpWpyca2/BQcRzzL8D63I37DxQ3NBulxCMUSKb0l3S
 kEtuJDgHWnN5H2320QJ4oiHA8TNKWDvAS9J4X6dtniAJRAV3tMXPKZ3q83zsyavn4bxq9LMT5k
 C1E=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="45799267"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:43:21 -0800
IronPort-SDR: DAab1ecC3Ul+eTR5hcfgsz2+YvKHcSYSedPSxeC3vt/y0JoijY1elizqRE1/E9weMiCt6e+KlV
 TCL1ifi6sGm9I/VyykDkb9YyI8QWI0+bznt8/D+xiJlbJr98nmpQvSAIKRLKp/o7uZ92dP1Xoa
 JbgxMLLqfY6ig0ZlNjCOEEfXebYEVcnZkZCAWmzSOHL9RNzeuPQkL+Qj4EsAJA6NJcPeSJSOgV
 KbHgMMLxNgHSL6CEWS3jDF7oMoQgKngUX69r26r4qOcu4D4Y8HhPTrSdqbkte1HdRpGKgh+Byc
 6+4=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 07/48] Input: atmel_mxt_ts - implement T9 vector/orientation support
Date:   Wed, 12 Feb 2020 00:41:37 -0800
Message-ID: <20200212084218.32344-8-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
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
index fe58bffda224..d36f4df0c425 100644
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
2.17.1

