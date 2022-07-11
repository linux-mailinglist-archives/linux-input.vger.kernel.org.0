Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F20DF57036D
	for <lists+linux-input@lfdr.de>; Mon, 11 Jul 2022 14:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbiGKMz7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Jul 2022 08:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiGKMz7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Jul 2022 08:55:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8F9C82B240
        for <linux-input@vger.kernel.org>; Mon, 11 Jul 2022 05:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657544157;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kt5/cjcKZ2gRwWekh9fqy7LIWEf6ib/V3LQ9qeWBy+M=;
        b=Mp9sVUZP5ObBO1PPMooZfbVmoaUmsfkTkvrPOtUBQWqhZd2BFg0LPl/a2JLO3PrjE06aI6
        fze/qmn5rDzFIo/m+Yq7fVPDcBleMAo2NLstkZPT9azq2wezgj9/hnxQ4ytrcwE7HRAPhT
        FHmLAGhUN9MnIIjEWW8Y4tQ7kGepGqM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-cKXtTClHP5iP1yhCDL5AGA-1; Mon, 11 Jul 2022 08:55:56 -0400
X-MC-Unique: cKXtTClHP5iP1yhCDL5AGA-1
Received: by mail-ej1-f71.google.com with SMTP id du15-20020a17090772cf00b0072b3b8d31caso983720ejc.4
        for <linux-input@vger.kernel.org>; Mon, 11 Jul 2022 05:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kt5/cjcKZ2gRwWekh9fqy7LIWEf6ib/V3LQ9qeWBy+M=;
        b=iGyb++Sr4+sxNZGNA2yKlKYEurkjqvbpShtHfEOfrEhdB9hn7z6wfzvDrVhVEqBR/R
         2tPTglCt5Bun/LEPg3bvxfLGWocl1FH5LwZJYllMJbdsXgLe/M9LAdGF1rPRKBKSRUGx
         J4snbEqwLdW6eh/eEfbe/ynPdhnDPoSxPL0gz2ltfmfSwdlBhfvVM9M+43kYUU6BwSmp
         /dfPteIGF7BQw3fKzTY+C4EI9wPOoqkfayhBu2U30eorpFniY6Z0bwTKMUSQgTW1lqHJ
         3kyo7UwGLiRi5azMQ1KukWn9b0eyfIL6Z8+X+OP0bkfrw5H/tr2MFOXGPP83syYwM/MI
         0hLA==
X-Gm-Message-State: AJIora8KQrQ2RyYbSdsM/LPTu8+Ejq0dRJtT6WqenNvnutzO47/BT4Cq
        64kMvnC1YqW99Gjiqb65vU4fgys55unGOo30cCowEBj/mafAOt4JcBh0SO2hpc01AzHo31AaZNH
        5jAxe5L7S+nI+lqnTKPSUVGk=
X-Received: by 2002:a05:6402:2553:b0:43a:caa2:4956 with SMTP id l19-20020a056402255300b0043acaa24956mr10907659edb.406.1657544155316;
        Mon, 11 Jul 2022 05:55:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tNqb7ZLkvusDSgn+rhuE3nnCzlnbhFr6wBS7PtlTl+WaJMGyDfPSkmDo3kuHbEDzZ/cgVouw==
X-Received: by 2002:a05:6402:2553:b0:43a:caa2:4956 with SMTP id l19-20020a056402255300b0043acaa24956mr10907638edb.406.1657544155092;
        Mon, 11 Jul 2022 05:55:55 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id cb1-20020a0564020b6100b0043a6dc3c4b0sm4300219edb.41.2022.07.11.05.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 05:55:54 -0700 (PDT)
Message-ID: <e84a2cb3-ea2f-6ce4-aba8-4026b3e6bedd@redhat.com>
Date:   Mon, 11 Jul 2022 14:55:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] Input: i8042 - add TUXEDO devices to i8042 quirk
 tables for partial fix
