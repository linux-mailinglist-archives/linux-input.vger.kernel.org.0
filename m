Return-Path: <linux-input+bounces-12189-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 356CDAADB5E
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 11:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE4AF1BC40D5
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 09:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D629189B8C;
	Wed,  7 May 2025 09:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p16AwptU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A38155326
	for <linux-input@vger.kernel.org>; Wed,  7 May 2025 09:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746609618; cv=none; b=HrU0ziiUTyfnj/3CZcwDnF/WmrOtgY+ByIYsHr3/1RWXOFxJTT0kNfdvCwY8+PrLkTGPyUeIcB3FuYWWu69m0o+Y917wyvFbZOARuYX6Yx0AbNqC7NTWHPhka9T6P/2OTdSkGe2qecxEkuTgt9lA0SWJZqiynJxaB2Rm8rlaeUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746609618; c=relaxed/simple;
	bh=0IfhmpCW/CyAYeO02o6DSgjDR85Ki9ApcScPfaeTPzg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=T/O/knwEaKJqMJdjUWJYUQWysxCiL0xtrZU2sXY+6Xpzd8x57Jt686LkO6JRXHQ/63NACmd2I5tWQBiM6SEV6qDr+EBll9oClGwovv5Ndx+ccHUa2gt7RFCd1xIW9r0VWK1SEpmnoE86U12JBb8r7TxGFPwpr17y5HJfIuacDDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p16AwptU; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso4839345f8f.2
        for <linux-input@vger.kernel.org>; Wed, 07 May 2025 02:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746609613; x=1747214413; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1njWSRf45ZDmLxqO2qReL+xw32Jj+Gkcqkwi1/z3DHU=;
        b=p16AwptUGqrojQKPpXy1X0owBWaC2eBfD4KqlmoGiNWLKmxMMDCxHAFuF1RxaZexCp
         qLM84Cb/F4kQ7egvLMtsagatJ3bd6Z5kKck/qjyZPDRhL/tBkKgOICbB1ZKbWZQrVoBf
         i45Lh+qF7MSrLHU7TqAfzX33HjJwb4Zhyq4m34ZCSohHJpP7sqlGt6qECAPYB81t7exE
         QcZe0FyU7rBL9PobJ/GYIUmFCpkSkS7A8+L2jWC/JIc4jwLDlCki4ukYoOop9EHeHotc
         99RjDTMIspHiPYBUsq5XVNOKqfeurFS2rk4M5IRk/EfbOa5vhxViD2r8Rfh71rx8FvOZ
         Wjzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746609613; x=1747214413;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1njWSRf45ZDmLxqO2qReL+xw32Jj+Gkcqkwi1/z3DHU=;
        b=k76aO/7qgw7U+HAVzjAlDWGs1nUxBt2TrUmV6WDEX3kyd2ehE105lj/5mKNiUtNNjQ
         c8HAnmSJym5fhnEmGkOdPWKOMs+acaMqXADgLvKiNPeY1dwwzUnHAdWPUGYANrjF0SUG
         2atCMrmIzvmik2obPGOij3KADv+kodm1XsDB25BMh4+gpqVQj9TbVKS2LHDrVX82roIV
         Yg+pbVOTvcigB834QOfsKIMGC95DAJPvWlWPhep7pBLEPns5S2a5vdP5kjp/8pBXtAdP
         S9e6o9Dnqq4MrXcrxgBJB3Q24SvlyDI67+G82vX4oTYS6r0rp6cbssLGmHrnes8n4TMI
         r3dQ==
X-Gm-Message-State: AOJu0YxxHIJKoyqElDkLjLR9QGNBf0E4LHflQDJURUCiWoxCyIQBFvMT
	fUgsogcLGTzfrA8XB/2410Z8zFS/rS8pZpy0AitxYipbw1UkTebfqi4QgLbBW0E=
X-Gm-Gg: ASbGncuAK9rhHGZjf9onyznC5QLT3YHZniyjOd2gfbcMZbykic9y4bUkNIBS6t4gphV
	ZARWZfKHP7qcxCfoaYIONF1Ol6LfHM4HjuRMeYfFUju2Fm66OhqxFvouo29ZznP9eh7AxJxTSXI
	a3kiWcHlvjd2t0EcT9mxWM54JSUihUPPj8VWh/n1v0W+2TOBnOy47Yy+HiCVJ/o5ZgAX+X/F+DS
	QXBLxblwBWV0M9yGDHIGls/SFmBSY6WCMIFko9jwhmS6aBQWlC91oDU//di515VNoGGMHWUFBmd
	Fpiac/SuFzpvP6RVBADT4CinXVPeD4VPSHy9v4LWYIjMTACr3j7GGXPpx8VuVB3s5Ngw2Yj4ZD2
	nbWkNHt1zHWXwkoDWcA==
X-Google-Smtp-Source: AGHT+IEAm8WnYpaJaFCnAIQh6i1JbL41eserYkboKFbrFiqBYvdjFP6g92MFdos53ZjJs0xJJl0nzA==
X-Received: by 2002:a05:6000:420a:b0:39e:e3fa:a66b with SMTP id ffacd0b85a97d-3a0b49bbe3amr2133655f8f.34.1746609613081;
        Wed, 07 May 2025 02:20:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:784f:3312:6406:12a9? ([2a01:e0a:3d9:2080:784f:3312:6406:12a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0ad661602sm4745706f8f.61.2025.05.07.02.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 02:20:12 -0700 (PDT)
Message-ID: <b651623f-f102-4fa3-9a21-df9f8c7d4d7f@linaro.org>
Date: Wed, 7 May 2025 11:20:11 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 0/2] input: convert dlg,da7280.txt to dt-schema &
 update MAINTAINERS
To: Support Opensource <support.opensource@diasemi.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Roy Im <roy.im.opensource@diasemi.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 kernel test robot <lkp@intel.com>
References: <20250306-topic-misc-da7280-convert-v4-0-2972c4e81cb5@linaro.org>
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
In-Reply-To: <20250306-topic-misc-da7280-convert-v4-0-2972c4e81cb5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 06/03/2025 11:56, Neil Armstrong wrote:
> Convert the Dialog Semiconductor DA7280 Low Power High-Definition
> Haptic Driver bindings to dt-schema. and update the corresponding
> MAINTAINERS entry.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v4:
> - Rebase on next-20250306
> - Link to v3: https://lore.kernel.org/r/20241211-topic-misc-da7280-convert-v3-0-4df87ac08881@linaro.org
> 
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
> base-commit: 565351ae7e0cee80e9b5ed84452a5b13644ffc4d
> change-id: 20241204-topic-misc-da7280-convert-20efaad588ca
> 
> Best regards,

Gentle ping.

Thanks,
Neil

