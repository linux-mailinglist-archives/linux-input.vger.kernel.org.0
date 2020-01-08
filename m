Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0650F134056
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2020 12:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgAHLWk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Jan 2020 06:22:40 -0500
Received: from mga05.intel.com ([192.55.52.43]:19723 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726107AbgAHLWj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 Jan 2020 06:22:39 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 08 Jan 2020 03:22:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,409,1571727600"; 
   d="scan'208";a="246316350"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga004.fm.intel.com with ESMTP; 08 Jan 2020 03:22:33 -0800
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ip9Q1-0001q6-Be; Wed, 08 Jan 2020 13:22:33 +0200
Date:   Wed, 8 Jan 2020 13:22:33 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     fengping yu <fengping.yu@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Maxime Ripard <mripard@kernel.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Stefan Agner <stefan@agner.cn>, Jacky Bai <ping.bai@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH V2 2/2] drivers: input: keyboard
Message-ID: <20200108112233.GM32742@smile.fi.intel.com>
References: <20200108062923.14684-1-fengping.yu@mediatek.com>
 <20200108062923.14684-3-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108062923.14684-3-fengping.yu@mediatek.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 08, 2020 at 02:29:23PM +0800, fengping yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> add mtk keypad driver

A bit more details, perhaps?
Also, what about proper English grammar and punctuation?

> Change-Id: I20bb26ee4112f51f60476b7ff7d6e42b43f729dc

Are you sure it's ready for upstream?

...

>  arch/arm64/configs/defconfig                  |   1 +

Why?

...

> --- a/Documentation/devicetree/bindings/input/mtk-kpd.txt
> +++ b/Documentation/devicetree/bindings/input/mtk-kpd.txt
> @@ -38,8 +38,15 @@ Example:
>  	};
>  
>  	&keypad {
> -		mediatek,key-debounce-ms = <1024>;
> +		mediatek,key-debounce-ms = <32>;
>  		/*HW Keycode [0~71] -> Linux Keycode*/
> -		mediatek,khw-map-num = <72>;
> -		mediatek,hw-init-map = <114 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 >;
> +		mediatek,hw-map-num = <72>;
> +		mediatek,hw-init-map = <114 0 0 0 0 0 0 0 0
> +															0 0 0 0 0 0 0 0 0
> +															0 0 0 0 0 0 0 0 0
> +															0 0 0 0 0 0 0 0 0
> +															0 0 0 0 0 0 0 0 0
> +															0 0 0 0 0 0 0 0 0
> +															0 0 0 0 0 0 0 0 0
> +															0 0 0 0 0 0 0 0 0 >;
>  	};

Why above in this patch?

...

> +obj-$(CONFIG_KEYBOARD_MTK) 		+= mtk-kpd.o

TABs/spaces mix.

...

> +#include <linux/atomic.h>
> +#include <linux/clk.h>
> +#include <linux/debugfs.h>
> +#include <linux/delay.h>
> +#include <linux/fs.h>
> +#include <linux/gpio.h>
> +#include <linux/init.h>
> +#include <linux/input.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/ioctl.h>
> +#include <linux/kernel.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_wakeup.h>
> +#include <linux/regmap.h>
> +#include <linux/timer.h>
> +#include <linux/workqueue.h>

Do you really need all of them?!

...

> +#define KP_STA			(0x0000)
> +#define KP_MEM1			(0x0004)
> +#define KP_MEM2			(0x0008)
> +#define KP_MEM3			(0x000c)
> +#define KP_MEM4			(0x0010)
> +#define KP_MEM5			(0x0014)
> +#define KP_DEBOUNCE		(0x0018)
> +#define KP_SEL			(0x0020)
> +#define KP_EN			(0x0024)

What the purpose of parentheses?

...

> +#define KP_COL0_SEL		(1 << 10)
> +#define KP_COL1_SEL		(1 << 11)
> +#define KP_COL2_SEL		(1 << 12)

BIT()

> +#define KPD_DEBOUNCE_MASK	((1U << 14) - 1)
> +#define KPD_DOUBLE_KEY_MASK	(1U << 0)

GENMASK() / BIT_MASK() / BIT()

...

> +static int kpd_pdrv_probe(struct platform_device *pdev);

Why this forward declaration is present?

...

> +static void kpd_get_keymap_state(void __iomem *kp_base, u16 state[])
> +{
> +	state[0] = readw(kp_base + KP_MEM1);
> +	state[1] = readw(kp_base + KP_MEM2);
> +	state[2] = readw(kp_base + KP_MEM3);
> +	state[3] = readw(kp_base + KP_MEM4);
> +	state[4] = readw(kp_base + KP_MEM5);

> +	pr_debug("kpd register = %x %x %x %x %x\n",
> +		 state[0], state[1], state[2], state[3], state[4]);

Consider print_hex_dump() instead. But do you need this at all?

> +}

...

> +		for (j = 0; j < 16U; j++) {
> +			mask = (u16)1 << j;
> +			if (!(change & mask))
> +				continue;

for_each_set_bit() ?

> +		}

...

> +static int kpd_get_dts_info(struct mtk_keypad *keypad,
> +			    struct device_node *node)
> +{
> +	int ret;

Consider pr_*() -> dev_*() in all below code.

> +
> +	ret = of_property_read_u32(node, "mediatek,key-debounce-ms",
> +				   &keypad->key_debounce);
> +	if (ret) {
> +		pr_debug("read mediatek,key-debounce-ms error.\n");
> +		return ret;
> +	}
> +
> +	ret = of_property_read_u32(node, "mediatek,hw-map-num",
> +				   &keypad->hw_map_num);
> +	if (ret) {
> +		pr_debug("read mediatek,hw-map-num error.\n");
> +		return ret;
> +	}
> +
> +	if (keypad->hw_map_num > KPD_NUM_KEYS) {
> +		pr_debug("hw-map-num error, it cannot bigger than %d.\n",
> +			 KPD_NUM_KEYS);

dev_err() ?

> +		return -EINVAL;
> +	}
> +
> +	ret = of_property_read_u32_array(node, "mediatek,hw-init-map",
> +					 keypad->hw_init_map,
> +					 keypad->hw_map_num);
> +
> +	if (ret) {
> +		pr_debug("hw-init-map was not defined in dts.\n");
> +		return ret;
> +	}
> +
> +	pr_debug("deb= %d\n", keypad->key_debounce);
> +
> +	return 0;
> +}

It's for ARM64 which might support ACPI. Perhaps you may use device property
API instead of be OF-centric.

...

> +	keypad_pinctrl = devm_pinctrl_get(dev);
> +	if (IS_ERR(keypad_pinctrl)) {

> +		pr_debug("Cannot find keypad_pinctrl!\n");
> +

These kind of messages are not for production.

> +		return (int)PTR_ERR(keypad_pinctrl);

Why explicit casting? (Same for similar places all over the driver)
Is it really a fatal error?

> +	}

...

> +	return pinctrl_select_state(keypad_pinctrl,
> +				kpd_default);

One line. Perhaps you need to configure your text editor.

...

> +	keypad->clk = devm_clk_get(&pdev->dev, "kpd");
> +	if (IS_ERR(keypad->clk)) {

> +		pr_notice("get kpd-clk fail: %d\n", (int)PTR_ERR(keypad->clk));

Noise as a lot of such messages.

> +		return (int)PTR_ERR(keypad->clk);

Casting?!

> +	}

...

> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		err = -ENODEV;
> +		goto err_unprepare_clk;
> +	}
> +
> +	keypad->base = devm_ioremap(&pdev->dev, res->start,
> +				    resource_size(res));
> +	if (!keypad->base) {
> +		pr_notice("KP iomap failed\n");
> +		err = -EBUSY;
> +		goto err_unprepare_clk;
> +	}

What's wrong with devm_platform_ioremap_resource()?

...

> +	keypad->irqnr = irq_of_parse_and_map(pdev->dev.of_node, 0);
> +	if (!keypad->irqnr) {
> +		pr_notice("KP get irqnr failed\n");
> +		err = -ENODEV;
> +		goto err_unprepare_clk;
> +	}

Can't you use platform_get_irq()?
Why not?

...

> +	pr_info("kp base: 0x%p, addr:0x%p,  kp irq: %d\n",
> +		keypad->base, &keypad->base, keypad->irqnr);

Useless message. Moreover I believe it has wrong specifiers in use.

...

> +	memset(keypad->keymap_state, 0xff, sizeof(keypad->keymap_state));

Shouldn't be bitmap_fill()? In such case the variable has to be type of
unsigned long.

...

> +	writew((u16)(keypad->key_debounce & KPD_DEBOUNCE_MASK),
> +		     keypad->base + KP_DEBOUNCE);

Why explicit casting?

...

> +	/* register IRQ */
> +	err = request_irq(keypad->irqnr, kpd_irq_handler, IRQF_TRIGGER_NONE,
> +			  KPD_NAME, keypad);
> +	if (err) {
> +		pr_notice("register IRQ failed (%d)\n", err);
> +		goto err_irq;
> +	}

Why not threaded IRQ handler instead of ugly tasklet?

...

> +	pr_info("kpd_probe OK.\n");

Noise.

...

> +static const struct of_device_id kpd_of_match[] = {
> +	{.compatible = "mediatek,mt6779-keypad"},
> +	{.compatible = "mediatek,kp"},

> +	{},

Comma is not needed in terminator lines.

> +};

-- 
With Best Regards,
Andy Shevchenko


