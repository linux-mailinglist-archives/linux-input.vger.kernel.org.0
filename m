Return-Path: <linux-input+bounces-5719-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B0D959294
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 04:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A93F1F254A4
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 02:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DB07A13A;
	Wed, 21 Aug 2024 02:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aOUU92Pa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5372599;
	Wed, 21 Aug 2024 02:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724205728; cv=none; b=CkrAArS+GBvGS1D9BH4Kf5YVEJf3CLZkyZm1FBgfir9CBpXHSq3N0i8bZx/IZqMMbmDyFpXdPmpDvmKHC6wZchgfSp/5CAQk68AHyGTZsM9kkpkUJFUmi/XbJ1ve4Q6ZTBjz2tDb5SrhIBVBDgrDToxAV0PWS8U0HvtwmpfQG2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724205728; c=relaxed/simple;
	bh=zn+ixoETTY66zQ0rNpgOSFU3TTOc1vSptZ2qlGzrkqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ofUpYe5pVH80T4VYLm88WCXZcOExY/ZaefAtgUdbBmJSNQk0ozb2pS3A3DzLRCwD8U4mOE+IDZncjvPD5NDhGMZ6FbCVwOm0yQREXUHXkVqJwLA34tTyKJoD7Gj1Je4z36eXBuxCZAqaVxHzhLxJzMJF0PhUGhMThL7BLdsVErg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aOUU92Pa; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3de13126957so825269b6e.0;
        Tue, 20 Aug 2024 19:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724205726; x=1724810526; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8eayEypO35tsi8znPkUtCBdRa1gnNAvgyYgjhiJTVZk=;
        b=aOUU92PaSr++bNLM2oCGbch/HBYGSzu45q+hnSZec5NEQiEadM+ePMyA6f9AMmhSUf
         0ej2GQjzB1L/cJ0qlQ+amim8+gWKHy8cYqtprUb4+JUB0Pw9vrgzSpsEyJaW9Dq9a65q
         CmORLC7Ow7MrtdSqAjneoq5ehASw2x4A6T7DWPN5t6U//r43bTTCHoEWRhCCAG8++HKj
         VX3FDyj6Q6anKGYR7ktCffBHiivrcZ1KZg9I2LoGZ9bok1zO/tA30gvv2pexJ47vXBsw
         SuSyt5p0SMmFiOlfEpqzv7VNQivQKXzTlGTR2u+XbRrLreIRYLyydwAtBWnMB3FCx2H4
         Zmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724205726; x=1724810526;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8eayEypO35tsi8znPkUtCBdRa1gnNAvgyYgjhiJTVZk=;
        b=PeOdc6KGnMuoY0BpMMifYQ7fJ7GTWYmEw18+x3L7HD/t0/fFTGSN1E/Fvu+rwNTI/h
         7buTmg7AWUWuDPXCf5VDKGN+dOw0H+DhWXzx5KP/GmCCPDFTY5cSfFDc/gixfKjfrWLT
         y0Bo2lVWKL7xtE8s/poLciyRDJhL3lOAjoXZnGUstqfxdzjletb+hUdr2d1Tc9y34Gcf
         UOM9XwWiWFdo3jNIwC3QOqNFOUZAqr4KqLXKTlYD7W7WO0GlU+riLEy9zRDYdDGu0hKj
         Wu09+0FCjNzHDHFJF8GU1cOT9/DPyXzZewIifM7QJ1B+s8j4RcAS2NlxutMW9zQG8iCy
         dsLA==
X-Forwarded-Encrypted: i=1; AJvYcCVrNX7PRxROJkqbC1iDfq6wXOdrKgQKaPK4uQZI49uwP9lIp0JzTm021pPQjQWPEUY1/37YebqQLfGIxw==@vger.kernel.org, AJvYcCVrjtiV7kt0TFfAjMkHEcjNfT7SZC15z3yigS0H5xjjdrWuwu+kLJorCuHkGAhfz7wGzU6UOqNYj66mtw3x@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu7Hkt9SZyHNxhaxCQIVaFafQsIcrNmt7m4sHfPOaM9LfDmIqO
	kCuadmRuPMtjig7Ph7oas225ve2ruedzDMAYlYZRRlcIFrh+NbcN
