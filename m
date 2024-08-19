Return-Path: <linux-input+bounces-5643-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA5D9562D9
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 06:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 799031F21F5D
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 04:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8158015749A;
	Mon, 19 Aug 2024 04:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YW4rEh6B"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80F915667B;
	Mon, 19 Aug 2024 04:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724043516; cv=none; b=ur50dqhBKmFiT7XvgyNF+b02i/ixYc9ThXj50BnZJpGPVIIUBlyGORFh8ldEjndV2ho8Kexezziryj2d8eWLmbQ3eL0j+y5Wec0uEOtv0hVFTw+UMF06AQPDs8f+QEIiHO0xdFHWZCsyV6Mfog7eF/gWkBpNOhPbiXfbQPFIa6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724043516; c=relaxed/simple;
	bh=L1yNVVch7VynuUHiOZW+heZcQqH5t748josZ7A+DSBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tx6+59UwdetKFUP4hqrpY5Lruoif5hnmyfN0rgZr4be2dTy+rNTMUu8bJZptL+UE+st2mtAKJAidPEncprUP8mzpnBKZ/uLMfzDt/+pyrZ9l2LfULlqm2ZKmnZrLFSnNF4K5XSQXwjScPspshdPWAdTCG5CRZ7SItLbX0yZjXwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YW4rEh6B; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-6e7b121be30so2565095a12.1;
        Sun, 18 Aug 2024 21:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724043514; x=1724648314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbiMwPq3Y/nPoKn5NoCTFyPZoEyShBkGNc/6+CRLeBY=;
        b=YW4rEh6BnfsbdDacf9AT4+5H/Lo9KfzdRkNjurqUs+z4faKYLlXRa1pd0in2WB2VeC
         e6Qoi5aoiUgQv/VV7bs2xOeLVrekim51CA6qMvwv8s36ozgI3uIPezv1SAlWX+BUzuDf
         8LKZtsn55SkYN0oBGQDRemO4OkBDc9NhNEFEWruiksxD3LiUpAkp2pRBwRjZb3mtxL5F
         lXVX/Puqt3yUz9X6Xl6d7+IQ/1s+LOHHDoOSUkzpLIPSF8CftkQlFHXRUZ7QB+2wgs+p
         IiOzM10hFROkFQuW1AxKs6i0/m34dozB+vXnxIOrPI4RvxhOIluE+PlzVIPuk0a2kjRB
         F3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724043514; x=1724648314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbiMwPq3Y/nPoKn5NoCTFyPZoEyShBkGNc/6+CRLeBY=;
        b=vgfoSHwyjlHL9SbgNsWSR/Dj5qdwAXrmXyurnLS68MR9x+rcwRjtw2RpeRcD+x5lSU
         TAUVIfW9DlM5U2mm4VIVmWTTUvMllodAW6gbzKEIhcY2geGnyduRDPewHwt9uUcsu8j8
         Y+/HLnNHQLAUS7c9hs+fQ0+XSRzc1003+Idhx5+/erXRUvYAUwKSwIB/H996cV5Oi5D2
         g8Vx57Ny+HRsE/dU4ln938c0akS7BgWuMyVEzQER1k3D+TnyEGe194yu9ib+U4Lqr9U2
         Im1uWnion9nd9aLEV5ftSzsrKs9ov0SR33/gPjpNtoGckL5uCZe+/41311IfZsI1t7Ot
         hnyw==
X-Forwarded-Encrypted: i=1; AJvYcCWJtcMD9tPDBLf+spd2lq4flWNQf7/PYS8ck0GDXOlNDUKU1D93WrmiXg1bgUZheMNk6lpPwO17FIb285JMFRztw+TUnFwlk3+9+bE0nfZK696ld65QQnSvFtedtUR/oqjl5YIoJ1cW+B8RLTyTpkOweWdBDKiIju67FY0Xm/59ZWN7TojGr/LyOs2m
X-Gm-Message-State: AOJu0Yw0DBrDruzXNdLjsUKJ18oAzO3AplyKL0g67I4Oh9AUchCESMo6
	SqOJlU1zVleXZAD0R6ZHTuPTOWJUACpI+P4dTKwCfsiWy0Nr7/Vk
X-Google-Smtp-Source: AGHT+IFp6g7gj1q9g/hAQPH/hWIvrIWdD8isSKVV2meWPkpCAa22AHAmY/T8N9X055w0cjPiBY+Frw==
X-Received: by 2002:a05:6a20:2d29:b0:1c6:ac08:8dd2 with SMTP id adf61e73a8af0-1c904f913aemr10517941637.15.1724043513929;
        Sun, 18 Aug 2024 21:58:33 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-202068497b4sm43483445ad.269.2024.08.18.21.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 21:58:33 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 07/14] Input: samsung-keypad - use per-chip parameters
