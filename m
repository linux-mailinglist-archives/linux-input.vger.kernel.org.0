Return-Path: <linux-input+bounces-7754-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0179B400D
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2024 03:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B5A628351E
	for <lists+linux-input@lfdr.de>; Tue, 29 Oct 2024 02:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8C44EB51;
	Tue, 29 Oct 2024 02:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coWb278Q"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA861863F;
	Tue, 29 Oct 2024 02:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730167246; cv=none; b=as7rJNFuOXflaLCtkUUEpazCrNN1wGDRhXa99/XB/pY/TDqg24M1iRW+ALIxTgDyhZv5mrZ+MFd4h8mZxybFQqKj5XTiQzkWDgdxpnKbTDbSGbXADSH8iFNJsDifuaWZkOpJy3FEj01epIlf/vZCHWCn16Cb+V5O3yxdVti4rf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730167246; c=relaxed/simple;
	bh=y6c9W2BhZ8uXbQJzzvRDeeD9cGjwKQCrw1acBOtFIB4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VRnuZ7vg55joTXUm+dBH2z6hk0iiePkCK5RccuBQg2I8+xr6JlJYBdgD+AJDgW7svto90Fu7OBONrtGb66ne9OqYnZowvedcVCcO8C1Xz21slNtJex+QAHgyGyYQ1zx5iuPoFomon0xyFeIuV4a0vVLfjsptQ3zz+neyoksZTIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coWb278Q; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20cdb889222so46457475ad.3;
        Mon, 28 Oct 2024 19:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730167243; x=1730772043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8hQc1q0c7ydkzj5XJQv8spb+cOnEwBuYMtKquh67M4=;
        b=coWb278QfxWIAeOUkQjlPugYp1EurhHD58uLAeta98pPBvAMTowVzs8uY7n13/FTQy
         x2XJdHBgC9P+UvQuTaui/GFJ6POXDUu83ea5Xq1hdvjg/A38jHAvsm65IBrR2SfJ3trr
         yqn4sdpvM5VP0vt1rx7FRJfQpziVic0e6gd3+NIu4BSA2rdZA6rK+1TAfZE6/Cw7A1kC
         6ys1g0fpl1RSRmySJ0b/RCV81Nvm4iC1ag3IA417hRwmsQbEsIEluX+A5CQZipRIwRcB
         7NAJBVGkpGKUtoKR353eUsmLZsGfj9k1YYB7aVhVUMbmYiBK9IzzWBGeveg1KT+KL9j/
         4kPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730167243; x=1730772043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H8hQc1q0c7ydkzj5XJQv8spb+cOnEwBuYMtKquh67M4=;
        b=sdMWf5GgjNQzZ3GnfyYiAHA0/4wDQJk3GIIusk/l17mIMGy0FPUiZcuTBaVh69CSBC
         wVjrsSwotviwdD9W9dah/t3k7P2tyG8YIYcIMXpkM+/8dsQ68lW5Q37pMEmdTy97F7IF
         G8MrJ+PSCevkgymfaavQS5gxYcQcCBITAPYD0LI0A0ek044kmJy2gzi5Mc245MjVenKx
         HmrPvV/KldjHp6BlVFasGFA7Bv/Gnu3e5vTDRG2jEQjxkl0kfKHMMJ0ndvS/D7QbHDNJ
         xossHh7arRCKkguKm1huzt3YuqWy33T/m5Sxg4K/n9vVMukTof1SOKG6fV5Wkp8PqYgm
         LfzA==
X-Forwarded-Encrypted: i=1; AJvYcCVHFhszdI9gZtxHXwafXUJRlekgWcHFH6a2cRWNbOKbthVPRwteAfyLjSiqswuAStk/SkNk7eQnWZ5n@vger.kernel.org, AJvYcCWkDZX344Lf6jeMfJO11JeTqsXzwBf79vUwxDw5UE/DflhbICqZ9Ok/yTzlbL0hWi79nNlHc75EqZNsnv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YypvJK//tf7w9fgJ0048psajoSWLE9mhe0/WsdAovK9ffm9MAMJ
	BgEL2CWthyqHVqBIPpy6kXNMu90VnyRMhMEcJqSR2bXtCw4rQ5mT
X-Google-Smtp-Source: AGHT+IHMp3p4tpfyLl4RBnJLnYbIe3AX6KVzvQAl8IiivMOzrOseT29gVE2QoPoZ7v8iAA8jRIZnvA==
X-Received: by 2002:a17:903:2343:b0:20c:675d:923d with SMTP id d9443c01a7336-210c6c6f732mr150637715ad.39.1730167243375;
        Mon, 28 Oct 2024 19:00:43 -0700 (PDT)
