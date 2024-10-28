Return-Path: <linux-input+bounces-7723-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8EB9B2533
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 07:23:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C8F41C20F7E
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 06:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153E618DF8B;
	Mon, 28 Oct 2024 06:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVNmEvqR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6996518DF71;
	Mon, 28 Oct 2024 06:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730096622; cv=none; b=uU6h0Bl0e1yglrHpB0Bqgst0skXD1bRbSOv67zPSYYpzfpoURl0VwshKNqw+JRX7SzQ6UHl52Z5nMaMVfCc1bnWdUcrgxF4MC+AYqYrrvgUZavV97+Et+4wmHu453ikO17iSsHSE6Wso7uvxtb8+QEVlQhetDVUPx8tqlitrjeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730096622; c=relaxed/simple;
	bh=3lz0JUUs+Gpv70VHTpW0CdmkIq5Jan62FO8fyLCIxMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D/XeeG7SeK/muyJi9h35P8TtGDDACPcZXqAH2zdd7qWUeoLNRtNVajUQZBouE/JdazYEW/trOZ7JWkkVoGSEBZ+KKl2/0UIVMksy9w16HYAJt1V406AgXWA/d+gCAAh3Es8Nod/R0B2V7gVocuglTYfboca13vAeL1mqBeBss14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVNmEvqR; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-208cf673b8dso35114855ad.3;
        Sun, 27 Oct 2024 23:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730096619; x=1730701419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rRVy7DUai2fxFK9mh+tB9AyWJ8hxKfsvG30fRZxPNmA=;
        b=WVNmEvqRyAswPMWv/Z+4AclVk6whddesDXYo6DIugbwAF0L251MOJg2pIEbB6nWybv
         5jGOtuNGGuWLrSz5UHdP6BeM7ev8TEAY/MZb9F6lopWwUV4VdomtTA+vsqB6HwNUC8wI
         vP52Ov/gyyXB+cjPA7Alv+j3K7bw+cx/OVdBq3l3lJDkMSv79U5ahk662Xwoztvi+zFP
         q1ME+PPjCn/nGXX/P7K3/XeAqunNBNrGlGxiEa/RmMF1cd6G8rq70qekQICDv8LERUjW
         St0SsponLEZp04byXyRMfi3HY4rNOlTx01mdGWDNrlmFVH3+1z4fYkA6V3JD4niB/VbC
         mfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730096619; x=1730701419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rRVy7DUai2fxFK9mh+tB9AyWJ8hxKfsvG30fRZxPNmA=;
        b=XtXbefWkrXwQOxzIUOT2m+rp0qMoWiqFnrtU5r/tXF8TlMonh8kShJK+YpKrmFS/wI
         q9+bYuVAJssPB3htE6eZ+E+O8/bOFheLdKJ4cTtT8e0nbWiPCnmW+S6mgvGLqFApl2XL
         WuB7zviStlX8/c9kvqYaZ6C0kNyQJVofI8G2hI0PvR5Syr2sSjxuHhdZyQBrJzKe4jex
         j1NzffnFZ3AJHBjCKkWBb7h25gz+O+fHoTyKSEJ6b878ovh8aextxSORNAul4aaUCzzY
         3s6hVmzaerzoKEjU5QJOO5thez6GlNHxcoCBZood6L/KdZCKy6mFmwIL4vzj3scoetJi
         IAsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+gDMJGvXC+rdpGicGznxyZsg/TofmsT3c9o5wpJO2NG1Q64M07OF3sdXr98k9ourgnMIhLjmob4sp+Wk=@vger.kernel.org, AJvYcCVrvlmK/4/NAjgjiwZ/EuoD69NjC/uA9lRsf5QmTFgoWtVneC20McPOYweGSlsDkOi6Qs+G33N2S3ji@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk9fIOrx5u5LOUuN6ukU8WPDdmfLl4zucDK8KvpYZOB0RdX8+c
	PNh4QUDaUtmwVq9FVQzs8B+b5W34oBWPpfFNGXqq9utKRQQ55nSK
X-Google-Smtp-Source: AGHT+IFJkDIyhBUI7lRSK3XPqc2b6hPLfZfRYqu6uCKR3bI+jjCdKuefAE13VYYLgL17H7Q8XAvh0A==
X-Received: by 2002:a17:903:283:b0:20c:6bff:fc84 with SMTP id d9443c01a7336-210c67271e3mr105693855ad.0.1730096618603;
        Sun, 27 Oct 2024 23:23:38 -0700 (PDT)
