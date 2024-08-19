Return-Path: <linux-input+bounces-5648-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1591D9562EF
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 07:01:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 397A71C212F1
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 05:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2081215A864;
	Mon, 19 Aug 2024 04:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P7+n3VhK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FDE159217;
	Mon, 19 Aug 2024 04:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724043523; cv=none; b=ihbzy4Ilz6cFXXuVFZivzaUEWFLD/yrlUQgDdOrFFMm7Wu1VaavkSZfr+Mvs3Jxvl5EPdPLuM5ht1pByaC05Go0H9BRY47p8jkq1+lq8BV4mmzUlxWGPMMtYyQClZ9FOJGlN2WGtEsjlxRBPj4ALktHY0VyHdRtc0awZPoOaPBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724043523; c=relaxed/simple;
	bh=sM7+5/or5kXiavB2qY8+Jl/DwHhncIpJwdyy49AMsnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fL5a5NQByehTmQAH4TpvG3dbw4HSvxv1CB4LdfiewGlU7n+ne7aDoK0ahWpwX2ffJkwwrsJtDHxc1WvGAV318epQlb5BQL8A8g9U6bMan4TIWrRWi/kArZdPv99+VwLnPUbrm6inl3e60n2KjzACqydweZkE7LyWx7g2H6jCCDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P7+n3VhK; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fec34f94abso32565645ad.2;
        Sun, 18 Aug 2024 21:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724043520; x=1724648320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUndIWERZKRj9I2TwNCsJPKiHZoV4U6VZkZuTz/CWC4=;
        b=P7+n3VhKnlX0zi7aoJVZB+MOGF6s2GLlRqMoWANESZ+9FTE0H13sIZ8NNYcwAgAIgZ
         AL5syw0OHb5jDPSUoU+FsuNtiKlIYdbktADoj9tb8X8Q6DkU624Bh8YrWHKy8Xhm9yzr
         h4m/mnEfIBJA98nrAZy37tXDod0x/sSuUSYNUc9uwDmwGiXijISEz0L6PrXyuPvi2WaT
         ZdOjVxXT50yUCVLAiNdcPCKUgFWHcG7XeBAHZnlIdZyv03eTYHKt9bzh+o6fXrelNLvJ
         ErwzyAv7VEMbQTrqkr03yxi+SrO4T4Zawbjetjn0RY8CapF2sFX84jYvDMJcR/ORpRSw
         bwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724043520; x=1724648320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUndIWERZKRj9I2TwNCsJPKiHZoV4U6VZkZuTz/CWC4=;
        b=C7MNuhQq+TPMol2lwh1k/TG3QQHvIr03G92dda3VAVb3KrXyacshV7xPwYVFTOPEXE
         YbsLA9LxMzVrTR3OBQmGCRQ4R3y9ajN9e6eOaQukokAvYiRnaoIljCa4CbY4Ki2y+rXI
         KkM4rmgTGtvYgk5koB8woFOveJ0wsFXLBVRNElQklauzsCV8O//yAVbsszGsn6Lug1Et
         qeeLTYsapecUfbfzIxrfMmYRuveFQob4hTdlV9Q299H/EaJ3L4e/L9pjrd6bD8PzdUuZ
         bZ5O80ukcaP61NadNQkTMI58AOOVOS44f012TD1+Nqrc+x0pc1O3StKcdt9F45vb0jJs
         I2+A==
X-Forwarded-Encrypted: i=1; AJvYcCXctjQ8hbCwICvoU4VB2S+zoI9oKGkkvmqFCGrhL8YXbyrux7bCNombwz3eJ/xukAh4JLJ1dfnlWMvpFN4lNr5Gwf5pbxWnCJkKwXinRDx/yTu03/4Xo87BJ7HmwOuVpnyrSyZWkJejpJnaqTN97zR5O0feURfFob/iVw9n7qEWtdLJINmp805BwSdp
X-Gm-Message-State: AOJu0Yy1YbJql3MR2Xx0OIjC41r2Kg3SQhLI5VIOJm1eAh2v00EXJ8pe
	UFs1jOaFFOAak8viYwmwCzc8kwvbDl5v9bfpo2c/AHDFCsaHh1bP
