Return-Path: <linux-input+bounces-7519-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 654F89A34FA
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 08:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CAB2AB23F14
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 06:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F4FD18755C;
	Fri, 18 Oct 2024 05:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AR2td/4l"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DF017C21B;
	Fri, 18 Oct 2024 05:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729231192; cv=none; b=g4yshD1WUFnSyTY+1MNEnGILET6kL2+OMPFvvgpDt222k7+X5foNX4UnKoVW1qa2RCBbdEnkNoV4OLUG0uj5Oal9C7dj01hrS5XhqBwFKW63JxLlJXU42BEwKXgWuXYwpaNQsswYKpAGAvejHTJfzWHR4irUYM/6+T9WApcq/Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729231192; c=relaxed/simple;
	bh=PtiUemoookjjoOFV+aD0HLviVxFuYkbS5bhDLvEESQM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNDjNeqxHo3QyIYOaB0D79bCtmiVXcSpWif0/mmaoJ52uoSUnIwNb45HSwvoLbvROi0oks71s1ZJmlMlu5W1Mm5ZWIsK1sTKlaMP58g7j4Vy1QeUP/uROOoQesq1xo0VVZmnOEdHOyX6gKULg4Gg/arw4LBj4AEZh73zD0Ip3Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AR2td/4l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FA40C4CEC3;
	Fri, 18 Oct 2024 05:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729231191;
	bh=PtiUemoookjjoOFV+aD0HLviVxFuYkbS5bhDLvEESQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AR2td/4ldzYQCwZII2chf9V6U33bswgpqm+PUW+FknpxbXaV7g9o2B1ZDADRfewSl
	 nROkvUSKWQYCuQpykVJ2kTw5YvDoF7MmxPjrhKXjce3FVNLgJhN+Bz+J7kveprXDeI
	 7KK3usK1jsM0JZw6L7YzGvBU/z9uFtDJoFcGP4NJzohb12Kz/+lAeLz/Mv+POBtTL9
	 xQ9C1lwi8YMXc22miDcOs5fovwgV1fR7ccP4IzgYdYC1fp4mBTf3DKM2PfzNMfB0B9
	 lZxu5hKkJFwSBYseqD7U4Q7drJ6sRUpD8RksVpwc/K35NFPbxXfGfZQeVkFO5PlV4j
	 VXLHyIaSsxeAA==
Message-ID: <06151891-a260-450c-b688-fff18638e627@kernel.org>
Date: Fri, 18 Oct 2024 07:59:46 +0200
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
In-Reply-To: <20241018020815.3098263-2-charles.goodix@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/10/2024 04:08, Charles Wang wrote:
> The Goodix GT7986U touch controller report touch data according to the
> HID protocol through the SPI bus. However, it is incompatible with
> Microsoft's HID-over-SPI protocol.
> 
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
>  .../bindings/input/goodix,gt7375p.yaml        | 68 ++++++++++++++++---
>  1 file changed, 58 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> index 358cb8275..184d9c320 100644
> --- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> +++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> @@ -8,27 +8,27 @@ title: Goodix GT7375P touchscreen
>  
>  maintainers:
>    - Douglas Anderson <dianders@chromium.org>
> +  - Charles Wang <charles.goodix@gmail.com>
>  
>  description:
> -  Supports the Goodix GT7375P touchscreen.
> -  This touchscreen uses the i2c-hid protocol but has some non-standard
> -  power sequencing required.
> -
> -allOf:
> -  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> +  The Goodix GT7375P and GT7986U touchscreens support both SPI and I2C interfaces.
> +  With the I2C interface, they use the i2c-hid protocol but require non-standard
> +  power sequencing. With the SPI interface, they use a custom HID protocol that
> +  is incompatible with Microsoft's HID-over-SPI protocol.
>  
>  properties:
>    compatible:
>      oneOf:
> -      - const: goodix,gt7375p
> +      - items:
> +          - const: goodix,gt7375p

That's not a necessary change. Keep old code here.

>        - items:
>            - const: goodix,gt7986u
>            - const: goodix,gt7375p
> +      - items:
> +          - const: goodix,gt7986u

Hm? This does not make much sense. Device either is or is not compatible
with gt7375p. Cannot be both.

>  
>    reg:
> -    enum:
> -      - 0x5d
> -      - 0x14
> +    maxItems: 1
>  
>    interrupts:
>      maxItems: 1
> @@ -57,6 +57,15 @@ properties:
>        This property is used to avoid the back-powering issue.
>      type: boolean
>  
> +  goodix,hid-report-addr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The register address for retrieving HID report data.
> +      This address is related to the device firmware and may
> +      change after a firmware update.

How is this supposed to work? DTS will stay fixed, you cannot change it
just because firmware changed. User loads new firmware with different
address, but DTS will have to use old address - so broken property.

> +
> +  spi-max-frequency: true

Drop

> +
>  required:
>    - compatible
>    - reg
> @@ -64,6 +73,25 @@ required:
>    - reset-gpios
>    - vdd-supply
>  
> +allOf:
> +  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          items:
> +            - const: goodix,gt7986u
> +    then:
> +      required:
> +        - goodix,hid-report-addr
> +    else:
> +      properties:
> +        goodix,hid-report-addr: false
> +        spi-max-frequency: false

Why? GT7375P also supports SPI.

> +        reg:
> +          enum: [0x5d, 0x14]
> +
>  additionalProperties: false

This becomes now: unevaluatedProperties: false

>  
>  examples:
> @@ -87,3 +115,23 @@ examples:
>          vdd-supply = <&pp3300_ts>;
>        };
>      };
> +

Best regards,
Krzysztof


