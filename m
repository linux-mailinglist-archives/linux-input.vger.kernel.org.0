Return-Path: <linux-input+bounces-8875-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDB7A006E2
	for <lists+linux-input@lfdr.de>; Fri,  3 Jan 2025 10:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C7011881D74
	for <lists+linux-input@lfdr.de>; Fri,  3 Jan 2025 09:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31271E048D;
	Fri,  3 Jan 2025 09:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KjmBo4dY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFC71E0489
	for <linux-input@vger.kernel.org>; Fri,  3 Jan 2025 09:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735896378; cv=none; b=R/vVscoJPh7nR6VILaGDFRI1EHIVQbwQb3rlJfWJLX1dh5h6RseMtlC+X2FugW3fSKqZbTAlXkU2hXb/2betirXj79JL0/RUfq+sYzvVQrrdRl3mVobolYyDWezbJMY/ARp16uCnAesHztIE0X07W9KvZ3ms5E5YmlxUZ5FEg5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735896378; c=relaxed/simple;
	bh=60uCnrGKkZF8la9P/22GV1PylIP//kU4OHWP05NbldU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VlzjlUvqZQuztkXiw65M3XZhLXnbx9rgnRueMd16sDUkDYYHRUqIjO2NGOV3jAY5ZyVoWDUQOL1W0shrl+lx9qWgqQum9RguqLs7Jiv/mB6L8TJw4lbtoYQOjae+XR+2Or22qRNO1HIJshO4MbsRPa681ZqI/i+ylrZwwF3jrgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KjmBo4dY; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3862d6d5765so7106141f8f.3
        for <linux-input@vger.kernel.org>; Fri, 03 Jan 2025 01:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735896375; x=1736501175; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltoO8pNMKUN2z/DTd5eBVFvMQ82v9NT5MTctpViOMQ8=;
        b=KjmBo4dYY21W/6oSHdTXUy/n9fT6oAjUZnmuTbyRsL2Okr07SMSuFM4noa013z9zpa
         p1MML4tee45+MCG9rJ0a0lf/eYiNCILwfvY0CalSK0zoNrHOFs5H3ecf3YPwLtu1ETfH
         4STmYL4/pRQR83ao1KEyyogXkzMM5J3KsR9WzjgbugCETW6NIS8WR2NP87UwxS5s9jN/
         EFD7mP0F8cuLlT/ZhjBttpuelOn2urdIyJbuq7QeKD01ufuCghR7jCUaLIdW7PKmfrXQ
         nhRr/3QdKoJKGrAO/Z+7QCyhu13euyNGwvqDIvvVjjMyAhurGwm07w3g9OWO/n9dzTXb
         8AOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735896375; x=1736501175;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ltoO8pNMKUN2z/DTd5eBVFvMQ82v9NT5MTctpViOMQ8=;
        b=Hf0SHBEtCFmQXkPUWAFUlmO9QLZ0PLOfXII/qYOn40AMoHx2wnF+mGWbCbCMu1vDoB
         24ODy2dGLWvliqYH1KIwf3xXbW8M9f6XPy+LbUL62BBWjZUVKG7ZZf3aq/8+GxLngshV
         nf9dLUftOY77+bDl4sfiWATQXgZmunBAh8rAAWDLPzkuUFRNLSbJ53v7y6fw7VQB1bOu
         PCuUmEM6K8yBQxPcl1TRU+/J+rhUwjIQ4PAkvYqmznUlj2ge5pERx9UPXn7SasT9dVQ8
         dEK7OtVwo6EFKFSK1rYlSTe9ccN1Ef4lBI+T/MLJmfuipLpyfH1tFBS3/EK7RSZBYAwy
         q15g==
