Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 557A71D289D
	for <lists+linux-input@lfdr.de>; Thu, 14 May 2020 09:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725931AbgENHQf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 May 2020 03:16:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:45362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725909AbgENHQe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 May 2020 03:16:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 80546206B6;
        Thu, 14 May 2020 07:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589440594;
        bh=x6XY+w06HhJq6OnCryR2C8r+d8634pKZTzl7OEtJ84I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fsVHPsSugeuQaqh74KM3vTh5YlMixAmucxuZV15thPoJJMrucj9GTrX+4SfuldnhB
         9l1LHA1eD+XBDjopMaSSsjMf2YIDC55sDJofhKonyQwyNCXX2L9+6xLEwnVOYrkmJu
         HPyLWUmcgMwI4jj/qfiwZg1D0JFjzHw6/eb6nNR8=
Date:   Thu, 14 May 2020 09:16:31 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Emil Velikov <emil.l.velikov@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>, x86@kernel.org,
        linux-input@vger.kernel.org,
        linux-fbdev <linux-fbdev@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
        ML dri-devel <dri-devel@lists.freedesktop.org>,
        platform-driver-x86@vger.kernel.org,
        Tony Prisk <linux@prisktech.co.nz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Darren Hart <dvhart@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Richard Gong <richard.gong@linux.intel.com>,
        Ingo Molnar <mingo@redhat.com>,
        LAKML <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 00/10] drivers, provide a way to add sysfs groups
 easily
Message-ID: <20200514071631.GA1566388@kroah.com>
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
 <20190731131045.GB147138@dtor-ws>
 <20190802104633.GA14823@kroah.com>
 <CACvgo52+Uqx4GJFwadJoFzzt5EMc69HcW-+K9uxv9t25TtSDBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACvgo52+Uqx4GJFwadJoFzzt5EMc69HcW-+K9uxv9t25TtSDBg@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 13, 2020 at 11:18:15PM +0100, Emil Velikov wrote:
> Hi Greg,
> 
> On Fri, 2 Aug 2019 at 11:46, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> 
> >
> > I have now done this with patch 1/10.  Here's the pull info if any
> > subsystem maintainer wants to suck this into their tree to provide the
> > ability for drivers to add/remove attribute groups easily.
> >
> > This is part of my driver-core tree now, and will go to Linus for
> > 5.4-rc1, along with a few platform drivers that have been acked by their
> > various subsystem maintainers that convert them to use this new
> > functionality.
> >
> > If anyone has any questions about this, please let me know.
> >
> > thanks,
> >
> > greg k-h
> >
> > -------------------
> >
> > The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
> >
> >   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git tags/dev_groups_all_drivers
> >
> > for you to fetch changes up to 23b6904442d08b7dbed7622ed33b236d41a3aa8b:
> >
> >   driver core: add dev_groups to all drivers (2019-08-02 12:37:53 +0200)
> >
> > ----------------------------------------------------------------
> > dev_groups added to struct driver
> >
> > Persistent tag for others to pull this branch from
> >
> > This is the first patch in a longer series that adds the ability for the
> > driver core to create and remove a list of attribute groups
> > automatically when the device is bound/unbound from a specific driver.
> >
> > See:
> >         https://lore.kernel.org/r/20190731124349.4474-2-gregkh@linuxfoundation.org
> > for details on this patch, and examples of how to use it in other
> > drivers.
> >
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> > ----------------------------------------------------------------
> > Dmitry Torokhov (1):
> >       driver core: add dev_groups to all drivers
> >
> >  drivers/base/dd.c      | 14 ++++++++++++++
> >  include/linux/device.h |  3 +++
> >  2 files changed, 17 insertions(+)
> > _______________________________________________
> 
> Was planning to re-spin DRM a series which uses .dev_groups, although
> I cannot see the core patch.
> Did the it get reverted or simply fell though the cracks?

Nope, it's in there:
	23b6904442d0 ("driver core: add dev_groups to all drivers")
which showed up in the 5.4 kernel release.

Lots of other subsystems have already been converted to use this, do you
not see it in your tree?

thanks,

greg k-h
