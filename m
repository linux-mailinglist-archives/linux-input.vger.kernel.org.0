Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 710CB133C06
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2020 08:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgAHHL7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Jan 2020 02:11:59 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33869 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbgAHHL6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Jan 2020 02:11:58 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1ip5V7-0002RS-R4; Wed, 08 Jan 2020 08:11:33 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1ip5V4-000369-JP; Wed, 08 Jan 2020 08:11:30 +0100
Date:   Wed, 8 Jan 2020 08:11:30 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
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
        Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Stefan Agner <stefan@agner.cn>, Jacky Bai <ping.bai@nxp.com>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH V2 2/2] drivers: input: keyboard
Message-ID: <20200108071130.leowzwzkexozumda@pengutronix.de>
References: <20200108062923.14684-1-fengping.yu@mediatek.com>
 <20200108062923.14684-3-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108062923.14684-3-fengping.yu@mediatek.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:38:33 up 53 days, 21:57, 46 users,  load average: 0.01, 0.03,
 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

this is just a short review I did not check all details. Since this is a
v2 you should say what you changed.

Regards,
  Marco

On 20-01-08 14:29, fengping yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> add mtk keypad driver

Hm.. can you explain it a bit more?

> Change-Id: I20bb26ee4112f51f60476b7ff7d6e42b43f729dc
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> ---
>  .../devicetree/bindings/input/mtk-kpd.txt     |  13 +-
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/input/keyboard/Kconfig                |   8 +
>  drivers/input/keyboard/Makefile               |   1 +
>  drivers/input/keyboard/mtk-kpd.c              | 357 ++++++++++++++++++
>  5 files changed, 377 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/input/keyboard/mtk-kpd.c
> 
> diff --git a/Documentation/devicetree/bindings/input/mtk-kpd.txt b/Documentation/devicetree/bindings/input/mtk-kpd.txt
> index 2af81e696159..e3c17513c02c 100644
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

This should be part of patch 1.

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

This should be a extra patch.

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
> index 000000000000..740a58b44dac
> --- /dev/null
> +++ b/drivers/input/keyboard/mtk-kpd.c
> @@ -0,0 +1,357 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 MediaTek Inc.
> + * Author Terry Chang <terry.chang@mediatek.com>
> + */
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

Please check if you need all these includes at least the workqueue isn't
required.

> +#define KPD_NAME	"mtk-kpd"
> +
> +#define KP_STA			(0x0000)
> +#define KP_MEM1			(0x0004)
> +#define KP_MEM2			(0x0008)
> +#define KP_MEM3			(0x000c)
> +#define KP_MEM4			(0x0010)
> +#define KP_MEM5			(0x0014)
> +#define KP_DEBOUNCE		(0x0018)
> +#define KP_SEL			(0x0020)
> +#define KP_EN			(0x0024)
> +
> +#define KP_COL0_SEL		(1 << 10)
> +#define KP_COL1_SEL		(1 << 11)
> +#define KP_COL2_SEL		(1 << 12)
> +
> +#define KPD_DEBOUNCE_MASK	((1U << 14) - 1)
> +#define KPD_DOUBLE_KEY_MASK	(1U << 0)
> +
> +#define KPD_NUM_MEMS	5
> +#define KPD_MEM5_BITS	8
> +#define KPD_NUM_KEYS	72	/* 4 * 16 + KPD_MEM5_BITS */
> +
> +struct mtk_keypad {
> +	struct input_dev *input_dev;
> +	struct wakeup_source *suspend_lock;
> +	struct tasklet_struct tasklet;

Why do you use a tasklet instead of a simple softirq?

> +	struct clk *clk;
> +	void __iomem *base;
> +	unsigned int irqnr;
> +	u32 key_debounce;
> +	u32 hw_map_num;
> +	u32 hw_init_map[KPD_NUM_KEYS];
> +	u16 keymap_state[KPD_NUM_MEMS];
> +};
> +
> +/* for keymap handling */
> +static void kpd_keymap_handler(unsigned long data);
> +
> +static int kpd_pdrv_probe(struct platform_device *pdev);

Why do you delcare these functions here?

