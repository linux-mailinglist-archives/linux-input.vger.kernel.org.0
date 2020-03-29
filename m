Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4D6196BA2
	for <lists+linux-input@lfdr.de>; Sun, 29 Mar 2020 09:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726912AbgC2HYh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Mar 2020 03:24:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:50126 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726342AbgC2HYg (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Mar 2020 03:24:36 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 98DFB2073B;
        Sun, 29 Mar 2020 07:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585466675;
        bh=jlBuA17ZkykA4afgeBWaAMvA9oLO8Nhtj9M+58dDUwY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VkhsiyFKlVwWwsdxs1176XLRO6sPPHZrxn/aC1ePgbw0yE3MtxoeaHfoUlODlsm2k
         dfLqtcangCuNpZLJqsngejd5Dhu0r4k6POPFf8Uvhu+ocd0gF+ecMNFwAQ1C4wYBNG
         HsW79oEd3d5dBEj6nrMlEj/34tDnnkh1js1BMKB8=
Date:   Sun, 29 Mar 2020 09:24:32 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rajat Jain <rajatja@google.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rajat Jain <rajatxjain@gmail.com>
Subject: Re: [PATCH] Input: input-event-codes.h: Update the deprecated license
Message-ID: <20200329072432.GB3909421@kroah.com>
References: <20200328004832.107247-1-rajatja@google.com>
 <20200328072031.GA3651219@kroah.com>
 <CAKdAkRQMnR1oKPnmwmj0OYg_DWBZyVbPE8McacwCeQFO2NzpRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKdAkRQMnR1oKPnmwmj0OYg_DWBZyVbPE8McacwCeQFO2NzpRQ@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Mar 28, 2020 at 01:42:09PM -0700, Dmitry Torokhov wrote:
> Hi Greg,
> 
> On Sat, Mar 28, 2020 at 12:20 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Mar 27, 2020 at 05:48:32PM -0700, Rajat Jain wrote:
> > > >From https://spdx.org/licenses/
> > >
> > > "Release 3.0 replaced previous Identifiers for GNU licenses with more
> > > explicit Identifiers to reflect the "this version only" or "any later
> > > version" option specific to those licenses. As such, the previously used
> > > Identifiers for those licenses are deprecated as of v3.0."
> > >
> > > Replace the
> > > /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > > with
> > > /* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> > >
> > > Signed-off-by: Rajat Jain <rajatja@google.com>
> >
> > If you like reading documentation for stuff like this, how about reading
> > LICENSES/preferred/GPL-2.0 which shows that both examples are just fine
> > and we are going to stick with that for now as we don't want to do a
> > wholesale change at this point in time.
> >
> > In other words, we do not follow the 3.0 version of the SPDX spec as we
> > think it's pretty silly :)
> 
> coreboot however does follow SPDX 3.0 and would like to be able to
> consume this file without relaxing their license checks. I do not
> think we need wholesale update, but is there reason to not update this
> particular file? I am not following SPDX development, so that's why
> you got pulled in ;)

If you want to take this change because of sharing with other projects,
that's fine, but do not say that the reason you are making this change
is because it is somehow required by our use of SPDX and the updated
version.  Just say that you want to share it with other projects :)

thanks,

greg k-h
