Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D43F12D70B7
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 08:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391521AbgLKHQC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 02:16:02 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:42626 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730561AbgLKHPl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 02:15:41 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="38549199"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 11 Dec 2020 15:14:55 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(127523:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 11 Dec 2020 15:14:53 +0800 (CST)
Received: from 49.216.248.217
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(106412:0:AUTH_LOGIN)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 11 Dec 2020 15:14:51 +0800 (CST)
From:   "jingle.wu" <jingle.wu@emc.com.tw>
To:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Cc:     phoenix@emc.com.tw, josh.chen@emc.com.tw, dave.wang@emc.com.tw,
        "jingle.wu" <jingle.wu@emc.com.tw>
Subject: [PATCH 1/2] Input: elan_i2c - Add new trackpoint report type 0x5F.
Date:   Fri, 11 Dec 2020 15:15:11 +0800
Message-Id: <20201211071511.32349-1-jingle.wu@emc.com.tw>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The 0x5F is new trackpoint report type of some module.

Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>
---
 drivers/input/mouse/elan_i2c.h       | 6 ++++++
 drivers/input/mouse/elan_i2c_core.c  | 5 +----
 drivers/input/mouse/elan_i2c_smbus.c | 8 ++++++--
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c.h b/drivers/input/mouse/elan_i2c.h
index 36e3cd908671..d5f9cd76eefb 100644
--- a/drivers/input/mouse/elan_i2c.h
+++ b/drivers/input/mouse/elan_i2c.h
@@ -28,6 +28,12 @@
 
 #define ETP_FEATURE_REPORT_MK	BIT(0)
 
+#define ETP_REPORT_ID		0x5D
+#define ETP_REPORT_ID2		0x60	/* High precision report */
+#define ETP_TP_REPORT_ID	0x5E
+#define ETP_TP_REPORT_ID2	0x5F
+#define ETP_REPORT_ID_OFFSET	2
+
 /* IAP Firmware handling */
 #define ETP_PRODUCT_ID_FORMAT_STRING	"%d.0"
 #define ETP_FW_NAME		"elan_i2c_" ETP_PRODUCT_ID_FORMAT_STRING ".bin"
diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 61ed3f5ca219..0f46e2f6c9e8 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -49,10 +49,6 @@
 
 #define ETP_MAX_FINGERS		5
 #define ETP_FINGER_DATA_LEN	5
-#define ETP_REPORT_ID		0x5D
-#define ETP_REPORT_ID2		0x60	/* High precision report */
-#define ETP_TP_REPORT_ID	0x5E
-#define ETP_REPORT_ID_OFFSET	2
 #define ETP_TOUCH_INFO_OFFSET	3
 #define ETP_FINGER_DATA_OFFSET	4
 #define ETP_HOVER_INFO_OFFSET	30
@@ -1076,6 +1072,7 @@ static irqreturn_t elan_isr(int irq, void *dev_id)
 		elan_report_absolute(data, report, true);
 		break;
 	case ETP_TP_REPORT_ID:
+	case ETP_TP_REPORT_ID2:
 		elan_report_trackpoint(data, report);
 		break;
 	default:
diff --git a/drivers/input/mouse/elan_i2c_smbus.c b/drivers/input/mouse/elan_i2c_smbus.c
index 1820f1cfc1dc..6dc148b9d959 100644
--- a/drivers/input/mouse/elan_i2c_smbus.c
+++ b/drivers/input/mouse/elan_i2c_smbus.c
@@ -45,6 +45,7 @@
 #define ETP_SMBUS_CALIBRATE_QUERY	0xC5
 
 #define ETP_SMBUS_REPORT_LEN		32
+#define ETP_SMBUS_REPORT_LEN2		7
 #define ETP_SMBUS_REPORT_OFFSET		2
 #define ETP_SMBUS_HELLOPACKET_LEN	5
 #define ETP_SMBUS_IAP_PASSWORD		0x1234
@@ -497,10 +498,13 @@ static int elan_smbus_get_report(struct i2c_client *client,
 		return len;
 	}
 
-	if (len != ETP_SMBUS_REPORT_LEN) {
+	if (report[ETP_REPORT_ID_OFFSET] == ETP_TP_REPORT_ID2)
+		report_len = ETP_SMBUS_REPORT_LEN2;
+
+	if (len != report_len) {
 		dev_err(&client->dev,
 			"wrong report length (%d vs %d expected)\n",
-			len, ETP_SMBUS_REPORT_LEN);
+			len, report_len);
 		return -EIO;
 	}
 
-- 
2.17.1

