Return-Path: <linux-input+bounces-8328-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 077819DFDB2
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 10:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC0DB284B9A
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 09:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A0C1FDE1F;
	Mon,  2 Dec 2024 09:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9PA4ohs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163321FBCA2;
	Mon,  2 Dec 2024 09:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733132898; cv=none; b=O6e4I/nkjXrkzvVU2g/Nc+Fs8cT3IUQu8clDT76fk8dTQ9hN0i0MvnZW270+0ZGfPtcwYk0q9VW+xKtSWF6XcVge41PEk6VI4+DLipxZ5LC5tvxOEIxjc3LI4MKej8/eqdhwg/y++scOnqGOr81vlUKDcLLOl7j6u2Oa6uy7dFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733132898; c=relaxed/simple;
	bh=3wSXtxlaGuN/rWpsGPpI2DywUSoCF1mihMzdG0lPZw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aVbCcHdTS7KciWMdGia6y++p9rsii6uavJ91qLORk9XDnkn8RdbiTxHFRjPtWvgJOKcQ48+X6shFw44mMFTSoehyceFySbjTWM4GtfCZpBU9sH+Tl9shwOS9NVchWEjByDNSWEy2M74EBVH1ja+1woXuAprxrH/A7lmLoCncXqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9PA4ohs; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa51b8c5f4dso593923566b.2;
        Mon, 02 Dec 2024 01:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733132892; x=1733737692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfjDC06MTp2B47enl3KHHPiFOICyc7FV1MJ/+Hr1NB8=;
        b=T9PA4ohsrB7XUyeXHKIzYesR+AbUN6J59s0b+Ta/7GN+mE7Q7Gz3Ao6let2xtiiqUQ
         FMHExvBxR/LxECQHs1wNi/wEvrJNwEJ5XUPIgj1VkUXOXWxLIOatJ3r0cqUO2RBs5KN1
         o5pzfKv24Og8hxiBQi3YE1DVIIFRR5rWsf2IufK/8PFqIhTYQrOU6PfDunxH76hh+Qbz
         7ZzxcLhhtmefAdnCtrfKKN4I0ey51uKzzjnxBqUqxcxfk9azTyghWQhs0GEou6hnIC08
         Wmuwpv9537kTUk2gigjHjbPdYzLXTwuEEmJ6OIWCLgxWsTw4uf2ZXclk/Dxq9K6VbP7Z
         NXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733132892; x=1733737692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfjDC06MTp2B47enl3KHHPiFOICyc7FV1MJ/+Hr1NB8=;
        b=MoSelU7JjiJ6fEX5MNA/KR/ep1I6xHMUYD/l3qJa6kooxnRjSpdDj77KXfWr1rskDV
         o7rC0Up0Ad8/j96JDKHI4c/4Z4MpWOd27qAcIaojhwE6aoNyYxwr0b4HAlaKDeJhBpR4
         ZJv/KkVYtXYpN1LCfqg+ik75XltABd9tbxqgJ6/MV/gadM5VIRFQ9vGVU4o5k/Gby8QT
         0fQD93w4lvpYjjWKBXH03B+sVtuJkWyKz1v24KyHZithJFnixM5++CFBLZAEfSxm7MwB
         1jefInob+V3sDDN+lWcPGvLCwDtmDl/D2IfBLeYxY5xshrdLVZjzktHOp8NdHQ+joG1x
         fLSA==
X-Forwarded-Encrypted: i=1; AJvYcCWzLS221ej2mgDjcCDPJqty4trIoySss+2dXVMP9Wx6fQjdsCv4pdpYP2VrbgZMupfDAcFckkFIs6XK7w==@vger.kernel.org, AJvYcCX0NRx5TqCjD3Y409Mt4mlcuu9Jtm/LTYYF9rxu47ueISjuyy/ButIcySMYG6g7dR5IMk/JZsi54v/hGGc=@vger.kernel.org, AJvYcCXIlqEcdJ0so7Nrc1mHPnmdHJK8oZB8B9NYFrBMidVxdso07Osoa9/tk/Foj7QhwjeTqnzpZ+Bk4NBJ@vger.kernel.org, AJvYcCXkl24+zVap6dRz0ND1i5oNz5uIKFXzQPuVJQc4LkPPs6Nzt6En4Mz/h1cIFb5WoFfbH/w/5Mp9j6UHODJd@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqy3mJ9P/Sb3zMjHMHO9jdgwP2eINKpQ6Sw5SFY/wFiZbDYZg/
	kMRq3DPFt5Rn7KTtEjE1hlP9LxKD1Ahg5M+HuPfU5S3nY3euzqm1
