Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 281CC114AFF
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2019 03:42:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbfLFCmr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Dec 2019 21:42:47 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:45778 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726350AbfLFCmp (ORCPT
        <rfc822;Linux-input@vger.kernel.org>); Thu, 5 Dec 2019 21:42:45 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="33171983"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 06 Dec 2019 10:42:43 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(71488:0:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Fri, 06 Dec 2019 10:42:43 +0800 (CST)
Received: from 192.168.33.57
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(101171:1:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Fri, 06 Dec 2019 10:42:42 +0800 (CST)
From:   "Dave.Wang" <dave.wang@emc.com.tw>
To:     <Linux-kernel@vger.kernel.org>, <Linux-input@vger.kernel.org>,
        "'Benjamin Tissoires'" <benjamin.tissoires@redhat.com>,
        <Dmitry.torokhov@gmail.com>
Cc:     "'Josh.Chen'" <josh.chen@emc.com.tw>, <jingle.wu@emc.com.tw>,
        "'phoenix'" <phoenix@emc.com.tw>
Subject: [PATCH 6/6] Input: elantech - Add the flag which will also use host notify
Date:   Fri, 6 Dec 2019 10:42:41 +0800
Message-ID: <000e01d5abde$d4d8b900$7e8a2b00$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdWr3q9KwW2U8JWZR0uFdX9siCOSZQ==
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDYxMjlcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0xMjU3MzNhNS0xN2QyLTExZWEtYWExOS04OGQ3ZjY1NjczMzBcYW1lLXRlc3RcMTI1NzMzYTctMTdkMi0xMWVhLWFhMTktODhkN2Y2NTY3MzMwYm9keS50eHQiIHN6PSIxMjU5IiB0PSIxMzIyMDA3Mzc2MTY0OTcxODkiIGg9IjRLOHdhd090ckY2dWJheG5vUUlNbk9wMW50dz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the flag which will also use host notify technique in SMBus
interface.

Signed-off-by: Dave Wang <dave.wang@emc.com.tw>
---
 drivers/input/mouse/elantech.c | 1 +
 drivers/input/mouse/elantech.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 0392b668cd39..3422710f4100 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -2022,6 +2022,7 @@ static bool elantech_use_host_notify(struct psmouse
*psmouse,
 	case ETP_BUS_SMB_HST_NTFY_ONLY:
 		/* fall-through  */
 	case ETP_BUS_PS2_SMB_HST_NTFY:
+	case ETP_BUS_AMD_SMB_ALERT:
 		return true;
 	default:
 		psmouse_dbg(psmouse,
diff --git a/drivers/input/mouse/elantech.h b/drivers/input/mouse/elantech.h
index a633ffa0eb07..3b35ebb56607 100644
--- a/drivers/input/mouse/elantech.h
+++ b/drivers/input/mouse/elantech.h
@@ -115,6 +115,7 @@
 #define ETP_BUS_SMB_HST_NTFY_ONLY	2
 #define ETP_BUS_PS2_SMB_ALERT		3
 #define ETP_BUS_PS2_SMB_HST_NTFY	4
+#define ETP_BUS_AMD_SMB_ALERT		6
 
 /*
  * New ICs are either using SMBus Host Notify or just plain PS2.
-- 
2.17.1

