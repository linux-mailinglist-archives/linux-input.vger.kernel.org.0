Return-Path: <linux-input+bounces-5325-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F91947329
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 03:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E748B1C20E53
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 01:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D72713E881;
	Mon,  5 Aug 2024 01:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMWr9Jle"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26E513D881;
	Mon,  5 Aug 2024 01:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722822447; cv=none; b=PDDHGTnjNWQKZpHkIDuQXH4uh7/Pgg9qZRrcNs3pEPD5s0cSY7K8n9/ZxGJViJBA/2dIiQyanbtO1aduW9CRJmTd6hc4sZNGr7K/rHz3Bd27PIXG+mC8O5gAxXLUv4pNI0rSNF14vwzNMPiVa+cvd1tCibUUaN+e3J6+BDRkgk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722822447; c=relaxed/simple;
	bh=+uC3SC1UtyhUUzh1mzOSCegvqVfTGD/4wsDMq+vSIL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BwRfQTbXy8TADdPBJRNPPNP9wNgjuhked6353/NFDd7yG8BzHtbYpNQ9KY4CFycWMiUL/blvtUbXki/zUVZYq+zvXJZgT0pMGK3h4Txz+McDRC3fqYXL0wo/pxtaEbE1DeDfp3QawqBDxcFKLmfOYg82KPH4GjDFrliztbBFGLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMWr9Jle; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1ff4fa918afso24309795ad.1;
        Sun, 04 Aug 2024 18:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722822445; x=1723427245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KT5OQ6GzPXvDFTLkEAc2lVR09Idrwl4z6UvcUd1WRM=;
        b=nMWr9JletD0CgebBgZ3Zu8hOR8TTgWbd7EQa38ACGuzkG+jzB8cok0jaN8RZO0l+6I
         ucD3Dmsxz+U39M656VC8WURNR0FRAhIQh2u4lJFU6Du19vzqs4wdKm4/YGqXjgDL5kkO
         Jn/hB51iaBAShes/5Sx/+cs2qo/2xYwnYs2GryD46qk50uPZpVhfZa1xCrWTnhrF/5yT
         4yVVjuQKJ0dv3pA8QvtxFdOzsY4r9jOdqVp8hPYo2oA5Nh+36GWN0H5ConZvkT2UQ59e
         blVDhlEH6g7p/vgwA+TbQUwPqiTVUAxJ8Cx4DdUTVqgzwfPSL8FvnidRlw1PxBlFPGBw
         RWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722822445; x=1723427245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KT5OQ6GzPXvDFTLkEAc2lVR09Idrwl4z6UvcUd1WRM=;
        b=IfcJGeuH26HBprsUJi+b4+oK8nCJc6BIj+zPEwvqOnCHblaK7UIFmHCvWlWp/MMoez
         eLY23Jn9c3Ky22m3NHnQAU2SK37W3CKeY/ouAwxJU8PhbvscVivQqcD57PAW1mTL4hkN
         xgKFgYKl30EsaN+r9Lih2sb4XdcuylRptp58POuSLcDnpbGSLZb0wtsyB7Ng4B01xy5k
         0lzrt4b0BLf6ssWzcEZg4wSLf08m6RY956meuN7Rv7RtQLUz8fGgomR4e50XWTXFLyYU
         YcIb04PJsgzBYGxlK6SjXxXMz9VX76srUxHAEu2k8Hf9z4vos1pz+4MgN3tyAhlPTla0
         cZFg==
X-Forwarded-Encrypted: i=1; AJvYcCWCOBMl4AAUgmrFOleB75jrpIElLe0iWlGErp/yTHqzrz43s37LbcI7JoG/j/WJ3rhmEZukTfFuqKJ5Vm7WgHjnHrB9/HrIHdPSc8zZQUKGNknP0sUzSgaP9O0tlKK9XeJMGLREPJzB0rY=
X-Gm-Message-State: AOJu0YymQ2pZb7TpghbXircIeNnvwae5lFXWTqWSahVlUfUD9QwmAF8h
	3YQSyYboPPK6xvUD0E//ocrFrNdIMKt+pWcpeNJKSsn26/tn+H73
X-Google-Smtp-Source: AGHT+IGrPevOGrlhiIh2ypAJGRzfsgFKi7VmSIU2ZX7hVG5vsny8HwZs2H2+Vz3F41zi1kTLTuMLEw==
X-Received: by 2002:a17:902:d505:b0:1ff:49a0:46b1 with SMTP id d9443c01a7336-1ff5722e7abmr106827945ad.6.1722822444951;
        Sun, 04 Aug 2024 18:47:24 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:22e4:17a:28a:7497])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59295790sm55836015ad.261.2024.08.04.18.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 18:47:24 -0700 (PDT)
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
Subject: [PATCH 3/5] ARM: spitz: Use software nodes/properties for the GPIO-driven buttons
Date: Sun,  4 Aug 2024 18:47:06 -0700
Message-ID: <20240805014710.1961677-4-dmitry.torokhov@gmail.com>
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

