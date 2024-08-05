Return-Path: <linux-input+bounces-5324-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4887947328
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 03:47:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B2721C20E0B
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 01:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7E413DB88;
	Mon,  5 Aug 2024 01:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQrp7qqu"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B4313D510;
	Mon,  5 Aug 2024 01:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722822446; cv=none; b=cQYG4cjfVP3rFOtVVKKP0qONbBOzAnhmwWHYaWVxIFQWoarYMDZiCNkFMwNWSGaF4hmQnlG1QIXL4wbJU8Tq44RSPDCF2Qv48fj4VPce15jvIRXjGdFM1rI6Oyu26GkIl6qgBqfTdP1q+pDIkIb8MmILV87gcIlZXI19i8jMvHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722822446; c=relaxed/simple;
	bh=l2ekZluJ4K65/cH6kwr7jCAFPqiUT/rFurJqByw+tQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=czBleCGiX9Q2wn8uX+3Yv0LLBC3/aEKfsUM+qaJsiDzaxgqrgb4tdsv1sZZS+lDSUjCzKF8Qp4JKBbkpdyIFP8ZOvOHyl71x/EKUFc5Kif/DxfsCzTK89bcsAYWMuVrMHiOkLdmrzHR5IZDrUCWnNic3p/p+O+cBZFT6zcgT1oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQrp7qqu; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fc4fccdd78so72353205ad.2;
        Sun, 04 Aug 2024 18:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722822444; x=1723427244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3W9Xny5Oe2jyjvAS76xpniX/sLkXGO8PpSiALjSSUIs=;
        b=fQrp7qqufQcxu5dYsye4Ljf2qXPtvgdWumNkmXFrP3QP0e0sTVTDsF247tSWV1d3Lr
         MILbCbtNyYvx6kCsjNyGixgFSF2wmua+92+bKoZwIX2glxfxuubV4gLiYhIIUDUvkIzN
         XCZmsdKVVeoZLTi2IcouZ5nIoGSQ49vUup8Fj9OOF3VIpC6IiLqCFMoV6LNqH4XK/nZm
         pVzP0emR8hu6sO4AM65htMic0nRmHn0gZFP9RqR4GLxtKWWupHpxLVy1Wh3wRx3oACN1
         MLU92UXHFMZDVEEwiZa7SQwa8N+5K7l5A5nmgsLLyXzDM8Ui8Vnpb2Asyjkb4emOMHBz
         8a/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722822444; x=1723427244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3W9Xny5Oe2jyjvAS76xpniX/sLkXGO8PpSiALjSSUIs=;
        b=GkvnqQZa1diux5ClXzYFSZczsINVUCHAqaWDAsh/a0NowZOT8cR0hoQ2m9jaSNd3XN
         SHubzC7yV9FCV1r8cS10EerCDbP3dkytcrOKDzKNH5XnUurfWGfx7hUnN3v1waPnNi/y
         b7UdeNJbunq30zsA8y/sztqFnOEXt2Fci/roG+FC9gsCMeDaxr/gV+TjRryr9PN4ho3h
         vYOxhT9EEVBm9xzha5DgpAx+V0sV3v+FLYfhN1lJhVbnOlXgovCWD05VPk1ke07pxU51
         BoZyZQ+JCjgxB5Q65jfLsTRFpb7Z3ffFhxr3tm5dffDoBCFZdVxhM1NxsSY62D6E05Zp
         7F1A==
X-Forwarded-Encrypted: i=1; AJvYcCVG28LWYeObvoPP4sdpfywcCORhhLd/0mgFqqMjeQ0Eehr6gu7wFw/eWEgLwuHzzb7SiA/9+nH4Tgp8VqIrVEmf/KwPc783U2vuL+x3iQQPAjrf0TQH9FfM7uijyK58pq31ZubH42thcFc=
X-Gm-Message-State: AOJu0Yx5JlU8K3pSC2cilH26fQAjrX9l0NcAo2MaE9qyOrdYDD+6h478
	4x+qt4HFZu2gEqjVGzeQGnxgNRtTHyv0sx7ZcAVIjcp7h5Vl0mFB
