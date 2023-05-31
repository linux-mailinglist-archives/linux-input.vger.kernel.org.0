Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 212A7718861
	for <lists+linux-input@lfdr.de>; Wed, 31 May 2023 19:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbjEaRWo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 May 2023 13:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbjEaRWk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 May 2023 13:22:40 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D1A0134;
        Wed, 31 May 2023 10:22:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9C8C561CEB;
        Wed, 31 May 2023 17:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E045C433D2;
        Wed, 31 May 2023 17:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685553756;
        bh=Xbo5V+LK1wjUvKeRT/R7gfdA4QJ3aZAJoVxJTqbImTI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=qJdxLmqU+pO5EjnPnj0NYc16IA99UVzvZ4fxCkNkvyGrJ+xQvl8D6tzPxYN5CNcRk
         Xxes0qzazo49PFB0+hKlKRj38ppPiLOic6ABjsqKgWcETNIfsJgMeITmmeL47bJojP
         CVutiufSmdRTAK4ukyspIKlyoVj2vL1QgRtHI0CYpYRStEi9Ft/zGLWlcN+FqqQ4UC
         tmoDVBC+1AobeYFIu4CMxigOcuZwRF/BiDCZo3dKCw9j74M9Awuw+dgEAr5fBeW1AV
         tupSxXWttXzSTQeQQb9qowAaa+ujURWmWEv/U0tMv57ZqrEUqKvdU8PK5s+XpzT0UI
         9fWcMfhw4WkMQ==
Message-ID: <e3b35a40-daf2-c06a-1de4-1d2fdd1c68c8@kernel.org>
Date:   Wed, 31 May 2023 19:22:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] dt-bindings: input: iqs7222: Add properties for
 Azoteq IQS7222D
Content-Language: en-US
To:     Jeff LaBundy <jeff@labundy.com>, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <ZHanv+8fOYhpyMEC@nixie71>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <ZHanv+8fOYhpyMEC@nixie71>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 31/05/2023 03:49, Jeff LaBundy wrote:
> Extend the common binding to include a new variant of the silicon.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

It's not the first time - you keep ignoring maintainers output all the time.

> ---
>  .../bindings/input/azoteq,iqs7222.yaml        | 202 +++++++++++++++++-
>  1 file changed, 192 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
> index 9ddba7f2e7aa..a4c251a430fa 100644
> --- a/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
> +++ b/Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml
> @@ -4,14 +4,14 @@
>  $id: http://devicetree.org/schemas/input/azoteq,iqs7222.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Azoteq IQS7222A/B/C Capacitive Touch Controller
> +title: Azoteq IQS7222A/B/C/D Capacitive Touch Controller
>  
>  maintainers:
>    - Jeff LaBundy <jeff@labundy.com>
>  
>  description: |
> -  The Azoteq IQS7222A, IQS7222B and IQS7222C are multichannel capacitive touch
> -  controllers that feature additional sensing capabilities.
> +  The Azoteq IQS7222A, IQS7222B, IQS7222C and IQS7222D are multichannel capac-
> +  itive touch controllers that feature additional sensing capabilities.

Don't split words.

>  
>    Link to datasheets: https://www.azoteq.com/
>  
> @@ -21,6 +21,7 @@ properties:
>        - azoteq,iqs7222a
>        - azoteq,iqs7222b
>        - azoteq,iqs7222c
> +      - azoteq,iqs7222d
>  
>    reg:
>      maxItems: 1
> @@ -173,6 +174,148 @@ properties:
>      maximum: 3000
>      description: Specifies the report rate (in ms) during ultra-low-power mode.
>  
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true
> +  touchscreen-inverted-x: true
> +  touchscreen-inverted-y: true
> +  touchscreen-swapped-x-y: true

Why? Aren't they coming from common schema?

> +
> +  trackpad:
> +    type: object
> +    description: Represents all channels associated with the trackpad.
> +
> +    properties:
> +      azoteq,channel-select:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 12
> +        items:
> +          minimum: 0
> +          maximum: 13
> +        description:
> +          Specifies the order of the channels that participate in the trackpad.
> +          Specify 255 to omit a given channel for the purpose of mapping a non-
> +          rectangular trackpad.
> +
> +      azoteq,num-rows:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 12
> +        description: Specifies the number of rows that comprise the trackpad.
> +
> +      azoteq,num-cols:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 1
> +        maximum: 12
> +        description: Specifies the number of columns that comprise the trackpad.
> +
> +      azoteq,top-speed:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        multipleOf: 4
> +        minimum: 0
> +        maximum: 1020
> +        description:
> +          Specifies the speed of movement after which coordinate filtering is
> +          no longer applied.

Units?

> +
> +      azoteq,bottom-speed:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 255
> +        description:
> +          Specifies the speed of movement after which coordinate filtering is
> +          linearly reduced.

Units?

> +
> +      azoteq,use-prox:
> +        type: boolean
> +        description:
> +          Directs the trackpad to respond to the proximity states of the se-
> +          lected channels instead of their corresponding touch states. Note

Don't split the words.

