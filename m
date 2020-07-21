Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FDE2228007
	for <lists+linux-input@lfdr.de>; Tue, 21 Jul 2020 14:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729828AbgGUMfD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jul 2020 08:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728557AbgGUMfC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jul 2020 08:35:02 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF3D1C061794
        for <linux-input@vger.kernel.org>; Tue, 21 Jul 2020 05:35:01 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g10so2113242wmc.1
        for <linux-input@vger.kernel.org>; Tue, 21 Jul 2020 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=g3m34shbFPGqZxolOvx6+dkKCld/yl+pqO1/3Mo/n20=;
        b=j1yOOrbEb+E1GKmJzXGVz8gflLUGmlFfJGhk8Y3MHhSN9IypH7UNN/KPYajRjoCNoz
         xqGZH/2fw3BVAaGtV6FisGXObblLd9oBntiv5f5Yzu6WF6Gl4PvvbgiZMUe/k4A9nA/Q
         p91HSa3LfR9QU86wWGjIhQ4WGuWosAnqvSwmEFAGWiF/MN/KSoMEfKJGIMggaFOs5pjG
         RjKbYqXH7/k1SU18Ytu+GDf/HNgBJKO7vcCZKBYA+xsMMUSyW8lMRHgLRBrh7Ljo1AGE
         BGEOB48daX6A1Ab7jGgjQhPCAiURHKWZrdaafqOXskbf9nRLs2/hm7p8GYuiN7izTVtZ
         xoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=g3m34shbFPGqZxolOvx6+dkKCld/yl+pqO1/3Mo/n20=;
        b=oGRPeE1fQsmeFL16XKwwnmHA7iEQmeFigsmRFP7JGN/bm8gk1L0KjNh8UBbk485FUJ
         2hPBSHUhT/axB5gZMEHi+BQhKoWTE45PNSZhGMVoXL/P3e21AIgKavqFRXC4N9YSWvEf
         oR/Ft41oxVw7UrV/orEecTNqM/gCYvAGXU1QfIQHYjpBCVJHyfF+PtcIYza6kwe/4WDZ
         XonCdm6eUd7JYD7KKKIeKstc6QpkMXJht3oBoRe0SEHeo8ju8dth3Q2sh1+FKn7TITYx
         pqMtIOdnJLoV6wIiFzuCdQhc1lX7I5y5obgeOLc0qyKTikLIAiFuURSFqC4usmVyV2kl
         fA8A==
X-Gm-Message-State: AOAM531BWvLppwSLZKyt6UN+n5btD6i4/9ZZNcsJnm9A0+HDp988al28
        gTUJshfgQoRfwnWrxAqBlQjyMw==
X-Google-Smtp-Source: ABdhPJySOLHtcjW1bnUWonV4OLAGXlR0S9mPBgujudJgguoZRqvEcGr/2bc1UtfvmWnlsyABjYJwqw==
X-Received: by 2002:a05:600c:2219:: with SMTP id z25mr4189810wml.154.1595334900478;
        Tue, 21 Jul 2020 05:35:00 -0700 (PDT)
Received: from localhost ([2a01:cb19:8ae7:9d00:ccec:13dd:c362:cdc8])
        by smtp.gmail.com with ESMTPSA id 32sm21917471wrn.86.2020.07.21.05.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 05:34:59 -0700 (PDT)
References: <20200721022324.21898-1-fengping.yu@mediatek.com> <20200721022324.21898-3-fengping.yu@mediatek.com>
User-agent: mu4e 1.2.0; emacs 26.3
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Fengping yu <fengping.yu@mediatek.com>
Cc:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v15 2/3] drivers: input:keyboard: Add mtk keypad driver
In-reply-to: <20200721022324.21898-3-fengping.yu@mediatek.com>
Date:   Tue, 21 Jul 2020 14:34:58 +0200
Message-ID: <87ft9l3v2l.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Fengping,

Fengping yu <fengping.yu@mediatek.com> writes:

> From: "fengping.yu" <fengping.yu@mediatek.com>
>
> This adds matrix keypad support for Mediatek SoCs.
>
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/input/keyboard/Kconfig   |  11 ++
>  drivers/input/keyboard/Makefile  |   1 +
>  drivers/input/keyboard/mtk-kpd.c | 209 +++++++++++++++++++++++++++++++
>  3 files changed, 221 insertions(+)
>  create mode 100644 drivers/input/keyboard/mtk-kpd.c
>
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 793ecbbda32c..1ee845c292c6 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -782,6 +782,17 @@ config KEYBOARD_BCM
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called bcm-keypad.
>  
> +config KEYBOARD_MTK_KPD
> +	tristate "MediaTek Keypad Support"
> +	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	select REGMAP_MMIO
> +	select INPUT_MATRIXKMAP
> +	help
> +	  Say Y here if you want to use the keypad on MediaTek SoCs.
> +	  If unsure, say N.
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called mtk-kpd.
> +
>  config KEYBOARD_MTK_PMIC
>  	tristate "MediaTek PMIC keys support"
>  	depends on MFD_MT6397
> diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
> index 1d689fdd5c00..6c9d852c377e 100644
> --- a/drivers/input/keyboard/Makefile
> +++ b/drivers/input/keyboard/Makefile
> @@ -43,6 +43,7 @@ obj-$(CONFIG_KEYBOARD_MATRIX)		+= matrix_keypad.o
>  obj-$(CONFIG_KEYBOARD_MAX7359)		+= max7359_keypad.o
>  obj-$(CONFIG_KEYBOARD_MCS)		+= mcs_touchkey.o
>  obj-$(CONFIG_KEYBOARD_MPR121)		+= mpr121_touchkey.o
> +obj-$(CONFIG_KEYBOARD_MTK_KPD)		+= mtk-kpd.o
>  obj-$(CONFIG_KEYBOARD_MTK_PMIC) 	+= mtk-pmic-keys.o
>  obj-$(CONFIG_KEYBOARD_NEWTON)		+= newtonkbd.o
>  obj-$(CONFIG_KEYBOARD_NOMADIK)		+= nomadik-ske-keypad.o
> diff --git a/drivers/input/keyboard/mtk-kpd.c b/drivers/input/keyboard/mtk-kpd.c
> new file mode 100644
> index 000000000000..169ebaa37fa0
> --- /dev/null
> +++ b/drivers/input/keyboard/mtk-kpd.c
> @@ -0,0 +1,209 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 MediaTek Inc.
> + * Author Fengping Yu <fengping.yu@mediatek.com>
> + */
> +#include <linux/bitops.h>
> +#include <linux/clk.h>
> +#include <linux/input/matrix_keypad.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define MTK_KPD_NAME		"mtk-kpd"
> +#define MTK_KPD_MEM		0x0004
> +#define MTK_KPD_DEBOUNCE	0x0018
> +#define MTK_KPD_DEBOUNCE_MASK	GENMASK(13, 0)
> +#define MTK_KPD_DEBOUNCE_MAX_US	256000
> +#define MTK_KPD_NUM_MEMS	5
> +#define MTK_KPD_NUM_BITS	136	/* 4*32+8 MEM5 only use 8 BITS */
> +
> +struct mtk_keypad {
> +	struct regmap *regmap;
> +	struct input_dev *input_dev;
> +	struct clk *clk;
> +	void __iomem *base;
> +	u32 n_rows;
> +	u32 n_cols;
> +	DECLARE_BITMAP(keymap_state, MTK_KPD_NUM_BITS);
> +};
> +
> +static const struct regmap_config keypad_regmap_cfg = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = sizeof(u32),
> +	.max_register = 36,
> +};
> +
> +static irqreturn_t kpd_irq_handler(int irq, void *dev_id)
> +{
> +	struct mtk_keypad *keypad = dev_id;
> +	unsigned short *keycode = keypad->input_dev->keycode;
> +	DECLARE_BITMAP(new_state, MTK_KPD_NUM_BITS);
> +	DECLARE_BITMAP(change, MTK_KPD_NUM_BITS);
> +	int bit_nr;
> +	int pressed;
> +	unsigned short code;
> +
> +	regmap_raw_read(keypad->regmap, MTK_KPD_MEM,
> +			new_state, MTK_KPD_NUM_MEMS);
One more thing I missed:
It seems that regmap_raw_read() is mis-used here:
- We attempt to read MTK_KPD_NUM_MEMS bytes (5 bytes) whereas we want to
read 5 registers (so 20 bytes).
- even with regmap_raw_read(), val_len must be a multiple of the
  register width (keypad_regmap_cfg.val_bits)

I would suggest to:
1. Increase MTK_KPD_NUM_BITS to 160 (32*5)
2. Use
      regmap_bulk_read(keypad->regmap, MTK_KPD_MEM, new_state, MTK_KPD_NUM_MEMS);


> +
> +	bitmap_xor(change, new_state, keypad->keymap_state, MTK_KPD_NUM_BITS);
> +
> +	for_each_set_bit(bit_nr, change, MTK_KPD_NUM_BITS) {
> +		/* 1: not pressed, 0: pressed */
> +		pressed = !test_bit(bit_nr, new_state);
> +		dev_dbg(&keypad->input_dev->dev, "%s",
> +			pressed ? "pressed" : "released");
> +
> +		/* 32bit register only use low 16bit as keypad mem register */
> +		code = keycode[bit_nr - 16 * (BITS_TO_U32(bit_nr) - 1)];
> +
> +		input_report_key(keypad->input_dev, code, pressed);
> +		input_sync(keypad->input_dev);
> +
> +		dev_dbg(&keypad->input_dev->dev,
> +			"report Linux keycode = %d\n", code);
> +	}
> +
> +	bitmap_copy(keypad->keymap_state, new_state, MTK_KPD_NUM_BITS);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void kpd_clk_disable(void *data)
> +{
> +	clk_disable_unprepare(data);
> +}
> +
> +static int kpd_pdrv_probe(struct platform_device *pdev)
> +{
> +	struct mtk_keypad *keypad;
> +	unsigned int irq;
> +	u32 debounce;
> +	bool wakeup;
> +	int ret;
> +
> +	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
> +	if (!keypad)
> +		return -ENOMEM;
> +
> +	keypad->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(keypad->base))
> +		return PTR_ERR(keypad->base);
> +
> +	keypad->regmap = devm_regmap_init_mmio(&pdev->dev,
> +					       keypad->base,
> +					       &keypad_regmap_cfg);
> +	if (IS_ERR(keypad->regmap)) {
> +		dev_err(&pdev->dev,
> +			"regmap init failed:%ld\n", PTR_ERR(keypad->regmap));
> +		return PTR_ERR(keypad->regmap);
> +	}
> +
> +	bitmap_fill(keypad->keymap_state, MTK_KPD_NUM_BITS);
> +
> +	keypad->input_dev = devm_input_allocate_device(&pdev->dev);
> +	if (!keypad->input_dev) {
> +		dev_err(&pdev->dev, "Failed to allocate input dev\n");
> +		return -ENOMEM;
> +	}
> +
> +	keypad->input_dev->name = MTK_KPD_NAME;
> +	keypad->input_dev->id.bustype = BUS_HOST;
> +
> +	ret = matrix_keypad_parse_properties(&pdev->dev, &keypad->n_rows,
> +					     &keypad->n_cols);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to parse keypad params\n");
> +		return ret;
> +	}
> +
> +	if (device_property_read_u32(&pdev->dev, "mediatek,debounce-us",
> +				     &debounce))
> +		debounce = 16000;
> +
> +	if (debounce > MTK_KPD_DEBOUNCE_MAX_US) {
> +		dev_err(&pdev->dev, "Debounce time exceeds the maximum allowed time %dus\n",
> +			MTK_KPD_DEBOUNCE_MAX_US);
> +		return -EINVAL;
> +	}
> +
> +	wakeup = device_property_read_bool(&pdev->dev, "wakeup-source");
> +
> +	dev_dbg(&pdev->dev, "n_row=%d n_col=%d debounce=%d\n",
> +		keypad->n_rows, keypad->n_cols, debounce);
> +
> +	ret = matrix_keypad_build_keymap(NULL, NULL,
> +					 keypad->n_rows,
> +					 keypad->n_cols,
> +					 NULL,
> +					 keypad->input_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to build keymap\n");
> +		return ret;
> +	}
> +
> +	regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
> +		     debounce * 32 / 1000 & MTK_KPD_DEBOUNCE_MASK);
> +
> +	keypad->clk = devm_clk_get(&pdev->dev, "kpd");
> +	if (IS_ERR(keypad->clk))
> +		return PTR_ERR(keypad->clk);
> +
> +	ret = clk_prepare_enable(keypad->clk);
> +	if (ret) {
> +		dev_err(&pdev->dev, "cannot prepare/enable keypad clock\n");
> +		return ret;
> +	}
> +
> +	ret = devm_add_action_or_reset(&pdev->dev, kpd_clk_disable, keypad->clk);
> +	if (ret)
> +		return ret;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, irq,
> +					NULL, kpd_irq_handler, IRQF_ONESHOT,
> +					MTK_KPD_NAME, keypad);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request IRQ#%d:%d\n",
> +			irq, ret);
> +		return ret;
> +	}
> +
> +	ret = input_register_device(keypad->input_dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register device\n");
> +		return ret;
> +	}
> +
> +	ret =  device_init_wakeup(&pdev->dev, wakeup);
> +	if (ret)
> +		dev_warn(&pdev->dev, "device_init_wakeup fail\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id kpd_of_match[] = {
> +	{ .compatible = "mediatek,mt6779-keypad" },
> +	{ .compatible = "mediatek,mt6873-keypad" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver kpd_pdrv = {
> +	.probe = kpd_pdrv_probe,
> +	.driver = {
> +		   .name = MTK_KPD_NAME,
> +		   .of_match_table = kpd_of_match,
> +	},
> +};
> +module_platform_driver(kpd_pdrv);
> +
> +MODULE_AUTHOR("Mediatek Corporation");
> +MODULE_DESCRIPTION("MTK Keypad (KPD) Driver");
> +MODULE_LICENSE("GPL");

