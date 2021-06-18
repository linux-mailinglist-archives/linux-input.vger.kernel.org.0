Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC013AD46A
	for <lists+linux-input@lfdr.de>; Fri, 18 Jun 2021 23:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233743AbhFRVbd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Jun 2021 17:31:33 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:40650 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233111AbhFRVbd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Jun 2021 17:31:33 -0400
Received: by mail-oi1-f169.google.com with SMTP id d19so12034006oic.7;
        Fri, 18 Jun 2021 14:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TSE/H4vABi9UygtMRbiH4sc8aAV9Au2WsQguzgxJ0N0=;
        b=mmp95wGNSaNfixEVMiJgqFJ+Q459ncWU9Ro1PXNZfOCb1tJF2X7Nh9AxO1jHCInNeR
         O5LgMs1UQ9XtMAy1ii82RDh+tECQFYtJsrrLsdUI0PJN64B/r07fdjmh7j+kLSsZslxR
         WzTw8m18jC7N4oA5L63SKdk7y8BW+IKLn6fXTK36pIP/i/wmpV+SNLI5os7fEKKqlogo
         5kYQOrvBOXAQp+V9roDtf9ZWRXhenZhpGCESKL0tCSbU8V/AGiTJgYGiwOceiZMQ7vM3
         wm4KRnQmt16UCjiLhcfwgTTif9EG4NIc+a8Dk/yCt9VLhil0/GqFfTfLJpZAFN3YahpQ
         eUwQ==
X-Gm-Message-State: AOAM531uiPxUacFYw/S/BGq8TldRm4bnn/8gnq3dYvLU+t1bGUf4AFLP
        2NuS2fH3b6FHr9xzASILT2maak0cbQ==
X-Google-Smtp-Source: ABdhPJy6bKYYqLlarTbQDtBeFpgsaOuwWLkD8EUheZ9sPtb1xpzSR+k7WxVbp0IqsmDBWgkgfSglBg==
X-Received: by 2002:a54:4786:: with SMTP id o6mr8683399oic.13.1624051763163;
        Fri, 18 Jun 2021 14:29:23 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id o2sm1982475oom.26.2021.06.18.14.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 14:29:22 -0700 (PDT)
Received: (nullmailer pid 2966851 invoked by uid 1000);
        Fri, 18 Jun 2021 21:29:19 -0000
Date:   Fri, 18 Jun 2021 15:29:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Michael Welling <mwelling@ieee.org>, kernel@dh-electronics.com,
        linux-input@vger.kernel.org
Subject: Re: [PATCH V2] dt-bindings: input: tsc2005: Convert to YAML schema
Message-ID: <20210618212919.GA2957097@robh.at.kernel.org>
References: <20210610150110.29847-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610150110.29847-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 10, 2021 at 05:01:10PM +0200, Marek Vasut wrote:
> Convert the TI TSC2004/TSC2005 DT bindings to YAML schema.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Michael Welling <mwelling@ieee.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: kernel@dh-electronics.com
> Cc: linux-input@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> V2: - Switch the license to (GPL-2.0-only OR BSD-2-Clause)
> ---
>  .../input/touchscreen/ti,tsc2005.yaml         | 128 ++++++++++++++++++
>  .../bindings/input/touchscreen/tsc2005.txt    |  64 ---------
>  2 files changed, 128 insertions(+), 64 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/tsc2005.txt
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
> new file mode 100644
> index 000000000000..082c8ab00fcb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments TSC2004 and TSC2005 touchscreen controller bindings
> +
> +maintainers:
> +  - Marek Vasut <marex@denx.de>
> +  - Michael Welling <mwelling@ieee.org>
> +
> +properties:
> +  $nodename:
> +    pattern: "^touchscreen(@.*)?$"
> +
> +  compatible:
> +    oneOf:
> +      - const: "ti,tsc2004"
> +      - const: "ti,tsc2005"

enum instead and drop the quotes.

> +
> +  reg:
> +    description: |
> +      I2C address when used on the I2C bus, or the SPI chip select index
> +      when used on the SPI bus

maxItems: 1

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: GPIO specifier for the controller reset line

maxItems: 1

> +
> +  spi-max-frequency:
> +    description: TSC2005 SPI bus clock frequency.
> +    maximum: 25000000
> +
> +  ti,x-plate-ohms:
> +    description: resistance of the touchscreen's X plates in ohm (defaults to 280)
> +    $ref: /schemas/types.yaml#/definitions/uint32

Standard type, don't need $ref.

> +
> +  ti,esd-recovery-timeout-ms:
> +    description: |
> +        if the touchscreen does not respond after the configured time
> +        (in milli seconds), the driver will reset it. This is disabled
> +        by default.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Standard type.

