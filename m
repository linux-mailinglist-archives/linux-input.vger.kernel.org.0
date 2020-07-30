Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FBEC232BAA
	for <lists+linux-input@lfdr.de>; Thu, 30 Jul 2020 08:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbgG3GFg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Jul 2020 02:05:36 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:8771 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728646AbgG3GFg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Jul 2020 02:05:36 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="36653723"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 30 Jul 2020 14:05:32 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(82070:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Thu, 30 Jul 2020 14:05:30 +0800 (CST)
Received: from 49.216.132.207
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2485:0:AUTH_LOGIN)
        (envelope-from <jingle.wu@emc.com.tw>); Thu, 30 Jul 2020 14:05:30 +0800 (CST)
From:   Jingle Wu <jingle.wu@emc.com.tw>
To:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Cc:     phoenix@emc.com.tw, josh.chen@emc.com.tw, dave.wang@emc.com.tw,
        kai.heng.feng@canonical.com, Jingle Wu <jingle.wu@emc.com.tw>
Subject: [PATCH] Input: elan_i2c - Add ic type 0x15.
Date:   Thu, 30 Jul 2020 02:05:26 -0400
Message-Id: <20200730060526.12439-1-jingle.wu@emc.com.tw>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The update firmware flow of ic type 0x15 is same with ic type 0x14.

Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>
---
 drivers/input/mouse/elan_i2c_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 8a0f224da423..c599e21a8478 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -138,6 +138,7 @@ static int elan_get_fwinfo(u16 ic_type, u8 iap_version, u16 *validpage_count,
 		*validpage_count = 2048;
 		break;
 	case 0x14:
+	case 0x15:
 		*validpage_count = 1024;
 		break;
 	default:
@@ -151,7 +152,7 @@ static int elan_get_fwinfo(u16 ic_type, u8 iap_version, u16 *validpage_count,
 	*signature_address =
 		(*validpage_count * ETP_FW_PAGE_SIZE) - ETP_FW_SIGNATURE_SIZE;
 
-	if (ic_type == 0x14 && iap_version >= 2) {
+	if ((ic_type == 0x14 || ic_type == 0x15) && iap_version >= 2) {
 		*validpage_count /= 8;
 		*page_size = ETP_FW_PAGE_SIZE_512;
 	} else if (ic_type >= 0x0D && iap_version >= 1) {
-- 
2.17.1