> +static void kpd_get_keymap_state(void __iomem *kp_base, u16 state[])
> +{
> +	state[0] = readw(kp_base + KP_MEM1);
> +	state[1] = readw(kp_base + KP_MEM2);
> +	state[2] = readw(kp_base + KP_MEM3);
> +	state[3] = readw(kp_base + KP_MEM4);
> +	state[4] = readw(kp_base + KP_MEM5);
> +	pr_debug("kpd register = %x %x %x %x %x\n",
> +		 state[0], state[1], state[2], state[3], state[4]);
> +}
> +
> +static void kpd_keymap_handler(unsigned long data)
> +{
> +	int i, j;
> +	int pressed;
> +	u16 new_state[KPD_NUM_MEMS], change, mask;
> +	u16 hw_keycode, keycode;
> +	void *dest;
> +	struct mtk_keypad *keypad = (struct mtk_keypad *)data;
> +
> +	kpd_get_keymap_state(keypad->base, new_state);
> +
> +	__pm_wakeup_event(keypad->suspend_lock, 500);
> +
> +	for (i = 0; i < KPD_NUM_MEMS; i++) {
> +		change = new_state[i] ^ keypad->keymap_state[i];
> +		if (!change)
> +			continue;
> +
> +		for (j = 0; j < 16U; j++) {
> +			mask = (u16)1 << j;
> +			if (!(change & mask))
> +				continue;
> +
> +			hw_keycode = (i << 4) + j;
> +
> +			if (hw_keycode >= KPD_NUM_KEYS)
> +				continue;
> +
> +			/* bit is 1: not pressed, 0: pressed */
> +			pressed = (new_state[i] & mask) == 0U;
> +			pr_debug("(%s) HW keycode = %d\n",
> +				 (pressed) ? "pressed" : "released",
> +				 hw_keycode);
> +
> +			keycode = keypad->hw_init_map[hw_keycode];
> +			if (!keycode)
> +				continue;
> +			input_report_key(keypad->input_dev, keycode, pressed);
> +			input_sync(keypad->input_dev);
> +			pr_debug("report Linux keycode = %d\n", keycode);
> +		}
> +	}
> +
> +	dest = memcpy(keypad->keymap_state, new_state, sizeof(new_state));
> +	enable_irq(keypad->irqnr);
> +}
> +
> +static irqreturn_t kpd_irq_handler(int irq, void *dev_id)
> +{
> +	/* use _nosync to avoid deadlock */
> +	struct mtk_keypad *keypad = dev_id;
> +
> +	disable_irq_nosync(keypad->irqnr);
> +	tasklet_schedule(&keypad->tasklet);
> +	return IRQ_HANDLED;
> +}
> +
> +static int kpd_get_dts_info(struct mtk_keypad *keypad,
> +			    struct device_node *node)
> +{
> +	int ret;
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
> +
> +static int kpd_gpio_init(struct device *dev)
> +{
> +	struct pinctrl *keypad_pinctrl;
> +	struct pinctrl_state *kpd_default;
> +
> +	keypad_pinctrl = devm_pinctrl_get(dev);
> +	if (IS_ERR(keypad_pinctrl)) {
> +		pr_debug("Cannot find keypad_pinctrl!\n");
> +
> +		return (int)PTR_ERR(keypad_pinctrl);
> +	}
> +
> +	kpd_default = pinctrl_lookup_state(keypad_pinctrl, "default");
> +	if (IS_ERR(kpd_default)) {
> +		pr_debug("Cannot find ecall_state!\n");
> +
> +		return (int)PTR_ERR(kpd_default);
> +	}
> +
> +	return pinctrl_select_state(keypad_pinctrl,
> +				kpd_default);
> +}
> +
> +static int kpd_pdrv_probe(struct platform_device *pdev)
> +{
> +	struct mtk_keypad *keypad;
> +	struct resource *res;
> +	int i;
> +	int err;
> +
> +	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
> +	if (!keypad)
> +		return -ENOMEM;
> +
> +	keypad->clk = devm_clk_get(&pdev->dev, "kpd");
> +	if (IS_ERR(keypad->clk)) {
> +		pr_notice("get kpd-clk fail: %d\n", (int)PTR_ERR(keypad->clk));
> +		return (int)PTR_ERR(keypad->clk);
> +	}

There is no need to cast it to (int).

> +
> +	err = clk_prepare_enable(keypad->clk);
> +	if (err) {
> +		pr_notice("kpd-clk prepare enable failed.\n");
> +		return err;
> +	}
> +
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
> +
> +	keypad->irqnr = irq_of_parse_and_map(pdev->dev.of_node, 0);
> +	if (!keypad->irqnr) {
> +		pr_notice("KP get irqnr failed\n");
> +		err = -ENODEV;
> +		goto err_unprepare_clk;
> +	}
> +
> +	pr_info("kp base: 0x%p, addr:0x%p,  kp irq: %d\n",
> +		keypad->base, &keypad->base, keypad->irqnr);

Can we move that to pr_info.

> +	err = kpd_gpio_init(&pdev->dev);

This can be done here too but is jsut a nitpick.

> +	if (err) {
> +		pr_debug("gpio init failed\n");
> +		goto err_unprepare_clk;
> +	}
> +
> +	err = kpd_get_dts_info(keypad, pdev->dev.of_node);
> +	if (err) {
> +		pr_debug("get dts info failed.\n");
> +		goto err_unprepare_clk;
> +	}
> +
> +	memset(keypad->keymap_state, 0xff, sizeof(keypad->keymap_state));
> +
> +	keypad->input_dev = devm_input_allocate_device(&pdev->dev);
> +	if (!keypad->input_dev) {
> +		pr_notice("input allocate device fail.\n");
> +		err = -ENOMEM;
> +		goto err_unprepare_clk;
> +	}
> +
> +	keypad->input_dev->name = KPD_NAME;
> +	keypad->input_dev->id.bustype = BUS_HOST;
> +	keypad->input_dev->dev.parent = &pdev->dev;
> +
> +	__set_bit(EV_KEY, keypad->input_dev->evbit);
> +
> +	for (i = 0; i < KPD_NUM_KEYS; i++) {
> +		if (keypad->hw_init_map[i])
> +			__set_bit(keypad->hw_init_map[i],
> +				  keypad->input_dev->keybit);
> +	}
> +
> +	err = input_register_device(keypad->input_dev);
> +	if (err) {
> +		pr_notice("register input device failed (%d)\n", err);
> +		goto err_unprepare_clk;
> +	}
> +
> +	input_set_drvdata(keypad->input_dev, keypad);
> +
> +	keypad->suspend_lock = wakeup_source_register(NULL, "kpd wakelock");
> +	if (!keypad->suspend_lock) {
> +		pr_notice("wakeup source init failed.\n");
> +		err = -ENOMEM;
> +		goto err_unregister_device;
> +	}

What if someone won't use this device as wakeup source?

> +	tasklet_init(&keypad->tasklet, kpd_keymap_handler,
> +		     (unsigned long)keypad);
> +
> +	writew((u16)(keypad->key_debounce & KPD_DEBOUNCE_MASK),
> +		     keypad->base + KP_DEBOUNCE);
> +
> +	/* register IRQ */
> +	err = request_irq(keypad->irqnr, kpd_irq_handler, IRQF_TRIGGER_NONE,
> +			  KPD_NAME, keypad);
> +	if (err) {
> +		pr_notice("register IRQ failed (%d)\n", err);
> +		goto err_irq;
> +	}
> +
> +	pr_info("kpd_probe OK.\n");
> +
> +	return 0;
> +
> +err_irq:
> +	tasklet_kill(&keypad->tasklet);
> +	wakeup_source_unregister(keypad->suspend_lock);
> +
> +err_unregister_device:
> +	input_unregister_device(keypad->input_dev);
> +
> +err_unprepare_clk:
> +	clk_disable_unprepare(keypad->clk);
> +
> +	return err;
> +}
> +
> +static int kpd_pdrv_remove(struct platform_device *pdev)
> +{
> +	struct mtk_keypad *keypad = platform_get_drvdata(pdev);
> +
> +	tasklet_kill(&keypad->tasklet);
> +	wakeup_source_unregister(keypad->suspend_lock);
> +	input_unregister_device(keypad->input_dev);
> +	clk_disable_unprepare(keypad->clk);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id kpd_of_match[] = {
> +	{.compatible = "mediatek,mt6779-keypad"},
> +	{.compatible = "mediatek,kp"},
> +	{},
> +};
> +
> +static struct platform_driver kpd_pdrv = {
> +	.probe = kpd_pdrv_probe,
> +	.remove = kpd_pdrv_remove,
> +	.driver = {
> +		   .name = KPD_NAME,
> +		   .of_match_table = kpd_of_match,
> +		   },

Please align this correct.

> +};
> +
> +module_platform_driver(kpd_pdrv);
> +
> +MODULE_AUTHOR("Mediatek Corporation");
> +MODULE_DESCRIPTION("MTK Keypad (KPD) Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.18.0

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
