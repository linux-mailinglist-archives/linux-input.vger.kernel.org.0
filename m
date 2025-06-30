Return-Path: <linux-input+bounces-13185-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD326AED4AC
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 08:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD24C173681
	for <lists+linux-input@lfdr.de>; Mon, 30 Jun 2025 06:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C7E202F79;
	Mon, 30 Jun 2025 06:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oD2Rr5Ge"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D361C862C;
	Mon, 30 Jun 2025 06:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751265223; cv=none; b=sMDH4h9lpeFIE4gqPTKERVyZobKyEAC0WYgNrb2EWf7jTdyKYPngLR0nL1YN0gZPCPGKChugA/0/uwV5FttDjJUraBOLrB5evbmCSQehEDCVkZVe2TPpaUrO1WIzAAMWu/kySyhrJt5ptQjor+dZG6AVMFR8D5GzX1xkoIdAsFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751265223; c=relaxed/simple;
	bh=K6tpL+n+5qcjNzrP2/VpzXL4TQCVWVSKQU/Z1dntQm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kfGGLdrOtic5il4hMdwAEt7+hU5DuQFSKTfjJgpnASbi8k+Pflzbs1WIbSS0qt2vBJR9+gMT1G8QzAKW9eimh1/TuoQHzT2qpzlvrjCzyAAGpRvJgm0MGPzbXlslVEgSHrlHBGVkGD+D5Sp5nY6PuxHLIYe4xtX/knymNogYUN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oD2Rr5Ge; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875B6C4CEEB;
	Mon, 30 Jun 2025 06:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751265222;
	bh=K6tpL+n+5qcjNzrP2/VpzXL4TQCVWVSKQU/Z1dntQm8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oD2Rr5Ged+JYGngN58e5ftOdNFdT6oJhTfaPtr9WFBL2O1zKK+W0U7Ck+7W86kgft
	 1L1ucC8XI2DCgy9nFvFJqMR5GVpxr2vE4N5K00Kmgpq9epBlCDK05Ms9YXs4d2kN2j
	 sdxtMs8ZZ9rrHhPYAHs4n5jwht7S657hbxd/troXMmquH0o+JkvGEi7HozBtPbkqQb
	 Mk5mqXTypSVrMzQBpHsoULnIGFDeMizy6zX7zijGKZ2DVQXCwJPb0dPf9w97XhFHYf
	 pXHCjJvvXfpRc7kruYeyv1O8abfgWZPDnYODL4PuwBu1z5il0hntN8AIRPTikpqNry
	 hCYVWhlYbZhiA==
Message-ID: <a14cb1e8-a0c3-4451-8c75-07e175f4620d@kernel.org>
Date: Mon, 30 Jun 2025 08:33:33 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: input: touchscreen: add hynitron
 cst816x
To: Oleh Kuzhylnyi <kuzhylol@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Janne Grunau <j@jannau.net>,
 Igor Opaniuk <igor.opaniuk@gmail.com>, Neal Gompa <neal@gompa.dev>,
 Jeff LaBundy <jeff@labundy.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250629162523.291887-1-kuzhylol@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250629162523.291887-1-kuzhylol@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/06/2025 18:25, Oleh Kuzhylnyi wrote:
> Add documentation for Hynitron CST816x series touchscreen bindings.
> 
> Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
> ---
> Changes in v8:
>  - Use linux,keycodes to map touch gestures to key events
>  - Refactore binding properties based on feedback from Jeff LaBundy
>    and Krzysztof Kozlowski to align with official documentation

This is vague. Anything can be "refactor". What changed specifically?

b4 diff shows no changes.


> 
> Changes in v7:
>  - Introduce the gestures field along with its sub-fields
>  - Make reset-gpio property optional
>  - Extend main description
>  - Remove "touchscreen" reference
> 
> Changes in v6:
>  - Fix minor tweak adviced by Krzysztof:
>  - Move additionalProperties field after required
> 
> Changes in v5:
>  - No code changes
> 
> Changes in v4:
>  - Add Conor's Dooley "Reviewed-by" tag
> 
> Changes in v3:
>  - Rename filename to hynitron,cst816s.yaml
>  - Update description with display details
> 
> Changes in v2:
>  - Apply pin definitions and DT headers
>  - Use generic name for DT node
>  - Drop status field
> 
>  .../input/touchscreen/hynitron,cst816x.yaml   | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
> new file mode 100644
> index 000000000000..0d358463d7f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816x.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/hynitron,cst816x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hynitron CST816x Series Capacitive Touch controller
> +
> +maintainers:
> +  - Oleh Kuzhylnyi <kuzhylol@gmail.com>
> +
> +description: |
> +  Bindings for CST816x high performance self-capacitance touch chip series
> +  with single point gesture and real two-point operation.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - hynitron,cst816s
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  linux,keycodes:
> +    minItems: 1
> +    maxItems: 16
> +    description: |
> +      Specifies the numeric keycodes associated with each available gesture in
> +      the following order (enter 0 for unused and reserved gestures):
> +      0: Touch
> +      1: Swipe up
> +      2: Swipe down
> +      3: Swipe left
> +      4: Swipe right
> +      5-11: Reserved
> +      12: Long press
> +      13-15: Reserved

Fields like "reserved" makes no sense. If this is reserved, why would it
be put into the DTS?

No, just list the items with description:
minItems: 1
items:
  - description: Touch gesture (although what is a touch gesture? This
is just a touch....)
  - description: ...


> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts


Where is (or why there is no) the ref to touchscreen.yaml?

> +
> +additionalProperties: false

And this not unevaluatedProperties then?

> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/input/linux-event-codes.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +          #address-cells = <1>;
> +          #size-cells = <0>;

Messed indentation.

> +          touchscreen@15 {
> +              compatible = "hynitron,cst816s";
> +              reg = <0x15>;
> +              interrupt-parent = <&gpio0>;
> +              interrupts = <4 IRQ_TYPE_EDGE_RISING>;
> +              reset-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
> +              linux,keycodes = <BTN_TOUCH>,




Best regards,
Krzysztof

