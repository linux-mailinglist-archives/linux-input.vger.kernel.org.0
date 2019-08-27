Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D17529DDC4
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbfH0G1r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:27:47 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:11303 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbfH0G1q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:27:46 -0400
IronPort-SDR: POiWoD+fjQW1h/3uoVqtOhoRqHREnd7dpebxzHin3cleGS0Loarz4sOrO5dPMXHXcHeY6G/w4G
 YeFYSHBxn09Sk1OYK0ITupVmuzWbmRMMqAOi67CoBRir/4HGjEM9ojgPL35xQsCiMJkDMmk70n
 XDNM7kUogt1+cX1AO5Lkqj7VccpzAPcaq/Uz8b6Fb5G3ANfMd1yoQvJZdHCUF/cz68hX6EImlX
 61xPJVt7bHb7SLuuPeq7vhlZyF4ZecU2rg830qiL949WOS10je3hBaHqjWeSeDNdZzdWGFhgaG
 Y0Q=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="42589343"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:27:45 -0800
IronPort-SDR: S2IbBDh9nCtZwB1J0w2uGhbIH2yOm+9Fpb2dzAXHP+r27qHvwY7fUoWGHEJrrBCY2UnPpkW8sO
 BfHxqCUVPCn3jpEscZWROaB6cIXy6LQVtGZeEcUGwCfWHcOBsrdUt/H7dYO7a8manjgEqLKutR
 9Z4flUOQIHG2NBXg1WT3fgKCFLyOzOqR0EtvC/MB3Bgyd51sU4+g/BLoGxTs0ObUgte12H+QgI
 Of89BxN3dpIJZIXh2dn01qLnHLM6h2mMZKzvFr7Am0aHNINovnT++Fd/QR2kVQsS9veIeNybp1
 X0g=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 10/49] Input: atmel_mxt_ts - handle reports from T47 Stylus object
Date:   Tue, 27 Aug 2019 15:27:17 +0900
Message-ID: <20190827062756.20380-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-08.mgc.mentorg.com (147.34.90.208) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
index 1d738c488bdd..83dad225458e 100644
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
2.19.2

