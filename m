Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84B8C8FE01
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbfHPIh0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:37:26 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1919 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfHPIh0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:37:26 -0400
X-Greylist: delayed 306 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Aug 2019 04:37:16 EDT
IronPort-SDR: kWNcfRYQMgWX4Dr4DT+JqrmPT6u5yKmBCnZhjyRZ0BI7N7+XCkFg7t1/mCqSXeiEDnp2sAt81C
 HfoqmhzpPuc+rPK805G4Yz/3R+4F7aYt6AI2vrIViWF7nsGmR0RGCF5v0cEs+rM2eowZRvXa80
 bEsZzknKy3koX7OyOAqqbOKT8Fz7BEcjyiVUcDR8dol0HbYqpm0SR0ZN4UWUcrXI7u88rMzFqi
 CAcZ1Qokz8CLqF8Q8ddjKt90zSWhJ5hzw8YdU+sYo/n3/N3orA41kBfu2XtinNz5Jq6F/A7Amw
 /cc=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484356"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:37:24 -0800
IronPort-SDR: E0BIwnwzgEIRUhRPHiwV4y/g4pExO7tdDvpod3o0QLHdvZHW/O2wh4Ym8TLoItcjjZ0unCIi53
 jqGD2bYEhPT98CHUvpaY3DyWfbt6b4BMBdLhbYFVqylqVov0AYOCIVdf3hdRYH+3nD5WxLRVQE
 LM6ltmu8s/wSZ5AYblvIa3yfCygw8Jh1hq178MNdyDGqib7DZhJNIQO70rEFjAGy+yDsknzEnW
 yJZKdQxQwOg3DWErFzPp96OS1vb7M10Fnqxp8Fg0oWVHfL6+8RQeM9PjnfLGHrFACjyz/6r2ms
 69s=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 48/63] input: atmel_mxt_ts: move bootloader probe from mxt_initialize()
Date:   Fri, 16 Aug 2019 17:37:09 +0900
Message-ID: <20190816083724.19341-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083724.19341-1-jiada_wang@mentor.com>
References: <20190816083724.19341-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Deepak Das <deepak_das@mentor.com>

Validity of bootloader address is now checked before checking the
bootloader status so mxt_lookup_bootloader_address() was moved
from mxt_probe_bootloader() to mxt_initialize().
Above changes added lot of bootloader mode verification code into
mxt_initialize() which made this function longer and unreadable.
mxt_bootloader_status() moves bootloader mode verification code from
mxt_initialize() to make it cleaner.

Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 45 +++++++++++++++---------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index dec9f2b2c64d..27b908a50b66 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2917,6 +2917,32 @@ static void mxt_config_cb(const struct firmware *cfg, void *ctx)
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
@@ -2932,24 +2958,9 @@ static int mxt_initialize(struct mxt_data *data)
 			 "info block read failed (%d), so try bootloader method\n",
 			 error);
 
-		error = mxt_lookup_bootloader_address(data, false);
-		if (error) {
-			dev_info(&client->dev,
-				 "Bootloader address is not specified\n");
+		error = mxt_bootloader_status(data);
+		if (error)
 			return error;
-		}
-		/* Check bootloader state */
-		error = mxt_probe_bootloader(data);
-		if (error) {
-			dev_info(&client->dev, "Trying alternate bootloader address\n");
-			mxt_lookup_bootloader_address(data, true);
-			error = mxt_probe_bootloader(data);
-			if (error) {
-				dev_err(&client->dev,
-					"Chip is not in appmode or bootloader mode\n");
-				return error;
-			}
-		}
 
 		/* OK, we are in bootloader, see if we can recover */
 		if (++recovery_attempts > 1) {
-- 
2.19.2

