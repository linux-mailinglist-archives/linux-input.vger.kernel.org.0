Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0532971FADB
	for <lists+linux-input@lfdr.de>; Fri,  2 Jun 2023 09:21:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234259AbjFBHVM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Jun 2023 03:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234256AbjFBHVH (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Jun 2023 03:21:07 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0E51A8
        for <linux-input@vger.kernel.org>; Fri,  2 Jun 2023 00:21:04 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-96f53c06babso237364266b.3
        for <linux-input@vger.kernel.org>; Fri, 02 Jun 2023 00:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685690463; x=1688282463;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sOTJHzBlXem8kFL2dEbaniEyDOPmVdi6/D41FbG2/e0=;
        b=fc5clFf9+i6XMuLsFnHZ1y7sI4Dhnepn2+nbBohx01IMwWaBMsE09f141QTjEn73YL
         lOvFkVNW8DltkkXwRKpNVeT3ANYCVOEYpv6XCdSmDVUjiN9gHMlePnvp44pUqwh3H7ON
         LhOlhMTbS6Lhz69vrNJIgyfHMNFD8QpUO/N3/z3kyjWv0r34pC99dyiBy58cUrTAz1A1
         Gx99gEOaUdiqQ9+5d5LOMWP7e1weloxl5ky7ogbhqx/TKvDSYH+ErxGkd1XR/o7QVpfQ
         hVAQqxWUeOkoVUHZd5WoqBGdHOVXZJPPAazHog/WFm56D6HP0rTa5fBy6GSVgUAqD8uE
         RadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685690463; x=1688282463;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sOTJHzBlXem8kFL2dEbaniEyDOPmVdi6/D41FbG2/e0=;
        b=Dg+RhxOg8RsuX2VSINarbKMvJKI4ZjvzvWlYNDReiyQegJJxYz7r8HzN5bvl2l1uPz
         uWMvzgBEQl+soXIrY2hetJwmLZkSTZuxfKvpkjBCs2Dm9cKyPHM8DlcSgz/cTDNWjB6m
         +Xfgmt4XvJE2RgZOW1AjyPZUlD7PeEBkVdgSePrgRhtes0cITJlNaufDZnoIXASCIuhG
         TrjHJOOeAgpuGMNMRoRxkACJyiWrNSY8DEnQdVRjKXzGhXStJWVy6GZpEx5Bu48F7ilI
         GottwhkVzJkDtdORM49XMNZaZm8SNX8gHf+U/DPw3z9P1txJIkAOZXtymKFmgIZraJXS
         UoqA==
X-Gm-Message-State: AC+VfDyNwWg+XZxeAxOZLpgMTKrmgVwcfaFZTmF6Lj9426E/My1goIgI
        Lk4F6wuFp7EpwRjItpN4zSc+Mw==
X-Google-Smtp-Source: ACHHUZ5P7UygHfpVsMbBKjCZa0KshvXxrma8biaMxWFWU9k+OBGh7aZPhQpBli639i9+IMep2tLoFw==
X-Received: by 2002:a17:907:9803:b0:973:e4c2:2bd0 with SMTP id ji3-20020a170907980300b00973e4c22bd0mr11303077ejc.8.1685690462720;
        Fri, 02 Jun 2023 00:21:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id z13-20020a170906240d00b0094e597f0e4dsm401920eja.121.2023.06.02.00.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 00:21:02 -0700 (PDT)
Message-ID: <1bdaee8a-b327-d97f-a96a-25367e34cdad@linaro.org>
Date:   Fri, 2 Jun 2023 09:21:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/2] dt-bindings: input: iqs7222: Add properties for
 Azoteq IQS7222D
Content-Language: en-US
To:     Jeff LaBundy <jeff@labundy.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
References: <ZHanv+8fOYhpyMEC@nixie71>
 <e3b35a40-daf2-c06a-1de4-1d2fdd1c68c8@kernel.org> <ZHfzLUrWZc0Bp+Ap@nixie71>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZHfzLUrWZc0Bp+Ap@nixie71>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 01/06/2023 03:23, Jeff LaBundy wrote:
