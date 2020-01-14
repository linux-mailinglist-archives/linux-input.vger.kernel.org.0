Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E029A13A006
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2020 04:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729129AbgANDki (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 22:40:38 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:46288 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729663AbgANDkh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 22:40:37 -0500
X-Greylist: delayed 580 seconds by postgrey-1.27 at vger.kernel.org; Mon, 13 Jan 2020 22:40:37 EST
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="34183037"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 14 Jan 2020 11:30:55 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(2829:1:AUTH_RELAY)
        (envelope-from <jingle.wu@emc.com.tw>); Tue, 14 Jan 2020 11:30:55 +0800 (CST)
Received: from 42.73.233.242
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2480:0:AUTH_LOGIN)
        (envelope-from <jingle.wu@emc.com.tw>); Tue, 14 Jan 2020 11:30:55 +0800 (CST)
From:   JINGLE WU <jingle.wu@emc.com.tw>
To:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Cc:     phoenix@emc.com.tw, josh.chen@emc.com.tw, dave.wang@emc.com.tw,
        kai.heng.feng@canonical.com, JINGLE WU <jingle.wu@emc.com.tw>
Subject: [PATCH 3/3] Input: elan_i2c - Modify the IAP related functions for new pattern 2
Date:   Mon, 13 Jan 2020 22:30:27 -0500
Message-Id: <20200114033027.6008-1-jingle.wu@emc.com.tw>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Due to the higher resolution of touchpads would be produced, modify
the IAP related functions for new pattern 2.

Signed-off-by: Jingle Wu <jingle.wu@emc.com.tw>
---
 drivers/input/mouse/elan_i2c.h       |   6 +-
 drivers/input/mouse/elan_i2c_core.c  |  38 ++++++---
 drivers/input/mouse/elan_i2c_i2c.c   | 111 ++++++++++++++++++++++-----
 drivers/input/mouse/elan_i2c_smbus.c |  12 +--
 4 files changed, 129 insertions(+), 38 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c.h b/drivers/input/mouse/elan_i2c.h
index aa0c6cfd2690..af1a8ee8f38a 100644
--- a/drivers/input/mouse/elan_i2c.h
+++ b/drivers/input/mouse/elan_i2c.h
@@ -33,6 +33,7 @@
 #define ETP_FW_IAP_PAGE_ERR	(1 << 5)
 #define ETP_FW_IAP_INTF_ERR	(1 << 4)
 #define ETP_FW_PAGE_SIZE	64
+#define ETP_FW_PAGE_SIZE_128	128
 #define ETP_FW_SIGNATURE_SIZE	6
 
 struct i2c_client;
