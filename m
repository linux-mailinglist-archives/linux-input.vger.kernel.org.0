Return-Path: <linux-input+bounces-8268-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 390289DA444
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 10:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE9D0281E5B
	for <lists+linux-input@lfdr.de>; Wed, 27 Nov 2024 09:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C2E1547E3;
	Wed, 27 Nov 2024 09:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QMB8cufs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7207013D278;
	Wed, 27 Nov 2024 09:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732698025; cv=none; b=L57DjY0ZQC7MFPmhKL2XZ+tnLwDTfRUAPq7Ofsf9DHGYh69e2mt5280oHlVXkxqqleDl4h5ZPX6SnDRMLqnFOPgn6OBBwe7UKGMwRQg3ekNQdCKm6IrpNjj0WMMzhhSFDaB+vOCW9vJaAcR1QkE8GO8NNKBLcBwoh3wAMbgDtQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732698025; c=relaxed/simple;
	bh=skOG+mShRmZEUftI8NfzklM92Fji6/eTdCiEyIalZAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5DHdehMGzpJlXEFW353xqgGRr+TYixo3skNJ2xkz3eSb/KvWPBIbY9hcoy35W0seDCMl+tPBGW3oeIn2EscXl0nK3EW9k+9wCqmCQY7vGzV8gRP5pddRUELX6nHE10F34nDR8VeC6whd7tZJUlL3ERGqO9FB6Kj7A+tquA3wZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QMB8cufs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3606FC4CED3;
	Wed, 27 Nov 2024 09:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732698025;
	bh=skOG+mShRmZEUftI8NfzklM92Fji6/eTdCiEyIalZAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QMB8cufs71rrLPIEQ4bVG2jDaYfa8StaN0GAOpQA1h/fdinByMiftHdvjWLQhO5lw
	 DaYLtwMXqd9YYEjCnRzjPYPKexatzVpXXOYRP+UhdLbpoIVn+4NrUHW9WcoOOObvaH
	 Hm5Ykm2Cs3XtT5AG4f8TEtQVHojz5rsBWMqX9EWlbiIPSWfDYTITc+DJSVBcFQdOWu
	 1SitDC+yOjFQAiJPONQqDTTlKPgxNQU4ag02HsFv7mg8gX8/GH4ZfSs40/iiH47l5h
	 TV3qw0cMe/ygKN9VeppUKg3RsWJ/fxXZ/L6T/3y1sx6GEeKj0nYbRP9dWJsFaIs27F
	 K2/Wj2uKNYwMA==
Date: Wed, 27 Nov 2024 10:00:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 2/4] input: apple_z2: Add a driver for Apple Z2
 touchscreens
Message-ID: <27amnmlm52igidlv23h3d3bvaezbdumedfkqicbtreka3llhqs@fafepduxgv43>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
 <20241126-z2-v1-2-c43c4cc6200d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241126-z2-v1-2-c43c4cc6200d@gmail.com>

