Return-Path: <linux-input+bounces-14074-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF77B2959E
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 00:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59F8317F95F
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 22:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB0C233723;
	Sun, 17 Aug 2025 22:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B765snAx"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160A02236F7;
	Sun, 17 Aug 2025 22:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755470866; cv=none; b=YfCyMea+UQVcpH5WIPyjqSnieD/sGHzBBJvDhLCjVG/kKk0+m67Njv9wk1EYi6G/KwJ0qIg3RjqsVqsxDdNPQl6I47ZxVo1A0pLuHVTtkfJsKaAvgISRtwzOuak+BHPFjxdKyAOqPjjIdg06Y6VRvItHMIuX9RSZKA7rjKIHXA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755470866; c=relaxed/simple;
	bh=ed8XvC5O8aK1Mynuk6bERZOlPdQE+5MQ2uchyNYhyvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kfm3tHRntbXzz6IIaf3ETAcTtSY6lT4g1PRRPi/IDyc7GDAbrFLbMq81e/TvLC0EIZmhVSeQEw8xJQPYhuSQGpcGz2JgTCVakDYxG8aiJCH/7Q8qUXekkFgKM4d8UNgHsOkrq5c0PoUxgdcVe07ehR/iX2SWwLCuwMkYqlEor3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B765snAx; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76e2ea79219so4016392b3a.2;
        Sun, 17 Aug 2025 15:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755470864; x=1756075664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNa2Zj6/Px4am483RWwOJO2UkcFvpKOXS+fsWLIJ0BM=;
        b=B765snAxodVGIeGlwk34uEri7c85oN3rm/xfqdozBLgZBIiYzC8nzR7pt69IUmk7qX
         N5YpVaB0P1PCSFVcgu5hyp+3HoHusPS2SNHkM2zffQgVJmz93Lq/e4nhNg6G39OCUKNl
         wWrPraODcElpDaHPMOkWukktz0lhVASYPAKelQB6pIwXYBYgKY0i+Ba+gqcNon6fCW6+
         fAq61/ehXA5x0g1ZBQUplCFyLptMa5S+PqB7seAZtEZ3zJfn4H3krBHq65E2STDvMxa6
         d1pcP4yIrHVr8oRvwvO5wEB2myCKi00miHWHgLPWoYqQP4e9z2WU3//oUOEUFsym58Bu
         3tcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755470864; x=1756075664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNa2Zj6/Px4am483RWwOJO2UkcFvpKOXS+fsWLIJ0BM=;
        b=AJb08spIwzECU+P08CRe9PK51CaVXVyDu74Htm3hBSJBIaVWA/Z5/cyrZAe93ohG1t
         imgAOyKx94MGHyMw2pGSasicxI9dIa1xFlGnNzk3182WpoaN8dqm2xKQ/OWmVZILbjwK
         m5km3KCP3mq1IRmK1ZRYkPRte5YEIbCaMORRcQFLF8zFIKhrh0DpgIi8By+5+OdhiERq
         et04Rg4jQH+tF+hNE9hd3ZkoOcvC6d7usS73QtR+KUTiD8wq4RgnR/E6CAq5bRzivSer
         LJdFTM1VpnHl2UxtZvG2BphF8isCRoFqntTfd3xNr2+FC6MzJEEXnWt1AR6c5fNY9Ep5
         +w5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUNUZ7Eaow4d64VzKyiApEziwi60aYCvX2hmKOYnjfcHq/7mDo4RDSyWbgqC1jBIM63LukzWIxVma7muw==@vger.kernel.org, AJvYcCUdadLvf2fFrPxHiKZBhfI20rtuQQQF7tBwayWhfRcZoqnjKargLrr1Mvt1nzf+Ofxuf2Zp8EVFTZs3Ch+j@vger.kernel.org
X-Gm-Message-State: AOJu0YwzrWQrYsjdGgninZ6458RDARDu/JjcckIQY+DjH19STt6h0iOR
	4GZdAJVbAq65GqvN3Ha1qKQqKv0B0nxr115S2fZHDtTdecVzSnNwGitB
X-Gm-Gg: ASbGncuslkM8FSNaVJxT8qhZM13co1QqANKN/IfZx+1TEGH6/IT8REFrEyk1tbJ8jjv
	1Li2rYqyVs9gcpdgRkBhOBxxqYU9bZArADlluvjy5Qc+UzAKornDasjBXNDl31l8CRiwtSD3/Cs
	3x4ciexyGXabF/36CldojyYDImQm+ipMrwGc7Yn/ThrjcnqNENICn8qTlWOQt0MiniuFk9BG1QA
	+qAp8Bhjj5Rd6suwVZv+YTBRku30odRohdydwskGMKfhEJ0PFn0tg5Km0CdJMn8jewDZb4XDEzT
	ysnstzbA06BfaUPvJOLQ6P2HVslj3RJ/vcq7zLU0/eHe4xXm1+X6lS1VXCbjcqnlAEo59AD3hsy
	Mpp8BZVHohxdHMiVYhUuZLqQ669TyAXGWhG6J4l6PwEJW
X-Google-Smtp-Source: AGHT+IEe7ZKMvCboWtdT/PjB9ev9bvUSxEnvRdhcIITRdD6jebDPm1UVFIhhOSMuHtQRz2/d1hh62g==
X-Received: by 2002:a17:902:ea03:b0:240:3dbb:7603 with SMTP id d9443c01a7336-2446d713295mr137721165ad.19.1755470864256;
        Sun, 17 Aug 2025 15:47:44 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:11e:c24d:ff01:22c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5792f1sm62741795ad.155.2025.08.17.15.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 15:47:43 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Lee Jones <lee@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] mfd: rohm-bd718x7: Use software nodes for gpio-keys
