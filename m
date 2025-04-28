Return-Path: <linux-input+bounces-12027-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DFEA9EAD7
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 10:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 573B8189B6E2
	for <lists+linux-input@lfdr.de>; Mon, 28 Apr 2025 08:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627B4D530;
	Mon, 28 Apr 2025 08:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UhrAo3oy"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B641DF252
	for <linux-input@vger.kernel.org>; Mon, 28 Apr 2025 08:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745829203; cv=none; b=ujdgX4bMzFYQIyY4Z4umuL5+OLKtcN4ybk2uNDLTpvYnWDZhO1hx8IP6OV8j1y++G2iaIC45akK1fkjRmc2LT4zBvbuf3gZ2OIvhi/kTbKqo3ZwPwqC49mNMTvM+VEioSsjze3rBXa4VTkU70CSswnm8+HqVVliaD528+0AlulE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745829203; c=relaxed/simple;
	bh=pJ8O7gTrYUeWwxuWTIvgNyTjTeTs5VMSdWV0Q7CbJaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QvNVSfnxYtn3kkNIgkLH2zOTUH2hyJG9vfYr1NHVOo6HKSNCthE9DceQn+2OzB71+yb3Y/fbf0SwOoLvDiMdrAIx+BOvTd5un1KBUYgZKZTlN+RzX0jdeascHfA6x0w+PGlHgkbCtTcHima3J6PJH4GxUwaLLam0JeTohl0DARM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UhrAo3oy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745829200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGcvqcUvkm2g9wzS683vHLZvM4pUfmU6Vbf587HsfpE=;
	b=UhrAo3oykJJbNhK89tNcfKR17+OBpP7pVmj4op0amahAJYrRMoNagrLTnVJqrHtznr8sU/
	5fGt9/1yroLbp2cthA7GFY/woW84G+0SSw5ff80YAKxMIu3VokJftJaRBoL/dq4iIZKb+y
	eT5eJA1MIfeBqzfdGHPTXj5bzBj3wtM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-mr8IO03_NZK_43zb7NwuHw-1; Mon, 28 Apr 2025 04:33:19 -0400
X-MC-Unique: mr8IO03_NZK_43zb7NwuHw-1
X-Mimecast-MFC-AGG-ID: mr8IO03_NZK_43zb7NwuHw_1745829197
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac3e0c1336dso350388566b.3
        for <linux-input@vger.kernel.org>; Mon, 28 Apr 2025 01:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745829197; x=1746433997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGcvqcUvkm2g9wzS683vHLZvM4pUfmU6Vbf587HsfpE=;
        b=DilbopYdcfR+a9m+4IINzdLUaQlCwypI8IHgEFfR0yxBMELj0rNXzW4aDFo+PuOpeA
         fR87/4on4oHmveoBH1q5e2j+pYd6bIrpPOLX17T3BR/FgiEIabETSLSwE26bHm3lVrWF
         7A/zFh9r6rOhbEz7+jgKrEOFxuK1C1HQs3ZYq8X/K3ICDP/Wh5a0r04HqWpsvXSojfe5
         UMPJnhQ4lngOBiBoNBLJ3hqYXDGZWJYILplxvWgAT0ZHuFQNrJhw25o8CbhH6caFDseL
         /1IUnYcyHtJ5cyV/dRWjkpdH8aSeCmgju0+9Cap0uoxNgnKeeqc7x4IPKv4Y9e/580Fk
         VEtg==
X-Gm-Message-State: AOJu0YxAZ3s1VLPh1vcRVgNGRkYHip9vOhz230aNbADxoXVfbLT+0BSf
	7RO3VMGiSGgPuL+hkVN7CMTYZ5hE1gcO/540LmRg6rvRtsjilU7IOoGVM8toNJOM8HRhE2Va4cQ
	4uh+Q/OUkOPFyJvN2+nWY2mypZejCZFv11Uzr/cUb4o1oSYt4PNrAqvzpNzFM
