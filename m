Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FADB610899
	for <lists+linux-input@lfdr.de>; Fri, 28 Oct 2022 05:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbiJ1DQ1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Oct 2022 23:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229683AbiJ1DQW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Oct 2022 23:16:22 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08DB55509F
        for <linux-input@vger.kernel.org>; Thu, 27 Oct 2022 20:16:20 -0700 (PDT)
Received: (Authenticated sender: alex@alexyzhang.dev)
        by mail.gandi.net (Postfix) with ESMTPSA id A7CFA40003;
        Fri, 28 Oct 2022 03:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alexyzhang.dev;
        s=gm1; t=1666926978;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HZCEHBSnppBKgAFHDl6KVkGjnOlBZb9NH/yI6wzNOl0=;
        b=jbbOThQlSOLQBcGkQMf3+O92EtmmG0TDIjq1517odg3dhFJR3kxURFaQ1cWyQtuwXZ3lkd
        pQ+k6PI4kHN/mw+6UlxplO7V0DN8LLQfZhnTuF/Rh/v97JhXx7I0ZC90pPNLz5kuhYsaFI
        7DaK7WMSq2SXlkQYcncuoC6pwo/JjJL3oYuqiDvrEcbqXHObN8fixG+SucPiaL0VQkVyPA
        sVhcbJkEoDILcq6BZXkP1GfB+9Sqvx+XHeTlTLq+e84n6EVfkhHE775ait1agYTP0xeYuG
        +JGCdlsEqsoyWiRrqsNakABWxvWT4pL4SfUayBiUJbvPAQm1vsUrfhb4HU6nEQ==
Message-ID: <b1536115-1d4b-67dd-197e-4b6ed8e5cbc6@alexyzhang.dev>
Date:   Thu, 27 Oct 2022 20:16:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To:     Thorsten Leemhuis <regressions@leemhuis.info>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc:     Torge Matthies <openglfreak@googlemail.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Nikolai Kondrashov <spbnick@gmail.com>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220804151832.30373-1-openglfreak@googlemail.com>
 <20220804180038.GA8906@elementary>
 <CAO-hwJJsKC=fyeFLCmdXMRkxEQFVGZ189GKphTVK83QJWc=udA@mail.gmail.com>
 <2717adbe-e9b2-3c5a-7ccf-3d851a55744c@alexyzhang.dev>
 <1db88d01-1004-0e42-b9aa-3e0bb2b22cdb@leemhuis.info>
From:   Alexander Zhang <alex@alexyzhang.dev>
Subject: Re: [PATCH] HID: Accept Digitizers as input devices
In-Reply-To: <1db88d01-1004-0e42-b9aa-3e0bb2b22cdb@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Thorsten,

On 10/27/22 5:06 AM, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker. CCing the regression
> mailing list, as it should be in the loop for all regressions, as
> explained here:
> https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html
> 
> On 27.10.22 00:42, Alexander Zhang wrote:
>> On 8/11/22 8:27 AM, Benjamin Tissoires wrote:
>>> On Thu, Aug 4, 2022 at 8:00 PM José Expósito
>>> <jose.exposito89@gmail.com> wrote:
>>>> On Thu, Aug 04, 2022 at 05:18:32PM +0200, Torge Matthies wrote:
>>>>> Commit f7d8e387d9ae ("HID: uclogic: Switch to Digitizer usage for
>>>>> styluses") broke input from my XP-Pen Star G640. This is because the
>>>>> "Digitizer" usage is not recognized as a valid usage for input devices.
>>>>>
>>>>> This patch changes the IS_INPUT_APPLICATION macro so that the
>>>>> "Digitizer"
>>>>> (HID_DG_DIGITIZER) usage is recognized as an input device usage.
>>>>>
>>>>> Fixes: f7d8e387d9ae ("HID: uclogic: Switch to Digitizer usage for
>>>>> styluses")
>>>>> Signed-off-by: Torge Matthies <openglfreak@googlemail.com>
>>>>> ---
>>>>> This patch could be risky, because any digitizer devices that were
>>>>> previously not treated as input devices are now used for input.
>>>>> Alternatively the linked commit could be reverted, but that would
>>>>> re-introduce the problem detailed in its commit message.
>>>>>
>>>>>    include/linux/hid.h | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> I hesitated about this when I sent the patch you mentioned. In the end,
>>>> I didn't include any fix because the digitizer use was tested for 2
>>>> years in DIGImend, so I (wrongly) assumed that it was safe enough.
>>>>
>>>> However, my initial thought was to add in uclogic_probe():
>>>>
>>>>           hdev->quirks |= HID_QUIRK_HIDINPUT_FORCE;
>>>> +       hdev->quirks |= HID_QUIRK_HIDINPUT_FORCE;
>>>>
>>>> Let's see if we can hear more opinions, but if you are worried about
>>>> affecting other drivers, that could be a good solution.
>>>
>>> Sadly, my automated regression tests are broken for a while and I
>>> haven't checked if that patch is introducing errors in hid-multitouch.
>>>
>>> FWIW, this part has always been painful because some tablets were not
>>> using the correct usages. And so that's why we are ending up in that
>>> weird situation.
>>>
>>> Anyway, just to mention that any code that touches this part should be
>>> tested against the hid regression tests suite[0], because that's the
>>> only way to find out if the change is affecting other devices.
>>
>> My XP-Pen Star G640 hasn't been working since commit f7d8e387d9ae and
>> this patch fixes it. Is there anything I can do to help get this issue
>> resolved? Should this be reported as a regression?
> 
> What's the latest version you tested? This is not my area of expertise,
> but I noticed there was a patch with a fix for f7d8e387d9ae that went
> into 6.0.3:
> https://lore.kernel.org/all/20221019083311.156155236@linuxfoundation.org/
> 
> Maybe it helps, but maybe I'm just confusing everything with this mail.

I've tested up to commit 98555239e4c3 which was the latest mainline 
version yesterday and it was still broken.

Best,
Alex
