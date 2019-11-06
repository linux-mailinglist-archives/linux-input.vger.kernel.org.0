Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD6DF0F94
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 08:04:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731538AbfKFHDQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 02:03:16 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:23839 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731206AbfKFHDP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 02:03:15 -0500
IronPort-SDR: pG1A60VIGGbcSt8WiahBam9J2cS9OlkX/xImU0Lup+xnokYFWLVSqMsy7nEMBmJPzoxGkBmi/4
 2KLPHCDlvN4ctKVS5vFzfbmmDXEiCdmbqa19CRIL6IiUwat0+5rjT+GcL2TrI1ONyuW/hLfa8N
 ykQUXlUkjoMURciRQSNkTddS7AKptOziQmMtsAuecTpaTLtbr/M1NUIPf90OwP7WNvWK++KeCz
 t9TA7SL9yLHNDrxVEG3gsdkg7uVqZnGwDNRnnuD+n+7DHp6Uav12+Rxh9UMJSyUaz0bbHOsNMM
 WAw=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="42848272"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 05 Nov 2019 23:03:14 -0800
IronPort-SDR: WifgoNXo7VVLG+v39Ug1glCMeOAnSHC0KQm6Z5iJIrXHsjkdq0SeIH9u/KN/f7ldbJjbhrRtt0
 AI21x6KvclK1MPm/P72PWHNPsuOVUS7FCLGd6h4mO7CRJPR2sgrRyCgZBM1EeA5zxarY7cKhux
 DBJBG0TJ2qRNiSgNC9bsD2MWNtbvejUeBT1oW4ZrLJrDuI36YH/ng+WQibhXmmcEq9CRfyp3YM
 haVQPSmeWdWFI/OlDP+8qx4yiLbULWuX3KTskCeT7X7PwH8hJi1tt4zMYUtcF574Jx8u9xCJQ0
 tsg=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v5 21/48] Input: atmel_mxt_ts - combine bootloader version query with probe
Date:   Wed, 6 Nov 2019 16:01:19 +0900
Message-ID: <20191106070146.18759-22-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106070146.18759-1-jiada_wang@mentor.com>
References: <20191106070146.18759-1-jiada_wang@mentor.com>
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
index 04627db23ad2..d38ae9525e35 100644
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

