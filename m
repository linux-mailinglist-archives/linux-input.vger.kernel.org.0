Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B1FC49E071
	for <lists+linux-input@lfdr.de>; Thu, 27 Jan 2022 12:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240092AbiA0LPt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Jan 2022 06:15:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240093AbiA0LPs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Jan 2022 06:15:48 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA9AC061714
        for <linux-input@vger.kernel.org>; Thu, 27 Jan 2022 03:15:47 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id f17so4153919wrx.1
        for <linux-input@vger.kernel.org>; Thu, 27 Jan 2022 03:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VzOY5Y5ZARqurJbCJsGMa8NafX+eYNxiUqkqBIajbmE=;
        b=l3ZHQo1J5kr4npk8zAwtX7izKmqxleBFRCpR19Y/bz4iG9xephAo6pg9JVFT81OP+b
         rIcvTURY7QYKWctSXvaT5YO25L+NCMZBxlHIiiYxHY1yrdtd3kMv2cp5Je//viZq6CRb
         SsTJy3Wso+DFVP7TxcLV3JPf9lHwuEEykZPUF+p64/Zysqe/+f+b1cdd1JGdPwDRbS31
         O6T6KKZDQJt5CTMWYtnOaA1ac7jYF2Rrx438XK4BunBr/g6b3szqfn2em2PED9IYg8Vh
         f/Wyvt8O0ovIC7kTyCL4pb2igY96oVcBEDvhB0haIVzGF2fTPOQxnYsdxnBJjQnAnG6N
         NQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VzOY5Y5ZARqurJbCJsGMa8NafX+eYNxiUqkqBIajbmE=;
        b=cj4W1cM+SFa4SRr2E8WW+57A8MZc4ZEsnOF2fh7poP30yYPHboIEqGvv+1Lds6pWb4
         xN+3NeYimT+3x/vkVZg6WmgFS5pTgu/suI8QgEMEYZwWziGD5JMDUXxAEmj1bSDy08Vm
         mTVe883d/xVIsFt6d3camu2RP7cFvtX3UAMHfPdG3pXbs8/TM9jj0cn4Vb+hZd7papcd
         IHhKL+R9RwmQE3FDvjeloqKK7ob1ehOexImAJsov2iA/NlozDYTfgGll5x40+uQSPCMB
         iE1zfxdJWflIfalhIgqOHuoIgIRW273uVW37TvM59Fjo4D7Fb5lrrsmH6lAH2OELRkZd
         uMrw==
X-Gm-Message-State: AOAM533bZmoBv+53ipLLiiSu40Y6cnAjkC48+PlVEheemAPhyoLcXNnx
        NZ4knD0CRVxVPovw9F78FGzUfw==
X-Google-Smtp-Source: ABdhPJxcHdFgjTbWUKjv+WxRkx0ueHywRrKPEVavDmQGLTncBhVWFjypPFXoeapPc/uNMiStJk+OgA==
X-Received: by 2002:adf:ef48:: with SMTP id c8mr2641337wrp.368.1643282146347;
        Thu, 27 Jan 2022 03:15:46 -0800 (PST)
Received: from localhost.localdomain ([2a01:cb19:8b2c:5e00:7d3d:d638:46ec:78dd])
        by smtp.gmail.com with ESMTPSA id r7sm5956311wma.39.2022.01.27.03.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 03:15:46 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Fengping Yu <fengping.yu@mediatek.com>,
        Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc:     Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v20 2/3] Input: mt6779-keypad - Add MediaTek keypad driver
Date:   Thu, 27 Jan 2022 12:15:25 +0100
Message-Id: <20220127111526.3716689-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220127111526.3716689-1-mkorpershoek@baylibre.com>
References: <20220127111526.3716689-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: "fengping.yu" <fengping.yu@mediatek.com>

This patch adds matrix keypad support for Mediatek SoCs.

Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/Kconfig         |  12 ++
 drivers/input/keyboard/Makefile        |   1 +
 drivers/input/keyboard/mt6779-keypad.c | 218 +++++++++++++++++++++++++
 3 files changed, 231 insertions(+)
 create mode 100644 drivers/input/keyboard/mt6779-keypad.c

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 0c607da9ee10..03a9530f620e 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -779,6 +779,18 @@ config KEYBOARD_BCM
 	  To compile this driver as a module, choose M here: the
 	  module will be called bcm-keypad.
 
