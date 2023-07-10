Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 512B974D510
	for <lists+linux-input@lfdr.de>; Mon, 10 Jul 2023 14:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbjGJMQt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jul 2023 08:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjGJMQs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jul 2023 08:16:48 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6064B1;
        Mon, 10 Jul 2023 05:16:47 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1qIpos-0002hs-9O; Mon, 10 Jul 2023 14:16:46 +0200
Message-ID: <05355133-4a30-aa0d-4b24-ccc13e05ff53@leemhuis.info>
Date:   Mon, 10 Jul 2023 14:16:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: amd_sfh driver causes kernel oops during boot
Content-Language: en-US, de-DE
From:   "Linux regression tracking #update (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
To:     Linux regressions mailing list <regressions@lists.linux.dev>
Cc:     linux-input@vger.kernel.org, linux@hexchain.org,
        stable@vger.kernel.org
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
          Linux regressions mailing list 
          <regressions@lists.linux.dev>
References: <ZG3ipauL9FTnQJiC@debian.me>
 <aci7a4jnosozypn6sffsdoaezg4p42zgjy5dwnjyvnbav7chdm@wettfjwb4enw>
 <79bd270e-4a0d-b4be-992b-73c65d085624@amd.com> <5980752.YW5z2jdOID@zen>
 <1b3fd148-44d7-d476-e9e6-f9d8c8ec0ee6@leemhuis.info>
In-Reply-To: <1b3fd148-44d7-d476-e9e6-f9d8c8ec0ee6@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1688991407;c6fceb01;
X-HE-SMSGID: 1qIpos-0002hs-9O
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 20.06.23 15:20, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 07.06.23 00:57, Malte Starostik wrote:
>> Am Dienstag, 6. Juni 2023, 17:25:13 CEST schrieb Limonciello, Mario:
>>> On 6/6/2023 3:08 AM, Benjamin Tissoires wrote:
>>>> On Jun 06 2023, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>>>> On Mon, Jun 05, 2023 at 01:24:25PM +0200, Malte Starostik wrote:
>>>>>>>
>>>>>>> chiming in here as I'm experiencing what looks like the exact same
>>>>>>> issue, also on a Lenovo Z13 notebook, also on Arch:
>>>>>>> Oops during startup in task udev-worker followed by udev-worker
>>>>>>> blocking all attempts to suspend or cleanly shutdown/reboot the
>>>>>>> machine

For the record:

#regzbot resolve: fixed in newer firmware and mainline post-6.4;
backport possible when needed, but not planned
#regzbot ignore-activity

For details see Mario's explanation here (thx for it, btw):
https://lore.kernel.org/all/89ea9fb7-9026-ccb6-ad88-50e1c28b4474@amd.com/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


