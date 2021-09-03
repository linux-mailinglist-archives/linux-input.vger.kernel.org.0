Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 509294005E1
	for <lists+linux-input@lfdr.de>; Fri,  3 Sep 2021 21:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236181AbhICTgR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Sep 2021 15:36:17 -0400
Received: from mail-oo1-f47.google.com ([209.85.161.47]:33377 "EHLO
        mail-oo1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231357AbhICTgR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Sep 2021 15:36:17 -0400
Received: by mail-oo1-f47.google.com with SMTP id v20-20020a4a2554000000b0028f8cc17378so22818ooe.0;
        Fri, 03 Sep 2021 12:35:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jShdW3J/CocuEFlG6b5mpkubYiSnDXqp1bvV3K3m1SU=;
        b=DXc4qjNKfthKAbsUcGI4yUQ+DWfN1D2cyxD1XQyaayEa4+d1abd8lkkK5JOYh2XYb/
         bIc/LQgEKnTHhoup1dS5DF5Qd1JBk8fnRS7SQqCzp5Kxm95aKd0lRbCRPRQvVAAx1dF3
         FlpNmULEr0NC1rDlD+cJsz6m3zMfWvkws9c4R7bBLfsMTnv3g8l6lmiM3o7JHWilQW+q
         B5z3KSAWn5HDGenQTRnHmYuDOTBQLiLyMenYTGzJ1OUNNTUX2epQlZPb4vf+UGJWW0Sx
         06gj2oFw76ftofjbBbf3knuwcdk2t3KSGnxM4s/ags6ElWrEPGvPkbALq2ldBAPJGtVi
         28JQ==
X-Gm-Message-State: AOAM531vW1cmT/WHa185CFhybhcoZcuD1Egu9G1VPQkgpdyosj0SoKaY
        qksKCurTz5RiTql6YFghDA==
X-Google-Smtp-Source: ABdhPJwhrHZGJFrtpiO44ePNa4VNTi6ZAj3ACYhYjxXzzGiLk57Z9ztrNK9tBDjWt4STirQE/VXgSw==
X-Received: by 2002:a4a:e923:: with SMTP id a3mr4261300ooe.45.1630697716811;
        Fri, 03 Sep 2021 12:35:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q17sm60276otc.28.2021.09.03.12.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 12:35:16 -0700 (PDT)
Received: (nullmailer pid 3325876 invoked by uid 1000);
        Fri, 03 Sep 2021 19:35:15 -0000
Date:   Fri, 3 Sep 2021 14:35:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 24/52] dt-bindings: input: Convert Silead GSL1680
 binding to a schema
Message-ID: <YTJ480gSJDiaJq0d@robh.at.kernel.org>
References: <20210901091852.479202-1-maxime@cerno.tech>
 <20210901091852.479202-25-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210901091852.479202-25-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 01, 2021 at 11:18:24AM +0200, Maxime Ripard wrote:
> The Silead GSL1680 Touchscreen Controller is supported by Linux thanks
> to its device tree binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> 
> ---
> 
> Changes from v1:
>   - Added maximum to the number of fingers
> ---
>  .../input/touchscreen/silead,gsl1680.yaml     | 91 +++++++++++++++++++
>  .../input/touchscreen/silead_gsl1680.txt      | 44 ---------
>  2 files changed, 91 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/silead_gsl1680.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml b/Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml
> new file mode 100644
> index 000000000000..cc064696ac28
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/silead,gsl1680.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Silead GSL1680 Touchscreen Controller Device Tree Bindings
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - silead,gsl1680
> +      - silead,gsl1688
> +      - silead,gsl3670
> +      - silead,gsl3675
> +      - silead,gsl3692
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  power-gpios:
> +    maxItems: 1
> +
> +  firmware:

Should be 'firmware-name'

> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: >
> +      File basename for board specific firmware
> +
> +  silead,max-fingers:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 5
> +    description: >
> +      Maximum number of fingers the touchscreen can detect
> +
> +  silead,home-button:
> +    type: boolean
> +    description: >
> +      Does the device have a capacitive home-button build into the
> +      touchscreen?
> +
> +  avdd-supply:
> +    description: >
> +      Regulator phandle for controller AVDD
> +
> +  vddio-supply:
> +    description: >
> +      Regulator phandle for controller VDDIO
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - power-gpios
> +  - touchscreen-size-x
> +  - touchscreen-size-y
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        touchscreen@40 {
> +            compatible = "silead,gsl1680";
> +            reg = <0x40>;
> +            interrupt-parent = <&pio>;
> +            interrupts = <6 11 IRQ_TYPE_EDGE_FALLING>;
> +            power-gpios = <&pio 1 3 GPIO_ACTIVE_HIGH>;
> +            touchscreen-size-x = <480>;
> +            touchscreen-size-y = <800>;
> +            touchscreen-inverted-x;
> +            touchscreen-swapped-x-y;
> +            silead,max-fingers = <5>;
> +        };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/silead_gsl1680.txt b/Documentation/devicetree/bindings/input/touchscreen/silead_gsl1680.txt
> deleted file mode 100644
> index d67e558e5ab5..000000000000
> --- a/Documentation/devicetree/bindings/input/touchscreen/silead_gsl1680.txt
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -* GSL 1680 touchscreen controller
> -
> -Required properties:
> -- compatible		  : Must be one of the following, depending on the model:
> -			    "silead,gsl1680"
> -			    "silead,gsl1688"
> -			    "silead,gsl3670"
> -			    "silead,gsl3675"
> -			    "silead,gsl3692"
> -- reg			  : I2C slave address of the chip (0x40)
> -- interrupts		  : interrupt specification for the gsl1680 interrupt
> -- power-gpios		  : Specification for the pin connected to the gsl1680's
> -			    shutdown input. This needs to be driven high to take the
> -			    gsl1680 out of its low power state
> -- touchscreen-size-x	  : See touchscreen.txt
> -- touchscreen-size-y	  : See touchscreen.txt
> -
> -Optional properties:
> -- firmware-name		  : File basename (string) for board specific firmware
> -- touchscreen-inverted-x  : See touchscreen.txt
> -- touchscreen-inverted-y  : See touchscreen.txt
> -- touchscreen-swapped-x-y : See touchscreen.txt
> -- silead,max-fingers	  : maximum number of fingers the touchscreen can detect
> -- silead,home-button	  : Boolean, set to true on devices which have a
> -			    capacitive home-button build into the touchscreen
> -- vddio-supply		  : regulator phandle for controller VDDIO
> -- avdd-supply		  : regulator phandle for controller AVDD
> -
> -Example:
> -
> -i2c@00000000 {
> -	gsl1680: touchscreen@40 {
> -		compatible = "silead,gsl1680";
> -		reg = <0x40>;
> -		interrupt-parent = <&pio>;
> -		interrupts = <6 11 IRQ_TYPE_EDGE_FALLING>;
> -		power-gpios = <&pio 1 3 GPIO_ACTIVE_HIGH>;
> -		touchscreen-size-x = <480>;
> -		touchscreen-size-y = <800>;
> -		touchscreen-inverted-x;
> -		touchscreen-swapped-x-y;
> -		silead,max-fingers = <5>;
> -	};
> -};
> -- 
> 2.31.1
> 
> 
