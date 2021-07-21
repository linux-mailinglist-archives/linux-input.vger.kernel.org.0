Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80FAE3D1696
	for <lists+linux-input@lfdr.de>; Wed, 21 Jul 2021 20:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbhGUSEE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jul 2021 14:04:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29924 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231535AbhGUSEE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jul 2021 14:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626893080;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=W4ud5+HxDo+KKRKgWYCa4gbq7g0wS1XZDIZwwHzvBzM=;
        b=SqFjaJvKe3AJiJs5pul5pAZkUXIeVrb5LsY8K3N3DKV5Tw+4guh368s5EDINwpqYfDjgn0
        nvg0O2mqQRn+7beicewnm5e9NH94PhrJCgX2dWCYQAnlqjJEV/ARnw1GgDlXl//fblxGw0
        j5MKTvf6fwER9ll0JYse+cOQ2ubAEYk=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-aw2grCEwPUmTYW-sbywTDg-1; Wed, 21 Jul 2021 14:44:38 -0400
X-MC-Unique: aw2grCEwPUmTYW-sbywTDg-1
Received: by mail-pj1-f72.google.com with SMTP id ju10-20020a17090b20cab029017395ea5199so1758265pjb.6
        for <linux-input@vger.kernel.org>; Wed, 21 Jul 2021 11:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W4ud5+HxDo+KKRKgWYCa4gbq7g0wS1XZDIZwwHzvBzM=;
        b=Sci6F1wC1vCi2uD8y6TJfJzlL015nzRYKePmyLw5wfSd9KwM0RiaZGpUYmRsRJ2efk
         QdAagr4LVVruXHbkzveKR8YJio3pUhSNDDWJjnAxIlmmKPQu27tinD0sLorVtcTmuY3Z
         TP0o5AqJysUGdT/HNzf67KR2wYkEM/T6rLvLA9ugVXy2LpbJLToiz+zuP+w2vjLSKdIP
         nhq8uca0i5O8J9UHWv4jM1Wtdu1J2fAj3QTF+1j0Ltq2pMLhUeVqbdguhaJuBh+JfeDW
         2GNkKo/6/QglB9R2QuC42QlHDEJU4Weubs7SGp3322/kg599GtMyBaq14IugiY2JrDa0
         ALQQ==
X-Gm-Message-State: AOAM530ghofHZv5vlRn0YPDeHkkEyNLfY/rlgM07ks6lPqErlRcHAcGp
        l1Y5YlAXTWSgXx6P5W/MGHZS7KhITel7FcMTPrGIPJnq4Ze4cFrUJ0CBSHB31AnkqlBlKJQMNWc
        WQ/tXJVQn40O1yUpzLh/QIW70lpY1qPE5ibgafdc=
X-Received: by 2002:a17:90b:b10:: with SMTP id bf16mr23348004pjb.129.1626893077495;
        Wed, 21 Jul 2021 11:44:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxU/4b2iu71nbL5Q2nrzVDoGaR49LZfywBG+WsGEyit00vEqois2ajXdLBBxbd/oGZPi8Mgzvk2MhL2ma++VKM=
X-Received: by 2002:a17:90b:b10:: with SMTP id bf16mr23347979pjb.129.1626893077164;
 Wed, 21 Jul 2021 11:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210715195720.169385-1-daniel.nguyen.1@ens.etsmtl.ca>
 <951c38d5-934e-eca7-a025-9cf074771764@redhat.com> <CAJNNDmn5V94mb0G9ZfxWDadxe17tEDKqWtfJErSjQxiRFd0ycA@mail.gmail.com>
 <CAO-hwJLog04U6WHZq3qEKf_bbW5wU3bL+m7zbY6h=x2neK58AQ@mail.gmail.com> <CAEJV-FFyt_34ts2RF-dkc5Xdez_ZWzCKu9iRzHHom610XbHVDA@mail.gmail.com>
