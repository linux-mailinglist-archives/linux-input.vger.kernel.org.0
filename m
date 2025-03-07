Return-Path: <linux-input+bounces-10612-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9E1A5648D
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 11:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98A333A6514
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 10:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B62920CCFD;
	Fri,  7 Mar 2025 10:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XWfjqrlR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7341E1DE3
	for <linux-input@vger.kernel.org>; Fri,  7 Mar 2025 10:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741341796; cv=none; b=hzrxCjla3mdfQehz1sggo1KWbOK9lqzJ7erHgkxOunrFAzOpkG3bkjv7dT5o1CyC4EyLnwX6s+wz2mSXpk9yjJHGi6BkRUZ1UluFVEgT9WEjiwuuRKXyiitran0CDBqJhhslJaoIhEZmNQG6fNKk9t4JPA1Weh4P10funoLKojM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741341796; c=relaxed/simple;
	bh=qC09XvL+E4XxS8W7QyWzuLFEczeFsZDxtV2iyUyjsVQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sRJHjmoSAvkXQqImFm+yIaP4vvw4Vw6lMOnTtlMcA160NG/nJymna/28esd4mAzLFP9EG/ay3mq5Cmqjmnu6Z7O4/W8Mnj1zz1XeuBydnkXTzOKWfwpvEVVcvoKi0l8Xh+1DHgE4emUB89mYoZOeVUj4CCfCnBijDiVkfMg/pas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XWfjqrlR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43bd45e4d91so10035335e9.1
        for <linux-input@vger.kernel.org>; Fri, 07 Mar 2025 02:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741341792; x=1741946592; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vEF9+tsv2YIJlxjHnRIp5QhDr50rxu5AlAzHayFtoM=;
        b=XWfjqrlRfa59PagAnn86Rh7JE2dflA3yM9Ja/trGLYfuFioSz8H0JYxbdf/UU6bPNE
         HQL/EGLS5gX6glvTxHRSzbLpG2/4w0Y9wmNPQfKbn7gI/Zk8jG19Vbfl7Och9Dp6jApT
         kUhouAo4zmg/psY9vFz+fdkUqQSv53DSp/nPpfYx+XpaVTT6KsN969LvAQUV60SBux+G
         95BDbtmhP0z5iIUYn2T0xoweWt5sA4t7PH5am4eqwKmeeWI8Kn1zf2evLiurudsWsA9R
         WKWXW9Uw2py9Wx2XprwxVJ6xYClMyRfZUgVoNp0rzcpPSJtOrfqcmpqEcQLDW1+GK7Wx
         xgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741341792; x=1741946592;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1vEF9+tsv2YIJlxjHnRIp5QhDr50rxu5AlAzHayFtoM=;
        b=gbnBPLMJ3Q57q8DIOAAH+6bhsX91GDiLrzdtKI3gYjRrguVQs++vBCcJ1+6OJA26Dj
         2WDYfBXFDjLTj2uZdt0q/WJQQ3bLcPHMMgMA5kF13nWNl75OZ/MdW1oPTocIIW+9Gtvy
         8GgtjX8IzK+VfSfuetor0nkT4O39UV+L1cAr7hZuWpIL5FxjaZOB79XnfpG0qt5W5xVf
         eGrxfs+acUxT5fanUAhVl/PStpRuP4f2o9sniR++Pr4JaQKcKm45cV5V2V/fDLCUrlyh
         GhCoL7Ram03NJHi0giOBRbNWYsjiOmjJS1lI41pP1DvQLM2K+QIw1nQBPq7e8MxMhHY7
         fPfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCpK9vu4zQJ7NOKKYyhkVLNHI5kuiF4nvnfUV8RPmP6sBaL+sZsx1YR1dqGyOzweFPo63hwoipGgSVEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTVKng9ecf0zF13Ypm7yDBD5CqSK6ZPDkKl1vkWpw/PDEQazbY
	xTW/fC2ziVKNiKOiQHQwhKOyyvtZWsWfAzwfZowy+pGIbCrdMY5IQ8uIuQE1DqY=
