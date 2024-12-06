Return-Path: <linux-input+bounces-8420-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5719E68B4
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 09:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E8781885F97
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 08:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E4C1DF260;
	Fri,  6 Dec 2024 08:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nnU0ggwa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FD21DED74
	for <linux-input@vger.kernel.org>; Fri,  6 Dec 2024 08:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733473480; cv=none; b=bNa/7alKsgf1fZ/yqnAiwB/0R7ry+5OdObNOSaea2W6aPcwy5jXxdnOktkoWGmMOtiz6IH0xzcWv/1ateZCEpgwmDZC36yl66QKCQ4xa5QbI8p1LkdGSrdqeaQdbNYmHL3kX3ep65e01vaGmxaw1H6zX9EG6KwvbcE2miO1SbhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733473480; c=relaxed/simple;
	bh=0DfccTl8+muE9NKRW7eUwTCbAfH4V8f9Equkc8P+Omc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tW6ffQ/fChe3fI9xkuMVYl8DZfgcUwDbqGZOjmsHFW0LLPfUZRFBKym4U0YisNo5+QGDyUj4qSvhj9RIaOrNYDMfnsvIbnQYXcBLo9/BL8GWG773qi/9ZaOzD9Yb80nkha9TThcoPCvIrf3IOU5CEl6X60AMmeoH0oN/3AxawX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nnU0ggwa; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a45f05feso19685585e9.3
        for <linux-input@vger.kernel.org>; Fri, 06 Dec 2024 00:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733473477; x=1734078277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3qKpnQEPCYEg1K2kdUeTts4GQ1nxeAB2oRRpHpctvpQ=;
        b=nnU0ggwaUiz+ewJ1ImopObRPdFA/2226PNs6Y5atzt2EOlS00f+7UUAmPuWKvYA8mN
         NSHYKmcfhXZFPdVuK8URgoZQLvHpH75CYBG0q6TTu/zrg9DFf2F1M7fxPt+67ZQTeqjw
         BV2HKzR4TtBRMxDyoq+9fQh/csgIGAOce+ptb3mFvNzvZrQ/rnO5vdd0TxLhiquL4lMb
         +pMSilTd8Im1xtm8V3I5GBp5FDLs/LozFV0CiLnYEgVn9LTR1JDIBVAPzqgvz3XzMvoM
         wUgKaoxTGt9U1HSgoqrlWBBUCKn7+dP2f/ARD+vugOuNkpICo307/8GicRxTdsaJnBqB
         TB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733473477; x=1734078277;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3qKpnQEPCYEg1K2kdUeTts4GQ1nxeAB2oRRpHpctvpQ=;
        b=wpUTzSryw3BQhRBOU+Cw7WoO8I+aPTGluk55LJoB/OHz6scJdXw7oUG62fHoT9FfRC
         SPaObapbTXwYu2jxs1W0WTM2Cc4ECZfTHNKuerqE0k4+Efavrec9ZRHVxpiA0Xk5bZI2
         tKtyQ6q078/sasxOAadDoL325JczXFZ2Y1otgLShRv4QXUQjccjH7RC/hvbqr56OYQZj
         5V54ES98BDkHWkX/Gme6pD3K9Go34BMkg/2hvaeQPv7LBdwoOJQuGQ5O57A1YCYai79e
         x7M4aPxai0IKxDC5TVKosFQxjm74YlIGcd96vMQa9KAuKLNt3p+cY3u7bkeS61+V37He
         4wgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw9lANycErCLXwGlY7ETA+DN9p+YNHAy2eFda21OoDiye0O5CgQPMMls72ETm6rBZZQveT6/HaslH2zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxo+ZZcOVK7k7W0jmdnR+n86GtlGzM9YWdFxZLDKLMh/GFBpkr
	EPrrHH956E2cF6YESkuacDrPUeQ/vawd9HrzGgyg2ETdmH1o6eXRdOQJq7Kpw+4=
X-Gm-Gg: ASbGnctoS0XkN4f71m8OBpaDjvcglxh9pT0xZzYcGVB1L5iB2I9a13k0wIzlQ7X+6c7
	iVwOvDZQAmygBXl6kDLXZFrJlRDVeKr2UcWEIatVH9QJz/R6AE3U+7OC1WodsgAW/UdHuL4Nb21
	EC6wKpZd0xoLTuVEXKyerI0yKC0/qP4rqIFZe8zJg7B1JXh5S5ezh11l9rbLOpc8irmVQi3A33W
	3AnNU5u7vv+4kxRajJNgLg9Hqg/mGr+n6+IFJE2x1hjoGtlWNrSR8lTsOr9sIH0ObAg4EygabM5
	WwK5aPswXv0JDk/klC2F3PVSGi4=
X-Google-Smtp-Source: AGHT+IGoVfHhH1X8yNIx34c7jm06JgC6wOFXWJHE8vrzAkTfBDx2e+2GtimjAR+VU4ZfqtL6fc4L3A==
X-Received: by 2002:a05:600c:3aca:b0:434:9ec0:9e4e with SMTP id 5b1f17b1804b1-434ddee2a6bmr20329645e9.30.1733473477411;
        Fri, 06 Dec 2024 00:24:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:94d0:55af:a150:5d08? ([2a01:e0a:982:cbb0:94d0:55af:a150:5d08])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da1133cesm51065155e9.34.2024.12.06.00.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 00:24:36 -0800 (PST)
Message-ID: <5d1ba835-354b-48d3-83fa-a3e70992e57e@linaro.org>
Date: Fri, 6 Dec 2024 09:24:35 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] dt-bindings: input: convert dlg,da7280.txt to dt-schema
To: Conor Dooley <conor@kernel.org>
Cc: Support Opensource <support.opensource@diasemi.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Roy Im <roy.im.opensource@diasemi.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241204-topic-misc-da7280-convert-v1-1-0f89971beca9@linaro.org>
 <20241204-duplicity-throwing-42a3faca5199@spud>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20241204-duplicity-throwing-42a3faca5199@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Conor,

On 04/12/2024 18:55, Conor Dooley wrote:
> On Wed, Dec 04, 2024 at 11:54:35AM +0100, Neil Armstrong wrote:
> 
>> +  dlg,bemf-sens-enable:
>> +    type: boolean
>> +    description:
>> +      Enable for internal loop computations
>> +
>> +  dlg,freq-track-enable:
>> +    type: boolean
>> +    description:
>> +      Enable for resonant frequency tracking
>> +
>> +  dlg,acc-enable:
>> +    type: boolean
>> +    description:
>> +      Enable for active acceleration
>> +
>> +  dlg,rapid-stop-enable:
>> +    type: boolean
>> +    description:
>> +      Enable for rapid stop
>> +
>> +  dlg,amp-pid-enable:
>> +    type: boolean
> 
> Shouldn't these ones be "flag"?

Yes, I'll switch to it

> 
>> +    description:
>> +      Enable for the amplitude PID
>> +
>> +  dlg,mem-array:
>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>> +    minItems: 100
>> +    description:
>> +      Customized waveform memory (patterns) data downloaded to the device during initialization
>> +
>> +required:
>> +  - compatible
> 
> Is this right? The text binding has: compatible, reg, interrupt-parent,
> and a handful of vendor properties required. I don't see a mention for
> the drop in the commit message.

Damn I focused on all the other parts and forgot about the required...

Thanks,
Will fix this in v2.

Neil

> 
> Cheers,
> Conor.
> 
> 


