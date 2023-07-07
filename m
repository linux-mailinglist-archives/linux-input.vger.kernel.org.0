Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8E874ADDA
	for <lists+linux-input@lfdr.de>; Fri,  7 Jul 2023 11:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbjGGJhL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jul 2023 05:37:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231732AbjGGJhK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jul 2023 05:37:10 -0400
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0712106;
        Fri,  7 Jul 2023 02:37:08 -0700 (PDT)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1qHhtj-0001oz-6m; Fri, 07 Jul 2023 11:37:07 +0200
Message-ID: <b42cd529-15f2-1206-ad7b-aafe557b8fb9@leemhuis.info>
Date:   Fri, 7 Jul 2023 11:37:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: amd_sfh driver causes kernel oops during boot
Content-Language: en-US, de-DE
To:     Haochen Tong <linux@hexchain.org>, stable@vger.kernel.org
Cc:     regressions@lists.linux.dev, linux-input@vger.kernel.org,
        Basavaraj Natikar <basavaraj.natikar@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>
References: <f40e3897-76f1-2cd0-2d83-e48d87130eab@hexchain.org>
From:   "Linux regression tracking #update (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <f40e3897-76f1-2cd0-2d83-e48d87130eab@hexchain.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1688722628;3c44945a;
X-HE-SMSGID: 1qHhtj-0001oz-6m
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 23.05.23 19:27, Haochen Tong wrote:
> 
> Since kernel 6.3.0 (and also 6.4rc3), on a ThinkPad Z13 system with Arch
> Linux, I've noticed that the amd_sfh driver spews a lot of stack traces
> during boot. Sometimes it is an oops:

For the record:

#regzbot resolve: fixed in newer firmware and mainline post-6.4;
backport not planned, as bug unlikely to repeat, but possible when needed
#regzbot ignore-activity

For details see Mario's explanation here (thx for it, btw):
https://lore.kernel.org/all/89ea9fb7-9026-ccb6-ad88-50e1c28b4474@amd.com/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

