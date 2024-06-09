Return-Path: <linux-input+bounces-4279-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6D79018CA
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2024 01:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6AB11C209C0
	for <lists+linux-input@lfdr.de>; Sun,  9 Jun 2024 23:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37FAF558AD;
	Sun,  9 Jun 2024 23:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnlcAc7u"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A466C50289;
	Sun,  9 Jun 2024 23:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717976884; cv=none; b=XQyE1+HSQGX8j3uZXFmZ0MCra2YkHHuBoHqc9KNhFqV4XeBanxtzNcF8KpR3kc9EvvUtzOMV7UlspoeBHXhJHhyz4PkcOAxosoCQqkT3FAlVJ89zwg3wsUPmH8rFWebmz8OzQW/IR57NG/X1RGQPkCXBH0PN3pGy/d5liUn+zu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717976884; c=relaxed/simple;
	bh=DKv2KSUbajbBeFk/+WvtEMr49I8AUG8C5TkTqgVTMAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ieB+PcIz6SmUZVOmS2pUJvei9dAu1WWpLAP1cJOnIKGVJjdR8VLtmXhUSQ1/DgQRUFncNo4XaJWwR3DSuJyxAP+E/4D57ogs0z/vHFNkfoos9F4+W5ZVQGnwHQgqnL7du1tL5mZyR6wr7AB7dvYY5F4c1mX1oQhPy4A37+RkzU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnlcAc7u; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1f4c7b022f8so35780945ad.1;
        Sun, 09 Jun 2024 16:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717976881; x=1718581681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deffonCeETpFm3O0n+cl1BVpvVddVOwXMXSA9gXMWms=;
        b=cnlcAc7ub55YOcCQrK0E6khdunNNaFJudkdDTiIXM7EAkEAy/FnDCeemlhA0lpu4MF
         nxCGmQXeRgVTzn/QaXUsbI5y5Qwjfsj9C5aGOo8HT1y5wOS8FDjkoOZCPu6anYhuJvj+
         43DYZZ+otHZD4FC5pJ/1xZ628ssMDO/M/GhUN+7qFnK4OQWtwh1XtJyIuD04YJEQ8/Lm
         hPNG+4T0CB9Gybxuw2Fs3yUpj9p3ekstNB96b+2PPJT79ItB5dwCNMHNwvU5ohSjMzoG
         hY02TXBlhOzXuLJIZqFrBKPBE/s5HL5uJoLCxEr5M/gfR4x9jONZdD6xEHuKUIKk9g6j
         q7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717976881; x=1718581681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deffonCeETpFm3O0n+cl1BVpvVddVOwXMXSA9gXMWms=;
        b=emE6It/bMFbbYmEE/PZrs5I64IcuMho3c7axZ3VYlyOTnxf2qbsFjUJny1+44VYmOK
         3BWf1Sgt43MrhrDEH/V2mlLnLpgSTLm5QXl7GluY4RbyVTdrsKJaRH8/c4ja1f/HZ6Yx
         1z3NvT5OyTSdVsXmpY3wABxeB7ZcJODLYxgOiI96MrhFC0Z7c9ZK3ZexHipgHuLzsWKo
         NanrHE68E2cCngQtth9X1Ba7Gg1X3Dj0gnhcOW4idTI/RUtp4qu1UAW/+bR1w/D4mj2d
         inEfgbTavbNQ71zPsiN0ROmBMlv82i078xD22wTIXCU+WzsTOLpDThdyQdSdtGqokdDz
         tNLg==
X-Forwarded-Encrypted: i=1; AJvYcCW36ZJNq7ZYsJO4j5rIaqdLizojA5v0U3VFxKDnL2LeQrmsXjf3dPsJ2UqD7p9F3rbVfv4vb3WXPoT/z6h4xxfjxCYj1KzA0y5jOwNQ
X-Gm-Message-State: AOJu0Yyb4iwfIeAeHo3owsEkA7cLlvTNFsxaR6ScFQXvn1jYzoDa0edR
	T36zNK7Q9ZnP1wgYW+RFRyqn3GHy3lSq949ZodkcKvvhgoPY2wTW3cr7AA==
