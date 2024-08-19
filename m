Return-Path: <linux-input+bounces-5650-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 636DC9562F5
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 07:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1728A28255B
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 05:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A23E15B0EB;
	Mon, 19 Aug 2024 04:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOegargB"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5FF15A87F;
	Mon, 19 Aug 2024 04:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724043525; cv=none; b=RfwVOBZFEhFdVdjSgnWk6vA0BDppGyOtpl5fgiFzieYYxm56hn+wAj6ltD91uUiyrzPn3px6MlffWfhd+2oVy/1H9H1JimpfNoNUAQv1SwuaU6GtteLT7e0BmIpWgLSe9Tg2uMNUCgm7JXwgL4wIJcbXrre0aR6mtKXHYnb6I9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724043525; c=relaxed/simple;
	bh=pujRvm4ARPdX6ZSe8VlYOOI1pXoBBQFVAweJDtzA4fA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gh3C1ybF8rnKkPqZ69AgsDdagsXSEMZaMllgQaS07JcstSVovNN/x9vG+7fS1yuOh4oiWnix4RDWTn9kHZnZCIjW+oYZM0Lk6nA7auoDWrb7zx0gmXmhenGvGX0E8Sc7NSQHnrkFWisbvPeAJBjo7KcI+0qHBDBbe1dl6nXQlIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOegargB; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20219a0fe4dso12788645ad.2;
        Sun, 18 Aug 2024 21:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724043523; x=1724648323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcaRHM3+7D0S7NodLplOw/AYGyYPhnOV3W4X3E8TpD0=;
        b=XOegargB0Baubnb0XGTm1rpMhRq6rbFhv72wL28uR4VYZaeoDqrbgEaO2IxqBxt2ji
         atLztTbLjvWcJ0nNKK886fLW3MVk2uPDPum5EWOks5JZHpAK8lckTYd1vXr/eaSC2Ega
         KEeeVhHo7WyvXprFfbmTlhZxcdz8wL6FI5awDRhGTc/FpHv/NM/sralpaMGMyYuiATzE
         XyY0mWVjHdWmtb0kGyCCG7i1Cgo55izVCzIUrUygxAO08CUIl+f0/T/UZ/4B2OzubcgX
         SniGLzz68uHtAB3md4miRyHp3j6fthTSeevv9GxdQ+A6nCX9HLODl0108x+7tF/2hz30
         Hh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724043523; x=1724648323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mcaRHM3+7D0S7NodLplOw/AYGyYPhnOV3W4X3E8TpD0=;
        b=vvF7AN1s5yS6UYCRJRyLbAlzHcE18/R8MHu0iiEgSttOVOonxaFEFMF9cJSbc84PgH
         zFS9Qy2y/zbaLb/tpLQ+/lKlJ0SqS28/F2q7PNr4cY1w/FxFdVE67PPx3aB1hT0m7EZe
         czcj0Xbj7FIDW9c76I5BnvoWe+sgh4NHGhjFkeQcam+DKi+Ep4PaGNWo7WLfZsVChNY3
         g/QZWMnATcqoPvhpzaKDwQywB0kdx4L8XIp06SFHHwa1UIz3tk2SLTSOVCB9y34vmf09
         hIlQZrfOj7A40tSYJhPcm5JlSiZvKgA670ZmHarSKtRcQ+cqbDo4R8Dl6Sb8eCljGKSx
         aVUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtoJrpgD7U5Nl5AD9FrP+GtApFm0dWdR2m1Pbzsx/0XlIRM1D4k/OfdNSWusyW6KQ+hIlLY8UE+JhdDrlPXqIHYQG1Iy6d1h2adYXcXItqRLceuXLMLlJ3ddN7ZjNUBPVtXaSn1RauLHAHCJ6YZsNI84BbUZp9v59p30xBhBjvMhvinwQiJqmM6nNS
X-Gm-Message-State: AOJu0YwqkUP23cBFneZnrtkh2MxU6DJ8lU1M523XDYQnCkhqTdNm9Kez
	xgoZzH+RRvdaN7fwVPMVx85DcRNs9RgDtVfKnZ2IvvJXEdrbqhtK
