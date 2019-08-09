Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 199AF883FE
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2019 22:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfHIU3B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 16:29:01 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:37939 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728252AbfHIU26 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 16:28:58 -0400
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MekvV-1iTrd20yAf-00ajkH; Fri, 09 Aug 2019 22:28:53 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     soc@kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH 10/16] Input: remove w90x900 keyboard driver
Date:   Fri,  9 Aug 2019 22:27:38 +0200
Message-Id: <20190809202749.742267-11-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190809202749.742267-1-arnd@arndb.de>
References: <20190809202749.742267-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:B9uf6nqpqCvt0g4bgHe/VJ7Oo6T7W9PFQuUHXJDWTVtHG4RP0qf
 Vfoz0D9TXzkrIeFexgI+WIlXO2Ph0b8WOgm4nMKp2JG7NdYO83kO+uimIwU7tXgnv4XPEZe
 agiL6hHosEsJ4040lDCLURCq05wZikhAQ751INNMF62qNOasLqtJVnpqEDhIRZ4m5AW5rgc
 hx79LJpnFlT30eZXC4+aA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZFggz2mqPK0=:agiv6d5BGkL6g/2pK3NKpj
 gh83uUZUs39coUEYJBkz9q69Ly4mdR/7DOfQigWMx/hk5zZNZjQbIaeofZpa8cNY4Q7GleN4R
 6bFZnci+Qk0rsKNM9RvzvQLnnvMD3mxsfoHxqjeWaiT0fyG9CEsdCFxRWlp9LA0AlPWe9mUwa
 g5y5Cr4OwWVrcONj7iI+iT5BmPczYfIwEPlvjtyhz8f1ECEsIPBRbvDhwAqMIPOkzQZhSvffg
 WXop0t3NQ6MEF3SAe4dQOvd+f5UF4228tgLw8+amBAqeUKLw8dUQFkuI539pX19CNEoPDvPwu
 f7A/fyH38Yi5onmB5OQMSz1ZX1RZVUW/HUCriWyBFI6ARDSMkaWuAUBK2F2iDE12mOvJydu+I
 ZUGaUbJPIxKH/bamkY7Tca9Slnsxj3S0rN/5ICs/QRaBZps+uJ0O67Cr1/ivfMBJax+xmqepG
 JKHhC5IDfSMnYa9IzUkQ3SqlTWbXQV+HqswXCsqFiJanXtbyJla0E4rmkYkl9nuMHuYBrKcc+
 9IVfc3mJuwGGMuVyQ6Je2iUwiNjbdMzGnXBMdjVoA3duBGYRL0BOz3YbTH7C0UqVenA7XAZNh
 9sjNmEIAvaerksVkfRai01Owwx1JnGn64/KbB2XdXTSaJ3qwv3gugUcuh+4GKekuchao88PhB
 Fs9R/Y2L4+rSgsOWoVEQYatGUIoeDZ8nNe6KgfJ7X21yxrjdOC4DU8JHWzuSPrKR3AVdiWTMM
 uPJFO/jHqC3tLzU5zUfD4obiem3WBPcZH4+VXQ==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ARM w90x900 platform is getting removed, so this driver is obsolete.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/keyboard/Kconfig               |  11 -
 drivers/input/keyboard/Makefile              |   1 -
 drivers/input/keyboard/w90p910_keypad.c      | 264 -------------------
 include/linux/platform_data/keypad-w90p910.h |  16 --
 4 files changed, 292 deletions(-)
 delete mode 100644 drivers/input/keyboard/w90p910_keypad.c
 delete mode 100644 include/linux/platform_data/keypad-w90p910.h

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 8e9c3ea9d5e7..c1da129a4eb5 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -731,17 +731,6 @@ config KEYBOARD_XTKBD
 	  To compile this driver as a module, choose M here: the
 	  module will be called xtkbd.
 
-config KEYBOARD_W90P910
-	tristate "W90P910 Matrix Keypad support"
-	depends on ARCH_W90X900
-	select INPUT_MATRIXKMAP
-	help
-	  Say Y here to enable the matrix keypad on evaluation board
-	  based on W90P910.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called w90p910_keypad.
-
 config KEYBOARD_CROS_EC
 	tristate "ChromeOS EC keyboard"
 	select INPUT_MATRIXKMAP
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
index 06a0af6efeae..9510325c0c5d 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -68,4 +68,3 @@ obj-$(CONFIG_KEYBOARD_TEGRA)		+= tegra-kbc.o
 obj-$(CONFIG_KEYBOARD_TM2_TOUCHKEY)	+= tm2-touchkey.o
 obj-$(CONFIG_KEYBOARD_TWL4030)		+= twl4030_keypad.o
 obj-$(CONFIG_KEYBOARD_XTKBD)		+= xtkbd.o
