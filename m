Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1F46396D3A
	for <lists+linux-input@lfdr.de>; Tue,  1 Jun 2021 08:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbhFAGUQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Jun 2021 02:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbhFAGUP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Jun 2021 02:20:15 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBD6AC061574;
        Mon, 31 May 2021 23:18:33 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id pi6-20020a17090b1e46b029015cec51d7cdso1228970pjb.5;
        Mon, 31 May 2021 23:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=TAQkCcgm8nZJld9czv/74HZS1nt7FJgNUtwXqioRjFQ=;
        b=BZP9pCTCVlbZgMndbgx0h6MuciaPd9QGccOhIkpNaS+m53rESB+24aR0+Auv/yO4aX
         AhFbVhWh85RH/I7O2J4dxlu8l885e8WQQ49qIdNfEIp2FuqnC+w2pK7zwyzQ3hy4c+oV
         J0vHQYcsxrOVnItYE/nr10kzstzb8e9gr/yVZe9A596WLHbtalqCcqz+ojq9j7/zRBQ2
         9MiVbLgRVUD6PXNTkRhjjt8Y1HbgNDKPIFxxZDyIe3mVjzUNUmYylfzXEfLCaZJj9WUn
         cVttjDSd58trQK6v9LJMaR/O0pH6KQ2KhEz2uYfVq2D1P5qhvNXHERTNnCUGZpTJTv7Q
         H+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TAQkCcgm8nZJld9czv/74HZS1nt7FJgNUtwXqioRjFQ=;
        b=dBFzMSl5AH+vS6GFRT5USOYDAMHIH4ciZl6kbyhEsbn1sprgPHEkZDCbDbhKA1DJAC
         BmLSWfLpe5Py3iYHxWBif93S+eDzLXt64BZip1Hg6HtyYL961H9VUlOygMa5/mENuFCB
         9ErHkTux1RVMAzQy63jp4lUbHQ5qVH5C+Yy+0IhiWo2djJV9VuecnEvZLbSluYp20vpk
         WihSbE3HIjnyHA25S2l0StfO1t91E4mo5p6qp1+HnZirHNa+g1zMHz+MU7EFsF5iOkvD
         tHXjhWgXnSfwkE+5Qbb1gw6xy9xWmGFbz0C8hqc9EAHZHhE4KNpBCkq6U8iAaWWdedPE
         GF1A==
X-Gm-Message-State: AOAM531hadiM8mv1UZ+D5zpzOBNNrTFVCtJNjFhWwBnE0z7RgFV/oB4p
        2gIqF3DqdmkqUOBx8ithbus=
X-Google-Smtp-Source: ABdhPJx/IT3Y2DPkvvKJxMgW/m4mrehx+iYxeesAAvQu2ntSxMjqxXkTNaa54K8398HMxUQOjwj+Sg==
X-Received: by 2002:a17:90b:1d89:: with SMTP id pf9mr3162627pjb.26.1622528312490;
        Mon, 31 May 2021 23:18:32 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:f313:c4c:d05e:895b])
        by smtp.gmail.com with ESMTPSA id c190sm3770978pfc.26.2021.05.31.23.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 23:18:31 -0700 (PDT)
Date:   Mon, 31 May 2021 23:18:29 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Oleh Kravchenko <oleg@kaa.org.ua>, Rob Herring <robh@kernel.org>
Cc:     linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Device Tree mailing list <devicetree@vger.kernel.org>,
        Jiri Kosina <jikos@jikos.cz>,
        Patchwork Bot <patchwork-bot@kernel.org>
Subject: Re: [PATCH] input: add SparkFun Qwiic Joystick driver
Message-ID: <YLXRNVBG0ewhVUxD@google.com>
References: <20210531133243.9488-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210531133243.9488-1-oleg@kaa.org.ua>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Oleh,