>>>  
>>>    reg:
>>>      maxItems: 1
>>> @@ -173,6 +174,148 @@ properties:
>>>      maximum: 3000
>>>      description: Specifies the report rate (in ms) during ultra-low-power mode.
>>>  
>>> +  touchscreen-size-x: true
>>> +  touchscreen-size-y: true
>>> +  touchscreen-inverted-x: true
>>> +  touchscreen-inverted-y: true
>>> +  touchscreen-swapped-x-y: true
>>
>> Why? Aren't they coming from common schema?
> 
> Yes, but because additionalProperties is set to false here, we must explicitly
> include the subset of properties from the common schema that are allowed for
> this particular instance. I counted over a dozen other bindings doing the same.
> 
> In case I have misunderstood, please let me know.

If you are listing now most of touchscreen properties, it is a sign you
should use just unevaluatedProperties: false (instead
additionalProperties) and then no need for any of these here.

> 
>>
>>> +
>>> +  trackpad:
>>> +    type: object
>>> +    description: Represents all channels associated with the trackpad.
>>> +
>>> +    properties:
>>> +      azoteq,channel-select:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +        minItems: 1
>>> +        maxItems: 12
>>> +        items:
>>> +          minimum: 0
>>> +          maximum: 13
>>> +        description:
>>> +          Specifies the order of the channels that participate in the trackpad.
>>> +          Specify 255 to omit a given channel for the purpose of mapping a non-
>>> +          rectangular trackpad.
>>> +
>>> +      azoteq,num-rows:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        minimum: 1
>>> +        maximum: 12
>>> +        description: Specifies the number of rows that comprise the trackpad.
>>> +
>>> +      azoteq,num-cols:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        minimum: 1
>>> +        maximum: 12
>>> +        description: Specifies the number of columns that comprise the trackpad.
>>> +
>>> +      azoteq,top-speed:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        multipleOf: 4
>>> +        minimum: 0
>>> +        maximum: 1020
>>> +        description:
>>> +          Specifies the speed of movement after which coordinate filtering is
>>> +          no longer applied.
>>
>> Units?
> 
> This is a ratiometric, i.e. unitless value that represents a hardware filter
> coefficient. It already exists in this binding prior to this patch under the
> slider-0/1 node and is simply re-used here.

