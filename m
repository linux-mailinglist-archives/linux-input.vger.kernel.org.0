Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F153FB5E9
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 14:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhH3MWM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 08:22:12 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:61099 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237372AbhH3MUq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 08:20:46 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="42474872"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 30 Aug 2021 20:19:51 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(11166:0:AUTH_RELAY)
        (envelope-from <phoenix@emc.com.tw>); Mon, 30 Aug 2021 20:19:50 +0800 (CST)
Received: from 192.168.33.13
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2480:0:AUTH_LOGIN)
        (envelope-from <phoenix@emc.com.tw>); Mon, 30 Aug 2021 20:19:48 +0800 (CST)
From:   "phoenix" <phoenix@emc.com.tw>
To:     <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <dmitry.torokhov@gmail.com>
Cc:     <jingle.wu@emc.com.tw>, <josh.chen@emc.com.tw>,
        <dave.wang@emc.com.tw>
References: <20210729010940.5752-1-phoenix@emc.com.tw>
In-Reply-To: <20210729010940.5752-1-phoenix@emc.com.tw>
Subject: RE: [PATCH] Input: elantench - Fix the firmware misreport coordinates for trackpoint occasionally.
Date:   Mon, 30 Aug 2021 20:19:48 +0800
Message-ID: <000001d79d99$53762dd0$fa628970$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQGk7tjGsgsB1mM/H5Ov4MUFApOKzavnmDiw
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcODgwNTFcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy05MGI4OGY1YS0wOThjLTExZWMtYTkxYy04OGQ3ZjY1ODJkZmNcYW1lLXRlc3RcOTBiODhmNWItMDk4Yy0xMWVjLWE5MWMtODhkN2Y2NTgyZGZjYm9keS50eHQiIHN6PSIxNjA5IiB0PSIxMzI3NDc5OTU4ODA2NjU1ODYiIGg9IjRveHkwbHJscktkNU5id3VEVE4xSnBJVldnZz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Would you review this patch, thanks

Best regards,
Phoenix Huang

-----Original Message-----
From: Phoenix Huang [mailto:phoenix@emc.com.tw] 
Sent: Thursday, July 29, 2021 9:10 AM
To: linux-kernel@vger.kernel.org; linux-input@vger.kernel.org;
dmitry.torokhov@gmail.com
Cc: jingle.wu@emc.com.tw; josh.chen@emc.com.tw; dave.wang@emc.com.tw;
Phoenix Huang <phoenix@emc.com.tw>
Subject: [PATCH] Input: elantench - Fix the firmware misreport coordinates
for trackpoint occasionally.

Signed-off-by: Phoenix Huang <phoenix@emc.com.tw>
---
 drivers/input/mouse/elantech.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 2d0bc029619f..07e1098f2d31 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -517,6 +517,17 @@ static void elantech_report_trackpoint(struct psmouse
*psmouse,
 	case 0x16008020U:
 	case 0x26800010U:
 	case 0x36808000U:
+	
+		/* This firmware misreport coordinates for trackpoint
occasionally.
+		* So we discard these packets by pattern to prevent cursor
jumps.
+		*/
+		if (packet[4] == 0x80 || packet[5] == 0x80 ||
+		    packet[1] >> 7 == packet[4] >> 7 ||
+		    packet[2] >> 7 == packet[5] >> 7) {
+		    	elantech_debug("discarding packet [%6ph]\n",
packet);
+			break;
+
+		}
 		x = packet[4] - (int)((packet[1]^0x80) << 1);
 		y = (int)((packet[2]^0x80) << 1) - packet[5];
 
--
2.25.1

