Return-Path: <linux-input+bounces-9749-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FAFA26D3D
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 09:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51D863A291D
	for <lists+linux-input@lfdr.de>; Tue,  4 Feb 2025 08:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C572E2066F3;
	Tue,  4 Feb 2025 08:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="em9L8v7+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E702063E2
	for <linux-input@vger.kernel.org>; Tue,  4 Feb 2025 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738657549; cv=none; b=dHsFD6hIubn9yTPZge5ViuzDYVvl3CzGP7EpTZw5+Xcv+Co9hWqsHn/CCNuOEwjh6eM6iHiwRFMhv2Od8E2q81Yc2Xssbwal1OG8OrcL7fs2ONB+rbchGlXedc+JpcQUIB2c4bRG0G1HsZTJpi8BJZGWPuM5t7o6ThpzmMIoKzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738657549; c=relaxed/simple;
	bh=tJqlIVFoV2fmSJXs4lRTdbKZh55uWKwbP0bRYFL/fz0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VXv/OeI4qjxj+togSdus1sCK/bDnd1LfDk6RwvKTHtCl6sCCKoX0A+kTJo2RljeY0hhWA7RzSFEWEQibDZT8iYS3TAF0FIjoP1qvUk6jWQr3ngqZyhbW5L6S87pmFvTqhts095ud7+PmsdVfFILDTirmRO7LXy1yj7hSTVlV294=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=em9L8v7+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38daf14018eso115026f8f.1
        for <linux-input@vger.kernel.org>; Tue, 04 Feb 2025 00:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738657546; x=1739262346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5X3KlExed7jQYj3Zt5TttzYieEc006daRenyOTS/L5Y=;
        b=em9L8v7+VZhBnHw11Ns84qCLTTtriFr+uQOBZd/M85dGGf5rAE+ixP+Hq3qmJrh4XM
         N/otQGB0OV/brM739HlYjRUvH+kjhC59e74TvfnX77ie/BKJ0TzR9fvv3LqD0OqRxZXL
         stHXfAk3JaBOzNQWYN7+ry+0WfEBBHw02noHDy6WagIesU0CezT2V3HffEIv9WNfnvme
         +7rP1OsxC3oYvC4S+FO0wIcFvY7MXaipUDFOV9Ya8CVSZmwvlKGS5/1PdKv8subEclUF
         Nw73tqa6V6AMqxJ+3sfOCXKBa/fOCksqGTspVKp1HNDV6jyXcGC2Yq47Lqcex5EWWolD
         afwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738657546; x=1739262346;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5X3KlExed7jQYj3Zt5TttzYieEc006daRenyOTS/L5Y=;
        b=Cnj07HFaLBTzMKZBJy+TLzgRFbJ1PPaq2N4byP+jSRPnI/oFcUAZuNfvI3CX1wT682
         AhABj64zlXh9dIBE/d157FUYDoNthOtuH3itvHYpHpmhHXS1TRO8USnqjd9TatDfGupO
         6gpxA8orAToVLqE/bLmkBjD8ozGZtBQaeCqrHg02rBgRpcEUCD2UIChmGVr9wFlnlmSW
         eMa1vkzRT2dxrbW6e3VqyzWXjHw1+4+yXnmsp38l3xKSCPKUzv1scTgEALMkT5LgNyu3
         sp/s8l+8clyG07GoZPNyYzbYM/uobmud37N4RC6KNlXWtLaIoQjyDskz54OlorFEYb4d
         dmZw==
X-Forwarded-Encrypted: i=1; AJvYcCWVac1tVSgOLqH5hh+dHAGRbSXENW63yykA1YHdxmN+GQlKhJyXY0tjG6GFCAGL0pqQ3Le1mtealOn3MA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx5UoybpwD0U/dryJiocBD1H+912mlIMvj/zaLVFMP2KCabF0D
	iwxCn6XV7osc5NW9fkX+wxnx/+dg91aJYZaHp5e/cuB744W1kS5EmFCkbC3Nf0Q=
X-Gm-Gg: ASbGncudWyddaen0NCLCuWWwZvTSGyVSPcfQhiozWGvlRBUJgnZVGKvHKTs7pi6D7q4
	dnH4qYYEZfdY6tgdc2Nyb0u3pGKxJyJSkNgzoS6/KoCedu4OuzkpSbjZtxNyvYXCJuRf0dFwWVc
	mvwDE4PA3cTDQVaP8f1d/dZla0O4Zw8QFTfQcwAHzfqBsen4Y/+n3yh8oHExks2EXoNO0kCPOJG
	jcLKFp2imxsc0SIuP6ClV/Vr3yFsYIV9jFG/rAFpYmDSZV3xOSP5sClenSxFC+o1iWaXOeOq0KB
	QFfzXMI6vVIiixh/TKbdHeRG20kouCL5WzZ1uJ40DJEiW0MwMuupAkQbL+v+ETbPXMOg
