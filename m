Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0316E926E
	for <lists+linux-input@lfdr.de>; Thu, 20 Apr 2023 13:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbjDTL0T (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Apr 2023 07:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234108AbjDTL0D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Apr 2023 07:26:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F259ED5
        for <linux-input@vger.kernel.org>; Thu, 20 Apr 2023 04:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681989841;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3fj2r/TkPzDnAeDyrgLHgNMn11ACqVGaGMoYDpYSS5c=;
        b=EZxI4LDws2+u45ZfPekL8E1fDQaxqk4VnwAMNzRmjD5SnqRWkGwacHZBbN9QFFmkN00RIw
        sU7B3SgnSzlmbGfR4OMKu4MgKaCY08wiLoT1Wpn0rW37T46JAxINSKUW6wA/jh1PzzlZwH
        51d6axvduYjmK519rfVfe/PkO2LpT9s=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-h54dxy48PLeH2f0DQx3ysg-1; Thu, 20 Apr 2023 07:17:56 -0400
X-MC-Unique: h54dxy48PLeH2f0DQx3ysg-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5069f2ae8eeso2352997a12.0
        for <linux-input@vger.kernel.org>; Thu, 20 Apr 2023 04:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681989475; x=1684581475;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3fj2r/TkPzDnAeDyrgLHgNMn11ACqVGaGMoYDpYSS5c=;
        b=gfQtm1kXCiQjM3PdZ6XnnUS2JOYo7i2SFNByyFG7UHUUU3AYhVemR489JaCMWomZEu
         tux/RI7KjGz1jE89/1at9FtFWnR99eoNr/KUWN7UHqeE6dB69vpgUhSmztkQx2s1hs6D
         +SmJOkmuo3fFsq6j1zN5lrmgOlIYfadFVJiTFVGMnkdPEdZnFfbzNVojU2VR4X1EzRk+
         MwsKOHZLuNWmwHy5CBOFhVy4VlHoL5lnsvInujKSjpCkL6YJ4axibv4tPP+jUkC8cNQP
         uqLR6S7KvCk7kQQGd09cgPlo2DcE855/Irc8SiH2dj0L0P3da4JNsF4THJXIQu+EiKC6
         dI2A==
X-Gm-Message-State: AAQBX9c2mSZoW7sBpG09e/i3cr/sjRIzMSYUOjDuSCbyM4MG+iWf8i1W
        xEXCdvramfVnzpdtpHoFni+jcdDmXmIwLgVJ+7dfnHyHykSCH+codXoswYDht5fMwwsDqmQ/sXo
        l5Jy8ucD7e5gDTCbQP6GPu5M=
X-Received: by 2002:a05:6402:42c8:b0:506:72f8:eb10 with SMTP id i8-20020a05640242c800b0050672f8eb10mr6246913edc.0.1681989475190;
        Thu, 20 Apr 2023 04:17:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350b3jAqGnAwsth15pGrMGa2D7VuFf1zlUKjfUMNzTwQ2UxXTdq3HGlP1D/tE1wL/TwlBWXjRww==
X-Received: by 2002:a05:6402:42c8:b0:506:72f8:eb10 with SMTP id i8-20020a05640242c800b0050672f8eb10mr6246896edc.0.1681989474837;
        Thu, 20 Apr 2023 04:17:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d12-20020a50fb0c000000b004bf999f8e57sm645809edq.19.2023.04.20.04.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 04:17:54 -0700 (PDT)
Message-ID: <06b5119a-63f7-e62b-cc28-0009e17ad4ed@redhat.com>
Date:   Thu, 20 Apr 2023 13:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [regression] Bug 216946 - Toshiba satellite click mini l9w-b:
 touchscreen: no touch events with kernel 6.1.4
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?Q?G=c3=a9_Koerkamp?= <ge.koerkamp@gmail.com>,
        Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <993dd537-2f74-3657-1dd3-c3a0a74e37e1@leemhuis.info>
 <E4123C4B-D6C0-4CB2-8328-E0D03599ED16@gmail.com>
 <07f2417e-9d47-3e73-cae5-3e7c95856f72@redhat.com>
In-Reply-To: <07f2417e-9d47-3e73-cae5-3e7c95856f72@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 4/19/23 18:40, Hans de Goede wrote:
> Hi Gé,
> 
> On 4/19/23 18:21, Gé Koerkamp wrote:
>> Hi Thorsten,
>>
>> travelling at the moment, but I’ll try. Not really into bisecting kernel issues, but let’s see where this goes. Another issue is, that I don’t have a Toshiba Mini Click myself, so I need to build the test Volumio images (volumio.org) with the different 5.16-rc kernel patch versions for a colleague to work with, hopefully  he has time to do this.
> 
> I have just dug my own Toshiba Mini Click up from the bottom of the storage box it was in.
> 
> It is currently charging since the battery was fully flat.
> 
> So I suggest you give me a couple of days to take a look before you go to all this trouble.

I have posted a patch fixing this upstream now:

https://lore.kernel.org/linux-acpi/20230420110220.23168-1-hdegoede@redhat.com/T/#u

Regards,

Hans


>>> On 17 Apr 2023, at 13:55, Linux regression tracking (Thorsten Leemhuis) <regressions@leemhuis.info> wrote:
>>>
>>> ﻿
>>>
>>>> On 01.03.23 12:41, Hans de Goede wrote:
>>>>> On 2/28/23 14:26, Benjamin Tissoires wrote:
>>>>> On Tue, Feb 28, 2023 at 12:32 PM Thorsten Leemhuis
>>>>> <regressions@leemhuis.info> wrote:
>>>>>>
>>>>>> On 19.01.23 16:06, Linux kernel regression tracking (Thorsten Leemhuis)
>>>>>> wrote:
>>>>>>> Hi, this is your Linux kernel regression tracker.
>>>>>>>
>>>>>>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>>>>>>> kernel developer don't keep an eye on it, I decided to forward it by
>>>>>>> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216946 :
>>>>>>
>>>>>> The reporter recently confirmed in the ticket that the issue still
>>>>>> happens with 6.2.
>>>>>>
>>>>>> There wasn't any reply from any of the input developers here or in
>>>>>> bugzilla afaics. :-/ Hmmm. Could someone from that camp maybe please
>>>>>> take a minute and at least briefly look into this as answer something
>>>>>> like "that might be due to a problem in subsystem 'foo'", "maybe ask bar
>>>>>> for an option", or "we have no idea what might cause this, this needs to
>>>>>> be bisected"? That would help a lot.
>>>>>
>>>>> The working dmesg shows a line with:
>>>>> hid-generic 0018:0457:10FB.0002: input,hidraw1: I2C HID v1.00 Device
>>>>> [SIS0817:00 0457:10FB] on i2c-SIS0817:00
>>>>> and then
>>>>> hid-multitouch 0018:0457:10FB.0002: input,hidraw1: I2C HID v1.00
>>>>> Device [SIS0817:00 0457:10FB] on i2c-SIS0817:00
>>>>>
>>>>> But these 2 lines do not appear on the 6.1.4 logs.
>>>>>
>>>>> So the device is not properly enumerated by ACPI or I2C. Hans might
>>>>> have an idea on how to debug/solve that issue.
>>>>
>>>> I actually have a Toshiba satellite click mini l9w-b lying around
>>>> myself. I already made a note to try and reproduce this
>>>>
>>>> But I'm very much swamped with too much kernel work, so no promises
>>>> when I will get around to this ...
>>>
>>> Has anyone made any progress with this? Doesn't look like it, hence I
>>> wondered if this fall through the cracks; but maybe I'm just missing
>>> something.
>>>
>>> Gé Koerkamp: with a bit of luck Hans sooner or later will have time to
>>> look into this, but it might speed things up if you could try to bisect
>>> this.
>>>
>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>> --
>>> Everything you wanna know about Linux kernel regression tracking:
>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>> If I did something stupid, please tell me, as explained on that page.
>>>
>>> #regzbot poke
>>>
>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>>>> --
>>>>>> Everything you wanna know about Linux kernel regression tracking:
>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>>>> If I did something stupid, please tell me, as explained on that page.
>>>>>>
>>>>>> #regzbot poke
>>>>>>>> Gé Koerkamp 2023-01-17 20:21:51 UTC
>>>>>>>>
>>>>>>>> Created attachment 303619 [details]
>>>>>>>> Kernel configuration for v6.1.4/ journalctl (dmesg)/ ACPIdump/lsmod
>>>>>>>>
>>>>>>>> Overview:
>>>>>>>> The touchscreen does not react on touch events.
>>>>>>>> Touchscreen display and touchpad are working.
>>>>>>>>
>>>>>>>> Step to reproduce:
>>>>>>>> Open any UI page
>>>>>>>> Try to use touch on relevant UI controls (buttons etc.)
>>>>>>>>
>>>>>>>> Result:
>>>>>>>> No reaction on screen touches
>>>>>>>>
>>>>>>>> Expected result:
>>>>>>>> Reaction on touched control, same as when using the touch pad or connected mouse (which do work).
>>>>>>>>
>>>>>>>> Build information:
>>>>>>>> The error happens with kernel version 6.1.4
>>>>>>>> After rebuilding with different kernel versions, it appears that it first fails with kernel 5.16
>>>>>>>>
>>>>>>>> Additional builds:
>>>>>>>> The click mini l9w-b still works with kernel 5.10.y LTS and 5.15.y LTS.
>>>>>>>>
>>>>>>>> Important remark:
>>>>>>>> Touchscreen still works fine with kernel 6.1.4 using
>>>>>>>> - an HP x2 detachable 10-p0xx or
>>>>>>>> - a Lenovo yoga 520-14ikb
>>>>>>>>
>>>>>>>> So it could be a hardware dependent issue
>>>>>>>
>>>>>>> See the ticket for more details.
>>>>>>>
>>>>>>>
>>>>>>> [TLDR for the rest of this mail: I'm adding this report to the list of
>>>>>>> tracked Linux kernel regressions; the text you find below is based on a
>>>>>>> few templates paragraphs you might have encountered already in similar
>>>>>>> form.]
>>>>>>>
>>>>>>> BTW, let me use this mail to also add the report to the list of tracked
>>>>>>> regressions to ensure it's doesn't fall through the cracks:
>>>>>>>
>>>>>>> #regzbot introduced: v5.15..v5.16
>>>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=216946
>>>>>>> #regzbot title: hid: touchscreen broken with Toshiba satellite click
>>>>>>> mini l9w-b
>>>>>>> #regzbot ignore-activity
>>>>>>>
>>>>>>> This isn't a regression? This issue or a fix for it are already
>>>>>>> discussed somewhere else? It was fixed already? You want to clarify when
>>>>>>> the regression started to happen? Or point out I got the title or
>>>>>>> something else totally wrong? Then just reply and tell me -- ideally
>>>>>>> while also telling regzbot about it, as explained by the page listed in
>>>>>>> the footer of this mail.
>>>>>>>
>>>>>>> Developers: When fixing the issue, remember to add 'Link:' tags pointing
>>>>>>> to the report (e.g. the buzgzilla ticket and maybe this mail as well, if
>>>>>>> this thread sees some discussion). See page linked in footer for details.
>>>>>>>
>>>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>>>>> --
>>>>>>> Everything you wanna know about Linux kernel regression tracking:
>>>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>>>>> If I did something stupid, please tell me, as explained on that page.
>>>>>>
>>>>>
>>>>
>>>>
>>>>
>>
> 

