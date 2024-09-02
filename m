Return-Path: <linux-input+bounces-6049-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3729686B3
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 13:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B71531F21730
	for <lists+linux-input@lfdr.de>; Mon,  2 Sep 2024 11:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644E91D6DC3;
	Mon,  2 Sep 2024 11:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4Etz+uz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AE51D6C73;
	Mon,  2 Sep 2024 11:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725277924; cv=none; b=VKRpdHPlJ2hZnqxTCUPwahlxr3zW/Otxs9I0tDDfoRBSK9JuQBFoZhzmCom7KZengJzsyLSW9s/Ci6ubvuWPMXirZQ+oXYuFbueDktytP6xBP2kSj/QQ0vVks4a3fo6xmw8zE1YaUB/K+llGdj/WFZEQ2tj9EqqfZngG4qK0vSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725277924; c=relaxed/simple;
	bh=ClG945cLDYt80cvq7MHU0MZy2pQK+a2zhTll8AQVeEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4uRq1CQ21g3oLqTRpkyjLdv+7sY3opBHpN3Ce7S1ib1L9MD4sHfqM9G6KvJR9to6kT9MzG1tJwa1IaO7OgsJezI99//N03fWAiQ88LIs1G5mgKg3elqMtbU70WM/ww983Af1qSlOzns52hWXnkl5jZWMxw3fsAb0HVfFTgSOXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4Etz+uz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3043BC4CEC6;
	Mon,  2 Sep 2024 11:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725277923;
	bh=ClG945cLDYt80cvq7MHU0MZy2pQK+a2zhTll8AQVeEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E4Etz+uzb+RpZxNmqRFMSO/q14B1JYKHuWA/gxjKaoF6m2/upq7RLVVb6/hXOA40D
	 RJAHzEQHq+4Hlhqkjeiu0IAuTPAOvEF5ozEETq0cAPS+loH4qHuEsSI4gweYF4vXAY
	 QCu7d2Dm6rLBWKbwJbY+sV+zWQoqMSfW1lWHjgc8bILnVKwkjhAcinKB2ZZ+ibL5jL
	 YKzpVKUoAh3TOR9el1itnPUlQwCR7blj5ZWTuaMSUBo3WrgjNtR1yLjP/0+inkynb3
	 qw00QG5+gbGuMKbezWj7GstYA4g3OcTNXSuzF6g3ENPQFiH77tKaFN/YVsbTGG+XLp
	 0bGpdoCJNhVKA==
Date: Mon, 2 Sep 2024 13:52:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Hennerich <michael.hennerich@analog.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: touchscreen: ad7877: add bindings
Message-ID: <h6vvttsj3bu2rrmpzr4sazyn6lylh3yfzins2y2vk3rjkz76az@xy2yraidasu2>
References: <20240902082707.4325-1-antoniu.miclaus@analog.com>
 <20240902082707.4325-3-antoniu.miclaus@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240902082707.4325-3-antoniu.miclaus@analog.com>

On Mon, Sep 02, 2024 at 11:24:33AM +0300, Antoniu Miclaus wrote:
> Add device tree bindings for the ad7877 driver.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---
> changes in v2:
>  - add only the used properties from touchscreen.yaml
>  - add vendor properties.
>  - update dt example.
>  .../input/touchscreen/adi,ad7877.yaml         | 110 ++++++++++++++++++
>  1 file changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.yaml b/Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.yaml
> new file mode 100644
> index 000000000000..035e2d5bbcb8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/adi,ad7877.yaml
> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/adi,ad7877.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices AD7877 Touch Screen Controller
> +
> +maintainers:
> +  - Antoniu Miclaus <antoniu.miclaus@analog.com>
> +
> +description: |
> +  Analog Devices Touch Screen Controller
> +  https://www.analog.com/media/en/technical-documentation/data-sheets/AD7877.pdf
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,ad7877
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  spi-max-frequency:
> +    description: AD7877 SPI bus clock frequency.
> +    minimum: 10000
> +    maximum: 20000000
> +
> +  adi,stopacq-polarity:
> +    description: The polarity of the signal applied to the STOPACQ pin.
> +                 0 = active low
> +                 1 = active high
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    enum: [0, 1]

I think I was already commenting on this for analog... If using numbers,
why this is reversed from standard GPIO property? Or maybe this should
be just string.

> +
> +  adi,first-conv-delay:
> +    description: Delay before the first conversion.

No, use proper unit suffix.

> +                 0 = 0.5us
> +                 1 = 128us
> +                 2 = 1ms
> +                 3 = 8ms
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    enum: [0, 1, 2, 3]
> +
> +  adi,pen-down-acc-interval:

Use proper unit suffix.

> +    description: Enable the ADC to repeatedly perform conversions.
> +                  0 = covert once
> +                  1 = every 0.5 ms
> +                  2 = every 1 ms
> +                  3 = every 8 ms
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    enum: [0, 1, 2, 3]

How is it supposed to work? These are optional but there are no
defaults?

> +
> +  adi,acquisition-time:
> +    description:  Select acquisition times for the ADC.
> +                  0 = 2us
> +                  1 = 4us
> +                  2 = 8us
> +                  3 = 16us

Same problem

> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    enum: [0, 1, 2, 3]
> +
> +  adi,vref-delay-usecs:
> +    description: Delay required for the SPI transfers depending on the VREF used.
> +    $ref: /schemas/types.yaml#/definitions/uint16
> +
> +  touchscreen-average-samples:
> +    enum: [1, 4, 8, 16]
> +
> +  touchscreen-x-plate-ohms: true
> +  touchscreen-y-plate-ohms: true
> +  touchscreen-min-x: true
> +  touchscreen-min-y: true
> +  touchscreen-max-x: true
> +  touchscreen-max-y: true
> +  touchscreen-max-pressure: true
> +  touchscreen-min-pressure: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - touchscreen-average-samples
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    spi {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      touchscreen@0 {
> +        compatible = "adi,ad7877";
> +        reg = <0>;
> +        spi-max-frequency = <20000000>;
> +        interrupts = <21 IRQ_TYPE_EDGE_FALLING>;
> +        interrupt-parent = <&gpio>;
> +        touchscreen-average-samples = <16>;

Make the example complete.

Best regards,
Krzysztof


