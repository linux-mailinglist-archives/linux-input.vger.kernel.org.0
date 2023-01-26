Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C42EC67D001
	for <lists+linux-input@lfdr.de>; Thu, 26 Jan 2023 16:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230329AbjAZPVl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Jan 2023 10:21:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbjAZPVf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Jan 2023 10:21:35 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 331B62F798
        for <linux-input@vger.kernel.org>; Thu, 26 Jan 2023 07:21:00 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id e19-20020a05600c439300b003db1cac0c1fso3438434wmn.5
        for <linux-input@vger.kernel.org>; Thu, 26 Jan 2023 07:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+2mefsEvHmq39Te/7Wp+R6w2aIm2s1quiqOuLLyjDw=;
        b=oYMv4GXXHH7idd5MWeZq6vildJo0MtUFyfe7uijXuIgjBXPlFHCU+HA4V2TqM7wWdT
         HjnY53z+J4nUlbE1T35FUYQi0UFic/hApl44bZ7qIyIcoPyDuPlXyNeHqyBxcAQblBTF
         NNcwpvfIzuA+niEExSFdYLyVX1CfYml9Tn6Wzf4uY+8zhGWhUcw4G8W6SzwjDHQjYGsf
         pGaE7pEUNLTMCFzIj5FyqfvlZoFCmx80M79AyxAer33TxF5bI0vgPaT/ahCsuXJp0mc1
         MLo8X59f619bOXSZffk4hiVrCcioIKNr57jppd1HER7TE2i/yHFAeUNXH/gw5Ba8ucA/
         C4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+2mefsEvHmq39Te/7Wp+R6w2aIm2s1quiqOuLLyjDw=;
        b=Y4FcfclIuFBiD5iU+W64SChiC8Hh1dd/fsLP60tvGYCsIfpN5MD2htYNE4DPZEDo3J
         PmoJ1bcX48VegVcR9lcoVDr52Iu8Onq4tWet4lQd6GIGJzdHb2B+NMBNl+9LrIFQH7y3
         Xs7bdXJUs8EiPxg4AfRAee1OdaKQZqoIZ16lksbQz4+J7XWnZnLcNpN8YpstDu1Yj3f7
         dD64k9vE/NzZnLmzH1+KStaLmuRPvz9OLg6zm/UC4pXBimhmW/daK+d3j9VqK5QEskm+
         vMU0azK0ladvnn3XlnT0KiIgLOHFbz6hemI4MKrqGJRasRMHRiB42wNbPBltVSeiEV+8
         ndBw==
X-Gm-Message-State: AFqh2kq8Y8QWzQayU/iFsBsCpJvPi3By5n1U/WWiDtyAKKufzFN/d2WG
        s5tkcufy78Eo1RR5N+G67J/G5Q==
X-Google-Smtp-Source: AMrXdXuqHtaGbD6neM1IykM+VLLSAZ4rnk2UBNVawjAJqC5Oro2q3Xay5/hHYgdM8KozqTKSOEXikw==
X-Received: by 2002:a05:600c:358b:b0:3db:2e6e:7826 with SMTP id p11-20020a05600c358b00b003db2e6e7826mr24772812wmq.5.1674746438568;
        Thu, 26 Jan 2023 07:20:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l38-20020a05600c08a600b003d358beab9dsm1613641wmp.47.2023.01.26.07.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 07:20:37 -0800 (PST)
Message-ID: <b5aea934-4514-6b30-be95-f427d01f54bb@linaro.org>
Date:   Thu, 26 Jan 2023 16:20:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v8 4/5] dt-bindings: input: pwm-beeper: add volume
To:     Manuel Traut <manuel.traut@mt.com>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <20230126091825.220646-1-manuel.traut@mt.com>
 <20230126091825.220646-5-manuel.traut@mt.com>
 <c519afe0-0a6f-e262-7a85-a3072a828e62@linaro.org> <Y9KYNSWwlJXPcw0L@mt.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y9KYNSWwlJXPcw0L@mt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 26/01/2023 16:11, Manuel Traut wrote:
>> This is the second patch. Bindings must be introduced before you start
>> using them.
> 
> OK, will be done in v9.
> 
>>> ---
>>>  .../devicetree/bindings/input/pwm-beeper.yaml | 20 +++++++++++++++++++
>>>  1 file changed, 20 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/input/pwm-beeper.yaml b/Documentation/devicetree/bindings/input/pwm-beeper.yaml
>>> index 351df83d5cbe..f1f9283ca855 100644
>>> --- a/Documentation/devicetree/bindings/input/pwm-beeper.yaml
>>> +++ b/Documentation/devicetree/bindings/input/pwm-beeper.yaml
>>> @@ -26,6 +26,24 @@ properties:
>>>    beeper-hz:
>>>      description: bell frequency in Hz
>>>  
>>> +  volume-levels:
>>
>> use -bp suffix:
>> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/property-units.yaml#L44
>>
>> which will mean the unit is 1/100 of %, not 1/10. Then you can also drop
>> the $ref.
> 
> OK, this is also fine for me. Chaned the description and implementation
> for v9.
>  
>>> +    description: >
>>> +      Array of PWM duty cycle values that correspond to
>>> +      linear volume levels. These need to be in the range of
>>> +      0 to 500, while 0 means 0% duty cycle (mute) and 500
>>> +      means 50% duty cycle (max volume).
>>> +      Please note that the actual volume of most beepers is
>>> +      highly non-linear, which means that low volume levels
>>> +      are probably somewhere in the range of 1 to 30 (0.1-3%
>>> +      duty cycle).
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +
>>> +  default-volume-level:
>>
>> I propose to use just the value, not the index, so the name should
>> finish with '-bp' and the $ref can be dropped.
> 
> I am not so happy with this suggestion. What shall be displayed in
> sysfs as volume if a user specifies a value that is not defined in
> the array.. So I tend to keep this as is.

sysfs is not related to bindings. To rephrase your question: what shall
be shown in anywhere if the index is not correct? The same problem, the
same solution.

Best regards,
Krzysztof

