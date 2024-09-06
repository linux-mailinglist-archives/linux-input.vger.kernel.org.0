Return-Path: <linux-input+bounces-6281-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5079896ECF3
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 09:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C06981F27895
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 07:57:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5595D15383A;
	Fri,  6 Sep 2024 07:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Loj1+UQK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31A614D282
	for <linux-input@vger.kernel.org>; Fri,  6 Sep 2024 07:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609430; cv=none; b=B9tgf3Mpg6cHl01lMNVWsTexCWrqOFZ77DOmvccJ6H6jIozviJPcbHgSMMAlQz3c653JoMItFbNnhu+Dw3JIAs+SveLm3a7//TpkVdnxYv9EqwVxUHGoHh5YFceNqb3Ke8R0gF+OQAaEsjriTKAipxWSdp2Ccev0JO7XNHw36Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609430; c=relaxed/simple;
	bh=Wh9SlVbbUmrFXHHWJtHJsESHp2xdw5pRp/k9kgTL2yg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZLadz+mZcP5/1J/K9xcVM2L/PAQOYGGZDvBS4Hq7O1Q69z4+SihtpUeroJrWBEPcFTOjcwVg9CsV9diDuznX/JDVjEBHfHU9tHAOLi9hajeV+gj5VdhD4mnQTi++AkA8FElhKavN1NIeTzCqKuDlQIwntNXfKbGe27Q8gec7S6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Loj1+UQK; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-374bd059b12so948004f8f.1
        for <linux-input@vger.kernel.org>; Fri, 06 Sep 2024 00:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725609426; x=1726214226; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvVkrkpN6j+a38laIGqZJX8O9Gb4gq72X5FJNVHGZIY=;
        b=Loj1+UQKFzuJENfDiEP2zw7IytUhba182mni8b/+MiXecXaUIJDG1CgM4TocNwkYmh
         IC4a9gWaqaTWIHyUvhtwIgWMxdF8VK5kA/c3n8bEjh5UXZZFQS3Ttq3aON20kC1DRs/7
         hfyJZifbmztwADIihDmtvBBshIi2D3lNJqXYkSA57s+Eu1BzGQBGMdNDCCDfkRoyBkeO
         /I6aMxadOSeJ+RlxAWehMUl0TPIUMXVH+rJURNdodPQdUmWc2kxQhWKyS8DBV+eMk8XV
         LwQ+T8sGDlO+kpM81U4ZpEBg5Daw6mEqV/IxIUfbYWM/rMhqdQTf5vCrRDGnqPo71xQx
         nnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725609426; x=1726214226;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zvVkrkpN6j+a38laIGqZJX8O9Gb4gq72X5FJNVHGZIY=;
        b=ZNaLXgK+MtDUCvvr2HnE06qG7hvRHKGFVn5svWssQyKgFOWW49S4e6f8PVnY/lu7wz
         Id3ySi+Tvd92SFtmth8sB8RSRKdlLgjsrUnpw0OOXZXRjaS+qc8HLB9Iojglin3+pnYb
         APZxcYR0AA1MAYKbDghyhySMqdYrcad9tta5JZ2fnIuF5lpkH7UMoqowFiYaLxP+tSm9
         JHY8LDE0Jbu6mZMFFf8ukY91ZMRzrylLs8usGoiYDQKUirOzUOALQuP6najkSMghLFeA
         wFVpUW+OQxh244fV8orw6DfIh8erXha7fOKEpKRWIVp5LUF67i8J4JwvDXMsnDJmH/xg
         YFhA==
X-Gm-Message-State: AOJu0YzTvNH7s6hcMzpZ7FD0pPCxT7hETP9NUSc1swVOVNYEqdYc6X+N
	FnJq6wYqi6KbRO2W4nbAwCCTsXGBillAm+svHjew1rFVTpyddvyJOp4Ga5roZvIiSkwr/Sj/bGx
	P
