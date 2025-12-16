Return-Path: <linux-input+bounces-16599-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C955CC1A6B
	for <lists+linux-input@lfdr.de>; Tue, 16 Dec 2025 09:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE12730C967C
	for <lists+linux-input@lfdr.de>; Tue, 16 Dec 2025 08:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 527073396F8;
	Tue, 16 Dec 2025 08:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xYYUtRHs"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC81338F45
	for <linux-input@vger.kernel.org>; Tue, 16 Dec 2025 08:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765874747; cv=none; b=MJmZY5F//MOREuKk+zHDguV88usmNIT5vSngdqQcZIX8ZhQzSVgJhCPVJdEQLFNcpvlWN8xSq25Mo34LvpnBrrRpEeqHIZldCknjwxncO4hK0jE8f80Gzrk5XIv99/TUH/ZcPNn9rqtgFz2F4ELkpCws+mqMKl+gFhe5aqlVYt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765874747; c=relaxed/simple;
	bh=0r+AvBKkTIWPsBeipZp/wmo8VQgBdzoywCh6Xl4+APg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+YX99orZ4q0r+vy4xFwM52n35VaJDOXT6tE5jhmH6ePbzmCsH2O/8cmrL30NRiODnX/dSigpm27f7zWYljwbrV5B9skXXDx4+nrAOHa8wYrWsAvHYcuAoTaKKOm/Ks1z5jjVYihbjcUOcpSb3c3D+xd4XVL43p0gC/UKZZ9fXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xYYUtRHs; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 21B6D1A2210;
	Tue, 16 Dec 2025 08:45:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EAFA16071C;
	Tue, 16 Dec 2025 08:45:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9815D119431B1;
	Tue, 16 Dec 2025 09:45:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765874737; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=0i+PsZJan5460ifQCnMp834OOI47NDVIUR3zefRz6YY=;
	b=xYYUtRHs7TJgRw+tsLJcv3cjv2Ty1F1reYk7QEUZlEKhayOJYyDkMqf44Jv3JCIytIRoyN
	RvoCCnd9KqTevyLBNsn8TK/gY5cLNaCevOm0BLa2KMhoyPq8grs0kpsI/jdqCpZpa0wyz0
	/YAEQ2ALx/5ywgDN5PBhEUTYVOHqJ+qczQGggQovANYC19RcGHTHxdHvHwT3D2ktSi48oH
	5cbdiFXMizWwqMhDCGUib0+AkZGC+xzRrFXBSiTo3yfzvrwwmvhlHhPwejMEHY3W5CW+68
	VUaaPQU6GYXOA5qHCm7hepYG5+Jk/BnKay3gQiIRG7AdIAuKsiG0UcrMbIbh1g==
Date: Tue, 16 Dec 2025 09:45:33 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 3/4] Input: adc-keys - Use dev_err_probe in probe
 function
Message-ID: <20251216084533c8786b5d@mail.local>
References: <20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com>
 <20251215-rock4d-audio-v2-3-82a61de39b4c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215-rock4d-audio-v2-3-82a61de39b4c@collabora.com>
X-Last-TLS-Session-Version: TLSv1.3

