Return-Path: <linux-input+bounces-14329-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E70DB37522
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 01:03:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10F2C360ACB
	for <lists+linux-input@lfdr.de>; Tue, 26 Aug 2025 23:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6267720296A;
	Tue, 26 Aug 2025 23:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idq8l0hu"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ED636D;
	Tue, 26 Aug 2025 23:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756249402; cv=none; b=g4fiChXtnzBg2lUaB8Y/Ax7ybO/Q5kwnBk0IEM7pJ2YPJZkiREKDELlXqCH+pgrYCy4iRYQf71nAjOdsJM4lLstebXSQ2rsmrVByhng8Cuvmoonya9a3Ob4ho9kIux6Gdm36dqDfAUQ8i/AFUIMHziVL23hqMnMYcmxZ/w1jLco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756249402; c=relaxed/simple;
	bh=tf1TFSTtyO1m4AAW3w5VgMDMr3FylT0yQFNw0VkexyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtDYmGmwq/xJxK7fFE1uoPpjSbvwmD+OedJsYLwHv5ocvFY/d+xCfwTv3du2xq74xjOuFVJ+kP3gfpYjLlkG6MfWaW3cIxItgKTQ8t6iVWf9AEFtZTZ8KBC6qbTuDheg1QqJ+Fj4sKWRgJy9s4umfwVuKQ45O06EyCYvAZVGvmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idq8l0hu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526D4C4CEF1;
	Tue, 26 Aug 2025 23:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756249401;
	bh=tf1TFSTtyO1m4AAW3w5VgMDMr3FylT0yQFNw0VkexyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=idq8l0hu1cCpvbkzEa9KUsdyoKI1zI1UQlcynm7WzpdVu7e6BIpPlQMujsIuF7DHK
	 MFr5GAupniaN1JTy2lbW04wDCnaCH2mKrLWuALH6DVBkVvgZu/W3RJsUzKa16CWrG5
	 etUOm5C1G+Sn/+yS5hLVkBcbk6MZF2y3RN8lEkpGcQegLlWlT3IPc+X8vbVfo1JW9G
	 FQRoIFmt7CMteKoZQz4EQJ3UDl+UUA7UmZeMM9Y+ABjJ9ilh45YgtBFmaEShyEfKXZ
	 QFtBJbNwDz1xy8mZGPMp5JxtKbI2XQf/opv2OysCWOzYlYNx5eNhqF+nB7BX69gEEH
	 tbe85OZ+k/vTg==
Date: Tue, 26 Aug 2025 18:03:20 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Kurz <akurz@blala.de>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/9] dt-bindings: mfd: fsl,mc13xxx: convert txt to DT
 schema
Message-ID: <20250826230320.GA646158-robh@kernel.org>
References: <20250823144441.12654-1-akurz@blala.de>
 <20250823144441.12654-6-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823144441.12654-6-akurz@blala.de>

On Sat, Aug 23, 2025 at 02:44:37PM +0000, Alexander Kurz wrote:
> Convert the txt mc13xxx bindings to DT schema attempting to keep most
> information. The nodes codec and touchscreen are not part of the new
> schema since it was only briefly mentioned before.
> Following the convention, rename led-control to fsl,led-control.

If 'led-control' is already in use, then you can't do that. You could 
support both, but then the driver has to support both forever which is 
worse than not matching convention.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>
> ---
>  .../devicetree/bindings/mfd/fsl,mc13xxx.yaml  | 214 ++++++++++++++++++
>  .../devicetree/bindings/mfd/mc13xxx.txt       | 156 -------------
>  2 files changed, 214 insertions(+), 156 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/mc13xxx.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml b/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
> new file mode 100644
> index 000000000000..94e2f6557376
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/fsl,mc13xxx.yaml
> @@ -0,0 +1,214 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/fsl,mc13xxx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale MC13xxx Power Management Integrated Circuits (PMIC)
> +
> +maintainers:
> +  - Alexander Kurz <akurz@blala.de>
> +
> +description:

Needs a '>' modifier to preserve formatting.

> +  The MC13xxx PMIC series consists of the three models MC13783, MC13892
> +  and MC34708 and provide regulators and other features like RTC, ADC,
> +  LED, touchscreen, codec and input buttons.
> +
> +  Link to datasheets
> +    https://www.nxp.com/docs/en/data-sheet/MC13783.pdf
> +    https://www.nxp.com/docs/en/data-sheet/MC13892.pdf
> +    https://www.nxp.com/docs/en/data-sheet/MC34708.pdf
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,mc13783
> +      - fsl,mc13892
> +      - fsl,mc34708
> +
> +  reg:
> +    description: I2C slave address or SPI chip select number.
> +    maxItems: 1
> +
> +  spi-max-frequency: true
> +
> +  spi-cs-high: true
> +
> +  system-power-controller: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  leds:
> +    type: object
> +    $ref: /schemas/leds/common.yaml#
> +    description: |
> +      Leds

