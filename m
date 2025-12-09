Return-Path: <linux-input+bounces-16489-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5578CAEF30
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 06:36:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26FEC300B917
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 05:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8423D2BDC09;
	Tue,  9 Dec 2025 05:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQjz3AiI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D44274FEB
	for <linux-input@vger.kernel.org>; Tue,  9 Dec 2025 05:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765258515; cv=none; b=K17l8Pie0qKi/MtCOEcWe1N00JbH1UaAaiqPQdOorsYS8hC+M92wwVPa1ZvNt4NZ4m+h6ZbYERSdiYh6wc5mkqLBTLCpxML3t8RHp2Cpsu94cE+HKHPjVo7meBKFwScp7jifPF/y1sysLGETzz7//0b2Ro0SpFD34YRVEdwMaaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765258515; c=relaxed/simple;
	bh=s12Fw0RBi+AYN0WtmkhENhJqPelIHFUDGdHjyhF8VII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPk7AmD1fhm4ARuJGeqdWoq2PXA2FaGrg64pgIIDtgOEMRmsdDyldM8uSSxCLKQVNqVwfUaNsTC2lguv9QCn0COWkZbxOXfkgJj1LiWGPWNQhnGNM7uIf4I2iT8f6ZOEgEIeys94D0hKVmZxe4VUWb6H8OyFoIXr5ZuoHZASNyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQjz3AiI; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-bc2abdcfc6fso3105843a12.2
        for <linux-input@vger.kernel.org>; Mon, 08 Dec 2025 21:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765258513; x=1765863313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DDfwI0TNjfqib2Q2/XRnkkZBlhjSoWkGyeiM4cTKdn8=;
        b=LQjz3AiI1924UzYwYdL6rfcFyjWRTncvUIWIeqaQev3Bw7JZCTHLgc2v6xFIwKKYyh
         e9DsyyYSTWgC7wUfVIx4TFVDPF427kTAh1igs+UMENgNQNP4OAYV5UVGMYymKGVVe40U
         Xv1lRnUpzOp2OJUyN+RlDVooH6XLPZuHmcdRk82uvp/XJC/XHcfIen9ygzUVpU9SCvr6
         SGCXE75ZbfoA51lZ8zHXFqsQPvqgXqa6si/HJchkbXzt2nuVnDeKAaUQh1hW2YnPnEBB
         ySm/qdDF5KUV607ayDsecduI+laAzOZ42IhIRibiyotx412tw4mA9ucSJL+Wwm9p786Y
         RSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765258513; x=1765863313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDfwI0TNjfqib2Q2/XRnkkZBlhjSoWkGyeiM4cTKdn8=;
        b=sOJWmjam3JvdZM6BdDNj1wKb2EoCfcI6THO4YCQUbwzTCe7T5wxcaxyJf1P0Z22mPr
         d2PQoxFAfEHRF4BDV+9kT5n6dcM5fOV3r5iFK2NmDdjvc6xBQgkrwDRPKM96K1OqQU4x
         G3i3wqbn3iFbs1FOPaeWDlnDbZrxh5m0GFIuEKh6E5PHvcV7zvs+q8x9187Iye1Yx5bJ
         Y2FCDTCqUW63E5bQVf0IBa95PN+ElaRlclJM83mHD5uVwI+QY3rCjz+D2bphkcBlxlTH
         D1DilJ+TffZWfY+ZW2enrp3AGWTDEzODIovW1isr8dZ2+keb2RGqslamlfbzYPm95L+1
         bHlg==
X-Forwarded-Encrypted: i=1; AJvYcCU/2DyvmYy4USVa9046wCO3fIgG9ZtIm1kv/0QinTLZrh4Pnrkmk6QKmvGnztsodGDzgzpTqRF6JNSSWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOMWUlMEg0F5ThHeMB8tvpc7eyr7W2jLdCfvgeXSZya07K0iVf
	2oIAw8zs+tDLfUadLbxm3WZc7H/CnpCzjWBbNXrOSCfcihAH1xw9gpPG
