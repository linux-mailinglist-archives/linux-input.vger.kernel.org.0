Return-Path: <linux-input+bounces-14083-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F7BB29A77
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 09:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D7E1189D2EB
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 07:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD49B1C5D44;
	Mon, 18 Aug 2025 06:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpmx6xQ/"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C4D27876A;
	Mon, 18 Aug 2025 06:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755500269; cv=none; b=R9TeNIwVzhRNwW/TWmzF+EXgfHWY+cTc9Yg9ZFQrLilDJh9SRghaDPKOfZUMTwmY0FuPLtuQ0Stc0+2qzLevQuNBxbqfmfoFSezz2lrMsBzACa9LLlGyyQGYelAT7Lq5c9o8K41h4liw+EziUiPQmCdIbBlu98S/eHvvDCA+Yok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755500269; c=relaxed/simple;
	bh=VIIO1Ddvq/2Tvip1mlgLuURtsD3Hezu0NuUVGwFs0AU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PDzRrwLupz7AaI4CBYqOKJRXYOEeOXo5c7c11hv0eYYODcO9DSfnYB1TcFNyfIz4NpEwuF0nVunF77iWc7e35Py/icmkhgstd+Mx8UclP1BepyJwxYBqFzxpSeJrqjqSGwOa8qW0FRLO/IJrt2qpKg9JmsGZdwEX49mh6fo/qfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpmx6xQ/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55ce509127bso2870640e87.0;
        Sun, 17 Aug 2025 23:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755500266; x=1756105066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fT+mslwXDBpZyiRy+Srmj0nFRd3SCnBkaKd9wV14TaI=;
        b=hpmx6xQ/9GfEbt2FE2tamIOgocuPrWpN/LdLz950eRpnaz/bi5OGtHKMrh5YLGPRtp
         z3CxTAVJpO+RaNfsm/YR9EEKthFx7j0svx/ODl4wL3X6HT6WT7kp4jlsgVnwfcWD2obM
         HqZKs2/HqIbfk8tAL69BqS9nC+/voqOJplPm3ke2cABgsKiHhQYGeocGYck6pr5oJquV
         /cXjCAo79gbhOQlqeK+oK+BfjDbCNVlx2l1nTbSmIVMQHVC7R4+o8eeM4FxAnedC2LhW
         20u/+sQ3foC/pgYrt1buOx0TeRCC0GoeZnUGcsNWMP3t3qvyh7eULxjtR89Tvox0EWs3
         Zb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755500266; x=1756105066;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fT+mslwXDBpZyiRy+Srmj0nFRd3SCnBkaKd9wV14TaI=;
        b=MdP72FPWrL+5WoeeX1kGXpmuNXTcgIPznyjbfL9yd5s3A5+gJ4aIZ0xtPOS5yXLEQj
         wHfuu1fIgnfDtqAbfGw+mf7RWshZ5iGhhGCcvgnPRD0Vde7OFHrSXuOcZdQGfcQ+QAEc
         1tipXHu3bkqfF0qb40tVIrTVhzSSb+0UVAtszXdex++nfpVVwBjlTMWFeJ5xA36TCQhD
         /38ujXm6A4ALCosEFnEHNjMot/8zcYQmvQ5blr5rK/Ysecl5RTIuwr848Hgu/6TOBVR8
         8dxCA2RyiPcBzdI2mEU4EU4Aw7bIpsiFzHtOcQQCISUSAYx5avaGgFv+3oUfUPs77poa
         bO5w==
X-Forwarded-Encrypted: i=1; AJvYcCWPLPWXX+XN5Wk1Dt5cvAIZ3BeuF3/7iV5wzPuWKCfAKTqUBA5BoVxk6QvKU99xrKPD+lOTrWQMxJmUlc1j@vger.kernel.org, AJvYcCWkbg8AEPJZT+HJnf06AeT/+ictvW3MZcitljve+AIe+LDx0MDqvUTgnMxHv2aJh8aoCpM6IGyUe7mwFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiSQeRZVHc+zzAiM8YpezGKiqEKp/L1vYPalAZ6RZD5dnWu9Zb
	dXHmqJvcgwi7Wq2xIiwoOs/1eQ7obqKwXzfWuVXpCE7LWmHpKpNgiaox
