Return-Path: <linux-input+bounces-5609-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F4D95511A
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 20:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65C37284A46
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2024 18:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705BF1C37A9;
	Fri, 16 Aug 2024 18:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WqBqk5ej"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9230D2BB0D;
	Fri, 16 Aug 2024 18:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723834469; cv=none; b=g1aL+NlV8y/5LlO/pk7y3x3QKLehckTO/MdvV4Vek/BhTx4f9Dy4kaiyneJSjb2BQ5993Hs6whEE++u4H57A8XB6VxUQWKGDahMaq7qjL8T++iEfPQq2AJlPcqq7B9or20cNMzi7Nn6xJrpq2mE90evL8imvKi7QMdnn6xCMNY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723834469; c=relaxed/simple;
	bh=kZyatL8yRSqCZH0qgq8BNv7UAoPCfZ/3QVaOyPjL9TA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i+LbNonQfG9QvNOPfBe7jBtvew/RflVe+NfPdn1+6zW6oWmnaoZrtNUYII1xBGzT8O/Zw7ceoWhGyWqlJlCr+iDv2nphBjvH3eEzKgQND8GVFTA50fvO8k+ucKCOjYFNq+1RojlMKb/m+fdFbLbRHw9oZHjKV1py7Ismqa6vnpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WqBqk5ej; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d3d58d6e08so1326265a91.3;
        Fri, 16 Aug 2024 11:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723834467; x=1724439267; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7GhfB6wUTmiKLF/4I01krCBvE0ILroVdKujPJwXsm4o=;
        b=WqBqk5ejEodsNhjMs7y5hzHEqHZ+koKixjlz2wFbsvlD+wiEge/PtMFk/D68uZ9Xwp
         MZgkBYzgjZl0xMiH+qzP6PC/Tbe4/EFrGRdG+MHP28cAxRMx57dzY7MuKDChVxIyvfMd
         GuSeAoSIC5pKjJWW2SSaQezvZKEVkVVPXkkbA4HNBzaw9c/7ilj6vW4g/avpAleqskb/
         3kAZ62eZ0MNvAF2HRTrITTULqVxaz1YRe9OLflt0D7hRMIKwb+CKraZyd/qcV4IYE6Z5
         BDNs9cYH0/2iL2pUq62PiKMtMQUXjw/iOJ2xJef6OwCyuWikgOptKW6Aed9JzqTvtZhO
         obgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723834467; x=1724439267;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7GhfB6wUTmiKLF/4I01krCBvE0ILroVdKujPJwXsm4o=;
        b=J2z2am3ykvu9lCxUW/+Zstjq6pWKzWvECojoXomMASeIVn2NuWSCo9DHvqe6QPHtVU
         S6f8wtOBu0m8k4JdpfwY7z47eQwSEfv0s2CmftItJnHJSLaT/OUIUmnACVQRLv3wHeIQ
         Y+OxwP/G0bSwNGZasA3DZLETrLIA3MqQvP5IK+FZe3Qg3M4byvIhMOuzJBnZeNSfK/eA
         35rfW3SkKAQPhmlD6XLwGyPnBg5v0D6h6fb6q9wmagR1i+i4z+VmSij3hc84xGiPsJcv
         v/DDQUAkwddl2oXhKC8DL8CWjNnZjyqyi0XOY2Kp3KWs3ZUM7Og03KETg8Bl71eXLLWl
         ltCw==
X-Forwarded-Encrypted: i=1; AJvYcCW3wiERJYiO8UyLz+ajBzECV873jBIWlurNQTm028VvWu3LVmY7RAvXc4pf0loAAlliZ744krmd5lPpUH10nqrLVGDURxUTxUVr5dGb
X-Gm-Message-State: AOJu0YzCjKOQpqiEQGhL7XUtmI7eZiaNwFHs5Q3j5ANJVIpbjdRGZfub
	8A11RpCXCcw79oueWtdAEiyTf1i+Rgy1s3vdwz/mxKplvnrxWwS8
X-Google-Smtp-Source: AGHT+IEQMT/1W6Sfam74X0mHS3gvJDrDrON+q1WmXos/35y+V2lH9UOTMZQCYLOlcfTrOA/dQyBYHQ==
X-Received: by 2002:a17:90b:4a44:b0:2d1:ba43:1303 with SMTP id 98e67ed59e1d1-2d3dffe297amr4266404a91.21.1723834466395;
        Fri, 16 Aug 2024 11:54:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f6d5:34f3:964e:7bfc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3e3c81127sm2243177a91.45.2024.08.16.11.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 11:54:25 -0700 (PDT)
