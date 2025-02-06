Return-Path: <linux-input+bounces-9822-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFACA2AE4E
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2025 18:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC8683A7EEF
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2025 17:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149FF1EDA2E;
	Thu,  6 Feb 2025 17:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="atAosGeH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325351A5B93
	for <linux-input@vger.kernel.org>; Thu,  6 Feb 2025 17:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738861256; cv=none; b=QZ1tFGk/ZbxhL634IbZLQNag+zPOXU0cPzsV8ndoI+nWWRZSdw9HsZGyMY0pIffD7LjtLNN3LTpUJ8l1Y+l3LFYqoYibggl3SkIOgxgaK/XpsXSyBhfDCBQkEP3z4nXy7T//A+DMwRZH5GU+RjjhSB1XcBobyD9/XJYl9N3B9oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738861256; c=relaxed/simple;
	bh=2KESjK4QPH03vkAR9EEewv2R4WBBiPi2Wx/5YXeJpew=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZTmT3G45ZZTAwNQOlxyEgOx/YedcZ4ZbzxbrpPRj1d2bw5j99eo7JSIFicsOYODqxO7Sf584ETftvT1TbepUM+JsGAh4GslbwZqw01p0DT9+Hq6bUvtbr7f51WKLkxsZ1b/FMPvvkiBkwp/Vmk75OwixkLJuW91XsQ1+qZVbDwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=atAosGeH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso8043885e9.3
        for <linux-input@vger.kernel.org>; Thu, 06 Feb 2025 09:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738861252; x=1739466052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDd73kAUDEiHLG7A2LulTx8Tyaqwjdf6PwKTrHpETEU=;
        b=atAosGeHhouTpd4ADv7DDCOOsCPkmskv4uv+cfSnsbtQlplNroCfTicKdFuuNfb2pr
         oUEOj1ATJAzsXU/NBPPnwPvqbaLDJLoRRHJ9CbDVB8kWuvRS5Tj/oQ+z6Z2cRyBy86cN
         5y/DEdKPL/QMIo/UJvKGSkkFDLXrIBKNqI6mTBr3WudIXt38mt4nYR3Dxk+0KDcP2AYh
         m6XgAQXjeHUsTFYWX0Est6gg//V0rOlfwQzuh0M6DOi5b/ufLwD97aneCIG8jP7MZmjh
         tQftMYQbN6ZLSYnDFLyWwqMRVNw35Mi1IAsrWuKyHEnhsH6U+WxeO00PPZnlgSXqnn/g
         Pnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738861252; x=1739466052;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UDd73kAUDEiHLG7A2LulTx8Tyaqwjdf6PwKTrHpETEU=;
        b=YHJt/fQQ/ZFyzhqcVDZ+PbpVWbgSS+8aMwc49dhQLG6pEhIRUg+aWTw/ArOa8JurlV
         MBHZ305kwqS6+NQ0XyffOLOoNbtGSlMK5V5UwXHT9EClDCAW/ZNFAAK+kZNdXdmSy8Y4
         fS+kEVJybVXW7ZIs2YsVSzFdQiy+Ka92OEAOduB8jgEgjyut+c39HvWYDCmfLqIC+nGz
         2gcSHMHSLGLi4Y+uxtXu4oFCQ56q0/oHyAgqvAZAb54VFaHMhXPdthhRwcxJGRXFgmK/
         Bs9VCgWEWPlFKoQiYJnTNAtHDNvbngTEp9/mKGjDbMlOWqEuDLK5HP8t61ez+IlQG6Qg
         0riQ==
X-Gm-Message-State: AOJu0YzLGthcDIrfxPXjRIV1PaT8tglf8LUyprk4JmjQrbogEwCnKURC
	adj39xvh72EkYj+5zMlIVDM1Tt49p/7b8j32S6oTdsBfmKA4b1sEtO5kOCCuB5A=
X-Gm-Gg: ASbGncsjQGKWQI9Zj/YqIYKjaBszwS+56e6FselULGUvrgl9ql1anBTTKi9mvvxrsvH
	44DtsMBqqtjjsVpl4iYYmUYTSs7hzymoTd3T3SKQ58WEtxbRUKJ64p4ISojzdWkLWhZJhIRMmuC
	rvE+VpiY48hEB7oZsF1Y19qt1JMgSnwIhfse8NIvCzjjAwxY42mfjqPdbgHwdJRQylE9n5PKCXE
	g8kCUBl+Iy0URPIon3x/8WREx8F6k8oHxKUHWm0K7OeK27+KUuf6ty97DCGTCamn0be4TfDcdBx
	q9WzeoCK7Lbf1A8zb4BBNI+YWtLrhbHTZw4oMzKWJwZR/z+0t0sarHYt0GAG+nNoH60f
X-Google-Smtp-Source: AGHT+IE6QUaFsjLZ1f1F4uXzw4S5+DVGxlv9mE8DgJQtpZhaoZcjaExCmvl9FN1EHzUrx1s8iY9aSQ==
X-Received: by 2002:a05:600c:4748:b0:434:e9ee:c1e with SMTP id 5b1f17b1804b1-439249e6676mr1074135e9.31.1738861252003;
        Thu, 06 Feb 2025 09:00:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6? ([2a01:e0a:982:cbb0:4972:46a2:e0cb:c0a6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd36346sm2173496f8f.27.2025.02.06.09.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 09:00:51 -0800 (PST)
Message-ID: <ce212ff8-842b-4215-b2d7-c783a981f44c@linaro.org>
Date: Thu, 6 Feb 2025 18:00:50 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 0/2] input: convert dlg,da7280.txt to dt-schema &
 update MAINTAINERS
To: Support Opensource <support.opensource@diasemi.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Roy Im <roy.im.opensource@diasemi.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 kernel test robot <lkp@intel.com>
References: <20241211-topic-misc-da7280-convert-v3-0-4df87ac08881@linaro.org>
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
In-Reply-To: <20241211-topic-misc-da7280-convert-v3-0-4df87ac08881@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 11/12/2024 09:15, Neil Armstrong wrote:
> Convert the Dialog Semiconductor DA7280 Low Power High-Definition
> Haptic Driver bindings to dt-schema. and update the corresponding
> MAINTAINERS entry.

Gentle ping, do you have any comments on this serie ?

Thanks,
Neil

> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v3:
> - Add conor's review
> - Also fix the MAINTAINERS entry
> - Link to v2: https://lore.kernel.org/r/20241206-topic-misc-da7280-convert-v2-1-1c3539f75604@linaro.org
> 
> Changes in v2:
> - Switched to flag instead of boolean
> - Switched the array to unit32_t, because this is how it was defined in the txt, DT and driver
> - Link to v1: https://lore.kernel.org/r/20241204-topic-misc-da7280-convert-v1-1-0f89971beca9@linaro.org
> 
> ---
> Neil Armstrong (2):
>        dt-bindings: input: convert dlg,da7280.txt to dt-schema
>        MAINTAINERS: update dlg,da72??.txt to yaml
> 
>   .../devicetree/bindings/input/dlg,da7280.txt       | 108 ---------
>   .../devicetree/bindings/input/dlg,da7280.yaml      | 248 +++++++++++++++++++++
>   MAINTAINERS                                        |   2 +-
>   3 files changed, 249 insertions(+), 109 deletions(-)
> ---
> base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
> change-id: 20241204-topic-misc-da7280-convert-20efaad588ca
> 
> Best regards,


