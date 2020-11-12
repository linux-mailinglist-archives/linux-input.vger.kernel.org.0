Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC6982AFE5B
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 06:37:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729321AbgKLFhR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 00:37:17 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:54802 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbgKLB6W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Nov 2020 20:58:22 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="38118509"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 12 Nov 2020 09:58:20 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(2862:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Thu, 12 Nov 2020 09:58:19 +0800 (CST)
Received: from 49.216.112.142
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2475:0:AUTH_LOGIN)
        (envelope-from <jingle.wu@emc.com.tw>); Thu, 12 Nov 2020 09:58:18 +0800 (CST)
From:   "jingle.wu" <jingle.wu@emc.com.tw>
To:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Cc:     phoenix@emc.com.tw, dave.wang@emc.com.tw, josh.chen@emc.com.tw,
        "jingle.wu" <jingle.wu@emc.com.tw>
Subject: [PATCH] Input: elan_i2c - Modify the correct input of the iap page type command.
Date:   Thu, 12 Nov 2020 09:58:10 +0800
Message-Id: <20201112015810.9559-1-jingle.wu@emc.com.tw>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The iap page type command of the parameter is page_size.

Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>
---
 drivers/input/mouse/elan_i2c.h       |  2 +-
 drivers/input/mouse/elan_i2c_core.c  |  3 ++-
 drivers/input/mouse/elan_i2c_i2c.c   | 10 +++++-----
 drivers/input/mouse/elan_i2c_smbus.c |  2 +-
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c.h b/drivers/input/mouse/elan_i2c.h
index c75b00c45d75..36e3cd908671 100644
--- a/drivers/input/mouse/elan_i2c.h
+++ b/drivers/input/mouse/elan_i2c.h
@@ -78,7 +78,7 @@ struct elan_transport_ops {
 	int (*iap_reset)(struct i2c_client *client);
 
 	int (*prepare_fw_update)(struct i2c_client *client, u16 ic_type,
-				 u8 iap_version);
+				 u8 iap_version, u16 fw_page_size);
 	int (*write_fw_block)(struct i2c_client *client, u16 fw_page_size,
 			      const u8 *page, u16 checksum, int idx);
 	int (*finish_fw_update)(struct i2c_client *client,
diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index c599e21a8478..61ed3f5ca219 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -497,7 +497,8 @@ static int __elan_update_firmware(struct elan_tp_data *data,
 	u16 sw_checksum = 0, fw_checksum = 0;
 
 	error = data->ops->prepare_fw_update(client, data->ic_type,
-					     data->iap_version);
+					     data->iap_version,
+					     data->fw_page_size);
 	if (error)
 		return error;
 
diff --git a/drivers/input/mouse/elan_i2c_i2c.c b/drivers/input/mouse/elan_i2c_i2c.c
index 5a496d4ffa49..13dc097eb6c6 100644
--- a/drivers/input/mouse/elan_i2c_i2c.c
+++ b/drivers/input/mouse/elan_i2c_i2c.c
@@ -517,7 +517,7 @@ static int elan_i2c_set_flash_key(struct i2c_client *client)
 	return 0;
 }
 
-static int elan_read_write_iap_type(struct i2c_client *client)
+static int elan_read_write_iap_type(struct i2c_client *client, u16 fw_page_size)
 {
 	int error;
 	u16 constant;
@@ -526,7 +526,7 @@ static int elan_read_write_iap_type(struct i2c_client *client)
 
 	do {
 		error = elan_i2c_write_cmd(client, ETP_I2C_IAP_TYPE_CMD,
-					   ETP_I2C_IAP_TYPE_REG);
+					   fw_page_size / 2);
 		if (error) {
 			dev_err(&client->dev,
 				"cannot write iap type: %d\n", error);
@@ -543,7 +543,7 @@ static int elan_read_write_iap_type(struct i2c_client *client)
 		constant = le16_to_cpup((__le16 *)val);
 		dev_dbg(&client->dev, "iap type reg: 0x%04x\n", constant);
 
-		if (constant == ETP_I2C_IAP_TYPE_REG)
+		if (constant == fw_page_size / 2)
 			return 0;
 
 	} while (--retry > 0);
@@ -553,7 +553,7 @@ static int elan_read_write_iap_type(struct i2c_client *client)
 }
 
 static int elan_i2c_prepare_fw_update(struct i2c_client *client, u16 ic_type,
-				      u8 iap_version)
+				      u8 iap_version, u16 fw_page_size)
 {
 	struct device *dev = &client->dev;
 	int error;
@@ -594,7 +594,7 @@ static int elan_i2c_prepare_fw_update(struct i2c_client *client, u16 ic_type,
 	}
 
 	if (ic_type >= 0x0D && iap_version >= 1) {
-		error = elan_read_write_iap_type(client);
+		error = elan_read_write_iap_type(client, fw_page_size);
 		if (error)
 			return error;
 	}
diff --git a/drivers/input/mouse/elan_i2c_smbus.c b/drivers/input/mouse/elan_i2c_smbus.c
index 8ff823751f3b..1820f1cfc1dc 100644
--- a/drivers/input/mouse/elan_i2c_smbus.c
+++ b/drivers/input/mouse/elan_i2c_smbus.c
@@ -340,7 +340,7 @@ static int elan_smbus_set_flash_key(struct i2c_client *client)
 }
 
 static int elan_smbus_prepare_fw_update(struct i2c_client *client, u16 ic_type,
-					u8 iap_version)
+					u8 iap_version, u16 fw_page_size)
 {
 	struct device *dev = &client->dev;
 	int len;
-- 
2.17.1

