Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 237719DDDE
	for <lists+linux-input@lfdr.de>; Tue, 27 Aug 2019 08:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728600AbfH0G3D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Aug 2019 02:29:03 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:11340 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbfH0G3D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Aug 2019 02:29:03 -0400
IronPort-SDR: uUhYk8Or9IJDFgy1XDyR4AFljQXdGKE/Ma18wPqfFcGv7v7oNgSWa3MI+mNS6apPSf4zzkyQkO
 FFi8apyoR0xmf7Sj8b9iIvnKsUSUdBtap5ljNBHlJ/KfrJN9s15S8hKN5V88afkA/M40ew1P/u
 8YMNr+bL4t/j9YtsJVbJQDTHBX1Pz9HbKFsnj13QoUNsf9Dk54oN0ne4Dy7TcX+GUOAg7ym8Az
 Q53qOkKuUjeipIbMzrGSY2/Guldopy+4IXg9Z6CAv/kZX9wAPjb5gBL2iRYmN/OsK3qNJH259b
 xmw=
X-IronPort-AV: E=Sophos;i="5.64,436,1559548800"; 
   d="scan'208";a="42589366"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 26 Aug 2019 22:29:02 -0800
IronPort-SDR: 0GbC0Rs6HBSQ2jVG4I3thTbUcMEKtSg+YAuHb4NLaIBHgswwbAQ/rMPM7ZLqX0ujwZCAg+SLxS
 iprxpB+oiR18sb0eC8PzY/p2hwqFtAK+s+nUeXRl/43CtT+VXbO2Nb3pz6YKYFRO1ujd5Aovsm
 jbF3fyFdM2vpGVuPjfSZvICMzvzU5JFxbYQa2+S4WuQQ+RZG/re9RtemWE0hweNYse8VIW09eq
 VOYKXRWuTDcGDCfGa9+5Gn6OqMj76IsdAiS+ZYS0Tpa/I0+TGljA1T7gMldK/uPa6FdTCvJpYX
 mj0=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v2 21/49] Input: atmel_mxt_ts - refactor code to enter bootloader into separate func
Date:   Tue, 27 Aug 2019 15:28:42 +0900
Message-ID: <20190827062910.20598-2-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190827062910.20598-1-jiada_wang@mentor.com>
References: <20190827062910.20598-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201) To
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
index 85eefd4fbc9a..3da3f27ed580 100644
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