X-Gm-Gg: ASbGncu28SkM5in9jGvgbrNmP+IQkgz2hBV1XP5rrWpgudzUwvXKw0c0w75zAqV92yj
	Mq2yNJt1CCHqdU6fr2Qu0CgICHJnTBwHa2K9EvZhERAw/pNl8vfWlpkh6VfesCKGPinhrXlvdzR
	xftOrXBCqBL+jfMXLsxIAxYorbpOiIsHrp3EPyqoh4UF/cB+oFTHA12pwC1yJGd2fKcZpmjpB6l
	cHmV3a7otHOSEWA3OWk+jDqd5deY3dEebJiRZxUC5D1ThhO
X-Google-Smtp-Source: AGHT+IGvbE4ULrnjVfLZiXEKHJNLcEYlnbCJANeUtUSGMyoE4KXRCT0rD1bYG0eMczSln6rJkB5CKQ==
X-Received: by 2002:a17:906:2182:b0:aa5:3853:5535 with SMTP id a640c23a62f3a-aa581028f7dmr2061245266b.38.1733132892168;
        Mon, 02 Dec 2024 01:48:12 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa599957594sm487059766b.197.2024.12.02.01.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 01:48:11 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 02 Dec 2024 12:47:59 +0300
Subject: [PATCH v9 6/9] mfd: Add new driver for MAX77705 PMIC
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-starqltechn_integration_upstream-v9-6-a1adc3bae2b8@gmail.com>
References: <20241202-starqltechn_integration_upstream-v9-0-a1adc3bae2b8@gmail.com>
In-Reply-To: <20241202-starqltechn_integration_upstream-v9-0-a1adc3bae2b8@gmail.com>
To: Sebastian Reichel <sre@kernel.org>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
 linux-leds@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733132883; l=18949;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=3wSXtxlaGuN/rWpsGPpI2DywUSoCF1mihMzdG0lPZw0=;
 b=McuqP1J8csujMy+qGwh2ItSn22S/1ta139FkrI0fXLepqE/pwSBmAbMi4mW2d2Ety+rQXiUd1
 UAxPRGvhI1eC9gPNRLrpU5Qj+/L9LwZjdjSEYXrnAIlESqV8Ajvta3E
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add the core MFD driver for max77705 PMIC. We define five sub-devices
for which the drivers will be added in subsequent patches.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
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
 drivers/mfd/Kconfig                  |  12 ++++++++
 drivers/mfd/Makefile                 |   2 ++
 drivers/mfd/max77705.c               | 242 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/max77693-common.h  |   5 ++-
 include/linux/mfd/max77705-private.h | 181 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 443 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c3f66093edd1..b269d0456da3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14192,6 +14192,7 @@ F:	drivers/*/*max77843.c
 F:	drivers/*/max14577*.c
 F:	drivers/*/max77686*.c
 F:	drivers/*/max77693*.c
