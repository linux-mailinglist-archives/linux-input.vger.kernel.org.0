Return-Path: <linux-input+bounces-7144-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3857D994367
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 11:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B87F1C21194
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 09:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 303791C7B7F;
	Tue,  8 Oct 2024 09:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sGiPXQ29"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4048F1C230D
	for <linux-input@vger.kernel.org>; Tue,  8 Oct 2024 09:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728378026; cv=none; b=BvHzaCQWkV+IB/bLmH6GXC8BUflYZympke4hjMuyDUZuHsk1iof99o7iVdeMZENsjea51scx0QwP5PN2/N9oMuvJYE7Gih2/g9iTOAtVG3fwNbl1s/dGbvPJf/7wo/wzTpjMc9yh9ug2Lc6eTGve3/BsbvR6B4YO+QPIc/xYqUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728378026; c=relaxed/simple;
	bh=Iujg9ULP67x2CLw9wykRMgMOFZiHJzfSqiKVvqg+2n8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tidUXAJTWjfwRjTLmVfc/yzW8hWbjxMAE9GDNR6llWIqj2t86L3xLleglarH4Cd2YYA2451uah5VBn1QDueUoMtcvpePub1N6XEkmyyu0d5HhJ0a+4MDP9qFWEAgGiA+mlxR17NpgdJSVFqmdGetDUAbKCw1jC8h82sOhRQhxLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sGiPXQ29; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-430558cddbeso1393465e9.1
        for <linux-input@vger.kernel.org>; Tue, 08 Oct 2024 02:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728378019; x=1728982819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1dO1DQ6/n6sX09a8DnGOTX5yfIV9s1BtR7dct+P2Gn8=;
        b=sGiPXQ2931xSvd+tS6VvvwfWL7c1BGWPVWP55+g2Hiaw50t7EsMjDHZXbfvJtjIwOl
         7eoSVTXZcyb+KufmOhSp+eykphSFdkOd45bY4J8/6FVoH4LZEHirizkBLU8jemjJne9y
         s11RqK+e0rzvDMDvdksTW6HQt+iDnWlCoiGVk0Yc+xrq507h8yuMGTNnMF2c4Pt+uO41
         ax8gqoYjNH/y/PDpFPM8UkUEDQab4FrK9QwhWLACM0NlT1rTOF3T722nyKaaI9TKv7CL
         YBxg56tWzdK2NXhAsJZ3VusOam9XzZVbuNQQhf6tEHAwBQWlcdxHYIpTt/zxzdwNY++1
         RnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728378019; x=1728982819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dO1DQ6/n6sX09a8DnGOTX5yfIV9s1BtR7dct+P2Gn8=;
        b=rl7dRnKuDoXGeuhtC838haH/raB5AIZ/SbRQZth3/ozNUBOfxqyD/N5P9PHWdHTWFW
         tgrcX5pLLp25pt/RUCrh4H+aDHOPCLaXAFLMVGS3GQ7X68mNxBnDqaVQjwtEK0aKuO3I
         eyguz+dGWfrV2oLqG9ZfH4ujo7YxVebj7dbJn2t50B9JrTLR1Lp4zYN94YUzfo0NpyHx
         PRb8m4iBotuosR+NUFl8THZ7tBkC0IU3UciSNL1h9KE3K5k9ktpaHeoTtEFAqHGIA4J1
         2IjTqioLEJ9/q6qH1kdNSQIoabuYx/QoHa4JQsO+tfIWnHako4xjOyylpqhlfWkUci9S
         lUCg==
X-Gm-Message-State: AOJu0Ywy0hybTsyQPjDyG7nsnJm11Y3ePKInNpuUGBgnheOs7Qdhhojy
	+f7nS3p2Dv9T+Ah742Jsq/oIMO3rZ+1QDV7ftjaWsE6VWTW+CjlNZz27yhGYkYQ=
X-Google-Smtp-Source: AGHT+IHtsi9/KhPE6LkHC5gL+7I4Ec4zgpbz68tBqeenq0N3ghKFo007etRjbjljaX83R71o2387Dw==
X-Received: by 2002:a05:600c:22c3:b0:430:4db2:2b88 with SMTP id 5b1f17b1804b1-4304db22d47mr9058325e9.5.1728378019186;
        Tue, 08 Oct 2024 02:00:19 -0700 (PDT)
Received: from localhost (p200300f65f01db004d6a46a6454a1385.dip0.t-ipconnect.de. [2003:f6:5f01:db00:4d6a:46a6:454a:1385])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89ea9640sm103495565e9.23.2024.10.08.02.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 02:00:18 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: [PATCH] Input - Switch back to struct platform_driver::remove()
Date: Tue,  8 Oct 2024 11:00:10 +0200
Message-ID: <20241008090009.462836-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=30059; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Iujg9ULP67x2CLw9wykRMgMOFZiHJzfSqiKVvqg+2n8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnBPSa5BJmBgt9Me63pJe9sNfBgTGzlkyfFjU4G UOhdE0EyiqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZwT0mgAKCRCPgPtYfRL+ TgofB/9Ck41sTuxdHy4jYXRs5xFdWdAlemldQx3ARu8iqfew4whcTzphHcx9NGd1ZefiFI9w7Pl lNIt1Uwav56ahqnqOSyfpaLgqH4z1gRX+ndln/DrvcfCnK623BA+pGsyFreHAgPNsH8zDbJuCKZ HltWKPma79sdDsDsw4JgRXVUw+FEBCL740qLM8GHl4ayYW5APoW8F4N24xYGahqgZ65XG5GRMPE E8AbxCunLxiTYGj9Igxp8mc3zpRvaouzMVZ2YHPhQkOpO4IpPrCeF+4bTOBfmV0KjllX9+h7URE mw0jarrdkTbXzn8zma6adLxh24vSNN8CY7lxX4O2cdVTpFSe
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/input/ to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

