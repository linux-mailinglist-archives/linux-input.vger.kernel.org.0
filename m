Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E8934B8A7
	for <lists+linux-input@lfdr.de>; Sat, 27 Mar 2021 18:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbhC0R5T (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 27 Mar 2021 13:57:19 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:40866 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbhC0R4z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 27 Mar 2021 13:56:55 -0400
Received: by mail-ot1-f52.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so8313346otb.7;
        Sat, 27 Mar 2021 10:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6MGMtq81oUKsRmB4tUHE1yTtgBqJNCQ0Kg5GpCIPAZY=;
        b=d3ua4pDX1DBorTvXYge5QVCN5/fCaQs20hC2MA9fuxA9XJPsVDRRyET+B1a2SpZzlZ
         8Wqom/cxFcfEfEnNghTLAAOSdoDmwbCnG162/f57fbFXr+oBiMNE/LhChjwK90PBw2Xk
         lFRiBzXybZGhu37hhCmK2sgI5J0PDZrEF7vkJssS8Ghe3F+AVfNmw+zT7nbZefHKcl5g
         7ZFl5yAvUgfI25/oYDt1hm8fBeP/bYZphA3AGytcDBuHZh9tSj1NnODZGtP8cBX7o0+A
         g3wvLOUT0aKNLGRVQ1LgL7dRnXdni8GsgqukhA6bdW8sg3Wa0kAgpgXHqg49FP2Hmq+r
         sO4w==
X-Gm-Message-State: AOAM530bqyFmXplmGcHaCUbMd0OyI89xYVd4pbcXLXeqwfndGREIlaJE
        p0RfGNK1v/G7UZokDBHY1A==
X-Google-Smtp-Source: ABdhPJwri1rjHoGZt+kOxfRDPXtxkgJ/zOLdRassoIa/sRnpJCj3v4GYIPuisXLZWiquduGlg4PNeg==
X-Received: by 2002:a9d:20c6:: with SMTP id x64mr16247189ota.262.1616867814769;
        Sat, 27 Mar 2021 10:56:54 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.107.88])
        by smtp.gmail.com with ESMTPSA id 62sm1196477oto.60.2021.03.27.10.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 10:56:54 -0700 (PDT)
Received: (nullmailer pid 319173 invoked by uid 1000);
        Sat, 27 Mar 2021 17:56:47 -0000