X-Google-Smtp-Source: AGHT+IE8wP1IODXwo9Jr5pjb8LD7AgNjePF3eWo7XxmUYWOTaK20CLj2D3LT7nPWl3GEhcIqE16bMA==
X-Received: by 2002:a17:902:d10b:b0:1fb:6d12:2c1c with SMTP id d9443c01a7336-20203e9b06emr68765385ad.19.1724043520237;
        Sun, 18 Aug 2024 21:58:40 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-202068497b4sm43483445ad.269.2024.08.18.21.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 21:58:39 -0700 (PDT)
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
Subject: [PATCH 12/14] Input: samsung-keypad - remove support for platform data
Date: Sun, 18 Aug 2024 21:58:09 -0700
Message-ID: <20240819045813.2154642-13-dmitry.torokhov@gmail.com>
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

Because there are no more users of samsung_keypad_platdata left in
the kernel remove support for it from the driver.

The driver supports generic device properties so all configuration
should be done using them instead of a custom platform data.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/samsung-keypad.c | 190 +++++++++---------------
 include/linux/input/samsung-keypad.h    |  39 -----
 2 files changed, 70 insertions(+), 159 deletions(-)
 delete mode 100644 include/linux/input/samsung-keypad.h

diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index df2427ac63d7..78fa55498fc3 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/input.h>
+#include <linux/input/matrix_keypad.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -21,7 +22,9 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/sched.h>
-#include <linux/input/samsung-keypad.h>
+
+#define SAMSUNG_MAX_ROWS			8
+#define SAMSUNG_MAX_COLS			8
 
 #define SAMSUNG_KEYIFCON			0x00
 #define SAMSUNG_KEYIFSTSCLR			0x04
@@ -231,84 +234,43 @@ static void samsung_keypad_close(struct input_dev *input_dev)
 	samsung_keypad_stop(keypad);
 }
 
-static const struct matrix_keymap_data *
-samsung_parse_verbose_keymap(struct device *dev)
+static int samsung_keypad_parse_keymap(struct samsung_keypad *keypad)
 {
-	struct matrix_keymap_data *keymap_data;
+	struct matrix_keymap_data keymap_data = { 0 };
+	struct device *dev = &keypad->pdev->dev;
 	struct fwnode_handle *child;
 	u32 *keymap;
 	unsigned int key_count;
-
-	keymap_data = devm_kzalloc(dev, sizeof(*keymap_data), GFP_KERNEL);
-	if (!keymap_data) {
-		dev_err(dev, "could not allocate memory for keymap data\n");
-		return ERR_PTR(-ENOMEM);
-	}
+	int retval;
 
 	key_count = device_get_child_node_count(dev);
-	keymap = devm_kcalloc(dev, key_count, sizeof(*keymap), GFP_KERNEL);
-	if (!keymap) {
-		dev_err(dev, "could not allocate memory for keymap\n");
-		return ERR_PTR(-ENOMEM);
-	}
-
-	keymap_data->keymap_size = key_count;
-	keymap_data->keymap = keymap;
-
-	device_for_each_child_node(dev, child) {
-		u32 row, col, key_code;
-
-		fwnode_property_read_u32(child, "keypad,row", &row);
-		fwnode_property_read_u32(child, "keypad,column", &col);
-		fwnode_property_read_u32(child, "linux,code", &key_code);
-
-		*keymap++ = KEY(row, col, key_code);
-	}
-
-	return keymap_data;
-}
-
-static const struct samsung_keypad_platdata *
-samsung_keypad_parse_properties(struct device *dev)
-{
-	const struct matrix_keymap_data *keymap_data;
-	struct samsung_keypad_platdata *pdata;
-	u32 num_rows = 0, num_cols = 0;
-	int error;
+	if (key_count) {
+		keymap = kcalloc(key_count, sizeof(*keymap), GFP_KERNEL);
+		if (!keymap) {
+			dev_err(dev, "could not allocate memory for keymap\n");
+			return -ENOMEM;
+		}
 
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata) {
-		dev_err(dev, "could not allocate memory for platform data\n");
-		return ERR_PTR(-ENOMEM);
-	}
+		keymap_data.keymap = keymap;
+		keymap_data.keymap_size = key_count;
 
-	device_property_read_u32(dev, "samsung,keypad-num-rows", &num_rows);
-	device_property_read_u32(dev, "samsung,keypad-num-columns", &num_cols);
+		device_for_each_child_node(dev, child) {
+			u32 row, col, key_code;
 
-	error = matrix_keypad_parse_properties(dev, &num_rows, &num_cols);
-	if (error)
-		return ERR_PTR(error);
+			fwnode_property_read_u32(child, "keypad,row", &row);
+			fwnode_property_read_u32(child, "keypad,column", &col);
+			fwnode_property_read_u32(child, "linux,code", &key_code);
 
-	pdata->rows = num_rows;
-	pdata->cols = num_cols;
-
-	if (!device_property_present(dev, "linux,keymap")) {
-		keymap_data = samsung_parse_verbose_keymap(dev);
-		if (IS_ERR(keymap_data))
-			return ERR_CAST(keymap_data);
-
-		pdata->keymap_data = keymap_data;
+			*keymap++ = KEY(row, col, key_code);
+		}
 	}
 
-
-	pdata->no_autorepeat =
-		device_property_read_bool(dev, "linux,input-no-autorepeat");
-
-	pdata->wakeup = device_property_read_bool(dev, "wakeup-source") ||
-			/* legacy name */
-			device_property_read_bool(dev, "linux,input-wakeup");
-
-	return pdata;
+	retval = matrix_keypad_build_keymap(key_count ? &keymap_data : NULL,
+					    NULL, keypad->rows, keypad->cols,
+					    keypad->keycodes,
+					    keypad->input_dev);
+	kfree(keymap_data.keymap);
+	return retval;
 }
 
 static void samsung_disable_runtime_pm(void *data)
