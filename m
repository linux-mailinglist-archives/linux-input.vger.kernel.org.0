Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC4F18B9FC
	for <lists+linux-input@lfdr.de>; Thu, 19 Mar 2020 16:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgCSPB0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Mar 2020 11:01:26 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:5326 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727470AbgCSPB0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Mar 2020 11:01:26 -0400
IronPort-SDR: A0RnMW872/LsAGAnDC9loRPWo0F9AnKDoXkG+N7O+lPAbi6zj9wMxNsLL7NX3L28ZTU7eWM1AT
 L51LxHshm+1p1LTq1FcEOOJzOZdz7aR/VJ3Ko7z/qzgy+9lY2Do8tCq6e9G+H2nfB4chE0IKnU
 x66tMIdRdBQsJ3aMVJFOlMyn2Zxe9MQAs0kiHNhZtOBMS5Ie1CcsvL1sBm9x6X4QeXs6v2cza5
 LNkgqVxq7pfhT6p1EEBAqoLs2aMGRIgFo8ez3C+hPg7dkJuAtaHVBRtdtA9Xua/dtKW9FgB/tS
 /0o=
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; 
   d="scan'208";a="46818671"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 19 Mar 2020 07:01:24 -0800
IronPort-SDR: cRMiJ7ao3znRQ/de7XczIhuuuj0HpkHhMccz/THEMD/j/ar1rXbnvu6D4jLLlSdbXaXTZ26wzw
 QfA6pKYk+lZtn8TMaOFa+i6BLb6kedpLseCt3h2h3BEbvODryU37hFtI794Alz8UBOFUYhFtua
 wOApsxlhUSwVku6zP4xnefjH9+vYDg/7seWX7mTBYbDQWkZFAOU0pDR6Olch+Uh5i1I4pjRfVT
 N0qQ7IhTW2/QImfVKgITRRiFm6bb1m5onD+Mwp4dpCbnlmk0BNgZcldtKp21OavBvDnMtZH6q/
 yg4=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v8 16/52] Input: atmel_mxt_ts - allow specification of firmware file name
Date:   Thu, 19 Mar 2020 07:59:40 -0700
Message-ID: <20200319150016.61398-17-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200319150016.61398-1-jiada_wang@mentor.com>
References: <20200319150016.61398-1-jiada_wang@mentor.com>
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
index f8783e37436f..0e30ff372a43 100644
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