While touching these files, make indention of the struct initializer
consistent in a few drivers.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/input. While I usually prefer to
do one logical change per patch, this seems to be overengineering here
as the individual changes are really trivial and shouldn't be much in
the way for stable backports. But I'll happily split the patch if you
prefer it split.

Note I didn't Cc: the maintainers of each driver as this would hit
sending limits.

This is based on today's next, if conflicts arise when you apply it at
some later time and don't want to resolve them, feel free to just drop
the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend.

Best regards
Uwe

 drivers/input/keyboard/adp5520-keys.c        | 2 +-
 drivers/input/keyboard/cros_ec_keyb.c        | 2 +-
 drivers/input/keyboard/ep93xx_keypad.c       | 2 +-
 drivers/input/keyboard/iqs62x-keys.c         | 2 +-
 drivers/input/keyboard/omap-keypad.c         | 2 +-
 drivers/input/keyboard/omap4-keypad.c        | 2 +-
 drivers/input/keyboard/samsung-keypad.c      | 2 +-
 drivers/input/keyboard/sh_keysc.c            | 2 +-
 drivers/input/keyboard/stmpe-keypad.c        | 2 +-
 drivers/input/misc/88pm80x_onkey.c           | 2 +-
 drivers/input/misc/da9052_onkey.c            | 4 ++--
 drivers/input/misc/da9055_onkey.c            | 4 ++--
 drivers/input/misc/ideapad_slidebar.c        | 2 +-
 drivers/input/misc/m68kspkr.c                | 2 +-
 drivers/input/misc/max8997_haptic.c          | 2 +-
 drivers/input/misc/mc13783-pwrbutton.c       | 2 +-
 drivers/input/misc/palmas-pwrbutton.c        | 2 +-
 drivers/input/misc/pcap_keys.c               | 2 +-
 drivers/input/misc/pcf50633-input.c          | 2 +-
 drivers/input/misc/pcspkr.c                  | 2 +-
 drivers/input/misc/pm8941-pwrkey.c           | 2 +-
 drivers/input/misc/soc_button_array.c        | 2 +-
 drivers/input/misc/sparcspkr.c               | 4 ++--
 drivers/input/misc/tps65219-pwrbutton.c      | 2 +-
 drivers/input/misc/wistron_btns.c            | 2 +-
 drivers/input/misc/wm831x-on.c               | 2 +-
 drivers/input/mouse/amimouse.c               | 2 +-
 drivers/input/serio/altera_ps2.c             | 2 +-
 drivers/input/serio/ams_delta_serio.c        | 2 +-
 drivers/input/serio/apbps2.c                 | 2 +-
 drivers/input/serio/arc_ps2.c                | 2 +-
 drivers/input/serio/ct82c710.c               | 2 +-
 drivers/input/serio/i8042-sparcio.h          | 2 +-
 drivers/input/serio/i8042.c                  | 2 +-
 drivers/input/serio/ioc3kbd.c                | 2 +-
 drivers/input/serio/maceps2.c                | 2 +-
 drivers/input/serio/olpc_apsp.c              | 2 +-
 drivers/input/serio/ps2-gpio.c               | 2 +-
 drivers/input/serio/q40kbd.c                 | 2 +-
 drivers/input/serio/rpckbd.c                 | 2 +-
 drivers/input/serio/sun4i-ps2.c              | 2 +-
 drivers/input/serio/xilinx_ps2.c             | 2 +-
 drivers/input/touchscreen/da9052_tsi.c       | 2 +-
 drivers/input/touchscreen/mainstone-wm97xx.c | 2 +-
 drivers/input/touchscreen/mc13783_ts.c       | 2 +-
 drivers/input/touchscreen/pcap_ts.c          | 2 +-
 drivers/input/touchscreen/stmpe-ts.c         | 2 +-
 drivers/input/touchscreen/sun4i-ts.c         | 4 ++--
 drivers/input/touchscreen/ti_am335x_tsc.c    | 4 ++--
 drivers/input/touchscreen/wm831x-ts.c        | 2 +-
 drivers/input/touchscreen/wm97xx-core.c      | 2 +-
 51 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/drivers/input/keyboard/adp5520-keys.c b/drivers/input/keyboard/adp5520-keys.c
index 10c248f0c1fc..980d739e45b8 100644
--- a/drivers/input/keyboard/adp5520-keys.c
+++ b/drivers/input/keyboard/adp5520-keys.c
@@ -181,7 +181,7 @@ static struct platform_driver adp5520_keys_driver = {
 		.name	= "adp5520-keys",
 	},
 	.probe		= adp5520_keys_probe,
-	.remove_new	= adp5520_keys_remove,
+	.remove		= adp5520_keys_remove,
 };
 module_platform_driver(adp5520_keys_driver);
 
diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 4c81b20ff6af..c1e53d87c8a7 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -770,7 +770,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(cros_ec_keyb_pm_ops, NULL, cros_ec_keyb_resume);
 
 static struct platform_driver cros_ec_keyb_driver = {
 	.probe = cros_ec_keyb_probe,
-	.remove_new = cros_ec_keyb_remove,
+	.remove = cros_ec_keyb_remove,
 	.driver = {
 		.name = "cros-ec-keyb",
 		.dev_groups = cros_ec_keyb_groups,
diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
index dcbc50304a5a..07cf23a3e65b 100644
--- a/drivers/input/keyboard/ep93xx_keypad.c
+++ b/drivers/input/keyboard/ep93xx_keypad.c
@@ -289,7 +289,7 @@ static struct platform_driver ep93xx_keypad_driver = {
 		.of_match_table = ep93xx_keypad_of_ids,
 	},
 	.probe		= ep93xx_keypad_probe,
-	.remove_new	= ep93xx_keypad_remove,
+	.remove		= ep93xx_keypad_remove,
 };
 module_platform_driver(ep93xx_keypad_driver);
 
diff --git a/drivers/input/keyboard/iqs62x-keys.c b/drivers/input/keyboard/iqs62x-keys.c
index 1315b0f0862f..b086c7b28d5c 100644
--- a/drivers/input/keyboard/iqs62x-keys.c
+++ b/drivers/input/keyboard/iqs62x-keys.c
@@ -323,7 +323,7 @@ static struct platform_driver iqs62x_keys_platform_driver = {
 		.name = "iqs62x-keys",
 	},
 	.probe = iqs62x_keys_probe,
-	.remove_new = iqs62x_keys_remove,
+	.remove = iqs62x_keys_remove,
 };
 module_platform_driver(iqs62x_keys_platform_driver);
 