Date: Sun, 18 Aug 2024 21:58:04 -0700
Message-ID: <20240819045813.2154642-8-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of doing conditional logic based on the chip type, define
per-chip parameter structure, and reference it in the match data
(either of_device_id or platform_device_id).

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/samsung-keypad.c | 61 +++++++++++++++----------
 1 file changed, 37 insertions(+), 24 deletions(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index 71f5b85b02bd..ccc1186e43b6 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -44,8 +44,7 @@
 #define S5PV210_KEYIFSTSCLR_R_INT_OFFSET	16
 
 /* SAMSUNG_KEYIFCOL */
-#define SAMSUNG_KEYIFCOL_MASK			(0xff << 0)
-#define S5PV210_KEYIFCOLEN_MASK			(0xff << 8)
+#define SAMSUNG_KEYIFCOL_MASK			0xff
 
 /* SAMSUNG_KEYIFROW */
 #define SAMSUNG_KEYIFROW_MASK			(0xff << 0)
@@ -54,12 +53,12 @@
 /* SAMSUNG_KEYIFFC */
 #define SAMSUNG_KEYIFFC_MASK			(0x3ff << 0)
 
-enum samsung_keypad_type {
-	KEYPAD_TYPE_SAMSUNG,
-	KEYPAD_TYPE_S5PV210,
+struct samsung_chip_info {
+	unsigned int column_shift;
 };
 
 struct samsung_keypad {
+	const struct samsung_chip_info *chip;
 	struct input_dev *input_dev;
 	struct platform_device *pdev;
 	struct clk *clk;
@@ -68,7 +67,6 @@ struct samsung_keypad {
 	bool stopped;
 	bool wake_enabled;
 	int irq;
-	enum samsung_keypad_type type;
 	unsigned int row_shift;
 	unsigned int rows;
 	unsigned int cols;
@@ -83,13 +81,8 @@ static void samsung_keypad_scan(struct samsung_keypad *keypad,
 	unsigned int val;
 
 	for (col = 0; col < keypad->cols; col++) {
-		if (keypad->type == KEYPAD_TYPE_S5PV210) {
-			val = S5PV210_KEYIFCOLEN_MASK;
-			val &= ~(1 << col) << 8;
-		} else {
-			val = SAMSUNG_KEYIFCOL_MASK;
-			val &= ~(1 << col);
-		}
+		val = SAMSUNG_KEYIFCOL_MASK & ~(1 << col);
+		val <<= keypad->chip->column_shift;
 
 		writel(val, keypad->base + SAMSUNG_KEYIFCOL);
 		mdelay(1);
@@ -321,6 +314,7 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 {
 	const struct samsung_keypad_platdata *pdata;
 	const struct matrix_keymap_data *keymap_data;
+	const struct platform_device_id *id;
 	struct samsung_keypad *keypad;
 	struct resource *res;
 	struct input_dev *input_dev;
@@ -385,11 +379,17 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	keypad->stopped = true;
 	init_waitqueue_head(&keypad->wait);
 
-	if (pdev->dev.of_node)
-		keypad->type = of_device_is_compatible(pdev->dev.of_node,
-					"samsung,s5pv210-keypad");
-	else
-		keypad->type = platform_get_device_id(pdev)->driver_data;
+	keypad->chip = device_get_match_data(&pdev->dev);
+	if (!keypad->chip) {
+		id = platform_get_device_id(pdev);
+		if (id)
+			keypad->chip = (const void *)id->driver_data;
+	}
+
+	if (!keypad->chip) {
+		dev_err(&pdev->dev, "Unable to determine chip type");
+		return -EINVAL;
+	}
 
 	input_dev->name = pdev->name;
 	input_dev->id.bustype = BUS_HOST;
@@ -551,11 +551,24 @@ static const struct dev_pm_ops samsung_keypad_pm_ops = {
 		       samsung_keypad_runtime_resume, NULL)
 };
 
+static const struct samsung_chip_info samsung_s3c6410_chip_info = {
+	.column_shift = 0,
+};
+
+static const struct samsung_chip_info samsung_s5pv210_chip_info = {
+	.column_shift = 8,
+};
+
 #ifdef CONFIG_OF
 static const struct of_device_id samsung_keypad_dt_match[] = {
-	{ .compatible = "samsung,s3c6410-keypad" },
-	{ .compatible = "samsung,s5pv210-keypad" },
-	{},
+	{
+		.compatible = "samsung,s3c6410-keypad",
+		.data = &samsung_s3c6410_chip_info,
+	}, {
+		.compatible = "samsung,s5pv210-keypad",
+		.data = &samsung_s5pv210_chip_info,
+	},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, samsung_keypad_dt_match);
 #endif
@@ -563,12 +576,12 @@ MODULE_DEVICE_TABLE(of, samsung_keypad_dt_match);
 static const struct platform_device_id samsung_keypad_driver_ids[] = {
 	{
 		.name		= "samsung-keypad",
-		.driver_data	= KEYPAD_TYPE_SAMSUNG,
+		.driver_data	= (kernel_ulong_t)&samsung_s3c6410_chip_info,
 	}, {
 		.name		= "s5pv210-keypad",
-		.driver_data	= KEYPAD_TYPE_S5PV210,
+		.driver_data	= (kernel_ulong_t)&samsung_s5pv210_chip_info,
 	},
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(platform, samsung_keypad_driver_ids);
 
-- 
2.46.0.184.g6999bdac58-goog


