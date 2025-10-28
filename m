Return-Path: <linux-input+bounces-15773-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E8AC135B3
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 08:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AB5C3A8869
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 07:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62442522B6;
	Tue, 28 Oct 2025 07:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J7wTQJBM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99AA246327;
	Tue, 28 Oct 2025 07:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761637472; cv=none; b=EfC4SzAAmcy+zARopGzs0wBR3NfeEJz9ftZc3xSugOB1+Q7mGqCAHxopsvZCEJnsUczUI1oJTumlrrA6K7C9A0fY4lEBxKzpS7e6TKocSETR0haFNpXjdE1njYZQNo8pB1/G0GI5WQsOR8nrv73s1rHksLozq2cnxpD8QDF30rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761637472; c=relaxed/simple;
	bh=YXqqogna4bjxa87gUSQ3LoothM+n/ooF9pmD23UAoNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkkGyld5CPXOh+wFg0ydaxRsmdhsGLNS4o1DsyQIop5bW3WcQD2lcm4RahicqbuEla8qESwDqr2axkdK2VPor7yPTySpYxxx3odDOyY22Sw0/eP3QlVEJg25w8Fz06G199/DoWBC0nzYV27UdMfJPdDqltGyd0ZiYmR5f573Uj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J7wTQJBM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FDE3C4CEE7;
	Tue, 28 Oct 2025 07:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761637472;
	bh=YXqqogna4bjxa87gUSQ3LoothM+n/ooF9pmD23UAoNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J7wTQJBMi1MddVroYp0XMNLYU/cSWcXeac0KFlOU/6w/JlzTS8rZepK2EIvEwU9lX
	 iUoX7diHBlW/srgZFF9unQ7p8fJjkGDQ2RQA/nS8cW/ljy8vow5TPPmNLa5XcJ9KpN
	 sKDu+KFiuESbCp6IjoQjW1h7AaY0G9im6dGLyHG0jZewzgJ+Kp/sAiiv+WW8KAudrq
	 L407U30fri8Su1l2cAmU3c1r/TRgkB0SQu0RN/xotRIM2+vgSqLCkw18k+amW0LkU8
	 VcudTyeJTCzJUMFdQvTVkUvrCEFwh3mm3cNo4902j5Shj04P4FkvgwZKFH5X8Nd0hE
	 flB2fqieru2kg==
Date: Tue, 28 Oct 2025 08:44:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hendrik Noack <hendrik-noack@gmx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: Add support for Wacom W9000-series penabled
 touchscreens
Message-ID: <20251028-funky-rose-rook-3ccab5@kuoka>
References: <20251027164050.113623-1-hendrik-noack@gmx.de>
 <20251027212535.4078-1-hendrik-noack@gmx.de>
 <20251027212535.4078-2-hendrik-noack@gmx.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251027212535.4078-2-hendrik-noack@gmx.de>

On Mon, Oct 27, 2025 at 10:25:35PM +0100, Hendrik Noack wrote:
> +
> +static const struct of_device_id wacom_w9000_of_match[] = {
> +	{ .compatible = "wacom,w9007a_lt03", .data = &wacom_w9007a_lt03, },
> +	{ .compatible = "wacom,w9007a_v1", .data = &wacom_w9007a_v1, },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, wacom_w9000_of_match);

This goes next to other ID table, around the probe.

> +
> +static int wacom_w9000_read(struct i2c_client *client, u8 command, int len, char *data)
> +{
> +	struct i2c_msg xfer[2];
> +	bool retried = false;
> +	int ret;
> +

...

> +
> +static int wacom_w9000_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct wacom_w9000_data *wacom_data;
> +	struct input_dev *input_dev;
> +	int ret;
> +	u32 val;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> +		dev_err(dev, "i2c_check_functionality error\n");
> +		return -EIO;
> +	}
> +
> +	wacom_data = devm_kzalloc(dev, sizeof(struct wacom_w9000_data), GFP_KERNEL);

sizeof(*)

