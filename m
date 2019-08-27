Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 209469DDE0
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:29:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729162AbfH0G3H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:29:07 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:11340 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbfH0G3G (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:29:06 -0400
IronPort-SDR: AqZH2f7hUvhZiK2npLiW5MhuWI9tR6aik32t4yvOOeZKAXu6gkCIKvBqgM9EN18TzyWuXq5u0X
 tDNYDSPujKz4ghBvzU+PcHX5siynuY1G9CX751N3l3LIvZBhgTVRTLgSqlHsevRhEHBXku1U6F
 zR/odrDyG06Wv2f5rqaGWxXTJAWu/o/3sRdSfRAfnyR7qo/+3KUjHa9aIT7XfgxZiqyQ6OlTKW
 5mKfozWUNVkvVWS5YISsuX7ZoV5WjA8XpiH9BXSLEm3MpR4xslqctdZAbQsJ/r4tJumn5aoRjG
 lN4=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="42589369"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:29:05 -0800
IronPort-SDR: yucqM13GL0kS5XKwF9U0ZQvIlTO86A4z/O4d2//2jWKo74nYZYUniO4bN5JXm8zsxs8jZm5nDu
 1cBSKhp5+2BQrFdAWFxaG8SXB9vZ+doToxrYRetPLVK++viPPa80rj1vW9KbObDcHAiu4gw8/q
 q8+2RNGR/VHJQew6Y0FKX5KAItz2sVHW31nKRTLlM8E4maZiSlO8JtIJ1iHHgdA8m8RlUd4Dyb
 LMwvVozSjFxahrWB2j9shWMPJiCZMivlSPZJ8QA8Zw/rHEGyVFdoHaExqlRMUHO91x3kX29CJG
 S28=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 22/49] Input: atmel_mxt_ts - combine bootloader version query with probe
Date:   Tue, 27 Aug 2019 15:28:43 +0900
Message-ID: <20190827062910.20598-3-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190827062910.20598-1-jiada_wang@mentor.com>
References: <20190827062910.20598-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
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
index 3da3f27ed580..4ec28b73ee83 100644
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

