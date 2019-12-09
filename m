Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC239116C31
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 12:18:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfLILSu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 06:18:50 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:29953 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727074AbfLILSt (ORCPT
        <rfc822;Linux-input@vger.kernel.org>); Mon, 9 Dec 2019 06:18:49 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="33204417"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 09 Dec 2019 19:18:48 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(71490:0:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Mon, 09 Dec 2019 19:18:50 +0800 (CST)
Received: from 42.73.254.157
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(101170:0:AUTH_LOGIN)
        (envelope-from <dave.wang@emc.com.tw>); Mon, 09 Dec 2019 19:18:47 +0800 (CST)
From:   Dave Wang <dave.wang@emc.com.tw>
To:     Linux-input@vger.kernel.org, Linux-kernel@vger.kernel.org,
        Dmitry.torokhov@gmail.com
Cc:     phoenix@emc.com.tw, josh.chen@emc.com.tw, jingle.wu@emc.com.tw,
        kai.heng.feng@canonical.com, Dave Wang <dave.wang@emc.com.tw>
Subject: [PATCH 3/3] Input: elan_i2c - Get the device information from PS/2 interface
Date:   Mon,  9 Dec 2019 06:18:42 -0500
Message-Id: <20191209111842.32390-1-dave.wang@emc.com.tw>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Get the device information from PS/2 interface for PS/2+SMBus
protocol such as product_id, fw_version, ic_type...etc.

Signed-off-by: Dave Wang <dave.wang@emc.com.tw>
---
 drivers/input/mouse/elan_i2c_smbus.c | 87 +++++++++++++++++-----------
 1 file changed, 54 insertions(+), 33 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_smbus.c b/drivers/input/mouse/elan_i2c_smbus.c
index 9ffb1f834507..35919035ec89 100644
--- a/drivers/input/mouse/elan_i2c_smbus.c
+++ b/drivers/input/mouse/elan_i2c_smbus.c
@@ -146,17 +146,22 @@ static int elan_smbus_get_version(struct i2c_client *client,
 	int error;
 	u8 val[I2C_SMBUS_BLOCK_MAX] = {0};
 
-	error = i2c_smbus_read_block_data(client,
-					  iap ? ETP_SMBUS_IAP_VERSION_CMD :
-						ETP_SMBUS_FW_VERSION_CMD,
-					  val);
-	if (error < 0) {
-		dev_err(&client->dev, "failed to get %s version: %d\n",
-			iap ? "IAP" : "FW", error);
-		return error;
+	if (device_property_read_u8(&client->dev,
+				iap ? "elan,iap_version" : "elan,fw_version",
+				version)) {
+		error = i2c_smbus_read_block_data(client,
+				iap ? ETP_SMBUS_IAP_VERSION_CMD :
+				ETP_SMBUS_FW_VERSION_CMD,
+				val);
+		if (error < 0) {
+			dev_err(&client->dev, "failed to get %s version: %d\n",
+				iap ? "IAP" : "FW", error);
+			return error;
+		}
+
+		*version = val[2];
 	}
 
-	*version = val[2];
 	return 0;
 }
 
@@ -167,16 +172,21 @@ static int elan_smbus_get_sm_version(struct i2c_client *client,
 	int error;
 	u8 val[I2C_SMBUS_BLOCK_MAX] = {0};
 
-	error = i2c_smbus_read_block_data(client,
-					  ETP_SMBUS_SM_VERSION_CMD, val);
-	if (error < 0) {
-		dev_err(&client->dev, "failed to get SM version: %d\n", error);
-		return error;
+	if (device_property_read_u8(&client->dev, "elan,sm_version", version) ||
+	    device_property_read_u16(&client->dev, "elan,ic_type", ic_type)) {
+		error = i2c_smbus_read_block_data(client,
+						ETP_SMBUS_SM_VERSION_CMD, val);
+		if (error < 0) {
+			dev_err(&client->dev,
+				"failed to get SM version: %d\n", error);
+			return error;
+		}
+
+		*version = val[0];
+		*ic_type = val[1];
+		*clickpad = val[0] & 0x10;
 	}
 
-	*version = val[0];
-	*ic_type = val[1];
-	*clickpad = val[0] & 0x10;
 	return 0;
 }
 
@@ -185,14 +195,18 @@ static int elan_smbus_get_product_id(struct i2c_client *client, u16 *id)
 	int error;
 	u8 val[I2C_SMBUS_BLOCK_MAX] = {0};
 
-	error = i2c_smbus_read_block_data(client,
-					  ETP_SMBUS_UNIQUEID_CMD, val);
-	if (error < 0) {
-		dev_err(&client->dev, "failed to get product ID: %d\n", error);
-		return error;
+	if (device_property_read_u16(&client->dev, "elan,product_id", id)) {
+		error = i2c_smbus_read_block_data(client,
+						ETP_SMBUS_UNIQUEID_CMD, val);
+		if (error < 0) {
+			dev_err(&client->dev,
+				"failed to get product ID: %d\n", error);
+			return error;
+		}
+
+		*id = be16_to_cpup((__be16 *)val);
 	}
 
-	*id = be16_to_cpup((__be16 *)val);
 	return 0;
 }
 
@@ -202,17 +216,22 @@ static int elan_smbus_get_checksum(struct i2c_client *client,
 	int error;
 	u8 val[I2C_SMBUS_BLOCK_MAX] = {0};
 
-	error = i2c_smbus_read_block_data(client,
-					  iap ? ETP_SMBUS_FW_CHECKSUM_CMD :
-						ETP_SMBUS_IAP_CHECKSUM_CMD,
-					  val);
-	if (error < 0) {
-		dev_err(&client->dev, "failed to get %s checksum: %d\n",
-			iap ? "IAP" : "FW", error);
-		return error;
+	if (device_property_read_u16(&client->dev,
+				iap ? "elan,iap_checksum" : "elan,fw_checksum",
+				csum)) {
+		error = i2c_smbus_read_block_data(client,
+					iap ? ETP_SMBUS_IAP_CHECKSUM_CMD :
+						ETP_SMBUS_FW_CHECKSUM_CMD,
+						val);
+		if (error < 0) {
+			dev_err(&client->dev, "failed to get %s checksum: %d\n",
+				iap ? "IAP" : "FW", error);
+			return error;
+		}
+
+		*csum = be16_to_cpup((__be16 *)val);
 	}
 
-	*csum = be16_to_cpup((__be16 *)val);
 	return 0;
 }
 
@@ -496,7 +515,9 @@ static int elan_smbus_finish_fw_update(struct i2c_client *client,
 
 static int elan_smbus_get_pattern(struct i2c_client *client, u8 *pattern)
 {
-	*pattern = 0;
+	if (device_property_read_u8(&client->dev, "elan,pattern", pattern))
+		*pattern = 0;
+
 	return 0;
 }
 
-- 
2.17.1