On Tue, Nov 26, 2024 at 09:48:00PM +0100, Sasha Finkelstein wrote:
> +static int apple_z2_boot(struct apple_z2 *z2)
> +{
> +	int timeout;
> +
> +	enable_irq(z2->spidev->irq);
> +	gpiod_direction_output(z2->reset_gpio, 0);
> +	timeout = wait_for_completion_timeout(&z2->boot_irq, msecs_to_jiffies(20));
> +	if (timeout == 0)
> +		return -ETIMEDOUT;
> +	return apple_z2_upload_firmware(z2);
> +}
> +
> +static int apple_z2_open(struct input_dev *dev)
> +{
> +	struct apple_z2 *z2 = input_get_drvdata(dev);
> +	int error;
> +
> +	/* Reset the device on boot */
> +	gpiod_direction_output(z2->reset_gpio, 1);
> +	usleep_range(5000, 10000);
> +	error = apple_z2_boot(z2);
> +	if (error) {
> +		gpiod_direction_output(z2->reset_gpio, 1);

This is less readable code. Each function should clean up its own stuff,
so if z2_boot() de-asserted the reset, then z2_boot() should clean up by
asserting again, not expecting the caller to do this.

> +		disable_irq(z2->spidev->irq);
> +	} else
> +		z2->open = 1;
> +	return error;
> +}
> +
> +static void apple_z2_close(struct input_dev *dev)
> +{
> +	struct apple_z2 *z2 = input_get_drvdata(dev);
> +
> +	disable_irq(z2->spidev->irq);
> +	gpiod_direction_output(z2->reset_gpio, 1);
> +	z2->open = 0;
> +	z2->booted = 0;
> +}
> +
> +static int apple_z2_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct apple_z2 *z2;
> +	int error;
> +	const char *label;
> +	struct touchscreen_properties props;
> +
> +	z2 = devm_kzalloc(dev, sizeof(*z2), GFP_KERNEL);
> +	if (!z2)
> +		return -ENOMEM;
> +
> +	z2->spidev = spi;
> +	init_completion(&z2->boot_irq);
> +	spi_set_drvdata(spi, z2);
> +
> +	z2->cs_gpio = devm_gpiod_get_index(dev, "cs", 0, 0);
> +	if (IS_ERR(z2->cs_gpio)) {
> +		if (PTR_ERR(z2->cs_gpio) != -ENOENT) {
> +			dev_err(dev, "unable to get cs");
> +			return PTR_ERR(z2->cs_gpio);
> +		}
> +		z2->cs_gpio = NULL;
> +	}
> +
> +	z2->reset_gpio = devm_gpiod_get_index(dev, "reset", 0, 0);
> +	if (IS_ERR(z2->reset_gpio)) {
> +		dev_err(dev, "unable to get reset");

Syntax is: return dev_err_probe, almost everywhere here.

> +		return PTR_ERR(z2->reset_gpio);
> +	}
> +
> +	error = devm_request_threaded_irq(dev, z2->spidev->irq, NULL,
> +					apple_z2_irq, IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +					"apple-z2-irq", spi);
> +	if (error < 0) {
> +		dev_err(dev, "unable to request irq");
> +		return z2->spidev->irq;
> +	}
> +
> +	error = device_property_read_string(dev, "label", &label);
> +	if (error) {
> +		dev_err(dev, "unable to get device name");
> +		return error;
> +	}
> +
> +	error = device_property_read_string(dev, "firmware-name", &z2->fw_name);
> +	if (error) {
> +		dev_err(dev, "unable to get firmware name");
> +		return error;
> +	}
> +
> +	z2->cal_blob = of_get_property(dev->of_node, "apple,z2-cal-blob", &z2->cal_size);

There is no such property.

You cannot sneak undocumented properties.

> +	if (!z2->cal_blob) {
> +		dev_warn(dev, "unable to get calibration, precision may be degraded");
> +		z2->cal_size = 0;
> +	}
> +
> +	z2->input_dev = devm_input_allocate_device(dev);
> +	if (!z2->input_dev)
> +		return -ENOMEM;
> +	z2->input_dev->name = label;
> +	z2->input_dev->phys = "apple_z2";
> +	z2->input_dev->dev.parent = dev;
> +	z2->input_dev->id.bustype = BUS_SPI;
> +	z2->input_dev->open = apple_z2_open;
> +	z2->input_dev->close = apple_z2_close;
> +
> +	/* Allocate the axes before setting from DT */
> +	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_X, 0, 0, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_POSITION_Y, 0, 0, 0, 0);
> +	touchscreen_parse_properties(z2->input_dev, true, &props);
> +	z2->y_size = props.max_y;
> +	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_X, 100);
> +	input_abs_set_res(z2->input_dev, ABS_MT_POSITION_Y, 100);
> +	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MAJOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_WIDTH_MINOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MAJOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_TOUCH_MINOR, 0, 65535, 0, 0);
> +	input_set_abs_params(z2->input_dev, ABS_MT_ORIENTATION, -32768, 32767, 0, 0);
> +
> +	input_set_drvdata(z2->input_dev, z2);
> +
> +	error = input_mt_init_slots(z2->input_dev, 256, INPUT_MT_DIRECT);
> +	if (error < 0) {
> +		dev_err(dev, "unable to initialize multitouch slots");
> +		return error;
> +	}
> +
> +	error = input_register_device(z2->input_dev);
> +	if (error < 0)
> +		dev_err(dev, "unable to register input device");
> +
> +	return error;
> +}
> +
> +static const struct of_device_id apple_z2_of_match[] = {
> +	{ .compatible = "apple,z2-multitouch" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, apple_z2_of_match);
> +
> +static struct spi_device_id apple_z2_of_id[] = {
> +	{ .name = "j293-touchbar" },
> +	{ .name = "j493-touchbar" },
> +	{ .name = "z2-touchbar" },

You should not need all these above.

> +	{ .name = "z2-multitouch" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(spi, apple_z2_of_id);
> +
> +static struct spi_driver apple_z2_driver = {
> +	.driver = {
> +		.name	= "apple-z2",
> +		.owner = THIS_MODULE,

Drop, this is some very old code. All owners were removed ~10 or more
years ago. This suggests you took some old or poorly maintained driver
as a template, thus you duplicate all the issues we already fixed.

> +		.of_match_table = of_match_ptr(apple_z2_of_match),

Drop of_match_ptr(), you have a warning here.

> +	},
> +	.id_table       = apple_z2_of_id,
> +	.probe		= apple_z2_probe,

Best regards,
Krzysztof


