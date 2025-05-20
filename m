Return-Path: <linux-input+bounces-12477-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E13ABDAA9
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 16:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0940F8A56E4
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 13:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC52122D7A8;
	Tue, 20 May 2025 13:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jN9w1AZ3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9132B2441A7
	for <linux-input@vger.kernel.org>; Tue, 20 May 2025 13:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747749518; cv=none; b=j+Y4UNAXBRfI2yjPkvY6xeNy5yo+7WOuNgrvfAooI/JbQlu5kf5Yz1DMp2eZ8EFM13fnOSmyF/Cn5xV5sFaNeT8osHq89OXMnGC+I++PfJJHLd9NCiz7uYwgTQe7PyzQM+rVItZoQ0AtQ7/1s9GMirAG9t6KuOgpoy3ceOj2b/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747749518; c=relaxed/simple;
	bh=NnukccuNbS5X1xDhafgKruy1+YshAwmzmyIH9vTRM7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CGw4sCZXU0VoXBzpD31uD2Iy/gs8wBxKUAVsEtge0N8MjL7UEVaXPTvYasytB/8GsahYP7PAtdv5DlfRPMjm5x7//1tc8QgN+5q4XfOm9VKamlwa69/pfCUnRuLDnjJvL1REOlPxkusaxI1GQEPlvyL8MkvMUndbOmMMKKfmXDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jN9w1AZ3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43f106a3591so5258835e9.3
        for <linux-input@vger.kernel.org>; Tue, 20 May 2025 06:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747749515; x=1748354315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+K86XwHvg9VZZ+Fs5HirVH8AO4GySUx8ZDk1UaTJf7Y=;
        b=jN9w1AZ3OimFOeYkY/Dk03adJVLhuT9T6ldKfUWCfacHnvtdmPf51ofsJ2AGjn2nzO
         4nrH5i/LQQFUpalr+iujJjwbsjWKm/k/JnsA4H2UR7ynM7OZ2yaJDQV/kbe9Mbj122C5
         Fu2DLgi7ZBnzBnDH+etMPYMTwP9xuRtVlIgBiWdyIgwbexPXdd4ekpvdFXB1bbRyz6y2
         Ts/NYyam4WwIlrtCDpswsW1FHHNEm72rLhLTq327hokd7cbmMIAUZfJxkWpm4C/fGLk2
         p+qDt3UR/I+gvtlWGwJYzts7Mbooqpd0dtPlAj07y0en71Xsahj4iDsiUNBgqN+LXjGs
         gGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747749515; x=1748354315;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+K86XwHvg9VZZ+Fs5HirVH8AO4GySUx8ZDk1UaTJf7Y=;
        b=ZIy01mbrz8a3kF1Eq229zRt0McR3F3UCdOB9aOQSTveCf3z+BUSajSumycz6q00RVf
         T5lVeL+2PE1eRD2Nr2tzYXPN/VLh+QlBgExf6jeRE8HxLO7z85qcbzuqxCO5BA51fuFH
         pATBEz07w/8G1DOuLV8R+8Dzds7WC2FUuGREwmKV1aSret/xjfFxL9+bqU733VYnYI/B
         WFkoBzSTnHjaM9gMSPgrpm9hj3ZrjR/XfiVkZYfk8TKsko2tiLm15nsx1ScqS1kdkIbF
         uNjkKoQT++OgPJdIpt3yX39gEnsH+Zieb9LMcpCSMAfDRq2ZI9bkH5nglXQtkCsWY81c
         apZg==
X-Gm-Message-State: AOJu0YxljftTyuiir88/F3GXOtpIUrVR4vmOM60qQqjux7LUd9CBqHkV
	Xen/A3/uTPyZD7aHesM4b+FQjsvlQ5wF2HBzHE7qVBefT3NPwGTWAgaYqKKwucY1uOg=
