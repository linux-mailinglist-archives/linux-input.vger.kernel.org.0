Return-Path: <linux-input+bounces-14068-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D754B2952C
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 23:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D293A200111
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 21:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9B12459FB;
	Sun, 17 Aug 2025 21:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUT95qh1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75C8211A11;
	Sun, 17 Aug 2025 21:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755466752; cv=none; b=s8tIPRkquTeam/cHE9n6kXyl+NpLdJG+ImkjtkLioXPS6luscBKJqaGHIIdXlfHJt4jtH9LYozJKbuzo9VspPXhF3NMabqXBRHZd2Sb3zVZfR3o93MJuh1nXWCbX2cpRjlOaATk6xHvfqh8MwJ1Adl/ksLzdzWVYeZNDcViLBEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755466752; c=relaxed/simple;
	bh=Au2hvNbd2Y2ELJ+lv9guGQoJJWAIBwxVp81OlPoOQSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k7cQOKjXrLPZ/csXglnSnj1hwkmxqw4UVldSueEf6jN/gXuGuDrdxGV/o3hRrQPLp+LvHoGp0Diy2viK2QN43+L+higcqr4Ryz9kOOWPROzTYKanm3Pc6BuEB5SVzsJO6Eo09bvA95cfRoZwam4194X8o3Ysm9spkSVIMeVT/b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUT95qh1; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2445805aa2eso27431015ad.1;
        Sun, 17 Aug 2025 14:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755466750; x=1756071550; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3CMHVYIxB9QEi8KWl30XfN+sR/a7DpIIYiGsyFTxqJo=;
        b=bUT95qh1fFhOV6ADJ3oCL5psxq9hObCbJEK/kBSQrAcXRIpTSouXNesQFgLIRkpAEG
         SXcfu3n2JfbF1cYtovVBqGSOLV0INNkQd1T19WHVi+46HpMD6q479k1KZMLl6JF09Lh5
         Vg+Fl+X9n/A3/N2AohwFMLtsf0j3u/iDmaHDSz57S5VxR1ovUWfW/6O2v2U1b8qzv3c3
         Cn3EG05EWxXI2Aeas+H69i0twG7xUsP2Lxc22J4v2nVIiLhWK16Qq7c4eNuiZfg7f2xA
         Gm9PaKBStGS+tP9adMTZr8usSaAewnAhrPHI3AxuQyAYRv59n/1ysfauf12PwnzjHkrt
         r1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755466750; x=1756071550;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3CMHVYIxB9QEi8KWl30XfN+sR/a7DpIIYiGsyFTxqJo=;
        b=va2ZW7aDJbkNQAXcFHJDYuavlVDTRClfPqc4f+BLvxF/8siCOqPRrY/50jEx+JMJ1/
         4maXkEpbC2wghwQbH+T+Bh/Nz+ZxG6GmpCG+hk38l+1c2pOEJeWipcXJci7Md+vmeulZ
         o3L2YNqTdat4VG5Me4wAOaiJ/Bt/ZAHvbDmcq4NzGGwrrD33bupeSsBSZl4p98sX2JCT
         LkyYiK5hOowINHRHV8WjyEdwgYk5jmP8tScbCdCoCv51DxdZLnm1iWWzEijRQKBrdaGv
         KZqQFs4a0k09Fob7kw+ftiSsI65TMOnHakYmhmVN0WghnaQy6a+KmeTDkkKt22RJ4Oud
         1Cig==
X-Forwarded-Encrypted: i=1; AJvYcCWrxQ3H8Yj26QHx8Z4nCdU/KSlhs7V9GDZUrewdBz3NNQgN5WKaxJFhSJ5rCuGIKU66s4Oye8hyJMknoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1TlI1D9HLSM7Fh8wb9lV109fkww7Xwu3QBAPbEs27FtH+IQ7T
	ebadq9pir9Chmv4LnbVccDeQm80+YppSIN71Voc75x1ekBe9+6DYAwS1yhe7oA==
X-Gm-Gg: ASbGncseZWNYMxl9cWXX27erP5krWpM//rBK8Wbt2YrivIvuSu2LbY57Vn7Too/N4+f
	idhSFYKd/Iwmpe2D0IjbrbiJsjGdNQ1/t6563X0QvzKINM/YUpQAI54trcJ/KZcswF4mhLCto0P
	dLbjxnhSCvGaGMHtBJuhaRcFhwwO8z1i4wWti05h7m/WxsVMgtOFuxnzw+nUrQeY33DV57jczT4
	4EM3qRUItrMO9gVeYHCTe9/5k1xEn9AjcyxkjDJSn5hDg84EKkpnri9XwFSlEbcJDnHSvYyG3KD
	mbCXFUfik4zrYCAxrk/JBqu2pq4VXur9dRvQMg4a4QkNoJNl3yifybCrayVG4uQfdOqF1LdtTeZ
	XvKye6uAaWqPN5gUu0NKaGg==