X-Gm-Gg: ASbGncutF3/VeLHpr4DwGco/Lh8h1DHXFruzIdC6CWwVgfNMTTxJVGe3FmC5M5A1Jxi
	h/nxePc32Gq0Wazk1VWJZx4w7WQYveeryjSRxTctwiEq0R44OS+vSqg0YaRHRQ9fwl+J6jQ6lYF
	IVM0lx+euOq9VDdulxDWWpuWIlqNkO77p8mAyojQJGsdCqzSIkaEwdxcv01eUu/nEOI++xJz6UY
	PMJVbQkaELh7uhI0ZzPkqEbttuw/TTEYwcQcDKD3hpS18pyntn2NSP2AuPaJ0sUKTaVUMuU3T7z
	W2xyvW5HjsI/5WLUZc782GAtEvQ0gMe5EjTa+JmA6sb3NN83KW3opfRrLi0u8Z007kE9kSdPgia
	pjocAshtZF14bLNBpWUAbhA==
X-Google-Smtp-Source: AGHT+IGNzDh/kKDNpCLZ2JuvWaD1TESNfBPS1qik4baGkJKQtiSCovQ66r/C2qv98cepZ6On8oiNUQ==
X-Received: by 2002:a05:600c:1c9f:b0:439:8634:9909 with SMTP id 5b1f17b1804b1-43c601cc6b2mr18520465e9.14.1741341791815;
        Fri, 07 Mar 2025 02:03:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1ea4:9158:5668:7977? ([2a01:e0a:982:cbb0:1ea4:9158:5668:7977])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8c3173sm47504605e9.11.2025.03.07.02.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Mar 2025 02:03:11 -0800 (PST)
Message-ID: <edb4c8f2-afef-4892-914f-33bd5b25301a@linaro.org>
Date: Fri, 7 Mar 2025 11:03:10 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 2/2] Input: goodix_berlin - Add support for Berlin-A
 series
