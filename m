Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F297467AA5
	for <lists+linux-input@lfdr.de>; Fri,  3 Dec 2021 16:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381899AbhLCP5Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Dec 2021 10:57:25 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:43014 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239659AbhLCP5Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Dec 2021 10:57:25 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CA192B82896
        for <linux-input@vger.kernel.org>; Fri,  3 Dec 2021 15:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC12AC53FCD;
        Fri,  3 Dec 2021 15:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638546838;
        bh=T0dk+t9PD5DmjFYgDNbcATNQJ7FmQNJMT/S1BcGQMnk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KUfDMVjcW7iI8zxvJCNYCk2wGlUzXrYg4MGQCBnTkzuydvXCPLdbq/7FVXEp/9ruh
         Z9uiZZotMI+SfSKR+mM5yRnCgGeFT9wRLVREIW/iUnwDwbujQbwNo3GnDVPIhVoDRI
         jg11g3tAHHxYsL+n2rUDsshKno/YyRCr/C6+Ybsw=
Date:   Fri, 3 Dec 2021 16:53:55 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ping Cheng <pinglinux@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Stefan Achatz <erazor_de@users.sourceforge.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jason Gerecke <killertofu@gmail.com>
Subject: Re: [PATCH 2/2] HID: check for valid USB device for many HID drivers
Message-ID: <Yao9k0eP7WeVR/Ed@kroah.com>
References: <20211201141513.2107815-1-gregkh@linuxfoundation.org>
 <20211201141513.2107815-2-gregkh@linuxfoundation.org>
 <CAO-hwJJHrpUkbqCr2psqF62v0rR6E6zSUryee=S6SSwGfHCNhQ@mail.gmail.com>
 <YaeKH4E/cPfDkerc@kroah.com>
 <CAF8JNhJLB_MiHBcnYDQn6Y4w7OOZvf3O3m30bstMUspW8wn4ag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF8JNhJLB_MiHBcnYDQn6Y4w7OOZvf3O3m30bstMUspW8wn4ag@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Dec 03, 2021 at 07:42:12AM -0800, Ping Cheng wrote:
> On Thu, Dec 2, 2021, 7:03 PM Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> wrote:
> 
> > On Wed, Dec 01, 2021 at 03:31:24PM +0100, Benjamin Tissoires wrote:
> > > On Wed, Dec 1, 2021 at 3:15 PM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > Many HID drivers assume that the HID device assigned to them is a USB
> > > > device as that was the only way HID devices used to be able to be
> > > > created in Linux.  However, with the additional ways that HID devices
> > > > can be created for many different bus types, that is no longer true, so
> > > > properly check that we have a USB device associated with the HID device
> > > > before allowing a driver that makes this assumption to claim it.
> > > >
> > > > Cc: Jiri Kosina <jikos@kernel.org>
> > > > Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > > Cc: Michael Zaidman <michael.zaidman@gmail.com>
> > > > Cc: Stefan Achatz <erazor_de@users.sourceforge.net>
> > > > Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> > > > Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > ---
> > > >  drivers/hid/hid-chicony.c         |  3 +++
> > > >  drivers/hid/hid-corsair.c         |  7 ++++++-
> > > >  drivers/hid/hid-elan.c            |  2 +-
> > > >  drivers/hid/hid-elo.c             |  3 +++
> > > >  drivers/hid/hid-ft260.c           |  3 +++
> > > >  drivers/hid/hid-holtek-kbd.c      |  3 +++
> > > >  drivers/hid/hid-holtek-mouse.c    |  9 +++++++++
> > > >  drivers/hid/hid-lg.c              | 10 ++++++++--
> > > >  drivers/hid/hid-prodikeys.c       | 10 ++++++++--
> > > >  drivers/hid/hid-roccat-arvo.c     |  3 +++
> > > >  drivers/hid/hid-roccat-isku.c     |  3 +++
> > > >  drivers/hid/hid-roccat-kone.c     |  3 +++
> > > >  drivers/hid/hid-roccat-koneplus.c |  3 +++
> > > >  drivers/hid/hid-roccat-konepure.c |  3 +++
> > > >  drivers/hid/hid-roccat-kovaplus.c |  3 +++
> > > >  drivers/hid/hid-roccat-lua.c      |  3 +++
> > > >  drivers/hid/hid-roccat-pyra.c     |  3 +++
> > > >  drivers/hid/hid-roccat-ryos.c     |  3 +++
> > > >  drivers/hid/hid-roccat-savu.c     |  3 +++
> > > >  drivers/hid/hid-samsung.c         |  3 +++
> > > >  drivers/hid/hid-thrustmaster.c    |  3 +++
> > > >  drivers/hid/hid-uclogic-core.c    |  3 +++
> > > >  drivers/hid/wacom_sys.c           | 10 ++++++++--
> > > >  23 files changed, 91 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/hid/hid-chicony.c b/drivers/hid/hid-chicony.c
> > > > index ca556d39da2a..f04d2aa23efe 100644
> > > > --- a/drivers/hid/hid-chicony.c
> > > > +++ b/drivers/hid/hid-chicony.c
> > > > @@ -114,6 +114,9 @@ static int ch_probe(struct hid_device *hdev, const
> > struct hid_device_id *id)
> > > >  {
> > > >         int ret;
> > > >
> > > > +       if (!hid_is_usb(hdev))
> > > > +               return -EINVAL;
> > >
> > > A few lines above, we have: struct usb_interface *intf =
> > > to_usb_interface(hdev->dev.parent);
> > >
> > > I assume we also want to move that statement below.
> >
> > fixup() runs before probe()?  If so, ick, I might have done a number of
> > these patches incorrectly.  I thought it came after probe, am I
> > mistaken?
> >
> > > > --- a/drivers/hid/hid-ft260.c
> > > > +++ b/drivers/hid/hid-ft260.c
> > > > @@ -915,6 +915,9 @@ static int ft260_probe(struct hid_device *hdev,
> > const struct hid_device_id *id)
> > > >         struct ft260_get_chip_version_report version;
> > > >         int ret;
> > > >
> > > > +       if (!hid_is_usb(hdev))
> > > > +               return -EINVAL;
> > >
> > > We also want to add here the initialization of `usbif` and `interface`
> > > from a few lines above
> >
> > Oops, missed that, will fix up.
> >
> > >
> > > > +
> > > >         dev = devm_kzalloc(&hdev->dev, sizeof(*dev), GFP_KERNEL);
> > > >         if (!dev)
> > > >                 return -ENOMEM;
> > > > diff --git a/drivers/hid/hid-holtek-kbd.c
> > b/drivers/hid/hid-holtek-kbd.c
> > > > index 0a38e8e9bc78..a438d8ac00e2 100644
> > > > --- a/drivers/hid/hid-holtek-kbd.c
> > > > +++ b/drivers/hid/hid-holtek-kbd.c
> > > > @@ -143,6 +143,9 @@ static int holtek_kbd_probe(struct hid_device
> > *hdev,
> > > >         struct usb_interface *intf =
> > to_usb_interface(hdev->dev.parent);
> > > >         int ret = hid_parse(hdev);
> > > >
> > > > +       if (!hid_is_usb(hdev))
> > > > +               return -EINVAL;
> > >
> > > Same here, intf should likely be initialized here.
> >
> > Will fix up.
> >
> > I'll also move the call to hid_parse() after this check.
> >
> > > > +
> > > >         if (!ret)
> > > >                 ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> > > >
> > > > diff --git a/drivers/hid/hid-holtek-mouse.c
> > b/drivers/hid/hid-holtek-mouse.c
> > > > index 195b735b001d..b7172c48ef9f 100644
> > > > --- a/drivers/hid/hid-holtek-mouse.c
> > > > +++ b/drivers/hid/hid-holtek-mouse.c
> > > > @@ -62,6 +62,14 @@ static __u8 *holtek_mouse_report_fixup(struct
> > hid_device *hdev, __u8 *rdesc,
> > > >         return rdesc;
> > > >  }
> > > >
> > > > +static int holtek_mouse_probe(struct hid_device *hdev,
> > > > +                             const struct hid_device_id *id)
> > >
> > > Do we really need to add a probe here? AFAICT, the only usb calls are
> > > in the report fixup, so the rest is usb safe.
> >
> > Can you "fail" a fixup call to prevent the device from being bound to
> > the driver?
> >
> > > > --- a/drivers/hid/wacom_sys.c
> > > > +++ b/drivers/hid/wacom_sys.c
> > > > @@ -2730,16 +2730,22 @@ static void wacom_mode_change_work(struct
> > work_struct *work)
> > > >  static int wacom_probe(struct hid_device *hdev,
> > > >                 const struct hid_device_id *id)
> > > >  {
> > > > -       struct usb_interface *intf =
> > to_usb_interface(hdev->dev.parent);
> > > > -       struct usb_device *dev = interface_to_usbdev(intf);
> > > > +       struct usb_interface *intf;
> > > > +       struct usb_device *dev;
> > > >         struct wacom *wacom;
> > > >         struct wacom_wac *wacom_wac;
> > > >         struct wacom_features *features;
> > > >         int error;
> > > >
> > > > +       if (!hid_is_usb(hdev))
> > > > +               return -EINVAL;
> > >
> > > Nope. I am pretty sure this is wrong as Wacom also handles Bluetooth
> > > and I2C devices, and it can also be emulated relatively safely.
> >
> 
> This is to confirm that wacom.ko supports both BT and I2C devices too. BT
> works fine so far (I didn't test recent kernel releases with a BT device
> though). I found I2C device was not recognized by newer kernels, say 5.14
> or later. The device works fine on 5.11 kernel. Since I'm using a
> prototype, I wasn't sure if it's a device or a driver issue. But, the
> driver should support all three types of devices.

Thanks for the confirmation, my later patch fixed that assumption.

greg k-h
