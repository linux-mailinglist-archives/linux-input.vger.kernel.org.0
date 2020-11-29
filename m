Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4172F2C7B01
	for <lists+linux-input@lfdr.de>; Sun, 29 Nov 2020 20:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728261AbgK2Tki (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Nov 2020 14:40:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgK2Tki (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Nov 2020 14:40:38 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24DDBC0613CF;
        Sun, 29 Nov 2020 11:39:52 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id k11so8697778pgq.2;
        Sun, 29 Nov 2020 11:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X5PsZnvrSFY3MKiXfGpHJag8n848b86EOiCR3yTlAbk=;
        b=HejPVviA2q68gJ3GjoxKOq4fvM8UVpAI9WY0aLffx06RpdX/1U3TPyQrRhGLKQKZ0s
         M2JUTv/TcycG7+huly2Ina1MfODgq2fGBl3HwLAzLdWVdz8uFS5JgWf67Ki33cXJLnhM
         kyZ6ADre1gtGcPd/UzPCNLb8jB86Deje18YOEbCJz2CAX9qOGYahx1R4czdXMivSOHHh
         pjb1H8UhXl4czTuHQJyVABdIq2e30nl78DP+GEI8k3Vet4ZDtg6e4ixQtJga1VF2AZyr
         le9L5cCI7WaYDbx9gZ85pAoVds5O6VEAYYyq1N1XA1RyPjhi2NMuS7mlENCQ1eJL7Myj
         6SNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X5PsZnvrSFY3MKiXfGpHJag8n848b86EOiCR3yTlAbk=;
        b=TJ5kVgxs9y2KFiw0bAK3icE0ssSzKYxAH3zlgFYy3KMJlVADGGsOAQZKMwYQL0nCs4
         YIxcBzHNHcx4GQ5jNx2vT9n8arpMBH5S5YX9FN477007k3VhBNBK5Rfv+T2gjRh06Vby
         Oqxnsdu8IwtJc2mCkwckesFGeBl4wkrwmx47cOj0JPszlG+2YDUikl+wHeblvA4mRrpg
         R0fpHOQdqXowGKGDFQETjApeftyoWL3tRz3ttY5YHy89J5bTYb1U3Qyw7W5gKPuC5e7E
         NOOh9NoaQ0NlL1322sG36yBZaiw2tX8L89jGiJS6Fc5KCAUWQeSrGdMNnQ+inMlSE7ac
         r+UA==
X-Gm-Message-State: AOAM5327Z7wWMnabNIorRKCCHObSZvkxpu84BJXxWRdkPi8UXqJtaSIr
        JErKwW8NUHZpr+MRr74lJEE=
X-Google-Smtp-Source: ABdhPJydF/9gUH2sk2k0Ybj6/1FjEK0s1YXHerhe5ouZkf9mLsD2hBt5g9l73K15d1M+oeydU0YWeQ==
X-Received: by 2002:a62:685:0:b029:198:d4a:5015 with SMTP id 127-20020a6206850000b02901980d4a5015mr15453116pfg.38.1606678791580;
        Sun, 29 Nov 2020 11:39:51 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id g14sm1714635pgp.55.2020.11.29.11.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Nov 2020 11:39:50 -0800 (PST)
Date:   Sun, 29 Nov 2020 11:39:48 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lubomir Rintel <lkundrak@v3.sk>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] Input: add driver for power button on Dell Wyse
 3020
Message-ID: <20201129193948.GK2034289@dtor-ws>
References: <20201129142145.1526022-1-lkundrak@v3.sk>
 <20201129142145.1526022-3-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201129142145.1526022-3-lkundrak@v3.sk>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lubomir,

On Sun, Nov 29, 2020 at 03:21:45PM +0100, Lubomir Rintel wrote:
> This adds support for the power button attached to the Embedded Controller
> on a Dell Wyse 3020 "Ariel" board.
> 
> The Embedded Controller's SPI interface is actually capable sending and
> receiving the PS/2 keyboard and mouse protocol data, which looks like
> a good fit for a serio driver. Howerver, I don't know of any machines where
> this is actually used.
> 
> My board only has a single power button and no way to connect an actual
> keyboard or a mouse. Using the atkbd driver with serio would be an overkill
> and would be inconvenient for the userspace. Therefore this driver
> registers an input device that is only capable of reporting the power
> button presses and releases.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Just a few small comments.

> 
> ---
> Changes since v1:
> - Do away bitfields in order to be endian independent
> 
>  drivers/input/misc/Kconfig           |  11 ++
>  drivers/input/misc/Makefile          |   1 +
>  drivers/input/misc/ariel-pwrbutton.c | 165 +++++++++++++++++++++++++++
>  3 files changed, 177 insertions(+)
>  create mode 100644 drivers/input/misc/ariel-pwrbutton.c
> 
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 362e8a01980cd..e7bb572e15182 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -73,6 +73,17 @@ config INPUT_AD714X_SPI
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called ad714x-spi.
>  
> +config INPUT_ARIEL_PWRBUTTON
> +	tristate "Dell Wyse 3020 Power Button Driver"
> +	depends on SPI
> +	depends on MACH_MMP3_DT || COMPILE_TEST
> +	help
> +	  Say Y to enable support for reporting power button status on
> +	  on Dell Wyse 3020 ("Ariel") thin client.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called ariel-pwrbutton.
> +
>  config INPUT_ARIZONA_HAPTICS
>  	tristate "Arizona haptics support"
>  	depends on MFD_ARIZONA && SND_SOC
> diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
> index a48e5f2d859d4..062cea9f181c9 100644
> --- a/drivers/input/misc/Makefile
> +++ b/drivers/input/misc/Makefile
> @@ -15,6 +15,7 @@ obj-$(CONFIG_INPUT_ADXL34X)		+= adxl34x.o
>  obj-$(CONFIG_INPUT_ADXL34X_I2C)		+= adxl34x-i2c.o
>  obj-$(CONFIG_INPUT_ADXL34X_SPI)		+= adxl34x-spi.o
>  obj-$(CONFIG_INPUT_APANEL)		+= apanel.o
> +obj-$(CONFIG_INPUT_ARIEL_PWRBUTTON)	+= ariel-pwrbutton.o
>  obj-$(CONFIG_INPUT_ARIZONA_HAPTICS)	+= arizona-haptics.o
>  obj-$(CONFIG_INPUT_ATI_REMOTE2)		+= ati_remote2.o
>  obj-$(CONFIG_INPUT_ATLAS_BTNS)		+= atlas_btns.o
> diff --git a/drivers/input/misc/ariel-pwrbutton.c b/drivers/input/misc/ariel-pwrbutton.c
> new file mode 100644
> index 0000000000000..502bc6a65f657
> --- /dev/null
> +++ b/drivers/input/misc/ariel-pwrbutton.c
> @@ -0,0 +1,165 @@
> +// SPDX-License-Identifier: BSD-2-Clause OR GPL-2.0-or-later
> +/*
> + * Dell Wyse 3020 a.k.a. "Ariel" Power Button Driver
> + *
> + * Copyright (C) 2020 Lubomir Rintel
> + */
> +
> +#include <linux/module.h>
> +#include <linux/spi/spi.h>
> +#include <linux/interrupt.h>
> +#include <linux/input.h>

This is very light on includes. Please check what other includes might
be needed (devm_kzalloc? GFP_KERNEL? of_device_id?).

> +
> +#define RESP_COUNTER(response)	(response.header & 0x3)
> +#define RESP_SIZE(response)	((response.header >> 2) & 0x3)
> +#define RESP_TYPE(response)	((response.header >> 4) & 0xf)
> +
> +struct ec_input_response {
> +	u8 reserved;
> +	u8 header;
> +	u8 data[3];
> +} __packed;
> +
> +struct ariel_pwrbutton {
> +	struct spi_device *client;
> +	struct input_dev *input;
> +	u8 msg_counter:2;

I do not think there is any benefit of declaring it as bitfield vs
simply a byte.

> +};
> +
> +static int ec_input_read(struct ariel_pwrbutton *priv,
> +		      struct ec_input_response *response)
> +{
> +	u8 read_request[] = { 0x00, 0x5a, 0xa5, 0x00, 0x00 };
> +	struct spi_device *spi = priv->client;
> +	struct spi_transfer t = {
> +		.tx_buf = read_request,
> +		.rx_buf = response,
> +		.len = sizeof(read_request),
> +	};
> +
> +	compiletime_assert(sizeof(read_request) == sizeof(*response),
> +			   "SPI xfer request/response size mismatch");
> +
> +	return spi_sync_transfer(spi, &t, 1);
> +}
> +
> +static irqreturn_t ec_input_interrupt(int irq, void *dev_id)
> +{
> +	struct ariel_pwrbutton *priv = dev_id;
> +	struct spi_device *spi = priv->client;
> +	struct ec_input_response response;
> +	int i;
> +
> +	if (ec_input_read(priv, &response) < 0) {
> +		dev_err(&spi->dev, "EC read failed.\n");

Might be useful to print error code too.

> +		return IRQ_HANDLED;

Prefer t have single exit in interrupt handlers, so "goto out".

> +	}
> +
> +	if (priv->msg_counter == RESP_COUNTER(response)) {
> +		dev_warn(&spi->dev, "No new data to read?\n");
> +		return IRQ_HANDLED;
> +	}
> +
> +	priv->msg_counter = RESP_COUNTER(response);
> +
> +	if (RESP_TYPE(response) != 0x3 && RESP_TYPE(response) != 0xc) {
> +		dev_dbg(&spi->dev, "Ignoring message that's not kbd data\n");
> +		return IRQ_HANDLED;
> +	}
> +
> +	for (i = 0; i < RESP_SIZE(response); i++) {
> +		dev_err(&spi->dev, "scan code %02x\n", response.data[i]);

dev_dbg() at most.

> +		switch (response.data[i]) {
> +		case 0x74:
> +			input_report_key(priv->input, KEY_POWER, 1);
> +			input_sync(priv->input);
> +			break;
> +		case 0xf4:
> +			input_report_key(priv->input, KEY_POWER, 0);
> +			input_sync(priv->input);
> +			break;
> +		default:
> +			dev_dbg(&spi->dev, "Unknown scan code: %02x\n",
> +				response.data[i]);
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int ariel_pwrbutton_probe(struct spi_device *spi)
> +{
> +	struct ec_input_response response;
> +	struct ariel_pwrbutton *priv;
> +	int ret;
> +
> +	if (!spi->irq) {
> +		dev_err(&spi->dev, "Missing IRQ.\n");
> +		return -ENXIO;

-EINVAL?

> +	}
> +
> +	priv = devm_kzalloc(&spi->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->client = spi;
> +	spi_set_drvdata(spi, priv);
> +
> +	priv->input = devm_input_allocate_device(&spi->dev);
> +	if (!priv->input)
> +		return -ENOMEM;
> +	priv->input->name = "Power Button";
> +	priv->input->dev.parent = &spi->dev;
> +	input_set_capability(priv->input, EV_KEY, KEY_POWER);
> +	ret = input_register_device(priv->input);

Can we please call this variable "error"?

> +	if (ret) {
> +		dev_err(&spi->dev, "error registering input device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = ec_input_read(priv, &response);
> +	if (ret < 0) {
> +		dev_err(&spi->dev, "EC read failed: %d\n", ret);
> +		return ret;
> +	}
> +	priv->msg_counter = RESP_COUNTER(response);
> +
> +	ret = devm_request_threaded_irq(&spi->dev, spi->irq, NULL,
> +					ec_input_interrupt,
> +					IRQF_TRIGGER_RISING | IRQF_ONESHOT,

Let's rely on the platform (ACPI/DT) to specify the interrupt trigger.

> +					"Ariel EC Input", priv);
> +
> +	if (ret) {
> +		dev_err(&spi->dev, "Failed to request IRQ %d: %d\n",
> +			spi->irq, ret);
> +		return ret;
> +	}
> +
> +	dev_info(&spi->dev, "Dell Wyse 3020 Power Button\n");

Input core already prints when a new input device is created, so this is
not needed.

> +	return 0;
> +}
> +
> +static const struct of_device_id ariel_pwrbutton_of_match[] = {
> +	{ .compatible = "dell,wyse-ariel-ec-input" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ariel_pwrbutton_of_match);
> +
> +static const struct spi_device_id ariel_pwrbutton_id_table[] = {
> +	{ "wyse-ariel-ec-input", 0 },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(spi, ariel_pwrbutton_id_table);
> +
> +static struct spi_driver ariel_pwrbutton_driver = {
> +	.driver = {
> +		.name = "dell-wyse-ariel-ec-input",
> +		.of_match_table = ariel_pwrbutton_of_match,
> +	},
> +	.probe = ariel_pwrbutton_probe,
> +};
> +module_spi_driver(ariel_pwrbutton_driver);
> +
> +MODULE_AUTHOR("Lubomir Rintel <lkundrak@v3.sk>");
> +MODULE_DESCRIPTION("Dell Wyse 3020 Power Button Input Driver");
> +MODULE_LICENSE("Dual BSD/GPL");
> -- 
> 2.28.0
> 

Thanks.

-- 
Dmitry