X-Gm-Gg: ASbGncuwO8ANEksNmv6Fb35hh16l9GJ+hPexsHugFrK8jq8K4mstkM25Z7rEtlVqQTr
	bgm67vLohNPXkGABREaKtYr1ZVl8Lb/w1kvLuKwKc+bbsOZqRwettaWv1AalMojMiNx2fXBOsHq
	oK1aTaRbTQWZvs+wyldsdoGC4IY3mFe/BhNLOP2ZguU/PPJ2BxJesQHX3QvvBa+oEqVQ3G+sH57
	fqY3TG0433pbUhvFC18X1cLkcwEnQ60y3rUgZ+IwRZvkPlKzSfHCkIemDLLbe93Nzw9WS3RFwxT
	X/NpoKOl0iz3woADUlEuRRXae31F9aomd1MxT4gEOA2JFFuxMFf0rIP9C5mLspBxNIDw3xg=
X-Google-Smtp-Source: AGHT+IFJ5J6hWR953m5KN8wKjr3JacUGt9KK2cKvLbB49FapBrquzSCMTjTLATE+eQ43Msju681x6Q==
X-Received: by 2002:a05:600c:1c12:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-442fd62fa44mr53569025e9.3.1747749514660;
        Tue, 20 May 2025 06:58:34 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3edcsm32950815e9.20.2025.05.20.06.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 06:58:34 -0700 (PDT)
Message-ID: <b6d066ea-e47d-4495-bd0b-17ba184275a1@linaro.org>
Date: Tue, 20 May 2025 15:58:32 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: input: add Semtech SX951x binding
To: David Bauer <mail@david-bauer.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250505203847.86714-1-mail@david-bauer.net>
 <cbf42385-9803-4bea-bf99-a6f31f1454f6@linaro.org>
 <8c9e5e74-966b-4969-9776-7655863fd197@david-bauer.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <8c9e5e74-966b-4969-9776-7655863fd197@david-bauer.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/05/2025 12:05, David Bauer wrote:
> Hi Krzysztof,
> 
> thanks for the review.
> 
> On 5/6/25 08:21, Krzysztof Kozlowski wrote:
>> On 05/05/2025 22:38, David Bauer wrote:
>>> Add device-tree binding for the Semtech SX9512/SX9513 family of touch
>>> controllers with integrated LED driver.
>>>
>>> Signed-off-by: David Bauer <mail@david-bauer.net>
>>
>> You CC-ed an address, which suggests you do not work on mainline kernel
>> or you do not use get_maintainers.pl/b4/patman. Please rebase and always
>> work on mainline or start using mentioned tools, so correct addresses
>> will be used.
> I'm a bit unsure what you are referring to - maybe I've set the options
> for get_maintainer.pl wrong, but i use
> 
> get_maintainer.pl --nogit --nogit-fallback --norolestats --nol
> 
> to determine TO recipients and
> 
> get_maintainer.pl --nogit --nogit-fallback --norolestats --nom
> 
> for CC destinations.
> 
> Granted, my tree was a bit out of date but it was from mainline

Mainline means latest RC or maintainer tree or linux next. v5.0 is not
mainline anymoer.

> and after rebase both commands returned consistent results.
> 
> Hope you can provide me with some guidance there.

Well, read full reply. It is impossible to get such email address from
above commands. Such email address does not exist since long time and it
easy to prove - just git grep for it. No results, so how could it be
printed by get_maintainers.pl?

If you disagree then please paste full output of:

$ git describe
$ git status
$ scripts/get_maintainer.pl 0*

I provided you extensive guideline exactly to avoid further trivial
discussions about that triviality, so I would really appreciate if you
followed it.

> 
>>
>> Please use scripts/get_maintainers.pl to get a list of necessary people
>> and lists to CC (and consider --no-git-fallback argument, so you will
>> not CC people just because they made one commit years ago). It might
>> happen, that command when run on an older kernel, gives you outdated
>> entries. Therefore please be sure you base your patches on recent Linux
>> kernel.
>>
>> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
>> people, so fix your workflow. Tools might also fail if you work on some
>> ancient tree (don't, instead use mainline) or work on fork of kernel
>> (don't, instead use mainline). Just use b4 and everything should be
>> fine, although remember about `b4 prep --auto-to-cc` if you added new
>> patches to the patchset.
>>
>>
>>> ---
>>>   .../bindings/input/semtech,sx951x.yaml        | 180 ++++++++++++++++++
>>>   1 file changed, 180 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/input/semtech,sx951x.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/input/semtech,sx951x.yaml b/Documentation/devicetree/bindings/input/semtech,sx951x.yaml
>>> new file mode 100644
>>> index 000000000000..e4f938decd86
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/input/semtech,sx951x.yaml
>>> @@ -0,0 +1,180 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/input/semtech,sx951x.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Semtech SX9512/SX9513 based capacitive touch sensors
>>> +
>>> +description: |
>>
>> Do not need '|' unless you need to preserve formatting.
>>
>>> +  The Semtech SX9512/SX9513 Family of capacitive touch controllers
>>> +  with integrated LED drivers. The device communication is using I2C only.
>>> +
>>> +maintainers:
>>> +  - David Bauer <mail@david-bauer.net>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - semtech,sx9512
>>> +      - semtech,sx9513
>>
>> Devices are not compatible? What are the differences?
> 
> The SX9513 is a cost-reduced version which does not
> support proximity sensing. With the current support
> of the driver they work identical. Should i add this
> information as a comment?

So they are compatible and this should be expressed via fallback.


> 
>>
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  '#address-cells':
>>> +    const: 1
>>> +
>>> +  '#size-cells':
>>> +    const: 0
>>> +
>>> +  poll-interval:
>>> +    default: 100
>>> +    description: |
>>
>> Do not need '|' unless you need to preserve formatting. Same comment
>> everywhere.
>>
>>> +      The polling interval for touch events in milliseconds.
>>
>> Missing -ms property unit suffix... unless you are using existing
>> property from common schema, but I do not see any reference (and thus
>> unevaluatedProperties at the end).
>>
>>> +
>>> +patternProperties:
>>> +  "^channel@[0-7]$":
>>> +    $ref: input.yaml#
>>> +    type: object
>>> +    description: |
>>> +      Each node represents a channel of the touch controller.
>>> +      Each channel provides a capacitive touch sensor input and
>>> +      an LED driver output.
>>> +
>>> +    properties:
>>> +      reg:
>>> +        enum: [0, 1, 2, 3, 4, 5, 6, 7]
>>> +
>>> +      linux,keycodes:
>>> +        maxItems: 1
>>> +        description: |
>>> +          Specifies an array of numeric keycode values to
>>> +          be used for the channels. If this property is
>>> +          omitted, the channel is not used as a key.
>>> +
>>> +      semtech,cin-delta:
>>
>> Use proper unit suffix and express it in pF.
> 
> To represent 2.3 and 3.8 pF, would it be better to represent in
> femtofarad?
> 
>>
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        minimum: 0
>>> +        maximum: 3
>>> +        default: 3
>>> +        description: |
>>> +          The capacitance delta which is used to detect a touch
>>> +          or release event. The property value is mapped to a
>>> +          farad range between 7pF and 2.3pF internally. The delta
>>> +          becomes smaller the higher the value is.
>>> +
>>> +      semtech,sense-threshold:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        minimum: 0
>>> +        maximum: 255
>>> +        default: 4
>>> +        description: |
>>> +          The threshold value after which the channel detects a touch.
>>> +          Refer to the datasheet for the internal calculation of the
>>> +          resulting touch sensitivity.
>>> +
>>> +      led:
>>
>> I think subnode is here not needed. This should be part of the channel,
>> probably.
> 
> Just to be sure - you mean to have a property "led" upon which instructs
> the channel to be used to drive an LED and include the LED specific
> properties in the node of the channel?
No, I do not mean a property led. I mean that child node should be
folded into parent.

Best regards,
Krzysztof

