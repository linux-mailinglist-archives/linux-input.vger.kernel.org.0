Return-Path: <linux-input+bounces-7032-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA5598E480
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 22:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2B23B21F74
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 20:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F2B21731F;
	Wed,  2 Oct 2024 20:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4iaP7/V"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D731D278D;
	Wed,  2 Oct 2024 20:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727902740; cv=none; b=HQ/VvmKCLoEG7dspTquRfMqEQOG/F0RnQ3vJO+Mvec5oSqSM1uWV69dkzR8TCbMN1T31kuP5Zg/oVFOdVKF71GEjmshUyYTL08Vg2AeO3Rb6zDQfocPhjpFYzn3oAtr5I3TS0X4xnG9nw7OjlxKupjq71Xxak9d7Ai6tnRb6MFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727902740; c=relaxed/simple;
	bh=9PB7X2t/YcDc9aHjUpTSRxtDr1mvveifceoncjWg/W8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZ8fAYIPMtzU8QyiKF2Mqd67ya2xSlHoFX1oBrtXlzalb6qgMcve5Kl+B9QHaRoT+RiuOWVxdgKLwOP7vkDlr/XjxFRQ8NoH535L/mSTvzneongy/CAPYuN+176ePaLfqXfUYEmF7toREuERqMyEsI5xwEhl9oZBYCnte9woCMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b4iaP7/V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDCBC4CEC2;
	Wed,  2 Oct 2024 20:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727902739;
	bh=9PB7X2t/YcDc9aHjUpTSRxtDr1mvveifceoncjWg/W8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b4iaP7/ViKUi+jm6kvqrKFT4u0U55HNeD4x5kIwbMeYXjBTM9hUZeBmmspTdoq49f
	 OWeyrfmFNZsBEoQw/XEYoqnjm2mfD87NBYudapFU/Y6ARdmCDUYkkC9ZrIeUvQbNZP
	 V8164RG3q5DLalAOETwfGBh+DHDS7JWlwLqxrg442L4bfSuaSPaP3mV5mjR6vwfNTw
	 Irz21Vb+e/QT45j2rg6JL58V/uX4qOl2+V1tHG7nrKdykl2cuhKHdr/+aBUw+z/3kN
	 UN8778Rm4TKbfAFCJQdGKy9kpdYibcOvfVqhKiNpjcildR7ocrwMgLzVUIRMg9m970
	 FqE74I8lo2EYw==
Date: Wed, 2 Oct 2024 15:58:58 -0500
From: Rob Herring <robh@kernel.org>
To: Nuno Sa <nuno.sa@analog.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>, Dmitry Torokhov <dtor@mail.ru>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 05/13] dt-bindings: input: Document adp5589 and similar
 devices
Message-ID: <20241002205858.GA1285914-robh@kernel.org>
References: <20241001-b4-dev-adp5589-fw-conversion-v1-0-fca0149dfc47@analog.com>
 <20241001-b4-dev-adp5589-fw-conversion-v1-5-fca0149dfc47@analog.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001-b4-dev-adp5589-fw-conversion-v1-5-fca0149dfc47@analog.com>

On Tue, Oct 01, 2024 at 03:41:36PM +0200, Nuno Sa wrote:
> Add device tree bindings for the adp5589 keypad (and similar devices). The
> ADP5585 family has small differences like the lack of the unlock
> function and less pins (cols x rows) for the keymap.
> 
> As there's no MAINTAINERS entry for these devices, add one. Also to note
> that these devices were removed from trivial-devices.yaml.
> 
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---
>  .../devicetree/bindings/input/adi,adp5589.yaml     | 310 +++++++++++++++++++++
>  .../devicetree/bindings/trivial-devices.yaml       |   6 -
>  MAINTAINERS                                        |   9 +
>  3 files changed, 319 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/adi,adp5589.yaml b/Documentation/devicetree/bindings/input/adi,adp5589.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..bdbc79758a0390952c8363ec28f48057dab929a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/adi,adp5589.yaml
> @@ -0,0 +1,310 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/adi,adp5589.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices ADP5589 and similar Keypad Controllers
> +
> +maintainers:
> +  - Nuno Sa <nuno.sa@analog.com>
> +  - Michael Hennerich <michael.hennerich@analog.com>
> +
> +description: |
> +  Analog Devices Mobile I/O Expander and QWERTY Keypad Controllers
> +   - https://www.analog.com/media/en/technical-documentation/data-sheets/ADP5589.pdf
> +   - https://www.analog.com/media/en/technical-documentation/data-sheets/ADP5585.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - adi,adp5589
> +      - adi,adp5585
> +      - adi,adp5585-2
> +
> +  reg:
> +    maxItems: 1
> +
> +  vcc-supply: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-controller:
> +    description:
> +      This property applies if there are pins not used in the keypad.
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  interrupt-controller:
> +    description:
> +      This property applies if there are pins not used in the keypad.
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  adi,cols-mask:
> +    description:
> +      Defines the number of pins (columns) being used ad part of the keymap. As
> +      the device is fully configurable and we can have holes in the columns
> +      being used, this is given as mask.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0x1
> +    maximum: 0x3f
> +
> +  adi,rows-mask:
> +    description:
> +      Defines the number of pins (rows) being used ad part of the keymap. As
> +      the device is fully configurable and we can have holes in the rows being
> +      used, this is given as mask.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0x1
> +    maximum: 0xff
> +
> +  adi,key-poll-ms:
> +    description: Configure time between consecutive scan cycles.
> +    enum: [10, 20, 30, 40]
> +    default: 10
> +
> +  adi,unlock-keys:
> +    description:
> +      Specifies a maximum of 2 keys that can be used to unlock the keypad.
> +      If this property is set, the keyboard will be locked and only unlocked
> +      after these keys are pressed. The value 127 serves as a wildcard which
> +      means any key can be used for unlocking.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 2

