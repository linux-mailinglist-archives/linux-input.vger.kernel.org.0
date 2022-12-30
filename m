Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2751E653F00
	for <lists+linux-input@lfdr.de>; Thu, 22 Dec 2022 12:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235478AbiLVLYg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Dec 2022 06:24:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbiLVLYe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Dec 2022 06:24:34 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5E365EC
        for <linux-input@vger.kernel.org>; Thu, 22 Dec 2022 03:24:33 -0800 (PST)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1p8Jge-0008CZ-3K; Thu, 22 Dec 2022 12:24:32 +0100
Message-ID: <d0119f9f-421c-069a-91f6-ff7a0187038d@leemhuis.info>
Date:   Thu, 22 Dec 2022 12:24:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PASEMI] Nemo board doesn't reboot anymore after the commit "HID:
 usbhid: Add ALWAYS_POLL quirk for some mice" #forregzbot
Content-Language: en-US, de-DE
To:     linux-input@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <747e3240-bb3f-3a0c-e998-02f3b4826704@xenosoft.de>
From:   Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <747e3240-bb3f-3a0c-e998-02f3b4826704@xenosoft.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1671708274;84a9aa43;
X-HE-SMSGID: 1p8Jge-0008CZ-3K
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[Note: this mail contains only information for Linux kernel regression
tracking. Mails like these contain '#forregzbot' in the subject to make
then easy to spot and filter out. The author also tried to remove most
or all individuals from the list of recipients to spare them the hassle.]

On 22.12.22 11:42, Christian Zigotzky wrote:
> 
> The Nemo board [1] doesn't reboot anymore since the final kernel 6.1.
> The reboot works with the RC8 of kernel 6.1.
> Actually, a reboot works but the CFE firmware is not loaded. Maybe there
> is still something in the memory after the reboot.
> 
> I bisected today. [2]

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced f6d910a89a23
#regzbot title hid: PASEMI Nemo board doesn't reboot anymore
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.
