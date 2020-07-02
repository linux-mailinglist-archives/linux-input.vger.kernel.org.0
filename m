Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE571211F9A
	for <lists+linux-input@lfdr.de>; Thu,  2 Jul 2020 11:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgGBJRK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Jul 2020 05:17:10 -0400
Received: from emcscan.emc.com.tw ([192.72.220.5]:55136 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgGBJRK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Jul 2020 05:17:10 -0400
X-Greylist: delayed 631 seconds by postgrey-1.27 at vger.kernel.org; Thu, 02 Jul 2020 05:17:09 EDT
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="36257856"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 02 Jul 2020 17:06:31 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(43927:0:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Thu, 02 Jul 2020 17:06:29 +0800 (CST)
Received: from 101.12.40.229
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2483:0:AUTH_LOGIN)
        (envelope-from <jingle.wu@emc.com.tw>); Thu, 02 Jul 2020 17:06:28 +0800 (CST)
From:   Jingle Wu <jingle.wu@emc.com.tw>
To:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Cc:     phoenix@emc.com.tw, dave.wang@emc.com.tw, josh.chen@emc.com.tw,
        Jingle Wu <jingle.wu@emc.com.tw>
Subject: [PATCH] Input: elan_i2c - Add ic type 0x14, modify the iap method for all IC.
Date:   Thu,  2 Jul 2020 05:06:23 -0400
Message-Id: <20200702090623.4130-1-jingle.wu@emc.com.tw>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The 0x14 is 512 page size.

Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>
---
 drivers/input/mouse/elan_i2c.h       |  3 ++-
 drivers/input/mouse/elan_i2c_core.c  | 16 ++++++++++++----
 drivers/input/mouse/elan_i2c_i2c.c   | 24 ++++++++++++------------
 drivers/input/mouse/elan_i2c_smbus.c |  2 +-
 4 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c.h b/drivers/input/mouse/elan_i2c.h
index af1a8ee8f38a..71fff2cef8b5 100644
--- a/drivers/input/mouse/elan_i2c.h
+++ b/drivers/input/mouse/elan_i2c.h
@@ -34,6 +34,7 @@
 #define ETP_FW_IAP_INTF_ERR	(1 << 4)
 #define ETP_FW_PAGE_SIZE	64
 #define ETP_FW_PAGE_SIZE_128	128
+#define ETP_FW_PAGE_SIZE_512	512
 #define ETP_FW_SIGNATURE_SIZE	6
 
 struct i2c_client;
@@ -73,7 +74,7 @@ struct elan_transport_ops {
 	int (*iap_get_mode)(struct i2c_client *client, enum tp_mode *mode);
 	int (*iap_reset)(struct i2c_client *client);
 
-	int (*prepare_fw_update)(struct i2c_client *client);
+	int (*prepare_fw_update)(struct i2c_client *client, u16 ic_type);
 	int (*write_fw_block)(struct i2c_client *client, u16 fw_page_size,
 			      const u8 *page, u16 checksum, int idx);
 	int (*finish_fw_update)(struct i2c_client *client,
diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 5f584bcf306e..d64d3016ab7b 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -133,6 +133,7 @@ static int elan_get_fwinfo(struct elan_tp_data *data,
 		*validpage_count = 640;
 		break;
 	case 0x10:
+	case 0x14:
 		*validpage_count = 1024;
 		break;
 	case 0x11:
@@ -152,12 +153,19 @@ static int elan_get_fwinfo(struct elan_tp_data *data,
 	*signature_address =
 		(*validpage_count * ETP_FW_PAGE_SIZE) - ETP_FW_SIGNATURE_SIZE;
 
-	if ((data->pattern >= 0x01) && (data->iap_version == 1)) {
+	if ((data->ic_type == 0x14) && (data->iap_version >= 2))
+	{
+		*validpage_count /= 8;
+		*page_size = ETP_FW_PAGE_SIZE_512;
+	}
+	else if ((data->ic_type >= 0x0D) && (data->iap_version >= 1)) {
 		*validpage_count /= 2;
 		*page_size = ETP_FW_PAGE_SIZE_128;
-	} else
+	}
+	else
+	{
 		*page_size = ETP_FW_PAGE_SIZE;
-
+	}
 	return 0;
 }
 
@@ -486,7 +494,7 @@ static int __elan_update_firmware(struct elan_tp_data *data,
 	u16 boot_page_count;
 	u16 sw_checksum = 0, fw_checksum = 0;
 
-	error = data->ops->prepare_fw_update(client);
+	error = data->ops->prepare_fw_update(client, data->ic_type);
 	if (error)
 		return error;
 
diff --git a/drivers/input/mouse/elan_i2c_i2c.c b/drivers/input/mouse/elan_i2c_i2c.c
index 6d0ee741308a..ef19fd5dacf6 100644
--- a/drivers/input/mouse/elan_i2c_i2c.c
+++ b/drivers/input/mouse/elan_i2c_i2c.c
@@ -254,7 +254,11 @@ static int elan_i2c_get_pattern(struct i2c_client *client, u8 *pattern)
 		dev_err(&client->dev, "failed to get pattern: %d\n", error);
 		return error;
 	}
-	*pattern = val[1];
+
+	if((val[0]==0xFF)&&(val[1]==0xFF))
+		*pattern = 0;
+	else
+		*pattern = val[1];
 
 	return 0;
 }
@@ -560,7 +564,7 @@ static int elan_read_write_iap_type(struct i2c_client *client)
 	return -EIO;
 }
 
-static int elan_i2c_prepare_fw_update(struct i2c_client *client)
+static int elan_i2c_prepare_fw_update(struct i2c_client *client, u16 ic_type)
 {
 	struct device *dev = &client->dev;
 	int error;
@@ -568,13 +572,6 @@ static int elan_i2c_prepare_fw_update(struct i2c_client *client)
 	u8 val[3];
 	u16 password;
 	u8 iap_version;
-	u8 pattern_ver;
-
-	error = elan_i2c_get_pattern(client, &pattern_ver);
-	if (error) {
-		dev_err(&client->dev, "failed to get pattern version\n");
-		return error;
-	}
 
 	error = elan_i2c_get_version(client, true, &iap_version);
 	if (error)
@@ -611,8 +608,8 @@ static int elan_i2c_prepare_fw_update(struct i2c_client *client)
 		dev_err(dev, "wrong mode: %d\n", mode);
 		return -EIO;
 	}
-
-	if ((pattern_ver >= 0x1) && (iap_version == 1)) {
+	
+	if ((ic_type >= 0x0D) && (iap_version >= 1)) {
 		error = elan_read_write_iap_type(client);
 		if (error)
 			return error;
@@ -666,7 +663,10 @@ static int elan_i2c_write_fw_block(struct i2c_client *client, u16 fw_page_size,
 	}
 
 	/* Wait for F/W to update one page ROM data. */
-	msleep(35);
+	if(fw_page_size==ETP_FW_PAGE_SIZE_512)
+		msleep(50);
+	else
+		msleep(35);
 
 	error = elan_i2c_read_cmd(client, ETP_I2C_IAP_CTRL_CMD, val);
 	if (error) {
diff --git a/drivers/input/mouse/elan_i2c_smbus.c b/drivers/input/mouse/elan_i2c_smbus.c
index 0f441deef3cf..6d6090e7cb38 100644
--- a/drivers/input/mouse/elan_i2c_smbus.c
+++ b/drivers/input/mouse/elan_i2c_smbus.c
@@ -340,7 +340,7 @@ static int elan_smbus_set_flash_key(struct i2c_client *client)
 	return 0;
 }
 
-static int elan_smbus_prepare_fw_update(struct i2c_client *client)
+static int elan_smbus_prepare_fw_update(struct i2c_client *client, u16 ic_type)
 {
 	struct device *dev = &client->dev;
 	int len;
-- 
2.17.1

