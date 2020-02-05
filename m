Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C40E15373A
	for <lists+linux-input@lfdr.de>; Wed,  5 Feb 2020 19:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbgBESFs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Feb 2020 13:05:48 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33189 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727165AbgBESFr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Feb 2020 13:05:47 -0500
Received: by mail-wm1-f66.google.com with SMTP id m10so5040185wmc.0;
        Wed, 05 Feb 2020 10:05:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=FZOU06M79finD+fU3WNGe7T/3QL5sfF3MsjTs4VkFJE=;
        b=s3PGN6GerbypSsqh0wJBF5n6oO1ERyiTDtTpWYfBvCS31NzXnSi0JlRUl1Wg9EoLeD
         Oe3yW4lloGPs9ngkuspLX9z9tcuxP+YxCNg/F17NYIyS0BaTboDAGIZz4ddylnVjFuYW
         zOjGoz4OUOCFTZIL//DqlYfKxkmtyAdeNRYPJtqsaLxkWU49K8jtBoRPzvkG+uUx9eMI
         lH2263MzCOojKeOkGBqMjO0l4z0S54JKKIp2B8/sYNOKpnf+SWLkyh6ROrtW1/MwmsbV
         90/TVyT/q06GQZwDD0JFW2hX43mQKsrTxUaPRr9YkyvVocXVPGC8ykFFS7olPQKAGWyc
         gN7g==
X-Gm-Message-State: APjAAAXrj8gVCJG1AQ8aEgWpfsAnN28uEyjWjicmB7STHQQAd9kQAQje
        sMuoMmfgMo7Y0RPelq/Jfw==
X-Google-Smtp-Source: APXvYqz3iUZKUFoM97RiyABU2uwE3KCT0W91mkdoaabYm6ZBikzV+mx2rNYeTJ4+0voYyyYemLCa6A==
X-Received: by 2002:a7b:c14d:: with SMTP id z13mr7203058wmi.71.1580925942959;
        Wed, 05 Feb 2020 10:05:42 -0800 (PST)
Received: from rob-hp-laptop ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id d13sm769648wrc.3.2020.02.05.10.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 10:05:42 -0800 (PST)
Received: (nullmailer pid 23862 invoked by uid 1000);
        Wed, 05 Feb 2020 18:05:40 -0000
Date:   Wed, 5 Feb 2020 18:05:40 +0000
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     dmitry.torokhov@gmail.com, mark.rutland@arm.com, megous@megous.com,
        mylene.josserand@bootlin.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: touchscreen: Convert edt-ft5x06 to
 json-schema
