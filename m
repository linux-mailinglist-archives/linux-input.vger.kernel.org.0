Return-Path: <linux-input+bounces-8142-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 850949D1E93
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 04:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE719B22674
	for <lists+linux-input@lfdr.de>; Tue, 19 Nov 2024 03:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AFC14E2CD;
	Tue, 19 Nov 2024 03:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1leoVQb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F02F14658D;
	Tue, 19 Nov 2024 03:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731985245; cv=none; b=snjXCMq8X4W2hGVIySbLqptzW0vusoKqKZqkI+m6kVTy+m5SLIsou1wUNC//TSDNclHrAnlUKEvjV5pNY77YF+nUhisbKP5/VzgTXy9nT1n5UXcFZyBZYeepKpTXID4OUS+VhLObKQ2680t36UaF31m7c6j/j4BCjOn+qoeMtQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731985245; c=relaxed/simple;
	bh=UB/lt++/PrQ6MRw9Hi/AuVreAC3wIKoTjXM0qj0LjoA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sOSHHCKeb/8PTsH12ggNWad47olEEPLGi1JvxRjnTCmS8cmurJ/+s7fuQQ7brR6UonGPtBrLasLkg34oswnYvuNzqcC+IlYvv2ByTSBz360cVL4nyZaDYanZlCI2EllkCIKPIA4USXtacc9jXEfJHCQqDDoHUCXa4x2CFpuGP4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1leoVQb; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ea45dac86eso1925610a91.3;
        Mon, 18 Nov 2024 19:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731985241; x=1732590041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSeIoWgS/KcvXHUN2aQDfLe2Z9qMRzkaT4SKto2xXEg=;
        b=k1leoVQbLjsycbZt/wxNbnBIZ2txiGIs1DmqVZ+2TVFlvuLFrqTtBd7ybMlMz3U4F1
         zBIbgvcNcXWDmLQXD/baxyw3lcnQkQHi/4LV4ORIFSICg5wP/892xl0JcmF86oN47HpW
         pj77WpxYWcZWVqJHMBDIV88uLUrbuPLWQ67CKHIStJOTvNmu2Rd0GAjTthklUec4rdlC
         M2tdO/zn40KffhKi+lcNzXw0KEs63MPPMRF9N8MXBerrS+skatrG9bhJ4HfnBCFv2436
         ORYqrbhVdCG3eZ2Wo+B3mmW8xBgd0ssj/uxZztdEJUjnIKj2NGGihzBlwvHt15+450fK
         yl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731985241; x=1732590041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSeIoWgS/KcvXHUN2aQDfLe2Z9qMRzkaT4SKto2xXEg=;
        b=PTOHMn9w3TyOZPjZr/CmBHTzhbd68yxPzVfdov+tfTMvIFD1ZYBFt/vbmo2NAm2fq9
         XvBH9qBai2XLDms9pE5SaRjEgLx+ceBmd24EcMpMZbtIV5nbz08HIkg9quaoeFlIpPjV
         AWgbXKZtFwePnJ1rzuusjTGqH44BR5Lckez9CcN3TRzzU4sY21k7MJyM7BBtMR3CbP8V
         tsUhiA2xkcwHC5kSNZCorv0WA3hc2W+CMmx4kS9aLDGrsmKt1aTWc2HOsN1d0fJ2neHv
         IFmQzGXkCoOMsP+ao/ioYgvRKM6waLOhBRG4vcow+opn796Z5TZG+SNNuUIzSzlyRtDY
         AIdA==
X-Forwarded-Encrypted: i=1; AJvYcCUp3DYmCdmIqa2H1K0+bVUl0J7V576X+w4zdObsD9C8P4+t5X3bjmcpbtwqrK8WiNXTnCUO8s4DcJ09@vger.kernel.org, AJvYcCXnn5ORxxmj1SFl+AjuyxmClhY59P8a8BzsdSNXSRP9q2tW3l1tEWBHQDg4D8OjS1kwFQqdO4lksG+Ysrg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv4Ok+Jt0BQm5f9/hSq1C/Xknnhd1FKQnevKYaU+IWo35tADOQ
	wT7QO+V8Zv1vd3cRpW3Gi3DYHwEWCQqk72C2+QD8kAFn7xknxsyu+1k/ARuV