+config KEYBOARD_MT6779
+	tristate "MediaTek Keypad Support"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	select REGMAP_MMIO
+	select INPUT_MATRIXKMAP
+	help
+	  Say Y here if you want to use the keypad on MediaTek SoCs.
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called mt6779-keypad.
+
 config KEYBOARD_MTK_PMIC
 	tristate "MediaTek PMIC keys support"
 	depends on MFD_MT6397
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
index e3c8648f834e..721936e90290 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_KEYBOARD_MATRIX)		+= matrix_keypad.o
 obj-$(CONFIG_KEYBOARD_MAX7359)		+= max7359_keypad.o
 obj-$(CONFIG_KEYBOARD_MCS)		+= mcs_touchkey.o
 obj-$(CONFIG_KEYBOARD_MPR121)		+= mpr121_touchkey.o
+obj-$(CONFIG_KEYBOARD_MT6779)		+= mt6779-keypad.o
 obj-$(CONFIG_KEYBOARD_MTK_PMIC) 	+= mtk-pmic-keys.o
 obj-$(CONFIG_KEYBOARD_NEWTON)		+= newtonkbd.o
 obj-$(CONFIG_KEYBOARD_NOMADIK)		+= nomadik-ske-keypad.o
diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
new file mode 100644
index 000000000000..369366f18fd2
--- /dev/null
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 MediaTek Inc.
+ * Author Fengping Yu <fengping.yu@mediatek.com>
+ */
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/input/matrix_keypad.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define MTK_KPD_NAME		"mt6779-keypad"
+#define MTK_KPD_MEM		0x0004
+#define MTK_KPD_DEBOUNCE	0x0018
+#define MTK_KPD_DEBOUNCE_MASK	GENMASK(13, 0)
+#define MTK_KPD_DEBOUNCE_MAX_MS	256
+#define MTK_KPD_NUM_MEMS	5
+#define MTK_KPD_NUM_BITS	136	/* 4*32+8 MEM5 only use 8 BITS */
+
+struct mt6779_keypad {
+	struct regmap *regmap;
+	struct input_dev *input_dev;
+	struct clk *clk;
+	void __iomem *base;
+	u32 n_rows;
+	u32 n_cols;
+	DECLARE_BITMAP(keymap_state, MTK_KPD_NUM_BITS);
+};
+
+static const struct regmap_config mt6779_keypad_regmap_cfg = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = sizeof(u32),
+	.max_register = 36,
+};
+
+static irqreturn_t mt6779_keypad_irq_handler(int irq, void *dev_id)
+{
+	struct mt6779_keypad *keypad = dev_id;
+	unsigned short *keycode = keypad->input_dev->keycode;
+	DECLARE_BITMAP(new_state, MTK_KPD_NUM_BITS);
+	DECLARE_BITMAP(change, MTK_KPD_NUM_BITS);
+	int bit_nr;
+	int pressed;
+	unsigned short code;
+	int row, col;
+	int row_shift = get_count_order(keypad->n_cols);
+
+	regmap_bulk_read(keypad->regmap, MTK_KPD_MEM,
+			 new_state, MTK_KPD_NUM_MEMS);
+
+	bitmap_xor(change, new_state, keypad->keymap_state, MTK_KPD_NUM_BITS);
+
+	for_each_set_bit(bit_nr, change, MTK_KPD_NUM_BITS) {
+	/* For 32bits register, only bits [15:0] use to indicate key status */
+		if (bit_nr % 32 >= 16)
+			continue;
+
+		/* 1: not pressed, 0: pressed */
+		pressed = !test_bit(bit_nr, new_state);
+		dev_dbg(&keypad->input_dev->dev, "%s",
+			pressed ? "pressed" : "released");
+
+		row = bit_nr / 32;
+		col = bit_nr % 32;
+
+		code = keycode[MATRIX_SCAN_CODE(row, col, row_shift)];
+
+		input_report_key(keypad->input_dev, code, pressed);
+		input_sync(keypad->input_dev);
+
+		dev_dbg(&keypad->input_dev->dev,
+			"report Linux keycode = %d\n", code);
+	}
+
+	bitmap_copy(keypad->keymap_state, new_state, MTK_KPD_NUM_BITS);
+
+	return IRQ_HANDLED;
+}
+
+static void mt6779_keypad_clk_disable(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
+static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
+{
+	struct mt6779_keypad *keypad;
+	unsigned int irq;
+	u32 debounce;
+	bool wakeup;
+	int error;
+
+	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
+	if (!keypad)
+		return -ENOMEM;
+
+	keypad->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(keypad->base))
+		return PTR_ERR(keypad->base);
+
+	keypad->regmap = devm_regmap_init_mmio(&pdev->dev,
+					       keypad->base,
+					       &mt6779_keypad_regmap_cfg);
+	if (IS_ERR(keypad->regmap)) {
+		dev_err(&pdev->dev,
+			"regmap init failed:%pe\n", keypad->regmap);
+		return PTR_ERR(keypad->regmap);
+	}
+
+	bitmap_fill(keypad->keymap_state, MTK_KPD_NUM_BITS);
+
+	keypad->input_dev = devm_input_allocate_device(&pdev->dev);
+	if (!keypad->input_dev) {
+		dev_err(&pdev->dev, "Failed to allocate input dev\n");
+		return -ENOMEM;
+	}
+
+	keypad->input_dev->name = MTK_KPD_NAME;
+	keypad->input_dev->id.bustype = BUS_HOST;
+
+	error = matrix_keypad_parse_properties(&pdev->dev, &keypad->n_rows,
+					       &keypad->n_cols);
+	if (error) {
+		dev_err(&pdev->dev, "Failed to parse keypad params\n");
+		return error;
+	}
+
+	if (device_property_read_u32(&pdev->dev, "debounce-delay-ms",
+				     &debounce))
+		debounce = 16;
+
+	if (debounce > MTK_KPD_DEBOUNCE_MAX_MS) {
+		dev_err(&pdev->dev, "Debounce time exceeds the maximum allowed time %dms\n",
+			MTK_KPD_DEBOUNCE_MAX_MS);
+		return -EINVAL;
+	}
+
+	wakeup = device_property_read_bool(&pdev->dev, "wakeup-source");
+
+	dev_dbg(&pdev->dev, "n_row=%d n_col=%d debounce=%d\n",
+		keypad->n_rows, keypad->n_cols, debounce);
+
+	error = matrix_keypad_build_keymap(NULL, NULL,
+					   keypad->n_rows,
+					   keypad->n_cols,
+					   NULL,
+					   keypad->input_dev);
+	if (error) {
+		dev_err(&pdev->dev, "Failed to build keymap\n");
+		return error;
+	}
+
+	regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
+		     (debounce * 32) & MTK_KPD_DEBOUNCE_MASK);
+
+	keypad->clk = devm_clk_get(&pdev->dev, "kpd");
+	if (IS_ERR(keypad->clk))
+		return PTR_ERR(keypad->clk);
+
+	error = clk_prepare_enable(keypad->clk);
+	if (error) {
+		dev_err(&pdev->dev, "cannot prepare/enable keypad clock\n");
+		return error;
+	}
+
+	error = devm_add_action_or_reset(&pdev->dev, mt6779_keypad_clk_disable, keypad->clk);
+	if (error)
+		return error;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	error = devm_request_threaded_irq(&pdev->dev, irq,
+					  NULL, mt6779_keypad_irq_handler,
+					  IRQF_ONESHOT,
+					  MTK_KPD_NAME, keypad);
+	if (error) {
+		dev_err(&pdev->dev, "Failed to request IRQ#%d:%d\n",
+			irq, error);
+		return error;
+	}
+
+	error = input_register_device(keypad->input_dev);
+	if (error) {
+		dev_err(&pdev->dev, "Failed to register device\n");
+		return error;
+	}
+
+	error =  device_init_wakeup(&pdev->dev, wakeup);
+	if (error)
+		dev_warn(&pdev->dev, "device_init_wakeup fail\n");
+
+	return 0;
+}
+
+static const struct of_device_id mt6779_keypad_of_match[] = {
+	{ .compatible = "mediatek,mt6779-keypad" },
+	{ .compatible = "mediatek,mt6873-keypad" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver mt6779_keypad_pdrv = {
+	.probe = mt6779_keypad_pdrv_probe,
+	.driver = {
+		   .name = MTK_KPD_NAME,
+		   .of_match_table = mt6779_keypad_of_match,
+	},
+};
+module_platform_driver(mt6779_keypad_pdrv);
+
+MODULE_AUTHOR("Mediatek Corporation");
+MODULE_DESCRIPTION("MTK Keypad (KPD) Driver");
+MODULE_LICENSE("GPL");
-- 
2.32.0

