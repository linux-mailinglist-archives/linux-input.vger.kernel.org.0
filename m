Return-Path: <linux-input+bounces-674-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6C280C4A2
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 10:31:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A8621C20A6C
	for <lists+linux-input@lfdr.de>; Mon, 11 Dec 2023 09:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF4D21363;
	Mon, 11 Dec 2023 09:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LG6BZT0m"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6347F107
	for <linux-input@vger.kernel.org>; Mon, 11 Dec 2023 01:31:31 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c19f5f822so22835545e9.1
        for <linux-input@vger.kernel.org>; Mon, 11 Dec 2023 01:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702287090; x=1702891890; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pLp5kesKJckufFT5n27BxZr41mn/oRMjNbRkVj04JLg=;
        b=LG6BZT0mUwWMl1i4l8jdsHGFueZ/Z0aknmKvX7HyBe2K09J8Z/+aYgoMiD9W1i4HZo
         6o6/sCBnqEtPsRyigc0GKmmVJv9zYwJwk29fYuUg599zE6hW9W2tVGbihcq8XjD1p2dT
         l6wcITQHbakXRvqxLY8MuUwhOLOI+YbMgi/1PjaZsvwCWzp6IXc67ZT1jishoyg8+EBD
         6tTV/q2g19D6JSFmngY6UeHF3OdIz6+uE2lK4LuEmgx1Mkssr1InWGL1b/pyFRnW3CoO
         lLUhbzOAcS/xiDQV2AMkLtShaeINc7mxX/D6Lni+FFfmySb6PJfiK2JNM3b4rxV+elZP
         1p5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702287090; x=1702891890;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pLp5kesKJckufFT5n27BxZr41mn/oRMjNbRkVj04JLg=;
        b=tzrtZRDEG1RWnaSbLapGtjeZbu9etUYwAFREVT9/0Jgd3mbq8LpoV3KsciY/wG3BHP
         oY5YdD1UWgEiFFoJ5f1r7jXIrW1fT0d8VjW5+dIh0IwAKGS0tTa6V4iX1RRuc8eUUdTV
         Hd6TS0MhREcv/9Et/IySO1ap6PAcUAr4eMg1VkNwhAEt9P8nEirHOWPMyJ9/QPQtUAAp
         p45FV52uLnzYvgs73wmr79SNLn5Oka51YbGynZQ/lZutoXwBm1jMUP/735vH2kP3qIgq
         2vNfxqwm8tmh9sia6Oty66EmVnWYlLJ+Xrw35cQQLRmifjNAyWkAVTna5kg0xKsWzebD
         kcnw==
X-Gm-Message-State: AOJu0YwyXWxlrqpEZOu8QJLBZL4TyyilwRiD7yt9HnJjZWzRIeC8lpph
	UjNMMJbteHGF/1wsHQKdlvYPMw==
X-Google-Smtp-Source: AGHT+IHooRnLsQwGd6JlWAB5k7FvLwPeFXh8PqpqG0Ux6inQQyaaNoBZWdcw2yV3v7DMu19vAxfKkA==
X-Received: by 2002:a05:600c:3d91:b0:40c:243f:1f6 with SMTP id bi17-20020a05600c3d9100b0040c243f01f6mr2280439wmb.152.1702287089682;
        Mon, 11 Dec 2023 01:31:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:302e:e0c2:d42c:cb23? ([2a01:e0a:982:cbb0:302e:e0c2:d42c:cb23])
        by smtp.gmail.com with ESMTPSA id d13-20020a05600c34cd00b0040c496c64cfsm1959683wmq.12.2023.12.11.01.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 01:31:29 -0800 (PST)
Message-ID: <e7cd1271-ed10-40da-8b04-275507fee710@linaro.org>
Date: Mon, 11 Dec 2023 10:31:27 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v12 2/4] Input: add core support for Goodix Berlin
 Touchscreen IC
Content-Language: en-US, fr
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bastien Nocera <hadess@hadess.net>,
 Hans de Goede <hdegoede@redhat.com>, Henrik Rydberg <rydberg@bitmath.org>,
 Jeff LaBundy <jeff@labundy.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231209-topic-goodix-berlin-upstream-initial-v12-0-eaffaeb53fb5@linaro.org>
 <20231209-topic-goodix-berlin-upstream-initial-v12-2-eaffaeb53fb5@linaro.org>
 <ZXVgYuzE6jPPSfnZ@google.com>
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
Organization: Linaro Developer Services
In-Reply-To: <ZXVgYuzE6jPPSfnZ@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 10/12/2023 07:53, Dmitry Torokhov wrote:
> Hi Neil,
> 
> On Sat, Dec 09, 2023 at 08:33:40AM +0100, Neil Armstrong wrote:
>> Add initial support for the new Goodix "Berlin" touchscreen ICs.
>>
>> These touchscreen ICs support SPI, I2C and I3C interface, up to
>> 10 finger touch, stylus and gestures events.
>>
>> This initial driver is derived from the Goodix goodix_ts_berlin
>> available at [1] and [2] and only supports the GT9916 IC
>> present on the Qualcomm SM8550 MTP & QRD touch panel.
>>
>> The current implementation only supports BerlinD, aka GT9916.
>>
>> Support for advanced features like:
>> - Firmware & config update
>> - Stylus events
>> - Gestures events
>> - Previous revisions support (BerlinA or BerlinB)
>> is not included in current version.
>>
>> The current support will work with currently flashed firmware
>> and config, and bail out if firmware or config aren't flashed yet.
>>
>> [1] https://github.com/goodix/goodix_ts_berlin
>> [2] https://git.codelinaro.org/clo/la/platform/vendor/opensource/touch-drivers
>>
>> Reviewed-by: Jeff LaBundy <jeff@labundy.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Thank you for resending the patch. I think there is an issue in how you
> read and parse the data in case of more than 2 fingers. It looks like in
> that case you are overwriting the checksum form the first 2 and then not
> reading the new checksum but use some garbage past the touch data. I
> might be mistaken though...

Sure, let me check again to be sure it's not the case

> 
> I also believe you are leaking afe_data in case of success. We have the
> newfangled __free(kfree) from cleanup.h that should help there.

Indeed, it was added in the meantime, so let's switch to it

> 
> Another request - we should not have anything in goodix_berlin.h that is
> not used by the I2C and SPI sub-drivers, so the only thing it should
> contain is goodix_berlin_probe() declaration and dev_pm_ops. All other
> defines and definitions should go to goodix_berlin_core.h.
> 
> I made a few more cosmetic changes in the attached patch, please
> consider applying it.

Sure, I'll apply it, thanks for the suggestions,

Neil

> 
> Thanks.
> 


