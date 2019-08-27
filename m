Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6DC9DE08
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbfH0GbV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:31:21 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:48284 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfH0GbU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:31:20 -0400
IronPort-SDR: 8LU7l2ugKmXblzle/+B68v/RC7yfMt9WnDC9kU6+CDC0ieMnzsr7/AvrB2wvNJC1moZo1aj+I2
 Dee/HXubLsGlrD9rl+GGtU1VA6cxkvjEsNZmDggb/AZrkbY/P3pn00xZTnAAF8cfHmUjifA/a9
 BFQckEJPeiO5ZGZqBxHAX+CL2JjhF70Cn9l+BqRcEq8xcUXetCbauiFmOLBRTs/qXS9VTejvSq
 aowR+R2Y9yFTnJb8D/Pv04fYk4KzgiIJsV3awG+2q4HjJh3JHAklejTX3ykuWIdl2OTXS4VQXn
 O+w=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="40784640"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:31:20 -0800
IronPort-SDR: oRcrTBRWaKRVnUESmzR/qxENXo1iMCjpOOvssuRMTDUkcpIR9nLlpL4NC/LmHqemkIVc8y+eEe
 z9GRgnRI2BInsLjUxCFTET0NNWehX/HUc11yoaJDi6EJlY8aWjcMamgLttl4DHs6rFzXM3fEZo
 wdOgGfHk0nxb5eQwWVpbm7DZhXH0XE52o5LNSPsC37LIoCd3Zb9Uabz404CRzlVkQX4OtlgZSz
 wnLH/l5SIkw/HaWvO6P4jYDe8kxQr0+FxyZznWm2EPGaZdNPFPgJwj8paVjH1JyTr/B6LFqfsj
 wBI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 40/49] Input: Atmel: improve error handling in mxt_initialize()
Date:   Tue, 27 Aug 2019 15:31:21 +0900
Message-ID: <20190827063130.20969-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-09.mgc.mentorg.com (147.34.90.209) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
index dd70f3b9678f..59533753a431 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -713,17 +713,13 @@ static int mxt_lookup_bootloader_address(struct mxt_data *data, bool retry)
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
2.19.2

