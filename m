Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 957712238BD
	for <lists+linux-input@lfdr.de>; Fri, 17 Jul 2020 11:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgGQJxB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jul 2020 05:53:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbgGQJxB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jul 2020 05:53:01 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A09C08C5CE
        for <linux-input@vger.kernel.org>; Fri, 17 Jul 2020 02:53:00 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z13so10338075wrw.5
        for <linux-input@vger.kernel.org>; Fri, 17 Jul 2020 02:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=Lo1c/rnGVSu77HdK5H98zGXvpAEi7FcMFBx3K97Q7EY=;
        b=ylq2qE5qPz9y78ruRjO64q4OPJWlwyd9ILLAtULePnIhwpxEtXfKyED3+xsk26LdM9
         hy89fYGUrgZ5xJo/kfk+wQ8JxUCvSE3w/rDQLMvARXULD2jkdzUeILZaNqcsfg7FNlyq
         mF/RjwEIL4eVQY2smBS84+ht9iG5Kf6kXkOqPfYdB8XkgddnfBJH/DYolNEDlEhgh+3j
         jZz47aFHAu4shkMVpzOBBkLshyr1OSm9nec3idaQKhDLLhm7OYZyb9X95NCoqBCMx2da
         /hbkFtNciEqH3XRovuo9wfo7jmL1Id0TdSKLhHhfL7JIF+VgL6DfzU5f6bsi7pZo9w0X
         Mzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=Lo1c/rnGVSu77HdK5H98zGXvpAEi7FcMFBx3K97Q7EY=;
        b=gO9uPXsX9r13RUD40gA9cIEI2JyWGH+GFMZW52utBQ6SW1FUodIuDif1AYLPWKAmSG
         XEpO6arO7D8vXhB3Th4UF81afefBuhLqxZs9cAs36GSZrBfhemCFS184Uh7hfkfKY34K
         barTYhSMucHbK8zFSJQg528EEXYpw8FiSkvtco9acVrklj9nst4cWEFmks6TKpfeY6CM
         vH1GcR4kyYJ0J0CahvsREf6r5vR6uJjOupCN0yTouMucbnRMDhbaxel9qxiIi7XkKZla
         UwLWN4VTO7kTOhqcRnd0voh/v8i5r6j3Oh7X50+ZNM0OuiAU7lR9viToIJNgmP+GNikF
         N2CQ==
X-Gm-Message-State: AOAM5301qvHOjXGtXvLi8BTMpe5gAYN8P+d1qfBsnRVEZe0cIyrv0Rpj
        rjUNlfNDGq3PJayCPS1pY6xFvkiegGn/sA==
X-Google-Smtp-Source: ABdhPJx0jf5GOTTG7Sw/jwDteXmU6kMQUvQNJzl93iIOozT3w+lSuusIOz42avUeY8CeqChdfTex1A==
X-Received: by 2002:adf:e7c9:: with SMTP id e9mr741274wrn.307.1594979579006;
        Fri, 17 Jul 2020 02:52:59 -0700 (PDT)
Received: from localhost ([2a01:cb19:8ae7:9d00:c90:cdad:cf4c:55db])
        by smtp.gmail.com with ESMTPSA id n16sm14705874wra.19.2020.07.17.02.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 02:52:58 -0700 (PDT)
References: <20200714092053.16067-1-fengping.yu@mediatek.com> <20200714092053.16067-3-fengping.yu@mediatek.com>
User-agent: mu4e 1.2.0; emacs 26.3
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     linux-mediatek@lists.infradead.org
Cc:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org,
        "fengping.yu" <fengping.yu@mediatek.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v14 2/3] drivers: input: keyboard: Add mtk keypad driver
In-reply-to: <20200714092053.16067-3-fengping.yu@mediatek.com>
Date:   Fri, 17 Jul 2020 11:52:57 +0200
Message-ID: <87imemsc1y.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Fengping,

Thank you for working on this driver, please see some remarks below

Fengping Yu <fengping.yu@mediatek.com> writes:

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
> index 000000000000..861abe52f1a3
> --- /dev/null
> +++ b/drivers/input/keyboard/mtk-kpd.c
> @@ -0,0 +1,209 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 MediaTek Inc.
> + * Author Terry Chang <terry.chang@mediatek.com>
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
> +		return keypad->clk;
Should we return PTR_ERR(keypad->clk) instead?
When building this, we have a compiler warning:

drivers/input/keyboard/mtk-kpd.c:154:10: warning: incompatible pointer to integer conversion returning 'struct clk *' from a function with result type 'int' [-Wint-conversion]
                return keypad->clk;

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
> +					NULL, kpd_irq_handler, 0,
Should we use IRQF_ONESHOT as irq flag here instead of 0?
When running this on my board I have:

  [    0.624890] genirq: Threaded irq requested with handler=NULL and !ONESHOT for irq 233
  [    0.625901] mtk-kpd 10010000.kp: Failed to request IRQ#233:-22
  [    0.626680] mtk-kpd: probe of 10010000.kp failed with error -22

Most other drivers use IRQF_ONESHOT when calling
devm_request_threaded_irq()

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

