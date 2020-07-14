Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B87121EE73
	for <lists+linux-input@lfdr.de>; Tue, 14 Jul 2020 12:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbgGNK4q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jul 2020 06:56:46 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:30348 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbgGNK4p (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jul 2020 06:56:45 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="36424498"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 14 Jul 2020 18:56:43 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(41847:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Tue, 14 Jul 2020 18:56:43 +0800 (CST)
Received: from 101.12.45.92
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2477:1:AUTH_LOGIN)
        (envelope-from <jingle.wu@emc.com.tw>); Tue, 14 Jul 2020 18:56:42 +0800 (CST)
From:   Jingle Wu <jingle.wu@emc.com.tw>
To:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Cc:     phoenix@emc.com.tw, josh.chen@emc.com.tw, jingle.wu@emc.com.tw,
        kai.heng.feng@canonical.com
Subject: [PATCH 1/2] Input: elan_i2c - Add ic type 0x11, 0x13, 0x14.
Date:   Tue, 14 Jul 2020 06:56:33 -0400
Message-Id: <20200714105633.15099-1-jingle.wu@emc.com.tw>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add ic type 0x11, 0x13, 0x14 page sizes for update firmware.

Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>.
---
 drivers/input/mouse/elan_i2c_core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 3f9354baac4b..e90beada0ecf 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -126,6 +126,15 @@ static int elan_get_fwinfo(u16 ic_type, u16 *validpage_count,
 	case 0x10:
 		*validpage_count = 1024;
 		break;
+	case 0x11:
+		*validpage_count = 1280;
+		break;
+	case 0x13:
+		*validpage_count = 2048;
+		break;
+	case 0x14:
+		*validpage_count = 1024;
+		break;
 	default:
 		/* unknown ic type clear value */
 		*validpage_count = 0;
-- 
2.17.1

