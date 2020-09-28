Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4209327B7CE
	for <lists+linux-input@lfdr.de>; Tue, 29 Sep 2020 01:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgI1XSM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Sep 2020 19:18:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24822 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726396AbgI1XSL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Sep 2020 19:18:11 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601335090;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pPF61MtrKBILYlE03wvnTeFym1uLDInt0W29/MUZ1fw=;
        b=S6ljlYkaw797H7hcLAjkT9fXZKBzoKPhpbVWkGfXMKmhlwYKWMeZ77LKqt/CpoxbVZ7b6B
        6+rqQngvg5xHo5Sf52JIWY85U+iRD5K/YykdrCH0PKF7WzwtUaCOUfaepFSJRH7LL1usgw
        NTa2MXGLIbYFh3AqTSkOIHS/e1Xxz0Q=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-fDEUoRhuMomyBpmgZmRecg-1; Mon, 28 Sep 2020 19:02:07 -0400
X-MC-Unique: fDEUoRhuMomyBpmgZmRecg-1
Received: by mail-qt1-f198.google.com with SMTP id u6so1717333qte.8
        for <linux-input@vger.kernel.org>; Mon, 28 Sep 2020 16:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:organization:user-agent:mime-version
         :content-transfer-encoding;
        bh=pPF61MtrKBILYlE03wvnTeFym1uLDInt0W29/MUZ1fw=;
        b=ICu5RwXK+KTsB6yOF3RrL+iYMEi7FpJ3zY2Kw+0Bdc640b6IJWtZAamesogi2F70D2
         UVXKwkML6avIk+EgccZDGi1v9CbAZjcIyPns8BCQpm8GeJjFJ52bbUpaIlPUHQYyWG24
         90aAaoC/+z8Wy4iR5Gv+/Xcxkx6lvEIZuP59AJsmgl6k7SF2lXy4TG6PFQPNHsHYz4+r
         6Z7Mn2nGrUPpZlc1RZmJdp5pXp/IrCRGqyLjr+xf12DFpH8S2ccooHOR9ibivK1nUzw2
         23eO4aHL5hZAlW1/28p76ft+gI7qnWwDWt8jYQRyqSaOqD8qM5C+bTSP/8FjAIRbWK9o
         +BwA==
X-Gm-Message-State: AOAM532jBbfaAGVF8x7CsT1TqwO1qCXjNTIZ5IJwwSmAkxNIX9tPQicN
        mmOb3R8OdBNbPdTweAUEQErGkzjk3FSjf9AQR39hE0bCGka/494HS2E651fyWURrdJtdlsC0c8j
        rrc2dCsj6z9kJfmotj9nlsHk=
X-Received: by 2002:a05:620a:15a6:: with SMTP id f6mr1755956qkk.418.1601334126527;
        Mon, 28 Sep 2020 16:02:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJGaRl+9A2B1kT7qa9iBVmcbWVSYbXNNwRSLYd69mNHn7G8Q9uzVJ4KnKmrdyGFQjRYuVl9g==
X-Received: by 2002:a05:620a:15a6:: with SMTP id f6mr1755931qkk.418.1601334126059;
        Mon, 28 Sep 2020 16:02:06 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net. [108.49.102.102])
        by smtp.gmail.com with ESMTPSA id y22sm2557559qki.33.2020.09.28.16.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 16:02:05 -0700 (PDT)
Message-ID: <2aae2b906e250b9023f149cf2abf7cb9eac81055.camel@redhat.com>
Subject: Re: [PATCH v2 2/2] Input: synaptics-rmi4 - add support for F3A
From:   Lyude Paul <lyude@redhat.com>
To:     Vincent Huang <vincent.huang@tw.synaptics.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Date:   Mon, 28 Sep 2020 19:02:04 -0400
In-Reply-To: <20200928052008.279274-3-vincent.huang@tw.synaptics.com>
References: <20200928052008.279274-1-vincent.huang@tw.synaptics.com>
         <20200928052008.279274-3-vincent.huang@tw.synaptics.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2020-09-28 at 13:20 +0800, Vincent Huang wrote:
> RMI4 F3A supports the touchpad GPIO function, it's designed to
> support more GPIOs and used on newer touchpads. This patch adds
> support of the touchpad buttons.
> 
> Signed-off-by: Vincent Huang <vincent.huang@tw.synaptics.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/input/rmi4/Kconfig      |   8 ++
>  drivers/input/rmi4/Makefile     |   1 +
>  drivers/input/rmi4/rmi_bus.c    |   3 +
>  drivers/input/rmi4/rmi_driver.h |   1 +
>  drivers/input/rmi4/rmi_f3a.c    | 241 ++++++++++++++++++++++++++++++++
>  5 files changed, 254 insertions(+)
>  create mode 100644 drivers/input/rmi4/rmi_f3a.c
> 
> diff --git a/drivers/input/rmi4/Kconfig b/drivers/input/rmi4/Kconfig
> index a212ff706f74..16119f760d11 100644
> --- a/drivers/input/rmi4/Kconfig
> +++ b/drivers/input/rmi4/Kconfig
> @@ -100,6 +100,14 @@ config RMI4_F34
>  	  device via the firmware loader interface. This is triggered using a
>  	  sysfs attribute.
>  
> +config RMI4_F3A
> +	bool "RMI4 Function 3A (GPIO)"
> +	help
> +	  Say Y here if you want to add support for RMI4 function 3A.
> +
> +	  Function 3A provides GPIO support for RMI4 devices. This includes
> +	  support for buttons on TouchPads and ClickPads.
> +
>  config RMI4_F54
>  	bool "RMI4 Function 54 (Analog diagnostics)"
>  	depends on VIDEO_V4L2=y || (RMI4_CORE=m && VIDEO_V4L2=m)
> diff --git a/drivers/input/rmi4/Makefile b/drivers/input/rmi4/Makefile
> index f17631656987..02f14c846861 100644
> --- a/drivers/input/rmi4/Makefile
> +++ b/drivers/input/rmi4/Makefile
> @@ -10,6 +10,7 @@ rmi_core-$(CONFIG_RMI4_F11) += rmi_f11.o
>  rmi_core-$(CONFIG_RMI4_F12) += rmi_f12.o
>  rmi_core-$(CONFIG_RMI4_F30) += rmi_f30.o
>  rmi_core-$(CONFIG_RMI4_F34) += rmi_f34.o rmi_f34v7.o
> +rmi_core-$(CONFIG_RMI4_F3A) += rmi_f3a.o
>  rmi_core-$(CONFIG_RMI4_F54) += rmi_f54.o
>  rmi_core-$(CONFIG_RMI4_F55) += rmi_f55.o
>  
> diff --git a/drivers/input/rmi4/rmi_bus.c b/drivers/input/rmi4/rmi_bus.c
> index af706a583656..47d1b97ed6cf 100644
> --- a/drivers/input/rmi4/rmi_bus.c
> +++ b/drivers/input/rmi4/rmi_bus.c
> @@ -365,6 +365,9 @@ static struct rmi_function_handler *fn_handlers[] = {
>  #ifdef CONFIG_RMI4_F34
>  	&rmi_f34_handler,
>  #endif
> +#ifdef CONFIG_RMI4_F3A
> +	&rmi_f3a_handler,
> +#endif
>  #ifdef CONFIG_RMI4_F54
>  	&rmi_f54_handler,
>  #endif
> diff --git a/drivers/input/rmi4/rmi_driver.h
> b/drivers/input/rmi4/rmi_driver.h
> index 65bfaa95e193..1c6c6086c0e5 100644
> --- a/drivers/input/rmi4/rmi_driver.h
> +++ b/drivers/input/rmi4/rmi_driver.h
> @@ -135,6 +135,7 @@ extern struct rmi_function_handler rmi_f11_handler;
>  extern struct rmi_function_handler rmi_f12_handler;
>  extern struct rmi_function_handler rmi_f30_handler;
>  extern struct rmi_function_handler rmi_f34_handler;
> +extern struct rmi_function_handler rmi_f3a_handler;
>  extern struct rmi_function_handler rmi_f54_handler;
>  extern struct rmi_function_handler rmi_f55_handler;
>  #endif
> diff --git a/drivers/input/rmi4/rmi_f3a.c b/drivers/input/rmi4/rmi_f3a.c
> new file mode 100644
> index 000000000000..be3c1ecc1181
> --- /dev/null
> +++ b/drivers/input/rmi4/rmi_f3a.c
> @@ -0,0 +1,241 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2012-2020 Synaptics Incorporated
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/rmi.h>
> +#include <linux/input.h>
> +#include <linux/slab.h>
> +#include "rmi_driver.h"
> +
> +#define RMI_F3A_MAX_GPIO_COUNT		128
> +#define RMI_F3A_MAX_REG_SIZE		DIV_ROUND_UP(RMI_F3A_MAX_GPIO_COUNT,
> 8)
> +
> +/* Defs for Query 0 */
> +#define RMI_F3A_GPIO_COUNT		0x7F
> +
> +#define RMI_F3A_DATA_REGS_MAX_SIZE	RMI_F3A_MAX_REG_SIZE
> +
> +#define TRACKSTICK_RANGE_START		3
> +#define TRACKSTICK_RANGE_END		6
> +
> +struct f3a_data {
> +	/* Query Data */
> +	u8 gpio_count;
> +
> +	u8 register_count;
> +
> +	u8 data_regs[RMI_F3A_DATA_REGS_MAX_SIZE];
> +	u16 *gpio_key_map;
> +
> +	struct input_dev *input;
> +
> +	struct rmi_function *f03;
> +	bool trackstick_buttons;
> +};
> +
> +static void rmi_f3a_report_button(struct rmi_function *fn,
> +				  struct f3a_data *f3a, unsigned int button)
> +{
> +	u16 key_code = f3a->gpio_key_map[button];
> +	bool key_down = !(f3a->data_regs[0] & BIT(button));
> +
> +	if (f3a->trackstick_buttons &&
> +	    button >= TRACKSTICK_RANGE_START &&
> +	    button <= TRACKSTICK_RANGE_END) {
> +		rmi_f03_overwrite_button(f3a->f03, key_code, key_down);
> +	} else {
> +		rmi_dbg(RMI_DEBUG_FN, &fn->dev,
> +			"%s: call input report key (0x%04x) value (0x%02x)",
> +			__func__, key_code, key_down);
> +		input_report_key(f3a->input, key_code, key_down);
> +	}
> +}
> +
> +static irqreturn_t rmi_f3a_attention(int irq, void *ctx)
> +{
> +	struct rmi_function *fn = ctx;
> +	struct f3a_data *f3a = dev_get_drvdata(&fn->dev);
> +	struct rmi_driver_data *drvdata = dev_get_drvdata(&fn->rmi_dev->dev);
> +	int error;
> +	int i;
> +
> +	if (drvdata->attn_data.data) {
> +		if (drvdata->attn_data.size < f3a->register_count) {
> +			dev_warn(&fn->dev,
> +				 "F3A interrupted, but data is missing\n");
> +			return IRQ_HANDLED;
> +		}
> +		memcpy(f3a->data_regs, drvdata->attn_data.data,
> +			f3a->register_count);
> +		drvdata->attn_data.data += f3a->register_count;
> +		drvdata->attn_data.size -= f3a->register_count;
> +	} else {
> +		error = rmi_read_block(fn->rmi_dev, fn->fd.data_base_addr,
> +				f3a->data_regs, f3a->register_count);

Should probably fix the indenting here

> +		if (error) {
> +			dev_err(&fn->dev,
> +				"%s: Failed to read F3a data registers: %d\n",
> +				__func__, error);
> +			return IRQ_RETVAL(error);
> +		}
> +	}
> +
> +

Also get rid of the double whitespace here

> +	for (i = 0; i < f3a->gpio_count; i++)
> +		if (f3a->gpio_key_map[i] != KEY_RESERVED)
> +			rmi_f3a_report_button(fn, f3a, i);
> +	if (f3a->trackstick_buttons)
> +		rmi_f03_commit_buttons(f3a->f03);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int rmi_f3a_config(struct rmi_function *fn)
> +{
> +	struct f3a_data *f3a = dev_get_drvdata(&fn->dev);
> +	struct rmi_driver *drv = fn->rmi_dev->driver;
> +	const struct rmi_device_platform_data *pdata =
> +				rmi_get_platform_data(fn->rmi_dev);

Also fix the indenting here

> +
> +	if (!f3a)
> +		return 0;
> +
> +	if (pdata->gpio_data.trackstick_buttons) {
> +		/* Try [re-]establish link to F03. */
> +		f3a->f03 = rmi_find_function(fn->rmi_dev, 0x03);
> +		f3a->trackstick_buttons = f3a->f03 != NULL;
> +	}
> +
> +	drv->set_irq_bits(fn->rmi_dev, fn->irq_mask);
> +
> +	return 0;
> +}
> +
> +static bool rmi_f3a_is_valid_button(int button, struct f3a_data *f3a,
> +				u8 *query1_regs, u8 *ctrl1_regs)

And here

> +{
> +	/* gpio exist && direction input */
> +	return (query1_regs[0] & BIT(button)) && !(ctrl1_regs[0] &
> BIT(button));
> +}
> +
> +static int rmi_f3a_map_gpios(struct rmi_function *fn, struct f3a_data *f3a,
> +				u8 *query1_regs, u8 *ctrl1_regs)
> +{
> +	const struct rmi_device_platform_data *pdata =
> +					rmi_get_platform_data(fn->rmi_dev);

And here

> +	struct input_dev *input = f3a->input;
> +	unsigned int button = BTN_LEFT;
> +	unsigned int trackstick_button = BTN_LEFT;
> +	bool button_mapped = false;
> +	int i;
> +	int button_count = min_t(u8, f3a->gpio_count, TRACKSTICK_RANGE_END);
> +
> +	f3a->gpio_key_map = devm_kcalloc(&fn->dev,
> +					    button_count,
> +					    sizeof(f3a->gpio_key_map[0]),
> +					    GFP_KERNEL);

And here

> +	if (!f3a->gpio_key_map) {
> +		dev_err(&fn->dev, "Failed to allocate gpio map memory.\n");
> +		return -ENOMEM;
> +	}
> +
> +	for (i = 0; i < button_count; i++) {
> +

Also remove the extra whitespace here

Other then that, everything looks good to me :)

Reviewed-by: Lyude Paul <lyude@redhat.com>

> +		if (!rmi_f3a_is_valid_button(i, f3a, query1_regs, ctrl1_regs))
> +			continue;
> +
> +		if (pdata->gpio_data.trackstick_buttons &&
> +		    i >= TRACKSTICK_RANGE_START && i < TRACKSTICK_RANGE_END) {
> +			f3a->gpio_key_map[i] = trackstick_button++;
> +		} else if (!pdata->gpio_data.buttonpad || !button_mapped) {
> +			f3a->gpio_key_map[i] = button;
> +			input_set_capability(input, EV_KEY, button++);
> +			button_mapped = true;
> +		}
> +	}
> +	input->keycode = f3a->gpio_key_map;
> +	input->keycodesize = sizeof(f3a->gpio_key_map[0]);
> +	input->keycodemax = f3a->gpio_count;
> +
> +	if (pdata->gpio_data.buttonpad || (button - BTN_LEFT == 1))
> +		__set_bit(INPUT_PROP_BUTTONPAD, input->propbit);
> +
> +	return 0;
> +}
> +
> +static int rmi_f3a_initialize(struct rmi_function *fn, struct f3a_data
> *f3a)
> +{
> +	u8 query1[RMI_F3A_MAX_REG_SIZE];
> +	u8 ctrl1[RMI_F3A_MAX_REG_SIZE];
> +	u8 buf;
> +	int error;
> +
> +	error = rmi_read(fn->rmi_dev, fn->fd.query_base_addr, &buf);
> +	if (error < 0) {
> +		dev_err(&fn->dev, "Failed to read general info register:
> %d\n",
> +			error);
> +		return -ENODEV;
> +	}
> +
> +	f3a->gpio_count = buf & RMI_F3A_GPIO_COUNT;
> +	f3a->register_count = DIV_ROUND_UP(f3a->gpio_count, 8);
> +
> +	/* Query1 -> gpio exist */
> +	error = rmi_read_block(fn->rmi_dev, fn->fd.query_base_addr + 1,
> +			       query1, f3a->register_count);
> +	if (error) {
> +		dev_err(&fn->dev, "Failed to read query1 register\n");
> +		return error;
> +	}
> +
> +	/* Ctrl1 -> gpio direction */
> +	error = rmi_read_block(fn->rmi_dev, fn->fd.control_base_addr + 1,
> +			       ctrl1, f3a->register_count);
> +	if (error) {
> +		dev_err(&fn->dev, "Failed to read control1 register\n");
> +		return error;
> +	}
> +
> +	error = rmi_f3a_map_gpios(fn, f3a, query1, ctrl1);
> +	if (error)
> +		return error;
> +	return 0;
> +}
> +
> +static int rmi_f3a_probe(struct rmi_function *fn)
> +{
> +	struct rmi_device *rmi_dev = fn->rmi_dev;
> +	struct rmi_driver_data *drv_data = dev_get_drvdata(&rmi_dev->dev);
> +	struct f3a_data *f3a;
> +	int error;
> +
> +	if (!drv_data->input) {
> +		dev_info(&fn->dev, "F3A: no input device found, ignoring\n");
> +		return -ENXIO;
> +	}
> +
> +	f3a = devm_kzalloc(&fn->dev, sizeof(*f3a), GFP_KERNEL);
> +	if (!f3a)
> +		return -ENOMEM;
> +
> +	f3a->input = drv_data->input;
> +
> +	error = rmi_f3a_initialize(fn, f3a);
> +	if (error)
> +		return error;
> +
> +	dev_set_drvdata(&fn->dev, f3a);
> +	return 0;
> +}
> +
> +struct rmi_function_handler rmi_f3a_handler = {
> +	.driver = {
> +		.name = "rmi4_f3a",
> +	},
> +	.func = 0x3a,
> +	.probe = rmi_f3a_probe,
> +	.config = rmi_f3a_config,
> +	.attention = rmi_f3a_attention,
> +};
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat

