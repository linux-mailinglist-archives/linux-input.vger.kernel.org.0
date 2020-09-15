Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C96D26B124
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 00:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727810AbgIOWZA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Sep 2020 18:25:00 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:36670 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727660AbgIOQWn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Sep 2020 12:22:43 -0400
Received: by mail-io1-f68.google.com with SMTP id d190so4749683iof.3;
        Tue, 15 Sep 2020 09:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CgawolyD9zVzGxxq1UzJo1cnh/iauTPw1X6bRSSjqk4=;
        b=KLbBFt4UZGqt+C7ycirqP9ZLsKddZM2unWEOpgI187Z5Nted3z1FbrAq37PXWpdJAy
         r/BatKnX8+YXiRPjlyezRuCg/7iPRd6X1c6ZSZU1DaLLyiRFDLmJ/7BN/mu0dDPO2xlS
         fbQ5X/a8vOXlXJ+pU9N2WiXsTWYE/ej/Eg8mVQzEIXhpVuAIrIC1q/NZyvl1381ouS40
         rfGqEseO/MUmzpK+FOW778VMM9Z8JiQzq/uAlAE+8FH0Azpk2c/+ArwcMPTdRD3H2cdQ
         y59cDOd1S05KfzFR1MYbTQhmkHVxiccUk5birZwl5SoGYzRG2Gv+gSEsXxIAytWow8KW
         2bPw==
X-Gm-Message-State: AOAM5326m0RhbEEs8+vK6Cg4RkFONSkQeflXX0EhjzRAMOkkjaWKOEXO
        hrZio62J1i8yRMwL0W4juw==
X-Google-Smtp-Source: ABdhPJyKRZCoEn6bBIzBr2ZjMeQQ5C6T/2Zw8N4qzXWUmrhNhOtb/fFpQcN6SIk+s4X1gbqkEJr3Dg==
X-Received: by 2002:a6b:660b:: with SMTP id a11mr15409011ioc.144.1600186962053;
        Tue, 15 Sep 2020 09:22:42 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id h2sm7850765ioj.5.2020.09.15.09.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 09:22:41 -0700 (PDT)
Received: (nullmailer pid 2063320 invoked by uid 1000);
        Tue, 15 Sep 2020 16:22:39 -0000
Date:   Tue, 15 Sep 2020 10:22:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?iso-8859-1?Q?Myl=E8ne?= Josserand 
        <mylene.josserand@collabora.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCHv2 1/4] dt-bindings: input: Convert rotary-encoder
 bindings to schema
Message-ID: <20200915162239.GA2053332@bogus>
References: <20200907204045.95530-1-sebastian.reichel@collabora.com>
 <20200907204045.95530-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907204045.95530-2-sebastian.reichel@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 07, 2020 at 10:40:42PM +0200, Sebastian Reichel wrote:
> Convert rotary-encoder bindings to YAML schema.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/input/rotary-encoder.txt         |  50 ---------
>  .../bindings/input/rotary-encoder.yaml        | 100 ++++++++++++++++++
>  2 files changed, 100 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/rotary-encoder.txt
>  create mode 100644 Documentation/devicetree/bindings/input/rotary-encoder.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/rotary-encoder.txt b/Documentation/devicetree/bindings/input/rotary-encoder.txt
> deleted file mode 100644
> index a644408b33b8..000000000000
> --- a/Documentation/devicetree/bindings/input/rotary-encoder.txt
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -Rotary encoder DT bindings
> -
> -Required properties:
> -- gpios: a spec for at least two GPIOs to be used, most significant first
> -
> -Optional properties:
> -- linux,axis: the input subsystem axis to map to this rotary encoder.
> -  Defaults to 0 (ABS_X / REL_X)
> -- rotary-encoder,steps: Number of steps in a full turnaround of the
> -  encoder. Only relevant for absolute axis. Defaults to 24 which is a
> -  typical value for such devices.
> -- rotary-encoder,relative-axis: register a relative axis rather than an
> -  absolute one. Relative axis will only generate +1/-1 events on the input
> -  device, hence no steps need to be passed.
> -- rotary-encoder,rollover: Automatic rollover when the rotary value becomes
> -  greater than the specified steps or smaller than 0. For absolute axis only.
> -- rotary-encoder,steps-per-period: Number of steps (stable states) per period.
> -  The values have the following meaning:
> -  1: Full-period mode (default)
> -  2: Half-period mode
> -  4: Quarter-period mode
> -- wakeup-source: Boolean, rotary encoder can wake up the system.
> -- rotary-encoder,encoding: String, the method used to encode steps.
> -  Supported are "gray" (the default and more common) and "binary".
> -
> -Deprecated properties:
> -- rotary-encoder,half-period: Makes the driver work on half-period mode.
> -  This property is deprecated. Instead, a 'steps-per-period ' value should
> -  be used, such as "rotary-encoder,steps-per-period = <2>".
> -
> -See Documentation/input/devices/rotary-encoder.rst for more information.
> -
> -Example:
> -
> -		rotary@0 {
> -			compatible = "rotary-encoder";
> -			gpios = <&gpio 19 1>, <&gpio 20 0>; /* GPIO19 is inverted */
> -			linux,axis = <0>; /* REL_X */
> -			rotary-encoder,encoding = "gray";
> -			rotary-encoder,relative-axis;
> -		};
> -
> -		rotary@1 {
> -			compatible = "rotary-encoder";
> -			gpios = <&gpio 21 0>, <&gpio 22 0>;
> -			linux,axis = <1>; /* ABS_Y */
> -			rotary-encoder,steps = <24>;
> -			rotary-encoder,encoding = "binary";
> -			rotary-encoder,rollover;
> -		};
> diff --git a/Documentation/devicetree/bindings/input/rotary-encoder.yaml b/Documentation/devicetree/bindings/input/rotary-encoder.yaml
> new file mode 100644
> index 000000000000..5b60ea86bd62
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/rotary-encoder.yaml
> @@ -0,0 +1,100 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/rotary-encoder.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Rotary Encoder
> +
> +maintainers:
> +  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
> +
> +description:
> +  See Documentation/input/devices/rotary-encoder.rst for more information.
> +
> +properties:
> +  compatible:
> +    const: rotary-encoder
> +
> +  gpios:
> +    minItems: 2

You need to specify maxItems too. A 'should be enough for everyone'TM 
value is fine here if there's no real max.

> +    description: GPIOs for the rotation signals, most significant first
> +
> +  linux,axis:
> +    description:
> +      The input subsystem axis to map to this rotary encoder.
> +      Defaults to (ABS_X / REL_X).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 0
> +
> +  rotary-encoder,rollover:
> +    description:
> +      Automatic rollover when the rotary value becomes greater than the
> +      specified steps or smaller than 0. For absolute axis only.
> +    type: boolean
> +
> +  rotary-encoder,steps-per-period:
> +    description: The values have the following meaning
> +      1 - Full-period mode
> +      2 - Half-period mode
> +      4 - Quarter-period mode

You need a '|' after 'descripton' to preserve formatting here.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [1, 2, 4]
> +    default: 1
> +
> +  wakeup-source:
> +    description: Rotary encoder can wake up the system.
> +    type: boolean
> +
> +  rotary-encoder,encoding:
> +    description:
> +      Method used to encode steps. Gray code is more common.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    enum: ["gray", "binary"]
> +    default: "gray"

Don't need quotes.

> +
> +  rotary-encoder,half-period:
> +    description:
> +      Deprecated, use "rotary-encoder,steps-per-period = <2>" instead.
> +    type: boolean
> +    deprecated: True
> +
> +  rotary-encoder,steps:
> +    description:
> +      Number of steps in a full turnaround of the encoder. Only relevant
> +      for absolute axis. Defaults to 24 which is a typical value for such
> +      devices.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 24
> +
> +  rotary-encoder,relative-axis:
> +    description:
> +      register a relative axis rather than an absolute one. Relative axis
> +      will only generate +1/-1 events on the input device, hence no steps
> +      need to be passed.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include "dt-bindings/gpio/gpio.h"
> +    #include "dt-bindings/input/input.h"
> +    rotary-encoder0 {
> +            compatible = "rotary-encoder";
> +            gpios = <&gpio 19 GPIO_ACTIVE_LOW>, <&gpio 20 GPIO_ACTIVE_HIGH>;
> +            linux,axis = <REL_X>;
> +            rotary-encoder,encoding = "gray";
> +            rotary-encoder,relative-axis;
> +    };
> +    rotary-encoder1 {
> +            compatible = "rotary-encoder";
> +            gpios = <&gpio 21 GPIO_ACTIVE_HIGH>, <&gpio 22 GPIO_ACTIVE_HIGH>;
> +            linux,axis = <ABS_Y>;
> +            rotary-encoder,encoding = "binary";
> +            rotary-encoder,rollover;
> +    };
> -- 
> 2.28.0
> 
