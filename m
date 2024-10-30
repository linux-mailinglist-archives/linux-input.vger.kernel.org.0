Return-Path: <linux-input+bounces-7762-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EC29B5984
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 02:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72F5B284951
	for <lists+linux-input@lfdr.de>; Wed, 30 Oct 2024 01:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B821197A88;
	Wed, 30 Oct 2024 01:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVsRemNU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D29B18E37B;
	Wed, 30 Oct 2024 01:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730252803; cv=none; b=mh9+rfM5NGzLKTcVRMbe8UllrLYVgnE6mAbfKJSmVSVGI4jp07IviTWTLo5IUTZ6dSejgqkCezGk9/R3en1jfS/ntbQb9OjbwIDddTQaa1+rN6W9pm7eZ1UVVd/6Vi0ekMFbpWn3rx4F52himRO/dY+4sIl/26VQrOXC822QjaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730252803; c=relaxed/simple;
	bh=7pum3/JkD0BwlxJPHGGkWM5clHm8rPDq6SZ4bCR2v4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EEmuUWYyNzVbU4nBbXNVa29y7KRRlOg/V9emtJKr8blAICXAyu41sqiCXHnKfFUmkxICI8UsUxYjSuzzn5dagkVeHbxMD6HYHgRZdkppIv0zrFWdf1DrTyv1xrK57jnSUlM4ox7GOvJfWs+9W3fSraFwDkULT2J9ZyXaXAtWOes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVsRemNU; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e2d1858cdfso4376433a91.1;
        Tue, 29 Oct 2024 18:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730252801; x=1730857601; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bxFMjfk3ggTn0moJ8sPpGVsqjY/2TWidvbtEhX4CnB4=;
        b=cVsRemNUT/4Rb5OvkiD/uDtbAnWZWVGE4aIJGEf4Hd2V68jhk+Rx5AEffgd+aLIH8U
         TAwhot+czAADbrxZZnKp9NzhwzkEIUwEvlER+ZtbeeoblGd1Y7910q6dEq4zak0qZ9bU
         4EoehDZjHcJmPDjwwEgWZsfXV3tc50auCSzujQyylWqCv77r6rR5WTVhVOzzWvuHuYcd
         lbr9QQ9X1cNLdOLnekNU/Md4LACAD1vN/u+XWGLjV9sHFk9+r9Nix97J5MApNd0JaIXF
         jiLCsBYYQAbCp2qspfrAUb5L4h1TbkU5bIh/My9fTfrKTFW5z8DDVDR4MTrft59pACUq
         DGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730252801; x=1730857601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxFMjfk3ggTn0moJ8sPpGVsqjY/2TWidvbtEhX4CnB4=;
        b=J9o8eE8Tthp3YklzEclS02+weMAGh8AxefVOyKtOOFm4zCxzzsLU1rkYLxvLgXu04z
         Rajsb5mUccPQ4U/vKj1W2hzSlub0W7s5Bu1Aiz/Zk1/a5HTfMFE+lPyj4kfvCjt2+4tB
         Jk0bYafZIx2VeZIZ77gvRpmanpPubPFd/n8pZS6gK4yMLClI3WlbCkGeuU+ABOiZmQw0
         el90ABOCEILNco/9mCx/+rRObkpszLVpvc0+J3W6sAFNuMnWM5WhSt//u1eiDVtsMP3X
         mDjG5ZOYeOeZHGe3uMBedxVVafGXZFoexoHGM8r0ZPFwCSQ9dGzvyqOYs1ggz679x2y8
         52dA==
X-Forwarded-Encrypted: i=1; AJvYcCURUkLvdOBBxvr8b/nvT2NVJS6sRbiB1lMG6nlS7KcByuyG2XgHoXmsK3T2QLE3u7CYaUnbYeaMFrjDOcI=@vger.kernel.org, AJvYcCWJ4YAwjPdz1kZ8oKMaLrTjKWvZ2w2sHJn3dBm7t3QxTyxBlmzdZ/PlAJup7GgHPOHegG+Z8V4fpYk0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3iFUn55kV0jt8yqZu6FPfAO5+l8GYaVjVZJzq0NWFk7d+svlX
	wdeGocCBYNMYrhP8tgO842K1VT1aU0v3CfEsM06p0863d8TjJ4ly
