Return-Path: <linux-input+bounces-7677-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F629AD680
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 23:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 657381C213A3
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2024 21:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695A51E7C10;
	Wed, 23 Oct 2024 21:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFXlBBNF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82891494B3;
	Wed, 23 Oct 2024 21:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729718428; cv=none; b=o41ZtV7JIa20l3bE4S2MaAUyjb8BBMW6Yl1k/Bt/GbBBGFyKyzDyWqk1fz5fkqX3+SVDizLbtM8/porgWgIpyXk3ZXi2wkVLyvJRKfmXkbOS2q1mp1r2efNZkYIVfNHb4TOZbURJ+yQwP3BRM97uC97zL/UA4/RGTI/qD+f8z/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729718428; c=relaxed/simple;
	bh=tlpKd/oVM7CQT1II8ch7Vg8fSSTNAD0bYzIOl/1rWIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nqmuxD7FFlfM22KVHXKNqiehnu7BzZHyFO0FGFPdbcfLEqiRF3PgjXNoipzagxzi6fGwa2ovpo+KZi0Do+giFagXdubkRB/exXnFNUPSyPaAodkmYD6SgqFiwtHhA5HNzvAhQg+EVru+0kBmmzURDbLR4PK9qHm7t3a9aES9C30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFXlBBNF; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e49ef3bb9so187329b3a.1;
        Wed, 23 Oct 2024 14:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729718424; x=1730323224; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f1lAHpDFttttSTMwqQwaJvp8oaLXdhV2Hu+WvPMVdZ0=;
        b=jFXlBBNFbNOJB+oyli9fT3qI/KpTs+JzBDh+kpDxweDilw0G8NIE+cxnGnYkw9ptMH
         MGiqSobaU7+ZSTAEYaGuS0VsW6IAEY2JlwISClmfNq+C0AMNKiBEsDyyBrTp0F8HxZBy
         zYM2AYITNz2oFL1sECAdGs7li2Ezdg9DRXD7oyK4r0WFrvuwGYngUWovzq540FjNSCRn
         o4lOP5s8SZzQFe2GFAX/3ykDUb/LWs+6C3ajaMtxCuYXVYXbPQomw4ah9gwgkkkmBhNL
         rLTEi+lukq3a3AT+CQ8JirSIwgV+nz4DGdumP7a0HHp0/hid0FAkeSgJGESWoGZg9486
         deXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729718424; x=1730323224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1lAHpDFttttSTMwqQwaJvp8oaLXdhV2Hu+WvPMVdZ0=;
        b=FMxd80mQfvLGmqOkcaIOuPqSWtIRj44nKH2MNaq25bkpG2v6faRcXGz4s0zGPejjh7
         ArooXd2hATe5qbWxw0JL5mM+tPn/FlmpTyhlcu7pi2rRHZ3xWIFsljyYterP0kzL5Oam
         9zHwIu7nWtc5RiV0rKBFppLCnf5zIBNeuQ2VrCTpV3NbimTnPVklVCzTYhMtYIJlmDft
         3mqIjVzbmXdxhiIg6b5dhOQcL28tIpZXv8BwsiOexrLTv8QdkSQYauRxU9FTC/s4JmZ7
         NBJPmomSw7ULsGIgtPvL80GQAlXX7k5k8QU4bOuIRHOOvT0xT0wKT6T/tDJlyF3fiD7w
         pr2A==
X-Forwarded-Encrypted: i=1; AJvYcCUFjD+ulUHYB3GfZ2KSkj0RKLWwuwGiNqgZoXD7K8ImrK4Sq0EtrSAeS6G/sBcxS7KlrJrmh/wyWRUd@vger.kernel.org, AJvYcCX6tdYdhKg6blkd96ZgLwAqfiOtTkQlM4RQ0yV6GEN7CmHUJSaDWw64zGdFypjNSsk5K+EzhtZHOooH9sE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHucKZfSi6U8fsr+j7ehBd8h84m1uaLKzLqiISTSh9z9SUmmWe
	Os2njkY0gmTOJOXQDUQ1y7JfBAkiw9FljmkrV2qXxKvbHSDN0PPqe3wDrQ==
