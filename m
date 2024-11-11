Return-Path: <linux-input+bounces-8022-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A72E29C46B7
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 21:24:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37C381F26E00
	for <lists+linux-input@lfdr.de>; Mon, 11 Nov 2024 20:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2061BC9FB;
	Mon, 11 Nov 2024 20:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJoLJzb7"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08641BC072;
	Mon, 11 Nov 2024 20:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731356416; cv=none; b=nwL7VKwd1LbQDz7fojEJKy4NTetF68k9oLpSiP8nansml4FSw6vLNhYTHq1g8Z3/O5P2Hp5bdoSWPbBzUqyuuZngTRGWTeq5VR/FHS8CAsDKDhc26LmRDJYUBoGyxfkrQHrqzAzWPlqDtc2zjadqZnydKwDni1vx//joPOxGcfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731356416; c=relaxed/simple;
	bh=6857JwSCQRpzyQtHL/jCFZGzYiUxxBCIr/phZ/AHWtI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p4kui09bLOTC1/6V6nQN+ZM4xDtZT4nzMJ6qHTZ/Kp+MNXJjI6oMxha5SYUl/bVIm86IF1IVapVEwyt+Oil8mIhIpJ2QLpsqmbC4LzAy+0k+sd+L1+5YB1DIbrU95M9te+U78oc+Jr9JTLXji7TyXzdOs0yOls4N9dfykMG00+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJoLJzb7; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3e5f9712991so2358940b6e.2;
        Mon, 11 Nov 2024 12:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731356414; x=1731961214; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZT8cZb0lU9VSpQJGoiSAuwjvh30ekz5+VBfmhxcRZUY=;
        b=gJoLJzb7rXVThXH+mIfUK0AgBKOa8x8HYPpXee1g6iX5gIUT2I1LWKHVt0+pUCo4XS
         ksLO4pDL6KFZk0Hk6QuRoEivyfrsrdYDynYa8MC6R2CYZi12wzwK5ncf4Ev3oqaFTtL3
         se0PVudnY6SFN/PlwhnxVgx4MLGTooS2To4BNsuVbvef0bJuKoFKB8AjEvf1IgcVMHTY
         K6zPcJa2DmiIUu4E3Q9bKPwAcVkQnkDBuvJ1k2QTxEEebfo5DxVQREBIFmQ8eP4roGlu
         9bxd5ge/lQW5CDd5+QT23PxWVuyoZYSdNUFFv//E/sKV0Qn4HGMbKQ8Hi+ImbzgEx4A3
         9F8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731356414; x=1731961214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZT8cZb0lU9VSpQJGoiSAuwjvh30ekz5+VBfmhxcRZUY=;
        b=ovbsNMV7Yn/hIQ76E7Wtgslg2miwpclJ1p3ibOjWPgZS27dLXqYM3T5b+/rror1Ohc
         w42sY7sfKq1lO7J/H0/AwoantRQnsaX79lwRYGVbblQz/4cQz2LgPnYeg5Zx/jrn885T
         f/m4jJIWJizWXvoxojh6/fhoFO3z1/rUWnpCNEoaj+RRu98YHm0ANruJb4c9c548Tb69
         92zmy7KUoNFSPWskZHGuGgC+dbgtSucV4sMUVzyZINKEO05fYHgBtwAUsqs/E6p6WexV
         TGVWBLQsM9bBO7gxYx1mbCCf7bAyBWIiwfrvomzvx8RoFU2EeiKNZBNvNZNJkxmNKR+Z
         10yw==
X-Forwarded-Encrypted: i=1; AJvYcCUjWA6SFAyABQJ+4Wdjl+oJJ6/NFTzZNfIeTM1qunZ5cBYULABj19o8TcyFF25RA1+hwDvqPTsuuKAGDb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFLady6lL2VHi8c2mN8G17tOECsHbE7/J4TWjvGCzPHAX2Cl4k
	wVpaVyAQGCuNb1GWhVz9lBxxRuyTpRmV3nxmEv4VOgcxAPsEpVua
X-Google-Smtp-Source: AGHT+IHjZA9r6/Zf7IdbYK3FB+YPdxORPtheGrzyrtK3TEobO2TbsmFvJxHWN1KGSKR1NlQnp8aZmg==
X-Received: by 2002:a05:6808:120e:b0:3e0:4db9:8c44 with SMTP id 5614622812f47-3e79470a35bmr13066261b6e.27.1731356413729;
        Mon, 11 Nov 2024 12:20:13 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961ed242sm63254846d6.34.2024.11.11.12.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 12:20:13 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: dmitry.torokhov@gmail.com,
	broonie@opensource.wolfsonmicro.com,
	kgene.kim@samsung.com,
	kyungmin.park@samsung.com,
	jy0922.shim@samsung.com,
	vkoul@kernel.org,
	arnd@arndb.de,
	nikita.shubin@maquefel.me,
	hartleys@visionengravers.com,
	christophe.jaillet@wanadoo.fr,
	shiraz.linux.kernel@gmail.com,
	rajeev-dlh.kumar@st.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] Input: samsung-keypad - Add check for clk_enable()
