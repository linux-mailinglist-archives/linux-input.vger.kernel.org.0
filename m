Return-Path: <linux-input+bounces-8419-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 573669E650F
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 04:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25695166104
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 03:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D783415534E;
	Fri,  6 Dec 2024 03:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBaazz6X"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A13339AB;
	Fri,  6 Dec 2024 03:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733455959; cv=none; b=JUiwIBV2Qe6YOvyqxvRe4Dmp9tYwkHn7qK7giIN9EYNV5gsyotnVf41KmT/N0iGIal6QWG0P/SWwLi0SK6qdqkwNloVhffM9ZMtm7oKZwv6qD92HMu+LJB/tjod3cdZsi5VdaqixJLK5o8e02WykffhelEqBQXFqoiZPxJiJz3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733455959; c=relaxed/simple;
	bh=mwMqE6yNUT+08zKxIXZH/OF0Mdj3OzY1yHnQ5kAYcWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QDKN2+/iC4e+qZ2TSn6bPKpabGNWbc7BwrClgeLEHfEVP3bezFKzVKV9xg0O583MWnJM4P4eArsL2WEJAj+dpSQWWIZAakiXkGPIwgGeO3W+SXJSdrWsZgIXmZtL8tqtXvcYRPgYkh763ygwOGrcazoseH4im25MZ69HPH/1Mfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBaazz6X; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ef28f07dbaso1192207a91.2;
        Thu, 05 Dec 2024 19:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733455957; x=1734060757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=InGT874kUKhcsccv7ICljIdW+V3gP1KGLAFnR4ziHQA=;
        b=KBaazz6XldyJC3mlcKz9xvv7lZDxuxwCeW2j5DznfpxQxeb9mZBW84TbNVu3Xt3gLF
         952El/btioa+9RH44OLCZCHBHmsNMdMgAr6epxJrkHLlqIKM/qO3sSanW7T0CDsEhnPW
         DuMND7ydPnREaUZYRXBUhU41brmUqViv9pJyPqzWAKejHMkNOa37f5eWVVib3hRWqP1r
         iWWEk506OyT0aIX0keYFo+89nOkrP+YWK/xlG+iQMwayARf7UHToe3AAuncLk9FcRw98
         uGxSmwUiBqS/a/dHILMFKWd1I/GvmSFIPYVwXsk99OLzvVJTaqJU13yDu1/H1qBw9viZ
         l1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733455957; x=1734060757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=InGT874kUKhcsccv7ICljIdW+V3gP1KGLAFnR4ziHQA=;
        b=QjGhGfvHA1oDPTpXE1wVR4LNioNEZIwQ1shVLnyTVG9bZLw7zgIDym8iWDrnXEl+rD
         l4JEanDIB6dNqIlbeOu/nHv5vvNMvHJLZFxkneTLsbhBPwACklItLi8Ygdd//TdaSD2u
         686cdZ4XmOo6F/n158CnmfbYhWPsZcn/yh4v0iLrj/6p8nCwjYZ+AbYA5v8XZuzLrHhs
         Vx1TOGVUuCKLWRmc6IBuSOjgFltJ4v4Qs6P8zcm13QSBYIxF52tPHQoa1Fvhyz/HEBq5
         TY9HgV1mlGQIMOVHAkcUED5YBtlnT8xp/n/FeX5FnO/puGpBaq6fGTbAytmqTZhd6Ecr
         nIHg==
X-Forwarded-Encrypted: i=1; AJvYcCVnKKhZoPQSfhplW09trDhPGZ7qaXpgVGBbYsXWd89nigvkut07evROrnv0lwgHZcdRAwC/0dNl7fqZ@vger.kernel.org, AJvYcCVonO9o1usONj2oFHNLa6qaSsv9SF2U1aDYi0hkmdCouj08C0mKBXFUgCBe7QhBP7N6OjfP2XRMYw/fOm8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlSVRE6Le31quBer7VbwrPTxALHJMdNIVo5kgJmqKKP6lwZsoI
	htxA7wwhZdmr0Uuqr5GpxwZ2YnrLLpCAThadCksbrAg05eRaJs3g
X-Gm-Gg: ASbGncsNqDzMVaqKLfnoCgltGyf+Pd90mdLNTxTzDzRv5VhWUTeVZztokXrGvE5RPrv
	TMwoBcHFwLsOl1HbDfj5Vjj+ockFBQ+225mMAc5J/xtmKbUeRslPZzsM3FfPZp1XN2mQC6R/mGU
	NL4aeKljYTsb9S/1yc57hQz4wZSnY9BamS6YMFn6yk4s+Gol1GBgSxNjcp3XHPzeOBRaxcacxTX
	B6XYKqH3D8x4eiCzvPYxNt2Y8AhwrEgm/AK3nvJ10mfiMo5tQXwhFN6qgTPU1lOrSiD2Yh6CCFq
	ZSeEj9azmNol4cA/Km4CgZ2d
