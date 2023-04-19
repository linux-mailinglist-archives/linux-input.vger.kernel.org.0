Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD6F6E7FC8
	for <lists+linux-input@lfdr.de>; Wed, 19 Apr 2023 18:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233386AbjDSQk5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Apr 2023 12:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbjDSQk5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Apr 2023 12:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEE54EFA
        for <linux-input@vger.kernel.org>; Wed, 19 Apr 2023 09:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681922407;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gXUuv+N623PwXzIE9Rxtipi189EMDtbCL0zmp70YW88=;
        b=Lhr2C7k69ZsW9lzAVJaXM0Vaj9n+TH0tEavlcWpf7+778QZCNGMHn8zaym7F5rclD39Lfi
        6f32SGt5KAd98JV77VL/wHwY6EhHOK4IVtuViGlDmyvhYv2ACz5pPNc4st0z4eAUYl14IY
        uErH6Wt415ZkWlnwu+n+SlHKEMELoQc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-zJERHSdBMHyNBxW_b39dyQ-1; Wed, 19 Apr 2023 12:40:06 -0400
X-MC-Unique: zJERHSdBMHyNBxW_b39dyQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-94a355cf318so471233866b.2
        for <linux-input@vger.kernel.org>; Wed, 19 Apr 2023 09:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681922405; x=1684514405;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gXUuv+N623PwXzIE9Rxtipi189EMDtbCL0zmp70YW88=;
        b=AJBjqiZuLRtjXwL9/Cm0/DdULlnGkAe12RpLTN89Qe3VLrL+m3qpu10NPHkcOTdJwK
         s+UTYXUI1RJdhZ5j8pDTAUlMRnnmRgiST6GBbs3nsaDD+labUsYc4q96QZJMlv6Vslcu
         +s8BhvE7yfX3PrxJrAYYsodsSahHt8pkF7oQEzkc0mvG6jtArqLIUgrwy7m9QY+wZALe
         cGKVUVb8w2B8daUD9cXcHjhosXN7dGkVyySMxybJfEy33QQ97TbdnMbgt5mzVWmMEdMN
         mVknTabpNj7Le0BriNBYqyjPrsGkuYtGt3vZX1wpXcyjONCOgVgNlYgbGpJpZVHn/iGO
         HKLQ==
X-Gm-Message-State: AAQBX9cdz8+FIEMFYX2e+EIaTNQJacBVG6XnTGmJ5RHHXY3pbCIVqiR2
        OR6+5lTUsFz+EMpmbx/W6k5SMBbG0fbnUSkC/KVECR7iUNZavJnJjT8ITqNqXBBM73O+0Pi+4RD
        C4MeFzIUNMFFy7114yBxcgt4=
X-Received: by 2002:a50:ec92:0:b0:502:1cae:8b11 with SMTP id e18-20020a50ec92000000b005021cae8b11mr5785518edr.23.1681922405229;
        Wed, 19 Apr 2023 09:40:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350bIlSVT95rW1hj8ejmytg93v7b25J08Hbj6/OoScTlUZFaWN54H/62fG3YYEFY+rLfh7S97zA==
X-Received: by 2002:a50:ec92:0:b0:502:1cae:8b11 with SMTP id e18-20020a50ec92000000b005021cae8b11mr5785504edr.23.1681922404904;
        Wed, 19 Apr 2023 09:40:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g12-20020a056402180c00b00508480633bdsm94685edy.74.2023.04.19.09.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 09:40:04 -0700 (PDT)
Message-ID: <07f2417e-9d47-3e73-cae5-3e7c95856f72@redhat.com>
Date:   Wed, 19 Apr 2023 18:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [regression] Bug 216946 - Toshiba satellite click mini l9w-b:
 touchscreen: no touch events with kernel 6.1.4
Content-Language: en-US, nl
To:     =?UTF-8?Q?G=c3=a9_Koerkamp?= <ge.koerkamp@gmail.com>,
        Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <993dd537-2f74-3657-1dd3-c3a0a74e37e1@leemhuis.info>
 <E4123C4B-D6C0-4CB2-8328-E0D03599ED16@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <E4123C4B-D6C0-4CB2-8328-E0D03599ED16@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Gé,

On 4/19/23 18:21, Gé Koerkamp wrote:
> Hi Thorsten,
> 
> travelling at the moment, but I’ll try. Not really into bisecting kernel issues, but let’s see where this goes. Another issue is, that I don’t have a Toshiba Mini Click myself, so I need to build the test Volumio images (volumio.org) with the different 5.16-rc kernel patch versions for a colleague to work with, hopefully  he has time to do this.

I have just dug my own Toshiba Mini Click up from the bottom of the storage box it was in.

It is currently charging since the battery was fully flat.

So I suggest you give me a couple of days to take a look before you go to all this trouble.

Regards,

Hans




> 
> Thanks - Gé
> 
> Sent from my iPhone
> 
>> On 17 Apr 2023, at 13:55, Linux regression tracking (Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
>>
>> ﻿
>>
>>> On 01.03.23 12:41, Hans de Goede wrote:
>>>> On 2/28/23 14:26, Benjamin Tissoires wrote:
>>>> On Tue, Feb 28, 2023 at 12:32 PM Thorsten Leemhuis
>>>> <regressions@leemhuis.info> wrote:
>>>>>
>>>>> On 19.01.23 16:06, Linux kernel regression tracking (Thorsten Leemhuis)
>>>>> wrote:
>>>>>> Hi, this is your Linux kernel regression tracker.
>>>>>>
>>>>>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>>>>>> kernel developer don't keep an eye on it, I decided to forward it by
>>>>>> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216946 :
>>>>>
>>>>> The reporter recently confirmed in the ticket that the issue still
>>>>> happens with 6.2.
>>>>>
>>>>> There wasn't any reply from any of the input developers here or in
>>>>> bugzilla afaics. :-/ Hmmm. Could someone from that camp maybe please
>>>>> take a minute and at least briefly look into this as answer something
>>>>> like "that might be due to a problem in subsystem 'foo'", "maybe ask bar
>>>>> for an option", or "we have no idea what might cause this, this needs to
>>>>> be bisected"? That would help a lot.
>>>>
>>>> The working dmesg shows a line with:
>>>> hid-generic 0018:0457:10FB.0002: input,hidraw1: I2C HID v1.00 Device
>>>> [SIS0817:00 0457:10FB] on i2c-SIS0817:00
>>>> and then
>>>> hid-multitouch 0018:0457:10FB.0002: input,hidraw1: I2C HID v1.00
>>>> Device [SIS0817:00 0457:10FB] on i2c-SIS0817:00
>>>>
>>>> But these 2 lines do not appear on the 6.1.4 logs.
>>>>
>>>> So the device is not properly enumerated by ACPI or I2C. Hans might
>>>> have an idea on how to debug/solve that issue.
>>>
>>> I actually have a Toshiba satellite click mini l9w-b lying around
>>> myself. I already made a note to try and reproduce this
>>>
>>> But I'm very much swamped with too much kernel work, so no promises
>>> when I will get around to this ...
>>
>> Has anyone made any progress with this? Doesn't look like it, hence I
>> wondered if this fall through the cracks; but maybe I'm just missing
>> something.
>>
>> Gé Koerkamp: with a bit of luck Hans sooner or later will have time to
>> look into this, but it might speed things up if you could try to bisect
>> this.
>>
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>> --
>> Everything you wanna know about Linux kernel regression tracking:
>> https://linux-regtracking.leemhuis.info/about/#tldr
>> If I did something stupid, please tell me, as explained on that page.
>>
>> #regzbot poke
>>
>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>>> --
>>>>> Everything you wanna know about Linux kernel regression tracking:
>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>>> If I did something stupid, please tell me, as explained on that page.
>>>>>
>>>>> #regzbot poke
>>>>>>> Gé Koerkamp 2023-01-17 20:21:51 UTC
>>>>>>>
>>>>>>> Created attachment 303619 [details]
>>>>>>> Kernel configuration for v6.1.4/ journalctl (dmesg)/ ACPIdump/lsmod
>>>>>>>
>>>>>>> Overview:
>>>>>>> The touchscreen does not react on touch events.
>>>>>>> Touchscreen display and touchpad are working.
>>>>>>>
>>>>>>> Step to reproduce:
>>>>>>> Open any UI page
>>>>>>> Try to use touch on relevant UI controls (buttons etc.)
>>>>>>>
>>>>>>> Result:
>>>>>>> No reaction on screen touches
>>>>>>>
>>>>>>> Expected result:
>>>>>>> Reaction on touched control, same as when using the touch pad or connected mouse (which do work).
>>>>>>>
>>>>>>> Build information:
>>>>>>> The error happens with kernel version 6.1.4
>>>>>>> After rebuilding with different kernel versions, it appears that it first fails with kernel 5.16
>>>>>>>
>>>>>>> Additional builds:
>>>>>>> The click mini l9w-b still works with kernel 5.10.y LTS and 5.15.y LTS.
>>>>>>>
>>>>>>> Important remark:
>>>>>>> Touchscreen still works fine with kernel 6.1.4 using
>>>>>>> - an HP x2 detachable 10-p0xx or
>>>>>>> - a Lenovo yoga 520-14ikb
>>>>>>>
>>>>>>> So it could be a hardware dependent issue
>>>>>>
>>>>>> See the ticket for more details.
>>>>>>
>>>>>>
>>>>>> [TLDR for the rest of this mail: I'm adding this report to the list of
>>>>>> tracked Linux kernel regressions; the text you find below is based on a
>>>>>> few templates paragraphs you might have encountered already in similar
>>>>>> form.]
>>>>>>
>>>>>> BTW, let me use this mail to also add the report to the list of tracked
>>>>>> regressions to ensure it's doesn't fall through the cracks:
>>>>>>
>>>>>> #regzbot introduced: v5.15..v5.16
>>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=216946
>>>>>> #regzbot title: hid: touchscreen broken with Toshiba satellite click
>>>>>> mini l9w-b
>>>>>> #regzbot ignore-activity
>>>>>>
>>>>>> This isn't a regression? This issue or a fix for it are already
>>>>>> discussed somewhere else? It was fixed already? You want to clarify when
>>>>>> the regression started to happen? Or point out I got the title or
>>>>>> something else totally wrong? Then just reply and tell me -- ideally
>>>>>> while also telling regzbot about it, as explained by the page listed in
>>>>>> the footer of this mail.
>>>>>>
>>>>>> Developers: When fixing the issue, remember to add 'Link:' tags pointing
>>>>>> to the report (e.g. the buzgzilla ticket and maybe this mail as well, if
>>>>>> this thread sees some discussion). See page linked in footer for details.
>>>>>>
>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>>>> --
>>>>>> Everything you wanna know about Linux kernel regression tracking:
>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>>>> If I did something stupid, please tell me, as explained on that page.
>>>>>
>>>>
>>>
>>>
>>>
> 

