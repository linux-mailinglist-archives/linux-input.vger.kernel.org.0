Return-Path: <linux-input+bounces-4465-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FB190DC3B
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 21:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43E021C23132
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2024 19:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2ADE15EFA1;
	Tue, 18 Jun 2024 19:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oH0hcvFJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE80B15EFAC
	for <linux-input@vger.kernel.org>; Tue, 18 Jun 2024 19:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718737927; cv=none; b=lptHhAPyoLmQfhiyvbKXQlggDeoNVWbo0pmsROc/ME7BtUW7YvZwvbidW7y+Ff6UVWiRlW+tQLW9L77IzG5zLVh4b99hKbOdYYTmI4fcz2aaJO4u5rTuYV5qcgdM/921PyS1upa/91kW+D1cFZxOhdJtbko7w2Cy7ldV5mbyFzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718737927; c=relaxed/simple;
	bh=V6TUkHZXRl29GH5tB+9zD1O+XS7wyCwcd/6nrTmB+zo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AMZBug6UBb7GWW5qbQh69zXvwjPuJwEKxRPfYFc78HoikIAkDmkVr92aIvsNGz8D00jS/7ELN0u7nRn3/wQxV/lnXvQU74bZhbSfkbPcDhFAkHHKV/850o9t308PIeww3iIw2/pSlMl3/OrmDOT3ZQRJkaMUvdTp7SJut9JgNH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oH0hcvFJ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4217136a74dso49015085e9.2
        for <linux-input@vger.kernel.org>; Tue, 18 Jun 2024 12:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718737924; x=1719342724; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f8+/cR8dmnRCIY8KO1c6EzfyrRTOkElOzLEANvqSOFw=;
        b=oH0hcvFJ7FmVmxz8THavBoaaaDNUg/2g4Z6LQuingacqxNEXmPzSba9sw4TOfi492Q
         ooW+qyu7XLOz22qJtfnr6/AwZa8qp6je324y00HxdtdPZebey5DLkLE2XUdSAgZntRq7
         3ULheWyKCY99KmTO1ePsCu4PxnXk5M7s1jZcGlXhssPN5elk8ATtHOYNi0t+I5f6qvd+
         TWe2H/5jBl+xtvh7NRA+yfKJWXBGFq7fVgRTq1xBECGXEvF2iXCxeq2jal3oJgtrDO4i
         TC1F+3uLJu3LyNbchFfqH23CB1Xg9OeZsZvFWA0qVcA8y0cYcLSFg7DPyiKuyCGqdLre
         5lLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718737924; x=1719342724;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f8+/cR8dmnRCIY8KO1c6EzfyrRTOkElOzLEANvqSOFw=;
        b=mPxAZgib5v38tzeKxEfSovz6G9CGjCFApd5W4fCBqjceLMXwETMss4x5ofGH6uoIkd
         LykaHOAvVekIhBYAIoSZiVVXw/cVioo5g86R9wxzuYz0kFuJs3fQkcZFnPVOXsmZP853
         qiXXzRmilJvJyXE4gGasiJrJzP4an0O5cT7rCgEpb2PQii3On/gco1+0pRba7Qy7WXe0
         UIG67AwLdN4a/eaFYxchrVqF3qbq1Glx61WuQi9SEtG+PSzW4CfQjeLYEJ1G3AY4cbCq
         GO8419wPxgrpdyPdJEIoCVAEfeBLStQvucnH9Ojolcm/ri9YNr3izuMS0Qi4bjyPYHWw
         cRDw==
X-Forwarded-Encrypted: i=1; AJvYcCXXHgnf5eh9CjncrGJNPOoOfi830cEFctZq3u1XpRZW8jkV47ohUgXOni3tRidcYa03OvrbeoDJAGX0/+BQ4vtdHJtPvaOm8faORac=
X-Gm-Message-State: AOJu0Yw6Kb4wiOVn3YdA69QKjMebSHOxgKWNfMEU85wgllBbdkacaZQn
	bLtkTniT1C+UFD2M2GMIXENlInuscdCjZsgzk3/joZGHAWbRrE/clxmBPdnS5w4=
X-Google-Smtp-Source: AGHT+IHdn2YVcteO5gHaAZyTpV2RKc9NRMuQMnYAe8emYCZSQL9/iTeEcqYKL05YMuGAZiFOdSXtsQ==
X-Received: by 2002:adf:fe11:0:b0:35e:5bf6:5432 with SMTP id ffacd0b85a97d-363175b8c65mr437516f8f.21.1718737923890;
        Tue, 18 Jun 2024 12:12:03 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:5d11:7fa7:8997:f811? ([2a00:f41:9028:9df3:5d11:7fa7:8997:f811])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-361a85074a2sm2280828f8f.25.2024.06.18.12.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 12:12:03 -0700 (PDT)
Message-ID: <85e03d10-59a2-4f15-bb85-7b2c0354a5d1@linaro.org>
Date: Tue, 18 Jun 2024 21:11:58 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/23] gcc-sdm845: Add rates to the GP clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 phone-devel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-2-e3f6662017ac@gmail.com>
 <wnf3mfgdm4p4f5wrxdtlx4wccnizdvohc7iiyu5t22eeb67r57@xun3r73hksrg>
 <ad04e203-4244-4cd3-9c9a-fae002962990@linaro.org>
 <lwrz4rvn6ogseea5v6j7plc3yi3xnzo76dvrsl3muat3iswlkb@zmwa3xo3xgw4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <lwrz4rvn6ogseea5v6j7plc3yi3xnzo76dvrsl3muat3iswlkb@zmwa3xo3xgw4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 20:55, Dmitry Baryshkov wrote:
> On Tue, Jun 18, 2024 at 08:50:52PM GMT, Konrad Dybcio wrote:
>>
>>
>> On 6/18/24 19:50, Dmitry Baryshkov wrote:
>>> On Tue, Jun 18, 2024 at 04:59:36PM GMT, Dzmitry Sankouski wrote:
>>>> sdm845 has "General Purpose" clocks that can be muxed to
>>>> SoC pins.
>>>>
>>>> Those clocks may be used as e.g. PWM sources for external peripherals.
>>>> Add more frequencies to the table for those clocks so it's possible
>>>> for arbitrary peripherals to make use of them.
>>>>
>>>> See also: bf8bb8eaccf(clk: qcom: gcc-msm8916: Add rates to the GP clocks)
>>>
>>> Each time I look at the table attached to the GP CLK, I feel that it's
>>> plain wrong. In the end the GPCLK can in theory have arbitrary value
>>> depending on the usecase.
>>>
>>> Bjorn, Konrad, maybe we should add special clk_ops for GP CLK which
>>> allow more flexibility than a default clk_rcg2_ops?
>>
>> If we can somehow get max m/n/d values for all possible parents, sure
> 
> Calculate them at runtime?

We'd be calculating the mnd values for a frequency that's either equal or
reasonably close to the one requested. My worry is that we somehow need
to get the maximum values they can take (unless they're well-known)

Konrad

