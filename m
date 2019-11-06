Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD63F0F93
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2019 08:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731525AbfKFHDM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Nov 2019 02:03:12 -0500
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:23839 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731206AbfKFHDL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Nov 2019 02:03:11 -0500
IronPort-SDR: CH9kGI2qkrZDwcm+kxy/WdNJV0+9/igJIYNaXFDf7+52kcddph3hDoEPUHJUCfOMYLaaT0PaJk
 wPy91hODySP5LpIxtYGPRMzfBmHTEgWnF8ySG4ikLOPp6Krfe6Om81AvpUoeX/5vjYBXhhxPjD
 69qJ1FDeoNN+Likxi+IjbiRvyyQdltmZvBkd5GV7/oAEf+7/zkGIg/Gm5K8GmLzqYei5ZkDC14
 K4nRmDPjA8pDeZUdL95FPuu3epta+IBkWP1bu/qhoPoBuuUy0G1IcmsuLMq8K6cKf12EBCN9xv
 kec=
X-IronPort-AV: E=Sophos;i="5.68,272,1569312000"; 
   d="scan'208";a="42848270"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 05 Nov 2019 23:03:10 -0800
IronPort-SDR: CJl+sMEPpZQwyWxNkYKT0K+HHHvGR3iENjoGASJLC3/ELy3ikbQmLSFtfLlniJwsDxNu/S2+CE
 oanPOQ1WRqYodET+29Ywhn1G2OaxoM50TB+3D9vzrR6YwhAqhjaM6m5oUz+WXb5eD/OCDtw9/K
 PO/bYrpp6EsUSY3k9ZPexla0GAWYlz4auNomc7G0+svXL1oXEgfmPw2Pgt8bt4clNWUtZTLoqU
 PpA2Wvsf0f102Qt3RXuCQyY5X/kbxr5DmCRmdqN/e8BhgMFJy6Q0YiEAZYUAReuBvVR/+hysEM
 1Ic=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v5 20/48] Input: atmel_mxt_ts - refactor code to enter bootloader into separate func
Date:   Wed, 6 Nov 2019 16:01:18 +0900
Message-ID: <20191106070146.18759-21-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191106070146.18759-1-jiada_wang@mentor.com>
References: <20191106070146.18759-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit bedd706a32522b946467e15f4f4f24de86a1b4d7)
[gdavis: Resolve forward port conflicts due to applying upstream
	 commit 96a938aa214e ("Input: atmel_mxt_ts - remove platform
	 data support").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: Squash change from ndyer/linux/for-upstream commit d691d3ee6c6de84b38464a42
3207b3e23cb9dc3a
	- Input: atmel_mxt_ts - check firmware format before entering bootloader]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 43 +++++++++++++++---------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 44bb77c0159c..04627db23ad2 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3257,23 +3257,10 @@ static int mxt_check_firmware_format(struct device *dev,
 	return -EINVAL;
 }
 
-static int mxt_load_fw(struct device *dev)
+static int mxt_enter_bootloader(struct mxt_data *data)
 {
-	struct mxt_data *data = dev_get_drvdata(dev);
-	struct mxt_flash f = { 0, };
 	int ret;
 
-	ret = request_firmware(&f.fw, data->fw_name, dev);
-	if (ret) {
-		dev_err(dev, "Unable to open firmware %s\n", data->fw_name);
-		return ret;
-	}
-
-	/* Check for incorrect enc file */
-	ret = mxt_check_firmware_format(dev, f.fw);
-	if (ret)
-		goto release_firmware;
-
 	if (data->suspended) {
 		if (data->suspend_mode == MXT_SUSPEND_REGULATOR)
 			mxt_regulator_enable(data);
@@ -3291,14 +3278,14 @@ static int mxt_load_fw(struct device *dev)
 		ret = mxt_t6_command(data, MXT_COMMAND_RESET,
 				     MXT_BOOT_VALUE, false);
 		if (ret)
-			goto release_firmware;
+			return ret;
 
 		msleep(MXT_RESET_TIME);
 
 		/* Do not need to scan since we know family ID */
 		ret = mxt_lookup_bootloader_address(data, 0);
 		if (ret)
-			goto release_firmware;
+			return ret;
 
 		mxt_sysfs_remove(data);
 		mxt_free_input_device(data);
@@ -3309,6 +3296,30 @@ static int mxt_load_fw(struct device *dev)
 
 	reinit_completion(&data->bl_completion);
 
+	return 0;
+}
+
+static int mxt_load_fw(struct device *dev)
+{
+	struct mxt_data *data = dev_get_drvdata(dev);
+	struct mxt_flash f = { 0, };
+	int ret;
+
+	ret = request_firmware(&f.fw, data->fw_name, dev);
+	if (ret) {
+		dev_err(dev, "Unable to open firmware %s\n", data->fw_name);
+		return ret;
+	}
+
+	/* Check for incorrect enc file */
+	ret = mxt_check_firmware_format(dev, f.fw);
+	if (ret)
+		goto release_firmware;
+
+	ret = mxt_enter_bootloader(data);
+	if (ret)
+		goto release_firmware;
+
 	ret = mxt_check_bootloader(data, MXT_WAITING_BOOTLOAD_CMD, false);
 	if (ret) {
 		/* Bootloader may still be unlocked from previous attempt */
-- 
2.17.1

