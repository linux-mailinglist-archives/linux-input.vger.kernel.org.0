Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF21D67F990
	for <lists+linux-input@lfdr.de>; Sat, 28 Jan 2023 17:28:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229867AbjA1Q2z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Jan 2023 11:28:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjA1Q2z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Jan 2023 11:28:55 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3DB2659F
        for <linux-input@vger.kernel.org>; Sat, 28 Jan 2023 08:28:54 -0800 (PST)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1pLo4S-0003FQ-Fr; Sat, 28 Jan 2023 17:28:52 +0100
Message-ID: <01fb3b37-8ba2-70f9-df62-4cf8df6bcc97@leemhuis.info>
Date:   Sat, 28 Jan 2023 17:28:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Linux 6.1 and 6.2-rc make mousewheel on Logitech G903 (046d:c091)
 report too many non-hires events
Content-Language: en-US, de-DE
To:     Salvatore Bonaccorso <carnil@debian.org>,
        Tobias Klausmann <klausman@schwarzvogel.de>
Cc:     linux-input@vger.kernel.org, regressions@lists.linux.dev
References: <Y9GmnIjUgIGuYtk2@skade.schwarzvogel.de>
 <Y9VBz/GVZPqG3KwM@eldamar.lan>
From:   "Linux kernel regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <Y9VBz/GVZPqG3KwM@eldamar.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1674923334;797f293f;
X-HE-SMSGID: 1pLo4S-0003FQ-Fr
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 28.01.23 16:39, Salvatore Bonaccorso wrote:
> On Wed, Jan 25, 2023 at 11:01:00PM +0100, Tobias Klausmann wrote:
>> Hi!
>>
>> As it says in the subject.
>>
>> At some point between 6.0 and 6.1, the kernel (if HID_LOGITECH_HIDPP was
>> m or y) started reporting a full event for every hires event on a
>> Logitech G903. 
>>
>> In my quest of finding out what the root cause is, ive filed these bugs:
>>
>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1029584
>> https://gitlab.freedesktop.org/libinput/libinput/-/issues/852
>>
>> The libinput one has the most detail. The most relevant one is this log
>> from libinput record, showing what happens if I turn the mousewheel by
>> one notch:
>>
>>     events:
>>     # Current time is 20:37:11
>>     - evdev:
>>       - [  3,  63476,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
>>       - [  3,  63476,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
>>       - [  3,  63476,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +3063ms
>>     - evdev:
>>       - [  3, 139476,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
>>       - [  3, 139476,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
>>       - [  3, 139476,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +76ms
>>     - evdev:
>>       - [  3, 197482,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
>>       - [  3, 197482,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
>>       - [  3, 197482,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +58ms
>>     - evdev:
>>       - [  3, 227485,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
>>       - [  3, 227485,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
>>       - [  3, 227485,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +30ms
>>     - evdev:
>>       - [  3, 240484,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
>>       - [  3, 240484,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
>>       - [  3, 240484,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +13ms
>>     - evdev:
>>       - [  3, 250470,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
>>       - [  3, 250470,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
>>       - [  3, 250470,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +10ms
>>     - evdev:
>>       - [  3, 256486,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
>>       - [  3, 256486,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
>>       - [  3, 256486,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +6ms
>>     - evdev:
>>       - [  3, 264472,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
>>       - [  3, 264472,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
>>       - [  3, 264472,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +8ms
>>     # Current time is 20:37:15
>>
>> Note how it reports both REL_WHEEL and REL_WHEEL_HI_RES at every
>> instance.
>>
>> I've tried assorted kernels, both Debian as well as hand-compiled
>> vanilla ones, and the problem only shows up if hid_logitech_hidpp.ko is
>> loaded, so I am blacklisting it for now. Also note that even unloading
>> the module didn't fix the behavior, though that may be because X11 was
>> still runing and so libinput's state ight have been still mangled.
>>
>> The most recent kernels I have tested with are 6.1.4 and 6.2-rc5.
>>
>> Best,
>> Tobias
> 
> Let's loop in as well the regresssions list.

Thx for that.

TWIMC, I assume it's the same issue as this one:
https://bugzilla.kernel.org/show_bug.cgi?id=216885

There in the past few days was some discussion about the issue with the
author of the culprit there.

HTH, ciao, Thorsten (wearing his 'the Linux kernel's regression tracker'
hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
