Return-Path: <linux-input+bounces-7104-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A34EE991D3A
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2024 10:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5CEF1C21362
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2024 08:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 761B916F0CA;
	Sun,  6 Oct 2024 08:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fn7aLROt"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F133153814;
	Sun,  6 Oct 2024 08:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728203339; cv=none; b=aVjukLqOHRGJa0WOhJqTHsyTLrkzqzPK5qvhTggFl4B4snVJWhhTlFaLH06uHIFZQaUG6fAc3+8m7jF1AJhK9hvifAU6kM1a6njYGrmrCo+twVZk6gRXQlS/ZYVmv1TVptWwkooD8fCGzcK4FV+CAKo2SPyJQi3xWgnprJXqfrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728203339; c=relaxed/simple;
	bh=bRszkLFQ6+eC/BQ20gGJlgy57D/VgufvdZJVgc18ibw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ghFlFcLZMdy9J41oHPYOzuY+kRjEN1l30El0i9VePpMKW+i85Uv9uZx35zTV5/2GTKkjU6yMYLlumeP1FG41xo4FAP7N7/QilwIO/Z1/5zIhJTFvfVK4ecinNmv6DvPb1bmVoSq8PLlOQouoUz25ivH/dm+el2xWefExsD8L0zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fn7aLROt; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8d6d0fe021so595779366b.1;
        Sun, 06 Oct 2024 01:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728203336; x=1728808136; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=luc6tGLvhHVsfASvYGPZIDDNooQTCshdprtz+dgEevY=;
        b=Fn7aLROtPFPuDwVyIvTKLjHrQhphIbjBAPbAS+r+TGPSTmtVZxa9VDCysNxXHhSHf3
         whV6pP8pm7PCWfeTsWDzmOTscRRDIJBQ/XEqsU4Vx2MvL1nwrmB5Z1E9lunyOK+4pjs2
         pb0bIH/grp+S/oJciLYufGduRL8c/AYX3xf/FS8h93ijwt+Io7U8V5a32xI9Rmf/5pWn
         OxuqJf3eM/An7AIp4W4DdWjhusrMsxsmt7ESquw6yvXHhrazDZFwd4XVkBltpLj6nA+U
         LqUzWdJayKsWaOpWBDdAjc8lSzahxanWJgEC+XyGrdxIH4TYIQdU+T80NUSfygxLReJM
         y2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728203336; x=1728808136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=luc6tGLvhHVsfASvYGPZIDDNooQTCshdprtz+dgEevY=;
        b=ee88k0aHNYSVkibsp7WaxYdwLR4+XtoZWqK5GrDs+nsmABgOxguv6wxYUmrYDCePa0
         YCvy8Gm/4eq75iUjcycBLhMSn7dzH2BSY+6NIy6CarhVre9q21m556rG2t8s2wYY5mQe
         27KUFGYBp6KDqD2u0yQ3QcdNtgs/L8kHhhvS729Y6AGzJB6sPlhK4Myp46x7uZvRjKUh
         /WQPb38ux5GMpcoxeZtVqdRMqJ2Dw9HhcibpWSnKswIjPB10+R+sKzh5YTULdkGC0lKI
         LzzyupE+KTgxGJwY07Yo5Piv+3CZ02F5xW5LxbQI+05fVSrSuntI2q8bBKzhb0yGBADL
         B4XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaUDTKZzxEpMNMilzXU6JKMyi7gYHY/VRJ5UgD+6EqD7pYBPNMFNA1Zoe9rADMuYbayGbbB0X8jXGakWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO512zjxpnUtKJ/x3sZunAtOwUMspHnxEnrwjtgjGwHbwIAJo8
	Ar/8i6EI15JSp7xjTGWit6bMyZa+QYNgp8wz7eCrXq0c7GmOlecm
X-Google-Smtp-Source: AGHT+IGAL1Ndr1M6KLVYgsEmuO35omalB/CeUKr7JW/b9jdvSywdIEZ2JcAVYmLJq2EKBxjW8T+HvA==
X-Received: by 2002:a17:907:2d90:b0:a86:6fb3:fda5 with SMTP id a640c23a62f3a-a99514f06aamr51349866b.32.1728203335686;
        Sun, 06 Oct 2024 01:28:55 -0700 (PDT)
