Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5F11067D0
	for <lists+linux-input@lfdr.de>; Fri, 22 Nov 2019 09:25:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727337AbfKVIZC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Nov 2019 03:25:02 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:60534 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727332AbfKVIZB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Nov 2019 03:25:01 -0500
IronPort-SDR: Nzzax3BkieBymU9hR+PoQWNpFxU8NaDh9NV9F7430cyFp8v5iCYWte+h4FgkayK9995dwAq5cQ
 8SIvWl0mXc7WCIyWRwa2DuTshWhJPlvp2S6jEEZe7zUPAmG+sCJWplqamtYi2DsKNpJ3Bq2X+u
 UmO9oOnOXbIS9sNQfMNPreQmoO8ogjxTTFfVlczM1v58t1QHlyGbZsH/VNZzw1W/WUqr3HCQoi
 ASQjxE5H4hAyd3OH65a4q3vdGztCesIcDEnVZrtjXYp265ak5KFMvWZNj5JSzyhd5MVFaBqwFl
 EVM=
X-IronPort-AV: E=Sophos;i="5.69,229,1571731200"; 
   d="scan'208";a="45291111"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 22 Nov 2019 00:25:01 -0800
IronPort-SDR: Qw1ksm0RyPUPU7GTkW+TQvRZFP4xRV3lG7KoBtqwRmOSbcamgwkdUE+0l9OO40v9nKULlPn9fJ
 p5mzWfUDNjrD0F5m/JBHU0g9iMuYMsfCjVpz2ltO4CAChE/DTDLu6w5P/pk6emdYRjUv8QSOw9
 CGBpCxhh4anw9jzWNA3tzRsYmkD3jlMTNAA8MHE85qTsB0tVI2SLhz19qikYAkPX05WuWFDrIq
 It/VARj6LwpmqvOUooBdrxI7DL7mD5NmqEY4VHhLt/svqLLgk14haFLWtIbHS3mGq2vRclE9pV
 YhI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v6 15/48] Input: atmel_mxt_ts - allow specification of firmware file name
Date:   Fri, 22 Nov 2019 17:23:29 +0900
Message-ID: <20191122082402.18173-16-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122082402.18173-1-jiada_wang@mentor.com>
References: <20191122082402.18173-1-jiada_wang@mentor.com>
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
 drivers/input/touchscreen/atmel_mxt_ts.c | 43 ++++++++++++++++++++----
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index c551ec93ca54..a0e367bc6e83 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -33,8 +33,7 @@
 #include <media/videobuf2-vmalloc.h>
 #include <dt-bindings/input/atmel_mxt_ts.h>
 
-/* Firmware files */
-#define MXT_FW_NAME		"maxtouch.fw"
+/* Configuration file */
 #define MXT_CFG_NAME		"maxtouch.cfg"
 #define MXT_CFG_MAGIC		"OBP_RAW V1"
 
@@ -335,6 +334,7 @@ struct mxt_data {
 	bool use_retrigen_workaround;
 	struct regulator *reg_vdd;
 	struct regulator *reg_avdd;
+	char *fw_name;
 
 	/* Cached parameters from object table */
 	u16 T5_address;
@@ -3207,7 +3207,7 @@ static int mxt_check_firmware_format(struct device *dev,
 	return -EINVAL;
 }
 
-static int mxt_load_fw(struct device *dev, const char *fn)
+static int mxt_load_fw(struct device *dev)
 {
 	struct mxt_data *data = dev_get_drvdata(dev);
 	const struct firmware *fw = NULL;
@@ -3217,9 +3217,9 @@ static int mxt_load_fw(struct device *dev, const char *fn)
 	unsigned int frame = 0;
 	int ret;
 
-	ret = request_firmware(&fw, fn, dev);
+	ret = request_firmware(&fw, data->fw_name, dev);
 	if (ret) {
-		dev_err(dev, "Unable to open firmware %s\n", fn);
+		dev_err(dev, "Unable to open firmware %s\n", data->fw_name);
 		return ret;
 	}
 
@@ -3339,6 +3339,33 @@ static int mxt_load_fw(struct device *dev, const char *fn)
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
@@ -3346,7 +3373,11 @@ static ssize_t mxt_update_fw_store(struct device *dev,
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