X-Google-Smtp-Source: AGHT+IFH2OeFOYErbglAeZo0Dnd4mUXd4S+FqvYy1HcUgpKE4bboTMf8zZuZgXCQsZYOLX+2w4Hd5g==
X-Received: by 2002:a17:902:f647:b0:234:bca7:2920 with SMTP id d9443c01a7336-2446d744f72mr169866775ad.24.1755466749608;
        Sun, 17 Aug 2025 14:39:09 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:11e:c24d:ff01:22c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d56e9e5sm62021205ad.148.2025.08.17.14.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 14:39:08 -0700 (PDT)
Date: Sun, 17 Aug 2025 14:39:06 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Rajeev Kumar <rajeevkumar.linux@gmail.com>, linux-input@vger.kernel.org
Subject: [PATCH] Input: spear-keyboard - drop support for platform data
Message-ID: <vppjxui76im26uamznx7evm5lmbe3d6v3oxsa7mqyytykh4zm6@nhlf33v3hp6g>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There are no in-kernel users of spear kbd_platform_data in the kernel,
and the driver supports configuration via device tree, so drop
support of static platform data and move properties parsing from
OF-specific methods to generic ones.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/spear-keyboard.c      |  71 ++------
 include/linux/platform_data/keyboard-spear.h | 164 -------------------
 2 files changed, 15 insertions(+), 220 deletions(-)

diff --git a/drivers/input/keyboard/spear-keyboard.c b/drivers/input/keyboard/spear-keyboard.c
index e3abc1484520..d0420b125571 100644
--- a/drivers/input/keyboard/spear-keyboard.c
+++ b/drivers/input/keyboard/spear-keyboard.c
@@ -14,6 +14,7 @@
 #include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/input.h>
+#include <linux/input/matrix_keypad.h>
 #include <linux/io.h>
 #include <linux/irq.h>
 #include <linux/kernel.h>
@@ -22,7 +23,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/types.h>
-#include <linux/platform_data/keyboard-spear.h>
 
 /* Keyboard Registers */
 #define MODE_CTL_REG	0x00
@@ -56,13 +56,12 @@ struct spear_kbd {
 	void __iomem *io_base;
 	struct clk *clk;
 	unsigned int irq;
-	unsigned int mode;
-	unsigned int suspended_rate;
+	u32 mode;
+	u32 suspended_rate;
+	u32 mode_ctl_reg;
 	unsigned short last_key;
 	unsigned short keycodes[NUM_ROWS * NUM_COLS];
-	bool rep;
 	bool irq_wake_enabled;
-	u32 mode_ctl_reg;
 };
 
 static irqreturn_t spear_kbd_interrupt(int irq, void *dev_id)
@@ -143,46 +142,8 @@ static void spear_kbd_close(struct input_dev *dev)
 	kbd->last_key = KEY_RESERVED;
 }
 
