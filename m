Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8471F3D426E
	for <lists+linux-input@lfdr.de>; Fri, 23 Jul 2021 23:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbhGWVLS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jul 2021 17:11:18 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:42657 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231839AbhGWVLR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 17:11:17 -0400
Received: by mail-io1-f54.google.com with SMTP id h1so4207499iol.9;
        Fri, 23 Jul 2021 14:51:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gQaCs1K6ME7V4g03U+/y+d78u0ugvNJ0brFyhSwKjIc=;
        b=LpNRzaY7rypFiHgLYk1bJKPyDLoDWwEyPkN5hq3n90tkQ/NsyHrL4Svm+sSdaL0vls
         7QpsRyw+ns8QJZE7/il9dLMH0FwxmcivBPZ+LNlgHysvKRqMdYPBfgo0qtv+HbNVoRkP
         hEomj0fXP85fw1UIhHiStdVbS4ddBPThxRAxVbm/DSxooPC+ltjR2ywDMsiZ15tmejmg
         NtOq7dXvMV2sAwo6VrCHU2ax6L2tG3/Qe8Cuf5qQITFNJD2bClEXjBf+9dvDmJ/8d6IJ
         lrTnlgGII5mt3tXvRHp9Fo5++DtC84L53XAFAU6RYhCwnHkYKAiPqr6t7dUQPCS3OPHe
         aTUQ==
X-Gm-Message-State: AOAM533GerckbIOaXixF4KxfKJNpx46pZB9e6a1tpHlt4uhgjRuAQfr/
        JOglQIHrIEnunB5hhmkpKg==
X-Google-Smtp-Source: ABdhPJwDycTllM3hLfM4q0RK+8+W4lquCTyLheWEAvxX7ZBNKnImTqsnFzisZn+Y1ubtpEEJHouBJQ==
X-Received: by 2002:a5d:88c6:: with SMTP id i6mr5523766iol.75.1627077109434;
        Fri, 23 Jul 2021 14:51:49 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x4sm4670113ilj.52.2021.07.23.14.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 14:51:48 -0700 (PDT)
Received: (nullmailer pid 2655682 invoked by uid 1000);
        Fri, 23 Jul 2021 21:51:47 -0000
Date:   Fri, 23 Jul 2021 15:51:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 19/54] dt-bindings: input: Convert Silead GSL1680 binding
 to a schema
Message-ID: <20210723215147.GA2653651@robh.at.kernel.org>
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-20-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721140424.725744-20-maxime@cerno.tech>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 21, 2021 at 04:03:49PM +0200, Maxime Ripard wrote:
> The Silead GSL1680 Touchscreen Controller is supported by Linux thanks
> to its device tree binding.
> 
> Now that we have the DT validation in place, let's convert the device
> tree bindings for that driver over to a YAML schema.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../input/touchscreen/silead,gsl1680.yaml     | 90 +++++++++++++++++++
>  .../input/touchscreen/silead_gsl1680.txt      | 44 ---------
>  2 files changed, 90 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/silead_gsl1680.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml b/Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml
> new file mode 100644
> index 000000000000..84a462ffd14b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/silead,gsl1680.yaml
> @@ -0,0 +1,90 @@
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
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: >
> +      File basename for board specific firmware
> +
> +  silead,max-fingers:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: >
> +      Maximum number of fingers the touchscreen can detect

Can it detect 2^32 fingers? Constraints needed.

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
