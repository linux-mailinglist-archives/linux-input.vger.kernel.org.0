Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D79D06C0336
	for <lists+linux-input@lfdr.de>; Sun, 19 Mar 2023 17:39:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbjCSQjW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Mar 2023 12:39:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbjCSQjH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Mar 2023 12:39:07 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9F2BB88;
        Sun, 19 Mar 2023 09:39:00 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id o12so38168140edb.9;
        Sun, 19 Mar 2023 09:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679243939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qsKmmT3hzKFgxVud0QoxCpjm7npJMMJbDApSRG1w2Zc=;
        b=hd9KVmIrF33ODkbc8qi8v+3X+HOGxrL+KG//CbWoJ4hEeYOwK29Z+tue9xka3RK4yi
         HSd7fg1c/Lz1FSu8g5BYXASoPRnBGvuwPDqckDvskvjG1dMGktIqT4YXR11/LlM8ko7X
         52FcIpo/eYpVphNmDbC89lMOYje7uX8dadD+Ccq6IECchrIiCaYAFrxNxIKuXetsCsc3
         6gLHEp7VU2sUe6DTMoQyCBIm0Q+6AfPYtn9jdwxLBmAx/LFp0bCq2QXowpnRjvCPC8Bd
         048N00FJV09sMwWTEkik1o+ZDCyqMNEovQAz4h2vd9ydAyAEo54t414EjS8SP+q+dhAx
         svOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679243939;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qsKmmT3hzKFgxVud0QoxCpjm7npJMMJbDApSRG1w2Zc=;
        b=btk5QXKuqtPMmDcMFxKFWssEuN1d4hqVlpvXZiqELeVrjnfLxCBKx25LmNXHD4z5ch
         PdgWXa+usiSqGf41DW90WNUFNBl3fWfrUfYSp/L3UBijjrN2flft85fCCvvMf9TjoY0h
         cr3tswkB91fqBUke9konUlYmTgockx2VoHeDII1W+cYhowZT7xc5U3QMVB6Vsxk4jmwD
         0odEf0keZ+0uyji0mvGFHLkHyuE4G0wtTbhdsK3b+tVFRgvq0iJh1CA26PBAwBS/fRZ1
         36yiQa0SJEz2U/t5ndDI/DBUmVKMTmhW4FGVahZwwYQJbM/BZ8fRcXshgdrWxlGwV4yf
         VkfQ==
X-Gm-Message-State: AO0yUKX+aRL3iZov68/SCbAMy75ydBy7gXbkJWhW926olnSbd/JWrwNb
        PXp+ubLOmJsWlpN8NXDRaHs=
X-Google-Smtp-Source: AK7set8ridj/8EWIi31QBW5m0+3/gAWNKVcjsKqskhWcMR84ea1k0e/F6o8WKa9Fj7bIMFg581YrOg==
X-Received: by 2002:a17:906:e287:b0:930:d0f1:9d8 with SMTP id gg7-20020a170906e28700b00930d0f109d8mr6323847ejb.27.1679243938826;
        Sun, 19 Mar 2023 09:38:58 -0700 (PDT)
Received: from [192.168.99.196] (84-84-8-249.fixed.kpn.net. [84.84.8.249])
        by smtp.gmail.com with ESMTPSA id sd24-20020a170906ce3800b00931024e96c5sm3444093ejb.99.2023.03.19.09.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 09:38:58 -0700 (PDT)
Message-ID: <c4c3f402-ea3b-ba0a-d9bd-23a642f09946@gmail.com>
Date:   Sun, 19 Mar 2023 17:38:56 +0100
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
 <57b22a4f-3b7e-d62d-d9a7-f9f4e052c253@gmail.com>
 <947f9c1f-fd48-cb18-e495-7e275f1792b9@linaro.org>
From:   Jan Jasper de Kroon <jajadekroon@gmail.com>
In-Reply-To: <947f9c1f-fd48-cb18-e495-7e275f1792b9@linaro.org>
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


Op 19-03-2023 om 15:09 schreef Krzysztof Kozlowski:
> On 17/03/2023 11:39, Jan Jasper de Kroon wrote:
>> Op 16-03-2023 om 20:25 schreef Krzysztof Kozlowski:
>>> On 16/03/2023 16:29, Jan Jasper de Kroon wrote:
>>>> Add an optional 'goodix-hold-in-reset', to the Goodix touchscreen
>>>> device tree binding. When set to true, the touchscreen controller will
>>>> be held in reset mode during system suspend, reducing power consumption.
>>>> If not present, the property defaults to false.
>>>>
>>>> Signed-off-by: Jan Jasper de Kroon <jajadekroon@gmail.com>
>>> Don't attach new patchsets to some other threads. It messes with our
>>> tools and reading/reviewing process.
>> Thank you for bringing this to my attention. I apologize for any
>> inconvenience caused by attaching the patchset to the wrong threads. As a
>> new user of LKML, I'm still learning the appropriate protocol for
>> submitting patches. Going forward, I will ensure to attach patchsets to
>> the correct threads.
>>>> ---
>>>> Changes from v2 to v3:
>>>> - Used imperative mood instead of "This patch adds".
>>>> - Dropped "I am submitting this patch to..." as it is redundant.
>>>> - Removed the paragraph related to the related patch sent to the
>>>>     linux-input mailing list as it is not necessary.
>>>> - Renamed the hold-in-reset-in-suspend function to
>>>>     goodix-hold-in-reset to prevent potential naming conflicts with other
>>>>     functions in the codebase. No functional changes were made.
>>>>
>>>> Changes from v1 to v2:
>>>> - Updated subject prefix to match subsystem.
>>>> - Added more detailed description of the change.
>>>> - Fixed formatting issues in commit message.
>>>>    .../devicetree/bindings/input/touchscreen/goodix.yaml     | 8 ++++++++
>>>>    1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>>>> index 3d016b87c8df..197f8db9acc2 100644
>>>> --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>>>> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>>>> @@ -56,6 +56,13 @@ properties:
>>>>      touchscreen-size-y: true
>>>>      touchscreen-swapped-x-y: true
>>>>    
>>>> +  goodix-hold-in-reset:
>>> That's not a vendor prefix... missing coma.
>> Thank you for pointing out the mistake in the vendor prefix. I appreciate
>> your feedback and apologize for any inconvenience caused. I wasn't aware
>> of the correct vendor prefix style, but I've learned from developer Hans
>> de Goede that it should be "goodix,hold-in-reset." I will make sure to
>> correct this in my local branch and ensure that it is applied correctly in
>> the future. Thanks again for bringing this to my attention.
>>>> +    description: |
>>>> +      When set to true, the touchscreen controller will be held in reset mode
>>>> +      during system suspend. This can help reduce power consumption, but may
>>>> +      cause the touchscreen to take longer to resume when the system is woken
>>>> +      up from suspend.
>>> Anyway, my concerns were not answered, so to be clear:
>>>
>>> NAK till you answer them. Do not send new versions without answering
>>> existing concerns and discussion.
>> Thank you again for reviewing my patchset and providing feedback. I
>> appreciate your time and effort in ensuring the quality and suitability
>> of the DeviceTree.
>>
>> Regarding the concerns you raised about the proposed feature, I would
>> like to address them directly. You mentioned that the property does not
>> look suitable for Devicetree because it describes system policies that are
>> not within the scope of Devicetree. While I understand your point, I
>> believe this property is appropriate for Devicetree for the following
>> reasons:
>>
>> - The property directly relates to the hardware configuration of the
>>     device, specifically the touchscreen controller, and is not a software
>>     policy.
> Keeping device in reset state is not hardware configuration but driver
> behavior. You did not Cc us on all patches for some reason, so it's
> difficult to judge what exactly your driver is doing.
Thank you for your response. I apologize for not including all the
necessary information in my previous messages. Like you are already aware,
the DT patch is only one part of the solution, and the driver part has
been submitted to the linux-input mailing list. Here is the link to the
latest patch submission:
https://lore.kernel.org/all/20230316152159.66922-1-jajadekroon@gmail.com/

