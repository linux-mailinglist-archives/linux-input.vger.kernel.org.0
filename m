Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 355B91067EF
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:26:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727616AbfKVI0G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:26:06 -0500
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:62576 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727602AbfKVI0D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:26:03 -0500
IronPort-SDR: bNSpA08vu544cPXokNX3bfqXVKaKYKrzf5g5+bCs12n0ezR+Rl0W71mEvsOHQdQatYjCwg8qI1
 SFtHN3/W6/a8o6SZyxEHqjpN1cw/mcsVUSz6iZKV0uEX9craM81ykwjm/TaEsq2tJN76goBwiX
 rBtb8CsYjXO63Jsf5Ouc2lnRWHWDBtFDlZBDhSqxU2lbPq5DjbqcFKJHS5mh0s1zMzbLvkPv80
 CRTPbhhEPL4k0pS+vSYqTuQ1mt+vhkg8BzcefzsLTJxd5eKvzTpRS7ojsPySvXatwSQAxqTrZ+
 7eI=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="43457617"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:26:02 -0800
IronPort-SDR: UioE6kYJSFYFyNAu85mw+hETNmUzPAiLLhz0U2/BSqXUaaa9b/JRS2EcwYGjSNY2DA5eBNXbFC
 EK/kK5F8nFh95L24sj8h+1+xZktvXR51O9nrZkqwxDDwwOLK9PBQ7fCDwsMtVfY+3As7p5B9bu
 OoMMdjIEWJdWgkqNdM0XqvVju3lNcJtagK/FwMYufptmlVmbKM7Il6YXy8PGbDd9QSgxpDHLZD
 CkV2+7EycZSxZ+OmmM7ESGN+TdABf6i5xzwe0DDwZo2rgyg1KpN2lomw9oH8EfIDSnyKWvSkVO
 9ws=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 32/48] Input: atmel_mxt_ts - rely on calculated_crc rather than file config_crc
Date:   Fri, 22 Nov 2019 17:23:46 +0900
Message-ID: <20191122082402.18173-33-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
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
index acbba44d604c..3513413158c3 100644
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
2.17.1