-obj-$(CONFIG_KEYBOARD_W90P910)		+= w90p910_keypad.o
diff --git a/drivers/input/keyboard/w90p910_keypad.c b/drivers/input/keyboard/w90p910_keypad.c
deleted file mode 100644
index c88d05d6108a..000000000000
--- a/drivers/input/keyboard/w90p910_keypad.c
+++ /dev/null
@@ -1,264 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2008-2009 Nuvoton technology corporation.
- *
- * Wan ZongShun <mcuos.com@gmail.com>
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/interrupt.h>
-#include <linux/input.h>
-#include <linux/device.h>
-#include <linux/platform_device.h>
-#include <linux/clk.h>
-#include <linux/err.h>
-#include <linux/io.h>
-#include <linux/slab.h>
-
-#include <linux/platform_data/keypad-w90p910.h>
-
-/* Keypad Interface Control Registers */
-#define KPI_CONF		0x00
-#define KPI_3KCONF		0x04
-#define KPI_LPCONF		0x08
-#define KPI_STATUS		0x0C
-
-#define IS1KEY			(0x01 << 16)
-#define INTTR			(0x01 << 21)
-#define KEY0R			(0x0f << 3)
-#define KEY0C			0x07
-#define DEBOUNCE_BIT		0x08
-#define KSIZE0			(0x01 << 16)
-#define KSIZE1			(0x01 << 17)
-#define KPSEL			(0x01 << 19)
-#define ENKP			(0x01 << 18)
-
-#define KGET_RAW(n)		(((n) & KEY0R) >> 3)
-#define KGET_COLUMN(n)		((n) & KEY0C)
-
-#define W90P910_NUM_ROWS	8
-#define W90P910_NUM_COLS	8
-#define W90P910_ROW_SHIFT	3
-
-struct w90p910_keypad {
-	const struct w90p910_keypad_platform_data *pdata;
-	struct clk *clk;
-	struct input_dev *input_dev;
-	void __iomem *mmio_base;
-	int irq;
-	unsigned short keymap[W90P910_NUM_ROWS * W90P910_NUM_COLS];
-};
-
-static void w90p910_keypad_scan_matrix(struct w90p910_keypad *keypad,
-							unsigned int status)
-{
-	struct input_dev *input_dev = keypad->input_dev;
-	unsigned int row = KGET_RAW(status);
-	unsigned int col = KGET_COLUMN(status);
-	unsigned int code = MATRIX_SCAN_CODE(row, col, W90P910_ROW_SHIFT);
-	unsigned int key = keypad->keymap[code];
-
-	input_event(input_dev, EV_MSC, MSC_SCAN, code);
-	input_report_key(input_dev, key, 1);
-	input_sync(input_dev);
-
-	input_event(input_dev, EV_MSC, MSC_SCAN, code);
-	input_report_key(input_dev, key, 0);
-	input_sync(input_dev);
-}
-
-static irqreturn_t w90p910_keypad_irq_handler(int irq, void *dev_id)
-{
-	struct w90p910_keypad *keypad = dev_id;
-	unsigned int  kstatus, val;
-
-	kstatus = __raw_readl(keypad->mmio_base + KPI_STATUS);
-
-	val = INTTR | IS1KEY;
-
-	if (kstatus & val)
-		w90p910_keypad_scan_matrix(keypad, kstatus);
-
-	return IRQ_HANDLED;
-}
-
-static int w90p910_keypad_open(struct input_dev *dev)
-{
-	struct w90p910_keypad *keypad = input_get_drvdata(dev);
-	const struct w90p910_keypad_platform_data *pdata = keypad->pdata;
-	unsigned int val, config;
-
-	/* Enable unit clock */
-	clk_enable(keypad->clk);
-
-	val = __raw_readl(keypad->mmio_base + KPI_CONF);
-	val |= (KPSEL | ENKP);
-	val &= ~(KSIZE0 | KSIZE1);
-
-	config = pdata->prescale | (pdata->debounce << DEBOUNCE_BIT);
-
-	val |= config;
-
-	__raw_writel(val, keypad->mmio_base + KPI_CONF);
-
-	return 0;
-}
-
-static void w90p910_keypad_close(struct input_dev *dev)
-{
-	struct w90p910_keypad *keypad = input_get_drvdata(dev);
-
-	/* Disable clock unit */
-	clk_disable(keypad->clk);
-}
-
-static int w90p910_keypad_probe(struct platform_device *pdev)
-{
-	const struct w90p910_keypad_platform_data *pdata =
-						dev_get_platdata(&pdev->dev);
-	const struct matrix_keymap_data *keymap_data;
-	struct w90p910_keypad *keypad;
-	struct input_dev *input_dev;
-	struct resource *res;
-	int irq;
-	int error;
-
-	if (!pdata) {
-		dev_err(&pdev->dev, "no platform data defined\n");
-		return -EINVAL;
-	}
-
-	keymap_data = pdata->keymap_data;
-
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		dev_err(&pdev->dev, "failed to get keypad irq\n");
-		return -ENXIO;
-	}
-
-	keypad = kzalloc(sizeof(struct w90p910_keypad), GFP_KERNEL);
-	input_dev = input_allocate_device();
-	if (!keypad || !input_dev) {
-		dev_err(&pdev->dev, "failed to allocate driver data\n");
-		error = -ENOMEM;
-		goto failed_free;
-	}
-
-	keypad->pdata = pdata;
-	keypad->input_dev = input_dev;
-	keypad->irq = irq;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (res == NULL) {
-		dev_err(&pdev->dev, "failed to get I/O memory\n");
-		error = -ENXIO;
-		goto failed_free;
-	}
-
-	res = request_mem_region(res->start, resource_size(res), pdev->name);
-	if (res == NULL) {
-		dev_err(&pdev->dev, "failed to request I/O memory\n");
-		error = -EBUSY;
-		goto failed_free;
-	}
-
-	keypad->mmio_base = ioremap(res->start, resource_size(res));
-	if (keypad->mmio_base == NULL) {
-		dev_err(&pdev->dev, "failed to remap I/O memory\n");
-		error = -ENXIO;
-		goto failed_free_res;
-	}
-
-	keypad->clk = clk_get(&pdev->dev, NULL);
-	if (IS_ERR(keypad->clk)) {
-		dev_err(&pdev->dev, "failed to get keypad clock\n");
-		error = PTR_ERR(keypad->clk);
-		goto failed_free_io;
-	}
-
-	/* set multi-function pin for w90p910 kpi. */
-	mfp_set_groupi(&pdev->dev);
-
-	input_dev->name = pdev->name;
-	input_dev->id.bustype = BUS_HOST;
-	input_dev->open = w90p910_keypad_open;
-	input_dev->close = w90p910_keypad_close;
-	input_dev->dev.parent = &pdev->dev;
-
-	error = matrix_keypad_build_keymap(keymap_data, NULL,
-					   W90P910_NUM_ROWS, W90P910_NUM_COLS,
-					   keypad->keymap, input_dev);
-	if (error) {
-		dev_err(&pdev->dev, "failed to build keymap\n");
-		goto failed_put_clk;
-	}
-
-	error = request_irq(keypad->irq, w90p910_keypad_irq_handler,
-			    0, pdev->name, keypad);
-	if (error) {
-		dev_err(&pdev->dev, "failed to request IRQ\n");
-		goto failed_put_clk;
-	}
-
-	__set_bit(EV_REP, input_dev->evbit);
-	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
-	input_set_drvdata(input_dev, keypad);
-
-	/* Register the input device */
-	error = input_register_device(input_dev);
-	if (error) {
-		dev_err(&pdev->dev, "failed to register input device\n");
-		goto failed_free_irq;
-	}
-
-	platform_set_drvdata(pdev, keypad);
-	return 0;
-
-failed_free_irq:
-	free_irq(irq, keypad);
-failed_put_clk:
-	clk_put(keypad->clk);
-failed_free_io:
-	iounmap(keypad->mmio_base);
-failed_free_res:
-	release_mem_region(res->start, resource_size(res));
-failed_free:
-	input_free_device(input_dev);
-	kfree(keypad);
-	return error;
-}
-
-static int w90p910_keypad_remove(struct platform_device *pdev)
-{
-	struct w90p910_keypad *keypad = platform_get_drvdata(pdev);
-	struct resource *res;
-
-	free_irq(keypad->irq, keypad);
-
-	clk_put(keypad->clk);
-
-	input_unregister_device(keypad->input_dev);
-
-	iounmap(keypad->mmio_base);
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	release_mem_region(res->start, resource_size(res));
-
-	kfree(keypad);
-
-	return 0;
-}
-
-static struct platform_driver w90p910_keypad_driver = {
-	.probe		= w90p910_keypad_probe,
-	.remove		= w90p910_keypad_remove,
-	.driver		= {
-		.name	= "nuc900-kpi",
-	},
-};
-module_platform_driver(w90p910_keypad_driver);
-
-MODULE_AUTHOR("Wan ZongShun <mcuos.com@gmail.com>");
-MODULE_DESCRIPTION("w90p910 keypad driver");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:nuc900-keypad");
diff --git a/include/linux/platform_data/keypad-w90p910.h b/include/linux/platform_data/keypad-w90p910.h
deleted file mode 100644
index 206ca4ecd93f..000000000000
--- a/include/linux/platform_data/keypad-w90p910.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_ARCH_W90P910_KEYPAD_H
-#define __ASM_ARCH_W90P910_KEYPAD_H
-
-#include <linux/input/matrix_keypad.h>
-
-extern void mfp_set_groupi(struct device *dev);
-
-struct w90p910_keypad_platform_data {
-	const struct matrix_keymap_data *keymap_data;
-
-	unsigned int	prescale;
-	unsigned int	debounce;
-};
-
-#endif /* __ASM_ARCH_W90P910_KEYPAD_H */
-- 
2.20.0

