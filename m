Return-Path: <linux-input+bounces-7756-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A36F69B42CC
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2024 08:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19F17B217F7
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2024 07:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29342201272;
	Tue, 29 Oct 2024 07:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYSTAx/4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D31E200BB7;
	Tue, 29 Oct 2024 07:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730185610; cv=none; b=KpqdZgsnmHzmTcIof30mHmqaTefI7hFxkOwsN22Yvi++IQNazdAGc8/itUdUpIkcws3VvwQl7vb6rtqDXEAA9U8/iIVqsrGJzVGxnRe663hIm445mF/RgCZmC870Te4M477fKfxnh4DkhOG4BNs6za8hMIIWMMnS96mFkhiSPB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730185610; c=relaxed/simple;
	bh=zcDjxMglXwMY5lpHw4LkOj/gSJfewzCV14cR6xHJNYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=omT/O2wfa1bXKX3pHTlNU6isD1domiqi27ll+rv9YjVmBwjuIrPE36MsClRJLeCvNFGNeoPAP1LQlMRntewK8Sx5akVR65saHm7Sw/OWF053cWj3sNKbBIkATueibI24i6ZeWgq8j+S6P5jKkqU1s3xo7eRfQG+xgH1XjCfK13g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DYSTAx/4; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20cf3e36a76so50580135ad.0;
        Tue, 29 Oct 2024 00:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730185606; x=1730790406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y7JqBmWF4OlZPmormuvomATpwYdlArm48QAqei7mfdE=;
        b=DYSTAx/4RwKU8HAAVX/Jtscb3goc4haXiDsoKjb5B6i4069FJPGvGf9OevnSEVSLwN
         imfgM87vyiLAY/PAu1xrDirF7+6aJF0lSR1LMoL51SJlVc3tkJ7iyxWv+sAG/N3wtbKp
         FPSTS+l0fUbmRajP8WPJ38/+mzoOUUt+oKvPY1LSnVqZwZWwLREclXVmqsU4xz6lY620
         8BvHdT8R5m93pvgZSRN/5M3DxrBpnaGrnhp45jcCt/b/TZPtWv9+NIqNaXukeIvaHldm
         YDwj92aVMheK1N51JYH9cbgYsUV21VrFOVe0kPtP4NN4iAQqHM5N9yjzippbmy1mv47G
         YL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730185606; x=1730790406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y7JqBmWF4OlZPmormuvomATpwYdlArm48QAqei7mfdE=;
        b=CwQvFEsjxJRT1OlUOivRBeJpYb8JfNSjOknYjBCJerismJT0Hlb8k9AiokQl6o2on7
         OKxaT4oKcMS/2fT5+QHSQ2+8rYTTvDDQ9KW4o19M+GXpbDCqN27yYvHvuJq4xpv4YWZa
         LxAXncfzti7KcosONS+2rBOJXakhManUByonSuwZLKCwUMcsm00aKwdNJHbMLHYZs8Za
         KmKUXDYq0EdcxIqkep3WpSgy2fGIKdv1bJnlgMimWNWGOb0jqtPm3w6FnXwEzBQVP+QS
         FEQsMwP/a9+wpANVNn9MrSJS62HIrxG0/QlexMzwxmlXHeCCbspcRWaUFnEi587x4vcF
         IoYg==
X-Forwarded-Encrypted: i=1; AJvYcCVKcCTjotCRkDvjh+3w793PFyveFy9y/hDPkqKj92VNw8CAD9LeKETSpCMypXjs6/asUWpXLyo76WJt@vger.kernel.org, AJvYcCVn/umQ5Ita50BZMeTyBk228lkClHOWCDZTCntc/SXh1HcdLFtY9vedq5krZMW7lCwOo19ZJZhXgw/raUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPJlP0PGOEy83iuBFRRs7XeGFUmtmk0JN9Cif8TMa2Cx1/j6bp
	nwJswwcWW0cKFBJ+kix47rygLVMoIpmco87Wnba6vy3y6PPgNDlx
X-Google-Smtp-Source: AGHT+IHbUQXJ1I1RCi42MA4sQIFAP+S4Ubxe7maHcXYEEM5ZoEq8XUePVmff4AD+XeRh3zSFfJS+0Q==
X-Received: by 2002:a17:902:d508:b0:205:4e15:54ce with SMTP id d9443c01a7336-210c68d4388mr166016135ad.20.1730185606016;
        Tue, 29 Oct 2024 00:06:46 -0700 (PDT)
Received: from [172.19.1.43] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc0133e8sm60681245ad.125.2024.10.29.00.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 00:06:45 -0700 (PDT)
Message-ID: <1953f287-cb7e-426b-91e0-6974a2550db0@gmail.com>
Date: Tue, 29 Oct 2024 15:06:41 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] input: keypad: add new keypad driver for MA35D1
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mjchen@nuvoton.com, peng.fan@nxp.com, sudeep.holla@arm.com, arnd@arndb.de,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
References: <20241022063158.5910-1-mjchen0829@gmail.com>
 <20241022063158.5910-3-mjchen0829@gmail.com> <ZxlolCdLGoD820uA@google.com>
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <ZxlolCdLGoD820uA@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024/10/24 上午 05:20, Dmitry Torokhov wrote:

> Hi,
>
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
> No camel-casing please.

I will modify to:unsigned long key_event[4];

>
>> +	unsigned int row_shift = get_count_order(keypad->kpi_col);
>> +	unsigned short *keymap = input_dev->keycode;
>> +
>> +	/* Read key event status */
>> +	KeyEvent[0] = readl(keypad->mmio_base + KPI_KPE0);
>> +	KeyEvent[1] = readl(keypad->mmio_base + KPI_KPE1);
>> +	KeyEvent[2] = readl(keypad->mmio_base + KPI_KRE0);
>> +	KeyEvent[3] = readl(keypad->mmio_base + KPI_KRE1);
>> +
>> +	/* Clear key event status */
>> +	writel(KeyEvent[0], (keypad->mmio_base + KPI_KPE0));
>> +	writel(KeyEvent[1], (keypad->mmio_base + KPI_KPE1));
>> +	writel(KeyEvent[2], (keypad->mmio_base + KPI_KRE0));
>> +	writel(KeyEvent[3], (keypad->mmio_base + KPI_KRE1));
>> +
>> +	for (j = 0; j < 4; j++) {
>> +		if (KeyEvent[j] != 0) {
>> +			row_add = (j % 2) ? 4 : 0;
>> +			press_key = (j < 2) ? 1 : 0;
> So you have first 64 bits to indicate pressed keys, followed by 64 bits
> of released keys, right?
>
> I wonder if you could declare 2 bitmaps of 64 bits and then used
> for_each_set_bit() for each of them.

I will modify to:

	pressed_keys  = KeyEvent[0] | KeyEvent[1] << 32;
	released_keys = KeyEvent[2] | KeyEvent[3] << 32;

	// Process pressed keys
	for_each_set_bit(index, &pressed_keys, KEY_EVENT_BITS) {
		code = MATRIX_SCAN_CODE(index/8, (i % 8), row_shift);
		key = keymap[code];

		input_event(input_dev, EV_MSC, MSC_SCAN, code);
		input_report_key(input_dev, key, 1);
	}

	// Process released keys
	for_each_set_bit(index, &released_keys, KEY_EVENT_BITS) {
		code = MATRIX_SCAN_CODE(index/8, (i % 8), row_shift);
		key = keymap[code];

		input_event(input_dev, EV_MSC, MSC_SCAN, code);
		input_report_key(input_dev, key, 0);
	}

>
>> +
>> +			for (i = 0; i < 32; i++) {
>> +				if (KeyEvent[j] & (1<<i)) {
>> +					code = MATRIX_SCAN_CODE(((i/8) + row_add), (i % 8), row_shift);
>> +					key = keymap[code];
>> +
>> +					input_event(input_dev, EV_MSC, MSC_SCAN, code);
>> +					input_report_key(input_dev, key, press_key);
>> +				}
>> +			}
>> +		}
>> +	}
>> +
>> +	input_sync(input_dev);
>> +}
>> +
>> +static irqreturn_t ma35d1_keypad_interrupt(int irq, void *dev_id)
>> +{
>> +	struct ma35d1_keypad *keypad = dev_id;
>> +	unsigned int  kstatus;
>> +
>> +	kstatus = readl(keypad->mmio_base + KPI_STATUS);
>> +
>> +	if (kstatus & (PKEY_INT|RKEY_INT)) {
>> +		ma35d1_keypad_scan_matrix(keypad, kstatus);
>> +	} else {
> Is this really "else"? Can it be that all 3 bits will be set?

There are indeed four interrupt bits on the hardware, one of which is the "Three Keys Reset" interrupt.
However, my driver does not enable the Three Keys Reset functionality,
so this interrupt will not occur in practice.
Therefore, the actual interrupts that will be triggered are only|PKEY_INT, RKEY_INT and PDWAKE. |

>
>> +		if (kstatus & PDWAKE)
>> +			writel(PDWAKE, (keypad->mmio_base + KPI_STATUS));
>> +	}
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int ma35d1_keypad_open(struct input_dev *dev)
>> +{
>> +	struct ma35d1_keypad *keypad = input_get_drvdata(dev);
>> +	unsigned int val, config;
>> +
>> +	val = RKINTEN | PKINTEN | INTEN | ENKP;
>> +	val |= FIELD_PREP(KCOL, (keypad->kpi_col - 1)) | FIELD_PREP(KROW, (keypad->kpi_row - 1));
>> +
>> +	if (keypad->debounce_val > 0)
>> +		config = FIELD_PREP(PRESCALE, (keypad->pre_scale - 1)) |
>> +				 FIELD_PREP(DB_CLKSEL, keypad->debounce_val);
>> +	else
>> +		config = FIELD_PREP(PRESCALE, (keypad->pre_scale - 1));
>> +
>> +	val |= config;
>> +
>> +	writel(val, keypad->mmio_base + KPI_CONF);
>> +	writel((keypad->pre_scale_divider - 1),	keypad->mmio_base + KPI_PRESCALDIV);
>> +
>> +	return 0;
>> +}
>> +
>> +static void ma35d1_keypad_close(struct input_dev *dev)
>> +{
>> +	struct ma35d1_keypad *keypad = input_get_drvdata(dev);
>> +
>> +	clk_disable(keypad->clk);
> This is broken. What will happen if you open and close the device twice?
> If you disable the clock in close() you need to enable it in open().

I will modify the code to ensure that the clock is enabled in the open function and disabled in the close function,
allowing for proper handling when the device is opened and closed multiple times.

>> +}
>> +
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
> devm_input_allocate_device().

I will modify to:  input_dev = devm_input_allocate_device();

>
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
> Leaking input device (but OK if you switch to devm for it).

I switch to devm.

>
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
>> +		return PTR_ERR(keypad->clk);
>> +	}
>> +
>> +	error = matrix_keypad_parse_properties(&pdev->dev,
>> +										   &(keypad->kpi_row),
>> +										   &(keypad->kpi_col));
> What tab stop are you using?