X-Google-Smtp-Source: AGHT+IGy8U+XTxHpGfgGQR0GTK4wyyfKvUY1/YGN8RpxXp9AgXZFVF9UKniVNV5t4jEjapRwMACkVA==
X-Received: by 2002:a05:6870:32cd:b0:270:2b23:bc13 with SMTP id 586e51a60fabf-2737ef8685dmr699178fac.30.1724205726146;
        Tue, 20 Aug 2024 19:02:06 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9f8b:d2d2:8416:b9d1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af160c1sm9162674b3a.142.2024.08.20.19.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 19:02:05 -0700 (PDT)
Date: Tue, 20 Aug 2024 19:02:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: [PATCH] sh: ecovec24: use static device properties to describe the
 touchscreen
Message-ID: <ZsVKmnjxdnKBLvju@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Convert the board to use static device properties instead of platform
data to describe the touchscreen, so that support for platform data can
be removed from tsc2007 driver (ecovec24 is the last board using this
mechanism of describing tsc2007).

Device properties do not allow custom board methods, so the method for
getting "pen down" state was removed (the driver is capable of working
without it). If this functionality is needed proper pin control/gpio
support needs to be implemented so that the same pin can serve as an
input GPIO and an interrupt.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/sh/boards/mach-ecovec24/setup.c | 38 ++++++++--------------------
 1 file changed, 11 insertions(+), 27 deletions(-)

diff --git a/arch/sh/boards/mach-ecovec24/setup.c b/arch/sh/boards/mach-ecovec24/setup.c
index 6f13557eecd6..4833bec0c3c5 100644
--- a/arch/sh/boards/mach-ecovec24/setup.c
+++ b/arch/sh/boards/mach-ecovec24/setup.c
@@ -26,6 +26,7 @@
 #include <linux/platform_data/tmio.h>
 #include <linux/platform_data/tsc2007.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regulator/fixed.h>
 #include <linux/regulator/machine.h>
 #include <linux/sh_eth.h>
@@ -589,39 +590,21 @@ static struct platform_device keysc_device = {
 /* TouchScreen */
 #define IRQ0 evt2irq(0x600)
 
-static int ts_get_pendown_state(struct device *dev)
-{
-	int val = 0;
-	gpio_free(GPIO_FN_INTC_IRQ0);
-	gpio_request(GPIO_PTZ0, NULL);
-	gpio_direction_input(GPIO_PTZ0);
-
-	val = gpio_get_value(GPIO_PTZ0);
-
-	gpio_free(GPIO_PTZ0);
-	gpio_request(GPIO_FN_INTC_IRQ0, NULL);
-
-	return val ? 0 : 1;
-}
-
-static int ts_init(void)
-{
-	gpio_request(GPIO_FN_INTC_IRQ0, NULL);
-	return 0;
-}
+static const struct property_entry tsc2007_properties[] = {
+	PROPERTY_ENTRY_U32("ti,x-plate-ohms", 180),
+	{ }
+};
 
-static struct tsc2007_platform_data tsc2007_info = {
-	.model			= 2007,
-	.x_plate_ohms		= 180,
-	.get_pendown_state	= ts_get_pendown_state,
-	.init_platform_hw	= ts_init,
+static const struct software_node tsc2007_swnode = {
+	.name = "tsc2007",
+	.properties = tsc2007_properties,
 };
 
 static struct i2c_board_info ts_i2c_clients = {
 	I2C_BOARD_INFO("tsc2007", 0x48),
 	.type		= "tsc2007",
-	.platform_data	= &tsc2007_info,
 	.irq		= IRQ0,
+	.swnode		= &tsc2007_swnode,
 };
 
 static struct regulator_consumer_supply cn12_power_consumers[] =
@@ -1241,8 +1224,9 @@ static int __init arch_setup(void)
 		gpio_direction_output(GPIO_PTF4, 1);
 
 		/* enable TouchScreen */
-		i2c_register_board_info(0, &ts_i2c_clients, 1);
+		gpio_request(GPIO_FN_INTC_IRQ0, NULL);
 		irq_set_irq_type(IRQ0, IRQ_TYPE_LEVEL_LOW);
+		i2c_register_board_info(0, &ts_i2c_clients, 1);
 	}
 
 	/* enable CEU0 */
-- 
2.46.0.184.g6999bdac58-goog


-- 
Dmitry

