Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEAC82D0C1A
	for <lists+linux-input@lfdr.de>; Mon,  7 Dec 2020 09:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgLGIvt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Dec 2020 03:51:49 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:37214 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbgLGIvt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Dec 2020 03:51:49 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="38474446"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 07 Dec 2020 16:50:49 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(1270:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Mon, 07 Dec 2020 16:50:48 +0800 (CST)
Received: from 101.12.100.64
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(106416:1:AUTH_LOGIN)
        (envelope-from <jingle.wu@emc.com.tw>); Mon, 07 Dec 2020 16:50:47 +0800 (CST)
From:   "jingle.wu" <jingle.wu@emc.com.tw>
To:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torohov@gmail.com
Cc:     phoenix@emc.com.tw, josh.chen@emc.com.tw, dave.wang@emc.com.tw,
        "jingle.wu" <jingle.wu@emc.com.tw>
Subject: [PATCH 1/2] Input: elan_i2c - Add new trackpoint report type 0x5F.
Date:   Mon,  7 Dec 2020 16:50:54 +0800
Message-Id: <20201207085054.8328-1-jingle.wu@emc.com.tw>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The 0x5F is new trackpoint report type of some module.

Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>
---
 drivers/input/mouse/elan_i2c_core.c  | 2 ++
 drivers/input/mouse/elan_i2c_smbus.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 61ed3f5ca219..8f0c4663167c 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -52,6 +52,7 @@
 #define ETP_REPORT_ID		0x5D
 #define ETP_REPORT_ID2		0x60	/* High precision report */
 #define ETP_TP_REPORT_ID	0x5E
+#define ETP_TP_REPORT_ID2	0x5F
 #define ETP_REPORT_ID_OFFSET	2
 #define ETP_TOUCH_INFO_OFFSET	3
 #define ETP_FINGER_DATA_OFFSET	4
@@ -1076,6 +1077,7 @@ static irqreturn_t elan_isr(int irq, void *dev_id)
 		elan_report_absolute(data, report, true);
 		break;
 	case ETP_TP_REPORT_ID:
+	case ETP_TP_REPORT_ID2:
 		elan_report_trackpoint(data, report);
 		break;
 	default:
diff --git a/drivers/input/mouse/elan_i2c_smbus.c b/drivers/input/mouse/elan_i2c_smbus.c
index 1820f1cfc1dc..1226d47ec3cf 100644
--- a/drivers/input/mouse/elan_i2c_smbus.c
+++ b/drivers/input/mouse/elan_i2c_smbus.c
@@ -45,6 +45,7 @@
 #define ETP_SMBUS_CALIBRATE_QUERY	0xC5
 
 #define ETP_SMBUS_REPORT_LEN		32
+#define ETP_SMBUS_REPORT_LEN2		7
 #define ETP_SMBUS_REPORT_OFFSET		2
 #define ETP_SMBUS_HELLOPACKET_LEN	5
 #define ETP_SMBUS_IAP_PASSWORD		0x1234
@@ -497,7 +498,7 @@ static int elan_smbus_get_report(struct i2c_client *client,
 		return len;
 	}
 
-	if (len != ETP_SMBUS_REPORT_LEN) {
+	if ((len != ETP_SMBUS_REPORT_LEN) && (len != ETP_SMBUS_REPORT_LEN2))  {
 		dev_err(&client->dev,
 			"wrong report length (%d vs %d expected)\n",
 			len, ETP_SMBUS_REPORT_LEN);
-- 
2.17.1

