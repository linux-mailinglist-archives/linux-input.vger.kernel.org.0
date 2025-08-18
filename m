Return-Path: <linux-input+bounces-14081-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 794D9B29A32
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 08:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 238927A7083
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 06:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54B10277C82;
	Mon, 18 Aug 2025 06:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjhC5s1E"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84904207A20;
	Mon, 18 Aug 2025 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755500058; cv=none; b=U6dABPJlH0v+NXIHNh3vekYQJOxcThx0AZ5piKKu4DP8xd+l7GJYs0HxcXPY225nqSHur5yirSyoFqP8HBCnL1qWbrp5ImQNh2FlhgFuqAM0z81H+MEm5tf9A5NFj+VR8rd65TiV1PN4SSLWKREs2f4H2c1Oz8oloNmARveZf4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755500058; c=relaxed/simple;
	bh=qXftpe2SbKv60R94fHSeSO1eO1NJJb+Gw9vEEgSHVOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PiqyBKMVoVBt8hpFegNoWjawZFn3eFH9rwMouTXFmqK+bP+nXq/qbQUD1I+VQfe2fx803xHvbn2UAgIylyTsBg3Lwz8p1NmSRqGOnwKcBlfw+SJhvZeVqJYpjp+YA+3FY2oQNTcQs/d0j9MG2YyOMEt9VQFbRwCGgTZ68/qjmwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjhC5s1E; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55ce521f77bso3826811e87.1;
        Sun, 17 Aug 2025 23:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755500054; x=1756104854; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nA6RQF3AzIzEhzAYagsgRNhLArTTRTQSzlHPJwEx3No=;
        b=BjhC5s1E20cnBqOTx5vGL0Ujrb1xR/j3sxMvVjai62jJkvbgS3q8vzkBvsozrHnk8D
         UbE4f3Vx21B904j1sqohxMCuXb1yfY4/il3eCiJ/+/ujuyzpUhciTo0buNOg+oBba8E2
         dJWRZ1C5K6N36hkapxS/silYt32kXPUfFtpeI4wkCutgsgFV4RjSVsX4Uixx0tgyD1se
         9+HDjhrb8G7nmEgi0vUOvavcmSHtxXJ9zkuZ1+8qwNTqhfxb0s1FP0d/9THj9MGIZJrB
         95td+e7GUJEiocVSSVAqE+hywkWU8OCetoTohhnX4ooAmYm9ilefdzDEwq/x4jhp6n0g
         0UYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755500054; x=1756104854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nA6RQF3AzIzEhzAYagsgRNhLArTTRTQSzlHPJwEx3No=;
        b=xVEE4rxhYhObN4dmMJGtmEbzRRWEHZ3bKniL7jsfv4kiH+0LfBeWJFAe+B7gOyOe/6
         YKJjBq11vZznlsYo9ZXTQycYN23FFCmyCrzLtiEp8WIbUl48m8YlZuFyV+5ry+pnUz6R
         m7J8W0286jehkQWppuMrnHBOurlDm6CsIBlFFg50yeRgr4wm33F88wtJfvn4fNYVKp/C
         IIKtYZu41RpA8x9cm+tWDHvSnMMClI9reaOHs2y1waUVlNpsyLGZDmQ8Fw20Q/wH3skz
         p1S9Fq79oRcimMJh6AaRDsFhF0V/blsvle7rUId4jelQGLtk79kiLevzRx8hpeaUn+nv
         PAzw==
X-Forwarded-Encrypted: i=1; AJvYcCVjyY9U4fqOX8CskzaI4+cKWbr7Ormll/TcYfkUn7pXkzAXOCRZ+8PIlvJ5FAVnT6i2XBjEVCHhsYV8k1Ek@vger.kernel.org, AJvYcCW/eWo7R1V30lXU7VsCFwDZh0lQYmZfXxlmoXnJ/ZdxOzT14m7xznfGPLnOy5gz3rKkPEKF8omQp6P4XQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrrwmdvcJl4wKPFc0o5Dn7E8tavicWaFGDu1n8Dnf9zMs0bh2G
	Xs1VUiU7SR0g0f6q6ClbRLgmVsZkUCSGIFeZVNkknOB74QqvVCYiT0/O