-#ifdef CONFIG_OF
-static int spear_kbd_parse_dt(struct platform_device *pdev,
-                                        struct spear_kbd *kbd)
-{
-	struct device_node *np = pdev->dev.of_node;
-	int error;
-	u32 val, suspended_rate;
-
-	if (!np) {
-		dev_err(&pdev->dev, "Missing DT data\n");
-		return -EINVAL;
-	}
-
-	if (of_property_read_bool(np, "autorepeat"))
-		kbd->rep = true;
-
-	if (of_property_read_u32(np, "suspended_rate", &suspended_rate))
-		kbd->suspended_rate = suspended_rate;
-
-	error = of_property_read_u32(np, "st,mode", &val);
-	if (error) {
-		dev_err(&pdev->dev, "DT: Invalid or missing mode\n");
-		return error;
-	}
-
-	kbd->mode = val;
-	return 0;
-}
-#else
-static inline int spear_kbd_parse_dt(struct platform_device *pdev,
-				     struct spear_kbd *kbd)
-{
-	return -ENOSYS;
-}
-#endif
-
 static int spear_kbd_probe(struct platform_device *pdev)
 {
-	struct kbd_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	const struct matrix_keymap_data *keymap = pdata ? pdata->keymap : NULL;
 	struct spear_kbd *kbd;
 	struct input_dev *input_dev;
 	int irq;
@@ -198,6 +159,14 @@ static int spear_kbd_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	error = device_property_read_u32(&pdev->dev, "st,mode", &kbd->mode);
+	if (error) {
+		dev_err(&pdev->dev, "Invalid or missing mode\n");
+		return error;
+	}
+
+	device_property_read_u32(&pdev->dev, "suspended_rate", &kbd->suspended_rate);
+
 	input_dev = devm_input_allocate_device(&pdev->dev);
 	if (!input_dev) {
 		dev_err(&pdev->dev, "unable to allocate input device\n");
@@ -207,16 +176,6 @@ static int spear_kbd_probe(struct platform_device *pdev)
 	kbd->input = input_dev;
 	kbd->irq = irq;
 
-	if (!pdata) {
-		error = spear_kbd_parse_dt(pdev, kbd);
-		if (error)
-			return error;
-	} else {
-		kbd->mode = pdata->mode;
-		kbd->rep = pdata->rep;
-		kbd->suspended_rate = pdata->suspended_rate;
-	}
-
 	kbd->io_base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(kbd->io_base))
 		return PTR_ERR(kbd->io_base);
@@ -234,21 +193,21 @@ static int spear_kbd_probe(struct platform_device *pdev)
 	input_dev->open = spear_kbd_open;
 	input_dev->close = spear_kbd_close;
 
-	error = matrix_keypad_build_keymap(keymap, NUM_ROWS, NUM_COLS,
+	error = matrix_keypad_build_keymap(NULL, NUM_ROWS, NUM_COLS,
 					   kbd->keycodes, input_dev);
 	if (error) {
 		dev_err(&pdev->dev, "Failed to build keymap\n");
 		return error;
 	}
 
-	if (kbd->rep)
+	if (device_property_read_bool(&pdev->dev, "autorepeat"))
 		__set_bit(EV_REP, input_dev->evbit);
 	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
 
 	input_set_drvdata(input_dev, kbd);
 
 	error = devm_request_irq(&pdev->dev, irq, spear_kbd_interrupt, 0,
-			"keyboard", kbd);
+				 "keyboard", kbd);
 	if (error) {
 		dev_err(&pdev->dev, "request_irq failed\n");
 		return error;
diff --git a/include/linux/platform_data/keyboard-spear.h b/include/linux/platform_data/keyboard-spear.h
deleted file mode 100644
index 5e3ff653900c..000000000000
--- a/include/linux/platform_data/keyboard-spear.h
+++ /dev/null
@@ -1,164 +0,0 @@
-/*
- * Copyright (C) 2010 ST Microelectronics
- * Rajeev Kumar <rajeevkumar.linux@gmail.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
- */
-
-#ifndef __PLAT_KEYBOARD_H
-#define __PLAT_KEYBOARD_H
-
-#include <linux/bitops.h>
-#include <linux/input.h>
-#include <linux/input/matrix_keypad.h>
-#include <linux/types.h>
-
-#define DECLARE_9x9_KEYMAP(_name) \
-int _name[] = { \
-	KEY(0, 0, KEY_ESC), \
-	KEY(0, 1, KEY_1), \
-	KEY(0, 2, KEY_2), \
-	KEY(0, 3, KEY_3), \
-	KEY(0, 4, KEY_4), \
-	KEY(0, 5, KEY_5), \
-	KEY(0, 6, KEY_6), \
-	KEY(0, 7, KEY_7), \
-	KEY(0, 8, KEY_8), \
-	KEY(1, 0, KEY_9), \
-	KEY(1, 1, KEY_MINUS), \
-	KEY(1, 2, KEY_EQUAL), \
-	KEY(1, 3, KEY_BACKSPACE), \
-	KEY(1, 4, KEY_TAB), \
-	KEY(1, 5, KEY_Q), \
-	KEY(1, 6, KEY_W), \
-	KEY(1, 7, KEY_E), \
-	KEY(1, 8, KEY_R), \
-	KEY(2, 0, KEY_T), \
-	KEY(2, 1, KEY_Y), \
-	KEY(2, 2, KEY_U), \
-	KEY(2, 3, KEY_I), \
-	KEY(2, 4, KEY_O), \
-	KEY(2, 5, KEY_P), \
-	KEY(2, 6, KEY_LEFTBRACE), \
-	KEY(2, 7, KEY_RIGHTBRACE), \
-	KEY(2, 8, KEY_ENTER), \
-	KEY(3, 0, KEY_LEFTCTRL), \
-	KEY(3, 1, KEY_A), \
-	KEY(3, 2, KEY_S), \
-	KEY(3, 3, KEY_D), \
-	KEY(3, 4, KEY_F), \
-	KEY(3, 5, KEY_G), \
-	KEY(3, 6, KEY_H), \
-	KEY(3, 7, KEY_J), \
-	KEY(3, 8, KEY_K), \
-	KEY(4, 0, KEY_L), \
-	KEY(4, 1, KEY_SEMICOLON), \
-	KEY(4, 2, KEY_APOSTROPHE), \
-	KEY(4, 3, KEY_GRAVE), \
-	KEY(4, 4, KEY_LEFTSHIFT), \
-	KEY(4, 5, KEY_BACKSLASH), \
-	KEY(4, 6, KEY_Z), \
-	KEY(4, 7, KEY_X), \
-	KEY(4, 8, KEY_C), \
-	KEY(5, 0, KEY_V), \
-	KEY(5, 1, KEY_B), \
-	KEY(5, 2, KEY_N), \
-	KEY(5, 3, KEY_M), \
-	KEY(5, 4, KEY_COMMA), \
-	KEY(5, 5, KEY_DOT), \
-	KEY(5, 6, KEY_SLASH), \
-	KEY(5, 7, KEY_RIGHTSHIFT), \
-	KEY(5, 8, KEY_KPASTERISK), \
-	KEY(6, 0, KEY_LEFTALT), \
-	KEY(6, 1, KEY_SPACE), \
-	KEY(6, 2, KEY_CAPSLOCK), \
-	KEY(6, 3, KEY_F1), \
-	KEY(6, 4, KEY_F2), \
-	KEY(6, 5, KEY_F3), \
-	KEY(6, 6, KEY_F4), \
-	KEY(6, 7, KEY_F5), \
-	KEY(6, 8, KEY_F6), \
-	KEY(7, 0, KEY_F7), \
-	KEY(7, 1, KEY_F8), \
-	KEY(7, 2, KEY_F9), \
-	KEY(7, 3, KEY_F10), \
-	KEY(7, 4, KEY_NUMLOCK), \
-	KEY(7, 5, KEY_SCROLLLOCK), \
-	KEY(7, 6, KEY_KP7), \
-	KEY(7, 7, KEY_KP8), \
-	KEY(7, 8, KEY_KP9), \
-	KEY(8, 0, KEY_KPMINUS), \
-	KEY(8, 1, KEY_KP4), \
-	KEY(8, 2, KEY_KP5), \
-	KEY(8, 3, KEY_KP6), \
-	KEY(8, 4, KEY_KPPLUS), \
-	KEY(8, 5, KEY_KP1), \
-	KEY(8, 6, KEY_KP2), \
-	KEY(8, 7, KEY_KP3), \
-	KEY(8, 8, KEY_KP0), \
-}
-
-#define DECLARE_6x6_KEYMAP(_name) \
-int _name[] = { \
-	KEY(0, 0, KEY_RESERVED), \
-	KEY(0, 1, KEY_1), \
-	KEY(0, 2, KEY_2), \
-	KEY(0, 3, KEY_3), \
-	KEY(0, 4, KEY_4), \
-	KEY(0, 5, KEY_5), \
-	KEY(1, 0, KEY_Q), \
-	KEY(1, 1, KEY_W), \
-	KEY(1, 2, KEY_E), \
-	KEY(1, 3, KEY_R), \
-	KEY(1, 4, KEY_T), \
-	KEY(1, 5, KEY_Y), \
-	KEY(2, 0, KEY_D), \
-	KEY(2, 1, KEY_F), \
-	KEY(2, 2, KEY_G), \
-	KEY(2, 3, KEY_H), \
-	KEY(2, 4, KEY_J), \
-	KEY(2, 5, KEY_K), \
-	KEY(3, 0, KEY_B), \
-	KEY(3, 1, KEY_N), \
-	KEY(3, 2, KEY_M), \
-	KEY(3, 3, KEY_COMMA), \
-	KEY(3, 4, KEY_DOT), \
-	KEY(3, 5, KEY_SLASH), \
-	KEY(4, 0, KEY_F6), \
-	KEY(4, 1, KEY_F7), \
-	KEY(4, 2, KEY_F8), \
-	KEY(4, 3, KEY_F9), \
-	KEY(4, 4, KEY_F10), \
-	KEY(4, 5, KEY_NUMLOCK), \
-	KEY(5, 0, KEY_KP2), \
-	KEY(5, 1, KEY_KP3), \
-	KEY(5, 2, KEY_KP0), \
-	KEY(5, 3, KEY_KPDOT), \
-	KEY(5, 4, KEY_RO), \
-	KEY(5, 5, KEY_ZENKAKUHANKAKU), \
-}
-
-#define KEYPAD_9x9     0
-#define KEYPAD_6x6     1
-#define KEYPAD_2x2     2
-
-/**
- * struct kbd_platform_data - spear keyboard platform data
- * keymap: pointer to keymap data (table and size)
- * rep: enables key autorepeat
- * mode: choose keyboard support(9x9, 6x6, 2x2)
- * suspended_rate: rate at which keyboard would operate in suspended mode
- *
- * This structure is supposed to be used by platform code to supply
- * keymaps to drivers that implement keyboards.
- */
-struct kbd_platform_data {
-	const struct matrix_keymap_data *keymap;
-	bool rep;
-	unsigned int mode;
-	unsigned int suspended_rate;
-};
-
-#endif /* __PLAT_KEYBOARD_H */
-- 
2.51.0.rc1.163.g2494970778-goog


-- 
Dmitry

