Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 665C8114AE9
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2019 03:31:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbfLFCbr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Dec 2019 21:31:47 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:64185 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbfLFCbq (ORCPT
        <rfc822;Linux-input@vger.kernel.org>); Thu, 5 Dec 2019 21:31:46 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="33171811"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 06 Dec 2019 10:31:33 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(71507:0:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Fri, 06 Dec 2019 10:31:33 +0800 (CST)
Received: from 192.168.33.57
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(101176:2:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Fri, 06 Dec 2019 10:31:33 +0800 (CST)
From:   "Dave.Wang" <dave.wang@emc.com.tw>
To:     <Linux-kernel@vger.kernel.org>, <Linux-input@vger.kernel.org>,
        "'Benjamin Tissoires'" <benjamin.tissoires@redhat.com>,
        <Dmitry.torokhov@gmail.com>
Cc:     "'Josh.Chen'" <josh.chen@emc.com.tw>, <jingle.wu@emc.com.tw>,
        "'phoenix'" <phoenix@emc.com.tw>
Subject: [PATCH 3/6] Input: elantech - Increace and correct device information for pattern 0,1,2
Date:   Fri, 6 Dec 2019 10:31:32 +0800
Message-ID: <000b01d5abdd$45ffece0$d1ffc6a0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdWr3MrL7q4sCqxkTvGjETZLUp5TEw==
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDYxMjlcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy04Mzc4YTZhMC0xN2QwLTExZWEtYWExOS04OGQ3ZjY1NjczMzBcYW1lLXRlc3RcODM3OGE2YTItMTdkMC0xMWVhLWFhMTktODhkN2Y2NTY3MzMwYm9keS50eHQiIHN6PSIzNjAxIiB0PSIxMzIyMDA3MzA5MjQ1ODAxMjgiIGg9IlNWZWxGTTNyZ3pXYk8wZU42ZFhyRlByWkI3Yz0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Get and correct the device informations including fw_checksum, iap_checksum,
ic_body, iap_version from differnet pattern.

Signed-off-by: Dave Wang <dave.wang@emc.com.tw>
---
 drivers/input/mouse/elantech.c | 47 +++++++++++++++++++++++++++++++++-
 drivers/input/mouse/elantech.h |  8 ++++++
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index afb87122b766..322b181d00e9 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -857,7 +857,8 @@ static int elantech_packet_check_v4(struct psmouse
*psmouse)
 	 */
 	if (etd->info.crc_enabled)
 		sanity_check = ((packet[3] & 0x08) == 0x00);
-	else if (ic_version == 7 && etd->info.samples[1] == 0x2A)
+	else if (ic_version == 7 && etd->info.samples[1] == 0x2A &&
+			etd->info.pattern == 0x00)
 		sanity_check = ((packet[3] & 0x1c) == 0x10);
 	else
 		sanity_check = ((packet[0] & 0x08) == 0x00 &&
@@ -1669,6 +1670,50 @@ static int elantech_query_info(struct psmouse
*psmouse,
 			     info->samples[2]);
 	}
 
+	if (elantech_read_reg_params(psmouse, ETP_FW_CHECKSUM_QUERY,
+				info->fw_checksum)) {
+		psmouse_err(psmouse, "failed to get fw checksum\n");
+		return -EINVAL;
+	}
+	psmouse_info(psmouse,
+			 "Elan fw checksum result %02x, %02x, %02x\n",
+			 info->fw_checksum[0],
+			 info->fw_checksum[1],
+			 info->fw_checksum[2]);
+
+	if (elantech_read_reg_params(psmouse, ETP_IAP_CHECKSUM_QUERY,
+				info->iap_checksum)) {
+		psmouse_err(psmouse, "failed to get iap checksum\n");
+		return -EINVAL;
+	}
+	psmouse_info(psmouse,
+			 "Elan iap checksum result %02x, %02x, %02x\n",
+			 info->iap_checksum[0],
+			 info->iap_checksum[1],
+			 info->iap_checksum[2]);
+
+	if (info->pattern > 0x00) {
+		if (info->send_cmd(psmouse, ETP_ICBODY_QUERY,
info->ic_body)) {
+			psmouse_err(psmouse, "failed to query ic body\n");
+			return -EINVAL;
+		}
+		psmouse_info(psmouse,
+			     "Elan ic body : %02x%02x, fw version : %02x\n",
+			     info->ic_body[0],
+			     info->ic_body[1],
+			     info->ic_body[2]);
+
+		if (info->send_cmd(psmouse, ETP_IAP_VERSION_QUERY,
+					info->iap_version)) {
+			psmouse_err(psmouse, "failed to query iap
version\n");
+			return -EINVAL;
+		}
+		psmouse_info(psmouse,
+			     "Elan iap interface type : %02x, iap version :
%02x\n",
+			     info->iap_version[1],
+			     info->iap_version[2]);
+	}
+
 	if (info->samples[1] == 0x74 && info->hw_version == 0x03) {
 		/*
 		 * This module has a bug which makes absolute mode
diff --git a/drivers/input/mouse/elantech.h b/drivers/input/mouse/elantech.h
index 0aae6a9de8f0..a633ffa0eb07 100644
--- a/drivers/input/mouse/elantech.h
+++ b/drivers/input/mouse/elantech.h
@@ -18,6 +18,10 @@
 #define ETP_CAPABILITIES_QUERY		0x02
 #define ETP_SAMPLE_QUERY		0x03
 #define ETP_RESOLUTION_QUERY		0x04
+#define ETP_ICBODY_QUERY		0x05
+#define ETP_IAP_VERSION_QUERY		0x06
+#define ETP_IAP_CHECKSUM_QUERY		0x0A
+#define ETP_FW_CHECKSUM_QUERY		0xFE
 
 /*
  * Command values for register reading or writing
@@ -138,6 +142,10 @@ struct finger_pos {
 struct elantech_device_info {
 	unsigned char capabilities[3];
 	unsigned char samples[3];
+	unsigned char fw_checksum[3];
+	unsigned char iap_checksum[3];
+	unsigned char ic_body[3];
+	unsigned char iap_version[3];
 	unsigned char debug;
 	unsigned char hw_version;
 	unsigned char pattern;
-- 
2.17.1

