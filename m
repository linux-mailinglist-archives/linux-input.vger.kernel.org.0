Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9C9E8223
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 08:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731074AbfJ2HV1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 03:21:27 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:41262 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731044AbfJ2HV1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 03:21:27 -0400
IronPort-SDR: GZBqbnvhxOuhGx4NGRfoylJZ/f1Gdwfzz4KzoK6kUjWSsIBisx+j3UTzn30xMXy44YO/7AXLLC
 tmausUvwhvPXAoiUpQ0qpWUoe5QiSTMtpF4Pw+fEh1wkkYIpl/kLg4aSR+OD6R9NvmMfihDNiL
 0GO1I+gb0u4euGmdGAHLFzgJjPmCpfsNMZeSO/vVzn8y/ddIVI3PF/LGCGdZogjqeWQEJOpat1
 I4zs69hgEE9P1qviot4bCcD8HMoOkZTq2d2gkdWQW6uk0e99aA5aO3vzNom8Nt/KL+A5VGJGL4
 4lE=
X-IronPort-AV: E=Sophos;i="5.68,243,1569312000"; 
   d="scan'208";a="42663255"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 28 Oct 2019 23:21:27 -0800
IronPort-SDR: LoWoxrpRrMW2jv9LUGiIe5sVF5Tdvc2JSrjzg5fTISPN5MOP3gVsGM/Nt5h7A50FEYsZr7Smqi
 YZbxP3notGWFNyQuTo/5SPnZaVzjQtdO8Fo0lXVY9/0U9ykhbzEiYVYga2gS9ha426IgkdcZJP
 JegtlVnx23OHTbgPULaSTMg3GEyyvQ0wUoo3K/2y5kXWTJqFjnKIvivHL4dPgs0veTVDTxJZeJ
 3dTdPU6RUxNkVSco7UVVnfh/xAzjwMOokphqMg7SULdnW6bvhgGwNn85uzh/4sQgHAoq7LNBwJ
 AgY=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v4 20/48] Input: atmel_mxt_ts - refactor code to enter bootloader into separate func
Date:   Tue, 29 Oct 2019 16:19:42 +0900
Message-ID: <20191029072010.8492-21-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029072010.8492-1-jiada_wang@mentor.com>
References: <20191029072010.8492-1-jiada_wang@mentor.com>
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
index 855c36e7903d..49ec37149118 100644
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

