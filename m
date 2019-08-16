Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16EB78FDFE
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbfHPIhU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:37:20 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1919 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfHPIhU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:37:20 -0400
X-Greylist: delayed 306 seconds by postgrey-1.27 at vger.kernel.org; Fri, 16 Aug 2019 04:37:16 EDT
IronPort-SDR: ZLU3mYRYQHs25uxShSFIobRxLNUSKHvMS4tBxnkJubjnagcxUe7q0CdwUXXfd1RpcYuWgTiMeh
 GUILAprOO2FxhDVWVt3uWVXAmSOSApkxUGYSKOezaWcvfjZTZNRFw4jc8aKP5btEHPtKTV/j7J
 LJyhg6EXKJIUSsyTCSsW3yFVVQ6PPjlKgSQKsESjhqawZ93LpGzoZonhnibqV+ZCHbS7JjZecQ
 2dHRM2KyVMLJ6BbuK3xLzsI+zShf/YwpQv48dgnjfCaLctOjAvpZVX5i3jkwh5Nq2aGAOFSUcN
 /Jo=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484353"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:37:19 -0800
IronPort-SDR: SK1M7+p4iKtWSyr+ULYjV3yQA35QequgE+Aq+bAqYlYQvRWaCFKdML9U0r9IefyPzzTZBwvMxA
 YyspYSvPuxM/KGD1STVL/JkjTBeKHurnVfmA95mPpeQVjPhQLd4yYxn3WQ7dsKiAcjtoLazVjS
 q7cBm8Cyesd0aimY6GQKeAQQg6+MlGlhFPEekPrwY1dG9cO5LOLN1TUASS0Hik/yZL2nd+vRED
 HaeiM9Hv/2zPkh+dSBfYiWW0OQbWAHu4QDrhmjzY0XOrt7gOco6XmW59QmbY1/GPvISSPBvVjr
 9U4=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 46/63] Input: Atmel: improve error handling in mxt_initialize()
Date:   Fri, 16 Aug 2019 17:37:07 +0900
Message-ID: <20190816083724.19341-2-jiada_wang@mentor.com>
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
 drivers/input/touchscreen/atmel_mxt_ts.c | 33 +++++++++++++++++-------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 232262736029..3999d3e31a6a 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -718,17 +718,13 @@ static int mxt_lookup_bootloader_address(struct mxt_data *data, bool retry)
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
@@ -2930,13 +2926,25 @@ static int mxt_initialize(struct mxt_data *data)
 		if (!error)
 			break;
 
+		dev_info(&client->dev,
+			 "info block read failed (%d), so try bootloader method\n",
+			 error);
+
+		error = mxt_lookup_bootloader_address(data, false);
+		if (error) {
+			dev_info(&client->dev,
+				 "Bootloader address is not specified\n");
+			return error;
+		}
 		/* Check bootloader state */
-		error = mxt_probe_bootloader(data, false);
+		error = mxt_probe_bootloader(data);
 		if (error) {
 			dev_info(&client->dev, "Trying alternate bootloader address\n");
-			error = mxt_probe_bootloader(data, true);
+			mxt_lookup_bootloader_address(data, true);
+			error = mxt_probe_bootloader(data);
 			if (error) {
-				/* Chip is not in appmode or bootloader mode */
+				dev_err(&client->dev,
+					"Chip is not in appmode or bootloader mode\n");
 				return error;
 			}
 		}
@@ -2953,7 +2961,9 @@ static int mxt_initialize(struct mxt_data *data)
 		}
 
 		/* Attempt to exit bootloader into app mode */
-		mxt_send_bootloader_cmd(data, false);
+		error = mxt_send_bootloader_cmd(data, false);
+		if (error)
+			return error;
 		msleep(MXT_FW_RESET_TIME);
 	}
 
@@ -3645,8 +3655,11 @@ static int mxt_enter_bootloader(struct mxt_data *data)
 
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

