Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03EC61CA337
	for <lists+linux-input@lfdr.de>; Fri,  8 May 2020 07:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbgEHF6q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 May 2020 01:58:46 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:38715 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728025AbgEHF6p (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 May 2020 01:58:45 -0400
IronPort-SDR: HmIP7Nv1cFb6mB1nPz9E2pcK+TFTaEyROys2FWtAHsbogEKM/e7nzPw6j8OyZ3BZ2/ddfkYefw
 GYtAJ1tMqRKEp6YQTWhmhANrssJVpuUywsNESr9XjPMmziir0bL/We3ZHUqhXXm8eCxL37bjHB
 7FL/pNJ6z7w8myfC8VLHwsExGGln0N5gazf96+W1T/khn3KnHF+1HuA+M8S4CYzbWpuwFDvFwo
 wQj6/2+58GxLD5Od5Ik1vyYTcSMMwOYBX65FX6nAmkTe+ov4vUhG1hrGRoCB1Dh+s159X2cC2/
 oBE=
X-IronPort-AV: E=Sophos;i="5.73,366,1583222400"; 
   d="scan'208";a="50670102"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 07 May 2020 21:58:42 -0800
IronPort-SDR: Dovf0Zltps35i24+B4fT2Hb0aNvonZO0OQFkaUR1Pf8vexF/yHxpJHvOaVvfsDA3L5rSjBhFdx
 Q1NdD3PVi3gHWL2DqIpCHlDMuj8FT+ZI5cHLz6tieNhbyOVEEaGoYWh5MDW8n7gsJSpLLZwJm5
 TrGvmw0nd5UoeZTOqvSm2VfaSCKsCc2JKwBt5rOJ9H6niPIkxgBTm/tm8b7psZEtplXY2GCURv
 Rwy6H2NO2wb+GJbpzYIV1XE/UbvbO/ikTkg2MKbVmHHsV4bPLYDSvGLl20hL1FBUP8Bq84sg2Y
 IiQ=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>,
        <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <bsz@semihalf.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <erosca@de.adit-jv.com>, <Andrew_Gabbasov@mentor.com>,
        <jiada_wang@mentor.com>
Subject: [PATCH v11 27/56] Input: atmel_mxt_ts - refactor firmware flash to extract context into struct
Date:   Thu, 7 May 2020 22:56:27 -0700
Message-ID: <20200508055656.96389-28-jiada_wang@mentor.com>
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
index c3dd6c486c12..bb4fc13defea 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -292,6 +292,22 @@ struct mxt_cfg {
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
@@ -3240,21 +3256,17 @@ static int mxt_check_firmware_format(struct device *dev,
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
 
@@ -3308,41 +3320,42 @@ static int mxt_load_fw(struct device *dev)
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
@@ -3351,7 +3364,7 @@ static int mxt_load_fw(struct device *dev)
 	if (ret)
 		goto disable_irq;
 
-	dev_dbg(dev, "Sent %d frames, %d bytes\n", frame, pos);
+	dev_dbg(dev, "Sent %u frames, %lld bytes\n", f.count, f.pos);
 
 	/*
 	 * Wait for device to reset. Some bootloader versions do not assert
@@ -3365,7 +3378,7 @@ static int mxt_load_fw(struct device *dev)
 disable_irq:
 	disable_irq(data->irq);
 release_firmware:
-	release_firmware(fw);
+	release_firmware(f.fw);
 	return ret;
 }
 
-- 
2.17.1

