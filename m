Return-Path: <linux-input+bounces-7637-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC259AC208
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 10:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B167284453
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 08:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94601160783;
	Wed, 23 Oct 2024 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L74W8wR7"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695AC158845;
	Wed, 23 Oct 2024 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729673106; cv=none; b=naZy7p1iqcgW/t7TM/xmMlvre/Lej13E0l3FKMF0BhOzT7WVoCJSAyKeikkuoduzDm40KoUPXzFtGU2JPb/jyGKNw/v7tWGtCqM8qw2yfmpvF92m0eb4Pfx7Ecm2dbGMszEDOXMmTRpH3m50MT9dJoUvqB1Q50h8AydhSNaRy9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729673106; c=relaxed/simple;
	bh=Q9+IdA9z1jSogaUNnaqvsX9oNHR9qfz1Kp31tdfvIe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b782uS4CaTJLMWZYxC+7aaEOoE1pfxUDxQrbmsFgCfAgY69Jys3ahmgylI/OdZg1nRqkitEPF14HL7GFGelIiC7bHUBM8TTUsdflziR5FMwreXq6kAJZst55wTXgtdfUY0IdK+Dv8KG1lBlwlaaJtQQLed8LKPDQZu+X1DY1Wsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L74W8wR7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64F55C4CEC6;
	Wed, 23 Oct 2024 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729673105;
	bh=Q9+IdA9z1jSogaUNnaqvsX9oNHR9qfz1Kp31tdfvIe4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L74W8wR7dEGjhg7mqQsrCfoItRsWtistWNuC715+d2hurgcotx+yTHo/QC/rpMeDb
	 IHbOCSWlwND2rmdED/ORaqTWgslPmiVEUpVuqDUntO24Vf5P+0x1tQHHzFy4xm4dEQ
	 oShCdmNK1DV9/+vBO/jCegTqEnYjW+ZTlNmJMv8I49Abqtnd36t+L1RCqtiXz6D55F
	 aL46N13Jn/gKDLTBkkS5vNaRdVyvPHXrJDtdUEvoa8OVIoJB8WX9/HPJoG8AB2qrdH
	 BcASLfc6aNS7+F5R/zMRuczD9MNMi/GCSbhgpDdVXMHVra0bqyPqL1tpjeVYGJ7FG+
	 14KNkDI89SYuA==
Date: Wed, 23 Oct 2024 10:45:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: mjchen <mjchen0829@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org, mjchen@nuvoton.com, 
	peng.fan@nxp.com, sudeep.holla@arm.com, arnd@arndb.de, conor+dt@kernel.org, 
	krzk+dt@kernel.org, robh@kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH 2/2] input: keypad: add new keypad driver for MA35D1
Message-ID: <xveh2z7at7ion3fljdcvbhuvfij7m54bb66rlhclmxot3l5ea5@nzgzed6jwhlt>
References: <20241022063158.5910-1-mjchen0829@gmail.com>
 <20241022063158.5910-3-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022063158.5910-3-mjchen0829@gmail.com>

On Tue, Oct 22, 2024 at 06:31:58AM +0000, mjchen wrote:
> From: mjchen <mjchen@nuvoton.com>
> 
> Adds a new keypad driver for the MA35D1 platform.
> The driver supports key scanning and interrupt handling.
> 
> Signed-off-by: mjchen <mjchen@nuvoton.com>
> ---
>  drivers/input/keyboard/Kconfig         |  10 +
>  drivers/input/keyboard/Makefile        |   1 +
>  drivers/input/keyboard/ma35d1_keypad.c | 312 +++++++++++++++++++++++++
>  3 files changed, 323 insertions(+)
>  create mode 100644 drivers/input/keyboard/ma35d1_keypad.c
> 
> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
> index 721ab69e84ac..ce9bd5cc13a1 100644
> --- a/drivers/input/keyboard/Kconfig
> +++ b/drivers/input/keyboard/Kconfig
> @@ -797,4 +797,14 @@ config KEYBOARD_CYPRESS_SF
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called cypress-sf.
>  
> +config KEYBOARD_MA35D1
> +	tristate "Nuvoton MA35D1 keypad driver"
> +	depends on ARCH_MA35

|| COMPILE_TEST