> +
> +  vio-supply:
> +    description: Regulator specifier
> +
> +  touchscreen-fuzz-pressure: true
> +  touchscreen-fuzz-x: true
> +  touchscreen-fuzz-y: true
> +  touchscreen-max-pressure: true
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: "ti,tsc2004"

Drop quotes

> +    then:
> +      properties:
> +        spi-max-frequency: false
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        touchscreen@48 {
> +            compatible = "ti,tsc2004";
> +            reg = <0x48>;
> +            vio-supply = <&vio>;
> +
> +            reset-gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>;
> +            interrupts-extended = <&gpio1 27 IRQ_TYPE_EDGE_RISING>;
> +
> +            touchscreen-fuzz-x = <4>;
> +            touchscreen-fuzz-y = <7>;
> +            touchscreen-fuzz-pressure = <2>;
> +            touchscreen-size-x = <4096>;
> +            touchscreen-size-y = <4096>;
> +            touchscreen-max-pressure = <2048>;
> +
> +            ti,x-plate-ohms = <280>;
> +            ti,esd-recovery-timeout-ms = <8000>;
> +        };
> +    };
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        touchscreen@0 {
> +            compatible = "ti,tsc2005";
> +            spi-max-frequency = <6000000>;
> +            reg = <0>;
> +
> +            vio-supply = <&vio>;
> +
> +            reset-gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>; /* 104 */
> +            interrupts-extended = <&gpio4 4 IRQ_TYPE_EDGE_RISING>; /* 100 */
> +
> +            touchscreen-fuzz-x = <4>;
> +            touchscreen-fuzz-y = <7>;
> +            touchscreen-fuzz-pressure = <2>;
> +            touchscreen-size-x = <4096>;
> +            touchscreen-size-y = <4096>;
> +            touchscreen-max-pressure = <2048>;
> +
> +            ti,x-plate-ohms = <280>;
> +            ti,esd-recovery-timeout-ms = <8000>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/tsc2005.txt b/Documentation/devicetree/bindings/input/touchscreen/tsc2005.txt
> deleted file mode 100644
> index b80c04b0e5c0..000000000000
> --- a/Documentation/devicetree/bindings/input/touchscreen/tsc2005.txt
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -* Texas Instruments tsc2004 and tsc2005 touchscreen controllers
> -
> -Required properties:
> - - compatible		      : "ti,tsc2004" or "ti,tsc2005"
> - - reg			      : Device address
> - - interrupts		      : IRQ specifier
> - - spi-max-frequency	      : Maximum SPI clocking speed of the device
> -			        (for tsc2005)
> -
> -Optional properties:
> - - vio-supply		      : Regulator specifier
> - - reset-gpios		      : GPIO specifier for the controller reset line
> - - ti,x-plate-ohms	      : integer, resistance of the touchscreen's X plates
> -				in ohm (defaults to 280)
> - - ti,esd-recovery-timeout-ms : integer, if the touchscreen does not respond after
> -				the configured time (in milli seconds), the driver
> -				will reset it. This is disabled by default.
> - - properties defined in touchscreen.txt
> -
> -Example:
> -
> -&i2c3 {
> -	tsc2004@48 {
> -		compatible = "ti,tsc2004";
> -		reg = <0x48>;
> -		vio-supply = <&vio>;
> -
> -		reset-gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>;
> -		interrupts-extended = <&gpio1 27 IRQ_TYPE_EDGE_RISING>;
> -
> -		touchscreen-fuzz-x = <4>;
> -		touchscreen-fuzz-y = <7>;
> -		touchscreen-fuzz-pressure = <2>;
> -		touchscreen-size-x = <4096>;
> -		touchscreen-size-y = <4096>;
> -		touchscreen-max-pressure = <2048>;
> -
> -		ti,x-plate-ohms = <280>;
> -		ti,esd-recovery-timeout-ms = <8000>;
> -	};
> -}
> -
> -&mcspi1 {
> -	tsc2005@0 {
> -		compatible = "ti,tsc2005";
> -		spi-max-frequency = <6000000>;
> -		reg = <0>;
> -
> -		vio-supply = <&vio>;
> -
> -		reset-gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>; /* 104 */
> -		interrupts-extended = <&gpio4 4 IRQ_TYPE_EDGE_RISING>; /* 100 */
> -
> -		touchscreen-fuzz-x = <4>;
> -		touchscreen-fuzz-y = <7>;
> -		touchscreen-fuzz-pressure = <2>;
> -		touchscreen-size-x = <4096>;
> -		touchscreen-size-y = <4096>;
> -		touchscreen-max-pressure = <2048>;
> -
> -		ti,x-plate-ohms = <280>;
> -		ti,esd-recovery-timeout-ms = <8000>;
> -	};
> -}
> -- 
> 2.30.2
> 
> 