X-Gm-Gg: ASbGncvrRUqLZyrt9HzNjRVpxz1K0wnBM+ntRV4TMeLrNr48mkroqrp+HZNNdbW2OVD
	7uYHft6iNvwZzG9TYmShozzaDkwrVgodCbZsblQoZ7YfPRq5E9A2yyu7lTMjiYus8aXxbqM39hk
	8h304DxO94XcpNpVicPgIyogos2DHVPDBlxPOQZka0+vniHQC500bPyqD0Z5K57yEWO9bsdh9+i
	pyXYx7GIGb53zH9VOEtDBOtth9LoIQJb6Mr6ZlL0F4a//sPzhb6DaQKZESPdzOyBNvHWAxW5RT7
	9Fne/Bbx52rNqByL/Igq+2cMF8Wf8wndIOfjE+hO3JueflzNyZRSgEv9zo+/2SnaghbBLu8Jhgw
	92owMNOixrRa5lhNJDaAhHe96GjbA7FNPWbdO3aF08H7qiasUfoCD1dUoxgdO5gPzvTxNaJqTXh
	97I6mwMC5j/5d4U78skdaG50qsVlhrdJdZ9LfVMuB2l+hoIDgbdX+UceCCUwl5XE4=
X-Google-Smtp-Source: AGHT+IHu0dN0o61FhbayVvNcqso/wb/7JAb5WQklwPBNNluMt28FIgpUrlCRIYhMu7903qiqAhBbxw==
X-Received: by 2002:a05:7022:618a:b0:11b:d4a8:d244 with SMTP id a92af1059eb24-11e03260cd2mr7295756c88.16.1765258512282;
        Mon, 08 Dec 2025 21:35:12 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:bf2e:ccbe:6eae:cfa7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76ff44asm73013891c88.9.2025.12.08.21.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 21:35:11 -0800 (PST)
Date: Mon, 8 Dec 2025 21:35:09 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hendrik Noack <hendrik-noack@gmx.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: Add support for Wacom W9000-series penabled
 touchscreens
Message-ID: <k5rhkjmttba4aznb3xa44pqaxepsfkbe5ap6g2ln3rcgunvkky@262tpqra76v7>
References: <20251205152858.14415-1-hendrik-noack@gmx.de>
 <20251205164952.17709-1-hendrik-noack@gmx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205164952.17709-1-hendrik-noack@gmx.de>

Hi Hendrik,

On Fri, Dec 05, 2025 at 05:49:52PM +0100, Hendrik Noack wrote:
> Add driver for two Wacom W9007A variants. These are penabled touchscreens
> supporting passive Wacom Pens and use I2C.
> 
> Signed-off-by: Hendrik Noack <hendrik-noack@gmx.de>
> ---
>  drivers/input/touchscreen/Kconfig       |  12 +
>  drivers/input/touchscreen/Makefile      |   1 +
>  drivers/input/touchscreen/wacom_w9000.c | 480 ++++++++++++++++++++++++
>  3 files changed, 493 insertions(+)
>  create mode 100644 drivers/input/touchscreen/wacom_w9000.c
> 
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index 7d5b72ee07fa..40f7af0a681a 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -610,6 +610,18 @@ config TOUCHSCREEN_WACOM_I2C
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called wacom_i2c.
>  
> +config TOUCHSCREEN_WACOM_W9000
> +	tristate "Wacom W9000-series penabled touchscreen (I2C)"
> +	depends on I2C
> +	help
> +	  Say Y here if you have a Wacom W9000-series penabled I2C touchscreen.
> +	  This driver supports model W9007A.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called wacom_w9000.
> +
>  config TOUCHSCREEN_LPC32XX
>  	tristate "LPC32XX touchscreen controller"
>  	depends on ARCH_LPC32XX
> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> index ab9abd151078..aa3915df83b2 100644
> --- a/drivers/input/touchscreen/Makefile
> +++ b/drivers/input/touchscreen/Makefile
> @@ -102,6 +102,7 @@ tsc2007-$(CONFIG_TOUCHSCREEN_TSC2007_IIO)	+= tsc2007_iio.o
>  obj-$(CONFIG_TOUCHSCREEN_TSC2007)	+= tsc2007.o
>  obj-$(CONFIG_TOUCHSCREEN_WACOM_W8001)	+= wacom_w8001.o
>  obj-$(CONFIG_TOUCHSCREEN_WACOM_I2C)	+= wacom_i2c.o
> +obj-$(CONFIG_TOUCHSCREEN_WACOM_W9000)	+= wacom_w9000.o
>  obj-$(CONFIG_TOUCHSCREEN_WDT87XX_I2C)	+= wdt87xx_i2c.o
>  obj-$(CONFIG_TOUCHSCREEN_WM831X)	+= wm831x-ts.o
>  obj-$(CONFIG_TOUCHSCREEN_WM97XX)	+= wm97xx-ts.o
> diff --git a/drivers/input/touchscreen/wacom_w9000.c b/drivers/input/touchscreen/wacom_w9000.c
> new file mode 100644
> index 000000000000..05c928646bc3
> --- /dev/null
> +++ b/drivers/input/touchscreen/wacom_w9000.c
> @@ -0,0 +1,480 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Wacom W9000-series penabled I2C touchscreen driver
> + *
> + * Copyright (c) 2025 Hendrik Noack <hendrik-noack@gmx.de>
> + *
> + * Partially based on vendor driver:
> + *	Copyright (C) 2012, Samsung Electronics Co. Ltd.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/unaligned.h>
> +
> +// Message length

