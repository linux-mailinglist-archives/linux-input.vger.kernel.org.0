Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1418723E74
	for <lists+linux-input@lfdr.de>; Tue,  6 Jun 2023 11:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237231AbjFFJyF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jun 2023 05:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236624AbjFFJyB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jun 2023 05:54:01 -0400
Received: from mailout.blnma.de (mailout.blnma.de [116.203.12.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0565C10D2;
        Tue,  6 Jun 2023 02:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=starostik.de; s=dkim210803; h=Content-Type:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=pTeb9LbTMrna13GViWC3h4XpyHzIp37dyOLsWSuYVME=; t=1686045238; x=1686909238; 
        b=fozQ2v6b4D3ZjPUnWiY1Y/wsy09VlXfIb0azApNfp2FVoEvlh/xvC8KqsYoEseC5zR5H4KnS/+l
        XPn6lT+3pxPXAxX5LbNAbCV6qsYwHx3aUz/tFbEQKbsY8OOH54AS7EHyzJ0eYtUQO9XZT5FdxbYzj
        hlqczKZ70ROlNwTkKKqhh0I4QvxfB/Z9zQe6sQExtVrI3C3bGYvLhLeRfq/tEVDLZm33VkowvdGdG
        NxW/F75s/NZ5Sc2pNZIv9s60c9WoM21rOm1AZ5xqwWhhJWQ/eKCPFpyh6IPqI+m1WqkBRjKpasAei
        NIiq+LbcK2wSw+Ek6zH62eDi3mcHGAqu5qZg==;
Received: from dovecot-0.dovecot.mail.svc.cluster.local ([10.244.6.208] helo=mail.blnma.de)
        by mail.blnma.de with esmtp (Exim 4.96)
        (envelope-from <malte@starostik.de>)
        id 1q6TNs-000EMX-0d;
        Tue, 06 Jun 2023 09:53:48 +0000
Received: from zen.localnet ([62.214.179.90])
        by mail.blnma.de with ESMTPSA
        id PbH6LCoCf2TpSwAA399c4A
        (envelope-from <malte@starostik.de>); Tue, 06 Jun 2023 09:53:46 +0000
From:   Malte Starostik <malte@starostik.de>
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        regressions@lists.linux.dev
Cc:     basavaraj.natikar@amd.com, linux-input@vger.kernel.org,
        linux@hexchain.org
Subject: Re: amd_sfh driver causes kernel oops during boot
Date:   Tue, 06 Jun 2023 11:53:32 +0200
Message-ID: <2784681.mvXUDI8C0e@zen>
In-Reply-To: <46d5acd2-5961-a496-4c1a-68e5c47021fb@leemhuis.info>
References: <ZG3ipauL9FTnQJiC@debian.me> <ZH6buB8TcMd5aT_1@debian.me>
 <46d5acd2-5961-a496-4c1a-68e5c47021fb@leemhuis.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am Dienstag, 6. Juni 2023, 08:56:16 CEST schrieb Linux regression tracking 
(Thorsten Leemhuis):
> On 06.06.23 04:36, Bagas Sanjaya wrote:
> > On Mon, Jun 05, 2023 at 01:24:25PM +0200, Malte Starostik wrote:
> >> chiming in here as I'm experiencing what looks like the exact same issue,
> >> also on a Lenovo Z13 notebook, also on Arch:

> >> bisect result:
> >> 904e28c6de083fa4834cdbd0026470ddc30676fc is the first bad commit
> >> commit 904e28c6de083fa4834cdbd0026470ddc30676fc
> >> Merge: a738688177dc 2f7f4efb9411
> >> Author: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> >> Date:   Wed Feb 22 10:44:31 2023 +0100
> >> 
> >>     Merge branch 'for-6.3/hid-bpf' into for-linus
> > 
> > Hmm, seems like bad bisect (bisected to HID-BPF which IMO isn't related
> > to amd_sfh). Can you repeat the bisection?

I'm digging further. That merge is what git bisect ended at, but admittedly my 
git skills and especially with a large codebase aren't too advanced.
While at 904e28c6de083fa4834cdbd0026470ddc30676fc, git show only shows the diff 
for tools/testing/selftests/Makefile which can't really be the culprit. 
However, git diff @~..@ has changes in drivers/hid/amd-sfh-hid/Kconfig (seems 
innocuous, too), but also some changes to drivers/hid/hid-core.c. Nothing 
obvious either, but at least it's not too far from the trace.

> Well, amd_sfh afaics apparently interacts with HID (see trace earlier in
> the thread), so it's not that far away. But it's a merge commit, which
> is possible, but doesn't happen every day. So a recheck might really be
> a good idea.

I will recheck some more, the Oops only happens with roughly 30 % chance 
during boot. When it doesn't, there seem to be no other issues until the next 
boot either. I made sure to reboot a few times after each bisect step, will 
look deeper into the area.

> > Anyway, tl;dr:
> >> A: http://en.wikipedia.org/wiki/Top_post
> >> Q: Were do I find info about this thing called top-posting?
> > 
> > [...]
> 
> BTW, I'm not sure if this really is helpful. Teaching this to upcoming
> kernel developers is definitely worth it, but I wonder if pushing this
> on all reporters might do more harm than good. I also wonder if asking
> them a bit more kindly might be wiser (e.g. instead of "Anyway, tl;dr:"
> something like "BTW, please do not top-post:" or something like that maybe).

Thanks, and I agree in general. However, my case was in fact even worse :-) 
I'm totally aware of the badness of top-posting. It happened because I had a 
draft of the reply. Set In-Reply-To from the link in the wev archive and 
pasted the previous message from there. Couple days later, I just pasted the 
result on top and disregarded the existing text.

BR Malte


