Return-Path: <linux-input+bounces-3859-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0A28CFBF5
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 10:46:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 690EE1C21245
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2024 08:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C984136E1F;
	Mon, 27 May 2024 08:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O9ogm76/"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C842313D521
	for <linux-input@vger.kernel.org>; Mon, 27 May 2024 08:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716799380; cv=none; b=MAg8Xb5HKFqrW6AVSp8WRYVoLFr1m0xmKubK2z1Ov6D72qamQK9YfovHEHI97YnCdhsKXC8Xc1wnq0VI4tZH0HL6x7cCLWUxo7B2v1brfXLtzQQn/t1/gm8CssFtMzgRltD8KdXelqf2yN3MznyI7NvQC70x35/mLNgWYbj9sbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716799380; c=relaxed/simple;
	bh=fEUmSDxzFqNpouuhiooeqZxDVandAYpnE9D3je2aBVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BXB2YW95yOzOKQJWTmnP6GvMIuA0Lgf7QXhHE8yA1qCdsJfe5XSIhmjirigKByT3XSh/6fudHKGBbdTIrafK6r9uJbO8TemWt9E086nvi5VnDwW7IAifA9BoexPfoAiMbKI8+QV66qe8b32lZ/pKpYbdj2A6dz/pbS6XJt/yoZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O9ogm76/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716799377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/zPmbWagXjt3BK5DMO+Xlc4098nzNpgG/Un3zJBJG8U=;
	b=O9ogm76/UYBud5aDpfbdWeIT+MXaeXgjy638m9bBi7guO8CXzZw+nbVniltHceitOOud8S
	c5Bpo708HASjqFNNQLV39GeLWVz0tN7PklWXRTCn+cBIsle9DHFUbJSTIt9wwyd9hzj4tD
	mYpoVKwX4GojQP/1QuCiQjhaluwKWgM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-WC-pO-baPaKuMv3dGdTkeg-1; Mon, 27 May 2024 04:42:56 -0400
X-MC-Unique: WC-pO-baPaKuMv3dGdTkeg-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-57879e94026so664520a12.1
        for <linux-input@vger.kernel.org>; Mon, 27 May 2024 01:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716799375; x=1717404175;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/zPmbWagXjt3BK5DMO+Xlc4098nzNpgG/Un3zJBJG8U=;
        b=w78WjNxT56WI9BTxMDiL9Dyb+s2/20xkaN3OwAoqVExzKUOOtx/86kpYXgNoR6sZjg
         9Rv2rNUt6tpG4ye+6W5XW6ZP1PlQgCiewNQBZio2pbOmwJj0e9r7NyF6f2UZDVVPjjXm
         /g85pUDpKlQJ10Ci5MHei+BN8BVOcn3JT5q1sSqPI2UvOMuyYDqWF3tZ2ASOTYupiyZG
         67HQ9VGOWWRRmYTIE8PSuhFU4ckKJPIzalGW4GdTDHu6sPS56uCNorfssjSoPEiHkDOh
         eGK8gJFNGfJDnnD+6Y+j8IcMvqNoHArvO7e8/LscePHJXSYAYiW5na7F+AqRYVORicNc
         T3CA==
X-Gm-Message-State: AOJu0YzbOULLj/tZqFT8g9M/Zl2OoVxodkjuLfJ0NLWT0CSckXGfFZaG
	omp+bQeClj9bcT24B2vglNhfczbBkugZmDhlCxAomHZOSvZSMEgM3K0rYnY8d12/3A/1lV47Ed7
	SJvTZunEN9C7ft4eS/qwaoQR2DeUDjrI7xagtpsH4xVnklYGvQkUegZUyW7Sf
X-Received: by 2002:a50:a447:0:b0:566:4aa9:7143 with SMTP id 4fb4d7f45d1cf-5785192c696mr5318271a12.14.1716799374633;
        Mon, 27 May 2024 01:42:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHltn0qKEpPENkXILcgIlMp40NApRdKkl1amsi53GNMMEowowPh/ShWqCKsWBcarI3+5QpXng==
X-Received: by 2002:a50:a447:0:b0:566:4aa9:7143 with SMTP id 4fb4d7f45d1cf-5785192c696mr5318250a12.14.1716799373216;
        Mon, 27 May 2024 01:42:53 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579d65934ddsm853631a12.38.2024.05.27.01.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 01:42:52 -0700 (PDT)
Message-ID: <55272a3b-575d-4212-a40b-7245beed5d80@redhat.com>
Date: Mon, 27 May 2024 10:42:52 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] Input: novatek-nvt-ts: add support for NT36672A
 touchscreen
To: joelselvaraj.oss@gmail.com, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20240526-nvt-ts-devicetree-regulator-support-v3-0-aa88d10ccd9a@gmail.com>
 <20240526-nvt-ts-devicetree-regulator-support-v3-3-aa88d10ccd9a@gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240526-nvt-ts-devicetree-regulator-support-v3-3-aa88d10ccd9a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Joel,

On 5/27/24 5:26 AM, Joel Selvaraj via B4 Relay wrote:
> From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> 
> Extend the novatek touchscreen driver to support NT36672A chip which
> is found in phones like qcom/sdm845-xiaomi-beryllium-tianma.dts.
> Added devicetree support for the driver and used i2c chip data to handle
> the variation in chip id and wake type. Also added vcc and iovcc
> regulators which are used to power the touchscreen hardware.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> ---
>  drivers/input/touchscreen/novatek-nvt-ts.c | 78 +++++++++++++++++++++++++++---
>  1 file changed, 72 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/novatek-nvt-ts.c b/drivers/input/touchscreen/novatek-nvt-ts.c
> index 224fd112b25a9..7a82a1b09f9d5 100644
> --- a/drivers/input/touchscreen/novatek-nvt-ts.c
> +++ b/drivers/input/touchscreen/novatek-nvt-ts.c
> @@ -31,9 +31,6 @@
>  #define NVT_TS_PARAMS_CHIP_ID		0x0e
>  #define NVT_TS_PARAMS_SIZE		0x0f
>  
> -#define NVT_TS_SUPPORTED_WAKE_TYPE	0x05
> -#define NVT_TS_SUPPORTED_CHIP_ID	0x05
> -
>  #define NVT_TS_MAX_TOUCHES		10
>  #define NVT_TS_MAX_SIZE			4096
>  
> @@ -51,11 +48,18 @@ static const int nvt_ts_irq_type[4] = {
>  	IRQF_TRIGGER_HIGH
>  };
>  
> +struct nvt_ts_i2c_chip_data {
> +	u8 wake_type;
> +	u8 chip_id;
> +};
> +
>  struct nvt_ts_data {
>  	struct i2c_client *client;
>  	struct input_dev *input;
>  	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data regulators[2];
>  	struct touchscreen_properties prop;
> +	const struct nvt_ts_i2c_chip_data *chip;
>  	int max_touches;
>  	u8 buf[NVT_TS_TOUCH_SIZE * NVT_TS_MAX_TOUCHES];
>  };
> @@ -139,9 +143,23 @@ static irqreturn_t nvt_ts_irq(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +static void nvt_ts_disable_regulators(void *_data)
> +{
> +	struct nvt_ts_data *data = _data;
> +
> +	regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
> +}
> +
>  static int nvt_ts_start(struct input_dev *dev)
>  {
>  	struct nvt_ts_data *data = input_get_drvdata(dev);
> +	int error;
> +
> +	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators), data->regulators);
> +	if (error) {
> +		dev_err(&data->client->dev, "failed to enable regulators\n");
> +		return error;
> +	}
>  

This is weird, you already enable the regulators in probe() and
those get disabled again on remove() by the devm action you add.

So there is no need to enable / disable the regulators on start/stop .

If you want the regulators to only be enabled when the touchscreen
is on then you should disable the regulators again in probe()
after the nvt_ts_read_data() call there (and drop the devm action).

Or if you want to leave the regulators on all the time then you can
drop the enable + disable calls here.

 
>  	enable_irq(data->client->irq);
>  	gpiod_set_value_cansleep(data->reset_gpio, 0);
> @@ -155,6 +173,7 @@ static void nvt_ts_stop(struct input_dev *dev)
>  
>  	disable_irq(data->client->irq);
>  	gpiod_set_value_cansleep(data->reset_gpio, 1);
> +	nvt_ts_disable_regulators(data);
>  }
>  
>  static int nvt_ts_suspend(struct device *dev)
> @@ -199,9 +218,37 @@ static int nvt_ts_probe(struct i2c_client *client)
>  	if (!data)
>  		return -ENOMEM;
>  
> +	data->chip = device_get_match_data(&client->dev);
> +	if (!data->chip)
> +		return -EINVAL;
> +
>  	data->client = client;
>  	i2c_set_clientdata(client, data);
>  
> +	/*
> +	 * VCC is the analog voltage supply
> +	 * IOVCC is the digital voltage supply
> +	 */
> +	data->regulators[0].supply = "vcc";
> +	data->regulators[1].supply = "iovcc";
> +	error = devm_regulator_bulk_get(dev, ARRAY_SIZE(data->regulators), data->regulators);
> +	if (error) {
> +		dev_err(dev, "cannot get regulators: %d\n", error);
> +		return error;
> +	}
> +
> +	error = regulator_bulk_enable(ARRAY_SIZE(data->regulators), data->regulators);
> +	if (error) {
> +		dev_err(dev, "failed to enable regulators\n");
> +		return error;
> +	}
> +
> +	error = devm_add_action_or_reset(dev, nvt_ts_disable_regulators, data);
> +	if (error) {
> +		dev_err(dev, "failed to install regulator disable handler\n");
> +		return error;
> +	}
> +