X-Google-Smtp-Source: AGHT+IHM1aUHr6FlaVm7qvuOxYje+ccNPFOl/JhsZ8ri8UtXMzODBg9MkExumxB7dA0FrEYWROONhg==
X-Received: by 2002:a17:902:cec9:b0:202:1033:8d25 with SMTP id d9443c01a7336-202195f9591mr81380085ad.35.1724043522899;
        Sun, 18 Aug 2024 21:58:42 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-202068497b4sm43483445ad.269.2024.08.18.21.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 21:58:42 -0700 (PDT)
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
Subject: [PATCH 14/14] ARM: s3c: crag6410 - convert GPIO lookup tables to property entries
Date: Sun, 18 Aug 2024 21:58:11 -0700
Message-ID: <20240819045813.2154642-15-dmitry.torokhov@gmail.com>
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

Static property entries support defining GPIOs and are more similar to
device tree properties and are not prone to losing link between device
and a lookup table because of changes in device name. Convert the board
to use them.

This also fixes issue with recent conversion to GPIO descriptors
where GPIO lookup tables were specifying incorrect GPIO chip name
("GPIO<N>" vs "GP<N>").

Fixes: 10a366f36e2a ("ASoC: wm1250-ev1: Convert to GPIO descriptors")
Fixes: a45cf3cc72dd ("spi: s3c64xx: Convert to use GPIO descriptors")
Fixes: 9a5ed0bac86e ("regulator: wm831x: Convert to use GPIO descriptors")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/devs.c          |  35 ----------
 arch/arm/mach-s3c/devs.h          |   1 -
 arch/arm/mach-s3c/mach-crag6410.c | 108 ++++++++++++++++++------------
 3 files changed, 67 insertions(+), 77 deletions(-)

diff --git a/arch/arm/mach-s3c/devs.c b/arch/arm/mach-s3c/devs.c
index 31827cfc5700..e24967cc648b 100644
--- a/arch/arm/mach-s3c/devs.c
+++ b/arch/arm/mach-s3c/devs.c
@@ -336,38 +336,3 @@ void __init dwc2_hsotg_set_platdata(struct dwc2_hsotg_plat *pd)
 		npd->phy_exit = s3c_usb_phy_exit;
 }
 #endif /* CONFIG_S3C_DEV_USB_HSOTG */
-
-#ifdef CONFIG_S3C64XX_DEV_SPI0
-static struct resource s3c64xx_spi0_resource[] = {
-	[0] = DEFINE_RES_MEM(S3C_PA_SPI0, SZ_256),
-	[1] = DEFINE_RES_IRQ(IRQ_SPI0),
-};
-
-struct platform_device s3c64xx_device_spi0 = {
-	.name		= "s3c6410-spi",
-	.id		= 0,
-	.num_resources	= ARRAY_SIZE(s3c64xx_spi0_resource),
-	.resource	= s3c64xx_spi0_resource,
-	.dev = {
-		.dma_mask		= &samsung_device_dma_mask,
-		.coherent_dma_mask	= DMA_BIT_MASK(32),
-	},
-};
-
-void __init s3c64xx_spi0_set_platdata(int src_clk_nr, int num_cs)
-{
-	struct s3c64xx_spi_info pd;
-
-	/* Reject invalid configuration */
-	if (!num_cs || src_clk_nr < 0) {
-		pr_err("%s: Invalid SPI configuration\n", __func__);
-		return;
-	}
-
-	pd.num_cs = num_cs;
-	pd.src_clk_nr = src_clk_nr;
-	pd.cfg_gpio = s3c64xx_spi0_cfg_gpio;
-
-	s3c_set_platdata(&pd, sizeof(pd), &s3c64xx_device_spi0);
-}
-#endif /* CONFIG_S3C64XX_DEV_SPI0 */
diff --git a/arch/arm/mach-s3c/devs.h b/arch/arm/mach-s3c/devs.h
index 2737990063b1..90a86ade3570 100644
--- a/arch/arm/mach-s3c/devs.h
+++ b/arch/arm/mach-s3c/devs.h
@@ -27,7 +27,6 @@ extern struct platform_device *s3c24xx_uart_src[];
 
 extern struct platform_device s3c64xx_device_iis0;
 extern struct platform_device s3c64xx_device_iis1;
