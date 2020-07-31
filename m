Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7460234099
	for <lists+linux-input@lfdr.de>; Fri, 31 Jul 2020 09:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731743AbgGaH5V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jul 2020 03:57:21 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:59791 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731684AbgGaH5V (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jul 2020 03:57:21 -0400
IronPort-SDR: GK+vBg4ZI7qWnzKcRf3NEiX6vUd6G/cOpL5QUUea99f5NtosAnT43AsmF6zSkbAiRjzzZ8iZ2M
 YL0hXTlLR9hBXLPC10eJERgNtJxs6vqzWiOxMOxZn0HxapUDar0+/DgbXR/P8PZ8qmlcFiQjaR
 5PBJimv+/Rp13Jlsr+AKOwLZRZ30HzzPsVCwIRROIbJZKqg7Yk4M7fQzCjPeMOmkHJ65VY8/Pp
 uxkW0URbSYWAzHXiQOWZvACBarVXuXc0ryugml7uagXVOAvTEMcS0oOAPem70HmDY6qu7etoOj
 Vc4=
X-IronPort-AV: E=Sophos;i="5.75,417,1589270400"; 
   d="scan'208";a="51482398"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 30 Jul 2020 23:57:19 -0800
IronPort-SDR: dDXKd3F96M8sx13RuJ7m0jMJryFRja+bpgEwDdqApgG/bToWc/p4qhkt1TnAFLPu1YBOLgvRhz
 yYexX8qDAK1xZj623OsoU+J5wNdEWzswIsAgp3TSlllzuwxyc1IyVet/8a5+pvR6ZE1xwlYtfe
 c4IL6dX2bo+l7H/37LXN0AuxTXLZHHjqHIuT4QNLB11UGnapp8O4VcJtvgK7shaPOiatpNK+wB
 QcVQFGCh6F7UqOYQMh75D4wOa3qAkl95KF2jgM9HWuoRd4Ou89OFEk1Gm9nS6pogJLaftsW3Dt
 7LI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <digetx@gmail.com>, <jiada_wang@mentor.com>
Subject: [PATCH 1/1] Input: atmel_mxt_ts - allow specification of firmware file name
Date:   Fri, 31 Jul 2020 16:57:14 +0900
Message-ID: <20200731075714.10608-1-jiada_wang@mentor.com>
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

This also prevents accidental triggering of the firmware load process.

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
Acked-by: Benson Leung <bleung@chromium.org>
Acked-by: Yufeng Shen <miletus@chromium.org>
(cherry picked from ndyer/linux/for-upstream commit 76ebb7cee971cb42dfb0a3a9224403b8b09abcf1)
[gdavis: Forward port and fix conflicts.]
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 42 ++++++++++++++++++++----
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index a2189739e30f..024dee7a3571 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -30,8 +30,6 @@
 #include <media/videobuf2-v4l2.h>
 #include <media/videobuf2-vmalloc.h>
 
-/* Firmware files */
-#define MXT_FW_NAME		"maxtouch.fw"
 #define MXT_CFG_NAME		"maxtouch.cfg"
 #define MXT_CFG_MAGIC		"OBP_RAW V1"
 
@@ -308,6 +306,7 @@ struct mxt_data {
 	struct t7_config t7_cfg;
 	struct mxt_dbg dbg;
 	struct gpio_desc *reset_gpio;
+	char *fw_name;
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -2766,7 +2765,7 @@ static int mxt_check_firmware_format(struct device *dev,
 	return -EINVAL;
 }
 
-static int mxt_load_fw(struct device *dev, const char *fn)
+static int mxt_load_fw(struct device *dev)
 {
 	struct mxt_data *data = dev_get_drvdata(dev);
 	const struct firmware *fw = NULL;
@@ -2776,9 +2775,9 @@ static int mxt_load_fw(struct device *dev, const char *fn)
 	unsigned int frame = 0;
 	int ret;
 
-	ret = request_firmware(&fw, fn, dev);
+	ret = request_firmware(&fw, data->fw_name, dev);
 	if (ret) {
-		dev_err(dev, "Unable to open firmware %s\n", fn);
+		dev_err(dev, "Unable to open firmware %s\n", data->fw_name);
 		return ret;
 	}
 
@@ -2887,6 +2886,33 @@ static int mxt_load_fw(struct device *dev, const char *fn)
 	return ret;
 }
 
+static int mxt_update_file_name(struct device *dev, char **file_name,
+				const char *buf, size_t count)
+{
+	char *file_name_tmp;
+
+	/* Simple sanity check */
+	if (count > 64) {
+		dev_warn(dev, "File name too long\n");
+		return -EINVAL;
+	}
+
+	file_name_tmp = krealloc(*file_name, count + 1, GFP_KERNEL);
+	if (!file_name_tmp)
+		return -ENOMEM;
+
+	*file_name = file_name_tmp;
+	memcpy(*file_name, buf, count);
+
+	/* Echo into the sysfs entry may append newline at the end of buf */
+	if (buf[count - 1] == '\n')
+		(*file_name)[count - 1] = '\0';
+	else
+		(*file_name)[count] = '\0';
+
+	return 0;
+}
+
 static ssize_t mxt_update_fw_store(struct device *dev,
 					struct device_attribute *attr,
 					const char *buf, size_t count)
@@ -2894,7 +2920,11 @@ static ssize_t mxt_update_fw_store(struct device *dev,
 	struct mxt_data *data = dev_get_drvdata(dev);
 	int error;
 
-	error = mxt_load_fw(dev, MXT_FW_NAME);
+	error = mxt_update_file_name(dev, &data->fw_name, buf, count);
+	if (error)
+		return error;
+
+	error = mxt_load_fw(dev);
 	if (error) {
 		dev_err(dev, "The firmware update failed(%d)\n", error);
 		count = error;
-- 
2.17.1

