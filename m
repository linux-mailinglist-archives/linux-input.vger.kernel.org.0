Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB3BA43415B
	for <lists+linux-input@lfdr.de>; Wed, 20 Oct 2021 00:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbhJSWaV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Oct 2021 18:30:21 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:38696 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhJSWaT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Oct 2021 18:30:19 -0400
Received: by mail-ot1-f53.google.com with SMTP id l10-20020a056830154a00b00552b74d629aso4657777otp.5;
        Tue, 19 Oct 2021 15:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6tlw2JHuRs959b8bUjloqDgZPEr8weef1vhq8x/Zt8I=;
        b=2hO/m7FanEOUwhcRdHxYL4/WqkXzF+xvaCa1QIRrBH84Vn1ZuF8dy37Fm3sWSms1n2
         f4ZMQrhFSJu1oSfn1jq5FZ6pZAt41ESkSV+t8/ZKImWFgX5mhGSbswPVpAsPwt4P9qRJ
         ItXaW9ocatUp+Qj9Ppe/xTgaqsQnljgfvHQIyMb2wBYsEoU90NHEke8pFucZbEzj1wRN
         2hP08z7TelHo59MdHlxsfu6Xt6HLBU3VFHJhBeqtSORH9CqMj+dt7CF2mYDj3pPkuYY+
         D71fPPkSXGC1PVzmmIkMMdjUy6aoiRblDDyG5H6FcroPJamyI5icVv61VeDw8+CYeDJj
         +2Dg==
X-Gm-Message-State: AOAM530FRy4RnM8ydWTh6KQmStwWrbIBasxY/4KtvoweLysOxQN4ohTW
        1qZwXWU2yn/BLCFHBJQHdw==
X-Google-Smtp-Source: ABdhPJzXFXQWYBW+DDqhb26qLSfRzUxD5SbG/98PQ8XnWY0w78wqbvjkNUiZLx3eeWqkWv3c0dFHJw==
X-Received: by 2002:a9d:1b4d:: with SMTP id l71mr7551415otl.188.1634682485304;
        Tue, 19 Oct 2021 15:28:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o14sm83798oos.11.2021.10.19.15.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 15:28:04 -0700 (PDT)
Received: (nullmailer pid 940419 invoked by uid 1000);
        Tue, 19 Oct 2021 22:28:04 -0000
Date:   Tue, 19 Oct 2021 17:28:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~okias/devicetree@lists.sr.ht
Subject: Re: [PATCH] WIP: dt-bindings: input: microchip,cap11xx: Convert txt
 bindings to yaml
Message-ID: <YW9GdDq4uUXNd07h@robh.at.kernel.org>
References: <20211009105922.48835-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211009105922.48835-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Oct 09, 2021 at 12:59:22PM +0200, David Heidelberg wrote:
> Convert binding for the Microchip CAP11xx series HW to the YAML syntax.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/input/cap11xx.txt     |  78 ----------
>  .../bindings/input/microchip,cap11xx.yaml     | 146 ++++++++++++++++++
>  2 files changed, 146 insertions(+), 78 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/cap11xx.txt
>  create mode 100644 Documentation/devicetree/bindings/input/microchip,cap11xx.yaml


> diff --git a/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> new file mode 100644
> index 000000000000..89079c019794
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/microchip,cap11xx.yaml
> @@ -0,0 +1,146 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/input/microchip,cap11xx.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Device tree bindings for Microchip CAP11xx based capacitive touch sensors
> +
> +description: |
> +  The Microchip CAP1xxx Family of RightTouchTM multiple-channel capacitive
> +  touch controllers and LED drivers. The device communication via I2C only.
> +
> +maintainers:
> +  - Rob Herring <robh+dt@kernel.org>

robh@kernel.org

But why isn't this the author of the binding or driver.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - microchip,cap1106
> +      - microchip,cap1126
> +      - microchip,cap1188
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1

blank line

> +  '#size-cells':
> +    const: 0
> +
> +  interrupts:
> +    maxItems: 1
> +    description: |
> +      Property describing the interrupt line the
> +      device's ALERT#/CM_IRQ# pin is connected to.
> +      The device only has one interrupt source.
> +
> +  autorepeat:
> +    description: |
> +      Enables the Linux input system's autorepeat feature on the input device.
> +
> +  linux,keycodes:
> +    minItems: 6
> +    maxItems: 6
> +    description: |
> +      Specifies an array of numeric keycode values to
> +      be used for the channels. If this property is
> +      omitted, KEY_A, KEY_B, etc are used as defaults.
> +      The array must have exactly six entries.
> +
> +  microchip,sensor-gain:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    default: 1
> +    enum: [1, 2, 4, 8]
> +    description: |
> +      Defines the gain of the sensor circuitry. This
> +      effectively controls the sensitivity, as a
> +      smaller delta capacitance is required to
> +      generate the same delta count values.
> +
> +  microchip,irq-active-high:
> +    type: boolean
> +    description: |
> +      By default the interrupt pin is active low
> +      open drain. This property allows using the active
> +      high push-pull output.
> +
> +patternProperties:
> +  "^led@[0-7]$":
> +    type: object
> +    description: CAP11xx LEDs
> +    $ref: ../leds/common.yaml#

/schemas/leds/common.yaml#

> +
> +    properties:
> +      reg:
> +        enum: [0, 1, 2, 3, 4, 5, 6, 7]
> +
> +      label: true
> +
> +      linux,default-trigger: true
> +
> +      default-state: true
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +allOf:

     - $ref: input.yaml#

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - microchip,cap1106
> +    then:
> +      patternProperties:
> +        "^led@[0-7]$": false
> +
> +required:
> +  - compatible
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      cap1188@28 {
> +        compatible = "microchip,cap1188";
> +        interrupt-parent = <&gpio1>;
> +        interrupts = <0 0>;
> +        reg = <0x28>;
> +        autorepeat;
> +        microchip,sensor-gain = <2>;
> +
> +        linux,keycodes = <103>,	/* KEY_UP */
> +                         <106>,	/* KEY_RIGHT */
> +                         <108>,	/* KEY_DOWN */
> +                         <105>,	/* KEY_LEFT */
> +                         <109>,	/* KEY_PAGEDOWN */
> +                         <104>;	/* KEY_PAGEUP */
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        led@0 {
> +                label = "cap11xx:green:usr0";
> +                reg = <0>;
> +        };
> +
> +        led@1 {
> +                label = "cap11xx:green:usr1";
> +                reg = <1>;
> +        };
> +
> +        led@2 {
> +                label = "cap11xx:green:alive";
> +                reg = <2>;
> +                linux,default-trigger = "heartbeat";
> +        };
> +      };
> +    };
> -- 
> 2.33.0
> 
> 
