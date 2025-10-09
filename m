Return-Path: <linux-input+bounces-15346-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8242FBCA6E7
	for <lists+linux-input@lfdr.de>; Thu, 09 Oct 2025 19:51:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F4E53C7BBC
	for <lists+linux-input@lfdr.de>; Thu,  9 Oct 2025 17:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A4A227EAA;
	Thu,  9 Oct 2025 17:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQ0N2rW+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5A81E2614;
	Thu,  9 Oct 2025 17:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760032302; cv=none; b=sttL76BbGKzswc5EvyqMTAt/MPZhgRXkdebP691w6WwdEmm94qSaFnLxrySHKCwSg7E6fqOGEspwrYTw85klup5n4QVIJ7n9U060erKFVlGKVGj/bJTl713wSdobk7xg0SvUrm/w0Q580kJ7EwhDA4//C63F6Hq9uONIk/7Fc54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760032302; c=relaxed/simple;
	bh=Kt+BiiiB+9Tmir/AzFzW6CliEEaqbJVo8i+yrxbSlQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndqpZMA0dSCP1FyjEc0xp23gPHPs5+f3P2JzQ96c5fCGaupJKylzbFv2FWPHICD8HT/tCr/GbsdeNWGB55S7Oa2ExaiQ1jy9zmfN/qUeW0gRN9Ije9VAmzlK3VeJie4LBVfM63XpzeKMn1LxG9q+U87WsMYnpI0Z/97fkqopno0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQ0N2rW+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4008EC4CEE7;
	Thu,  9 Oct 2025 17:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760032302;
	bh=Kt+BiiiB+9Tmir/AzFzW6CliEEaqbJVo8i+yrxbSlQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BQ0N2rW+szIMjUf2wascL7R/iQOk/uvnN/PgHRqo93iqkxKkvE0iANes53td4HnvL
	 n7NRLAn2bdlnsMsJxskuSEkexKvi7bmBkcJPQZSVI00zPW2dseh8916iBCvPBY35Sc
	 00QEAZr5bX2bxn214tO54xxtcoOn7suEbRo9s4DzNYbp6xECzid8hsAP0suJISJcqV
	 BjDpqp02bYx+XEmFt4uXpmeREDFyKhxNEMCqJRpMYOL85tHvOs/oqCqz7XZLmwbIAb
	 TJFm3gWZsKVJ0yX5h1SJUSdF6XNICvq0a7YD+nqQpB0ftCuuQuhlcudgcAcc9IfXo3
	 legK52LfcH0Pg==
Message-ID: <dad227b8-7ff0-426c-80dd-aa3e725549b0@kernel.org>
Date: Thu, 9 Oct 2025 19:51:39 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] input: goodix: Remove setting of RST pin to input
To: Martyn Welch <martyn.welch@collabora.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: kernel@collabora.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251009134138.686215-1-martyn.welch@collabora.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20251009134138.686215-1-martyn.welch@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Oct-25 3:41 PM, Martyn Welch wrote:
> The reset line is being set to input on non-ACPI devices apparently to
> save power. This isn't being done on ACPI devices as it's been found
> that some ACPI devices don't have a pull-up resistor fitted. This can
> also be the case for non-ACPI devices, resulting in:
> 
> [  941.672207] Goodix-TS 1-0014: Error reading 10 bytes from 0x814e: -110
> [  942.696168] Goodix-TS 1-0014: Error reading 10 bytes from 0x814e: -110
> [  945.832208] Goodix-TS 1-0014: Error reading 10 bytes from 0x814e: -110
> 
> This behaviour appears to have been initialing introduced in
> ec6e1b4082d9. This doesn't seem to be based on information in either the
> GT911 or GT9271 datasheets cited as sources of information for this
> change. Thus it seems likely that it is based on functionality in the
> Android driver which it also lists. This behaviour may be viable in very
> specific instances where the hardware is well known, but seems unwise in
> the upstream kernel where such hardware requirements can't be
> guaranteed.
> 
> Remove this over optimisation to improve reliability on non-ACPI
> devices.
> 
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> 
> ---
> 
> Changes since v1:
>  - Dropping gpiod_rst_flags and directly passing GPIOD_ASIS when
>    requesting the reset pin.

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans




> 
>  drivers/input/touchscreen/goodix.c | 27 +--------------------------
>  drivers/input/touchscreen/goodix.h |  1 -
>  2 files changed, 1 insertion(+), 27 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 252dcae039f8..f838f92100c2 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -796,17 +796,6 @@ int goodix_reset_no_int_sync(struct goodix_ts_data *ts)
>  
>  	usleep_range(6000, 10000);		/* T4: > 5ms */
>  
> -	/*
> -	 * Put the reset pin back in to input / high-impedance mode to save
> -	 * power. Only do this in the non ACPI case since some ACPI boards
> -	 * don't have a pull-up, so there the reset pin must stay active-high.
> -	 */
> -	if (ts->irq_pin_access_method == IRQ_PIN_ACCESS_GPIO) {
> -		error = gpiod_direction_input(ts->gpiod_rst);
> -		if (error)
> -			goto error;
> -	}
> -
>  	return 0;
>  
>  error:
> @@ -957,14 +946,6 @@ static int goodix_add_acpi_gpio_mappings(struct goodix_ts_data *ts)
>  		return -EINVAL;
>  	}
>  
> -	/*
> -	 * Normally we put the reset pin in input / high-impedance mode to save
> -	 * power. But some x86/ACPI boards don't have a pull-up, so for the ACPI
> -	 * case, leave the pin as is. This results in the pin not being touched
> -	 * at all on x86/ACPI boards, except when needed for error-recover.
> -	 */
> -	ts->gpiod_rst_flags = GPIOD_ASIS;
> -
>  	return devm_acpi_dev_add_driver_gpios(dev, gpio_mapping);
>  }
>  #else
> @@ -989,12 +970,6 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
>  		return -EINVAL;
>  	dev = &ts->client->dev;
>  
> -	/*
> -	 * By default we request the reset pin as input, leaving it in
> -	 * high-impedance when not resetting the controller to save power.
> -	 */
> -	ts->gpiod_rst_flags = GPIOD_IN;
> -
>  	ts->avdd28 = devm_regulator_get(dev, "AVDD28");
>  	if (IS_ERR(ts->avdd28))
>  		return dev_err_probe(dev, PTR_ERR(ts->avdd28), "Failed to get AVDD28 regulator\n");
> @@ -1019,7 +994,7 @@ static int goodix_get_gpio_config(struct goodix_ts_data *ts)
>  	ts->gpiod_int = gpiod;
>  
>  	/* Get the reset line GPIO pin number */
> -	gpiod = devm_gpiod_get_optional(dev, GOODIX_GPIO_RST_NAME, ts->gpiod_rst_flags);
> +	gpiod = devm_gpiod_get_optional(dev, GOODIX_GPIO_RST_NAME, GPIOD_ASIS);
>  	if (IS_ERR(gpiod))
>  		return dev_err_probe(dev, PTR_ERR(gpiod), "Failed to get %s GPIO\n",
>  				     GOODIX_GPIO_RST_NAME);
> diff --git a/drivers/input/touchscreen/goodix.h b/drivers/input/touchscreen/goodix.h
> index 87797cc88b32..0d1e8a8d2cba 100644
> --- a/drivers/input/touchscreen/goodix.h
> +++ b/drivers/input/touchscreen/goodix.h
> @@ -88,7 +88,6 @@ struct goodix_ts_data {
>  	struct gpio_desc *gpiod_rst;
>  	int gpio_count;
>  	int gpio_int_idx;
> -	enum gpiod_flags gpiod_rst_flags;
>  	char id[GOODIX_ID_MAX_LEN + 1];
>  	char cfg_name[64];
>  	u16 version;


