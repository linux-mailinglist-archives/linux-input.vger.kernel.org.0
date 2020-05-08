Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3351CA339
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:59:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728025AbgEHF6u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:58:50 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:38715 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728032AbgEHF6s (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:58:48 -0400
IronPort-SDR: v992HnQOXZltl/bnCwJMfbyQQkZkkPOrm6M9c54QLeckyxvbZiW7fTycgg/uStSO6e5LtjTXNP
 CD5VuRSmfxGSLtDrp/x4QPsT8QTobV7/Y+PAXudYxZU9m6P0D/OL0niRV+zj3+bPbDrFQS5CJR
 tGIOqQ8dVNjwtMNSuNWapfWJK05Q+Sq6H7uR8iXu73otZZiVClq9nzmq4QJ6m6C+6Wip01rBAB
 aFQM7SjaD62pEvaVUdnR5lYWA1VDKRaOYyxevXW5DEF1n+kcj8WnFjPeqW11LM4bhjkeHDiOR8
 8JE=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="50670106"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 07 May 2020 21:58:46 -0800
IronPort-SDR: knVGv/inYw9s8Bajp8uhv8i5A8XhDj4Yje7Hg36lIwhi0BcnkiEyaY3PpKb1Mq0p5X7uNTMzBb
 xbwrVpN/X3bUoJKtGKKuQpubn1/PDVXtCqwvq77FOH41582mZ5FsRFOEjgtoqxbz/Tvd9FaCyq
 RNaUmRRqtVMWmztgsSDAhxpfXTmq530eRCxbYorjQd/bsSRaEQhd/m0wAKTrOJqnj4FpeLEqmE
 wYBEXpwC4FWCU9M7dIT/Xu3wuHKEd980MkaT98CdhzFHAm6o5zPwvBTSAyQ6Y6r/GPDCxCiaXF
 HAo=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 28/56] Input: atmel_mxt_ts - refactor code to enter bootloader into separate func
Date:   Thu, 7 May 2020 22:56:28 -0700
Message-ID: <20200508055656.96389-29-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508055656.96389-1-jiada_wang@mentor.com>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

Refactor code to enter bootloader into separate func

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit bedd706a32522b946467e15f4f4f24de86a1b4d7)
[gdavis: Resolve forward port conflicts due to applying upstream
	 commit 96a938aa214e ("Input: atmel_mxt_ts - remove platform
	 data support").]
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: Squash change from ndyer/linux/for-upstream commit d691d3ee6c6de84b38464a42
3207b3e23cb9dc3a
	- Input: atmel_mxt_ts - check firmware format before entering bootloader
	Add commit description]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 43 +++++++++++++++---------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index bb4fc13defea..674763dddcd3 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -3253,23 +3253,10 @@ static int mxt_check_firmware_format(struct device *dev,
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
@@ -3287,14 +3274,14 @@ static int mxt_load_fw(struct device *dev)
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
@@ -3305,6 +3292,30 @@ static int mxt_load_fw(struct device *dev)
 
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

