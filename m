Return-Path: <linux-input+bounces-6837-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E47988E1C
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 09:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 259D01F21C18
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2024 07:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C8B14F9E9;
	Sat, 28 Sep 2024 07:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E8yF6ZA3"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7CA433BE;
	Sat, 28 Sep 2024 07:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727508383; cv=none; b=f54hOfxtKhX/3oGn8gn3jZadFSA8FBVQNQfdikkfT29M+Rh7C8y8PIDyABsGyFcWi1EFSC9/5ZrK5DZv/PF94QP2g12kAGRurfy+6NrtI9aUPCN9CNaNmRZqKressB9LOOIosqJ0MRv8Q3XX08LVKYLm5A+wYndRJHA7IIwfDtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727508383; c=relaxed/simple;
	bh=XeC4PW0Whv9b+1HHWwAWv78GOoWUAjHO/LYLVgPTd7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQJKczaSJTOExI31exHUCSeknpI8flYA8ZnAKfoTjgiX5Oh9/PjOddvKWhKfYl0q5zGaajftz2S+AdQU0I0/GkJ6RB4LK0AIV1PlvWyQlVLT8ruNFHtesQ4X+9J54AlV20emcBC41ocQ6oZ45OkPOX8uMjBhjCmkbJtCcahNyMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E8yF6ZA3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1435FC4CEC3;
	Sat, 28 Sep 2024 07:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727508382;
	bh=XeC4PW0Whv9b+1HHWwAWv78GOoWUAjHO/LYLVgPTd7Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E8yF6ZA3HyM1oSfUFAH5fNOrBUo76LjqVe+rt47L6Cz81slaYsAhJiYu57cWVo1h/
	 dSvHQUdea3tB30ZNJ4IEqleB+PxsTNbyjsKAg58V0CsURtmSn6r2P5stoJS+uxLSJF
	 emnpjRZ9sOwJZvOgd8LWesiTio6H29iHY95ENG5DpBsBo0XVBcdUEX7dvRqhhvUNOR
	 ILtaHnyrVI+M4q9P2wuMR5QirOJx174tkECBtp6S9L0A6oM+4z0Y0A7uZOG+pjLkea
	 IGpEfv5aUpRotoxqf9SLmy7ez/RLSw1ruYlzpOJM4GD73Knpus0rKZiQNbNU/E82pz
	 i2U/sIdZHJkGQ==
Message-ID: <388618b1-39a8-464b-a7e8-fb721d1f765c@kernel.org>
Date: Sat, 28 Sep 2024 09:26:18 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: input: gpio-keys: allow generic
 'interrupt-parent' for subnodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240927081757.7022-2-wsa+renesas@sang-engineering.com>
 <1762ec04-4dba-4de1-b380-73bf391462e5@kernel.org>
 <ZvcjSJIMsrRNQT_t@google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ZvcjSJIMsrRNQT_t@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/09/2024 23:27, Dmitry Torokhov wrote:
> On Fri, Sep 27, 2024 at 10:30:12AM +0200, Krzysztof Kozlowski wrote:
>> On 27/09/2024 10:15, Wolfram Sang wrote:
>>> Allow interrupt-parent in the main node, so it can be inherited to all
>>> subnodes. This is more compact and less error-prone.
>>>
>>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>> ---
>>>
>>> It would fix dtbs_check for arch/arm/boot/dts/renesas/r8a7779-marzen.dts
>>> and would simplify arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts.
>>>
>>> Plus, it is the behaviour I would expect.
>>>
>>>  Documentation/devicetree/bindings/input/gpio-keys.yaml | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/input/gpio-keys.yaml b/Documentation/devicetree/bindings/input/gpio-keys.yaml
>>> index cc78c2152921..8fc331e01f7e 100644
>>> --- a/Documentation/devicetree/bindings/input/gpio-keys.yaml
>>> +++ b/Documentation/devicetree/bindings/input/gpio-keys.yaml
>>> @@ -15,6 +15,9 @@ properties:
>>>        - gpio-keys
>>>        - gpio-keys-polled
>>>  
>>> +  interrupt-parent:
>>> +    description: Common interrupt parent for the following subnodes
>>
>> That's a bit against DT spec:
>>
>> "Nodes that represent interrupt-generating devices contain an
>> interrupt-parent property..."
>>
>> but gpio-keys node you marked as interrupt-parent does not generate
>> interrupts, so I do not think this is correct.
> 
> I think this can be read multiple ways. The device here is gpio-keys and
> interrupt-parent would be attached to that node. Children nodes do not
> represent individual devices, they just a convenient abstraction to
> describe the hardware.

Not really. There is no device like "gpio-keys". Each key is a separate,
independent device. They are no grouped, they do no share anything. From
Linux perspective they share, but on hardware - zero common pieces,
independent devices.

And this is reflected in interrupts property. Individual devices
generating interrupts - so each key connected over GPIO - has interrupts
property.

Best regards,
Krzysztof


