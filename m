Return-Path: <linux-input+bounces-9079-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A97DA05E62
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 15:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D1FD1884E0E
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 14:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B16D1FF7D0;
	Wed,  8 Jan 2025 14:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IR/IwVCT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A9E1FE47A;
	Wed,  8 Jan 2025 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736345664; cv=none; b=hd5TaNUochM2OsI6qaL5edFSE3Ll0QNZaxuHsQftQXSzeJoaPU2KyJ6AZo8pwmosNmtg9egdlrZARhZF9y6K/j05Sjohj/0KtoMeNOuWqtZh56NeKrA7oFzngLmtJrvZ1WjUcUUyXSj7V0rRVbkRUIvw+g8HKayglRyUjrr2RMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736345664; c=relaxed/simple;
	bh=mYVzhE9cRrQLHZbeZNt+OeVeLu1RBOyrZa3r7Sk0x0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zh60OfmA5dLZ2VoqxbHyI9GYo2PuIt51s1Ve22WyMV0Gtldy0Ck3G/FNZzKBF60XxmiZqcA/354sLUy/q/bGWCCuisKqlKQ7zYlxb70V03leIMLVNwrsJ+slWklOZnYSEo+xkqeeYF9OIMw8WxQdsKJSZ2AIdic01MqWgkuvYXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IR/IwVCT; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab2b72fb3c9so110381966b.0;
        Wed, 08 Jan 2025 06:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736345655; x=1736950455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xqqhn1C38pfbvYQFEl3cKvUanz7vNMzqdHr5FCRUyks=;
        b=IR/IwVCTLsnzpW9t8m490S2XR3B9YdwSS/XDokkHJy6ZnMsGGC6Hk+e+aa9vJFoRgb
         xYC6lZJI5f/+xW3pzFW+6sk//dp5bpA+vfrcBX4GAs2qwTOTBfp87WmSjgHQU79pAc38
         Qhbrn9wvid/LnsjhCxBvRhdYobZkPiZRKejxxqJ4sFMt8o29sCW5AJ/2w3hMgVhOqIje
         KU9S5eoHZhgUobQ63fO9i2oL7kEiYdmwd5y7r/v8Oc2fY5JYE3yeGgXPLtxPCUUuVSvY
         aUzywrhL2pZ3Anb8Etld/lL4zpqY0D2JZQ+ZKUsiW/arAf/wggyxsiRxvuJnMGrRUndB
         J/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736345655; x=1736950455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xqqhn1C38pfbvYQFEl3cKvUanz7vNMzqdHr5FCRUyks=;
        b=r5dxEBjiffxWat6pGLDl5VBxptdVRi6bafV5d7jmTVoI8ZhgwNvhAAACe/Cub6MthX
         rZSQpSR0UluawKmej1S1pGsnqRXOc1veoRkyP+0eY46Bbsdf1CIfItfX9PDR9DrRNo5O
         UjEzdcGn079hXO74fbtnOUR+kDTFuNxgONYOqd+KIKvwmq6Nc6HecKdiEMXLpke4ODI9
         zfHktcdCRCq/qxvYpJGgjBiahQIPHHlDEr4OSEUzwhT1shii2QUV7GH9Q2o4p4wrMfcg
         3QjM6uC2D02OZlSsq54fEdkrX/Zkinr7CLBVwcJTxjwW8Ws63rOGicD5oHWA8BJ1hY/y
         WBhw==
X-Forwarded-Encrypted: i=1; AJvYcCVd6r4CL/t+6W1T+Fiyw27BujP+D9WKQlRo04a2A9hlrej4bx1dIdhaxX23aLhHbFqJixbEarjV9U0qOxY=@vger.kernel.org, AJvYcCWecqPNhBVNdCyWqhA4bC9y35XrojVQhOLSJJgJ6nhJ2D5u5BYg33mZHHrCgR1bYNtuJOGiUkT1IfgE@vger.kernel.org, AJvYcCWy6V8NKLfBfrtzyd0mcdVs1aL4RJufaIl1aybUD9+m7z+JLx3CYL+F43kSdH2I51+rbCVkxrzK/Ra9a74G@vger.kernel.org, AJvYcCXmh2dBF1jlnHoTMc9l8jNtM/pYVladKAKb3WDOQxF8KFIDWdzQg/TWYL9IQIGlADbcib49ZN1zul+1rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBLvmZMCbG646oO++v3WNM4GIJG3Vg2p3aMgkNLOKQEHx1dVP5
	nHjoq2aO8QhpUs1OpK91XgjAQRbC145Zt4tGm97FVfcBrAEz3JF3