You probably don't allow repeated key values? If so, then you can add 
'uniqueItems: true' to enforce that.

> +    items:
> +      anyOf:
> +        - minimum: 1
> +          maximum: 88
> +        - minimum: 97
> +          maximum: 115
> +        - const: 127
> +
> +  adi,unlock-trigger-sec:
> +    description:
> +      Defines the time in which the second unlock event must occur after the
> +      first unlock event has occurred.
> +    maximum: 7
> +    default: 0
> +
> +  adi,reset1-keys:
> +    description:
> +      Defines the trigger events (key presses) that can generate reset
> +      conditions one the reset1 block.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 3
> +    items:
> +      anyOf:
> +        - minimum: 1
> +          maximum: 88
> +        - minimum: 97
> +          maximum: 115
> +
> +  adi,reset2-keys:
> +    description:
> +      Defines the trigger events (key presses) that can generate reset
> +      conditions one the reset2 block.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      anyOf:
> +        - minimum: 1
> +          maximum: 88
> +        - minimum: 97
> +          maximum: 115
> +
> +  adi,reset1-active-high:
> +    description: Sets the reset1 signal as active high.
> +    type: boolean
> +
> +  adi,reset2-active-high:
> +    description: Sets the reset2 signal as active high.
> +    type: boolean
> +
> +  adi,rst-passtrough-enable:

passthrough

> +    description: Allows the RST pin to override (OR with) the reset1 signal.
> +    type: boolean
> +
> +  adi,reset-trigger-ms:
> +    description:
> +      Defines the length of time that the reset events must be active before a
> +      reset signal is generated. All events must be active at the same time for
> +      the same duration.
> +    enum: [0, 1000, 1500, 2000, 2500, 3000, 3500, 4000]
> +    default: 0
> +
> +  adi,reset-pulse-width-us:
> +    description: Defines the pulse width of the reset signals.
> +    enum: [500, 1000, 2000, 10000]
> +    default: 500
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +patternProperties:
> +  "^gpio@":

'gpio' for node name is for gpio-controllers which this is not.

> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        description: The GPIO number being configured.
> +        maximum: 18
> +
> +      adi,pull-up-ohms:
> +        description: The pullup resistor to be used.
> +        enum: [100000, 300000]
> +        default: 300000

Key mode doesn't have a pull-up?

Kind of overkill to have a node for 1 property. I'd probably just make 
this an array of 18 entries for all pins using 0 or something if you 
don't want to configure pins.

