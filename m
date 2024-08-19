Return-Path: <linux-input+bounces-5647-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B209562E9
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 07:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11D281C21286
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 05:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87F3159583;
	Mon, 19 Aug 2024 04:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bTdgmkrK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07071158D94;
	Mon, 19 Aug 2024 04:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724043521; cv=none; b=L8R9OxDNZQ1Onz6hUA6UHnfIrBPGAOyZnMgSB8xkYhAsBxV7g3GhvM/HCHryRt/y+PeUX+Dzn50CqT542u39SywDlyw7eqvbGkWHN73gwW4VH7V4AEEkIoOiRkZShRq1NhceOZiE5W3eAbDJPcvxO7lxss7xF0qHFTwF1b+D32U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724043521; c=relaxed/simple;
	bh=xymCWFAdt2li2mS6XF3ulx50Wm+dPQnKiQopB489exs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ozGbzHoTvaqW0ea+izSln/Rz0gthhfF4MGC4IA0ntAUpFllQ/+KoVB+2wu3Qj5EFvbGbnL4gcyX65I+1RueXo18VQOx7bObVhWALpIO1CGV3DFwehAzrZUpciE+U4WE25cDgaipJjWYhVj3ALz2vXCHH7FaWs8v8VJztM4d9JYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bTdgmkrK; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7a115c427f1so2377395a12.0;
        Sun, 18 Aug 2024 21:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724043519; x=1724648319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5aFFwx+23c+SuWLKFR8CIgT2nsj1neFDbQ+3clMGIs=;
        b=bTdgmkrKqdCBpovK7inhD4AJQCLl2qPvAz3Q9zOwlG5KRKU3iWjEq9tMofq7BbJ8B3
         99TsDV4HH+fUXeiW8DXBCnAtw0XIZzZnf222b8bFqrqeUHkaBZ92RNXnfECBI5fJJ5Mk
         uBh59E86FxoEYqb3/zDYM5fJO07/nLr5l9hGEnuivI62CuKtuQPLMBg7IO9sGnlqr8vV
         tRYwCW9PLeVVle7z1R1/mCscWWllJt8Y7flo7LS9BQ2omCJVL0aq0eRicak5TgK4xQ9l
         kx7A77Z7M1P80nEjLQUuES3x7HV+YUUYzgvOx7PbAPqhZ5Bw8ARgfwgd8FbZDlmFt6VY
         Z59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724043519; x=1724648319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5aFFwx+23c+SuWLKFR8CIgT2nsj1neFDbQ+3clMGIs=;
        b=nBEQJwOxsbs2qx5mSSYWqe17xVZV6tOvymhfsHfyeg1GhBpThy0YsmZFrI8LuuePAk
         ujkBBPXHZtmzXBwT+OGLVSTJHtZ9r7T9l6V8SbjbDWskRwGXFG9aKlp6slg54w38d6Ok
         GZEZMmvRig2PtFScskXZxbHtyfMBbX+RnCkugcmTMoS4jNfIcHS8G+7w3LXr9YGXccz/
         vVW83aolSYeImz5prsu4qzsuSSgamXn6fv8Fg5Kpw6DjJfl7lonSyjqSlWTeGASFB4wa
         /9KZ1tw+6rKPZDd0U+aSr9ZPaiqTu53wB01yhmHsc8XjFgHbEfEIIG8IMZQjDrQgKXsd
         aZ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUMMM12ViGW+6AB9XzqURR2d5uhC4Vo7kR1wzUSaxLbEoZBnt+Zvz08lzzTyBPL65eQBAGhqEgVcDc/@vger.kernel.org, AJvYcCV50w+Dl9kmGPaMYkVg+vCKkXipGVYHnJbOWHAFc7uZK8upIlFRCVEHFZm9vmgWNjmSE72Vy2Lzv9qP+Vub@vger.kernel.org, AJvYcCWUoupJCn4qB++gMEDkCfFnE9vTwBhwvRHenkZ1Kjb96WSNP6e1GdC5E3K5lbyt0k27tZr1QQ4h1bC0L64VlT+VpEA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2D4bbj2tlPXr2ifRYeDwUz9EPDf/4HGa2Ttf/BQzMOtfOxjQQ
	mxjNp7ZEowAsRldmt9djCC8vm6GS8J5AqyImvdRgsV8r22UEsBv/iSAWpg==
X-Google-Smtp-Source: AGHT+IF6+c/SUIcS1ZDv+kTMg0oMY4h55VBLJNBOlG+3D942PdoJjASXKzlhOZtFhmJ1ew44Ehhw0Q==
X-Received: by 2002:a05:6a21:9214:b0:1c4:21c0:ea0f with SMTP id adf61e73a8af0-1c905028143mr9543505637.33.1724043518915;
        Sun, 18 Aug 2024 21:58:38 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-202068497b4sm43483445ad.269.2024.08.18.21.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 21:58:38 -0700 (PDT)
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
Subject: [PATCH 11/14] ARM: s3c: crag6410: switch keypad device to software properties
Date: Sun, 18 Aug 2024 21:58:08 -0700
Message-ID: <20240819045813.2154642-12-dmitry.torokhov@gmail.com>
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

