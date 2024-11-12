Return-Path: <linux-input+bounces-8029-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D329C4E43
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 06:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5613B28821E
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 05:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EAAE189F37;
	Tue, 12 Nov 2024 05:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVXH81Sc"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630E717333A;
	Tue, 12 Nov 2024 05:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731389526; cv=none; b=nQPxDkTGliPPowbAHRYbRAnbV4h7CtwPGm9j86D4HiPQzHah11uvhqa9I1VOajfyRFcBIgcyJX7zL/AiAFE3K27HR6+iOU4sGUqd/3YsDdIKJicUV4LEfLM01Q7e+PwoxmOdMsXUiBAhrkk/EAj+UJ1c/wyMh0BvmP152JurWKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731389526; c=relaxed/simple;
	bh=6bE3jdxyoMQLgptLifTB+v3B4roQ+hD3F0vEDBYqPsg=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kXieQpXzrA7NPqslXpEd2Upe52+1fXr3/puq//BJ4itAnIk9qQHIfdhiV0mAGG2frQ9FIpfuE1gCZBuFMME3dr/4Fbba12ZV9yXL3zZ+ZU6sDRdUM60Xyz0BsrUgd8QwENHts7YrMTXPvoLrN88wLTCT+5xsVGkdRQ35XRdw6zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVXH81Sc; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c7edf2872so49508825ad.1;
        Mon, 11 Nov 2024 21:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731389524; x=1731994324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b+4mxPJ+g18SR9b4gggRSBkZ7SdunBZ7o+EK85L2ooA=;
        b=MVXH81ScMy+chL8dRJrAIRMTjB7Owbh2Ge5V6J5ULaAmhipssxzVHoF6hz0pu8V2gu
         tpuvV/0FVU7SeutVC3CU8XgskA5CKMkpA/rn314xLil1GQaAQAAissklQBua1jOQbAy7
         VY2Ue05XeX0FZmtvO2wJfutsf7LFJQyawQA8AdAJZtoPSnQwZnJs74NUyqiKswp20Jpu
         4p54vjLz4rryWlKncgh/g15TSd4KMzSEte5xBySfmEZjJuN9F/PnRFkpDJqML3dMdXc1
         WenQINMnnI96YNybkyQ4JHhI+WXVwHrWOv2sdrrseQoD1VZo5tQ3QG2R+n7/CSWcNBob
         ZlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731389524; x=1731994324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+4mxPJ+g18SR9b4gggRSBkZ7SdunBZ7o+EK85L2ooA=;
        b=fd6pDDkJLMmOZOQrAjjIinGC5WUhBolC1lHtlb0deaXzypgRvm90UG1UqwdouP+XV4
         PChMlDRnwwnrVlmLQSGLYgq2Z18MlyM9C+KDp6+aljCp43ba91r6xci6+S23CHk/nxcy
         rQoZTE/Hb8TQPab8m16UJx2kEJf1TXz1Y7zNHq0YnXHb00+I0a2ImjbGB9CnUrvK40Ko
         HOtsHLdEnfGfSDioBcns2douXGDn5EnVV89UUaybSMkk3KsH9ebdkZM3hp3LYu2QvNuI
         jKTgbtlYCUS6Kc6duIpHI4V/bo7WdYyp+uq5bBx9S8RtPs8rDbeZ/WheXSJZLCg+bdvt
         8QLw==
X-Forwarded-Encrypted: i=1; AJvYcCVdGB5oP8FqLKMS2AC7szbRBs/nwAFbl38TzGWcA1x+yqr5sC0XrSx3HkGJYSaqLd9nilVa6C13qII/uO9z@vger.kernel.org, AJvYcCVjX1xS3CGgxslno8qsXJz0T9PyFTaf97UDk8ftuY6ELKaFCbkbZ4EZPE1KSvHY0DiEWx6jc6NXrGke@vger.kernel.org, AJvYcCWfwjOqIVlP7dOqDXSYcuiXcLLSNjsPMd6E31LL743tgQmM1V/AE9vM4ZyHMwEJ7IPrIxTe6BIyMYUOFoY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd67tCz1jQj3kKpRBp2wLhWtd9b2wsjYJ7ewoYpaz3P3AkUq5y
	qn/c4C1n6p+AK56lKo6jkU3LZ6nlB9QEVy2QhIsT2JDsHKNoRdxB
X-Google-Smtp-Source: AGHT+IE7ZB+JygivYN7DRDyTz5bRORwOqOffxgQGMsQc3P7jip8WElNPqo+qzrpjqX0jczvjGYhLbQ==
X-Received: by 2002:a17:902:d50d:b0:20c:62af:a0f0 with SMTP id d9443c01a7336-2118217c5afmr220351525ad.7.1731389523447;
        Mon, 11 Nov 2024 21:32:03 -0800 (PST)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177ddf19esm85815505ad.92.2024.11.11.21.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 21:32:03 -0800 (PST)
From: mjchen <mjchen0829@gmail.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sudeep.holla@arm.com,
	peng.fan@nxp.com,
	arnd@arndb.de,
	mjchen0829@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mjchen@nuvoton.com
Subject: [PATCH v2 2/2] input: keypad: add new keypad driver for MA35D1
Date: Tue, 12 Nov 2024 05:30:59 +0000
Message-Id: <20241112053059.3361-3-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241112053059.3361-1-mjchen0829@gmail.com>
References: <20241112053059.3361-1-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds a new keypad driver for the MA35D1 platform.
The driver supports key scanning and interrupt handling.

