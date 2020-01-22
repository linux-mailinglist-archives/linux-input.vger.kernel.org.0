Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03444144BB5
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2020 07:24:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbgAVGY6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 Jan 2020 01:24:58 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40084 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgAVGY5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 Jan 2020 01:24:57 -0500
Received: by mail-pl1-f196.google.com with SMTP id s21so2501992plr.7;
        Tue, 21 Jan 2020 22:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zEQqVslVn1OMa/Lg91ZHwHuwRAUMaJJsC/qhf0szJTg=;
        b=P69E66XP7cN7UeiSLEvaCqhQBimfCrsEE8gtQ4svrB+Z0Ez99G0Rz3lFqr1NwtVeRe
         EM3TUCLrnj7pvHk/GMRqWp6/s4JVo+TD3T+AKTACkYSUfV8rShRILsGqdbEASZX6B6+U
         pattyGM0AljHgNwHIMS/Sh/njnptYBweZHmW06MQghMAJglmzNs84qwsXeilqWbJnx09
         vzKbExBYS1GGnsU7BYCRHhhLx3T62/DdbPCh5bodrKmuqnHfamRl6+e+ozdfQHxHKtPw
         EyUUfOsM0rLzx11Ni3cC7G/RQ9N1F4jeJQpYDU/q9rW0/sDuUix5C8EWWgSUPD9XJDNP
         IEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zEQqVslVn1OMa/Lg91ZHwHuwRAUMaJJsC/qhf0szJTg=;
        b=n4GB8aQNpuiI3/Y9cbCLU4onkjaXxXkHJuwiG+XSy4PCQas1OfVPRpSq4QQWEXY++2
         GMC07EoDFDiyqdIyR+emkxrwMqVEHw4q0ijIem2Kt20GuI2H+zp9yACCPp6KC/sVGfYi
         MqSj2wfCTfx/AT8QVQn6ZmhmmaJgsm30GwOa8068Zd09NaYJ9JFxq037rJGSUs2HxCpu
         uJAW28hrWCAawVL1fmOnW6TJU8a0TKFDP7xTc04rzRsUCDBURxjMT19Jc12y1rQMvMBR
         DquIl8x5h5N3UY5lP2OYuTvLkkNf8l6W8Ix/NWWNWy2Hh50uLxlUf2V87erkTQUNLhhF
         yTag==
X-Gm-Message-State: APjAAAWpOwk7TI4qjyi3+d7jcOUOT7dBZBgIAG/tySTzIeBF1a6/YIGi
        jn24hjW+PYtp0WkZ7f6tstU=
X-Google-Smtp-Source: APXvYqxBxEOXQSKw4s1crZj4C/Zj53F/nGuUaj7bfVA+oXiYR/WYhbJn+r4pVFdXaGd8zmfoz/j2lw==
X-Received: by 2002:a17:90a:3643:: with SMTP id s61mr1294594pjb.44.1579674296993;
        Tue, 21 Jan 2020 22:24:56 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id z26sm42737423pgu.80.2020.01.21.22.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 22:24:56 -0800 (PST)
Date:   Tue, 21 Jan 2020 22:24:54 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "fengping.yu" <fengping.yu@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 2/2] drivers: input: keyboard: add mtk keypad driver
Message-ID: <20200122062454.GF110084@dtor-ws>
References: <20200114122738.103344-1-fengping.yu@mediatek.com>
 <20200114122738.103344-3-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200114122738.103344-3-fengping.yu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Fendping,