-extern struct platform_device s3c64xx_device_spi0;
 
 extern struct platform_device s3c_device_fb;
 extern struct platform_device s3c_device_hsmmc0;
diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 6aa74db08af9..a7a25239793e 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -435,7 +435,6 @@ static struct platform_device *crag6410_devs0[] __initdata = {
 
 static struct platform_device *crag6410_devs1[] __initdata = {
 	&crag6410_dm9k_device,
-	&s3c64xx_device_spi0,
 	&crag6410_mmgpio,
 	&crag6410_lcd_powerdev,
 	&crag6410_backlight_device,
@@ -654,22 +653,13 @@ static struct wm831x_pdata crag_pmic_pdata = {
 	.touch = &touch_pdata,
 };
 
-/*
- * VDDARM is eventually ending up as a regulator hanging on the MFD cell device
- * "wm831x-buckv.1" spawn from drivers/mfd/wm831x-core.c.
- *
- * From the note on the platform data we can see that this is clearly DVS1
- * and assigned as dcdc1 resource to the MFD core which sets .id of the cell
- * spawning the DVS1 platform device to 1, then the cell platform device
- * name is calculated from 10*instance + id resulting in the device name
- * "wm831x-buckv.11"
- */
-static struct gpiod_lookup_table crag_pmic_gpiod_table = {
-	.dev_id = "wm831x-buckv.11",
-	.table = {
-		GPIO_LOOKUP("GPIOK", 0, "dvs", GPIO_ACTIVE_HIGH),
-		{ },
-	},
+static const struct property_entry crag_pmic_properties[] = {
+	PROPERTY_ENTRY_GPIO("dvs-gpios",
+			    SAMSUNG_GPIO_NODE('K'), 0, GPIO_ACTIVE_HIGH),
+	{ }
+};
+static const struct software_node crag_pmic_swnode = {
+	.properties = crag_pmic_properties,
 };
 
 static struct i2c_board_info i2c_devs0[] = {
@@ -680,6 +670,7 @@ static struct i2c_board_info i2c_devs0[] = {
 	{ I2C_BOARD_INFO("wm8312", 0x34),
 	  .platform_data = &crag_pmic_pdata,
 	  .irq = S3C_EINT(23),
+	  .swnode = &crag_pmic_swnode,
 	},
 };
 
@@ -774,17 +765,22 @@ static struct wm831x_pdata glenfarclas_pmic_pdata = {
 	.disable_touch = true,
 };
 
-static struct gpiod_lookup_table crag_wm1250_ev1_gpiod_table = {
-	/* The WM1250-EV1 is device 0027 on I2C bus 1 */
-	.dev_id = "1-0027",
-	.table = {
-		GPIO_LOOKUP("GPION", 12, "clk-ena", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("GPIOL", 12, "clk-sel0", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("GPIOL", 13, "clk-sel1", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("GPIOL", 14, "osr", GPIO_ACTIVE_HIGH),
-		GPIO_LOOKUP("GPIOL", 8, "master", GPIO_ACTIVE_HIGH),
-		{ },
-	},
+static const struct property_entry crag_wm1250_ev1_properties[] = {
+	PROPERTY_ENTRY_GPIO("clk-ena-gpios",
+			    SAMSUNG_GPIO_NODE('N'), 12, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("clk-sel0-gpios",
+			    SAMSUNG_GPIO_NODE('L'), 12, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("clk-sel1-gpios",
+			    SAMSUNG_GPIO_NODE('L'), 13, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("osr-gpios",
+			    SAMSUNG_GPIO_NODE('L'), 14, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("master-gpios",
+			    SAMSUNG_GPIO_NODE('L'), 8, GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node crag_wm1250_ev1_swnode = {
+	.properties = crag_wm1250_ev1_properties,
 };
 
 static struct i2c_board_info i2c_devs1[] = {
@@ -797,7 +793,8 @@ static struct i2c_board_info i2c_devs1[] = {
 	{ I2C_BOARD_INFO("wlf-gf-module", 0x24) },
 	{ I2C_BOARD_INFO("wlf-gf-module", 0x25) },
 	{ I2C_BOARD_INFO("wlf-gf-module", 0x26) },
-	{ I2C_BOARD_INFO("wm1250-ev1", 0x27), },
+	{ I2C_BOARD_INFO("wm1250-ev1", 0x27),
+          .swnode = &crag_wm1250_ev1_swnode, },
 };
 
 static struct s3c2410_platform_i2c i2c1_pdata = {
@@ -887,15 +884,48 @@ static const struct gpio_led_platform_data gpio_leds_pdata = {
 
 static struct dwc2_hsotg_plat crag6410_hsotg_pdata;
 
-static struct gpiod_lookup_table crag_spi0_gpiod_table = {
-	.dev_id = "s3c6410-spi.0",
-	.table = {
-		GPIO_LOOKUP_IDX("GPIOC", 3, "cs", 0, GPIO_ACTIVE_LOW),
-		GPIO_LOOKUP_IDX("GPION", 5, "cs", 1, GPIO_ACTIVE_LOW),
-		{ },
-	},
+static const struct software_node_ref_args crag6410_spi0_gpio_refs[] = {
+	SOFTWARE_NODE_REFERENCE(SAMSUNG_GPIO_NODE('C'), 3, GPIO_ACTIVE_LOW),
+	SOFTWARE_NODE_REFERENCE(SAMSUNG_GPIO_NODE('N'), 5, GPIO_ACTIVE_LOW),
+};
+
+static const struct property_entry crag6410_spi0_properties[] __initconst = {
+	PROPERTY_ENTRY_REF_ARRAY("cs-gpios", crag6410_spi0_gpio_refs),
+	{ }
 };
 
+static const struct resource crag6410_spi0_resource[] __initconst = {
+	[0] = DEFINE_RES_MEM(S3C_PA_SPI0, SZ_256),
+	[1] = DEFINE_RES_IRQ(IRQ_SPI0),
+};
+
+static const struct s3c64xx_spi_info crag6410_spi0_platform_data __initconst = {
+	.num_cs = 2,
+	.cfg_gpio = s3c64xx_spi0_cfg_gpio,
+};
+
+static const struct platform_device_info crag6410_spi0_info __initconst = {
+	.name		= "s3c6410-spi",
+	.id		= 0,
+	.res		= crag6410_spi0_resource,
+	.num_res	= ARRAY_SIZE(crag6410_spi0_resource),
+	.data		= &crag6410_spi0_platform_data,
+	.size_data	= sizeof(crag6410_spi0_platform_data),
+	.dma_mask	= DMA_BIT_MASK(32),
+	.properties	= crag6410_spi0_properties,
+};
+
+static void __init crag6410_setup_spi0(void)
+{
+	struct platform_device *pd;
+	int err;
+
+	pd = platform_device_register_full(&crag6410_spi0_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create spi0 device: %d\n", err);
+}
+
 static void __init crag6410_machine_init(void)
 {
 	/* Open drain IRQs need pullups */
@@ -922,19 +952,15 @@ static void __init crag6410_machine_init(void)
 	s3c_fb_set_platdata(&crag6410_lcd_pdata);
 	dwc2_hsotg_set_platdata(&crag6410_hsotg_pdata);
 
-	gpiod_add_lookup_table(&crag_pmic_gpiod_table);
 	i2c_register_board_info(0, i2c_devs0, ARRAY_SIZE(i2c_devs0));
-	gpiod_add_lookup_table(&crag_wm1250_ev1_gpiod_table);
 	i2c_register_board_info(1, i2c_devs1, ARRAY_SIZE(i2c_devs1));
 
-	gpiod_add_lookup_table(&crag_spi0_gpiod_table);
-	s3c64xx_spi0_set_platdata(0, 2);
-
 	pwm_add_table(crag6410_pwm_lookup, ARRAY_SIZE(crag6410_pwm_lookup));
 	platform_add_devices(crag6410_devs0, ARRAY_SIZE(crag6410_devs0));
 
 	crag6410_setup_keypad();
 	crag6410_setup_gpio_keys();
+	crag6410_setup_spi0();
 
 	platform_add_devices(crag6410_devs1, ARRAY_SIZE(crag6410_devs1));
 
-- 
2.46.0.184.g6999bdac58-goog


