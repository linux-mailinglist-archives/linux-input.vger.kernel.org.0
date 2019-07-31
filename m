Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B79067C34B
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2019 15:22:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388198AbfGaNWa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Jul 2019 09:22:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:50672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388236AbfGaNWa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Jul 2019 09:22:30 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1808D2064A;
        Wed, 31 Jul 2019 13:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564579349;
        bh=W+aYKCz9gxgG7u43KzXszSqqe6R1n9t7d1fUb3QuD7c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KyQY5CBjylSO7ewCUAToDkmaAwmQjJO8QvWo9w/ul3hlz4NRL+Gjz7gxVd5980jtP
         IGtcgcpPaQMoyDy1ZqpRsRWFSClc3ZThgNhemnSMgUB4JrS5m6yoU88+l6E0va7/KJ
         GHePa31wbh7qJ6l/aUhzBXH+dHwFwpLbAqoeZ3VE=
Date:   Wed, 31 Jul 2019 15:22:27 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Richard Gong <richard.gong@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Borislav Petkov <bp@alien8.de>,
        Darren Hart <dvhart@infradead.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Prisk <linux@prisktech.co.nz>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        x86@kernel.org
Subject: Re: [PATCH v2 00/10] drivers, provide a way to add sysfs groups
 easily
Message-ID: <20190731132227.GC12603@kroah.com>
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
 <20190731131045.GB147138@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190731131045.GB147138@dtor-ws>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 31, 2019 at 06:10:45AM -0700, Dmitry Torokhov wrote:
> On Wed, Jul 31, 2019 at 02:43:39PM +0200, Greg Kroah-Hartman wrote:
> > This patch originally started out just as a way for platform drivers to
> > easily add a sysfs group in a race-free way, but thanks to Dmitry's
> > patch, this series now is for all drivers in the kernel (hey, a unified
> > driver model works!!!)
> > 
> > I've only converted a few platform drivers here in this series to show
> > how it works, but other busses can be converted after the first patch
> > goes into the tree.
> > 
> > Here's the original 00 message, for people to get an idea of what is
> > going on here:
> > 
> > If a platform driver wants to add a sysfs group, it has to do so in a
> > racy way, adding it after the driver is bound.  To resolve this issue,
> > have the platform driver core do this for the driver, making the
> > individual drivers logic smaller and simpler, and solving the race at
> > the same time.
> > 
> > All of these patches depend on the first patch.  I'll take the first one
> > through my driver-core tree, and any subsystem maintainer can either ack
> > their individul patch and I will be glad to also merge it, or they can
> > wait until after 5.4-rc1 when the core patch hits Linus's tree and then
> > take it, it's up to them.
> 
> Maybe make an immutable branch off 5.2 with just patch 1/10 so that
> subsystems (and the driver core tree itself) could pull it in at their
> leisure into their "*-next" branches and did not have to wait till 5.4
> or risk merge clashes?

Good idea, I will do that when I apply it after a few days to give
people a chance to review it.

thanks,

greg k-h
