Return-Path: <linux-input+bounces-5649-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 022619562F0
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 07:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75BB81F2243A
	for <lists+linux-input@lfdr.de>; Mon, 19 Aug 2024 05:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2461A15AACA;
	Mon, 19 Aug 2024 04:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NiWiQ05z"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7DE15A848;
	Mon, 19 Aug 2024 04:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724043524; cv=none; b=Zgk7tbx5p22jI82XCaNGqDNrgWB+goN6B+nzXugRabrbX346JPAZMDyJUgf4yRNrJRlRe3o0A0e3DhQHBxV8iNo9igACWPZcd4HHZZ9utTTzLBjMuDt2fsWJbVU1IsFkqKhu5hApK27lQ5Vug4W6z9aeiySGH6X4Ei7RwI5Ek94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724043524; c=relaxed/simple;
	bh=AEeG1xs1Mo6IMy9hjEfxZ0HM7nzDeiYiYP7RwqNj8xU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LyRmdBzmYLKOQd3G00EYhFmqu2kf4AkExstmGN5s73TKfv6JBzLcE08ibA2raWOpch7XT/Zrjl2roJ6NUX5vLl/y2VAXopzEKfi5FphLKBZMlPE14kzgw1OGWwhuQRuT/nfaDG3aiilx0FxCniqP3jQ+4IbpcyJsH8Mf9hcucsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NiWiQ05z; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-70d1a74a43bso2537815b3a.1;
        Sun, 18 Aug 2024 21:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724043522; x=1724648322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eUVnJCiaOH4gHrsZTqwSAhSPsq16l6gA97EkZUZefw=;
        b=NiWiQ05z7kfjsMXYVJFcftXkHtoRJFT2V8qL7Nyfx3D/Ibqb62EtOciucpNSQVTLL8
         e+GVP4AFzWnGwvqz7T4WXS2iBWFBVhfJwqso/ivzNkPfZ+eyORanAPU1XwlQlXsCYTke
         xEI9kXc5G8mSTOrGUmIjoMj7LlKx6/HMWRVlEKVIHDjXkeS1cKwNcPynhAVDzvTucTq1
         5jQjLbZjqXBBj/yUZ9LQLjLWJ8avZU1/ebJybGNk/wJGWErRGFgIu1Gkk+e3hvRBKxBu
         KR//OxHomfRr/+haOLbXdMH2kABBzDqbzCkrpf4W8wFYDQ3FAJnwVoODssU5jCtuQGX7
         iYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724043522; x=1724648322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4eUVnJCiaOH4gHrsZTqwSAhSPsq16l6gA97EkZUZefw=;
        b=OdAD7OYdCaliCfLIBHX5OfJe7plpmPKuWxLzkVWQdwEhG/i569qWjxdAwQJtgsRUWs
         bAWo2drtKH7m5/y3PB5gaa7J+1GZFwM4Vr4lLq8ijf6vu5g0Ro5mTciV59tY1gjEq1WW
         1ALL6sCoGNNd9UC57WVWyXi57f0O7u2psAOqMEuq5kuIiA0G6aChqiG9vWdGf/bnKJqc
         l1BI3SzzzeCPM8klJg+DN/Lau1VasgVxN3AdRfs2VaGEF8zbY9HHvxyOdZxacjMgmnPy
         Kn/uPzD5zsT6GVX3jfT4EwWP3X+C99DYh1WIi5xOU1Oi5PwyYagzWVZXZaro8Rh9oQcZ
         7+5w==
X-Forwarded-Encrypted: i=1; AJvYcCU1nRJH0uM7PQoVbwpHF0OEpm5auW06jmi7+FxxGBWPhkXtAvgAPjLcUl6vIfPLlIQEgTQ4wlX09OU3xnKDXN9glBZoOE2EZkR2EO10nMEjv5/lw0LqMacCBEJ6CDOHLgQkp4Gnd2h5gTASIgWCwHgNR5KAg92sYARIKe81ECGzLEnuG+ujQIKiqcCh
X-Gm-Message-State: AOJu0YzS508elv8zY6+V7XKQrloAgJvsgkZp8otjKsgxD5ILvTs3ik56
	O8iP6DkqNhco8e17lvwat+or/Zsa5pBN80KreagGMLfSeI1YJBS0
X-Google-Smtp-Source: AGHT+IGRVSygdM6hpmh+EBYSfTexfu4NsM7V1O+dclZkiFZItYo/YpJLstamCl3xCNYn6/J/5tsEyw==
X-Received: by 2002:a05:6a20:c990:b0:1c6:a825:8bc1 with SMTP id adf61e73a8af0-1c904fb6ea7mr9172205637.29.1724043521355;
        Sun, 18 Aug 2024 21:58:41 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4eb5:4500:6efc:6c24])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-202068497b4sm43483445ad.269.2024.08.18.21.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 21:58:41 -0700 (PDT)
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
Subject: [PATCH 13/14] ARM: s3c: crag6410: use software nodes/properties to set up GPIO keys
Date: Sun, 18 Aug 2024 21:58:10 -0700
Message-ID: <20240819045813.2154642-14-dmitry.torokhov@gmail.com>
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

