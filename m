Return-Path: <linux-input+bounces-4108-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E238FC8D1
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 12:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E1DD1C21A45
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2024 10:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98AD5190076;
	Wed,  5 Jun 2024 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dSOLuGWL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666241946D5;
	Wed,  5 Jun 2024 10:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717582836; cv=none; b=LOre75C4EIwhQFhrAT6zK+IJeKlPjufKa7qDhkqebg9s0xnePUQHfGF+QcUeSzuvayueQsLkkpwxf9NVLN4qbSybmilMPEIWli0PjldiOvZdiIwBq2xjFSO/6sxWPchEIQdm0O6OKz0ztW9HWrt/c0/3+jNvbVU1zCLORkyjo14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717582836; c=relaxed/simple;
	bh=K/NNlu7lMhUcMk9rYOthlm/0NsBQrYRQmAec9h6uSdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rUpyN/PwyiMWmOTF+amlLx/AWPKc0MLcUaCxNMgX6Z4oVPQ0JujiimaA6GaosRZ0+qDyeYEHAggt6ANwLd589R98iuwakmqGGFD/wiDSM+dl1DMgjlaDv0Ug9iuDMUSb1mo09M3IJLz8116DFQrecvEPQ2fgwqxEjVH0KSZndEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dSOLuGWL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A8CC3277B;
	Wed,  5 Jun 2024 10:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717582835;
	bh=K/NNlu7lMhUcMk9rYOthlm/0NsBQrYRQmAec9h6uSdg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dSOLuGWLxQfe63XXTAVpn9dxYda1Slkq0IuX5oTLEQ7PWAuZGOD8DX4E5pAu+RdZw
	 sEDojp2vYlvFgGvnUN3L1Wp+8LQsdMbSxhF8t1JEHlFWY2OfcYc0DPmcE+/N6ttMkC
	 ZJbbPjcN+t/qc6LNGk2EEc/oNnENfcJp9NIU8vGvqmUjWcQ5kqZeQHcuKmdVMxYXGI
	 O1I0ZNP90UarlBd+5XNkUHz9gOx1i2xl2rJXcPWvvLYmx56CXsDUlWjzmytMPlYDyy
	 gr706mgo+fvIB9/LNPbrkC5Ah9EN9RpBvVMJu1AW3/tY/We/De8QjOMfAE66fsasfA
	 p4ozRqWdmpWDw==
Message-ID: <1c61d5b5-d9c0-4fa3-8267-8aaf6c441b75@kernel.org>
Date: Wed, 5 Jun 2024 12:20:31 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/5] dt-bindings: input: Add YAML to Awinic sar sensor.
To: wangshuaijie@awinic.com, dmitry.torokhov@gmail.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, jeff@labundy.com,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: liweilei@awinic.com, kangjiajun@awinic.com
References: <20240605091143.163789-1-wangshuaijie@awinic.com>
 <20240605091143.163789-2-wangshuaijie@awinic.com>
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
In-Reply-To: <20240605091143.163789-2-wangshuaijie@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/06/2024 11:11, wangshuaijie@awinic.com wrote:
> From: shuaijie wang <wangshuaijie@awinic.com>
> 
> Add the awinic,aw_sar.yaml file to adapt to the awinic sar sensor driver.

Subject: drop final stops. From all your patches.

> 
> Signed-off-by: shuaijie wang <wangshuaijie@awinic.com>
> ---

No changelog, so nothing improved?

>  .../bindings/input/awinic,aw_sar.yaml         | 125 ++++++++++++++++++

No underscores, but rather awinic,aw96103.yaml

>  1 file changed, 125 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/awinic,aw_sar.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/awinic,aw_sar.yaml b/Documentation/devicetree/bindings/input/awinic,aw_sar.yaml
> new file mode 100644
> index 000000000000..2560ef09d3d0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/awinic,aw_sar.yaml
> @@ -0,0 +1,125 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/awinic,aw_sar.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Awinic sar sensor driver family

driver as Linux driver or some other hardware meaning? If first, then
drop and describe hardware.


> +
> +maintainers:
> +  - Shuaijie Wang <wangshuaijie@awinic.com>

Missing description. You already got question about meaning of sar and
indeed nothing improved.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - awinic,aw96103
> +      - awinic,aw96105
> +      - awinic,aw96303
> +      - awinic,aw96305
> +      - awinic,aw96308
> +
> +  reg:
> +    maxItems: 1
> +
> +  irq-gpio:
> +    maxItems: 1
> +
> +  awinic,sar-label:

label is a string, not number.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Set the label of the SAR(Specific Absorption Rate) sensor.
> +      It is set to 0 if one awinic sar chip is used.
> +      If two awinic sar chips are used, awinic,sar-label in the first
> +      awinic-sar should be set to 0 and awinic,sar-label in the second
> +      awinic-sar should be set to 1.

Sorry, no instance indexing. Drop.

> +
> +

No need for two line breaks.

> +  awinic,regulator-power-supply:
> +    description:
> +      Choose if you want to use a regulator to power the chip. Then the
> +      vccX-supply has to be set.
> +
> +  vcc0-supply:
> +    description:
> +      Optional regulator for chip, 1.7V-3.6V.
> +      If two awinic sar chips are used, the first regulator
> +      should set the ID to vcc0-supply and the second regulator
> +      should set the ID to vcc1-supply.
> +
> +  awinic,channel-use-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The mask of channels used.
> +      Configure according to the specific chip channel used.
> +      Bit[31:0] Each bit represents a channel.
> +      If the customer uses ch0 and ch2, then channel_use_mask=<0x05>
> +      For a 3-channel chip, the maximum value is 0x07;
> +      For a 5-channel chip, the maximum value is 0x1F;
> +      For a 8-channel chip, the maximum value is 0xFF;
> +
> +  awinic,update-fw:
> +    type: boolean
> +    description:
> +      Choose if you want to update the firmware.

Not much improve in explanation or rationale. Why do you want to update
FW every time? Explain this in property description.

I mostly skipped the rest, because it does not look like you addresses
previous feedback.

...
> +
> +required:
> +  - compatible
> +  - reg
> +  - irq-gpio
> +  - awinic,sar-label
> +  - awinic,channel-use-mask
> +
> +unevaluatedProperties: false

Missing some ref, like dai-common or component... or this is supposed to
be additionalProperties: false instead.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        awinic-sar@12 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


I still have no clue what is sar and there is no description in this
binding.

> +            compatible = "awinic,aw96308";
> +            reg = <0x12>;
> +            irq-gpio = <&tlmm 72 0>;

Use proper defines.

> +            awinic,sar-label = < 0 >;

Do not introduce different coding style. Drop spaces. See DTS coding style.



Best regards,
Krzysztof


