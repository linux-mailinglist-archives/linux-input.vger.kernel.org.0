Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6C5E27F796
	for <lists+linux-input@lfdr.de>; Thu,  1 Oct 2020 03:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgJABpk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 21:45:40 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:43091 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730262AbgJABpj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 21:45:39 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 4FE4C5C01CF;
        Wed, 30 Sep 2020 21:45:38 -0400 (EDT)
Received: from imap4 ([10.202.2.54])
  by compute2.internal (MEProxy); Wed, 30 Sep 2020 21:45:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duggan.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm1; bh=OEvra/kQRMJYU434Z8WtWsoSpFSSkrk
        bWyT4ojkfUVs=; b=gh3QrPhGE2u7Kvg1O5VMLAJ3QNVuiRjHTSfjQK/HZPBfaBT
        XaTfnVosR9rxl2O3TPmV2eyP2wMNR4mGuHx+xTaYowjvGKLOqMkjiR8ln0DP6ZXJ
        EQA/Xc6hXva6T0M77lynKJz8Ka8aytpzeuUaqxEDxJPmgPsgU14X2/mLLSG8rYv8
        AQbY+1PiVRPVy9WP3WrgS4r03lHYhUMv6v8pXwd0803nHHxhkfh5PKaRj6rKg3kO
        p+ln00ADKxGyBiEOwDOng+9YxTQawtboeCnd5hJLBgcBvQ6W6115wYh2p8QAZmWC
        Kkg+NaL1P1TjhzCFu3PY8Q+fTI9ZyhYXGxG678g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=OEvra/
        kQRMJYU434Z8WtWsoSpFSSkrkbWyT4ojkfUVs=; b=AwZUehyrdvchHZP2TeerGQ
        hUrMeNs0IdjckyZwQadcb8A2iwqUsViprNdJoy5GBz+3RI4hUdzlwq1G5lUgC1EQ
        wReaZcTmFT4eQqCumzWl8JrjOVAkSfhIUjSGjoOx7v0zvF1/SqZ+68xT4gyfJCaJ
        +aGiRZVw2OuhCGfHTWMvhmCfxtZKYAs8bOIRjNJWKbFSlPr4ESYzRQOYkAGr3wGM
        hrbAp3EeZmBGG5V142vAGEzEGd83WHEg+x0fa/fhqjWGp8Dfandwk52xSpDuS+fj
        mHpIZ/bD14S3ls0WghqJ5bAAmoMh0ZUaPePTCaehP/X51oScw/L8FQex2J7/OE9w
        ==
X-ME-Sender: <xms:wjR1X7_hLAWo9G_nu86b-WGUL6-XL-XDYWdXP4Zuy2Y3lJSyS4X45A>
    <xme:wjR1X3vU94yYzWkVzTYOh9p7zUNv4jBQEYb3-NvGWUtV1vH6CAhXlXvQcaTnleszt
    ZaEqH2jl156COFcmg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdehudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucffuhhgghgrnhdfuceorghnughrvgifseguuhhgghgrnhdruhhsqeenucggtffrrg
    htthgvrhhnpeevtdfgffetvdfhtdetuddukeeifeekueffkedvudefudehieekheehudei
    veevheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesughughhgrghnrdhush
X-ME-Proxy: <xmx:wjR1X5BSMDFFAO0fpvTpcPrcudS_9wDshm48tbnFXpmM0SjTltym1A>
    <xmx:wjR1X3fzY52JnOuifEpVj7mBHIbIUlE7S-fsO_r3qB5Wb0pEzuqvhg>
    <xmx:wjR1XwNYQ7B3TGivL4wgfSFbFGd0UkGXZZHxBmORJSuubmZC_cq2vw>
    <xmx:wjR1X3dzuxQ4jr665KmMW2A-rjFS4ImvXmdV7DPKfHCU9NTWQnfbOg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id E3B003C0411; Wed, 30 Sep 2020 21:45:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-382-ge235179-fm-20200928.002-ge2351794
Mime-Version: 1.0
Message-Id: <e7a23e34-0fbb-468f-9e87-5d34ec6a3daa@www.fastmail.com>
In-Reply-To: <20200930094147.635556-3-vincent.huang@tw.synaptics.com>
References: <20200930094147.635556-1-vincent.huang@tw.synaptics.com>
 <20200930094147.635556-3-vincent.huang@tw.synaptics.com>
Date:   Wed, 30 Sep 2020 18:45:16 -0700
From:   "Andrew Duggan" <andrew@duggan.us>
To:     "Vincent Huang" <vincent.huang@tw.synaptics.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
        "Jiri Kosina" <jikos@kernel.org>,
        "Andrew Duggan" <aduggan@synaptics.com>,
        "Hans de Goede" <hdegoede@redhat.com>,
        "Benjamin Tissoires" <btissoir@redhat.com>,
        "Lyude Paul" <lyude@redhat.com>,
        "Chris Heiny" <chris.heiny@synaptics.com>
Subject: Re: [PATCH v3 2/2] Input: synaptics-rmi4 - add support for F3A
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On Wed, Sep 30, 2020, at 2:41 AM, Vincent Huang wrote:
> RMI4 F3A supports the touchpad GPIO function, it's designed to
> support more GPIOs and used on newer touchpads. This patch adds
> support of the touchpad buttons.
> 
> Signed-off-by: Vincent Huang <vincent.huang@tw.synaptics.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Andrew Duggan <aduggan@synaptics.com>

> ---
>  drivers/input/rmi4/Kconfig      |   8 ++
>  drivers/input/rmi4/Makefile     |   1 +
>  drivers/input/rmi4/rmi_bus.c    |   3 +
>  drivers/input/rmi4/rmi_driver.h |   1 +
>  drivers/input/rmi4/rmi_f3a.c    | 240 ++++++++++++++++++++++++++++++++
>  5 files changed, 253 insertions(+)
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
> diff --git a/drivers/input/rmi4/rmi_driver.h b/drivers/input/rmi4/rmi_driver.h
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
> index 000000000000..11ff35f811b0
> --- /dev/null
> +++ b/drivers/input/rmi4/rmi_f3a.c
> @@ -0,0 +1,240 @@
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
> +#define RMI_F3A_MAX_REG_SIZE		DIV_ROUND_UP(RMI_F3A_MAX_GPIO_COUNT, 8)
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
> +		button >= TRACKSTICK_RANGE_START &&
> +		button <= TRACKSTICK_RANGE_END) {
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
> +					f3a->data_regs, f3a->register_count);
> +		if (error) {
> +			dev_err(&fn->dev,
> +				"%s: Failed to read F3a data registers: %d\n",
> +				__func__, error);
> +			return IRQ_RETVAL(error);
> +		}
> +	}
> +
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
> +			rmi_get_platform_data(fn->rmi_dev);
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
> +					u8 *query1_regs, u8 *ctrl1_regs)
> +{
> +	/* gpio exist && direction input */
> +	return (query1_regs[0] & BIT(button)) && !(ctrl1_regs[0] & BIT(button));
> +}
> +
> +static int rmi_f3a_map_gpios(struct rmi_function *fn, struct f3a_data *f3a,
> +				u8 *query1_regs, u8 *ctrl1_regs)
> +{
> +	const struct rmi_device_platform_data *pdata =
> +			rmi_get_platform_data(fn->rmi_dev);
> +	struct input_dev *input = f3a->input;
> +	unsigned int button = BTN_LEFT;
> +	unsigned int trackstick_button = BTN_LEFT;
> +	bool button_mapped = false;
> +	int i;
> +	int button_count = min_t(u8, f3a->gpio_count, TRACKSTICK_RANGE_END);
> +
> +	f3a->gpio_key_map = devm_kcalloc(&fn->dev,
> +						button_count,
> +						sizeof(f3a->gpio_key_map[0]),
> +						GFP_KERNEL);
> +	if (!f3a->gpio_key_map) {
> +		dev_err(&fn->dev, "Failed to allocate gpio map memory.\n");
> +		return -ENOMEM;
> +	}
> +
> +	for (i = 0; i < button_count; i++) {
> +		if (!rmi_f3a_is_valid_button(i, f3a, query1_regs, ctrl1_regs))
> +			continue;
> +
> +		if (pdata->gpio_data.trackstick_buttons &&
> +			i >= TRACKSTICK_RANGE_START &&
> +			i < TRACKSTICK_RANGE_END) {
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
> +static int rmi_f3a_initialize(struct rmi_function *fn, struct f3a_data *f3a)
> +{
> +	u8 query1[RMI_F3A_MAX_REG_SIZE];
> +	u8 ctrl1[RMI_F3A_MAX_REG_SIZE];
> +	u8 buf;
> +	int error;
> +
> +	error = rmi_read(fn->rmi_dev, fn->fd.query_base_addr, &buf);
> +	if (error < 0) {
> +		dev_err(&fn->dev, "Failed to read general info register: %d\n",
> +			error);
> +		return -ENODEV;
> +	}
> +
> +	f3a->gpio_count = buf & RMI_F3A_GPIO_COUNT;
> +	f3a->register_count = DIV_ROUND_UP(f3a->gpio_count, 8);
> +
> +	/* Query1 -> gpio exist */
> +	error = rmi_read_block(fn->rmi_dev, fn->fd.query_base_addr + 1,
> +				query1, f3a->register_count);
> +	if (error) {
> +		dev_err(&fn->dev, "Failed to read query1 register\n");
> +		return error;
> +	}
> +
> +	/* Ctrl1 -> gpio direction */
> +	error = rmi_read_block(fn->rmi_dev, fn->fd.control_base_addr + 1,
> +				ctrl1, f3a->register_count);
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
> -- 
> 2.25.1
> 
>
