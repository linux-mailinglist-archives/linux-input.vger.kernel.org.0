Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 845BC687D39
	for <lists+linux-input@lfdr.de>; Thu,  2 Feb 2023 13:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbjBBMVm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 2 Feb 2023 07:21:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232165AbjBBMVk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Feb 2023 07:21:40 -0500
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E8B88626E
        for <linux-input@vger.kernel.org>; Thu,  2 Feb 2023 04:21:33 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 740CF24000A;
        Thu,  2 Feb 2023 12:21:30 +0000 (UTC)
Message-ID: <0aa7e4aab15179d4c6093d32db699ffcc8a2a8ec.camel@hadess.net>
Subject: Re: Linux 6.1 and 6.2-rc make mousewheel on Logitech G903
 (046d:c091) report too many non-hires events
From:   Bastien Nocera <hadess@hadess.net>
To:     Tobias Klausmann <klausman@schwarzvogel.de>,
        "Linux kernel regression tracking (Thorsten Leemhuis)" 
        <regressions@leemhuis.info>
Cc:     Salvatore Bonaccorso <carnil@debian.org>,
        linux-input@vger.kernel.org, regressions@lists.linux.dev
Date:   Thu, 02 Feb 2023 13:21:29 +0100
In-Reply-To: <Y9VPBpcyEK61cNC1@skade.schwarzvogel.de>
References: <Y9GmnIjUgIGuYtk2@skade.schwarzvogel.de>
         <Y9VBz/GVZPqG3KwM@eldamar.lan>
         <01fb3b37-8ba2-70f9-df62-4cf8df6bcc97@leemhuis.info>
         <Y9VPBpcyEK61cNC1@skade.schwarzvogel.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hey Tobias,

On Sat, 2023-01-28 at 17:36 +0100, Tobias Klausmann wrote:
> Hi! 
> 
> On Sat, 28 Jan 2023, Linux kernel regression tracking (Thorsten
> Leemhuis) wrote:
> > On 28.01.23 16:39, Salvatore Bonaccorso wrote:
> > > Let's loop in as well the regresssions list.
> > 
> > Thx for that.
> > 
> > TWIMC, I assume it's the same issue as this one:
> > https://bugzilla.kernel.org/show_bug.cgi?id=216885
> 
> That is correct.

I've posted debug patches on the bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=216885#c29

I'll post a patch to either fix the bug, or disable the functionality
on those devices as soon as I have enough information.

Cheers
