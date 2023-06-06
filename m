Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBD6472383F
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 08:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235646AbjFFG4Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 02:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235649AbjFFG4W (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 02:56:22 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B7318E;
        Mon,  5 Jun 2023 23:56:20 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1q6Qc5-0000ZS-B7; Tue, 06 Jun 2023 08:56:17 +0200
Message-ID: <46d5acd2-5961-a496-4c1a-68e5c47021fb@leemhuis.info>
Date:   Tue, 6 Jun 2023 08:56:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: amd_sfh driver causes kernel oops during boot
Content-Language: en-US, de-DE
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Malte Starostik <malte@starostik.de>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     basavaraj.natikar@amd.com, linux-input@vger.kernel.org,
        linux@hexchain.org, regressions@lists.linux.dev,
        stable@vger.kernel.org
References: <ZG3ipauL9FTnQJiC@debian.me> <3250319.ancTxkQ2z5@zen>
 <ZH6buB8TcMd5aT_1@debian.me>
From:   "Linux regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZH6buB8TcMd5aT_1@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1686034580;36e0fbb5;
X-HE-SMSGID: 1q6Qc5-0000ZS-B7
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 06.06.23 04:36, Bagas Sanjaya wrote:
> On Mon, Jun 05, 2023 at 01:24:25PM +0200, Malte Starostik wrote:
>> Hello,
>>
>> chiming in here as I'm experiencing what looks like the exact same issue, also 
>> on a Lenovo Z13 notebook, also on Arch:
>> Oops during startup in task udev-worker followed by udev-worker blocking all 
>> attempts to suspend or cleanly shutdown/reboot the machine - in fact I first 
>> noticed because the machine surprised with repeatedly running out of battery 
>> after it had supposedly been in standby but couldn't. Only then I noticed the 
>> error on boot.
>>
>> bisect result:
>> 904e28c6de083fa4834cdbd0026470ddc30676fc is the first bad commit
>> commit 904e28c6de083fa4834cdbd0026470ddc30676fc
>> Merge: a738688177dc 2f7f4efb9411
>> Author: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>> Date:   Wed Feb 22 10:44:31 2023 +0100
>>
>>     Merge branch 'for-6.3/hid-bpf' into for-linus
> 
> Hmm, seems like bad bisect (bisected to HID-BPF which IMO isn't related
> to amd_sfh). Can you repeat the bisection?

Well, amd_sfh afaics apparently interacts with HID (see trace earlier in
the thread), so it's not that far away. But it's a merge commit, which
is possible, but doesn't happen every day. So a recheck might really be
a good idea.

> Anyway, tl;dr:
> 
>> A: http://en.wikipedia.org/wiki/Top_post
>> Q: Were do I find info about this thing called top-posting?
> [...]

BTW, I'm not sure if this really is helpful. Teaching this to upcoming
kernel developers is definitely worth it, but I wonder if pushing this
on all reporters might do more harm than good. I also wonder if asking
them a bit more kindly might be wiser (e.g. instead of "Anyway, tl;dr:"
something like "BTW, please do not top-post:" or something like that maybe).

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.
