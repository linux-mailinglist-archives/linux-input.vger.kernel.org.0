Return-Path: <linux-input+bounces-3784-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB29D8CC8D8
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 00:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 665F51F23E35
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2024 22:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD27F1465A8;
	Wed, 22 May 2024 22:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="No4jPPKv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ECB5812B;
	Wed, 22 May 2024 22:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716415884; cv=none; b=mOCNz4VaoZvyRInsEbkCTJ34WUvyAN2BgF+XJ6+scE+8zESNFiJhxr8HFfmiSB0/mxLXlyRS6OB9fLdNz+GG4mv1GwpN9O0XZveN4b+Toui1h8wXza43Mi7zkiuDM5Ih8pevIdSpkg5QLjqaurXTXVsUH6q1Uf3iuorY+06cW1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716415884; c=relaxed/simple;
	bh=wemhfEGH6DzE9f8GThONVY29EuvVE4Ff7yRImsYv6hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XX0M0WLwOITSzLvWsatHQnHQTf8EXkXspy/mavrY2Ox9fSBcOjzV9ofz8BVbxlVFVqiRXY4bQDWNi3TnxcbGfDu0GQ0Ul0iWO1mlW2pfErSv9h4CL3wQu+nxRiwTo3++TWu2XYmG9nAHHmwwzDudEX4JJ76bkG2qoxwNePaTzUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=No4jPPKv; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ee0132a6f3so13305975ad.0;
        Wed, 22 May 2024 15:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716415882; x=1717020682; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JGXqzKUUoY3CjLgsq3n/ylcWMU7pfmw7OTkIX2tkooE=;
        b=No4jPPKvaHBLxVooeorZBmEfsomXY3QqOGWKDAmLYlgQdwrsTMDiTJJrjSBHbxg7jL
         mkvxxENR1iN6YTIO6A0GkEiBtJxbKCWugB/ERm4PJAn9zbRfFlUeJ5NQHzwqveR9dnLD
         mSoKl/K7OsIh1W/jqpW/hHka7FvpkX4Ex7CJS3e40Jd+2gw0ZwlDlUCrmspROBLXoLlD
         fRRn0kHO/iitYNYg3ZdnuwhFiHHzIJ8yyv5fo5+t4XtkY1EYutD20Xd+AdxMy+vsOZB/
         ZcOEGv5fzhMJWKglBIHcSHGKvD56PdMCHt9Yhhyv3vh1U21Er/Ux1+49b0e86Te6T7Es
         VEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716415882; x=1717020682;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JGXqzKUUoY3CjLgsq3n/ylcWMU7pfmw7OTkIX2tkooE=;
        b=gZpYVE8YunsKXlu1lWlAKs7kjwjaa7Etuv+YmoqvJLl1zUSmuoTu37mZvsVr6hwbFP
         Lf34VLUlxhwI8m6Cn3cHyK9bAWvUymirtM5tdzmF0VIDIUaekaHUkEVotyx7Y0VsVHHv
         CxyKwmUvpjIQQaJ+U2JM4ySNwB+0xks4Xnw6Z386E7s/KpLgx+9A9H7UGO1LaPyfm8v5
         18wY8DyqXSQgNYyz8bFVnLQMz6t2pN4uPGhkRnGJ09GgHe7YJ/28pNzFtGEiJ07rtYVU
         ed06fHVG5bLggW1FHaFVkqDfini53yKrYDp57DpasctVn5o9MVHntT/UBXGTvdopJtgJ
         xgbg==
X-Forwarded-Encrypted: i=1; AJvYcCVTs1cS08DFc1sZyU/7eOtibtC1Dv3xwIC2wNJTid2AgX60k8Yty955aQssgfv8E5g2bqFKjlBa0lNpuw/agoW0/9wmumxFMDgsI9E9wzfh/83IpTKhB+umTLT1x5dH0j5J5CSLF0ai6g==
X-Gm-Message-State: AOJu0Yz9oaWN7Ihd2AX/jM1r0i9ZGCUcrsNeExHkk1nlH/0mFHxxcKqa
	YqHiuUpXQZZYCHKzV8a38K4yHEBYuYgVSRooVn749Hrj9V0eYP2X