X-Google-Smtp-Source: AGHT+IF/YcJy0tbkSq1Ic2gz8ClgbKdBkjBhlY6UU3josga15qu3kuK8gNZyU5OfMgdbQxAPkgzV7Q==
X-Received: by 2002:a17:90b:4d91:b0:2ea:696d:732f with SMTP id 98e67ed59e1d1-2ea696d7410mr7922260a91.29.1731985240767;
        Mon, 18 Nov 2024 19:00:40 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21210fe87f8sm32760785ad.29.2024.11.18.19.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 19:00:40 -0800 (PST)
From: Ming-Jen Chen <mjchen0829@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mjchen0829@gmail.com,
	sudeep.holla@arm.com,
	arnd@arndb.de,
	peng.fan@nxp.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH 2/2] input: keypad: add new keypad driver for MA35D1
Date: Tue, 19 Nov 2024 02:59:54 +0000
Message-Id: <20241119025954.4161-3-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241119025954.4161-1-mjchen0829@gmail.com>
References: <20241119025954.4161-1-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a new keypad driver for the MA35D1 platform.
The driver supports key scanning and interrupt handling.

Signed-off-by: Ming-Jen Chen <mjchen0829@gmail.com>
---
 drivers/input/keyboard/Kconfig         |  10 +
 drivers/input/keyboard/Makefile        |   1 +
 drivers/input/keyboard/ma35d1_keypad.c | 386 +++++++++++++++++++++++++
 3 files changed, 397 insertions(+)
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 721ab69e84ac..d7c0d0f4a88d 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -797,4 +797,14 @@ config KEYBOARD_CYPRESS_SF
 	  To compile this driver as a module, choose M here: the
 	  module will be called cypress-sf.
 
+config KEYBOARD_MA35D1
+	tristate "Nuvoton MA35D1 keypad driver"
+	depends on ARCH_MA35 || COMPILE_TEST
+	select INPUT_MATRIXKMAP
+	help
+	  Say Y here if you want to use Nuvoton MA35D1 keypad.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ma35d1-keypad.
+
 endif
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
index 1e0721c30709..9b858cdd1b6b 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -70,3 +70,4 @@ obj-$(CONFIG_KEYBOARD_TEGRA)		+= tegra-kbc.o
 obj-$(CONFIG_KEYBOARD_TM2_TOUCHKEY)	+= tm2-touchkey.o
 obj-$(CONFIG_KEYBOARD_TWL4030)		+= twl4030_keypad.o
 obj-$(CONFIG_KEYBOARD_XTKBD)		+= xtkbd.o
