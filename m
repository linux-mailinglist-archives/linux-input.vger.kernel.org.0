Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E674B60EBA9
	for <lists+linux-input@lfdr.de>; Thu, 27 Oct 2022 00:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229489AbiJZWnB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Oct 2022 18:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233701AbiJZWm5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Oct 2022 18:42:57 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB373ED5B
        for <linux-input@vger.kernel.org>; Wed, 26 Oct 2022 15:42:55 -0700 (PDT)
Received: (Authenticated sender: alex@alexyzhang.dev)
        by mail.gandi.net (Postfix) with ESMTPSA id DF9F160004;
        Wed, 26 Oct 2022 22:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alexyzhang.dev;
        s=gm1; t=1666824173;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZdjDp6jTL6XlAq4Pa6Ye9I+rHme6nW5ORhYVrBtQJSM=;
        b=NvQwVv83d4EtLY/pu4SAgua5Vm19nVfpUBEN9c2rIv2YYyq7T95e4LSyE4P8Nq9m1Y6FUm
        vleaTl05TKM1otHdwT+zZdL9TKN3kpPPZ4vFInPRkot9t/7+F0Ha4djBDWseuN0NeVGthM
        g1oRkV7Oa+dHbeBJ9o3e1BabLx+EeRygiGt9UrtJydTXTli1hUqMNipKvDsXj7q024Chds
        bsVi1i2WS+anxNijKNWEk4KYTtkU231R7XfOGueNLffcF6K3iTZqZj2MpetWYItz8dc9mw
        haorF1wIS2oCo974qTaIiDCjMKBktFC7DAST1Ls1pRh0El4Fy9eqYBvXH518Hg==
Message-ID: <2717adbe-e9b2-3c5a-7ccf-3d851a55744c@alexyzhang.dev>
Date:   Wed, 26 Oct 2022 15:42:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc:     Torge Matthies <openglfreak@googlemail.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Nikolai Kondrashov <spbnick@gmail.com>
References: <20220804151832.30373-1-openglfreak@googlemail.com>
 <20220804180038.GA8906@elementary>
 <CAO-hwJJsKC=fyeFLCmdXMRkxEQFVGZ189GKphTVK83QJWc=udA@mail.gmail.com>
From:   Alexander Zhang <alex@alexyzhang.dev>
Subject: Re: [PATCH] HID: Accept Digitizers as input devices
In-Reply-To: <CAO-hwJJsKC=fyeFLCmdXMRkxEQFVGZ189GKphTVK83QJWc=udA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

On 8/11/22 8:27 AM, Benjamin Tissoires wrote:
> On Thu, Aug 4, 2022 at 8:00 PM José Expósito <jose.exposito89@gmail.com> wrote:
>>
>> Hi Torge,
>>
>> Thanks for the patch.
>>
>> On Thu, Aug 04, 2022 at 05:18:32PM +0200, Torge Matthies wrote:
>>> Commit f7d8e387d9ae ("HID: uclogic: Switch to Digitizer usage for
>>> styluses") broke input from my XP-Pen Star G640. This is because the
>>> "Digitizer" usage is not recognized as a valid usage for input devices.
>>>
>>> This patch changes the IS_INPUT_APPLICATION macro so that the "Digitizer"
>>> (HID_DG_DIGITIZER) usage is recognized as an input device usage.
>>>
>>> Fixes: f7d8e387d9ae ("HID: uclogic: Switch to Digitizer usage for styluses")
>>> Signed-off-by: Torge Matthies <openglfreak@googlemail.com>
>>> ---
>>> This patch could be risky, because any digitizer devices that were
>>> previously not treated as input devices are now used for input.
>>> Alternatively the linked commit could be reverted, but that would
>>> re-introduce the problem detailed in its commit message.
>>>
>>>   include/linux/hid.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> I hesitated about this when I sent the patch you mentioned. In the end,
>> I didn't include any fix because the digitizer use was tested for 2
>> years in DIGImend, so I (wrongly) assumed that it was safe enough.
>>
>> However, my initial thought was to add in uclogic_probe():
>>
>>          hdev->quirks |= HID_QUIRK_HIDINPUT_FORCE;
>> +       hdev->quirks |= HID_QUIRK_HIDINPUT_FORCE;
>>
>> Let's see if we can hear more opinions, but if you are worried about
>> affecting other drivers, that could be a good solution.
> 
> Sadly, my automated regression tests are broken for a while and I
> haven't checked if that patch is introducing errors in hid-multitouch.
> 
> FWIW, this part has always been painful because some tablets were not
> using the correct usages. And so that's why we are ending up in that
> weird situation.
> 
> Anyway, just to mention that any code that touches this part should be
> tested against the hid regression tests suite[0], because that's the
> only way to find out if the change is affecting other devices.

My XP-Pen Star G640 hasn't been working since commit f7d8e387d9ae and 
this patch fixes it. Is there anything I can do to help get this issue 
resolved? Should this be reported as a regression?

Best,
Alex

> 
> Cheers,
> Benjamin
> 
> [0] https://gitlab.freedesktop.org/libevdev/hid-tools
> 
>>
>> Best wishes,
>> Jose
>>
>>> diff --git a/include/linux/hid.h b/include/linux/hid.h
>>> index 4363a63b9775..07803e144d98 100644
>>> --- a/include/linux/hid.h
>>> +++ b/include/linux/hid.h
>>> @@ -883,7 +883,7 @@ static inline bool hid_is_usb(struct hid_device *hdev)
>>>   /* We ignore a few input applications that are not widely used */
>>>   #define IS_INPUT_APPLICATION(a) \
>>>                (((a >= HID_UP_GENDESK) && (a <= HID_GD_MULTIAXIS)) \
>>> -             || ((a >= HID_DG_PEN) && (a <= HID_DG_WHITEBOARD)) \
>>> +             || ((a >= HID_DG_DIGITIZER) && (a <= HID_DG_WHITEBOARD)) \
>>>                || (a == HID_GD_SYSTEM_CONTROL) || (a == HID_CP_CONSUMER_CONTROL) \
>>>                || (a == HID_GD_WIRELESS_RADIO_CTLS))
>>>
>>> --
>>> 2.37.1
