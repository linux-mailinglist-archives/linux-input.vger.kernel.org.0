Return-Path: <linux-input+bounces-5255-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AE794367B
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 21:33:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCDF328162D
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 19:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0E53A8F0;
	Wed, 31 Jul 2024 19:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VH1JEJ1o"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D951401B;
	Wed, 31 Jul 2024 19:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722454407; cv=none; b=oEqdOyoFiQgNFfBIX+Uh/qcSS2vaGlSr5Ne/7dAtpX6TsoeuegV+t18yvoPm3nl74kQWZZ0N8bStkUYr8ZhyKbOY+zXTyWuF10qAki0NTAqQ/bI0996AgVkrGIuqoOTNvxsEA12qSwwLaEP/rdsjqKYdadWSqLUd9oiPXOMsG/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722454407; c=relaxed/simple;
	bh=jUGtGlNxJo209TPhf0xKsBpaNEHA/P4q+MVQHbvwUNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=quxS6ZpzVxS8PdtDgVd3/UeAreNflx5tJqPhTSFsBR35mJaAENdXX6FMWxR776blMUKefKQy1fFU2QY0f77+kaRxt47zBIBUQ5NZA3HL8G7OD/QIShna1OoiYZW01RzUMjy0jvgBeKSblKBYKMWQiPxCuiZOxaEgsvb8TK+beQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VH1JEJ1o; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fda7fa60a9so56039245ad.3;
        Wed, 31 Jul 2024 12:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722454405; x=1723059205; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hqHLrJnOro9TKsWWtTd0iLC5rBOmar4o6YJWpTnBD0A=;
        b=VH1JEJ1o1SLIr0pbaHD9SPYGzNTaAmYoUNZ1/WiDqxEgmT6/DXr2Huq8QPX/sZEP7O
         ml/Zc0is36zx0cnW3Ds/6UkzZNW6MfKFzLWJpff3IclaytZmje5EuXm2nuZRQSsgHhi3
         qsf+1aicQnS41gkv7+CcmmW2BxorJwipkiYYsMagZTGF/wtROrAuTD4UGmHSoG4UJ5sn
         7GZop8k2/iVgJnqKMD5OoSIAQVZYCXNnimc/a7sWfpxQDmgguzMn7q4bRzMWqzoRbmTb
         1BOeMVGAJdWChnAKt6PHWBCTrZA720ZNVsnc9oINyL8qGDqcnd+uOx/cG/k43prBHznO
         UpLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722454405; x=1723059205;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hqHLrJnOro9TKsWWtTd0iLC5rBOmar4o6YJWpTnBD0A=;
        b=StQ+4tL+8zzYrlDaAUsUd1MqIeJJvoZ3nP4E5azIXo5VACYNon+mbNZjBInjsjyYxS
         rvvz4D/YlUxp8ZSA3OGKGYGSyvUWuAPZt+wI8H3I8bBD7sEn4avthNkWbTK+IqQPH6jM
         J13E7ns8wQeMt7GfvAplro3Ch/MJ0guI1VZ9vDsFWswBCfp1y6eRKkpKr6pqh0B/DGxj
         eUyCYz292ODXQS49+hVzISJvmfcH1UHnytiC4DfeCEOLAapB9aNqsX0yfu3dlJs9CTrr
         zK8HVmje0VLr+kumtkWAHPkGLzBiwO11LHgfadw4xq3qJxhBb1uqMab+ncjV0+BJohFf
         gqag==
X-Forwarded-Encrypted: i=1; AJvYcCWVUKOq7IIz2Z67CBMrMbjNP28aWmF/vghY2YsBYF2yZ6sonOGVSpxOgcO94ftCzbJcH35CYibmKLlo1e1lkoK4VAVaGj/KTJAkIFW34ds7YBGgSaE6M6WfhIxPPfeq/ksL1vcHGJW9pA==
X-Gm-Message-State: AOJu0YxfJkNSvc/QdpKNB3jtcxF6xCU78Rs3+venJR5XvfbIJGA6H+jy
	WlYuMUOmEP88iP91ra8qJVub9t76gC9Egnp38v0CFVUuiNsTwEzE
X-Google-Smtp-Source: AGHT+IFxT6TI2pPBIxCArKvG/ma5R4jUBmKO3a8h9MsXmv9Yh6szV0xh/f9f/xDvZhoId/8njPiVQg==
X-Received: by 2002:a17:902:c641:b0:1fc:5fc9:84bc with SMTP id d9443c01a7336-1ff4d257b35mr3032135ad.62.1722454405358;
        Wed, 31 Jul 2024 12:33:25 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1da7:72de:e91f:aa85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7cde45csm123907415ad.77.2024.07.31.12.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 12:33:25 -0700 (PDT)
