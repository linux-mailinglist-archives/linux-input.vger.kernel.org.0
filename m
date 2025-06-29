Return-Path: <linux-input+bounces-13163-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B0FAECB55
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 07:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A64F175177
	for <lists+linux-input@lfdr.de>; Sun, 29 Jun 2025 05:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6647E18CC1C;
	Sun, 29 Jun 2025 05:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUmFoM9I"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B3D184F;
	Sun, 29 Jun 2025 05:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751173245; cv=none; b=Bla6T9CFKEyaeioSWg9r8ZGPLBxwKpUgByz26dfDq/oH5w2EptIoWchp1hChf2NGQCB13jEXWRflxsavatd32aBtyLYvHXk1UwHN/XE/t5GeaciXFvZM6FAnegGcuMIWoZR3eZdug5ZQIiharu3IwyZFW3UYwr2Vrw3o90GEtcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751173245; c=relaxed/simple;
	bh=Q7uoUVM26YklCCGkMyfG3/rZ6hxEEWmX+DxJZyc2wzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ma0mPEW6C97d6pui0/wAyvBwfkeS+nDrPN2vC1bLNyyjGylvejYPGdLwjCFltShRjv9BxK0GgdHVebDfCNr3+VF5v13pwMQVIB0avXMbQPbBJBs+cp0rXpg02DqMcp6/trrcfGWCl834DfazXxHT/Ucie/Adk6JP8PWT+99/YDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUmFoM9I; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22c33677183so28008635ad.2;
        Sat, 28 Jun 2025 22:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751173243; x=1751778043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i4Re3mTNhrRUt0s70VHPQlprdBgHhBAur2dhScRFOIA=;
        b=HUmFoM9IjzcbLiMAPv3U5X5IV1QGXQo8op0XJ92Z7YZ1T5AduK5VhZSjO9c7D2/QiD
         A+uedoe1SnqyVsbK1OXKcfM5RGgqpqLKbjb6qyfyvBhs8J7/fyyNRJLGCQEfJTwrnVup
         Nozophb2ZaZUcTSrkH8OIJ21xWGKG7XzqrNOfaLzA2AZcg43CU1G2oZ9lkibKrqf90JW
         jukY58udTzYcsohPxzjESgpMB9A/PWfw1ay14HlIp1DdUdDdjfQQR0GZfpo/2et82Uoa
         O0OSMEYhBkjtWWFztY22YlYhuh4jaiP67R6C/Msvxdm6m2k6rYlbC6OPtEMd+nRvi+3j
         sZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751173243; x=1751778043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4Re3mTNhrRUt0s70VHPQlprdBgHhBAur2dhScRFOIA=;
        b=Ju186xDe6tpxQXiFjulXagax/q52G/TOqZSr0cmtfhY6+cU658Gr31lGIcrf2f89Mv
         /GLa/KIoepGQhYl4jGXYxUb8kZYXJ5Nx5J6YhvGmQb/T2XSaxIEPuG1dWWFFj4CjTWue
         m1X5D1qNsoEDV0PLjBKxB1H7fUGtEzHRltxRT45EoYwoO6uXg1PdHhP1hMp0OPurhjTW
         KGMEffrA+8JUsnk+833TRTDFXKZk7Hhd7AWmlL0XgsQ4BeYH8wrRf1ySaOxdOn033d+G
         4jKuKsILcoO4UgE9UTYnvjWUekFHLuYYaigcSUzgy6of59/tZergPnfdQP9tB9r4wkDM
         ldtg==
X-Forwarded-Encrypted: i=1; AJvYcCV6PpKM8VWE4gXkOMfzXtVZ4oG5OnmcRDOfyksMD/6MPjxl3Qaz4PSyaLMB8/6NE8j5nv0XgEa+P6vsnK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH5Izv4C7WDJR+ZJ/7yt3xmk/+aJ0jWlpAftWexal0sbRnkex6
	2uPNXNcpO61ISM+Ggvu/ydBUQlHGtpVD4AWcgtJqSLSIRZGkgM8nyYnQ
