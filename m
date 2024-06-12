Return-Path: <linux-input+bounces-4321-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 969E8904D7D
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 10:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1506F1F22FF7
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2024 08:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504F616C87B;
	Wed, 12 Jun 2024 08:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ALd8oroY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E6816D335
	for <linux-input@vger.kernel.org>; Wed, 12 Jun 2024 08:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718179392; cv=none; b=HD5SwgNOFq7UtnP7r23+0VkqYl3FO1UFx+EpEB3ONeaNezgi1KAfS/W59h17m2lwDLpL1UF9EfZcrDRB0CzkFLj0Ros3WAF/IyFqP8rXc5W5um0JWKHvBwRIEXQKHzGbTLmZHLacqLXhw8sHHH36vmE6ni0g1HY5bQHNzye4kAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718179392; c=relaxed/simple;
	bh=BCyDycZDFGsCPLW3LT7aTXi2lBSpeO3/z21P3m5C4y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cdoPoylKHsSMMNYMivbILOk+E9mZo+O+RbBOhKCmkqHNYviu7vBFpO1divrHgkubBzAXUa0DHhTNVfzHaEolfcjfrTXP5q0Yhxh6EW1S7fifSZ0CZwJ2a9gbIfoUlTgVnxguSX1NHvE/lcEEvSHr5r1Vy0c0Ma2PDZJIvzQYlUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ALd8oroY; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso83128521fa.3
        for <linux-input@vger.kernel.org>; Wed, 12 Jun 2024 01:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718179389; x=1718784189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UEfh8o/mxRGcDDlLCZYzRIr4dGTXPTfh9g32u4YpLRM=;
        b=ALd8oroY3wMBl45O3BaWBiubKxE5zPkWo64Zi6ue9QRhr4s1hfi0IWKW4fvSF1m98N
         ppmnl4OYQT//U2bb6I74KaFlNq9DQsuuk2wiBo4fXnGKUbjo2I4DpneOTsjDZ0ajxTh8
         BDUUc0gGjiPvmb59lJB7EhbuTywcnTQlWnXD1WJQFL5SY9xqbYRLz5mU1WcenElhBBnk
         65R0u/pmL8gkGAJq9qm7Y1lTWT/uCr4VV8aPYiOwJQgrUADVJjNyHOJTkhp/nM2pb3CZ
         8RPxHHIozGKvRBY1nWEVHio3LdX2kUYmjz6490y+zj9+7TIKVvuW/ZCyhXXSZQXze2f7
         XuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718179389; x=1718784189;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEfh8o/mxRGcDDlLCZYzRIr4dGTXPTfh9g32u4YpLRM=;
        b=MZBa/4NCg7+Nctjel58lkN8+q1EP4A65Gv2VSMZUb7xzRaqFla5BsnXusCt+kZEPD1
         ZWJBdg/IusDatuKCdaWzEv4DmbKVf7uM0NFghaLJHOp5/CGi5fyoM2NaLPCUUOAtrcas
         SyI7Sll9s6jlLfm4C/1qYcklauuvNNgdAPEqz3oPP/hfmqet9Zp/7dYiR78MqARGC1F0
         cSjWo65l+0SnWepl5Lumz4NfDv3AEWpm1CZQck67t9kcSWdGDXJ+uUEw8d25xylBFLyV
         ailaFuSyb7XznMSPzIkGeTEIavn+E6Tmre9Dz/l/HPtXejO1yJdA2K353O8guO+uGhP9
         CYjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHdCcxd9bA8TaR43waFcRzELsevXHFT3Rj2aTTmCqKiC01XqmlCQfTGIr5+m6UrUrYYJMTWCFFScRE0vgT3y/TL7XWowXCmNHHg94=
X-Gm-Message-State: AOJu0Yy0PHnOaEOoxwHIENrbHgmaT9bfBaE5B1Peg+Bw+ffaQ2M238pJ
	ORkvLCYuzH20wiMXqFg21C2Ag64kbjhcaUDHoZWGXhH4Fdsw/VTw/lM4uiijmCs=
X-Google-Smtp-Source: AGHT+IHlUR6tr4AkZIxnNVCmVJyL1+GTcAxpr6BEK7+/ok+vXPpzjma1XIjGPVoAIQtdu4oBvOLnKg==
X-Received: by 2002:a05:651c:19aa:b0:2ea:ea1c:3872 with SMTP id 38308e7fff4ca-2ebfc99867fmr7714501fa.37.1718179388737;
        Wed, 12 Jun 2024 01:03:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe76easm15489865e9.2.2024.06.12.01.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 01:03:08 -0700 (PDT)
Message-ID: <769ad0d7-57d6-4f1b-a276-5b284380a998@linaro.org>
Date: Wed, 12 Jun 2024 10:03:03 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] input/touchscreen: imagis: Add supports for Imagis
 IST3038
To: Raymond Hackley <raymondhackley@protonmail.com>,
 linux-kernel@vger.kernel.org
Cc: Markuss Broks <markuss.broks@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20240612032036.33103-1-raymondhackley@protonmail.com>
 <20240612032036.33103-3-raymondhackley@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240612032036.33103-3-raymondhackley@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/06/2024 05:21, Raymond Hackley wrote:
> +
>  static const struct imagis_properties imagis_3038b_data = {
> -	.interrupt_msg_cmd = IST3038B_REG_STATUS,
> -	.touch_coord_cmd = IST3038B_REG_STATUS,
> +	.interrupt_msg_cmd = IST30XX_REG_STATUS,
> +	.touch_coord_cmd = IST30XX_REG_STATUS,
>  	.whoami_cmd = IST3038B_REG_CHIPID,
>  	.whoami_val = IST3038B_WHOAMI,
>  };
> @@ -415,6 +429,7 @@ static const struct imagis_properties imagis_3038c_data = {
>  #ifdef CONFIG_OF
>  static const struct of_device_id imagis_of_match[] = {
>  	{ .compatible = "imagis,ist3032c", .data = &imagis_3032c_data },
> +	{ .compatible = "imagis,ist3038", .data = &imagis_3038_data },

Where is the binding? Compatibles must be documented BEFORE they are used.

Best regards,
Krzysztof


