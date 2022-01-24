Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16F8749A692
	for <lists+linux-input@lfdr.de>; Tue, 25 Jan 2022 03:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S3419528AbiAYCSy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 Jan 2022 21:18:54 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:45728 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1850214AbiAXX1h (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 Jan 2022 18:27:37 -0500
Received: by mail-oi1-f169.google.com with SMTP id m9so13612285oia.12;
        Mon, 24 Jan 2022 15:27:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vYQbTwCYw4HO0OlRAclDDt8ygVT1KrFRh1Vm6YVnmpY=;
        b=3QO9pX9Uql3+I8HC+E+iZns1YKSi5zCJS2iwdvNV340w55/kpF/Vvx9YXV2ftgqCiJ
         A6YnwxXlltdrPZ2UsfJW8UMQWke8Gc/FscBueQ+fujBb93kbGoKi1r2LN3AiNrdgegsQ
         MPJGMP0pAW5fwHCEbYk3rIBF+sbBelKDNeU+LblAnTTuE8PZjgrmS2jhoxCffoTqqF6z
         ekamiALDeaaflS2uxYT9oQ1oY0WD7JI/TaKneqwBgl37mxLpf1bwMOgC/IKQzQLy2ubB
         4IzNAZ8tLUtsTMSFa2d8mHoCyn8dZkvljv9VzEtq9HZgngBUS36CDtimGN7S0NXTm/e+
         DlnA==
X-Gm-Message-State: AOAM530adlnrg0U2apdUno7rCR1xFWIDHO9Kph7lN71f5eYxymgazjQ8
        mwCbJMmYW7ky7jvtiYqyeg==
X-Google-Smtp-Source: ABdhPJyUcfW38VmXEfLOC2RP70Pl8IaIQ/lYjRI3Ueg8SesWf5YTKBmU4ahQOG0FbSMBQy/cx3vpFQ==
X-Received: by 2002:aca:4b0e:: with SMTP id y14mr3384835oia.13.1643066856794;
        Mon, 24 Jan 2022 15:27:36 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l14sm4853081ooq.12.2022.01.24.15.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 15:27:35 -0800 (PST)
Received: (nullmailer pid 713635 invoked by uid 1000);
        Mon, 24 Jan 2022 23:27:35 -0000
Date:   Mon, 24 Jan 2022 17:27:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: Add bindings for Azoteq
 IQS7222A/B/C
Message-ID: <Ye8158K42TLfG+7I@robh.at.kernel.org>
References: <20220123194232.85288-1-jeff@labundy.com>
 <20220123194232.85288-2-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220123194232.85288-2-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jan 23, 2022 at 01:42:31PM -0600, Jeff LaBundy wrote:
> This patch adds bindings for the Azoteq IQS7222A/B/C family of
> capacitive touch controllers.

Overall, wow, that's a lot of properties. It leaves me wondering why 
does this h/w need so many and others don't?

> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
>  .../devicetree/bindings/input/iqs7222.yaml    | 967 ++++++++++++++++++

azoteq,iqs7222.yaml

>  1 file changed, 967 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/iqs7222.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/iqs7222.yaml b/Documentation/devicetree/bindings/input/iqs7222.yaml
> new file mode 100644
> index 000000000000..0c23d1d49ebd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/iqs7222.yaml
> @@ -0,0 +1,967 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/iqs7222.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Azoteq IQS7222A/B/C Capacitive Touch Controller
> +
> +maintainers:
> +  - Jeff LaBundy <jeff@labundy.com>
> +
> +description: |
> +  The Azoteq IQS7222A, IQS7222B and IQS7222C are multichannel capacitive touch
> +  controllers that feature additional sensing capabilities.
> +
> +  Link to datasheets: https://www.azoteq.com/
> +
> +properties:
> +  compatible:
> +    enum:
> +      - azoteq,iqs7222a
> +      - azoteq,iqs7222b
> +      - azoteq,iqs7222c
> +
> +  reg:
> +    maxItems: 1
> +
> +  irq-gpios:

Use 'interrupts'. Interrupt capable GPIO lines are also interrupt 
providers.

> +    maxItems: 1
> +    description:
> +      Specifies the GPIO connected to the device's active-low RDY output.
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      Specifies the GPIO connected to the device's active-low MCLR input. The
> +      device is temporarily held in hardware reset prior to initialization if
> +      this property is present.
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  azoteq,rf-filt-enable:
> +    type: boolean
> +    description: Enables the device's internal RF filter.
> +
> +  azoteq,max-counts:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +    description: |
> +      Specifies the maximum counts as follows:

Counts of what?

> +      0: 1023
> +      1: 2047
> +      2: 4095
> +      3: 16384
> +
> +  azoteq,auto-mode:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +    description: |
> +      Specifies the number of conversions to occur before an interrupt is
> +      generated as follows:
> +      0: 4
> +      1: 8
> +      2: 16
> +      3: 32
> +
> +  azoteq,ati-frac-div-fine:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 31
> +    description: Specifies the preloaded ATI fine fractional divider.
> +
> +  azoteq,ati-frac-div-coarse:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 31
> +    description: Specifies the preloaded ATI coarse fractional divider.
> +
> +  azoteq,ati-comp-select:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 1023
> +    description: Specifies the preloaded ATI compensation selection.
> +
> +  azoteq,lta-beta-lp:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 15
> +    description:
> +      Specifies the long-term average filter damping factor to be applied during
> +      low-power mode.
> +
> +  azoteq,lta-beta-np:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 15
> +    description:
> +      Specifies the long-term average filter damping factor to be applied during
> +      normal-power mode.
> +
> +  azoteq,counts-beta-lp:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 15
> +    description:
> +      Specifies the counts filter damping factor to be applied during low-power
> +      mode.
> +
> +  azoteq,counts-beta-np:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 15
> +    description:
> +      Specifies the counts filter damping factor to be applied during normal-
> +      power mode.
> +
> +  azoteq,lta-fast-beta-lp:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 15
> +    description:
> +      Specifies the long-term average filter fast damping factor to be applied
> +      during low-power mode.
> +
> +  azoteq,lta-fast-beta-np:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 15
> +    description:
> +      Specifies the long-term average filter fast damping factor to be applied
> +      during normal-power mode.
> +
> +  azoteq,timeout-ati-ms:
> +    multipleOf: 500
> +    minimum: 0
> +    maximum: 32767500
> +    description:
> +      Specifies the delay (in ms) before ATI is retried following an ATI error.
> +
> +  azoteq,rate-ati-ms:
> +    minimum: 0
> +    maximum: 65535
> +    description: Specifies the rate (in ms) at which ATI status is evaluated.
> +
> +  azoteq,timeout-np-ms:
> +    minimum: 0
> +    maximum: 65535
> +    description:
> +      Specifies the length of time (in ms) to wait for an event before moving
> +      from normal-power mode to low-power mode.
> +
> +  azoteq,rate-np-ms:
> +    minimum: 0
> +    maximum: 3000
> +    description: Specifies the report rate (in ms) during normal-power mode.
> +
> +  azoteq,timeout-lp-ms:
> +    minimum: 0
> +    maximum: 65535
> +    description:
> +      Specifies the length of time (in ms) to wait for an event before moving
> +      from low-power mode to ultra-low-power mode.
> +
> +  azoteq,rate-lp-ms:
> +    minimum: 0
> +    maximum: 3000
> +    description: Specifies the report rate (in ms) during low-power mode.
> +
> +  azoteq,timeout-ulp-ms:
> +    minimum: 0
> +    maximum: 65535
> +    description:
> +      Specifies the rate (in ms) at which channels not regularly sampled during
> +      ultra-low-power mode are updated.
> +
> +  azoteq,rate-ulp-ms:
> +    minimum: 0
> +    maximum: 3000
> +    description: Specifies the report rate (in ms) during ultra-low-power mode.
> +
> +patternProperties:
> +  "^cycle-[0-9]$":
> +    type: object
> +    description: Represents a conversion cycle serving two sensing channels.
> +
> +    properties:
> +      azoteq,conv-period:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 255
> +        description: Specifies the cycle's conversion period.
> +
> +      azoteq,conv-frac:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 255
> +        description: Specifies the cycle's conversion frequency fraction.
> +
> +      azoteq,tx-enable:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 9
> +        items:
> +          minimum: 0
> +          maximum: 8
> +        description: Specifies the CTx pin(s) associated with the cycle.
> +
> +      azoteq,rx-float-inactive:
> +        type: boolean
> +        description: Floats any inactive CRx pins instead of grounding them.
> +
> +      azoteq,dead-time-enable:
> +        type: boolean
> +        description:
> +          Increases the denominator of the conversion frequency formula by one.
> +
> +      azoteq,tx-freq-fosc:
> +        type: boolean
> +        description:
> +          Fixes the conversion frequency to that of the device's core clock.
> +
> +      azoteq,vbias-enable:
> +        type: boolean
> +        description: Enables the bias voltage for use during inductive sensing.
> +
> +      azoteq,sense-mode:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3]
> +        description: |
> +          Specifies the cycle's sensing mode as follows:
> +          0: None
> +          1: Self capacitive
> +          2: Mutual capacitive
> +          3: Inductive
> +
> +          Note that in the case of IQS7222A, cycles 5 and 6 are restricted to
> +          Hall-effect sensing.
> +
> +      azoteq,iref-enable:
> +        type: boolean
> +        description:
> +          Enables the current reference for use during various sensing modes.
> +
> +      azoteq,iref-level:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 15
> +        description: Specifies the cycle's current reference level.
> +
> +      azoteq,iref-trim:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 15
> +        description: Specifies the cycle's current reference trim.
> +
> +    dependencies:
> +      azoteq,iref-level: ["azoteq,iref-enable"]
> +      azoteq,iref-trim: ["azoteq,iref-enable"]
> +
> +    additionalProperties: false
> +
> +  "^channel-[0-19]$":
> +    type: object
> +    description:
> +      Represents a single sensing channel. A channel is active if defined and
> +      inactive otherwise.
> +
> +      Note that in the case of IQS7222A, channels 10 and 11 are restricted to
> +      Hall-effect sensing with events reported on channel 10 only.
> +
> +    properties:
> +      azoteq,ulp-allow:
> +        type: boolean
> +        description:
> +          Permits the device to enter ultra-low-power mode while the channel
> +          lies in a state of touch or proximity.
> +
> +      azoteq,ref-select:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 9
> +        description: Specifies a separate reference channel to be followed.
> +
> +      azoteq,ref-weight:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 65535
> +        description: Specifies the relative weight of the reference channel.
> +
> +      azoteq,use-prox:
> +        type: boolean
> +        description:
> +          Activates the reference channel in response to proximity events
> +          instead of touch events.
> +
> +      azoteq,ati-band:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3]
> +        description: |
> +          Specifies the channel's ATI band as a fraction of its ATI target as
> +          follows:
> +          0: 1/16
> +          1: 1/8
> +          2: 1/4
> +          3: 1/2
> +
> +      azoteq,global-halt:
> +        type: boolean
> +        description:
> +          Specifies that the channel's long-term average is to freeze if any
> +          other participating channel lies in a proximity or touch state.
> +
> +      azoteq,invert-enable:
> +        type: boolean
> +        description:
> +          Inverts the polarity of the states reported for proximity and touch
> +          events relative to their respective thresholds.
> +
> +      azoteq,dual-direction:
> +        type: boolean
> +        description:
> +          Specifies that the channel's long-term average is to freeze in the
> +          presence of either increasing or decreasing counts, thereby permit-
> +          ting events to be reported in either direction.
> +
> +      azoteq,rx-enable:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 4
> +        items:
> +          minimum: 0
> +          maximum: 7
> +        description: Specifies the CRx pin(s) associated with the channel.
> +
> +      azoteq,samp-cap-double:
> +        type: boolean
> +        description: Doubles the sampling capacitance from 40 pF to 80 pF.
> +
> +      azoteq,vref-half:
> +        type: boolean
> +        description: Halves the discharge threshold from 1.0 V to 0.5 V.
> +
> +      azoteq,proj-bias:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3]
> +        description: |
> +          Specifies the bias current applied during mutual (projected)
> +          capacitive sensing as follows:
> +          0: 2 uA
> +          1: 5 uA
> +          2: 7 uA
> +          3: 10 uA
> +
> +      azoteq,ati-target:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        multipleOf: 8
> +        minimum: 0
> +        maximum: 2040
> +        description: Specifies the channel's ATI target.
> +
> +      azoteq,ati-base:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        multipleOf: 16
> +        minimum: 0
> +        maximum: 496
> +        description: Specifies the channel's ATI base.
> +
> +      azoteq,ati-mode:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [0, 1, 2, 3, 4, 5]
> +        description: |
> +          Specifies the channel's ATI mode as follows:
> +          0: Disabled
> +          1: Compensation
> +          2: Compensation divider
> +          3: Fine fractional divider
> +          4: Coarse fractional divider
> +          5: Full
> +
> +      azoteq,ati-frac-div-fine:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 31
> +        description: Specifies the channel's ATI fine fractional divider.
> +
> +      azoteq,ati-frac-mult-coarse:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 15
> +        description: Specifies the channel's ATI coarse fractional multiplier.
> +
> +      azoteq,ati-frac-div-coarse:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 31
> +        description: Specifies the channel's ATI coarse fractional divider.
> +
> +      azoteq,ati-comp-div:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 31
> +        description: Specifies the channel's ATI compensation divider.
> +
> +      azoteq,ati-comp-select:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 1023
> +        description: Specifies the channel's ATI compensation selection.
> +
> +      azoteq,debounce-enter:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 15
> +        description: Specifies the channel's debounce entrance factor.
> +
> +      azoteq,debounce-exit:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 15
> +        description: Specifies the channel's debounce exit factor.
> +
> +    patternProperties:
> +      "^event-(prox|touch)$":
> +        type: object
> +        description:
> +          Represents a proximity or touch event reported by the channel.
> +
> +        properties:
> +          azoteq,gpio-select:
> +            $ref: /schemas/types.yaml#/definitions/uint32-array
> +            minItems: 1
> +            maxItems: 3
> +            items:
> +              minimum: 0
> +              maximum: 2
> +            description: |
> +              Specifies one or more GPIO mapped to the event as follows:
> +              0: GPIO0
> +              1: GPIO3 (IQS7222C only)
> +              2: GPIO4 (IQS7222C only)
> +
> +              Note that although multiple events can be mapped to a single
> +              GPIO, they must all be of the same type (proximity, touch or
> +              slider gesture).
> +
> +          azoteq,thresh:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description:
> +              Specifies the threshold for the event. Valid entries range from
> +              0-127 and 0-255 for proximity and touch events, respectively.
> +
> +          azoteq,hyst:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 0
> +            maximum: 255
> +            description:
> +              Specifies the hysteresis for the event (touch events only).
> +
> +          azoteq,timeout-press-ms:
> +            multipleOf: 500
> +            minimum: 0
> +            maximum: 127500
> +            description:
> +              Specifies the length of time (in ms) to wait before automatically
> +              releasing a press event. Specify zero to allow the press state to
> +              persist indefinitely.
> +
> +              The IQS7222B does not feature channel-specific timeouts; the time-
> +              out specified for any one channel applies to all channels.
> +
> +          linux,code:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description:
> +              Numeric key or switch code associated with the event. Specify
> +              KEY_RESERVED (0) to opt out of event reporting.
> +
> +          linux,input-type:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [1, 5]
> +            default: 1
> +            description:
> +              Specifies whether the event is to be interpreted as a key (1)
> +              or a switch (5).
> +
> +        required:
> +          - linux,code
> +
> +        additionalProperties: false
> +
> +    dependencies:
> +      azoteq,ref-weight: ["azoteq,ref-select"]
> +      azoteq,use-prox: ["azoteq,ref-select"]
> +
> +    additionalProperties: false
> +
> +  "^slider-[0-1]$":
> +    type: object
> +    description: Represents a slider comprising three or four channels.
> +
> +    properties:
> +      azoteq,channel-select:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 3
> +        maxItems: 4
> +        items:
> +          minimum: 0
> +          maximum: 9
> +        description:
> +          Specifies the order of the channels that participate in the slider.
> +
> +      azoteq,slider-size:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 65535
> +        description:
> +          Specifies the slider's one-dimensional resolution, equal to the
> +          maximum coordinate plus one.
> +
> +      azoteq,lower-cal:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 255
> +        description: Specifies the slider's lower starting point.
> +
> +      azoteq,upper-cal:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 255
> +        description: Specifies the slider's upper starting point.
> +
> +      azoteq,top-speed:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 65535
> +        description:
> +          Specifies the speed of movement after which coordinate filtering is
> +          no longer applied.
> +
> +      azoteq,bottom-speed:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        multipleOf: 4
> +        minimum: 0
> +        maximum: 1020
> +        description:
> +          Specifies the speed of movement after which coordinate filtering is
> +          linearly reduced.
> +
> +      azoteq,bottom-beta:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 7
> +        description:
> +          Specifies the coordinate filter damping factor to be applied
> +          while the speed of movement is below that which is specified
> +          by azoteq,bottom-speed.
> +
> +      azoteq,static-beta:
> +        type: boolean
> +        description:
> +          Applies the coordinate filter damping factor specified by
> +          azoteq,bottom-beta regardless of the speed of movement.
> +
> +      azoteq,use-prox:
> +        type: boolean
> +        description:
> +          Directs the slider to respond to the proximity states of the selected
> +          channels instead of their corresponding touch states. Note the slider
> +          cannot report granular coordinates during a state of proximity.
> +
> +      linux,axis:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Specifies the absolute axis to which coordinates are mapped. Specify
> +          ABS_WHEEL to operate the slider as a wheel (IQS7222C only).
> +
> +    patternProperties:
> +      "^event-(press|tap|(swipe|flick)-(pos|neg))$":
> +        type: object
> +        description:
> +          Represents a press or gesture (IQS7222A only) event reported by
> +          the slider.
> +
> +        properties:
> +          linux,code:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            description: Numeric key code associated with the event.
> +
> +          azoteq,gesture-max-ms:
> +            multipleOf: 4
> +            minimum: 0
> +            maximum: 1020
> +            description:
> +              Specifies the length of time (in ms) within which a tap, swipe
> +              or flick gesture must be completed in order to be acknowledged
> +              by the device. The number specified for any one swipe or flick
> +              gesture applies to all remaining swipe or flick gestures.
> +
> +          azoteq,gesture-min-ms:
> +            multipleOf: 4
> +            minimum: 0
> +            maximum: 124
> +            description:
> +              Specifies the length of time (in ms) for which a tap gesture must
> +              be held in order to be acknowledged by the device.
> +
> +          azoteq,gesture-dist:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            multipleOf: 16
> +            minimum: 0
> +            maximum: 4080
> +            description:
> +              Specifies the distance across which a swipe or flick gesture must
> +              travel in order to be acknowledged by the device. The number spec-
> +              ified for any one swipe or flick gesture applies to all remaining
> +              swipe or flick gestures.
> +
> +          azoteq,gpio-select:
> +            $ref: /schemas/types.yaml#/definitions/uint32-array
> +            minItems: 1
> +            maxItems: 1
> +            items:
> +              minimum: 0
> +              maximum: 0
> +            description: |
> +              Specifies an individual GPIO mapped to a tap, swipe or flick
> +              gesture as follows:
> +              0: GPIO0
> +              1: GPIO3 (reserved)
> +              2: GPIO4 (reserved)
> +
> +              Note that although multiple events can be mapped to a single
> +              GPIO, they must all be of the same type (proximity, touch or
> +              slider gesture).
> +
> +        required:
> +          - linux,code
> +
> +        additionalProperties: false
> +
> +    required:
> +      - azoteq,channel-select
> +
> +    additionalProperties: false
> +
> +  "^gpio-[0-2]$":
> +    type: object
> +    description: |
> +      Represents a GPIO mapped to one or more events as follows:
> +      gpio-0: GPIO0
> +      gpio-1: GPIO3 (IQS7222C only)
> +      gpio-2: GPIO4 (IQS7222C only)
> +
> +    allOf:
> +      - $ref: ../pinctrl/pincfg-node.yaml#
> +
> +    properties:
> +      drive-open-drain: true
> +
> +    additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: azoteq,iqs7222b
> +
> +    then:
> +      patternProperties:
> +        "^cycle-[0-9]$":
> +          properties:
> +            azoteq,iref-enable: false
> +
> +        "^channel-[0-19]$":
> +          properties:
> +            azoteq,ref-select: false
> +
> +          patternProperties:
> +            "^event-(prox|touch)$":
> +              properties:
> +                azoteq,gpio-select: false
> +
> +        "^slider-[0-1]$": false
> +
> +        "^gpio-[0-2]$": false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: azoteq,iqs7222a
> +
> +    then:
> +      patternProperties:
> +        "^channel-[0-19]$":
> +          patternProperties:
> +            "^event-(prox|touch)$":
> +              properties:
> +                azoteq,gpio-select:
> +                  maxItems: 1
> +                  items:
> +                    maximum: 0
> +
> +        "^slider-[0-1]$":
> +          properties:
> +            azoteq,slider-size:
> +              multipleOf: 16
> +              maximum: 4080
> +
> +            azoteq,top-speed:
> +              multipleOf: 4
> +              maximum: 1020
> +
> +    else:
> +      patternProperties:
> +        "^channel-[0-19]$":
> +          properties:
> +            azoteq,ulp-allow: false
> +
> +        "^slider-[0-1]$":
> +          patternProperties:
> +            "^event-(press|tap|(swipe|flick)-(pos|neg))$":
> +              properties:
> +                azoteq,gesture-max-ms: false
> +
> +                azoteq,gesture-min-ms: false
> +
> +                azoteq,gesture-dist: false
> +
> +                azoteq,gpio-select: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - irq-gpios
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/input/input.h>
> +
> +    i2c {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            iqs7222a@44 {
> +                    compatible = "azoteq,iqs7222a";
> +                    reg = <0x44>;
> +                    irq-gpios = <&gpio 4 GPIO_ACTIVE_LOW>;
> +                    azoteq,lta-beta-lp = <7>;
> +                    azoteq,lta-beta-np = <8>;
> +                    azoteq,counts-beta-lp = <2>;
> +                    azoteq,counts-beta-np = <3>;
> +                    azoteq,lta-fast-beta-lp = <3>;
> +                    azoteq,lta-fast-beta-np = <4>;
> +
> +                    cycle-0 {
> +                            azoteq,conv-period = <5>;
> +                            azoteq,conv-frac = <127>;
> +                            azoteq,tx-enable = <1>, <2>, <4>, <5>;
> +                            azoteq,dead-time-enable;
> +                            azoteq,sense-mode = <2>;
> +                    };
> +
> +                    cycle-1 {
> +                            azoteq,conv-period = <5>;
> +                            azoteq,conv-frac = <127>;
> +                            azoteq,tx-enable = <5>;
> +                            azoteq,dead-time-enable;
> +                            azoteq,sense-mode = <2>;
> +                    };
> +
> +                    cycle-2 {
> +                            azoteq,conv-period = <5>;
> +                            azoteq,conv-frac = <127>;
> +                            azoteq,tx-enable = <4>;
> +                            azoteq,dead-time-enable;
> +                            azoteq,sense-mode = <2>;
> +                    };
> +
> +                    cycle-3 {
> +                            azoteq,conv-period = <5>;
> +                            azoteq,conv-frac = <127>;
> +                            azoteq,tx-enable = <2>;
> +                            azoteq,dead-time-enable;
> +                            azoteq,sense-mode = <2>;
> +                    };
> +
> +                    cycle-4 {
> +                            azoteq,conv-period = <5>;
> +                            azoteq,conv-frac = <127>;
> +                            azoteq,tx-enable = <1>;
> +                            azoteq,dead-time-enable;
> +                            azoteq,sense-mode = <2>;
> +                    };
> +
> +                    cycle-5 {
> +                            azoteq,conv-period = <2>;
> +                            azoteq,conv-frac = <0>;
> +                    };
> +
> +                    cycle-6 {
> +                            azoteq,conv-period = <2>;
> +                            azoteq,conv-frac = <0>;
> +                    };
> +
> +                    channel-0 {
> +                            azoteq,ulp-allow;
> +                            azoteq,global-halt;
> +                            azoteq,invert-enable;
> +                            azoteq,rx-enable = <3>;
> +                            azoteq,ati-target = <800>;
> +                            azoteq,ati-base = <208>;
> +                            azoteq,ati-mode = <5>;
> +                    };
> +
> +                    channel-1 {
> +                            azoteq,global-halt;
> +                            azoteq,invert-enable;
> +                            azoteq,rx-enable = <3>;
> +                            azoteq,ati-target = <496>;
> +                            azoteq,ati-base = <208>;
> +                            azoteq,ati-mode = <5>;
> +                    };
> +
> +                    channel-2 {
> +                            azoteq,global-halt;
> +                            azoteq,invert-enable;
> +                            azoteq,rx-enable = <3>;
> +                            azoteq,ati-target = <496>;
> +                            azoteq,ati-base = <208>;
> +                            azoteq,ati-mode = <5>;
> +                    };
> +
> +                    channel-3 {
> +                            azoteq,global-halt;
> +                            azoteq,invert-enable;
> +                            azoteq,rx-enable = <3>;
> +                            azoteq,ati-target = <496>;
> +                            azoteq,ati-base = <208>;
> +                            azoteq,ati-mode = <5>;
> +                    };
> +
> +                    channel-4 {
> +                            azoteq,global-halt;
> +                            azoteq,invert-enable;
> +                            azoteq,rx-enable = <3>;
> +                            azoteq,ati-target = <496>;
> +                            azoteq,ati-base = <208>;
> +                            azoteq,ati-mode = <5>;
> +                    };
> +
> +                    channel-5 {
> +                            azoteq,ulp-allow;
> +                            azoteq,global-halt;
> +                            azoteq,invert-enable;
> +                            azoteq,rx-enable = <6>;
> +                            azoteq,ati-target = <800>;
> +                            azoteq,ati-base = <144>;
> +                            azoteq,ati-mode = <5>;
> +                    };
> +
> +                    channel-6 {
> +                            azoteq,global-halt;
> +                            azoteq,invert-enable;
> +                            azoteq,rx-enable = <6>;
> +                            azoteq,ati-target = <496>;
> +                            azoteq,ati-base = <160>;
> +                            azoteq,ati-mode = <5>;
> +
> +                            event-touch {
> +                                    linux,code = <KEY_MUTE>;
> +                            };
> +                    };
> +
> +                    channel-7 {
> +                            azoteq,global-halt;
> +                            azoteq,invert-enable;
> +                            azoteq,rx-enable = <6>;
> +                            azoteq,ati-target = <496>;
> +                            azoteq,ati-base = <160>;
> +                            azoteq,ati-mode = <5>;
> +
> +                            event-touch {
> +                                    linux,code = <KEY_VOLUMEDOWN>;
> +                            };
> +                    };
> +
> +                    channel-8 {
> +                            azoteq,global-halt;
> +                            azoteq,invert-enable;
> +                            azoteq,rx-enable = <6>;
> +                            azoteq,ati-target = <496>;
> +                            azoteq,ati-base = <160>;
> +                            azoteq,ati-mode = <5>;
> +
> +                            event-touch {
> +                                    linux,code = <KEY_VOLUMEUP>;
> +                            };
> +                    };
> +
> +                    channel-9 {
> +                            azoteq,global-halt;
> +                            azoteq,invert-enable;
> +                            azoteq,rx-enable = <6>;
> +                            azoteq,ati-target = <496>;
> +                            azoteq,ati-base = <160>;
> +                            azoteq,ati-mode = <5>;
> +
> +                            event-touch {
> +                                    linux,code = <KEY_POWER>;
> +                            };
> +                    };
> +
> +                    channel-10 {
> +                            azoteq,ulp-allow;
> +                            azoteq,ati-target = <496>;
> +                            azoteq,ati-base = <112>;
> +
> +                            event-touch {
> +                                    linux,code = <SW_LID>;
> +                                    linux,input-type = <EV_SW>;
> +                            };
> +                    };
> +
> +                    channel-11 {
> +                            azoteq,ati-target = <496>;
> +                            azoteq,ati-base = <112>;
> +                    };
> +
> +                    slider-0 {
> +                            azoteq,channel-select = <1>, <2>, <3>, <4>;
> +                            azoteq,slider-size = <4080>;
> +                            azoteq,upper-cal = <50>;
> +                            azoteq,lower-cal = <30>;
> +                            azoteq,top-speed = <200>;
> +                            azoteq,bottom-speed = <1>;
> +                            azoteq,bottom-beta = <3>;
> +
> +                            event-tap {
> +                                    linux,code = <KEY_PLAYPAUSE>;
> +                                    azoteq,gesture-max-ms = <600>;
> +                                    azoteq,gesture-min-ms = <24>;
> +                            };
> +
> +                            event-flick-pos {
> +                                    linux,code = <KEY_NEXTSONG>;
> +                                    azoteq,gesture-max-ms = <600>;
> +                                    azoteq,gesture-dist = <816>;
> +                            };
> +
> +                            event-flick-neg {
> +                                    linux,code = <KEY_PREVIOUSSONG>;
> +                            };
> +                    };
> +            };
> +    };
> +
> +...
> -- 
> 2.25.1
> 
> 
