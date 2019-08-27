Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9EB49DDF5
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729396AbfH0GaP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:30:15 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:48242 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728939AbfH0GaO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:30:14 -0400
IronPort-SDR: daNDSYQx/lN6RtKurTQ7qBC0n+l+Wmr45tpFlTrVQvYA6osX2uoNNCZ72Yoii46MxBgzRdPV2W
 qdzwMyntBVfMgAhFfxX2wy+OokJUEBLnP8hWtChbSByZTi7LxgD0kIWThLSAZ+jZ7twemf6r1M
 ncquLWOFH0hHJr7EHgH5YdPUFiag1Ebvhng2IZ/H9sSNRo9YMdt92ZAsD9TO8TwmhGVg5waQWV
 olNy2+l4rL9TC37gjW3lHAfGXFNnfTCSoakkCezdMiRfUValAP3tfoOwY/c2Ly2J/tl4gX5tbR
 DZE=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="40784600"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:30:14 -0800
IronPort-SDR: pNa18eu/W8KCU8LAsC5+nYJ6P6ykHV5jh2j5AtDwYps+itOgDwqPnaUpTNDrblRi4THrfHygwV
 VXGID2ipp5yJ1t79+opjLa4mWjr3pCmbVGZtUYsPl4Xv6v4z/MJTrfHZzwxOyZ0uhG/NSQD3Tp
 g60wKj7dY8sm0nkqP+fxjOG/inGlLhNVqYtpx45u2zwF6lh1D4ubTWeSD77NShQJjSPAfkkNUY
 SbYxdHrvwUYHBdHx0j21BVavZIclShju5t3Msz+hLoq3M21b0xyrGJJzlGBu7v4Zaw+BK737Id
 +8A=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 33/49] Input: atmel_mxt_ts - rely on calculated_crc rather than file config_crc
Date:   Tue, 27 Aug 2019 15:29:59 +0900
Message-ID: <20190827063015.20794-4-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190827063015.20794-1-jiada_wang@mentor.com>
References: <20190827063015.20794-1-jiada_wang@mentor.com>
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
index f8e80471be8a..560d46634bae 100644
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
2.19.2