On Mon, May 31, 2021 at 04:32:43PM +0300, Oleh Kravchenko wrote:
> A simple analog joystick built on Low Power ATtiny85 Microcontroller.
> Directional movements are measured with two 10 kΩ potentiometers
> connected with a gimbal mechanism that separates the horizontal and
> vertical movements. This joystick also has a select button that is actuated
> when the joystick is pressed down.
> 
> Input events polled over the I2C bus.

Thank you for the driver.

> 
> Product page:
> https://www.sparkfun.com/products/15168
> Firmware and hardware sources:
> https://github.com/sparkfun/Qwiic_Joystick
> 
> Tested on RPi4B and O4-iMX-NANO boards.
> 
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: Device Tree mailing list <devicetree@vger.kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Jiri Kosina <jikos@jikos.cz>
> Cc: Patchwork Bot <patchwork-bot@kernel.org>
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>  .../bindings/input/qwiic-joystick.yaml        |  31 ++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  drivers/input/joystick/Kconfig                |   9 +
>  drivers/input/joystick/Makefile               |   1 +
>  drivers/input/joystick/qwiic-joystick.c       | 169 ++++++++++++++++++
>  5 files changed, 212 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/qwiic-joystick.yaml
>  create mode 100644 drivers/input/joystick/qwiic-joystick.c
> 
> diff --git a/Documentation/devicetree/bindings/input/qwiic-joystick.yaml b/Documentation/devicetree/bindings/input/qwiic-joystick.yaml
> new file mode 100644
> index 000000000000..51cadeb350f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/qwiic-joystick.yaml
> @@ -0,0 +1,31 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +# Copyright 2021 Oleh Kravchenko
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/input/qwiic-joystick.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: SparkFun Qwiic Joystick
> +
> +maintainers:
> +  - Oleh Kravchenko <oleg@kaa.org.ua>
> +
> +description: |
> +  Bindings for SparkFun Qwiic Joystick (COM-15168).
> +  https://www.sparkfun.com/products/15168
> +
> +properties:
> +  compatible:
> +    const: sparkfun,qwiic-joystick

Rob, is this compatible acceptable?

> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    qwiic@20 {
> +        compatible = "sparkfun,qwiic-joystick";
> +        reg = <0x20>;
> +    };

I think this device would be covered by
Documentation/devicetree/bindings/trivial-devices.yaml so please add its
compatible there.

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 944b02bb96d7..a5631e68f5d1 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1060,6 +1060,8 @@ patternProperties:
>      description: Sony Corporation
>    "^spansion,.*":
>      description: Spansion Inc.
> +  "^sparkfun,.*":
> +    description: SparkFun Electronics

This should be a separate patch, please also send to Rob Herring and
device tree list.

