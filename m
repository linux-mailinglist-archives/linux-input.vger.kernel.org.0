Return-Path: <linux-input+bounces-7536-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 082059A3D6A
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 13:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 200551C24057
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 11:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37DB81EE01C;
	Fri, 18 Oct 2024 11:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfiDhin5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035D31EE000;
	Fri, 18 Oct 2024 11:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729251709; cv=none; b=m1mlSv8qxk9wKmMwgbszA42b/rul+uadDOfQNj/ZbdiYkDGwfrPkwsiAOEOr4K75jHSvcS3BOeioWq3f/zRtj8Ecz5DL0k2BvZQUwRRcLYF4cJYaiF/6nvgOGGY5mHbLen4tVrbmdw55J02U5igi2gB1ZdVxYZE6ome7t8NxBRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729251709; c=relaxed/simple;
	bh=RfH+jpa3dao42Tjc56t6ajcTpQJ8RVPSteVZrKKR0hU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p8Ok6/+lxXBv1+SoCy6oUpe82wkGbx4zBWDh5hFXZkXQn6uE/C0Ha6YHKHBhDeQ0CVzORlJDoA3eEZCnI97BuMP8st0lJ9dy1mqt+p4Lm2yGYxIcHC8kJ5E0teBkQgRb5htoo5Yd5eqAagaKfMeJJijJ8a0Y/++7kABV6MdVMys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OfiDhin5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 163B9C4CEC3;
	Fri, 18 Oct 2024 11:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729251708;
	bh=RfH+jpa3dao42Tjc56t6ajcTpQJ8RVPSteVZrKKR0hU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OfiDhin5X+Az3oYsJkzTt1pXXPIFGV2oZzjfdQCJ/N/Pk8ZdfWU1sgiBFg+YTUP0/
	 D/I3R1/aXsORF3wCzCI8Dxi1R+nWyXlJNfTvD3UnsB/Z+xAz5UncuaSqKOqOifTWka
	 WpLCc5xPn7btD5ClOBbwG72ENcR7Bx+EQJ7BpqCAbNy/b1jxuLkFmyZkLWtnKQWYri
	 Gc0gtisnRVTbuBkARkl1UQ6BtNUzJ9UZ7bxpZD4Gd5ib6api6vC+zq5Zd3YdzKqAi2
	 +WbKx/kupDnpPnQcUYjDT4QEseNVV6c7t6MpCB8eR5OHGOJ9HMC0Owyzgay3BpMYni
	 W+sxSbrQ44GAQ==
Message-ID: <f8ffc231-6961-44f8-ad61-3a07ab22e849@kernel.org>
Date: Fri, 18 Oct 2024 13:41:41 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
To: Charles Wang <charles.goodix@gmail.com>, dmitry.torokhov@gmail.com,
 hbarnor@chromium.org, dianders@chromium.org, conor.dooley@microchip.com
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241018020815.3098263-2-charles.goodix@gmail.com>
 <06151891-a260-450c-b688-fff18638e627@kernel.org>
 <ZxJCvwxwamvRZ3m9@ux-UP-WHL01>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ZxJCvwxwamvRZ3m9@ux-UP-WHL01>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/10/2024 13:18, Charles Wang wrote:
> Hi Krzysztof,
> 
> On Fri, Oct 18, 2024 at 07:59:46AM +0200, Krzysztof Kozlowski wrote:
>> On 18/10/2024 04:08, Charles Wang wrote:
>>> The Goodix GT7986U touch controller report touch data according to the
>>> HID protocol through the SPI bus. However, it is incompatible with
>>> Microsoft's HID-over-SPI protocol.
>>>
>>> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
>>> ---
>>>  .../bindings/input/goodix,gt7375p.yaml        | 68 ++++++++++++++++---
>>>  1 file changed, 58 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
>>> index 358cb8275..184d9c320 100644
>>> --- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
>>> +++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
>>> @@ -8,27 +8,27 @@ title: Goodix GT7375P touchscreen
>>>  
>>>  maintainers:
>>>    - Douglas Anderson <dianders@chromium.org>
>>> +  - Charles Wang <charles.goodix@gmail.com>
>>>  
>>>  description:
>>> -  Supports the Goodix GT7375P touchscreen.
>>> -  This touchscreen uses the i2c-hid protocol but has some non-standard
>>> -  power sequencing required.
>>> -
>>> -allOf:
>>> -  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
>>> +  The Goodix GT7375P and GT7986U touchscreens support both SPI and I2C interfaces.
>>> +  With the I2C interface, they use the i2c-hid protocol but require non-standard
>>> +  power sequencing. With the SPI interface, they use a custom HID protocol that
>>> +  is incompatible with Microsoft's HID-over-SPI protocol.
>>>  
>>>  properties:
>>>    compatible:
>>>      oneOf:
>>> -      - const: goodix,gt7375p
>>> +      - items:
>>> +          - const: goodix,gt7375p
>>
>> That's not a necessary change. Keep old code here.
>>
> 
> Ack,
> 
>>>        - items:
>>>            - const: goodix,gt7986u
>>>            - const: goodix,gt7375p
>>> +      - items:
>>> +          - const: goodix,gt7986u
>>
>> Hm? This does not make much sense. Device either is or is not compatible
>> with gt7375p. Cannot be both.
>>
> 
> Ack,
> 
>>>  
>>>    reg:
>>> -    enum:
>>> -      - 0x5d
>>> -      - 0x14
>>> +    maxItems: 1
>>>  
>>>    interrupts:
>>>      maxItems: 1
>>> @@ -57,6 +57,15 @@ properties:
>>>        This property is used to avoid the back-powering issue.
>>>      type: boolean
>>>  
>>> +  goodix,hid-report-addr:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description:
>>> +      The register address for retrieving HID report data.
>>> +      This address is related to the device firmware and may
>>> +      change after a firmware update.
>>
>> How is this supposed to work? DTS will stay fixed, you cannot change it
>> just because firmware changed. User loads new firmware with different
>> address, but DTS will have to use old address - so broken property.
>>
>>> +
>>> +  spi-max-frequency: true
>>
>> Drop
>>
> 
> Ack,
> 
>>> +
>>>  required:
>>>    - compatible
>>>    - reg
>>> @@ -64,6 +73,25 @@ required:
>>>    - reset-gpios
>>>    - vdd-supply
>>>  
>>> +allOf:
>>> +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
>>> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          items:
>>> +            - const: goodix,gt7986u
>>> +    then:
>>> +      required:
>>> +        - goodix,hid-report-addr
>>> +    else:
>>> +      properties:
>>> +        goodix,hid-report-addr: false
>>> +        spi-max-frequency: false
>>
>> Why? GT7375P also supports SPI.
>>
> 
> No, only GT7986U support SPI. What I'm trying to express here is that

Description earlier said:
"The Goodix GT7375P and GT7986U touchscreens support both SPI and I2C
interfaces."

so both support?

> the GT7375P does not support the properties 'goodix,hid-report-addr'
> and 'spi-max-frequency. Is there any issue with writing it this way?

spi-max-frequency could stay, assuming device does not support SPI.

Best regards,
Krzysztof


