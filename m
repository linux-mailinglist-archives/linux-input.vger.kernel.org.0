Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE60199407
	for <lists+linux-input@lfdr.de>; Tue, 31 Mar 2020 12:52:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730666AbgCaKwA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Mar 2020 06:52:00 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:43515 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730684AbgCaKv6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Mar 2020 06:51:58 -0400
IronPort-SDR: 8vCeKGR31NetsJDRf8kDAhYQpJgj+JSffQptrZcmgTEeTBvcSdQeQABtTTvFy4jR25YBi30Erc
 I/llmdyQVdAfz64jTBPpNn80ClBXzSmVlojPZWE/Qr4bPfZXnmg66Kn8cKx686dMuWeCoU/Fn8
 VFEDoegnOokdrSihF0eYSni/d7ru+Gwy4rq++83LW4FPgTBTqxSVohpCsLmMgMe7J0Zqn9BX8E
 es/d5UQSJeL6GN7Zm7WiyI8SbnXF2rLVE7QhwMicEfX+7Yzp0krPW9oNPrqL50WMayBO22KzBT
 Kfo=
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; 
   d="scan'208";a="47330752"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa4.mentor.iphmx.com with ESMTP; 31 Mar 2020 02:51:57 -0800
IronPort-SDR: /y1IIBwvHchPKSpluvbwTAmb/QFjiw6jMG2SJIs56Lcw3p+9InH0Tm/FJiNUU8BEAQ8ynkEeJr
 yCyhelHJGWKyTKNucpMRiG4Hsi6iIQmmW4r/28w9as5j4so8VcnwfWfGSnzn3bLaDgldAeLUSD
 SPUC4u+5lE42fR76L5ofcEck3AoI0T/Ge3M0/Q+a+jqfeH1eKalVZTu4DVbzCgsNoWP917x++5
 HXxHVP7MkQI7SxR1W3CRM9h6DB98/SyBogFVVi5Or5CRwwXxURp56/rGxzdTHGOjyZBHY5XUmi
 tgg=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v10 16/55] Input: atmel_mxt_ts - allow specification of firmware file name
Date:   Tue, 31 Mar 2020 03:50:12 -0700
Message-ID: <20200331105051.58896-17-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200331105051.58896-1-jiada_wang@mentor.com>
References: <20200331105051.58896-1-jiada_wang@mentor.com>
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