X-Gm-Gg: ASbGncvYyfeUPX2MOUK9XJuYgEQ7rEmm9CyYPWegc8TqwzfI3+pXT9ymFs+6v1E7O/3
	TTKYHSeotc0sTLe3/P6h1SjIGpmhkkwWSugZ0AAYXlZCZyHd+X3oQ+3ECU8cyT30qnaz2evreod
	f9ChAW6y0GJEW5RdKxu6ERC0gybvmKHAbTNy0imK7vWGuFyz9uiFZ7fbuLkyQunJ2oQGcQgWsLz
	2f1XciXAfWjcss4eea9Nauj61T8wMyr2HHlKqnJp8DNnvsxr4AG/XhXkMaM6a/hFkQpFx5LQFbf
	caKsHoPRLJC8hcYDikIQtwxfO4UGgqghvU+rNx9J5GrGJWOQU1yopbNFTFIg3gdk5OzRDy04sZb
	7NWlpfKW1lpbWiNBrgbqsRtEwChU/dq23N3nYaL5CoDFAI3dNEpo8XwCOPytIJLIErrqJyIeFMU
	snpDZ+V3dOlEfRsA==
X-Google-Smtp-Source: AGHT+IEoLAtAz+KlutygM4vdkjbVkLDPGyBko7qA5Jr0tdYtuPiVRKlb6F5t6aUWf0COiAU1+CJOzg==
X-Received: by 2002:a05:6512:6c5:b0:55a:3205:b4c2 with SMTP id 2adb3069b0e04-55ceeab8629mr3059616e87.12.1755500054118;
        Sun, 17 Aug 2025 23:54:14 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3514e3sm1528394e87.7.2025.08.17.23.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 23:54:13 -0700 (PDT)
Message-ID: <0adb5e0a-ea37-4bd5-87ff-654b770261f2@gmail.com>
Date: Mon, 18 Aug 2025 09:54:12 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] mfd: rohm-bd71828: Use software nodes for gpio-keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250817224731.1911207-1-dmitry.torokhov@gmail.com>
 <20250817224731.1911207-2-dmitry.torokhov@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250817224731.1911207-2-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2025 01:47, Dmitry Torokhov wrote:
> Refactor the rohm-bd71828 MFD driver to use software nodes for
> instantiating the gpio-keys child device, replacing the old
> platform_data mechanism.

Thanks for doing this Dmitry! I believe I didn't understand how 
providing the IRQs via swnode works... :)

If I visit the ROHM office this week, then I will try to test this using 
the PMIC HW. (Next week I'll be in ELCE, and after it I have probably 
already forgotten this...)

> The power key's properties are now defined using software nodes and
> property entries. The IRQ is passed as a resource attached to the
> platform device.
> 
> This will allow dropping support for using platform data for configuring
> gpio-keys in the future.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>   drivers/mfd/rohm-bd71828.c | 81 +++++++++++++++++++++++++++-----------
>   1 file changed, 58 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
> index a14b7aa69c3c..c29dde9996b7 100644
> --- a/drivers/mfd/rohm-bd71828.c
> +++ b/drivers/mfd/rohm-bd71828.c
> @@ -4,7 +4,6 @@

// ...snip

>   
> +static int bd71828_reg_cnt;
> +
> +static int bd71828_i2c_register_swnodes(void)
> +{
> +	int error;
> +
> +	if (bd71828_reg_cnt == 0) {

Isn't this check racy...

> +		error = software_node_register_node_group(bd71828_swnodes);
> +		if (error)
> +			return error;
> +	}
> +
> +	bd71828_reg_cnt++;

... with this...

> +	return 0;
> +}
> +
> +static void bd71828_i2c_unregister_swnodes(void *dummy)
> +{
> +	if (bd71828_reg_cnt != 0) {

...this...

> +		software_node_unregister_node_group(bd71828_swnodes);
> +		bd71828_reg_cnt--;

...and this? Perhaps add a mutex or use atomics?

Also, shouldn't the software_node_unregister_node_group() be only called 
for the last instance to exit (Eg, "if (bd71828_reg_cnt == 0)" instead 
of the "if (bd71828_reg_cnt != 0) {")?

> +	}
> +}
> +

Other than that - I like this idea :)

Thanks!

Yours,
	-- Matti