Date:   Sat, 27 Mar 2021 11:56:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] Input: cyttsp - Convert bindings to YAML and extend
Message-ID: <20210327175647.GA312703@robh.at.kernel.org>
References: <20210325223520.1653715-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325223520.1653715-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 25, 2021 at 11:35:20PM +0100, Linus Walleij wrote:
> This converts the CYTTSP "Cypress TrueTouch Standard Product"
> to YAML bindings and fixes and adds some things in the process:
> 
> - Rename the bindings file to cypress,cy8ctma340 after the main
>   product in the series.
> - Add proper compatibles for the two known products:
>   CY8CTMA340 and CY8CTST341.
> - Deprecate "cypress,cyttsp-spi" and "cypress,cyttsp-i2c"
>   because device compatibles should be named after the
>   hardware and not after which bus they are connected to.
>   The topology implicitly tells us which bus it is and what
>   interface to used.
> - Add VCPIN and VDD supplies, these are present just like
>   on the CY8CTMA140.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Patch to add the new compatibles to the Linux driver is sent
> separately.
> ---
>  .../input/touchscreen/cypress,cy8ctma340.yaml | 153 ++++++++++++++++++
>  .../bindings/input/touchscreen/cyttsp.txt     |  93 -----------
>  2 files changed, 153 insertions(+), 93 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/cyttsp.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml b/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml
> new file mode 100644
> index 000000000000..063c140afbbd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml
> @@ -0,0 +1,153 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/cypress,cy8ctma340.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cypress CY8CTMA340 series touchscreen controller bindings
> +
> +description: The Cypress CY8CTMA340 series (also known as "CYTTSP" after
> +  the marketing name Cypress TrueTouch Standard Product) touchscreens can
> +  be connected to either I2C or SPI buses.
> +
> +maintainers:
> +  - Javier Martinez Canillas <javier@dowhile0.org>
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  $nodename:
> +    pattern: "^touchscreen(@.*)?$"
> +
> +  compatible:
> +    oneOf:
> +      - const: cypress,cy8ctma340
> +      - const: cypress,cy8ctst341
> +      - const: cypress,cyttsp-spi
> +        description: Legacy compatible for SPI connected CY8CTMA340
> +        deprecated: true
> +      - const: cypress,cyttsp-i2c
> +        description: Legacy compatible for I2C connected CY8CTMA340
> +        deprecated: true
> +
> +  reg:
> +    description: I2C address when used on the I2C bus, or the SPI chip
> +      select index when used on the SPI bus
> +
> +  clock-frequency:
> +    description: I2C client clock frequency, defined for host when using
> +      the device on the I2C bus
> +    minimum: 0
> +    maximum: 400000
> +
> +  spi-max-frequency:
> +    description: SPI clock frequency, defined for host, defined when using
> +      the device on the SPI bus. The throughput is maximum 2 Mbps so the
> +      typical value is 2000000, if higher rates are used the total throughput
> +      needs to be restricted to 2 Mbps.
> +    minimum: 0
> +    maximum: 6000000
> +
> +  interrupts:
> +    description: Interrupt to host, must be flagged as
> +      IRQ_TYPE_EDGE_FALLING.
> +    maxItems: 1
> +
> +  vcpin-supply:
> +    description: Analog power supply regulator on VCPIN pin
> +
> +  vdd-supply:
> +    description: Digital power supply regulator on VDD pin
> +
> +  reset-gpios:
> +    description: Reset line for the touchscreen, should be tagged
> +      as GPIO_ACTIVE_LOW
> +
> +  bootloader-key:
> +    description: the 8-byte bootloader key that is required to switch
> +      the chip from bootloader mode (default mode) to application mode
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    items:
> +      - minItems: 8
> +        maxItems: 8

Just:

minItems: 8
maxItems: 8

(no 'items')

> +
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true
> +  touchscreen-fuzz-x: true
> +  touchscreen-fuzz-y: true
> +
> +  active-distance:
> +    description: the distance in pixels beyond which a touch must move
> +      before movement is detected and reported by the device
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 15
> +
> +  active-interval-ms:
> +    description: the minimum period in ms between consecutive
> +      scanning/processing cycles when the chip is in active mode
> +    $ref: /schemas/types.yaml#/definitions/uint32

Don't need a type for standard unit suffix properties.

