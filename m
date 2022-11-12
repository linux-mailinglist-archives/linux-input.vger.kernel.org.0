Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4B462667F
	for <lists+linux-input@lfdr.de>; Sat, 12 Nov 2022 03:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbiKLCpN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Nov 2022 21:45:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231911AbiKLCpM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Nov 2022 21:45:12 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7DF8E029
        for <linux-input@vger.kernel.org>; Fri, 11 Nov 2022 18:44:57 -0800 (PST)
Received: (Authenticated sender: alex@alexyzhang.dev)
        by mail.gandi.net (Postfix) with ESMTPSA id 54D3AE0002;
        Sat, 12 Nov 2022 02:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alexyzhang.dev;
        s=gm1; t=1668221096;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KNHXQH7G1uo0bb1rGKzbXIsnEpHoQzNrCzi26ZjRdRA=;
        b=fNJONnALlGk3DqII+d1EmFQGB8P2Q9R459TNKtK2wwo4iTx2godAJfb3N0Q8S4TCtN+bKQ
        6EeAsmT0ENhnui94f1dqMT549OaOabnFla1rBrF/dMGNZi4yjpId+GkYlXZuoDE4PxtZ4O
        YYdKxo6wuTBOecGIY58VlS7iIrIPRWlgg/4ygt4XqBBPWiaXtgXf6OQhdykymCWnugOPiZ
        9zSUn5Qr3beWTZhtm/N7D80Hnl3leEp3uYfb5yKTwR296q/9HTeiuBV9BaghWMejwmvsvD
        H9zl+0e+Ekfj+0Z0EP2zR1QF6itCf1nO1DESWMRCaIqgvp23iXjYdsOFrPHs6g==
Message-ID: <d0daeb38-e939-95e8-5191-9727adbdd278@alexyzhang.dev>
Date:   Fri, 11 Nov 2022 18:44:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Content-Language: en-US
To:     =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc:     Thorsten Leemhuis <regressions@leemhuis.info>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Torge Matthies <openglfreak@googlemail.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Nikolai Kondrashov <spbnick@gmail.com>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220804151832.30373-1-openglfreak@googlemail.com>
 <20220804180038.GA8906@elementary>
 <CAO-hwJJsKC=fyeFLCmdXMRkxEQFVGZ189GKphTVK83QJWc=udA@mail.gmail.com>
 <2717adbe-e9b2-3c5a-7ccf-3d851a55744c@alexyzhang.dev>
 <1db88d01-1004-0e42-b9aa-3e0bb2b22cdb@leemhuis.info>
 <b1536115-1d4b-67dd-197e-4b6ed8e5cbc6@alexyzhang.dev>
 <20221110174808.GA396731@elementary>
From:   Alexander Zhang <alex@alexyzhang.dev>
Subject: Re: [PATCH] HID: Accept Digitizers as input devices
In-Reply-To: <20221110174808.GA396731@elementary>
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

Hi José,

On 11/10/22 9:48 AM, José Expósito wrote:
> Hi!
> 
>>> On 27.10.22 00:42, Alexander Zhang wrote:
>>>> On 8/11/22 8:27 AM, Benjamin Tissoires wrote:
>>>>> On Thu, Aug 4, 2022 at 8:00 PM José Expósito
>>>>> <jose.exposito89@gmail.com> wrote:
>>>>>> On Thu, Aug 04, 2022 at 05:18:32PM +0200, Torge Matthies wrote:
>>>>>>> Commit f7d8e387d9ae ("HID: uclogic: Switch to Digitizer usage for
>>>>>>> styluses") broke input from my XP-Pen Star G640. This is because the
>>>>>>> "Digitizer" usage is not recognized as a valid usage for input devices.
>>>>>>>
>>>>>>> This patch changes the IS_INPUT_APPLICATION macro so that the
>>>>>>> "Digitizer"
>>>>>>> (HID_DG_DIGITIZER) usage is recognized as an input device usage.
>>>>>>>
>>>>>>> Fixes: f7d8e387d9ae ("HID: uclogic: Switch to Digitizer usage for
>>>>>>> styluses")
>>>>>>> Signed-off-by: Torge Matthies <openglfreak@googlemail.com>
>>>>>>> ---
>>>>>>> This patch could be risky, because any digitizer devices that were
>>>>>>> previously not treated as input devices are now used for input.
>>>>>>> Alternatively the linked commit could be reverted, but that would
>>>>>>> re-introduce the problem detailed in its commit message.
>>>>>>>
>>>>>>>     include/linux/hid.h | 2 +-
>>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> I hesitated about this when I sent the patch you mentioned. In the end,
>>>>>> I didn't include any fix because the digitizer use was tested for 2
>>>>>> years in DIGImend, so I (wrongly) assumed that it was safe enough.
>>>>>>
>>>>>> However, my initial thought was to add in uclogic_probe():
>>>>>>
>>>>>>            hdev->quirks |= HID_QUIRK_HIDINPUT_FORCE;
>>>>>> +       hdev->quirks |= HID_QUIRK_HIDINPUT_FORCE;
>>>>>>
>>>>>> Let's see if we can hear more opinions, but if you are worried about
>>>>>> affecting other drivers, that could be a good solution.
>>>>>
>>>>> Sadly, my automated regression tests are broken for a while and I
>>>>> haven't checked if that patch is introducing errors in hid-multitouch.
>>>>>
>>>>> FWIW, this part has always been painful because some tablets were not
>>>>> using the correct usages. And so that's why we are ending up in that
>>>>> weird situation.
>>>>>
>>>>> Anyway, just to mention that any code that touches this part should be
>>>>> tested against the hid regression tests suite[0], because that's the
>>>>> only way to find out if the change is affecting other devices.
> 
> Since it seems like this patch is kind of stuck, I sent you a different
> patch [1] that aims to fix the same issue but using a more conservative
> approach.
> 
> Could you test it and confirm that it fixes your problem, please?

I tested the patch on commit 4bbf3422df78 and it fixes the issue. 
(Sending this again to make sure it reaches everyone.)

Thank you,
Alexander Zhang

> Hopefully, we'd manage to get it merged as the risk of doing so would
> be smaller.
> 
> Jose
> 
> [1] https://lore.kernel.org/linux-input/20221110174056.393697-1-jose.exposito89@gmail.com/T/
> 