X-Google-Smtp-Source: AGHT+IHSybREBxFmsJpzKFaWK/9SX109W2qtCK1HRP856KH1y0kUhbi9NMZgjxRJtRzCZz9Kgex8kQ==
X-Received: by 2002:a5d:5f4a:0:b0:374:c269:df79 with SMTP id ffacd0b85a97d-374c269e0d7mr16043530f8f.22.1725609425782;
        Fri, 06 Sep 2024 00:57:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:75bf:cfcd:3d88:2a0e? ([2a01:e0a:982:cbb0:75bf:cfcd:3d88:2a0e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374b67ff88dsm18204067f8f.26.2024.09.06.00.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 00:57:05 -0700 (PDT)
Message-ID: <c68d7894-501c-414c-8460-3009e2536af6@linaro.org>
Date: Fri, 6 Sep 2024 09:57:02 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] Input: goodix-berlin - Fix VDDIO regulator name according
 to dt-bindings
To: Danila Tikhonov <danila@jiaxyga.com>, hadess@hadess.net,
 hdegoede@redhat.com, dmitry.torokhov@gmail.com, jeff@labundy.com,
 krzk@kernel.org
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@mainlining.org
References: <20240805155806.16203-1-danila@jiaxyga.com>
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
In-Reply-To: <20240805155806.16203-1-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/08/2024 17:58, Danila Tikhonov wrote:
> The dt-bindings specify the regulator as "vddio" instead of "iovdd".
> 
> This patch fixes the regulator name from "iovdd" to "vddio" in the
> driver code to align with the dt-bindings. Fixing the dt-bindings
> would break ABI, hence the fix is made in the driver instead.
> 
> There are no users of this regulator сurrently.
> 
> Fixes: 44362279bdd4 ("Input: add core support for Goodix Berlin Touchscreen IC")
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> ---
>   .../input/touchscreen/goodix_berlin_core.c    | 26 +++++++++----------
>   1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
> index 0bfca897ce5a..b5d6e6360fff 100644
> --- a/drivers/input/touchscreen/goodix_berlin_core.c
> +++ b/drivers/input/touchscreen/goodix_berlin_core.c
> @@ -165,7 +165,7 @@ struct goodix_berlin_core {
>   	struct device *dev;
>   	struct regmap *regmap;
>   	struct regulator *avdd;
> -	struct regulator *iovdd;
> +	struct regulator *vddio;
>   	struct gpio_desc *reset_gpio;
>   	struct touchscreen_properties props;
>   	struct goodix_berlin_fw_version fw_version;
> @@ -248,22 +248,22 @@ static int goodix_berlin_power_on(struct goodix_berlin_core *cd)
>   {
>   	int error;
>   
> -	error = regulator_enable(cd->iovdd);
> +	error = regulator_enable(cd->vddio);
>   	if (error) {
> -		dev_err(cd->dev, "Failed to enable iovdd: %d\n", error);
> +		dev_err(cd->dev, "Failed to enable vddio: %d\n", error);
>   		return error;
>   	}
>   
> -	/* Vendor waits 3ms for IOVDD to settle */
> +	/* Vendor waits 3ms for VDDIO to settle */
>   	usleep_range(3000, 3100);
>   
>   	error = regulator_enable(cd->avdd);
>   	if (error) {
>   		dev_err(cd->dev, "Failed to enable avdd: %d\n", error);
> -		goto err_iovdd_disable;
> +		goto err_vddio_disable;
>   	}
>   
> -	/* Vendor waits 15ms for IOVDD to settle */
> +	/* Vendor waits 15ms for VDDIO to settle */
>   	usleep_range(15000, 15100);
>   
>   	gpiod_set_value_cansleep(cd->reset_gpio, 0);
> @@ -283,8 +283,8 @@ static int goodix_berlin_power_on(struct goodix_berlin_core *cd)
>   err_dev_reset:
>   	gpiod_set_value_cansleep(cd->reset_gpio, 1);
>   	regulator_disable(cd->avdd);
> -err_iovdd_disable:
> -	regulator_disable(cd->iovdd);
> +err_vddio_disable:
> +	regulator_disable(cd->vddio);
>   	return error;
>   }
>   
> @@ -292,7 +292,7 @@ static void goodix_berlin_power_off(struct goodix_berlin_core *cd)
>   {
>   	gpiod_set_value_cansleep(cd->reset_gpio, 1);
>   	regulator_disable(cd->avdd);
> -	regulator_disable(cd->iovdd);
> +	regulator_disable(cd->vddio);
>   }
>   
>   static int goodix_berlin_read_version(struct goodix_berlin_core *cd)
> @@ -744,10 +744,10 @@ int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
>   		return dev_err_probe(dev, PTR_ERR(cd->avdd),
>   				     "Failed to request avdd regulator\n");
>   
> -	cd->iovdd = devm_regulator_get(dev, "iovdd");
> -	if (IS_ERR(cd->iovdd))
> -		return dev_err_probe(dev, PTR_ERR(cd->iovdd),
> -				     "Failed to request iovdd regulator\n");
> +	cd->vddio = devm_regulator_get(dev, "vddio");
> +	if (IS_ERR(cd->vddio))
> +		return dev_err_probe(dev, PTR_ERR(cd->vddio),
> +				     "Failed to request vddio regulator\n");
>   
>   	error = goodix_berlin_power_on(cd);
>   	if (error) {

My bad on this one...

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