X-Google-Smtp-Source: AGHT+IGSVkkZWLiPrf7B25gqD45RaEmMdC7GHqqqhlVmzF6ojRm44Als601ungpwcXpk1K+9bHh7SA==
X-Received: by 2002:a17:903:2441:b0:1f3:f5c:cd80 with SMTP id d9443c01a7336-1f31c95d4a5mr32277355ad.5.1716415881715;
        Wed, 22 May 2024 15:11:21 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:5e08:5bd9:3a4c:1939])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f307cfbb86sm50584305ad.179.2024.05.22.15.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 15:11:21 -0700 (PDT)
Date: Wed, 22 May 2024 15:11:18 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Oleh Kuzhylnyi <kuzhylol@gmail.com>
Cc: linux-input@vger.kernel.org, jeff@labundy.com,
	neil.armstrong@linaro.org, schnelle@linux.ibm.com, arnd@kernel.org,
	hdegoede@redhat.com, linux-kernel@vger.kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, artur.serhiienko@gmail.com,
	igor.opaniuk@gmail.com
Subject: Re: [PATCH v2 2/2] input: add driver for Hynitron CST816X touchscreen
Message-ID: <Zk5thhaf8WKCyMJG@google.com>
References: <20240522203347.2263425-1-kuzhylol@gmail.com>
 <20240522203347.2263425-2-kuzhylol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240522203347.2263425-2-kuzhylol@gmail.com>

Hi Oleh,