X-Forwarded-Encrypted: i=1; AJvYcCWv+sKU9rEelvNCzBzt/eQagSFXViPDYXdQUY2MGiF4yXawD4dnfyNx0blfDQxWCexDt9gTtotDFSwDzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+0NrSnNPugeQI6ltRkEFKfXHN7iAcsUqnwlXdEGkWSmSDYFPg
	YVmqMR+yUkhED0ayxWecgm9runasdmNeAz3Yv6sM6HI5EntalwsQlUYeaKjCtq4=
X-Gm-Gg: ASbGnctYoPDvCmijVQ1B1SduZkEXxOe1Rhz9oxl4MR0LRaagHNgm33/oGNmACVRYnjH
	2LIECQRkW2XzWJlRfti81YqLJsH3GNfWdaq1jizt5lvGcGThuriomPMA1OMxqpdws3BxLqRnPzj
	iGgV1R/R6XGoSAcacim231MVHtmifRBmErdJVdvcpyxO21U3sdqVh2p/MvP/jJxZ0fhnNHpZYxs
	fogS2/cQwVcC8zxAdTg8kgHr1y/8DkzEf9s2q/xYDKZKaCG+MdEZHhV0vDH5VKwH94S9adgbo74
	Gg7Fv1wxu6Ch8P3yaiHGt8G5RvQ/UwiMlA==
X-Google-Smtp-Source: AGHT+IFBYCljxVDoDXjZ2E+Coqb6tKVzRHdfH5LWFbS2JycHrgUGxWdB4fuHvTtdL0yEnEXHgKqbZQ==
X-Received: by 2002:a05:6000:4615:b0:386:3328:6106 with SMTP id ffacd0b85a97d-38a222019d8mr45782729f8f.35.1735896375094;
        Fri, 03 Jan 2025 01:26:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3084:b2a4:688f:2d3a? ([2a01:e0a:982:cbb0:3084:b2a4:688f:2d3a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c66sm522831775e9.5.2025.01.03.01.26.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 01:26:14 -0800 (PST)
Message-ID: <7dd25309-cf51-4e5e-8ddd-24267670ecf2@linaro.org>
Date: Fri, 3 Jan 2025 10:26:13 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/2] Input: goodix-berlin - fix comment referencing wrong
 regulator
To: Luca Weiss <luca.weiss@fairphone.com>, Bastien Nocera
 <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jeff LaBundy
 <jeff@labundy.com>, Charles Wang <charles.goodix@gmail.com>,
 Jens Reidel <adrian@travitia.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250103-goodix-berlin-fixes-v1-0-b014737b08b2@fairphone.com>
 <20250103-goodix-berlin-fixes-v1-1-b014737b08b2@fairphone.com>
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
In-Reply-To: <20250103-goodix-berlin-fixes-v1-1-b014737b08b2@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/01/2025 10:21, Luca Weiss wrote:
> In the statement above AVDD gets enabled, and not IOVDD, so fix this
> copy-paste mistake.
> 
> Fixes: 44362279bdd4 ("Input: add core support for Goodix Berlin Touchscreen IC")
> Reported-by: Jens Reidel <adrian@travitia.xyz>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>   drivers/input/touchscreen/goodix_berlin_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/goodix_berlin_core.c b/drivers/input/touchscreen/goodix_berlin_core.c
> index 3fc03cf0ca23fdbe36028a6228030d3ffb8d3a09..e273fb8edc6b92bcbad0fd35223a841d7da7d671 100644
> --- a/drivers/input/touchscreen/goodix_berlin_core.c
> +++ b/drivers/input/touchscreen/goodix_berlin_core.c
> @@ -263,7 +263,7 @@ static int goodix_berlin_power_on(struct goodix_berlin_core *cd)
>   		goto err_iovdd_disable;
>   	}
>   
> -	/* Vendor waits 15ms for IOVDD to settle */
> +	/* Vendor waits 15ms for AVDD to settle */
>   	usleep_range(15000, 15100);
>   
>   	gpiod_set_value_cansleep(cd->reset_gpio, 0);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

