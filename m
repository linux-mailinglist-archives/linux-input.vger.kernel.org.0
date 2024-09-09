Return-Path: <linux-input+bounces-6368-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF7497214D
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 19:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 789201C237EE
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 17:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6834917ADEB;
	Mon,  9 Sep 2024 17:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvjU6cht"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA6116F0E8;
	Mon,  9 Sep 2024 17:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725904027; cv=none; b=gkKAzg5UtbVT3sujbUs1w2yrz0+nl0yvujzmE9rIgii43HgV7uPxjv9FixcdvOfZGezzO2/1v5AoDcmWR5ossjDLtOpK/GJG56xZ0WLuVe3lksOn3iWG8mUr+Rzv26vwjF0KjyzcU2R2DpMUDenroiSf5Z4Ru30i+lFJdBnF7PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725904027; c=relaxed/simple;
	bh=d5MQ6P0P6PSk7ZUlMTuS+1vmsGp+cPoQ1jmGFxw4P7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DQo185QI/fAYcixsQAkJA0AXDw225Huukjqyxat7jKJAMve7AtrsCUWHrELMDFL2h/ZQlOQaSyCXUUioFb6khgGs7fRfTQ+5PfzoCLMeFlOPHw20RnilkAqYc2bqyDtP5s5ajqWVOoBIsqBLqb/KGl2HH2iTJN0X2HLBOyZvdyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvjU6cht; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE8AC4CEC8;
	Mon,  9 Sep 2024 17:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725904026;
	bh=d5MQ6P0P6PSk7ZUlMTuS+1vmsGp+cPoQ1jmGFxw4P7c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bvjU6cht362onuC87em4aUt8sWaFGl3zfD07QULlAvFMt0rFPE/xT+L/AjOxT3fsS
	 V61ZFLEMD18uM7gBroeBLgsujPW/BsBOpKLBT7WmWJFIkRaK15UhimPB02HO6BbFEQ
	 saRumcLXByrefl4c1C4sW8fSB/qFgSNFehNUHwK/X49zlEH5ftSzX+oH3nU4EC0FU+
	 2ZGYFKxQjeedzflGRk+t1eeDbMH69U+9c2sHq4beEdrqSsAN2CqoF6ltywlC7FY7tW
	 mQtFXZwQbb0W938G483nSbu6mN86KdVU+KxqNNI++CINltXbo8UWDfEc615mMHKAcX
	 42vFouSCSpnpQ==
Message-ID: <a3eb6224-b355-4477-9d24-fee96f00e593@kernel.org>
Date: Mon, 9 Sep 2024 19:47:01 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-binding: touchscreen: fix x-plat-ohm missing type
 definition
To: Sayyad Abid <sayyad.abid16@gmail.com>
Cc: devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
 Michael Welling <mwelling@ieee.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240908151742.2453402-1-sayyad.abid16@gmail.com>
 <sllpurhdxfgducp5hb3rs7u5db76vy2wtmyha7uspskvvek463@tq2aq65qqw4x>
 <CACVUEBmCBW7a3gyZ78ZyEtxHiFkie=3wuMz-+Oq_FfTjQX6AVw@mail.gmail.com>
 <edf29295-d360-4038-a490-3a5cbb8c28cd@kernel.org>
 <CACVUEB=eQUFbDV80D7sPkK84FmnR7j66gRGvB8eusV_cz-QmAQ@mail.gmail.com>
 <CACVUEB=UBQ=qnEGHodXjYNcMicOW6dGb1Z-V1CPkBV15+OdmwA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGVBBMBCgA/AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJgPO8PBQkUX63hAAoJEBuTQ307
 QWKbBn8P+QFxwl7pDsAKR1InemMAmuykCHl+XgC0LDqrsWhAH5TYeTVXGSyDsuZjHvj+FRP+
 gZaEIYSw2Yf0e91U9HXo3RYhEwSmxUQ4Fjhc9qAwGKVPQf6YuQ5yy6pzI8brcKmHHOGrB3tP
 /MODPt81M1zpograAC2WTDzkICfHKj8LpXp45PylD99J9q0Y+gb04CG5/wXs+1hJy/dz0tYy
 iua4nCuSRbxnSHKBS5vvjosWWjWQXsRKd+zzXp6kfRHHpzJkhRwF6ArXi4XnQ+REnoTfM5Fk
 VmVmSQ3yFKKePEzoIriT1b2sXO0g5QXOAvFqB65LZjXG9jGJoVG6ZJrUV1MVK8vamKoVbUEe
 0NlLl/tX96HLowHHoKhxEsbFzGzKiFLh7hyboTpy2whdonkDxpnv/H8wE9M3VW/fPgnL2nPe
 xaBLqyHxy9hA9JrZvxg3IQ61x7rtBWBUQPmEaK0azW+l3ysiNpBhISkZrsW3ZUdknWu87nh6
 eTB7mR7xBcVxnomxWwJI4B0wuMwCPdgbV6YDUKCuSgRMUEiVry10xd9KLypR9Vfyn1AhROrq
 AubRPVeJBf9zR5UW1trJNfwVt3XmbHX50HCcHdEdCKiT9O+FiEcahIaWh9lihvO0ci0TtVGZ
 MCEtaCE80Q3Ma9RdHYB3uVF930jwquplFLNF+IBCn5JRzsFNBFVDXDQBEADNkrQYSREUL4D3
 Gws46JEoZ9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLue
 MNsWLJBvBaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6ei
 OMheesVS5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wA
 GldWsRxbf3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA
 6z6lBZn0WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9
 YegxWKvXXHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt
 91pFzBSOIpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gU
 BLHFTg2hYnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/
 JoFzZ4B0p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu
 4vXVFBYIGmpyNPYzRm0QPwARAQABwsF8BBgBCgAmAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtB
 YpsFAmA872oFCRRflLYACgkQG5NDfTtBYpvScw/9GrqBrVLuJoJ52qBBKUBDo4E+5fU1bjt0
 Gv0nh/hNJuecuRY6aemU6HOPNc2t8QHMSvwbSF+Vp9ZkOvrM36yUOufctoqON+wXrliEY0J4
 ksR89ZILRRAold9Mh0YDqEJc1HmuxYLJ7lnbLYH1oui8bLbMBM8S2Uo9RKqV2GROLi44enVt
 vdrDvo+CxKj2K+d4cleCNiz5qbTxPUW/cgkwG0lJc4I4sso7l4XMDKn95c7JtNsuzqKvhEVS
 oic5by3fbUnuI0cemeizF4QdtX2uQxrP7RwHFBd+YUia7zCcz0//rv6FZmAxWZGy5arNl6Vm
 lQqNo7/Poh8WWfRS+xegBxc6hBXahpyUKphAKYkah+m+I0QToCfnGKnPqyYIMDEHCS/RfqA5
 t8F+O56+oyLBAeWX7XcmyM6TGeVfb+OZVMJnZzK0s2VYAuI0Rl87FBFYgULdgqKV7R7WHzwD
 uZwJCLykjad45hsWcOGk3OcaAGQS6NDlfhM6O9aYNwGL6tGt/6BkRikNOs7VDEa4/HlbaSJo
 7FgndGw1kWmkeL6oQh7wBvYll2buKod4qYntmNKEicoHGU+x91Gcan8mCoqhJkbqrL7+nXG2
 5Q/GS5M9RFWS+nYyJh+c3OcfKqVcZQNANItt7+ULzdNJuhvTRRdC3g9hmCEuNSr+CLMdnRBY fv0=