Switch the gpio-keys device to use software inodes/properties to
describe the buttons and switches. This will allow dropping support
for platform data from the gpio-keys driver in the future.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/gpio-samsung-s3c64xx.h |  5 ++
 arch/arm/mach-s3c/gpio-samsung.c         | 35 +++++++++++
 arch/arm/mach-s3c/mach-crag6410.c        | 80 +++++++++++++++++-------
 3 files changed, 99 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-s3c/gpio-samsung-s3c64xx.h b/arch/arm/mach-s3c/gpio-samsung-s3c64xx.h
index 8ed144a0d474..7cf16cc085ea 100644
--- a/arch/arm/mach-s3c/gpio-samsung-s3c64xx.h
+++ b/arch/arm/mach-s3c/gpio-samsung-s3c64xx.h
@@ -13,6 +13,8 @@
 
 #ifdef CONFIG_GPIO_SAMSUNG
 
+#include <linux/property.h>
+
 /* GPIO bank sizes */
 #define S3C64XX_GPIO_A_NR	(8)
 #define S3C64XX_GPIO_B_NR	(7)
@@ -89,6 +91,9 @@ enum s3c_gpio_number {
 /* define the number of gpios we need to the one after the GPQ() range */
 #define GPIO_BOARD_START (S3C64XX_GPQ(S3C64XX_GPIO_Q_NR) + 1)
 
+extern const struct software_node samsung_gpiochip_nodes[];
+#define SAMSUNG_GPIO_NODE(node)	&samsung_gpiochip_nodes[(node) - 'A']
+
 #endif /* GPIO_SAMSUNG */
 #endif /* GPIO_SAMSUNG_S3C64XX_H */
 
diff --git a/arch/arm/mach-s3c/gpio-samsung.c b/arch/arm/mach-s3c/gpio-samsung.c
index 87daaa09e2c3..82f325112d30 100644
--- a/arch/arm/mach-s3c/gpio-samsung.c
+++ b/arch/arm/mach-s3c/gpio-samsung.c
@@ -21,6 +21,7 @@
 #include <linux/device.h>
 #include <linux/ioport.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/of_address.h>
 
@@ -788,6 +789,38 @@ static struct samsung_gpio_chip s3c64xx_gpios_2bit[] = {
 	},
 };
 
+const struct software_node samsung_gpiochip_nodes[] = {
+	SOFTWARE_NODE("GPA", NULL, NULL),
+	SOFTWARE_NODE("GPB", NULL, NULL),
+	SOFTWARE_NODE("GPC", NULL, NULL),
+	SOFTWARE_NODE("GPD", NULL, NULL),
+	SOFTWARE_NODE("GPE", NULL, NULL),
+	SOFTWARE_NODE("GPF", NULL, NULL),
+	SOFTWARE_NODE("GPG", NULL, NULL),
+	SOFTWARE_NODE("GPH", NULL, NULL),
+	SOFTWARE_NODE("GPI", NULL, NULL),
+	SOFTWARE_NODE("GPJ", NULL, NULL),
+	SOFTWARE_NODE("GPK", NULL, NULL),
+	SOFTWARE_NODE("GPL", NULL, NULL),
+	SOFTWARE_NODE("GPM", NULL, NULL),
+	SOFTWARE_NODE("GPN", NULL, NULL),
+	SOFTWARE_NODE("GPO", NULL, NULL),
+	SOFTWARE_NODE("GPP", NULL, NULL),
+	SOFTWARE_NODE("GPQ", NULL, NULL),
+};
+#define NUM_SAMSUNG_GPIOCHIPS ARRAY_SIZE(samsung_gpiochip_nodes)
+
+static void __init samsung_setup_gpiochip_nodes(void)
+{
+	const struct software_node *group[NUM_SAMSUNG_GPIOCHIPS + 1] = { 0 };
+	int i;
+
+	for (i = 0; i < NUM_SAMSUNG_GPIOCHIPS; i++)
+		group[i] = &samsung_gpiochip_nodes[i];
+
+	software_node_register_node_group(group);
+}
+
 /* TODO: cleanup soc_is_* */
 static __init int samsung_gpiolib_init(void)
 {
@@ -811,6 +844,8 @@ static __init int samsung_gpiolib_init(void)
 				S3C64XX_VA_GPIO);
 		samsung_gpiolib_add_4bit2_chips(s3c64xx_gpios_4bit2,
 				ARRAY_SIZE(s3c64xx_gpios_4bit2));
+
+		samsung_setup_gpiochip_nodes();
 	}
 
 	return 0;
