Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66C2E15A3BB
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:47:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728567AbgBLIrE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:47:04 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:32536 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728603AbgBLIrD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:47:03 -0500
IronPort-SDR: UmccEZ6TV3AxSffb6QjU8sVqie8YB7SsOz3nWRgGkcnP2J2UPloq8kex6EefORrvklUhcbCnK4
 bDclgPPniK2bll4h2DZo93lq4N/x8SJiYRXmZdL9LU/QByEDAIeGFQdpLtk0EQ8jXKUHcGBS14
 XNMxsSkKVyYV7QtP1Udvay0Ipi+oACwr5S6XT+hSjOLiJimyVz6ozOpLKGDn1Pb7clcOXrAYl4
 qWK6sJEeRSFan0ev5fm/+Fv2qgrZDvnVpdEUJ8N1eMiMV42slVlsdWV9NfqaApRDhUBOSf+L8J
 Cfs=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="47667108"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:47:03 -0800
IronPort-SDR: Qa6RS9pSbqtPaLnZQ7y7GM6Qav5yQCUedUJHybQXsv/Wv/bTj5u0nnMcLazrwieAt9UDsE84R2
 o9MQTEsdq6mgKOPxvJp3bTMxifLr+ZH9Q91DAJ4VHSI5ZChTCdU6cs6k3xJyu1hsrjbJ/G3Ai6
 3axggy+3U9HkubuzJPsG4Zve8lwc1rVXUbiSBOdARD4KPgJIOaU6auPyUR0UMKYQ5hHXKgrI4E
 IgiujfZ5nuMsdKKSeGWde5vEbR/ragAEp+wX2zI01UKDTOOLTn3lRy3uqwCjmSBXgp+7zqjiAr
 Wqw=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 39/48] Input: Atmel: improve error handling in mxt_initialize()
Date:   Wed, 12 Feb 2020 00:42:09 -0800
Message-ID: <20200212084218.32344-40-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
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
index d96726fa00c5..07228df847e3 100644
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
@@ -2920,6 +2916,32 @@ static void mxt_config_cb(const struct firmware *cfg, void *ctx)
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
@@ -2931,16 +2953,13 @@ static int mxt_initialize(struct mxt_data *data)
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
@@ -2954,7 +2973,9 @@ static int mxt_initialize(struct mxt_data *data)
 		}
 
 		/* Attempt to exit bootloader into app mode */
-		mxt_send_bootloader_cmd(data, false);
+		error = mxt_send_bootloader_cmd(data, false);
+		if (error)
+			return error;
 		msleep(MXT_FW_RESET_TIME);
 	}
 
@@ -3646,8 +3667,11 @@ static int mxt_enter_bootloader(struct mxt_data *data)
 
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

