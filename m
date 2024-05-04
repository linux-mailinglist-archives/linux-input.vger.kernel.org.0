Return-Path: <linux-input+bounces-3443-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 356A18BBB6B
	for <lists+linux-input@lfdr.de>; Sat,  4 May 2024 14:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 585021C20D38
	for <lists+linux-input@lfdr.de>; Sat,  4 May 2024 12:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC7A1C695;
	Sat,  4 May 2024 12:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KqdkxJA9"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287C08F6D
	for <linux-input@vger.kernel.org>; Sat,  4 May 2024 12:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714826255; cv=none; b=lWV1wpzhvV8kukkrjT6UILdwtNSywFshsBqocCLJHLQKC37HVrCPC1gnWCaQ2aiSeqeiviCDiGZqUY7adraT15DDbr4qmq0AWh8l3qQpO4GoG3iIKuV8Nib0Uh8F3lgVfHVk3ZCmirB6LgPaSeTfwvD2YInpk+3Ce5JeWEv+Pno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714826255; c=relaxed/simple;
	bh=hNMW8+IgLuSBkd4py+ntrpJEGZ+dxKnzAjLWBbDqbdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eJMS28hgbWtXfoaFVIx27FClJmAYkqYuZnXje14PfBfa3M0F0Jw422lV9Ae/uG88d3dJsKKUks4PkgWSDJAgs4Oowy6udnWlTHPsTPq36i9PpbEWZQsp9IxbP0xkdV4YGyammdrwRFe+MO6lF3Vmq/l+Je0np8P2cfvxida0eJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KqdkxJA9; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a598e483ad1so105877466b.1
        for <linux-input@vger.kernel.org>; Sat, 04 May 2024 05:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714826252; x=1715431052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RRwc+lUgatgKkH+J/KfgoQ4NgMWwebsVYOb/e8b2HU8=;
        b=KqdkxJA9BhPS+0i0BRP0loR8Kz58p+L9L4zbwOBxs6s0w50XPtGAUVdEFDMqbLLWM2
         J9jWlz5PvJ/hhXi1bFyl7JKPde+2pqOGG4mRz9m5UEoIGlS0VgjLYBPfw39+pzp/zBj2
         28nDhsEBQNdVPcS0sItl7lqp6B1YCsysyB40XIawGGMItUrGkjGA9A3kUiGokuFYPSsm
         f4wPR6HTN3OezzdIF7YinMMA3HU9mU/zs57D0HDEo2n1c5ZPf6OU5TbrjsJXZWWWUvF3
         FoFrNJ1E7lahcUr2Lo9bHCZ3inr67VOILnbSm76nFKLXNL7dwfZAoHnakDi6bpMj5/h2
         nZ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714826252; x=1715431052;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RRwc+lUgatgKkH+J/KfgoQ4NgMWwebsVYOb/e8b2HU8=;
        b=sNAv/6iqnalDiWkEuIIytiKu7OXWFDYxJsHeRi4bjiL8FqAU8bSpKzfGti7hgH/nXW
         ujjMLAkv/eIvg0sUVoWIhrW2b8PwZ1gG72H3Y6UpgSlbcTMjR5Tc3S0CyhSnW8ywMh/q
         ZUabZgazM0NEdG8QlQVYEV8AppmmaMtrFcpGZ3fUc2t82WhkmOnPvlg2C+CXlNK/GOzd
         u8RUGWPjCEfJ5k+v8hkmiVzCrOwWetoS5KozCNv/dp+dhugElCadaznQfKh6PR5T0s7O
         FHje3we0n24GRu59e8zVsCELfRsssIhAugUvLoQkA80rdVm6vFAPWrBAnGcVrlllCz5q
         HW6w==
X-Forwarded-Encrypted: i=1; AJvYcCVw+Ay+V7PXGeCV4zP/cW1/Mf9OkE57lfDbxTph4KWg7AbFuKl68YQ0nKZX/5Cnv9yqKNF5RcnR6WaZqGKY6I+IRo9eBhyIzs2dN6c=
X-Gm-Message-State: AOJu0YyQU6hNAQXGpn68OgRrsYxl3OgVF21YI56Hlwoj2k8dF1GMmr/M
	41rvxeqDIi+mteLWpLZKpiSB0wa+0eM6uQXds+K2B0RBLhzlQIKwMRHwDmciJC0=
