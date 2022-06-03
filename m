Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5762553C447
	for <lists+linux-input@lfdr.de>; Fri,  3 Jun 2022 07:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240701AbiFCFdz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Jun 2022 01:33:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240596AbiFCFdx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Jun 2022 01:33:53 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 532C038DB9
        for <linux-input@vger.kernel.org>; Thu,  2 Jun 2022 22:33:51 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id m20so13830599ejj.10
        for <linux-input@vger.kernel.org>; Thu, 02 Jun 2022 22:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iHyYxfIl7IAMB/bUkDIFilddqggVKWh8SCOgdycTrxM=;
        b=vpHTetv1Os71gZ01WWpt7kXct6GT/mxkkUT0ra+teGLAcv8MzP94hezyYWvnAiZvK1
         P3E1MTqn6MOU/ZdZVSUNPMVND+1OjrDIxxKS/KvfB0QqGLqqZY+OBNPBs4HYC+4QPYqQ
         0cWNMeQBtS5xMcn6JsdvXvs2H9eS19/EmraEBXy7/zxIEw2HA3lX3z3fSdYnCfrwNZ+L
         DNmTRcAy0thvpGvOL7TPnhAtH/mQha3/DzV5JXb4HWi0ybg50dgHolpCt7PKPBYKKpCV
         GY0c4fPO95GBNpQwQHOFDbMmjRfeoPkitvP/DJ8PhZybsO/WfOdWAyxEAHfPQO0kksa6
         N+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iHyYxfIl7IAMB/bUkDIFilddqggVKWh8SCOgdycTrxM=;
        b=VsXkIYggdZqISlnubq1HFihb9gBIw4ZDmpassnXBZ3bndhJyNOi7ye6plYGY/zXn+2
         vwd9DyKqRzdaYRkrPsv+eby+z9dX08cydgbmwCMRh4vkXYe/NJod+RY12vHPGynslmjg
         aCqNq6d0vXjs82TC7vGfAtX3lR4oyCAWJofJ4d6q75u6eizzSEujy1oss3GBGd7p7Fb1
         VWOy6i/SvOhmW3PB9hbXXXNJPMxWAe66sWkgAorvfFl02HxxVoQz4ap7TDFnk3qKt1MR
         Zc3haNmAnafa3c+43mSQujbGGYU4Gxyq3G9ARwNMyq1Zs7CzB4ipoI9T383qdZogp7+X
         4zqw==
X-Gm-Message-State: AOAM530MGjXYV05vKN6WhcTbnjeZ6YuKVoBzP+rmch5a937AofVqgmCi
        ZyEbp+QbR2LjSwbJlhtAA9RW+A==
X-Google-Smtp-Source: ABdhPJzrzQ0F+rxl5DWmWeyECL+HxWm90KOYstxRyVXyVDDM2OqQnV3GWgDXnXjUK/HKqoWqXOLpFA==
X-Received: by 2002:a17:906:c302:b0:6fe:a216:20a4 with SMTP id s2-20020a170906c30200b006fea21620a4mr7279966ejz.556.1654234429850;
        Thu, 02 Jun 2022 22:33:49 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a14-20020a170906368e00b006fec5cef701sm2453830ejc.197.2022.06.02.22.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 22:33:49 -0700 (PDT)
Message-ID: <67f56e57-185a-1e4b-e20b-4f7772a10580@linaro.org>
Date:   Fri, 3 Jun 2022 07:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/3] dt-bindings: adc-joystick: add adc-joystick,polled
 option
Content-Language: en-US
To:     Chris Morgan <macromorgan@hotmail.com>
Cc:     Chris Morgan <macroalpha82@gmail.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        heiko@sntech.de, maccraft123mc@gmail.com, contact@artur-rojek.eu
References: <20220601204927.10256-1-macroalpha82@gmail.com>
 <20220601204927.10256-2-macroalpha82@gmail.com>
 <12a65f1d-4f3a-417f-3c90-5461870abe2a@linaro.org>
 <SN6PR06MB5342F372D3810B8EDA15BB99A5DE9@SN6PR06MB5342.namprd06.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SN6PR06MB5342F372D3810B8EDA15BB99A5DE9@SN6PR06MB5342.namprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 02/06/2022 21:44, Chris Morgan wrote:
> On Thu, Jun 02, 2022 at 11:56:10AM +0200, Krzysztof Kozlowski wrote:
>> On 01/06/2022 22:49, Chris Morgan wrote:
>>> From: Chris Morgan <macromorgan@hotmail.com>
>>>
>>> Add documentation for adc-joystick,polled. New device-tree properties
>>> have been added.
>>>
>>> - adc-joystick,polled: A boolean value noting the joystick device
>>> 		       should be polled rather than use a triggered
>>> 		       buffer.
>>>
>>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>>> ---
>>>  .../devicetree/bindings/input/adc-joystick.yaml          | 9 ++++++++-
>>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/input/adc-joystick.yaml b/Documentation/devicetree/bindings/input/adc-joystick.yaml
>>> index 2ee04e03bc22..4f49a1a5772e 100644
>>> --- a/Documentation/devicetree/bindings/input/adc-joystick.yaml
>>> +++ b/Documentation/devicetree/bindings/input/adc-joystick.yaml
>>> @@ -12,12 +12,19 @@ maintainers:
>>>  
>>>  description: >
>>>    Bindings for joystick devices connected to ADC controllers supporting
>>> -  the Industrial I/O subsystem.
>>> +  the Industrial I/O subsystem. Supports both polled devices where no
>>> +  iio trigger is available and non-polled devices which are triggered
>>> +  by iio.
>>>  
>>>  properties:
>>>    compatible:
>>>      const: adc-joystick
>>>  
>>> +  adc-joystick,polled:
>>> +    type: boolean
>>> +    description:
>>> +      If the device does not support triggered buffers and needs to be polled.
>>
> 
> What would your recommendation be? I'm basically proposing polling
> instead of utilizing a triggered buffer, so instead of the driver
> relying on a hardware trigger or a software trigger being set up to
> fill the buffer that is read by the input subsystem we use the input
> subsystem polling function directly (this is useful for my use-case
> where the Rockchip SARADC doesn't have a hardware trigger).

Then it could be: "adc-joystik,no-hardware-trigger". The description is
I think accurate, so just the property name.



Best regards,
Krzysztof
