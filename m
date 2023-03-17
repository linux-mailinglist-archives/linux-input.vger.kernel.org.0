Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96A916BE700
	for <lists+linux-input@lfdr.de>; Fri, 17 Mar 2023 11:40:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbjCQKj7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Mar 2023 06:39:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjCQKju (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Mar 2023 06:39:50 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E960AB88B;
        Fri, 17 Mar 2023 03:39:48 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id z21so18607645edb.4;
        Fri, 17 Mar 2023 03:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679049587;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eKIfm+D775tviW4GZ27nzlsfupMIf0/4oiKYtylWRdQ=;
        b=btWizO4cuF+abdNF0aKBebb+a9Xnhb1uK5KnTtiks1xm/+RuJJGtNpPckLa1AyKkS/
         lQAEQ99EkQCEF+UnsNvXaOvkNew3IMk/uzuXyVx4SAS0OdjgeyWExP9o1JB030h9XsjC
         Y7QxRVTEh099uZ3fcxVcP+UKr9v0SvvAl7lQcsNIJzgDTRcIhMuvQE5gased9YG/s3sz
         lbdx1Q3e7wqqCVcxfcoROE/HZzoykGfgaS+2YVSAXZxVZc2ZAm7yiT1XvRNgSMx6DbED
         pPz0YJWT5XnbarwnYbWsCP2+yceZ+7gKUT/QeVldJHiCdNQtRnmluR4CNKqx3ThonPTj
         TODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679049587;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eKIfm+D775tviW4GZ27nzlsfupMIf0/4oiKYtylWRdQ=;
        b=TQVfWA5NJQjDvZ7Mp0+jO8LXKMnAXhsEmZmdd7EcvFoBxyUEF1vOQyzGkOEXlWSUY4
         z8snYlz5gVObQH5iJurANGuxNx7KXmB6SJ6a+Xf7VH6zUnNt8DyGefmW7Q1N1yu3Qe97
         TUnWn7gR8G9Jbw10z0HSUx8x+WEZmPEdesD2rbNBpxmpaXQG7RdLYvCb3qU7OvaVLFuk
         9TCrl8dZYCM5KdVtzwaaXW4cYxe2pmPVcBcNEW+UgGoDzbiB+GZIjRoO6DEftPUtD+Ia
         2cvkbV62KeIyUsGP+4lNymXgvPYJJw4uLxUDA9llQ0YZ+LhHK9VdMEonAbVW+/gyPgaJ
         a9pg==
X-Gm-Message-State: AO0yUKVtDzTO1PK3Inzl7vGC6Nx4Y+X0p00CPhByr1AwRRvWrA+yWzHe
        IGSL/zaM4FFvwZR6Id8s9eI=
X-Google-Smtp-Source: AK7set8CRtluQavjL2rqcA7gt0swyV0bQRpzf6jGZ0dAS/pRPJw7PHbKdKIa3+Dg8ZtC1ZSKRB+z1w==
X-Received: by 2002:a17:907:60ca:b0:930:cf90:3074 with SMTP id hv10-20020a17090760ca00b00930cf903074mr5935803ejc.51.1679049586761;
        Fri, 17 Mar 2023 03:39:46 -0700 (PDT)
Received: from [192.168.99.196] (84-84-8-249.fixed.kpn.net. [84.84.8.249])
        by smtp.gmail.com with ESMTPSA id cd2-20020a170906b34200b0092c8da1e5ecsm829294ejb.21.2023.03.17.03.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 03:39:45 -0700 (PDT)
Message-ID: <57b22a4f-3b7e-d62d-d9a7-f9f4e052c253@gmail.com>
Date:   Fri, 17 Mar 2023 11:39:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/2] dt-bindings: input: touchscreen: Add
 'goodix-hold-in-reset' property to Goodix
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     alexandre.belloni@bootlin.com, broonie@kernel.org,
        devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        kernel@undef.tools, krzysztof.kozlowski+dt@linaro.org,
        linux-input@vger.kernel.org, robh+dt@kernel.org
References: <20230312183106.551840-1-jajadekroon@gmail.com>
 <20230316152949.67441-1-jajadekroon@gmail.com>
 <1ae4767f-563a-6425-f20b-32be6ba8a7c7@linaro.org>
