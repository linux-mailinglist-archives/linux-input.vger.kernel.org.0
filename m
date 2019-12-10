Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C08BE118386
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 10:28:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbfLJJ17 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Dec 2019 04:27:59 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:40061 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbfLJJ17 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Dec 2019 04:27:59 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="33219841"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 10 Dec 2019 17:27:58 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(71499:0:AUTH_RELAY)
        (envelope-from <johnny.chuang@emc.com.tw>); Tue, 10 Dec 2019 17:27:58 +0800 (CST)
Received: from 192.168.55.71
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(101178:0:AUTH_LOGIN)
        (envelope-from <johnny.chuang@emc.com.tw>); Tue, 10 Dec 2019 17:27:55 +0800 (CST)
From:   "Johnny.Chuang" <johnny.chuang@emc.com.tw>
To:     "'Dmitry Torokhov'" <dmitry.torokhov@gmail.com>,
        <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>
Cc:     =?big5?B?U1RSRDItvbK0Zrxg?= <jennifer.tsai@emc.com.tw>,
        <james.chen@emc.com.tw>,
        =?big5?B?J7Hns9W1vic=?= <paul.liang@emc.com.tw>,
        "'jeff'" <jeff.chuang@emc.com.tw>,
        =?big5?B?U1RSRDItsviozsBN?= <johnny.chuang@emc.com.tw>
References: <1575969632-18703-1-git-send-email-johnny.chuang@elan.corp-partner.google.com>
In-Reply-To: <1575969632-18703-1-git-send-email-johnny.chuang@elan.corp-partner.google.com>
Subject: [PATCH] Input: elants_i2c - Add Remark ID check flow in firmware update function
Date:   Tue, 10 Dec 2019 17:27:53 +0800
Message-ID: <00a901d5af3c$193e9cd0$4bbbd670$@emc.com.tw>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="big5"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQKU6CCR3y2ZDKNDJHcdSmqZJZrY96Y0pz/A
Content-Language: zh-tw
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcMDUwMTBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy01NjY3N2YyZi0xYjJmLTExZWEtOGFiMy03YzVjZjg3NDk0NzhcYW1lLXRlc3RcNTY2NzdmMzEtMWIyZi0xMWVhLThhYjMtN2M1Y2Y4NzQ5NDc4Ym9keS50eHQiIHN6PSI0OTYyIiB0PSIxMzIyMDQ0MzY3MjY2Mjc3ODQiIGg9Imkxc3FFcndSS1dBSGZBbTlZcFdnenpCZzBWUT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch add Remark ID check flow to firmware update function of
elan touchscreen driver.

It avoids firmware update with mismatched Remark ID.

This function is supported by our latest version of boot code,
but it cooperates well with earlier versions.

Our driver will decide if enable Remark ID check with boot code version.

Signed-off-by: Johnny Chuang <johnny.chuang@emc.com.tw>
---
 drivers/input/touchscreen/elants_i2c.c | 77
++++++++++++++++++++++++++++++----
 1 file changed, 69 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c
b/drivers/input/touchscreen/elants_i2c.c
index d4ad24e..4911799 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -59,8 +59,10 @@
 #define CMD_HEADER_WRITE	0x54
 #define CMD_HEADER_READ		0x53
 #define CMD_HEADER_6B_READ	0x5B
+#define CMD_HEADER_ROM_READ	0x96
 #define CMD_HEADER_RESP		0x52
 #define CMD_HEADER_6B_RESP	0x9B
+#define CMD_HEADER_ROM_RESP	0x95
 #define CMD_HEADER_HELLO	0x55
 #define CMD_HEADER_REK		0x66
 