> +	select INPUT_MATRIXKMAP
> +	help
> +	  Say Y here if you want to use Nuvoton MA35D1 keypad.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called ma35d1-keypad.
> +
>  endif
> diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
> index 1e0721c30709..9b858cdd1b6b 100644
> --- a/drivers/input/keyboard/Makefile
> +++ b/drivers/input/keyboard/Makefile
> @@ -70,3 +70,4 @@ obj-$(CONFIG_KEYBOARD_TEGRA)		+= tegra-kbc.o
>  obj-$(CONFIG_KEYBOARD_TM2_TOUCHKEY)	+= tm2-touchkey.o
>  obj-$(CONFIG_KEYBOARD_TWL4030)		+= twl4030_keypad.o
>  obj-$(CONFIG_KEYBOARD_XTKBD)		+= xtkbd.o
> +obj-$(CONFIG_KEYBOARD_MA35D1)		+= ma35d1_keypad.o
> diff --git a/drivers/input/keyboard/ma35d1_keypad.c b/drivers/input/keyboard/ma35d1_keypad.c
> new file mode 100644
> index 000000000000..20b5b1b91127
> --- /dev/null
> +++ b/drivers/input/keyboard/ma35d1_keypad.c
> @@ -0,0 +1,312 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + *  MA35D1 keypad driver
> + *  Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/interrupt.h>
> +#include <linux/input.h>
> +#include <linux/platform_device.h>
> +#include <linux/input/matrix_keypad.h>
> +#include <linux/clk.h>
> +#include <linux/of.h>
> +
> +/* Keypad Interface Registers */
> +#define KPI_CONF		0x00
> +#define KPI_3KCONF		0x04
> +#define KPI_STATUS		0x08
> +#define KPI_RSTC		0x0C
> +#define KPI_KEST		0x10
> +#define KPI_KPE0		0x18
> +#define KPI_KPE1		0x1C
> +#define KPI_KRE0		0x20
> +#define KPI_KRE1		0x24
> +#define KPI_PRESCALDIV	0x28
> +
> +/* KPI_CONF - Keypad Configuration Register */
> +#define KROW		GENMASK(30, 28) /* Keypad Matrix ROW number */
> +#define KCOL		GENMASK(26, 24) /* Keypad Matrix COL Number */
> +#define DB_CLKSEL	GENMASK(19, 16) /* De-bounce sampling cycle selection */
> +#define PRESCALE	GENMASK(15, 8)  /* Row Scan Cycle Pre-scale Value */
> +#define WAKEUP		BIT(5) /* Lower Power Wakeup Enable */
> +#define INTEN		BIT(3) /* Key Interrupt Enable Control */
> +#define RKINTEN		BIT(2) /* Release Key Interrupt Enable */
> +#define PKINTEN		BIT(1) /* Press Key Interrupt Enable Control */
> +#define ENKP		BIT(0) /* Keypad Scan Enable */
> +
> +/* KPI_STATUS - Keypad Status Register */
> +#define PKEY_INT	BIT(4) /* Press key interrupt */
> +#define RKEY_INT	BIT(3) /* Release key interrupt */
> +#define KEY_INT		BIT(2) /* Key Interrupt */
> +#define RST_3KEY	BIT(1) /* 3-Keys Reset Flag */
> +#define PDWAKE		BIT(0) /* Power Down Wakeup Flag */
> +
> +#define DEFAULT_DEBOUNCE		1
> +#define DEFAULT_PRE_SCALE		1
> +#define DEFAULT_PRE_SCALEDIV	32
> +
> +struct ma35d1_keypad {
> +	struct clk *clk;
> +	struct input_dev *input_dev;
> +	void __iomem *mmio_base;
> +	int irq;
> +	unsigned int kpi_row;
> +	unsigned int kpi_col;
> +	unsigned int debounce_val;
> +	unsigned int pre_scale;
> +	unsigned int pre_scale_divider;
> +};
> +
> +static void ma35d1_keypad_scan_matrix(struct ma35d1_keypad *keypad,	unsigned int status)
> +{
> +	struct input_dev *input_dev = keypad->input_dev;
> +	unsigned int i, j;
> +	unsigned int row_add = 0;
> +	unsigned int code;
> +	unsigned int key;
> +	unsigned int press_key;
> +	unsigned long KeyEvent[4];

No Windows or C++ code, please.

> +	unsigned int row_shift = get_count_order(keypad->kpi_col);
> +	unsigned short *keymap = input_dev->keycode;
> +

...

> +static int ma35d1_keypad_probe(struct platform_device *pdev)
> +{
> +	struct ma35d1_keypad *keypad;
> +	struct input_dev *input_dev;
> +	struct resource *res;
> +	int error = 0;
> +
> +	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
> +	if (!keypad)
> +		return -ENOMEM;
> +
> +
> +	input_dev = input_allocate_device();
> +	if (!input_dev) {
> +		dev_err(&pdev->dev, "failed to allocate input device\n");
> +		return -ENOMEM;
> +	}
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "failed to get I/O memory\n");
> +		error = -ENXIO;
> +		goto failed_free_input;
> +	}
> +
> +	keypad->mmio_base = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(keypad->mmio_base)) {
> +		dev_err(&pdev->dev, "failed to remap I/O memory\n");
> +		return PTR_ERR(keypad->mmio_base);
> +	}
> +
> +	keypad->irq = platform_get_irq(pdev, 0);
> +	if (keypad->irq < 0) {
> +		dev_err(&pdev->dev, "failed to get IRQ\n");
> +		return keypad->irq;
> +	}
> +
> +	keypad->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(keypad->clk)) {
> +		dev_err(&pdev->dev, "failed to get core clk: %ld\n", PTR_ERR(keypad->clk));

Syntax is: return dev_err_probe, except that your error handling code is a mess.
Earlier you have gotos, now return. Organize it nicely, so this will
follow some logical concept.

> +		return PTR_ERR(keypad->clk);
> +	}
> +
> +	error = matrix_keypad_parse_properties(&pdev->dev,
> +										   &(keypad->kpi_row),
> +										   &(keypad->kpi_col));

