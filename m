Return-Path: <linux-input+bounces-5292-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16723946685
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 02:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 431701C20B22
	for <lists+linux-input@lfdr.de>; Sat,  3 Aug 2024 00:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 161C180C;
	Sat,  3 Aug 2024 00:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIndyg4/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EF24690;
	Sat,  3 Aug 2024 00:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722645438; cv=none; b=lXGhz48UCC4jSJYvOOXoQIGAw4MWkd4pWzHwJMlfsdZZo2rP3frQG0svcyuiP6p965PMAKY0JRJkhaJpH54VTdD+Yy4qtl6z0jpFYgGDzmyEUbLVbTyGEoRAntfGEiFyKyuSvm42zodM2imCtqxlHTs1780tEzLIlsduS+E5Scg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722645438; c=relaxed/simple;
	bh=T0Vk/auQGIzRzZ52qRPQnGR8mMBib23gMenRZAUoXR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O8GGJ4tj8f8RWizD/Otf/A3ihK9Agft1zmVGuT7hhybbDsO/hD5B6GRxzr651mzvyane14yMwAMUARof3Wwz0R+C8vilI43TqyMCoMkYrDZ1ITUsPIY0SymaU7GqNdQEgs5Ze2sHBHkfv5PhSzpAqSMb7cR9KPgEBVpbplf9RHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIndyg4/; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2cb5b783c15so6495827a91.2;
        Fri, 02 Aug 2024 17:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722645436; x=1723250236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+itLntxZyTqI7f7PfMJcECQfhIFzXWAphwS/6jaEk/U=;
        b=aIndyg4/nuNWw1Tg68xrxLStuxmcFb+fhsbo2ias+Pu6dc12g3vpRXesOD/EGgMDbN
         dKzwyGAgxls6zeR49HWbN/z6rDaridJ8yFGtsqiNBkTjr/5fs2NC88J5NOxgSE+TV0b0
         FSq1MZRjlBZWXeYv6SMTPBauI/Y7cSBguRumLDq4s8r+A6UOg8uA16x3/Bwamiqrd09i
         K69y71RRQsDB/kDY5qsBk1rtK9XRloQT5+hnsXqYaRHgERdBKF/Z2b3AGehLtaEGS0DP
         QZO09Xtlm/KUJ2Mlew0TtCfAU8uaH2GqMZH7JGatMh31++5zv6w0n79Wl3MGrHvvJvtC
         Cvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722645436; x=1723250236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+itLntxZyTqI7f7PfMJcECQfhIFzXWAphwS/6jaEk/U=;
        b=IbvSl0HcdmdsLYuw+I+E42Kz/lSBU8AYw294BBUd9el7mUT30TvAxYMN2tPTNTR+7r
         pbTPFJvHYuqhVgWLNFNsFuNUf6YR2fAkutpuAX62/cfJFhRsg9nmaa443n6mXubWqkEG
         h5ElUpBhyPZ8ZRFkh1qqRoJ4GZknYj0DRGxal6YcPfHk06G4iLrk0g75iGhfWbmLoXIs
         liIgLouOO2nPe78S0Cy64AiLB/AuTW/uHswDP0nGralPNzJAW9GrEdCNg0qH0tBAl5Uc
         NBzPAS5vpKtCkdGXtvew+SG2onFKaY1LFUbEnS8H9D85T8PjXeYP0v+d+9pymWaBnlDw
         dNvg==
X-Forwarded-Encrypted: i=1; AJvYcCXxcaM3J7PlWK3DSJJBsMY2JVt67/9z4MJVD5g4rEToiYyPRMv4ldgA/mVXGCINzf4snbhEDgf89gbXhTTdioqgtUgBoJS1YkQZwS3HAp7D6NPqvlB/JZ5eMVd9GbzNWpy/k/PIJqTxt5yLrKyupBFfAfuwIL6AvrCDfKVTuGKmdBMc4NiS
X-Gm-Message-State: AOJu0Yx+Ox8dMoALqUT3s14pMAOU5SJC3gXvnLgFYPEnC5OvFUSzzAlG
	ndxQ7EuXyxlSCYiVVlG6H+X9SJTHohZO2ireCT1575e0ol5rDHb1
