Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 558C42D70BA
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 08:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390203AbgLKHQe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 02:16:34 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:42626 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390410AbgLKHQS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 02:16:18 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="38549207"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 11 Dec 2020 15:15:11 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(2853:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 11 Dec 2020 15:15:11 +0800 (CST)
Received: from 49.216.248.217
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(106420:1:AUTH_LOGIN)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 11 Dec 2020 15:15:09 +0800 (CST)
From:   "jingle.wu" <jingle.wu@emc.com.tw>
To:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Cc:     phoenix@emc.com.tw, josh.chen@emc.com.tw, dave.wang@emc.com.tw,
        "jingle.wu" <jingle.wu@emc.com.tw>
Subject: [PATCH 2/2] Input: elantech - Some module tp of tracpoint report has a smbus protocol error.
Date:   Fri, 11 Dec 2020 15:15:31 +0800
Message-Id: <20201211071531.32413-1-jingle.wu@emc.com.tw>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

1. Add the conditional expression to distinguish different patterns regarding 0, 1, 2.
2. Add the function to get or set more bytes from register
3. Get and correct the device informations including ic_type, module id from different pattern.
4. Add the function to change the report id 0x5F of trackpoint.
5. Some module has a bug which makes default SMBUS trackpoint report 0x5E has a smbus protocol error.

Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>
---
 drivers/input/mouse/elantech.c | 98 +++++++++++++++++++++++++++++++++-
 drivers/input/mouse/elantech.h |  4 ++
 2 files changed, 100 insertions(+), 2 deletions(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 90f8765f9efc..1f6552e25bec 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -89,6 +89,48 @@ static int elantech_ps2_command(struct psmouse *psmouse,
 	return rc;
 }
 
+/*
+ * Send an Elantech style special command to read 3 bytes from a register
+ */
+static int elantech_read_reg_params(struct psmouse *psmouse, unsigned char reg,
+					unsigned char *param)
+{
+	if (elantech_ps2_command(psmouse, NULL, ETP_PS2_CUSTOM_COMMAND) ||
+	    elantech_ps2_command(psmouse, NULL, ETP_REGISTER_READWRITE) ||
+	    elantech_ps2_command(psmouse, NULL, ETP_PS2_CUSTOM_COMMAND) ||
+	    elantech_ps2_command(psmouse, NULL, reg) ||
+	    elantech_ps2_command(psmouse, param, PSMOUSE_CMD_GETINFO)) {
+			psmouse_err(psmouse,
+			    "failed to read register 0x%02x.\n", reg);
+			return -1;
+	}
+	return 0;
+}
+
+/*
+ * Send an Elantech style special command to write a register with a parameter
+ */
+static int elantech_write_reg_params(struct psmouse *psmouse, unsigned char reg,
+					unsigned char *param)
+{
+	if (elantech_ps2_command(psmouse, NULL, ETP_PS2_CUSTOM_COMMAND) ||
+	    elantech_ps2_command(psmouse, NULL, ETP_REGISTER_READWRITE) ||
+	    elantech_ps2_command(psmouse, NULL, ETP_PS2_CUSTOM_COMMAND) ||
+	    elantech_ps2_command(psmouse, NULL, reg) ||
+	    elantech_ps2_command(psmouse, NULL, ETP_PS2_CUSTOM_COMMAND) ||
+	    elantech_ps2_command(psmouse, NULL, param[0]) ||
+	    elantech_ps2_command(psmouse, NULL, ETP_PS2_CUSTOM_COMMAND) ||
+	    elantech_ps2_command(psmouse, NULL, param[1]) ||
+	    elantech_ps2_command(psmouse, NULL, PSMOUSE_CMD_SETSCALE11)) {
+			psmouse_err(psmouse,
+			    "failed to write register 0x%02x with value 0x%02x0x%02x.\n",
+			    reg, param[0], param[1]);
+			return -1;
+		}
+	return 0;
+
+}
+
 /*
  * Send an Elantech style special command to read a value from a register
  */
@@ -1529,19 +1571,33 @@ static const struct dmi_system_id no_hw_res_dmi_table[] = {
 	{ }
 };
 
+/*
+ * Change Report id 0x5E to 0x5F.
+ */
+static int elantech_change_report_id(struct psmouse *psmouse)
+{
+	unsigned char param[2] = { 0x10, 0x03 };
+
+	if (elantech_write_reg_params(psmouse, 0x7, param) == 0)
+		if (elantech_read_reg_params(psmouse, 0x7, param) == 0)
+			if ((param[0] == 0x10) && (param[1] == 0x03))
+				return 0;
+	psmouse_err(psmouse, "change report id Fail.\n");
+	return -1;
+}
 /*
  * determine hardware version and set some properties according to it.
  */
 static int elantech_set_properties(struct elantech_device_info *info)
 {
 	/* This represents the version of IC body. */
-	int ver = (info->fw_version & 0x0f0000) >> 16;
+	info->ic_version = (info->fw_version & 0x0f0000) >> 16;
 
 	/* Early version of Elan touchpads doesn't obey the rule. */
 	if (info->fw_version < 0x020030 || info->fw_version == 0x020600)
 		info->hw_version = 1;
 	else {
-		switch (ver) {
+		switch (info->ic_version) {
 		case 2:
 		case 4:
 			info->hw_version = 2;
@@ -1557,6 +1613,11 @@ static int elantech_set_properties(struct elantech_device_info *info)
 		}
 	}
 
+	/* Get information pattern for hw_version 4 */
+	info->pattern = 0x00;
+	if (info->ic_version == 0x0f && (info->fw_version & 0xff) <= 0x02)
+		info->pattern = info->fw_version & 0xff;
+
 	/* decide which send_cmd we're gonna use early */
 	info->send_cmd = info->hw_version >= 3 ? elantech_send_cmd :
 						 synaptics_send_cmd;
@@ -1598,6 +1659,7 @@ static int elantech_query_info(struct psmouse *psmouse,
 {
 	unsigned char param[3];
 	unsigned char traces;
+	unsigned char ic_body[3];
 
 	memset(info, 0, sizeof(*info));
 
@@ -1640,6 +1702,22 @@ static int elantech_query_info(struct psmouse *psmouse,
 			     info->samples[2]);
 	}
 
+	if (info->pattern > 0x00 && info->ic_version == 0xf) {
+		if (info->send_cmd(psmouse, ETP_ICBODY_QUERY, ic_body)) {
+			psmouse_err(psmouse, "failed to query ic body\n");
+			return -EINVAL;
+		}
+		info->ic_version = be16_to_cpup((__be16 *)ic_body);
+		psmouse_info(psmouse,
+			     "Elan ic body : 0x%04x, current fw version : 0x%02x\n",
+			     info->ic_version,
+			     ic_body[2]);
+	}
+
+	info->product_id = be16_to_cpup((__be16 *)info->samples);
+	if (info->pattern == 0x00)
+		info->product_id &= 0xff;
+
 	if (info->samples[1] == 0x74 && info->hw_version == 0x03) {
 		/*
 		 * This module has a bug which makes absolute mode
@@ -1654,6 +1732,22 @@ static int elantech_query_info(struct psmouse *psmouse,
 	/* The MSB indicates the presence of the trackpoint */
 	info->has_trackpoint = (info->capabilities[0] & 0x80) == 0x80;
 
+	if (info->has_trackpoint)
+		if (info->ic_version == 0x0011 && (info->product_id == 0x08 ||
+						    info->product_id == 0x09 ||
+						    info->product_id == 0x0D ||
+						    info->product_id == 0x0E))
+		/*
+		 * This module has a bug which makes debult SMBUS trackpoint report
+		 * 0x5E is a protocol error, if it is not changed to 0x5F report,
+		 * so let's abort so we'll be using standard PS/2 protocol.
+		 */
+			if (elantech_change_report_id(psmouse) != 0) {
+				psmouse_info(psmouse,
+				"Trackpoint report is broken, forcing standard PS/2 protocol\n");
+				return -ENODEV;
+			}
+
 	info->x_res = 31;
 	info->y_res = 31;
 	if (info->hw_version == 4) {
diff --git a/drivers/input/mouse/elantech.h b/drivers/input/mouse/elantech.h
index e0a3e59d4f1b..571e6ca11d33 100644
--- a/drivers/input/mouse/elantech.h
+++ b/drivers/input/mouse/elantech.h
@@ -18,6 +18,7 @@
 #define ETP_CAPABILITIES_QUERY		0x02
 #define ETP_SAMPLE_QUERY		0x03
 #define ETP_RESOLUTION_QUERY		0x04
+#define ETP_ICBODY_QUERY		0x05
 
 /*
  * Command values for register reading or writing
@@ -140,7 +141,10 @@ struct elantech_device_info {
 	unsigned char samples[3];
 	unsigned char debug;
 	unsigned char hw_version;
+	unsigned char pattern;
 	unsigned int fw_version;
+	unsigned int ic_version;
+	unsigned int product_id;
 	unsigned int x_min;
 	unsigned int y_min;
 	unsigned int x_max;
-- 
2.17.1