In-Reply-To: <CACVUEB=UBQ=qnEGHodXjYNcMicOW6dGb1Z-V1CPkBV15+OdmwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/09/2024 14:48, Sayyad Abid wrote:
> On Mon, Sep 9, 2024 at 1:36 PM Sayyad Abid <sayyad.abid16@gmail.com> wrote:
>>
>> On Mon, Sep 9, 2024 at 1:21 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> On 09/09/2024 09:48, Sayyad Abid wrote:
>>>> On Mon, Sep 9, 2024 at 12:02 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>>
>>>>> On Sun, Sep 08, 2024 at 08:47:43PM +0530, Sayyad Abid wrote:
>>>>>> This patch fixes the issue with x-plat-ohm missing a type definition.
>>>>>> The patch adds the fix for this issue by adding value of this property
>>>>>
>>>>> You repeated twice the same while it is unclear why this is missing.
>>>> I must have overlooked it, my bad.
>>>
>>> Keep discussion public.
>> I am away form my desktop and trying to reply with Gmail's client,
>> I use mutt otherwise hence the trouble. I hit 'reply' instead of 'reply all'.
>>>
>>>>>
>>>>> Also:
>>>>> Please do not use "This commit/patch/change", but imperative mood. See
>>>>> longer explanation here:
>>>>> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
>>>> Okay, I'll refer to this article for any further patches. Thank you!
>>>>>
>>>>>
>>>>>> should be a 32-bit unsigned integer.
>>>>>>
>>>>>> Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
>>>>>>
>>>>>> ---
>>>>>>  .../devicetree/bindings/input/touchscreen/ti,tsc2005.yaml       | 2 ++
>>>>>>  1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
>>>>>> index 7187c390b2f5..98ff65cf9f9f 100644
>>>>>> --- a/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
>>>>>> @@ -38,6 +38,8 @@ properties:
>>>>>>
>>>>>>    ti,x-plate-ohms:
>>>>>>      description: resistance of the touchscreen's X plates in ohm (defaults to 280)
>>>>>
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>>
>>>>> $ref should not be needed, so what is exactly missing? Provide some
>>>>> sort of proof that you are fixing real issue.
>>>> I ran dt_bindings_check on the file which resulted in a warning
>>>> "x-plate-ohm : missing type definition", to resolve this warning I
>>>> looked at the other yaml files in the ti,txc2005.yaml directory
>>>> (/Documentation/devicetree/bindings/input/touchscreen/), Where I found
>>>> out that one of the TI's touchscreen (ti,am3359) binding used $ref
>>>> property for the similar "x-plate-resistance" property.
>>>>
>>>> Adding the $ref resolved the warnings.
>>>
>>> You run some older dtschema.
>> I'll update this and check again.
> So I did a full clean clone of the kernel repo and followed the
> dtschema installation
> as mentioned in the Linux Kernel Documentation.
> Running the dt_binding_check resulted in the same warning.

The dtschema change fixing this ("schemas: property-units: Exclude some
non-conforming properties") is not yet in a released version, so I
suggest do nothing or try the latest dtschema from master. But in any
case this change does not look good. ohms should not have a ref, so even
if this warning is legitimate, the fix should be probably different.

Best regards,
Krzysztof