From:   Jan Jasper de Kroon <jajadekroon@gmail.com>
In-Reply-To: <1ae4767f-563a-6425-f20b-32be6ba8a7c7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Op 16-03-2023 om 20:25 schreef Krzysztof Kozlowski:
> On 16/03/2023 16:29, Jan Jasper de Kroon wrote:
>> Add an optional 'goodix-hold-in-reset', to the Goodix touchscreen
>> device tree binding. When set to true, the touchscreen controller will
>> be held in reset mode during system suspend, reducing power consumption.
>> If not present, the property defaults to false.
>>
>> Signed-off-by: Jan Jasper de Kroon <jajadekroon@gmail.com>
> Don't attach new patchsets to some other threads. It messes with our
> tools and reading/reviewing process.
Thank you for bringing this to my attention. I apologize for any
inconvenience caused by attaching the patchset to the wrong threads. As a
new user of LKML, I'm still learning the appropriate protocol for
submitting patches. Going forward, I will ensure to attach patchsets to
the correct threads.
>> ---
>> Changes from v2 to v3:
>> - Used imperative mood instead of "This patch adds".
>> - Dropped "I am submitting this patch to..." as it is redundant.
>> - Removed the paragraph related to the related patch sent to the
>>    linux-input mailing list as it is not necessary.
>> - Renamed the hold-in-reset-in-suspend function to
>>    goodix-hold-in-reset to prevent potential naming conflicts with other
>>    functions in the codebase. No functional changes were made.
>>
>> Changes from v1 to v2:
>> - Updated subject prefix to match subsystem.
>> - Added more detailed description of the change.
>> - Fixed formatting issues in commit message.
>>   .../devicetree/bindings/input/touchscreen/goodix.yaml     | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>> index 3d016b87c8df..197f8db9acc2 100644
>> --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>> @@ -56,6 +56,13 @@ properties:
>>     touchscreen-size-y: true
>>     touchscreen-swapped-x-y: true
>>   
>> +  goodix-hold-in-reset:
> That's not a vendor prefix... missing coma.
Thank you for pointing out the mistake in the vendor prefix. I appreciate
your feedback and apologize for any inconvenience caused. I wasn't aware
of the correct vendor prefix style, but I've learned from developer Hans
de Goede that it should be "goodix,hold-in-reset." I will make sure to
correct this in my local branch and ensure that it is applied correctly in
the future. Thanks again for bringing this to my attention.
>> +    description: |
>> +      When set to true, the touchscreen controller will be held in reset mode
>> +      during system suspend. This can help reduce power consumption, but may
>> +      cause the touchscreen to take longer to resume when the system is woken
>> +      up from suspend.
> Anyway, my concerns were not answered, so to be clear:
>
> NAK till you answer them. Do not send new versions without answering
> existing concerns and discussion.
Thank you again for reviewing my patchset and providing feedback. I
appreciate your time and effort in ensuring the quality and suitability
of the DeviceTree.

Regarding the concerns you raised about the proposed feature, I would
like to address them directly. You mentioned that the property does not
look suitable for Devicetree because it describes system policies that are
not within the scope of Devicetree. While I understand your point, I
believe this property is appropriate for Devicetree for the following
reasons:

- The property directly relates to the hardware configuration of the
   device, specifically the touchscreen controller, and is not a software
   policy.

- The property is required for proper system operation and is not optional
   in specific device use cases. To be more specific in the case of the
   PinePhone Original and Pro. The original commit message of the driver
   implementation in driver/input/touchscreen contained the following:
   "It consumes quite a bit of power (~40mW) during system sleep, and more
   when the screen is touched."
   Because the phone is usually kept in your pocket, so prone to a lot of
   screen touches, this is highly undesired behavior for the touchscreen in
   this case. This in my opinion makes it a mandatory property in this
   situation.

- The property is not a user-facing configuration option and is not meant
   to be changed by the end-user.

- The property, although in separate device specific kernel, and still
   called 'poweroff-in-suspend' is already in use on specific devices,
   including the PinePhone Original and PinePhone Pro.

However, I understand your concern that Devicetree should not be used for
policies. To address this concern, I would like to propose the following
changes to the property description:
1. Remove the sentence about reducing power consumption, as this could be
    considered a policy.
2. Emphasize that the property is a required hardware configuration and
    not an optional feature on certain devices.
3. Recommend that any changes to the property value should only be made by
    experienced system administrators and not end-users.

I hope these changes address your concerns and make the property more
suitable for inclusion in Devicetree. If you have any further suggestions
or feedback, please let me know. Thank you again for your time and
guidance.

Best regards,

Jan Jasper de Kroon
>
>
> Best regards,
> Krzysztof
>
