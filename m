Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B596315A384
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728530AbgBLIoa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:44:30 -0500
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:18899 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728435AbgBLIoa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:44:30 -0500
IronPort-SDR: j1sOn4uF7uAMM+ju8dQ9L/YItmkrsgmFSI5Vtw5g2vDfy2fenzSIPHn9hC60wP4HYqyZx74gXx
 UrzXTkorQ0tmWCDA/C8KEwhMqfazccMpJdeMq2FU7bHmvhyBoWbNB/DPSFY08KzmYIkFt0edAm
 Ith0xxW8XB4QLYYW14q44jNJ1VGB04viEZTmdmbwKqob0K8FdFcIVR9OtSxHkdnfE8uEaxWVCH
 TD5f3VMMI9PwDYWRJiwPG5P44WJIACocOiqd4h86Gs+Y9EMQv2WTrdBU0nTmaZtkaKE8j2iuv5
 pas=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="45742534"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:44:29 -0800
IronPort-SDR: 6ZgdK61HSSpa109T8Q1VPW+t6ep7uhS+r/ejteihCvMpTjjHu1oWx6umkZplCgAtmfhzDiW21o
 GZmaNrxEnMoZgc2cjMzEbtbazha0s1BqAxAqugEywp/iSqNoFDNGVf27LYDnPbHGbEMWgzYwZh
 1vda5+1jm96WlRKYXHpdVErO5GK0Z/smHcc/GI6Clp7McANncx0NmY3UaTtv5wrr3sflWimFqv
 I40c6bJK9t4/YvUcCbGI7cA9ayAjOcJ4baSiw1SL7XXyOrcPqj+Q2QXCmOQOxNByu1jECJyXGa
 TGQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 15/48] Input: atmel_mxt_ts - allow specification of firmware file name
Date:   Wed, 12 Feb 2020 00:41:45 -0800
Message-ID: <20200212084218.32344-16-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200212084218.32344-1-jiada_wang@mentor.com>
References: <20200212084218.32344-1-jiada_wang@mentor.com>
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
index 8cac4debb505..1fa9166d01a1 100644
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

