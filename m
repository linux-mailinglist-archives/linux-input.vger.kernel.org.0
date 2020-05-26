Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB00F1E1952
	for <lists+linux-input@lfdr.de>; Tue, 26 May 2020 04:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388393AbgEZCWy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 May 2020 22:22:54 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:33958 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388454AbgEZCWy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 May 2020 22:22:54 -0400
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="35734193"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 26 May 2020 10:22:51 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(122906:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Tue, 26 May 2020 10:22:49 +0800 (CST)
Received: from 49.216.87.26
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2482:0:AUTH_LOGIN)
        (envelope-from <jingle.wu@emc.com.tw>); Tue, 26 May 2020 10:22:48 +0800 (CST)
From:   "Jingle.Wu" <jingle.wu@emc.com.tw>
To:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Cc:     phoenix@emc.com.tw, dave.wang@emc.com.tw, josh.chen@emc.com.tw,
        "Jingle.Wu" <jingle.wu@emc.com.tw>
Subject: [PATCH] Input: elantech - Remove read/write registers in attr.
Date:   Tue, 26 May 2020 10:22:46 +0800
Message-Id: <20200526022246.4542-1-jingle.wu@emc.com.tw>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

New Elan IC would not be accessed with the specific regiters.

Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>
---
 drivers/input/mouse/elantech.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
index 2d8434b7b623..fa1aa5f441f5 100644
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -1280,31 +1280,11 @@ static ssize_t elantech_set_int_attr(struct psmouse *psmouse,
 			    elantech_show_int_attr,			       \
 			    elantech_set_int_attr)
 
-ELANTECH_INT_ATTR(reg_07, 0x07);
-ELANTECH_INT_ATTR(reg_10, 0x10);
-ELANTECH_INT_ATTR(reg_11, 0x11);
-ELANTECH_INT_ATTR(reg_20, 0x20);
-ELANTECH_INT_ATTR(reg_21, 0x21);
-ELANTECH_INT_ATTR(reg_22, 0x22);
-ELANTECH_INT_ATTR(reg_23, 0x23);
-ELANTECH_INT_ATTR(reg_24, 0x24);
-ELANTECH_INT_ATTR(reg_25, 0x25);
-ELANTECH_INT_ATTR(reg_26, 0x26);
 ELANTECH_INFO_ATTR(debug);
 ELANTECH_INFO_ATTR(paritycheck);
 ELANTECH_INFO_ATTR(crc_enabled);
 
 static struct attribute *elantech_attrs[] = {
-	&psmouse_attr_reg_07.dattr.attr,
-	&psmouse_attr_reg_10.dattr.attr,
-	&psmouse_attr_reg_11.dattr.attr,
-	&psmouse_attr_reg_20.dattr.attr,
-	&psmouse_attr_reg_21.dattr.attr,
-	&psmouse_attr_reg_22.dattr.attr,
-	&psmouse_attr_reg_23.dattr.attr,
-	&psmouse_attr_reg_24.dattr.attr,
-	&psmouse_attr_reg_25.dattr.attr,
-	&psmouse_attr_reg_26.dattr.attr,
 	&psmouse_attr_debug.dattr.attr,
 	&psmouse_attr_paritycheck.dattr.attr,
 	&psmouse_attr_crc_enabled.dattr.attr,
-- 
2.17.1