+obj-$(CONFIG_KEYBOARD_MA35D1)		+= ma35d1_keypad.o
diff --git a/drivers/input/keyboard/ma35d1_keypad.c b/drivers/input/keyboard/ma35d1_keypad.c
new file mode 100644
index 000000000000..8410f7dd2e56
--- /dev/null
+++ b/drivers/input/keyboard/ma35d1_keypad.c
@@ -0,0 +1,386 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  MA35D1 keypad driver
+ *  Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/interrupt.h>
+#include <linux/input.h>
+#include <linux/platform_device.h>
+#include <linux/input/matrix_keypad.h>
+#include <linux/clk.h>
+#include <linux/of.h>
+#include <linux/bitops.h>
+#include <linux/pm_wakeirq.h>
+
+/* Keypad Interface Registers */
+#define KPI_CONF		0x00
+#define KPI_3KCONF		0x04
+#define KPI_STATUS		0x08
+#define KPI_RSTC		0x0C
+#define KPI_KEST		0x10
+#define KPI_KPE0		0x18
+#define KPI_KPE1		0x1C
+#define KPI_KRE0		0x20
+#define KPI_KRE1		0x24
+#define KPI_PRESCALDIV		0x28
+
+/* KPI_CONF - Keypad Configuration Register */
+#define KROW			GENMASK(30, 28) /* Keypad Matrix ROW number */
+#define KCOL			GENMASK(26, 24) /* Keypad Matrix COL Number */
+#define DB_CLKSEL		GENMASK(19, 16) /* De-bounce sampling cycle selection */
+#define PRESCALE		GENMASK(15, 8)  /* Row Scan Cycle Pre-scale Value */
+#define WAKEUP			BIT(5) /* Lower Power Wakeup Enable */
+#define INTEN			BIT(3) /* Key Interrupt Enable Control */
+#define RKINTEN			BIT(2) /* Release Key Interrupt Enable */
+#define PKINTEN			BIT(1) /* Press Key Interrupt Enable Control */
+#define ENKP			BIT(0) /* Keypad Scan Enable */
+
+/* KPI_STATUS - Keypad Status Register */
+#define PKEY_INT		BIT(4) /* Press key interrupt */
+#define RKEY_INT		BIT(3) /* Release key interrupt */
+#define KEY_INT			BIT(2) /* Key Interrupt */
+#define RST_3KEY		BIT(1) /* 3-Keys Reset Flag */
+#define PDWAKE			BIT(0) /* Power Down Wakeup Flag */
+
+#define KEY_EVENT_BITS		64
+
+#define NUM_SETTINGS		12
+#define PRE_SCALE_MAX		256
+#define PRE_SCALE_DIV_MAX	256
+
+static const unsigned int debounce_values[NUM_SETTINGS] = {
+	0, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192
+};
+
+static const unsigned int debounce_register[NUM_SETTINGS] = {
+	0x0, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0x9, 0xA, 0xB, 0xC, 0xD
+};
+
+struct ma35d1_keypad {
+	struct clk *clk;
+	struct input_dev *input_dev;
+	void __iomem *mmio_base;
+	int irq;
+	u32 kpi_row;
+	u32 kpi_col;
+	u32 debounce_val;
+	u32 pre_scale;
+	u32 pre_scale_div;
+};
+
+static void ma35d1_keypad_scan_matrix(struct ma35d1_keypad *keypad, unsigned int status)
+{
+	struct input_dev *input_dev = keypad->input_dev;
+	u32 row_shift = get_count_order(keypad->kpi_col);
+	u32 *keymap = input_dev->keycode;
+	u32 code, key, index;
+	u32 key_event[4];
+	u64 pressed_keys = 0, released_keys = 0;
+
+	/* Read key event status */
+	key_event[0] = readl(keypad->mmio_base + KPI_KPE0);
+	key_event[1] = readl(keypad->mmio_base + KPI_KPE1);
+	key_event[2] = readl(keypad->mmio_base + KPI_KRE0);
+	key_event[3] = readl(keypad->mmio_base + KPI_KRE1);
+
+	/* Clear key event status */
+	writel(key_event[0], (keypad->mmio_base + KPI_KPE0));
+	writel(key_event[1], (keypad->mmio_base + KPI_KPE1));
+	writel(key_event[2], (keypad->mmio_base + KPI_KRE0));
+	writel(key_event[3], (keypad->mmio_base + KPI_KRE1));
+
+	pressed_keys  = key_event[0] | ((u64)key_event[1] << 32);
+	released_keys = key_event[2] | ((u64)key_event[3] << 32);
+
+	/* Process pressed keys */
+	for_each_set_bit(index, (const unsigned long *)&pressed_keys, KEY_EVENT_BITS) {
+		code = MATRIX_SCAN_CODE(index / 8, (index % 8), row_shift);
+		key = keymap[code];
+
+		input_event(input_dev, EV_MSC, MSC_SCAN, code);
+		input_report_key(input_dev, key, 1);
+	}
+
+	/* Process released keys */
+	for_each_set_bit(index, (const unsigned long *)&released_keys, KEY_EVENT_BITS) {
+		code = MATRIX_SCAN_CODE(index / 8, (index % 8), row_shift);
+		key = keymap[code];
+
+		input_event(input_dev, EV_MSC, MSC_SCAN, code);
+		input_report_key(input_dev, key, 0);
+	}
+
+	input_sync(input_dev);
+}
+
+static irqreturn_t ma35d1_keypad_interrupt(int irq, void *dev_id)
+{
+	struct ma35d1_keypad *keypad = dev_id;
+	unsigned int  kstatus;
+
+	kstatus = readl(keypad->mmio_base + KPI_STATUS);
+
+	if (kstatus & (PKEY_INT | RKEY_INT)) {
+		ma35d1_keypad_scan_matrix(keypad, kstatus);
+	} else {
+		if (kstatus & PDWAKE)
+			writel(PDWAKE, (keypad->mmio_base + KPI_STATUS));
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int ma35d1_keypad_open(struct input_dev *dev)
+{
+	struct ma35d1_keypad *keypad = input_get_drvdata(dev);
+	u32 val, config;
+
+	val = RKINTEN | PKINTEN | INTEN | ENKP;
+	val |= FIELD_PREP(KCOL, (keypad->kpi_col - 1)) | FIELD_PREP(KROW, (keypad->kpi_row - 1));
+
+	config = FIELD_PREP(PRESCALE, (keypad->pre_scale - 1)) |
+		 FIELD_PREP(DB_CLKSEL, keypad->debounce_val);
+
+	val |= config;
+
+	writel(val, keypad->mmio_base + KPI_CONF);
+	writel((keypad->pre_scale_div - 1), keypad->mmio_base + KPI_PRESCALDIV);
+
+	return 0;
+}
+
+static void ma35d1_keypad_close(struct input_dev *dev)
+{
+	struct ma35d1_keypad *keypad = input_get_drvdata(dev);
+	u32 val;
+
+	val = readl(keypad->mmio_base + KPI_KPE0) & ~ENKP;
+	writel(val, keypad->mmio_base + KPI_CONF);
+}
+
+static int ma35d1_parse_dt(struct ma35d1_keypad *keypad, u32 debounce_ms, u32 scan_interval)
+{
+	u32 clk_rate = clk_get_rate(keypad->clk);
+	u32 min_diff = debounce_values[NUM_SETTINGS];
+	u32 i, clk_cycles, diff, p, d;
+	u32 best_diff = 0xffff;
+
+	/* Calculate debounce cycles */
+	clk_cycles = clk_rate * debounce_ms / 1000;
+
+	keypad->debounce_val = debounce_register[NUM_SETTINGS];
+
+	for (i = 0; i < NUM_SETTINGS; i++) {
+		diff = abs((s32)(clk_cycles - debounce_values[i]));
+		if (diff < min_diff) {
+			min_diff = diff;
+			keypad->debounce_val = debounce_register[i];
+		}
+	}
+
+	/* Find scan time setting */
+	clk_cycles = clk_rate * scan_interval / 1000;
+	clk_cycles = clk_cycles / keypad->kpi_row;
+
+	if (clk_cycles == 0) {
+		keypad->pre_scale = 1;
+		keypad->pre_scale_div = 1;
+	} else if (clk_cycles >= PRE_SCALE_MAX * PRE_SCALE_DIV_MAX) {
+		keypad->pre_scale = PRE_SCALE_MAX;
+		keypad->pre_scale_div = PRE_SCALE_DIV_MAX;
+	} else {
+		for (p = 1; p <= PRE_SCALE_MAX; p++) {
+			d = (clk_cycles + (p / 2)) / p;
+
+			if (d > 0 && d <= PRE_SCALE_DIV_MAX) {
+				diff = abs((s32)(p * d) - clk_cycles);
+
+				if (diff < best_diff) {
+					best_diff = diff;
+					keypad->pre_scale = p;
+					keypad->pre_scale_div = d;
+
+					if (diff == 0)
+						break;
+				}
+			}
+		}
+	}
+
+	/*
+	 * Hardware Limitation:
+	 * Due to the hardware design, the keypad debounce time must not exceed
+	 * half of the row scan time.
+	 *
+	 * The row scan time is determined by the formula:
+	 *     Row Scan Time = pre_scale * pre_scale_div
+	 *
+	 * Therefore, the debounce time must satisfy the following condition:
+	 *     Debounce Time < (Row Scan Time / 2)
+	 *
+	 * For example:
+	 * If pre_scale = 64, pre_scale_div = 32,
+	 * then Row Scan Time = 64 * 32 = 2048 keypad clock.
+	 * Hence, the maximum allowable debounce time is 1024 keypad clock.
+	 */
+
+	if (keypad->debounce_val >= (keypad->pre_scale * keypad->pre_scale_div) / 2)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int ma35d1_keypad_probe(struct platform_device *pdev)
+{
+	struct ma35d1_keypad *keypad;
+	struct input_dev *input_dev;
+	struct resource *res;
+	u32 debounce, scan_interval;
+	int error = 0;
+
+	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
+	if (!keypad)
+		return -ENOMEM;
+
+	input_dev = devm_input_allocate_device(&pdev->dev);
+	if (!input_dev)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	keypad->mmio_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(keypad->mmio_base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(keypad->mmio_base),
+					"failed to remap I/O memor\n");
+
+	keypad->irq = platform_get_irq(pdev, 0);
+	if (keypad->irq < 0) {
+		dev_err(&pdev->dev, "failed to get IRQ\n");
+		return keypad->irq;
+	}
+
+	keypad->clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(keypad->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(keypad->clk), "failed to get core clk\n");
+
+	error = matrix_keypad_parse_properties(&pdev->dev, &keypad->kpi_row, &keypad->kpi_col);
+	if (error) {
+		dev_err(&pdev->dev, "failed to parse keypad params\n");
+		return error;
+	}
+
+	error = matrix_keypad_build_keymap(NULL, NULL, keypad->kpi_row, keypad->kpi_col,
+					   NULL, input_dev);
+	if (error) {
+		dev_err(&pdev->dev, "failed to build keymap\n");
+		return error;
+	}
+
+	keypad->input_dev = input_dev;
+	input_dev->name = pdev->name;
+	input_dev->id.bustype = BUS_HOST;
+	input_dev->open = ma35d1_keypad_open;
+	input_dev->close = ma35d1_keypad_close;
+	input_dev->dev.parent = &pdev->dev;
+
+	error = device_property_read_u32(&pdev->dev, "debounce-delay-ms", &debounce);
+	if (error) {
+		dev_err(&pdev->dev, "failed to acquire 'debounce-delay-ms'\n");
+		return error;
+	}
+
+	error = device_property_read_u32(&pdev->dev, "scan-interval-ms", &scan_interval);
+	if (error) {
+		dev_err(&pdev->dev, "failed to acquire 'scan-interval'\n");
+		return error;
+	}
+
+	error = ma35d1_parse_dt(keypad, debounce, scan_interval);
+	if (error) {
+		dev_err(&pdev->dev, "keypad dt params error\n");
+		return error;
+	}
+
+	__set_bit(EV_REP, input_dev->evbit);
+	input_set_drvdata(input_dev, keypad);
+	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
+
+	error = devm_request_irq(&pdev->dev, keypad->irq, ma35d1_keypad_interrupt,
+				 IRQF_NO_SUSPEND, pdev->name, keypad);
+	if (error) {
+		dev_err(&pdev->dev, "failed to request IRQ\n");
+		return error;
+	}
+
+	platform_set_drvdata(pdev, keypad);
+	device_init_wakeup(&pdev->dev, 1);
+
+	error = dev_pm_set_wake_irq(&pdev->dev, keypad->irq);
+	if (error) {
+		dev_err(&pdev->dev, "failed to enable irq wake\n");
+		return error;
+	}
+
+	error = input_register_device(input_dev);
+	if (error) {
+		dev_err(&pdev->dev, "failed to register input device\n");
+		return error;
+	}
+
+	return 0;
+}
+
+static void ma35d1_keypad_remove(struct platform_device *pdev)
+{
+	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
+
+	input_unregister_device(keypad->input_dev);
+}
+
+static int ma35d1_keypad_suspend(struct device *dev)
+{
+	struct ma35d1_keypad *keypad = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		writel(readl(keypad->mmio_base + KPI_CONF) | WAKEUP, keypad->mmio_base + KPI_CONF);
+
+	return 0;
+}
+
+static int ma35d1_keypad_resume(struct device *dev)
+{
+	struct ma35d1_keypad *keypad = dev_get_drvdata(dev);
+
+	if (device_may_wakeup(dev))
+		writel(readl(keypad->mmio_base + KPI_CONF) & ~(WAKEUP),
+		       keypad->mmio_base + KPI_CONF);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(ma35d1_pm_ops, ma35d1_keypad_suspend, ma35d1_keypad_resume);
+
+static const struct of_device_id ma35d1_kpi_of_match[] = {
+	{ .compatible = "nuvoton,ma35d1-kpi"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, ma35d1_kpi_of_match);
+
+static struct platform_driver ma35d1_keypad_driver = {
+	.probe		= ma35d1_keypad_probe,
+	.remove		= ma35d1_keypad_remove,
+	.driver		= {
+		.name	= "ma35d1-kpi",
+		.pm	= pm_sleep_ptr(&ma35d1_pm_ops),
+		.of_match_table = ma35d1_kpi_of_match,
+	},
+};
+module_platform_driver(ma35d1_keypad_driver);
+
+MODULE_AUTHOR("Ming-Jen Chen");
+MODULE_DESCRIPTION("MA35D1 Keypad Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1


