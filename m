Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D9191929EE
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 14:35:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbgCYNfW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 09:35:22 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:34522 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbgCYNfV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 09:35:21 -0400
IronPort-SDR: s4/atIEGdK55tLrJ0stdNUeDlB0BHl0tZC9CdD9x553SMqTRkS5Kfu58W7xrrPZXU1LV4flIE2
 YVhe2aTcVwvKjLsPNUcUC0OAvttQc6ZTnys2xQME80fKIqbe4VulJObpJKDNO+yvfneecOQSEn
 JZ0nuMOKrQM6kvp2dMJWhgva+hCK74pQASI0c7F3AtSEc63SjzYID467y1MjYpKMwtVJ5AJfj8
 ExTX8qEEuQe1HMvFYnPxO1yUB39naZ93gJ2iN30FBs3LWsD42B0Ya8AluQc/4ojZ+uILv7cTYu
 SbQ=
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; 
   d="scan'208";a="47143442"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 25 Mar 2020 05:35:20 -0800
IronPort-SDR: GKgDRLiGV15IK8G1I0YqRyI72z9oYvCwLmM6yhVHHJHaR+wlcexhH6bd/Clq8DIgyyi8W1Ls8j
 B62/bGwSmttIjNo+P3IzDgfoH+bREyXI4hFGrIDoHnMdD+Q/+2I4iEb50ad9QKCbRHt3cxYdyu
 Gvj3dwCm8AaJWUip2On+9+1iYBZ9oxXzm2LZKz7aDdCDBcuY8ZpTsIG7KILcEd+Phzu7wkD90O
 bzdBShFrPmyTVpGvKWDv6rBB0RlMd0vfkG9yDyvnMcCF52NiUkTiXKpR+6etZmbdmIhFsG/MIT
 KI4=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>, <rydberg@bitmath.org>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v9 25/55] Input: atmel_mxt_ts - refactor firmware flash to extract context into struct
Date:   Wed, 25 Mar 2020 06:33:04 -0700
Message-ID: <20200325133334.19346-26-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325133334.19346-1-jiada_wang@mentor.com>
References: <20200325133334.19346-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nick Dyer <nick.dyer@itdev.co.uk>

Refactor firmware flash to extract context into struct

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit 1bbe20ff3dcd6612e7942c495929eae5c138ece2)
Signed-off-by: George G. Davis <george_davis@mentor.com>
[jiada: Add commit description]
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 59 +++++++++++++++---------
 1 file changed, 36 insertions(+), 23 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 67931cf64629..2c4b68802bc3 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -291,6 +291,22 @@ struct mxt_cfg {
 	struct mxt_info info;
 };
 
+/* Firmware frame structure */
+struct mxt_fw_frame {
+	__be16 size;
+	u8 data[];
+};
+
+/* Firmware update context */
+struct mxt_flash {
+	const struct firmware *fw;
+	struct mxt_fw_frame *frame;
+	loff_t pos;
+	size_t frame_size;
+	unsigned int count;
+	unsigned int retry;
+};
+
 /* Each client has this additional data */
 struct mxt_data {
 	struct i2c_client *client;
@@ -3244,21 +3260,17 @@ static int mxt_check_firmware_format(struct device *dev,
 static int mxt_load_fw(struct device *dev)
 {
 	struct mxt_data *data = dev_get_drvdata(dev);
-	const struct firmware *fw = NULL;
-	unsigned int frame_size;
-	unsigned int pos = 0;
-	unsigned int retry = 0;
-	unsigned int frame = 0;
+	struct mxt_flash f = { 0, };
 	int ret;
 
-	ret = request_firmware(&fw, data->fw_name, dev);
+	ret = request_firmware(&f.fw, data->fw_name, dev);
 	if (ret) {
 		dev_err(dev, "Unable to open firmware %s\n", data->fw_name);
 		return ret;
 	}
 
 	/* Check for incorrect enc file */
-	ret = mxt_check_firmware_format(dev, fw);
+	ret = mxt_check_firmware_format(dev, f.fw);
 	if (ret)
 		goto release_firmware;
 
@@ -3312,41 +3324,42 @@ static int mxt_load_fw(struct device *dev)
 			goto disable_irq;
 	}
 
-	while (pos < fw->size) {
+	while (f.pos < f.fw->size) {
+		f.frame = (struct mxt_fw_frame *)(f.fw->data + f.pos);
+
 		ret = mxt_check_bootloader(data, MXT_WAITING_FRAME_DATA, true);
 		if (ret)
 			goto disable_irq;
 
-		frame_size = ((*(fw->data + pos) << 8) | *(fw->data + pos + 1));
-
 		/* Take account of CRC bytes */
-		frame_size += 2;
+		f.frame_size = __be16_to_cpu(f.frame->size) + 2U;
 
 		/* Write one frame to device */
-		ret = mxt_bootloader_write(data, fw->data + pos, frame_size);
+		ret = mxt_bootloader_write(data, f.fw->data + f.pos,
+					   f.frame_size);
 		if (ret)
 			goto disable_irq;
 
 		ret = mxt_check_bootloader(data, MXT_FRAME_CRC_PASS, true);
 		if (ret) {
-			retry++;
+			f.retry++;
 
 			/* Back off by 20ms per retry */
-			msleep(retry * 20);
+			msleep(f.retry * 20);
 
-			if (retry > 20) {
+			if (f.retry > 20) {
 				dev_err(dev, "Retry count exceeded\n");
 				goto disable_irq;
 			}
 		} else {
-			retry = 0;
-			pos += frame_size;
-			frame++;
+			f.retry = 0;
+			f.pos += f.frame_size;
+			f.count++;
 		}
 
-		if (frame % 50 == 0)
-			dev_dbg(dev, "Sent %d frames, %d/%zd bytes\n",
-				frame, pos, fw->size);
+		if (f.count % 50 == 0)
+			dev_dbg(dev, "Sent %u frames, %lld/%zu bytes\n",
+				f.count, f.pos, f.fw->size);
 	}
 
 	/* Wait for flash. */
@@ -3355,7 +3368,7 @@ static int mxt_load_fw(struct device *dev)
 	if (ret)
 		goto disable_irq;
 
-	dev_dbg(dev, "Sent %d frames, %d bytes\n", frame, pos);
+	dev_dbg(dev, "Sent %u frames, %lld bytes\n", f.count, f.pos);
 
 	/*
 	 * Wait for device to reset. Some bootloader versions do not assert
@@ -3369,7 +3382,7 @@ static int mxt_load_fw(struct device *dev)
 disable_irq:
 	disable_irq(data->irq);
 release_firmware:
-	release_firmware(fw);
+	release_firmware(f.fw);
 	return ret;
 }
 
-- 
2.17.1