Received: from [172.19.1.43] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc013410sm44405685ad.173.2024.10.27.23.23.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Oct 2024 23:23:38 -0700 (PDT)
Message-ID: <4964ab4f-58cc-42da-b0a6-56b79a7bb4b3@gmail.com>
Date: Mon, 28 Oct 2024 14:23:34 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] input: keypad: add new keypad driver for MA35D1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mjchen@nuvoton.com, peng.fan@nxp.com, sudeep.holla@arm.com, arnd@arndb.de,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 dmitry.torokhov@gmail.com
References: <20241022063158.5910-1-mjchen0829@gmail.com>
 <20241022063158.5910-3-mjchen0829@gmail.com>
 <xveh2z7at7ion3fljdcvbhuvfij7m54bb66rlhclmxot3l5ea5@nzgzed6jwhlt>
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <xveh2z7at7ion3fljdcvbhuvfij7m54bb66rlhclmxot3l5ea5@nzgzed6jwhlt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2024/10/23 下午 04:45, Krzysztof Kozlowski wrote:
> On Tue, Oct 22, 2024 at 06:31:58AM +0000, mjchen wrote:
>> From: mjchen <mjchen@nuvoton.com>
>>
>> Adds a new keypad driver for the MA35D1 platform.
>> The driver supports key scanning and interrupt handling.
>>
>> Signed-off-by: mjchen <mjchen@nuvoton.com>
>> ---
>>   drivers/input/keyboard/Kconfig         |  10 +
>>   drivers/input/keyboard/Makefile        |   1 +
>>   drivers/input/keyboard/ma35d1_keypad.c | 312 +++++++++++++++++++++++++
>>   3 files changed, 323 insertions(+)
>>   create mode 100644 drivers/input/keyboard/ma35d1_keypad.c
>>
>> diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
>> index 721ab69e84ac..ce9bd5cc13a1 100644
>> --- a/drivers/input/keyboard/Kconfig
>> +++ b/drivers/input/keyboard/Kconfig
>> @@ -797,4 +797,14 @@ config KEYBOARD_CYPRESS_SF
>>   	  To compile this driver as a module, choose M here: the
>>   	  module will be called cypress-sf.
>>   
>> +config KEYBOARD_MA35D1
>> +	tristate "Nuvoton MA35D1 keypad driver"
>> +	depends on ARCH_MA35
> || COMPILE_TEST


I will modify to: depends on ARCH_MA35 || COMPILE_TEST

