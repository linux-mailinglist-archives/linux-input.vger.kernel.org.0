Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 945565B2752
	for <lists+linux-input@lfdr.de>; Thu,  8 Sep 2022 22:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbiIHUAe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Sep 2022 16:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbiIHUAI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Sep 2022 16:00:08 -0400
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BAE5FF50D;
        Thu,  8 Sep 2022 12:59:11 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id t8-20020a9d5908000000b0063b41908168so13053199oth.8;
        Thu, 08 Sep 2022 12:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=FE4XUOSRjT1XbypGp3gnBlh+Cy482+hPOhUrG4ei/Ws=;
        b=FsvqhpiMtnREI9g+peD2Kb788t+BNwqCS+cMfAGiNM/iuv4xGaHmXDqZuLpzHxYbJ1
         iKYyI8bupFQ7HGvbIiAHVONMkwYOyz81S6ATPcBrRLPrxDBjNmzr6P4Pka7VzIf/SuYl
         fhUVGVA7+a80VxBXK8cxZjVbieErmKrNRLFqTBn7KPnIbhjWIdDCHAZTMQ01IoUE2P9F
         U4IaGUXpa2T9J4NMgWC4hpoQA0Mt9XmLl9lCY1/mWZL/8xaTjxT5tFSWC5EbOu0broPf
         I9j05olbykS4kK050aXth0scYTjxCdKOWIGUJfB3ALm1TTWMBvXGRXO+XaIH6hMaDm2h
         383g==
X-Gm-Message-State: ACgBeo1kM3+DR1Cz28SS9kfx73QgqJNA7X3INLJflPO3l6ePZfDenK9L
        GES/oEQSkcZRW3R8EHyS1A==
X-Google-Smtp-Source: AA6agR5FPmuEhLtFtR/xYYI/U5rTfkIaX2Dtz1rcT+Q/3ir2XB0M2zuy01hjUUtEzjHbJuBViWP4RA==
X-Received: by 2002:a9d:17a4:0:b0:647:a03e:d77d with SMTP id j33-20020a9d17a4000000b00647a03ed77dmr4103739otj.306.1662667150338;
        Thu, 08 Sep 2022 12:59:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id l14-20020a4ac60e000000b00435ae9a836asm6479632ooq.15.2022.09.08.12.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 12:59:10 -0700 (PDT)
Received: (nullmailer pid 3240104 invoked by uid 1000);
        Thu, 08 Sep 2022 19:59:09 -0000
Date:   Thu, 8 Sep 2022 14:59:09 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: Add bindings for Azoteq
 IQS7210A/7211A/E
Message-ID: <20220908195909.GA3217447-robh@kernel.org>
References: <20220902141424.90063-1-jeff@labundy.com>
 <20220902141424.90063-2-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902141424.90063-2-jeff@labundy.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Sep 02, 2022 at 09:14:23AM -0500, Jeff LaBundy wrote:
> This patch adds bindings for the Azoteq IQS7210A/7211A/E family of
> trackpad/touchscreen controllers.

Another touchpad/touchscreen with a boat load of properties. Seems like 
an opportunity for some common properties.

Some of these properties already exist. Ideally, you should not be 
defining them again (and even worse is if they end up different types). 
Can't they be pulled out to a common Azoteq schema?

> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> ---
>  .../input/touchscreen/azoteq,iqs7211.yaml     | 765 ++++++++++++++++++
>  1 file changed, 765 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml b/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml
> new file mode 100644
> index 000000000000..190bcd9a864f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml
> @@ -0,0 +1,765 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/azoteq,iqs7211.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Azoteq IQS7210A/7211A/E Trackpad/Touchscreen Controller
> +
> +maintainers:
> +  - Jeff LaBundy <jeff@labundy.com>
> +
> +description: |
> +  The Azoteq IQS7210A, IQS7211A and IQS7211E trackpad and touchscreen control-
> +  lers employ projected-capacitance sensing and can track two contacts.
> +
> +  Link to datasheets: https://www.azoteq.com/
> +
> +properties:
> +  compatible:
> +    enum:
> +      - azoteq,iqs7210a
> +      - azoteq,iqs7211a
> +      - azoteq,iqs7211e
> +
> +  reg:
> +    maxItems: 1
> +
> +  irq-gpios:
> +    maxItems: 1
> +    description:
> +      Specifies the GPIO connected to the device's active-low RDY output. The
> +      pin doubles as the IQS7211E's active-low MCLR input, in which case this
> +      GPIO must be configured as open-drain.
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description:
> +      Specifies the GPIO connected to the device's active-low MCLR input. The
> +      device is temporarily held in hardware reset prior to initialization if
> +      this property is present.
> +
> +  azoteq,default-comms:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 2
> +    default: 0
> +    description: |
> +      Specifies the device's initial communication mode as follows:
> +      0: Unknown (wait for device to open initial communication window)
> +      1: Forced communication disabled by default
> +      2: Forced communication enabled by default