To: Jens Reidel <adrian@mainlining.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bastien Nocera <hadess@hadess.net>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250307094823.478152-1-adrian@mainlining.org>
 <20250307094823.478152-3-adrian@mainlining.org>
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
In-Reply-To: <20250307094823.478152-3-adrian@mainlining.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2025 10:48, Jens Reidel wrote:
> The current implementation of the goodix_berlin driver lacks support for
> revisions A and B of the Berlin IC. This change adds support for the
> gt9897 IC, which is a Berlin-A revision part.
> 
> The differences between revision D and A are rather minor, a handful of
> address changes and a slightly larger read buffer. They were taken from
> the driver published by Goodix, which does a few more things that don't
> appear to be necessary for the touchscreen to work properly.
> 
> Tested-by: Luca Weiss <luca.weiss@fairphone.com>
> Signed-off-by: Jens Reidel <adrian@mainlining.org>
> ---
>   drivers/input/touchscreen/goodix_berlin.h     | 16 ++++++-
>   .../input/touchscreen/goodix_berlin_core.c    | 21 ++++----
>   drivers/input/touchscreen/goodix_berlin_i2c.c | 14 ++++--
>   drivers/input/touchscreen/goodix_berlin_spi.c | 48 ++++++++++++++-----
>   4 files changed, 73 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix_berlin.h b/drivers/input/touchscreen/goodix_berlin.h
> index 38b6f9ddbdef..d8bbd4853206 100644
> --- a/drivers/input/touchscreen/goodix_berlin.h
> +++ b/drivers/input/touchscreen/goodix_berlin.h
> @@ -12,12 +12,26 @@
>   
>   #include <linux/pm.h>
>   
> +#define GOODIX_BERLIN_FW_VERSION_INFO_ADDR_A	0x1000C
> +#define GOODIX_BERLIN_FW_VERSION_INFO_ADDR_D	0x10014
> +
> +#define GOODIX_BERLIN_IC_INFO_ADDR_A		0x10068
> +#define GOODIX_BERLIN_IC_INFO_ADDR_D		0x10070
> +
> +struct goodix_berlin_ic_data {
> +	int fw_version_info_addr;
> +	int ic_info_addr;
> +	ssize_t read_dummy_len;
> +	ssize_t read_prefix_len;
> +};
> +
>   struct device;
>   struct input_id;
>   struct regmap;
>   
>   int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
> -			struct regmap *regmap);
> +			struct regmap *regmap,
> +			const struct goodix_berlin_ic_data *ic_data);
>   
>   extern const struct dev_pm_ops goodix_berlin_pm_ops;
>   extern const struct attribute_group *goodix_berlin_groups[];
> diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
> index f7ea443b152e..02a1d9a465f2 100644
> --- a/drivers/input/touchscreen/goodix_berlin_core.c
> +++ b/drivers/input/touchscreen/goodix_berlin_core.c
> @@ -12,7 +12,7 @@
>    * to the previous generations.
>    *
>    * Currently the driver only handles Multitouch events with already
> - * programmed firmware and "config" for "Revision D" Berlin IC.
> + * programmed firmware and "config" for "Revision A/D" Berlin IC.
>    *
>    * Support is missing for:
>    * - ESD Management
> @@ -20,7 +20,7 @@
>    * - "Config" update/flashing
>    * - Stylus Events
>    * - Gesture Events
> - * - Support for older revisions (A & B)
> + * - Support for revision B
>    */
>   
>   #include <linux/bitfield.h>
> @@ -28,6 +28,7 @@
>   #include <linux/input.h>
>   #include <linux/input/mt.h>
>   #include <linux/input/touchscreen.h>
> +#include <linux/property.h>
>   #include <linux/regmap.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/sizes.h>
> @@ -53,10 +54,8 @@
>   
>   #define GOODIX_BERLIN_DEV_CONFIRM_VAL		0xAA
>   #define GOODIX_BERLIN_BOOTOPTION_ADDR		0x10000
> -#define GOODIX_BERLIN_FW_VERSION_INFO_ADDR	0x10014
>   
>   #define GOODIX_BERLIN_IC_INFO_MAX_LEN		SZ_1K
> -#define GOODIX_BERLIN_IC_INFO_ADDR		0x10070
>   
>   #define GOODIX_BERLIN_CHECKSUM_SIZE		sizeof(u16)
>   
> @@ -175,6 +174,8 @@ struct goodix_berlin_core {
>   	/* Runtime parameters extracted from IC_INFO buffer  */
>   	u32 touch_data_addr;
>   
> +	const struct goodix_berlin_ic_data *ic_data;
> +
>   	struct goodix_berlin_event event;
>   };
>   
> @@ -299,7 +300,7 @@ static int goodix_berlin_read_version(struct goodix_berlin_core *cd)
>   {
>   	int error;
>   
> -	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_FW_VERSION_INFO_ADDR,
> +	error = regmap_raw_read(cd->regmap, cd->ic_data->fw_version_info_addr,
>   				&cd->fw_version, sizeof(cd->fw_version));
>   	if (error) {
>   		dev_err(cd->dev, "error reading fw version, %d\n", error);
> @@ -367,7 +368,7 @@ static int goodix_berlin_get_ic_info(struct goodix_berlin_core *cd)
>   	if (!afe_data)
>   		return -ENOMEM;
>   
> -	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_IC_INFO_ADDR,
> +	error = regmap_raw_read(cd->regmap, cd->ic_data->ic_info_addr,
>   				&length_raw, sizeof(length_raw));
>   	if (error) {
>   		dev_err(cd->dev, "failed get ic info length, %d\n", error);
> @@ -380,8 +381,8 @@ static int goodix_berlin_get_ic_info(struct goodix_berlin_core *cd)
>   		return -EINVAL;
>   	}
>   
> -	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_IC_INFO_ADDR,
> -				afe_data, length);
> +	error = regmap_raw_read(cd->regmap, cd->ic_data->ic_info_addr, afe_data,
> +				length);
>   	if (error) {
>   		dev_err(cd->dev, "failed get ic info data, %d\n", error);
>   		return error;
> @@ -716,7 +717,8 @@ const struct attribute_group *goodix_berlin_groups[] = {
>   EXPORT_SYMBOL_GPL(goodix_berlin_groups);
>   
>   int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
> -			struct regmap *regmap)
> +			struct regmap *regmap,
> +			const struct goodix_berlin_ic_data *ic_data)
>   {
>   	struct goodix_berlin_core *cd;
>   	int error;
> @@ -733,6 +735,7 @@ int goodix_berlin_probe(struct device *dev, int irq, const struct input_id *id,
>   	cd->dev = dev;
>   	cd->regmap = regmap;
>   	cd->irq = irq;
> +	cd->ic_data = ic_data;
>   
>   	cd->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>   	if (IS_ERR(cd->reset_gpio))
> diff --git a/drivers/input/touchscreen/goodix_berlin_i2c.c b/drivers/input/touchscreen/goodix_berlin_i2c.c
> index ad7a60d94338..059a25537aad 100644
> --- a/drivers/input/touchscreen/goodix_berlin_i2c.c
> +++ b/drivers/input/touchscreen/goodix_berlin_i2c.c
> @@ -31,6 +31,8 @@ static const struct input_id goodix_berlin_i2c_input_id = {
>   
>   static int goodix_berlin_i2c_probe(struct i2c_client *client)
>   {
> +	const struct goodix_berlin_ic_data *ic_data =
> +		i2c_get_match_data(cd->dev);
>   	struct regmap *regmap;
>   	int error;
>   
> @@ -39,22 +41,28 @@ static int goodix_berlin_i2c_probe(struct i2c_client *client)
>   		return PTR_ERR(regmap);
>   
>   	error = goodix_berlin_probe(&client->dev, client->irq,
> -				    &goodix_berlin_i2c_input_id, regmap);
> +				    &goodix_berlin_i2c_input_id, regmap,
> +				    ic_data);
>   	if (error)
>   		return error;
>   
>   	return 0;
>   }
>   
> +static const struct goodix_berlin_ic_data gt9916_data = {
> +	.fw_version_info_addr = GOODIX_BERLIN_FW_VERSION_INFO_ADDR_D,
> +	.ic_info_addr = GOODIX_BERLIN_IC_INFO_ADDR_D,
> +};
> +
>   static const struct i2c_device_id goodix_berlin_i2c_id[] = {
> -	{ "gt9916" },
> +	{ .name = "gt9916", .driver_data = (long)&gt9916_data },
>   	{ }
>   };
>   
>   MODULE_DEVICE_TABLE(i2c, goodix_berlin_i2c_id);
>   
>   static const struct of_device_id goodix_berlin_i2c_of_match[] = {
> -	{ .compatible = "goodix,gt9916", },
> +	{ .compatible = "goodix,gt9916", .data = &gt9916_data },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, goodix_berlin_i2c_of_match);
> diff --git a/drivers/input/touchscreen/goodix_berlin_spi.c b/drivers/input/touchscreen/goodix_berlin_spi.c
> index 0662e87b8692..01f850f484c2 100644
> --- a/drivers/input/touchscreen/goodix_berlin_spi.c
> +++ b/drivers/input/touchscreen/goodix_berlin_spi.c
> @@ -18,10 +18,14 @@
>   
>   #define GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN	1
>   #define GOODIX_BERLIN_REGISTER_WIDTH		4
> -#define GOODIX_BERLIN_SPI_READ_DUMMY_LEN	3
> -#define GOODIX_BERLIN_SPI_READ_PREFIX_LEN	(GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN + \
> +#define GOODIX_BERLIN_SPI_READ_DUMMY_LEN_A	4
> +#define GOODIX_BERLIN_SPI_READ_DUMMY_LEN_D	3
> +#define GOODIX_BERLIN_SPI_READ_PREFIX_LEN_A	(GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN + \
>   						 GOODIX_BERLIN_REGISTER_WIDTH + \
> -						 GOODIX_BERLIN_SPI_READ_DUMMY_LEN)
> +						 GOODIX_BERLIN_SPI_READ_DUMMY_LEN_A)
> +#define GOODIX_BERLIN_SPI_READ_PREFIX_LEN_D	(GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN + \
> +						 GOODIX_BERLIN_REGISTER_WIDTH + \
> +						 GOODIX_BERLIN_SPI_READ_DUMMY_LEN_D)
>   #define GOODIX_BERLIN_SPI_WRITE_PREFIX_LEN	(GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN + \
>   						 GOODIX_BERLIN_REGISTER_WIDTH)
>   
> @@ -33,6 +37,7 @@ static int goodix_berlin_spi_read(void *context, const void *reg_buf,
>   				  size_t val_size)
>   {
>   	struct spi_device *spi = context;
> +	const struct goodix_berlin_ic_data *ic_data = spi_get_device_match_data(spi);
>   	struct spi_transfer xfers;
>   	struct spi_message spi_msg;
>   	const u32 *reg = reg_buf; /* reg is stored as native u32 at start of buffer */
> @@ -42,23 +47,22 @@ static int goodix_berlin_spi_read(void *context, const void *reg_buf,
>   		return -EINVAL;
>   
>   	u8 *buf __free(kfree) =
> -		kzalloc(GOODIX_BERLIN_SPI_READ_PREFIX_LEN + val_size,
> -			GFP_KERNEL);
> +		kzalloc(ic_data->read_prefix_len + val_size, GFP_KERNEL);
>   	if (!buf)
>   		return -ENOMEM;
>   
>   	spi_message_init(&spi_msg);
>   	memset(&xfers, 0, sizeof(xfers));
>   
> -	/* buffer format: 0xF1 + addr(4bytes) + dummy(3bytes) + data */
> +	/* buffer format: 0xF1 + addr(4bytes) + dummy(3/4bytes) + data */
>   	buf[0] = GOODIX_BERLIN_SPI_READ_FLAG;
>   	put_unaligned_be32(*reg, buf + GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN);
>   	memset(buf + GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN + GOODIX_BERLIN_REGISTER_WIDTH,
> -	       0xff, GOODIX_BERLIN_SPI_READ_DUMMY_LEN);
> +	       0xff, ic_data->read_dummy_len);
>   
>   	xfers.tx_buf = buf;
>   	xfers.rx_buf = buf;
> -	xfers.len = GOODIX_BERLIN_SPI_READ_PREFIX_LEN + val_size;
> +	xfers.len = ic_data->read_prefix_len + val_size;
>   	xfers.cs_change = 0;
>   	spi_message_add_tail(&xfers, &spi_msg);
>   
> @@ -68,7 +72,7 @@ static int goodix_berlin_spi_read(void *context, const void *reg_buf,
>   		return error;
>   	}
>   
> -	memcpy(val_buf, buf + GOODIX_BERLIN_SPI_READ_PREFIX_LEN, val_size);
> +	memcpy(val_buf, buf + ic_data->read_prefix_len, val_size);
>   	return error;
>   }
>   
> @@ -123,6 +127,7 @@ static const struct input_id goodix_berlin_spi_input_id = {
>   
>   static int goodix_berlin_spi_probe(struct spi_device *spi)
>   {
> +	const struct goodix_berlin_ic_data *ic_data = spi_get_device_match_data(spi);
>   	struct regmap_config regmap_config;
>   	struct regmap *regmap;
>   	size_t max_size;
> @@ -137,7 +142,7 @@ static int goodix_berlin_spi_probe(struct spi_device *spi)
>   	max_size = spi_max_transfer_size(spi);
>   
>   	regmap_config = goodix_berlin_spi_regmap_conf;
> -	regmap_config.max_raw_read = max_size - GOODIX_BERLIN_SPI_READ_PREFIX_LEN;
> +	regmap_config.max_raw_read = max_size - ic_data->read_prefix_len;
>   	regmap_config.max_raw_write = max_size - GOODIX_BERLIN_SPI_WRITE_PREFIX_LEN;
>   
>   	regmap = devm_regmap_init(&spi->dev, NULL, spi, &regmap_config);
> @@ -145,21 +150,38 @@ static int goodix_berlin_spi_probe(struct spi_device *spi)
>   		return PTR_ERR(regmap);
>   
>   	error = goodix_berlin_probe(&spi->dev, spi->irq,
> -				    &goodix_berlin_spi_input_id, regmap);
> +				    &goodix_berlin_spi_input_id, regmap,
> +				    ic_data);
>   	if (error)
>   		return error;
>   
>   	return 0;
>   }
>   
> +static const struct goodix_berlin_ic_data gt9897_data = {
> +	.fw_version_info_addr = GOODIX_BERLIN_FW_VERSION_INFO_ADDR_A,
> +	.ic_info_addr = GOODIX_BERLIN_IC_INFO_ADDR_A,
> +	.read_dummy_len = GOODIX_BERLIN_SPI_READ_DUMMY_LEN_A,
> +	.read_prefix_len = GOODIX_BERLIN_SPI_READ_PREFIX_LEN_A,
> +};
> +
> +static const struct goodix_berlin_ic_data gt9916_data = {
> +	.fw_version_info_addr = GOODIX_BERLIN_FW_VERSION_INFO_ADDR_D,
> +	.ic_info_addr = GOODIX_BERLIN_IC_INFO_ADDR_D,
> +	.read_dummy_len = GOODIX_BERLIN_SPI_READ_DUMMY_LEN_D,
> +	.read_prefix_len = GOODIX_BERLIN_SPI_READ_PREFIX_LEN_D,
> +};
> +
>   static const struct spi_device_id goodix_berlin_spi_ids[] = {
> -	{ "gt9916" },
> +	{ .name = "gt9897", .driver_data = (long)&gt9897_data },
> +	{ .name = "gt9916", .driver_data = (long)&gt9916_data },
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(spi, goodix_berlin_spi_ids);
>   
>   static const struct of_device_id goodix_berlin_spi_of_match[] = {
> -	{ .compatible = "goodix,gt9916", },
> +	{ .compatible = "goodix,gt9897", .data = &gt9897_data },
> +	{ .compatible = "goodix,gt9916", .data = &gt9916_data },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, goodix_berlin_spi_of_match);

Thanks !

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