> +    minimum: 0
> +    maximum: 255
> +
> +  lowpower-interval-ms:
> +    description: the minimum period in ms between consecutive
> +      scanning/processing cycles when the chip is in low-power mode
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 2550
> +
> +  touch-timeout-ms:
> +    description: minimum time in ms spent in the active power state while no
> +      touches are detected before entering low-power mode
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 2550
> +
> +  use-handshake:
> +    description: enable register-based handshake (boolean). This should only
> +      be used if the chip is configured to use 'blocking communication with
> +      timeout' (in this case the device generates an interrupt at the end of
> +      every scanning/processing cycle)
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - bootloader-key
> +  - touchscreen-size-x
> +  - touchscreen-size-y
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    spi {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      num-cs = <1>;
> +      cs-gpios = <&gpio 2 GPIO_ACTIVE_HIGH>;
> +
> +      touchscreen@0 {
> +        compatible = "cypress,cy8ctma340";
> +        reg = <0>;
> +        interrupt-parent = <&gpio>;
> +        interrupts = <20 IRQ_TYPE_EDGE_FALLING>;
> +        reset-gpios = <&gpio 21 GPIO_ACTIVE_LOW>;
> +        vdd-supply = <&ldo_aux1_reg>;
> +        vcpin-supply = <&ldo_aux2_reg>;
> +        bootloader-key = /bits/ 8 <0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07>;
> +        touchscreen-size-x = <480>;
> +        touchscreen-size-y = <800>;
> +        active-interval-ms = <0>;
> +        touch-timeout-ms = <255>;
> +        lowpower-interval-ms = <10>;
> +      };
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/cyttsp.txt b/Documentation/devicetree/bindings/input/touchscreen/cyttsp.txt
> deleted file mode 100644
> index 6ee274aa8b03..000000000000
> --- a/Documentation/devicetree/bindings/input/touchscreen/cyttsp.txt
> +++ /dev/null
> @@ -1,93 +0,0 @@
> -* Cypress cyttsp touchscreen controller
> -
> -Required properties:
> - - compatible		: must be "cypress,cyttsp-i2c" or "cypress,cyttsp-spi"
> - - reg			: Device I2C address or SPI chip select number
> - - spi-max-frequency	: Maximum SPI clocking speed of the device (for cyttsp-spi)
> - - interrupts		: (gpio) interrupt to which the chip is connected
> -			  (see interrupt binding[0]).
> - - bootloader-key	: the 8-byte bootloader key that is required to switch
> -			  the chip from bootloader mode (default mode) to
> -			  application mode.
> -			  This property has to be specified as an array of 8
> -			  '/bits/ 8' values.
> -
> -Optional properties:
> - - reset-gpios		: the reset gpio the chip is connected to
> -			  (see GPIO binding[1] for more details).
> - - touchscreen-size-x	: horizontal resolution of touchscreen (in pixels)
> - - touchscreen-size-y	: vertical resolution of touchscreen (in pixels)
> - - touchscreen-fuzz-x	: horizontal noise value of the absolute input device
> -			  (in pixels)
> - - touchscreen-fuzz-y	: vertical noise value of the absolute input device
> -			  (in pixels)
> - - active-distance	: the distance in pixels beyond which a touch must move
> -			  before movement is detected and reported by the device.
> -			  Valid values: 0-15.
> - - active-interval-ms	: the minimum period in ms between consecutive
> -			  scanning/processing cycles when the chip is in active mode.
> -			  Valid values: 0-255.
> - - lowpower-interval-ms	: the minimum period in ms between consecutive
> -			  scanning/processing cycles when the chip is in low-power mode.
> -			  Valid values: 0-2550
> - - touch-timeout-ms	: minimum time in ms spent in the active power state while no
> -			  touches are detected before entering low-power mode.
> -			  Valid values: 0-2550
> - - use-handshake	: enable register-based handshake (boolean). This should
> -			  only be used if the chip is configured to use 'blocking
> -			  communication with timeout' (in this case the device
> -			  generates an interrupt at the end of every
> -			  scanning/processing cycle).
> -
> -[0]: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
> -[1]: Documentation/devicetree/bindings/gpio/gpio.txt
> -
> -Example:
> -	&i2c1 {
> -		/* ... */
> -		cyttsp@a {
> -			compatible = "cypress,cyttsp-i2c";
> -			reg = <0xa>;
> -			interrupt-parent = <&gpio0>;
> -			interrupts = <28 0>;
> -			reset-gpios = <&gpio3 4 GPIO_ACTIVE_LOW>;
> -
> -			touchscreen-size-x = <800>;
> -			touchscreen-size-y = <480>;
> -			touchscreen-fuzz-x = <4>;
> -			touchscreen-fuzz-y = <7>;
> -
> -			bootloader-key = /bits/ 8 <0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08>;
> -			active-distance = <8>;
> -			active-interval-ms = <0>;
> -			lowpower-interval-ms = <200>;
> -			touch-timeout-ms = <100>;
> -		};
> -
> -		/* ... */
> -	};
> -
> -	&mcspi1 {
> -		/* ... */
> -		cyttsp@0 {
> -			compatible = "cypress,cyttsp-spi";
> -			spi-max-frequency = <6000000>;
> -			reg = <0>;
> -			interrupt-parent = <&gpio0>;
> -			interrupts = <28 0>;
> -			reset-gpios = <&gpio3 4 GPIO_ACTIVE_LOW>;
> -
> -			touchscreen-size-x = <800>;
> -			touchscreen-size-y = <480>;
> -			touchscreen-fuzz-x = <4>;
> -			touchscreen-fuzz-y = <7>;
> -
> -			bootloader-key = /bits/ 8 <0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08>;
> -			active-distance = <8>;
> -			active-interval-ms = <0>;
> -			lowpower-interval-ms = <200>;
> -			touch-timeout-ms = <100>;
> -		};
> -
> -		/* ... */
> -	};
> -- 
> 2.29.2
> 