Prefer C-style comments /* */

> +#define COM_COORD_NUM_MAX	12
> +#define COM_QUERY_NUM_MAX	9

What does "COM" stand for?
> +
> +// Commands
> +#define COM_QUERY		0x2a
> +
> +struct wacom_w9000_variant {
> +	int com_coord_num;

unsigned?

> +	int com_query_num;
> +	char *name;

const?

> +};
> +
> +struct wacom_w9000_data {
> +	struct i2c_client *client;
> +	struct input_dev *input_dev;
> +	const struct wacom_w9000_variant *variant;
> +	unsigned int fw_version;
> +
> +	struct touchscreen_properties prop;
> +	unsigned int max_pressure;
> +
> +	struct regulator *regulator;
> +
> +	struct gpio_desc *flash_mode_gpio;
> +	struct gpio_desc *pen_inserted_gpio;
> +
> +	unsigned int irq;
> +	unsigned int pen_insert_irq;
> +
> +	bool pen_inserted;
> +	bool pen_proximity;
> +};
> +
> +static int wacom_w9000_read(struct i2c_client *client, u8 command, int len, char *data)
> +{
> +	struct i2c_msg xfer[2];

	struct i2c_msg xfer[] = {
		{
			.addr = client->addr,
			.buf = &comand,
			.len = sizeof(command),
		},
		{
			...
		},
	};
> +	bool retried = false;
> +	int ret;
> +
> +	/* Write register */
> +	xfer[0].addr = client->addr;
> +	xfer[0].flags = 0;
> +	xfer[0].len = 1;
> +	xfer[0].buf = &command;
> +
> +	/* Read data */
> +	xfer[1].addr = client->addr;
> +	xfer[1].flags = I2C_M_RD;
> +	xfer[1].len = len;
> +	xfer[1].buf = data;
> +
> +retry:

Why do we need a retry? Is it because the controller might be asleep?
If so can we wake it up explicitly?

> +	ret = i2c_transfer(client->adapter, xfer, 2);
> +	if (ret == 2) {

ARRAY_SIZE(xfer)

> +		ret = 0;
> +	} else if (!retried) {
> +		retried = true;
> +		goto retry;
> +	} else {
> +		if (ret >= 0)
> +			ret = -EIO;
> +		dev_err(&client->dev, "%s: i2c transfer failed (%d)\n", __func__, ret);
> +	}
> +
> +	return ret;
> +}
> +
> +static int wacom_w9000_query(struct wacom_w9000_data *wacom_data)
> +{
> +	struct i2c_client *client = wacom_data->client;
> +	struct device *dev = &wacom_data->client->dev;
> +	bool retried = false;
> +	int ret;
> +	u8 data[COM_QUERY_NUM_MAX];
> +
> +retry:
> +	ret = wacom_w9000_read(client, COM_QUERY, wacom_data->variant->com_query_num, data);
> +	if (ret)
> +		return ret;
> +
> +	if (data[0] == 0x0f) {
> +		wacom_data->fw_version = get_unaligned_be16(&data[7]);
> +	} else if (!retried) {
> +		retried = true;
> +		goto retry;
> +	} else {
> +		return -EIO;
> +	}
> +
> +	dev_dbg(dev, "query: %X, %X, %X, %X, %X, %X, %X, %X, %X, %d\n", data[0], data[1], data[2],
> +		data[3], data[4], data[5], data[6], data[7], data[8], retried);

Please print hex data with "%*ph".

> +
> +	wacom_data->prop.max_x = get_unaligned_be16(&data[1]);
> +	wacom_data->prop.max_y = get_unaligned_be16(&data[3]);
> +	wacom_data->max_pressure = get_unaligned_be16(&data[5]);
> +
> +	dev_dbg(dev, "max_x:%d, max_y:%d, max_pressure:%d, fw:0x%X", wacom_data->prop.max_x,

fw: %#X

> +		wacom_data->prop.max_y, wacom_data->max_pressure,
> +		wacom_data->fw_version);
> +
> +	return 0;
> +}
> +
> +static void wacom_w9000_coord(struct wacom_w9000_data *wacom_data)
> +{
> +	struct i2c_client *client = wacom_data->client;
> +	struct device *dev = &wacom_data->client->dev;
> +	int ret;
> +	u8 data[COM_COORD_NUM_MAX];
> +	bool touch, rubber, side_button;
> +	u16 x, y, pressure;
> +	u8 distance;
> +
> +	ret = i2c_master_recv(client, data, wacom_data->variant->com_coord_num);
> +	if (ret != wacom_data->variant->com_coord_num) {
> +		if (ret >= 0)
> +			ret = -EIO;
> +		dev_err(dev, "%s: i2c receive failed (%d)\n", __func__, ret);
> +		return;
> +	}
> +
> +	dev_dbg(dev, "data: %X, %X, %X, %X, %X, %X, %X, %X, %X, %X, %X, %X", data[0], data[1],
> +		data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9], data[10],
> +		data[11]);

