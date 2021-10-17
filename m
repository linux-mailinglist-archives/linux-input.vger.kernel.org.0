Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9FBF430B33
	for <lists+linux-input@lfdr.de>; Sun, 17 Oct 2021 19:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344403AbhJQR06 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Oct 2021 13:26:58 -0400
Received: from phobos.denx.de ([85.214.62.61]:45324 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344366AbhJQR06 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Oct 2021 13:26:58 -0400
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 2FEC48314C;
        Sun, 17 Oct 2021 19:24:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1634491487;
        bh=OEA1kHvs4tUOYlO70+WGG7uua7/7r6l6Z+Cu8cxyppM=;
        h=From:To:Cc:Subject:Date:From;
        b=inMP0QA+2SVxXTbD0mfQsKQDPBf21CwyhtvhOp99HyPqmP9sq/jb5Y/E0Sfp5uyv0
         sHCINLI4JvusMGen876AoZH00RK0wAE+CljDz0T37XUV2ko7X2E5t4+63qbXn76LhG
         xlaBvpdW160F8diu6jxXGHa1uvqou3+DXaqRiUfkb6JABlagxSf4K/0BUTNfoUK0/Z
         ww7cmiBYWkuAUd4TucQvU/jHqtdJwh3moZrC/d5RX5xWfxA2gGbjhOGLjBxMNm+FNl
         nmCG8zHTUfsFn0uhGIgZ/G/e99eOprZF9BmplOrGy1Mu5AXuQ7DUgPWwzC+JsvrU3h
         JDcZX87HKJN6w==
From:   Marek Vasut <marex@denx.de>
To:     linux-input@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: [PATCH] Input: ili210x - Make ili251x_firmware_to_buffer more generic
Date:   Sun, 17 Oct 2021 19:24:35 +0200
Message-Id: <20211017172435.47812-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Wrap request_ihex_firmware() and release_firmware() into function
ili251x_firmware_to_buffer(), since the ihex firmware is only used
within that function and it is not required outside of it.

This requires passing the firmware filename, but instead of adding yet
another parameter, add the firmware filename into struct ili2xxx_chip,
so other chips with different firmware filenames can also be updated
when their update support is in place. Rename the firmware parsing
function to ili210x_firmware_to_buffer as well.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Joe Hung <joe_hung@ilitek.com>
Cc: Luca Hsu <luca_hsu@ilitek.com>
---
 drivers/input/touchscreen/ili210x.c | 39 ++++++++++++++++++-----------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 867c13d3cb17..a6b647100250 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -49,6 +49,7 @@ struct ili2xxx_chip {
 				 unsigned int *x, unsigned int *y,
 				 unsigned int *z);
 	bool (*continue_polling)(const u8 *data, bool touch);
+	char *firmware_filename;
 	unsigned int max_touches;
 	unsigned int resolution;
 	bool has_calibrate_reg;
@@ -288,6 +289,7 @@ static const struct ili2xxx_chip ili251x_chip = {
 	.get_touch_data		= ili251x_read_touch_data,
 	.parse_touch_data	= ili251x_touchdata_to_coords,
 	.continue_polling	= ili251x_check_continue_polling,
+	.firmware_filename	= ILI251X_FW_FILENAME,
 	.max_touches		= 10,
 	.has_calibrate_reg	= true,
 	.has_firmware_proto	= true,
@@ -557,15 +559,25 @@ static ssize_t ili210x_calibrate(struct device *dev,
 }
 static DEVICE_ATTR(calibrate, S_IWUSR, NULL, ili210x_calibrate);
 
-static int ili251x_firmware_to_buffer(const struct firmware *fw,
+static int ili210x_firmware_to_buffer(struct device *dev,
 				      u8 **buf, u16 *ac_end, u16 *df_end)
 {
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
 	const struct ihex_binrec *rec;
 	u32 fw_addr, fw_last_addr = 0;
+	const struct firmware *fw;
 	u16 fw_len;
 	u8 *fw_buf;
 	int error;
 
+	error = request_ihex_firmware(&fw, priv->chip->firmware_filename, dev);
+	if (error) {
+		dev_err(dev, "Failed to request firmware %s, error=%d\n",
+			priv->chip->firmware_filename, error);
+		return error;
+	}
+
 	/*
 	 * The firmware ihex blob can never be bigger than 64 kiB, so make this
 	 * simple -- allocate a 64 kiB buffer, iterate over the ihex blob records
@@ -573,8 +585,10 @@ static int ili251x_firmware_to_buffer(const struct firmware *fw,
 	 * do all operations on this linear buffer.
 	 */
 	fw_buf = kzalloc(SZ_64K, GFP_KERNEL);
-	if (!fw_buf)
-		return -ENOMEM;
+	if (!fw_buf) {
+		error = -ENOMEM;
+		goto err_mem;
+	}
 
 	rec = (const struct ihex_binrec *)fw->data;
 	while (rec) {
@@ -599,10 +613,13 @@ static int ili251x_firmware_to_buffer(const struct firmware *fw,
 	/* DF end address is the last address in the firmware blob */
 	*df_end = fw_addr + fw_len;
 	*buf = fw_buf;
+	release_firmware(fw);
 	return 0;
 
 err_big:
 	kfree(fw_buf);
+err_mem:
+	release_firmware(fw);
 	return error;
 }
 
@@ -759,22 +776,13 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
 					     const char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev);
-	const char *fwname = ILI251X_FW_FILENAME;
-	const struct firmware *fw;
+	struct ili210x *priv = i2c_get_clientdata(client);
 	u16 ac_end, df_end;
 	u8 *fwbuf;
 	int error;
 	int i;
 
-	error = request_ihex_firmware(&fw, fwname, dev);
-	if (error) {
-		dev_err(dev, "Failed to request firmware %s, error=%d\n",
-			fwname, error);
-		return error;
-	}
-
-	error = ili251x_firmware_to_buffer(fw, &fwbuf, &ac_end, &df_end);
-	release_firmware(fw);
+	error = ili210x_firmware_to_buffer(dev, &fwbuf, &ac_end, &df_end);
 	if (error)
 		return error;
 
@@ -787,7 +795,8 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
 	 */
 	disable_irq(client->irq);
 
-	dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
+	dev_dbg(dev, "Firmware update started, firmware=%s\n",
+		priv->chip->firmware_filename);
 
 	ili251x_hardware_reset(dev);
 
-- 
2.33.0