Message-ID: <20200205180540.GA30370@bogus>
References: <20200128101455.4635-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200128101455.4635-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 28, 2020 at 11:14:55AM +0100, Benjamin Gaignard wrote:
> Convert the EDT-FT5x06 to DT schema using json-schema.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  .../bindings/input/touchscreen/edt-ft5x06.txt      |  75 -------------
>  .../bindings/input/touchscreen/edt-ft5x06.yaml     | 119 +++++++++++++++++++++
>  2 files changed, 119 insertions(+), 75 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> deleted file mode 100644
> index 0f6950073d6f..000000000000
> --- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
> +++ /dev/null
> @@ -1,75 +0,0 @@
> -FocalTech EDT-FT5x06 Polytouch driver
> -=====================================
> -
> -There are 5 variants of the chip for various touch panel sizes
> -FT5206GE1  2.8" .. 3.8"
> -FT5306DE4  4.3" .. 7"
> -FT5406EE8  7"   .. 8.9"
> -FT5506EEG  7"   .. 8.9"
> -FT5726NEI  5.7” .. 11.6"
> -
> -The software interface is identical for all those chips, so that
> -currently there is no need for the driver to distinguish between the
> -different chips. Nevertheless distinct compatible strings are used so
> -that a distinction can be added if necessary without changing the DT
> -bindings.
> -
> -
> -Required properties:
> - - compatible:  "edt,edt-ft5206"
> -           or:  "edt,edt-ft5306"
> -           or:  "edt,edt-ft5406"
> -           or:  "edt,edt-ft5506"
> -           or:  "evervision,ev-ft5726"
> -           or:  "focaltech,ft6236"
> -
> - - reg:         I2C slave address of the chip (0x38)
> - - interrupts:       interrupt specification for the touchdetect
> -                     interrupt
> -
> -Optional properties:
> - - reset-gpios: GPIO specification for the RESET input
> - - wake-gpios:  GPIO specification for the WAKE input
> - - vcc-supply:  Regulator that supplies the touchscreen
> -
> - - pinctrl-names: should be "default"
> - - pinctrl-0:   a phandle pointing to the pin settings for the
> -                control gpios
> -
> - - threshold:   allows setting the "click"-threshold in the range
> -                from 0 to 80.
> -
> - - gain:        allows setting the sensitivity in the range from 0 to
> -                31. Note that lower values indicate higher
> -                sensitivity.
> -
> - - offset:      allows setting the edge compensation in the range from
> -                0 to 31.
> -
> - - offset-x:    Same as offset, but applies only to the horizontal position.
> -                Range from 0 to 80, only supported by evervision,ev-ft5726
> -                devices.
> -
> - - offset-y:    Same as offset, but applies only to the vertical position.
> -                Range from 0 to 80, only supported by evervision,ev-ft5726
> -                devices.
> -
> - - touchscreen-size-x	   : See touchscreen.txt
> - - touchscreen-size-y	   : See touchscreen.txt
> - - touchscreen-fuzz-x      : See touchscreen.txt
> - - touchscreen-fuzz-y      : See touchscreen.txt
> - - touchscreen-inverted-x  : See touchscreen.txt
> - - touchscreen-inverted-y  : See touchscreen.txt
> - - touchscreen-swapped-x-y : See touchscreen.txt
> -
> -Example:
> -	polytouch: edt-ft5x06@38 {
> -		compatible = "edt,edt-ft5406", "edt,edt-ft5x06";
> -		reg = <0x38>;
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&edt_ft5x06_pins>;
> -		interrupt-parent = <&gpio2>;
> -		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
> -		reset-gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
> -		wake-gpios = <&gpio4 9 GPIO_ACTIVE_HIGH>;
> -	};
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> new file mode 100644
> index 000000000000..178b7aea0f83
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/edt-ft5x06.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: FocalTech EDT-FT5x06 Polytouch Bindings
> +
> +description: There are 5 variants of the chip for various touch panel sizes
> +             FT5206GE1  2.8" .. 3.8"
> +             FT5306DE4  4.3" .. 7"
> +             FT5406EE8  7"   .. 8.9"
> +             FT5506EEG  7"   .. 8.9"
> +             FT5726NEI  5.7” .. 11.6"

This needs a '|' to preserve formatting. (Running this into python and 
back out to yaml would clobber it.) 

> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +  - if:
> +     properties:
> +       compatible:
> +         contains:
> +           enum:
> +             - evervision,ev-ft5726
> +
> +    then:
> +      properties:
> +        offset-x: true
> +        offset-y: true
> +
> +properties:
> +  compatible:
> +    enum:
> +      - edt,edt-ft5206
> +      - edt,edt-ft5306
> +      - edt,edt-ft5406
> +      - edt,edt-ft5506
> +      - evervision,ev-ft5726
> +      - focaltech,ft6236
> +
> +  reg:
> +    enum: [ 0x38 ]

const: 0x38

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  wake-gpios:
> +    maxItems: 1
> +
> +  vcc-supply:
> +    maxItems: 1
> +
> +  gain:
> +    description: Allows setting the sensitivity in the range from 0 to 31.
> +                 Note that lower values indicate higher sensitivity.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Needs to be under an 'allOf' or minimum/maximum will be ignored.

And the others here...

> +    minimum: 0
> +    maximum: 31
> +
> +  offset:
> +    description: Allows setting the edge compensation in the range from 0 to 31.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 31
> +
> +  offset-x:
> +    description: Same as offset, but applies only to the horizontal position.
> +                 Range from 0 to 80, only supported by evervision,ev-ft5726 devices.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 80
> +
> +  offset-y:
> +    description: Same as offset, but applies only to the vertical position.
> +                 Range from 0 to 80, only supported by evervision,ev-ft5726 devices.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 80
> +
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true
> +  touchscreen-fuzz-x: true
> +  touchscreen-fuzz-y: true
> +  touchscreen-inverted-x: true
> +  touchscreen-inverted-y: true
> +  touchscreen-swapped-x-y: true
> +  interrupt-controller: true
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
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c@00000000 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      edt-ft5x06@38 {
> +        compatible = "edt,edt-ft5406";
> +        reg = <0x38>;
> +        interrupt-parent = <&gpio2>;
> +        interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
> +        reset-gpios = <&gpio2 6 GPIO_ACTIVE_LOW>;
> +        wake-gpios = <&gpio4 9 GPIO_ACTIVE_HIGH>;
> +      };
> +    };
> +
> +...
> +
> -- 
> 2.15.0
> 