Received: from [172.19.1.43] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc044a4csm56476155ad.248.2024.10.28.19.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 19:00:42 -0700 (PDT)
Message-ID: <5d9e89aa-db10-4367-8417-9fcc1a3bb37a@gmail.com>
Date: Tue, 29 Oct 2024 10:00:39 +0800
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
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <9b0a508e-d9ae-45ab-882f-5bc1f03e13db@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024/10/28 下午 03:04, Krzysztof Kozlowski wrote:

> On 28/10/2024 02:15, Ming-Jen Chen wrote:
>> On 2024/10/25 下午 07:42, Krzysztof Kozlowski wrote:
>>> On 25/10/2024 07:36, Ming-Jen Chen wrote:
>>>>>> +      0  = 0 clock
>>>>>> +      1  = 0 clock
>>>>>> +      2  = 0 clock
>>>>> Heh? So this is just 0
>>>>>
>>>>>> +      3  = 8 clocks
>>>>> This is 8
>>>>>
>>>>>> +      4  = 16 clocks
>>>>> 16, not 4
>>>>>
>>>>>> +      5  = 32 clocks
>>>>>> +      6  = 64 clocks
>>>>>> +      7  = 128 clocks
>>>>>> +      8  = 256 clocks
>>>>>> +      9  = 512 clocks
>>>>>> +      10 = 1024 clocks
>>>>>> +      11 = 2048 clocks
>>>>>> +      12 = 4096 clocks
>>>>>> +      13 = 8192 clocks
>>>>> Use proper enum
>>>> I will update the definition to specify the debounce period in terms of
>>>> keypad IP clock cycles, as follow:
>>>>
>>>> nuvoton,debounce-period:
>>>>        type: integer
>>>>        enum: [0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
>>>>        description: |
>>>>            Key debounce period select, specified in terms of keypad IP
>>>> clock cycles.
>>>>            This value corresponds to the register setting for the keypad
>>>> interface.
>>>>            The following values indicate the debounce time:
>>>>            - 0 = 0 clock cycles (no debounce)
>>>>            - 3 = 8 clock cycles
>>>>            - 4 = 16 clock cycles
>>>>            - 5 = 32 clock cycles
>>>>            - 6 = 64 clock cycles
>>>>            - 7 = 128 clock cycles
>>>>            - 8 = 256 clock cycles
>>>>            - 9 = 512 clock cycles
>>>>            - 10 = 1024 clock cycles
>>>>            - 11 = 2048 clock cycles
>>>>            - 12 = 4096 clock cycles
>>>>            - 13 = 8192 clock cycles
>>> No. 0, 8, 16, 32 , 64 etc.
>> I will change it to the following content:
>>
>> nuvoton,debounce-period:
>>     type:  integer
>>     enum:  [0,8,16,32,64,128,256,512,1024,2048,4096,8192]
>>     description:  | Key debounce period select, specified in terms of keypad IP clock
>> cycles. Valid values include 0 (no debounce) and specific clock cycle
>> values: 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, and 8192.
>>
>>>>>> +
>>>>>> +  per-scale:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>> +    description: Row Scan Cycle Pre-scale Value (1 to 256).
>>>>> Missing constraints
>>>>>
>>>>>> +
>>>>>> +  per-scalediv:
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>> +    description: Per-scale divider (1 to 256).
>>>>> Missing constraints
>>>>>
>>>>> Both properties are unexpected... aren't you duplicating existing
>>>>> properties?
>>>> pre-scale:
>>>> This value configures the IC register for the row scan cycle
>>>> pre-scaling, with valid values ranging from 1 to 256
>>>> per-scalediv:(I will change pre-scalediv to pre-scale-div)
>>> Please look for matching existing properties first.
>> I will change it to the following content:
>>
>> nuvoton,scan-time:
> Why? What about my request?

I utilized|grep|  to search for relevant properties in the|input/|  folder using keywords such as|scan|,|time|,|period|,|freq|, and|interval|.
While I found some similar properties, I did not locate any that completely meet my requirements.

For example, I found|"scanning_period"|, which is described as "Time between scans. Each step is 1024 us. Valid 1-256."
I would like to confirm if you are suggesting that I use|scanning_period|  and explain my specific use case in the description,
for example:

nuvoton,scanning-period:
     type:  uint32
     description:  | Set the scan time for each key, specified in terms of keypad IP clock 
cycles. The valid range is from 1 to 256.      minimum:  1
     maximum:  256 Could you please confirm if this approach aligns with your suggestion,
  or if you have any other recommended existing properties?

Thank you for your assistance!

>
>
> Best regards,
> Krzysztof

Best regards,
Ming-Jen Chen


