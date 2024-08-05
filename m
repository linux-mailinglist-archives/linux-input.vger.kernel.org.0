Return-Path: <linux-input+bounces-5327-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D27A94732E
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 03:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE824B2101F
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 01:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01FA813C809;
	Mon,  5 Aug 2024 01:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsPoekCu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9161420B0;
	Mon,  5 Aug 2024 01:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722822449; cv=none; b=X4FsXQICRFy/aXE+XJ3RpWrS8MutQXbmxQuF7xUSRZ2WBXJ0Jri5x5qS3CdzcDj1G7wpKSgtb3jFbRxj9x43EISNPV/XE5GxVf88MQVXlbx3nHZfS2KBUT9ShOyv62PcC7WItx/ed1s8u7QFbtEB7IP5YujxhDzaC/VScwof7sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722822449; c=relaxed/simple;
	bh=oBPxXRtUVY1dhxIE1ReiBC7hS3W5xRymsUogcR0R8sE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PBctxR5pGYB7HvwGaGIIKr/yGTDRxfaSisifn+s+VCdRirh6X1FGugjCZgqEGdrsuBi/2AEj7JBW3B34zvoRhhRb54ojEQurjqj5OZaZgrmYU2CNXbmX+fg85m84CvqCCZ2y0XiE108nNLnFiVp5NIwsDD5XkM5JHD4/OrXYTeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsPoekCu; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fd66cddd07so71488705ad.2;
        Sun, 04 Aug 2024 18:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722822448; x=1723427248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8pmaXOrL2r8fZW3tjkXa1wARMkR0Ev0bNttjQMTW54=;
        b=ZsPoekCuWCkKJlNEIz4xbtOO9F9aMWGv06j2Peio+1Yxli2HMLVrlC5Md0yfzsgYz0
         5/zHPc5jwggcbid0Sulil44UeMRa62pXgX6c6voia2Ix0FWooOnp5Q25deQH8IMPFsWg
         X0PujBh9a/yTF0w+wShsFx1+sLVOJIFYE5WhnVZV29g3s1opSEgWrDNvw2+Je/vBfJIL
         AFUXLuj9uThOciKmP4oSJFXoINnuMIrjfxZM0C8ZuketXoONEnolS3XwAmycrJNNvP+s
         R83qdn/zdU9kYr6ayrcVZiZE2pjBmeXoXvs4T18s+PV2r4BFDqvzVIoHpAkweoeZNEuH
         6Y1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722822448; x=1723427248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8pmaXOrL2r8fZW3tjkXa1wARMkR0Ev0bNttjQMTW54=;
        b=PBINMzyrXCwYmgcKZycT0me+xg8urUJJrdkKzhr1IY8b2PFV2Es1mJ/XvBuqlQShXm
         y6BC06FRJG2P724irzzgAynHPF58KklixWE0PHz0OvxJzjwSC48LVyeU7Nh7rmQ6we0B
         hj/zchCeJ1e9Pe4fbRjAM/Eu9BV7POFHIJFBobUufLmMlpaqlC+9SkEBMx//xUgwj4kh
         07AtPvrH6vtKTFqESG86bU5Q7tc7XC8laan4+dr6zYn08bZKrmwSD2rMg6gl3mkG7C+4
         D7pEgcG3yOygzZUav0/lV6C6yOPsOyeFnN1NC8EW9aNdc9krcTrMa5l6kiaR6vAyHQZK
         VVjw==
X-Forwarded-Encrypted: i=1; AJvYcCUyYLAwBKiDJAu+J9GPFtBjTGNXlUmm8NTK5jcQIiKDIAYDmzHgfkodmge707twNjFezrP4MZCNVsypdYDPHDUwcQwZIJXo8MlVDq7poxY1Z30ZMySadNUw41TPa3e7KFb63TrODGTMBD0=
X-Gm-Message-State: AOJu0YxfXx9H6vgGnG6lJjUDbxo5khYV/ny+LGo9bC6pch0FfNZF4lrf
	ZzaRXIF/n/+n87W5eWGSnuZALOK0VDplmYqVxmdEBXLfoBhUsuE2