Received: from [10.32.3.23] ([95.183.227.32])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05ecafbsm1844381a12.70.2024.10.06.01.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 01:28:53 -0700 (PDT)
Message-ID: <26eaccf4-f1c3-4d98-a123-4577c5b7530b@gmail.com>
Date: Sun, 6 Oct 2024 11:28:50 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Input: zinitix - Don't fail if linux,keycodes prop is
 absent
To: Nikita Travkin <nikita@trvn.ru>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jakob Hauser <jahau@rocketmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>
References: <20241004-zinitix-no-keycodes-v2-1-876dc9fea4b6@trvn.ru>
Content-Language: en-US
From: Yassine Oudjana <yassine.oudjana@gmail.com>
In-Reply-To: <20241004-zinitix-no-keycodes-v2-1-876dc9fea4b6@trvn.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

From: Yassine Oudjana <y.oudjana@protonmail.com>

On 04/10/2024 7:17 pm, Nikita Travkin wrote:
> When initially adding the touchkey support, a mistake was made in the
> property parsing code. The possible negative errno from
> device_property_count_u32() was never checked, which was an oversight
> left from converting to it from the of_property as part of the review
> fixes.
> 
> Re-add the correct handling of the absent property, in which case zero
> touchkeys should be assumed, which would disable the feature.
> 
> Reported-by: Jakob Hauser <jahau@rocketmail.com>
> Tested-by: Jakob Hauser <jahau@rocketmail.com>
> Fixes: 075d9b22c8fe ("Input: zinitix - add touchkey support")
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>

Tested-by: Yassine Oudjana <y.oudjana@protonmail.com>

> ---
> Changes in v2:
> - Refactored the change to simplify the code (Dmitry)
> - Link to v1: https://lore.kernel.org/r/20241002-zinitix-no-keycodes-v1-1-e84029601491@trvn.ru
> ---
>   drivers/input/touchscreen/zinitix.c | 34 ++++++++++++++++++++++------------
>   1 file changed, 22 insertions(+), 12 deletions(-)
> 
> 
> ---
> base-commit: fe21733536749bb1b31c9c84e0b8d2ab8d82ce13
> change-id: 20241002-zinitix-no-keycodes-f0fe1bdaccb2
> 
> Best regards,
> 
> diff --git a/drivers/input/touchscreen/zinitix.c b/drivers/input/touchscreen/zinitix.c
> index 52b3950460e2..716d6fa60f86 100644
> --- a/drivers/input/touchscreen/zinitix.c
> +++ b/drivers/input/touchscreen/zinitix.c
> @@ -645,19 +645,29 @@ static int zinitix_ts_probe(struct i2c_client *client)
>   		return error;
>   	}
>   
> -	bt541->num_keycodes = device_property_count_u32(&client->dev, "linux,keycodes");
> -	if (bt541->num_keycodes > ARRAY_SIZE(bt541->keycodes)) {
> -		dev_err(&client->dev, "too many keys defined (%d)\n", bt541->num_keycodes);
> -		return -EINVAL;
> -	}
> +	if (device_property_present(&client->dev, "linux,keycodes")) {
> +		bt541->num_keycodes = device_property_count_u32(&client->dev,
> +								"linux,keycodes");
> +		if (bt541->num_keycodes < 0) {
> +			dev_err(&client->dev, "Failed to count keys (%d)\n",
> +				bt541->num_keycodes);
> +			return bt541->num_keycodes;
> +		} else if (bt541->num_keycodes > ARRAY_SIZE(bt541->keycodes)) {
> +			dev_err(&client->dev, "Too many keys defined (%d)\n",
> +				bt541->num_keycodes);
> +			return -EINVAL;
> +		}
>   
> -	error = device_property_read_u32_array(&client->dev, "linux,keycodes",
> -					       bt541->keycodes,
> -					       bt541->num_keycodes);
> -	if (error) {
> -		dev_err(&client->dev,
> -			"Unable to parse \"linux,keycodes\" property: %d\n", error);
> -		return error;
> +		error = device_property_read_u32_array(&client->dev,
> +						       "linux,keycodes",
> +						       bt541->keycodes,
> +						       bt541->num_keycodes);
> +		if (error) {
> +			dev_err(&client->dev,
> +				"Unable to parse \"linux,keycodes\" property: %d\n",
> +				error);
> +			return error;
> +		}
>   	}
>   
>   	error = zinitix_init_input_dev(bt541);


