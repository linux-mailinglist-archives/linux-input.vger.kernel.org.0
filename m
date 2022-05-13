Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0EE4525FEF
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379513AbiEMKhb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 06:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379459AbiEMKha (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 06:37:30 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 620F560ABF;
        Fri, 13 May 2022 03:37:29 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id D492C68B05; Fri, 13 May 2022 12:37:24 +0200 (CEST)
Date:   Fri, 13 May 2022 12:37:24 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Thorsten Leemhuis <regressions@leemhuis.info>
Cc:     Christoph Hellwig <hch@lst.de>, linux-usb@vger.kernel.org,
        bugzilla-daemon@kernel.org,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Satadru Pramanik <satadru@umich.edu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [Bug 215890] New: Regression in 5.18: bcm5974 trackpad causes
 error: xhci_hcd rejecting DMA map of vmalloc memory
Message-ID: <20220513103724.GA2289@lst.de>
References: <bug-215890-208809@https.bugzilla.kernel.org/> <76e24afa-ad7d-bf6d-d610-df61851b3e2b@leemhuis.info> <8365ac4b-c45a-dbff-eed1-8ccc88a8d02f@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8365ac4b-c45a-dbff-eed1-8ccc88a8d02f@leemhuis.info>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 13, 2022 at 10:24:34AM +0200, Thorsten Leemhuis wrote:
> On 04.05.22 10:42, Thorsten Leemhuis wrote:
> > 
> > Linux-Input developers, do you have any idea what might be causing the
> > problem outline below? It's a post 5.17 regression in mainline that was
> > reported to bugzilla.kernel.org about a week ago, but didn't even get a
> > single reply. Might be some other subsystem that is causing it, not sure.
> > 
> > On 27.04.22 00:42, bugzilla-daemon@kernel.org wrote:
> >> https://bugzilla.kernel.org/show_bug.cgi?id=215890
> 
> FYI, the reporter bisected this regression down to f5ff79fddf0e
> ("dma-mapping: remove CONFIG_DMA_REMAP"). CCing Christoph, who authored
> that change (I wonder if it just exposed an existing bug, but well,
> that's up for you to discuss).
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> P.S.: As the Linux kernel's regression tracker I deal with a lot of
> reports and sometimes miss something important when writing mails like
> this. If that's the case here, don't hesitate to tell me in a public
> reply, it's in everyone's interest to set the public record straight.
> 
> #regzbot introduced: f5ff79fddf0efecca538046b5cc20fb3ded2

Well, this just uncovered an existing bug in the driver.  You can not
just dma map memory returned from dma_alloc_coherent, and this driver
would already get vmalloc memory on arm/arm64 platforms anyway, we
now just do the same on x86 as well.