Date: Fri, 16 Aug 2024 11:54:23 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] Input: keypad-nomadik-ske - remove the driver
Message-ID: <Zr-gX0dfN4te_8VG@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The users of this driver were removed in 2013 in commit 28633c54bda6
("ARM: ux500: Rip out keypad initialisation which is no longer used").

Remove the driver as well.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/Kconfig                |  11 -
 drivers/input/keyboard/Makefile               |   1 -
 drivers/input/keyboard/nomadik-ske-keypad.c   | 378 ------------------
 .../linux/platform_data/keypad-nomadik-ske.h  |  50 ---
 4 files changed, 440 deletions(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 72f9552cb571..a5015d6f8bed 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -473,17 +473,6 @@ config KEYBOARD_NEWTON
 	  To compile this driver as a module, choose M here: the
 	  module will be called newtonkbd.
 
-config KEYBOARD_NOMADIK
-	tristate "ST-Ericsson Nomadik SKE keyboard"
-	depends on (ARCH_NOMADIK || ARCH_U8500 || COMPILE_TEST)
-	select INPUT_MATRIXKMAP
-	help
-	  Say Y here if you want to use a keypad provided on the SKE controller
-	  used on the Ux500 and Nomadik platforms
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called nmk-ske-keypad.
-
 config KEYBOARD_NSPIRE
 	tristate "TI-NSPIRE built-in keyboard"
 	depends on ARCH_NSPIRE && OF
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
index b8d12a0524e0..3631a9294c6f 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -45,7 +45,6 @@ obj-$(CONFIG_KEYBOARD_MPR121)		+= mpr121_touchkey.o
 obj-$(CONFIG_KEYBOARD_MT6779)		+= mt6779-keypad.o
 obj-$(CONFIG_KEYBOARD_MTK_PMIC) 	+= mtk-pmic-keys.o
 obj-$(CONFIG_KEYBOARD_NEWTON)		+= newtonkbd.o
-obj-$(CONFIG_KEYBOARD_NOMADIK)		+= nomadik-ske-keypad.o
 obj-$(CONFIG_KEYBOARD_NSPIRE)		+= nspire-keypad.o
 obj-$(CONFIG_KEYBOARD_OMAP)		+= omap-keypad.o
 obj-$(CONFIG_KEYBOARD_OMAP4)		+= omap4-keypad.o
diff --git a/drivers/input/keyboard/nomadik-ske-keypad.c b/drivers/input/keyboard/nomadik-ske-keypad.c
deleted file mode 100644
index b3ccc97f61e1..000000000000
--- a/drivers/input/keyboard/nomadik-ske-keypad.c
+++ /dev/null
@@ -1,378 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (C) ST-Ericsson SA 2010
- *
- * Author: Naveen Kumar G <naveen.gaddipati@stericsson.com> for ST-Ericsson
- * Author: Sundar Iyer <sundar.iyer@stericsson.com> for ST-Ericsson
- *
- * Keypad controller driver for the SKE (Scroll Key Encoder) module used in
- * the Nomadik 8815 and Ux500 platforms.
- */
-
-#include <linux/platform_device.h>
-#include <linux/interrupt.h>
-#include <linux/spinlock.h>
-#include <linux/io.h>
-#include <linux/delay.h>
-#include <linux/input.h>
-#include <linux/slab.h>
-#include <linux/clk.h>
-#include <linux/module.h>
-
-#include <linux/platform_data/keypad-nomadik-ske.h>
-
-/* SKE_CR bits */
-#define SKE_KPMLT	(0x1 << 6)
-#define SKE_KPCN	(0x7 << 3)
-#define SKE_KPASEN	(0x1 << 2)
-#define SKE_KPASON	(0x1 << 7)
-
-/* SKE_IMSC bits */
-#define SKE_KPIMA	(0x1 << 2)
-
-/* SKE_ICR bits */
-#define SKE_KPICS	(0x1 << 3)
-#define SKE_KPICA	(0x1 << 2)
-
-/* SKE_RIS bits */
-#define SKE_KPRISA	(0x1 << 2)
-
-#define SKE_KEYPAD_ROW_SHIFT	3
-#define SKE_KPD_NUM_ROWS	8
-#define SKE_KPD_NUM_COLS	8
-
-/* keypad auto scan registers */
-#define SKE_ASR0	0x20
-#define SKE_ASR1	0x24
-#define SKE_ASR2	0x28
-#define SKE_ASR3	0x2C
-
-#define SKE_NUM_ASRX_REGISTERS	(4)
-#define	KEY_PRESSED_DELAY	10
-
-/**
- * struct ske_keypad  - data structure used by keypad driver
- * @irq:	irq no
- * @reg_base:	ske registers base address
- * @input:	pointer to input device object
- * @board:	keypad platform device
- * @keymap:	matrix scan code table for keycodes
- * @clk:	clock structure pointer
- * @pclk:	clock structure pointer
- * @ske_keypad_lock: spinlock protecting the keypad read/writes
- */
-struct ske_keypad {
-	int irq;
-	void __iomem *reg_base;
-	struct input_dev *input;
-	const struct ske_keypad_platform_data *board;
-	unsigned short keymap[SKE_KPD_NUM_ROWS * SKE_KPD_NUM_COLS];
-	struct clk *clk;
-	struct clk *pclk;
-	spinlock_t ske_keypad_lock;
-};
-
-static void ske_keypad_set_bits(struct ske_keypad *keypad, u16 addr,
-		u8 mask, u8 data)
-{
-	u32 ret;
-
-	spin_lock(&keypad->ske_keypad_lock);
-
-	ret = readl(keypad->reg_base + addr);
-	ret &= ~mask;
-	ret |= data;
-	writel(ret, keypad->reg_base + addr);
-
-	spin_unlock(&keypad->ske_keypad_lock);
-}
-
-/*
- * ske_keypad_chip_init: init keypad controller configuration
- *
- * Enable Multi key press detection, auto scan mode
- */
-static int __init ske_keypad_chip_init(struct ske_keypad *keypad)
-{
-	u32 value;
-	int timeout = keypad->board->debounce_ms;
-
-	/* check SKE_RIS to be 0 */
-	while ((readl(keypad->reg_base + SKE_RIS) != 0x00000000) && timeout--)
-		cpu_relax();
-
-	if (timeout == -1)
-		return -EINVAL;
-
-	/*
-	 * set debounce value
-	 * keypad dbounce is configured in DBCR[15:8]
-	 * dbounce value in steps of 32/32.768 ms
-	 */
-	spin_lock(&keypad->ske_keypad_lock);
-	value = readl(keypad->reg_base + SKE_DBCR);
-	value = value & 0xff;
-	value |= ((keypad->board->debounce_ms * 32000)/32768) << 8;
-	writel(value, keypad->reg_base + SKE_DBCR);
-	spin_unlock(&keypad->ske_keypad_lock);
-
-	/* enable multi key detection */
-	ske_keypad_set_bits(keypad, SKE_CR, 0x0, SKE_KPMLT);
-
-	/*
-	 * set up the number of columns
-	 * KPCN[5:3] defines no. of keypad columns to be auto scanned
-	 */
-	value = (keypad->board->kcol - 1) << 3;
-	ske_keypad_set_bits(keypad, SKE_CR, SKE_KPCN, value);
-
-	/* clear keypad interrupt for auto(and pending SW) scans */
-	ske_keypad_set_bits(keypad, SKE_ICR, 0x0, SKE_KPICA | SKE_KPICS);
-
-	/* un-mask keypad interrupts */
-	ske_keypad_set_bits(keypad, SKE_IMSC, 0x0, SKE_KPIMA);
-
-	/* enable automatic scan */
-	ske_keypad_set_bits(keypad, SKE_CR, 0x0, SKE_KPASEN);
-
-	return 0;
-}
-
-static void ske_keypad_report(struct ske_keypad *keypad, u8 status, int col)
-{
-	int row = 0, code, pos;
-	struct input_dev *input = keypad->input;
-	u32 ske_ris;
-	int key_pressed;
-	int num_of_rows;
-
-	/* find out the row */
-	num_of_rows = hweight8(status);
-	do {
-		pos = __ffs(status);
-		row = pos;
-		status &= ~(1 << pos);
-
-		code = MATRIX_SCAN_CODE(row, col, SKE_KEYPAD_ROW_SHIFT);
-		ske_ris = readl(keypad->reg_base + SKE_RIS);
-		key_pressed = ske_ris & SKE_KPRISA;
-
-		input_event(input, EV_MSC, MSC_SCAN, code);
-		input_report_key(input, keypad->keymap[code], key_pressed);
-		input_sync(input);
-		num_of_rows--;
-	} while (num_of_rows);
-}
-
-static void ske_keypad_read_data(struct ske_keypad *keypad)
-{
-	u8 status;
-	int col = 0;
-	int ske_asr, i;
-
-	/*
-	 * Read the auto scan registers
-	 *
-	 * Each SKE_ASRx (x=0 to x=3) contains two row values.
-	 * lower byte contains row value for column 2*x,
-	 * upper byte contains row value for column 2*x + 1
-	 */
-	for (i = 0; i < SKE_NUM_ASRX_REGISTERS; i++) {
-		ske_asr = readl(keypad->reg_base + SKE_ASR0 + (4 * i));
-		if (!ske_asr)
-			continue;
-
-		/* now that ASRx is zero, find out the coloumn x and row y */
-		status = ske_asr & 0xff;
-		if (status) {
-			col = i * 2;
-			ske_keypad_report(keypad, status, col);
-		}
-		status = (ske_asr & 0xff00) >> 8;
-		if (status) {
-			col = (i * 2) + 1;
-			ske_keypad_report(keypad, status, col);
-		}
-	}
-}
-
-static irqreturn_t ske_keypad_irq(int irq, void *dev_id)
-{
-	struct ske_keypad *keypad = dev_id;
-	int timeout = keypad->board->debounce_ms;
-
-	/* disable auto scan interrupt; mask the interrupt generated */
-	ske_keypad_set_bits(keypad, SKE_IMSC, ~SKE_KPIMA, 0x0);
-	ske_keypad_set_bits(keypad, SKE_ICR, 0x0, SKE_KPICA);
-
-	while ((readl(keypad->reg_base + SKE_CR) & SKE_KPASON) && --timeout)
-		cpu_relax();
-
-	/* SKEx registers are stable and can be read */
-	ske_keypad_read_data(keypad);
-
-	/* wait until raw interrupt is clear */
-	while ((readl(keypad->reg_base + SKE_RIS)) && --timeout)
-		msleep(KEY_PRESSED_DELAY);
-
-	/* enable auto scan interrupts */
-	ske_keypad_set_bits(keypad, SKE_IMSC, 0x0, SKE_KPIMA);
-
-	return IRQ_HANDLED;
-}
-
-static void ske_keypad_board_exit(void *data)
-{
-	struct ske_keypad *keypad = data;
-
-	keypad->board->exit();
-}
-
-static int __init ske_keypad_probe(struct platform_device *pdev)
-{
-	const struct ske_keypad_platform_data *plat =
-			dev_get_platdata(&pdev->dev);
-	struct device *dev = &pdev->dev;
-	struct ske_keypad *keypad;
-	struct input_dev *input;
-	int irq;
-	int error;
-
-	if (!plat) {
-		dev_err(&pdev->dev, "invalid keypad platform data\n");
-		return -EINVAL;
-	}
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
-	keypad = devm_kzalloc(dev, sizeof(struct ske_keypad),
-			      GFP_KERNEL);
-	input = devm_input_allocate_device(dev);
-	if (!keypad || !input) {
-		dev_err(&pdev->dev, "failed to allocate keypad memory\n");
-		return -ENOMEM;
-	}
-
-	keypad->irq = irq;
-	keypad->board = plat;
-	keypad->input = input;
-	spin_lock_init(&keypad->ske_keypad_lock);
-
-	keypad->reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(keypad->reg_base))
-		return PTR_ERR(keypad->reg_base);
-
-	keypad->pclk = devm_clk_get_enabled(dev, "apb_pclk");
-	if (IS_ERR(keypad->pclk)) {
-		dev_err(&pdev->dev, "failed to get pclk\n");
-		return PTR_ERR(keypad->pclk);
-	}
-
-	keypad->clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(keypad->clk)) {
-		dev_err(&pdev->dev, "failed to get clk\n");
-		return PTR_ERR(keypad->clk);
-	}
-
-	input->id.bustype = BUS_HOST;
-	input->name = "ux500-ske-keypad";
-	input->dev.parent = &pdev->dev;
-
-	error = matrix_keypad_build_keymap(plat->keymap_data, NULL,
-					   SKE_KPD_NUM_ROWS, SKE_KPD_NUM_COLS,
-					   keypad->keymap, input);
-	if (error) {
-		dev_err(&pdev->dev, "Failed to build keymap\n");
-		return error;
-	}
-
-	input_set_capability(input, EV_MSC, MSC_SCAN);
-	if (!plat->no_autorepeat)
-		__set_bit(EV_REP, input->evbit);
-
-	/* go through board initialization helpers */
-	if (keypad->board->init)
-		keypad->board->init();
-
-	if (keypad->board->exit) {
-		error = devm_add_action_or_reset(dev, ske_keypad_board_exit,
-						 keypad);
-		if (error)
-			return error;
-	}
-
-	error = ske_keypad_chip_init(keypad);
-	if (error) {
-		dev_err(&pdev->dev, "unable to init keypad hardware\n");
-		return error;
-	}
-
-	error = devm_request_threaded_irq(dev, keypad->irq,
-					  NULL, ske_keypad_irq,
-					  IRQF_ONESHOT, "ske-keypad", keypad);
-	if (error) {
-		dev_err(&pdev->dev, "allocate irq %d failed\n", keypad->irq);
-		return error;
-	}
-
-	error = input_register_device(input);
-	if (error) {
-		dev_err(&pdev->dev,
-			"unable to register input device: %d\n", error);
-		return error;
-	}
-
-	if (plat->wakeup_enable)
-		device_init_wakeup(&pdev->dev, true);
-
-	platform_set_drvdata(pdev, keypad);
-
-	return 0;
-}
-
-static int ske_keypad_suspend(struct device *dev)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-	struct ske_keypad *keypad = platform_get_drvdata(pdev);
-	int irq = platform_get_irq(pdev, 0);
-
-	if (device_may_wakeup(dev))
-		enable_irq_wake(irq);
-	else
-		ske_keypad_set_bits(keypad, SKE_IMSC, ~SKE_KPIMA, 0x0);
-
-	return 0;
-}
-
-static int ske_keypad_resume(struct device *dev)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-	struct ske_keypad *keypad = platform_get_drvdata(pdev);
-	int irq = platform_get_irq(pdev, 0);
-
-	if (device_may_wakeup(dev))
-		disable_irq_wake(irq);
-	else
-		ske_keypad_set_bits(keypad, SKE_IMSC, 0x0, SKE_KPIMA);
-
-	return 0;
-}
-
-static DEFINE_SIMPLE_DEV_PM_OPS(ske_keypad_dev_pm_ops,
-				ske_keypad_suspend, ske_keypad_resume);
-
-static struct platform_driver ske_keypad_driver = {
-	.driver = {
-		.name = "nmk-ske-keypad",
-		.pm = pm_sleep_ptr(&ske_keypad_dev_pm_ops),
-	},
-};
-
-module_platform_driver_probe(ske_keypad_driver, ske_keypad_probe);
-
-MODULE_LICENSE("GPL v2");
-MODULE_AUTHOR("Naveen Kumar <naveen.gaddipati@stericsson.com> / Sundar Iyer <sundar.iyer@stericsson.com>");
-MODULE_DESCRIPTION("Nomadik Scroll-Key-Encoder Keypad Driver");
-MODULE_ALIAS("platform:nomadik-ske-keypad");
diff --git a/include/linux/platform_data/keypad-nomadik-ske.h b/include/linux/platform_data/keypad-nomadik-ske.h
deleted file mode 100644
index 7efabbca1dca..000000000000
--- a/include/linux/platform_data/keypad-nomadik-ske.h
+++ /dev/null
@@ -1,50 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) ST-Ericsson SA 2010
- *
- * Author: Naveen Kumar Gaddipati <naveen.gaddipati@stericsson.com>
- *
- * ux500 Scroll key and Keypad Encoder (SKE) header
- */
-
-#ifndef __SKE_H
-#define __SKE_H
-
-#include <linux/input/matrix_keypad.h>
-
-/* register definitions for SKE peripheral */
-#define SKE_CR		0x00
-#define SKE_VAL0	0x04
-#define SKE_VAL1	0x08
-#define SKE_DBCR	0x0C
-#define SKE_IMSC	0x10
-#define SKE_RIS		0x14
-#define SKE_MIS		0x18
-#define SKE_ICR		0x1C
-
-/*
- * Keypad module
- */
-
-/**
- * struct keypad_platform_data - structure for platform specific data
- * @init:	pointer to keypad init function
- * @exit:	pointer to keypad deinitialisation function
- * @keymap_data: matrix scan code table for keycodes
- * @krow:	maximum number of rows
- * @kcol:	maximum number of columns
- * @debounce_ms: platform specific debounce time
- * @no_autorepeat: flag for auto repetition
- * @wakeup_enable: allow waking up the system
- */
-struct ske_keypad_platform_data {
-	int (*init)(void);
-	int (*exit)(void);
-	const struct matrix_keymap_data *keymap_data;
-	u8 krow;
-	u8 kcol;
-	u8 debounce_ms;
-	bool no_autorepeat;
-	bool wakeup_enable;
-};
-#endif	/*__SKE_KPD_H*/
-- 
2.46.0.184.g6999bdac58-goog


-- 
Dmitry

