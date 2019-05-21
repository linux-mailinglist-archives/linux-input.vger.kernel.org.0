Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C71CB25041
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2019 15:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbfEUN1f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 May 2019 09:27:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47700 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726750AbfEUN1f (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 May 2019 09:27:35 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id DA8573086229;
        Tue, 21 May 2019 13:27:31 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4AD5E784AF;
        Tue, 21 May 2019 13:27:25 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        KT Liao <kt.liao@emc.com.tw>, Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v2 01/10] Input: elantech - query the min/max information beforehand too
Date:   Tue, 21 May 2019 15:27:03 +0200
Message-Id: <20190521132712.2818-2-benjamin.tissoires@redhat.com>
In-Reply-To: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 21 May 2019 13:27:35 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

For the latest generation of Elantech touchpads, we need to forward
the min/max information from PS/2 to SMBus. Prepare this work
by fetching the information before creating the SMBus companion
device.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

--

no changes in v2
---
 drivers/input/mouse/elantech.c | 160 +++++++++++++++------------------
 drivers/input/mouse/elantech.h |   5 ++
 2 files changed, 79 insertions(+), 86 deletions(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index a7f8b1614559..5953c21774d7 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -994,88 +994,6 @@ static int elantech_set_absolute_mode(struct psmouse *psmouse)
 	return rc;
 }
 
