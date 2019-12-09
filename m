Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9295E116589
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 04:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbfLIDmK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Dec 2019 22:42:10 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:43216 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727030AbfLIDmJ (ORCPT
        <rfc822;Linux-input@vger.kernel.org>); Sun, 8 Dec 2019 22:42:09 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="33196494"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 09 Dec 2019 11:42:06 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(71506:0:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Mon, 09 Dec 2019 11:42:07 +0800 (CST)
Received: from 42.73.254.157
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(101173:0:AUTH_LOGIN)
        (envelope-from <dave.wang@emc.com.tw>); Mon, 09 Dec 2019 11:42:07 +0800 (CST)
From:   Dave Wang <dave.wang@emc.com.tw>
To:     Linux-input@vger.kernel.org, Linux-kernel@vger.kernel.org,
        Dmitry.torokhov@gmail.com
Cc:     phoenix@emc.com.tw, josh.chen@emc.com.tw, jingle.wu@emc.com.tw,
        kai.heng.feng@canonical.com, "Dave.Wang" <dave.wang@emc.com.tw>
Subject: [PATCH 4/6] Input: elantech - High resolution report for new pattern 2
Date:   Sun,  8 Dec 2019 22:41:59 -0500
Message-Id: <20191209034159.30394-1-dave.wang@emc.com.tw>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: "Dave.Wang" <dave.wang@emc.com.tw>

Due to the higher resolution touchpad is produced, the former
resolution bits were not enough. Extend the resolution bits
from 12 to 14 bits and also remove the mk value for new pattern 2.

Signed-off-by: Dave Wang <dave.wang@emc.com.tw>
---
 drivers/input/mouse/elantech.c | 66 +++++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 17 deletions(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 322b181d00e9..53d7ff719d76 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -639,15 +639,21 @@ static void process_packet_head_v4(struct psmouse *psmouse)
 	struct elantech_data *etd = psmouse->private;
 	unsigned char *packet = psmouse->packet;
 	int id = ((packet[3] & 0xe0) >> 5) - 1;
-	int pres, traces;
+	int pres, traces = 0;
 
 	if (id < 0)
 		return;
 
-	etd->mt[id].x = ((packet[1] & 0x0f) << 8) | packet[2];
-	etd->mt[id].y = etd->y_max - (((packet[4] & 0x0f) << 8) | packet[5]);
-	pres = (packet[1] & 0xf0) | ((packet[4] & 0xf0) >> 4);
-	traces = (packet[0] & 0xf0) >> 4;
+	if (etd->info.pattern <= 0x01) {
+		etd->mt[id].x = ((packet[1] & 0x0f) << 8) | packet[2];
+		etd->mt[id].y = etd->y_max - (((packet[4] & 0x0f) << 8) | packet[5]);
+		pres = (packet[1] & 0xf0) | ((packet[4] & 0xf0) >> 4);
+		traces = (packet[0] & 0xf0) >> 4;
+	} else {
+		etd->mt[id].x = ((packet[1] & 0x3f) << 8) | packet[2];
+		etd->mt[id].y = etd->y_max - (((packet[4] & 0x3f) << 8) | packet[5]);
+		pres = (packet[4] & 0xc0) | ((packet[1] & 0xc0) >> 2) | ((packet[0] & 0xf0) >> 4);
+	}
 
 	input_mt_slot(dev, id);
 	input_mt_report_slot_state(dev, MT_TOOL_FINGER, true);
@@ -655,9 +661,11 @@ static void process_packet_head_v4(struct psmouse *psmouse)
 	input_report_abs(dev, ABS_MT_POSITION_X, etd->mt[id].x);
 	input_report_abs(dev, ABS_MT_POSITION_Y, etd->mt[id].y);
 	input_report_abs(dev, ABS_MT_PRESSURE, pres);
-	input_report_abs(dev, ABS_MT_TOUCH_MAJOR, traces * etd->width);
-	/* report this for backwards compatibility */
-	input_report_abs(dev, ABS_TOOL_WIDTH, traces);
+	if (etd->info.pattern <= 0x01) {
+		input_report_abs(dev, ABS_MT_TOUCH_MAJOR, traces * etd->width);
+		/* report this for backwards compatibility */
+		input_report_abs(dev, ABS_TOOL_WIDTH, traces);
+	}
 
 	elantech_input_sync_v4(psmouse);
 }
@@ -1057,15 +1065,24 @@ static int elantech_set_absolute_mode(struct psmouse *psmouse)
 }
 
 /*
- * (value from firmware) * 10 + 790 = dpi
+ * pattern <= 0x01:
+ *	(value from firmware) * 10 + 790 = dpi
+ * else
+ *	((value from firmware) + 3) * 100 = dpi
+ *
  * we also have to convert dpi to dots/mm (*10/254 to avoid floating point)
  */