@@ -320,68 +282,39 @@ static void samsung_disable_runtime_pm(void *data)
 
 static int samsung_keypad_probe(struct platform_device *pdev)
 {
-	const struct samsung_keypad_platdata *pdata;
 	const struct platform_device_id *id;
+	struct device *dev = &pdev->dev;
 	struct samsung_keypad *keypad;
 	struct resource *res;
 	struct input_dev *input_dev;
 	unsigned int row_shift;
+	u32 num_rows = 0, num_cols = 0;
+	bool wakeup;
 	int error;
 
-	pdata = dev_get_platdata(&pdev->dev);
-	if (pdata) {
-		if (!pdata->keymap_data) {
-			dev_err(&pdev->dev, "no keymap data defined\n");
-			return -EINVAL;
-		}
-	} else {
-		pdata = samsung_keypad_parse_properties(&pdev->dev);
-		if (IS_ERR(pdata))
-			return PTR_ERR(pdata);
-	}
+	device_property_read_u32(dev, "samsung,keypad-num-rows", &num_rows);
+	device_property_read_u32(dev, "samsung,keypad-num-columns", &num_cols);
 
-	if (!pdata->rows || pdata->rows > SAMSUNG_MAX_ROWS)
-		return -EINVAL;
+	error = matrix_keypad_parse_properties(dev, &num_rows, &num_cols);
+	if (error)
+		return error;
 
-	if (!pdata->cols || pdata->cols > SAMSUNG_MAX_COLS)
+	if (num_rows > SAMSUNG_MAX_ROWS || num_cols > SAMSUNG_MAX_COLS)
 		return -EINVAL;
 
-	/* initialize the gpio */
-	if (pdata->cfg_gpio)
-		pdata->cfg_gpio(pdata->rows, pdata->cols);
-
-	row_shift = get_count_order(pdata->cols);
+	row_shift = get_count_order(num_cols);
 
 	keypad = devm_kzalloc(&pdev->dev,
 			      struct_size(keypad, keycodes,
-					  pdata->rows << row_shift),
+					  num_rows << row_shift),
 			      GFP_KERNEL);
 	if (!keypad)
 		return -ENOMEM;
 
-	input_dev = devm_input_allocate_device(&pdev->dev);
-	if (!input_dev)
-		return -ENOMEM;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
-	keypad->base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
-	if (!keypad->base)
-		return -EBUSY;
-
-	keypad->clk = devm_clk_get_prepared(&pdev->dev, "keypad");
-	if (IS_ERR(keypad->clk)) {
-		dev_err(&pdev->dev, "failed to get keypad clk\n");
-		return PTR_ERR(keypad->clk);
-	}
-
-	keypad->input_dev = input_dev;
 	keypad->pdev = pdev;
 	keypad->row_shift = row_shift;