"data: %*ph"

> +
> +	if (data[0] & BIT(7)) {
> +		wacom_data->pen_proximity = 1;

= true

> +
> +		touch = !!(data[0] & BIT(4));
> +		side_button = !!(data[0] & BIT(5));
> +		rubber = !!(data[0] & BIT(6));
> +
> +		x = get_unaligned_be16(&data[1]);
> +		y = get_unaligned_be16(&data[3]);
> +		pressure = get_unaligned_be16(&data[5]);
> +		distance = data[7];
> +
> +		if (!((x <= wacom_data->prop.max_x) && (y <= wacom_data->prop.max_y))) {

Too many parens. Also maybe

		if (x > wacom_data->prop.max_x || y > wacom_data->prop.max_y)

> +			dev_warn(dev, "Coordinates out of range x=%d, y=%d", x, y);
> +			return;
> +		}
> +
> +		touchscreen_report_pos(wacom_data->input_dev, &wacom_data->prop, x, y, false);
> +		input_report_abs(wacom_data->input_dev, ABS_PRESSURE, pressure);
> +		input_report_abs(wacom_data->input_dev, ABS_DISTANCE, distance);
> +		input_report_key(wacom_data->input_dev, BTN_STYLUS, side_button);
> +		input_report_key(wacom_data->input_dev, BTN_TOUCH, touch);
> +		input_report_key(wacom_data->input_dev, BTN_TOOL_PEN, !rubber);
> +		input_report_key(wacom_data->input_dev, BTN_TOOL_RUBBER, rubber);
> +		input_sync(wacom_data->input_dev);
> +	} else {
> +		if (wacom_data->pen_proximity) {

Can be collapsed "else if"

> +			input_report_abs(wacom_data->input_dev, ABS_PRESSURE, 0);
> +			input_report_abs(wacom_data->input_dev, ABS_DISTANCE, 0);
> +			input_report_key(wacom_data->input_dev, BTN_STYLUS, 0);
> +			input_report_key(wacom_data->input_dev, BTN_TOUCH, 0);
> +			input_report_key(wacom_data->input_dev, BTN_TOOL_PEN, 0);
> +			input_report_key(wacom_data->input_dev, BTN_TOOL_RUBBER, 0);
> +			input_sync(wacom_data->input_dev);
> +
> +			wacom_data->pen_proximity = 0;

= false

> +		}
> +	}
> +}
> +
> +static irqreturn_t wacom_w9000_interrupt(int irq, void *dev_id)
> +{
> +	struct wacom_w9000_data *wacom_data = dev_id;
> +
> +	wacom_w9000_coord(wacom_data);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t wacom_w9000_interrupt_pen_insert(int irq, void *dev_id)
> +{
> +	struct wacom_w9000_data *wacom_data = dev_id;
> +	struct device *dev = &wacom_data->client->dev;
> +	int ret;

	int error;

> +
> +	wacom_data->pen_inserted = gpiod_get_value(wacom_data->pen_inserted_gpio);

This runs in a thread, use "can sleep" variant.

> +
> +	input_report_switch(wacom_data->input_dev, SW_PEN_INSERTED, wacom_data->pen_inserted);
> +	input_sync(wacom_data->input_dev);
> +
> +	if (!wacom_data->pen_inserted && !regulator_is_enabled(wacom_data->regulator)) {

What if the regulator is shared with something else? You should not
operate based on the state, just do what you need (i.e. enable or
disable).

> +		ret = regulator_enable(wacom_data->regulator);
> +		if (ret) {
> +			dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +			return IRQ_HANDLED;
> +		}
> +		msleep(200);
> +		enable_irq(wacom_data->irq);
> +	} else if (wacom_data->pen_inserted && regulator_is_enabled(wacom_data->regulator)) {
> +		disable_irq(wacom_data->irq);
> +		regulator_disable(wacom_data->regulator);
> +	}
> +
> +	dev_dbg(dev, "Pen inserted changed to %d", wacom_data->pen_inserted);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int wacom_w9000_open(struct input_dev *dev)
> +{
> +	struct wacom_w9000_data *wacom_data = input_get_drvdata(dev);
> +	int ret;

	int error;

> +
> +	if (!wacom_data->pen_inserted && !regulator_is_enabled(wacom_data->regulator)) {
> +		ret = regulator_enable(wacom_data->regulator);
> +		if (ret) {
> +			dev_err(&wacom_data->client->dev, "Failed to enable regulators: %d\n",
> +				ret);
> +			return ret;
> +		}
> +		msleep(200);
> +		enable_irq(wacom_data->irq);
> +	}
> +	return 0;
> +}
> +
> +static void wacom_w9000_close(struct input_dev *dev)
> +{
> +	struct wacom_w9000_data *wacom_data = input_get_drvdata(dev);
> +
> +	if (regulator_is_enabled(wacom_data->regulator)) {
> +		disable_irq(wacom_data->irq);
> +		regulator_disable(wacom_data->regulator);
> +	}
> +}
> +
> +static int wacom_w9000_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct wacom_w9000_data *wacom_data;
> +	struct input_dev *input_dev;
> +	int ret;

	int error;

> +	u32 val;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> +		dev_err(dev, "i2c_check_functionality error\n");
> +		return -EIO;
> +	}
> +
> +	wacom_data = devm_kzalloc(dev, sizeof(*wacom_data), GFP_KERNEL);
> +	if (!wacom_data)
> +		return -ENOMEM;
> +
> +	wacom_data->variant = i2c_get_match_data(client);
> +
> +	wacom_data->client = client;
> +
> +	input_dev = devm_input_allocate_device(dev);
> +	if (!input_dev)
> +		return -ENOMEM;
> +	wacom_data->input_dev = input_dev;
> +
> +	wacom_data->irq = client->irq;
> +	i2c_set_clientdata(client, wacom_data);
> +
> +	wacom_data->regulator = devm_regulator_get(dev, "vdd");
> +	if (IS_ERR(wacom_data->regulator))
> +		return dev_err_probe(dev, PTR_ERR(wacom_data->regulator),
> +				     "Failed to get regulators\n");
> +
> +	wacom_data->flash_mode_gpio = devm_gpiod_get_optional(dev, "flash-mode", GPIOD_OUT_LOW);
> +	if (IS_ERR(wacom_data->flash_mode_gpio))
> +		return dev_err_probe(dev, PTR_ERR(wacom_data->flash_mode_gpio),
> +				     "Failed to get flash-mode gpio\n");
> +
> +	wacom_data->pen_inserted_gpio = devm_gpiod_get_optional(dev, "pen-inserted", GPIOD_IN);
> +	if (IS_ERR(wacom_data->pen_inserted_gpio))
> +		return dev_err_probe(dev, PTR_ERR(wacom_data->pen_inserted_gpio),
> +				     "Failed to get pen-insert gpio\n");
> +
> +	ret = regulator_enable(wacom_data->regulator);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable regulators\n");
> +
> +	msleep(200);
> +
> +	ret = wacom_w9000_query(wacom_data);
> +	if (ret)
> +		goto err_disable_regulators;

I do not think you need power past this point until you open the device.
Maybe turn it off right here?

> +
> +	input_dev->name = wacom_data->variant->name;
> +	input_dev->id.bustype = BUS_I2C;
> +	input_dev->dev.parent = dev;
> +	input_dev->id.vendor = 0x56a;
> +	input_dev->id.version = wacom_data->fw_version;
> +	input_dev->open = wacom_w9000_open;
> +	input_dev->close = wacom_w9000_close;
> +
> +	input_set_capability(input_dev, EV_KEY, BTN_TOUCH);
> +	input_set_capability(input_dev, EV_KEY, BTN_TOOL_PEN);
> +	input_set_capability(input_dev, EV_KEY, BTN_TOOL_RUBBER);
> +	input_set_capability(input_dev, EV_KEY, BTN_STYLUS);
> +
> +	// Calculate x and y resolution from size in devicetree
> +	ret = device_property_read_u32(dev, "touchscreen-x-mm", &val);
> +	if (ret)
> +		input_abs_set_res(input_dev, ABS_X, 100);

If you do not have resolution data simply do not set it.

> +	else
> +		input_abs_set_res(input_dev, ABS_X, wacom_data->prop.max_x / val);

Don't you parse prop below so here max_x and max_y are both 0?

> +	ret = device_property_read_u32(dev, "touchscreen-y-mm", &val);
> +	if (ret)
> +		input_abs_set_res(input_dev, ABS_Y, 100);
> +	else
> +		input_abs_set_res(input_dev, ABS_Y, wacom_data->prop.max_y / val);
> +
> +	input_set_abs_params(input_dev, ABS_X, 0, wacom_data->prop.max_x, 4, 0);
> +	input_set_abs_params(input_dev, ABS_Y, 0, wacom_data->prop.max_y, 4, 0);
> +	input_set_abs_params(input_dev, ABS_PRESSURE, 0, wacom_data->max_pressure, 0, 0);
> +	input_set_abs_params(input_dev, ABS_DISTANCE, 0, 255, 0, 0);
> +
> +	touchscreen_parse_properties(input_dev, false, &wacom_data->prop);
> +
> +	ret = devm_request_threaded_irq(dev, wacom_data->irq, NULL, wacom_w9000_interrupt,
> +					IRQF_ONESHOT | IRQF_NO_AUTOEN, client->name, wacom_data);
> +	if (ret) {
> +		dev_err(dev, "Failed to register interrupt\n");
> +		goto err_disable_regulators;
> +	}
> +
> +	if (wacom_data->pen_inserted_gpio) {
> +		input_set_capability(input_dev, EV_SW, SW_PEN_INSERTED);
> +		wacom_data->pen_insert_irq = gpiod_to_irq(wacom_data->pen_inserted_gpio);
> +		ret = devm_request_threaded_irq(dev, wacom_data->pen_insert_irq, NULL,
> +						wacom_w9000_interrupt_pen_insert, IRQF_ONESHOT |
> +						IRQF_NO_AUTOEN | IRQF_TRIGGER_RISING |
> +						IRQF_TRIGGER_FALLING, "wacom_pen_insert",

Rely on DT to define triggers. Use IRQF_ONESHOT only.

> +						wacom_data);
> +		if (ret) {
> +			dev_err(dev, "Failed to register pen-insert interrupt\n");
> +			goto err_disable_regulators;
> +		}
> +
> +		wacom_data->pen_inserted = gpiod_get_value(wacom_data->pen_inserted_gpio);
> +		if (wacom_data->pen_inserted)
> +			regulator_disable(wacom_data->regulator);
> +		else
> +			enable_irq(wacom_data->irq);
> +	} else {
> +		enable_irq(wacom_data->irq);

Can this be moved into "open"?

> +	}
> +
> +	input_set_drvdata(input_dev, wacom_data);
> +
> +	input_report_switch(wacom_data->input_dev, SW_PEN_INSERTED, wacom_data->pen_inserted);
> +	input_sync(wacom_data->input_dev);
> +
> +	if (wacom_data->pen_inserted_gpio)
> +		enable_irq(wacom_data->pen_insert_irq);
> +
> +	ret = input_register_device(wacom_data->input_dev);
> +	if (ret) {
> +		dev_err(dev, "Failed to register input device: %d\n", ret);
> +		goto err_disable_regulators;
> +	}
> +
> +	return 0;
> +
> +err_disable_regulators:
> +	regulator_disable(wacom_data->regulator);
> +	return ret;
> +}
> +
> +static void wacom_w9000_remove(struct i2c_client *client)
> +{
> +	struct wacom_w9000_data *wacom_data = i2c_get_clientdata(client);
> +
> +	if (regulator_is_enabled(wacom_data->regulator))
> +		regulator_disable(wacom_data->regulator);

Please move this to "close" and drop wacom_w9000_remove() altogether.

> +}
> +
> +static int wacom_w9000_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct wacom_w9000_data *wacom_data = i2c_get_clientdata(client);
> +	struct input_dev *input_dev = wacom_data->input_dev;
> +
> +	mutex_lock(&input_dev->mutex);

	guard(mutex)(&input_dev->mutex);

