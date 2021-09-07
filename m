Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8315402214
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 04:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238342AbhIGBkb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Sep 2021 21:40:31 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:27847 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbhIGBkb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Sep 2021 21:40:31 -0400
X-Greylist: delayed 597 seconds by postgrey-1.27 at vger.kernel.org; Mon, 06 Sep 2021 21:40:31 EDT
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="42603911"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 07 Sep 2021 09:29:27 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(128811:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Tue, 07 Sep 2021 09:29:27 +0800 (CST)
Received: from 218.161.27.213
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2474:1:AUTH_LOGIN)
        (envelope-from <jingle.wu@emc.com.tw>); Tue, 07 Sep 2021 09:29:26 +0800 (CST)
From:   "jingle.wu" <jingle.wu@emc.com.tw>
To:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Cc:     phoenix@emc.com.tw, josh.chen@emc.com.tw, dave.wang@emc.com.tw,
        "jingle.wu" <jingle.wu@emc.com.tw>
Subject: [PATCH] Input: elan_i2c - Reduce the resume time for WHITEBOX Machine.
Date:   Tue,  7 Sep 2021 09:29:24 +0800
Message-Id: <20210907012924.11391-1-jingle.wu@emc.com.tw>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Singed-off-by: Jingle Wu <jingle.wu@emc.com.tw>
---
 drivers/input/mouse/elan_i2c.h      | 1 +
 drivers/input/mouse/elan_i2c_core.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/input/mouse/elan_i2c.h b/drivers/input/mouse/elan_i2c.h
index dc4a240f4489..84b4a678b482 100644
--- a/drivers/input/mouse/elan_i2c.h
+++ b/drivers/input/mouse/elan_i2c.h
@@ -59,6 +59,7 @@
 #define ETP_PRODUCT_ID_VOXEL	0x00BF
 #define ETP_PRODUCT_ID_MAGPIE	0x0120
 #define ETP_PRODUCT_ID_BOBBA	0x0121
+#define ETP_PRODUCT_ID_WHITEBOX	0x00B8
 
 struct i2c_client;
 struct completion;
diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index dad22c1ea6a0..a3edf71982ce 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -108,6 +108,7 @@ static u32 elan_i2c_lookup_quirks(u16 ic_type, u16 product_id)
 		{ 0x10, ETP_PRODUCT_ID_VOXEL, ETP_QUIRK_QUICK_WAKEUP },
 		{ 0x14, ETP_PRODUCT_ID_MAGPIE, ETP_QUIRK_QUICK_WAKEUP },
 		{ 0x14, ETP_PRODUCT_ID_BOBBA, ETP_QUIRK_QUICK_WAKEUP },
+		{ 0x0D, ETP_PRODUCT_ID_WHITEBOX, ETP_QUIRK_QUICK_WAKEUP },
 	};
 	u32 quirks = 0;
 	int i;
-- 
2.20.1