+F:	drivers/*/max77705*.c
 F:	drivers/clk/clk-max77686.c
 F:	drivers/extcon/extcon-max14577.c
 F:	drivers/extcon/extcon-max77693.c
@@ -14199,6 +14200,7 @@ F:	drivers/rtc/rtc-max77686.c
 F:	include/linux/mfd/max14577*.h
 F:	include/linux/mfd/max77686*.h
 F:	include/linux/mfd/max77693*.h
+F:	include/linux/mfd/max77705*.h
 
 MAXIRADIO FM RADIO RECEIVER DRIVER
 M:	Hans Verkuil <hverkuil@xs4all.nl>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index ae23b317a64e..17951a9d5a93 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -916,6 +916,18 @@ config MFD_MAX77693
 	  additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_MAX77705
+	tristate "Maxim MAX77705 PMIC Support"
+	depends on I2C
+	select MFD_CORE
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
index e057d6d6faef..d981690b5a12 100644
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
index 000000000000..42ef29e2bd76
--- /dev/null
+++ b/drivers/mfd/max77705.c
@@ -0,0 +1,242 @@
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
+#include <linux/power/max17042_battery.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/of.h>
+
+#define I2C_ADDR_FG     0x36
+#define	FUEL_GAUGE_NAME "max77705-battery"
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
+	{
+		.name = FUEL_GAUGE_NAME,
+		.of_compatible = "maxim,max77705-battery",
+	}
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
+	struct i2c_client *i2c_fg;
+	struct regmap_irq_chip_data *irq_data;
+	struct irq_domain *domain;
+	int ret;
+	unsigned int pmic_rev_value;
+	enum max77705_hw_rev pmic_rev;
+
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
+
+	if (IS_ERR(max77705->regmap))
+		return PTR_ERR(max77705->regmap);
+
+	if (regmap_read(max77705->regmap, MAX77705_PMIC_REG_PMICREV, &pmic_rev_value) < 0)
+		return -ENODEV;
+
+	pmic_rev = pmic_rev_value & MAX77705_REVISION_MASK;
+
+	if (pmic_rev != MAX77705_PASS3) {
+		dev_err(max77705->dev, "rev.0x%x is not tested",
+			pmic_rev);
+		return -ENODEV;
+	}
+
+	max77705->regmap_leds = devm_regmap_init_i2c(i2c, &max77705_leds_regmap_config);
+
+	if (IS_ERR(max77705->regmap_leds))
+		return PTR_ERR(max77705->regmap_leds);
+
+	ret = devm_regmap_add_irq_chip(max77705->dev, max77705->regmap,
+					max77705->irq,
+					IRQF_ONESHOT | IRQF_SHARED, 0,
+					&max77705_topsys_irq_chip,
+					&irq_data);
+
+	if (ret)
+		dev_err(max77705->dev, "failed to add irq chip: %d\n", ret);
+
+	/* Unmask interrupts from all blocks in interrupt source register */
+	ret = regmap_update_bits(max77705->regmap,
+				 MAX77705_PMIC_REG_INTSRC_MASK,
+				 MAX77705_SRC_IRQ_ALL, (unsigned int)~MAX77705_SRC_IRQ_ALL);
+
+	if (ret < 0) {
+		dev_err(max77705->dev,
+			"Could not unmask interrupts in INTSRC: %d\n", ret);
+		return ret;
+	}
+
+	domain = regmap_irq_get_domain(irq_data);
+
+	i2c_fg = devm_i2c_new_dummy_device(max77705->dev, max77705->i2c->adapter, I2C_ADDR_FG);
+
+	if (IS_ERR(i2c_fg))
+		return PTR_ERR(i2c_fg);
+
+	max77705->i2c_fg = i2c_fg;
+
+	for (int i = 0; i < ARRAY_SIZE(max77705_devs); i++) {
+		if (!strcmp(max77705_devs[i].name, FUEL_GAUGE_NAME)) {
+			max77705_devs[i].platform_data = &i2c_fg;
+			max77705_devs[i].pdata_size = sizeof(i2c_fg);
+		}
+	}
+
+	ret = devm_mfd_add_devices(max77705->dev, PLATFORM_DEVID_NONE,
+				   max77705_devs, ARRAY_SIZE(max77705_devs),
+				   NULL, 0, domain);
+
+	if (ret) {
+		dev_err(max77705->dev, "Failed to register child devices: %d\n", ret);
+		return ret;
+	}
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
+	{ },
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
+	.probe = max77705_i2c_probe,
+};
+module_i2c_driver(max77705_i2c_driver);
+
+MODULE_DESCRIPTION("Maxim MAX77705 PMIC core driver");
+MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/max77693-common.h b/include/linux/mfd/max77693-common.h
index a5bce099f1ed..8665097892cd 100644
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
@@ -25,6 +26,7 @@ struct max77693_dev {
 	struct i2c_client *i2c_muic;	/* 0x4A , MUIC */
 	struct i2c_client *i2c_haptic;	/* MAX77693: 0x90 , Haptic */
 	struct i2c_client *i2c_chg;	/* MAX77843: 0xD2, Charger */
+	struct i2c_client *i2c_fg;	/* MAX77843: 0xD2, Charger */
 
 	enum max77693_types type;
 
@@ -32,6 +34,7 @@ struct max77693_dev {
 	struct regmap *regmap_muic;
 	struct regmap *regmap_haptic;	/* Only MAX77693 */
 	struct regmap *regmap_chg;	/* Only MAX77843 */
+	struct regmap *regmap_leds;	/* Only MAX77705 */
 
 	struct regmap_irq_chip_data *irq_data_led;
 	struct regmap_irq_chip_data *irq_data_topsys;
diff --git a/include/linux/mfd/max77705-private.h b/include/linux/mfd/max77705-private.h
new file mode 100644
index 000000000000..be781a0f9802
--- /dev/null
+++ b/include/linux/mfd/max77705-private.h
@@ -0,0 +1,181 @@
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
+#include <linux/pm.h>
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
+	MAX77705_PASS3,
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
+	MAX77705_PMIC_REG_END,
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
+	MAX77705_CHG_REG_CNFG_12,
+	MAX77705_CHG_REG_CNFG_13,
+	MAX77705_CHG_REG_CNFG_14,
+	MAX77705_CHG_REG_SAFEOUT_CTRL,
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
+	MAX77705_FG_END,
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
+	MAX77705_BATTERY_RESERVED,
+};
+
+enum max77705_charger_charge_type {
+	MAX77705_CHARGER_CONSTANT_CURRENT	= 1,
+	MAX77705_CHARGER_CONSTANT_VOLTAGE,
+	MAX77705_CHARGER_END_OF_CHARGE,
+	MAX77705_CHARGER_DONE,
+};
+
+extern const struct dev_pm_ops max77705_pm_ops;
+
+#endif /* __LINUX_MFD_MAX77705_PRIV_H */

-- 
2.39.5


