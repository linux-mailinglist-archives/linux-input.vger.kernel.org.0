Return-Path: <linux-input+bounces-7720-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 980039B21F2
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 02:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E3D5B2111A
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 01:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BAF514D43D;
	Mon, 28 Oct 2024 01:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYttEtIA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695B6144D1A;
	Mon, 28 Oct 2024 01:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730078611; cv=none; b=raSFqW+EvlFx+eGMm74e78bz2wH17khRI5+/lvQ75PFDZpf7uKiYOw3sMFDeVWHsUMFbnFiybxnr27fE0rmcAhTjPUC8vEh4MM8tBDn40njxePGm7LHg0EUCLhegqNiR6UqeJCkVc6EcpnaJuJPPy91w/W6m+K4bRV/A5mdSae0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730078611; c=relaxed/simple;
	bh=HJi+BJjn7Ve/jnnDiDUG9g7kNP0SYinfTEVPempkbqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tyG7AB1wxHqhiAy5qjDBrCOzful56x5vnsNCEWoA1o1v2LV7ARcvH6F3S4nsRUUp9Q4T5wD06SLVqRwAUp/aormlAD/4iXD19sHh6DwED9BgTbbCMeCZyKZ5ENfNCcmYbLy4iJyshO0mXAIukuZUsmwYnwta6dRwLaX2+4oQdng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYttEtIA; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20c805a0753so35354955ad.0;
        Sun, 27 Oct 2024 18:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730078609; x=1730683409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N5mbMT7c/xF5gJ/9esVEkt4fmWDi68Ivvmcpowxh1iI=;
        b=VYttEtIAeH08E8mqUcUCAAaLmrCT7/0et5II4T8qVV5kms8aIdvSMF+GislWo244W9
         5VSel8S8EiLxTRkkhkcOJLWoWe+gfeBcdZPoR58V3cN9CWXPQA6GkMm0Nbze7ZrWlqsJ
         nU9VTpLhy+Pg3zJzvd4yvKGWDultjdiOc/Wtq2GlwoJX2UNwZrTozXqwiWweLovIMEo7
         iUQW4QIYBTaKax8JwaN3fMkquktuvieEFKSh5OPBB7/NJ4/znUGpwvexDiQEHDqaSuPM
         2F15/6R59747/SkWYYcpxO0KXG5JF9+JRbUuYe4RxnRd/Hu97Z9qSmZgn42BiH5hMg1p
         K7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730078609; x=1730683409;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N5mbMT7c/xF5gJ/9esVEkt4fmWDi68Ivvmcpowxh1iI=;
        b=fYpFQf4wFEly/4FVf9oGwD3nP/jqS3UjebZTmyBp3WKvEpEznr4g76jpMrsB55GMax
         efWKHG8/alITVcftDKcBUImRO7HWOSL+DH9zaNr75ceuppl+3ZlP8JrceMu35J92tUav
         3EE7FponHPA8O0fPs5B1pbPsfYp1Lipe2dtAcxhpaI3qdUM8ma8x3v/tkG6ArW/jNtpq
         N9wqlgLYWG6Duo7MMUflGXjxO2hCL33z1nJi5FcF44OGsR4iJRVhyJhEuxAjtn0/STk0
         iU7sClI/uia6ACw3rRHPsqcstYv7c/H/cHgKcuUHGk9cm5bjhwHttl/fNn9vk/zj5TaS
         3bIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKBed22hXBitsGYF76hToatKNRokge8OuMs+A0UTn8o/hMuc6ueIgP3s6TN8wHRArpQwsRJQDzi6jnEKs=@vger.kernel.org, AJvYcCVqVtUoR9uOLBN0U/5y4C+u40nqWT0+HCyXEe9UK6rK8gDwCjkrpGboS1Z/DJaRv2QMVtdLAbaWVn5D@vger.kernel.org
X-Gm-Message-State: AOJu0YxBlp8C0zR1mVdJoXZWcqAh+8PadeJZBIq9EH19dRXiVoaOy5oo
	IDu7PgV/jkO0l942D/A7qf3NsCQ+Ho2FjeU7+TCLY3RKAbPKqmib
X-Google-Smtp-Source: AGHT+IGPTqON5yczkQQZ40CfVtwv0LqbTvJQFsIl8Iev1gtt606RwXiUBJItJfMCD5Qy+h9NFZ7Ayg==
X-Received: by 2002:a17:902:d50c:b0:20c:9eb3:c1ff with SMTP id d9443c01a7336-210c6cc5afbmr97513125ad.59.1730078608609;
        Sun, 27 Oct 2024 18:23:28 -0700 (PDT)
