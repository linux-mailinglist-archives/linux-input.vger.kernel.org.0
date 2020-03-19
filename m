Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E99D18BA2B
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728059AbgCSPCJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:02:09 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:32318 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbgCSPCJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:02:09 -0400
IronPort-SDR: wsBm9OJ5BrWEUx9FXRVEk3wNI5zEgNhs8MJ9EJbHUHIyD2xE2wsS7It1qWygHYDFvcZVdrvQ2/
 kneeP7d2A3VKWe/gX2OJe6PbITp+Dn10sNyUDu4dHwOiwPuy7pdFHAHDqvO30Ys7Xo4kr2gwoj
 1/QpcIfCrkao7mU+XQer+X+sDCu+zxtg1FHuhjqbDGl+5YNVa6qKnBqdK8u7DD3w660bqQIEC2
 t8kx2nA8emmPx49SUB1yvAOrgnjfpHulRVxnSMOfz/FFGadk+lKtZfttRlG/lHPPFW3vkD6vW5
 ZVQ=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="46890925"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:01:56 -0800
IronPort-SDR: vDMOe30BYfCDN4tGoOf0E9kdQwP7uuCn9nI+QgAIHeWL6QXCnI2bVIgF7ZD39SA1O20pHzet6s
 T2bYDg6u9bl7wU0sRHyzloPxjkXPjMCgzQ/UADCJulsMe0fKDEHulj68cCLNNAGmcNmYEzaTbG
 f5e1rjzwr7l15CF24hcVpFXYqw6PTRKkPljE7MywNs6uutq0uA+Gags2AQHH4DhSBMQUkGzrpg
 B5h0PERcB8DTeJ5TKH6Kiuu4dOz0a7k8/OTVzed5MqzVVxdQp+yKP6yFB8nL5lVvA9G3cg8LnS
 wzA=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 24/52] Input: atmel_mxt_ts - combine bootloader version query with probe
Date:   Thu, 19 Mar 2020 07:59:48 -0700
Message-ID: <20200319150016.61398-25-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

This removes some complexity from the bootloader state machine, and means
that we always output some debug about the version as soon as we start
talking to the bootloader.

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit a2d141f170c80fea6663af98aab0be32abc0ddb0)
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 45 +++++++-----------------
 1 file changed, 13 insertions(+), 32 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index b4d0835ba196..d3d6e4e60f67 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -558,47 +558,31 @@ static int mxt_probe_bootloader(struct mxt_data *data, bool alt_address)
 {
 	struct device *dev = &data->client->dev;
 	int error;
-	u8 val;
-	bool crc_failure;
+	u8 buf[3];
+	bool crc_failure, extended_id;
 
 	error = mxt_lookup_bootloader_address(data, alt_address);
 	if (error)
 		return error;
 
-	error = mxt_bootloader_read(data, &val, 1);
+	/* Check bootloader status and version information */
+	error = mxt_bootloader_read(data, buf, sizeof(buf));
 	if (error)
 		return error;
 
-	/* Check app crc fail mode */
-	crc_failure = (val & ~MXT_BOOT_STATUS_MASK) == MXT_APP_CRC_FAIL;
+	crc_failure = (buf[0] & ~MXT_BOOT_STATUS_MASK) == MXT_APP_CRC_FAIL;
+	extended_id = buf[0] & MXT_BOOT_EXTENDED_ID;
 
-	dev_err(dev, "Detected bootloader, status:%02X%s\n",
-			val, crc_failure ? ", APP_CRC_FAIL" : "");
+	dev_info(dev, "Found bootloader addr:%02x ID:%u%s%u%s\n",
+		 data->bootloader_addr,
+		 extended_id ? (buf[1] & MXT_BOOT_ID_MASK) : buf[0],
+		 extended_id ? " version:" : "",
+		 extended_id ? buf[2] : 0,
+		 crc_failure ? ", APP_CRC_FAIL" : "");
 
 	return 0;
 }
 
-static u8 mxt_get_bootloader_version(struct mxt_data *data, u8 val)
-{
-	struct device *dev = &data->client->dev;
-	u8 buf[3];
-
-	if (val & MXT_BOOT_EXTENDED_ID) {
-		if (mxt_bootloader_read(data, &buf[0], 3) != 0) {
-			dev_err(dev, "%s: i2c failure\n", __func__);
-			return val;
-		}
-
-		dev_dbg(dev, "Bootloader ID:%d Version:%d\n", buf[1], buf[2]);
-
-		return buf[0];
-	} else {
-		dev_dbg(dev, "Bootloader ID:%d\n", val & MXT_BOOT_ID_MASK);
-
-		return val;
-	}
-}
-
 static int mxt_check_bootloader(struct mxt_data *data, unsigned int state,
 				bool wait)
 {
@@ -632,9 +616,6 @@ static int mxt_check_bootloader(struct mxt_data *data, unsigned int state,
 	if (ret)
 		return ret;
 
-	if (state == MXT_WAITING_BOOTLOAD_CMD)
-		val = mxt_get_bootloader_version(data, val);
-
 	switch (state) {
 	case MXT_WAITING_BOOTLOAD_CMD:
 	case MXT_WAITING_FRAME_DATA:
@@ -3283,7 +3264,7 @@ static int mxt_enter_bootloader(struct mxt_data *data)
 		msleep(MXT_RESET_TIME);
 
 		/* Do not need to scan since we know family ID */
-		ret = mxt_lookup_bootloader_address(data, 0);
+		ret = mxt_probe_bootloader(data, 0);
 		if (ret)
 			return ret;
 
-- 
2.17.1