On Tue, Jan 14, 2020 at 08:27:41PM +0800, fengping.yu wrote:
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> 
> Add matrix keypad driver for MTK SoC.
> 
> ---
>  arch/arm64/configs/defconfig     |   1 +
>  drivers/input/keyboard/Kconfig   |   8 +
>  drivers/input/keyboard/Makefile  |   1 +
>  drivers/input/keyboard/mtk-kpd.c | 280 +++++++++++++++++++++++++++++++
>  4 files changed, 290 insertions(+)
>  create mode 100644 drivers/input/keyboard/mtk-kpd.c
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 8e05c39eab08..62bed77ec127 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -315,6 +315,7 @@ CONFIG_KEYBOARD_ADC=m
>  CONFIG_KEYBOARD_GPIO=y
>  CONFIG_KEYBOARD_SNVS_PWRKEY=m
>  CONFIG_KEYBOARD_CROS_EC=y
> +CONFIG_KEYBOARD_MTK=y
>  CONFIG_INPUT_TOUCHSCREEN=y
>  CONFIG_TOUCHSCREEN_ATMEL_MXT=m
>  CONFIG_INPUT_MISC=y
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 8911bc2ec42a..01747a97536b 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -775,4 +775,12 @@ config KEYBOARD_MTK_PMIC
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called pmic-keys.
>  
> +config KEYBOARD_MTK
> +	tristate "MediaTek Keypad Support"
> +	help
> +	  Say Y here if you want to use the keypad.
> +	  If unuse, say N.
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called mtk-kpd.
> +
>  endif
> diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
> index 9510325c0c5d..daa654bcce6e 100644
> --- a/drivers/input/keyboard/Makefile
> +++ b/drivers/input/keyboard/Makefile
> @@ -41,6 +41,7 @@ obj-$(CONFIG_KEYBOARD_MATRIX)		+= matrix_keypad.o
>  obj-$(CONFIG_KEYBOARD_MAX7359)		+= max7359_keypad.o
>  obj-$(CONFIG_KEYBOARD_MCS)		+= mcs_touchkey.o
>  obj-$(CONFIG_KEYBOARD_MPR121)		+= mpr121_touchkey.o
> +obj-$(CONFIG_KEYBOARD_MTK) 		+= mtk-kpd.o
>  obj-$(CONFIG_KEYBOARD_MTK_PMIC) 	+= mtk-pmic-keys.o
>  obj-$(CONFIG_KEYBOARD_NEWTON)		+= newtonkbd.o
>  obj-$(CONFIG_KEYBOARD_NOMADIK)		+= nomadik-ske-keypad.o
> diff --git a/drivers/input/keyboard/mtk-kpd.c b/drivers/input/keyboard/mtk-kpd.c
> new file mode 100644
> index 000000000000..e36461c9dd89
> --- /dev/null
> +++ b/drivers/input/keyboard/mtk-kpd.c
> @@ -0,0 +1,280 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 MediaTek Inc.
> + * Author Terry Chang <terry.chang@mediatek.com>
> + */
> +#include <linux/clk.h>
> +#include <linux/fs.h>
> +#include <linux/gpio.h>
> +#include <linux/init.h>
> +#include <linux/input/matrix_keypad.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define KPD_NAME	"mtk-kpd"
> +
> +#define KP_STA				0x0000
> +#define KP_MEM1				0x0004
> +#define KP_MEM2				0x0008
> +#define KP_MEM3				0x000c
> +#define KP_MEM4				0x0010
> +#define KP_MEM5				0x0014
> +#define KP_DEBOUNCE			0x0018
> +#define KP_SEL				0x0020
> +#define KP_EN				0x0024
> +
> +#define KP_COL0_SEL		BIT(10)
> +#define KP_COL1_SEL		BIT(11)
> +#define KP_COL2_SEL		BIT(12)
> +
> +#define KPD_DEBOUNCE_MASK	GENMASK_ULL(13, 0)
> +
> +#define KPD_NUM_MEMS	5
> +#define KPD_MEM5_BITS	8
> +#define KPD_NUM_KEYS	72	/* 4 * 16 + KPD_MEM5_BITS */
> +
> +struct mtk_keypad {
> +	struct input_dev *input_dev;
> +	struct clk *clk;
> +	void __iomem *base;
> +	unsigned int irqnr;
> +	bool wakeup;
> +	u32 key_debounce;
> +	u32 n_rows;
> +	u32 n_cols;
> +	u32 keymap_state[KPD_NUM_MEMS];

	DECLARE_BITMAP(keymap_state, KPD_NUM_KEYS);

> +};
> +
> +static void kpd_get_keymap_state(void __iomem *kp_base, u32 state[])
> +{
> +	memset_io(state, 0xff, KPD_NUM_MEMS);
> +	memcpy_fromio(state, kp_base, KPD_NUM_MEMS);
> +}
> +
> +static irqreturn_t kpd_irq_handler(int irq, void *dev_id)
> +{
> +	/* use _nosync to avoid deadlock */
> +	struct mtk_keypad *keypad = dev_id;
> +	unsigned short *keycode = keypad->input_dev->keycode;
> +	u32 new_state[KPD_NUM_MEMS], mask;
	DECLARE_BITMAP(new_state, KPD_NUM_KEYS);
	DECLARE_BITMAP(changed_state, KPD_NUM_KEYS);
> +	unsigned long change = 0;
> +	int bit_nr;
> +	int pressed;
> +	u32 row_shift = get_count_order(keypad->n_cols);
> +	unsigned short code;
> +	int i;
> +
> +	disable_irq_nosync(keypad->irqnr);

Not needed.


> +
> +	kpd_get_keymap_state(keypad->base, new_state);

	bitmap_xor(changed_state, keypad->keymap_state, new_state,
		   KPD_NUM_KEYS);

	for_each_set_bit(bit_nr, changed_state, KPD_NUM_KEYS) {
		pressed = test_bit(new_state, bit_nr);

		...
	}

> +
> +	for (i = 0; i < KPD_NUM_MEMS; i++) {
> +		change = new_state[i] ^ keypad->keymap_state[i];
> +		if (!change)
> +			continue;
> +
> +		for_each_set_bit(bit_nr, &change, 32) {
> +			mask = 1 << bit_nr;
> +			pressed = (new_state[i] & mask) == 0U;
> +			dev_dbg(&keypad->input_dev->dev,
> +				"%s", pressed ? "pressed" : "released");
> +
> +			code = keycode[MATRIX_SCAN_CODE(i, bit_nr, row_shift)];
> +
> +			input_report_key(keypad->input_dev, code, pressed);
> +			input_sync(keypad->input_dev);
> +
> +			dev_dbg(&keypad->input_dev->dev,
> +				"report Linux keycode = %d\n", code);
> +		}
> +	}
> +
> +	memcpy(keypad->keymap_state, new_state, sizeof(new_state));

	bitmap_copy(keypad->keymap_state, new_state, KPD_NUM_KEYS);

> +
> +	enable_irq(keypad->irqnr);

Not needed.

> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int kpd_get_dts_info(struct mtk_keypad *keypad)
> +{
> +	int ret;
> +	struct device *dev = keypad->input_dev->dev.parent;
> +	struct device_node *node = dev->of_node;
> +
> +	ret = matrix_keypad_parse_properties(dev, &keypad->n_rows,
> +					     &keypad->n_cols);
> +
> +	if (ret) {
> +		dev_err(dev, "failed to parse keypad params.\n");
> +		return ret;
> +	}
> +
> +	ret = of_property_read_u32(node, "mediatek,debounce-us",
> +				   &keypad->key_debounce);

Please use device_property_read_*() APIs instead of of_ ones.

Thanks.

-- 
Dmitry
