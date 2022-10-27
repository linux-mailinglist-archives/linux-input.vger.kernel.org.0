Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FB3F60F6BF
	for <lists+linux-input@lfdr.de>; Thu, 27 Oct 2022 14:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235445AbiJ0MGu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Oct 2022 08:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235503AbiJ0MGt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Oct 2022 08:06:49 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C250C8E705
        for <linux-input@vger.kernel.org>; Thu, 27 Oct 2022 05:06:47 -0700 (PDT)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1oo1el-00040M-M4; Thu, 27 Oct 2022 14:06:43 +0200
Message-ID: <1db88d01-1004-0e42-b9aa-3e0bb2b22cdb@leemhuis.info>
Date:   Thu, 27 Oct 2022 14:06:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US, de-DE
To:     Alexander Zhang <alex@alexyzhang.dev>,
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
From:   Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH] HID: Accept Digitizers as input devices
In-Reply-To: <2717adbe-e9b2-3c5a-7ccf-3d851a55744c@alexyzhang.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1666872407;03e10e96;
X-HE-SMSGID: 1oo1el-00040M-M4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi, this is your Linux kernel regression tracker. CCing the regression
mailing list, as it should be in the loop for all regressions, as
explained here:
https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html

On 27.10.22 00:42, Alexander Zhang wrote:
> On 8/11/22 8:27 AM, Benjamin Tissoires wrote:
>> On Thu, Aug 4, 2022 at 8:00 PM José Expósito
>> <jose.exposito89@gmail.com> wrote:
>>> On Thu, Aug 04, 2022 at 05:18:32PM +0200, Torge Matthies wrote:
>>>> Commit f7d8e387d9ae ("HID: uclogic: Switch to Digitizer usage for
>>>> styluses") broke input from my XP-Pen Star G640. This is because the
>>>> "Digitizer" usage is not recognized as a valid usage for input devices.
>>>>
>>>> This patch changes the IS_INPUT_APPLICATION macro so that the
>>>> "Digitizer"
>>>> (HID_DG_DIGITIZER) usage is recognized as an input device usage.
>>>>
>>>> Fixes: f7d8e387d9ae ("HID: uclogic: Switch to Digitizer usage for
>>>> styluses")
>>>> Signed-off-by: Torge Matthies <openglfreak@googlemail.com>
>>>> ---
>>>> This patch could be risky, because any digitizer devices that were
>>>> previously not treated as input devices are now used for input.
>>>> Alternatively the linked commit could be reverted, but that would
>>>> re-introduce the problem detailed in its commit message.
>>>>
>>>>   include/linux/hid.h | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> I hesitated about this when I sent the patch you mentioned. In the end,
>>> I didn't include any fix because the digitizer use was tested for 2
>>> years in DIGImend, so I (wrongly) assumed that it was safe enough.
>>>
>>> However, my initial thought was to add in uclogic_probe():
>>>
>>>          hdev->quirks |= HID_QUIRK_HIDINPUT_FORCE;
>>> +       hdev->quirks |= HID_QUIRK_HIDINPUT_FORCE;
>>>
>>> Let's see if we can hear more opinions, but if you are worried about
>>> affecting other drivers, that could be a good solution.
>>
>> Sadly, my automated regression tests are broken for a while and I
>> haven't checked if that patch is introducing errors in hid-multitouch.
>>
>> FWIW, this part has always been painful because some tablets were not
>> using the correct usages. And so that's why we are ending up in that
>> weird situation.
>>
>> Anyway, just to mention that any code that touches this part should be
>> tested against the hid regression tests suite[0], because that's the
>> only way to find out if the change is affecting other devices.
> 
> My XP-Pen Star G640 hasn't been working since commit f7d8e387d9ae and
> this patch fixes it. Is there anything I can do to help get this issue
> resolved? Should this be reported as a regression?

What's the latest version you tested? This is not my area of expertise,
but I noticed there was a patch with a fix for f7d8e387d9ae that went
into 6.0.3:
https://lore.kernel.org/all/20221019083311.156155236@linuxfoundation.org/

Maybe it helps, but maybe I'm just confusing everything with this mail.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
