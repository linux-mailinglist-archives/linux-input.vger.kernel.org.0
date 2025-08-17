Return-Path: <linux-input+bounces-14073-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 793D8B2959C
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 00:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4C9317F8F3
	for <lists+linux-input@lfdr.de>; Sun, 17 Aug 2025 22:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D79A226CE0;
	Sun, 17 Aug 2025 22:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pyv6GsZm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18BF1CAA79;
	Sun, 17 Aug 2025 22:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755470865; cv=none; b=ozSm0Rbqk4igtVrhk2pyDytkpgdvODhlXIWf+vTgaVPm6z8QXu+e3uhaMIssOhX636MFsGXoNjKmZLyhrOY2/6Dv7gMA9oCLey6gsedXtnn4R2XMiGKMkq1Eoo9HegUNA0l1sI8xNHXMPBhnDaP0cFBCF1X6v2aUYUOptsGiQhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755470865; c=relaxed/simple;
	bh=iC+fFYgek6IOf/sdUpTBHBKEQcVLJ7t/+5jGQ2GXIeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ygfo/Mjwu1ojhzorcaTNwlXRl53rPIpalb0Kn4F5X46/i362bV9wYGrB1tJvDZOurWUWHwW7OmSq6hEHUXq3TOncUS0dHFBCcLJIXzhP8FXzY25rUs8+kEwiwr09QRou9J5fkdkEDFjIaXOefINGJbCM0IC7uAgovMBYy/vDOU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pyv6GsZm; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b4716fbc443so2560429a12.0;
        Sun, 17 Aug 2025 15:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755470863; x=1756075663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dC7hP7U7bWQ4rkTSzQxF9xsxlsYkYLHXXpxxd5SKzNE=;
        b=Pyv6GsZmxnNQFKX7C6P5BZS54ZaJoLLNEQ0JvzyNwu3RlVy570EFz7qcDqXYHafgA3
         4dYJE0yhoKDKifRSo6opHPZ10RkAE2cuyA6e04yDf9rknR+cl+B49V515pJi3HFgtpo0
         cHxEaOzCPNoInyAlIVybGcu++R7aXSCrDD+pxtHzbKCH2uNSgoDItDbof7/k8jumxw2S
         k+zxeeTcnFvBYyZ0A7onhh9QHnbH12DaoDP1TRTIaDDJl4Bc+24sVfzlwOuZA5tBLi+A
         tedjviSUIPBkvG+MIuR3l7Od0fIvOWDRJLvDd/Oi8mxSzuGzq2Ryb3TpO/r16psDNy4K
         /C2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755470863; x=1756075663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dC7hP7U7bWQ4rkTSzQxF9xsxlsYkYLHXXpxxd5SKzNE=;
        b=NtGNnivE5QrAPdIrnHgwQnruqRgwkUaOZOlwL+a0u12xRFs3xtsvfqVXSfkhzhzrdX
         L9PboM7EzOTl1HAzCs7JOFCx4s+os+i9tbbGyjuVlPXTIjl2pc6/oatQ97a66ANAAgV/
         afTIChWmybpOnPQaHnoC0bOCfI+zgI0omEiwvG1wbM4Ku37u0WWIlLkCKTajkUIvgGiM
         dbCT+FqhJgNh24lsAJBO7B6rnFt2OF1uRx+kL4nYG7kJbOueM5yTt2ttZYw0Z2SmKdIs
         cXLddTYoDAuA2vgNySCzmqJMqZLGW9WqQEu8dbgIgES5UpYWH2S8vMIy8BGGHQ6tdkcX
         P03Q==
X-Forwarded-Encrypted: i=1; AJvYcCVzBYQ2BJVqRnsnSPJW/co9TSiT6XhirxGE2OpQTESjkfm9+dkWwEyh3XiLUSAgINi0IwWv4qz2ea3jwg==@vger.kernel.org, AJvYcCXL8h+jgfQjEMlxrIepWzty46PggECn6FG3QXtiOfPbf9A2VS+ov2LMNs6gtd7IkVYObseMF0dysDQOabxf@vger.kernel.org
X-Gm-Message-State: AOJu0YxaZCL6+Xh3IaaULLwEms/9pvAzpf1s/6bzm9p9TrWhs1vzjDVN
	0bwz/P7If4lYE5g8tY87ndtae1fhWvp2dZ0pt6fAqSv6jmG7UjSBwleN
