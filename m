Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE337706379
	for <lists+linux-input@lfdr.de>; Wed, 17 May 2023 11:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbjEQJAv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 May 2023 05:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231179AbjEQJAf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 May 2023 05:00:35 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0395D5FE4
        for <linux-input@vger.kernel.org>; Wed, 17 May 2023 02:00:08 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-965cc5170bdso72085866b.2
        for <linux-input@vger.kernel.org>; Wed, 17 May 2023 02:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684314001; x=1686906001;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5aP1Bwp5qtJwbT+wMpc6pfdKQuEptg+56ugwOAw4oCA=;
        b=XrrUZh6f6LmSNquholGVqzn938gZHWYRTbCZkcVjUJ4Wf0nZycEjEZEt2+SY5Pu+/z
         vXBnih3T1ywKel4QD7mW58KC/Z/zF925I369fzsy1dadd5fmxFd2JHWcw56afkzMYhV4
         UDRc0Tcsd+r9Fwsq2qMqgEhUzH+DaDxZn0FPUyNoM+hqWClchWyrkWT8B/sXQUISsux8
         LsoBTfhb8YL5weK3PyoH6God5xLPCE1cXXO1u/ylTcX+WKgodI8WknoCyqgCba4eizhq
         Yq3vUyUyyAFAshubzmKJmB6oMei/iWtnB1ksiQpjlFlE2VAfTpa6JHws8je+76ISj5+j
         k2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684314001; x=1686906001;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5aP1Bwp5qtJwbT+wMpc6pfdKQuEptg+56ugwOAw4oCA=;
        b=FHn3gqpAErZPFZg5sI219ai49540Ux57pgcD1g144zZJSGQWG+N8m/6ZiY7kBBj9pX
         yTrfe60A+b/shmsxV4xW7b77RDZsnNY1fJkn2TaG4ZxuMisIC11XoRjqDcmRkYu2+Cp1
         q/YKXjx3st4G7Ba09TaBD2soHuazRs6wj7nB4tqiPeUzrdeBuutHXuL+hLfn63zPL//D
         GMD7u9sZ8xlClXl7CTOKby074Mu48zBYEZ8YIT77LGVgcr8a9HpjHPea+RZEOHeyCE1F
         1Z/pwDIzPHEWECCo87HzB26bv/M3Bz8Pbd87BbMEJryZqy+uuesfhLfpFjJs9vfXniNI
         BZ+A==
X-Gm-Message-State: AC+VfDy1t0UdfAeJ21d4uY0VBd4xDSgh8hImqkVFgaJ5LgSGtG1ydPBx
        h0dxqTuqpnZhYCzx5xMg5gXwHQ==
X-Google-Smtp-Source: ACHHUZ728nsYzi+7djXn5Bst0NSuHUjAvX6KxFbPzVdbd8gv9WeH6uqMfQXGa6/NdvavuigyguQdcw==
X-Received: by 2002:a17:907:2d1f:b0:968:db2f:383 with SMTP id gs31-20020a1709072d1f00b00968db2f0383mr29248733ejc.53.1684314001021;
        Wed, 17 May 2023 02:00:01 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d? ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id mc11-20020a170906eb4b00b00969f25b96basm11269272ejb.204.2023.05.17.01.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 02:00:00 -0700 (PDT)
Message-ID: <ac6d8bcb-b16b-6c50-a9b6-975560059bdc@linaro.org>
Date:   Wed, 17 May 2023 10:59:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/4] dt-bindings: touchscreen: add virtual-touchscreen
 and virtual-buttons properties
Content-Language: en-US
To:     Javier Carrasco <javier.carrasco@wolfvision.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bastian Hecht <hechtb@gmail.com>,
        Michael Riesch <michael.riesch@wolfvision.net>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230510-feature-ts_virtobj_patch-v2-0-f68a6bfe7a0f@wolfvision.net>
 <20230510-feature-ts_virtobj_patch-v2-2-f68a6bfe7a0f@wolfvision.net>
 <58c8b822-8b47-3269-3b78-334b53c20bff@linaro.org>
 <99e39fb6-26e0-eb9a-3c07-e07d1fa4122c@linaro.org>
 <d32e46aa-af50-ad60-7679-5c235487039e@wolfvision.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d32e46aa-af50-ad60-7679-5c235487039e@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 16/05/2023 11:03, Javier Carrasco wrote:
> On 16.05.23 10:13, Krzysztof Kozlowski wrote:
>> On 16/05/2023 10:10, Krzysztof Kozlowski wrote:
>>> On 15/05/2023 17:00, Javier Carrasco wrote:
>>>> The virtual-touchscreen object defines an area within the touchscreen
>>>> where touch events are reported and their coordinates get converted to
>>>> the virtual origin. This object avoids getting events from areas that
>>>> are physically hidden by overlay frames.
>>>>
>>>> For touchscreens where overlay buttons on the touchscreen surface are
>>>> provided, the virtual-buttons object contains a node for every button
>>>> and the key event that should be reported when pressed.
>>>>
>>>> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
>>>> ---
>>>
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Apologies, second thoughts - why calling all this binding and properties
>> "virtual"? That's the word which immediately raises questions, because
>> bindings are only for real things, not virtual.
>>
>> Touchscreen is just clipped, not virtual, so maybe "clipped-area"
>> instead of virtual-touchscreen? Buttons are real, so maybe just "buttons"?
>>
>> Best regards,
>> Krzysztof
>>
> I guess it is a matter of perspective. For a user the buttons and the
> clipped area are 100% real, but for a driver developer they are virtual
> in the sense that there is not an "active" hardware behind apart from
> the original touchscreen.


The feature describes the hardware, not driver. To understand what does
it mean, look from hardware point of view - does it have some virtual
area or clipped area?

> 
> I just wanted to avoid misunderstandings when implementing this feature
> for other drivers. One might wonder if the touchscreen now has
> mechanical keys attached to it. With the "virtual-" prefix it is clear
> that the objects are not additional pieces of hardware or extensions of
> the touchscreen functionality.

But what if actual physical buttons are added there? You still would
have clipped/virtual area, just without virtual buttons.

> 
> For the virtual-touchscreen your point is stronger because there is
> indeed a real touchscreen hardware no matter the area you define, but my
> approach was keeping homogeneous names for the different objects in case
> some new ones might appear in the future: every object that gets on top
> of the touchscreen area is virtual, so add a new object type and name it
> virtual-xxx.

To me, word "virtual" suggests something which does not exist. Kind of
something abstracted or symbolic. Opposite to "real". Here all this
really exists. You have physical stickers on the touchscreen.

Maybe this should be then "dedicated"? or "isolated"?

Or just "overlay-area"?

> 
> I have nothing against about doing some renaming and I will do it if it
> is required, but with the documentation I think it is now more clear
> what everything means and in the end it might make more sense for the
> drivers so they can differentiate between real and virtual devices.

Best regards,
Krzysztof

