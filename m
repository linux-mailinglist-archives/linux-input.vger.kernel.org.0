Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D521E114AD9
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2019 03:18:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbfLFCSD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 Dec 2019 21:18:03 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:61200 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbfLFCSD (ORCPT
        <rfc822;Linux-input@vger.kernel.org>); Thu, 5 Dec 2019 21:18:03 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="33171514"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 06 Dec 2019 10:18:00 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(71497:0:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Fri, 06 Dec 2019 10:18:00 +0800 (CST)
Received: from 192.168.33.57
        by webmail.emc.com.tw with Mail2000 ESMTP Server V7.00(101173:1:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Fri, 06 Dec 2019 10:18:00 +0800 (CST)
From:   "Dave.Wang" <dave.wang@emc.com.tw>
To:     <Linux-kernel@vger.kernel.org>, <Linux-input@vger.kernel.org>,
        "'Benjamin Tissoires'" <benjamin.tissoires@redhat.com>
Cc:     "'Josh.Chen'" <josh.chen@emc.com.tw>, <jingle.wu@emc.com.tw>,
        "'phoenix'" <phoenix@emc.com.tw>
Subject: [PATCH 1/6] Input: elantech - Add the pattern for firmware into elantech_device_info structure
Date:   Fri, 6 Dec 2019 10:17:59 +0800
Message-ID: <000001d5abdb$618632f0$249298d0$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdWr2kHnngzdx7ZaS6mppBq5eSWG5A==
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDYxMjlcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy05ZWJlMjg0NC0xN2NlLTExZWEtYWExOS04OGQ3ZjY1NjczMzBcYW1lLXRlc3RcOWViZTI4NDUtMTdjZS0xMWVhLWFhMTktODhkN2Y2NTY3MzMwYm9keS50eHQiIHN6PSIxNjQ4IiB0PSIxMzIyMDA3MjI3OTI0OTgwODQiIGg9IlJFUEYzbmVmalhuVEZUekNWVjNWb2RDSkhWST0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the conditional expression to distinguish different patterns
regarding 0, 1, 2. Different pattern has its own location
for device information.

Signed-off-by: Dave Wang <dave.wang@emc.com.tw>
---
 drivers/input/mouse/elantech.c | 11 +++++++++++
 drivers/input/mouse/elantech.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 2d8434b7b623..1f0d914acd78 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -1557,6 +1557,17 @@ static int elantech_set_properties(struct
elantech_device_info *info)
 		}
 	}
 
+	/* Get information pattern for hw_version 4 */
+	if (ver == 15) {
+		if ((info->fw_version & 0x0000ff) == 0x01)
+			info->pattern = 0x01;
+		else if ((info->fw_version & 0x0000ff) == 0x02)
+			info->pattern = 0x02;
+		else
+			info->pattern = 0x00;
+	} else
+		info->pattern = 0x00;
+
 	/* decide which send_cmd we're gonna use early */
 	info->send_cmd = info->hw_version >= 3 ? elantech_send_cmd :
 						 synaptics_send_cmd;
diff --git a/drivers/input/mouse/elantech.h b/drivers/input/mouse/elantech.h
index e0a3e59d4f1b..0aae6a9de8f0 100644
--- a/drivers/input/mouse/elantech.h
+++ b/drivers/input/mouse/elantech.h
@@ -140,6 +140,7 @@ struct elantech_device_info {
 	unsigned char samples[3];
 	unsigned char debug;
 	unsigned char hw_version;
+	unsigned char pattern;
 	unsigned int fw_version;
 	unsigned int x_min;
 	unsigned int y_min;
-- 
2.17.1


