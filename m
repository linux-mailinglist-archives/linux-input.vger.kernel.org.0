Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40AC0E821F
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2019 08:22:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730933AbfJ2HVY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Oct 2019 03:21:24 -0400
Received: from esa3.mentor.iphmx.com ([68.232.137.180]:41262 "EHLO
        esa3.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730885AbfJ2HVY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Oct 2019 03:21:24 -0400
IronPort-SDR: H0OJMKnMxuP0Rd0IRhQpbsDRHP9dyMUiyK/XEAbKuYTkoSPJor0Cle1dnwB/4UW69cZR3tkleT
 IeyBbc8zaksY5L7UCE1OGnfwLdWjxENyshQhnk4VHF4g7lpOo9DwTQvMgwVdNcWGAlsZerPG+S
 RDS5st1lJTOrL7mnt8ALg80Owi5bLgnw4EYt8a1PbBgPkSNhJTXVjLiOCJ8Vbhs8TtPEhsF+/Q
 U/Uso2qFcA8yLK4o+DXWXhDCVhOGNVf0LdyfzjkJogTCWk+uu5JZA8oT+D/sgrc/yrI/OZLS4V
 bOg=
X-IronPort-AV: E=Sophos;i="5.68,243,1569312000"; 
   d="scan'208";a="42663248"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa3.mentor.iphmx.com with ESMTP; 28 Oct 2019 23:21:23 -0800
IronPort-SDR: Pfb13oft8jr0D3b/IvoNTAzTOQHSj5UJZ+zui/TlugWb+1rN7rj9sLwWoBv0JVhNlsXgQXl2bD
 fvlmmlgEaQB6tAHWgNFxvSCXlPNRXAUUwb1l3vA90pzKAm4WXCJXyEs7ptD3LKEUYojiul3D5e
 ddFx1E9JP3tlvFPwNHWK22gAyDGMnG/t3Ebwi9kZUP+55ujObOdGdBwmVxiF5GuSM9KzORoZ8o
 T5yrWAcAqAvB9KVyZxEz7AO0UUyf6xmscSpLlCuF7tE0PUK7aI+sHbjnosFa0pDxGQOBVzzMbU
 0CI=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <rydberg@bitmath.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <erosca@de.adit-jv.com>,
        <Andrew_Gabbasov@mentor.com>
Subject: [PATCH v4 19/48] Input: atmel_mxt_ts - refactor firmware flash to extract context into struct
Date:   Tue, 29 Oct 2019 16:19:41 +0900
Message-ID: <20191029072010.8492-20-jiada_wang@mentor.com>
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
(cherry picked from ndyer/linux/for-upstream commit 1bbe20ff3dcd6612e7942c495929eae5c138ece2)
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 59 +++++++++++++++---------
 1 file changed, 36 insertions(+), 23 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index f55d1f719f18..855c36e7903d 100644
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