X-Gm-Gg: ASbGncufXgwUUW/0paZ4kQVyKKcmu72SOYxNnkYIbXrEYCzpfErSFqmgWv9TJ1eCFb1
	A/dguUq7z2bwRmM71OFCAQng1uB4+H0WB1y+u4n/Z2yzLlqEJoRYxDYIeJ+RAnBy7UvBqP2/f9Z
	C3FLgt8fehaq0dYkuiK0r5Im4H2+UJ/mjIjl5bL3uM1Lwv8g0jU+QJaPQ902b2QyRNe32HOWz+c
	YONcOQYHKxryZhuYhPnau0EuzhIDa2CT+3uKnxfZJmh63eZuGhnhp4vnqHUrmsCQOlJG8/gDljs
	4/wOmclESIpuvvxGFRfarktbKLElkoIOuRRsS1TJw5p2aYN6/3dmQ7ZmJkDVDBc=
X-Google-Smtp-Source: AGHT+IHD6/qsEY2xWIzEMXGgFhvOFJu+SgrD5uJylysDc6vnoF0TifSgXUoD5kOsWpE9hMUSdPqogg==
X-Received: by 2002:a17:903:1d2:b0:224:1eab:97b2 with SMTP id d9443c01a7336-23ac48f7c22mr127949855ad.53.1751173242682;
        Sat, 28 Jun 2025 22:00:42 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d8da:e3e0:2b93:2315])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39b9fdsm53768975ad.108.2025.06.28.22.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 22:00:42 -0700 (PDT)
Date: Sat, 28 Jun 2025 22:00:39 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marge Yang <marge.yang@tw.synaptics.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	vincent.huang@tw.synaptics.com, david.chiu@tw.synaptics.com, derek.cheng@tw.synaptics.com, 
	sam.tsai@synaptics.com
Subject: Re: [PATCH V1] Input: synaptics-rmi4- Add a new feature for Forcepad.
Message-ID: <4zjilpm5vbonpg44ykhksbpv22fpvirourelpv2qwactdswrws@hltzjpze5qkj>
References: <20250619112500.3213276-1-marge.yang@tw.synaptics.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619112500.3213276-1-marge.yang@tw.synaptics.com>

Hi Marge,

On Thu, Jun 19, 2025 at 11:25:00AM +0000, Marge Yang wrote:
> From: Marge Yang <Marge.Yang@tw.synaptics.com>
> 
> Forcepad devices will use F21, for click simulation
> due to lack of a metal button, so we add F21 support
> to make forcepad support click function.

I guess with this we can remove the blacklist we have for forcepads in
drivers/input/mouse/synaptics.c?

