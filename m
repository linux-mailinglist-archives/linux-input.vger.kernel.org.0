Return-Path: <linux-input+bounces-12485-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A305ABE40C
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 21:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADF3F4C2F20
	for <lists+linux-input@lfdr.de>; Tue, 20 May 2025 19:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E0D27FD4D;
	Tue, 20 May 2025 19:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=david-bauer.net header.i=@david-bauer.net header.b="gKppwhXq"
X-Original-To: linux-input@vger.kernel.org
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEC1283680
	for <linux-input@vger.kernel.org>; Tue, 20 May 2025 19:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770620; cv=none; b=c4ojhoNSxgdkZMzKk18uB4PtueiolCX5QGk5QWg86xLOOcDw3oeaoHeZIW8xn4cw0kSIHN37yOldhQAG9O15EdHIsFd1C6808iNj9K1ej4tDhl6G6efwJuvqIDrTzBA2FQlEuRA/9XAhA+7up/fWf364qcndd2KMyBki1nL3IdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770620; c=relaxed/simple;
	bh=kMiX/BWWUBpZXgzAi68O/8mLwTgRWc6IeaKIGYwCbsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UjFMHflUycm3Ecf2XvFCEbFxikMKamrU95jUshZPsYVRifVHsVhSeD3V3gZ7txNYGH/8RuhomqOiMLEHf2GBZvl5y7i1bwcQXH84w7NSPwvHJjm2m83yShelVpmLtuhBEAoJRo6VT2ffzYYRgWZnNHSlWsbycWPnGA3HiCqnR/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=david-bauer.net; spf=pass smtp.mailfrom=david-bauer.net; dkim=pass (4096-bit key) header.d=david-bauer.net header.i=@david-bauer.net header.b=gKppwhXq; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=david-bauer.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=david-bauer.net
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 5350017F8A4
	for <linux-input@vger.kernel.org>; Tue, 20 May 2025 21:40:06 +0200 (CEST)
Received: (qmail 31776 invoked by uid 988); 20 May 2025 19:40:06 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by perseus.uberspace.de (Haraka/3.0.1) with ESMTPSA; Tue, 20 May 2025 21:40:05 +0200
Message-ID: <16f39da9-d182-4dc6-8739-1d33fecd0e8f@david-bauer.net>
Date: Tue, 20 May 2025 21:40:03 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: input: add Semtech SX951x binding
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250505203847.86714-1-mail@david-bauer.net>
 <cbf42385-9803-4bea-bf99-a6f31f1454f6@linaro.org>
 <8c9e5e74-966b-4969-9776-7655863fd197@david-bauer.net>
 <b6d066ea-e47d-4495-bd0b-17ba184275a1@linaro.org>
Content-Language: en-US
From: David Bauer <mail@david-bauer.net>
Autocrypt: addr=mail@david-bauer.net; keydata=
 xjMEZgynMBYJKwYBBAHaRw8BAQdA+32xE63/l6uaRAU+fPDToCtlZtYJhzI/dt3I6VxixXnN
 IkRhdmlkIEJhdWVyIDxtYWlsQGRhdmlkLWJhdWVyLm5ldD7CjwQTFggANxYhBLPGu7DmE/84
 Uyu0uW0x5c9UngunBQJmDKcwBQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQbTHlz1Se
 C6eKAwEA8B6TGkUMw8X7Kv3JdBIoDqJG9+fZuuwlmFsRrdyDyHkBAPtLydDdancCVWNucImJ
 GSk+M80qzgemqIBjFXW0CZYPzjgEZgynMBIKKwYBBAGXVQEFAQEHQPIm0qo7519c7VUOTAUD
 4OR6mZJXFJDJBprBfnXZUlY4AwEIB8J+BBgWCAAmFiEEs8a7sOYT/zhTK7S5bTHlz1SeC6cF
 AmYMpzAFCQWjmoACGwwACgkQbTHlz1SeC6fP2AD8CduoErEo6JePUdZXwZ1e58+lAeXOLLvC
 2kj1OiLjqK4BANoZuHf/ku8ARYjUdIEgfgOzMX/OdYvn0HiaoEfMg7oB
In-Reply-To: <b6d066ea-e47d-4495-bd0b-17ba184275a1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: ---
X-Rspamd-Report: BAYES_HAM(-3) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -3.09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=kMiX/BWWUBpZXgzAi68O/8mLwTgRWc6IeaKIGYwCbsY=;
	b=gKppwhXqCzdpmt8JuQ8Yrn4xFo3jWWuQxZQ5mG5WsNzNGOtfyn/os6ZgRxQ3hPUq+rWp1k7+NF
	SoFijgSyIHhkprLr+Z6SCK3YTDI76DEMjQnus/5mCa6HNqYok0esKQisdRVWGY/N8m3BVbyzoRrX
	U0diABp/pelOHL7ALQXXGcWs+4nXLuMK4g8F+cK/E/0LkhakUhMHAAT2g1kV1vWsRDSRw+mC9b8y
	8hfKn/8zKdA9JJhyWYGtgvSuLpeE1GnfuK9BYnWzb4PvgCOw0AYTcN/WkFYTAtEwd/+KU7hrqtEq
	icPXzw9yWBy35cgZmQXnv8EAIzFAlOXS2fR3WoCi48psgdtwwjsQYQ2rnqRJw8y7ALoZ8/yLfdW2
	Yw4P8d8qHBV1WNsjpU1PRH/rwYSOoc3RgjuBoof+64rdD1eRpbss7kE5ZcRL059rjpwXspYPTS3t
	EoBuCYJZO/5QslE2vBw49EgSmK9/pASyiNJ54XvcIH3MqWtGT8KST8e9ZaZ1SyZH0RkMPCORDKK+
	+6NeN6wl9D7dtFLRATF99M0dAtEeEfNU5lutCshZSvt3qoVkMrMhaERfhAOsOUVva7dIeI74a7ux
	wS3TLe5Zv7yhC0DUu4z0+OV8GQ8ZBdiwt0yN0lM62iRBK1zrDMOkvNGSkc6+VnIISKPmvp/Dl4dT
	M=

Hi Krzysztof,

On 5/20/25 15:58, Krzysztof Kozlowski wrote:
> On 06/05/2025 12:05, David Bauer wrote:
>> Hi Krzysztof,
>>
>> thanks for the review.
>>
>> On 5/6/25 08:21, Krzysztof Kozlowski wrote:
>>> On 05/05/2025 22:38, David Bauer wrote:
>>>> Add device-tree binding for the Semtech SX9512/SX9513 family of touch
>>>> controllers with integrated LED driver.
>>>>
>>>> Signed-off-by: David Bauer <mail@david-bauer.net>
>>>
>>> You CC-ed an address, which suggests you do not work on mainline kernel
>>> or you do not use get_maintainers.pl/b4/patman. Please rebase and always
>>> work on mainline or start using mentioned tools, so correct addresses
>>> will be used.
>> I'm a bit unsure what you are referring to - maybe I've set the options
>> for get_maintainer.pl wrong, but i use
>>
>> get_maintainer.pl --nogit --nogit-fallback --norolestats --nol
>>
>> to determine TO recipients and
>>
>> get_maintainer.pl --nogit --nogit-fallback --norolestats --nom
>>
>> for CC destinations.
>>
>> Granted, my tree was a bit out of date but it was from mainline
> 
> Mainline means latest RC or maintainer tree or linux next. v5.0 is not
> mainline anymoer.
> 
>> and after rebase both commands returned consistent results.
>>
>> Hope you can provide me with some guidance there.
> 
> Well, read full reply. It is impossible to get such email address from
> above commands. Such email address does not exist since long time and it
> easy to prove - just git grep for it. No results, so how could it be
> printed by get_maintainers.pl?
> 
> If you disagree then please paste full output of:
> 
> $ git describe
> $ git status
> $ scripts/get_maintainer.pl 0*
> 
> I provided you extensive guideline exactly to avoid further trivial
> discussions about that triviality, so I would really appreciate if you
> followed it.

I did a complete new clone of my repository without changing the base-branch
and now the script outputs the correct set of addresses. Be assured v2
will reach the correct inbox(es).

Sorry for the confusion here. Still appreciate you did point this
out to me.

> 
>>
>>>
>>> Please use scripts/get_maintainers.pl to get a list of necessary people
>>> and lists to CC (and consider --no-git-fallback argument, so you will
>>> not CC people just because they made one commit years ago). It might
>>> happen, that command when run on an older kernel, gives you outdated
>>> entries. Therefore please be sure you base your patches on recent Linux
>>> kernel.
>>>
>>> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
>>> people, so fix your workflow. Tools might also fail if you work on some
>>> ancient tree (don't, instead use mainline) or work on fork of kernel
>>> (don't, instead use mainline). Just use b4 and everything should be
>>> fine, although remember about `b4 prep --auto-to-cc` if you added new
>>> patches to the patchset.
>>>
>>>
>>>> ---
>>>>    .../bindings/input/semtech,sx951x.yaml        | 180 ++++++++++++++++++
>>>>    1 file changed, 180 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/input/semtech,sx951x.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/input/semtech,sx951x.yaml b/Documentation/devicetree/bindings/input/semtech,sx951x.yaml
>>>> new file mode 100644
>>>> index 000000000000..e4f938decd86
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/input/semtech,sx951x.yaml
>>>> @@ -0,0 +1,180 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/input/semtech,sx951x.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Semtech SX9512/SX9513 based capacitive touch sensors
>>>> +
>>>> +description: |
>>>
>>> Do not need '|' unless you need to preserve formatting.
>>>
>>>> +  The Semtech SX9512/SX9513 Family of capacitive touch controllers
>>>> +  with integrated LED drivers. The device communication is using I2C only.
>>>> +
>>>> +maintainers:
>>>> +  - David Bauer <mail@david-bauer.net>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    enum:
>>>> +      - semtech,sx9512
>>>> +      - semtech,sx9513
>>>
>>> Devices are not compatible? What are the differences?
>>
>> The SX9513 is a cost-reduced version which does not
>> support proximity sensing. With the current support
>> of the driver they work identical. Should i add this
>> information as a comment?
> 
> So they are compatible and this should be expressed via fallback.
> 
> 
>>
>>>
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  '#address-cells':
>>>> +    const: 1
>>>> +
>>>> +  '#size-cells':
>>>> +    const: 0
>>>> +
>>>> +  poll-interval:
>>>> +    default: 100
>>>> +    description: |
>>>
>>> Do not need '|' unless you need to preserve formatting. Same comment
>>> everywhere.
>>>
>>>> +      The polling interval for touch events in milliseconds.
>>>
>>> Missing -ms property unit suffix... unless you are using existing
>>> property from common schema, but I do not see any reference (and thus
>>> unevaluatedProperties at the end).
>>>
>>>> +
>>>> +patternProperties:
>>>> +  "^channel@[0-7]$":
>>>> +    $ref: input.yaml#
>>>> +    type: object
>>>> +    description: |
>>>> +      Each node represents a channel of the touch controller.
>>>> +      Each channel provides a capacitive touch sensor input and
>>>> +      an LED driver output.
>>>> +
>>>> +    properties:
>>>> +      reg:
>>>> +        enum: [0, 1, 2, 3, 4, 5, 6, 7]
>>>> +
>>>> +      linux,keycodes:
>>>> +        maxItems: 1
>>>> +        description: |
>>>> +          Specifies an array of numeric keycode values to
>>>> +          be used for the channels. If this property is
>>>> +          omitted, the channel is not used as a key.
>>>> +
>>>> +      semtech,cin-delta:
>>>
>>> Use proper unit suffix and express it in pF.
>>
>> To represent 2.3 and 3.8 pF, would it be better to represent in
>> femtofarad?
>>
>>>
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>> +        minimum: 0
>>>> +        maximum: 3
>>>> +        default: 3
>>>> +        description: |
>>>> +          The capacitance delta which is used to detect a touch
>>>> +          or release event. The property value is mapped to a
>>>> +          farad range between 7pF and 2.3pF internally. The delta
>>>> +          becomes smaller the higher the value is.
>>>> +
>>>> +      semtech,sense-threshold:
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>> +        minimum: 0
>>>> +        maximum: 255
>>>> +        default: 4
>>>> +        description: |
>>>> +          The threshold value after which the channel detects a touch.
>>>> +          Refer to the datasheet for the internal calculation of the
>>>> +          resulting touch sensitivity.
>>>> +
>>>> +      led:
>>>
>>> I think subnode is here not needed. This should be part of the channel,
>>> probably.
>>
>> Just to be sure - you mean to have a property "led" upon which instructs
>> the channel to be used to drive an LED and include the LED specific
>> properties in the node of the channel?
> No, I do not mean a property led. I mean that child node should be
> folded into parent.

Okay, now i get it. The hardware supports the exclusive as well as combined
use of channels as LED-driver and touch input.

In case the channel is not wired up to work as an input, the linux,keycodes
property can be omitted, not creating the input channel.

In turn if the channel is not wired up to an LED, omitting the led subnode
prevents an led device from being created for this channel.

If I were to fold the led subnode into the channel node I would still need
a way to indicate if an LED is actually present in hardware, correct? This
was what i was aiming for with the "led" property. However if I've had to
choose between these two approaches, I prefer the subnode.

If you have a different idea how to handle this apart from Rob's suggestion,
It could also be the case I'm creating more problems than I solve with this
approach :)

Best
David