> +
> +    required:
> +      - reg
> +
> +dependencies:
> +  adi,rows-mask:
> +    - linux,keymap
> +    - adi,cols-mask
> +  adi,cols-mask:
> +    - linux,keymap
> +    - adi,rows-mask
> +  linux,keymap:
> +    - adi,rows-mask
> +    - adi,cols-mask
> +    - interrupts
> +  interrupt-controller:
> +    - interrupts
> +  adi,unlock-trigger-sec:
> +    - adi,unlock-keys
> +  adi,reset1-active-high:
> +    - adi,reset1-keys
> +  adi,rst-passtrough-enable:
> +    - adi,reset1-keys
> +  adi,reset2-active-high:
> +    - adi,reset2-keys
> +
> +required:
> +  - compatible
> +  - reg
> +  - vcc-supply
> +
> +allOf:
> +  - $ref: matrix-keymap.yaml#
> +  - $ref: input.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - adi,adp5585-2
> +    then:
> +      properties:
> +        adi,unlock-keys: false
> +        adi,unlock-trigger-sec: false
> +        adi,rows-mask:
> +          maximum: 0x2f
> +        adi,cols-mask:
> +          maximum: 0x1f
> +        adi,reset1-keys:
> +          items:
> +            anyOf:
> +              - minimum: 1
> +                maximum: 30
> +              - minimum: 37
> +                maximum: 47
> +        adi,reset2-keys:
> +          items:
> +            anyOf:
> +              - minimum: 1
> +                maximum: 30
> +              - minimum: 37
> +                maximum: 47
> +      patternProperties:
> +        "^gpio@":
> +          properties:
> +            reg:
> +              maximum: 10
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - adi,adp5585
> +    then:
> +      properties:
> +        adi,unlock-keys: false
> +        adi,unlock-trigger-sec: false
> +        adi,rows-mask:
> +          maximum: 0x1f
> +        adi,cols-mask:
> +          maximum: 0x1f
> +        adi,reset1-keys:
> +          items:
> +            anyOf:
> +              - minimum: 1
> +                maximum: 25
> +              - enum: [37, 38, 39, 40, 41, 43, 44, 45, 46, 47]
> +        adi,reset2-keys:
> +          items:
> +            anyOf:
> +              - minimum: 1
> +                maximum: 25
> +              - enum: [37, 38, 39, 40, 41, 43, 44, 45, 46, 47]
> +      patternProperties:
> +        "^gpio@":
> +          properties:
> +            reg:
> +              enum: [0, 1, 2, 3, 4, 6, 7, 8, 9, 10]
> +
> +unevaluatedProperties: false
> +
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/input/input.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        keys@34 {
> +            compatible = "adi,adp5589";
> +            reg = <0x34>;
> +
> +            vcc-supply = <&vcc>;
> +            interrupts = <21 IRQ_TYPE_EDGE_FALLING>;
> +            interrupt-parent = <&gpio>;
> +
> +            adi,rows-mask = <0x13>;
> +            adi,cols-mask = <0xf>;
> +
> +            linux,keymap = <
> +                MATRIX_KEY(0x00, 0x00, KEY_1)
> +                MATRIX_KEY(0x00, 0x01, KEY_2)
> +                MATRIX_KEY(0x00, 0x02, KEY_3)
> +                MATRIX_KEY(0x00, 0x03, KEY_4)
> +                MATRIX_KEY(0x01, 0x00, KEY_5)
> +                MATRIX_KEY(0x01, 0x01, KEY_6)
> +                MATRIX_KEY(0x01, 0x02, KEY_7)
> +                MATRIX_KEY(0x01, 0x03, KEY_8)
> +                MATRIX_KEY(0x04, 0x00, KEY_9)
> +                MATRIX_KEY(0x04, 0x01, KEY_A)
> +                MATRIX_KEY(0x04, 0x02, KEY_B)
> +                MATRIX_KEY(0x04, 0x03, KEY_C)
> +            >;
> +
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            gpio@10 {
> +                reg = <10>;
> +                adi,pull-up-ohms = <100000>;
> +            };
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 7913ca9b6b54020c58e387b3618922386ce03763..35238b1d89e65bfed09e1a1a5b421a07555f6351 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -38,12 +38,6 @@ properties:
>            - ad,adm9240
>              # AD5110 - Nonvolatile Digital Potentiometer
>            - adi,ad5110
> -            # Analog Devices ADP5585 Keypad Decoder and I/O Expansion
> -          - adi,adp5585
> -            # Analog Devices ADP5585 Keypad Decoder and I/O Expansion with support for Row5
> -          - adi,adp5585-02
> -            # Analog Devices ADP5589 Keypad Decoder and I/O Expansion
> -          - adi,adp5589
>              # Analog Devices LT7182S Dual Channel 6A, 20V PolyPhase Step-Down Silent Switcher
>            - adi,lt7182s
>              # AMS iAQ-Core VOC Sensor
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a533d882b0022fd7580b829b68d846d319a4a8a7..120a1867b8f716ae11bffedab94a938c25888457 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -545,6 +545,15 @@ W:	https://ez.analog.com/linux-software-drivers
>  F:	Documentation/devicetree/bindings/input/adi,adp5588.yaml
>  F:	drivers/input/keyboard/adp5588-keys.c
>  
> +ADP5589 QWERTY KEYPAD AND IO EXPANDER DRIVER (ADP5589/ADP5585)
> +M:	Michael Hennerich <michael.hennerich@analog.com>
> +M:	Nuno Sa <nuno.sa@analog.com>
> +S:	Supported
> +W:	https://ez.analog.com/linux-software-drivers
> +F:	Documentation/devicetree/bindings/input/adi,adp5589.yaml
> +F:	drivers/input/keyboard/adp5589-keys.c
> +F:	include/linux/input/adp5589.h
> +
>  ADP8860 BACKLIGHT DRIVER (ADP8860/ADP8861/ADP8863)
>  M:	Michael Hennerich <michael.hennerich@analog.com>
>  S:	Supported
> 
> -- 
> 2.46.1
> 

