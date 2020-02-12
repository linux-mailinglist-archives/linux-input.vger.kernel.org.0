Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0094C15A386
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728540AbgBLIoh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:44:37 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:45653 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728512AbgBLIog (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:44:36 -0500
X-Greylist: delayed 305 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Feb 2020 03:44:36 EST
IronPort-SDR: BUBzl1JKQiAPFzFFO/w/mkAqVgOyIaWId8fnIPQx1o5lDPFeMTP6VGzUHEjipej8gXyEnJ/7UT
 cc5efMUthOTG0qwpOygSv65fehbzBOAEyC+JLxcItXwQn+o5V0ngygpNQpbtPaBEA0mPd1DAZo
 w8t/DJoHJd7IxSM47IAY98InicT47eLA6UnN373fM72vcpiUsssktsCkE6ReGo2NgVRdDP3PGW
 TdUiuF7PUbvdevYSRJgVVZurQ41+rbhN5PelLUDdqrLOsq/5d69JhtU5cG0rLYdpOYgO7hrcDy
 3u4=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="45686168"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:43:33 -0800
IronPort-SDR: 2cer1NyDuyBdF6oOgYBHjI0rd7mCendWmkAn77dsCyTRuc44OhjWM3H/wM/opyfPEEQ08ZDvOx
 uoMnzGRNywnRttCqW17sWKtPpwJpXyk9W8cj6YtoqbliGYnlFKvkyYxAIFkmmYQecm2eDHpT5Q
 Bj4WQ3A241ICQtEstAzANnzLrNZoD87xo5Pnm8dPIVrNDq/+OClZ466RKOGYMN5BLpF3HlbIu+
 p32Lajdgr9QxN+yMPnagyfukheSlGUY569kXi+8NyK0GBIzs+gmifaCNOCnZytMvOBbAviq+Ga
 tzU=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 09/48] Input: atmel_mxt_ts - handle reports from T47 Stylus object
Date:   Wed, 12 Feb 2020 00:41:39 -0800
Message-ID: <20200212084218.32344-10-jiada_wang@mentor.com>
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
index e0e9e6770bc5..bb88bc8ce817 100644
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