If you are going to keep this devm action (see discussion above) then please
switch from devm_regulator_bulk_get() + regulator_bulk_enable() to
devm_regulator_bulk_get_enable() which gets and enables the regulators for
you in one call.

You can then drop the regulator_bulk_enable() + devm_add_action_or_reset()
calls since devm_regulator_bulk_get_enable() takes care of both for you.

>  	data->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
>  	error = PTR_ERR_OR_ZERO(data->reset_gpio);
>  	if (error) {
> @@ -225,8 +272,8 @@ static int nvt_ts_probe(struct i2c_client *client)
>  	if (width > NVT_TS_MAX_SIZE || height >= NVT_TS_MAX_SIZE ||
>  	    data->max_touches > NVT_TS_MAX_TOUCHES ||
>  	    irq_type >= ARRAY_SIZE(nvt_ts_irq_type) ||
> -	    data->buf[NVT_TS_PARAMS_WAKE_TYPE] != NVT_TS_SUPPORTED_WAKE_TYPE ||
> -	    data->buf[NVT_TS_PARAMS_CHIP_ID] != NVT_TS_SUPPORTED_CHIP_ID) {
> +	    data->buf[NVT_TS_PARAMS_WAKE_TYPE] != data->chip->wake_type ||
> +	    data->buf[NVT_TS_PARAMS_CHIP_ID] != data->chip->chip_id) {
>  		dev_err(dev, "Unsupported touchscreen parameters: %*ph\n",
>  			NVT_TS_PARAMS_SIZE, data->buf);
>  		return -EIO;
> @@ -277,8 +324,26 @@ static int nvt_ts_probe(struct i2c_client *client)
>  	return 0;
>  }
>  
> +static const struct nvt_ts_i2c_chip_data nvt_nt11205_ts_data = {
> +	.wake_type = 0x05,
> +	.chip_id = 0x05,
> +};
> +
> +static const struct nvt_ts_i2c_chip_data nvt_nt36672a_ts_data = {
> +	.wake_type = 0x01,
> +	.chip_id = 0x08,
> +};
> +
> +static const struct of_device_id nvt_ts_of_match[] = {
> +	{ .compatible = "novatek,nt11205-ts", .data = &nvt_nt11205_ts_data },
> +	{ .compatible = "novatek,nt36672a-ts", .data = &nvt_nt36672a_ts_data },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, nvt_ts_of_match);
> +
>  static const struct i2c_device_id nvt_ts_i2c_id[] = {
> -	{ "NT11205-ts" },
> +	{ "NT11205-ts", (unsigned long) &nvt_nt11205_ts_data },
> +	{ "NT36672A-ts", (unsigned long) &nvt_nt36672a_ts_data },

The i2c-subsystem will also match of compatible strings to i2c_device_ids
by looking at the partof the compatible after the ',', so for a compatible
of e.g. "novatek,nt36672a-ts" will match an i2c_device_id of "nt36672a-ts".

So if you change these to lower-case:

	{ "nt11205-ts", (unsigned long) &nvt_nt11205_ts_data },
	{ "nt36672a-ts", (unsigned long) &nvt_nt36672a_ts_data },

Then you can drop the nvt_ts_of_match table since that is not necessary
then.

Hmm I just realized that this will break module auto-loading though since that
does require of modaliases .
 
So maybe this is not such a good idea after all. Still switching to lowercase
i2c_device_id-s would be good for consistency and you need to respin
the patch-set for the regulator issue anyways.

Regards,

Hans



>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, nvt_ts_i2c_id);
> @@ -287,6 +352,7 @@ static struct i2c_driver nvt_ts_driver = {
>  	.driver = {
>  		.name	= "novatek-nvt-ts",
>  		.pm	= pm_sleep_ptr(&nvt_ts_pm_ops),
> +		.of_match_table = nvt_ts_of_match,
>  	},
>  	.probe = nvt_ts_probe,
>  	.id_table = nvt_ts_i2c_id,
> 


