Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69A3BB4AFA
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbfIQJlT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:41:19 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:19904 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728948AbfIQJlS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:41:18 -0400
IronPort-SDR: M3VhhbSbFUCyp1lgxU4CZfFy788+72kUpJvEeWC51qjo/mePgPnJuhAi6vHyWkjGM6p8NTlhNF
 EbIrJ09ucrk0F45Dqskl1qoABakv9oc33nvvgYfov46Jx8zPNsWNdZdX+hVhCMA/6cDOk9AwAt
 mPQxdqMX3zSoz4eSBqQXjOLBNehCky2d1XVjXyDBqiUx23l62p+qhQ3n2YNIpttOqusR9DLiDj
 nppMl2lfACVMhvcEu/JoahNQT/ycBVmkRaZMniE5zgNVhFDA45v5VFRPen0YT8oGjFAx9AMSIV
 0ks=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41374178"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:41:17 -0800
IronPort-SDR: uJnljcZ5Ph43tVqTL3BUWKZYpcLioibu3z/ntlshIPj4tgPouHl/OHqYENiwiAiTAjaikbTXEh
 S1oo09m/wGH+y0ou8XjmWjt32u2Ag7gltbMPk+rxhU3g5rX0JsR9rHEk6Tsd2aBgvZhtIGlmvc
 BGiwU1rQwxCJ8gOmdzH3aYDzGYaE+iA/GCKDdk0pTietbr9u91g+pH+SugDnnsJhriMmHK9906
 2jEER4ZNojrmOTOWJ0IUN+uXlX3g6jpNg3gvrNrglDaQQD7482ldBsMFTRnsXLNB5I3uVj9pFz
 ajk=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 33/49] Input: atmel_mxt_ts - rely on calculated_crc rather than file config_crc
Date:   Tue, 17 Sep 2019 18:40:34 +0900
Message-ID: <20190917094050.18771-5-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190917094050.18771-1-jiada_wang@mentor.com>
References: <20190917094050.18771-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Kautuk Consul <kautuk_consul@mentor.com>

We now prefer to rely on the calculated CRC and not on the CRC stored in
the file.

The new logic is as follows:
1) stored CRC of file != calculated CRC of file, then refuse the possible
   corrupted file
2) calculated CRC of file != CRC of configuration in controller, then
   update configuration in controller
3) calculated CRC of file == CRC of configuration in controller, then
   ignore configuration file

Signed-off-by: Kautuk Consul <kautuk_consul@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 65 +++++++++++++-----------
 1 file changed, 36 insertions(+), 29 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index e441eab8b201..bdc5088baea8 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1908,7 +1908,7 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
 	int ret;
 	int offset;
 	int i;
-	u32 info_crc, config_crc, calculated_crc;
+	u32 info_crc, config_crc, calculated_crc = 0;
 	u16 crc_start = 0;
 
 	/* Make zero terminated copy of the OBP_RAW file */
@@ -1971,30 +1971,6 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
 	}
 	cfg.raw_pos += offset;
 
-	/*
-	 * The Info Block CRC is calculated over mxt_info and the object
-	 * table. If it does not match then we are trying to load the
-	 * configuration from a different chip or firmware version, so
-	 * the configuration CRC is invalid anyway.
-	 */
-	if (info_crc == data->info_crc) {
-		if (config_crc == 0 || data->config_crc == 0) {
-			dev_info(dev, "CRC zero, attempting to apply config\n");
-		} else if (config_crc == data->config_crc) {
-			dev_dbg(dev, "Config CRC 0x%06X: OK\n",
-				 data->config_crc);
-			ret = 0;
-			goto release_raw;
-		} else {
-			dev_info(dev, "Config CRC 0x%06X: does not match file 0x%06X\n",
-				 data->config_crc, config_crc);
-		}
-	} else {
-		dev_warn(dev,
-			 "Warning: Info CRC error - device=0x%06X file=0x%06X\n",
-			 data->info_crc, info_crc);
-	}
-
 	/* Malloc memory to store configuration */
 	cfg.start_ofs = MXT_OBJECT_START +
 			data->info->object_num * sizeof(struct mxt_object) +
@@ -2018,14 +1994,45 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
 	else
 		dev_warn(dev, "Could not find CRC start\n");
 
-	if (crc_start > cfg.start_ofs) {
+	if (crc_start > cfg.start_ofs)
 		calculated_crc = mxt_calculate_crc(cfg.mem,
 						   crc_start - cfg.start_ofs,
 						   cfg.mem_size);
 
-		if (config_crc > 0 && config_crc != calculated_crc)
-			dev_warn(dev, "Config CRC in file inconsistent, calculated=%06X, file=%06X\n",
-				 calculated_crc, config_crc);
+	/* If the CRC stored in the file is not the same as what
+	 * was calculated by mxt_calculate_crc, this means we
+	 * have to refuse the config file and abort download.
+	 */
+	if (config_crc != calculated_crc) {
+		dev_warn(dev,
+			 "Config CRC in file inconsistent, calculated=%06X, file=%06X\n",
+			 calculated_crc, config_crc);
+		ret = 0;
+		goto release_mem;
+	}
+
+	/*
+	 * The Info Block CRC is calculated over mxt_info and the object
+	 * table. If it does not match then we are trying to load the
+	 * configuration from a different chip or firmware version, so
+	 * the configuration CRC is invalid anyway.
+	 */
+	if (info_crc == data->info_crc) {
+		if (config_crc == 0 || data->config_crc == 0) {
+			dev_info(dev, "CRC zero, attempting to apply config\n");
+		} else if (config_crc == data->config_crc) {
+			dev_dbg(dev, "Config CRC 0x%06X: OK\n",
+				data->config_crc);
+			ret = 0;
+			goto release_mem;
+		} else {
+			dev_info(dev, "Config CRC 0x%06X: does not match file 0x%06X\n",
+				 data->config_crc, config_crc);
+		}
+	} else {
+		dev_warn(dev,
+			 "Warning: Info CRC error - device=0x%06X file=0x%06X\n",
+			 data->info_crc, info_crc);
 	}
 
 	ret = mxt_upload_cfg_mem(data, &cfg);
-- 
2.19.2