This kind of property is typically not present to use default, 0 to 
disable, or 1 to enable.

> +
> +  azoteq,forced-comms:
> +    type: boolean
> +    description:
> +      Enables forced communication throughout the remainder of operation; for
> +      use with host adapters that cannot tolerate clock stretching.
> +
> +  azoteq,rate-active-ms:
> +    minimum: 0
> +    maximum: 65535
> +    description: Specifies the report rate (in ms) during active mode.
> +
> +  azoteq,rate-touch-ms:
> +    minimum: 0
> +    maximum: 65535
> +    description: Specifies the report rate (in ms) during idle-touch mode.
> +
> +  azoteq,rate-idle-ms:
> +    minimum: 0
> +    maximum: 65535
> +    description: Specifies the report rate (in ms) during idle mode.
> +
> +  azoteq,rate-lp1-ms:
q> +    minimum: 0
> +    maximum: 65535
> +    description: Specifies the report rate (in ms) during low-power mode 1.
> +
> +  azoteq,rate-lp2-ms:
> +    minimum: 0
> +    maximum: 65535
> +    description: Specifies the report rate (in ms) during low-power mode 2.
> +
> +  azoteq,timeout-active-ms:
> +    multipleOf: 1000
> +    minimum: 0
> +    maximum: 65535000
> +    description:
> +      Specifies the length of time (in ms) to wait for an event before moving
> +      from active mode to idle or idle-touch modes.
> +
> +  azoteq,timeout-touch-ms:
> +    multipleOf: 1000
> +    minimum: 0
> +    maximum: 65535000
> +    description:
> +      Specifies the length of time (in ms) to wait for an event before moving
> +      from idle-touch mode to idle mode.
> +
> +  azoteq,timeout-idle-ms:
> +    multipleOf: 1000
> +    minimum: 0
> +    maximum: 65535000
> +    description:
> +      Specifies the length of time (in ms) to wait for an event before moving
> +      from idle mode to low-power mode 1.
> +
> +  azoteq,timeout-lp1-ms:
> +    multipleOf: 1000
> +    minimum: 0
> +    maximum: 65535000
> +    description:
> +      Specifies the length of time (in ms) to wait for an event before moving
> +      from low-power mode 1 to low-power mode 2.
> +
> +  azoteq,timeout-lp2-ms:

Use existing azoteq,timeout-lp-ms and allow 2 values?

