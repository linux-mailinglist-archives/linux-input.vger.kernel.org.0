Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75A01641B0E
	for <lists+linux-input@lfdr.de>; Sun,  4 Dec 2022 07:12:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbiLDGMo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Dec 2022 01:12:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbiLDGMn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 4 Dec 2022 01:12:43 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD5EFD113
        for <linux-input@vger.kernel.org>; Sat,  3 Dec 2022 22:12:41 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id h10so9965439ljk.11
        for <linux-input@vger.kernel.org>; Sat, 03 Dec 2022 22:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/zPJv0fTLzr1q+VN+M3Bu1MPbuWQ/F54YNQa6Nnzs3I=;
        b=bbPUcPl7osRML+x7kj1Ub+f/yGmXQfQPBOrLmGQ1R+SwlQsMzARF4I+5FldUvWn1M0
         9KHccRiyZpNNIgRStx38GCpDgSFWOMsAZI2XjAxa8vfiRqWsjfGrjanS3fKL0IoRz7YK
         p41F/+MTlmYambM649Mlz84PI+yGXviIiYoUWx1N5ijUCw559jrLKC+ITdFwH8/aUlI7
         qS8TcIrxtv5LeKFgIr8/NEwl8zOY3z0SwWoYhtLaC7SG5gqkixTwXhW9RrlbYDglOa60
         PN5Ft1jmVV1lunPNv2xK7j3aAPJxTNUzPJQv73BNNNdegDMc4ici9K6adycbQvJ4d2h6
         b1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/zPJv0fTLzr1q+VN+M3Bu1MPbuWQ/F54YNQa6Nnzs3I=;
        b=ZSd7FwU540a7whp39rAuz3MmYzJQuoxSLNB3StGytA8HL2Z5BYNT0OZIxW4Vfk7+le
         agwIWvlZ9rVuNXS6efWnvqAO8iaXcbQe5RjA/0/sgnZ6zBRwMLFE7cfS/syAAKar14fw
         dvlVSYMAj85LeMClzWWyrPwJdcd4xGsOmUnxho3A7TcM8JWT++rv2vYilsK5ejATJjA4
         EivzJ0ahg6u37neT82c2UqXc9U9+JdvFF/vUbQX1K09gnm6425Nt1Fgu90TeuJ737euR
         liHQNvVuaOM7IwmtJLQPa0bsJlpJhAXEr7wu4bfQsFI4zP6LEha3RR2uQf5+aH5hjIpT
         5Zig==
X-Gm-Message-State: ANoB5plSn6mOiSb60QPuMvTNy2ZIoUXV/rLC8qyWPjKvy/aticAB5+/P
        a4WzB7AfPSfiIZZcY52NkYcUGQ==
X-Google-Smtp-Source: AA0mqf4u2MjbOsusSUuQyuKanu7jXfRxRm+3xbKewkCPZwdPguWLck4uPeiqSBJ/+ku1tQaLEVLLzw==
X-Received: by 2002:a2e:82c8:0:b0:279:d247:364d with SMTP id n8-20020a2e82c8000000b00279d247364dmr3967312ljh.330.1670134360062;
        Sat, 03 Dec 2022 22:12:40 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t8-20020a056512208800b00496d3e6b131sm1650571lfr.234.2022.12.03.22.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Dec 2022 22:12:39 -0800 (PST)
Message-ID: <af61872c-425e-6b50-d297-0c01f3262ca6@linaro.org>
Date:   Sun, 4 Dec 2022 08:12:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/5] dt-bindings: leds: pm8058: convert from txt to YAML
 format
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
References: <20221201202144.448694-1-dmitry.baryshkov@linaro.org>
 <20221201202144.448694-3-dmitry.baryshkov@linaro.org>
 <dd25f550-aee1-82af-a58d-eedb4b73a546@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <dd25f550-aee1-82af-a58d-eedb4b73a546@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 02/12/2022 10:30, Krzysztof Kozlowski wrote:
> On 01/12/2022 21:21, Dmitry Baryshkov wrote:
>> Convert the bindings for the leds subdevice of Qualcomm PM8058 PMIC
>> from text to YAML format.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../devicetree/bindings/leds/leds-pm8058.txt  | 67 ---------------
>>   .../devicetree/bindings/leds/leds-pm8058.yaml | 81 +++++++++++++++++++
>>   2 files changed, 81 insertions(+), 67 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/leds/leds-pm8058.txt
>>   create mode 100644 Documentation/devicetree/bindings/leds/leds-pm8058.yaml
>>
> 
> This is already done:
> 
> https://lore.kernel.org/all/20221201131505.42292-1-krzysztof.kozlowski@linaro.org/

I'll post next version, rebased on top of your patch

> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry

