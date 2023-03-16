Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9921B6BD905
	for <lists+linux-input@lfdr.de>; Thu, 16 Mar 2023 20:24:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbjCPTYl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Mar 2023 15:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbjCPTYd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Mar 2023 15:24:33 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9FFC4EB0
        for <linux-input@vger.kernel.org>; Thu, 16 Mar 2023 12:24:10 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id x3so11763995edb.10
        for <linux-input@vger.kernel.org>; Thu, 16 Mar 2023 12:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678994649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SzpppHgdp3HaoNlsJcnGIedojO2IG2V6oWwyMef5ZzU=;
        b=SyLW7vL3Tn3yQ2sLcLkqMAbdCOxJhaNmygl1xALrzLufsF5n/p9TAqJoBTPVQEsygS
         ynAJlWo7kGe3KrLI1oczcsA+fmf+cKrlt3borfuHX2bysAzRuiyN/OB6e+DDUFX5vhmw
         beqJQi8Q0WR9EYFN5cdNFFL45TNClLYGWPKqBAj8KH87lEft+OAELJCX4wqRCSLCOC0b
         r+/PNjXn/oAjClPaUW447ppL1Y+P9v+qBaDuogGyboolKcyHpqadYfXRss8GcX7zJWZ4
         wR4oAudAEArnf/ehWWUMK8WI5w80iKdPVoCHCh2XtDGcajEvHdsXbeGJ9Qt7tUpvdRkH
         nwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678994649;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzpppHgdp3HaoNlsJcnGIedojO2IG2V6oWwyMef5ZzU=;
        b=S8CtDmnxgWtquN+BXySMxyxqtfHg1l9gCvcM1OkU1YfHNTtXi/qIpCYYEGnK/bd/HD
         cKtgf3QEKzoLj4X36hgEhoSJiPcXx9YEk1pOO907FICTofqs0u/+2eWF+YDMHWK3bvtc
         iAX6xOr0zry04/5Y2a3nvl9izxVY5Vjrphe954zeS/Lrd0GgzjECN1XG+io/uT2c1kXY
         TV+4YXWXfA0/ibhhmQlPree7uVcq3nvUiMxCqE9QhKnMKt5Ato+V7rRVU5e1h33M21EA
         IGr1NxA5Me5cYaWLgoX8gvXBzWPB0ZsiT0qxC1ptFVCud+emCIKwNSdwcAJ/cRySlzxu
         lKsA==
X-Gm-Message-State: AO0yUKWNHbBdmG5bTo5+78bOm4ZugA12IwBl98svz8PfXZQk4yUgFglW
        tquAmDRmShasIOCsWuaSg22/ZQ==
X-Google-Smtp-Source: AK7set8gHfAjemPrL6RUamqLp74FM/6pqGNqaxHeGFQnw8reoXzMaHfjYhzOaALtINM5R6UDMskg0g==
X-Received: by 2002:a17:906:9f26:b0:92e:c4c9:7a43 with SMTP id fy38-20020a1709069f2600b0092ec4c97a43mr6844035ejc.25.1678994649358;
        Thu, 16 Mar 2023 12:24:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm10006ejk.114.2023.03.16.12.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 12:24:08 -0700 (PDT)
Message-ID: <f30be3ad-bcb0-b423-e4f9-e7c645131887@linaro.org>
Date:   Thu, 16 Mar 2023 20:24:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/2] dt-bindings: input: touchscreen: Add
 'hold-in-reset-in-suspend' property to goodix
Content-Language: en-US
To:     Jan Jasper de Kroon <jajadekroon@gmail.com>
Cc:     devicetree@vger.kernel.org, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        broonie@kernel.org, alexandre.belloni@bootlin.com,
        kernel@undef.tools, linux-input@vger.kernel.org
References: <20230311134655.486973-1-jajadekroon@gmail.com>
 <20230312183106.551840-1-jajadekroon@gmail.com>
 <4cdefb22-52ea-8f8f-12d2-7a07478f167c@linaro.org>
 <e33fbb3b-0ca2-f13c-607d-23e28f3c2cf4@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e33fbb3b-0ca2-f13c-607d-23e28f3c2cf4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 16/03/2023 16:41, Jan Jasper de Kroon wrote:
>> Anyway, the property does not look suitable for Devicetree. You describe
>> system policy - trade off between energy saving and responsivness to the
>> user. DT is not for policies. Use other interfaces for configuring it,
>> e.g. some user-space, existing PM interfaces or /sysfs (which is ABI and
>> needs its Documentation).
>>
>>
>>> +
>>>   additionalProperties: false
>>>   
>>>   required:
>>> @@ -75,6 +84,7 @@ examples:
>>>           interrupts = <0 0>;
>>>           irq-gpios = <&gpio1 0 0>;
>>>           reset-gpios = <&gpio1 1 0>;
>>> +        hold-in-reset-in-suspend;
>>>         };
>>>       };
>>>   
>> Best regards,
>> Krzysztof
>>
> I think the latest patch covers most of the feedback you provided.
> Regarding the addition of this feature to the DeviceTree. Currently this
> is only used on the Linux powered PinePhone Original and PinePhone Pro. It
> also isn't really a policy change, 

What is "policy change"? I said it is system policy.

> but rather an attempt to minimize
> battery consumption on these power hungry devices.

We do not talk about the goal, but whether this is property of
Devicetree or not.

>  Developers made a lot
> of tweaks here and there, to make the PinePhone get through a day of light
> use. This is one of these tweaks.

Awesome, how is this related to my concerns that it is not suitable for
Devicetree? Developers can invent thousands of things, shall we put them
all to Devicetree?

Bring specific arguments to my questions. Arguing that it is not a
"policy change" is not related to my question. Just like calling
something tweaks.


Best regards,
Krzysztof

