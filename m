Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9AD56997EE
	for <lists+linux-input@lfdr.de>; Thu, 16 Feb 2023 15:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbjBPOxh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Feb 2023 09:53:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbjBPOxc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Feb 2023 09:53:32 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB8354547
        for <linux-input@vger.kernel.org>; Thu, 16 Feb 2023 06:53:31 -0800 (PST)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1pSfdZ-0003Aj-Vt; Thu, 16 Feb 2023 15:53:30 +0100
Message-ID: <7d40eead-93ac-8585-f13a-9479bf4d9efd@leemhuis.info>
Date:   Thu, 16 Feb 2023 15:53:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: Linux 6.1 and 6.2-rc make mousewheel on Logitech G903 (046d:c091)
 report too many non-hires events
Content-Language: en-US, de-DE
From:   "Linux regression tracking #update (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
To:     Salvatore Bonaccorso <carnil@debian.org>,
        Tobias Klausmann <klausman@schwarzvogel.de>
Cc:     linux-input@vger.kernel.org, regressions@lists.linux.dev
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
          Linux regressions mailing list 
          <regressions@lists.linux.dev>
References: <Y9GmnIjUgIGuYtk2@skade.schwarzvogel.de>
 <Y9VBz/GVZPqG3KwM@eldamar.lan>
 <01fb3b37-8ba2-70f9-df62-4cf8df6bcc97@leemhuis.info>
In-Reply-To: <01fb3b37-8ba2-70f9-df62-4cf8df6bcc97@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676559211;a4b98b43;
X-HE-SMSGID: 1pSfdZ-0003Aj-Vt
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 28.01.23 17:28, Linux kernel regression tracking (Thorsten Leemhuis)
wrote:
> On 28.01.23 16:39, Salvatore Bonaccorso wrote:
>> On Wed, Jan 25, 2023 at 11:01:00PM +0100, Tobias Klausmann wrote:
>>> Hi!
>>>
>>> As it says in the subject.
>>>
>>> At some point between 6.0 and 6.1, the kernel (if HID_LOGITECH_HIDPP was
>>> m or y) started reporting a full event for every hires event on a
>>> Logitech G903. 

Just noticed that regzbot missed noticing the fix for this thread:

#regzbot fix: 690eb7dec72ae52d
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

#regzbot ignore-activity
