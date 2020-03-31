Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5BF199437
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730645AbgCaKxV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:53:21 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43597 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730598AbgCaKxU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:53:20 -0400
IronPort-SDR: MHBBYfaseZtE4A0L1dFpRXP8VRuCf+rSr8KVUlTQ7Er4BIMwbita81KnxXzD5AEJdPfpAldqOP
 5QW8QXBarFrQB4PYjVvWQkPMMAFXizLEQVuXGoyN58MQxBbnnBJddLmdzrrqNI0DyOPFXcdESU
 4bDZmqYqoKK9xuaBQrM+lTWMouV5Tb7NnwiOE01Xg9mWbRhMJjYpiOhGBmPRnfM1up9VhQ04BP
 R7uR2POSqPSXmPQTFVrHFy0Sil7p5kqV/ggFdkMcS4YGKZPpywd38U8BRs9OcjoOophe/dYlPB
 Pe8=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330818"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:53:20 -0800
IronPort-SDR: hbJ35K90321e1qZKqCZeIqrAvJ3jNp9qATj24CTvxdzuhCmLgiFQmQG0JRSHGEak6eqevf5Xn+
 TK8PIeZmqEuosLYDcsvkEBxnn7o6KLOoiW9CXBGpv3XYu1G4Jlcrt4tcdHSlHtsSLMbbc7DOZE
 XybKvOm/WsWgmN8zTSznz+C8E6EdJAkIy8ZSR1hgFbZPYMgom1SodIkwFmOhqXhMrLSEeC7J5a
 /HC1YOO+rCIxend2QtxoLGmIxtBDW2WnslFBOxNtYRs1/V4SggthmBK+p6t+w+GluavTCZuTZQ
 NoM=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 38/55] Input: atmel_mxt_ts - rely on calculated_crc rather than file config_crc
Date:   Tue, 31 Mar 2020 03:50:34 -0700
Message-ID: <20200331105051.58896-39-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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
index 860e8ddd4c6b..11e65f32b1a2 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1905,7 +1905,7 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
 	int ret;
 	int offset;
 	int i;
-	u32 info_crc, config_crc, calculated_crc;
+	u32 info_crc, config_crc, calculated_crc = 0;
 	u16 crc_start = 0;
 
 	/* Make zero terminated copy of the OBP_RAW file */
@@ -1968,30 +1968,6 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
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
@@ -2015,14 +1991,45 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
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

