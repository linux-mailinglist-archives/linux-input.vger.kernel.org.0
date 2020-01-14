Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE08139FE8
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2020 04:20:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729336AbgANDUi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 22:20:38 -0500
Received: from emcscan.emc.com.tw ([192.72.220.5]:31557 "EHLO
        emcscan.emc.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728894AbgANDUi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 22:20:38 -0500
X-IronPort-AV: E=Sophos;i="5.56,253,1539619200"; 
   d="scan'208";a="34182867"
Received: from unknown (HELO webmail.emc.com.tw) ([192.168.10.1])
  by emcscan.emc.com.tw with ESMTP; 14 Jan 2020 11:20:28 +0800
Received: from 192.168.10.23
        by webmail.emc.com.tw with MailAudit ESMTP Server V5.0(2828:0:AUTH_RELAY)
        (envelope-from <dave.wang@emc.com.tw>); Tue, 14 Jan 2020 11:20:28 +0800 (CST)
Received: from 42.73.233.242
        by webmail.emc.com.tw with Mail2000 ESMTPA Server V7.00(2484:0:AUTH_LOGIN)
        (envelope-from <dave.wang@emc.com.tw>); Tue, 14 Jan 2020 11:20:27 +0800 (CST)
From:   Dave Wang <dave.wang@emc.com.tw>
To:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        dmitry.torokhov@gmail.com
Cc:     phoenix@emc.com.tw, josh.chen@emc.com.tw, jingle.wu@emc.com.tw,
        kai.heng.feng@canonical.com, Dave Wang <dave.wang@emc.com.tw>
Subject: [PATCH 1/3] Input: elan_i2c - Correct the value of ic_type for old and new pattern of firmware
Date:   Mon, 13 Jan 2020 22:18:32 -0500
Message-Id: <20200114031832.5841-1-dave.wang@emc.com.tw>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Get the correct value of ic_type for old and new pattern of
firmware.

Signed-off-by: Dave Wang <dave.wang@emc.com.tw>
---
 drivers/input/mouse/elan_i2c_core.c | 15 +++++----------
 drivers/input/mouse/elan_i2c_i2c.c  | 11 +++++++++--
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 8719da540383..53444edb5069 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -6,7 +6,7 @@
  *
  * Author: 林政維 (Duson Lin) <dusonlin@emc.com.tw>
  * Author: KT Liao <kt.liao@emc.com.tw>
- * Version: 1.6.3
+ * Version: 1.6.4
  *
  * Based on cyapa driver:
  * copyright (c) 2011-2012 Cypress Semiconductor, Inc.
@@ -100,10 +100,11 @@ struct elan_tp_data {
 	bool			middle_button;
 };
 
-static int elan_get_fwinfo(u16 ic_type, u16 *validpage_count,
+static int elan_get_fwinfo(struct elan_tp_data *data,
+			   u16 *validpage_count,
 			   u16 *signature_address)
 {
-	switch (ic_type) {
+	switch (data->ic_type) {
 	case 0x00:
 	case 0x06:
 	case 0x08:
@@ -312,7 +313,6 @@ static int elan_initialize(struct elan_tp_data *data)
 static int elan_query_device_info(struct elan_tp_data *data)
 {
 	int error;
-	u16 ic_type;
 
 	error = data->ops->get_version(data->client, false, &data->fw_version);
 	if (error)
@@ -336,12 +336,7 @@ static int elan_query_device_info(struct elan_tp_data *data)
 	if (error)
 		return error;
 
-	if (data->pattern == 0x01)
-		ic_type = data->ic_type;
-	else
-		ic_type = data->iap_version;
-
-	error = elan_get_fwinfo(ic_type, &data->fw_validpage_count,
+	error = elan_get_fwinfo(data, &data->fw_validpage_count,
 				&data->fw_signature_address);
 	if (error)
 		dev_warn(&data->client->dev,
diff --git a/drivers/input/mouse/elan_i2c_i2c.c b/drivers/input/mouse/elan_i2c_i2c.c
index 058b35b1f9a9..249d48057423 100644
--- a/drivers/input/mouse/elan_i2c_i2c.c
+++ b/drivers/input/mouse/elan_i2c_i2c.c
@@ -298,7 +298,7 @@ static int elan_i2c_get_sm_version(struct i2c_client *client,
 		return error;
 	}
 
-	if (pattern_ver == 0x01) {
+	if (pattern_ver >= 0x01) {
 		error = elan_i2c_read_cmd(client, ETP_I2C_IC_TYPE_CMD, val);
 		if (error) {
 			dev_err(&client->dev, "failed to get ic type: %d\n",
@@ -324,7 +324,14 @@ static int elan_i2c_get_sm_version(struct i2c_client *client,
 			return error;
 		}
 		*version = val[0];
-		*ic_type = val[1];
+
+		error = elan_i2c_read_cmd(client, ETP_I2C_IAP_VERSION_CMD, val);
+		if (error) {
+			dev_err(&client->dev, "failed to get ic type: %d\n",
+				error);
+			return error;
+		}
+		*ic_type = val[0];
 
 		error = elan_i2c_read_cmd(client, ETP_I2C_NSM_VERSION_CMD,
 					  val);
-- 
2.17.1