>    "^sprd,.*":
>      description: Spreadtrum Communications Inc.
>    "^sst,.*":
> diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
> index 5e38899058c1..7dfe8ea90923 100644
> --- a/drivers/input/joystick/Kconfig
> +++ b/drivers/input/joystick/Kconfig
> @@ -372,6 +372,15 @@ config JOYSTICK_PXRC
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called pxrc.
>  
> +config JOYSTICK_QWIIC
> +	tristate "SparkFun Qwiic Joystick"
> +	depends on I2C
> +	help
> +	  Say Y here if you want to use the SparkFun Qwiic Joystick.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called qwiic-joystick.
> +
>  config JOYSTICK_FSIA6B
>  	tristate "FlySky FS-iA6B RC Receiver"
>  	select SERIO
> diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Makefile
> index 31d720c9e493..5174b8aba2dd 100644
> --- a/drivers/input/joystick/Makefile
> +++ b/drivers/input/joystick/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_JOYSTICK_MAPLE)		+= maplecontrol.o
>  obj-$(CONFIG_JOYSTICK_N64)		+= n64joy.o
>  obj-$(CONFIG_JOYSTICK_PSXPAD_SPI)	+= psxpad-spi.o
>  obj-$(CONFIG_JOYSTICK_PXRC)		+= pxrc.o
> +obj-$(CONFIG_JOYSTICK_QWIIC)		+= qwiic-joystick.o
>  obj-$(CONFIG_JOYSTICK_SIDEWINDER)	+= sidewinder.o
>  obj-$(CONFIG_JOYSTICK_SPACEBALL)	+= spaceball.o
>  obj-$(CONFIG_JOYSTICK_SPACEORB)		+= spaceorb.o
> diff --git a/drivers/input/joystick/qwiic-joystick.c b/drivers/input/joystick/qwiic-joystick.c
> new file mode 100644
> index 000000000000..9b7ab0dd1218
> --- /dev/null
> +++ b/drivers/input/joystick/qwiic-joystick.c
> @@ -0,0 +1,169 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2021 Oleh Kravchenko <oleg@kaa.org.ua>
> +
> +/*
> + * SparkFun Qwiic Joystick
> + * Product page:https://www.sparkfun.com/products/15168
> + * Firmware and hardware sources:https://github.com/sparkfun/Qwiic_Joystick
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/module.h>
> +
> +#define QWIIC_JSK_REG_VERS	0
> +#define QWIIC_JSK_REG_DATA	3
> +
> +#define QWIIC_JSK_MAX_AXIS	GENMASK(10, 0)
> +#define QWIIC_JSK_FUZZ		2
> +#define QWIIC_JSK_FLAT		2
> +
> +struct qwiic_jsk {
> +	char			phys[32];
> +	struct input_dev	*dev;
> +	struct i2c_client	*i2c;
> +};
> +
> +struct qwiic_ver {
> +	u8 addr;
> +	u8 major;
> +	u8 minor;
> +} __packed;

There is no reason to declare structure containing only bytes as packed.

> +
> +struct qwiic_data {
> +	u8 hx;
> +	u8 lx;
> +	u8 hy;
> +	u8 ly;
> +	u8 thumb;
> +} __packed;
> +
> +static void qwiic_poll(struct input_dev *input)
> +{
> +	struct qwiic_jsk	*priv;
> +	struct qwiic_data	data;
> +	int			ret;
> +	int			x, y, btn;
> +
> +	priv = input_get_drvdata(input);
> +
> +	ret = i2c_smbus_read_i2c_block_data(priv->i2c, QWIIC_JSK_REG_DATA,
> +					    sizeof(data), (u8 *)&data);
> +	if (ret == sizeof(data)) {
> +		x = (data.hx << 8 | data.lx) >> 6;

Why not define data as a u8 array, and then do

		u16 x = be16_to_cpup(data) >> 6;
		u16 y = be16_to_cpup(data + 2) >> 6;

Or declare coordinates as __be16 in qwiic_data (and use be16_to_cpu when
accessing).

> +		y = (data.hy << 8 | data.ly) >> 6;
> +		btn = !!!data.thumb;

Triple negation is too much, one should be enough.

> +
> +		input_report_abs(input, ABS_X, x);
> +		input_report_abs(input, ABS_Y, y);
> +		input_report_key(input, BTN_THUMBL, btn);
> +
> +		input_sync(input);
> +	}
> +}
> +
> +static int qwiic_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
> +{
> +	struct qwiic_jsk	*priv;
> +	struct qwiic_ver	vers;
> +	int			ret;
> +
> +	ret = i2c_smbus_read_i2c_block_data(i2c, QWIIC_JSK_REG_VERS,
> +					    sizeof(vers), (u8 *)&vers);
> +	if (ret != sizeof(vers)) {
> +		ret = -EIO;
> +		goto err;
> +	}
> +
> +	if (i2c->addr != vers.addr) {
> +		dev_err(&i2c->dev, "address doesn't match!\n");
> +		ret = -ENODEV;
> +		goto err;
> +	}
> +
> +	dev_info(&i2c->dev, "SparkFun Qwiic Joystick, FW: %d.%d\n",
> +		 vers.major, vers.minor);

Preference is not to be too noisy, please change to dev_dbg().

> +
> +	priv = devm_kzalloc(&i2c->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv) {
> +		ret = -ENOMEM;

Return -ENOMEM directly, no need to use labels when you do not need to
do any cleanup by hand.

> +		goto err;
> +	}
> +
> +	priv->i2c = i2c;
> +	snprintf(priv->phys, sizeof(priv->phys), "i2c/%s", dev_name(&i2c->dev));
> +	i2c_set_clientdata(i2c, priv);
> +
> +	priv->dev = devm_input_allocate_device(&i2c->dev);
> +	if (!priv->dev) {
> +		dev_err(&i2c->dev, "failed to allocate input device\n");
> +		ret = -ENOMEM;
> +		goto err;
> +	}
> +
> +	priv->dev->dev.parent = &i2c->dev;

Done by devm_input_allocate_device(), please drop.

> +	priv->dev->id.bustype = BUS_I2C;
> +	priv->dev->name = "SparkFun Qwiic Joystick";
> +	priv->dev->phys = priv->phys;
> +	input_set_drvdata(priv->dev, priv);
> +
> +	input_set_abs_params(priv->dev, ABS_X, 0, QWIIC_JSK_MAX_AXIS,
> +			     QWIIC_JSK_FUZZ, QWIIC_JSK_FLAT);
> +	input_set_abs_params(priv->dev, ABS_Y, 0, QWIIC_JSK_MAX_AXIS,
> +			     QWIIC_JSK_FUZZ, QWIIC_JSK_FLAT);
> +	input_set_capability(priv->dev, EV_KEY, BTN_THUMBL);
> +
> +	ret = input_setup_polling(priv->dev, qwiic_poll);

Please call variables that carry error code or 0 "error" and not "ret".

> +	if (ret) {
> +		dev_err(&i2c->dev, "failed to set up polling: %d\n", ret);
> +		goto err;
> +	}
> +	input_set_poll_interval(priv->dev, 16);
> +	input_set_min_poll_interval(priv->dev, 8);
> +	input_set_max_poll_interval(priv->dev, 32);
> +
> +	ret = input_register_device(priv->dev);
> +	if (ret)
> +		dev_err(&i2c->dev, "failed to register joystick: %d\n", ret);
> +
> +err:
> +	return ret;
> +}
> +
> +static int qwiic_remove(struct i2c_client *i2c)
> +{
> +	struct qwiic_jsk *priv;
> +
> +	priv = i2c_get_clientdata(i2c);
> +	input_unregister_device(priv->dev);

Since you are using devm_input_allocate_device() you do not need to
manually unregister it, it will be done automatically. Drop this and you
can remove qwiic_remove() altogether.

> +
> +	return 0;
> +}
> +
> +static const struct of_device_id of_qwiic_match[] = {
> +	{ .compatible = "sparkfun,qwiic-joystick", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, of_qwiic_match);
> +
> +static const struct i2c_device_id qwiic_id_table[] = {
> +	{ KBUILD_MODNAME, 0 },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, qwiic_id_table);
> +
> +static struct i2c_driver qwiic_driver = {
> +	.driver = {
> +		.name		= KBUILD_MODNAME,
> +		.of_match_table	= of_match_ptr(of_qwiic_match),

You either need to guard of_qwiic_match with #ifdef CONFIG_OF, or drop
of_match_ptr() and assign of_match_table directly, otherwise for certain
configs you may get "defined but not used" warning.

> +	},
> +	.id_table	= qwiic_id_table,
> +	.probe		= qwiic_probe,
> +	.remove		= qwiic_remove,
> +};
> +module_i2c_driver(qwiic_driver);
> +
> +MODULE_AUTHOR("Oleh Kravchenko <oleg@kaa.org.ua>");
> +MODULE_DESCRIPTION("SparkFun Qwiic Joystick driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.26.3
> 

Thanks.

-- 
Dmitry