Drop the description

blank line

> +    properties:
> +      reg:
> +        description: |
> +          One of
> +          MC13783 LED IDs
> +            0: Main display
> +            1: AUX display
> +            2: Keypad
> +            3: Red 1
> +            4: Green 1
> +            5: Blue 1
> +            6: Red 2
> +            7: Green 2
> +            8: Blue 2
> +            9: Red 3
> +            10: Green 3
> +            11: Blue 3

blank line

> +          MC13892 LED IDs
> +            0: Main display
> +            1: AUX display
> +            2: Keypad
> +            3: Red
> +            4: Green
> +            5: Blue

blank line

> +          MC34708 LED IDs
> +            0: Charger Red
> +            1: Charger Green
> +        maxItems: 1

blank line

> +      fsl,led-control:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: |
> +          Setting for LED-Control register array length depends on model,
> +          mc13783: 6, mc13892: 4, mc34708: 1
> +
> +  regulators:
> +    type: object
> +    $ref: /schemas/regulator/regulator.yaml#

This schema applies to the child nodes, not this node. Drop.

       additionalProperties:
         type: object


> +    description: |
> +      List of child nodes specifying the regulators, depending on chip variant:
> +      * MC13783: gpo[1-4], pwgt[12]spi, sw[12][ab], sw3, vaudio, vcam, vdig,
> +      vesim, vgen, viohi, violo, vmmc[12], vrf[12], vrfbg, vrfcp, vrfdig,
> +      vrfref, vsim and vvib.
> +      * MC13892: gpo[1-4], pwgt[12]spi, sw[1-4], swbst, vaudio, vcam, vcoincell,
> +      vdig, vgen[1-3], viohi, vpll, vsd, vusb, vusb2, vvideo.
> +      Each child node is defined using the standard binding for regulators and
> +      the optional regulator properties defined below.

Don't duplicate what the schema says below in free-form text.

> +
> +  fsl,mc13xxx-uses-adc:
> +    type: boolean
> +    description: Indicate the ADC is being used
> +
> +  fsl,mc13xxx-uses-codec:
> +    type: boolean
> +    description: Indicate the Audio Codec is being used
> +
> +  fsl,mc13xxx-uses-rtc:
> +    type: boolean
> +    description: Indicate the RTC is being used
> +
> +  fsl,mc13xxx-uses-touch:
> +    type: boolean
> +    description: Indicate the touchscreen controller is being used
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,mc13783
> +    then:
> +      properties:
> +        leds:
> +          properties:
> +            fsl,led-control:
> +              minItems: 6
> +              maxItems: 6
> +        regulators:
> +          patternProperties:
> +            "^gpo[1-4]|pwgt[12]spi|sw[12][ab]|sw3|vaudio|vcam|vdig|vesim|vgen|viohi|violo|vmmc[12]|vrf[12]|vrfbg|vrfcp|vrfdig|vrfref|vsim|vvib$":
> +              type: object
> +              $ref: /schemas/regulator/regulator.yaml#

                 unevaluatedProperties: false

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,mc13892
> +    then:
> +      properties:
> +        leds:
> +          properties:
> +            fsl,led-control:
> +              minItems: 4
> +              maxItems: 4
> +        regulators:
> +          patternProperties:
> +            "^gpo[1-4]|pwgt[12]spi|sw[1-4]|swbst|vaudio|vcam|vcoincell|vdig|vgen[1-3]|viohi|vpll|vsd|vusb|vusb2|vvideo$":
> +              type: object
> +              $ref: /schemas/regulator/regulator.yaml#

                 unevaluatedProperties: false

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,mc34708
> +    then:
> +      properties:
> +        leds:
> +          properties:
> +            fsl,led-control:
> +              minItems: 1
> +              maxItems: 1
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/leds/common.h>
> +
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic: mc13892@0 {
> +            compatible = "fsl,mc13892";
> +            reg = <0>;
> +            spi-max-frequency = <1000000>;
> +            spi-cs-high;
> +            interrupt-parent = <&gpio0>;
> +            interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
> +            fsl,mc13xxx-uses-rtc;
> +            fsl,mc13xxx-uses-adc;
> +
> +            leds {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                fsl,led-control = <0x000 0x000 0x0e0 0x000>;
> +
> +                sysled@3 {
> +                    reg = <3>;
> +                    label = "system:red:live";
> +                    linux,default-trigger = "heartbeat";
> +                };
> +            };
> +
> +            regulators {
> +                sw1_reg: sw1 {
> +                    regulator-min-microvolt = <600000>;
> +                    regulator-max-microvolt = <1375000>;
> +                    regulator-boot-on;
> +                    regulator-always-on;
> +                };
> +
> +                sw2_reg: sw2 {
> +                    regulator-min-microvolt = <900000>;
> +                    regulator-max-microvolt = <1850000>;
> +                    regulator-boot-on;
> +                    regulator-always-on;
> +                };
> +            };
> +        };
> +    };

