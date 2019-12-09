Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1F1A116508
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 03:28:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfLIC2g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 8 Dec 2019 21:28:36 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:61971 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726881AbfLIC2g (ORCPT
        <rfc822;Linux-input@vger.kernel.org>); Sun, 8 Dec 2019 21:28:36 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="33194852"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 09 Dec 2019 10:28:33 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(71485:0:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Mon, 09 Dec 2019 10:28:34 +0800 (CST)
Received: from 42.73.254.157
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(101175:0:AUTH_LOGIN)
        (envelope-from <dave.wang@emc.com.tw>); Mon, 09 Dec 2019 10:28:33 +0800 (CST)
From:   Dave Wang <dave.wang@emc.com.tw>
To:     Linux-input@vger.kernel.org, Linux-kernel@vger.kernel.org,
        Dmitry.torokhov@gmail.com
Cc:     phoenix@emc.com.tw, josh.chen@emc.com.tw, jingle.wu@emc.com.tw,
        kai.heng.feng@canonical.com, "Dave.Wang" <dave.wang@emc.com.tw>
Subject: [PATCH] Input: elantech - Add pattern for firmware into elantech_device_info structure
Date:   Sun,  8 Dec 2019 21:28:28 -0500
Message-Id: <20191209022828.30143-1-dave.wang@emc.com.tw>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: "Dave.Wang" <dave.wang@emc.com.tw>

Add the conditional expression to distinguish different patterns
regarding 0, 1, 2. Different patterns have its own location
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
@@ -1557,6 +1557,17 @@ static int elantech_set_properties(struct elantech_device_info *info)
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

