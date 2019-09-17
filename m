Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE5EB4ADB
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 11:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbfIQJjo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 05:39:44 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:20501 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727002AbfIQJjn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 05:39:43 -0400
IronPort-SDR: daOkxq2KT7eN9SBZHbi1GGcU+V3+fdW3svHMmwRk1SS2rvjcD8m/n63eEm6ztKqlLYXFlzcEmH
 glzefCkWdR7x3OtA15KKlRGM32KopNU7yOnS6MzswxR1WRTxIx0ObrBFC7Slw5fgBitQXlrMqo
 u6vYPMY6muThnuzCmLYOZ2AZZGqcX0mXboHqhWG7/JcjO/jDb2g190CMYdGD8Z1iv6CSCZ4Ifg
 jJzihmIVQ+AayLunnrY8eO5lnFhZJxxMF8LfeI7zgpevEkrWN+9liVqH2r9YjD8RpEdvmdvz1x
 NwI=
X-IronPort-AV: E=Sophos;i="5.64,515,1559548800"; 
   d="scan'208";a="41416508"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 17 Sep 2019 01:39:43 -0800
IronPort-SDR: sQpZMFVbuTGk0xlmVSatapakYQarttkTxzQnBYHuekTeUnG2rjwn90eVrGZue88wHnGt2MkGBj
 rGiypYZPyNhNaDgTbsc09HYWsDKNcYGZSYYsbvX510TYXgD434RXmoYh5yWIuWByye6Qeol9UT
 hOOnt/PHxTXuGa1adCHxu7D/UGaPPaRBMERMjSxouKCbwlI/EEodq+LWXLBUS6eZLBzuD+Zlm+
 +W+4C1SIX1IMr2r1DtN1EZigA96BN29RUJBJMZUZOgHlVPyDZJTZriln3Jj4/FHTOD8hKeZKhe
 0EE=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>
Subject: [PATCH v3 21/49] Input: atmel_mxt_ts - refactor code to enter bootloader into separate func
Date:   Tue, 17 Sep 2019 18:38:47 +0900
Message-ID: <20190917093915.18645-2-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190917093915.18645-1-jiada_wang@mentor.com>
References: <20190917093915.18645-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
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
index 711ce39f38ca..ca56122550eb 100644
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
2.19.2

