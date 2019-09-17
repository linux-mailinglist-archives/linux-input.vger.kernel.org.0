Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05BECB4AAC
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbfIQJgP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:36:15 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:21929 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfIQJgO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:36:14 -0400
IronPort-SDR: 040SLHFMXizPPE3raU6D5tdCBTqn+ZYF30GMqexFf/zIkEtC8kEGO+ik4w+oT5JRbl5ktuZYJm
 hc4aQd3Wd/ynhQr646QpeS/bRGHNHsh3BV/e0WjGdAU/X7OpSs18u7IkZljYJPMFplxtdbfzmL
 4Y/HhzfuXO+Y7mDsT1KBGySVbAWBXKIHu24yuM/fs+emvz0caU8qV0pKlXo+wiXlf7W2BOIFj+
 0Vc9SL9t7tUOBoJbVSCLAULyuigvdlfomBN5MW9ZGqP2u9+HYyR32YfXv1fa57i48UfBYFRuMp
 dsY=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41423005"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:36:13 -0800
IronPort-SDR: 1tTdPTZblhLE6y7s3cfBapsfQzNQROoIXCJbiThNm652YmXbr75puFDVcYzOdbewCF6nrvxFKY
 4Tjo9/lUuAutluSUMP2kB8LxmCMuISzuchX4oC++vWO2Pxihwrr8ut3wqQa8EfC9X6nFENBR2P
 p6MLPF1grllpIe/Nox+KoAIZH6uLMSS7WipU93KvWFLa1t/4vDn18owuuj54ml4okU6wv6m6iz
 O86P9MuGwE3+NsOgIto6GJsnFhOnLDJr6kkkjQlLGmcDlPgvgO7fAVE5iZuNyAVo+Pz4jBI7Mx
 T/A=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 08/49] Input: atmel_mxt_ts - implement T9 vector/orientation support
Date:   Tue, 17 Sep 2019 18:35:09 +0900
Message-ID: <20190917093550.18335-4-jiada_wang@mentor.com>
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