X-Google-Smtp-Source: AGHT+IFZaj6aH2mDsjSI9GjYLL9VJVuI4bzhbZhrUs/Yck/v3RydR1pivAyoeT2NdQVzHEfQvCmzpQ==
X-Received: by 2002:a17:90b:4b06:b0:2e2:cd62:549c with SMTP id 98e67ed59e1d1-2e8f10867cemr16377916a91.22.1730252800759;
        Tue, 29 Oct 2024 18:46:40 -0700 (PDT)
Received: from [172.19.1.43] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e92fa57cc3sm380550a91.32.2024.10.29.18.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 18:46:40 -0700 (PDT)
Message-ID: <d6bf5b0d-7036-4636-a15e-41db6f665323@gmail.com>
Date: Wed, 30 Oct 2024 09:46:35 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: input: Add Nuvoton MA35D1 keypad
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mjchen@nuvoton.com, peng.fan@nxp.com, sudeep.holla@arm.com, arnd@arndb.de,
 conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 dmitry.torokhov@gmail.com
References: <20241022063158.5910-1-mjchen0829@gmail.com>
 <20241022063158.5910-2-mjchen0829@gmail.com>
 <csbechg6iarxx52z2gqidszhvgjdvaraoumpfcsozelhuuhmtb@ec7es3txuzxc>
 <871e9a4c-7a3c-4a24-8829-a079983033da@gmail.com>
 <ef407e89-950f-4874-9dca-474d107f6a52@kernel.org>
 <984781ba-9f4c-4179-84d5-4ab8bbe4c3c6@gmail.com>
 <9b0a508e-d9ae-45ab-882f-5bc1f03e13db@kernel.org>
 <5d9e89aa-db10-4367-8417-9fcc1a3bb37a@gmail.com>
 <844798ab-2910-458e-a9c5-dc69f5c8e368@kernel.org>
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <844798ab-2910-458e-a9c5-dc69f5c8e368@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2024/10/29 下午 09:19, Krzysztof Kozlowski wrote:
> On 29/10/2024 03:00, Ming-Jen Chen wrote:
>>>>>>>> +
>>>>>>>> +  per-scale:
>>>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>>>> +    description: Row Scan Cycle Pre-scale Value (1 to 256).
>>>>>>> Missing constraints
>>>>>>>
>>>>>>>> +
>>>>>>>> +  per-scalediv:
>>>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>>>> +    description: Per-scale divider (1 to 256).
>>>>>>> Missing constraints
>>>>>>>
>>>>>>> Both properties are unexpected... aren't you duplicating existing
>>>>>>> properties?
>>>>>> pre-scale:
>>>>>> This value configures the IC register for the row scan cycle
>>>>>> pre-scaling, with valid values ranging from 1 to 256
>>>>>> per-scalediv:(I will change pre-scalediv to pre-scale-div)
>>>>> Please look for matching existing properties first.
>>>> I will change it to the following content:
>>>>
>>>> nuvoton,scan-time:
>>> Why? What about my request?
>> I utilized|grep|  to search for relevant properties in the|input/|  folder using keywords such as|scan|,|time|,|period|,|freq|, and|interval|.
>> While I found some similar properties, I did not locate any that completely meet my requirements.
>>
>> For example, I found|"scanning_period"|, which is described as "Time between scans. Each step is 1024 us. Valid 1-256."
>> I would like to confirm if you are suggesting that I use|scanning_period|  and explain my specific use case in the description,
>> for example:
> Description of these properties did not tell me much about their purpose
> and underlying hardware, so I don't know which fits here. It looks like
> you want to configure clock... but then wording confuses me -
> "per-scale". What is "per"? Isn't it usually "pre"?
>
> So in general I don't know what to recommend you because your patch is
> really unclear.
>
> Please also wrap emails according to mailing lists standards. And use
> proper line separation of sentences. It's really hard to understand your
> email.

I apologize for any confusion caused by my previous responses regarding 
this issue.
It seems that our discussion has reached a bit of a bottleneck.

I have a suggestion that I hope you might agree with: I would like to 
upload version 2 of the code.
In this version, I will rewrite the properties, although it may not 
resolve their underlying issues.
I will also continue to keep our current discussion ongoing in version 2.

Thank you for your understanding, and I look forward to your thoughts on 
this approach


>
>> nuvoton,scanning-period:
>>       type:  uint32
>>       description:  | Set the scan time for each key, specified in terms of keypad IP clock
>> cycles. The valid range is from 1 to 256.      minimum:  1
>>       maximum:  256 Could you please confirm if this approach aligns with your suggestion,
>>    or if you have any other recommended existing properties?
> Why this would be board dependent?
>
> Best regards,
> Krzysztof
>

