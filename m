Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34E421067FC
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727052AbfKVI0c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:26:32 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:52542 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727698AbfKVI0b (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:26:31 -0500
IronPort-SDR: jZb8rEf5D3G7+52Sl1pHZ+V3lBdHpClphYcFHx3wSpLNOnL0HbGGm3mv0EJmBDpszkx+fx/KUX
 YAoi1K2ARRYrQMWzTuc7qln5k9QK/N8XdB6WRP5M8omtDdw3G5tLQtk74SbdMSxmvOQvT+nChn
 5DYmUlLmT4IjMS+r4xlAKtej2oxHKA1Sosb3bJYDV2b+r3JgtVmCrhBJZc+AT3KTd8D85DAha6
 tdDrIz5QWgIuKxkSaBeekN48hljThlETvmsaBJ6eqFrGwYbc3+MY+oAFtdpqRMn6PFm8KKe2FX
 /eA=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43358982"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:26:31 -0800
IronPort-SDR: piiUQaiULY+leSG0xY+rRPmJsOzuSqA9g+H/ui5eXhCIcWRpxlDFIU+yTiPv++hvouq7bXNrPq
 JfDT81rlmI8rOFGbd0QvL95YvI+AGfjRhA1S9zMrplMkQqKMnHAPgcO0CUsG54xPrGhEYIjYh4
 8r/ro7MXjgt6gqNstj0fT5MKvjdEFKe+DDhW17663eGfnUYvno7TCztOscaMAuWVlqer7USJnX
 W23IBASG+NBRhDbSOq3hgW9XXoPoFm1sowdIPd9j7zAmLlcgP9cARZd7sRHz4yu77hBvYPx26Y
 m4M=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 39/48] Input: Atmel: improve error handling in mxt_initialize()
Date:   Fri, 22 Nov 2019 17:23:53 +0900
Message-ID: <20191122082402.18173-40-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Deepak Das <deepak_das@mentor.com>

Currently mxt_initialize() tries to probe bootloader mode
even if valid bootloader address is not specified.

This commit modifies mxt_initialize() to return error
if Device is not in appmode and bootloader address is
not specified.

This commit also returns error code from mxt_send_bootloader_cmd()
in mxt_initialize().

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 58 +++++++++++++++++-------
 1 file changed, 41 insertions(+), 17 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 1ebdca1ed815..110c966e7f3a 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -716,17 +716,13 @@ static int mxt_lookup_bootloader_address(struct mxt_data *data, bool retry)
 	return 0;
 }
 
-static int mxt_probe_bootloader(struct mxt_data *data, bool alt_address)
+static int mxt_probe_bootloader(struct mxt_data *data)
 {
 	struct device *dev = &data->client->dev;
 	int error;
 	u8 buf[3];
 	bool crc_failure, extended_id;
 
-	error = mxt_lookup_bootloader_address(data, alt_address);
-	if (error)
-		return error;
-
 	/* Check bootloader status and version information */
 	error = mxt_bootloader_read(data, buf, sizeof(buf));
 	if (error)
@@ -2923,6 +2919,32 @@ static void mxt_config_cb(const struct firmware *cfg, void *ctx)
 	release_firmware(cfg);
 }
 
+static int mxt_bootloader_status(struct mxt_data *data)
+{
+	struct i2c_client *client = data->client;
+	int error;
+
+	error = mxt_lookup_bootloader_address(data, false);
+	if (error) {
+		dev_info(&client->dev,
+			 "Bootloader address is not specified\n");
+		return error;
+	}
+	/* Check bootloader state */
+	error = mxt_probe_bootloader(data);
+	if (error) {
+		dev_info(&client->dev, "Trying alternate bootloader address\n");
+		mxt_lookup_bootloader_address(data, true);
+		error = mxt_probe_bootloader(data);
+		if (error) {
+			dev_err(&client->dev,
+				"Chip is not in appmode or bootloader mode\n");
+			return error;
+		}
+	}
+	return 0;
+}
+
 static int mxt_initialize(struct mxt_data *data)
 {
 	struct i2c_client *client = data->client;
@@ -2934,16 +2956,13 @@ static int mxt_initialize(struct mxt_data *data)
 		if (!error)
 			break;
 
-		/* Check bootloader state */
-		error = mxt_probe_bootloader(data, false);
-		if (error) {
-			dev_info(&client->dev, "Trying alternate bootloader address\n");
-			error = mxt_probe_bootloader(data, true);
-			if (error) {
-				/* Chip is not in appmode or bootloader mode */
-				return error;
-			}
-		}
+		dev_info(&client->dev,
+			 "info block read failed (%d), so try bootloader method\n",
+			 error);
+
+		error = mxt_bootloader_status(data);
+		if (error)
+			return error;
 
 		/* OK, we are in bootloader, see if we can recover */
 		if (++recovery_attempts > 1) {
@@ -2957,7 +2976,9 @@ static int mxt_initialize(struct mxt_data *data)
 		}
 
 		/* Attempt to exit bootloader into app mode */
-		mxt_send_bootloader_cmd(data, false);
+		error = mxt_send_bootloader_cmd(data, false);
+		if (error)
+			return error;
 		msleep(MXT_FW_RESET_TIME);
 	}
 
@@ -3649,8 +3670,11 @@ static int mxt_enter_bootloader(struct mxt_data *data)
 
 		msleep(MXT_RESET_TIME);
 
+		ret = mxt_lookup_bootloader_address(data, false);
+		if (ret)
+			return ret;
 		/* Do not need to scan since we know family ID */
-		ret = mxt_probe_bootloader(data, 0);
+		ret = mxt_probe_bootloader(data);
 		if (ret)
 			return ret;
 
-- 
2.17.1