Date: Sun, 17 Aug 2025 15:47:28 -0700
Message-ID: <20250817224731.1911207-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
In-Reply-To: <20250817224731.1911207-1-dmitry.torokhov@gmail.com>
References: <20250817224731.1911207-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the rohm-bd7182x7 MFD driver to use software nodes for
instantiating the gpio-keys child device, replacing the old
platform_data mechanism.

The power key's properties are now defined using software nodes and
property entries. The IRQ is passed as a resource attached to the
platform device.

This will allow dropping support for using platform data for configuring
gpio-keys in the future.
---
 drivers/mfd/rohm-bd718x7.c | 76 ++++++++++++++++++++++++++++++--------
 1 file changed, 60 insertions(+), 16 deletions(-)

diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
index 25e494a93d48..20150656ac9c 100644
--- a/drivers/mfd/rohm-bd718x7.c
+++ b/drivers/mfd/rohm-bd718x7.c
@@ -7,7 +7,6 @@
 // Datasheet for BD71837MWV available from
 // https://www.rohm.com/datasheet/BD71837MWV/bd71837mwv-e
 
-#include <linux/gpio_keys.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/interrupt.h>
@@ -15,26 +14,41 @@
 #include <linux/mfd/core.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/types.h>
 
-static struct gpio_keys_button button = {
-	.code = KEY_POWER,
-	.gpio = -1,
-	.type = EV_KEY,
+static const struct software_node bd718xx_pwrkey_node = {
+	.name = "bd718xx-power-key",
 };
 
-static struct gpio_keys_platform_data bd718xx_powerkey_data = {
-	.buttons = &button,
-	.nbuttons = 1,
-	.name = "bd718xx-pwrkey",
+static const struct property_entry bd718xx_powerkey_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_POWER),
+	PROPERTY_ENTRY_STRING("label", "bd718xx-pwrkey"),
+	{ }
+};
+
+static const struct software_node bd718xx_powerkey_key_node = {
+	.properties = bd718xx_powerkey_props,
+	.parent = &bd718xx_pwrkey_node,
+};
+
+static const struct software_node *bd718xx_swnodes[] = {
+	&bd718xx_pwrkey_node,
+	&bd718xx_powerkey_key_node,
+	NULL,
+};
+
+static struct resource bd718xx_powerkey_irq_resources[] = {
+	DEFINE_RES_IRQ_NAMED(BD718XX_INT_PWRBTN_S, "bd718xx-pwrkey"),
 };
 
 static struct mfd_cell bd71837_mfd_cells[] = {
 	{
 		.name = "gpio-keys",
-		.platform_data = &bd718xx_powerkey_data,
-		.pdata_size = sizeof(bd718xx_powerkey_data),
+		.swnode = &bd718xx_pwrkey_node,
+		.resources = bd718xx_powerkey_irq_resources,
+		.num_resources = ARRAY_SIZE(bd718xx_powerkey_irq_resources),
 	},
 	{ .name = "bd71837-clk", },
 	{ .name = "bd71837-pmic", },
@@ -43,8 +57,9 @@ static struct mfd_cell bd71837_mfd_cells[] = {
 static struct mfd_cell bd71847_mfd_cells[] = {
 	{
 		.name = "gpio-keys",
-		.platform_data = &bd718xx_powerkey_data,
-		.pdata_size = sizeof(bd718xx_powerkey_data),
+		.swnode = &bd718xx_pwrkey_node,
+		.resources = bd718xx_powerkey_irq_resources,
+		.num_resources = ARRAY_SIZE(bd718xx_powerkey_irq_resources),
 	},
 	{ .name = "bd71847-clk", },
 	{ .name = "bd71847-pmic", },
@@ -126,6 +141,30 @@ static int bd718xx_init_press_duration(struct regmap *regmap,
 	return 0;
 }
 
+static int bd718xx_reg_cnt;
+
+static int bd718xx_i2c_register_swnodes(void)
+{
+	int error;
+
+	if (bd718xx_reg_cnt == 0) {
+		error = software_node_register_node_group(bd718xx_swnodes);
+		if (error)
+			return error;
+	}
+
+	bd718xx_reg_cnt++;
+	return 0;
+}
+
+static void bd718xx_i2c_unregister_swnodes(void *dummy)
+{
+	if (bd718xx_reg_cnt != 0) {
+		software_node_unregister_node_group(bd718xx_swnodes);
+		bd718xx_reg_cnt--;
+	}
+}
+
 static int bd718xx_i2c_probe(struct i2c_client *i2c)
 {
 	struct regmap *regmap;
@@ -170,13 +209,18 @@ static int bd718xx_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return ret;
 
-	ret = regmap_irq_get_virq(irq_data, BD718XX_INT_PWRBTN_S);
+	ret = bd718xx_i2c_register_swnodes();
+	if (ret)
+		return dev_err_probe(&i2c->dev, ret, "Failed to register swnodes\n");
+
+	ret = devm_add_action_or_reset(&i2c->dev, bd718xx_i2c_unregister_swnodes, NULL);
+	if (ret)
+		return ret;
 
+	ret = regmap_irq_get_virq(irq_data, BD718XX_INT_PWRBTN_S);
 	if (ret < 0)
 		return dev_err_probe(&i2c->dev, ret, "Failed to get the IRQ\n");
 
-	button.irq = ret;
-
 	ret = devm_mfd_add_devices(&i2c->dev, PLATFORM_DEVID_AUTO,
 				   mfd, cells, NULL, 0,
 				   regmap_irq_get_domain(irq_data));
-- 
2.51.0.rc1.163.g2494970778-goog


