Return-Path: <linux-input+bounces-1771-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CE884F194
	for <lists+linux-input@lfdr.de>; Fri,  9 Feb 2024 09:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C9E31F265FA
	for <lists+linux-input@lfdr.de>; Fri,  9 Feb 2024 08:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFF7664A1;
	Fri,  9 Feb 2024 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HX/i/UR+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B30C65BC7
	for <linux-input@vger.kernel.org>; Fri,  9 Feb 2024 08:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707468436; cv=none; b=VGEIu6Ig2w15FV6fCvZHflZO6e4eBOGbx0zyM7lVCTyRTjliDJqDQQjnEI0nc35GeZa8sIXsqXbQh+P6EGSdTxICleD6PEWazSMa1efEF1+/kAW3YvfaVZFoZ4ZVMrzD3iQL29uAq33jYiXEuAsiYqgGQPrtOZc9Gxsqhm/Hm+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707468436; c=relaxed/simple;
	bh=Yq5UujJZ9gNbxx0FJ5Q+MkbZItwoSotxmpynItNcFus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Opnlg1zJ3H7sLH0kY8IoRNOUTVeNngf+tMGymtUb3g6yTkGFn9sVFgx2CLdbnHXcAkBZk5v6dHy23hhcNqXDIMMEjaPRd8V3HK7wm9uTKWQ1a4IBXgWMOniYgWRiA5ZNFaMzojOPN8Znul6xnMPJ7vA/nhz1YwPIZ1xM3aHwmdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HX/i/UR+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33aea66a31cso333699f8f.1
        for <linux-input@vger.kernel.org>; Fri, 09 Feb 2024 00:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707468433; x=1708073233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UY1Vpgyo2v6mTMBq+DCCOOF+OZjFSypG4UZjWG/dUO8=;
        b=HX/i/UR+OPF+Mtthoo9fNQlVo0kKJpxqDgvqkM7K09tWChshWnA0EPckoVTHvKX4K/
         hxhRzeLWjM7D2vYgOgWNigybwT1xA9M17uzdAHq5lSMHODubcmqtM/b3mMas+B6tQCy3
         H5kaSMsyTfUGWD1TOF9DEn4ADCjTgrvsFKdDTbuf+8DcA6f0uE3CK0HPAz/wEoVnUSQV
         EvvBiq/5NWIFhwtnoC3gh5w4EyAf8+4vSddBzuzHaWrlzSbMWsM6VI6ODdd0XEIEtaNF
         A1qxD1PR1oXSyTIuavaf0+YNO+5fF/xPNyMFVULcKczurtfGJvfFGQBqMUg6EQlJ8hvs
         I58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707468433; x=1708073233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UY1Vpgyo2v6mTMBq+DCCOOF+OZjFSypG4UZjWG/dUO8=;
        b=NwNQhYczbZc48o8rZ4JaStoxa87+a6Ppj5aGHi16Ac1QOYZMKBaRKK/Eck1PQlqYB/
         mo2nvaGdQmhCdRmgHkim9Ut02iF2nDDO9uqsNbbTJGnDDuDAn3phQeUHXI6RTnv/cleI
         UWnxGS5sXAyJkffWi3ADGLkG4hvox1O3hNtwnnYiZ1k8Oksin6pnUcgIlgn9XSbHtFmW
         NmGsnk17Grr2VdtvexR3mSndcxhs5XX/1j5SKJYU0/jJ7DVmxePHiXSfXvd8+u4eclrY
         eIc7oEsqm7/+ada5zjUjsxEU6Qn+g9cYKKH/x4n6fHEYhR51VHY86GGdsx8sDfQT0pkx
         lNLw==
X-Forwarded-Encrypted: i=1; AJvYcCWzQg49eXEBI02jYluArdVO3VStD9/393gBqDus6Cx1qXwMTipkl8s889IcwW+cuSZq/1qXRHSOjFGtxZqkoDZBsTxK2Y8xLpqO+P4=
X-Gm-Message-State: AOJu0YzqzCyNJJJJhUMz/shaIrRRnHgjaaZYh03ES5AC5ut8kHh1PTZ0
	P6tsTTrxWhkWylPNU8sb9lsRKlr7GBmivs7wzF34MtSBq5J5hFlhTuGcDCylAtk=
X-Google-Smtp-Source: AGHT+IGYc6ccFIwyY+17ihQxJo6gmJqAtVVZcbiKeu9XGw0w0Ok+us7bRBJ4gZkuC2yi5j4jmkSpQQ==
X-Received: by 2002:adf:e481:0:b0:33b:636e:c966 with SMTP id i1-20020adfe481000000b0033b636ec966mr615845wrm.3.1707468432773;
        Fri, 09 Feb 2024 00:47:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVv052/KJlbCgLKxvBt6afA6D2iipuGWt1C8qZUQPHgMTVlvPN4z/Vlg3XfPgo0vYwvRQTqZ7hFYOez5Af3clcBhvSEwrDAh2GhWpkhHu6P/9bBGLquGXgC3mBHg4gP1aEQD32GKW3OWEBMf8RkyY2yC3MEhG6ImbFB8/StHDWI5DJ90VYh2Y/av3TfjRh1V8by8BENe0t3NRVeTL/f9Q5rRzLL5XDEvCgZQHlydz6uIem2d15p3CLOq6z+TH1rKvlcUvmyPKL2DM26gYYhwP3e+bVLQxjbfjaF/RW7pIa2xzE/cVA49iFUEcwDpu4irWspnYS7y7S6Rw1sepbdsYSqHSXcg0AVE7XhUSuamGWTmVnhCcmAL/6uGsbMzLMbxrr5cDXVcITydyZX1y4V8BmCKviIS+slId97oJ3FXGQxmc8OkyyLrSUT13xuAMtQLHz48ZEl4J/XA3B+eUg1f2npjxbZL6fgD7Q=
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id n3-20020a5d4c43000000b0033b3ceda5dbsm1239275wrt.44.2024.02.09.00.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 00:47:12 -0800 (PST)
Message-ID: <f6f19f9f-b94a-4194-a5e5-b549471cf47e@linaro.org>
Date: Fri, 9 Feb 2024 09:47:10 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: input: atmel,captouch: convert bindings
 to YAML
Content-Language: en-US
To: Dharma Balasubiramani <dharma.b@microchip.com>,
 dmitry.torokhov@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: hari.prasathge@microchip.com
References: <20240209064755.47516-1-dharma.b@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240209064755.47516-1-dharma.b@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/02/2024 07:47, Dharma Balasubiramani wrote:
> Convert the Atmel capacitive touchscreen bindings to YAML format.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> Changelog
> v1 -> v2
> - Drop autorepeat property.
> - Use unevaluatedProperties instead of additionalProperties.
> - Use node name "touch@51" instead of "atmel-captouch@51".


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