X-Google-Smtp-Source: AGHT+IEwKHP5oFZPxalnT6ctJ/t86tAgIgy+4aKZZTQeOy9Y2ICDx7xps3ZJmEWrJWnIpKNKEsSKIg==
X-Received: by 2002:a17:907:110b:b0:a55:b592:7e0a with SMTP id qu11-20020a170907110b00b00a55b5927e0amr3486615ejb.48.1714826252559;
        Sat, 04 May 2024 05:37:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id ce3-20020a170906b24300b00a587831c09fsm2884330ejb.186.2024.05.04.05.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 May 2024 05:37:31 -0700 (PDT)
Message-ID: <95f8d63a-0343-49c3-90b6-f91efe559841@linaro.org>
Date: Sat, 4 May 2024 14:37:30 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] input: himax_hx83112b: add regulator handling
To: Felix Kaechele <felix@kaechele.ca>, Job Noorman <job@noorman.info>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240504020745.68525-1-felix@kaechele.ca>
 <20240504020745.68525-3-felix@kaechele.ca>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240504020745.68525-3-felix@kaechele.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/05/2024 04:04, Felix Kaechele wrote:
> Handle regulators used on this chip family, namely AVDD and VDD. These
> definitions are taken from the GPLv2 licensed vendor driver.
> 
> Signed-off-by: Felix Kaechele <felix@kaechele.ca>
> Link: https://github.com/HimaxSoftware/HX83112_Android_Driver
> ---
>  drivers/input/touchscreen/himax_hx83112b.c | 48 ++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/himax_hx83112b.c b/drivers/input/touchscreen/himax_hx83112b.c
> index 4f6609dcdef3..0a797789e548 100644
> --- a/drivers/input/touchscreen/himax_hx83112b.c
> +++ b/drivers/input/touchscreen/himax_hx83112b.c
> @@ -19,10 +19,12 @@
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  
>  #define HIMAX_ID_83112B			0x83112b
>  
>  #define HIMAX_MAX_POINTS		10
> +#define HIMAX_MAX_SUPPLIES		2
>  
>  #define HIMAX_REG_CFG_SET_ADDR		0x00
>  #define HIMAX_REG_CFG_INIT_READ		0x0c
> @@ -50,6 +52,7 @@ struct himax_event {
>  static_assert(sizeof(struct himax_event) == 56);
>  
>  struct himax_ts_data {
> +	struct regulator_bulk_data supplies[HIMAX_MAX_SUPPLIES];
>  	struct gpio_desc *gpiod_rst;
>  	struct input_dev *input_dev;
>  	struct i2c_client *client;
> @@ -63,6 +66,11 @@ static const struct regmap_config himax_regmap_config = {
>  	.val_format_endian = REGMAP_ENDIAN_LITTLE,
>  };
>  
> +static const char *const himax_supply_names[] = {
> +	"avdd",
> +	"vdd",
> +};
> +

That's confusing. Binding said only HX83100A family has regulators, but
you request for everyone.

>  static int himax_read_config(struct himax_ts_data *ts, u32 address, u32 *dst)
>  {
>  	int error;
> @@ -267,7 +275,7 @@ static irqreturn_t himax_irq_handler(int irq, void *dev_id)
>  
>  static int himax_probe(struct i2c_client *client)
>  {
> -	int error;
> +	int error, i;
>  	struct device *dev = &client->dev;
>  	struct himax_ts_data *ts;
>  
> @@ -290,11 +298,31 @@ static int himax_probe(struct i2c_client *client)
>  		return error;
>  	}
>  
> +	int num_supplies = ARRAY_SIZE(himax_supply_names);
> +
> +	for (i = 0; i < num_supplies; i++)
> +		ts->supplies[i].supply = himax_supply_names[i];
> +
> +	error = devm_regulator_bulk_get(dev,

devm_regulator_bulk_get_enable and drop rest of the code here.


> +					num_supplies,
> +					ts->supplies);

Wrap it properly at 80, not one argument in one line.

> +	if (error) {
> +		dev_err(dev, "Failed to get supplies: %d\n", error);

return dev_err_probe()

> +		return error;
> +	}
> +
> +	error = regulator_bulk_enable(num_supplies,
> +				      ts->supplies);
> +	if (error) {
> +		dev_err(dev, "Failed to enable supplies: %d\n", error);
> +		goto error_out;
> +	}
> +


Best regards,
Krzysztof


