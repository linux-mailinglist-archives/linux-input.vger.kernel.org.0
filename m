Return-Path: <linux-input+bounces-7606-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 557189A99D7
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 08:32:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D87E1C2061C
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2024 06:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F9EE148310;
	Tue, 22 Oct 2024 06:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1fn81YG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B665146D59;
	Tue, 22 Oct 2024 06:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729578735; cv=none; b=hhFe0hU/F5C6jyJk+SGGWLTQTRFbYL+rDFOwuCeicxLw3tLsmi0iC4p4TRIqykKkNGLXwCIIU2wkihcIc1b+VWOYjYFS5BTSn6cwIgA3coRDMImIEzbGejCLjGxvRrJ7Vi+PXjwUpAooqsHb0ClQDoTCjnFaBZJTqY8knHmaOxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729578735; c=relaxed/simple;
	bh=UoICyl3vNpuJrBBCp0GHsKsxKjSVSpGpHIZgFbROsy8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VLt8m1ku1M8nd8AFrf3LFyVXIco8gfft9geoHNfwnoNTnESBR+n8cDh8Ax7/htNxfmg4iPENU1/6GHXTJodHISIyy8FXFtT4kszVP9QiQaWVSsp1X7dovpHff3iz1mN9pSPsjQAFU+bh3tueSxr+8DdQuSG9tCN6GC+xHthIFL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1fn81YG; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2e30fb8cb07so3827123a91.3;
        Mon, 21 Oct 2024 23:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729578732; x=1730183532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeJfGyoavQtWH24FNumVoDvcueikkdaRPhG7USbSTX8=;
        b=Y1fn81YGkis4amM+wJWubBblpQ1lhojzbIsUxTn6/nL4QSgzrBBSw/Gp0kdEmXjtDQ
         x/quwme2BICAo9lS8XoxGWlSnZZjWWjmUM2RODnfvdeQi/nEopq5cLFPaq1RDK21WKye
         zrCVaK3FoZ2gSEYKjeFPl2DMj3yhi1KtH3qxYnMe3ZNeFBieJUctgYjwDiIroX7gwjLM
         sJ9VNweq7CqBOMApx2fgjOG3t3UtcxmRMp0RJurS077QvzsQ9cI7neBR05SA9idy4ebO
         AmMhzlMjGn85PAfiK/ESzyBdHyLHXuC67uPxO3kYUdwr9zfi1i4wYi4OjxweYH5M2UOk
         rXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729578732; x=1730183532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeJfGyoavQtWH24FNumVoDvcueikkdaRPhG7USbSTX8=;
        b=Y7Jb0LTcUxXOMzqiNEf7ePa0VBWRVAQp+eZbtSlYevgWCni/Slk+NjJWiHIG3csyem
         wx/dPBQuuGdU30h8blSBGN6Z8e2JOrcAdOE4VgCtGvc3DYXw3qX8EOa482Dr6M3m4Kxn
         KAJt78hi0v/Y4Cx1Tk0JDUUIxJsJpDS6QuP/Vxy30nUKhcK79nBqotCwRyfNOn7GAk/Q
         eiseXhopAXGmC8e+OwxVtNwY1vOMcZq0Rnb4fj0ZpV8GTVPy/nz/PMiJqS1JX+sioh4f
         Pfnfxltil+9qaSMfudfBZsiSCgS9+ldOYhGeYxUzrB4rVSulp/XYvluGoNHtkI7/bl/0
         bGWw==
X-Forwarded-Encrypted: i=1; AJvYcCU0pbn4+f7Ue2aPkS8hb6y30A57DppaktXevYLXw/vRLGZ1RTkHWhgBo//NctipSkkEoZT7/qVjLAZb@vger.kernel.org, AJvYcCWws7jJw9U/1teFRWJSCKnnK3VCToG9ra71kzT3O1qQK4etKhyt01b44hajMaWptMblj/YHXhD75LCl6C8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq+KhBLPC70m9ONFTnSspKWoNPj+twhwK4xjEYs5//OFoAxFl2
	FbkYocObA1IL4EacO062k0IAVnQgegQTTbF8EVyNkDIw1wb/NVAcqmgoXZGB
X-Google-Smtp-Source: AGHT+IHwsNkX5eJ8oqfIl++yx1qBuOyPryYrqnTYEX3EpS2uIlX7iAsFm1oTvFgRO8bWHNDIunqg6g==
X-Received: by 2002:a17:90b:3507:b0:2e0:ab57:51ec with SMTP id 98e67ed59e1d1-2e5da804ec4mr2862861a91.30.1729578732226;
        Mon, 21 Oct 2024 23:32:12 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad355bebsm5227508a91.7.2024.10.21.23.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 23:32:11 -0700 (PDT)