X-Gm-Gg: ASbGncsJag7y9WEdCJ/R1Dx6PIv9ErmxW0KijUmcS4JYY/aYf4KEQUOlC4A9DzzrBft
	UKuQj21hCpUHp+fMY/A//W/hXTt7yKAtk8UP1NgtYSPWaEvwIbsiGyXtr9jngoYsRjm9Q+C9Osx
	16LtHiMeTtGq7pr3pICtU7qV+LNI4GrLIJuegpKjqp7qy8GZC15LOoK/9k63r2W6cC+XlORSdXf
	2QyO3E3VlzkE0+7q1PX9ITnWtKfJuCXUIG9zIcnkBjiG3mQI21Ywu5r3jw1oTMLNeNQ1bk5vxbP
	EqFBqV6K5R2JC9WHyRBtBIAN6A==
X-Google-Smtp-Source: AGHT+IFKBO/R4GQJ0OZX15a/pyi8IA/nju8yQdirTSElfNhs7wu3LodIkkdTq3zuK8QRRi+x6xj06Q==
X-Received: by 2002:a17:906:794d:b0:aae:83c7:fd50 with SMTP id a640c23a62f3a-ab2a79f1e11mr269175366b.9.1736345654639;
        Wed, 08 Jan 2025 06:14:14 -0800 (PST)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-232.telecom.by. [46.53.210.232])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0efe4941sm2500562666b.95.2025.01.08.06.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 06:14:14 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Wed, 08 Jan 2025 17:13:52 +0300
Subject: [PATCH v14 08/10] mfd: Add new driver for MAX77705 PMIC
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-starqltechn_integration_upstream-v14-8-f6e84ec20d96@gmail.com>
References: <20250108-starqltechn_integration_upstream-v14-0-f6e84ec20d96@gmail.com>
In-Reply-To: <20250108-starqltechn_integration_upstream-v14-0-f6e84ec20d96@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-leds@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736345640; l=18833;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=mYVzhE9cRrQLHZbeZNt+OeVeLu1RBOyrZa3r7Sk0x0k=;
 b=C51RxfiXc7+EuM/AFSlbAV6d6hAVuSg5PdddbKl3H6YSJTEePCHEKHgvOp3Ynslk6dDoSX3IZ
 AISAB2YWbrWCjQVZJ2zeSCO/uRLRBj6i5UVm03a5ww2KvJZody/phyj
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add the core MFD driver for max77705 PMIC. Drivers for sub-devices
will be added in subsequent patches.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes for v12:
- remove fuelgauge support (it's moved to simple-mfd-i2c, to reflect
    the fact it's a separate device with it's own i2c client)
- remove unneeded ending comma
- remove struct dev_pm_ops because defined by DEFINE_SIMPLE_DEV_PM_OPS
- Kconfig: select MFD_SIMPLE_MFD_I2C

Changes for v10:
- never blank line between call and its error check
- remove unnecessary line wrap
- revert wrong changes in max77693-common.h
- move max77705_pm_ops from header to c file
- fail probe, when fuelgauge is not found in sub device list
- remove fuelgauge compatible, because with compatible,
  platform matches using compatible, and platform_device
  id_entry is empty. With no compatible, platform matches
  by device id, and id_entry is populated.
- use dev_err_probe for error handling

Changes for v9:
- use max17042 as fuel gauge chip
- initialize max17042 i2c dummy device in mfd device,
  because bus can be used for reading additional values,
  not related to fuelgauge, like chip input current, system
  bus current
- fix pmic_rev kernel test robot error

Changes for v8:
- fix comment style C++ -> C
- remove unused pmic_ver

Changes for v6:
- add PMIC suffix in Kconfig
- remove filename from file header
- reorder headers alphabetically
- move out fg and chg adresses definitions
- rename led name and compatible
- remove overbracketing
- move charger and fuel gauge i2c initialization
  to their drivers