Convert the Spitz to use software nodes and static properties to
describe GPIOs for the GPIO-driven buttons.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-pxa/spitz.c | 99 +++++++++++++++++++++++++++------------
 1 file changed, 68 insertions(+), 31 deletions(-)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 452bf7aac1fa..9a7dc7b8676d 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -419,45 +419,82 @@ static inline void spitz_mkp_init(void) {}
  * GPIO keys
  ******************************************************************************/
 #if defined(CONFIG_KEYBOARD_GPIO) || defined(CONFIG_KEYBOARD_GPIO_MODULE)
-static struct gpio_keys_button spitz_gpio_keys[] = {
-	{
-		.type	= EV_PWR,
-		.code	= KEY_SUSPEND,
-		.gpio	= SPITZ_GPIO_ON_KEY,
-		.desc	= "On Off",
-		.wakeup	= 1,
-	},
-	/* Two buttons detecting the lid state */
-	{
-		.type	= EV_SW,
-		.code	= 0,
-		.gpio	= SPITZ_GPIO_SWA,
-		.desc	= "Display Down",
-	},
-	{
-		.type	= EV_SW,
-		.code	= 1,
-		.gpio	= SPITZ_GPIO_SWB,
-		.desc	= "Lid Closed",
-	},
+static const struct software_node spitz_gpio_keys_node = {
+	.name = "spitz-gpio-keys",
 };
 
-static struct gpio_keys_platform_data spitz_gpio_keys_platform_data = {
-	.buttons	= spitz_gpio_keys,
-	.nbuttons	= ARRAY_SIZE(spitz_gpio_keys),
+static const struct property_entry spitz_suspend_key_props[] = {
+	PROPERTY_ENTRY_U32("linux,input-type", EV_PWR),
+	PROPERTY_ENTRY_U32("linux,code", KEY_SUSPEND),
+	PROPERTY_ENTRY_GPIO("gpios", &pxa2xx_gpiochip_node,
+			    SPITZ_GPIO_ON_KEY, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_STRING("label", "On Off"),
+	PROPERTY_ENTRY_BOOL("wakeup-source"),
+	{ }
 };
 
-static struct platform_device spitz_gpio_keys_device = {
-	.name	= "gpio-keys",
-	.id	= -1,
-	.dev	= {
-		.platform_data	= &spitz_gpio_keys_platform_data,
-	},
+static const struct software_node spitz_suspend_key_node = {
+	.parent = &spitz_gpio_keys_node,
+	.properties = spitz_suspend_key_props,
+};
+
+static const struct property_entry spitz_sw1_props[] = {
+	PROPERTY_ENTRY_U32("linux,input-type", EV_SW),
+	PROPERTY_ENTRY_U32("linux,code", 0),
+	PROPERTY_ENTRY_GPIO("gpios", &pxa2xx_gpiochip_node,
+			    SPITZ_GPIO_SWA, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_STRING("label", "Display Down"),
+	{ }
+};
+
+static const struct software_node spitz_sw1_node = {
+	.parent = &spitz_gpio_keys_node,
+	.properties = spitz_sw1_props,
+};
+
+static const struct property_entry spitz_sw2_props[] = {
+	PROPERTY_ENTRY_U32("linux,input-type", EV_SW),
+	PROPERTY_ENTRY_U32("linux,code", 1),
+	PROPERTY_ENTRY_GPIO("gpios", &pxa2xx_gpiochip_node,
+			    SPITZ_GPIO_SWB, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_STRING("label", "Lid Closed"),
+	{ }
+};
+
+static const struct software_node spitz_sw2_node = {
+	.parent = &spitz_gpio_keys_node,
+	.properties = spitz_sw2_props,
+};
+
+static const struct software_node *spitz_gpio_keys_swnodes[] = {
+	&spitz_gpio_keys_node,
+	&spitz_suspend_key_node,
+	&spitz_sw1_node,
+	&spitz_sw2_node,
+	NULL
 };
 
 static void __init spitz_keys_init(void)
 {
-	platform_device_register(&spitz_gpio_keys_device);
+	struct platform_device_info keys_info = {
+		.name	= "gpio-keys",
+		.id	= PLATFORM_DEVID_NONE,
+	};
+	struct platform_device *pd;
+	int err;
+
+	err = software_node_register_node_group(spitz_gpio_keys_swnodes);
+	if (err) {
+		pr_err("failed to register gpio-keys software nodes: %d\n", err);
+		return;
+	}
+
+	keys_info.fwnode = software_node_fwnode(&spitz_gpio_keys_node);
+
+	pd = platform_device_register_full(&keys_info);
+	err = PTR_ERR_OR_ZERO(pd);
+	if (err)
+		pr_err("failed to create gpio-keys device: %d\n", err);
 }
 #else
 static inline void spitz_keys_init(void) {}
-- 
2.46.0.rc2.264.g509ed76dc8-goog


