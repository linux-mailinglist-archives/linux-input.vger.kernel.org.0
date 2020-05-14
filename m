Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5271D2ECB
	for <lists+linux-input@lfdr.de>; Thu, 14 May 2020 13:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgENLvS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 May 2020 07:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbgENLvS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 May 2020 07:51:18 -0400
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com [IPv6:2607:f8b0:4864:20::944])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B8C9C061A0C;
        Thu, 14 May 2020 04:51:16 -0700 (PDT)
Received: by mail-ua1-x944.google.com with SMTP id b6so1010335uak.6;
        Thu, 14 May 2020 04:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fz/sODwE4TRlAOUOF7rSWmB5p5vCnF20YLXRpjtRNR8=;
        b=fAoerFnOqYJzGocVX8Id2ilnoOiWw9tjf6UV3fKEYbOvg/kHrbnP/C65NbI59Xi0v4
         UxhU3GHuwaHdeJztSATlKlF9pKzjvjuw4mhzkkdTOCQR8BLxUPcGGM7p5toepgNmjsKH
         XTW8A+gOuYLB3pBMRrN/Jz9lQ0NTXe0SbQZ7d8+Lh5sUo5nCpQzJ7Ixk2nfuYLaPuLc8
         u7E9ivRsvS87+z0XhwvuRAxP4jN3mUuEi/gn9h/l64H4GWHihtLGm3qNS+Jul7EZOBIo
         eBnwqDOe16oXRAG26LmjNVwlLFzWWnWEAlhg9btfai30pziMNZAycFz/gKGHiIz8qdNI
         Hd5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fz/sODwE4TRlAOUOF7rSWmB5p5vCnF20YLXRpjtRNR8=;
        b=BygGTQxtemxo1Wh451nDiyPAutXZyNESwp/1tWGL2/BPguM2RuA5IxuR9kDIAr4is4
         qGp3t1ZONdjHbtfLWXetcG2KX73gBzP88bqBBn3h9iN8rAx9fegubZuqmU3zNUrScBxp
         cAykiLcupWtX6vaRi9+sRfsWWbeRv29PDVuYGIwL0EK7d0GOpbb2XCR+APOfMO1d3Uld
         QA6lOK8K7vRsEuWn6GT3RNUnumvulm8M0msxVca6qmW1NjNBy6lWkx9NfvSj9b4vYWXI
         GOnLTzuf6gvV1DnqbhSj2RgXPeSACigiEMAbFqvIHdcYM7P2/eIsAtPfzWJaue2GuTo5
         nV3Q==
X-Gm-Message-State: AOAM533RQ8hGYKZiZwtC2yyN7ZWS6a8CWiEd6vBE/D5QmdqK7ju4kGOg
        mzftmuV/4baXagBkQRokSoZsL7/lzC/R83hBz4k=
X-Google-Smtp-Source: ABdhPJxSk3G3P52SjjYVN5dey+t6hO6IzipIL9onpZ2v3nEYxcmFje21OU68uGtXk/NMjDQSpwIAtCNk2p/z79SJzCM=
X-Received: by 2002:ab0:1ea:: with SMTP id 97mr3527388ual.106.1589457075715;
 Thu, 14 May 2020 04:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
 <20190731131045.GB147138@dtor-ws> <20190802104633.GA14823@kroah.com>
 <CACvgo52+Uqx4GJFwadJoFzzt5EMc69HcW-+K9uxv9t25TtSDBg@mail.gmail.com> <20200514071631.GA1566388@kroah.com>
In-Reply-To: <20200514071631.GA1566388@kroah.com>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Thu, 14 May 2020 12:48:32 +0100
Message-ID: <CACvgo52Mqag6wzWqJPMqbtbSsqDgPyyG33huAd+cQgFKQhfQUw@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] drivers, provide a way to add sysfs groups easily
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 14 May 2020 at 08:16, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, May 13, 2020 at 11:18:15PM +0100, Emil Velikov wrote:
> > Hi Greg,
> >
> > On Fri, 2 Aug 2019 at 11:46, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> >
> > >
> > > I have now done this with patch 1/10.  Here's the pull info if any
> > > subsystem maintainer wants to suck this into their tree to provide the
> > > ability for drivers to add/remove attribute groups easily.
> > >
> > > This is part of my driver-core tree now, and will go to Linus for
> > > 5.4-rc1, along with a few platform drivers that have been acked by their
> > > various subsystem maintainers that convert them to use this new
> > > functionality.
> > >
> > > If anyone has any questions about this, please let me know.
> > >
> > > thanks,
> > >
> > > greg k-h
> > >
> > > -------------------
> > >
> > > The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
> > >
> > >   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git tags/dev_groups_all_drivers
> > >
> > > for you to fetch changes up to 23b6904442d08b7dbed7622ed33b236d41a3aa8b:
> > >
> > >   driver core: add dev_groups to all drivers (2019-08-02 12:37:53 +0200)
> > >
> > > ----------------------------------------------------------------
> > > dev_groups added to struct driver
> > >
> > > Persistent tag for others to pull this branch from
> > >
> > > This is the first patch in a longer series that adds the ability for the
> > > driver core to create and remove a list of attribute groups
> > > automatically when the device is bound/unbound from a specific driver.
> > >
> > > See:
> > >         https://lore.kernel.org/r/20190731124349.4474-2-gregkh@linuxfoundation.org
> > > for details on this patch, and examples of how to use it in other
> > > drivers.
> > >
> > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >
> > > ----------------------------------------------------------------
> > > Dmitry Torokhov (1):
> > >       driver core: add dev_groups to all drivers
> > >
> > >  drivers/base/dd.c      | 14 ++++++++++++++
> > >  include/linux/device.h |  3 +++
> > >  2 files changed, 17 insertions(+)
> > > _______________________________________________
> >
> > Was planning to re-spin DRM a series which uses .dev_groups, although
> > I cannot see the core patch.
> > Did the it get reverted or simply fell though the cracks?
>
> Nope, it's in there:
>         23b6904442d0 ("driver core: add dev_groups to all drivers")
> which showed up in the 5.4 kernel release.
>
> Lots of other subsystems have already been converted to use this, do you
> not see it in your tree?
>
A case of PEBKAC it seems - I was looking at a 5.3 checkout somehow.

Thanks for the core work. Will check/merge the fbdev patches over the
next few days and polish drm land.

-Emil