X-Gm-Gg: ASbGncusCZIcQWC2Bk3PaHTnS49ehF6CT01yS2MUSom+cxyDmtmeKfT75EPbG7t9ke5
	esJygKFdTN2wscooBeVZHxIg9mH+33w68C3wFT/ZGPCZhqZU09dPL8hY1qyyKysFRt6R6H27IOd
	tYHnNyGqmF/b0QRU55+VNsgTak8HHjgac5wSywLI8e9vjSTXMdKWw1Gc5N0eueJdq9yhyLJ02JP
	cn+75y5MKGuxjjV/dLs+nthwbADUIn2gD7kNKzxnHS6DFcDmHzmBWe7e1cTY/kwVYuCgr0RaerD
	/rJTS6QLtJvrfk0=
X-Received: by 2002:a05:6402:1ed0:b0:5e7:b015:ad42 with SMTP id 4fb4d7f45d1cf-5f7398433aemr7803778a12.28.1745829196892;
        Mon, 28 Apr 2025 01:33:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnQGf5p3Imb0SlRCtdMs61uLPDDIs2q+uuHYQl1CCgJCkHHSa0Rk4MkuYWgz4wW7ho0OyaDA==
X-Received: by 2002:a05:6402:1ed0:b0:5e7:b015:ad42 with SMTP id 4fb4d7f45d1cf-5f7398433aemr7803759a12.28.1745829196464;
        Mon, 28 Apr 2025 01:33:16 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f703833c66sm5480374a12.75.2025.04.28.01.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 01:33:15 -0700 (PDT)
Message-ID: <e9bafdd2-d84a-49e3-a221-36088f3c753b@redhat.com>
Date: Mon, 28 Apr 2025 10:33:14 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Input: goodix - Allow DT specification of missing
 reset pull-up
To: Esben Haabendal <esben@geanix.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250422-goodix-no-reset-pull-up-v1-0-3983bb65a1bf@geanix.com>
 <20250422-goodix-no-reset-pull-up-v1-2-3983bb65a1bf@geanix.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250422-goodix-no-reset-pull-up-v1-2-3983bb65a1bf@geanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 22-Apr-25 17:15, Esben Haabendal wrote:
> In commit a2fd46cd3dbb ("Input: goodix - try not to touch the reset-pin on x86/ACPI devices")
> a fix for problems on various x86/ACPI devices where external
> pull-up is missing were added. The same type of problem can exist on
> device-tree platforms, and the fix can be activated by adding the
> no-reset-pull-up device-tree property.
> 
> Signed-off-by: Esben Haabendal <esben@geanix.com>

Thank you for your patch.

> ---
>  drivers/input/touchscreen/goodix.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index a3e8a51c91449533b4d5185746df6b98676053dd..3a55b0f8e5132a5e1fe77bd27de74e058a4afdaf 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -775,7 +775,8 @@ int goodix_reset_no_int_sync(struct goodix_ts_data *ts)
>  	 * power. Only do this in the non ACPI case since some ACPI boards
>  	 * don't have a pull-up, so there the reset pin must stay active-high.
>  	 */
> -	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_GPIO) {
> +	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_GPIO &&
> +	    ts->gpiod_rst_flags == GPIOD_IN) {

You can simplify the check to just:

	if (ts->gpiod_rst_flags == GPIOD_IN) {

that will work for the IRQ_PIN_ACCESS_ACPI* access_methods too and
nicely lines up with the gpiod_direction_input() on the next line.

Please also update the comment above the check to reflect the new
situation.

With this fixed, this looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans





>  		error = gpiod_direction_input(ts->gpiod_rst);
>  		if (error)
>  			goto error;
> @@ -969,6 +970,13 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
>  	 */
>  	ts->gpiod_rst_flags = GPIOD_IN;
>  
> +	/*
> +	 * Devices that does not have pull-up on reset signal should not be
> +	 * changed to input
> +	 */
> +	if (device_property_read_bool(dev, "no-reset-pull-up"))
> +		ts->gpiod_rst_flags = GPIOD_ASIS;
> +
>  	ts->avdd28 = devm_regulator_get(dev, "AVDD28");
>  	if (IS_ERR(ts->avdd28))
>  		return dev_err_probe(dev, PTR_ERR(ts->avdd28), "Failed to get AVDD28 regulator\n");
> 


