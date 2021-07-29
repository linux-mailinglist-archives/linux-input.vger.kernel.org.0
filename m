Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 115C23D9AD9
	for <lists+linux-input@lfdr.de>; Thu, 29 Jul 2021 03:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233197AbhG2BM7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Jul 2021 21:12:59 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:32512 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232837AbhG2BM6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Jul 2021 21:12:58 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="41939806"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 29 Jul 2021 09:03:11 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(116584:0:AUTH_RELAY)
        (envelope-from <phoenix@emc.com.tw>); Thu, 29 Jul 2021 09:03:10 +0800 (CST)
Received: from 49.216.187.106
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2473:0:AUTH_LOGIN)
        (envelope-from <phoenix@emc.com.tw>); Thu, 29 Jul 2021 09:03:08 +0800 (CST)
From:   Phoenix Huang <phoenix@emc.com.tw>
To:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Cc:     jingle.wu@emc.com.tw, josh.chen@emc.com.tw, dave.wang@emc.com.tw,
        Phoenix Huang <phoenix@emc.com.tw>
Subject: [PATCH] Input: elantench - Fix the firmware misreport coordinates for trackpoint occasionally.
Date:   Thu, 29 Jul 2021 09:03:06 +0800
Message-Id: <20210729010306.5339-1-phoenix@emc.com.tw>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Phoenix Huang <phoenix@emc.com.tw>
---
 drivers/input/mouse/elantech.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 2d0bc029619f..a31c2f5b7cf0 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -517,6 +517,17 @@ static void elantech_report_trackpoint(struct psmouse *psmouse,
 	case 0x16008020U:
 	case 0x26800010U:
 	case 0x36808000U:
+	
+		/* This firmware misreport coordinates for trackpoint occasionally.
+		* So we discard these packets by pattern to prevent cursor jumps.
+		*/
+		if (packet[4] == 0x80 || packet[5] == 0x80 ||
+		    packet[1] >> 7 == packet[4] >> 7 ||
+		    packet[2] >> 7 == packet[5] >> 7) {
+		    	elantech_debug("discarding packet [%6ph]\n", packet);
+			break;
+
+		}
 		x = packet[4] - (int)((packet[1]^0x80) << 1);
 		y = (int)((packet[2]^0x80) << 1) - packet[5];
 
@@ -1678,7 +1689,7 @@ static int elantech_query_info(struct psmouse *psmouse,
 		return -EINVAL;
 	}
 	psmouse_info(psmouse,
-		     "assuming hardware version %d (with firmware version 0x%02x%02x%02x)\n",
+		     "(7/19) assuming hardware version %d (with firmware version 0x%02x%02x%02x)\n",
 		     info->hw_version, param[0], param[1], param[2]);
 
 	if (info->send_cmd(psmouse, ETP_CAPABILITIES_QUERY,
-- 
2.25.1