Please use existing kernel coding style, not some downstream version.

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
> +	if (IS_ERR(wacom_data->regulator)) {
> +		ret = PTR_ERR(wacom_data->regulator);
> +		dev_err(dev, "Failed to get regulators %d\n", ret);
> +		return ret;

Nope. Look at all other drivers. Syntax is since some years return
dev_err_probe.

> +	}
> +
> +	/* Request flash-mode line and don't go into flash mode */
> +	wacom_data->flash_mode_gpio = devm_gpiod_get_optional(dev, "flash-mode", GPIOD_OUT_LOW);
> +	if (IS_ERR(wacom_data->flash_mode_gpio)) {
> +		ret = PTR_ERR(wacom_data->flash_mode_gpio);
> +		dev_err(dev, "Failed to get flash-mode gpio: %d\n", ret);
> +		return ret;

You must handle deferred probe. Please look at all other drivers how
they do it.

> +	}
> +
> +	/* Request pdct line  */
> +	wacom_data->pen_detect_gpio = devm_gpiod_get_optional(dev, "pdct", GPIOD_IN);
> +	if (IS_ERR(wacom_data->pen_detect_gpio)) {
> +		ret = PTR_ERR(wacom_data->pen_detect_gpio);
> +		dev_err(dev, "Failed to get pdct gpio: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Request pen-insert line  */
> +	wacom_data->pen_inserted_gpio = devm_gpiod_get_optional(dev, "pen-inserted", GPIOD_IN);
> +	if (IS_ERR(wacom_data->pen_inserted_gpio)) {
> +		ret = PTR_ERR(wacom_data->pen_inserted_gpio);
> +		dev_err(dev, "Failed to get pen-insert gpio: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_enable(wacom_data->regulator);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	msleep(200);
> +
> +	ret = wacom_w9000_query(wacom_data);
> +	if (ret)
> +		goto err_disable_regulators;
> +
> +	input_dev->name = wacom_data->variant->name;
> +	input_dev->id.bustype = BUS_I2C;
> +	input_dev->dev.parent = dev;
> +	input_dev->id.vendor = 0x56a;
> +	input_dev->id.version = wacom_data->fw_version;
> +	input_dev->open = wacom_w9000_open;
> +	input_dev->close = wacom_w9000_close;
> +
> +	__set_bit(EV_KEY, input_dev->evbit);
> +	__set_bit(EV_ABS, input_dev->evbit);
> +	__set_bit(BTN_TOUCH, input_dev->keybit);
> +	__set_bit(BTN_TOOL_PEN, input_dev->keybit);
> +	__set_bit(BTN_TOOL_RUBBER, input_dev->keybit);
> +	__set_bit(BTN_STYLUS, input_dev->keybit);
> +
> +	// Calculate x and y resolution from size in devicetree
> +	ret = device_property_read_u32(dev, "touchscreen-x-mm", &val);
> +	if (ret)
> +		input_abs_set_res(input_dev, ABS_X, 100);
> +	else
> +		input_abs_set_res(input_dev, ABS_X, wacom_data->prop.max_x / val);
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
> +	if (wacom_data->pen_detect_gpio) {
> +		wacom_data->pen_detect_irq = gpiod_to_irq(wacom_data->pen_detect_gpio);

Why is this a GPIO? Your binding said this is GPIO, your code says this
is an interrupt.

> +		ret = devm_request_threaded_irq(dev, wacom_data->pen_detect_irq, NULL,
> +						wacom_w9000_interrupt_pen_detect, IRQF_ONESHOT |
> +						IRQF_NO_AUTOEN | IRQF_TRIGGER_RISING |
> +						IRQF_TRIGGER_FALLING, "wacom_pdct", wacom_data);
> +		if (ret) {
> +			dev_err(dev, "Failed to register pdct interrupt\n");
> +			goto err_disable_regulators;
> +		}
> +	}
> +
> +	if (wacom_data->pen_inserted_gpio) {
> +		input_dev->evbit[0] |= BIT_MASK(EV_SW);
> +		input_set_capability(input_dev, EV_SW, SW_PEN_INSERTED);
> +		wacom_data->pen_insert_irq = gpiod_to_irq(wacom_data->pen_inserted_gpio);

Same question here.

> +		ret = devm_request_threaded_irq(dev, wacom_data->pen_insert_irq, NULL,
> +						wacom_w9000_interrupt_pen_insert, IRQF_ONESHOT |
> +						IRQF_NO_AUTOEN | IRQF_TRIGGER_RISING |
> +						IRQF_TRIGGER_FALLING, "wacom_pen_insert",
> +						wacom_data);
> +		if (ret) {
> +			dev_err(dev, "Failed to register pen-insert interrupt\n");
> +			goto err_disable_regulators;
> +		}
> +	}
> +
> +	input_set_drvdata(input_dev, wacom_data);
> +
> +	wacom_data->pen_inserted = gpiod_get_value(wacom_data->pen_inserted_gpio);
> +	if (wacom_data->pen_inserted)
> +		regulator_disable(wacom_data->regulator);
> +	else
> +		enable_irq(wacom_data->irq);
> +
> +	input_report_switch(wacom_data->input_dev, SW_PEN_INSERTED, wacom_data->pen_inserted);
> +	input_sync(wacom_data->input_dev);
> +
> +	if (wacom_data->pen_inserted_gpio)
> +		enable_irq(wacom_data->pen_insert_irq);
> +
> +	if (wacom_data->pen_detect_gpio)
> +		enable_irq(wacom_data->pen_detect_irq);
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
> +}
> +
> +static int wacom_w9000_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct wacom_w9000_data *wacom_data = i2c_get_clientdata(client);
> +	struct input_dev *input_dev = wacom_data->input_dev;
> +
> +	mutex_lock(&input_dev->mutex);
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
> +static const struct i2c_device_id wacom_w9000_id[] = {
> +	{ "w9007a_lt03" },
> +	{ "w9007a_v1" },

This does not match your OF table.

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
> -- 
> 2.43.0
> 