>
>> +	select INPUT_MATRIXKMAP
>> +	help
>> +	  Say Y here if you want to use Nuvoton MA35D1 keypad.
>> +
>> +	  To compile this driver as a module, choose M here: the
>> +	  module will be called ma35d1-keypad.
>> +
>>   endif
>> diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
>> index 1e0721c30709..9b858cdd1b6b 100644
>> --- a/drivers/input/keyboard/Makefile
>> +++ b/drivers/input/keyboard/Makefile
>> @@ -70,3 +70,4 @@ obj-$(CONFIG_KEYBOARD_TEGRA)		+= tegra-kbc.o
>>   obj-$(CONFIG_KEYBOARD_TM2_TOUCHKEY)	+= tm2-touchkey.o
>>   obj-$(CONFIG_KEYBOARD_TWL4030)		+= twl4030_keypad.o
>>   obj-$(CONFIG_KEYBOARD_XTKBD)		+= xtkbd.o
>> +obj-$(CONFIG_KEYBOARD_MA35D1)		+= ma35d1_keypad.o
>> diff --git a/drivers/input/keyboard/ma35d1_keypad.c b/drivers/input/keyboard/ma35d1_keypad.c
>> new file mode 100644
>> index 000000000000..20b5b1b91127
>> --- /dev/null
>> +++ b/drivers/input/keyboard/ma35d1_keypad.c
>> @@ -0,0 +1,312 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + *  MA35D1 keypad driver
>> + *  Copyright (C) 2024 Nuvoton Technology Corp.
>> + */
>> +
>> +#include <linux/interrupt.h>
>> +#include <linux/input.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/input/matrix_keypad.h>
>> +#include <linux/clk.h>
>> +#include <linux/of.h>
>> +
>> +/* Keypad Interface Registers */
>> +#define KPI_CONF		0x00
>> +#define KPI_3KCONF		0x04
>> +#define KPI_STATUS		0x08
>> +#define KPI_RSTC		0x0C
>> +#define KPI_KEST		0x10
>> +#define KPI_KPE0		0x18
>> +#define KPI_KPE1		0x1C
>> +#define KPI_KRE0		0x20
>> +#define KPI_KRE1		0x24
>> +#define KPI_PRESCALDIV	0x28
>> +
>> +/* KPI_CONF - Keypad Configuration Register */
>> +#define KROW		GENMASK(30, 28) /* Keypad Matrix ROW number */
>> +#define KCOL		GENMASK(26, 24) /* Keypad Matrix COL Number */
>> +#define DB_CLKSEL	GENMASK(19, 16) /* De-bounce sampling cycle selection */
>> +#define PRESCALE	GENMASK(15, 8)  /* Row Scan Cycle Pre-scale Value */
>> +#define WAKEUP		BIT(5) /* Lower Power Wakeup Enable */
>> +#define INTEN		BIT(3) /* Key Interrupt Enable Control */
>> +#define RKINTEN		BIT(2) /* Release Key Interrupt Enable */
>> +#define PKINTEN		BIT(1) /* Press Key Interrupt Enable Control */
>> +#define ENKP		BIT(0) /* Keypad Scan Enable */
>> +
>> +/* KPI_STATUS - Keypad Status Register */
>> +#define PKEY_INT	BIT(4) /* Press key interrupt */
>> +#define RKEY_INT	BIT(3) /* Release key interrupt */
>> +#define KEY_INT		BIT(2) /* Key Interrupt */
>> +#define RST_3KEY	BIT(1) /* 3-Keys Reset Flag */
>> +#define PDWAKE		BIT(0) /* Power Down Wakeup Flag */
>> +
>> +#define DEFAULT_DEBOUNCE		1
>> +#define DEFAULT_PRE_SCALE		1
>> +#define DEFAULT_PRE_SCALEDIV	32
>> +
>> +struct ma35d1_keypad {
>> +	struct clk *clk;
>> +	struct input_dev *input_dev;
>> +	void __iomem *mmio_base;
>> +	int irq;
>> +	unsigned int kpi_row;
>> +	unsigned int kpi_col;
>> +	unsigned int debounce_val;
>> +	unsigned int pre_scale;
>> +	unsigned int pre_scale_divider;
>> +};
>> +
>> +static void ma35d1_keypad_scan_matrix(struct ma35d1_keypad *keypad,	unsigned int status)
>> +{
>> +	struct input_dev *input_dev = keypad->input_dev;
>> +	unsigned int i, j;
>> +	unsigned int row_add = 0;
>> +	unsigned int code;
>> +	unsigned int key;
>> +	unsigned int press_key;
>> +	unsigned long KeyEvent[4];
> No Windows or C++ code, please.


I will modify to:unsigned long key_event[4];

>
>> +	unsigned int row_shift = get_count_order(keypad->kpi_col);
>> +	unsigned short *keymap = input_dev->keycode;
>> +
> ...
>
>> +static int ma35d1_keypad_probe(struct platform_device *pdev)
>> +{
>> +	struct ma35d1_keypad *keypad;
>> +	struct input_dev *input_dev;
>> +	struct resource *res;
>> +	int error = 0;
>> +
>> +	keypad = devm_kzalloc(&pdev->dev, sizeof(*keypad), GFP_KERNEL);
>> +	if (!keypad)
>> +		return -ENOMEM;
>> +
>> +
>> +	input_dev = input_allocate_device();
>> +	if (!input_dev) {
>> +		dev_err(&pdev->dev, "failed to allocate input device\n");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	if (!res) {
>> +		dev_err(&pdev->dev, "failed to get I/O memory\n");
>> +		error = -ENXIO;
>> +		goto failed_free_input;
>> +	}
>> +
>> +	keypad->mmio_base = devm_ioremap_resource(&pdev->dev, res);
>> +	if (IS_ERR(keypad->mmio_base)) {
>> +		dev_err(&pdev->dev, "failed to remap I/O memory\n");
>> +		return PTR_ERR(keypad->mmio_base);
>> +	}
>> +
>> +	keypad->irq = platform_get_irq(pdev, 0);
>> +	if (keypad->irq < 0) {
>> +		dev_err(&pdev->dev, "failed to get IRQ\n");
>> +		return keypad->irq;
>> +	}
>> +
>> +	keypad->clk = devm_clk_get(&pdev->dev, NULL);
>> +	if (IS_ERR(keypad->clk)) {
>> +		dev_err(&pdev->dev, "failed to get core clk: %ld\n", PTR_ERR(keypad->clk));
> Syntax is: return dev_err_probe, except that your error handling code is a mess.
> Earlier you have gotos, now return. Organize it nicely, so this will
> follow some logical concept.


I will refactor the error handling in my driver to consistently use either the return dev_err_probe() statement
or the goto method, ensuring a clearer and more logical flow in the code.

>
>> +		return PTR_ERR(keypad->clk);
>> +	}
>> +
>> +	error = matrix_keypad_parse_properties(&pdev->dev,
>> +										   &(keypad->kpi_row),
>> +										   &(keypad->kpi_col));
> How did you aligned it?
>
>> +	if (error) {
>> +		dev_err(&pdev->dev, "failed to parse kp params\n");
>> +		return error;
>> +	}
>> +
>> +	error = matrix_keypad_build_keymap(NULL, NULL,
>> +									   keypad->kpi_row,
>> +									   keypad->kpi_col,
>> +									   NULL, input_dev);
>> +	if (error) {
>> +		dev_err(&pdev->dev, "failed to build keymap\n");
>> +		return error;
>> +	}
>> +
>> +	keypad->input_dev = input_dev;
>> +	input_dev->name = pdev->name;
>> +	input_dev->id.bustype = BUS_HOST;
>> +	input_dev->open = ma35d1_keypad_open;
>> +	input_dev->close = ma35d1_keypad_close;
>> +	input_dev->dev.parent = &pdev->dev;
>> +
>> +	if (of_property_read_u32(pdev->dev.of_node, "debounce-period", &(keypad->debounce_val)))
>> +		keypad->debounce_val = DEFAULT_DEBOUNCE;
> This is not used anywhere. Drop dead code.


In|ma35d1_keypad_open()|, I used|keypad->debounce_val|  to set the debounce length.

>
>> +
>> +	if (of_property_read_u32(pdev->dev.of_node, "per-scale", &(keypad->pre_scale)))
>> +		keypad->pre_scale = DEFAULT_PRE_SCALE;
> Not better...
>
>> +
>> +	if (of_property_read_u32(pdev->dev.of_node, "per-scalediv", &(keypad->pre_scale_divider)))
>> +		keypad->pre_scale_divider = DEFAULT_PRE_SCALEDIV;
> Still not better...
>
> So there are defaults? Why these are required by bindings? Why bindings do not say
> defaults?


I will remove the default values for pre-scale and pre-scalediv.

>
>> +
>> +	__set_bit(EV_REP, input_dev->evbit);
>> +	input_set_drvdata(input_dev, keypad);
>> +	input_set_capability(input_dev, EV_MSC, MSC_SCAN);
>> +
>> +	error = input_register_device(input_dev);
>> +	if (error) {
>> +		dev_err(&pdev->dev, "failed to register input device\n");
>> +		goto failed_free_input;
>> +	}
>> +
>> +	error = devm_request_irq(&pdev->dev, keypad->irq,
>> +							 ma35d1_keypad_interrupt,
>> +							 IRQF_NO_SUSPEND, pdev->name, keypad);
> Totally mesed alignment.


I will review the editor settings and make the necessary adjustments to resolve this problem.

>
>> +	if (error) {
>> +		dev_err(&pdev->dev, "failed to request IRQ\n");
>> +		goto failed_unregister_input;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, keypad);
>> +	device_init_wakeup(&pdev->dev, 1);
>> +	clk_prepare_enable(keypad->clk);
>> +
>> +	return 0;
>> +
>> +failed_unregister_input:
>> +	input_unregister_device(input_dev);
>> +failed_free_input:
>> +	input_free_device(input_dev);
>> +	return error;
>> +}
>> +
>> +static void ma35d1_keypad_remove(struct platform_device *pdev)
>> +{
>> +	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
>> +
>> +	input_unregister_device(keypad->input_dev);
>> +	clk_disable_unprepare(keypad->clk);
> Why aren't you using devm_clk_get_enabled()?


I will update the code to utilize devm_clk_get_enabled() and remove the clk_disable_unprepare(keypad->clk)

>
>> +}
>> +
>> +static int ma35d1_keypad_suspend(struct platform_device *pdev,
>> +									pm_message_t state)
>> +{
>> +	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
>> +
>> +	if (device_may_wakeup(&pdev->dev)) {
>> +		writel(readl(keypad->mmio_base + KPI_CONF) | WAKEUP, keypad->mmio_base + KPI_CONF);
>> +		enable_irq_wake(keypad->irq);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int ma35d1_keypad_resume(struct platform_device *pdev)
>> +{
>> +	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
>> +
>> +	if (device_may_wakeup(&pdev->dev)) {
>> +		writel(readl(keypad->mmio_base + KPI_CONF) & ~(WAKEUP),
>> +						keypad->mmio_base + KPI_CONF);
>> +		disable_irq_wake(keypad->irq);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct of_device_id ma35d1_kpi_of_match[] = {
>> +	{ .compatible = "nuvoton,ma35d1-kpi"},
>> +	{},
>> +};
>> +MODULE_DEVICE_TABLE(of, ma35d1_kpi_of_match);
>> +
>> +static struct platform_driver ma35d1_keypad_driver = {
>> +	.probe		= ma35d1_keypad_probe,
>> +	.remove		= ma35d1_keypad_remove,
>> +	.suspend	= ma35d1_keypad_suspend,
>> +	.resume		= ma35d1_keypad_resume,
>> +	.driver		= {
>> +		.name	= "ma35d1-kpi",
>> +		.of_match_table = of_match_ptr(ma35d1_kpi_of_match),
> Drop of_match_ptr(), you have warnings here.


I will remove this line of code.

>
> Best regards,
> Krzysztof

Best regards,
Ming-Jen Chen