diff --git a/drivers/input/keyboard/omap-keypad.c b/drivers/input/keyboard/omap-keypad.c
index 57587541110b..33df8885b599 100644
--- a/drivers/input/keyboard/omap-keypad.c
+++ b/drivers/input/keyboard/omap-keypad.c
@@ -290,7 +290,7 @@ static void omap_kp_remove(struct platform_device *pdev)
 
 static struct platform_driver omap_kp_driver = {
 	.probe		= omap_kp_probe,
-	.remove_new	= omap_kp_remove,
+	.remove		= omap_kp_remove,
 	.driver		= {
 		.name	= "omap-keypad",
 		.dev_groups = omap_kp_groups,
diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index 040b340995d8..73706cdaacd9 100644
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -487,7 +487,7 @@ MODULE_DEVICE_TABLE(of, omap_keypad_dt_match);
 
 static struct platform_driver omap4_keypad_driver = {
 	.probe		= omap4_keypad_probe,
-	.remove_new	= omap4_keypad_remove,
+	.remove		= omap4_keypad_remove,
 	.driver		= {
 		.name	= "omap4-keypad",
 		.of_match_table = omap_keypad_dt_match,
diff --git a/drivers/input/keyboard/samsung-keypad.c b/drivers/input/keyboard/samsung-keypad.c
index e212eff7687c..9f1049aa3048 100644
--- a/drivers/input/keyboard/samsung-keypad.c
+++ b/drivers/input/keyboard/samsung-keypad.c
@@ -587,7 +587,7 @@ MODULE_DEVICE_TABLE(platform, samsung_keypad_driver_ids);
 
 static struct platform_driver samsung_keypad_driver = {
 	.probe		= samsung_keypad_probe,
-	.remove_new	= samsung_keypad_remove,
+	.remove		= samsung_keypad_remove,
 	.driver		= {
 		.name	= "samsung-keypad",
 		.of_match_table = of_match_ptr(samsung_keypad_dt_match),
diff --git a/drivers/input/keyboard/sh_keysc.c b/drivers/input/keyboard/sh_keysc.c
index 4ea4fd25c5d2..159f41eedd41 100644
--- a/drivers/input/keyboard/sh_keysc.c
+++ b/drivers/input/keyboard/sh_keysc.c
@@ -319,7 +319,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(sh_keysc_dev_pm_ops,
 
 static struct platform_driver sh_keysc_device_driver = {
 	.probe		= sh_keysc_probe,
-	.remove_new	= sh_keysc_remove,
+	.remove		= sh_keysc_remove,
 	.driver		= {
 		.name	= "sh_keysc",
 		.pm	= pm_sleep_ptr(&sh_keysc_dev_pm_ops),
diff --git a/drivers/input/keyboard/stmpe-keypad.c b/drivers/input/keyboard/stmpe-keypad.c
index ef2f44027894..0acded4fb9c9 100644
--- a/drivers/input/keyboard/stmpe-keypad.c
+++ b/drivers/input/keyboard/stmpe-keypad.c
@@ -414,7 +414,7 @@ static void stmpe_keypad_remove(struct platform_device *pdev)
 static struct platform_driver stmpe_keypad_driver = {
 	.driver.name	= "stmpe-keypad",
 	.probe		= stmpe_keypad_probe,
-	.remove_new	= stmpe_keypad_remove,
+	.remove		= stmpe_keypad_remove,
 };
 module_platform_driver(stmpe_keypad_driver);
 
diff --git a/drivers/input/misc/88pm80x_onkey.c b/drivers/input/misc/88pm80x_onkey.c
index 6477a41c4bac..9159b5fec129 100644
--- a/drivers/input/misc/88pm80x_onkey.c
+++ b/drivers/input/misc/88pm80x_onkey.c
@@ -141,7 +141,7 @@ static struct platform_driver pm80x_onkey_driver = {
 		   .pm = &pm80x_onkey_pm_ops,
 		   },
 	.probe = pm80x_onkey_probe,
-	.remove_new = pm80x_onkey_remove,
+	.remove = pm80x_onkey_remove,
 };
 
 module_platform_driver(pm80x_onkey_driver);
diff --git a/drivers/input/misc/da9052_onkey.c b/drivers/input/misc/da9052_onkey.c
index 7a1122e1efb9..cc23625019e3 100644
--- a/drivers/input/misc/da9052_onkey.c
+++ b/drivers/input/misc/da9052_onkey.c
@@ -140,8 +140,8 @@ static void da9052_onkey_remove(struct platform_device *pdev)
 
 static struct platform_driver da9052_onkey_driver = {
 	.probe	= da9052_onkey_probe,
-	.remove_new = da9052_onkey_remove,
-	.driver = {
+	.remove	= da9052_onkey_remove,
+	.driver	= {
 		.name	= "da9052-onkey",
 	},
 };
diff --git a/drivers/input/misc/da9055_onkey.c b/drivers/input/misc/da9055_onkey.c
index 871812f1b398..3e4fc2f01011 100644
--- a/drivers/input/misc/da9055_onkey.c
+++ b/drivers/input/misc/da9055_onkey.c
@@ -145,8 +145,8 @@ static void da9055_onkey_remove(struct platform_device *pdev)
 
 static struct platform_driver da9055_onkey_driver = {
 	.probe	= da9055_onkey_probe,
-	.remove_new = da9055_onkey_remove,
-	.driver = {
+	.remove	= da9055_onkey_remove,
+	.driver	= {
 		.name	= "da9055-onkey",
 	},
 };
diff --git a/drivers/input/misc/ideapad_slidebar.c b/drivers/input/misc/ideapad_slidebar.c
index 7f1b3690b7e2..fbe525aee4c4 100644
--- a/drivers/input/misc/ideapad_slidebar.c
+++ b/drivers/input/misc/ideapad_slidebar.c
@@ -267,7 +267,7 @@ static struct platform_driver slidebar_drv = {
 	.driver = {
 		.name = "ideapad_slidebar",
 	},
-	.remove_new = ideapad_remove,
+	.remove = ideapad_remove,
 };
 
 static int __init ideapad_dmi_check(const struct dmi_system_id *id)
diff --git a/drivers/input/misc/m68kspkr.c b/drivers/input/misc/m68kspkr.c
index 3fe0a85c45e0..0542334df624 100644
--- a/drivers/input/misc/m68kspkr.c
+++ b/drivers/input/misc/m68kspkr.c
@@ -95,7 +95,7 @@ static struct platform_driver m68kspkr_platform_driver = {
 		.name	= "m68kspkr",
 	},
 	.probe		= m68kspkr_probe,
-	.remove_new	= m68kspkr_remove,
+	.remove		= m68kspkr_remove,
 	.shutdown	= m68kspkr_shutdown,
 };
 
diff --git a/drivers/input/misc/max8997_haptic.c b/drivers/input/misc/max8997_haptic.c
index 11cac4b7dddc..39764d35755f 100644
--- a/drivers/input/misc/max8997_haptic.c
+++ b/drivers/input/misc/max8997_haptic.c
@@ -389,7 +389,7 @@ static struct platform_driver max8997_haptic_driver = {
 		.pm	= pm_sleep_ptr(&max8997_haptic_pm_ops),
 	},
 	.probe		= max8997_haptic_probe,
-	.remove_new	= max8997_haptic_remove,
+	.remove		= max8997_haptic_remove,
 	.id_table	= max8997_haptic_id,
 };
 module_platform_driver(max8997_haptic_driver);
diff --git a/drivers/input/misc/mc13783-pwrbutton.c b/drivers/input/misc/mc13783-pwrbutton.c
index 1c8c939638f6..1c7faa9b7afe 100644
--- a/drivers/input/misc/mc13783-pwrbutton.c
+++ b/drivers/input/misc/mc13783-pwrbutton.c
@@ -253,7 +253,7 @@ static void mc13783_pwrbutton_remove(struct platform_device *pdev)
 
 static struct platform_driver mc13783_pwrbutton_driver = {
 	.probe		= mc13783_pwrbutton_probe,
-	.remove_new	= mc13783_pwrbutton_remove,
+	.remove		= mc13783_pwrbutton_remove,
 	.driver		= {
 		.name	= "mc13783-pwrbutton",
 	},
diff --git a/drivers/input/misc/palmas-pwrbutton.c b/drivers/input/misc/palmas-pwrbutton.c
index 06d5972e8e84..39fc451c56e9 100644
--- a/drivers/input/misc/palmas-pwrbutton.c
+++ b/drivers/input/misc/palmas-pwrbutton.c
@@ -310,7 +310,7 @@ MODULE_DEVICE_TABLE(of, of_palmas_pwr_match);
 
 static struct platform_driver palmas_pwron_driver = {
 	.probe	= palmas_pwron_probe,
-	.remove_new = palmas_pwron_remove,
+	.remove	= palmas_pwron_remove,
 	.driver	= {
 		.name	= "palmas_pwrbutton",
 		.of_match_table = of_match_ptr(of_palmas_pwr_match),
diff --git a/drivers/input/misc/pcap_keys.c b/drivers/input/misc/pcap_keys.c
index f8954a2cab24..fe43fd72ba7b 100644
--- a/drivers/input/misc/pcap_keys.c
+++ b/drivers/input/misc/pcap_keys.c
@@ -112,7 +112,7 @@ static void pcap_keys_remove(struct platform_device *pdev)
 
 static struct platform_driver pcap_keys_device_driver = {
 	.probe		= pcap_keys_probe,
-	.remove_new	= pcap_keys_remove,
+	.remove		= pcap_keys_remove,
 	.driver		= {
 		.name	= "pcap-keys",
 	}
diff --git a/drivers/input/misc/pcf50633-input.c b/drivers/input/misc/pcf50633-input.c
index c5c5fe236c18..6d046e236ba6 100644
--- a/drivers/input/misc/pcf50633-input.c
+++ b/drivers/input/misc/pcf50633-input.c
@@ -103,7 +103,7 @@ static struct platform_driver pcf50633_input_driver = {
 		.name = "pcf50633-input",
 	},
 	.probe = pcf50633_input_probe,
-	.remove_new = pcf50633_input_remove,
+	.remove = pcf50633_input_remove,
 };
 module_platform_driver(pcf50633_input_driver);
 
diff --git a/drivers/input/misc/pcspkr.c b/drivers/input/misc/pcspkr.c
index 897854fd245f..0467808402f2 100644
--- a/drivers/input/misc/pcspkr.c
+++ b/drivers/input/misc/pcspkr.c
@@ -127,7 +127,7 @@ static struct platform_driver pcspkr_platform_driver = {
 		.pm	= &pcspkr_pm_ops,
 	},
 	.probe		= pcspkr_probe,
-	.remove_new	= pcspkr_remove,
+	.remove		= pcspkr_remove,
 	.shutdown	= pcspkr_shutdown,
 };
 module_platform_driver(pcspkr_platform_driver);
diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
index bab710023d8f..d0c46665e527 100644
--- a/drivers/input/misc/pm8941-pwrkey.c
+++ b/drivers/input/misc/pm8941-pwrkey.c
@@ -465,7 +465,7 @@ MODULE_DEVICE_TABLE(of, pm8941_pwr_key_id_table);
 
 static struct platform_driver pm8941_pwrkey_driver = {
 	.probe = pm8941_pwrkey_probe,
-	.remove_new = pm8941_pwrkey_remove,
+	.remove = pm8941_pwrkey_remove,
 	.driver = {
 		.name = "pm8941-pwrkey",
 		.pm = pm_sleep_ptr(&pm8941_pwr_key_pm_ops),
diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index e8f373715e50..b8cad415c62c 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -612,7 +612,7 @@ MODULE_DEVICE_TABLE(acpi, soc_button_acpi_match);
 
 static struct platform_driver soc_button_driver = {
 	.probe          = soc_button_probe,
-	.remove_new	= soc_button_remove,
+	.remove		= soc_button_remove,
 	.driver		= {
 		.name = KBUILD_MODNAME,
 		.acpi_match_table = ACPI_PTR(soc_button_acpi_match),
diff --git a/drivers/input/misc/sparcspkr.c b/drivers/input/misc/sparcspkr.c
index 20020cbc0752..fbf3e8c3a7d7 100644
--- a/drivers/input/misc/sparcspkr.c
+++ b/drivers/input/misc/sparcspkr.c
@@ -262,7 +262,7 @@ static struct platform_driver bbc_beep_driver = {
 		.of_match_table = bbc_beep_match,
 	},
 	.probe		= bbc_beep_probe,
-	.remove_new	= bbc_remove,
+	.remove		= bbc_remove,
 	.shutdown	= sparcspkr_shutdown,
 };
 
@@ -340,7 +340,7 @@ static struct platform_driver grover_beep_driver = {
 		.of_match_table = grover_beep_match,
 	},
 	.probe		= grover_beep_probe,
-	.remove_new	= grover_remove,
+	.remove		= grover_remove,
 	.shutdown	= sparcspkr_shutdown,
 };
 
diff --git a/drivers/input/misc/tps65219-pwrbutton.c b/drivers/input/misc/tps65219-pwrbutton.c
index eeb9f2334ab4..7a58bae4f1a0 100644
--- a/drivers/input/misc/tps65219-pwrbutton.c
+++ b/drivers/input/misc/tps65219-pwrbutton.c
@@ -137,7 +137,7 @@ MODULE_DEVICE_TABLE(platform, tps65219_pwrbtn_id_table);
 
 static struct platform_driver tps65219_pb_driver = {
 	.probe = tps65219_pb_probe,
-	.remove_new = tps65219_pb_remove,
+	.remove = tps65219_pb_remove,
 	.driver = {
 		.name = "tps65219_pwrbutton",
 	},
diff --git a/drivers/input/misc/wistron_btns.c b/drivers/input/misc/wistron_btns.c
index 81f34b96c611..1b2bd2139aaa 100644
--- a/drivers/input/misc/wistron_btns.c
+++ b/drivers/input/misc/wistron_btns.c
@@ -1334,7 +1334,7 @@ static struct platform_driver wistron_driver = {
 		.pm	= pm_sleep_ptr(&wistron_pm_ops),
 	},
 	.probe		= wistron_probe,
-	.remove_new	= wistron_remove,
+	.remove		= wistron_remove,
 };
 
 static int __init wb_module_init(void)
diff --git a/drivers/input/misc/wm831x-on.c b/drivers/input/misc/wm831x-on.c
index e4a06c73b72d..18eb319bc6f7 100644
--- a/drivers/input/misc/wm831x-on.c
+++ b/drivers/input/misc/wm831x-on.c
@@ -134,7 +134,7 @@ static void wm831x_on_remove(struct platform_device *pdev)
 
 static struct platform_driver wm831x_on_driver = {
 	.probe		= wm831x_on_probe,
-	.remove_new	= wm831x_on_remove,
+	.remove		= wm831x_on_remove,
 	.driver		= {
 		.name	= "wm831x-on",
 	},
diff --git a/drivers/input/mouse/amimouse.c b/drivers/input/mouse/amimouse.c
index 2fbbaeb76d70..d203c2a6c438 100644
--- a/drivers/input/mouse/amimouse.c
+++ b/drivers/input/mouse/amimouse.c
@@ -139,7 +139,7 @@ static void __exit amimouse_remove(struct platform_device *pdev)
  * triggering a section mismatch warning.
  */
 static struct platform_driver amimouse_driver __refdata = {
-	.remove_new = __exit_p(amimouse_remove),
+	.remove = __exit_p(amimouse_remove),
 	.driver   = {
 		.name	= "amiga-mouse",
 	},
diff --git a/drivers/input/serio/altera_ps2.c b/drivers/input/serio/altera_ps2.c
index 611eb9fe2d04..aa445b1941e9 100644
--- a/drivers/input/serio/altera_ps2.c
+++ b/drivers/input/serio/altera_ps2.c
@@ -146,7 +146,7 @@ MODULE_DEVICE_TABLE(of, altera_ps2_match);
  */
 static struct platform_driver altera_ps2_driver = {
 	.probe		= altera_ps2_probe,
-	.remove_new	= altera_ps2_remove,
+	.remove		= altera_ps2_remove,
 	.driver	= {
 		.name	= DRV_NAME,
 		.of_match_table = of_match_ptr(altera_ps2_match),
diff --git a/drivers/input/serio/ams_delta_serio.c b/drivers/input/serio/ams_delta_serio.c
index 0bd6ae106809..81b3a053df81 100644
--- a/drivers/input/serio/ams_delta_serio.c
+++ b/drivers/input/serio/ams_delta_serio.c
@@ -182,7 +182,7 @@ static void ams_delta_serio_exit(struct platform_device *pdev)
 
 static struct platform_driver ams_delta_serio_driver = {
 	.probe	= ams_delta_serio_init,
-	.remove_new = ams_delta_serio_exit,
+	.remove	= ams_delta_serio_exit,
 	.driver	= {
 		.name	= DRIVER_NAME
 	},
diff --git a/drivers/input/serio/apbps2.c b/drivers/input/serio/apbps2.c
index 4015e75fcb90..b815337be2f4 100644
--- a/drivers/input/serio/apbps2.c
+++ b/drivers/input/serio/apbps2.c
@@ -208,7 +208,7 @@ static struct platform_driver apbps2_of_driver = {
 		.of_match_table = apbps2_of_match,
 	},
 	.probe = apbps2_of_probe,
-	.remove_new = apbps2_of_remove,
+	.remove = apbps2_of_remove,
 };
 
 module_platform_driver(apbps2_of_driver);
diff --git a/drivers/input/serio/arc_ps2.c b/drivers/input/serio/arc_ps2.c
index a9180a005872..e991c72296c9 100644
--- a/drivers/input/serio/arc_ps2.c
+++ b/drivers/input/serio/arc_ps2.c
@@ -260,7 +260,7 @@ static struct platform_driver arc_ps2_driver = {
 		.of_match_table	= of_match_ptr(arc_ps2_match),
 	},
 	.probe	= arc_ps2_probe,
-	.remove_new = arc_ps2_remove,
+	.remove	= arc_ps2_remove,
 };
 
 module_platform_driver(arc_ps2_driver);
diff --git a/drivers/input/serio/ct82c710.c b/drivers/input/serio/ct82c710.c
index 6834440b37f6..053a15988c45 100644
--- a/drivers/input/serio/ct82c710.c
+++ b/drivers/input/serio/ct82c710.c
@@ -190,7 +190,7 @@ static struct platform_driver ct82c710_driver = {
 		.name	= "ct82c710",
 	},
 	.probe		= ct82c710_probe,
-	.remove_new	= ct82c710_remove,
+	.remove		= ct82c710_remove,
 };
 
 
diff --git a/drivers/input/serio/i8042-sparcio.h b/drivers/input/serio/i8042-sparcio.h
index c2fda54dc384..b4a5fcaac09f 100644
--- a/drivers/input/serio/i8042-sparcio.h
+++ b/drivers/input/serio/i8042-sparcio.h
@@ -101,7 +101,7 @@ static struct platform_driver sparc_i8042_driver = {
 		.of_match_table = sparc_i8042_match,
 	},
 	.probe		= sparc_i8042_probe,
-	.remove_new	= sparc_i8042_remove,
+	.remove		= sparc_i8042_remove,
 };
 
 static bool i8042_is_mr_coffee(void)
diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 8ec4872b4471..03d9b54bea68 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -1603,7 +1603,7 @@ static struct platform_driver i8042_driver = {
 #endif
 	},
 	.probe		= i8042_probe,
-	.remove_new	= i8042_remove,
+	.remove		= i8042_remove,
 	.shutdown	= i8042_shutdown,
 };
 
diff --git a/drivers/input/serio/ioc3kbd.c b/drivers/input/serio/ioc3kbd.c
index 676b0bda3d72..d2c7ffb9a946 100644
--- a/drivers/input/serio/ioc3kbd.c
+++ b/drivers/input/serio/ioc3kbd.c
@@ -208,7 +208,7 @@ MODULE_DEVICE_TABLE(platform, ioc3kbd_id_table);
 
 static struct platform_driver ioc3kbd_driver = {
 	.probe          = ioc3kbd_probe,
-	.remove_new     = ioc3kbd_remove,
+	.remove         = ioc3kbd_remove,
 	.id_table	= ioc3kbd_id_table,
 	.driver = {
 		.name = "ioc3-kbd",
diff --git a/drivers/input/serio/maceps2.c b/drivers/input/serio/maceps2.c
index 42ac1eb94866..3d28a5cddd61 100644
--- a/drivers/input/serio/maceps2.c
+++ b/drivers/input/serio/maceps2.c
@@ -159,7 +159,7 @@ static struct platform_driver maceps2_driver = {
 		.name	= "maceps2",
 	},
 	.probe		= maceps2_probe,
-	.remove_new	= maceps2_remove,
+	.remove		= maceps2_remove,
 };
 
 static int __init maceps2_init(void)
diff --git a/drivers/input/serio/olpc_apsp.c b/drivers/input/serio/olpc_apsp.c
index 0ad95e880cc2..a24324830021 100644
--- a/drivers/input/serio/olpc_apsp.c
+++ b/drivers/input/serio/olpc_apsp.c
@@ -256,7 +256,7 @@ MODULE_DEVICE_TABLE(of, olpc_apsp_dt_ids);
 
 static struct platform_driver olpc_apsp_driver = {
 	.probe		= olpc_apsp_probe,
-	.remove_new	= olpc_apsp_remove,
+	.remove		= olpc_apsp_remove,
 	.driver		= {
 		.name	= "olpc-apsp",
 		.of_match_table = olpc_apsp_dt_ids,
diff --git a/drivers/input/serio/ps2-gpio.c b/drivers/input/serio/ps2-gpio.c
index 3a431395c464..642783e42516 100644
--- a/drivers/input/serio/ps2-gpio.c
+++ b/drivers/input/serio/ps2-gpio.c
@@ -491,7 +491,7 @@ MODULE_DEVICE_TABLE(of, ps2_gpio_match);
 
 static struct platform_driver ps2_gpio_driver = {
 	.probe		= ps2_gpio_probe,
-	.remove_new	= ps2_gpio_remove,
+	.remove		= ps2_gpio_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = of_match_ptr(ps2_gpio_match),
diff --git a/drivers/input/serio/q40kbd.c b/drivers/input/serio/q40kbd.c
index cd4d5be946a3..04c58ca4649f 100644
--- a/drivers/input/serio/q40kbd.c
+++ b/drivers/input/serio/q40kbd.c
@@ -166,7 +166,7 @@ static struct platform_driver q40kbd_driver = {
 	.driver		= {
 		.name	= "q40kbd",
 	},
-	.remove_new	= q40kbd_remove,
+	.remove		= q40kbd_remove,
 };
 
 module_platform_driver_probe(q40kbd_driver, q40kbd_probe);
diff --git a/drivers/input/serio/rpckbd.c b/drivers/input/serio/rpckbd.c
index e236bb7e1014..c65c552b0c45 100644
--- a/drivers/input/serio/rpckbd.c
+++ b/drivers/input/serio/rpckbd.c
@@ -144,7 +144,7 @@ static void rpckbd_remove(struct platform_device *dev)
 
 static struct platform_driver rpckbd_driver = {
 	.probe		= rpckbd_probe,
-	.remove_new	= rpckbd_remove,
+	.remove		= rpckbd_remove,
 	.driver		= {
 		.name	= "kart",
 	},
diff --git a/drivers/input/serio/sun4i-ps2.c b/drivers/input/serio/sun4i-ps2.c
index 95cd8aaee65d..d8d54922e81e 100644
--- a/drivers/input/serio/sun4i-ps2.c
+++ b/drivers/input/serio/sun4i-ps2.c
@@ -322,7 +322,7 @@ MODULE_DEVICE_TABLE(of, sun4i_ps2_match);
 
 static struct platform_driver sun4i_ps2_driver = {
 	.probe		= sun4i_ps2_probe,
-	.remove_new	= sun4i_ps2_remove,
+	.remove		= sun4i_ps2_remove,
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = sun4i_ps2_match,
diff --git a/drivers/input/serio/xilinx_ps2.c b/drivers/input/serio/xilinx_ps2.c
index 1543267d02ac..909a219d68f0 100644
--- a/drivers/input/serio/xilinx_ps2.c
+++ b/drivers/input/serio/xilinx_ps2.c
@@ -358,7 +358,7 @@ static struct platform_driver xps2_of_driver = {
 		.of_match_table = xps2_of_match,
 	},
 	.probe		= xps2_of_probe,
-	.remove_new	= xps2_of_remove,
+	.remove		= xps2_of_remove,
 };
 module_platform_driver(xps2_of_driver);
 
diff --git a/drivers/input/touchscreen/da9052_tsi.c b/drivers/input/touchscreen/da9052_tsi.c
index 52e0e834e76f..c2d3252f8466 100644
--- a/drivers/input/touchscreen/da9052_tsi.c
+++ b/drivers/input/touchscreen/da9052_tsi.c
@@ -326,7 +326,7 @@ static void da9052_ts_remove(struct platform_device *pdev)
 
 static struct platform_driver da9052_tsi_driver = {
 	.probe	= da9052_ts_probe,
-	.remove_new = da9052_ts_remove,
+	.remove	= da9052_ts_remove,
 	.driver	= {
 		.name	= "da9052-tsi",
 	},
diff --git a/drivers/input/touchscreen/mainstone-wm97xx.c b/drivers/input/touchscreen/mainstone-wm97xx.c
index bfbebe245040..5abf164ae14c 100644
--- a/drivers/input/touchscreen/mainstone-wm97xx.c
+++ b/drivers/input/touchscreen/mainstone-wm97xx.c
@@ -261,7 +261,7 @@ static void mainstone_wm97xx_remove(struct platform_device *pdev)
 
 static struct platform_driver mainstone_wm97xx_driver = {
 	.probe	= mainstone_wm97xx_probe,
-	.remove_new = mainstone_wm97xx_remove,
+	.remove	= mainstone_wm97xx_remove,
 	.driver	= {
 		.name	= "wm97xx-touch",
 	},
diff --git a/drivers/input/touchscreen/mc13783_ts.c b/drivers/input/touchscreen/mc13783_ts.c
index cbcd6e34efb7..33635da85079 100644
--- a/drivers/input/touchscreen/mc13783_ts.c
+++ b/drivers/input/touchscreen/mc13783_ts.c
@@ -226,7 +226,7 @@ static void mc13783_ts_remove(struct platform_device *pdev)
 }
 
 static struct platform_driver mc13783_ts_driver = {
-	.remove_new	= mc13783_ts_remove,
+	.remove		= mc13783_ts_remove,
 	.driver		= {
 		.name	= MC13783_TS_NAME,
 	},
diff --git a/drivers/input/touchscreen/pcap_ts.c b/drivers/input/touchscreen/pcap_ts.c
index 821245019fea..083206a3457b 100644
--- a/drivers/input/touchscreen/pcap_ts.c
+++ b/drivers/input/touchscreen/pcap_ts.c
@@ -238,7 +238,7 @@ static const struct dev_pm_ops pcap_ts_pm_ops = {
 
 static struct platform_driver pcap_ts_driver = {
 	.probe		= pcap_ts_probe,
-	.remove_new	= pcap_ts_remove,
+	.remove		= pcap_ts_remove,
 	.driver		= {
 		.name	= "pcap-ts",
 		.pm	= PCAP_TS_PM_OPS,
diff --git a/drivers/input/touchscreen/stmpe-ts.c b/drivers/input/touchscreen/stmpe-ts.c
index 2228842dfb49..a94a1997f96b 100644
--- a/drivers/input/touchscreen/stmpe-ts.c
+++ b/drivers/input/touchscreen/stmpe-ts.c
@@ -362,7 +362,7 @@ static struct platform_driver stmpe_ts_driver = {
 		.name = STMPE_TS_NAME,
 	},
 	.probe = stmpe_input_probe,
-	.remove_new = stmpe_ts_remove,
+	.remove = stmpe_ts_remove,
 };
 module_platform_driver(stmpe_ts_driver);
 
diff --git a/drivers/input/touchscreen/sun4i-ts.c b/drivers/input/touchscreen/sun4i-ts.c
index 92b2b840b4b7..e8286060043a 100644
--- a/drivers/input/touchscreen/sun4i-ts.c
+++ b/drivers/input/touchscreen/sun4i-ts.c
@@ -396,12 +396,12 @@ static const struct of_device_id sun4i_ts_of_match[] = {
 MODULE_DEVICE_TABLE(of, sun4i_ts_of_match);
 
 static struct platform_driver sun4i_ts_driver = {
-	.driver = {
+	.driver	= {
 		.name	= "sun4i-ts",
 		.of_match_table = sun4i_ts_of_match,
 	},
 	.probe	= sun4i_ts_probe,
-	.remove_new = sun4i_ts_remove,
+	.remove	= sun4i_ts_remove,
 };
 
 module_platform_driver(sun4i_ts_driver);
diff --git a/drivers/input/touchscreen/ti_am335x_tsc.c b/drivers/input/touchscreen/ti_am335x_tsc.c
index 294b7ceded27..93d659ff90aa 100644
--- a/drivers/input/touchscreen/ti_am335x_tsc.c
+++ b/drivers/input/touchscreen/ti_am335x_tsc.c
@@ -550,9 +550,9 @@ MODULE_DEVICE_TABLE(of, ti_tsc_dt_ids);
 
 static struct platform_driver ti_tsc_driver = {
 	.probe	= titsc_probe,
-	.remove_new = titsc_remove,
+	.remove	= titsc_remove,
 	.driver	= {
-		.name   = "TI-am335x-tsc",
+		.name	= "TI-am335x-tsc",
 		.pm	= pm_sleep_ptr(&titsc_pm_ops),
 		.of_match_table = ti_tsc_dt_ids,
 	},
diff --git a/drivers/input/touchscreen/wm831x-ts.c b/drivers/input/touchscreen/wm831x-ts.c
index 9cee26b63341..98f8ec408cad 100644
--- a/drivers/input/touchscreen/wm831x-ts.c
+++ b/drivers/input/touchscreen/wm831x-ts.c
@@ -387,7 +387,7 @@ static struct platform_driver wm831x_ts_driver = {
 		.name = "wm831x-touch",
 	},
 	.probe = wm831x_ts_probe,
-	.remove_new = wm831x_ts_remove,
+	.remove = wm831x_ts_remove,
 };
 module_platform_driver(wm831x_ts_driver);
 
diff --git a/drivers/input/touchscreen/wm97xx-core.c b/drivers/input/touchscreen/wm97xx-core.c
index 91384ad1aa40..b25771a8df2b 100644
--- a/drivers/input/touchscreen/wm97xx-core.c
+++ b/drivers/input/touchscreen/wm97xx-core.c
@@ -876,7 +876,7 @@ static struct platform_driver wm97xx_mfd_driver = {
 		.pm =		pm_sleep_ptr(&wm97xx_pm_ops),
 	},
 	.probe =	wm97xx_mfd_probe,
-	.remove_new =	wm97xx_mfd_remove,
+	.remove =	wm97xx_mfd_remove,
 };
 
 static int __init wm97xx_init(void)

base-commit: 33ce24234fca4c083e6685a18b460a18ebb5d5c1
-- 
2.45.2


