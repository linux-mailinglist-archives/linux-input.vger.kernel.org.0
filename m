Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F339724BE2
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 20:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237163AbjFFSzk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 14:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239099AbjFFSzk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 14:55:40 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04FE2E40
        for <linux-input@vger.kernel.org>; Tue,  6 Jun 2023 11:55:38 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f7378a75c0so25670085e9.3
        for <linux-input@vger.kernel.org>; Tue, 06 Jun 2023 11:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686077736; x=1688669736;
        h=content-transfer-encoding:in-reply-to:subject:organization
         :references:cc:to:content-language:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WF84323liifZi1X4RPGsffn6FGJtYs7l55Hl/A+Mj44=;
        b=JAOB0+kh1vSX3idIL/rmdxFvoBbODqG5NOuctGiVfsDv054ZAxp2vZ7/fO/UzOWbLr
         kff7kWXFbDZph9g4kGpjeZ5v7xJ19kkYhGw/U7q98tZZz48rujZ2G5mzufn7OZxo2gwp
         o3+oKFzKJxs9rGKdQ0htR33AYx6u7oc8jrC9+iyyX3t7k+XERPGsQ7lUsoYHg8lTAIhD
         +FzM/AmenlzKWgZ0DYUOT5ihe7QhgNfnBTbfh8gRayHGWhJjPByclj3vBF4ZV743NCOP
         duAp2zdi0Efa4XuTUCDZTla6AiwJu2vXBNpm77yJpiOlUivsbKlytz9uLggqAZXqR+3s
         PCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686077736; x=1688669736;
        h=content-transfer-encoding:in-reply-to:subject:organization
         :references:cc:to:content-language:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WF84323liifZi1X4RPGsffn6FGJtYs7l55Hl/A+Mj44=;
        b=d4BLylIaiA+SItOTs2MJar+f4MFdQ39hRAzBcf+5yI7SACmiC3l/eeip2AqsvyptET
         N/Mep0fm6uoDP1JtYW6GnL1107c1o2swkK/r4wiE0ArBgLYZxC/KAJ52S8Z2c53AemXc
         Nv2ZCjsCzAIqyUWvWd+spgaV+Kxub50EnWvwJbkzwmI7P3FJRtsK/Ghzfb03LtLQ/oCu
         FdyfqWl3fiP2FiF0NpnHKCdcSSnDYKtM2VHinRgjZiX56ej5FYXMpdsT9OcKhL1d+PVu
         VA7DVScGEHhzmyVTz5AjAxJQpH3xFaAThOY2DAcs1LfeNfEfQbHnCfbjxn8BWGkJTu6P
         xjYg==
X-Gm-Message-State: AC+VfDwoiN9JXKF7IJDMCmVY0uA8YRApdRt3V2g/Io9RA09tcXVQElJs
        etXB9bUCe5SScGxc3ZELsWIzNA==
X-Google-Smtp-Source: ACHHUZ7VduePN/2ZpGfRhK0O16LzqsCyivVAEc2VSdGTMLYkolaWsUhsc23qiWuit4FOcR7ohBiYAA==
X-Received: by 2002:a5d:56c4:0:b0:30a:bdfd:5c3c with SMTP id m4-20020a5d56c4000000b0030abdfd5c3cmr2392137wrw.17.1686077736430;
        Tue, 06 Jun 2023 11:55:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:4973:1165:b171:fa69? ([2a01:e0a:982:cbb0:4973:1165:b171:fa69])
        by smtp.gmail.com with ESMTPSA id z6-20020a1c4c06000000b003f42ceb3bf4sm15015265wmf.32.2023.06.06.11.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 11:55:36 -0700 (PDT)
Message-ID: <665c9aa5-ef70-65ce-7d9c-4b3b93874934@linaro.org>
Date:   Tue, 6 Jun 2023 20:55:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230606-topic-goodix-berlin-upstream-initial-v1-0-4a0741b8aefd@linaro.org>
 <f5f20de8-851a-fe20-4664-62b6de14ebd7@redhat.com>
 <2677ae8c-59d3-b658-dc3f-918838ac0fb6@linaro.org>
 <ZH9+ndrF0RIgFhnI@google.com>
Organization: Linaro Developer Services
Subject: Re: [PATCH RFC 0/4] input: touchscreen: add initial support for
 Goodix Berlin touchscreen IC
In-Reply-To: <ZH9+ndrF0RIgFhnI@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On 06/06/2023 20:44, Dmitry Torokhov wrote:
> On Tue, Jun 06, 2023 at 08:12:04PM +0200, Neil Armstrong wrote:
>> Hi,
>>
>> On 06/06/2023 17:31, Hans de Goede wrote:
>>> Hi Neil,
>>>
>>> On 6/6/23 16:31, Neil Armstrong wrote:
>>>> These touchscreen ICs support SPI, I2C and I3C interface, up to
>>>> 10 finger touch, stylus and gestures events.
>>>>
>>>> This initial driver is derived from the Goodix goodix_ts_berlin
>>>> available at [1] and [2] and only supports the GT9916 IC
>>>> present on the Qualcomm SM8550 MTP & QRD touch panel.
>>>>
>>>> The current implementation only supports BerlinD, aka GT9916.
>>>>
>>>> Support for advanced features like:
>>>> - Firmware & config update
>>>> - Stylus events
>>>> - Gestures events
>>>> - Previous revisions support (BerlinA or BerlinB)
>>>> is not included in current version.
>>>>
>>>> The current support will work with currently flashed firmware
>>>> and config, and bail out if firmware or config aren't flashed yet.
>>>
>>> What I'm missing here / in the commit msg of
>>> "input: touchscreen: add core support for Goodix Berlin Touchscreen IC"
>>>
>>> is an explanation why this is a new driver instead of adding
>>> support to the existing goodix.c code.
>>>
>>> I assume you have good reasons for this, but it would be good
>>> if you can write the reasons for this down.
>>
>> Sure, should I write it down here and/or update the commit message in a new revision ?
>>
>> Anyway, here's the reasons:
>> - globally the event handling "looks like" the current goodix.c, but again the offsets
>> are again different and none of the register address are the same, and unlike the current
>> support all registers are provided by the "ic_info" structure
>> - while with the current code it *could* be possible to merge it, with a lot of changes,
>> the firmware management looks really different, and it would be really hard to merge.
>>
>> But I may be wrong, and may be misleaded by the goodix driver structure (even if it
>> went through a really heavy cleaning process).
>>
>> Globally it seems they tried to match the "event handling" process of the previous
>> generations, but the firmware interface is completely different.
> 
> It is not unprecedented for drivers to share event processing and
> implement several ways/generations of firmware update mechanisms.

Thanks for your reply, I'm perfectly aware of that, this is why I posted
this as RFC.

If the event handling is vaguely similar, I'm not sure it's worth refactoring the
current driver since I do not have the old and current IC datasheet nor
HW to check for current support non-regression.

What I'm sure is that not a single register address, flag or struct is even close
to the current upstream defined ones.

Neil

> 
> Thanks.
> 