@@ -73,10 +74,11 @@ struct elan_transport_ops {
 	int (*iap_reset)(struct i2c_client *client);
 
 	int (*prepare_fw_update)(struct i2c_client *client);
-	int (*write_fw_block)(struct i2c_client *client,
+	int (*write_fw_block)(struct i2c_client *client, u16 fw_page_size,
 			      const u8 *page, u16 checksum, int idx);
 	int (*finish_fw_update)(struct i2c_client *client,
-				struct completion *reset_done);
+				struct completion *reset_done,
+				int report_len);
 
 	int (*get_report_length)(struct i2c_client *client, int *report_len);
 	int (*get_report)(struct i2c_client *client, u8 *report,
diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index e212ff4099ae..5f584bcf306e 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -95,7 +95,8 @@ struct elan_tp_data {
 	u8			mode;
 	u16			ic_type;
 	u16			fw_validpage_count;
-	u16			fw_signature_address;
+	u16			fw_page_size;
+	unsigned int			fw_signature_address;
 
 	bool			irq_wake;
 
@@ -108,7 +109,8 @@ struct elan_tp_data {
 
 static int elan_get_fwinfo(struct elan_tp_data *data,
 			   u16 *validpage_count,
-			   u16 *signature_address)
+			   unsigned int *signature_address,
+			   u16 *page_size)
 {
 	switch (data->ic_type) {
 	case 0x00:
@@ -133,16 +135,29 @@ static int elan_get_fwinfo(struct elan_tp_data *data,
 	case 0x10:
 		*validpage_count = 1024;
 		break;
+	case 0x11:
+		*validpage_count = 1280;
+		break;
+	case 0x13:
+		*validpage_count = 2048;
+		break;
 	default:
 		/* unknown ic type clear value */
 		*validpage_count = 0;
 		*signature_address = 0;
+		*page_size = 0;
 		return -ENXIO;
 	}
 
 	*signature_address =
 		(*validpage_count * ETP_FW_PAGE_SIZE) - ETP_FW_SIGNATURE_SIZE;
 
+	if ((data->pattern >= 0x01) && (data->iap_version == 1)) {
+		*validpage_count /= 2;
+		*page_size = ETP_FW_PAGE_SIZE_128;
+	} else
+		*page_size = ETP_FW_PAGE_SIZE;
+
 	return 0;
 }
 
@@ -347,7 +362,8 @@ static int elan_query_device_info(struct elan_tp_data *data)
 		return error;
 
 	error = elan_get_fwinfo(data, &data->fw_validpage_count,
-				&data->fw_signature_address);
+				&data->fw_signature_address,
+				&data->fw_page_size);
 	if (error)
 		dev_warn(&data->client->dev,
 			 "unexpected iap version %#04x (ic type: %#04x), firmware update will not work\n",
@@ -440,14 +456,14 @@ static int elan_query_device_parameters(struct elan_tp_data *data)
  * IAP firmware updater related routines
  **********************************************************
  */
-static int elan_write_fw_block(struct elan_tp_data *data,
+static int elan_write_fw_block(struct elan_tp_data *data, u16 page_size,
 			       const u8 *page, u16 checksum, int idx)
 {
 	int retry = ETP_RETRY_COUNT;
 	int error;
 
 	do {
-		error = data->ops->write_fw_block(data->client,
+		error = data->ops->write_fw_block(data->client, page_size,
 						  page, checksum, idx);
 		if (!error)
 			return 0;
@@ -476,15 +492,16 @@ static int __elan_update_firmware(struct elan_tp_data *data,
 
 	iap_start_addr = get_unaligned_le16(&fw->data[ETP_IAP_START_ADDR * 2]);
 
-	boot_page_count = (iap_start_addr * 2) / ETP_FW_PAGE_SIZE;
+	boot_page_count = (iap_start_addr * 2) / data->fw_page_size;
 	for (i = boot_page_count; i < data->fw_validpage_count; i++) {
 		u16 checksum = 0;
-		const u8 *page = &fw->data[i * ETP_FW_PAGE_SIZE];
+		const u8 *page = &fw->data[i * data->fw_page_size];
 
-		for (j = 0; j < ETP_FW_PAGE_SIZE; j += 2)
+		for (j = 0; j < data->fw_page_size; j += 2)
 			checksum += ((page[j + 1] << 8) | page[j]);
 
-		error = elan_write_fw_block(data, page, checksum, i);
+		error = elan_write_fw_block(data, data->fw_page_size,
+						page, checksum, i);
 		if (error) {
 			dev_err(dev, "write page %d fail: %d\n", i, error);
 			return error;
@@ -496,7 +513,8 @@ static int __elan_update_firmware(struct elan_tp_data *data,
 	/* Wait WDT reset and power on reset */
 	msleep(600);
 
-	error = data->ops->finish_fw_update(client, &data->fw_completion);
+	error = data->ops->finish_fw_update(client, &data->fw_completion,
+						data->report_len);
 	if (error)
 		return error;
 
diff --git a/drivers/input/mouse/elan_i2c_i2c.c b/drivers/input/mouse/elan_i2c_i2c.c
index 188b4915fe82..6d0ee741308a 100644
--- a/drivers/input/mouse/elan_i2c_i2c.c
+++ b/drivers/input/mouse/elan_i2c_i2c.c
@@ -20,6 +20,7 @@
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/sched.h>
+#include <linux/slab.h>
 #include <asm/unaligned.h>
 
 #include "elan_i2c.h"
@@ -43,6 +44,7 @@
 #define ETP_I2C_RESOLUTION_CMD		0x0108
 #define ETP_I2C_PRESSURE_CMD		0x010A
 #define ETP_I2C_IAP_VERSION_CMD		0x0110
+#define ETP_I2C_IAP_VERSION_CMD_OLD		0x0111
 #define ETP_I2C_SET_CMD			0x0300
 #define ETP_I2C_POWER_CMD		0x0307
 #define ETP_I2C_FW_CHECKSUM_CMD		0x030F
@@ -53,6 +55,8 @@
 #define ETP_I2C_CALIBRATE_CMD		0x0316
 #define ETP_I2C_MAX_BASELINE_CMD	0x0317
 #define ETP_I2C_MIN_BASELINE_CMD	0x0318
+#define ETP_I2C_IAP_TYPE_REG	0x0040
+#define ETP_I2C_IAP_TYPE_CMD	0x0304
 
 #define ETP_I2C_REPORT_LEN		34
 #define ETP_I2C_REPORT_LEN_ID2		39
@@ -260,6 +264,7 @@ static int elan_i2c_get_version(struct i2c_client *client,
 {
 	int error;
 	u8 pattern_ver;
+	u16 iap_cmd;
 	u8 val[3];
 
 	error = elan_i2c_get_pattern(client, &pattern_ver);
@@ -268,8 +273,13 @@ static int elan_i2c_get_version(struct i2c_client *client,
 		return error;
 	}
 
+	if (pattern_ver >= 0x01)
+		iap_cmd = ETP_I2C_IAP_VERSION_CMD;
+	else
+		iap_cmd = ETP_I2C_IAP_VERSION_CMD_OLD;
+
 	error = elan_i2c_read_cmd(client,
-				  iap ? ETP_I2C_IAP_VERSION_CMD :
+				  iap ? iap_cmd :
 					ETP_I2C_FW_VERSION_CMD,
 				  val);
 	if (error) {
@@ -278,7 +288,7 @@ static int elan_i2c_get_version(struct i2c_client *client,
 		return error;
 	}
 
-	if (pattern_ver == 0x01)
+	if (pattern_ver >= 0x01)
 		*version = iap ? val[1] : val[0];
 	else
 		*version = val[0];
@@ -515,6 +525,41 @@ static int elan_i2c_set_flash_key(struct i2c_client *client)
 	return 0;
 }
 
+static int elan_read_write_iap_type(struct i2c_client *client)
+{
+	int error;
+	u16 constant;
+	u8 val[3];
+	int retry = 3;
+
+	do {
+		error = elan_i2c_write_cmd(client, ETP_I2C_IAP_TYPE_CMD,
+				ETP_I2C_IAP_TYPE_REG);
+		if (error) {
+			dev_err(&client->dev,
+					"cannot write iap type: %d\n", error);
+			return error;
+		}
+
+		error = elan_i2c_read_cmd(client, ETP_I2C_IAP_TYPE_CMD, val);
+		if (error) {
+			dev_err(&client->dev,
+				"failed to read iap type register: %d\n",
+				error);
+			return error;
+		}
+		constant = le16_to_cpup((__le16 *)val);
+		dev_dbg(&client->dev, "iap type reg: 0x%04x.\n", constant);
+
+		if (constant == ETP_I2C_IAP_TYPE_REG)
+			return 0;
+
+	} while (--retry > 0);
+
+	dev_err(&client->dev, "cannot set iap type.\n");
+	return -EIO;
+}
+
 static int elan_i2c_prepare_fw_update(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -522,6 +567,18 @@ static int elan_i2c_prepare_fw_update(struct i2c_client *client)
 	enum tp_mode mode;
 	u8 val[3];
 	u16 password;
+	u8 iap_version;
+	u8 pattern_ver;
+
+	error = elan_i2c_get_pattern(client, &pattern_ver);
+	if (error) {
+		dev_err(&client->dev, "failed to get pattern version\n");
+		return error;
+	}
+
+	error = elan_i2c_get_version(client, true, &iap_version);
+	if (error)
+		return error;
 
 	/* Get FW in which mode	(IAP_MODE/MAIN_MODE)  */
 	error = elan_i2c_iap_get_mode(client, &mode);
@@ -555,6 +612,12 @@ static int elan_i2c_prepare_fw_update(struct i2c_client *client)
 		return -EIO;
 	}
 
+	if ((pattern_ver >= 0x1) && (iap_version == 1)) {
+		error = elan_read_write_iap_type(client);
+		if (error)
+			return error;
+	}
+
 	/* Set flash key again */
 	error = elan_i2c_set_flash_key(client);
 	if (error)
@@ -580,26 +643,26 @@ static int elan_i2c_prepare_fw_update(struct i2c_client *client)
 	return 0;
 }
 
-static int elan_i2c_write_fw_block(struct i2c_client *client,
+static int elan_i2c_write_fw_block(struct i2c_client *client, u16 fw_page_size,
 				   const u8 *page, u16 checksum, int idx)
 {
 	struct device *dev = &client->dev;
-	u8 page_store[ETP_FW_PAGE_SIZE + 4];
+	u8 *page_store = kcalloc(1, fw_page_size + 4, GFP_KERNEL);
 	u8 val[3];
 	u16 result;
-	int ret, error;
+	int ret, error = 0;
 
 	page_store[0] = ETP_I2C_IAP_REG_L;
 	page_store[1] = ETP_I2C_IAP_REG_H;
-	memcpy(&page_store[2], page, ETP_FW_PAGE_SIZE);
+	memcpy(&page_store[2], page, fw_page_size);
 	/* recode checksum at last two bytes */
-	put_unaligned_le16(checksum, &page_store[ETP_FW_PAGE_SIZE + 2]);
+	put_unaligned_le16(checksum, &page_store[fw_page_size + 2]);
 
-	ret = i2c_master_send(client, page_store, sizeof(page_store));
-	if (ret != sizeof(page_store)) {
+	ret = i2c_master_send(client, page_store, fw_page_size + 4);
+	if (ret != fw_page_size + 4) {
 		error = ret < 0 ? ret : -EIO;
 		dev_err(dev, "Failed to write page %d: %d\n", idx, error);
-		return error;
+		goto exit;
 	}
 
 	/* Wait for F/W to update one page ROM data. */
@@ -608,29 +671,33 @@ static int elan_i2c_write_fw_block(struct i2c_client *client,
 	error = elan_i2c_read_cmd(client, ETP_I2C_IAP_CTRL_CMD, val);
 	if (error) {
 		dev_err(dev, "Failed to read IAP write result: %d\n", error);
-		return error;
+		goto exit;
 	}
 
 	result = le16_to_cpup((__le16 *)val);
 	if (result & (ETP_FW_IAP_PAGE_ERR | ETP_FW_IAP_INTF_ERR)) {
 		dev_err(dev, "IAP reports failed write: %04hx\n",
 			result);
-		return -EIO;
+		error = -EIO;
+		goto exit;
 	}
 
-	return 0;
+exit:
+	kfree(page_store);
+	return error;
 }
 
 static int elan_i2c_finish_fw_update(struct i2c_client *client,
-				     struct completion *completion)
+				     struct completion *completion,
+				     int report_len)
 {
 	struct device *dev = &client->dev;
-	int error;
+	int error = 0;
 	int len;
-	u8 buffer[ETP_I2C_REPORT_LEN];
+	u8 *buffer = kcalloc(1, report_len, GFP_KERNEL);
 
-	len = i2c_master_recv(client, buffer, ETP_I2C_REPORT_LEN);
-	if (len != ETP_I2C_REPORT_LEN) {
+	len = i2c_master_recv(client, buffer, report_len);
+	if (len != report_len) {
 		error = len < 0 ? len : -EIO;
 		dev_warn(dev, "failed to read I2C data after FW WDT reset: %d (%d)\n",
 			error, len);
@@ -651,17 +718,19 @@ static int elan_i2c_finish_fw_update(struct i2c_client *client,
 	disable_irq(client->irq);
 
 	if (error)
-		return error;
+		goto exit;
 
 	len = i2c_master_recv(client, buffer, ETP_I2C_INF_LENGTH);
 	if (len != ETP_I2C_INF_LENGTH) {
 		error = len < 0 ? len : -EIO;
 		dev_err(dev, "failed to read INT signal: %d (%d)\n",
 			error, len);
-		return error;
+		goto exit;
 	}
 
-	return 0;
+exit:
+	kfree(buffer);
+	return error;
 }
 
 static int elan_i2c_get_report_length(struct i2c_client *client,
diff --git a/drivers/input/mouse/elan_i2c_smbus.c b/drivers/input/mouse/elan_i2c_smbus.c
index de14345c5f34..4fe62ab76fda 100644
--- a/drivers/input/mouse/elan_i2c_smbus.c
+++ b/drivers/input/mouse/elan_i2c_smbus.c
@@ -415,7 +415,8 @@ static int elan_smbus_prepare_fw_update(struct i2c_client *client)
 
 
 static int elan_smbus_write_fw_block(struct i2c_client *client,
-					 const u8 *page, u16 checksum, int idx)
+				u16 fw_page_size, const u8 *page,
+				u16 checksum, int idx)
 {
 	struct device *dev = &client->dev;
 	int error;
@@ -429,7 +430,7 @@ static int elan_smbus_write_fw_block(struct i2c_client *client,
 	 */
 	error = i2c_smbus_write_block_data(client,
 					   ETP_SMBUS_WRITE_FW_BLOCK,
-					   ETP_FW_PAGE_SIZE / 2,
+					   fw_page_size / 2,
 					   page);
 	if (error) {
 		dev_err(dev, "Failed to write page %d (part %d): %d\n",
@@ -439,8 +440,8 @@ static int elan_smbus_write_fw_block(struct i2c_client *client,
 
 	error = i2c_smbus_write_block_data(client,
 					   ETP_SMBUS_WRITE_FW_BLOCK,
-					   ETP_FW_PAGE_SIZE / 2,
-					   page + ETP_FW_PAGE_SIZE / 2);
+					   fw_page_size / 2,
+					   page + fw_page_size / 2);
 	if (error) {
 		dev_err(dev, "Failed to write page %d (part %d): %d\n",
 			idx, 2, error);
@@ -502,7 +503,8 @@ static int elan_smbus_get_report(struct i2c_client *client,
 }
 
 static int elan_smbus_finish_fw_update(struct i2c_client *client,
-				       struct completion *fw_completion)
+				       struct completion *fw_completion,
+				       int report_len)
 {
 	/* No special handling unlike I2C transport */
 	return 0;
-- 
2.17.1

