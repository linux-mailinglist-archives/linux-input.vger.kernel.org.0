Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC4A25CF7D
	for <lists+linux-input@lfdr.de>; Fri,  4 Sep 2020 04:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729572AbgIDCwM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Sep 2020 22:52:12 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:30058 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729538AbgIDCwL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Sep 2020 22:52:11 -0400
X-Greylist: delayed 579 seconds by postgrey-1.27 at vger.kernel.org; Thu, 03 Sep 2020 22:52:10 EDT
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="37169781"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 04 Sep 2020 10:42:30 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(78053:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 04 Sep 2020 10:42:30 +0800 (CST)
Received: from 101.12.41.239
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2486:2:AUTH_LOGIN)
        (envelope-from <jingle.wu@emc.com.tw>); Fri, 04 Sep 2020 10:42:27 +0800 (CST)
From:   "jingle.wu" <jingle.wu@emc.com.tw>
To:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Cc:     phoenix@emc.com.tw,
        "jingle.wu" <jingle.wu@elan.corp-partner.google.com>
Subject: [PATCH] Input: trackpoint - Add Suspend mode for Elan TrackPoint
Date:   Fri,  4 Sep 2020 10:42:31 +0800
Message-Id: <20200904024231.26812-1-jingle.wu@emc.com.tw>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: "jingle.wu" <jingle.wu@elan.corp-partner.google.com>

Add suspend command for elan trackpoint
---
 drivers/input/mouse/trackpoint.c | 16 ++++++++++++++++
 drivers/input/mouse/trackpoint.h |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
index 3eefee2ee2a1..b3cba973a4eb 100644
--- a/drivers/input/mouse/trackpoint.c
+++ b/drivers/input/mouse/trackpoint.c
@@ -389,6 +389,20 @@ static int trackpoint_reconnect(struct psmouse *psmouse)
 	return 0;
 }
 
+static void trackpoint_cleanup(struct psmouse *psmouse)
+{
+	struct trackpoint_data *tp = psmouse->private;
+	u8 param[3] = { TP_TOGGLE, TP_TOGGLE_BURST, TP_TOGGLE_ELAN_SLEEP };
+
+	if (tp->variant_id == TP_VARIANT_ELAN) {
+		if (ps2_command(&psmouse->ps2dev, param,
+				MAKE_PS2_CMD(3, 0, TP_COMMAND))) {
+			psmouse_err(psmouse,
+				    "failed to suspend trackpont.\n");
+		}
+	}
+}
+
 int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 {
 	struct ps2dev *ps2dev = &psmouse->ps2dev;
@@ -421,6 +435,8 @@ int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 	psmouse->reconnect = trackpoint_reconnect;
 	psmouse->disconnect = trackpoint_disconnect;
 
+	psmouse->cleanup = trackpoint_cleanup;
+
 	if (variant_id != TP_VARIANT_IBM) {
 		/* Newer variants do not support extended button query. */
 		button_info = 0x33;
diff --git a/drivers/input/mouse/trackpoint.h b/drivers/input/mouse/trackpoint.h
index 5cb93ed26085..c7fa75452976 100644
--- a/drivers/input/mouse/trackpoint.h
+++ b/drivers/input/mouse/trackpoint.h
@@ -107,6 +107,7 @@
 #define TP_TOGGLE_EXT_TAG	0x22	/* Bit 3 of the first packet coming from the
 					   external device will be forced to 1 */
 #define TP_MASK_EXT_TAG			0x04
+#define TP_TOGGLE_ELAN_SLEEP	0x8
 
 
 /* Power on Self Test Results */
-- 
2.17.1

