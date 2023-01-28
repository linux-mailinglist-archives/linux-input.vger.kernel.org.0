Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0810F67F99A
	for <lists+linux-input@lfdr.de>; Sat, 28 Jan 2023 17:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbjA1Qgb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Jan 2023 11:36:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbjA1Qga (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Jan 2023 11:36:30 -0500
Received: from mail.schwarzvogel.de (unknown [IPv6:2a01:4f8:252:1806::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C732279C
        for <linux-input@vger.kernel.org>; Sat, 28 Jan 2023 08:36:27 -0800 (PST)
Received: from klausman by mail.schwarzvogel.de with local (Exim 4.96)
        (envelope-from <klausman@schwarzvogel.de>)
        id 1pLoBi-0012FE-2j;
        Sat, 28 Jan 2023 17:36:22 +0100
Date:   Sat, 28 Jan 2023 17:36:22 +0100
From:   Tobias Klausmann <klausman@schwarzvogel.de>
To:     "Linux kernel regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Cc:     Salvatore Bonaccorso <carnil@debian.org>,
        linux-input@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Linux 6.1 and 6.2-rc make mousewheel on Logitech G903
 (046d:c091) report too many non-hires events
Message-ID: <Y9VPBpcyEK61cNC1@skade.schwarzvogel.de>
References: <Y9GmnIjUgIGuYtk2@skade.schwarzvogel.de>
 <Y9VBz/GVZPqG3KwM@eldamar.lan>
 <01fb3b37-8ba2-70f9-df62-4cf8df6bcc97@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01fb3b37-8ba2-70f9-df62-4cf8df6bcc97@leemhuis.info>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi! 

On Sat, 28 Jan 2023, Linux kernel regression tracking (Thorsten Leemhuis) wrote:
> On 28.01.23 16:39, Salvatore Bonaccorso wrote:
> > Let's loop in as well the regresssions list.
> 
> Thx for that.
> 
> TWIMC, I assume it's the same issue as this one:
> https://bugzilla.kernel.org/show_bug.cgi?id=216885

That is correct.

Best,
Tobias