X-Gm-Gg: ASbGncuQ21z8xDd0MLfgWr0IchyBPfS2/JUFJR4cfQPkJ63EcTMWsBUaul7Qkbd9RQi
	bDgYkLo4W5Mlu60o9+WRCI+ZJ34LdfM9RBGtltuzsvXMs1T6yBiOO8+VFl1WA3Zi9a3VL5NXKJt
	XFM0CLmmpSi48fFKTgeN0tY3d0fg66/2zbq15metj7ng/9XTunq5gQOjaIpUVaaS/zp2Qgwln0B
	GaFYqxnqDKyZiZjxfknrG1kocO1gBKMcyVyFwL6r7jimyqRXJMCPdMF88njuSm84S5GS3YrzU3d
	KO/Yq8t9ALTRiPNBC1Kleo4TLACKc9biujpY0ilZunjGvLzSLZIcIutpbUnSGWcLdNX4pATOems
	1Dl3ywjLOXCY1WzroQPi5rgexrwlKhhde+cjR+qTDHPUIldHOyMVu5i4VBMTBgD24nqlq/FEb69
	dJJUkLzoXGEva9CEKnAfu+CyQr
X-Google-Smtp-Source: AGHT+IGcaeQ8FuTrtKrzfNJ/q5x6HgjoAMfdIRafAYOq22ATmyShL+bb1qQM+av9ulhVac5DpR80bw==
X-Received: by 2002:a05:6512:e9d:b0:553:2869:3a5 with SMTP id 2adb3069b0e04-55ceebae4f4mr2902840e87.48.1755500266029;
        Sun, 17 Aug 2025 23:57:46 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351685sm1563858e87.36.2025.08.17.23.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 23:57:45 -0700 (PDT)
Message-ID: <b15d7ac4-c751-4db8-a825-1e864570de37@gmail.com>
Date: Mon, 18 Aug 2025 09:57:44 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] mfd: rohm-bd718x7: Use software nodes for gpio-keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250817224731.1911207-1-dmitry.torokhov@gmail.com>
 <20250817224731.1911207-3-dmitry.torokhov@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250817224731.1911207-3-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/08/2025 01:47, Dmitry Torokhov wrote:
> Refactor the rohm-bd7182x7 MFD driver to use software nodes for
> instantiating the gpio-keys child device, replacing the old
> platform_data mechanism.
> 
> The power key's properties are now defined using software nodes and
> property entries. The IRQ is passed as a resource attached to the
> platform device.
> 
> This will allow dropping support for using platform data for configuring
> gpio-keys in the future.
> ---
>   drivers/mfd/rohm-bd718x7.c | 76 ++++++++++++++++++++++++++++++--------
>   1 file changed, 60 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
> index 25e494a93d48..20150656ac9c 100644
> --- a/drivers/mfd/rohm-bd718x7.c
> +++ b/drivers/mfd/rohm-bd718x7.c
> @@ -7,7 +7,6 @@
>   // Datasheet for BD71837MWV available from
>   // https://www.rohm.com/datasheet/BD71837MWV/bd71837mwv-e

...

>   
> +static int bd718xx_reg_cnt;
> +
> +static int bd718xx_i2c_register_swnodes(void)
> +{
> +	int error;
> +
> +	if (bd718xx_reg_cnt == 0) {
> +		error = software_node_register_node_group(bd718xx_swnodes);
> +		if (error)
> +			return error;
> +	}
> +
> +	bd718xx_reg_cnt++;
> +	return 0;
> +}
> +
> +static void bd718xx_i2c_unregister_swnodes(void *dummy)
> +{
> +	if (bd718xx_reg_cnt != 0) {
> +		software_node_unregister_node_group(bd718xx_swnodes);
> +		bd718xx_reg_cnt--;
> +	}
> +}

Same questions here as with the patch 2/3.


Yours,
	-- Matti

