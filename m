Return-Path: <linux-input+bounces-3054-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 097C88A5BCD
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 21:57:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A9921C203A7
	for <lists+linux-input@lfdr.de>; Mon, 15 Apr 2024 19:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24DC115667B;
	Mon, 15 Apr 2024 19:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rse/ptI2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5CF156893
	for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 19:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713210759; cv=none; b=ARLFkPtO8EHv6Tn9L41l3csjPRJGGurA9VQL9ZeRrmYJ1gyi1mGsIfUsOT/+BKtkHTFWashG0+kUbjMmwyu4UYZDQX5YlewB3fOS4KT0E7+27OieCHqOvHmlcMpjzvVV3SD52fty4M7ELQFf37vtzMvu7FDlJpoacTMW+6ePPpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713210759; c=relaxed/simple;
	bh=J7nXo825g2LLNHOTbM+8C1BAkdGVZo0J2e5tsXt1TPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OZIkpIdc7m6gN2fohijqv1kn1FA5NF8oKGo79UJRhD+lgknZgZ71NbRa7xAi44WxWv1s4iynoGr8hp5BJ7oEPcNo2Vwt+MS8x2nOyqc5/a5tIPUOuhZIduFUljJIr2D3TAOKupRL/q8n0HB6RaXzlPW4xjqM07I0PrfrxK9eWdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rse/ptI2; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-516d0161e13so4417144e87.3
        for <linux-input@vger.kernel.org>; Mon, 15 Apr 2024 12:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713210754; x=1713815554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YEXHGjxAhZs0bYA15G3//QkZWLtdxl3JXDF1n5TYCXc=;
        b=Rse/ptI2iG5kSiBOBjsvbH+IiHbN8uzilAGB9aGfs/g2t2M1hVa2jm+4AchE+VS24O
         7saRVuIKM4gxiJNhZlhiNVAd/kcwk4/KuYtfpm7ll6sRtLmebQncyA+dCYo90vX5l6J1
         mmqTv2OS0bBRkMWiuBfAd5IxRNwZ7dpICBxrP+0Qse6ChEuhNlu7ceUGl3iTKqMV2LkD
         4EaZnTqX9nkiCT8e64IQkfajcdL858jSsTQSqA6CwQAfZdPv1dw85QRDKaDSj6KHMPTK
         28eJBIzjGUIOTYFD6//Be0VDNpcHYT4AvXHNv+FNacIolEoqzrETrZVfsaFhL4KjxwWX
         7M+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713210754; x=1713815554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YEXHGjxAhZs0bYA15G3//QkZWLtdxl3JXDF1n5TYCXc=;
        b=shSxOj1H4ZTtXxyn2lR3MvZv80wC1luol87Us6+OiA02rR/IsYB391xtn1QItCGFG4
         mRcN6WgmJGu/I+UTymfI5ZWSRQ2SUt4420S5t86kaYWqeKtiOezmtvysHqFlnfWP3RhB
         Oj54+Vi5O/g8LMZFjZHODolg4KzA47I2d2dmzaArOXsEFrTJ2ugjOS3RIFG3ObR0lNhy
         tqW7N8qmeHw77Bl2xbeMtDQ7g94RR76Qluj4RdkzyDbz10hXHKC8keViduNi6CkDuKf7
         XAt88hY12LAlOYFfGlNn0i/UjkcHSG7tbt98zpPYHq9uuXo0iv+8z2R1EcTVVRh+It0a
         V33w==
X-Forwarded-Encrypted: i=1; AJvYcCVJs6bgR95C4JJl0YDo8kMtuICy3Wmd/o5GKii3TBI6b2MYu7HGq+VWn1A3l2cEkEU9L9PqBodoKQRy/ogpB/3L9l253pQM+rq9Fz8=
X-Gm-Message-State: AOJu0Ywosi5BMN+7qOtUpjuDmljRK0CIxXzNgNbpABjPwI3fWmOEzWzV
	7ES4uODmOPcyiF7KpZOwkDr1kCQRkw2vLl2HQnDeDpDnr7XF9pIXI5QMpYnhz2E=
X-Google-Smtp-Source: AGHT+IEal04PxHzEYGFi8jHEhHfii3wvIFaJa5SsgptPYcD/6a7aBein+xl+JbCkDBh8KNrg33Rtug==
X-Received: by 2002:a05:6512:b92:b0:518:872f:e4d with SMTP id b18-20020a0565120b9200b00518872f0e4dmr9145171lfv.15.1713210753936;
        Mon, 15 Apr 2024 12:52:33 -0700 (PDT)
Received: from [172.30.205.18] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id j5-20020ac25505000000b00517374e92ecsm1339725lfk.93.2024.04.15.12.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 12:52:33 -0700 (PDT)
Message-ID: <daf1d116-5bad-46f6-ae6d-a33913f68506@linaro.org>
Date: Mon, 15 Apr 2024 21:52:32 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] input: pm8xxx-vibrator: add new SPMI vibrator
 support
To: quic_fenglinw@quicinc.com, kernel@quicinc.com,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240412-pm8xxx-vibrator-new-design-v10-0-0ec0ad133866@quicinc.com>
 <20240412-pm8xxx-vibrator-new-design-v10-4-0ec0ad133866@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240412-pm8xxx-vibrator-new-design-v10-4-0ec0ad133866@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/12/24 14:36, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <quic_fenglinw@quicinc.com>
> 
> Add support for a new SPMI vibrator module which is very similar
> to the vibrator module inside PM8916 but has a finer drive voltage
> step and different output voltage range, its drive level control
> is expanded across 2 registers. The vibrator module can be found
> in following Qualcomm PMICs: PMI632, PM7250B, PM7325B, PM7550BA.
> 
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---

[...]


>   
> +	if (regs->drv2_mask) {
> +		if (on)
> +			val = (vib->level << regs->drv2_shift) & regs->drv2_mask;

The point of regmap_foo_bits is that you no longer need to mask the
value here.

> +		else
> +			val = 0;
> +

You can also save some LoC without compromising on legibility:

if (regs->drv2_mask) {
	val = vib->level << regs->drv2_shift;

	rc = regmap_write_bits(vib->regmap, vib->drv2_addr,
			       regs->drv2_mask, on ? val : 0)
	if (rc < 0)
		return rc;
}

Konrad

