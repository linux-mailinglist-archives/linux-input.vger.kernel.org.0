Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3DEEB4ADC
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728596AbfIQJjr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:39:47 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:20501 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727002AbfIQJjq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:39:46 -0400
IronPort-SDR: CXDpn/tCqI2BoSIIUjjWS79zweBsl+lro7NC5MAwhLz7ThXWXlrr0PGP3OYOM3MDzBrscrsxA3
 ZSwzYUD2fwf7/RLlO5ncjRq7skJetivSEJSq71zvDhVVwB5dcH/3+jS5AWYMJOz2AaiiD6Yc2H
 W/LxrplIIXwnffilh4VZ54I9GsRh+doJ4xkMEnTVR/SyhDEi3CclSM6BTYjnO5zpFIC1phLBu5
 xyMbI0CHQffn8KLshyjqbuOfbZ1IxdQ+9chQn2euIZvjhkSDzOuzm+48kimvJhfIN4bB2L/qCD
 JTw=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41416516"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:39:46 -0800
IronPort-SDR: gJbr6gCuJwYq+MOL2P5/5wkBGJxXv1REavWwD/+k4+76/xxiuFqyVqjikUO8nO43P5h+2jP6ey
 iVv4Qsw672N4Qd6yHfbX4y9qOpjTPXVBXXX39g8U8zBspCPLca+d8Fbaqe0K/AVQNaFEsXTxlS
 m6i6mYtvZQACGBY/rkGbGAWTyjYMEhgmS7x/FzVOc6ZDo4EnXkQo5qTyY/++e08Gq9rQW3cImK
 YwOQa8QpDs9WovM3xlsu7pAdDWrDbRoyTc1PuoZDknv4jD/ty1UKXSSWVXRovfwuQNNghf0YeM
 8PA=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 22/49] Input: atmel_mxt_ts - combine bootloader version query with probe
Date:   Tue, 17 Sep 2019 18:38:48 +0900
Message-ID: <20190917093915.18645-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190917093915.18645-1-jiada_wang@mentor.com>
References: <20190917093915.18645-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
index ca56122550eb..b4cb426e7890 100644
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
2.19.2

