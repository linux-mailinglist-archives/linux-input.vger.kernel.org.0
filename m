Return-Path: <linux-input+bounces-721-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 358E580EF0F
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 15:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61AC61C20AC2
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 14:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76890745D0;
	Tue, 12 Dec 2023 14:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QLJlD/u4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 245E4EA
	for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 06:44:03 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c3f68b79aso36357195e9.0
        for <linux-input@vger.kernel.org>; Tue, 12 Dec 2023 06:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702392241; x=1702997041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWo777MN0DncSazKE0nHt1+1eF9bduFbpo2jm9olN20=;
        b=QLJlD/u4kNstLRMM1Yq7BbcbNfwFlOU12w5CpnvMUjkaw8V+BnaL3va7gISpdXDNr9
         BVh8WVuGwUvVrCFK9WcnwFqoZplucDWhuir1iJauRJraD1kyOkc1y88ZRjsQPygJdCbf
         VU7kfrbBVWo87Y9pq5V2RG8mfzoBMur+wLyGlcLPp1+Al2Qc6yCql/bf2jvLhlD2uDy/
         4F01uO8xp6ecHjQcDIGX05/w4wkmNau3X45q9snvNh4+97ZS+9qkY976bYUR9HHK29Ux
         /xH/K9sMgK3K4vhu2laAqYP+5NzSKcS74gvIvT72k9VgSbDbwBor7GK+vwNV0qYRyyYd
         qMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702392241; x=1702997041;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kWo777MN0DncSazKE0nHt1+1eF9bduFbpo2jm9olN20=;
        b=m5XTQZvpl8JvGpU0BQ82Jn2hJdogVuksU973o33b/ib8H7/YHyydycMT277bK0Ox8z
         KNCZJPolj21lSmRVGLVfbTBlwgbatZ1X5euYgM9MMiYL1G5FMA5xHNoGI61USQ7Vrc9+
         5Sdd+ce5hrJn6e17OBjsdTzF1DJgkxrGUtA/BSX9xvhnnm3jBR0JqAncizyI8RTqO8zx
         bjvqvCGObEfpTrij0I7Ay3GudBNmgUWpQxtueSj/4F66PgPgUVpamaKj4ik/S8hxXtF5
         RTgmeoZppjFGsJLELDWw6LaX1uHaeRY+/OQT+1N54bQAtuLBigKTntBvqXIvcoB7SJFv
         9Qnw==
X-Gm-Message-State: AOJu0YyY8mv4cB1BaUNjGhZHvo58BPQDLy2TZuvf5RlBTb2GyhJnEAvc
	pwdeoLGoRDEtQeNkhX15XuyjK+Zzdw1WJLdKfMOFIOwc
X-Google-Smtp-Source: AGHT+IHgst7o6eFwexZsyUHa+goT+CnzGuTjMsefbGfNNLLVXdOwdtf39J65EYjCP/XeXKI778GUgw==
X-Received: by 2002:a05:600c:3b9f:b0:40b:5e59:ccac with SMTP id n31-20020a05600c3b9f00b0040b5e59ccacmr3244021wms.141.1702392241514;
        Tue, 12 Dec 2023 06:44:01 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5894:fa62:26b4:bf82? ([2a01:e0a:982:cbb0:5894:fa62:26b4:bf82])
        by smtp.gmail.com with ESMTPSA id bh15-20020a05600c3d0f00b0040b4ccdcffbsm17159922wmb.2.2023.12.12.06.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 06:44:01 -0800 (PST)
Message-ID: <be39f74b-e04f-48c8-acc9-cc818adfc4db@linaro.org>
Date: Tue, 12 Dec 2023 15:43:59 +0100
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

I carefully inspected the code again, and it's correct, otherwise I would have experimented
checksum errors, which isn't the case.

First read from goodix_berlin_irq() is GOODIX_BERLIN_IRQ_READ_LEN(2) length in memory:

[GOODIX_BERLIN_IRQ_EVENT_HEAD_LEN][GOODIX_BERLIN_COOR_DATA_CHECKSUM_SIZE][GOODIX_BERLIN_BYTES_PER_POINT * x]

the pre_buf_len goodix_berlin_touch_handler() get is GOODIX_BERLIN_IRQ_READ_LEN(2), the we complete the
read after the first read, but since the touch checksum is before the touch data, it works because
we complete the data.

I added some comments to clarify the memory layout and re-ordered the items
in the GOODIX_BERLIN_IRQ_READ_LEN() macro to show GOODIX_BERLIN_COOR_DATA_CHECKSUM
is before the GOODIX_BERLIN_BYTES_PER_POINT data.

> 
> I also believe you are leaking afe_data in case of success. We have the
> newfangled __free(kfree) from cleanup.h that should help there.

Indeed it was leaking.

> 
> Another request - we should not have anything in goodix_berlin.h that is
> not used by the I2C and SPI sub-drivers, so the only thing it should
> contain is goodix_berlin_probe() declaration and dev_pm_ops. All other
> defines and definitions should go to goodix_berlin_core.h.
> 
> I made a few more cosmetic changes in the attached patch, please
> consider applying it.
> 
> Thanks.

Thanks,
Neil


