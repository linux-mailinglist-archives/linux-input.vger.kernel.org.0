Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFD5376482E
	for <lists+linux-input@lfdr.de>; Thu, 27 Jul 2023 09:14:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233266AbjG0HOq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Jul 2023 03:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233020AbjG0HO0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Jul 2023 03:14:26 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DBE66A7E
        for <linux-input@vger.kernel.org>; Thu, 27 Jul 2023 00:09:04 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5227e5d9d96so745209a12.2
        for <linux-input@vger.kernel.org>; Thu, 27 Jul 2023 00:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690441644; x=1691046444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oJ3iHUocjz5azHHmivuhMASDBNzfIodCAVzG/5NiGO0=;
        b=VW+SUZtz34/K5jgfTm0codxNzt5XD4i6BqDFLscYtjf3V/OGGZeiwsD7WuofDFe/oG
         6MVeHKxa7o5PvJlhMd/ZghRYdR5/2Cy2rcMJbNDeJLyIsNfmhvvowPJSZFeLFUSSZyV9
         B6DxzR2aIkPBsC762JB+W6zZEMnVFIqBWA+zrZkJfvSuynBeFEB1axvXlGKD6rUD9zLZ
         /prwQZEH5BxeMAHEKAUpQlZ0/xKC5NTtkOlUkQuBmJTWzIynJ3G3n7S54bAMrvOK4ivw
         xewg0+dKtVAqDYmShfPpYnY+g+JwtzZdBT4XcyX1p7NWI66VdTMymnNIrKJXjGJ6zWoq
         OhfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690441644; x=1691046444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oJ3iHUocjz5azHHmivuhMASDBNzfIodCAVzG/5NiGO0=;
        b=Sd2OlvGATRrkNtwPLvbmQpm7XqM0y5ehCXpf8ey5T5DwKAF0h+A42uHulofL/gdF6N
         W5VkGnyHnkdyQ5k5bxzmk5z2vwnIw4Xx7w+0YlkfABW2rDGXoidTotsPAIffvik89/z6
         D7j1Gxbj9bQiiUevrhZEP7VDB+diaLnK0AKO67aV/567WJD/BadG71UXGTyR9JuVkIMd
         OR1I+Gt35f7owqgeweBgjUdFzENANLAlcYq+T7T2yWaAcY3ePc5tjQUr9nY3RaVpBohX
         AOU26LgipaSGvA3GowGtnG5vo3bb86V1mMlpuf/2hgJZSuUj1zrTrBBBriaJyzULDFZJ
         9x6g==
X-Gm-Message-State: ABy/qLbTaGuXxWUGiKQPqVzCBArUfQqMNReIPW8TsdntUBRR1YkIekZN
        6lyOuglldz9Lag74fbDYaGVE2g==
X-Google-Smtp-Source: APBJJlGPpR6s2Rl0aQaM0oE5CwW2zNznwrxl8Dr87b4TcA4rBfJQ5WUmas85Y+U7Wv67dFHSs9jLig==
X-Received: by 2002:a50:ed91:0:b0:522:55bf:21af with SMTP id h17-20020a50ed91000000b0052255bf21afmr1117154edr.7.1690441644127;
        Thu, 27 Jul 2023 00:07:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id a18-20020aa7d752000000b0051dd16f7e50sm308004eds.44.2023.07.27.00.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 00:07:23 -0700 (PDT)
Message-ID: <2a09e743-7423-65b0-c70d-87ae8105182a@linaro.org>
Date:   Thu, 27 Jul 2023 09:07:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/3] input: pm8xxx-vib: refactor to easily support new
 SPMI vibrator
Content-Language: en-US
To:     Fenglin Wu <quic_fenglinw@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, andersson@kernel.org,
        dmitry.baryshkov@linaro.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     quic_collinsd@quicinc.com, quic_subbaram@quicinc.com,
        quic_kamalw@quicinc.com, jestar@qti.qualcomm.com
References: <20230725054138.129497-1-quic_fenglinw@quicinc.com>
 <20230725054138.129497-2-quic_fenglinw@quicinc.com>
 <5dd56c31-7ca3-dd39-0623-e4fd18ac6f68@linaro.org>
 <053c9571-d709-2826-fced-a00dd7255b8b@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <053c9571-d709-2826-fced-a00dd7255b8b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 25/07/2023 08:16, Fenglin Wu wrote:
>>>   
>>> -static const struct pm8xxx_regs pm8058_regs = {
>>> -	.drv_addr = 0x4A,
>>> -	.drv_mask = 0xf8,
>>> -	.drv_shift = 3,
>>> -	.drv_en_manual_mask = 0xfc,
>>> +static struct reg_field ssbi_vib_regs[VIB_MAX_REG] = {
>>
>> Change from const to non-const is wrong. How do you support multiple
>> devices? No, this is way too fragile now.
>>
> 
> The register definition is no longer used as the match data, hw_type is 
> used.
> 
> The last suggestion was getting the register base address from the DT 
> and it has to be added into the offset of SPMI vibrator registers 
> (either in the previous hard-coded format or the later the reg_filed 
> data structure), so it's not appropriated to make it constant.
> 
> I don't understand this question: "How do you support multiple devices?" 
> For SSBI vibrator, since all the registers are fixed, and I would assume 
> that there is no chance to support multiple vibrator devices on the same 
> SSBI bus. If they are not on the same bus, the regmap device will be 
> different while the registers definition is the same, and we are still 
> able to support multiple devices, right?

No, you have static memory. One device probes and changes static memory
to reg+=base1. Second device probes and changes the same to reg+=base2.

> The similar story for SPMI vibrators and it can support multiple devices 
> if they are located on different SPMI bus, or even if they are on the 
> same SPMI bus but just having different SID or PID.

Sorry, such code cannot go in. These must stay const and you must write
driver without any static allocations or singleton-like patterns.


Best regards,
Krzysztof