> +
> +	if (regulator_is_enabled(wacom_data->regulator)) {
> +		disable_irq(wacom_data->irq);
> +		regulator_disable(wacom_data->regulator);
> +	}
> +
> +	mutex_unlock(&input_dev->mutex);
> +
> +	return 0;
> +}
> +
> +static int wacom_w9000_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct wacom_w9000_data *wacom_data = i2c_get_clientdata(client);
> +	struct input_dev *input_dev = wacom_data->input_dev;
> +	int ret = 0;
> +
> +	mutex_lock(&input_dev->mutex);

	guard(mutex)(&input_dev->mutex);
> +
> +	if (!wacom_data->pen_inserted && !regulator_is_enabled(wacom_data->regulator)) {
> +		ret = regulator_enable(wacom_data->regulator);
> +		if (ret) {
> +			dev_err(&wacom_data->client->dev, "Failed to enable regulators: %d\n",
> +				ret);
> +		} else {
> +			msleep(200);
> +			enable_irq(wacom_data->irq);
> +		}
> +	}
> +
> +	mutex_unlock(&input_dev->mutex);
> +
> +	return ret;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(wacom_w9000_pm, wacom_w9000_suspend, wacom_w9000_resume);
> +
> +static const struct wacom_w9000_variant w9007a_lt03 = {
> +	.com_coord_num	= 8,
> +	.com_query_num	= 9,
> +	.name = "Wacom W9007 LT03 Digitizer",
> +};
> +
> +static const struct wacom_w9000_variant w9007a_v1 = {
> +	.com_coord_num	= 12,
> +	.com_query_num	= 9,
> +	.name = "Wacom W9007 V1 Digitizer",
> +};
> +
> +static const struct of_device_id wacom_w9000_of_match[] = {
> +	{ .compatible = "wacom,w9007a-lt03", .data = &w9007a_lt03, },
> +	{ .compatible = "wacom,w9007a-v1", .data = &w9007a_v1, },
> +	{},

	{ }

No need for trailing comma on a sentinel entry.

> +};
> +MODULE_DEVICE_TABLE(of, wacom_w9000_of_match);
> +
> +static const struct i2c_device_id wacom_w9000_id[] = {
> +	{ .name = "w9007a-lt03", .driver_data = (kernel_ulong_t)&w9007a_lt03 },
> +	{ .name = "w9007a-v1", .driver_data = (kernel_ulong_t)&w9007a_v1 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, wacom_w9000_id);
> +
> +static struct i2c_driver wacom_w9000_driver = {
> +	.driver = {
> +		.name	= "wacom_w9000",
> +		.of_match_table = wacom_w9000_of_match,
> +		.pm	= pm_sleep_ptr(&wacom_w9000_pm),
> +	},
> +	.probe		= wacom_w9000_probe,
> +	.remove		= wacom_w9000_remove,
> +	.id_table	= wacom_w9000_id,
> +};
> +module_i2c_driver(wacom_w9000_driver);
> +
> +/* Module information */
> +MODULE_AUTHOR("Hendrik Noack <hendrik-noack@gmx.de>");
> +MODULE_DESCRIPTION("Wacom W9000-series penabled touchscreen driver");
> +MODULE_LICENSE("GPL");

Thanks.

-- 
Dmitry

