Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2FF415A391
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 09:45:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbgBLIo6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 03:44:58 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:29711 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728493AbgBLIo6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 03:44:58 -0500
IronPort-SDR: t+FBzItMqP1D370gev4Up3EGcP2zueTW8cFjhuFjl7lwTW6qK+G5V8apQ8beorhm4jLTWr4gMY
 APxJyH3xN7ugzKSCINj7ukq9pKw8VIIPOefBTpv6ZTX33FwPpasbhhdCvFtXofyVU4HD8QL6cU
 j7S0dMLMqBX2qk8Vh27UfFzzoY4HDeJfddI8M5vYUtfrvtEt9HnG4Jv+4p6HWzN+2pP1EdBnQn
 VGFfmK7rPHdkw2CSnZJBM3R/8MwyBG3DMa48WwB7OOq5TIZZ/p8Erg50AsDD/BP8mw4pZQLUe6
 e/8=
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; 
   d="scan'208";a="47667032"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 12 Feb 2020 00:44:56 -0800
IronPort-SDR: d2dLF8SrtTUQ17GivWzp1RlLKMOnhjK5VXMA3jIZdWuiIeQtAXOGPZBfVjMqWcqVg9f3zwjwZP
 ceUTV0rxgJRXPOxgVjhMAkZoh+n2BlzaZ3zycl/rr7IOYLoa7ke1200dmBciTXw0RlmQU5xA7A
 Dk1qxPplPK0V/4MY7mZD7S0QZ83sPzJEv+iycOwxb3Ns4tXlA0/Hp3FMwhLICJM5IzmWR6rzic
 nwwgQBDg0x9D0hLEOCqEIrKkVVxM5/im4+X7DVcyVxC/tq7I8fZeFjb/+pATcGjO4DlZXbB6YE
 ew4=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>,
        <nick@shmanahar.org>, <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v7 19/48] Input: atmel_mxt_ts - refactor firmware flash to extract context into struct
Date:   Wed, 12 Feb 2020 00:41:49 -0800
Message-ID: <20200212084218.32344-20-jiada_wang@mentor.com>
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

Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
(cherry picked from ndyer/linux/for-upstream commit 1bbe20ff3dcd6612e7942c495929eae5c138ece2)
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 59 +++++++++++++++---------
 1 file changed, 36 insertions(+), 23 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index 7abaca26dcba..3c5058cfc012 100644
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