@@ -200,6 +202,10 @@ static int elants_i2c_execute_command(struct i2c_client
*client,
 		expected_response = CMD_HEADER_6B_RESP;
 		break;
 
+	case CMD_HEADER_ROM_READ:
+		expected_response = CMD_HEADER_ROM_RESP;
+		break;
+
 	default:
 		dev_err(&client->dev, "%s: invalid command %*ph\n",
 			__func__, (int)cmd_size, cmd);
@@ -556,6 +562,8 @@ static int elants_i2c_initialize(struct elants_data *ts)
 
 	/* hw version is available even if device in recovery state */
 	error2 = elants_i2c_query_hw_version(ts);
+	if (!error2)
+		error2 = elants_i2c_query_bc_version(ts);
 	if (!error)
 		error = error2;
 
@@ -564,8 +572,6 @@ static int elants_i2c_initialize(struct elants_data *ts)
 	if (!error)
 		error = elants_i2c_query_test_version(ts);
 	if (!error)
-		error = elants_i2c_query_bc_version(ts);
-	if (!error)
 		error = elants_i2c_query_ts_info(ts);
 
 	if (error)
@@ -613,39 +619,94 @@ static int elants_i2c_fw_write_page(struct i2c_client
*client,
 	return error;
 }
 
+static int elants_i2c_validate_remark_id(struct elants_data *ts,
+					 const struct firmware *fw)
+{
+	struct i2c_client *client = ts->client;
+	int error;
+	const u8 cmd[] = { CMD_HEADER_ROM_READ, 0x80, 0x1F, 0x00, 0x00, 0x21
};
+	u8 resp[6] = { 0 };
+	u16 ts_remark_id = 0;
+	u16 fw_remark_id = 0;
+
+	/* Compare TS Remark ID and FW Remark ID */
+	error = elants_i2c_execute_command(client, cmd, sizeof(cmd),
+					resp, sizeof(resp));
+	if (error) {
+		dev_err(&client->dev, "failed to query Remark ID: %d\n",
error);
+		return error;
+	}
+
+	ts_remark_id = get_unaligned_be16(&resp[3]);
+
+	fw_remark_id = get_unaligned_le16(&fw->data[fw->size - 4]);
+
+	if (fw_remark_id != ts_remark_id) {
+		dev_err(&client->dev,
+			"Remark ID Mismatched: ts_remark_id=0x%04x,
fw_remark_id=0x%04x.\n",
+			ts_remark_id, fw_remark_id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int elants_i2c_do_update_firmware(struct i2c_client *client,
 					 const struct firmware *fw,
 					 bool force)
 {
+	struct elants_data *ts = i2c_get_clientdata(client);
 	const u8 enter_iap[] = { 0x45, 0x49, 0x41, 0x50 };
 	const u8 enter_iap2[] = { 0x54, 0x00, 0x12, 0x34 };
 	const u8 iap_ack[] = { 0x55, 0xaa, 0x33, 0xcc };
-	const u8 close_idle[] = {0x54, 0x2c, 0x01, 0x01};
+	const u8 close_idle[] = { 0x54, 0x2c, 0x01, 0x01 };
 	u8 buf[HEADER_SIZE];
 	u16 send_id;
 	int page, n_fw_pages;
 	int error;
+	bool check_remark_id = ts->iap_version >= 0x60;
 
 	/* Recovery mode detection! */
 	if (force) {
 		dev_dbg(&client->dev, "Recovery mode procedure\n");
+
+		if (check_remark_id) {
+			error = elants_i2c_validate_remark_id(ts, fw);
+			if (error)
+				return error;
+		}
+
 		error = elants_i2c_send(client, enter_iap2,
sizeof(enter_iap2));
+		if (error) {
+			dev_err(&client->dev, "failed to enter IAP mode:
%d\n",
+				error);
+			return error;
+		}
 	} else {
 		/* Start IAP Procedure */
 		dev_dbg(&client->dev, "Normal IAP procedure\n");
+
 		/* Close idle mode */
 		error = elants_i2c_send(client, close_idle,
sizeof(close_idle));
 		if (error)
 			dev_err(&client->dev, "Failed close idle: %d\n",
error);
 		msleep(60);
+
 		elants_i2c_sw_reset(client);
 		msleep(20);
-		error = elants_i2c_send(client, enter_iap,
sizeof(enter_iap));
-	}
 
-	if (error) {
-		dev_err(&client->dev, "failed to enter IAP mode: %d\n",
error);
-		return error;
+		if (check_remark_id) {
+			error = elants_i2c_validate_remark_id(ts, fw);
+			if (error)
+				return error;
+		}
+
+		error = elants_i2c_send(client, enter_iap,
sizeof(enter_iap));
+		if (error) {
+			dev_err(&client->dev, "failed to enter IAP mode:
%d\n",
+				error);
+			return error;
+		}
 	}
 
 	msleep(20);
-- 
2.7.4