X-Google-Smtp-Source: AGHT+IH9lsubsqgOfViHSHfwZvkUoMgkcDtKjmFeIC358iYHJ4HQ11dviFSWXPn6DEyl51MymmjZZw==
X-Received: by 2002:a05:6a00:4654:b0:71e:4dc5:259a with SMTP id d2e1a72fcca58-72030f9af50mr5868173b3a.7.1729718423536;
        Wed, 23 Oct 2024 14:20:23 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:84b7:953b:674b:513c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1407d8dsm6799039b3a.186.2024.10.23.14.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 14:20:23 -0700 (PDT)
Date: Wed, 23 Oct 2024 14:20:20 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: mjchen <mjchen0829@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	mjchen@nuvoton.com, peng.fan@nxp.com, sudeep.holla@arm.com,
	arnd@arndb.de, conor+dt@kernel.org, krzk+dt@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH 2/2] input: keypad: add new keypad driver for MA35D1
Message-ID: <ZxlolCdLGoD820uA@google.com>
References: <20241022063158.5910-1-mjchen0829@gmail.com>
 <20241022063158.5910-3-mjchen0829@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022063158.5910-3-mjchen0829@gmail.com>

Hi,

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

No camel-casing please.

> +	unsigned int row_shift = get_count_order(keypad->kpi_col);
> +	unsigned short *keymap = input_dev->keycode;
> +
> +	/* Read key event status */
> +	KeyEvent[0] = readl(keypad->mmio_base + KPI_KPE0);
> +	KeyEvent[1] = readl(keypad->mmio_base + KPI_KPE1);
> +	KeyEvent[2] = readl(keypad->mmio_base + KPI_KRE0);
> +	KeyEvent[3] = readl(keypad->mmio_base + KPI_KRE1);
> +
> +	/* Clear key event status */
> +	writel(KeyEvent[0], (keypad->mmio_base + KPI_KPE0));
> +	writel(KeyEvent[1], (keypad->mmio_base + KPI_KPE1));
> +	writel(KeyEvent[2], (keypad->mmio_base + KPI_KRE0));
> +	writel(KeyEvent[3], (keypad->mmio_base + KPI_KRE1));
> +
> +	for (j = 0; j < 4; j++) {
> +		if (KeyEvent[j] != 0) {
> +			row_add = (j % 2) ? 4 : 0;
> +			press_key = (j < 2) ? 1 : 0;

So you have first 64 bits to indicate pressed keys, followed by 64 bits
of released keys, right?

I wonder if you could declare 2 bitmaps of 64 bits and then used
for_each_set_bit() for each of them.

> +
> +			for (i = 0; i < 32; i++) {
> +				if (KeyEvent[j] & (1<<i)) {
> +					code = MATRIX_SCAN_CODE(((i/8) + row_add), (i % 8), row_shift);
> +					key = keymap[code];
> +
> +					input_event(input_dev, EV_MSC, MSC_SCAN, code);
> +					input_report_key(input_dev, key, press_key);
> +				}
> +			}
> +		}
> +	}
> +
> +	input_sync(input_dev);
> +}
> +
> +static irqreturn_t ma35d1_keypad_interrupt(int irq, void *dev_id)
> +{
> +	struct ma35d1_keypad *keypad = dev_id;
> +	unsigned int  kstatus;
> +
> +	kstatus = readl(keypad->mmio_base + KPI_STATUS);
> +
> +	if (kstatus & (PKEY_INT|RKEY_INT)) {
> +		ma35d1_keypad_scan_matrix(keypad, kstatus);
> +	} else {

Is this really "else"? Can it be that all 3 bits will be set?

> +		if (kstatus & PDWAKE)
> +			writel(PDWAKE, (keypad->mmio_base + KPI_STATUS));
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int ma35d1_keypad_open(struct input_dev *dev)
> +{
> +	struct ma35d1_keypad *keypad = input_get_drvdata(dev);
> +	unsigned int val, config;
> +
> +	val = RKINTEN | PKINTEN | INTEN | ENKP;
> +	val |= FIELD_PREP(KCOL, (keypad->kpi_col - 1)) | FIELD_PREP(KROW, (keypad->kpi_row - 1));
> +
> +	if (keypad->debounce_val > 0)
> +		config = FIELD_PREP(PRESCALE, (keypad->pre_scale - 1)) |
> +				 FIELD_PREP(DB_CLKSEL, keypad->debounce_val);
> +	else
> +		config = FIELD_PREP(PRESCALE, (keypad->pre_scale - 1));
> +
> +	val |= config;
> +
> +	writel(val, keypad->mmio_base + KPI_CONF);
> +	writel((keypad->pre_scale_divider - 1),	keypad->mmio_base + KPI_PRESCALDIV);
> +
> +	return 0;
> +}
> +
> +static void ma35d1_keypad_close(struct input_dev *dev)
> +{
> +	struct ma35d1_keypad *keypad = input_get_drvdata(dev);
> +
> +	clk_disable(keypad->clk);

This is broken. What will happen if you open and close the device twice?
If you disable the clock in close() you need to enable it in open().

> +}
> +
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

devm_input_allocate_device().

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

Leaking input device (but OK if you switch to devm for it).

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
> +		return PTR_ERR(keypad->clk);
> +	}
> +
> +	error = matrix_keypad_parse_properties(&pdev->dev,
> +										   &(keypad->kpi_row),
> +										   &(keypad->kpi_col));

What tab stop are you using?

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

Please use generic device property API (device_property_read_u32() and
others).

> +
> +	if (of_property_read_u32(pdev->dev.of_node, "per-scale", &(keypad->pre_scale)))
> +		keypad->pre_scale = DEFAULT_PRE_SCALE;
> +
> +	if (of_property_read_u32(pdev->dev.of_node, "per-scalediv", &(keypad->pre_scale_divider)))
> +		keypad->pre_scale_divider = DEFAULT_PRE_SCALEDIV;
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

Why IRQF_NO_SUSPEND?

> +	if (error) {
> +		dev_err(&pdev->dev, "failed to request IRQ\n");
> +		goto failed_unregister_input;
> +	}
> +
> +	platform_set_drvdata(pdev, keypad);
> +	device_init_wakeup(&pdev->dev, 1);
> +	clk_prepare_enable(keypad->clk);

Too late preparing clock here.

> +
> +	return 0;
> +
> +failed_unregister_input:
> +	input_unregister_device(input_dev);
> +failed_free_input:
> +	input_free_device(input_dev);

Do not mix up devm and non-devm resources.

> +	return error;
> +}
> +
> +static void ma35d1_keypad_remove(struct platform_device *pdev)
> +{
> +	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
> +
> +	input_unregister_device(keypad->input_dev);
> +	clk_disable_unprepare(keypad->clk);
> +}
> +
> +static int ma35d1_keypad_suspend(struct platform_device *pdev,
> +									pm_message_t state)

Oof, this is so old style. Use DEFINE_SIMPLE_DEV_PM_OPS().

> +{
> +	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
> +
> +	if (device_may_wakeup(&pdev->dev)) {
> +		writel(readl(keypad->mmio_base + KPI_CONF) | WAKEUP, keypad->mmio_base + KPI_CONF);
> +		enable_irq_wake(keypad->irq);

Can you mark the interrupt as a wakeup interrupt in probe by calling
dev_pm_set_wake_irq()? Then you do not need to call enable_irq_wake()
here.

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
> +	},
> +};
> +module_platform_driver(ma35d1_keypad_driver);
> +
> +MODULE_AUTHOR("Ming-Jen Chen");
> +MODULE_DESCRIPTION("MA35D1 Keypad Driver");
> +MODULE_LICENSE("GPL");
> +
> -- 
> 2.17.1
> 

Thanks.

-- 
Dmitry