X-Google-Smtp-Source: AGHT+IFzqeeiyWkh+7hlsWMiFQHoZNyYQ7mM3MvVKI/Bj7bYHGVlKAvdSQ8+aeb4VO2V4WUi5eqliQ==
X-Received: by 2002:a17:90b:3a50:b0:2ee:9cd2:a589 with SMTP id 98e67ed59e1d1-2ef6a6be86dmr2550021a91.20.1733455957398;
        Thu, 05 Dec 2024 19:32:37 -0800 (PST)
Received: from [172.19.1.43] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2700aa25sm4049963a91.16.2024.12.05.19.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 19:32:36 -0800 (PST)
Message-ID: <1c0f9efb-61a0-42b9-abe5-87cabe2d783e@gmail.com>
Date: Fri, 6 Dec 2024 11:32:34 +0800
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
 sudeep.holla@arm.com, arnd@arndb.de, peng.fan@nxp.com, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, dmitry.torokhov@gmail.com
References: <20241119025954.4161-1-mjchen0829@gmail.com>
 <20241119025954.4161-2-mjchen0829@gmail.com>
 <ql6m6qrdokwfu4iizn6wmvovawuc7kgg6jfzxebkmac5muz66e@myrjvq5jm7gg>
Content-Language: en-US
From: Ming-Jen Chen <mjchen0829@gmail.com>
In-Reply-To: <ql6m6qrdokwfu4iizn6wmvovawuc7kgg6jfzxebkmac5muz66e@myrjvq5jm7gg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Hi, Krzysztof:

Thank you for your feedback on the v4 submission. I understand that some
of your previous comments were not fully addressed. I want to make sure
I completely understand your feedback and resolve the issues correctly.

Could you kindly let me know if the following approach is acceptable?


On 2024/11/20 下午 04:41, Krzysztof Kozlowski wrote:
> On Tue, Nov 19, 2024 at 02:59:53AM +0000, Ming-Jen Chen wrote:
>> Add YAML bindings for MA35D1 SoC keypad.
>>
>> Signed-off-by: Ming-Jen Chen <mjchen0829@gmail.com>
>> ---
>>  .../bindings/input/nuvoton,ma35d1-keypad.yaml | 69 +++++++++++++++++++
>>  1 file changed, 69 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
>> new file mode 100644
>> index 000000000000..9ccd81a2574d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
> 
> Filename matching compatible. You got this comment already.
> 
> 
>> @@ -0,0 +1,69 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/input/nuvoton,ma35d1-keypad.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 Keypad
>> +
>> +maintainers:
>> +  - Ming-jen Chen <mjchen0829@gmail.com>
>> +
>> +allOf:
>> +  - $ref: /schemas/input/matrix-keymap.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    const: nuvoton,ma35d1-kpi
>> +
>> +  debounce-delay-ms:
>> +    description: Debounce delay time in milliseconds.
>> +    maxItems: 1
>> +
>> +  scan-interval-ms:
>> +    description: Scan interval time in milliseconds.
>> +    maxItems: 1
>> +
>> +  reg:
>> +    maxItems: 1
> 
> Keep the same order of properties as in required: block.

I will modify to:

properties:
  compatible:
    const: nuvoton,ma35d1-kpi

  reg:
    maxItems: 1

  interrupts:
    maxItems: 1

  clocks:
    maxItems: 1

  linux,keymap:
    description: Keymap for the keypad.

  keypad,num-rows:
    description: Number of rows in the keypad.

  keypad,num-columns:
    description: Number of columns in the keypad.

  debounce-delay-ms:
    description: Debounce delay time in milliseconds.
    maxItems: 1

  scan-interval-ms:
    description: Scan interval time in milliseconds.
    maxItems: 1

required:
  - compatible
  - reg
  - interrupts
  - clocks
  - linux,keymap
  - keypad,num-rows
  - keypad,num-columns
  - debounce-delay-ms
  - scan-interval-ms

> 
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - linux,keymap
>> +  - keypad,num-rows
>> +  - keypad,num-columns
>> +  - debounce-delay-ms
>> +  - scan-interval-ms
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/input/input.h>
>> +    keypad@404A0000 {
> 
> Lowercase hex

I will modify to:
keypad@404a0000 {

> 
>> +      compatible = "nuvoton,ma35d1-kpi";
>> +      reg = <0x404A0000 0x10000>;
> 
> Lowercase hex

I will modify to:
reg = <0x404a0000 0x10000>;


Your guidance will be greatly appreciated, and I will incorporate the
necessary changes in the next submission to fully address your concerns.

Thank you for your time and patience.

> 
> Best regards,
> Krzysztof
> 