Then mention the ratio (e.g. "speed of movement expressed as ratio
of..."). Description said "speed" and we usually measure speed in very
specific units.

> 
>>
>>> +
>>> +      azoteq,bottom-speed:
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        minimum: 0
>>> +        maximum: 255
>>> +        description:
>>> +          Specifies the speed of movement after which coordinate filtering is
>>> +          linearly reduced.
>>
>> Units?
> 
> Same here.
> 
>>
>>> +
>>> +      azoteq,use-prox:
>>> +        type: boolean
>>> +        description:
>>> +          Directs the trackpad to respond to the proximity states of the se-
>>> +          lected channels instead of their corresponding touch states. Note
>>
>> Don't split the words.
> 
> ACK.
> 
>>
>>> +          the trackpad cannot report granular coordinates during a state of
>>> +          proximity.
>>> +
>>> +    patternProperties:
>>> +      "^azoteq,lower-cal-(x|y)$":
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        minimum: 0
>>> +        maximum: 255
>>> +        description: Specifies the trackpad's lower starting points.
>>
>> Why would you need this property? Why does this represent hardware property?
> 
> This property and its cousin below define the physical boundaries of the
> touch surface. They are typically used to mask areas that cannot elicit
> an electrical response due to manufacturing tolerances or the presence of
> an overlay. For that reason, they descend directly from properties of the
> hardware.
> 
> Similar properties already exist in this binding for the slider case; this
> device simply extends the functionality to a second dimenstion.

OK

> 
>>
>>> +
>>> +      "^azoteq,upper-cal-(x|y)$":
>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>> +        minimum: 0
>>> +        maximum: 255
>>> +        description: Specifies the trackpad's upper starting points.
>>> +
>>> +      "^event-(press|tap|(swipe|flick)-(x|y)-(pos|neg))$":
>>> +        type: object
>>> +        $ref: input.yaml#
>>> +        description:
>>> +          Represents a press or gesture event reported by the trackpad. Specify
>>> +          'linux,code' under the press event to report absolute coordinates.
>>> +
>>> +        properties:
>>> +          linux,code: true
>>> +
>>> +          azoteq,gesture-angle-tighten:
>>> +            type: boolean
>>> +            description:
>>> +              Limits the tangent of the gesture angle to 0.5 (axial gestures
>>> +              only). If specified in one direction, the effect is applied in
>>> +              either direction.
>>> +
>>> +          azoteq,gesture-max-ms:
>>> +            multipleOf: 16
>>> +            minimum: 0
>>> +            maximum: 4080
>>> +            description:
>>> +              Specifies the length of time (in ms) within which a tap, swipe
>>> +              or flick gesture must be completed in order to be acknowledged
>>> +              by the device. The number specified for any one swipe or flick
>>> +              gesture applies to all other swipe or flick gestures.
>>> +
>>> +          azoteq,gesture-min-ms:
>>> +            multipleOf: 16
>>> +            minimum: 0
>>> +            maximum: 4080
>>> +            description:
>>> +              Specifies the length of time (in ms) for which a tap gesture must
>>> +              be held in order to be acknowledged by the device.
>>> +
>>> +          azoteq,gesture-dist:
>>> +            $ref: /schemas/types.yaml#/definitions/uint32
>>> +            minimum: 0
>>> +            maximum: 65535
>>> +            description:
>>> +              Specifies the distance across which a tap, swipe or flick gesture
>>> +              must travel in order to be acknowledged by the device. The number
>>> +              specified for any one swipe or flick gesture applies to all other
>>> +              swipe or flick gestures.
>>> +
>>> +          azoteq,gpio-select:
>>> +            $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +            minItems: 1
>>> +            maxItems: 3
>>> +            items:
>>> +              minimum: 0
>>> +              maximum: 2
>>> +            description: |
>>> +              Specifies one or more GPIO mapped to the event as follows:
>>> +              0: GPIO0
>>> +              1: GPIO3
>>> +              2: GPIO4
>>> +
>>> +              Note that although multiple events can be mapped to a single
>>> +              GPIO, they must all be of the same type (proximity, touch or
>>> +              trackpad gesture).
>>> +
>>> +        additionalProperties: false
>>> +
>>> +    required:
>>> +      - azoteq,channel-select
>>> +
>>> +    additionalProperties: false
>>> +
>>>  patternProperties:
>>>    "^cycle-[0-9]$":
>>>      type: object
>>> @@ -288,6 +431,10 @@ patternProperties:
>>>            Activates the reference channel in response to proximity events
>>>            instead of touch events.
>>>  
>>> +      azoteq,counts-filt-enable:
>>> +        type: boolean
>>> +        description: Applies counts filtering to the channel.
>>> +
>>>        azoteq,ati-band:
>>>          $ref: /schemas/types.yaml#/definitions/uint32
>>>          enum: [0, 1, 2, 3]
>>> @@ -432,12 +579,12 @@ patternProperties:
>>>              description: |
>>>                Specifies one or more GPIO mapped to the event as follows:
>>>                0: GPIO0
>>> -              1: GPIO3 (IQS7222C only)
>>> -              2: GPIO4 (IQS7222C only)
>>> +              1: GPIO3
>>> +              2: GPIO4
>>
>> Why changing this? Is it valid for IQS7222A?
> 
> It's not, only for 'C' and now 'D'. However, the restriction for 'A' is already
> conveyed in an if/then schema in the original binding. So rather than updating
> this text to say "(IQS7222C and IQS7222D only)", I opted to drop the open-coded
> text and rely on the existing schema.

OK

> 


Best regards,
Krzysztof