diff --git a/arch/arm/mach-s3c/mach-crag6410.c b/arch/arm/mach-s3c/mach-crag6410.c
index 16b6ef312aaf..6aa74db08af9 100644
--- a/arch/arm/mach-s3c/mach-crag6410.c
+++ b/arch/arm/mach-s3c/mach-crag6410.c
@@ -18,11 +18,13 @@
 #include <linux/input/matrix_keypad.h>
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/property.h>
 #include <linux/leds.h>
 #include <linux/delay.h>
 #include <linux/mmc/host.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/fixed.h>
+#include <linux/property.h>
 #include <linux/pwm.h>
 #include <linux/pwm_backlight.h>
 #include <linux/dm9000.h>
@@ -227,32 +229,68 @@ static void __init crag6410_setup_keypad(void)
 		pr_err("failed to instantiate keypad device");
 }
 
-static struct gpio_keys_button crag6410_gpio_keys[] = {
-	[0] = {
-		.code	= KEY_SUSPEND,
-		.gpio	= S3C64XX_GPL(10),	/* EINT 18 */
-		.type	= EV_KEY,
-		.wakeup	= 1,
-		.active_low = 1,
-	},
-	[1] = {
-		.code	= SW_FRONT_PROXIMITY,
-		.gpio	= S3C64XX_GPN(11),	/* EINT 11 */
-		.type	= EV_SW,
-	},
+static const struct software_node crag6410_gpio_keys_node = {
+	.name = "crag6410-gpio-keys",
 };
 
-static struct gpio_keys_platform_data crag6410_gpio_keydata = {
-	.buttons	= crag6410_gpio_keys,
-	.nbuttons	= ARRAY_SIZE(crag6410_gpio_keys),
+static const struct property_entry crag6410_suspend_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_SUSPEND),
+	PROPERTY_ENTRY_GPIO("gpios",
+			    SAMSUNG_GPIO_NODE('L'), 10,	/* EINT 18 */
+			    GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
 };
 
-static struct platform_device crag6410_gpio_keydev = {
-	.name		= "gpio-keys",
-	.id		= 0,
-	.dev.platform_data = &crag6410_gpio_keydata,
+static const struct software_node crag6410_suspend_key_node = {
+	.parent = &crag6410_gpio_keys_node,
+	.properties = crag6410_suspend_key_props,
+};
+
+static const struct property_entry crag6410_prox_sw_props[] = {
+	PROPERTY_ENTRY_U32("linux,type", EV_SW),
+	PROPERTY_ENTRY_U32("linux,code", SW_FRONT_PROXIMITY),
+	PROPERTY_ENTRY_GPIO("gpios",
+			    SAMSUNG_GPIO_NODE('N'), 11,	/* EINT 11 */
+			    GPIO_ACTIVE_HIGH),
+	{ }
+};
+
+static const struct software_node crag6410_prox_sw_node = {
+	.parent = &crag6410_gpio_keys_node,
+	.properties = crag6410_prox_sw_props,
 };
 
+static const struct software_node *crag6410_gpio_keys_swnodes[] = {
+	&crag6410_gpio_keys_node,
+	&crag6410_suspend_key_node,
+	&crag6410_prox_sw_node,
+	NULL
+};
+
+static void __init crag6410_setup_gpio_keys(void)
+{
+	struct platform_device_info keys_info = {
+		.name	= "gpio-keys",
+		.id	= 0,
+	};
+	struct platform_device *pd;
+	int err;
+
+	err = software_node_register_node_group(crag6410_gpio_keys_swnodes);
+	if (err) {
+		pr_err("failed to register gpio-keys software nodes: %d\n", err);
+		return;
+	}
+
+	keys_info.fwnode = software_node_fwnode(&crag6410_gpio_keys_node);
+
+	pd = platform_device_register_full(&keys_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create gpio-keys device: %d\n", err);
+}
+
 static struct resource crag6410_dm9k_resource[] = {
 	[0] = DEFINE_RES_MEM(S3C64XX_PA_XM0CSN5, 2),
 	[1] = DEFINE_RES_MEM(S3C64XX_PA_XM0CSN5 + (1 << 8), 2),
@@ -393,7 +431,6 @@ static struct platform_device *crag6410_devs0[] __initdata = {
 	&samsung_device_pwm,
 	&s3c64xx_device_iis0,
 	&s3c64xx_device_iis1,
-	&crag6410_gpio_keydev,
 };
 
 static struct platform_device *crag6410_devs1[] __initdata = {
@@ -897,6 +934,7 @@ static void __init crag6410_machine_init(void)
 	platform_add_devices(crag6410_devs0, ARRAY_SIZE(crag6410_devs0));
 
 	crag6410_setup_keypad();
+	crag6410_setup_gpio_keys();
 
 	platform_add_devices(crag6410_devs1, ARRAY_SIZE(crag6410_devs1));
 
-- 
2.46.0.184.g6999bdac58-goog