Date: Mon, 11 Nov 2024 20:20:05 +0000
Message-Id: <20241111202006.6669-2-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241111202006.6669-1-jiashengjiangcool@gmail.com>
References: <20241111202006.6669-1-jiashengjiangcool@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check for the return value of clk_enable() in order to catch the
potential exception.

Moreover, recursively convert the return type of samsung_keypad_start()
and samsung_keypad_toggle_wakeup() into int and check their return values.

Fixes: 48c98b1bb85a ("Input: samsung-keypad - implement runtime power management support")
Fixes: 0fffed27f92d ("Input: samsung-keypad - Add samsung keypad driver")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/input/keyboard/samsung-keypad.c | 43 +++++++++++++++++--------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index e212eff7687c..f9bbd4e9d031 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -169,16 +169,19 @@ static irqreturn_t samsung_keypad_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void samsung_keypad_start(struct samsung_keypad *keypad)
+static int samsung_keypad_start(struct samsung_keypad *keypad)
 {
 	unsigned int val;
+	int ret;
 
 	pm_runtime_get_sync(&keypad->pdev->dev);
 
 	/* Tell IRQ thread that it may poll the device. */
 	keypad->stopped = false;
 
-	clk_enable(keypad->clk);
+	ret = clk_enable(keypad->clk);
+	if (ret)
+		return ret;
 
 	/* Enable interrupt bits. */
 	val = readl(keypad->base + SAMSUNG_KEYIFCON);
@@ -189,6 +192,8 @@ static void samsung_keypad_start(struct samsung_keypad *keypad)
 	writel(0, keypad->base + SAMSUNG_KEYIFCOL);
 
 	pm_runtime_put(&keypad->pdev->dev);
+
+	return 0;
 }
 
 static void samsung_keypad_stop(struct samsung_keypad *keypad)
@@ -225,9 +230,7 @@ static int samsung_keypad_open(struct input_dev *input_dev)
 {
 	struct samsung_keypad *keypad = input_get_drvdata(input_dev);
 
-	samsung_keypad_start(keypad);
-
-	return 0;
+	return samsung_keypad_start(keypad);
 }
 
 static void samsung_keypad_close(struct input_dev *input_dev)
@@ -484,11 +487,14 @@ static int samsung_keypad_runtime_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct samsung_keypad *keypad = platform_get_drvdata(pdev);
 	unsigned int val;
+	int ret;
 
 	if (keypad->stopped)
 		return 0;
 
-	clk_enable(keypad->clk);
+	ret = clk_enable(keypad->clk);
+	if (ret)
+		return ret;
 
 	val = readl(keypad->base + SAMSUNG_KEYIFCON);
 	val &= ~SAMSUNG_KEYIFCON_WAKEUPEN;
@@ -500,12 +506,15 @@ static int samsung_keypad_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static void samsung_keypad_toggle_wakeup(struct samsung_keypad *keypad,
+static int samsung_keypad_toggle_wakeup(struct samsung_keypad *keypad,
 					 bool enable)
 {
 	unsigned int val;
+	int ret;
 
-	clk_enable(keypad->clk);
+	ret = clk_enable(keypad->clk);
+	if (ret)
+		return ret;
 
 	val = readl(keypad->base + SAMSUNG_KEYIFCON);
 	if (enable) {
@@ -520,6 +529,8 @@ static void samsung_keypad_toggle_wakeup(struct samsung_keypad *keypad,
 	writel(val, keypad->base + SAMSUNG_KEYIFCON);
 
 	clk_disable(keypad->clk);
+
+	return 0;
 }
 
 static int samsung_keypad_suspend(struct device *dev)
@@ -527,17 +538,18 @@ static int samsung_keypad_suspend(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct samsung_keypad *keypad = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = keypad->input_dev;
+	int ret;
 
 	mutex_lock(&input_dev->mutex);
 
 	if (input_device_enabled(input_dev))
 		samsung_keypad_stop(keypad);
 
-	samsung_keypad_toggle_wakeup(keypad, true);
+	ret = samsung_keypad_toggle_wakeup(keypad, true);
 
 	mutex_unlock(&input_dev->mutex);
 
-	return 0;
+	return ret;
 }
 
 static int samsung_keypad_resume(struct device *dev)
@@ -545,17 +557,22 @@ static int samsung_keypad_resume(struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct samsung_keypad *keypad = platform_get_drvdata(pdev);
 	struct input_dev *input_dev = keypad->input_dev;
+	int ret;
 
 	mutex_lock(&input_dev->mutex);
 
-	samsung_keypad_toggle_wakeup(keypad, false);
+	ret = samsung_keypad_toggle_wakeup(keypad, false);
+	if (ret) {
+		mutex_unlock(&input_dev->mutex);
+		return ret;
+	}
 
 	if (input_device_enabled(input_dev))
-		samsung_keypad_start(keypad);
+		ret = samsung_keypad_start(keypad);
 
 	mutex_unlock(&input_dev->mutex);
 
-	return 0;
+	return ret;
 }
 
 static const struct dev_pm_ops samsung_keypad_pm_ops = {
-- 
2.25.1