Date: Wed, 31 Jul 2024 12:33:22 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Oleh Kuzhylnyi <kuzhylol@gmail.com>
Cc: linux-input@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, jeff@labundy.com,
	neil.armstrong@linaro.org, hdegoede@redhat.com,
	artur.serhiienko@gmail.com, igor.opaniuk@gmail.com
Subject: Re: [PATCH v3 2/2] input: add driver for Hynitron CST816X touchscreen
Message-ID: <ZqqRgnxZBW0nGTpF@google.com>
References: <20240526212443.8496-1-kuzhylol@gmail.com>
 <20240526212443.8496-2-kuzhylol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240526212443.8496-2-kuzhylol@gmail.com>

Hi Oleh,

On Sun, May 26, 2024 at 11:24:42PM +0200, Oleh Kuzhylnyi wrote:
> Introduce support for the Hynitron CST816X touchscreen controller
> used for 240×240 1.28-inch Round LCD Display Module manufactured
> by Waveshare Electronics. The driver is designed based on an Arduino
> implementation marked as under MIT License. This driver is written
> for a particular round display based on the CST816S controller, which
> is not compatiable with existing driver for Hynitron controllers.
> 
> Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
> ---
> 
> Changes in v3:
>  - Drop timer and delayed work
>  - Process touch in threaded IRQ context
>  - Fix chip reset sequence
>  - Move input_register() before devm_request_threaded_irq()
>  - Re-arrange and document input reporting
>  - Set u16 data type for event_code
>  - Remove double tap event to prevent continuous double side sliding
> 
>  drivers/input/touchscreen/Kconfig            |  12 +
>  drivers/input/touchscreen/Makefile           |   1 +
>  drivers/input/touchscreen/hynitron-cst816x.c | 257 +++++++++++++++++++
>  3 files changed, 270 insertions(+)
>  create mode 100644 drivers/input/touchscreen/hynitron-cst816x.c
> 
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index c821fe3ee794..02f40d0fbac0 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -481,6 +481,18 @@ config TOUCHSCREEN_HYNITRON_CSTXXX
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called hynitron-cstxxx.
>  
> +config TOUCHSCREEN_HYNITRON_CST816X
> +	tristate "Hynitron CST816X touchscreen support"
> +	depends on I2C
> +	help
> +	  Say Y here if you have a touchscreen using a Hynitron
> +	  CST816X touchscreen controller.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called hynitron-cst816x.
> +
>  config TOUCHSCREEN_ILI210X
>  	tristate "Ilitek ILI210X based touchscreen"
>  	depends on I2C
> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> index a81cb5aa21a5..a92a87417a97 100644
> --- a/drivers/input/touchscreen/Makefile
> +++ b/drivers/input/touchscreen/Makefile
> @@ -51,6 +51,7 @@ obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_CORE)	+= goodix_berlin_core.o
>  obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_I2C)	+= goodix_berlin_i2c.o
>  obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_SPI)	+= goodix_berlin_spi.o
>  obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
> +obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CST816X)	+= hynitron-cst816x.o
>  obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX)	+= hynitron_cstxxx.o
>  obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
>  obj-$(CONFIG_TOUCHSCREEN_ILITEK)	+= ilitek_ts_i2c.o
> diff --git a/drivers/input/touchscreen/hynitron-cst816x.c b/drivers/input/touchscreen/hynitron-cst816x.c
> new file mode 100644
> index 000000000000..5bb85ec1d60e
> --- /dev/null
> +++ b/drivers/input/touchscreen/hynitron-cst816x.c
> @@ -0,0 +1,257 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for I2C connected Hynitron CST816X Touchscreen
> + *
> + * Copyright (C) 2024 Oleh Kuzhylnyi <kuzhylol@gmail.com>
> + */
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +
> +enum cst816x_registers {
> +	CST816X_FRAME = 0x01,
> +	CST816X_MOTION = 0xEC,
> +};
> +
> +enum cst816x_gestures {
> +	CST816X_SWIPE_UP = 0x01,
> +	CST816X_SWIPE_DOWN = 0x02,
> +	CST816X_SWIPE_LEFT = 0x03,
> +	CST816X_SWIPE_RIGHT = 0x04,
> +	CST816X_SINGLE_TAP = 0x05,
> +	CST816X_LONG_PRESS = 0x0C,
> +};
> +
> +struct cst816x_touch_info {
> +	u8 gesture;
> +	u8 touch;
> +	u8 abs_x;

Is this the right size? You are doing:

		priv->info.abs_x = ((raw[2] & 0x0F) << 8) | raw[3];


Which suggests it should be u16?


> +	u8 abs_y;
> +} __packed;

Why does this need to be __packed?

> +
> +struct cst816x_priv {
> +	struct device *dev;
> +	struct i2c_client *client;
> +	struct gpio_desc *reset;
> +	struct input_dev *input;
> +	struct cst816x_touch_info info;

Why do you need to have this here? It is tiny and does not need to be
kept around, just use on stack variable.

> +
> +	u8 rxtx[8];
> +};
> +
> +struct cst816x_event_mapping {
> +	enum cst816x_gestures gesture;
> +	u16 event_code;
> +};
> +
> +static const struct cst816x_event_mapping cst816x_event_map[] = {
> +	{CST816X_SWIPE_UP, BTN_FORWARD},
> +	{CST816X_SWIPE_DOWN, BTN_BACK},
> +	{CST816X_SWIPE_LEFT, BTN_LEFT},
> +	{CST816X_SWIPE_RIGHT, BTN_RIGHT},
> +	{CST816X_SINGLE_TAP, BTN_TOUCH},
> +	{CST816X_LONG_PRESS, BTN_TOOL_TRIPLETAP}
> +};
> +
> +static int cst816x_i2c_read_register(struct cst816x_priv *priv, u8 reg)

Maybe supply buffer and size as arguments?

> +{
> +	struct i2c_client *client;
> +	struct i2c_msg xfer[2];
> +	int rc;
> +
> +	client = priv->client;
> +
> +	xfer[0].addr = client->addr;
> +	xfer[0].flags = 0;
> +	xfer[0].len = sizeof(reg);
> +	xfer[0].buf = &reg;
> +
> +	xfer[1].addr = client->addr;
> +	xfer[1].flags = I2C_M_RD;
> +	xfer[1].len = sizeof(priv->rxtx);
> +	xfer[1].buf = priv->rxtx;
> +
> +	rc = i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
> +	if (rc != ARRAY_SIZE(xfer)) {
		error = rc >= 0 ? -EIO : rc;
		dev_err(...);
		return error;
	}

	return 0;

> +		if (rc >= 0)
> +			rc = -EIO;
> +	} else {
> +		rc = 0;
> +	}
> +
> +	if (rc < 0)
> +		dev_err(&client->dev, "i2c rx err: %d\n", rc);
> +
> +	return rc;
> +}
> +
> +static int cst816x_process_touch(struct cst816x_priv *priv)
> +{
> +	u8 *raw;
> +	int rc;
> +
> +	rc = cst816x_i2c_read_register(priv, CST816X_FRAME);
> +	if (!rc) {
> +		raw = priv->rxtx;
> +
> +		priv->info.gesture = raw[0];
> +		priv->info.touch = raw[1];
> +		priv->info.abs_x = ((raw[2] & 0x0F) << 8) | raw[3];
> +		priv->info.abs_y = ((raw[4] & 0x0F) << 8) | raw[5];
> +
> +		dev_dbg(priv->dev, "x: %d, y: %d, t: %d, g: 0x%x\n",
> +			priv->info.abs_x, priv->info.abs_y, priv->info.touch,
> +			priv->info.gesture);
> +	}
> +
> +	return rc;
> +}
> +
> +static int cst816x_register_input(struct cst816x_priv *priv)
> +{
> +	priv->input = devm_input_allocate_device(priv->dev);
> +	if (!priv->input)
> +		return -ENOMEM;
> +
> +	priv->input->name = "Hynitron CST816X Touchscreen";
> +	priv->input->phys = "input/ts";
> +	priv->input->id.bustype = BUS_I2C;
> +	input_set_drvdata(priv->input, priv);
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(cst816x_event_map); i++) {
> +		input_set_capability(priv->input, EV_KEY,
> +				     cst816x_event_map[i].event_code);
> +	}
> +
> +	input_set_abs_params(priv->input, ABS_X, 0, 240, 0, 0);
> +	input_set_abs_params(priv->input, ABS_Y, 0, 240, 0, 0);
> +
> +	return input_register_device(priv->input);
> +}
> +
> +static void cst816x_reset(struct cst816x_priv *priv)
> +{
> +	gpiod_set_value_cansleep(priv->reset, 1);
> +	msleep(50);
> +	gpiod_set_value_cansleep(priv->reset, 0);
> +	msleep(100);
> +}
> +
> +static void report_gesture_event(const struct cst816x_priv *priv,
> +				 enum cst816x_gestures gesture, bool touch)
> +{
> +	for (unsigned int i = 0; i < ARRAY_SIZE(cst816x_event_map); i++) {
> +		if (cst816x_event_map[i].gesture == gesture) {
> +			input_report_key(priv->input,
> +					 cst816x_event_map[i].event_code,
> +					 touch);

If you make cst816x_event_map an array of 16 entries with unised
positions mapped to KEY_RESERVED you can do:

	key = cst816x_event_map[raw[0] & 0x0f];
	if (key != KEY_RESERVED)
		input_report_key(priv->input, key, touch);

and you do not need to loop.

Thanks.

-- 
Dmitry