In-Reply-To: <CAEJV-FFyt_34ts2RF-dkc5Xdez_ZWzCKu9iRzHHom610XbHVDA@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 21 Jul 2021 20:44:25 +0200
Message-ID: <CAO-hwJKCFO2c2VR36zfmU34OfxbxRAfpkhdFTSD+V3WB7fv1Xw@mail.gmail.com>
Subject: Re: [PATCH] HID: sony: support for the ghlive ps4 dongles
To:     Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
Cc:     Pascal Giard <pascal.giard@etsmtl.ca>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 21, 2021 at 8:15 PM Daniel Nguyen
<daniel.nguyen.1@ens.etsmtl.ca> wrote:
>
> Hello Benjamin,
>
> On Wed, Jul 21, 2021 at 6:16 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > On Tue, Jul 20, 2021 at 4:33 PM Pascal Giard <pascal.giard@etsmtl.ca> wrote:
> > >
> > > Hi Benjamin,
> > >
> > > On Tue, Jul 20, 2021 at 7:39 AM Benjamin Tissoires
> > > <benjamin.tissoires@redhat.com> wrote:
> > > >
> > > > Hi Daniel (and Pascal),
> > > >
> > > > [adding Roderick in Cc who is dealing with the Sony driver from Sony
> > > > itself :) ]
> > > >
> > > >
> > > > On Thu, Jul 15, 2021 at 9:58 PM Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca> wrote:
> > > > >
> > > > > This commit adds support for the Guitar Hero Live PS4 dongles.
> > > >
> > > > I was about to ask you to add some regression tests to
> > > > https://gitlab.freedesktop.org/libevdev/hid-tools/-/blob/master/tests/test_sony.py
> > > >
> > > > This would likely have avoided the previous patch that was required and
> > > > cc-ed to stable.
> > > >
> > > > But after looking slightly at the patch, I realized that the Guitar Hero
> > > > code uses direct USB calls, which is not something we can emulate at the
> > > > hid-tools level.
> > > >
> > > > However, after a second look at the code, I think that this part of the
> > > > code just reimplements its own HID SET_OUTPUT code, and that is
> > > > something we can easily emulate.
> > > >
> > > > Could you check if the following patch is still working properly on a
> > > > PS3 dongle? and if so, add your PS4 support on top?
> > > >
> > > [...]
> > >
> > > I wasn't aware that this was possible. Of course we will check whether
> > > that works or not.
> > >
> > > > ---
> > > > commit 10e14f105553d2bd88bc7748e87154c5a8131e9e
> > > > Author: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > > Date:   Tue Jul 20 11:44:10 2021 +0200
> > > >
> > > >      HID: sony: GHL: do not use raw USB calls
> > > >
> > > >      We can rely on HID to do the job for us.
> > > >      This simplifies the code and also allows to implement regression tests.
> > > >
> > > >      Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > >
> > > > diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> > > > index b3722c51ec78..901f61d286e8 100644
> > > > --- a/drivers/hid/hid-sony.c
> > > > +++ b/drivers/hid/hid-sony.c
> > > > @@ -37,7 +37,6 @@
> > > >   #include <linux/idr.h>
> > > >   #include <linux/input/mt.h>
> > > >   #include <linux/crc32.h>
> > > > -#include <linux/usb.h>
> > > >   #include <linux/timer.h>
> > > >   #include <asm/unaligned.h>
> > > >
> > > > @@ -92,7 +91,7 @@
> > > >    * https://github.com/ghlre/GHLtarUtility/blob/master/PS3Guitar.cs
> > > >    * Note: The Wii U and PS3 dongles happen to share the same!
> > > >    */
> > > > -static const u16 ghl_ps3wiiu_magic_value = 0x201;
> > > > +static const u16 ghl_ps3wiiu_magic_report = 1;
> > > >   static const char ghl_ps3wiiu_magic_data[] = {
> > > >         0x02, 0x08, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00
> > > >   };
> > > > @@ -597,7 +596,6 @@ struct sony_sc {
> > > >         /* DS4 calibration data */
> > > >         struct ds4_calibration_data ds4_calib_data[6];
> > > >         /* GH Live */
> > > > -       struct urb *ghl_urb;
> > > >         struct timer_list ghl_poke_timer;
> > > >   };
> > > >
> > > > @@ -622,56 +620,29 @@ static inline void sony_schedule_work(struct sony_sc *sc,
> > > >         }
> > > >   }
> > > >
> > > > -static void ghl_magic_poke_cb(struct urb *urb)
> > > > -{
> > > > -       struct sony_sc *sc = urb->context;
> > > > -
> > > > -       if (urb->status < 0)
> > > > -               hid_err(sc->hdev, "URB transfer failed : %d", urb->status);
> > > > -
> > > > -       mod_timer(&sc->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
> > > > -}
> > > > -
> > > >   static void ghl_magic_poke(struct timer_list *t)
> > > >   {
> > > >         int ret;
> > > >         struct sony_sc *sc = from_timer(sc, t, ghl_poke_timer);
> > > > +       const int buf_size = ARRAY_SIZE(ghl_ps3wiiu_magic_data);
> > > > +       u8 *buf;
> > > >
> > > > -       ret = usb_submit_urb(sc->ghl_urb, GFP_ATOMIC);
> > > > -       if (ret < 0)
> > > > -               hid_err(sc->hdev, "usb_submit_urb failed: %d", ret);
> > > > -}
> > > > -
> > > > -static int ghl_init_urb(struct sony_sc *sc, struct usb_device *usbdev)
> > > > -{
> > > > -       struct usb_ctrlrequest *cr;
> > > > -       u16 poke_size;
> > > > -       u8 *databuf;
> > > > -       unsigned int pipe;
> > > > -
> > > > -       poke_size = ARRAY_SIZE(ghl_ps3wiiu_magic_data);
> > > > -       pipe = usb_sndctrlpipe(usbdev, 0);
> > > > +       buf = kmemdup(ghl_ps3wiiu_magic_data, buf_size, GFP_KERNEL);
> > > > +       if (!buf)
> > > > +               return;
> > > >
> > > > -       cr = devm_kzalloc(&sc->hdev->dev, sizeof(*cr), GFP_ATOMIC);
> > > > -       if (cr == NULL)
> > > > -               return -ENOMEM;
> > > > +       ret = hid_hw_raw_request(sc->hdev, ghl_ps3wiiu_magic_report, buf,
> > > > +                                buf_size,
> > > > +                                HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
> > > > +       if (ret < 0) {
> > > > +               hid_err(sc->hdev, "can't poke ghl magic\n");
> > > > +               goto out;
> > > > +       }
> > > >
> > > > -       databuf = devm_kzalloc(&sc->hdev->dev, poke_size, GFP_ATOMIC);
> > > > -       if (databuf == NULL)
> > > > -               return -ENOMEM;
> > > > +       mod_timer(&sc->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
> > > >
> > > > -       cr->bRequestType =
> > > > -               USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT;
> > > > -       cr->bRequest = USB_REQ_SET_CONFIGURATION;
> > > > -       cr->wValue = cpu_to_le16(ghl_ps3wiiu_magic_value);
> > > > -       cr->wIndex = 0;
> > > > -       cr->wLength = cpu_to_le16(poke_size);
> > > > -       memcpy(databuf, ghl_ps3wiiu_magic_data, poke_size);
> > > > -       usb_fill_control_urb(
> > > > -               sc->ghl_urb, usbdev, pipe,
> > > > -               (unsigned char *) cr, databuf, poke_size,
> > > > -               ghl_magic_poke_cb, sc);
> > > > -       return 0;
> > > > +out:
> > > > +       kfree(buf);
> > > >   }
> > > >
> > > >   static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
> > > > @@ -2968,7 +2939,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
> > > >         int ret;
> > > >         unsigned long quirks = id->driver_data;
> > > >         struct sony_sc *sc;
> > > > -       struct usb_device *usbdev;
> > > >         unsigned int connect_mask = HID_CONNECT_DEFAULT;
> > > >
> > > >         if (!strcmp(hdev->name, "FutureMax Dance Mat"))
> > > > @@ -2988,7 +2958,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
> > > >         sc->quirks = quirks;
> > > >         hid_set_drvdata(hdev, sc);
> > > >         sc->hdev = hdev;
> > > > -       usbdev = to_usb_device(sc->hdev->dev.parent->parent);
> > > >
> > > >         ret = hid_parse(hdev);
> > > >         if (ret) {
> > > > @@ -3031,15 +3000,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
> > > >         }
> > > >
> > > >         if (sc->quirks & GHL_GUITAR_PS3WIIU) {
> > > > -               sc->ghl_urb = usb_alloc_urb(0, GFP_ATOMIC);
> > > > -               if (!sc->ghl_urb)
> > > > -                       return -ENOMEM;
> > > > -               ret = ghl_init_urb(sc, usbdev);
> > > > -               if (ret) {
> > > > -                       hid_err(hdev, "error preparing URB\n");
> > > > -                       return ret;
> > > > -               }
> > > > -
> > > >                 timer_setup(&sc->ghl_poke_timer, ghl_magic_poke, 0);
> > > >                 mod_timer(&sc->ghl_poke_timer,
> > > >                           jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
> > > > @@ -3054,7 +3014,6 @@ static void sony_remove(struct hid_device *hdev)
> > > >
> > > >         if (sc->quirks & GHL_GUITAR_PS3WIIU) {
> > > >                 del_timer_sync(&sc->ghl_poke_timer);
> > > > -               usb_free_urb(sc->ghl_urb);
> > > >         }
> > > >
> > > >         hid_hw_close(hdev);
> > > > ---
> > >
> > > Was your patch against the master branch of hid/hid.git ?
> >
> > It was against the branch for-next of hid/hid.git, to account for the
> > PS3 fix that was sent earlier.
> >
> > > I'm asking because it doesn't apply at all on my end, unless I use
> > > --ignore-whitespace in which case, 3 out of 8 hunks fail.
> > >
> > > I assume I may be doing something wrong. I tried both downloading the
> > > raw message from marc.info and from patchwork in case gmail would
> > > mangle spaces/tabs, same result.
> > >
> > > Any idea?
> >
> > Usually opening the source of the email, and doing `git am -3`, hit
> > enter, then paste the content of the patch, then Ctrl-D is the
> > quickest you can do to apply such inlined patches (at least, that's
> > what I do).
> >
> > But Daniel found out that the patch is buggy, so let's concentrate on
> > the next iteration.
>
> I dove deeper into the proposed method and verified the functions in
> order to better understand how they work. I noticed that the const that you
> created (ghl_ps3wiiu_magic_report = 1) is modifying the first byte of the data
> to 0x01. I also noticed that it is what creates the wValue = 0x201, which
> explains why you set it to 1.
>
> After testing, I noticed that if we maintain the wValue = 0x201, and therefore
> byte[0] = 0x01, the dongle does not function as it should. However, if we
> change the const (ghl_ps3wiiu_magic_report = 2), although we have
> wValue = 0x202, the dongle does function as expected. That's surprising
> to us. Do you have any insights into the role of wValue in this context?
> We came up with 0x201 as we were simply reproducing what
> we had sniffed.

The answer is in usbhid_set_raw_report()
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hid/usbhid/hid-core.c#n907)

-> the wValue is used as `((rtype + 1) << 8) | reportnum`

where rtype is the report type (declared in include/linux/hid.h)
#define HID_INPUT_REPORT 0
#define HID_OUTPUT_REPORT 1
#define HID_FEATURE_REPORT 2

And reportnum is the report number (the one matching the report ID if
you look at the report descriptors.

I am as much as puzzled as you regarding the fact that writing the urb
directly works with '1' when it doesn't with the HID stack...

Actually, the HID stack would overwrite the first byte with the report
ID, which explains why the report gets changed.

However, why was the initial call setting a HID report ID of 1 but
then addressing the report 2??? That's probably a mystery we won't
solve :)

>
> Despite the error message related to scheduling, I have not been able to
> pinpoint the source of the hard freeze. Any hint there would be appreciated.

I would have to think about this a little bit more, but I have been
dragged all day with other internal work :(

>
> Lastly, I wanted to point out that for the PS4 dongle support, the
> magic data is
> not sent via control transfers, but through interrupt transfers. Does the HID
> infrastructure have the necessary mechanisms to do that as well or will we
> have to resort to the direct USB calls (like currently done in the patch
> I submitted)?

We have usbhid_output_report in this file, which can be genetically
called via hid_hw_output_report()

Also, IIRC it happens that sometimes a device would accept both
interrupt or control transfers for these kind of methods. It might be
interesting to see if you can not have a common path between the 2.

>
> Thank you for your patience.

Heh, no worries :)

Cheers,
Benjamin

> -Daniel
>