On 15/12/2025 13:29:31+0100, Nicolas Frattaroli wrote:
> Rework the probe function, and functions called by the probe function,
> to use dev_err_probe for error logging.
> 
> While at it, also do some minor style cleanups, like not error logging
> on -ENOMEM and using ! instead of == 0.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  drivers/input/keyboard/adc-keys.c | 53 ++++++++++++++++-----------------------
>  1 file changed, 21 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/input/keyboard/adc-keys.c b/drivers/input/keyboard/adc-keys.c
> index 62376f34f7d0..6f2ddcecea99 100644
> --- a/drivers/input/keyboard/adc-keys.c
> +++ b/drivers/input/keyboard/adc-keys.c
> @@ -74,10 +74,8 @@ static int adc_keys_load_keymap(struct device *dev, struct adc_keys_state *st)
>  	int i;
>  
>  	st->num_keys = device_get_child_node_count(dev);
> -	if (st->num_keys == 0) {
> -		dev_err(dev, "keymap is missing\n");
> -		return -EINVAL;
> -	}
> +	if (!st->num_keys)
> +		return dev_err_probe(dev, -EINVAL, "keymap is missing\n");
>  
>  	map = devm_kmalloc_array(dev, st->num_keys, sizeof(*map), GFP_KERNEL);
>  	if (!map)
> @@ -86,17 +84,16 @@ static int adc_keys_load_keymap(struct device *dev, struct adc_keys_state *st)
>  	i = 0;
>  	device_for_each_child_node_scoped(dev, child) {
>  		if (fwnode_property_read_u32(child, "press-threshold-microvolt",
> -					     &map[i].voltage)) {
> -			dev_err(dev, "Key with invalid or missing voltage\n");
> -			return -EINVAL;
> -		}
> +					     &map[i].voltage))
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Key with invalid or missing voltage\n");
> +
>  		map[i].voltage /= 1000;
>  
>  		if (fwnode_property_read_u32(child, "linux,code",
> -					     &map[i].code)) {
> -			dev_err(dev, "Key with invalid or missing linux,code\n");
> -			return -EINVAL;
> -		}
> +					     &map[i].code))
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Key with invalid or missing linux,code\n");
>  
>  		if (fwnode_property_read_u32(child, "linux,input-type",
>  					     &map[i].type))
> @@ -129,7 +126,8 @@ static int adc_keys_probe(struct platform_device *pdev)
>  
>  	st->channel = devm_iio_channel_get(dev, "buttons");
>  	if (IS_ERR(st->channel))
> -		return PTR_ERR(st->channel);
> +		return dev_err_probe(dev, PTR_ERR(st->channel),
> +				     "Could not get iio channel\n");
>  
>  	if (!st->channel->indio_dev)
>  		return -ENXIO;
> @@ -138,16 +136,13 @@ static int adc_keys_probe(struct platform_device *pdev)
>  	if (error < 0)
>  		return error;
>  
> -	if (type != IIO_VOLTAGE) {
> -		dev_err(dev, "Incompatible channel type %d\n", type);
> -		return -EINVAL;
> -	}
> +	if (type != IIO_VOLTAGE)
> +		return dev_err_probe(dev, -EINVAL, "Incompatible channel type %d\n", type);
>  
>  	if (device_property_read_u32(dev, "keyup-threshold-microvolt",
> -				     &st->keyup_voltage)) {
> -		dev_err(dev, "Invalid or missing keyup voltage\n");
> -		return -EINVAL;
> -	}
> +				     &st->keyup_voltage))
> +		return dev_err_probe(dev, -EINVAL, "Invalid or missing keyup voltage\n");
> +
>  	st->keyup_voltage /= 1000;
>  
>  	error = adc_keys_load_keymap(dev, st);
> @@ -155,10 +150,8 @@ static int adc_keys_probe(struct platform_device *pdev)
>  		return error;
>  
>  	input = devm_input_allocate_device(dev);
> -	if (!input) {
> -		dev_err(dev, "failed to allocate input device\n");
> +	if (!input)
>  		return -ENOMEM;
> -	}
>  
>  	input_set_drvdata(input, st);
>  
> @@ -178,19 +171,15 @@ static int adc_keys_probe(struct platform_device *pdev)
>  
>  
>  	error = input_setup_polling(input, adc_keys_poll);
> -	if (error) {
> -		dev_err(dev, "Unable to set up polling: %d\n", error);
> -		return error;
> -	}
> +	if (error)
> +		return dev_err_probe(dev, error, "Unable to set up polling\n");
>  
>  	if (!device_property_read_u32(dev, "poll-interval", &value))
>  		input_set_poll_interval(input, value);
>  
>  	error = input_register_device(input);
> -	if (error) {
> -		dev_err(dev, "Unable to register input device: %d\n", error);
> -		return error;
> -	}
> +	if (error)
> +		return dev_err_probe(dev, error, "Unable to register input device\n");
>  
>  	return 0;
>  }
> 
> -- 
> 2.52.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