> +    multipleOf: 1000
> +    minimum: 0
> +    maximum: 60000
> +    description:
> +      Specifies the rate (in ms) at which the trackpad reference values
> +      are updated during low-power modes 1 and 2.
> +
> +  azoteq,timeout-ati-ms:
> +    multipleOf: 1000
> +    minimum: 0
> +    maximum: 60000
> +    description:
> +      Specifies the delay (in ms) before ATI is retried following an ATI error.
> +
> +  azoteq,timeout-comms-ms:
> +    minimum: 0
> +    maximum: 65535
> +    description:
> +      Specifies the delay (in ms) before a communication window is closed.
> +
> +  azoteq,timeout-press-ms:
> +    multipleOf: 1000
> +    minimum: 0
> +    maximum: 60000
> +    description:
> +      Specifies the length of time (in ms) to wait before automatically
> +      releasing a press event. Specify zero to allow the press state to
> +      persist indefinitely.
> +
> +  azoteq,fosc-freq:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +    description: |
> +      Specifies the device's core clock frequency as follows:
> +      0: 14 MHz
> +      1: 18 MHz
> +
> +  azoteq,fosc-trim:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 15
> +    description: Specifies the device's core clock frequency trim.
> +
> +  azoteq,num-contacts:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 2
> +    default: 0
> +    description: Specifies the number of contacts reported by the device.
> +
> +  azoteq,contact-split:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +    description: Specifies the contact (finger) split factor.
> +
> +  azoteq,trim-x:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +    description: Specifies the horizontal trim width.
> +
> +  azoteq,trim-y:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +    description: Specifies the vertical trim height.
> +
> +  trackpad:
> +    type: object
> +    description: Represents all channels associated with the trackpad.
> +
> +    properties:
> +      azoteq,rx-enable:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 8
> +        items:
> +          minimum: 0
> +          maximum: 7
> +        description:
> +          Specifies the order of the CRx pin(s) associated with the trackpad.
> +
> +      azoteq,tx-enable:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 12
> +        items:
> +          minimum: 0
> +          maximum: 11
> +        description:
> +          Specifies the order of the CTx pin(s) associated with the trackpad.
> +
> +      azoteq,channel-select:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 36
> +        items:
> +          minimum: 0
> +          maximum: 255
> +        description: |
> +          Specifies the channels mapped to each cycle in the following order:
> +          Cycle 0, slot 0
> +          Cycle 0, slot 1
> +          Cycle 1, slot 0
> +          Cycle 1, slot 1
> +          ...and so on. Specify 255 to disable a given slot.
> +
> +      azoteq,ati-frac-div-fine:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 31
> +        description: Specifies the trackpad's ATI fine fractional divider.
> +
> +      azoteq,ati-frac-mult-coarse:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 15
> +        description: Specifies the trackpad's ATI coarse fractional multiplier.
> +
> +      azoteq,ati-frac-div-coarse:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 31
> +        description: Specifies the trackpad's ATI coarse fractional divider.
> +
> +      azoteq,ati-comp-div:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 31
> +        description: Specifies the trackpad's ATI compensation divider.
> +
> +      azoteq,ati-target:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 65535
> +        description: Specifies the trackpad's ATI target.
> +
> +      azoteq,touch-enter:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 255
> +        description: Specifies the trackpad's touch entrance factor.
> +
> +      azoteq,touch-exit:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 255
> +        description: Specifies the trackpad's touch exit factor.
> +
> +      azoteq,thresh:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 255
> +        description: Specifies the trackpad's stationary touch threshold.
> +
> +      azoteq,conv-period:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 255
> +        description: Specifies the trackpad's conversion period.
> +
> +      azoteq,conv-frac:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 255
> +        description: Specifies the trackpad's conversion frequency fraction.
> +
> +    patternProperties:
> +      "^event-(tap(-double|-triple)?|hold|palm|swipe-(x|y)-(pos|neg)(-hold)?)$":
> +        type: object
> +        $ref: ../input.yaml#
> +        description:
> +          Represents a gesture event reported by the trackpad. In the case of
> +          axial gestures, the duration or distance specified in one direction
> +          applies to both directions along the same axis.
> +
> +        properties:
> +          linux,code: true
> +
> +          azoteq,gesture-max-ms:
> +            minimum: 0
> +            maximum: 65535
> +            description: Specifies the maximum duration of tap/swipe gestures.
> +
> +          azoteq,gesture-mid-ms:
> +            minimum: 0
> +            maximum: 65535
> +            description:
> +              Specifies the maximum duration between subsequent tap gestures
> +              (IQS7211E only).
> +
> +          azoteq,gesture-min-ms:
> +            minimum: 0
> +            maximum: 65535
> +            description: Specifies the minimum duration of hold gestures.
> +
> +          azoteq,gesture-dist:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 0
> +            maximum: 65535
> +            description:
> +              Specifies the minimum (swipe) or maximum (tap and hold) distance
> +              a finger may travel to be considered a gesture.
> +
> +          azoteq,gesture-dist-rep:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 0
> +            maximum: 65535
> +            description:
> +              Specifies the minimum distance a finger must travel to elicit a
> +              repeated swipe gesture (IQS7211E only).
> +
> +          azoteq,gesture-angle:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 0
> +            maximum: 255
> +            description:
> +              Specifies the maximum angle a finger may travel to be considered
> +              a swipe gesture, expressed as 64 * tan(theta).

degrees would be nicer units.

> +
> +          azoteq,thresh:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 0
> +            maximum: 42
> +            description: Specifies the palm gesture threshold (IQS7211E only).
> +
> +        additionalProperties: false
> +
> +    dependencies:
> +      azoteq,tx-enable: ["azoteq,rx-enable"]
> +      azoteq,channel-select: ["azoteq,rx-enable"]
> +
> +    additionalProperties: false
> +
> +  alp:
> +    type: object
> +    $ref: ../input.yaml#
> +    description: Represents the alternate low-power channel (ALP).
> +
> +    properties:
> +      azoteq,rx-enable:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 8
> +        items:
> +          minimum: 0
> +          maximum: 7
> +        description:
> +          Specifies the CRx pin(s) associated with the ALP in no particular
> +          order.
> +
> +      azoteq,tx-enable:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 12
> +        items:
> +          minimum: 0
> +          maximum: 11
> +        description:
> +          Specifies the CTx pin(s) associated with the ALP in no particular
> +          order.
> +
> +      azoteq,ati-frac-div-fine:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 31
> +        description: Specifies the ALP's ATI fine fractional divider.

Is ATI defined anywhere?

Rob