X-Gm-Gg: ASbGncsjDtTs9+TSYa1sMlQoNYBK1lNeqb6fy6883KVOBXmbQFnwJt8nI7zrhmGyy6P
	am+wFv6OVbL7i1wqieSLuCXDZnxE5XvHcbvyXhd8b86NUaQD2q9sYDDjOj30FuiOqO+jAsdi2Jj
	v9zs+qDuAYY1Ag8g1ngioH+6RaMGsvHAXRRtmky9Kh6mV9IGsLG2ozsSsAB9chrJkpK5uVli/g0
	sIfKsizqqvvSVcbMuiD0meP483xVN+VVjI7prnWPV34ll1gwqi0vB8Q77/PG5hkJaOQhm3aaJ1Z
	Lw9IgBFHIOrU8TsEGvSikOI2blICP0oUdZVQ3AqTt5EER5MFoKy1sOslcAEqI+A6wLnIYZZXSkw
	gkf+RAdAldRcfk4kEfAbqk+sNbgHQ0ElWEsPHTXNU/q+L
X-Google-Smtp-Source: AGHT+IHZ9fX15WUTeJjoBOZ23JXTNAYFCcY5bYYG5ejf2HNyuXs4wVd3EjRX39nrxWAM19OV2bJKuw==
X-Received: by 2002:a17:902:ce90:b0:23f:c005:eab0 with SMTP id d9443c01a7336-2446d8f0fbdmr132427565ad.40.1755470863072;
        Sun, 17 Aug 2025 15:47:43 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:11e:c24d:ff01:22c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d5792f1sm62741795ad.155.2025.08.17.15.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 15:47:42 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Lee Jones <lee@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] mfd: rohm-bd71828: Use software nodes for gpio-keys
Date: Sun, 17 Aug 2025 15:47:27 -0700
Message-ID: <20250817224731.1911207-2-dmitry.torokhov@gmail.com>
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

Refactor the rohm-bd71828 MFD driver to use software nodes for
instantiating the gpio-keys child device, replacing the old
platform_data mechanism.

The power key's properties are now defined using software nodes and
property entries. The IRQ is passed as a resource attached to the
platform device.

This will allow dropping support for using platform data for configuring
gpio-keys in the future.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/mfd/rohm-bd71828.c | 81 +++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 23 deletions(-)

diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index a14b7aa69c3c..c29dde9996b7 100644
--- a/drivers/mfd/rohm-bd71828.c
+++ b/drivers/mfd/rohm-bd71828.c
@@ -4,7 +4,6 @@
 //
 // ROHM BD71828/BD71815 PMIC driver
 
-#include <linux/gpio_keys.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/interrupt.h>
@@ -16,21 +15,32 @@
 #include <linux/mfd/rohm-generic.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/types.h>
 
