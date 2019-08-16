Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 923378FE61
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbfHPIkk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:40:40 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1960 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727289AbfHPIiX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:38:23 -0400
IronPort-SDR: MdCERrG1LPGSMxq71kjAE9B8WoGCbc0XK2AW8qBqyg2AeQFXltRqWbIT6Fa/jDyYwnZnh3Ra57
 3Eo9VR4j6cZUNufTcGIMZMVbIjCY+pPP0YuBtfZ13gUl4VCJAL+rc+3e8pYM4wbX8v1OVEfgor
 W1hqShB0exPvwlMsMYUB07Gu69RRGn4RI6UxpMEV9x0GkqTE4reXnzdktDdc55Y1yccbPhi/5V
 dK1IEZsTWkRbjhdX6JmJjzUh79IJ46bbWDcvFRdSo7tib+EJ0AQ7E3VhtzRRwK2UorIkSelS9r
 8lU=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484307"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:35:18 -0800
IronPort-SDR: AH9BHQB9MIQBzAY5Ri9Hgg/79lyV3x/YUPH54BI7JOzpOYbSSNWjJPTVJ1F4FlKPWknPK6wmNm
 F+vkcI+4ZWzzUt9N7txGASGC0lHvN7KuC+cGhZXUIwhazBiJWaKH1Nxmc11Q50d1Y43vulIPOF
 Q/aprwd+l8oQzv+1CjlezN9VZP1UUKXhucurn5vI+a1Kzh9C83IFyxKd30lWRgSIiKqogFWjmW
 XXIu4fPJIDlkoDBe6IH0OIfJiMoIjfkX4cKyuRIkjAEQMtd0bYA479rGD5jbkW1lK3E2eerQuD
 Q0k=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 35/63] Input: atmel_mxt_ts - rely on calculated_crc rather than file config_crc
Date:   Fri, 16 Aug 2019 17:34:57 +0900
Message-ID: <20190816083525.19071-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
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
index aa913d2a0e3b..9cdb7754599c 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1898,7 +1898,7 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
 	int ret;
 	int offset;
 	int i;
-	u32 info_crc, config_crc, calculated_crc;
+	u32 info_crc, config_crc, calculated_crc = 0;
 	u16 crc_start = 0;
 
 	/* Make zero terminated copy of the OBP_RAW file */
@@ -1961,30 +1961,6 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
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
@@ -2008,14 +1984,45 @@ static int mxt_update_cfg(struct mxt_data *data, const struct firmware *fw)
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