I understand that it may have been difficult to judge what the driver is
doing without the complete context. The original patch consists of two
'out-of-tree' commits, one that attempts to power off the touchscreen device
controller completely, including the regulators:
https://github.com/megous/linux/commit/a38e3e2900c69f5b9961aca8e003c21950453857
and another that reverts disabling the regulators:
https://github.com/megous/linux/commit/cafc7adf456c03eb4564c2ba750a5345b9c6ceed
The reason for this is that different peripherals are attached to the same
power supply in the case of the PinePhone Original and PinePhone Pro.

I hope this clarifies part of the situation. If you have any further
questions or concerns, please do not hesitate to let me know.
>
>> - The property is required for proper system operation and is not optional
>>     in specific device use cases. To be more specific in the case of the
>>     PinePhone Original and Pro. The original commit message of the driver
>>     implementation in driver/input/touchscreen contained the following:
>>     "It consumes quite a bit of power (~40mW) during system sleep, and more
>>     when the screen is touched."
>>     Because the phone is usually kept in your pocket, so prone to a lot of
>>     screen touches, this is highly undesired behavior for the touchscreen in
>>     this case. This in my opinion makes it a mandatory property in this
>>     situation.
> Why then the touchscree should not be kept in reset for other devices?
> IOW, this should be always used. If you now say "I prefer to keep or not
> keep it in reset for my device" - it's a policy.
Thank you for your question. While it's true that keeping the touchscreen
in reset state during system sleep can reduce power consumption for other
devices, the decision to use this property should be based on the specific
use case and hardware configuration of each device. In the case of the
PinePhone Original and Pro, the touchscreen's power consumption during
system sleep is significant, and the device is often kept in a pocket, so
accidental screen touches can occur frequently, leading to further power
drain. As such, keeping the touchscreen in reset state is necessary for
proper system operation in these specific devices. However, for other
devices with different hardware configurations and use cases, the decision
to use this property should be based on a thorough assessment of the power
consumption and potential impact on system behavior.
>
>
>> - The property is not a user-facing configuration option and is not meant
>>     to be changed by the end-user.
> Does not matter.
>
>> - The property, although in separate device specific kernel, and still
>>     called 'poweroff-in-suspend' is already in use on specific devices,
>>     including the PinePhone Original and PinePhone Pro.
> I could not find such property in the kernel.
I apologize for the confusion, but the current mainline kernel doesn't
include this property. As I stated to support the PinePhone Original and
PinePhone Pro, the community makes use of a forked mainline kernel, with
a lot of out-of-tree patches/commits, mainly maintained by developer
Ondrej Jirman. For the PinePhone Original, the DeviceTree configuration
in the PinePhone DTS gets set in the following commit:
https://github.com/megous/linux/commit/74fc0a5f0527afdccb67ce3be690f0ae18c8eca6
For the PinePhone Pro it is set in the following commit, at line 466:
https://github.com/megous/linux/commit/471c5f33ba74c3d498ccc1eb69c098623b193926#
The property here is still called "poweroff-in-suspend".
>
>> However, I understand your concern that Devicetree should not be used for
>> policies. To address this concern, I would like to propose the following
>> changes to the property description:
>> 1. Remove the sentence about reducing power consumption, as this could be
>>      considered a policy.
>> 2. Emphasize that the property is a required hardware configuration and
>>      not an optional feature on certain devices.
>> 3. Recommend that any changes to the property value should only be made by
>>      experienced system administrators and not end-users.
> Please answer - why this should not be enabled always.
One reason why the Touchscreen Controller should not be kept in reset
always is that some devices may have a use case where the touchscreen
needs to remain active even during system sleep, and keeping it in reset
would cause issues with that case. However, in the case of the
battery-powered PinePhone Original and Pro, keeping the touchscreen
controller in reset during system sleep is required for proper system
operation. Having the device in your pocket makes unintentional screen
touches almost unavoidable, and this property enabled is necessary for
these devices. In the case of the PinePhone Original and Pro, enabling
this feature we do consider its impact on battery life or in other words
power consumption.
But bottomlined, enabling this feature should be evaluated on a
case-by-case basis, taking into consideration the specific device use case
and hardware configurations. Thank you for your feedback.
>
> Best regards,
> Krzysztof
>