From: mjchen <mjchen0829@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mjchen0829@gmail.com,
	mjchen@nuvoton.com,
	peng.fan@nxp.com,
	sudeep.holla@arm.com,
	arnd@arndb.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH 2/2] input: keypad: add new keypad driver for MA35D1
Date: Tue, 22 Oct 2024 06:31:58 +0000
Message-Id: <20241022063158.5910-3-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241022063158.5910-1-mjchen0829@gmail.com>
References: <20241022063158.5910-1-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: mjchen <mjchen@nuvoton.com>

Adds a new keypad driver for the MA35D1 platform.
The driver supports key scanning and interrupt handling.

Signed-off-by: mjchen <mjchen@nuvoton.com>
---
 drivers/input/keyboard/Kconfig         |  10 +
 drivers/input/keyboard/Makefile        |   1 +
 drivers/input/keyboard/ma35d1_keypad.c | 312 +++++++++++++++++++++++++
 3 files changed, 323 insertions(+)
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 721ab69e84ac..ce9bd5cc13a1 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -797,4 +797,14 @@ config KEYBOARD_CYPRESS_SF
 	  To compile this driver as a module, choose M here: the
 	  module will be called cypress-sf.
 
+config KEYBOARD_MA35D1
+	tristate "Nuvoton MA35D1 keypad driver"
+	depends on ARCH_MA35
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
index 000000000000..20b5b1b91127
--- /dev/null
+++ b/drivers/input/keyboard/ma35d1_keypad.c
@@ -0,0 +1,312 @@
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
+#define KPI_PRESCALDIV	0x28
+
+/* KPI_CONF - Keypad Configuration Register */
+#define KROW		GENMASK(30, 28) /* Keypad Matrix ROW number */
+#define KCOL		GENMASK(26, 24) /* Keypad Matrix COL Number */
+#define DB_CLKSEL	GENMASK(19, 16) /* De-bounce sampling cycle selection */
+#define PRESCALE	GENMASK(15, 8)  /* Row Scan Cycle Pre-scale Value */
+#define WAKEUP		BIT(5) /* Lower Power Wakeup Enable */
+#define INTEN		BIT(3) /* Key Interrupt Enable Control */
+#define RKINTEN		BIT(2) /* Release Key Interrupt Enable */
+#define PKINTEN		BIT(1) /* Press Key Interrupt Enable Control */
+#define ENKP		BIT(0) /* Keypad Scan Enable */
+
+/* KPI_STATUS - Keypad Status Register */
+#define PKEY_INT	BIT(4) /* Press key interrupt */
+#define RKEY_INT	BIT(3) /* Release key interrupt */
+#define KEY_INT		BIT(2) /* Key Interrupt */
+#define RST_3KEY	BIT(1) /* 3-Keys Reset Flag */
+#define PDWAKE		BIT(0) /* Power Down Wakeup Flag */
+
+#define DEFAULT_DEBOUNCE		1
+#define DEFAULT_PRE_SCALE		1
+#define DEFAULT_PRE_SCALEDIV	32
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
+static void ma35d1_keypad_scan_matrix(struct ma35d1_keypad *keypad,	unsigned int status)
+{
+	struct input_dev *input_dev = keypad->input_dev;
+	unsigned int i, j;
+	unsigned int row_add = 0;
+	unsigned int code;
+	unsigned int key;
+	unsigned int press_key;
+	unsigned long KeyEvent[4];
+	unsigned int row_shift = get_count_order(keypad->kpi_col);
+	unsigned short *keymap = input_dev->keycode;
+
+	/* Read key event status */
+	KeyEvent[0] = readl(keypad->mmio_base + KPI_KPE0);
+	KeyEvent[1] = readl(keypad->mmio_base + KPI_KPE1);
+	KeyEvent[2] = readl(keypad->mmio_base + KPI_KRE0);
+	KeyEvent[3] = readl(keypad->mmio_base + KPI_KRE1);
+
+	/* Clear key event status */
+	writel(KeyEvent[0], (keypad->mmio_base + KPI_KPE0));
+	writel(KeyEvent[1], (keypad->mmio_base + KPI_KPE1));
+	writel(KeyEvent[2], (keypad->mmio_base + KPI_KRE0));
+	writel(KeyEvent[3], (keypad->mmio_base + KPI_KRE1));
+
+	for (j = 0; j < 4; j++) {
+		if (KeyEvent[j] != 0) {
+			row_add = (j % 2) ? 4 : 0;
+			press_key = (j < 2) ? 1 : 0;
+
+			for (i = 0; i < 32; i++) {
+				if (KeyEvent[j] & (1<<i)) {
+					code = MATRIX_SCAN_CODE(((i/8) + row_add), (i % 8), row_shift);
+					key = keymap[code];
+
+					input_event(input_dev, EV_MSC, MSC_SCAN, code);
+					input_report_key(input_dev, key, press_key);
+				}
+			}
+		}
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
+	if (kstatus & (PKEY_INT|RKEY_INT)) {
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
+				 FIELD_PREP(DB_CLKSEL, keypad->debounce_val);
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
+
+	clk_disable(keypad->clk);
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
+
+	input_dev = input_allocate_device();
+	if (!input_dev) {
+		dev_err(&pdev->dev, "failed to allocate input device\n");
+		return -ENOMEM;
+	}
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(&pdev->dev, "failed to get I/O memory\n");
+		error = -ENXIO;
+		goto failed_free_input;
+	}
+
+	keypad->mmio_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(keypad->mmio_base)) {
+		dev_err(&pdev->dev, "failed to remap I/O memory\n");
+		return PTR_ERR(keypad->mmio_base);
+	}
+
+	keypad->irq = platform_get_irq(pdev, 0);
+	if (keypad->irq < 0) {
+		dev_err(&pdev->dev, "failed to get IRQ\n");
+		return keypad->irq;
+	}
+
+	keypad->clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(keypad->clk)) {
+		dev_err(&pdev->dev, "failed to get core clk: %ld\n", PTR_ERR(keypad->clk));
+		return PTR_ERR(keypad->clk);
+	}
+
+	error = matrix_keypad_parse_properties(&pdev->dev,
+										   &(keypad->kpi_row),
+										   &(keypad->kpi_col));
+	if (error) {
+		dev_err(&pdev->dev, "failed to parse kp params\n");
+		return error;
+	}
+
+	error = matrix_keypad_build_keymap(NULL, NULL,
+									   keypad->kpi_row,
+									   keypad->kpi_col,
+									   NULL, input_dev);
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
+	if (of_property_read_u32(pdev->dev.of_node, "debounce-period", &(keypad->debounce_val)))
+		keypad->debounce_val = DEFAULT_DEBOUNCE;
+
+	if (of_property_read_u32(pdev->dev.of_node, "per-scale", &(keypad->pre_scale)))
+		keypad->pre_scale = DEFAULT_PRE_SCALE;
+
+	if (of_property_read_u32(pdev->dev.of_node, "per-scalediv", &(keypad->pre_scale_divider)))
+		keypad->pre_scale_divider = DEFAULT_PRE_SCALEDIV;
+
+	__set_bit(EV_REP, input_dev->evbit);
+	input_set_drvdata(input_dev, keypad);
+	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
+
+	error = input_register_device(input_dev);
+	if (error) {
+		dev_err(&pdev->dev, "failed to register input device\n");
+		goto failed_free_input;
+	}
+
+	error = devm_request_irq(&pdev->dev, keypad->irq,
+							 ma35d1_keypad_interrupt,
+							 IRQF_NO_SUSPEND, pdev->name, keypad);
+	if (error) {
+		dev_err(&pdev->dev, "failed to request IRQ\n");
+		goto failed_unregister_input;
+	}
+
+	platform_set_drvdata(pdev, keypad);
+	device_init_wakeup(&pdev->dev, 1);
+	clk_prepare_enable(keypad->clk);
+
+	return 0;
+
+failed_unregister_input:
+	input_unregister_device(input_dev);
+failed_free_input:
+	input_free_device(input_dev);
+	return error;
+}
+
+static void ma35d1_keypad_remove(struct platform_device *pdev)
+{
+	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
+
+	input_unregister_device(keypad->input_dev);
+	clk_disable_unprepare(keypad->clk);
+}
+
+static int ma35d1_keypad_suspend(struct platform_device *pdev,
+									pm_message_t state)
+{
+	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
+
+	if (device_may_wakeup(&pdev->dev)) {
+		writel(readl(keypad->mmio_base + KPI_CONF) | WAKEUP, keypad->mmio_base + KPI_CONF);
+		enable_irq_wake(keypad->irq);
+	}
+
+	return 0;
+}
+
+static int ma35d1_keypad_resume(struct platform_device *pdev)
+{
+	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
+
+	if (device_may_wakeup(&pdev->dev)) {
+		writel(readl(keypad->mmio_base + KPI_CONF) & ~(WAKEUP),
+						keypad->mmio_base + KPI_CONF);
+		disable_irq_wake(keypad->irq);
+	}
+
+	return 0;
+}
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
+	.suspend	= ma35d1_keypad_suspend,
+	.resume		= ma35d1_keypad_resume,
+	.driver		= {
+		.name	= "ma35d1-kpi",
+		.of_match_table = of_match_ptr(ma35d1_kpi_of_match),
+	},
+};
+module_platform_driver(ma35d1_keypad_driver);
+
+MODULE_AUTHOR("Ming-Jen Chen");
+MODULE_DESCRIPTION("MA35D1 Keypad Driver");
+MODULE_LICENSE("GPL");
+
-- 
2.17.1


