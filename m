Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3AAA6C0240
	for <lists+linux-input@lfdr.de>; Sun, 19 Mar 2023 15:09:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjCSOJu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Mar 2023 10:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjCSOJt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Mar 2023 10:09:49 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E6C40FD
        for <linux-input@vger.kernel.org>; Sun, 19 Mar 2023 07:09:47 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id eh3so37356802edb.11
        for <linux-input@vger.kernel.org>; Sun, 19 Mar 2023 07:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679234986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZhL1dNvJd0sF5iUdbt0QiZo7RnyDqOZdrKnYCE8qaPo=;
        b=RsfEl5pAXHAdhBp9X+IVtu69D1wlfHX5Vg9GwYcv2gMUPYQN8OpIcEL8Elrh5/G3Vy
         U4Px8hOSNVUHari03n0EDI2SgqTiSajpeKYpkQ3rVVkvVae/2U2eQnZukJtYikirvwGa
         eCPDZ/qfytpqxK98dFAsXezRpUCo/R0qfYBU9zaKawrwnGgnR+3NjZsCiayysKzITMoq
         1dZ0qFT7VIW5tSRRhKd9RBabQ1n5kN0zewOBkom/Amrhb71S2Fa2a7Mlo9PDpryixu38
         0PeYS60cc369PoQpimj3fRMEZ2O0qBxifuc1kv59gXuAqtomhRwJeWYd0l+7yAgmR4f8
         9Q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679234986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhL1dNvJd0sF5iUdbt0QiZo7RnyDqOZdrKnYCE8qaPo=;
        b=151tqmS+2PXWUXZncGipKR+Hxpe2rYZWWwBK7W/uBbf1NKQXYjlRfwrNT8QuTu9k2Y
         TqPmuYceoko9j8+OJStb7XMvRshiqcw88hk8grRE1OuVNGvV2WR+VNgpxcxEkAaTpzVu
         ZlosFspHoBLIbMrZOu68w+0l9hhzlzXdqAeQ5Ynu/PsZF0TK2pif1ZyW9ImavhkcVwb3
         tAzG/IjZqpD7lc4J9hfs/H2zWCdnjJz0ghmviEAwj616G0Vk1hSGodxnaIsgkeexxUQU
         1TQp4e/fvgf42Kb1yZcF8tQ7aCoG3AdG6fkCN8cbvVbVXJtKIAzJ6b+27Hrmov7ZeZJW
         qa6Q==
X-Gm-Message-State: AO0yUKVgAVRj56rrL29LOWOZomLzHA0iv0gaMIP/URr75a2/bX7UxI8w
        4opnXjQOdgC4J0rIc1ktDcDhcw==
X-Google-Smtp-Source: AK7set+4QW/qDmlSqLf+fjX6bp4BwqrkdJsBI/GpPgORLmgRphpyG7pfn2UMz+JdegMrzxB5p3P5JQ==
X-Received: by 2002:a17:906:c2c9:b0:930:2530:5f47 with SMTP id ch9-20020a170906c2c900b0093025305f47mr5548389ejb.11.1679234986063;
        Sun, 19 Mar 2023 07:09:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id ha25-20020a170906a89900b00934212e973esm424351ejb.198.2023.03.19.07.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 07:09:45 -0700 (PDT)
Message-ID: <947f9c1f-fd48-cb18-e495-7e275f1792b9@linaro.org>
Date:   Sun, 19 Mar 2023 15:09:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/2] dt-bindings: input: touchscreen: Add
 'goodix-hold-in-reset' property to Goodix
To:     Jan Jasper de Kroon <jajadekroon@gmail.com>
Cc:     alexandre.belloni@bootlin.com, broonie@kernel.org,
        devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        kernel@undef.tools, krzysztof.kozlowski+dt@linaro.org,
        linux-input@vger.kernel.org, robh+dt@kernel.org
References: <20230312183106.551840-1-jajadekroon@gmail.com>
 <20230316152949.67441-1-jajadekroon@gmail.com>
 <1ae4767f-563a-6425-f20b-32be6ba8a7c7@linaro.org>
 <57b22a4f-3b7e-d62d-d9a7-f9f4e052c253@gmail.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <57b22a4f-3b7e-d62d-d9a7-f9f4e052c253@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 17/03/2023 11:39, Jan Jasper de Kroon wrote:
> 
> Op 16-03-2023 om 20:25 schreef Krzysztof Kozlowski:
>> On 16/03/2023 16:29, Jan Jasper de Kroon wrote:
>>> Add an optional 'goodix-hold-in-reset', to the Goodix touchscreen
>>> device tree binding. When set to true, the touchscreen controller will
>>> be held in reset mode during system suspend, reducing power consumption.
>>> If not present, the property defaults to false.
>>>
>>> Signed-off-by: Jan Jasper de Kroon <jajadekroon@gmail.com>
>> Don't attach new patchsets to some other threads. It messes with our
>> tools and reading/reviewing process.
> Thank you for bringing this to my attention. I apologize for any
> inconvenience caused by attaching the patchset to the wrong threads. As a
> new user of LKML, I'm still learning the appropriate protocol for
> submitting patches. Going forward, I will ensure to attach patchsets to
> the correct threads.
>>> ---
>>> Changes from v2 to v3:
>>> - Used imperative mood instead of "This patch adds".
>>> - Dropped "I am submitting this patch to..." as it is redundant.
>>> - Removed the paragraph related to the related patch sent to the
>>>    linux-input mailing list as it is not necessary.
>>> - Renamed the hold-in-reset-in-suspend function to
>>>    goodix-hold-in-reset to prevent potential naming conflicts with other
>>>    functions in the codebase. No functional changes were made.
>>>
>>> Changes from v1 to v2:
>>> - Updated subject prefix to match subsystem.
>>> - Added more detailed description of the change.
>>> - Fixed formatting issues in commit message.
>>>   .../devicetree/bindings/input/touchscreen/goodix.yaml     | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>>> index 3d016b87c8df..197f8db9acc2 100644
>>> --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>>> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>>> @@ -56,6 +56,13 @@ properties:
>>>     touchscreen-size-y: true
>>>     touchscreen-swapped-x-y: true
>>>   
>>> +  goodix-hold-in-reset:
>> That's not a vendor prefix... missing coma.
> Thank you for pointing out the mistake in the vendor prefix. I appreciate
> your feedback and apologize for any inconvenience caused. I wasn't aware
> of the correct vendor prefix style, but I've learned from developer Hans
> de Goede that it should be "goodix,hold-in-reset." I will make sure to
> correct this in my local branch and ensure that it is applied correctly in
> the future. Thanks again for bringing this to my attention.
>>> +    description: |
>>> +      When set to true, the touchscreen controller will be held in reset mode
>>> +      during system suspend. This can help reduce power consumption, but may
>>> +      cause the touchscreen to take longer to resume when the system is woken
>>> +      up from suspend.
>> Anyway, my concerns were not answered, so to be clear:
>>
>> NAK till you answer them. Do not send new versions without answering
>> existing concerns and discussion.
> Thank you again for reviewing my patchset and providing feedback. I
> appreciate your time and effort in ensuring the quality and suitability
> of the DeviceTree.
> 
> Regarding the concerns you raised about the proposed feature, I would
> like to address them directly. You mentioned that the property does not
> look suitable for Devicetree because it describes system policies that are
> not within the scope of Devicetree. While I understand your point, I
> believe this property is appropriate for Devicetree for the following
> reasons:
> 
> - The property directly relates to the hardware configuration of the
>    device, specifically the touchscreen controller, and is not a software
>    policy.

Keeping device in reset state is not hardware configuration but driver
behavior. You did not Cc us on all patches for some reason, so it's
difficult to judge what exactly your driver is doing.

> 
> - The property is required for proper system operation and is not optional
>    in specific device use cases. To be more specific in the case of the
>    PinePhone Original and Pro. The original commit message of the driver
>    implementation in driver/input/touchscreen contained the following:
>    "It consumes quite a bit of power (~40mW) during system sleep, and more
>    when the screen is touched."
>    Because the phone is usually kept in your pocket, so prone to a lot of
>    screen touches, this is highly undesired behavior for the touchscreen in
>    this case. This in my opinion makes it a mandatory property in this
>    situation.

Why then the touchscree should not be kept in reset for other devices?
IOW, this should be always used. If you now say "I prefer to keep or not
keep it in reset for my device" - it's a policy.


> 
> - The property is not a user-facing configuration option and is not meant
>    to be changed by the end-user.

Does not matter.

> 
> - The property, although in separate device specific kernel, and still
>    called 'poweroff-in-suspend' is already in use on specific devices,
>    including the PinePhone Original and PinePhone Pro.

I could not find such property in the kernel.

> 
> However, I understand your concern that Devicetree should not be used for
> policies. To address this concern, I would like to propose the following
> changes to the property description:
> 1. Remove the sentence about reducing power consumption, as this could be
>     considered a policy.
> 2. Emphasize that the property is a required hardware configuration and
>     not an optional feature on certain devices.
> 3. Recommend that any changes to the property value should only be made by
>     experienced system administrators and not end-users.

Please answer - why this should not be enabled always.

Best regards,
Krzysztof

