Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0BF14652CE
	for <lists+linux-input@lfdr.de>; Wed,  1 Dec 2021 17:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350962AbhLAQgs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Dec 2021 11:36:48 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:51304 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243309AbhLAQgr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Dec 2021 11:36:47 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1839AB8201D
        for <linux-input@vger.kernel.org>; Wed,  1 Dec 2021 16:33:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B987C53FAD;
        Wed,  1 Dec 2021 16:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638376404;
        bh=BgHZHv94lCE81fcWG31zfZhp+/rjw6qluWEqWGu+xfc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XVlRlJ3EEuaNSiMRDteLB3SBW7FQdtIQQYjsBb78r05sE7+D0wYBCxa2xnLtwnRr3
         DgNxEWs166tWwCAcZmgBcqp5GlJN8DFgH8MtGub5wVpp3J3ctXkPBQ2+kM4cTFiqbF
         c227mXTW4qysJnx2/Prig/PpYWVG0Ed5grbVeP4s=
Date:   Wed, 1 Dec 2021 17:33:21 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Stefan Achatz <erazor_de@users.sourceforge.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH 2/2] HID: check for valid USB device for many HID drivers
Message-ID: <Yaej0TLWNhbgOKfW@kroah.com>
References: <20211201141513.2107815-1-gregkh@linuxfoundation.org>
 <20211201141513.2107815-2-gregkh@linuxfoundation.org>
 <CAO-hwJJHrpUkbqCr2psqF62v0rR6E6zSUryee=S6SSwGfHCNhQ@mail.gmail.com>
 <YaeKH4E/cPfDkerc@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YaeKH4E/cPfDkerc@kroah.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 01, 2021 at 03:43:43PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Dec 01, 2021 at 03:31:24PM +0100, Benjamin Tissoires wrote:
> > On Wed, Dec 1, 2021 at 3:15 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > Many HID drivers assume that the HID device assigned to them is a USB
> > > device as that was the only way HID devices used to be able to be
> > > created in Linux.  However, with the additional ways that HID devices
> > > can be created for many different bus types, that is no longer true, so
> > > properly check that we have a USB device associated with the HID device
> > > before allowing a driver that makes this assumption to claim it.
> > >
> > > Cc: Jiri Kosina <jikos@kernel.org>
> > > Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > Cc: Michael Zaidman <michael.zaidman@gmail.com>
> > > Cc: Stefan Achatz <erazor_de@users.sourceforge.net>
> > > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > ---
> > >  drivers/hid/hid-chicony.c         |  3 +++
> > >  drivers/hid/hid-corsair.c         |  7 ++++++-
> > >  drivers/hid/hid-elan.c            |  2 +-
> > >  drivers/hid/hid-elo.c             |  3 +++
> > >  drivers/hid/hid-ft260.c           |  3 +++
> > >  drivers/hid/hid-holtek-kbd.c      |  3 +++
> > >  drivers/hid/hid-holtek-mouse.c    |  9 +++++++++
> > >  drivers/hid/hid-lg.c              | 10 ++++++++--
> > >  drivers/hid/hid-prodikeys.c       | 10 ++++++++--
> > >  drivers/hid/hid-roccat-arvo.c     |  3 +++
> > >  drivers/hid/hid-roccat-isku.c     |  3 +++
> > >  drivers/hid/hid-roccat-kone.c     |  3 +++
> > >  drivers/hid/hid-roccat-koneplus.c |  3 +++
> > >  drivers/hid/hid-roccat-konepure.c |  3 +++
> > >  drivers/hid/hid-roccat-kovaplus.c |  3 +++
> > >  drivers/hid/hid-roccat-lua.c      |  3 +++
> > >  drivers/hid/hid-roccat-pyra.c     |  3 +++
> > >  drivers/hid/hid-roccat-ryos.c     |  3 +++
> > >  drivers/hid/hid-roccat-savu.c     |  3 +++
> > >  drivers/hid/hid-samsung.c         |  3 +++
> > >  drivers/hid/hid-thrustmaster.c    |  3 +++
> > >  drivers/hid/hid-uclogic-core.c    |  3 +++
> > >  drivers/hid/wacom_sys.c           | 10 ++++++++--
> > >  23 files changed, 91 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-chicony.c b/drivers/hid/hid-chicony.c
> > > index ca556d39da2a..f04d2aa23efe 100644
> > > --- a/drivers/hid/hid-chicony.c
> > > +++ b/drivers/hid/hid-chicony.c
> > > @@ -114,6 +114,9 @@ static int ch_probe(struct hid_device *hdev, const struct hid_device_id *id)
> > >  {
> > >         int ret;
> > >
> > > +       if (!hid_is_usb(hdev))
> > > +               return -EINVAL;
> > 
> > A few lines above, we have: struct usb_interface *intf =
> > to_usb_interface(hdev->dev.parent);
> > 
> > I assume we also want to move that statement below.
> 
> fixup() runs before probe()?  If so, ick, I might have done a number of
> these patches incorrectly.  I thought it came after probe, am I
> mistaken?

In looking at the code, no, I think my change is correct.
report_fixup() gets called when hid_probe() is called, but this check
short-circuts that and prevents any non-USB device from being bound to
this driver.  Which, for now at least, is what we want.

If someone really really wants to emulate this, or some of the other
drivers in this patch, then they can work to make the checks more
fine-grained.  For some, like this one:

> > > --- a/drivers/hid/hid-ft260.c
> > > +++ b/drivers/hid/hid-ft260.c
> > > @@ -915,6 +915,9 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
> > >         struct ft260_get_chip_version_report version;
> > >         int ret;
> > >
> > > +       if (!hid_is_usb(hdev))
> > > +               return -EINVAL;
> > 
> > We also want to add here the initialization of `usbif` and `interface`
> > from a few lines above
> 
> Oops, missed that, will fix up.

We don't want to even attempt to bind a non-USB device to the driver as
there is no way to actually tell what type of device it is as the check
logic would be confused.

So I think it's best to just be safe here and not allow these drivers to
bind.

> > > +
> > >         dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
> > >         if (!dev)
> > >                 return -ENOMEM;
> > > diff --git a/drivers/hid/hid-holtek-kbd.c b/drivers/hid/hid-holtek-kbd.c
> > > index 0a38e8e9bc78..a438d8ac00e2 100644
> > > --- a/drivers/hid/hid-holtek-kbd.c
> > > +++ b/drivers/hid/hid-holtek-kbd.c
> > > @@ -143,6 +143,9 @@ static int holtek_kbd_probe(struct hid_device *hdev,
> > >         struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
> > >         int ret = hid_parse(hdev);
> > >
> > > +       if (!hid_is_usb(hdev))
> > > +               return -EINVAL;
> > 
> > Same here, intf should likely be initialized here.
> 
> Will fix up.
> 
> I'll also move the call to hid_parse() after this check.
> 
> > > +
> > >         if (!ret)
> > >                 ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> > >
> > > diff --git a/drivers/hid/hid-holtek-mouse.c b/drivers/hid/hid-holtek-mouse.c
> > > index 195b735b001d..b7172c48ef9f 100644
> > > --- a/drivers/hid/hid-holtek-mouse.c
> > > +++ b/drivers/hid/hid-holtek-mouse.c
> > > @@ -62,6 +62,14 @@ static __u8 *holtek_mouse_report_fixup(struct hid_device *hdev, __u8 *rdesc,
> > >         return rdesc;
> > >  }
> > >
> > > +static int holtek_mouse_probe(struct hid_device *hdev,
> > > +                             const struct hid_device_id *id)
> > 
> > Do we really need to add a probe here? AFAICT, the only usb calls are
> > in the report fixup, so the rest is usb safe.
> 
> Can you "fail" a fixup call to prevent the device from being bound to
> the driver?

To follow up on this, yes, we need the probe to fail here as the driver
"has" to be able to look at the USB device information in order to
determine what type it is so that it can "fix up" the broken report it
contains.  Which is the whole reason for this driver in the first place,
so it has to only be allowed for USB devices.

thanks,

greg k-h