Received: from [172.19.1.43] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc04b201sm40225325ad.272.2024.10.27.18.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Oct 2024 18:23:28 -0700 (PDT)
Message-ID: <e018fd4a-2af0-4062-8128-e2465dba8728@gmail.com>
Date: Mon, 28 Oct 2024 09:23:24 +0800
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
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <ef407e89-950f-4874-9dca-474d107f6a52@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2024/10/25 下午 07:42, Krzysztof Kozlowski wrote:
> On 25/10/2024 07:36, Ming-Jen Chen wrote:
>>>> +      0  = 0 clock
>>>> +      1  = 0 clock
>>>> +      2  = 0 clock
>>> Heh? So this is just 0
>>>
>>>> +      3  = 8 clocks
>>> This is 8
>>>
>>>> +      4  = 16 clocks
>>> 16, not 4
>>>
>>>> +      5  = 32 clocks
>>>> +      6  = 64 clocks
>>>> +      7  = 128 clocks
>>>> +      8  = 256 clocks
>>>> +      9  = 512 clocks
>>>> +      10 = 1024 clocks
>>>> +      11 = 2048 clocks
>>>> +      12 = 4096 clocks
>>>> +      13 = 8192 clocks
>>> Use proper enum
>> I will update the definition to specify the debounce period in terms of
>> keypad IP clock cycles, as follow:
>>
>> nuvoton,debounce-period:
>>       type: integer
>>       enum: [0, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
>>       description: |
>>           Key debounce period select, specified in terms of keypad IP
>> clock cycles.
>>           This value corresponds to the register setting for the keypad
>> interface.
>>           The following values indicate the debounce time:
>>           - 0 = 0 clock cycles (no debounce)
>>           - 3 = 8 clock cycles
>>           - 4 = 16 clock cycles
>>           - 5 = 32 clock cycles
>>           - 6 = 64 clock cycles
>>           - 7 = 128 clock cycles
>>           - 8 = 256 clock cycles
>>           - 9 = 512 clock cycles
>>           - 10 = 1024 clock cycles
>>           - 11 = 2048 clock cycles
>>           - 12 = 4096 clock cycles
>>           - 13 = 8192 clock cycles
> No. 0, 8, 16, 32 , 64 etc.

I will change it to the following content:

nuvoton,debounce-period:
   type:  integer
   enum:  [0,8,16,32,64,128,256,512,1024,2048,4096,8192]
   description:  | Key debounce period select, specified in terms of keypad IP clock 
cycles. Valid values include 0 (no debounce) and specific clock cycle 
values: 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, and 8192.

>>>
>>>> +
>>>> +  per-scale:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description: Row Scan Cycle Pre-scale Value (1 to 256).
>>> Missing constraints
>>>
>>>> +
>>>> +  per-scalediv:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>> +    description: Per-scale divider (1 to 256).
>>> Missing constraints
>>>
>>> Both properties are unexpected... aren't you duplicating existing
>>> properties?
>> pre-scale:
>> This value configures the IC register for the row scan cycle
>> pre-scaling, with valid values ranging from 1 to 256
>> per-scalediv:(I will change pre-scalediv to pre-scale-div)
> Please look for matching existing properties first.

I will change it to the following content:

nuvoton,scan-time:
   type:  uint32
   description:  | Set the scan time for each key, in IP clock cycles. The valid range is 
from 1 to 256.    minimum:  1
   maximum:  256

nuvoton,scan-time-div:
   type:  uint32
   description:  | Divider for the scan-time, further adjusting the scan frequency for 
the keypad. The valid range is from 1 to 256.    minimum:  1
   maximum:  256

>> This will describe its role in setting the divisor for the row scan
>> cycle pre-scaling, allowing for finer control over the keypad scanning
>> frequency
>>
>> I will change it to the following content:
>> nuvoton,pre-scale:
>>       type: uint32
>>       description: |
>>           Row Scan Cycle Pre-scale Value, used to pre-scale the row scan
>> cycle. The valid range is from 1 to 256.
>>       minimum: 1
>>       maximum: 256
>>
>> nuvoton,pre-scale-div:
>>       type: uint32
>>       description: |
>>           Divider for the pre-scale value, further adjusting the scan
>> frequency for the keypad.
>>       minimum: 1
>>       maximum: 256
>
> Best regards,
> Krzysztof

Best regards,

Ming-Jen Chen


