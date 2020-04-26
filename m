Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E12D51B918D
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 18:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgDZQMu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 12:12:50 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:49346 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726147AbgDZQMt (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 12:12:49 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 499CcH47TFzDY;
        Sun, 26 Apr 2020 18:12:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1587917567; bh=Qzt9vGu2iBEAs1D6RUne2xBqdVjeLiCn/1Z3nXPgvNU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oh2SS+WhW3u7O6HxU2wlszSidW1X1ocg5FJKhsKoMDrwOUKln5M7226upwD3RFWpz
         e8zz4wjTb3Z6I7ry+wirGlr6gRGCEG3x0EU81P537FHlqGYgP9/KATKAH91lTJ9Xwt
         4GD/R6puntito5Npj3XDb/RQruGE8/NQbck8HMokWZr1Ur/K4htD3RARQ/JVHArszB
         qvcZ88QapdseTQLDVvoe35t+a2jnmTmZpSHnANS58+nOelPKyL3FAs9t5wHGJ59hxF
         9n1ZhLrQG81swXsHUf4hCo77mp1+0bBN675pyYZAawQ/AubYrquiEHFOWI3IQD1drC
         XQjjgO1krFnYg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Sun, 26 Apr 2020 18:12:46 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/9] input: elants: remove unused axes
Message-ID: <20200426161246.GA23794@qmqm.qmqm.pl>
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
 <62e897b0d6f6054dae26c853a9a1f1fb6d3c420b.1586784389.git.mirq-linux@rere.qmqm.pl>
 <20200426045200.GN125362@dtor-ws>
 <20200426112150.GA16230@qmqm.qmqm.pl>
 <a9828df8-c974-3bc2-6ecf-962489cf1189@gmail.com>
 <489b497b-fd25-fa6b-59c9-9d925c489fe0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <489b497b-fd25-fa6b-59c9-9d925c489fe0@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 26, 2020 at 06:41:34PM +0300, Dmitry Osipenko wrote:
> 26.04.2020 18:39, Dmitry Osipenko пишет:
> > 26.04.2020 14:21, Michał Mirosław пишет:
> >> On Sat, Apr 25, 2020 at 09:52:00PM -0700, Dmitry Torokhov wrote:
> >>> On Mon, Apr 13, 2020 at 03:32:23PM +0200, Michał Mirosław wrote:
> >>>> Driver only ever reports MT events. Clear capabilities of all others.
> >>> This is not true. input_mt_sync_frame() calls
> >>> input_mt_report_pointer_emulation() which does emut single-touch events
> >>> for the benefit of older userspace (or userspace that is not interested
> >>> in multitouch).
> >>
> >> Oh, I didn't notice that. Looking at the code, I see that
> >> input_mt_init_slots() sets up the emulated axes in this case.
> >>
> >> Do you need me to update the commitmsg?
> > 
> > I tried Ubuntu 12.04 that uses ancient libinput (or whatever it was back
> > then), which doesn't support MT. Mouse doesn't move at all with this
> > patch being applied. Without this patch mouse moves, but it's not usable
> > because the cursor's position is wrong, i.e. mouse position doesn't
> > match the screen touches.
> > 
> > This means that input_mt_report_pointer_emulation() doesn't set up
> > everything needed for the legacy pointer emulation.
> > 
> 
> I meant the input_mt_init_slots().

Can you try v4 and see if it helps? input_mt_init_slots() needs other
axes set up before for it to use correct ranges.

Best Regards
Michał Mirosław