Switch the keypad device to use software properties to describe the
keypad. This will allow dropping support for platform data from the
samsung-keypad driver.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/Kconfig                |  5 ---
 arch/arm/mach-s3c/Kconfig.s3c64xx        |  1 -
 arch/arm/mach-s3c/Makefile.s3c64xx       |  1 -
 arch/arm/mach-s3c/devs.c                 | 27 ------------
 arch/arm/mach-s3c/devs.h                 |  1 -
 arch/arm/mach-s3c/keypad.h               | 27 ------------
 arch/arm/mach-s3c/mach-crag6410.c        | 56 ++++++++++++++++++------
 arch/arm/mach-s3c/setup-keypad-s3c64xx.c | 20 ---------
 8 files changed, 42 insertions(+), 96 deletions(-)
 delete mode 100644 arch/arm/mach-s3c/keypad.h
 delete mode 100644 arch/arm/mach-s3c/setup-keypad-s3c64xx.c

diff --git a/arch/arm/mach-s3c/Kconfig b/arch/arm/mach-s3c/Kconfig
index b3656109f1f7..2e77bb4f3a8c 100644
--- a/arch/arm/mach-s3c/Kconfig
+++ b/arch/arm/mach-s3c/Kconfig
@@ -111,11 +111,6 @@ config S3C64XX_DEV_SPI0
 	  Compile in platform device definitions for S3C64XX's type
 	  SPI controller 0
 
-config SAMSUNG_DEV_KEYPAD
-	bool
-	help
-	  Compile in platform device definitions for keypad
-
 config SAMSUNG_DEV_PWM
 	bool
 	help
diff --git a/arch/arm/mach-s3c/Kconfig.s3c64xx b/arch/arm/mach-s3c/Kconfig.s3c64xx
index 8f40af063ad6..cc1257fbf642 100644
--- a/arch/arm/mach-s3c/Kconfig.s3c64xx
+++ b/arch/arm/mach-s3c/Kconfig.s3c64xx
@@ -116,7 +116,6 @@ config MACH_WLF_CRAGG_6410
 	select S3C_DEV_I2C1
 	select S3C_DEV_USB_HOST
 	select S3C_DEV_USB_HSOTG
-	select SAMSUNG_DEV_KEYPAD
 	select SAMSUNG_DEV_PWM
 	help
 	  Machine support for the Wolfson Cragganmore S3C6410 variant.
diff --git a/arch/arm/mach-s3c/Makefile.s3c64xx b/arch/arm/mach-s3c/Makefile.s3c64xx
index 61287ad2ea42..1686b1f344f8 100644
--- a/arch/arm/mach-s3c/Makefile.s3c64xx
+++ b/arch/arm/mach-s3c/Makefile.s3c64xx
@@ -32,7 +32,6 @@ obj-y				+= dev-audio-s3c64xx.o
 obj-$(CONFIG_S3C64XX_SETUP_FB_24BPP)	+= setup-fb-24bpp-s3c64xx.o
 obj-$(CONFIG_S3C64XX_SETUP_I2C0)	+= setup-i2c0-s3c64xx.o
 obj-$(CONFIG_S3C64XX_SETUP_I2C1)	+= setup-i2c1-s3c64xx.o
-obj-$(CONFIG_S3C64XX_SETUP_KEYPAD)	+= setup-keypad-s3c64xx.o
 obj-$(CONFIG_S3C64XX_SETUP_SDHCI_GPIO)	+= setup-sdhci-gpio-s3c64xx.o
 obj-$(CONFIG_S3C64XX_SETUP_SPI)		+= setup-spi-s3c64xx.o
 obj-$(CONFIG_S3C64XX_SETUP_USB_PHY) += setup-usb-phy-s3c64xx.o
diff --git a/arch/arm/mach-s3c/devs.c b/arch/arm/mach-s3c/devs.c
index 8c26d592d2a3..31827cfc5700 100644
--- a/arch/arm/mach-s3c/devs.c
+++ b/arch/arm/mach-s3c/devs.c
@@ -40,7 +40,6 @@
 #include "devs.h"
 #include "fb.h"
 #include <linux/platform_data/i2c-s3c2410.h>
-#include "keypad.h"
 #include "pwm-core.h"
 #include "sdhci.h"
 #include "usb-phy.h"