How did you aligned it?

> +	if (error) {
> +		dev_err(&pdev->dev, "failed to parse kp params\n");
> +		return error;
> +	}
> +
> +	error = matrix_keypad_build_keymap(NULL, NULL,
> +									   keypad->kpi_row,
> +									   keypad->kpi_col,
> +									   NULL, input_dev);
> +	if (error) {
> +		dev_err(&pdev->dev, "failed to build keymap\n");
> +		return error;
> +	}
> +
> +	keypad->input_dev = input_dev;
> +	input_dev->name = pdev->name;
> +	input_dev->id.bustype = BUS_HOST;
> +	input_dev->open = ma35d1_keypad_open;
> +	input_dev->close = ma35d1_keypad_close;
> +	input_dev->dev.parent = &pdev->dev;
> +
> +	if (of_property_read_u32(pdev->dev.of_node, "debounce-period", &(keypad->debounce_val)))
> +		keypad->debounce_val = DEFAULT_DEBOUNCE;

This is not used anywhere. Drop dead code.

> +
> +	if (of_property_read_u32(pdev->dev.of_node, "per-scale", &(keypad->pre_scale)))
> +		keypad->pre_scale = DEFAULT_PRE_SCALE;

Not better...

> +
> +	if (of_property_read_u32(pdev->dev.of_node, "per-scalediv", &(keypad->pre_scale_divider)))
> +		keypad->pre_scale_divider = DEFAULT_PRE_SCALEDIV;

Still not better...

So there are defaults? Why these are required by bindings? Why bindings do not say
defaults?

> +
> +	__set_bit(EV_REP, input_dev->evbit);
> +	input_set_drvdata(input_dev, keypad);
> +	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
> +
> +	error = input_register_device(input_dev);
> +	if (error) {
> +		dev_err(&pdev->dev, "failed to register input device\n");
> +		goto failed_free_input;
> +	}
> +
> +	error = devm_request_irq(&pdev->dev, keypad->irq,
> +							 ma35d1_keypad_interrupt,
> +							 IRQF_NO_SUSPEND, pdev->name, keypad);

Totally mesed alignment.

> +	if (error) {
> +		dev_err(&pdev->dev, "failed to request IRQ\n");
> +		goto failed_unregister_input;
> +	}
> +
> +	platform_set_drvdata(pdev, keypad);
> +	device_init_wakeup(&pdev->dev, 1);
> +	clk_prepare_enable(keypad->clk);
> +
> +	return 0;
> +
> +failed_unregister_input:
> +	input_unregister_device(input_dev);
> +failed_free_input:
> +	input_free_device(input_dev);
> +	return error;
> +}
> +
> +static void ma35d1_keypad_remove(struct platform_device *pdev)
> +{
> +	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
> +
> +	input_unregister_device(keypad->input_dev);
> +	clk_disable_unprepare(keypad->clk);

Why aren't you using devm_clk_get_enabled()?

> +}
> +
> +static int ma35d1_keypad_suspend(struct platform_device *pdev,
> +									pm_message_t state)
> +{
> +	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
> +
> +	if (device_may_wakeup(&pdev->dev)) {
> +		writel(readl(keypad->mmio_base + KPI_CONF) | WAKEUP, keypad->mmio_base + KPI_CONF);
> +		enable_irq_wake(keypad->irq);
> +	}
> +
> +	return 0;
> +}
> +
> +static int ma35d1_keypad_resume(struct platform_device *pdev)
> +{
> +	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
> +
> +	if (device_may_wakeup(&pdev->dev)) {
> +		writel(readl(keypad->mmio_base + KPI_CONF) & ~(WAKEUP),
> +						keypad->mmio_base + KPI_CONF);
> +		disable_irq_wake(keypad->irq);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id ma35d1_kpi_of_match[] = {
> +	{ .compatible = "nuvoton,ma35d1-kpi"},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ma35d1_kpi_of_match);
> +
> +static struct platform_driver ma35d1_keypad_driver = {
> +	.probe		= ma35d1_keypad_probe,
> +	.remove		= ma35d1_keypad_remove,
> +	.suspend	= ma35d1_keypad_suspend,
> +	.resume		= ma35d1_keypad_resume,
> +	.driver		= {
> +		.name	= "ma35d1-kpi",
> +		.of_match_table = of_match_ptr(ma35d1_kpi_of_match),

Drop of_match_ptr(), you have warnings here.

Best regards,
Krzysztof