Content-Language: en-US
To:     Werner Sembach <wse@tuxedocomputers.com>,
        dmitry.torokhov@gmail.com, tiwai@suse.de, samuel@cavoj.net,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220708161005.1251929-1-wse@tuxedocomputers.com>
 <20220708161005.1251929-3-wse@tuxedocomputers.com>
 <37a7e536-252a-c8a9-1412-37d3f2052a6d@redhat.com>
 <c5a7fa10-7b6a-fa0d-622e-4392fda1ee93@tuxedocomputers.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <c5a7fa10-7b6a-fa0d-622e-4392fda1ee93@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 7/11/22 14:45, Werner Sembach wrote:
> Hi,
> 
> On 7/8/22 21:39, Hans de Goede wrote:
>> Hi,
>>
>> On 7/8/22 18:10, Werner Sembach wrote:
>>> A lot of modern Clevo barebones have touchpad and/or keyboard issues after
>>> suspend fixable with nomux + reset + noloop + nopnp. Luckily, none of them
>>> have an external PS/2 port so this can safely be set for all of them.
>>>
>>> I'm not entirely sure if every device listed really needs all four quirks,
>>> but after testing and production use. No negative effects could be
>>> observed when setting all four.
>>>
>>> Setting SERIO_QUIRK_NOMUX or SERIO_QUIRK_RESET_ALWAYS on the Clevo N150CU
>>> and the Clevo NHxxRZQ makes the keyboard very laggy for ~5 seconds after
>>> boot and sometimes also after resume. However both are required for the
>>> keyboard to not fail completely sometimes after boot or resume.
>> Hmm, the very laggy bit does not sound good. Have you looked into other
>> solutions, e.g. what happens if you use just nomux without any of the
>> other 3 options ?
> 
> I tried a lot of combinations, but it was some time ago.
> 
> iirc: at least nomux and reset are required and both individually cause the lagging.
> 
> So the issue is not fixed by just using a different set of quirks.

Hmm, ok. So given that this seems to be the best we can do
the patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>> Cc: stable@vger.kernel.org
>>> ---
>>>   drivers/input/serio/i8042-x86ia64io.h | 28 +++++++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>
>>> diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
>>> index 5204a7dd61d4..9dc0266e5168 100644
>>> --- a/drivers/input/serio/i8042-x86ia64io.h
>>> +++ b/drivers/input/serio/i8042-x86ia64io.h
>>> @@ -1107,6 +1107,20 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>>>           .driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
>>>                       SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
>>>       },
>>> +    {
>>> +        /*
>>> +         * Setting SERIO_QUIRK_NOMUX or SERIO_QUIRK_RESET_ALWAYS makes
>>> +         * the keyboard very laggy for ~5 seconds after boot and
>>> +         * sometimes also after resume.
>>> +         * However both are required for the keyboard to not fail
>>> +         * completely sometimes after boot or resume.
>>> +         */
>>> +        .matches = {
>>> +            DMI_MATCH(DMI_BOARD_NAME, "N150CU"),
>>> +        },
>>> +        .driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
>>> +                    SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
>>> +    },
>>>       {
>>>           .matches = {
>>>               DMI_MATCH(DMI_BOARD_NAME, "NH5xAx"),
>>> @@ -1114,6 +1128,20 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>>>           .driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
>>>                       SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
>>>       },
>>> +    {
>>> +        /*
>>> +         * Setting SERIO_QUIRK_NOMUX or SERIO_QUIRK_RESET_ALWAYS makes
>>> +         * the keyboard very laggy for ~5 seconds after boot and
>>> +         * sometimes also after resume.
>>> +         * However both are required for the keyboard to not fail
>>> +         * completely sometimes after boot or resume.
>>> +         */
>>> +        .matches = {
>>> +            DMI_MATCH(DMI_BOARD_NAME, "NHxxRZQ"),
>>> +        },
>>> +        .driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
>>> +                    SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
>>> +    },
>>>       {
>>>           .matches = {
>>>               DMI_MATCH(DMI_BOARD_NAME, "NL5xRU"),
> 