@@ -266,32 +265,6 @@ void __init s3c_i2c1_set_platdata(struct s3c2410_platform_i2c *pd)
 }
 #endif /* CONFIG_S3C_DEV_I2C1 */
 
-/* KEYPAD */
-
-#ifdef CONFIG_SAMSUNG_DEV_KEYPAD
-static struct resource samsung_keypad_resources[] = {
-	[0] = DEFINE_RES_MEM(SAMSUNG_PA_KEYPAD, SZ_32),
-	[1] = DEFINE_RES_IRQ(IRQ_KEYPAD),
-};
-
-struct platform_device samsung_device_keypad = {
-	.name		= "samsung-keypad",
-	.id		= -1,
-	.num_resources	= ARRAY_SIZE(samsung_keypad_resources),
-	.resource	= samsung_keypad_resources,
-};
-
-void __init samsung_keypad_set_platdata(struct samsung_keypad_platdata *pd)
-{
-	struct samsung_keypad_platdata *npd;
-
-	npd = s3c_set_platdata(pd, sizeof(*npd), &samsung_device_keypad);
-
-	if (!npd->cfg_gpio)
-		npd->cfg_gpio = samsung_keypad_cfg_gpio;
-}
-#endif /* CONFIG_SAMSUNG_DEV_KEYPAD */
-
 /* PWM Timer */
 
 #ifdef CONFIG_SAMSUNG_DEV_PWM
diff --git a/arch/arm/mach-s3c/devs.h b/arch/arm/mach-s3c/devs.h
index 21c00786c264..2737990063b1 100644
--- a/arch/arm/mach-s3c/devs.h
+++ b/arch/arm/mach-s3c/devs.h
@@ -39,7 +39,6 @@ extern struct platform_device s3c_device_i2c1;
 extern struct platform_device s3c_device_ohci;
 extern struct platform_device s3c_device_usb_hsotg;
 
-extern struct platform_device samsung_device_keypad;
 extern struct platform_device samsung_device_pwm;
 
 /**
diff --git a/arch/arm/mach-s3c/keypad.h b/arch/arm/mach-s3c/keypad.h
deleted file mode 100644
index 9754b9a29945..000000000000
--- a/arch/arm/mach-s3c/keypad.h
+++ /dev/null
@@ -1,27 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0+ */
-/*
- * Samsung Platform - Keypad platform data definitions
- *
- * Copyright (C) 2010 Samsung Electronics Co.Ltd
- * Author: Joonyoung Shim <jy0922.shim@samsung.com>
- */
-
-#ifndef __PLAT_SAMSUNG_KEYPAD_H
-#define __PLAT_SAMSUNG_KEYPAD_H
-
-#include <linux/input/samsung-keypad.h>
-
-/**
- * samsung_keypad_set_platdata - Set platform data for Samsung Keypad device.
- * @pd: Platform data to register to device.
- *
- * Register the given platform data for use with Samsung Keypad device.
- * The call will copy the platform data, so the board definitions can
- * make the structure itself __initdata.
- */
-extern void samsung_keypad_set_platdata(struct samsung_keypad_platdata *pd);
-
-/* defined by architecture to configure gpio. */
-extern void samsung_keypad_cfg_gpio(unsigned int rows, unsigned int cols);
-
-#endif /* __PLAT_SAMSUNG_KEYPAD_H */
diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index e5df2cb51ab2..16b6ef312aaf 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/init.h>
 #include <linux/input-event-codes.h>
+#include <linux/input/matrix_keypad.h>
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
 #include <linux/leds.h>
@@ -53,7 +54,6 @@
 #include "gpio-cfg.h"
 #include <linux/platform_data/spi-s3c64xx.h>
 
-#include "keypad.h"
 #include "devs.h"
 #include "cpu.h"
 #include <linux/platform_data/i2c-s3c2410.h>
@@ -176,7 +176,7 @@ static struct s3c_fb_platdata crag6410_lcd_pdata = {
 
 /* 2x6 keypad */
 
-static uint32_t crag6410_keymap[] = {
+static const uint32_t crag6410_keymap[] __initconst = {
 	/* KEY(row, col, keycode) */
 	KEY(0, 0, KEY_VOLUMEUP),
 	KEY(0, 1, KEY_HOME),
@@ -192,17 +192,41 @@ static uint32_t crag6410_keymap[] = {
 	KEY(1, 5, KEY_CAMERA),
 };
 
-static struct matrix_keymap_data crag6410_keymap_data = {
-	.keymap		= crag6410_keymap,
-	.keymap_size	= ARRAY_SIZE(crag6410_keymap),
+static const struct property_entry crag6410_keypad_props[] __initconst = {
+	PROPERTY_ENTRY_U32("keypad,num-columns", 6),
+	PROPERTY_ENTRY_U32("keypad,num-rows", 2),
+	PROPERTY_ENTRY_U32_ARRAY("linux,keymap", crag6410_keymap),
+	{ }
 };
 
-static struct samsung_keypad_platdata crag6410_keypad_data = {
-	.keymap_data	= &crag6410_keymap_data,
-	.rows		= 2,
-	.cols		= 6,
+static const struct resource crag6410_keypad_resources[] __initconst = {
+	[0] = DEFINE_RES_MEM(SAMSUNG_PA_KEYPAD, SZ_32),
+	[1] = DEFINE_RES_IRQ(IRQ_KEYPAD),
 };
 
+static const struct platform_device_info crag6410_keypad_info __initconst = {
+	.name		= "samsung-keypad",
+	.id		= PLATFORM_DEVID_NONE,
+	.res		= crag6410_keypad_resources,
+	.num_res	= ARRAY_SIZE(crag6410_keypad_resources),
+	.properties	= crag6410_keypad_props,
+};
+
+static void __init crag6410_setup_keypad(void)
+{
+	struct platform_device *pd;
+
+	/* Set all the necessary GPK pins to special-function 3: KP_ROW[x] */
+	s3c_gpio_cfgrange_nopull(S3C64XX_GPK(8), 2, S3C_GPIO_SFN(3));
+
+	/* Set all the necessary GPL pins to special-function 3: KP_COL[x] */
+	s3c_gpio_cfgrange_nopull(S3C64XX_GPL(0), 6, S3C_GPIO_SFN(3));
+
+	pd = platform_device_register_full(&crag6410_keypad_info);
+	if (IS_ERR(pd))
+		pr_err("failed to instantiate keypad device");
+}
+
 static struct gpio_keys_button crag6410_gpio_keys[] = {
 	[0] = {
 		.code	= KEY_SUSPEND,
@@ -358,7 +382,7 @@ static struct platform_device wallvdd_device = {
 	},
 };
 
-static struct platform_device *crag6410_devices[] __initdata = {
+static struct platform_device *crag6410_devs0[] __initdata = {
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc2,
 	&s3c_device_i2c0,
@@ -369,8 +393,10 @@ static struct platform_device *crag6410_devices[] __initdata = {
 	&samsung_device_pwm,
 	&s3c64xx_device_iis0,
 	&s3c64xx_device_iis1,
-	&samsung_device_keypad,
 	&crag6410_gpio_keydev,
+};
+
+static struct platform_device *crag6410_devs1[] __initdata = {
 	&crag6410_dm9k_device,
 	&s3c64xx_device_spi0,
 	&crag6410_mmgpio,
@@ -864,13 +890,15 @@ static void __init crag6410_machine_init(void)
 	gpiod_add_lookup_table(&crag_wm1250_ev1_gpiod_table);
 	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));
 
-	samsung_keypad_set_platdata(&crag6410_keypad_data);
-
 	gpiod_add_lookup_table(&crag_spi0_gpiod_table);
 	s3c64xx_spi0_set_platdata(0, 2);
 
 	pwm_add_table(crag6410_pwm_lookup, ARRAY_SIZE(crag6410_pwm_lookup));
-	platform_add_devices(crag6410_devices, ARRAY_SIZE(crag6410_devices));
+	platform_add_devices(crag6410_devs0, ARRAY_SIZE(crag6410_devs0));
+
+	crag6410_setup_keypad();
+
+	platform_add_devices(crag6410_devs1, ARRAY_SIZE(crag6410_devs1));
 
 	gpio_led_register_device(-1, &gpio_leds_pdata);
 
diff --git a/arch/arm/mach-s3c/setup-keypad-s3c64xx.c b/arch/arm/mach-s3c/setup-keypad-s3c64xx.c
deleted file mode 100644
index 8463ad37c6ab..000000000000
--- a/arch/arm/mach-s3c/setup-keypad-s3c64xx.c
+++ /dev/null
@@ -1,20 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-//
-// Copyright (c) 2010 Samsung Electronics Co., Ltd.
-//		http://www.samsung.com/
-//
-// GPIO configuration for S3C64XX KeyPad device
-
-#include <linux/gpio.h>
-#include "gpio-cfg.h"
-#include "keypad.h"
-#include "gpio-samsung.h"
-
-void samsung_keypad_cfg_gpio(unsigned int rows, unsigned int cols)
-{
-	/* Set all the necessary GPK pins to special-function 3: KP_ROW[x] */
-	s3c_gpio_cfgrange_nopull(S3C64XX_GPK(8), rows, S3C_GPIO_SFN(3));
-
-	/* Set all the necessary GPL pins to special-function 3: KP_COL[x] */
-	s3c_gpio_cfgrange_nopull(S3C64XX_GPL(0), cols, S3C_GPIO_SFN(3));
-}
-- 
2.46.0.184.g6999bdac58-goog


