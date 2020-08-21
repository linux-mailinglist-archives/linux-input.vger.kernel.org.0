Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 196EC24D000
	for <lists+linux-input@lfdr.de>; Fri, 21 Aug 2020 09:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbgHUHyP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Aug 2020 03:54:15 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:13624 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgHUHyP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Aug 2020 03:54:15 -0400
IronPort-SDR: yzNhsuSSV0B8OK3RkOANU3f40vNgU8caL20gxHd8zoP74ZxDMMwefx1f/r56fkHdpfCrb7PI3z
 wXuPnbYDKg2+ri603NXYKyfK1DHl7ovURSMfefdg5KkamWofq3rwRTmjssPmvnkQNGgiyIjCwl
 HVcMK3cJLzRYcUAZxHqH78an5I1Rl3ZPzi4LK3YlWNnfPQVytZjV1Qo4/VSGrzU/8JJ3ZCH9f0
 kxPtE0u/1vTZKWKlcoruMXnxhF53kQ0z+fIkxcthWlET2eDY47bfuUoy0it8PtfcfXAAoXF9W/
 scI=
X-IronPort-AV: E=Sophos;i="5.76,335,1592899200"; 
   d="scan'208";a="54312160"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 20 Aug 2020 23:54:14 -0800
IronPort-SDR: qaDJMqQQKyTH7cROx7wpVxlJglhg+ml5ejMoE4dTm1nAzm8/Yoqbfzlj8wSmDQaaNvvQlWR1O3
 tHiz4GED1XbgeL9yOv+HSJnfeerUzz4j65jReP5xqp58WUvGpayErabGAz+3HRTytwVbiW9vBp
 qaOGSm5TuSpqnhFYCQoPGKOciiS6KPXEL93sHeCPxVwSjOyVrJgnWlrtZATztgCLL9fyVoKL2f
 umjndRe5N0szpDanBKFC4Tq+IdWEOeaqqcsnFwLG0MLqpKGGglRduBsfsPN/GBI9L997onXN9s
 uKI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <digetx@gmail.com>, <jiada_wang@mentor.com>
Subject: [PATCH v2 1/1] Input: atmel_mxt_ts - allow specification of firmware file name
Date:   Fri, 21 Aug 2020 16:54:10 +0900
Message-ID: <20200821075410.8250-1-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

On platforms which have multiple device instances using this driver, the
firmware may be different on each device. This patch makes the user give
the name of the firmware file when flashing.

If user specified firmware file can't be found, then driver will try to
flash default firmware "maxtouch.fw".

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
Acked-by: Benson Leung <bleung@chromium.org>
Acked-by: Yufeng Shen <miletus@chromium.org>
(cherry picked from ndyer/linux/for-upstream commit 76ebb7cee971cb42dfb0a3a9224403b8b09abcf1)
[gdavis: Forward port and fix conflicts.]
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: change to flash default firmware file, when user specified firmware can't be found]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 33 +++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a2189739e30f..a20bc1bf8d52 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -34,6 +34,7 @@
 #define MXT_FW_NAME		"maxtouch.fw"
 #define MXT_CFG_NAME		"maxtouch.cfg"
 #define MXT_CFG_MAGIC		"OBP_RAW V1"
+#define MAX_FILENAME_SIZE	64
 
 /* Registers */
 #define MXT_OBJECT_START	0x07
@@ -308,6 +309,7 @@ struct mxt_data {
 	struct t7_config t7_cfg;
 	struct mxt_dbg dbg;
 	struct gpio_desc *reset_gpio;
+	char fw_name[MAX_FILENAME_SIZE];
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -2887,6 +2889,26 @@ static int mxt_load_fw(struct device *dev, const char *fn)
 	return ret;
 }
 
+static int mxt_update_file_name(struct device *dev, char *file_name,
+				const char *buf, size_t count)
+{
+	size_t len = count;
+
+	/* Echo into the sysfs entry may append newline at the end of buf */
+	if (buf[count - 1] == '\n')
+		len = count - 1;
+
+	/* Simple sanity check */
+	if (len > MAX_FILENAME_SIZE - 1) {
+		dev_warn(dev, "File name too long\n");
+		return -EINVAL;
+	}
+
+	strscpy(file_name, buf, len + 1);
+
+	return 0;
+}
+
 static ssize_t mxt_update_fw_store(struct device *dev,
 					struct device_attribute *attr,
 					const char *buf, size_t count)
@@ -2894,7 +2916,16 @@ static ssize_t mxt_update_fw_store(struct device *dev,
 	struct mxt_data *data = dev_get_drvdata(dev);
 	int error;
 
-	error = mxt_load_fw(dev, MXT_FW_NAME);
+	error = mxt_update_file_name(dev, data->fw_name, buf, count);
+	if (error)
+		return error;
+
+	error = mxt_load_fw(dev, data->fw_name);
+	if (error) {
+		dev_warn(dev, "try %s instead\n", MXT_FW_NAME);
+		error = mxt_load_fw(dev, MXT_FW_NAME);
+	}
+
 	if (error) {
 		dev_err(dev, "The firmware update failed(%d)\n", error);
 		count = error;
-- 
2.17.1

