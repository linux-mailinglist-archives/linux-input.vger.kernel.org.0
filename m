Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3720C1BFFBD
	for <lists+linux-input@lfdr.de>; Thu, 30 Apr 2020 17:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgD3PLN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Apr 2020 11:11:13 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:46272 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726453AbgD3PLN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Apr 2020 11:11:13 -0400
Received: by mail-oi1-f196.google.com with SMTP id c124so1959136oib.13;
        Thu, 30 Apr 2020 08:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0R3AmjtaU8yzqrZuOGWM3CfwillDw4Ncon00RNPhQ90=;
        b=YX/3u396+DCqPPSZTuPrt7dcLY8j4O5fFhyMIBlN0MiSG3dO5kOMAxsKhZuFO74s4O
         wFrTXEA/xfaLHibVtrfgPM19eZ9xJrlxnG3agBrzGSVsTYsYosh8Ptpi9DSeokhlm7ma
         jjIFfOsmsmJvRWRZA6y6X0XXYIvNmfpsRp+IVygkxAyBcoN7G0LkY0+rLRaEdlNBN0/E
         yra1OgjxGFrN1mXaxgnxsyJD3GdvxwKTsiFwX0/zykeVKH3525WfjzaGTRxQ3PO+O9VQ
         NVl9MSyp1m26JVYCkFcJsOeWjSmRmLFH3xrPJnvFABKYIhAJRPIoMPavJI2fzn8l1rFj
         ws9Q==
X-Gm-Message-State: AGi0PuaumM8iZp+IbFJ/dnCvucLy+qM9o3GZx8k2fwVeGrdbzQDGScPb
        H6BaAIZEWK2ULB0KYDziF1aKa2E=
X-Google-Smtp-Source: APiQypIwusbS6DRitnfC7QwZNycHxV/KpvbN7198TjsMcJ+Dbk0OQUsizCNwiA29Sa4Dn6qNCFcQrA==
X-Received: by 2002:a54:4510:: with SMTP id l16mr1975414oil.151.1588259470273;
        Thu, 30 Apr 2020 08:11:10 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v14sm1359275ooe.10.2020.04.30.08.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 08:11:09 -0700 (PDT)
Received: (nullmailer pid 9376 invoked by uid 1000);
        Thu, 30 Apr 2020 15:11:08 -0000
Date:   Thu, 30 Apr 2020 10:11:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: Add bindings for Azoteq IQS269A
Message-ID: <20200430151108.GA21911@bogus>
References: <1587340068-2818-1-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587340068-2818-1-git-send-email-jeff@labundy.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 19, 2020 at 06:47:47PM -0500, Jeff LaBundy wrote:
> This patch adds device tree bindings for the Azoteq IQS269A
> capacitive touch controller.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
>  .../devicetree/bindings/input/iqs269a.yaml         | 591 +++++++++++++++++++++
>  1 file changed, 591 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/iqs269a.yaml

Kind of a lot of properties compared to other devices. Why so many? That 
said, nothing looks to be obviously something that doesn't belong in DT.

No interdependencies between properties? If there are, use 
'dependencies'.

One other comment below.

> 
> diff --git a/Documentation/devicetree/bindings/input/iqs269a.yaml b/Documentation/devicetree/bindings/input/iqs269a.yaml
> new file mode 100644
> index 0000000..7f4fcdc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/iqs269a.yaml
> @@ -0,0 +1,591 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/iqs269a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Azoteq IQS269A Capacitive Touch Controller
> +
> +maintainers:
> +  - Jeff LaBundy <jeff@labundy.com>
> +
> +description: |
> +  The Azoteq IQS269A is an 8-channel capacitive touch controller that features
> +  additional Hall-effect and inductive sensing capabilities.
> +
> +  Link to datasheet: https://www.azoteq.com/
> +
> +properties:
> +  compatible:
> +    const: azoteq,iqs269a
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  azoteq,hall-enable:
> +    type: boolean
> +    description:
> +      Enables Hall-effect sensing on channels 6 and 7. In this case, keycodes
> +      assigned to channel 6 are ignored and keycodes assigned to channel 7 are
> +      interpreted as switch codes. Refer to the datasheet for requirements im-
> +      posed on channels 6 and 7 by Hall-effect sensing.
> +
> +  azoteq,suspend-mode:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [0, 1, 2, 3]
> +        default: 0
> +    description: |
> +      Specifies the power mode during suspend as follows:
> +      0: Automatic (same as normal runtime, i.e. suspend/resume disabled)
> +      1: Low power (all sensing at a reduced reporting rate)
> +      2: Ultra-low power (channel 0 proximity sensing)
> +      3: Halt (no sensing)
> +
> +  azoteq,clk-div:
> +    type: boolean
> +    description: Divides the device's core clock by a factor of 4.
> +
> +  azoteq,ulp-update:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +        maximum: 7
> +        default: 3
> +    description: Specifies the ultra-low-power mode update rate.
> +
> +  azoteq,reseed-offset:
> +    type: boolean
> +    description:
> +      Applies an 8-count offset to all long-term averages upon either ATI or
> +      reseed events.
> +
> +  azoteq,filt-str-lp-lta:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [0, 1, 2, 3]
> +        default: 0
> +    description:
> +      Specifies the long-term average filter strength during low-power mode.
> +
> +  azoteq,filt-str-lp-cnt:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [0, 1, 2, 3]
> +        default: 0
> +    description:
> +      Specifies the raw count filter strength during low-power mode.
> +
> +  azoteq,filt-str-np-lta:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [0, 1, 2, 3]
> +        default: 0
> +    description:
> +      Specifies the long-term average filter strength during normal-power mode.
> +
> +  azoteq,filt-str-np-cnt:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [0, 1, 2, 3]
> +        default: 0
> +    description:
> +      Specifies the raw count filter strength during normal-power mode.
> +
> +  azoteq,rate-np-ms:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32

With a unit suffix, you can drop the type $ref.

> +      - minimum: 0
> +        maximum: 255
> +        default: 16
> +    description: Specifies the report rate (in ms) during normal-power mode.
> +
> +  azoteq,rate-lp-ms:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +        maximum: 255
> +        default: 160
> +    description: Specifies the report rate (in ms) during low-power mode.
> +
> +  azoteq,rate-ulp-ms:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - multipleOf: 16
> +        minimum: 0
> +        maximum: 4080
> +        default: 160
> +    description: Specifies the report rate (in ms) during ultra-low-power mode.
> +
> +  azoteq,timeout-pwr-ms:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - multipleOf: 512
> +        minimum: 0
> +        maximum: 130560
> +        default: 2560
> +    description:
> +      Specifies the length of time (in ms) to wait for an event during normal-
> +      power mode before transitioning to low-power mode.
> +
> +  azoteq,timeout-lta-ms:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - multipleOf: 512
> +        minimum: 0
> +        maximum: 130560
> +        default: 32768
> +    description:
> +      Specifies the length of time (in ms) to wait before resetting the long-
> +      term average of all channels. Specify the maximum timeout to disable it
> +      altogether.
> +
> +  azoteq,ati-band-disable:
> +    type: boolean
> +    description: Disables the ATI band check.
> +
> +  azoteq,ati-lp-only:
> +    type: boolean
> +    description: Limits automatic ATI to low-power mode.
> +
> +  azoteq,ati-band-tighten:
> +    type: boolean
> +    description: Tightens the ATI band from 1/8 to 1/16 of the desired target.
> +
> +  azoteq,filt-disable:
> +    type: boolean
> +    description: Disables all raw count filtering.
> +
> +  azoteq,gpio3-select:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +        maximum: 7
> +        default: 0
> +    description:
> +      Selects the channel for which the GPIO3 pin represents touch state.
> +
> +  azoteq,dual-direction:
> +    type: boolean
> +    description:
> +      Specifies that long-term averages are to freeze in the presence of either
> +      increasing or decreasing counts, thereby permitting events to be reported
> +      in either direction.
> +
> +  azoteq,tx-freq:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [0, 1, 2, 3]
> +        default: 0
> +    description: |
> +      Specifies the inductive sensing excitation frequency as follows (paren-
> +      thesized numbers represent the frequency if 'azoteq,clk-div' is present):
> +      0: 16 MHz (4 MHz)
> +      1: 8 MHz (2 MHz)
> +      2: 4 MHz (1 MHz)
> +      3: 2 MHz (500 kHz)
> +
> +  azoteq,global-cap-increase:
> +    type: boolean
> +    description: Increases the global capacitance adder from 0.5 pF to 1.5 pF.
> +
> +  azoteq,reseed-select:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [0, 1, 2, 3]
> +        default: 0
> +    description: |
> +      Specifies the event(s) that prompt the device to reseed (i.e. reset the
> +      long-term average) of an associated channel as follows:
> +      0: None
> +      1: Proximity
> +      2: Proximity or touch
> +      3: Proximity, touch or deep touch
> +
> +  azoteq,tracking-enable:
> +    type: boolean
> +    description:
> +      Enables all associated channels to track their respective reference
> +      channels.
> +
> +  azoteq,filt-str-slider:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [0, 1, 2, 3]
> +        default: 1
> +    description: Specifies the slider coordinate filter strength.
> +
> +patternProperties:
> +  "^channel@[0-7]$":
> +    type: object
> +    description:
> +      Represents a single sensing channel. A channel is active if defined and
> +      inactive otherwise.
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 7
> +        description: Index of the channel.
> +
> +      azoteq,reseed-disable:
> +        type: boolean
> +        description:
> +          Prevents the channel from being reseeded if the long-term average
> +          timeout (defined in 'azoteq,timeout-lta') expires.
> +
> +      azoteq,blocking-enable:
> +        type: boolean
> +        description: Specifies that the channel is a blocking channel.
> +
> +      azoteq,slider0-select:
> +        type: boolean
> +        description: Specifies that the channel participates in slider 0.
> +
> +      azoteq,slider1-select:
> +        type: boolean
> +        description: Specifies that the channel participates in slider 1.
> +
> +      azoteq,rx-enable:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> +          - minItems: 1
> +            maxItems: 8
> +            items:
> +              minimum: 0
> +              maximum: 7
> +        description:
> +          Specifies the CRX pin(s) associated with the channel. By default, only
> +          the CRX pin corresponding to the channel's index is enabled (e.g. CRX0
> +          for channel 0).
> +
> +      azoteq,tx-enable:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> +          - minItems: 1
> +            maxItems: 8
> +            items:
> +              minimum: 0
> +              maximum: 7
> +            default: [0, 1, 2, 3, 4, 5, 6, 7]
> +        description: Specifies the TX pin(s) associated with the channel.
> +
> +      azoteq,meas-cap-decrease:
> +        type: boolean
> +        description:
> +          Decreases the internal measurement capacitance from 60 pF to 15 pF.
> +
> +      azoteq,rx-float-inactive:
> +        type: boolean
> +        description: Floats any inactive CRX pins instead of grounding them.
> +
> +      azoteq,local-cap-size:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32
> +          - enum: [0, 1, 2]
> +            default: 0
> +        description: |
> +          Specifies the capacitance to be added to the channel as follows:
> +          0: None
> +          1: Global adder (based on 'azoteq,global-cap-increase')
> +          2: Global adder + 0.5 pF
> +
> +      azoteq,invert-enable:
> +        type: boolean
> +        description:
> +          Inverts the polarity of the states reported for proximity, touch and
> +          deep-touch events relative to their respective thresholds.
> +
> +      azoteq,proj-bias:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32
> +          - enum: [0, 1, 2, 3]
> +            default: 2
> +        description: |
> +          Specifies the bias current applied during projected-capacitance
> +          sensing as follows:
> +          0: 2.5 uA
> +          1: 5 uA
> +          2: 10 uA
> +          3: 20 uA
> +
> +      azoteq,sense-mode:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32
> +          - enum: [0, 1, 9, 14, 15]
> +            default: 0
> +        description: |
> +          Specifies the channel's sensing mode as follows:
> +          0:  Self capacitance
> +          1:  Projected capacitance
> +          9:  Self or mutual inductance
> +          14: Hall effect
> +          15: Temperature
> +
> +      azoteq,sense-freq:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32
> +          - enum: [0, 1, 2, 3]
> +            default: 1
> +        description: |
> +          Specifies the channel's sensing frequency as follows (parenthesized
> +          numbers represent the frequency if 'azoteq,clk-div' is present):
> +          0: 4 MHz (1 MHz)
> +          1: 2 MHz (500 kHz)
> +          2: 1 MHz (250 kHz)
> +          3: 500 kHz (125 kHz)
> +
> +      azoteq,static-enable:
> +        type: boolean
> +        description: Enables the static front-end for the channel.
> +
> +      azoteq,ati-mode:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32
> +          - enum: [0, 1, 2, 3]
> +            default: 3
> +        description: |
> +          Specifies the channel's ATI mode as follows:
> +          0: Disabled
> +          1: Semi-partial
> +          2: Partial
> +          3: Full
> +
> +      azoteq,ati-base:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32
> +          - enum: [75, 100, 150, 200]
> +            default: 100
> +        description: Specifies the channel's ATI base.
> +
> +      azoteq,ati-target:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32
> +          - multipleOf: 32
> +            minimum: 0
> +            maximum: 2016
> +            default: 512
> +        description: Specifies the channel's ATI target.
> +
> +      azoteq,assoc-select:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32-array
> +          - minItems: 1
> +            maxItems: 8
> +            items:
> +              minimum: 0
> +              maximum: 7
> +        description:
> +          Specifies the associated channels for which the channel serves as a
> +          reference channel. By default, no channels are selected.
> +
> +      azoteq,assoc-weight:
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/uint32
> +          - minimum: 0
> +            maximum: 255
> +            default: 0
> +        description:
> +          Specifies the channel's impact weight if it acts as an associated
> +          channel (0 = 0% impact, 255 = 200% impact).
> +
> +    patternProperties:
> +      "^event-prox(-alt)?$":
> +        type: object
> +        description:
> +          Represents a proximity event reported by the channel in response to
> +          a decrease in counts. Node names suffixed with '-alt' instead corre-
> +          spond to an increase in counts.
> +
> +          By default, the long-term average tracks an increase in counts such
> +          that only events corresponding to a decrease in counts are reported
> +          (refer to the datasheet for more information).
> +
> +          Specify 'azoteq,dual-direction' to freeze the long-term average when
> +          the counts increase or decrease such that events of either direction
> +          can be reported. Alternatively, specify 'azoteq,invert-enable' to in-
> +          vert the polarity of the states reported by the channel.
> +
> +          Complementary events (e.g. event-touch and event-touch-alt) can both
> +          be present and specify different key or switch codes, but not differ-
> +          ent thresholds or hysteresis (if applicable).
> +
> +        properties:
> +          azoteq,thresh:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +              - minimum: 0
> +                maximum: 255
> +                default: 10
> +            description: Specifies the threshold for the event.
> +
> +          linux,code:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: Numeric key or switch code associated with the event.
> +
> +        additionalProperties: false
> +
> +      "^event-touch(-alt)?$":
> +        type: object
> +        description: Represents a touch event reported by the channel.
> +
> +        properties:
> +          azoteq,thresh:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +              - minimum: 0
> +                maximum: 255
> +                default: 8
> +            description: Specifies the threshold for the event.
> +
> +          azoteq,hyst:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +              - minimum: 0
> +                maximum: 15
> +                default: 4
> +            description: Specifies the hysteresis for the event.
> +
> +          linux,code:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: Numeric key or switch code associated with the event.
> +
> +        additionalProperties: false
> +
> +      "^event-deep(-alt)?$":
> +        type: object
> +        description: Represents a deep-touch event reported by the channel.
> +
> +        properties:
> +          azoteq,thresh:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +              - minimum: 0
> +                maximum: 255
> +                default: 26
> +            description: Specifies the threshold for the event.
> +
> +          azoteq,hyst:
> +            allOf:
> +              - $ref: /schemas/types.yaml#/definitions/uint32
> +              - minimum: 0
> +                maximum: 15
> +                default: 0
> +            description: Specifies the hysteresis for the event.
> +
> +          linux,code:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: Numeric key or switch code associated with the event.
> +
> +        additionalProperties: false
> +
> +    required:
> +      - reg
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/input/input.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            iqs269a@44 {
> +                    #address-cells = <1>;
> +                    #size-cells = <0>;
> +
> +                    compatible = "azoteq,iqs269a";
> +                    reg = <0x44>;
> +                    interrupt-parent = <&gpio>;
> +                    interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
> +
> +                    azoteq,hall-enable;
> +                    azoteq,suspend-mode = <2>;
> +
> +                    channel@0 {
> +                            reg = <0x0>;
> +
> +                            event-prox {
> +                                    linux,code = <KEY_POWER>;
> +                            };
> +                    };
> +
> +                    channel@1 {
> +                            reg = <0x1>;
> +                            azoteq,slider0-select;
> +                    };
> +
> +                    channel@2 {
> +                            reg = <0x2>;
> +                            azoteq,slider0-select;
> +                    };
> +
> +                    channel@3 {
> +                            reg = <0x3>;
> +                            azoteq,slider0-select;
> +                    };
> +
> +                    channel@4 {
> +                            reg = <0x4>;
> +                            azoteq,slider0-select;
> +                    };
> +
> +                    channel@5 {
> +                            reg = <0x5>;
> +                            azoteq,slider0-select;
> +                    };
> +
> +                    channel@6 {
> +                            reg = <0x6>;
> +                            azoteq,invert-enable;
> +                            azoteq,static-enable;
> +                            azoteq,reseed-disable;
> +                            azoteq,rx-enable = <0>;
> +                            azoteq,sense-freq = <0x0>;
> +                            azoteq,sense-mode = <0xE>;
> +                            azoteq,ati-mode = <0x0>;
> +                            azoteq,ati-base = <200>;
> +                            azoteq,ati-target = <320>;
> +                    };
> +
> +                    channel@7 {
> +                            reg = <0x7>;
> +                            azoteq,invert-enable;
> +                            azoteq,static-enable;
> +                            azoteq,reseed-disable;
> +                            azoteq,rx-enable = <0>, <6>;
> +                            azoteq,sense-freq = <0x0>;
> +                            azoteq,sense-mode = <0xE>;
> +                            azoteq,ati-mode = <0x3>;
> +                            azoteq,ati-base = <200>;
> +                            azoteq,ati-target = <320>;
> +
> +                            event-touch {
> +                                    linux,code = <SW_LID>;
> +                            };
> +                    };
> +            };
> +    };
> +
> +...
> -- 
> 2.7.4
> 