On Wed, May 22, 2024 at 05:33:47PM -0300, Oleh Kuzhylnyi wrote:
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
> Changes in v2:
>  - Apply dev_err_probe() for better error handling
>  - Remove redundant printing, remove dev_warn() message spamming
>  - Get rid of PM since the touchscreen goes into sleep mode automatically
>  - Get rid of IRQ control and IRQF_NO_AUTOEN flag
>  - Reduce timer timeout up to 10ms to handle touch events faster
>  - Skip registering of non-gesture CST816X_SWIPE event
>  - Shift input_register_device() as a final call in probe() callback
>  - Specify name of i2c_device_id explicitly
>  - Update module description and fix typo
>  - Add necessary spaces between lines
> 
>  drivers/input/touchscreen/Kconfig            |  12 +
>  drivers/input/touchscreen/Makefile           |   1 +
>  drivers/input/touchscreen/hynitron-cst816x.c | 306 +++++++++++++++++++
>  3 files changed, 319 insertions(+)
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
> index 000000000000..86715c3d1872
> --- /dev/null
> +++ b/drivers/input/touchscreen/hynitron-cst816x.c
> @@ -0,0 +1,306 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for I2C connected Hynitron CST816X Touchscreen
> + *
> + * Copyright (C) 2024 Oleh Kuzhylnyi <kuzhylol@gmail.com>
> + */
> +#include <linux/module.h>
> +#include <linux/delay.h>
> +#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/interrupt.h>
> +#include <linux/of_irq.h>
> +#include <linux/timer.h>
> +
> +#define CST816X_MAX_X 240
> +#define CST816X_MAX_Y CST816X_MAX_X
> +
> +#define CST816X_EVENT_TIMEOUT_MS 10
> +
> +enum cst816x_registers {
> +	CST816X_FRAME = 0x01,
> +	CST816X_MOTION = 0xEC,
> +};
> +
> +enum cst816_gesture_code {
> +	CST816X_SWIPE = 0x00,
> +	CST816X_SWIPE_UP = 0x01,
> +	CST816X_SWIPE_DOWN = 0x02,
> +	CST816X_SWIPE_LEFT = 0x03,
> +	CST816X_SWIPE_RIGHT = 0x04,
> +	CST816X_SINGLE_TAP = 0x05,
> +	CST816X_DOUBLE_TAP = 0x0B,
> +	CST816X_LONG_PRESS = 0x0C,
> +};
> +
> +struct cst816x_info {
> +	u8 gesture;
> +	u8 x;
> +	u8 y;
> +};
> +
> +struct cst816x_priv {
> +	struct device *dev;
> +	struct i2c_client *client;
> +	struct gpio_desc *reset;
> +	struct input_dev *input;
> +	struct timer_list timer;
> +	struct delayed_work dw;
> +	struct cst816x_info info;
> +
> +	u8 rxtx[8];
> +};
> +
> +struct cst816x_gesture_mapping {
> +	enum cst816_gesture_code gesture_code;
> +	size_t event_code;

Why size_t?

> +};
> +
> +static const struct cst816x_gesture_mapping cst816x_gesture_map[] = {
> +	{CST816X_SWIPE, KEY_UNKNOWN},
> +	{CST816X_SWIPE_UP, KEY_UP},
> +	{CST816X_SWIPE_DOWN, KEY_DOWN},
> +	{CST816X_SWIPE_LEFT, KEY_LEFT},
> +	{CST816X_SWIPE_RIGHT, KEY_RIGHT},
> +	{CST816X_SINGLE_TAP, BTN_TOUCH},
> +	{CST816X_DOUBLE_TAP, BTN_TOOL_DOUBLETAP},
> +	{CST816X_LONG_PRESS, BTN_TOOL_TRIPLETAP}
> +};
> +
> +static int cst816x_i2c_write_reg(struct cst816x_priv *priv, u8 reg, u8 cmd)
> +{
> +	struct i2c_client *client;
> +	struct i2c_msg xfer;
> +	int rc;
> +
> +	client = priv->client;
> +
> +	priv->rxtx[0] = reg;
> +	priv->rxtx[1] = cmd;
> +
> +	xfer.addr = client->addr;
> +	xfer.flags = 0;
> +	xfer.len = 2;
> +	xfer.buf = priv->rxtx;
> +
> +	rc = i2c_transfer(client->adapter, &xfer, 1);
> +	if (rc != 1) {
> +		if (rc >= 0)
> +			rc = -EIO;
> +	} else {
> +		rc = 0;
> +	}
> +
> +	if (rc < 0)
> +		dev_err(&client->dev, "i2c tx err: %d\n", rc);
> +
> +	return rc;
> +}
> +
> +static int cst816x_i2c_read_reg(struct cst816x_priv *priv, u8 reg)
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
> +static int cst816x_setup_regs(struct cst816x_priv *priv)
> +{
> +	return cst816x_i2c_write_reg(priv, CST816X_MOTION, CST816X_DOUBLE_TAP);
> +}
> +
> +static void report_gesture_event(const struct cst816x_priv *priv,
> +				 enum cst816_gesture_code gesture_code,
> +				 bool state)
> +{
> +	const struct cst816x_gesture_mapping *lookup = NULL;
> +
> +	for (u8 i = CST816X_SWIPE_UP; i < ARRAY_SIZE(cst816x_gesture_map); i++) {
> +		if (cst816x_gesture_map[i].gesture_code == gesture_code) {
> +			lookup = &cst816x_gesture_map[i];

Why don't you do

			input_report_key(priv->input,
					 cst816x_gesture_map[i].event_code,
					 state);

right here?i No need for this "lookup" variable.

> +			break;
> +		}
> +	}
> +
> +	if (lookup)
> +		input_report_key(priv->input, lookup->event_code, state);
> +}
> +
> +static int cst816x_process_touch(struct cst816x_priv *priv)
> +{
> +	u8 *raw;
> +	int rc;
> +
> +	rc = cst816x_i2c_read_reg(priv, CST816X_FRAME);
> +	if (!rc) {
> +		raw = priv->rxtx;
> +
> +		priv->info.gesture = raw[0];
> +		priv->info.x = ((raw[2] & 0x0F) << 8) | raw[3];
> +		priv->info.y = ((raw[4] & 0x0F) << 8) | raw[5];
> +
> +		dev_dbg(priv->dev, "x: %d, y: %d, gesture: 0x%x\n",
> +			priv->info.x, priv->info.y, priv->info.gesture);
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
> +	for (u8 i = CST816X_SWIPE_UP; i < ARRAY_SIZE(cst816x_gesture_map); i++) {
> +		input_set_capability(priv->input, EV_KEY,
> +				     cst816x_gesture_map[i].event_code);
> +	}
> +
> +	input_set_abs_params(priv->input, ABS_X, 0, CST816X_MAX_X, 0, 0);
> +	input_set_abs_params(priv->input, ABS_Y, 0, CST816X_MAX_Y, 0, 0);
> +	input_set_capability(priv->input, EV_ABS, ABS_X);
> +	input_set_capability(priv->input, EV_ABS, ABS_Y);

No need for using input_set_capability() in conjunction with
input_set_abs_params().

> +
> +	return input_register_device(priv->input);
> +}
> +
> +static void cst816x_reset(struct cst816x_priv *priv)
> +{
> +	gpiod_set_value_cansleep(priv->reset, 0);
> +	msleep(100);
> +	gpiod_set_value_cansleep(priv->reset, 1);
> +	msleep(100);

This code says that you put reset line into inactive state, wait for
100 msec, and then activate the reset and leave it active (i.e. the
device is inoperable) for the rest of the time.

The reason it is working for you is that you describe the line as
"active high" effectively inverting what the code logically does.
Please fix both the code here and the binding example (and your actual
device tree that you use).

> +}
> +
> +static void cst816x_timer_cb(struct timer_list *timer)
> +{
> +	struct cst816x_priv *priv = from_timer(priv, timer, timer);
> +
> +	report_gesture_event(priv, priv->info.gesture, false);
> +	input_sync(priv->input);
> +}
> +
> +static void cst816x_dw_cb(struct work_struct *work)
> +{
> +	struct cst816x_priv *priv =
> +		container_of(work, struct cst816x_priv, dw.work);
> +
> +	if (!cst816x_process_touch(priv)) {
> +		input_report_abs(priv->input, ABS_X, priv->info.x);
> +		input_report_abs(priv->input, ABS_Y, priv->info.y);
> +		report_gesture_event(priv, priv->info.gesture, true);
> +		input_sync(priv->input);
> +
> +		mod_timer(&priv->timer,
> +			  jiffies + msecs_to_jiffies(CST816X_EVENT_TIMEOUT_MS));
> +	}
> +}
> +
> +static irqreturn_t cst816x_irq_cb(int irq, void *cookie)
> +{
> +	struct cst816x_priv *priv = (struct cst816x_priv *)cookie;
> +
> +	schedule_delayed_work(&priv->dw, 0);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int cst816x_probe(struct i2c_client *client)
> +{
> +	struct cst816x_priv *priv;
> +	struct device *dev = &client->dev;
> +	int rc;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->dev = dev;
> +	priv->client = client;
> +
> +	INIT_DELAYED_WORK(&priv->dw, cst816x_dw_cb);
> +	timer_setup(&priv->timer, cst816x_timer_cb, 0);
> +
> +	priv->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(priv->reset))
> +		return dev_err_probe(dev, PTR_ERR(priv->reset),
> +				     "reset gpio not found\n");
> +
> +	if (priv->reset)
> +		cst816x_reset(priv);
> +
> +	rc = cst816x_setup_regs(priv);
> +	if (rc)
> +		return dev_err_probe(dev, rc, "regs setup failed\n");
> +
> +	client->irq = of_irq_get(dev->of_node, 0);
> +	if (client->irq <= 0)
> +		return dev_err_probe(dev, client->irq, "irq lookup failed\n");

No, leave this to the I2C core to do. Just use client->irq that was set
up for you.

> +
> +	rc = devm_request_threaded_irq(dev, client->irq, NULL, cst816x_irq_cb,
> +				       IRQF_ONESHOT, dev->driver->name, priv);

You have an "oneshot" threaded interrupt that from its handler schedules
work (which then uses timer to reschedule itself). This shows
fundamental misunderstanding of what a threaded interrupt is. They were
specifically introduced so that interrupt handler could interact with
"slow" devices like I2C controllers. You should be able to drop 
the delayed work and the timer.

Does the device signal when finger leaves the surface?

> +	if (rc)
> +		return dev_err_probe(dev, client->irq, "irq request failed\n");
> +
> +	return cst816x_register_input(priv);


u enable interrupt and only then allocate input device. Depending on
scheduling quirks this may blow up. Please allocate the input device
before registering interrupt handler, the rest of the input device
registration is OK to happen afterwards.

> +}
> +
> +static const struct i2c_device_id cst816x_id[] = {
> +	{ .name = "cst816s", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, cst816x_id);
> +
> +static const struct of_device_id cst816x_of_match[] = {
> +	{ .compatible = "hynitron,cst816s", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, cst816x_of_match);
> +
> +static struct i2c_driver cst816x_driver = {
> +	.driver = {
> +		.name = "cst816x",
> +		.of_match_table = cst816x_of_match,
> +	},
> +	.id_table = cst816x_id,
> +	.probe = cst816x_probe,
> +};
> +
> +module_i2c_driver(cst816x_driver);
> +
> +MODULE_AUTHOR("Oleh Kuzhylnyi <kuzhylol@gmail.com>");
> +MODULE_DESCRIPTION("Hynitron CST816X Touchscreen Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.30.2
> 

-- 
Dmitry