> +          the trackpad cannot report granular coordinates during a state of
> +          proximity.
> +
> +    patternProperties:
> +      "^azoteq,lower-cal-(x|y)$":
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 255
> +        description: Specifies the trackpad's lower starting points.

Why would you need this property? Why does this represent hardware property?

> +
> +      "^azoteq,upper-cal-(x|y)$":
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 255
> +        description: Specifies the trackpad's upper starting points.
> +
> +      "^event-(press|tap|(swipe|flick)-(x|y)-(pos|neg))$":
> +        type: object
> +        $ref: input.yaml#
> +        description:
> +          Represents a press or gesture event reported by the trackpad. Specify
> +          'linux,code' under the press event to report absolute coordinates.
> +
> +        properties:
> +          linux,code: true
> +
> +          azoteq,gesture-angle-tighten:
> +            type: boolean
> +            description:
> +              Limits the tangent of the gesture angle to 0.5 (axial gestures
> +              only). If specified in one direction, the effect is applied in
> +              either direction.
> +
> +          azoteq,gesture-max-ms:
> +            multipleOf: 16
> +            minimum: 0
> +            maximum: 4080
> +            description:
> +              Specifies the length of time (in ms) within which a tap, swipe
> +              or flick gesture must be completed in order to be acknowledged
> +              by the device. The number specified for any one swipe or flick
> +              gesture applies to all other swipe or flick gestures.
> +
> +          azoteq,gesture-min-ms:
> +            multipleOf: 16
> +            minimum: 0
> +            maximum: 4080
> +            description:
> +              Specifies the length of time (in ms) for which a tap gesture must
> +              be held in order to be acknowledged by the device.
> +
> +          azoteq,gesture-dist:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            minimum: 0
> +            maximum: 65535
> +            description:
> +              Specifies the distance across which a tap, swipe or flick gesture
> +              must travel in order to be acknowledged by the device. The number
> +              specified for any one swipe or flick gesture applies to all other
> +              swipe or flick gestures.
> +
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
> +              1: GPIO3
> +              2: GPIO4
> +
> +              Note that although multiple events can be mapped to a single
> +              GPIO, they must all be of the same type (proximity, touch or
> +              trackpad gesture).
> +
> +        additionalProperties: false
> +
> +    required:
> +      - azoteq,channel-select
> +
> +    additionalProperties: false
> +
>  patternProperties:
>    "^cycle-[0-9]$":
>      type: object
> @@ -288,6 +431,10 @@ patternProperties:
>            Activates the reference channel in response to proximity events
>            instead of touch events.
>  
> +      azoteq,counts-filt-enable:
> +        type: boolean
> +        description: Applies counts filtering to the channel.
> +
>        azoteq,ati-band:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          enum: [0, 1, 2, 3]
> @@ -432,12 +579,12 @@ patternProperties:
>              description: |
>                Specifies one or more GPIO mapped to the event as follows:
>                0: GPIO0
> -              1: GPIO3 (IQS7222C only)
> -              2: GPIO4 (IQS7222C only)
> +              1: GPIO3
> +              2: GPIO4

Why changing this? Is it valid for IQS7222A?
>  
>                Note that although multiple events can be mapped to a single
>                GPIO, they must all be of the same type (proximity, touch or
> -              slider gesture).
> +              slider/trackpad gesture).
>  
>            azoteq,thresh:
>              $ref: /schemas/types.yaml#/definitions/uint32
> @@ -610,8 +757,8 @@ patternProperties:
>              description: |
>                Specifies one or more GPIO mapped to the event as follows:
>                0: GPIO0
> -              1: GPIO3 (IQS7222C only)
> -              2: GPIO4 (IQS7222C only)
> +              1: GPIO3
> +              2: GPIO4
>  
>                Note that although multiple events can be mapped to a single
>                GPIO, they must all be of the same type (proximity, touch or
> @@ -629,8 +776,8 @@ patternProperties:
>      description: |
>        Represents a GPIO mapped to one or more events as follows:
>        gpio-0: GPIO0
> -      gpio-1: GPIO3 (IQS7222C only)
> -      gpio-2: GPIO4 (IQS7222C only)
> +      gpio-1: GPIO3
> +      gpio-2: GPIO4
>  
>      allOf:
>        - $ref: ../pinctrl/pincfg-node.yaml#
> @@ -641,6 +788,41 @@ patternProperties:
>      additionalProperties: false
>  
>  allOf:
> +  - $ref: touchscreen/touchscreen.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: azoteq,iqs7222d
> +
> +    then:
> +      patternProperties:
> +        "^cycle-[0-9]$":
> +          properties:
> +            azoteq,iref-enable: false
> +
> +        "^channel-([0-9]|1[0-9])$":
> +          properties:
> +            azoteq,ref-select: false
> +
> +        "^slider-[0-1]$": false
> +
> +    else:
> +      properties:
> +        touchscreen-size-x: false
> +        touchscreen-size-y: false
> +        touchscreen-inverted-x: false
> +        touchscreen-inverted-y: false
> +        touchscreen-swapped-x-y: false
> +
> +        trackpad: false

The binding got quite complicated. Are you sure these are similar devices?

Best regards,
Krzysztof

