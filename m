Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9995FDAB7
	for <lists+linux-input@lfdr.de>; Thu, 13 Oct 2022 15:22:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbiJMNWb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Oct 2022 09:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbiJMNW0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Oct 2022 09:22:26 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DB4F4198
        for <linux-input@vger.kernel.org>; Thu, 13 Oct 2022 06:22:23 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id w18so2810726wro.7
        for <linux-input@vger.kernel.org>; Thu, 13 Oct 2022 06:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/A5M/mERnholVn2sPhllr5YgwOSnfIz8uR3LS/h5QWE=;
        b=JVsZ5Ne5IoFw/6lLM2Z+zUzAl/UqQKH5ocJHyB/wFFpTeMtrMGMGAikZpm1S8siyAs
         3LI4AzEMTO0rCv7SwQqXBtojACXkUsIgwJgD2eFPWTNYDGQkMOonfYtxpt3vEe4pTxi9
         fei8Lm7Pstpha26mYXnkInKqSQsT/uoxCzsT9YYJTFvvooaywZx/aANtaMY7FuENzpHn
         5T6uegYWQwapWdPebllY8f7G1hjkvb4Bm0z2xm/1ojZX3UL6NxSctiPuPIj4iP33biuW
         ZiNBFKIeTxkLHWXLZNCLubXGJRrvhOhETU3Gi4wD11xO2sYS3ePzlAdChAP91FoeKyDC
         nwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/A5M/mERnholVn2sPhllr5YgwOSnfIz8uR3LS/h5QWE=;
        b=V7wG9wYIM34mBTmdzj61gse4UGJllB2P32Cq+7u7mZUJMfikF1VzOnF2BOTL9VHfuL
         0kQWzlrJAHGfkeIEo036GqgMSDL4t2dozD9/cXfBfdlK1KT6tgjCdB1Fj8md+dI2LVuM
         17kbM9q9El49SDph2RV6GfC0lDJnL+1VK2TFtiJewE2EDCKqTLyKgoBOTwFNk2Thareu
         gcT+dkVBQN1b55HPMMoYguIQG8eoRBgU1OghGGQ4JGeUMqrPYvJQv7ZYLLppkMsa+Njp
         nINs+R2VwIQbaRTqmGrpGURsn14ahah+jVAeu4TLok8vHzfu654BHwDgHDuE0k17sLma
         z3ug==
X-Gm-Message-State: ACrzQf30f8LwohNYvn4T2FYuh103CsmL7xRnVtT1eK177X0IFzvXmsnI
        onOcTCmbIWjwhqpJ1LZ0JWkui4ofvYjAvImnmrKI1g==
X-Google-Smtp-Source: AMsMyM42+wJuePysW3q25cWDaRQocIly51kR7f7+oxcIFEVdZpzwuYLtz7MrX5w8AAflktcRjAS/qg==
X-Received: by 2002:adf:dec3:0:b0:22e:6efe:7861 with SMTP id i3-20020adfdec3000000b0022e6efe7861mr21667996wrn.454.1665667341768;
        Thu, 13 Oct 2022 06:22:21 -0700 (PDT)
Received: from [192.168.1.91] (192.201.68.85.rev.sfr.net. [85.68.201.192])
        by smtp.gmail.com with ESMTPSA id u8-20020adfdb88000000b0022e035a4e93sm2083628wri.87.2022.10.13.06.22.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 06:22:21 -0700 (PDT)
Message-ID: <81e3a8d8-9c20-6711-f2c9-54c366aab276@baylibre.com>
Date:   Thu, 13 Oct 2022 15:22:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v6 6/6] arm64: defconfig: Add tps65219 as modules
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, nm@ti.com,
        kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee@kernel.org, tony@atomide.com, vigneshr@ti.com,
        bjorn.andersson@linaro.org, shawnguo@kernel.org,
        geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, arnd@arndb.de, jeff@labundy.com
Cc:     afd@ti.com, narmstrong@baylibre.com, msp@baylibre.com,
        j-keerthy@ti.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-omap@vger.kernel.org
References: <20221011140549.16761-1-jneanne@baylibre.com>
 <20221011140549.16761-7-jneanne@baylibre.com>
 <72b9809e-d6d7-862a-26b8-221d14ea4322@linaro.org>
 <60507e87-cf92-13d9-29d0-83f18a648f4b@baylibre.com>
 <fc1e5799-20ea-de37-6693-e2ea0fb87f13@linaro.org>
 <7hzge1hqof.fsf@baylibre.com>
 <8d27a5f6-461a-5b28-1560-07bb4ddcaa8a@linaro.org>
From:   jerome Neanne <jneanne@baylibre.com>
In-Reply-To: <8d27a5f6-461a-5b28-1560-07bb4ddcaa8a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 13/10/2022 14:32, Krzysztof Kozlowski wrote:
> On 12/10/2022 13:56, Kevin Hilman wrote:
>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:
>>
>>> On 12/10/2022 04:39, jerome Neanne wrote:
>>>>> You explained what you did, which is easily visible. You did not explain
>>>>> why you are doing it.
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>>
>>>> Thanks for pointing me to the detailed guidelines
>>>> I'm new to upstream and not well aware of all good practices.
>>>>
>>>> Would below commit message be more suitable:
>>>>
>>>> Add support for the TPS65219 PMIC by enabling MFD, regulator and
>>>> power-button drivers.  All drivers enabled as modules.
>>>
>>> This still says only what you did. I still does not explain why.
>>
>> Jerome, maybe adding a bit of preamble like:
>>
>> "Development boards from TI include the TPS65219 PMIC.  Add support..."
> 
> I would propose: "Development boards from TI with xxx SoC include the
> ..." because the point is that you use this defconfig for boards for
> given SoC (supported by upstream).
> 
> Other way would be "Foo-bar development board includes the TP..."
> 
>>
>> Krzysztof, I'm the first to argue for descriptive/verbose changelogs,
>> but IMO, this is getting a little bit nit-picky.
>>
>> The series adds a new driver, DTS and defconfig patches to enable
>> support the new driver.  The "why" for changes to defconfig changes like
>> this are kind of implied/obvious, and there is lots of precedent for
>> changelogs of defconfig changes for simple drivers to simply say "enable
>> X and Y".
> 
> While I understand the entire patchset, the defconfig goes via separate
> tree/branch and must stand on its own. Later (one month, one year, one
> decade) someone will look at history and wonder why the heck we enabled
> TPS65219.
> 
>>
>> If my above suggesion is not enough, please make a suggestion for what
>> you think would qualify as an appropritate changelong that answers "why"
>> for a simple driver change.
> 
> It is enough :)
> 
> Best regards,
> Krzysztof
> 
Got it! I'll rephrase following your suggestion
