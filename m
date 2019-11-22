Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D01141067C3
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727133AbfKVIYd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:24:33 -0500
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:4441 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbfKVIYc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:24:32 -0500
IronPort-SDR: N3d2Shrk4a6LmmTXE1e0dPTscKY53vIJzr9Z5g8HhTtyXNn59SSCeZDnnKLjEeZJUULYAc+Szb
 Jpmi/FHluN6A5oYl+Ut7zfrvP2kvx2RP9WrKjRM36laU6F4+qDXFDx8fQVzxTTPMfCFx+OJcaF
 v9RVi77bVTQ/Nr6PEvMD5mTMN/b0TaKC1SKQ5TILV6WnlayYFIfvLGNfRTgRflt1McIqbiZjMZ
 96+F331rk+ON9SctbDg+gT3NtbtW6eI0c1eLl5fH/4R37ujlog0It1XXUni5JV1J1MZrr96T3j
 OhY=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43457552"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:24:31 -0800
IronPort-SDR: ciqpEjF+8XXJDD870VAR6w1P4xHnifR06m8TY8j6xqLwgrsjXq4eYMdkrqXjGV+vFV78xLfRdh
 cgXeDGh8u6c37V5/wtD2Xti3UNLQIa773uk8tOZVvD69bUYSgu+2oGECBv82CiTEEatp3AIscD
 dLho/ZMHI39cfjBLoeLL8yOgmm6rns9Mqn5ShU5umPWsgRe2fTPIgf8h+T+rThyAUm382bpWtP
 hlzfLgdc9kpVroXs84UIDsYaA1/neX8yGDjfkfIpfx1AD7m+53HOtRdI68rf05t4kYeXFZdHS8
 ZFM=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 07/48] Input: atmel_mxt_ts - implement T9 vector/orientation support
Date:   Fri, 22 Nov 2019 17:23:21 +0900
Message-ID: <20191122082402.18173-8-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
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
index 4e0dae004927..405bff1c2055 100644
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

