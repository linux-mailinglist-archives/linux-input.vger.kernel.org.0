Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A754650E7
	for <lists+linux-input@lfdr.de>; Wed,  1 Dec 2021 16:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350536AbhLAPJi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Dec 2021 10:09:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59360 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350638AbhLAPJa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 1 Dec 2021 10:09:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638371169;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WA/Q77n5y8S/v1r7B+5R3A9uZUIyhdWumort7uSaepY=;
        b=Bt1K0PXcUzA/HBEaaQd23dBCzb37cJPP6KQvg001FUlkuGdsll6tHmrrBk734a/1Fz9oZX
        0qKqPaIg3uvSwwXW5tpsaCupwiWJ862uMz8P4smoWWqDAgEpYbytOxDmmfJejg/wwHjJ7f
        rE5FmfwY7luf7Op87DfsWFTgpJWHEig=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-334-_CI47pYZM1GroLFRQZTz-g-1; Wed, 01 Dec 2021 10:06:08 -0500
X-MC-Unique: _CI47pYZM1GroLFRQZTz-g-1
Received: by mail-pg1-f198.google.com with SMTP id k11-20020a63d84b000000b003252e72da7eso8639883pgj.23
        for <linux-input@vger.kernel.org>; Wed, 01 Dec 2021 07:06:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WA/Q77n5y8S/v1r7B+5R3A9uZUIyhdWumort7uSaepY=;
        b=7GY/Fw1T2c5DlGUuiHBscFVYkTobMgRi7Q9eeShUujstXvTkPqAsLgUEU2V4jgHCVO
         nP3A69a3WHPZZXz7CfArqtQ+BPNJ6ay2FfC8pP95tgyWAm0oayBdI26LQnde+9I+3y2Y
         Y1r9lqsgnV5C6o3dOdM2mIAPAWYpLh6lBM7/36KsGXfWTRcB/fakMDukrLXZ7zLX4oYp
         Zx4HYT87S/6saRg5iFq3phd3yB1kv6rT8CI1mUgqZGkFqD60aihgfrPu/N1/VaMQqyrI
         S9jZWRvl2WeAXZ7dplI8us+erAPb5S8xrvzaqJPP9xOcWgw66tO+j/ZxADR/yYRPxO/e
         ILaA==
X-Gm-Message-State: AOAM5315oqeDjsUJ3kKtpgbrBdTfV0wR7hfp/G1kmXyU20qH2XvjLNLl
        HBSDqqyL9V25M4cQJtJkUCDHRg68HwBk8K9xtQKj7zx3wbnqhBEKXZvHEuELpPC6jmYkCfSyBFt
        wNzZ1DgflPd/Ksg+JUDrbwYfWxZFKRSr3D9DnGlE=
X-Received: by 2002:a62:e309:0:b0:4a2:e288:6203 with SMTP id g9-20020a62e309000000b004a2e2886203mr6850214pfh.13.1638371166768;
        Wed, 01 Dec 2021 07:06:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrW/5TnA36+MpPNGq08v5naTHSLFYzYuXRVIyNzAhfbqiIp88Bl5U87uUTj1AW7x6rkWalPSRGAH5jw6Ux7Zc=
X-Received: by 2002:a62:e309:0:b0:4a2:e288:6203 with SMTP id
 g9-20020a62e309000000b004a2e2886203mr6850180pfh.13.1638371166517; Wed, 01 Dec
 2021 07:06:06 -0800 (PST)
MIME-Version: 1.0
References: <20211201141513.2107815-1-gregkh@linuxfoundation.org>
 <20211201141513.2107815-2-gregkh@linuxfoundation.org> <CAO-hwJJHrpUkbqCr2psqF62v0rR6E6zSUryee=S6SSwGfHCNhQ@mail.gmail.com>
 <YaeKH4E/cPfDkerc@kroah.com>
In-Reply-To: <YaeKH4E/cPfDkerc@kroah.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 1 Dec 2021 16:05:54 +0100
Message-ID: <CAO-hwJ+HQxdVWA_Q3O+i7-Ur3RfeZ6VDZPJepb2Bx87Yhj1Ymw@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: check for valid USB device for many HID drivers
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Stefan Achatz <erazor_de@users.sourceforge.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 1, 2021 at 3:43 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
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
>
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
>
> >
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

Not really, but if you return the original report descriptor it
wouldn't be worse than plugging the USB device without any driver. HID
might complain in that particular case but the kernel will not crash.

>
> > > --- a/drivers/hid/wacom_sys.c
> > > +++ b/drivers/hid/wacom_sys.c
> > > @@ -2730,16 +2730,22 @@ static void wacom_mode_change_work(struct work_struct *work)
> > >  static int wacom_probe(struct hid_device *hdev,
> > >                 const struct hid_device_id *id)
> > >  {
> > > -       struct usb_interface *intf = to_usb_interface(hdev->dev.parent);
> > > -       struct usb_device *dev = interface_to_usbdev(intf);
> > > +       struct usb_interface *intf;
> > > +       struct usb_device *dev;
> > >         struct wacom *wacom;
> > >         struct wacom_wac *wacom_wac;
> > >         struct wacom_features *features;
> > >         int error;
> > >
> > > +       if (!hid_is_usb(hdev))
> > > +               return -EINVAL;
> >
> > Nope. I am pretty sure this is wrong as Wacom also handles Bluetooth
> > and I2C devices, and it can also be emulated relatively safely.
>
> If it did handle those types of devices, the above lines would have
> have caused a mess.  But you are right, this is trickier, I will split
> this out into a separate patch.

I assume nobody ever noticed it because the 2 definitions can be
statically computed based on the hid device address... But I agree,
this is clearly wrong.

>
> I can split all of these out into individual ones if you want me to.

I initially wanted to have them splitted into individual ones, but
OTOH, the bulk of it is really a no-brainer so we can leave them in
one big patch.
However, the wacom chunk might need to be reviewed with an extra pair
of eyes, so probably having it split out from the patch would be nice.

>
> > FWIW, I am also working on a test that generates all registered USB
> > vid/pids from the currently running kernel and will try to inject them
> > in the testsuite. This should validate this patch and prevent future
> > mishaps.
>
> That would be great to see.  Let me know if you want these broken up
> smaller, and I will go fix the above issues.

https://gitlab.freedesktop.org/bentiss/hid-tools/-/commit/2b04c6cf46c7405c8a916f324988660cb54dadea

This seems sufficient to make an unpatched kernel scream :)

Cheers,
Benjamin

>
> thanks,
>
> greg k-h
>

