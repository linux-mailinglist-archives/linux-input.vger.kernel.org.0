Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B70B1116C12
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 12:14:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbfLILOf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 06:14:35 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:19137 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbfLILOf (ORCPT
        <rfc822;Linux-input@vger.kernel.org>); Mon, 9 Dec 2019 06:14:35 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="33204387"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 09 Dec 2019 19:14:33 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(71492:0:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Mon, 09 Dec 2019 19:14:35 +0800 (CST)
Received: from 42.73.254.157
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(101176:3:AUTH_LOGIN)
        (envelope-from <dave.wang@emc.com.tw>); Mon, 09 Dec 2019 19:14:34 +0800 (CST)
From:   Dave Wang <dave.wang@emc.com.tw>
To:     Linux-input@vger.kernel.org, Linux-kernel@vger.kernel.org,
        Dmitry.torokhov@gmail.com
Cc:     phoenix@emc.com.tw, josh.chen@emc.com.tw, jingle.wu@emc.com.tw,
        kai.heng.feng@canonical.com, Dave Wang <dave.wang@emc.com.tw>
Subject: [PATCH 2/3] Input: elan_i2c - Do no operation for elan_smbus_sleep_control function
Date:   Mon,  9 Dec 2019 06:14:29 -0500
Message-Id: <20191209111429.32315-1-dave.wang@emc.com.tw>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some touchpads might get error while triggerring the sleep_control
command in SMBus interface. Do no operation for elan_smbus_sleep_control
function.

Signed-off-by: Dave Wang <dave.wang@emc.com.tw>
---
 drivers/input/mouse/elan_i2c_smbus.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_smbus.c b/drivers/input/mouse/elan_i2c_smbus.c
index bcb9ec4a7a6b..9ffb1f834507 100644
--- a/drivers/input/mouse/elan_i2c_smbus.c
+++ b/drivers/input/mouse/elan_i2c_smbus.c
@@ -89,10 +89,7 @@ static int elan_smbus_set_mode(struct i2c_client *client, u8 mode)
 
 static int elan_smbus_sleep_control(struct i2c_client *client, bool sleep)
 {
-	if (sleep)
-		return i2c_smbus_write_byte(client, ETP_SMBUS_SLEEP_CMD);
-	else
-		return 0; /* XXX should we send ETP_SMBUS_ENABLE_TP here? */
+	return 0; /* A no-op */
 }
 
 static int elan_smbus_power_control(struct i2c_client *client, bool enable)
-- 
2.17.1

