Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 074499DDD1
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbfH0G2c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:28:32 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:48162 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727999AbfH0G2b (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:28:31 -0400
IronPort-SDR: JXIAVBRHAW0GgVNAinAQpNWbGD+SN+1brfcAjR+orz81eiyYKKJSFi+MIgF9DL9DL0qak6J6Z2
 An7m0MvqF7DHhgVRxy871HbzOAdLUIxyHmUmZ/Tby5fDDGW8SX829PEzj+s0GjqceOKRx5rx+S
 J8AUQywWizY2nhI7Q3NFsQ8jvxIurqlNtbC27T1Xn1XJ31bA4lcL4Ujefig1Khhe72LHWr46D6
 HvylFNWeBaZ4O/B7IlpdWTWM7w6be/SlwNslMKMNvF2eMBpYIjlk/gyM4hFJ3Qgu0+kzaUNPCP
 YK4=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="40784486"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa3.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:28:30 -0800
IronPort-SDR: dQLbG/I+OwHJJPqR0Y3MR7o3kMP9Kk7XMZoUgaWkd9YbMEpgxmHGIpCaZLfYLJNrDjY4YmuIoA
 NZcxQ9SQw/3f6qUmZFnHKpMjpFzQ26cJL5kxN0xIBVcds9HholsWM0DXD4sdxPSXTkiCMv9eTN
 fyKyUqt00tMIounH1xq1hJDssZnV8JAjugCI827kA3JL0Tp4w/1vqeausY/NT9AbJpG+uJIAAB
 9r46LfzO2VekaxaLXVAKR2VbhHUj4foi2uIiuKVrCG+AfnodhXpgdlfASeCLTsfwHSGc6eAJad
 j9k=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 16/49] Input: atmel_mxt_ts - allow specification of firmware file name
Date:   Tue, 27 Aug 2019 15:28:01 +0900
Message-ID: <20190827062834.20494-2-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190827062834.20494-1-jiada_wang@mentor.com>
References: <20190827062834.20494-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
index 641dd14489e1..14f665f12778 100644
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
2.19.2