> 
> Signed-off-by: Marge Yang <Marge.Yang@tw.synaptics.com>
> ---
>  drivers/input/rmi4/Kconfig      |   8 ++
>  drivers/input/rmi4/Makefile     |   1 +
>  drivers/input/rmi4/rmi_bus.c    |   3 +
>  drivers/input/rmi4/rmi_driver.h |   5 ++
>  drivers/input/rmi4/rmi_f21.c    | 126 ++++++++++++++++++++++++++++++++
>  5 files changed, 143 insertions(+)
>  create mode 100644 drivers/input/rmi4/rmi_f21.c
> 
> diff --git a/drivers/input/rmi4/Kconfig b/drivers/input/rmi4/Kconfig
> index c0163b983ce6..086013be6a64 100644
> --- a/drivers/input/rmi4/Kconfig
> +++ b/drivers/input/rmi4/Kconfig
> @@ -82,6 +82,14 @@ config RMI4_F12
>  	  touchpads. For sensors that support relative pointing, F12 also
>  	  provides mouse input.
>  
> +config RMI4_F21
> +	bool "RMI4 Function 21 (PRESSURE)"
> +	help
> +	  Say Y here if you want to add support for RMI4 function 21.
> +
> +	  Function 21 provides buttons/pressure for RMI4 devices. This includes
> +	  support for buttons/pressure on PressurePad.
> +
>  config RMI4_F30
>  	bool "RMI4 Function 30 (GPIO LED)"
>  	help
> diff --git a/drivers/input/rmi4/Makefile b/drivers/input/rmi4/Makefile
> index 02f14c846861..484b97eca025 100644
> --- a/drivers/input/rmi4/Makefile
> +++ b/drivers/input/rmi4/Makefile
> @@ -8,6 +8,7 @@ rmi_core-$(CONFIG_RMI4_2D_SENSOR) += rmi_2d_sensor.o
>  rmi_core-$(CONFIG_RMI4_F03) += rmi_f03.o
>  rmi_core-$(CONFIG_RMI4_F11) += rmi_f11.o
>  rmi_core-$(CONFIG_RMI4_F12) += rmi_f12.o
> +rmi_core-$(CONFIG_RMI4_F21) += rmi_f21.o
>  rmi_core-$(CONFIG_RMI4_F30) += rmi_f30.o
>  rmi_core-$(CONFIG_RMI4_F34) += rmi_f34.o rmi_f34v7.o
>  rmi_core-$(CONFIG_RMI4_F3A) += rmi_f3a.o
> diff --git a/drivers/input/rmi4/rmi_bus.c b/drivers/input/rmi4/rmi_bus.c
> index 3aee04837205..47fe7a88c92b 100644
> --- a/drivers/input/rmi4/rmi_bus.c
> +++ b/drivers/input/rmi4/rmi_bus.c
> @@ -360,6 +360,9 @@ static struct rmi_function_handler *fn_handlers[] = {
>  #ifdef CONFIG_RMI4_F12
>  	&rmi_f12_handler,
>  #endif
> +#ifdef CONFIG_RMI4_F21
> +	&rmi_f21_handler,
> +#endif
>  #ifdef CONFIG_RMI4_F30
>  	&rmi_f30_handler,
>  #endif
> diff --git a/drivers/input/rmi4/rmi_driver.h b/drivers/input/rmi4/rmi_driver.h
> index 3bfe9013043e..18fdf2a166d5 100644
> --- a/drivers/input/rmi4/rmi_driver.h
> +++ b/drivers/input/rmi4/rmi_driver.h
> @@ -115,6 +115,10 @@ static inline int rmi_f03_overwrite_button(struct rmi_function *fn,
>  static inline void rmi_f03_commit_buttons(struct rmi_function *fn) {}
>  #endif
>  
> +#ifdef CONFIG_RMI4_F21
> +int rmi_f21_report_pressure(struct rmi_function *fn, int i);
> +#endif
> +

I do not see definition for this anywhere in the patch.

>  #ifdef CONFIG_RMI4_F34
>  int rmi_f34_create_sysfs(struct rmi_device *rmi_dev);
>  void rmi_f34_remove_sysfs(struct rmi_device *rmi_dev);
> @@ -133,6 +137,7 @@ extern struct rmi_function_handler rmi_f01_handler;
>  extern struct rmi_function_handler rmi_f03_handler;
>  extern struct rmi_function_handler rmi_f11_handler;
>  extern struct rmi_function_handler rmi_f12_handler;
> +extern struct rmi_function_handler rmi_f21_handler;
>  extern struct rmi_function_handler rmi_f30_handler;
>  extern struct rmi_function_handler rmi_f34_handler;
>  extern struct rmi_function_handler rmi_f3a_handler;
> diff --git a/drivers/input/rmi4/rmi_f21.c b/drivers/input/rmi4/rmi_f21.c
> new file mode 100644
> index 000000000000..93ef2331ed16
> --- /dev/null
> +++ b/drivers/input/rmi4/rmi_f21.c
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2012-2025 Synaptics Incorporated
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/rmi.h>
> +#include <linux/input.h>
> +#include <linux/slab.h>
> +#include "rmi_driver.h"
> +
> +#define RMI_f21_INPUT_REPORT_DATA_SIZE	6
> +#define RMI_F21_INPUT_REPORT_FORCE_CLICK_OFFSET	5
> +#define RMI_F21_TABLE_FORCE_CLICK_OFFSET	8
> +#define RMI_f21_FORCE_CLICK			0x01

Use BIT(0) here please.

> +#define RMI_f21_DATA_REGS_MAX_SIZE	19

Why such a big difference in F21 data size between HID and other
transports?

> +#define RMI_f21_FORCEPAD_BUTTON_COUNT	1
> +
> +struct f21_data {
> +	/* Query Data */
> +	u8 data_regs[RMI_f21_DATA_REGS_MAX_SIZE];
> +	u8 input_report_data[RMI_f21_INPUT_REPORT_DATA_SIZE];
> +	struct input_dev *input;
> +	u16 key_code;
> +};
> +
> +static irqreturn_t rmi_f21_attention(int irq, void *ctx)
> +{
> +	struct rmi_function *fn = ctx;
> +	struct f21_data *f21 = dev_get_drvdata(&fn->dev);
> +	struct rmi_driver_data *drvdata = dev_get_drvdata(&fn->rmi_dev->dev);
> +	int error;
> +	bool pressed;
> +
> +	if (drvdata->attn_data.data) {
> +		if (drvdata->attn_data.size < RMI_f21_INPUT_REPORT_DATA_SIZE) {
> +			dev_warn(&fn->dev, "f21 interrupted, but data is missing\n");
> +			return IRQ_HANDLED;
> +		}
> +		memcpy(f21->input_report_data, drvdata->attn_data.data, RMI_f21_INPUT_REPORT_DATA_SIZE);

I do not think you need to do the copy, you can test the bit directly in
drvdata->attn_data.data buffer.

> +		drvdata->attn_data.data += RMI_f21_INPUT_REPORT_DATA_SIZE;
> +		drvdata->attn_data.size -= RMI_f21_INPUT_REPORT_DATA_SIZE;
> +
> +		pressed = !!(f21->input_report_data[RMI_F21_INPUT_REPORT_FORCE_CLICK_OFFSET] &
> +					RMI_f21_FORCE_CLICK);

No need to double negation here, converting to bool will do the right
thing.

> +	} else {
> +		error = rmi_read_block(fn->rmi_dev, fn->fd.data_base_addr,
> +					f21->data_regs, RMI_f21_DATA_REGS_MAX_SIZE);
> +		if (error) {
> +			dev_err(&fn->dev, "%s: Failed to read f21 data registers: %d\n",
> +				__func__, error);
> +			return IRQ_RETVAL(error);
> +		}
> +		pressed = !!(f21->data_regs[RMI_F21_TABLE_FORCE_CLICK_OFFSET] &
> +					RMI_f21_FORCE_CLICK);

Same here.

> +	}
> +
> +	input_report_key(f21->input, f21->key_code, pressed);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int rmi_f21_config(struct rmi_function *fn)
> +{
> +	struct f21_data *f21 = dev_get_drvdata(&fn->dev);
> +	struct rmi_driver *drv = fn->rmi_dev->driver;
> +
> +	if (!f21)
> +		return 0;

Is this actually possible for f21 to be NULL here?

> +
> +	drv->set_irq_bits(fn->rmi_dev, fn->irq_mask);
> +
> +	return 0;
> +}
> +
> +static int rmi_f21_initialize(struct rmi_function *fn, struct f21_data *f21)
> +{
> +	struct input_dev *input = f21->input;
> +	unsigned int button = BTN_LEFT;

This variable is not needed.

> +
> +	f21->key_code = button;

	f21->key_code = BTN_LEFT;

> +	input_set_capability(input, EV_KEY, f21->key_code);
> +	input->keycode = &(f21->key_code);

Drop extra parenthesis.

> +	input->keycodesize = sizeof(f21->key_code);
> +	input->keycodemax = RMI_f21_FORCEPAD_BUTTON_COUNT;
> +
> +	__set_bit(INPUT_PROP_BUTTONPAD, input->propbit);
> +
> +	return 0;
> +}
> +
> +static int rmi_f21_probe(struct rmi_function *fn)
> +{
> +	struct rmi_device *rmi_dev = fn->rmi_dev;
> +	struct rmi_driver_data *drv_data = dev_get_drvdata(&rmi_dev->dev);
> +	struct f21_data *f21;
> +	int error;
> +
> +	if (!drv_data->input) {
> +		dev_info(&fn->dev, "f21: no input device found, ignoring\n");
> +		return -ENXIO;
> +	}
> +
> +	f21 = devm_kzalloc(&fn->dev, sizeof(*f21), GFP_KERNEL);
> +	if (!f21)
> +		return -ENOMEM;
> +
> +	f21->input = drv_data->input;
> +
> +	error = rmi_f21_initialize(fn, f21);
> +	if (error)
> +		return error;
> +
> +	dev_set_drvdata(&fn->dev, f21);
> +	return 0;
> +}
> +
> +struct rmi_function_handler rmi_f21_handler = {
> +	.driver = {
> +		.name = "rmi4_f21",
> +	},
> +	.func = 0x21,
> +	.probe = rmi_f21_probe,
> +	.config = rmi_f21_config,
> +	.attention = rmi_f21_attention,
> +};

Thanks.

-- 
Dmitry