-static unsigned int elantech_convert_res(unsigned int val)
+static unsigned int elantech_convert_res(unsigned int val,
+					unsigned char pattern)
 {
-	return (val * 10 + 790) * 10 / 254;
+	if (pattern <= 0x01)
+		return (val * 10 + 790) * 10 / 254;
+	else
+		return ((val + 3) * 100) * 10 / 254;
 }
 
 static int elantech_get_resolution_v4(struct psmouse *psmouse,
+					  unsigned char pattern,
 				      unsigned int *x_res,
 				      unsigned int *y_res,
 				      unsigned int *bus)
@@ -1075,8 +1092,8 @@ static int elantech_get_resolution_v4(struct psmouse *psmouse,
 	if (elantech_send_cmd(psmouse, ETP_RESOLUTION_QUERY, param))
 		return -1;
 
-	*x_res = elantech_convert_res(param[1] & 0x0f);
-	*y_res = elantech_convert_res((param[1] & 0xf0) >> 4);
+	*x_res = elantech_convert_res(param[1] & 0x0f, pattern);
+	*y_res = elantech_convert_res((param[1] & 0xf0) >> 4, pattern);
 	*bus = param[2];
 
 	return 0;
@@ -1194,7 +1211,8 @@ static int elantech_set_input_params(struct psmouse *psmouse)
 		 */
 		input_set_abs_params(dev, ABS_PRESSURE, ETP_PMIN_V2,
 				     ETP_PMAX_V2, 0, 0);
-		input_set_abs_params(dev, ABS_TOOL_WIDTH, ETP_WMIN_V2,
+		if (etd->info.pattern <= 0x01)
+			input_set_abs_params(dev, ABS_TOOL_WIDTH, ETP_WMIN_V2,
 				     ETP_WMAX_V2, 0, 0);
 		/* Multitouch capable pad, up to 5 fingers. */
 		input_mt_init_slots(dev, ETP_MAX_FINGERS, 0);
@@ -1206,7 +1224,8 @@ static int elantech_set_input_params(struct psmouse *psmouse)
 		 * The firmware reports how many trace lines the finger spans,
 		 * convert to surface unit as Protocol-B requires.
 		 */
-		input_set_abs_params(dev, ABS_MT_TOUCH_MAJOR, 0,
+		if (etd->info.pattern <= 0x01)
+			input_set_abs_params(dev, ABS_MT_TOUCH_MAJOR, 0,
 				     ETP_WMAX_V2 * width, 0, 0);
 		break;
 	}
@@ -1628,6 +1647,7 @@ static int elantech_query_info(struct psmouse *psmouse,
 {
 	unsigned char param[3];
 	unsigned char traces;
+	unsigned char y_max_l;
 
 	memset(info, 0, sizeof(*info));
 
@@ -1732,6 +1752,7 @@ static int elantech_query_info(struct psmouse *psmouse,
 	info->y_res = 31;
 	if (info->hw_version == 4) {
 		if (elantech_get_resolution_v4(psmouse,
+							info->pattern,
 					       &info->x_res,
 					       &info->y_res,
 					       &info->bus)) {
@@ -1800,8 +1821,19 @@ static int elantech_query_info(struct psmouse *psmouse,
 		if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
 			return -EINVAL;
 
-		info->x_max = (0x0f & param[0]) << 8 | param[1];
-		info->y_max = (0xf0 & param[0]) << 4 | param[2];
+		if (info->pattern <= 0x01) {
+			info->x_max = (0x0f & param[0]) << 8 | param[1];
+			info->y_max = (0xf0 & param[0]) << 4 | param[2];
+		} else {
+			info->x_max = (param[0] << 8) | param[1];
+			y_max_l = param[2];
+
+			if (info->send_cmd(psmouse, ETP_SAMPLE_QUERY, param))
+				return -1;
+
+			info->y_max = param[2] << 8 | y_max_l;
+		}
+
 		traces = info->capabilities[1];
 		if ((traces < 2) || (traces > info->x_max))
 			return -EINVAL;
-- 
2.17.1