-	keypad->rows = pdata->rows;
-	keypad->cols = pdata->cols;
+	keypad->rows = num_rows;
+	keypad->cols = num_cols;
 	keypad->stopped = true;
 	init_waitqueue_head(&keypad->wait);
 
@@ -397,26 +330,45 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	input_dev = devm_input_allocate_device(&pdev->dev);
+	if (!input_dev)
+		return -ENOMEM;
+
+	keypad->input_dev = input_dev;
+
 	input_dev->name = pdev->name;
 	input_dev->id.bustype = BUS_HOST;
 
 	input_dev->open = samsung_keypad_open;
 	input_dev->close = samsung_keypad_close;
 
-	error = matrix_keypad_build_keymap(pdata->keymap_data, NULL,
-					   pdata->rows, pdata->cols,
-					   keypad->keycodes, input_dev);
+	error = samsung_keypad_parse_keymap(keypad);
 	if (error) {
 		dev_err(&pdev->dev, "failed to build keymap\n");
 		return error;
 	}
 
 	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
-	if (!pdata->no_autorepeat)
+
+	if (!device_property_read_bool(&pdev->dev, "linux,input-no-autorepeat"))
 		__set_bit(EV_REP, input_dev->evbit);
 
 	input_set_drvdata(input_dev, keypad);
 
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	keypad->base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
+	if (!keypad->base)
+		return -EBUSY;
+
+	keypad->clk = devm_clk_get_prepared(&pdev->dev, "keypad");
+	if (IS_ERR(keypad->clk)) {
+		dev_err(&pdev->dev, "failed to get keypad clk\n");
+		return PTR_ERR(keypad->clk);
+	}
+
 	keypad->irq = platform_get_irq(pdev, 0);
 	if (keypad->irq < 0) {
 		error = keypad->irq;
@@ -431,7 +383,11 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 		return error;
 	}
 
-	device_init_wakeup(&pdev->dev, pdata->wakeup);
+	wakeup = device_property_read_bool(dev, "wakeup-source") ||
+		 /* legacy name */
+		 device_property_read_bool(dev, "linux,input-wakeup");
+	device_init_wakeup(&pdev->dev, wakeup);
+
 	platform_set_drvdata(pdev, keypad);
 
 	pm_runtime_enable(&pdev->dev);
@@ -444,12 +400,6 @@ static int samsung_keypad_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
-	if (!dev_get_platdata(&pdev->dev)) {
-		devm_kfree(&pdev->dev, (void *)pdata->keymap_data->keymap);
-		devm_kfree(&pdev->dev, (void *)pdata->keymap_data);
-		devm_kfree(&pdev->dev, (void *)pdata);
-	}
-
 	return 0;
 }
 
diff --git a/include/linux/input/samsung-keypad.h b/include/linux/input/samsung-keypad.h
deleted file mode 100644
index ab6b97114c08..000000000000
--- a/include/linux/input/samsung-keypad.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Samsung Keypad platform data definitions
- *
- * Copyright (C) 2010 Samsung Electronics Co.Ltd
- * Author: Joonyoung Shim <jy0922.shim@samsung.com>
- */
-
-#ifndef __SAMSUNG_KEYPAD_H
-#define __SAMSUNG_KEYPAD_H
-
-#include <linux/input/matrix_keypad.h>
-
-#define SAMSUNG_MAX_ROWS	8
-#define SAMSUNG_MAX_COLS	8
-
-/**
- * struct samsung_keypad_platdata - Platform device data for Samsung Keypad.
- * @keymap_data: pointer to &matrix_keymap_data.
- * @rows: number of keypad row supported.
- * @cols: number of keypad col supported.
- * @no_autorepeat: disable key autorepeat.
- * @wakeup: controls whether the device should be set up as wakeup source.
- * @cfg_gpio: configure the GPIO.
- *
- * Initialisation data specific to either the machine or the platform
- * for the device driver to use or call-back when configuring gpio.
- */
-struct samsung_keypad_platdata {
-	const struct matrix_keymap_data	*keymap_data;
-	unsigned int rows;
-	unsigned int cols;
-	bool no_autorepeat;
-	bool wakeup;
-
-	void (*cfg_gpio)(unsigned int rows, unsigned int cols);
-};
-
-#endif /* __SAMSUNG_KEYPAD_H */
-- 
2.46.0.184.g6999bdac58-goog