- fix max77705_i2c_driver tabbing
- formatting fixes
Changes for v5:
- license change to 2.0
- use same hardware name in Kconfig and module descriptions
Changes for v4:
- rework driver from scratch
- migrate to regmap_add_irq_chip, remove max77705-irq.c,
  rename max77705-core.c to max77705.c
- cleanup headers
- remove debugfs code
- migrate to use max77693_dev structure
- remove max77705.h
---
 MAINTAINERS                          |   2 ++
 drivers/mfd/Kconfig                  |  13 +++++++++
 drivers/mfd/Makefile                 |   2 ++
 drivers/mfd/max77705.c               | 209 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/max77693-common.h  |   4 ++-
 include/linux/mfd/max77705-private.h | 178 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 407 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 98a77dece2f1..eb5222a833f8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14294,6 +14294,7 @@ F:	drivers/*/*max77843.c
 F:	drivers/*/max14577*.c
 F:	drivers/*/max77686*.c
 F:	drivers/*/max77693*.c
+F:	drivers/*/max77705*.c
 F:	drivers/clk/clk-max77686.c
 F:	drivers/extcon/extcon-max14577.c
 F:	drivers/extcon/extcon-max77693.c
@@ -14301,6 +14302,7 @@ F:	drivers/rtc/rtc-max77686.c
 F:	include/linux/mfd/max14577*.h
 F:	include/linux/mfd/max77686*.h
 F:	include/linux/mfd/max77693*.h
+F:	include/linux/mfd/max77705*.h
 
 MAXIRADIO FM RADIO RECEIVER DRIVER
 M:	Hans Verkuil <hverkuil@xs4all.nl>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6b0682af6e32..5064b1b42f76 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -916,6 +916,19 @@ config MFD_MAX77693
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_MAX77705
+	tristate "Maxim MAX77705 PMIC Support"
+	depends on I2C
+	select MFD_CORE
+	select MFD_SIMPLE_MFD_I2C
+	help
+	  Say yes here to add support for Maxim Integrated MAX77705 PMIC.
+	  This is a Power Management IC with Charger, safe LDOs, Flash, Haptic
+	  and MUIC controls on chip.
+	  This driver provides common support for accessing the device;
+	  additional drivers must be enabled in order to use the functionality
+	  of the device.
+
 config MFD_MAX77714
 	tristate "Maxim Semiconductor MAX77714 PMIC Support"
 	depends on I2C
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 9220eaf7cf12..c18bb5a57734 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -168,6 +168,7 @@ obj-$(CONFIG_MFD_MAX77620)	+= max77620.o
 obj-$(CONFIG_MFD_MAX77650)	+= max77650.o
 obj-$(CONFIG_MFD_MAX77686)	+= max77686.o
 obj-$(CONFIG_MFD_MAX77693)	+= max77693.o
+obj-$(CONFIG_MFD_MAX77705)	+= max77705.o
 obj-$(CONFIG_MFD_MAX77714)	+= max77714.o
 obj-$(CONFIG_MFD_MAX77843)	+= max77843.o
 obj-$(CONFIG_MFD_MAX8907)	+= max8907.o
@@ -233,6 +234,7 @@ obj-$(CONFIG_MFD_RK8XX_I2C)	+= rk8xx-i2c.o
 obj-$(CONFIG_MFD_RK8XX_SPI)	+= rk8xx-spi.o
 obj-$(CONFIG_MFD_RN5T618)	+= rn5t618.o
 obj-$(CONFIG_MFD_SEC_CORE)	+= sec-core.o sec-irq.o
+obj-$(CONFIG_MFD_S2DOS05)	+= s2dos05.o
 obj-$(CONFIG_MFD_SYSCON)	+= syscon.o
 obj-$(CONFIG_MFD_LM3533)	+= lm3533-core.o lm3533-ctrlbank.o
 obj-$(CONFIG_MFD_VEXPRESS_SYSREG)	+= vexpress-sysreg.o
diff --git a/drivers/mfd/max77705.c b/drivers/mfd/max77705.c
new file mode 100644
index 000000000000..18d344620755
--- /dev/null
+++ b/drivers/mfd/max77705.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Maxim MAX77705 PMIC core driver
+//
+// Copyright (C) 2024 Dzmitry Sankouski <dsankouski@gmail.com>
+
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/max77705-private.h>
+#include <linux/mfd/max77693-common.h>
+#include <linux/pm.h>
+#include <linux/power/max17042_battery.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/of.h>
+
+static struct mfd_cell max77705_devs[] = {
+	{
+		.name = "max77705-rgb",
+		.of_compatible = "maxim,max77705-rgb",
+	},
+	{
+		.name = "max77705-charger",
+		.of_compatible = "maxim,max77705-charger",
+	},
+	{
+		.name = "max77705-haptic",
+		.of_compatible = "maxim,max77705-haptic",
+	},
+};
+
+static const struct regmap_range max77705_readable_ranges[] = {
+	regmap_reg_range(MAX77705_PMIC_REG_PMICID1,		MAX77705_PMIC_REG_BSTOUT_MASK),
+	regmap_reg_range(MAX77705_PMIC_REG_INTSRC,		MAX77705_PMIC_REG_RESERVED_29),
+	regmap_reg_range(MAX77705_PMIC_REG_BOOSTCONTROL1,	MAX77705_PMIC_REG_BOOSTCONTROL1),
+	regmap_reg_range(MAX77705_PMIC_REG_MCONFIG,		MAX77705_PMIC_REG_MCONFIG2),
+	regmap_reg_range(MAX77705_PMIC_REG_FORCE_EN_MASK,	MAX77705_PMIC_REG_FORCE_EN_MASK),
+	regmap_reg_range(MAX77705_PMIC_REG_BOOSTCONTROL1,	MAX77705_PMIC_REG_BOOSTCONTROL1),
+	regmap_reg_range(MAX77705_PMIC_REG_BOOSTCONTROL2,	MAX77705_PMIC_REG_BOOSTCONTROL2),
+	regmap_reg_range(MAX77705_PMIC_REG_SW_RESET,		MAX77705_PMIC_REG_USBC_RESET),
+};
+
+static const struct regmap_range max77705_writable_ranges[] = {
+	regmap_reg_range(MAX77705_PMIC_REG_MAINCTRL1,		MAX77705_PMIC_REG_BSTOUT_MASK),
+	regmap_reg_range(MAX77705_PMIC_REG_INTSRC,		MAX77705_PMIC_REG_RESERVED_29),
+	regmap_reg_range(MAX77705_PMIC_REG_BOOSTCONTROL1,	MAX77705_PMIC_REG_BOOSTCONTROL1),
+	regmap_reg_range(MAX77705_PMIC_REG_MCONFIG,		MAX77705_PMIC_REG_MCONFIG2),
+	regmap_reg_range(MAX77705_PMIC_REG_FORCE_EN_MASK,	MAX77705_PMIC_REG_FORCE_EN_MASK),
+	regmap_reg_range(MAX77705_PMIC_REG_BOOSTCONTROL1,	MAX77705_PMIC_REG_BOOSTCONTROL1),
+	regmap_reg_range(MAX77705_PMIC_REG_BOOSTCONTROL2,	MAX77705_PMIC_REG_BOOSTCONTROL2),
+	regmap_reg_range(MAX77705_PMIC_REG_SW_RESET,		MAX77705_PMIC_REG_USBC_RESET),
+
+};
+
+static const struct regmap_access_table max77705_readable_table = {
+	.yes_ranges = max77705_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(max77705_readable_ranges),
+};
+
+static const struct regmap_access_table max77705_writable_table = {
+	.yes_ranges = max77705_writable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(max77705_writable_ranges),
+};
+
+static const struct regmap_config max77705_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.rd_table = &max77705_readable_table,
+	.wr_table = &max77705_writable_table,
+	.max_register = MAX77705_PMIC_REG_USBC_RESET,
+};
+
+static const struct regmap_config max77705_leds_regmap_config = {
+	.reg_base = MAX77705_RGBLED_REG_BASE,
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = MAX77705_LED_REG_END,
+};
+
+static const struct regmap_irq max77705_topsys_irqs[] = {
+	{ .mask = MAX77705_SYSTEM_IRQ_BSTEN_INT,  },
+	{ .mask = MAX77705_SYSTEM_IRQ_SYSUVLO_INT,  },
+	{ .mask = MAX77705_SYSTEM_IRQ_SYSOVLO_INT,  },
+	{ .mask = MAX77705_SYSTEM_IRQ_TSHDN_INT,  },
+	{ .mask = MAX77705_SYSTEM_IRQ_TM_INT,  },
+};
+
+static const struct regmap_irq_chip max77705_topsys_irq_chip = {
+	.name			= "max77705-topsys",
+	.status_base		= MAX77705_PMIC_REG_SYSTEM_INT,
+	.mask_base		= MAX77705_PMIC_REG_SYSTEM_INT_MASK,
+	.num_regs		= 1,
+	.irqs			= max77705_topsys_irqs,
+	.num_irqs		= ARRAY_SIZE(max77705_topsys_irqs),
+};
+
+static int max77705_i2c_probe(struct i2c_client *i2c)
+{
+	struct max77693_dev *max77705;
+	struct regmap_irq_chip_data *irq_data;
+	struct irq_domain *domain;
+	int ret;
+	unsigned int pmic_rev_value;
+	enum max77705_hw_rev pmic_rev;
+
+	max77705 = devm_kzalloc(&i2c->dev, sizeof(*max77705), GFP_KERNEL);
+	if (!max77705)
+		return -ENOMEM;
+
+	max77705->i2c = i2c;
+	max77705->dev = &i2c->dev;
+	max77705->irq = i2c->irq;
+	max77705->type = TYPE_MAX77705;
+	i2c_set_clientdata(i2c, max77705);
+
+	max77705->regmap = devm_regmap_init_i2c(i2c, &max77705_regmap_config);
+	if (IS_ERR(max77705->regmap))
+		return PTR_ERR(max77705->regmap);
+
+	if (regmap_read(max77705->regmap, MAX77705_PMIC_REG_PMICREV, &pmic_rev_value) < 0)
+		return -ENODEV;
+
+	pmic_rev = pmic_rev_value & MAX77705_REVISION_MASK;
+	if (pmic_rev != MAX77705_PASS3)
+		return dev_err_probe(max77705->dev, -ENODEV,
+				"Rev.0x%x is not tested\n", pmic_rev);
+
+	max77705->regmap_leds = devm_regmap_init_i2c(i2c, &max77705_leds_regmap_config);
+	if (IS_ERR(max77705->regmap_leds))
+		return dev_err_probe(max77705->dev, PTR_ERR(max77705->regmap_leds),
+				"Failed to register leds regmap\n");
+
+	ret = devm_regmap_add_irq_chip(max77705->dev, max77705->regmap,
+					max77705->irq,
+					IRQF_ONESHOT | IRQF_SHARED, 0,
+					&max77705_topsys_irq_chip,
+					&irq_data);
+	if (ret)
+		return dev_err_probe(max77705->dev, ret, "Failed to add irq chip\n");
+
+	/* Unmask interrupts from all blocks in interrupt source register */
+	ret = regmap_update_bits(max77705->regmap,
+				 MAX77705_PMIC_REG_INTSRC_MASK,
+				 MAX77705_SRC_IRQ_ALL, (unsigned int)~MAX77705_SRC_IRQ_ALL);
+	if (ret < 0)
+		return dev_err_probe(max77705->dev, ret,
+			"Could not unmask interrupts in INTSRC\n");
+
+	domain = regmap_irq_get_domain(irq_data);
+
+	ret = devm_mfd_add_devices(max77705->dev, PLATFORM_DEVID_NONE,
+				   max77705_devs, ARRAY_SIZE(max77705_devs),
+				   NULL, 0, domain);
+	if (ret)
+		return dev_err_probe(max77705->dev, ret, "Failed to register child devices\n");
+
+	device_init_wakeup(max77705->dev, true);
+
+	return 0;
+}
+
+static int max77705_suspend(struct device *dev)
+{
+	struct i2c_client *i2c = to_i2c_client(dev);
+	struct max77693_dev *max77705 = i2c_get_clientdata(i2c);
+
+	disable_irq(max77705->irq);
+
+	if (device_may_wakeup(dev))
+		enable_irq_wake(max77705->irq);
+
+	return 0;
+}
+
+static int max77705_resume(struct device *dev)
+{
+	struct i2c_client *i2c = to_i2c_client(dev);
+	struct max77693_dev *max77705 = i2c_get_clientdata(i2c);
+
+	if (device_may_wakeup(dev))
+		disable_irq_wake(max77705->irq);
+
+	enable_irq(max77705->irq);
+
+	return 0;
+}
+DEFINE_SIMPLE_DEV_PM_OPS(max77705_pm_ops, max77705_suspend, max77705_resume);
+
+static const struct of_device_id max77705_i2c_of_match[] = {
+	{ .compatible = "maxim,max77705" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, max77705_i2c_of_match);
+
+static struct i2c_driver max77705_i2c_driver = {
+	.driver = {
+		.name			= "max77705",
+		.of_match_table		= max77705_i2c_of_match,
+		.pm			= pm_sleep_ptr(&max77705_pm_ops),
+		.suppress_bind_attrs	= true,
+	},
+	.probe = max77705_i2c_probe
+};
+module_i2c_driver(max77705_i2c_driver);
+
+MODULE_DESCRIPTION("Maxim MAX77705 PMIC core driver");
+MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/max77693-common.h b/include/linux/mfd/max77693-common.h
index a5bce099f1ed..ec2e1b2dceb8 100644
--- a/include/linux/mfd/max77693-common.h
+++ b/include/linux/mfd/max77693-common.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0+ */
 /*
- * Common data shared between Maxim 77693 and 77843 drivers
+ * Common data shared between Maxim 77693, 77705 and 77843 drivers
  *
  * Copyright (C) 2015 Samsung Electronics
  */
@@ -11,6 +11,7 @@
 enum max77693_types {
 	TYPE_MAX77693_UNKNOWN,
 	TYPE_MAX77693,
+	TYPE_MAX77705,
 	TYPE_MAX77843,
 
 	TYPE_MAX77693_NUM,
@@ -32,6 +33,7 @@ struct max77693_dev {
 	struct regmap *regmap_muic;
 	struct regmap *regmap_haptic;	/* Only MAX77693 */
 	struct regmap *regmap_chg;	/* Only MAX77843 */
+	struct regmap *regmap_leds;	/* Only MAX77705 */
 
 	struct regmap_irq_chip_data *irq_data_led;
 	struct regmap_irq_chip_data *irq_data_topsys;
diff --git a/include/linux/mfd/max77705-private.h b/include/linux/mfd/max77705-private.h
new file mode 100644
index 000000000000..e4309d3b6f2a
--- /dev/null
+++ b/include/linux/mfd/max77705-private.h
@@ -0,0 +1,178 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Maxim MAX77705 definitions.
+ *
+ * Copyright (C) 2015 Samsung Electronics, Inc.
+ * Copyright (C) 2024 Dzmitry Sankouski <dsankouski@gmail.com>
+ */
+
+#ifndef __LINUX_MFD_MAX77705_PRIV_H
+#define __LINUX_MFD_MAX77705_PRIV_H
+
+#define MAX77705_SRC_IRQ_CHG	BIT(0)
+#define MAX77705_SRC_IRQ_TOP	BIT(1)
+#define MAX77705_SRC_IRQ_FG	BIT(2)
+#define MAX77705_SRC_IRQ_USBC	BIT(3)
+#define MAX77705_SRC_IRQ_ALL	(MAX77705_SRC_IRQ_CHG | MAX77705_SRC_IRQ_TOP | \
+				MAX77705_SRC_IRQ_FG | MAX77705_SRC_IRQ_USBC)
+
+/* MAX77705_PMIC_REG_PMICREV register */
+#define MAX77705_VERSION_SHIFT	3
+#define MAX77705_REVISION_MASK	GENMASK(2, 0)
+#define MAX77705_VERSION_MASK	GENMASK(7, MAX77705_VERSION_SHIFT)
+/* MAX77705_PMIC_REG_MAINCTRL1 register */
+#define MAX77705_MAINCTRL1_BIASEN_SHIFT	7
+#define MAX77705_MAINCTRL1_BIASEN_MASK	BIT(MAX77705_MAINCTRL1_BIASEN_SHIFT)
+/* MAX77705_PMIC_REG_MCONFIG2 (haptics) register */
+#define MAX77705_CONFIG2_MEN_SHIFT	6
+#define MAX77705_CONFIG2_MODE_SHIFT	7
+#define MAX77705_CONFIG2_HTYP_SHIFT	5
+/* MAX77705_PMIC_REG_SYSTEM_INT_MASK register */
+#define MAX77705_SYSTEM_IRQ_BSTEN_INT	BIT(3)
+#define MAX77705_SYSTEM_IRQ_SYSUVLO_INT	BIT(4)
+#define MAX77705_SYSTEM_IRQ_SYSOVLO_INT	BIT(5)
+#define MAX77705_SYSTEM_IRQ_TSHDN_INT	BIT(6)
+#define MAX77705_SYSTEM_IRQ_TM_INT	BIT(7)
+
+enum max77705_hw_rev {
+	MAX77705_PASS1 = 1,
+	MAX77705_PASS2,
+	MAX77705_PASS3
+};
+
+enum max77705_reg {
+	MAX77705_PMIC_REG_PMICID1		= 0x00,
+	MAX77705_PMIC_REG_PMICREV		= 0x01,
+	MAX77705_PMIC_REG_MAINCTRL1		= 0x02,
+	MAX77705_PMIC_REG_BSTOUT_MASK		= 0x03,
+	MAX77705_PMIC_REG_FORCE_EN_MASK		= 0x08,
+	MAX77705_PMIC_REG_MCONFIG		= 0x10,
+	MAX77705_PMIC_REG_MCONFIG2		= 0x11,
+	MAX77705_PMIC_REG_INTSRC		= 0x22,
+	MAX77705_PMIC_REG_INTSRC_MASK		= 0x23,
+	MAX77705_PMIC_REG_SYSTEM_INT		= 0x24,
+	MAX77705_PMIC_REG_RESERVED_25		= 0x25,
+	MAX77705_PMIC_REG_SYSTEM_INT_MASK	= 0x26,
+	MAX77705_PMIC_REG_RESERVED_27		= 0x27,
+	MAX77705_PMIC_REG_RESERVED_28		= 0x28,
+	MAX77705_PMIC_REG_RESERVED_29		= 0x29,
+	MAX77705_PMIC_REG_BOOSTCONTROL1		= 0x4C,
+	MAX77705_PMIC_REG_BOOSTCONTROL2		= 0x4F,
+	MAX77705_PMIC_REG_SW_RESET		= 0x50,
+	MAX77705_PMIC_REG_USBC_RESET		= 0x51,
+
+	MAX77705_PMIC_REG_END
+};
+
+enum max77705_chg_reg {
+	MAX77705_CHG_REG_BASE			= 0xB0,
+	MAX77705_CHG_REG_INT			= 0,
+	MAX77705_CHG_REG_INT_MASK,
+	MAX77705_CHG_REG_INT_OK,
+	MAX77705_CHG_REG_DETAILS_00,
+	MAX77705_CHG_REG_DETAILS_01,
+	MAX77705_CHG_REG_DETAILS_02,
+	MAX77705_CHG_REG_DTLS_03,
+	MAX77705_CHG_REG_CNFG_00,
+	MAX77705_CHG_REG_CNFG_01,
+	MAX77705_CHG_REG_CNFG_02,
+	MAX77705_CHG_REG_CNFG_03,
+	MAX77705_CHG_REG_CNFG_04,
+	MAX77705_CHG_REG_CNFG_05,
+	MAX77705_CHG_REG_CNFG_06,
+	MAX77705_CHG_REG_CNFG_07,
+	MAX77705_CHG_REG_CNFG_08,
+	MAX77705_CHG_REG_CNFG_09,
+	MAX77705_CHG_REG_CNFG_10,
+	MAX77705_CHG_REG_CNFG_11,
+
+	MAX77705_CHG_REG_CNFG_12,
+	MAX77705_CHG_REG_CNFG_13,
+	MAX77705_CHG_REG_CNFG_14,
+	MAX77705_CHG_REG_SAFEOUT_CTRL
+};
+
+enum max77705_fuelgauge_reg {
+	STATUS_REG				= 0x00,
+	VALRT_THRESHOLD_REG			= 0x01,
+	TALRT_THRESHOLD_REG			= 0x02,
+	SALRT_THRESHOLD_REG			= 0x03,
+	REMCAP_REP_REG				= 0x05,
+	SOCREP_REG				= 0x06,
+	TEMPERATURE_REG				= 0x08,
+	VCELL_REG				= 0x09,
+	TIME_TO_EMPTY_REG			= 0x11,
+	FULLSOCTHR_REG				= 0x13,
+	CURRENT_REG				= 0x0A,
+	AVG_CURRENT_REG				= 0x0B,
+	SOCMIX_REG				= 0x0D,
+	SOCAV_REG				= 0x0E,
+	REMCAP_MIX_REG				= 0x0F,
+	FULLCAP_REG				= 0x10,
+	RFAST_REG				= 0x15,
+	AVR_TEMPERATURE_REG			= 0x16,
+	CYCLES_REG				= 0x17,
+	DESIGNCAP_REG				= 0x18,
+	AVR_VCELL_REG				= 0x19,
+	TIME_TO_FULL_REG			= 0x20,
+	CONFIG_REG				= 0x1D,
+	ICHGTERM_REG				= 0x1E,
+	REMCAP_AV_REG				= 0x1F,
+	FULLCAP_NOM_REG				= 0x23,
+	LEARN_CFG_REG				= 0x28,
+	FILTER_CFG_REG				= 0x29,
+	MISCCFG_REG				= 0x2B,
+	QRTABLE20_REG				= 0x32,
+	FULLCAP_REP_REG				= 0x35,
+	RCOMP_REG				= 0x38,
+	VEMPTY_REG				= 0x3A,
+	FSTAT_REG				= 0x3D,
+	DISCHARGE_THRESHOLD_REG			= 0x40,
+	QRTABLE30_REG				= 0x42,
+	ISYS_REG				= 0x43,
+	DQACC_REG				= 0x45,
+	DPACC_REG				= 0x46,
+	AVGISYS_REG				= 0x4B,
+	QH_REG					= 0x4D,
+	VSYS_REG				= 0xB1,
+	TALRTTH2_REG				= 0xB2,
+	VBYP_REG				= 0xB3,
+	CONFIG2_REG				= 0xBB,
+	IIN_REG					= 0xD0,
+	OCV_REG					= 0xEE,
+	VFOCV_REG				= 0xFB,
+	VFSOC_REG				= 0xFF,
+
+	MAX77705_FG_END
+};
+
+enum max77705_led_reg {
+	MAX77705_RGBLED_REG_BASE		= 0x30,
+	MAX77705_RGBLED_REG_LEDEN		= 0,
+	MAX77705_RGBLED_REG_LED0BRT,
+	MAX77705_RGBLED_REG_LED1BRT,
+	MAX77705_RGBLED_REG_LED2BRT,
+	MAX77705_RGBLED_REG_LED3BRT,
+	MAX77705_RGBLED_REG_LEDRMP,
+	MAX77705_RGBLED_REG_LEDBLNK,
+	MAX77705_LED_REG_END
+};
+
+enum max77705_charger_battery_state {
+	MAX77705_BATTERY_NOBAT,
+	MAX77705_BATTERY_PREQUALIFICATION,
+	MAX77705_BATTERY_DEAD,
+	MAX77705_BATTERY_GOOD,
+	MAX77705_BATTERY_LOWVOLTAGE,
+	MAX77705_BATTERY_OVERVOLTAGE,
+	MAX77705_BATTERY_RESERVED
+};
+
+enum max77705_charger_charge_type {
+	MAX77705_CHARGER_CONSTANT_CURRENT	= 1,
+	MAX77705_CHARGER_CONSTANT_VOLTAGE,
+	MAX77705_CHARGER_END_OF_CHARGE,
+	MAX77705_CHARGER_DONE
+};
+
+#endif /* __LINUX_MFD_MAX77705_PRIV_H */

-- 
2.39.5


