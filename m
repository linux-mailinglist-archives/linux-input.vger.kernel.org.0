Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A51F47F56A
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2019 12:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732401AbfHBKqh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Aug 2019 06:46:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:34086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730841AbfHBKqg (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 2 Aug 2019 06:46:36 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 412262087E;
        Fri,  2 Aug 2019 10:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564742795;
        bh=/Xo8pj+jLNFZr+k58OkpgJ6361PxmCXwjaJe76ZgvQ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bguPlqmbZheY1d41/TUOJypiEzni5SdqGWSfXCyvcy+41ffeFMZs7DlxzidPFbVDg
         lNEM1JV5n0kaBfZ8Zk5BlH+xkYzf5X28x7CKgTqlP93I0FsxJiuqB/EPEYyxOrWnFb
         eaYAOGHAUm+aLPpqIKkhug+DzWGzJ2ImmL2AUZyc=
Date:   Fri, 2 Aug 2019 12:46:33 +0200
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
Message-ID: <20190802104633.GA14823@kroah.com>
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

I have now done this with patch 1/10.  Here's the pull info if any
subsystem maintainer wants to suck this into their tree to provide the
ability for drivers to add/remove attribute groups easily.

This is part of my driver-core tree now, and will go to Linus for
5.4-rc1, along with a few platform drivers that have been acked by their
various subsystem maintainers that convert them to use this new
functionality.

If anyone has any questions about this, please let me know.

thanks,

greg k-h

-------------------

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git tags/dev_groups_all_drivers

for you to fetch changes up to 23b6904442d08b7dbed7622ed33b236d41a3aa8b:

  driver core: add dev_groups to all drivers (2019-08-02 12:37:53 +0200)

----------------------------------------------------------------
dev_groups added to struct driver

Persistent tag for others to pull this branch from

This is the first patch in a longer series that adds the ability for the
driver core to create and remove a list of attribute groups
automatically when the device is bound/unbound from a specific driver.

See:
	https://lore.kernel.org/r/20190731124349.4474-2-gregkh@linuxfoundation.org
for details on this patch, and examples of how to use it in other
drivers.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Dmitry Torokhov (1):
      driver core: add dev_groups to all drivers

 drivers/base/dd.c      | 14 ++++++++++++++
 include/linux/device.h |  3 +++
 2 files changed, 17 insertions(+)