X-Google-Smtp-Source: AGHT+IG2qk2UX76WiKnUEfoLNtj9w3mHbdNpAlFnbpU8lmTUrz8S1fXH3OJw5hl3xcahnItIgN3FOQ==
X-Received: by 2002:a17:902:b70d:b0:1ff:3b0f:d5e2 with SMTP id d9443c01a7336-1ff5737e3abmr89071635ad.32.1722822443699;
        Sun, 04 Aug 2024 18:47:23 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:22e4:17a:28a:7497])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59295790sm55836015ad.261.2024.08.04.18.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 18:47:23 -0700 (PDT)
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
Subject: [PATCH 2/5] Input: matrix_keypad - switch to gpiod API and generic device properties
Date: Sun,  4 Aug 2024 18:47:05 -0700
Message-ID: <20240805014710.1961677-3-dmitry.torokhov@gmail.com>
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

gpiod API and generic device properties work with software nodes and
static properties, which will allow removing platform data support
from the driver, simplifying and streamlining the code.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/matrix_keypad.c | 341 ++++++++++++++-----------
 1 file changed, 185 insertions(+), 156 deletions(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 604e90d13ed0..5f7e6f27e9c5 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -17,17 +17,26 @@
 #include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/input/matrix_keypad.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
-#include <linux/of_platform.h>
 
 struct matrix_keypad {
-	const struct matrix_keypad_platform_data *pdata;
 	struct input_dev *input_dev;
 	unsigned int row_shift;
 
+	unsigned int col_scan_delay_us;
+	/* key debounce interval in milli-second */
+	unsigned int debounce_ms;
+	bool drive_inactive_cols;
+
+	struct gpio_desc *row_gpios[MATRIX_MAX_ROWS];
+	unsigned int num_row_gpios;
+
+	struct gpio_desc *col_gpios[MATRIX_MAX_ROWS];
+	unsigned int num_col_gpios;
+
 	unsigned int row_irqs[MATRIX_MAX_ROWS];
 	DECLARE_BITMAP(wakeup_enabled_irqs, MATRIX_MAX_ROWS);
 
@@ -44,50 +53,43 @@ struct matrix_keypad {
  * columns. In that case it is configured here to be input, otherwise it is
  * driven with the inactive value.
  */
-static void __activate_col(const struct matrix_keypad_platform_data *pdata,
-			   int col, bool on)
+static void __activate_col(struct matrix_keypad *keypad, int col, bool on)
 {
-	bool level_on = !pdata->active_low;
-
 	if (on) {
-		gpio_direction_output(pdata->col_gpios[col], level_on);
+		gpiod_direction_output(keypad->col_gpios[col], 1);
 	} else {
-		gpio_set_value_cansleep(pdata->col_gpios[col], !level_on);
-		if (!pdata->drive_inactive_cols)
-			gpio_direction_input(pdata->col_gpios[col]);
+		gpiod_set_value_cansleep(keypad->col_gpios[col], 0);
+		if (!keypad->drive_inactive_cols)
+			gpiod_direction_input(keypad->col_gpios[col]);
 	}
 }
 
-static void activate_col(const struct matrix_keypad_platform_data *pdata,
-			 int col, bool on)
+static void activate_col(struct matrix_keypad *keypad, int col, bool on)
 {
-	__activate_col(pdata, col, on);
+	__activate_col(keypad, col, on);
 
-	if (on && pdata->col_scan_delay_us)
-		udelay(pdata->col_scan_delay_us);
+	if (on && keypad->col_scan_delay_us)
+		udelay(keypad->col_scan_delay_us);
 }
 
-static void activate_all_cols(const struct matrix_keypad_platform_data *pdata,
-			      bool on)
+static void activate_all_cols(struct matrix_keypad *keypad, bool on)
 {
 	int col;
 
-	for (col = 0; col < pdata->num_col_gpios; col++)
-		__activate_col(pdata, col, on);
+	for (col = 0; col < keypad->num_col_gpios; col++)
+		__activate_col(keypad, col, on);
 }
 
-static bool row_asserted(const struct matrix_keypad_platform_data *pdata,
-			 int row)
+static bool row_asserted(struct matrix_keypad *keypad, int row)
 {
-	return gpio_get_value_cansleep(pdata->row_gpios[row]) ?
-			!pdata->active_low : pdata->active_low;
+	return gpiod_get_value_cansleep(keypad->row_gpios[row]);
 }
 
 static void enable_row_irqs(struct matrix_keypad *keypad)
 {
 	int i;
 
-	for (i = 0; i < keypad->pdata->num_row_gpios; i++)
+	for (i = 0; i < keypad->num_row_gpios; i++)
 		enable_irq(keypad->row_irqs[i]);
 }
 
@@ -95,7 +97,7 @@ static void disable_row_irqs(struct matrix_keypad *keypad)
 {
 	int i;
 
-	for (i = 0; i < keypad->pdata->num_row_gpios; i++)
+	for (i = 0; i < keypad->num_row_gpios; i++)
 		disable_irq_nosync(keypad->row_irqs[i]);
 }
 
@@ -108,39 +110,38 @@ static void matrix_keypad_scan(struct work_struct *work)
 		container_of(work, struct matrix_keypad, work.work);
 	struct input_dev *input_dev = keypad->input_dev;
 	const unsigned short *keycodes = input_dev->keycode;
-	const struct matrix_keypad_platform_data *pdata = keypad->pdata;
 	uint32_t new_state[MATRIX_MAX_COLS];
 	int row, col, code;
 
 	/* de-activate all columns for scanning */
-	activate_all_cols(pdata, false);
+	activate_all_cols(keypad, false);
 
 	memset(new_state, 0, sizeof(new_state));
 
-	for (row = 0; row < pdata->num_row_gpios; row++)
-		gpio_direction_input(pdata->row_gpios[row]);
+	for (row = 0; row < keypad->num_row_gpios; row++)
+		gpiod_direction_input(keypad->row_gpios[row]);
 
 	/* assert each column and read the row status out */
-	for (col = 0; col < pdata->num_col_gpios; col++) {
+	for (col = 0; col < keypad->num_col_gpios; col++) {
 
-		activate_col(pdata, col, true);
+		activate_col(keypad, col, true);
 
-		for (row = 0; row < pdata->num_row_gpios; row++)
+		for (row = 0; row < keypad->num_row_gpios; row++)
 			new_state[col] |=
-				row_asserted(pdata, row) ? (1 << row) : 0;
+				row_asserted(keypad, row) ? BIT(row) : 0;
 
-		activate_col(pdata, col, false);
+		activate_col(keypad, col, false);
 	}
 
-	for (col = 0; col < pdata->num_col_gpios; col++) {
+	for (col = 0; col < keypad->num_col_gpios; col++) {
 		uint32_t bits_changed;
 
 		bits_changed = keypad->last_key_state[col] ^ new_state[col];
 		if (bits_changed == 0)
 			continue;
 
-		for (row = 0; row < pdata->num_row_gpios; row++) {
-			if ((bits_changed & (1 << row)) == 0)
+		for (row = 0; row < keypad->num_row_gpios; row++) {
+			if (!(bits_changed & BIT(row)))
 				continue;
 
 			code = MATRIX_SCAN_CODE(row, col, keypad->row_shift);
@@ -154,7 +155,7 @@ static void matrix_keypad_scan(struct work_struct *work)
 
 	memcpy(keypad->last_key_state, new_state, sizeof(new_state));
 
-	activate_all_cols(pdata, true);
+	activate_all_cols(keypad, true);
 
 	/* Enable IRQs again */
 	spin_lock_irq(&keypad->lock);
@@ -181,7 +182,7 @@ static irqreturn_t matrix_keypad_interrupt(int irq, void *id)
 	disable_row_irqs(keypad);
 	keypad->scan_pending = true;
 	schedule_delayed_work(&keypad->work,
-		msecs_to_jiffies(keypad->pdata->debounce_ms));
+			      msecs_to_jiffies(keypad->debounce_ms));
 
 out:
 	spin_unlock_irqrestore(&keypad->lock, flags);
@@ -225,7 +226,7 @@ static void matrix_keypad_enable_wakeup(struct matrix_keypad *keypad)
 	int i;
 
 	for_each_clear_bit(i, keypad->wakeup_enabled_irqs,
-			   keypad->pdata->num_row_gpios)
+			   keypad->num_row_gpios)
 		if (enable_irq_wake(keypad->row_irqs[i]) == 0)
 			__set_bit(i, keypad->wakeup_enabled_irqs);
 }
@@ -235,7 +236,7 @@ static void matrix_keypad_disable_wakeup(struct matrix_keypad *keypad)
 	int i;
 
 	for_each_set_bit(i, keypad->wakeup_enabled_irqs,
-			 keypad->pdata->num_row_gpios) {
+			 keypad->num_row_gpios) {
 		disable_irq_wake(keypad->row_irqs[i]);
 		__clear_bit(i, keypad->wakeup_enabled_irqs);
 	}
@@ -270,11 +271,14 @@ static int matrix_keypad_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(matrix_keypad_pm_ops,
 				matrix_keypad_suspend, matrix_keypad_resume);
 
-static int matrix_keypad_init_gpio(struct platform_device *pdev,
-				   struct matrix_keypad *keypad)
+static int matrix_keypad_init_pdata_gpio(struct platform_device *pdev,
+				const struct matrix_keypad_platform_data *pdata,
+				struct matrix_keypad *keypad)
 {
-	const struct matrix_keypad_platform_data *pdata = keypad->pdata;
-	int i, irq, err;
+	int i, err;
+
+	keypad->num_col_gpios = pdata->num_col_gpios;
+	keypad->num_row_gpios = pdata->num_row_gpios;
 
 	/* initialized strobe lines as outputs, activated */
 	for (i = 0; i < pdata->num_col_gpios; i++) {
@@ -287,7 +291,12 @@ static int matrix_keypad_init_gpio(struct platform_device *pdev,
 			return err;
 		}
 
-		gpio_direction_output(pdata->col_gpios[i], !pdata->active_low);
+		keypad->col_gpios[i] = gpio_to_desc(pdata->col_gpios[i]);
+
+		if (pdata->active_low ^ gpiod_is_active_low(keypad->col_gpios[i]))
+			gpiod_toggle_active_low(keypad->col_gpios[i]);
+
+		gpiod_direction_output(keypad->col_gpios[i], 1);
 	}
 
 	for (i = 0; i < pdata->num_row_gpios; i++) {
@@ -300,137 +309,125 @@ static int matrix_keypad_init_gpio(struct platform_device *pdev,
 			return err;
 		}
 
-		gpio_direction_input(pdata->row_gpios[i]);
-	}
-
-	for (i = 0; i < pdata->num_row_gpios; i++) {
-		irq = gpio_to_irq(pdata->row_gpios[i]);
-		if (irq < 0) {
-			err = irq;
-			dev_err(&pdev->dev,
-				"Unable to convert GPIO line %i to irq: %d\n",
-				pdata->row_gpios[i], err);
-			return err;
-		}
+		keypad->row_gpios[i] = gpio_to_desc(pdata->row_gpios[i]);
 
-		err = devm_request_any_context_irq(&pdev->dev,
-				irq,
-				matrix_keypad_interrupt,
-				IRQF_TRIGGER_RISING |
-					IRQF_TRIGGER_FALLING,
-				"matrix-keypad", keypad);
-		if (err < 0) {
-			dev_err(&pdev->dev,
-				"Unable to acquire interrupt for GPIO line %i\n",
-				pdata->row_gpios[i]);
-			return err;
-		}
+		if (pdata->active_low ^ gpiod_is_active_low(keypad->row_gpios[i]))
+			gpiod_toggle_active_low(keypad->row_gpios[i]);
 
-		keypad->row_irqs[i] = irq;
+		gpiod_direction_input(keypad->row_gpios[i]);
 	}
 
-	/* initialized as disabled - enabled by input->open */
-	disable_row_irqs(keypad);
-
 	return 0;
 }
 
-#ifdef CONFIG_OF
-static struct matrix_keypad_platform_data *
-matrix_keypad_parse_dt(struct device *dev)
+static int matrix_keypad_init_gpio(struct platform_device *pdev,
+				   struct matrix_keypad *keypad)
 {
-	struct matrix_keypad_platform_data *pdata;
-	struct device_node *np = dev->of_node;
-	unsigned int *gpios;
-	int ret, i, nrow, ncol;
-
-	if (!np) {
-		dev_err(dev, "device lacks DT data\n");
-		return ERR_PTR(-ENODEV);
-	}
-
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata) {
-		dev_err(dev, "could not allocate memory for platform data\n");
-		return ERR_PTR(-ENOMEM);
-	}
+	bool active_low;
+	int nrow, ncol;
+	int err;
+	int i;
 
-	pdata->num_row_gpios = nrow = gpiod_count(dev, "row");
-	pdata->num_col_gpios = ncol = gpiod_count(dev, "col");
+	nrow = gpiod_count(&pdev->dev, "row");
+	ncol = gpiod_count(&pdev->dev, "col");
 	if (nrow < 0 || ncol < 0) {
-		dev_err(dev, "number of keypad rows/columns not specified\n");
-		return ERR_PTR(-EINVAL);
+		dev_err(&pdev->dev, "missing row or column GPIOs\n");
+		return -EINVAL;
 	}
 
-	pdata->no_autorepeat = of_property_read_bool(np, "linux,no-autorepeat");
+	keypad->num_row_gpios = nrow;
+	keypad->num_col_gpios = ncol;
 
-	pdata->wakeup = of_property_read_bool(np, "wakeup-source") ||
-			of_property_read_bool(np, "linux,wakeup"); /* legacy */
+	active_low = device_property_read_bool(&pdev->dev, "gpio-activelow");
 
-	pdata->active_low = of_property_read_bool(np, "gpio-activelow");
+	/* initialize strobe lines as outputs, activated */
+	for (i = 0; i < keypad->num_col_gpios; i++) {
+		keypad->col_gpios[i] = devm_gpiod_get_index(&pdev->dev, "col",
+							    i, GPIOD_ASIS);
+		err = PTR_ERR_OR_ZERO(keypad->col_gpios[i]);
+		if (err) {
+			dev_err(&pdev->dev,
+				"failed to request GPIO for COL%d: %d\n",
+				i, err);
+			return err;
+		}
 
-	pdata->drive_inactive_cols =
-		of_property_read_bool(np, "drive-inactive-cols");
+		gpiod_set_consumer_name(keypad->col_gpios[i], "matrix_kbd_col");
 
-	of_property_read_u32(np, "debounce-delay-ms", &pdata->debounce_ms);
-	of_property_read_u32(np, "col-scan-delay-us",
-						&pdata->col_scan_delay_us);
+		if (active_low ^ gpiod_is_active_low(keypad->col_gpios[i]))
+			gpiod_toggle_active_low(keypad->col_gpios[i]);
 
-	gpios = devm_kcalloc(dev,
-			     pdata->num_row_gpios + pdata->num_col_gpios,
-			     sizeof(unsigned int),
-			     GFP_KERNEL);
-	if (!gpios) {
-		dev_err(dev, "could not allocate memory for gpios\n");
-		return ERR_PTR(-ENOMEM);
+		gpiod_direction_output(keypad->col_gpios[i], 1);
 	}
 
-	for (i = 0; i < nrow; i++) {
-		ret = of_get_named_gpio(np, "row-gpios", i);
-		if (ret < 0)
-			return ERR_PTR(ret);
-		gpios[i] = ret;
-	}
+	for (i = 0; i < keypad->num_row_gpios; i++) {
+		keypad->row_gpios[i] = devm_gpiod_get_index(&pdev->dev, "row",
+							    i, GPIOD_IN);
+		err = PTR_ERR_OR_ZERO(keypad->row_gpios[i]);
+		if (err) {
+			dev_err(&pdev->dev,
+				"failed to request GPIO for ROW%d: %d\n",
+				i, err);
+			return err;
+		}
 
-	for (i = 0; i < ncol; i++) {
-		ret = of_get_named_gpio(np, "col-gpios", i);
-		if (ret < 0)
-			return ERR_PTR(ret);
-		gpios[nrow + i] = ret;
-	}
+		gpiod_set_consumer_name(keypad->row_gpios[i], "matrix_kbd_row");
 
-	pdata->row_gpios = gpios;
-	pdata->col_gpios = &gpios[pdata->num_row_gpios];
+		if (active_low ^ gpiod_is_active_low(keypad->row_gpios[i]))
+			gpiod_toggle_active_low(keypad->row_gpios[i]);
+	}
 
-	return pdata;
+	return 0;
 }
-#else
-static inline struct matrix_keypad_platform_data *
-matrix_keypad_parse_dt(struct device *dev)
+
+static int matrix_keypad_setup_interrupts(struct platform_device *pdev,
+					  struct matrix_keypad *keypad)
 {
-	dev_err(dev, "no platform data defined\n");
+	int err;
+	int irq;
+	int i;
+
+	for (i = 0; i < keypad->num_row_gpios; i++) {
+		irq = gpiod_to_irq(keypad->row_gpios[i]);
+		if (irq < 0) {
+			err = irq;
+			dev_err(&pdev->dev,
+				"Unable to convert GPIO line %i to irq: %d\n",
+				i, err);
+			return err;
+		}
+
+		err = devm_request_any_context_irq(&pdev->dev, irq,
+						   matrix_keypad_interrupt,
+						   IRQF_TRIGGER_RISING |
+							IRQF_TRIGGER_FALLING,
+						   "matrix-keypad", keypad);
+		if (err < 0) {
+			dev_err(&pdev->dev,
+				"Unable to acquire interrupt for row %i: %d\n",
+				i, err);
+			return err;
+		}
+
+		keypad->row_irqs[i] = irq;
+	}
 
-	return ERR_PTR(-EINVAL);
+	/* initialized as disabled - enabled by input->open */
+	disable_row_irqs(keypad);
+
+	return 0;
 }
-#endif
 
 static int matrix_keypad_probe(struct platform_device *pdev)
 {
-	const struct matrix_keypad_platform_data *pdata;
+	const struct matrix_keypad_platform_data *pdata =
+						dev_get_platdata(&pdev->dev);
 	struct matrix_keypad *keypad;
 	struct input_dev *input_dev;
+	bool autorepeat;
+	bool wakeup;
 	int err;
 
-	pdata = dev_get_platdata(&pdev->dev);
-	if (!pdata) {
-		pdata = matrix_keypad_parse_dt(&pdev->dev);
-		if (IS_ERR(pdata))
-			return PTR_ERR(pdata);
-	} else if (!pdata->keymap_data) {
-		dev_err(&pdev->dev, "no keymap data defined\n");
-		return -EINVAL;
-	}
-
 	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
 	if (!keypad)
 		return -ENOMEM;
@@ -440,40 +437,72 @@ static int matrix_keypad_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	keypad->input_dev = input_dev;
-	keypad->pdata = pdata;
-	keypad->row_shift = get_count_order(pdata->num_col_gpios);
 	keypad->stopped = true;
 	INIT_DELAYED_WORK(&keypad->work, matrix_keypad_scan);
 	spin_lock_init(&keypad->lock);
 
+	keypad->drive_inactive_cols =
+		device_property_read_bool(&pdev->dev, "drive-inactive-cols");
+	device_property_read_u32(&pdev->dev, "debounce-delay-ms",
+				 &keypad->debounce_ms);
+	device_property_read_u32(&pdev->dev, "col-scan-delay-us",
+				 &keypad->col_scan_delay_us);
+
+	if (pdata) {
+		keypad->col_scan_delay_us = pdata->col_scan_delay_us;
+		keypad->debounce_ms = pdata->debounce_ms;
+		keypad->drive_inactive_cols = pdata->drive_inactive_cols;
+	}
+
+	if (pdata)
+		err = matrix_keypad_init_pdata_gpio(pdev, pdata, keypad);
+	else
+		err = matrix_keypad_init_gpio(pdev, keypad);
+	if (err)
+		return err;
+
+	keypad->row_shift = get_count_order(keypad->num_col_gpios);
+
+	err = matrix_keypad_setup_interrupts(pdev, keypad);
+	if (err)
+		return err;
+
 	input_dev->name		= pdev->name;
 	input_dev->id.bustype	= BUS_HOST;
 	input_dev->open		= matrix_keypad_start;
 	input_dev->close	= matrix_keypad_stop;
 
-	err = matrix_keypad_build_keymap(pdata->keymap_data, NULL,
-					 pdata->num_row_gpios,
-					 pdata->num_col_gpios,
+	err = matrix_keypad_build_keymap(pdata ? pdata->keymap_data : NULL,
+					 NULL,
+					 keypad->num_row_gpios,
+					 keypad->num_col_gpios,
 					 NULL, input_dev);
 	if (err) {
 		dev_err(&pdev->dev, "failed to build keymap\n");
 		return -ENOMEM;
 	}
 
-	if (!pdata->no_autorepeat)
+	autorepeat = !device_property_read_bool(&pdev->dev,
+						"linux,no-autorepeat");
+	if (autorepeat && pdata->no_autorepeat)
+		autorepeat = false;
+	if (autorepeat)
 		__set_bit(EV_REP, input_dev->evbit);
+
 	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
 	input_set_drvdata(input_dev, keypad);
 
-	err = matrix_keypad_init_gpio(pdev, keypad);
-	if (err)
-		return err;
-
 	err = input_register_device(keypad->input_dev);
 	if (err)
 		return err;
 
-	device_init_wakeup(&pdev->dev, pdata->wakeup);
+	wakeup = device_property_read_bool(&pdev->dev, "wakeup-source") ||
+		 /* legacy */
+		 device_property_read_bool(&pdev->dev, "linux,wakeup");
+	if (!wakeup && pdata)
+		wakeup = pdata->wakeup;
+	device_init_wakeup(&pdev->dev, wakeup);
+
 	platform_set_drvdata(pdev, keypad);
 
 	return 0;
-- 
2.46.0.rc2.264.g509ed76dc8-goog