Signed-off-by: mjchen <mjchen0829@gmail.com>
---
 drivers/input/keyboard/Kconfig         |  10 +
 drivers/input/keyboard/Makefile        |   1 +
 drivers/input/keyboard/ma35d1_keypad.c | 308 +++++++++++++++++++++++++
 3 files changed, 319 insertions(+)
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
index 000000000000..be7ff4f49e8c
--- /dev/null
+++ b/drivers/input/keyboard/ma35d1_keypad.c
@@ -0,0 +1,308 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ *  MA35D1 keypad driver
+ *  Copyright (C) 2024 Nuvoton Technology Corp.
+ */
+
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
+#define KROW		GENMASK(30, 28) /* Keypad Matrix ROW number */
+#define KCOL		GENMASK(26, 24) /* Keypad Matrix COL Number */
+#define DB_CLKSEL	GENMASK(19, 16) /* De-bounce sampling cycle selection */
+#define PRESCALE	GENMASK(15, 8)  /* Row Scan Cycle Pre-scale Value */
+#define WAKEUP		BIT(5) /* Lower Power Wakeup Enable */
+#define INTEN		BIT(3) /* Key Interrupt Enable Control */
+#define RKINTEN	BIT(2) /* Release Key Interrupt Enable */
+#define PKINTEN	BIT(1) /* Press Key Interrupt Enable Control */
+#define ENKP		BIT(0) /* Keypad Scan Enable */
+
+/* KPI_STATUS - Keypad Status Register */
+#define PKEY_INT	BIT(4) /* Press key interrupt */
+#define RKEY_INT	BIT(3) /* Release key interrupt */
+#define KEY_INT	BIT(2) /* Key Interrupt */
+#define RST_3KEY	BIT(1) /* 3-Keys Reset Flag */
+#define PDWAKE		BIT(0) /* Power Down Wakeup Flag */
+
+#define KEY_EVENT_BITS 64
+
+struct ma35d1_keypad {
+	struct clk *clk;
+	struct input_dev *input_dev;
+	void __iomem *mmio_base;
+	int irq;
+	unsigned int kpi_row;
+	unsigned int kpi_col;
+	unsigned int debounce_val;
+	unsigned int pre_scale;
+	unsigned int pre_scale_divider;
+};
+
+static void ma35d1_keypad_scan_matrix(struct ma35d1_keypad *keypad, unsigned int status)
+{
+	struct input_dev *input_dev = keypad->input_dev;
+	unsigned int code;
+	unsigned int key;
+	unsigned long pressed_keys = 0, released_keys = 0;
+	unsigned int row_shift = get_count_order(keypad->kpi_col);
+	unsigned short *keymap = input_dev->keycode;
+	unsigned long key_event[4];
+	unsigned int index;
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
+	pressed_keys  = key_event[0] | key_event[1] << 32;
+	released_keys = key_event[2] | key_event[3] << 32;
+
+	/* Process pressed keys */
+	for_each_set_bit(index, &pressed_keys, KEY_EVENT_BITS) {
+		code = MATRIX_SCAN_CODE(index / 8, (index % 8), row_shift);
+		key = keymap[code];
+
+		input_event(input_dev, EV_MSC, MSC_SCAN, code);
+		input_report_key(input_dev, key, 1);
+	}
+
+	/* Process released keys */
+	for_each_set_bit(index, &released_keys, KEY_EVENT_BITS) {
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
+	unsigned int val, config;
+
+	val = RKINTEN | PKINTEN | INTEN | ENKP;
+	val |= FIELD_PREP(KCOL, (keypad->kpi_col - 1)) | FIELD_PREP(KROW, (keypad->kpi_row - 1));
+
+	if (keypad->debounce_val > 0)
+		config = FIELD_PREP(PRESCALE, (keypad->pre_scale - 1)) |
+			 FIELD_PREP(DB_CLKSEL, keypad->debounce_val);
+	else
+		config = FIELD_PREP(PRESCALE, (keypad->pre_scale - 1));
+
+	val |= config;
+
+	writel(val, keypad->mmio_base + KPI_CONF);
+	writel((keypad->pre_scale_divider - 1),	keypad->mmio_base + KPI_PRESCALDIV);
+
+	return 0;
+}
+
+static void ma35d1_keypad_close(struct input_dev *dev)
+{
+	struct ma35d1_keypad *keypad = input_get_drvdata(dev);
+	unsigned int val;
+
+	val = readl(keypad->mmio_base + KPI_KPE0) & ~ENKP;
+	writel(val, keypad->mmio_base + KPI_CONF);
+}
+
+static int ma35d1_keypad_probe(struct platform_device *pdev)
+{
+	struct ma35d1_keypad *keypad;
+	struct input_dev *input_dev;
+	struct resource *res;
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
+	error = device_property_read_u32(&pdev->dev, "debounce-period", &keypad->debounce_val);
+	if (error) {
+		dev_err(&pdev->dev, "failed to acquire 'debounce-period'\n");
+		return error;
+	}
+
+	keypad->debounce_val = __builtin_ctz(keypad->debounce_val);
+
+	error = device_property_read_u32(&pdev->dev, "key-scan-time", &keypad->pre_scale);
+	if (error) {
+		dev_err(&pdev->dev, "failed to acquire 'key-scan-time'\n");
+		return error;
+	}
+
+	device_property_read_u32(&pdev->dev, "key-scan-time-div", &keypad->pre_scale_divider);
+	if (error) {
+		dev_err(&pdev->dev, "failed to acquire 'key-scan-time-div'\n");
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
+
-- 
2.25.1