-static struct gpio_keys_button button = {
-	.code = KEY_POWER,
-	.gpio = -1,
-	.type = EV_KEY,
+static const struct software_node bd71828_pwrkey_node = {
+	.name = "bd71828-power-key",
 };
 
-static const struct gpio_keys_platform_data bd71828_powerkey_data = {
-	.buttons = &button,
-	.nbuttons = 1,
-	.name = "bd71828-pwrkey",
+static const struct property_entry bd71828_powerkey_props[] = {
+	PROPERTY_ENTRY_U32("linux,code", KEY_POWER),
+	PROPERTY_ENTRY_STRING("label", "bd71828-pwrkey"),
+	{ }
 };
 
+static const struct software_node bd71828_powerkey_key_node = {
+	.properties = bd71828_powerkey_props,
+	.parent = &bd71828_pwrkey_node,
+};
+
+static const struct software_node *bd71828_swnodes[] = {
+	&bd71828_pwrkey_node,
+	&bd71828_powerkey_key_node,
+	NULL,
+};
+
+
 static const struct resource bd71815_rtc_irqs[] = {
 	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC0, "bd70528-rtc-alm-0"),
 	DEFINE_RES_IRQ_NAMED(BD71815_INT_RTC1, "bd70528-rtc-alm-1"),
@@ -93,6 +103,10 @@ static const struct resource bd71815_power_irqs[] = {
 	DEFINE_RES_IRQ_NAMED(BD71815_INT_TEMP_BAT_HI_DET, "bd71815-bat-hi-det"),
 };
 
+static const struct resource bd71828_powerkey_irq_resources[] = {
+	DEFINE_RES_IRQ_NAMED(BD71828_INT_SHORTPUSH, "bd71828-pwrkey"),
+};
+
 static const struct mfd_cell bd71815_mfd_cells[] = {
 	{ .name = "bd71815-pmic", },
 	{ .name = "bd71815-clk", },
@@ -125,8 +139,9 @@ static const struct mfd_cell bd71828_mfd_cells[] = {
 		.num_resources = ARRAY_SIZE(bd71828_rtc_irqs),
 	}, {
 		.name = "gpio-keys",
-		.platform_data = &bd71828_powerkey_data,
-		.pdata_size = sizeof(bd71828_powerkey_data),
+		.swnode = &bd71828_pwrkey_node,
+		.resources = bd71828_powerkey_irq_resources,
+		.num_resources = ARRAY_SIZE(bd71828_powerkey_irq_resources),
 	},
 };
 
@@ -464,6 +479,30 @@ static int set_clk_mode(struct device *dev, struct regmap *regmap,
 				  OUT32K_MODE_CMOS);
 }
 
+static int bd71828_reg_cnt;
+
+static int bd71828_i2c_register_swnodes(void)
+{
+	int error;
+
+	if (bd71828_reg_cnt == 0) {
+		error = software_node_register_node_group(bd71828_swnodes);
+		if (error)
+			return error;
+	}
+
+	bd71828_reg_cnt++;
+	return 0;
+}
+
+static void bd71828_i2c_unregister_swnodes(void *dummy)
+{
+	if (bd71828_reg_cnt != 0) {
+		software_node_unregister_node_group(bd71828_swnodes);
+		bd71828_reg_cnt--;
+	}
+}
+
 static struct i2c_client *bd71828_dev;
 static void bd71828_power_off(void)
 {
@@ -495,7 +534,6 @@ static int bd71828_i2c_probe(struct i2c_client *i2c)
 	unsigned int chip_type;
 	const struct mfd_cell *mfd;
 	int cells;
-	int button_irq;
 	int clkmode_reg;
 
 	if (!i2c->irq) {
@@ -512,7 +550,14 @@ static int bd71828_i2c_probe(struct i2c_client *i2c)
 		regmap_config = &bd71828_regmap;
 		irqchip = &bd71828_irq_chip;
 		clkmode_reg = BD71828_REG_OUT32K;
-		button_irq = BD71828_INT_SHORTPUSH;
+		ret = bd71828_i2c_register_swnodes();
+		if (ret)
+			return dev_err_probe(&i2c->dev, ret, "Failed to register swnodes\n");
+
+		ret = devm_add_action_or_reset(&i2c->dev, bd71828_i2c_unregister_swnodes, NULL);
+		if (ret)
+			return ret;
+
 		break;
 	case ROHM_CHIP_TYPE_BD71815:
 		mfd = bd71815_mfd_cells;
@@ -526,7 +571,6 @@ static int bd71828_i2c_probe(struct i2c_client *i2c)
 		 * BD71815 data-sheet does not list the power-button IRQ so we
 		 * don't use it.
 		 */
-		button_irq = 0;
 		break;
 	default:
 		dev_err(&i2c->dev, "Unknown device type");
@@ -547,15 +591,6 @@ static int bd71828_i2c_probe(struct i2c_client *i2c)
 	dev_dbg(&i2c->dev, "Registered %d IRQs for chip\n",
 		irqchip->num_irqs);
 
-	if (button_irq) {
-		ret = regmap_irq_get_virq(irq_data, button_irq);
-		if (ret < 0)
-			return dev_err_probe(&i2c->dev, ret,
-					     "Failed to get the power-key IRQ\n");
-
-		button.irq = ret;
-	}
-
 	ret = set_clk_mode(&i2c->dev, regmap, clkmode_reg);
 	if (ret)
 		return ret;
-- 
2.51.0.rc1.163.g2494970778-goog