X-Google-Smtp-Source: AGHT+IELHyzgpC2WLKDDZzgQ7L0kQLg3FlBo97+NT6C6YgjQSp7KnuWLpBuWntbjhEBRfo3w6b4qdA==
X-Received: by 2002:a17:902:e885:b0:1fb:1500:17e0 with SMTP id d9443c01a7336-1ff572ba31bmr83762825ad.28.1722822447500;
        Sun, 04 Aug 2024 18:47:27 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:22e4:17a:28a:7497])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59295790sm55836015ad.261.2024.08.04.18.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 18:47:27 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Haojian Zhuang <haojian.zhuang@gmail.com>,
	Daniel Mack <daniel@zonque.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH 5/5] Input: matrix_keypad - remove support for platform data
Date: Sun,  4 Aug 2024 18:47:08 -0700
Message-ID: <20240805014710.1961677-6-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
In-Reply-To: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
References: <20240805014710.1961677-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no more users of struct matrix_keypad_platform_data in the
kernel, remove support for it from the driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/matrix_keypad.c | 74 ++------------------------
 include/linux/input/matrix_keypad.h    | 48 -----------------
 2 files changed, 3 insertions(+), 119 deletions(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 5f7e6f27e9c5..3c38bae576ed 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -271,55 +271,6 @@ static int matrix_keypad_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(matrix_keypad_pm_ops,
 				matrix_keypad_suspend, matrix_keypad_resume);
 
-static int matrix_keypad_init_pdata_gpio(struct platform_device *pdev,
-				const struct matrix_keypad_platform_data *pdata,
-				struct matrix_keypad *keypad)
-{
-	int i, err;
-
-	keypad->num_col_gpios = pdata->num_col_gpios;
-	keypad->num_row_gpios = pdata->num_row_gpios;
-
-	/* initialized strobe lines as outputs, activated */
-	for (i = 0; i < pdata->num_col_gpios; i++) {
-		err = devm_gpio_request(&pdev->dev,
-					pdata->col_gpios[i], "matrix_kbd_col");
-		if (err) {
-			dev_err(&pdev->dev,
-				"failed to request GPIO%d for COL%d\n",
-				pdata->col_gpios[i], i);
-			return err;
-		}
-
-		keypad->col_gpios[i] = gpio_to_desc(pdata->col_gpios[i]);
-
-		if (pdata->active_low ^ gpiod_is_active_low(keypad->col_gpios[i]))
-			gpiod_toggle_active_low(keypad->col_gpios[i]);
-
-		gpiod_direction_output(keypad->col_gpios[i], 1);
-	}
-
-	for (i = 0; i < pdata->num_row_gpios; i++) {
-		err = devm_gpio_request(&pdev->dev,
-					pdata->row_gpios[i], "matrix_kbd_row");
-		if (err) {
-			dev_err(&pdev->dev,
-				"failed to request GPIO%d for ROW%d\n",
-				pdata->row_gpios[i], i);
-			return err;
-		}
-
-		keypad->row_gpios[i] = gpio_to_desc(pdata->row_gpios[i]);
-
-		if (pdata->active_low ^ gpiod_is_active_low(keypad->row_gpios[i]))
-			gpiod_toggle_active_low(keypad->row_gpios[i]);
-
-		gpiod_direction_input(keypad->row_gpios[i]);
-	}
-
-	return 0;
-}
-
 static int matrix_keypad_init_gpio(struct platform_device *pdev,
 				   struct matrix_keypad *keypad)
 {
@@ -420,11 +371,8 @@ static int matrix_keypad_setup_interrupts(struct platform_device *pdev,
 
 static int matrix_keypad_probe(struct platform_device *pdev)
 {
-	const struct matrix_keypad_platform_data *pdata =
-						dev_get_platdata(&pdev->dev);
 	struct matrix_keypad *keypad;
 	struct input_dev *input_dev;
-	bool autorepeat;
 	bool wakeup;
 	int err;
 
@@ -448,16 +396,7 @@ static int matrix_keypad_probe(struct platform_device *pdev)
 	device_property_read_u32(&pdev->dev, "col-scan-delay-us",
 				 &keypad->col_scan_delay_us);
 
-	if (pdata) {
-		keypad->col_scan_delay_us = pdata->col_scan_delay_us;
-		keypad->debounce_ms = pdata->debounce_ms;
-		keypad->drive_inactive_cols = pdata->drive_inactive_cols;
-	}
-
-	if (pdata)
-		err = matrix_keypad_init_pdata_gpio(pdev, pdata, keypad);
-	else
-		err = matrix_keypad_init_gpio(pdev, keypad);
+	err = matrix_keypad_init_gpio(pdev, keypad);
 	if (err)
 		return err;
 
@@ -472,8 +411,7 @@ static int matrix_keypad_probe(struct platform_device *pdev)
 	input_dev->open		= matrix_keypad_start;
 	input_dev->close	= matrix_keypad_stop;
 
-	err = matrix_keypad_build_keymap(pdata ? pdata->keymap_data : NULL,
-					 NULL,
+	err = matrix_keypad_build_keymap(NULL, NULL,
 					 keypad->num_row_gpios,
 					 keypad->num_col_gpios,
 					 NULL, input_dev);
@@ -482,11 +420,7 @@ static int matrix_keypad_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
-	autorepeat = !device_property_read_bool(&pdev->dev,
-						"linux,no-autorepeat");
-	if (autorepeat && pdata->no_autorepeat)
-		autorepeat = false;
-	if (autorepeat)
+	if (!device_property_read_bool(&pdev->dev, "linux,no-autorepeat"))
 		__set_bit(EV_REP, input_dev->evbit);
 
 	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
@@ -499,8 +433,6 @@ static int matrix_keypad_probe(struct platform_device *pdev)
 	wakeup = device_property_read_bool(&pdev->dev, "wakeup-source") ||
 		 /* legacy */
 		 device_property_read_bool(&pdev->dev, "linux,wakeup");
-	if (!wakeup && pdata)
-		wakeup = pdata->wakeup;
 	device_init_wakeup(&pdev->dev, wakeup);
 
 	platform_set_drvdata(pdev, keypad);
diff --git a/include/linux/input/matrix_keypad.h b/include/linux/input/matrix_keypad.h
index b8d8d69eba29..90867f44ab4d 100644
--- a/include/linux/input/matrix_keypad.h
+++ b/include/linux/input/matrix_keypad.h
@@ -34,52 +34,6 @@ struct matrix_keymap_data {
 	unsigned int	keymap_size;
 };
 
-/**
- * struct matrix_keypad_platform_data - platform-dependent keypad data
- * @keymap_data: pointer to &matrix_keymap_data
- * @row_gpios: pointer to array of gpio numbers representing rows
- * @col_gpios: pointer to array of gpio numbers reporesenting colums
- * @num_row_gpios: actual number of row gpios used by device
- * @num_col_gpios: actual number of col gpios used by device
- * @col_scan_delay_us: delay, measured in microseconds, that is
- *	needed before we can keypad after activating column gpio
- * @debounce_ms: debounce interval in milliseconds
- * @clustered_irq: may be specified if interrupts of all row/column GPIOs
- *	are bundled to one single irq
- * @clustered_irq_flags: flags that are needed for the clustered irq
- * @active_low: gpio polarity
- * @wakeup: controls whether the device should be set up as wakeup
- *	source
- * @no_autorepeat: disable key autorepeat
- * @drive_inactive_cols: drive inactive columns during scan, rather than
- *	making them inputs.
- *
- * This structure represents platform-specific data that use used by
- * matrix_keypad driver to perform proper initialization.
- */
-struct matrix_keypad_platform_data {
-	const struct matrix_keymap_data *keymap_data;
-
-	const unsigned int *row_gpios;
-	const unsigned int *col_gpios;
-
-	unsigned int	num_row_gpios;
-	unsigned int	num_col_gpios;
-
-	unsigned int	col_scan_delay_us;
-
-	/* key debounce interval in milli-second */
-	unsigned int	debounce_ms;
-
-	unsigned int	clustered_irq;
-	unsigned int	clustered_irq_flags;
-
-	bool		active_low;
-	bool		wakeup;
-	bool		no_autorepeat;
-	bool		drive_inactive_cols;
-};
-
 int matrix_keypad_build_keymap(const struct matrix_keymap_data *keymap_data,
 			       const char *keymap_name,
 			       unsigned int rows, unsigned int cols,
@@ -88,6 +42,4 @@ int matrix_keypad_build_keymap(const struct matrix_keymap_data *keymap_data,
 int matrix_keypad_parse_properties(struct device *dev,
 				   unsigned int *rows, unsigned int *cols);
 
-#define matrix_keypad_parse_of_params matrix_keypad_parse_properties
-
 #endif /* _MATRIX_KEYPAD_H */
-- 
2.46.0.rc2.264.g509ed76dc8-goog