X-Google-Smtp-Source: AGHT+IGFfX4lVD9nADlN/dQxlgM+uZ2O8NSgKp2XTuPJS7TFxSi+WsiYLvOVTLUPZ7P8w1O46FxssA==
X-Received: by 2002:a17:903:41c8:b0:1ff:4618:36bc with SMTP id d9443c01a7336-1ff572f236fmr71740635ad.39.1722645435664;
        Fri, 02 Aug 2024 17:37:15 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:47be:b3e2:7c00:141c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5928ff1esm23067105ad.237.2024.08.02.17.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 17:37:15 -0700 (PDT)
Date: Fri, 2 Aug 2024 17:37:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: utsav.agarwal@analog.com
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
	Oliver Gaskell <oliver.gaskell@analog.com>
Subject: Re: [PATCH v8 2/3] Input: adp5588-keys - add support for pure gpio
Message-ID: <Zq17uABHdNENnwVq@google.com>
References: <20240704-adp5588_gpio_support-v8-0-208cf5d4c2d6@analog.com>
 <20240704-adp5588_gpio_support-v8-2-208cf5d4c2d6@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704-adp5588_gpio_support-v8-2-208cf5d4c2d6@analog.com>

Hi Utsav,

On Thu, Jul 04, 2024 at 03:26:31PM +0100, Utsav Agarwal via B4 Relay wrote:
> From: Utsav Agarwal <utsav.agarwal@analog.com>
> 
> Keypad specific setup is relaxed if no keypad rows/columns are specified,
> enabling a purely gpio operation.
> 
> Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> ---
>  drivers/input/keyboard/adp5588-keys.c | 37 +++++++++++++++++++++++++++++++----
>  1 file changed, 33 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/keyboard/adp5588-keys.c b/drivers/input/keyboard/adp5588-keys.c
> index 09bcfc6b9408..7c32f8b69a3e 100644
> --- a/drivers/input/keyboard/adp5588-keys.c
> +++ b/drivers/input/keyboard/adp5588-keys.c
> @@ -188,6 +188,7 @@ struct adp5588_kpad {
>  	u32 cols;
>  	u32 unlock_keys[2];
>  	int nkeys_unlock;
> +	bool gpio_only;
>  	unsigned short keycode[ADP5588_KEYMAPSIZE];
>  	unsigned char gpiomap[ADP5588_MAXGPIO];
>  	struct gpio_chip gc;
> @@ -431,10 +432,12 @@ static int adp5588_gpio_add(struct adp5588_kpad *kpad)
>  	kpad->gc.label = kpad->client->name;
>  	kpad->gc.owner = THIS_MODULE;
>  
> -	girq = &kpad->gc.irq;
> -	gpio_irq_chip_set_chip(girq, &adp5588_irq_chip);
> -	girq->handler = handle_bad_irq;
> -	girq->threaded = true;
> +	if (kpad->client->irq) {
> +		girq = &kpad->gc.irq;
> +		gpio_irq_chip_set_chip(girq, &adp5588_irq_chip);
> +		girq->handler = handle_bad_irq;
> +		girq->threaded = true;
> +	}
>  
>  	mutex_init(&kpad->gpio_lock);
>  
> @@ -632,6 +635,21 @@ static int adp5588_fw_parse(struct adp5588_kpad *kpad)
>  	struct i2c_client *client = kpad->client;
>  	int ret, i;
>  
> +	/*
> +	 * Check if the device is to be operated purely in GPIO mode. To do
> +	 * so, check that no keypad rows or columns have been specified,
> +	 * since all GPINS should be configured as GPIO.
> +	 */
> +	ret = device_property_present(&client->dev,
> +			"keypad,num-rows");
> +	ret |= device_property_present(&client->dev,
> +			"keypad,num-columns");
> +	/* If purely GPIO, skip keypad setup */
> +	if (!ret) {
> +		kpad->gpio_only = true;
> +		return 0;
> +	}
> +
>  	ret = matrix_keypad_parse_properties(&client->dev, &kpad->rows,
>  					     &kpad->cols);
>  	if (ret)
> @@ -775,6 +793,11 @@ static int adp5588_probe(struct i2c_client *client)
>  	if (error)
>  		return error;
>  
> +	if (kpad->gpio_only && !client->irq) {
> +		dev_info(&client->dev, "Rev.%d, started as GPIO only\n", revid);
> +		return 0;

I think we need more elaborate handling here (and probably more
elaborate binding yaml file): now that you are making interrupt optional
you should check if interrupt-controller functionality of the GPIO
block/gpiochip is requested. If it was, then we should not allow missing
interrupt. If only GPIO controller is needed, without interrupt
capabilities, tnen running without interrupt is fine.

Thanks.

-- 
Dmitry