-static int elantech_set_range(struct psmouse *psmouse,
-			      unsigned int *x_min, unsigned int *y_min,
-			      unsigned int *x_max, unsigned int *y_max,
-			      unsigned int *width)
-{
-	struct elantech_data *etd = psmouse->private;
-	struct elantech_device_info *info = &etd->info;
-	unsigned char param[3];
-	unsigned char traces;
-
-	switch (info->hw_version) {
-	case 1:
-		*x_min = ETP_XMIN_V1;
-		*y_min = ETP_YMIN_V1;
-		*x_max = ETP_XMAX_V1;
-		*y_max = ETP_YMAX_V1;
-		break;
-
-	case 2:
-		if (info->fw_version == 0x020800 ||
-		    info->fw_version == 0x020b00 ||
-		    info->fw_version == 0x020030) {
-			*x_min = ETP_XMIN_V2;
-			*y_min = ETP_YMIN_V2;
-			*x_max = ETP_XMAX_V2;
-			*y_max = ETP_YMAX_V2;
-		} else {
-			int i;
-			int fixed_dpi;
-
-			i = (info->fw_version > 0x020800 &&
-			     info->fw_version < 0x020900) ? 1 : 2;
-
-			if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
-				return -1;
-
-			fixed_dpi = param[1] & 0x10;
-
-			if (((info->fw_version >> 16) == 0x14) && fixed_dpi) {
-				if (info->send_cmd(psmouse, ETP_SAMPLE_QUERY, param))
-					return -1;
-
-				*x_max = (info->capabilities[1] - i) * param[1] / 2;
-				*y_max = (info->capabilities[2] - i) * param[2] / 2;
-			} else if (info->fw_version == 0x040216) {
-				*x_max = 819;
-				*y_max = 405;
-			} else if (info->fw_version == 0x040219 || info->fw_version == 0x040215) {
-				*x_max = 900;
-				*y_max = 500;
-			} else {
-				*x_max = (info->capabilities[1] - i) * 64;
-				*y_max = (info->capabilities[2] - i) * 64;
-			}
-		}
-		break;
-
-	case 3:
-		if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
-			return -1;
-
-		*x_max = (0x0f & param[0]) << 8 | param[1];
-		*y_max = (0xf0 & param[0]) << 4 | param[2];
-		break;
-
-	case 4:
-		if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
-			return -1;
-
-		*x_max = (0x0f & param[0]) << 8 | param[1];
-		*y_max = (0xf0 & param[0]) << 4 | param[2];
-		traces = info->capabilities[1];
-		if ((traces < 2) || (traces > *x_max))
-			return -1;
-
-		*width = *x_max / (traces - 1);
-		break;
-	}
-
-	return 0;
-}
-
 /*
  * (value from firmware) * 10 + 790 = dpi
  * we also have to convert dpi to dots/mm (*10/254 to avoid floating point)
@@ -1200,10 +1118,9 @@ static int elantech_set_input_params(struct psmouse *psmouse)
 	struct input_dev *dev = psmouse->dev;
 	struct elantech_data *etd = psmouse->private;
 	struct elantech_device_info *info = &etd->info;
-	unsigned int x_min = 0, y_min = 0, x_max = 0, y_max = 0, width = 0;
-
-	if (elantech_set_range(psmouse, &x_min, &y_min, &x_max, &y_max, &width))
-		return -1;
+	unsigned int x_min = info->x_min, y_min = info->y_min,
+		     x_max = info->x_max, y_max = info->y_max,
+		     width = info->width;
 
 	__set_bit(INPUT_PROP_POINTER, dev->propbit);
 	__set_bit(EV_KEY, dev->evbit);
@@ -1687,6 +1604,7 @@ static int elantech_query_info(struct psmouse *psmouse,
 			       struct elantech_device_info *info)
 {
 	unsigned char param[3];
+	unsigned char traces;
 
 	memset(info, 0, sizeof(*info));
 
@@ -1755,6 +1673,76 @@ static int elantech_query_info(struct psmouse *psmouse,
 		}
 	}
 
+	/* query range information */
+	switch (info->hw_version) {
+	case 1:
+		info->x_min = ETP_XMIN_V1;
+		info->y_min = ETP_YMIN_V1;
+		info->x_max = ETP_XMAX_V1;
+		info->y_max = ETP_YMAX_V1;
+		break;
+
+	case 2:
+		if (info->fw_version == 0x020800 ||
+		    info->fw_version == 0x020b00 ||
+		    info->fw_version == 0x020030) {
+			info->x_min = ETP_XMIN_V2;
+			info->y_min = ETP_YMIN_V2;
+			info->x_max = ETP_XMAX_V2;
+			info->y_max = ETP_YMAX_V2;
+		} else {
+			int i;
+			int fixed_dpi;
+
+			i = (info->fw_version > 0x020800 &&
+			     info->fw_version < 0x020900) ? 1 : 2;
+
+			if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
+				return -EINVAL;
+
+			fixed_dpi = param[1] & 0x10;
+
+			if (((info->fw_version >> 16) == 0x14) && fixed_dpi) {
+				if (info->send_cmd(psmouse, ETP_SAMPLE_QUERY, param))
+					return -EINVAL;
+
+				info->x_max = (info->capabilities[1] - i) * param[1] / 2;
+				info->y_max = (info->capabilities[2] - i) * param[2] / 2;
+			} else if (info->fw_version == 0x040216) {
+				info->x_max = 819;
+				info->y_max = 405;
+			} else if (info->fw_version == 0x040219 || info->fw_version == 0x040215) {
+				info->x_max = 900;
+				info->y_max = 500;
+			} else {
+				info->x_max = (info->capabilities[1] - i) * 64;
+				info->y_max = (info->capabilities[2] - i) * 64;
+			}
+		}
+		break;
+
+	case 3:
+		if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
+			return -EINVAL;
+
+		info->x_max = (0x0f & param[0]) << 8 | param[1];
+		info->y_max = (0xf0 & param[0]) << 4 | param[2];
+		break;
+
+	case 4:
+		if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
+			return -EINVAL;
+
+		info->x_max = (0x0f & param[0]) << 8 | param[1];
+		info->y_max = (0xf0 & param[0]) << 4 | param[2];
+		traces = info->capabilities[1];
+		if ((traces < 2) || (traces > info->x_max))
+			return -EINVAL;
+
+		info->width = info->x_max / (traces - 1);
+		break;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/input/mouse/elantech.h b/drivers/input/mouse/elantech.h
index 119727085a60..194503ed59c5 100644
--- a/drivers/input/mouse/elantech.h
+++ b/drivers/input/mouse/elantech.h
@@ -144,8 +144,13 @@ struct elantech_device_info {
 	unsigned char debug;
 	unsigned char hw_version;
 	unsigned int fw_version;
+	unsigned int x_min;
+	unsigned int y_min;
+	unsigned int x_max;
+	unsigned int y_max;
 	unsigned int x_res;
 	unsigned int y_res;
+	unsigned int width;
 	unsigned int bus;
 	bool paritycheck;
 	bool jumpy_cursor;
-- 
2.21.0