X-Google-Smtp-Source: AGHT+IGpm4F316SUSMV4HmInbnf0ogSh228MLzAggNIQoCuaRWW0lxQ7QG2QyfsLFD1LOdd3eXRzNA==
X-Received: by 2002:a17:903:234b:b0:1f6:3596:7c61 with SMTP id d9443c01a7336-1f6d02bff64mr99228015ad.2.1717976881210;
        Sun, 09 Jun 2024 16:48:01 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:55a9:13e9:dec7:f9d3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f84dac28sm27503285ad.158.2024.06.09.16.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 16:48:00 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: John Keeping <jkeeping@inmusicbrands.com>,
	Marek Vasut <marex@denx.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] Input: ili210x - switch to using cleanup functions in firmware code
Date: Sun,  9 Jun 2024 16:47:54 -0700
Message-ID: <20240609234757.610273-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
In-Reply-To: <20240609234757.610273-1-dmitry.torokhov@gmail.com>
References: <20240609234757.610273-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Start using __free() attributes to simplify the code and error handling.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/touchscreen/ili210x.c | 123 ++++++++++++++--------------
 1 file changed, 63 insertions(+), 60 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index f3c3ad70244f..55f3852c8dae 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -582,14 +582,12 @@ static ssize_t ili210x_calibrate(struct device *dev,
 }
 static DEVICE_ATTR(calibrate, S_IWUSR, NULL, ili210x_calibrate);
 