Sorry, I'll check my editor settings.

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
> Please use generic device property API (device_property_read_u32() and
> others).

I will use device_property_read_u32()

>
>> +
>> +	if (of_property_read_u32(pdev->dev.of_node, "per-scale", &(keypad->pre_scale)))
>> +		keypad->pre_scale = DEFAULT_PRE_SCALE;
>> +
>> +	if (of_property_read_u32(pdev->dev.of_node, "per-scalediv", &(keypad->pre_scale_divider)))
>> +		keypad->pre_scale_divider = DEFAULT_PRE_SCALEDIV;
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
> Why IRQF_NO_SUSPEND?

I use this flag to ensure that the keypad’s interrupt remains enabled during system suspend,
allowing it to wake up the system when needed.
Without IRQF_NO_SUSPEND, the interrupt would be disabled,
preventing the keypad from functioning as a wake-up source.

>
>> +	if (error) {
>> +		dev_err(&pdev->dev, "failed to request IRQ\n");
>> +		goto failed_unregister_input;
>> +	}
>> +
>> +	platform_set_drvdata(pdev, keypad);
>> +	device_init_wakeup(&pdev->dev, 1);
>> +	clk_prepare_enable(keypad->clk);
> Too late preparing clock here.

I will move the|clk_prepare_enable()|  function to be called immediately after|devm_clk_get() |

>
>> +
>> +	return 0;
>> +
>> +failed_unregister_input:
>> +	input_unregister_device(input_dev);
>> +failed_free_input:
>> +	input_free_device(input_dev);
> Do not mix up devm and non-devm resources.

I will use devm.

>
>> +	return error;
>> +}
>> +
>> +static void ma35d1_keypad_remove(struct platform_device *pdev)
>> +{
>> +	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
>> +
>> +	input_unregister_device(keypad->input_dev);
>> +	clk_disable_unprepare(keypad->clk);
>> +}
>> +
>> +static int ma35d1_keypad_suspend(struct platform_device *pdev,
>> +									pm_message_t state)
> Oof, this is so old style. Use DEFINE_SIMPLE_DEV_PM_OPS().

I will modify to:
static DEFINE_SIMPLE_DEV_PM_OPS(ma35d1_pm_ops, ma35d1_keypad_suspend, ma35d1_keypad_resume);

static struct platform_driver ma35d1_keypad_driver = {
	.probe		= ma35d1_keypad_probe,
	.remove		= ma35d1_keypad_remove,
	.driver		= {
		.name	= "ma35d1-kpi",
		.pm	= pm_sleep_ptr(&ma35d1_pm_ops),
	},
};

>
>> +{
>> +	struct ma35d1_keypad *keypad = platform_get_drvdata(pdev);
>> +
>> +	if (device_may_wakeup(&pdev->dev)) {
>> +		writel(readl(keypad->mmio_base + KPI_CONF) | WAKEUP, keypad->mmio_base + KPI_CONF);
>> +		enable_irq_wake(keypad->irq);
> Can you mark the interrupt as a wakeup interrupt in probe by calling
> dev_pm_set_wake_irq()? Then you do not need to call enable_irq_wake()
> here.

Okay, I will use|dev_pm_set_wake_irq()|  in the probe and remove|enable_irq_wake()|

>
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
>> +	},
>> +};
>> +module_platform_driver(ma35d1_keypad_driver);
>> +
>> +MODULE_AUTHOR("Ming-Jen Chen");
>> +MODULE_DESCRIPTION("MA35D1 Keypad Driver");
>> +MODULE_LICENSE("GPL");
>> +
>> -- 
>> 2.17.1
>>
> Thanks.
>

