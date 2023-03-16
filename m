Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEF26BD42A
	for <lists+linux-input@lfdr.de>; Thu, 16 Mar 2023 16:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231822AbjCPPma (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Mar 2023 11:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbjCPPmF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Mar 2023 11:42:05 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BBFAB5B7D;
        Thu, 16 Mar 2023 08:41:30 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id fd5so9320409edb.7;
        Thu, 16 Mar 2023 08:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678981287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q+nuWP+hunCHgH34OrZWojRSS0xsBlRi/N4vszqR+s0=;
        b=Yx7BpAnR5LT0mAqPbK6T65JPQoUCUnE1kvfCHZG/1KMrL2jYR1UKI6sROd/zYA0mzl
         AzT0IItgyVWc968sjXGm2d0won2CJvnY02QB0DEG9155J0W7tVMrCHMwJWVwn9GFAkYj
         a5E/PytkOZBeXl0+lrpBIW6UXL5IzQZQS3td4CQLXyGLNXb4/+glIMUdsuGRj1T9pvwi
         sonW9ixMahJbrVSf+3hynJR8vkdmskYZKPiNs3wPyv6J9mehEZHpPh+uD+Edf4ms35VX
         T3dVCjbC9TXqfLbUZYRJugjSvgmspmpbDvCF8/Sxy6WCWAAMIvPZutp+YkngwLPYO+lD
         mW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678981287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+nuWP+hunCHgH34OrZWojRSS0xsBlRi/N4vszqR+s0=;
        b=CyeZYiCnbXiF+qq9D52kt4JFf8kItXmEsN+oA0nx9UdZ+66m9T3He3fv1L5uthHTro
         bjVPaBXxB1ao55aTKpRzhChp1wuzquz5qDd2bTnQpb3MTlbi7IpAbJZahqQOw4wfNBbt
         xEk2jMnsy5rt8lDug7UKvREswCMl43Yl/WlXzwoS5MyfbEuTWaGRIJA56s1bpwRobm81
         LV0Y0a+b1viJaQsR/MzYMOq/Z0HDnYIJKvRfQdluUsO2xjtpryy0+X7C8cZ1PGvs+Lm2
         p2IL9A4dCuKSD3d6EE2qqx/MQMMPN1udQYx7WYyH0yOqPKX2YfQYolalD+JftUwDi1/p
         AtKw==
X-Gm-Message-State: AO0yUKWROJC+tbi/NtN8AV6/ukjcFvBRrvV9K8+e9IhddI3nBjG7VNP3
        7gdswjsl9jnaDTrO1CcaPdA=
X-Google-Smtp-Source: AK7set8ix7X5V0BwiLMrwhxNY9QwoWqWUzWOqmmQUyK+TGCYVlRiNG+Ub00at0ru6PulN9tjQ0BM7g==
X-Received: by 2002:a05:6402:180d:b0:4fb:994d:42c9 with SMTP id g13-20020a056402180d00b004fb994d42c9mr11728edy.24.1678981286835;
        Thu, 16 Mar 2023 08:41:26 -0700 (PDT)
Received: from [192.168.99.196] (84-84-8-249.fixed.kpn.net. [84.84.8.249])
        by smtp.gmail.com with ESMTPSA id co2-20020a0564020c0200b004fce9ff4830sm3959433edb.88.2023.03.16.08.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 08:41:26 -0700 (PDT)
Message-ID: <e33fbb3b-0ca2-f13c-607d-23e28f3c2cf4@gmail.com>
Date:   Thu, 16 Mar 2023 16:41:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 1/2] dt-bindings: input: touchscreen: Add
 'hold-in-reset-in-suspend' property to goodix
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        broonie@kernel.org, alexandre.belloni@bootlin.com,
        kernel@undef.tools, linux-input@vger.kernel.org
References: <20230311134655.486973-1-jajadekroon@gmail.com>
 <20230312183106.551840-1-jajadekroon@gmail.com>
 <4cdefb22-52ea-8f8f-12d2-7a07478f167c@linaro.org>
From:   Jan Jasper de Kroon <jajadekroon@gmail.com>
In-Reply-To: <4cdefb22-52ea-8f8f-12d2-7a07478f167c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Op 14-03-2023 om 18:47 schreef Krzysztof Kozlowski:
> On 12/03/2023 19:31, Jan Jasper de Kroon wrote:
>> This patch adds a new optional property, 'hold-in-reset-in-suspend', to the
> Do not use "This commit/patch", but imperative mood. See:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
>
>> Goodix touchscreen device tree binding. When set to true, the touchscreen
>> controller will be held in reset mode during system suspend, reducing
>> power consumption. If not present, the property defaults to false.
>>
>> I am submitting this patch to the Device Tree mailing list to add a new
> Drop the "I am ..." Same comment as above.
>
>> property to the Goodix touchscreen device tree binding. This patch
>> supplements a related patch sent to the linux-input mailing list, which
>> updates the Goodix touchscreen driver to use this new property.
> Anyway entire paragraph does not look related to commit msg. Drop it.
>
>> The
>> linux-input patch can be found at:
>> https://lore.kernel.org/all/20230311131534.484700-1-jajadekroon@gmail.com/
> Also this. It should be rather places under ---.
>
>> Signed-off-by: Jan Jasper de Kroon <jajadekroon@gmail.com>
>> ---
>> V1 -> V2:
>> - Updated subject prefix to match subsystem
>> - Added more detailed description of the change
>> - Fixed formatting issues in commit message
>>   .../devicetree/bindings/input/touchscreen/goodix.yaml  | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>> index 3d016b87c8df..cd4dd3d25364 100644
>> --- a/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>> +++ b/Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
>> @@ -56,6 +56,15 @@ properties:
>>     touchscreen-size-y: true
>>     touchscreen-swapped-x-y: true
>>   
>> +  hold-in-reset-in-suspend:
> Missing vendor prefix.
>
>> +    type: boolean
>> +    default: false
> Drop default.
>
>> +    description: |
>> +      When set to true, the touchscreen controller will be held in reset mode
>> +      during system suspend. This can help reduce power consumption, but may
>> +      cause the touchscreen to take longer to resume when the system is woken
>> +      up from suspend. Defaults to false if not present.
> Drop last sentence.
>
> Anyway, the property does not look suitable for Devicetree. You describe
> system policy - trade off between energy saving and responsivness to the
> user. DT is not for policies. Use other interfaces for configuring it,
> e.g. some user-space, existing PM interfaces or /sysfs (which is ABI and
> needs its Documentation).
>
>
>> +
>>   additionalProperties: false
>>   
>>   required:
>> @@ -75,6 +84,7 @@ examples:
>>           interrupts = <0 0>;
>>           irq-gpios = <&gpio1 0 0>;
>>           reset-gpios = <&gpio1 1 0>;
>> +        hold-in-reset-in-suspend;
>>         };
>>       };
>>   
> Best regards,
> Krzysztof
>
I think the latest patch covers most of the feedback you provided.
Regarding the addition of this feature to the DeviceTree. Currently this
is only used on the Linux powered PinePhone Original and PinePhone Pro. It
also isn't really a policy change, but rather an attempt to minimize
battery consumption on these power hungry devices. Developers made a lot
of tweaks here and there, to make the PinePhone get through a day of light
use. This is one of these tweaks.

Best regards,
Jan Jasper de Kroon