-static int ili251x_firmware_to_buffer(const struct firmware *fw,
-				      u8 **buf, u16 *ac_end, u16 *df_end)
+static const u8 *ili251x_firmware_to_buffer(const struct firmware *fw,
+					    u16 *ac_end, u16 *df_end)
 {
 	const struct ihex_binrec *rec;
 	u32 fw_addr, fw_last_addr = 0;
 	u16 fw_len;
-	u8 *fw_buf;
-	int error;
 
 	/*
 	 * The firmware ihex blob can never be bigger than 64 kiB, so make this
@@ -597,9 +595,9 @@ static int ili251x_firmware_to_buffer(const struct firmware *fw,
 	 * once, copy them all into this buffer at the right locations, and then
 	 * do all operations on this linear buffer.
 	 */
-	fw_buf = kvmalloc(SZ_64K, GFP_KERNEL);
+	u8* fw_buf __free(kvfree) = kvmalloc(SZ_64K, GFP_KERNEL);
 	if (!fw_buf)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	rec = (const struct ihex_binrec *)fw->data;
 	while (rec) {
@@ -607,10 +605,8 @@ static int ili251x_firmware_to_buffer(const struct firmware *fw,
 		fw_len = be16_to_cpu(rec->len);
 
 		/* The last 32 Byte firmware block can be 0xffe0 */
-		if (fw_addr + fw_len > SZ_64K || fw_addr > SZ_64K - 32) {
-			error = -EFBIG;
-			goto err_big;
-		}
+		if (fw_addr + fw_len > SZ_64K || fw_addr > SZ_64K - 32)
+			return ERR_PTR(-EFBIG);
 
 		/* Find the last address before DF start address, that is AC end */
 		if (fw_addr == 0xf000)
@@ -623,12 +619,8 @@ static int ili251x_firmware_to_buffer(const struct firmware *fw,
 
 	/* DF end address is the last address in the firmware blob */
 	*df_end = fw_addr + fw_len;
-	*buf = fw_buf;
-	return 0;
 
-err_big:
-	kvfree(fw_buf);
-	return error;
+	return_ptr(fw_buf);
 }
 
 /* Switch mode between Application and BootLoader */
@@ -691,7 +683,7 @@ static int ili251x_firmware_busy(struct i2c_client *client)
 	return 0;
 }
 
-static int ili251x_firmware_write_to_ic(struct device *dev, u8 *fwbuf,
+static int ili251x_firmware_write_to_ic(struct device *dev, const u8 *fwbuf,
 					u16 start, u16 end, u8 dataflash)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -776,47 +768,17 @@ static void ili210x_hardware_reset(struct gpio_desc *reset_gpio)
 	msleep(300);
 }
 
-static ssize_t ili210x_firmware_update_store(struct device *dev,
-					     struct device_attribute *attr,
-					     const char *buf, size_t count)
+static int ili210x_do_firmware_update(struct ili210x *priv,
+				      const u8 *fwbuf, u16 ac_end, u16 df_end)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct ili210x *priv = i2c_get_clientdata(client);
-	const char *fwname = ILI251X_FW_FILENAME;
-	const struct firmware *fw;
-	u16 ac_end, df_end;
-	u8 *fwbuf;
+	struct i2c_client *client = priv->client;
+	struct device *dev = &client->dev;
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
-	if (error)
-		return error;
-
-	/*
-	 * Disable touchscreen IRQ, so that we would not get spurious touch
-	 * interrupt during firmware update, and so that the IRQ handler won't
-	 * trigger and interfere with the firmware update. There is no bit in
-	 * the touch controller to disable the IRQs during update, so we have
-	 * to do it this way here.
-	 */
-	disable_irq(client->irq);
-
-	dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
-
-	ili210x_hardware_reset(priv->reset_gpio);
-
 	error = ili251x_firmware_reset(client);
 	if (error)
-		goto exit;
+		return error;
 
 	/* This may not succeed on first try, so re-try a few times. */
 	for (i = 0; i < 5; i++) {
@@ -826,7 +788,7 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
 	}
 
 	if (error)
-		goto exit;
+		return error;
 
 	dev_dbg(dev, "IC is now in BootLoader mode\n");
 
@@ -835,7 +797,7 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
 	error = ili251x_firmware_write_to_ic(dev, fwbuf, 0xf000, df_end, 1);
 	if (error) {
 		dev_err(dev, "DF firmware update failed, error=%d\n", error);
-		goto exit;
+		return error;
 	}
 
 	dev_dbg(dev, "DataFlash firmware written\n");
@@ -843,7 +805,7 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
 	error = ili251x_firmware_write_to_ic(dev, fwbuf, 0x2000, ac_end, 0);
 	if (error) {
 		dev_err(dev, "AC firmware update failed, error=%d\n", error);
-		goto exit;
+		return error;
 	}
 
 	dev_dbg(dev, "Application firmware written\n");
@@ -856,22 +818,63 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
 	}
 
 	if (error)
-		goto exit;
+		return error;
 
 	dev_dbg(dev, "IC is now in Application mode\n");
 
 	error = ili251x_firmware_update_cached_state(dev);
 	if (error)
-		goto exit;
+		return error;
 
-	error = count;
+	return 0;
+}
+
+static ssize_t ili210x_firmware_update_store(struct device *dev,
+					     struct device_attribute *attr,
+					     const char *buf, size_t count)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct ili210x *priv = i2c_get_clientdata(client);
+	const char *fwname = ILI251X_FW_FILENAME;
+	u16 ac_end, df_end;
+	int error;
+
+	const struct firmware *fw __free(firmware) = NULL;
+	error = request_ihex_firmware(&fw, fwname, dev);
+	if (error) {
+		dev_err(dev, "Failed to request firmware %s, error=%d\n",
+			fwname, error);
+		return error;
+	}
+
+	const u8* fwbuf __free(kvfree) =
+			ili251x_firmware_to_buffer(fw, &ac_end, &df_end);
+	error = PTR_ERR_OR_ZERO(fwbuf);
+	if (error)
+		return error;
+
+	/*
+	 * Disable touchscreen IRQ, so that we would not get spurious touch
+	 * interrupt during firmware update, and so that the IRQ handler won't
+	 * trigger and interfere with the firmware update. There is no bit in
+	 * the touch controller to disable the IRQs during update, so we have
+	 * to do it this way here.
+	 */
+	disable_irq(client->irq);
+
+	dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
+
+	ili210x_hardware_reset(priv->reset_gpio);
+
+	error = ili210x_do_firmware_update(priv, fwbuf, ac_end, df_end);
 
-exit:
 	ili210x_hardware_reset(priv->reset_gpio);
+
 	dev_dbg(dev, "Firmware update ended, error=%i\n", error);
+
 	enable_irq(client->irq);
-	kvfree(fwbuf);
-	return error;
+
+	return error ?: count;
 }
 
 static DEVICE_ATTR(firmware_update, 0200, NULL, ili210x_firmware_update_store);
-- 
2.45.2.505.gda0bf45e8d-goog


