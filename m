Return-Path: <linux-input+bounces-6282-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0656896ECF9
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 09:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2417D1C229FD
	for <lists+linux-input@lfdr.de>; Fri,  6 Sep 2024 07:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1451514EE;
	Fri,  6 Sep 2024 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X1ZboXte"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1172614AD3A
	for <linux-input@vger.kernel.org>; Fri,  6 Sep 2024 07:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609557; cv=none; b=FvK5Gm7RecEhiyqMOwzfGYMBgLMi/vA1qJKM1nXR2M79ThmIaeBicFDowuMwuCIH1XPCCIv06g0gcJU+z/SFTO2uypyW82uqufLMxuJLrwu2fna+JcUy9b8BkTGVD/S+1KdHSMXLi46vZ1/wfO5T8j9qjyxbv1FIBV1mnaXvl88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609557; c=relaxed/simple;
	bh=BTvFMqnI3C+fYNMJw9p6O6lpXl43g9qsQMtyE9BXMyk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=HtJ7Mi5FkLg3eKdlgwtBLlBlKNw+l5z2dsaybvUi8OTSkoiTQpFZ0URSfMFctE+pEtOANX+VyfiZWgSdDnx80SCndFEY9nK0NjU6JUNr8mZGHs6y4H4p8+SwrGFz6EXOMz7uNSXNmEpp16D3F/5+wtE5sL+hg35IvORBphYgS9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X1ZboXte; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42ca6ba750eso421125e9.0
        for <linux-input@vger.kernel.org>; Fri, 06 Sep 2024 00:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725609554; x=1726214354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsW9dVa3QthW32mNAcUCOJ7lbNZVgGG8E+f9rCL9lAE=;
        b=X1ZboXteKv/c+52SWyFMu8kLcemIDbGmyJaGlqhwnDqJtU13BuRKpqifpzULwW/9a+
         b05U3Om/VfIjf93ED6qpW509krEkFGIo3qQgzJFHgefL5VvZHvTNJ+fxHFSG0m7VO1Vb
         BeSkYtf8HV5p4RLINsTDEgruvP2fXPQQqbkHI4DCUjMFRDjq9XdPpNIbbokRDGpftVrZ
         JE6HJP02dq+eF+501a0OhKHAGVp6b4RTOc+srSrGlt0u6wc9mGqLrAzXUsHQQZfVZHTT
         dvF89mkVbhsVDPHqMFOaULN67lJlF6NLCXsdQum/Ui7xI19s+946j96zZCmLNSbugPqR
         j79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725609554; x=1726214354;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qsW9dVa3QthW32mNAcUCOJ7lbNZVgGG8E+f9rCL9lAE=;
        b=Aren2SUzgF5EbG0/UdM3U29BpfJapVr0mctrm/r3R8S6AZFcIN43bL/5CogNZhFOyV
         EVUUORooAC1bnikZQ9X3LhwgiHXX7jrDQM2eZ/rP4M8NSBAgDPnhEOa8Zo9spMNazu1A
         8/6dvSk6Hum068qKlJVFkCigGicZrA+mL0ipwGpZvxm0cJwry6tx8957iGZceG7bTrmO
         drH4qh119gHnJSj5hr//nx5Tqp1IXoFLqVOAjO13FSF9RyVhqAx/y8VPv/uMH71xyBM7
         ddf93Sxz8b6SDvJXErrwssPV9ZgknmiQrY2MjytxzY5PbpV2wN+1i2EXZoryZBbSpPyk
         iuBw==
X-Forwarded-Encrypted: i=1; AJvYcCUVIabnXRSJpSwf1QQiS/A0xN0huI8Hmz8q2i3VoLt4r7I+gKNxcp1gK2d7abTPFxoCv9pC4M5QCtSNZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJqiSNJzNbXUp/4Ta88PPeZ61+Ld9GJwMvhtoXeqeyFr01Ybgt
	GR1xytOKYsL9mEUO52wUnZq/ThtBINcKM5nrH8uck2nkksyVv9t/tqWgtgB4yXzymFSAgAgq/yq
	q
X-Google-Smtp-Source: AGHT+IGkYYbpZEyRIOk9qf8USaEB5cXPjBhn4El5LQ8Hfs3zp0T/XSpSsYPXj4TQqa9t1HfFayEtww==
X-Received: by 2002:a05:600c:154f:b0:426:63bc:f031 with SMTP id 5b1f17b1804b1-42c9f498bb7mr10416615e9.1.1725609554055;
        Fri, 06 Sep 2024 00:59:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:75bf:cfcd:3d88:2a0e? ([2a01:e0a:982:cbb0:75bf:cfcd:3d88:2a0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ca05ccc27sm11749815e9.13.2024.09.06.00.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 00:59:13 -0700 (PDT)
Message-ID: <b4573018-365f-4ce4-9452-6fc7adae3f3e@linaro.org>
Date: Fri, 6 Sep 2024 09:59:12 +0200
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
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Danila Tikhonov <danila@jiaxyga.com>
Cc: hadess@hadess.net, hdegoede@redhat.com, jeff@labundy.com,
 krzk@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@mainlining.org
References: <20240805155806.16203-1-danila@jiaxyga.com>
 <ZtqTTZizT7nAaYzq@google.com>
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
In-Reply-To: <ZtqTTZizT7nAaYzq@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 06/09/2024 07:29, Dmitry Torokhov wrote:
> Hi Danila,
> 
> On Mon, Aug 05, 2024 at 06:58:06PM +0300, Danila Tikhonov wrote:
>> The dt-bindings specify the regulator as "vddio" instead of "iovdd".
>>
>> This patch fixes the regulator name from "iovdd" to "vddio" in the
>> driver code to align with the dt-bindings. Fixing the dt-bindings
>> would break ABI, hence the fix is made in the driver instead.
>>
>> There are no users of this regulator сurrently.
> 
> If there are no users (and the binding is pretty new) we should consider
> all options. Do you know the name of the supply in the datasheet?

The names comes from the downstream driver & bindings, but we don't
declare them on the Qualcomm platforms using the berlin touch ICs.

Perhaps someone from Goodix or someone with access to datasheet could confirm...

Anyway, this aligns with bindings so it's a correct patch.

Neil

> 
> Thanks.
> 