X-Google-Smtp-Source: AGHT+IEIn8TASNoC+AhVC8v4SiDFZgSEGmJVO4sTfGESmM38PP44cwLUEcx9uF/Ii7X5V5Fw8E4L2g==
X-Received: by 2002:a5d:6d82:0:b0:38c:5c9a:eaca with SMTP id ffacd0b85a97d-38c5c9aee4fmr14987906f8f.3.1738657545487;
        Tue, 04 Feb 2025 00:25:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8db5:d196:bd48:5fbb? ([2a01:e0a:982:cbb0:8db5:d196:bd48:5fbb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b51e1sm15058267f8f.77.2025.02.04.00.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 00:25:45 -0800 (PST)
Message-ID: <69cb8423-c3c8-4c29-91f2-42e6ad41597b@linaro.org>
Date: Tue, 4 Feb 2025 09:25:44 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] Input: goodix_berlin - Add support for Berlin-A
 series
To: Jens Reidel <adrian@travitia.xyz>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bastien Nocera <hadess@hadess.net>,
 Hans de Goede <hdegoede@redhat.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, linux@mainlining.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20250203174309.21574-1-adrian@travitia.xyz>
 <20250203174309.21574-3-adrian@travitia.xyz>
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
In-Reply-To: <20250203174309.21574-3-adrian@travitia.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 03/02/2025 18:43, Jens Reidel wrote:
> The current implementation of the goodix_berlin driver lacks support for
> revisions A and B of the Berlin IC. This change adds support for the
> gt9897 IC, which is a Berlin-A revision part.
> 
> The differences between revision D and A are rather minor, a handful of
> address changes and a slightly larger read buffer. They were taken from
> the driver published by Goodix, which does a few more things that don't
> appear to be necessary for the touchscreen to work properly.
> 
> Signed-off-by: Jens Reidel <adrian@travitia.xyz>
> ---
>   drivers/input/touchscreen/goodix_berlin.h     |  9 ++++
>   .../input/touchscreen/goodix_berlin_core.c    | 27 +++++++++---
>   drivers/input/touchscreen/goodix_berlin_i2c.c |  6 ++-
>   drivers/input/touchscreen/goodix_berlin_spi.c | 44 +++++++++++++++----
>   4 files changed, 72 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix_berlin.h b/drivers/input/touchscreen/goodix_berlin.h
> index 38b6f9ddbdef..a5232e58c166 100644
> --- a/drivers/input/touchscreen/goodix_berlin.h
> +++ b/drivers/input/touchscreen/goodix_berlin.h
> @@ -12,6 +12,15 @@
>   
>   #include <linux/pm.h>
>   
> +enum goodix_berlin_ic_type {
> +	IC_TYPE_BERLIN_A,
> +	IC_TYPE_BERLIN_D,
> +};
> +
> +struct goodix_berlin_ic_data {
> +	enum goodix_berlin_ic_type ic_type;
> +};
> +
>   struct device;
>   struct input_id;
>   struct regmap;
> diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
> index 3fc03cf0ca23..b892ab901d64 100644
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
> +#include <linux/of.h>
>   #include <linux/regmap.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/sizes.h>
> @@ -54,9 +55,11 @@
>   #define GOODIX_BERLIN_DEV_CONFIRM_VAL		0xAA
>   #define GOODIX_BERLIN_BOOTOPTION_ADDR		0x10000
>   #define GOODIX_BERLIN_FW_VERSION_INFO_ADDR	0x10014
> +#define GOODIX_BERLIN_FW_VERSION_INFO_ADDR_A	0x1000C
>   
>   #define GOODIX_BERLIN_IC_INFO_MAX_LEN		SZ_1K
>   #define GOODIX_BERLIN_IC_INFO_ADDR		0x10070
> +#define GOODIX_BERLIN_IC_INFO_ADDR_A		0x10068
>   
>   #define GOODIX_BERLIN_CHECKSUM_SIZE		sizeof(u16)
>   
> @@ -297,9 +300,16 @@ static void goodix_berlin_power_off(struct goodix_berlin_core *cd)
>   
>   static int goodix_berlin_read_version(struct goodix_berlin_core *cd)
>   {
> +	const struct goodix_berlin_ic_data *ic_data = of_device_get_match_data(cd->dev);
> +	int fw_version_info_addr;
>   	int error;
>   
> -	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_FW_VERSION_INFO_ADDR,
> +	if (ic_data->ic_type == IC_TYPE_BERLIN_A)
> +		fw_version_info_addr = GOODIX_BERLIN_FW_VERSION_INFO_ADDR_A;
> +	else
> +		fw_version_info_addr = GOODIX_BERLIN_FW_VERSION_INFO_ADDR;
> +
> +	error = regmap_raw_read(cd->regmap, fw_version_info_addr,
>   				&cd->fw_version, sizeof(cd->fw_version));
>   	if (error) {
>   		dev_err(cd->dev, "error reading fw version, %d\n", error);
> @@ -358,16 +368,23 @@ static int goodix_berlin_parse_ic_info(struct goodix_berlin_core *cd,
>   
>   static int goodix_berlin_get_ic_info(struct goodix_berlin_core *cd)
>   {
> +	const struct goodix_berlin_ic_data *ic_data = of_device_get_match_data(cd->dev);
>   	u8 *afe_data __free(kfree) = NULL;
>   	__le16 length_raw;
>   	u16 length;
> +	int ic_info_addr;
>   	int error;
>   
> +	if (ic_data->ic_type == IC_TYPE_BERLIN_A)
> +		ic_info_addr = GOODIX_BERLIN_IC_INFO_ADDR_A;
> +	else
> +		ic_info_addr = GOODIX_BERLIN_IC_INFO_ADDR;
> +
>   	afe_data = kzalloc(GOODIX_BERLIN_IC_INFO_MAX_LEN, GFP_KERNEL);
>   	if (!afe_data)
>   		return -ENOMEM;
>   
> -	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_IC_INFO_ADDR,
> +	error = regmap_raw_read(cd->regmap, ic_info_addr,
>   				&length_raw, sizeof(length_raw));
>   	if (error) {
>   		dev_err(cd->dev, "failed get ic info length, %d\n", error);
> @@ -380,7 +397,7 @@ static int goodix_berlin_get_ic_info(struct goodix_berlin_core *cd)
>   		return -EINVAL;
>   	}
>   
> -	error = regmap_raw_read(cd->regmap, GOODIX_BERLIN_IC_INFO_ADDR,
> +	error = regmap_raw_read(cd->regmap, ic_info_addr,
>   				afe_data, length);
>   	if (error) {
>   		dev_err(cd->dev, "failed get ic info data, %d\n", error);
> diff --git a/drivers/input/touchscreen/goodix_berlin_i2c.c b/drivers/input/touchscreen/goodix_berlin_i2c.c
> index ad7a60d94338..b3fd063b4242 100644
> --- a/drivers/input/touchscreen/goodix_berlin_i2c.c
> +++ b/drivers/input/touchscreen/goodix_berlin_i2c.c
> @@ -53,8 +53,12 @@ static const struct i2c_device_id goodix_berlin_i2c_id[] = {
>   
>   MODULE_DEVICE_TABLE(i2c, goodix_berlin_i2c_id);
>   
> +static const struct goodix_berlin_ic_data gt9916_data = {
> +	.ic_type = IC_TYPE_BERLIN_D,
> +};
> +
>   static const struct of_device_id goodix_berlin_i2c_of_match[] = {
> -	{ .compatible = "goodix,gt9916", },
> +	{ .compatible = "goodix,gt9916", .data = &gt9916_data },

Please also update the i2c_device_id table with the driver_data and use i2c_get_match_data().

>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, goodix_berlin_i2c_of_match);
> diff --git a/drivers/input/touchscreen/goodix_berlin_spi.c b/drivers/input/touchscreen/goodix_berlin_spi.c
> index 0662e87b8692..f48f11a76b6d 100644
> --- a/drivers/input/touchscreen/goodix_berlin_spi.c
> +++ b/drivers/input/touchscreen/goodix_berlin_spi.c
> @@ -10,6 +10,7 @@
>   #include <linux/unaligned.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
> +#include <linux/of.h>
>   #include <linux/regmap.h>
>   #include <linux/spi/spi.h>
>   #include <linux/input.h>
> @@ -19,9 +20,13 @@
>   #define GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN	1
>   #define GOODIX_BERLIN_REGISTER_WIDTH		4
>   #define GOODIX_BERLIN_SPI_READ_DUMMY_LEN	3
> +#define GOODIX_BERLIN_SPI_READ_DUMMY_LEN_A	4
>   #define GOODIX_BERLIN_SPI_READ_PREFIX_LEN	(GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN + \
>   						 GOODIX_BERLIN_REGISTER_WIDTH + \
>   						 GOODIX_BERLIN_SPI_READ_DUMMY_LEN)
> +#define GOODIX_BERLIN_SPI_READ_PREFIX_LEN_A	(GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN + \
> +						 GOODIX_BERLIN_REGISTER_WIDTH + \
> +						 GOODIX_BERLIN_SPI_READ_DUMMY_LEN_A)
>   #define GOODIX_BERLIN_SPI_WRITE_PREFIX_LEN	(GOODIX_BERLIN_SPI_TRANS_PREFIX_LEN + \
>   						 GOODIX_BERLIN_REGISTER_WIDTH)
>   
> @@ -33,32 +38,41 @@ static int goodix_berlin_spi_read(void *context, const void *reg_buf,
>   				  size_t val_size)
>   {
>   	struct spi_device *spi = context;
> +	const struct goodix_berlin_ic_data *ic_data = of_device_get_match_data(&spi->dev);
>   	struct spi_transfer xfers;
>   	struct spi_message spi_msg;
>   	const u32 *reg = reg_buf; /* reg is stored as native u32 at start of buffer */
> +	ssize_t read_prefix_len, read_dummy_len;
>   	int error;
>   
> +	if (ic_data->ic_type == IC_TYPE_BERLIN_A) {
> +		read_prefix_len = GOODIX_BERLIN_SPI_READ_PREFIX_LEN_A;
> +		read_dummy_len = GOODIX_BERLIN_SPI_READ_DUMMY_LEN_A;
> +	} else {
> +		read_prefix_len = GOODIX_BERLIN_SPI_READ_PREFIX_LEN;
> +		read_dummy_len = GOODIX_BERLIN_SPI_READ_DUMMY_LEN;
> +	}
> +
>   	if (reg_size != GOODIX_BERLIN_REGISTER_WIDTH)
>   		return -EINVAL;
>   
>   	u8 *buf __free(kfree) =
> -		kzalloc(GOODIX_BERLIN_SPI_READ_PREFIX_LEN + val_size,
> -			GFP_KERNEL);
> +		kzalloc(read_prefix_len + val_size, GFP_KERNEL);
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
> +	       0xff, read_dummy_len);
>   
>   	xfers.tx_buf = buf;
>   	xfers.rx_buf = buf;
> -	xfers.len = GOODIX_BERLIN_SPI_READ_PREFIX_LEN + val_size;
> +	xfers.len = read_prefix_len + val_size;
>   	xfers.cs_change = 0;
>   	spi_message_add_tail(&xfers, &spi_msg);
>   
> @@ -68,7 +82,7 @@ static int goodix_berlin_spi_read(void *context, const void *reg_buf,
>   		return error;
>   	}
>   
> -	memcpy(val_buf, buf + GOODIX_BERLIN_SPI_READ_PREFIX_LEN, val_size);
> +	memcpy(val_buf, buf + read_prefix_len, val_size);
>   	return error;
>   }
>   
> @@ -123,6 +137,7 @@ static const struct input_id goodix_berlin_spi_input_id = {
>   
>   static int goodix_berlin_spi_probe(struct spi_device *spi)
>   {
> +	const struct goodix_berlin_ic_data *ic_data = of_device_get_match_data(&spi->dev);
>   	struct regmap_config regmap_config;
>   	struct regmap *regmap;
>   	size_t max_size;
> @@ -137,7 +152,10 @@ static int goodix_berlin_spi_probe(struct spi_device *spi)
>   	max_size = spi_max_transfer_size(spi);
>   
>   	regmap_config = goodix_berlin_spi_regmap_conf;
> -	regmap_config.max_raw_read = max_size - GOODIX_BERLIN_SPI_READ_PREFIX_LEN;
> +	if (ic_data->ic_type == IC_TYPE_BERLIN_A)
> +		regmap_config.max_raw_read = max_size - GOODIX_BERLIN_SPI_READ_PREFIX_LEN_A;
> +	else
> +		regmap_config.max_raw_read = max_size - GOODIX_BERLIN_SPI_READ_PREFIX_LEN;
>   	regmap_config.max_raw_write = max_size - GOODIX_BERLIN_SPI_WRITE_PREFIX_LEN;
>   
>   	regmap = devm_regmap_init(&spi->dev, NULL, spi, &regmap_config);
> @@ -153,13 +171,23 @@ static int goodix_berlin_spi_probe(struct spi_device *spi)
>   }
>   
>   static const struct spi_device_id goodix_berlin_spi_ids[] = {
> +	{ "gt9897" },
>   	{ "gt9916" },

You may also pass driver_data here aswell and use spi_get_device_match_data() instead.

>   	{ },
>   };
>   MODULE_DEVICE_TABLE(spi, goodix_berlin_spi_ids);
>   
> +static const struct goodix_berlin_ic_data gt9897_data = {
> +	.ic_type = IC_TYPE_BERLIN_A,
> +};
> +
> +static const struct goodix_berlin_ic_data gt9916_data = {
> +	.ic_type = IC_TYPE_BERLIN_D,
> +};
> +
>   static const struct of_device_id goodix_berlin_spi_of_match[] = {
> -	{ .compatible = "goodix,gt9916", },
> +	{ .compatible = "goodix,gt9897", .data = &gt9897_data },
> +	{ .compatible = "goodix,gt9916", .data = &gt9916_data },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, goodix_berlin_spi_of_match);


