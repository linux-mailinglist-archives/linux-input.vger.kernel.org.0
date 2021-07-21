Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64D9F3D0D6D
	for <lists+linux-input@lfdr.de>; Wed, 21 Jul 2021 13:24:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234568AbhGUKmg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jul 2021 06:42:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35505 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237982AbhGUJgS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jul 2021 05:36:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626862614;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CgL++OR7z1nd5JYQZRVtrVkufarvbZ3Fhp5bTL15FbY=;
        b=awtGbsGUUoBTt8MiT0nLQnj9k6lWL7SXpqW75Y10ZQxQxC0Q0ic9OzQYUAOG4iLTnItZUx
        UA+fQLB5Q0PRRyO9a7TD3YP5UW6/YfEu6iwVKRVoPAZf02v6qy8pB1Cjz7Q7iRwVcYRDdp
        gB+RjinxwAEKEyFZ63qcoevAAsHFLXw=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-ActhVCbPO7uoQbSHWiCtuA-1; Wed, 21 Jul 2021 06:16:52 -0400
X-MC-Unique: ActhVCbPO7uoQbSHWiCtuA-1
Received: by mail-pf1-f199.google.com with SMTP id g8-20020aa781880000b029034c3e4a41edso1503142pfi.14
        for <linux-input@vger.kernel.org>; Wed, 21 Jul 2021 03:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CgL++OR7z1nd5JYQZRVtrVkufarvbZ3Fhp5bTL15FbY=;
        b=rJPcJLtfXNdBNsuHLH5thn2i1BMMfD0TiOx6ftdGAmtxyOTgI5XrfhdXGMcHixu4pQ
         w8h9trjc8eCA6+1kgRSyAHAOVX7egFJAxJFA5DBBIn0E9cjm6G3u/W4tvai8lVvJKMFp
         7hS2buJR6SK0UGKrhZnp228d4iGDhbd8RpCO0QBcDvmxUYDzZGArmP8tkit3KkwzKhYv
         NXR5+xjpVZfwDk2MfwfDLuZApgL32V+qywKgBKNTbvznV4HvP3OZum+CEgM86McSLtN+
         2nLPK2O/2aWBMQ1yNna0Yf4NT/GQXJG82aU/QBgdo5bMnXaDtkFmcFdz3diqEuLKJOZG
         FJSA==
X-Gm-Message-State: AOAM531dSGI5LIkih4k6D04a32ctX/+YBcRcCJKx5hYHt80fvQusBax7
        pRyxFy5JNSAGlIMUyOcUOIZplPGsAXvbmyc9rWX6b6DsiN6rbD+/VoFWCka+c/mtbVOy+tZ6h1H
        Y7zS5HSTbfpYTMQ+ANEDMVrq8rHG7IPSpwZ/+dvM=
X-Received: by 2002:a17:90a:5889:: with SMTP id j9mr34472253pji.234.1626862611717;
        Wed, 21 Jul 2021 03:16:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVU2pBv6Y7c720mexuoNECiSDHusKJzzQ+wWRaj78iIJZ5AZXmu5GamBXeQSzjugvcRVyU8q3RPwsNpwgs9oI=
X-Received: by 2002:a17:90a:5889:: with SMTP id j9mr34472232pji.234.1626862611490;
 Wed, 21 Jul 2021 03:16:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210715195720.169385-1-daniel.nguyen.1@ens.etsmtl.ca>
 <951c38d5-934e-eca7-a025-9cf074771764@redhat.com> <CAJNNDmn5V94mb0G9ZfxWDadxe17tEDKqWtfJErSjQxiRFd0ycA@mail.gmail.com>
In-Reply-To: <CAJNNDmn5V94mb0G9ZfxWDadxe17tEDKqWtfJErSjQxiRFd0ycA@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 21 Jul 2021 12:16:40 +0200
Message-ID: <CAO-hwJLog04U6WHZq3qEKf_bbW5wU3bL+m7zbY6h=x2neK58AQ@mail.gmail.com>
Subject: Re: [PATCH] HID: sony: support for the ghlive ps4 dongles
To:     Pascal Giard <pascal.giard@etsmtl.ca>
Cc:     Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 20, 2021 at 4:33 PM Pascal Giard <pascal.giard@etsmtl.ca> wrote:
>
> Hi Benjamin,
>
> On Tue, Jul 20, 2021 at 7:39 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > Hi Daniel (and Pascal),
> >
> > [adding Roderick in Cc who is dealing with the Sony driver from Sony
> > itself :) ]
> >
> >
> > On Thu, Jul 15, 2021 at 9:58 PM Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca> wrote:
> > >
> > > This commit adds support for the Guitar Hero Live PS4 dongles.
> >
> > I was about to ask you to add some regression tests to
> > https://gitlab.freedesktop.org/libevdev/hid-tools/-/blob/master/tests/test_sony.py
> >
> > This would likely have avoided the previous patch that was required and
> > cc-ed to stable.
> >
> > But after looking slightly at the patch, I realized that the Guitar Hero
> > code uses direct USB calls, which is not something we can emulate at the
> > hid-tools level.
> >
> > However, after a second look at the code, I think that this part of the
> > code just reimplements its own HID SET_OUTPUT code, and that is
> > something we can easily emulate.
> >
> > Could you check if the following patch is still working properly on a
> > PS3 dongle? and if so, add your PS4 support on top?
> >
> [...]
>
> I wasn't aware that this was possible. Of course we will check whether
> that works or not.
>
> > ---
> > commit 10e14f105553d2bd88bc7748e87154c5a8131e9e
> > Author: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > Date:   Tue Jul 20 11:44:10 2021 +0200
> >
> >      HID: sony: GHL: do not use raw USB calls
> >
> >      We can rely on HID to do the job for us.
> >      This simplifies the code and also allows to implement regression tests.
> >
> >      Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> >
> > diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> > index b3722c51ec78..901f61d286e8 100644
> > --- a/drivers/hid/hid-sony.c
> > +++ b/drivers/hid/hid-sony.c
> > @@ -37,7 +37,6 @@
> >   #include <linux/idr.h>
> >   #include <linux/input/mt.h>
> >   #include <linux/crc32.h>
> > -#include <linux/usb.h>
> >   #include <linux/timer.h>
> >   #include <asm/unaligned.h>
> >
> > @@ -92,7 +91,7 @@
> >    * https://github.com/ghlre/GHLtarUtility/blob/master/PS3Guitar.cs
> >    * Note: The Wii U and PS3 dongles happen to share the same!
> >    */
> > -static const u16 ghl_ps3wiiu_magic_value = 0x201;
> > +static const u16 ghl_ps3wiiu_magic_report = 1;
> >   static const char ghl_ps3wiiu_magic_data[] = {
> >         0x02, 0x08, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00
> >   };
> > @@ -597,7 +596,6 @@ struct sony_sc {
> >         /* DS4 calibration data */
> >         struct ds4_calibration_data ds4_calib_data[6];
> >         /* GH Live */
> > -       struct urb *ghl_urb;
> >         struct timer_list ghl_poke_timer;
> >   };
> >
> > @@ -622,56 +620,29 @@ static inline void sony_schedule_work(struct sony_sc *sc,
> >         }
> >   }
> >
> > -static void ghl_magic_poke_cb(struct urb *urb)
> > -{
> > -       struct sony_sc *sc = urb->context;
> > -
> > -       if (urb->status < 0)
> > -               hid_err(sc->hdev, "URB transfer failed : %d", urb->status);
> > -
> > -       mod_timer(&sc->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
> > -}
> > -
> >   static void ghl_magic_poke(struct timer_list *t)
> >   {
> >         int ret;
> >         struct sony_sc *sc = from_timer(sc, t, ghl_poke_timer);
> > +       const int buf_size = ARRAY_SIZE(ghl_ps3wiiu_magic_data);
> > +       u8 *buf;
> >
> > -       ret = usb_submit_urb(sc->ghl_urb, GFP_ATOMIC);
> > -       if (ret < 0)
> > -               hid_err(sc->hdev, "usb_submit_urb failed: %d", ret);
> > -}
> > -
> > -static int ghl_init_urb(struct sony_sc *sc, struct usb_device *usbdev)
> > -{
> > -       struct usb_ctrlrequest *cr;
> > -       u16 poke_size;
> > -       u8 *databuf;
> > -       unsigned int pipe;
> > -
> > -       poke_size = ARRAY_SIZE(ghl_ps3wiiu_magic_data);
> > -       pipe = usb_sndctrlpipe(usbdev, 0);
> > +       buf = kmemdup(ghl_ps3wiiu_magic_data, buf_size, GFP_KERNEL);
> > +       if (!buf)
> > +               return;
> >
> > -       cr = devm_kzalloc(&sc->hdev->dev, sizeof(*cr), GFP_ATOMIC);
> > -       if (cr == NULL)
> > -               return -ENOMEM;
> > +       ret = hid_hw_raw_request(sc->hdev, ghl_ps3wiiu_magic_report, buf,
> > +                                buf_size,
> > +                                HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
> > +       if (ret < 0) {
> > +               hid_err(sc->hdev, "can't poke ghl magic\n");
> > +               goto out;
> > +       }
> >
> > -       databuf = devm_kzalloc(&sc->hdev->dev, poke_size, GFP_ATOMIC);
> > -       if (databuf == NULL)
> > -               return -ENOMEM;
> > +       mod_timer(&sc->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
> >
> > -       cr->bRequestType =
> > -               USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT;
> > -       cr->bRequest = USB_REQ_SET_CONFIGURATION;
> > -       cr->wValue = cpu_to_le16(ghl_ps3wiiu_magic_value);
> > -       cr->wIndex = 0;
> > -       cr->wLength = cpu_to_le16(poke_size);
> > -       memcpy(databuf, ghl_ps3wiiu_magic_data, poke_size);
> > -       usb_fill_control_urb(
> > -               sc->ghl_urb, usbdev, pipe,
> > -               (unsigned char *) cr, databuf, poke_size,
> > -               ghl_magic_poke_cb, sc);
> > -       return 0;
> > +out:
> > +       kfree(buf);
> >   }
> >
> >   static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
> > @@ -2968,7 +2939,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >         int ret;
> >         unsigned long quirks = id->driver_data;
> >         struct sony_sc *sc;
> > -       struct usb_device *usbdev;
> >         unsigned int connect_mask = HID_CONNECT_DEFAULT;
> >
> >         if (!strcmp(hdev->name, "FutureMax Dance Mat"))
> > @@ -2988,7 +2958,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >         sc->quirks = quirks;
> >         hid_set_drvdata(hdev, sc);
> >         sc->hdev = hdev;
> > -       usbdev = to_usb_device(sc->hdev->dev.parent->parent);
> >
> >         ret = hid_parse(hdev);
> >         if (ret) {
> > @@ -3031,15 +3000,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >         }
> >
> >         if (sc->quirks & GHL_GUITAR_PS3WIIU) {
> > -               sc->ghl_urb = usb_alloc_urb(0, GFP_ATOMIC);
> > -               if (!sc->ghl_urb)
> > -                       return -ENOMEM;
> > -               ret = ghl_init_urb(sc, usbdev);
> > -               if (ret) {
> > -                       hid_err(hdev, "error preparing URB\n");
> > -                       return ret;
> > -               }
> > -
> >                 timer_setup(&sc->ghl_poke_timer, ghl_magic_poke, 0);
> >                 mod_timer(&sc->ghl_poke_timer,
> >                           jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
> > @@ -3054,7 +3014,6 @@ static void sony_remove(struct hid_device *hdev)
> >
> >         if (sc->quirks & GHL_GUITAR_PS3WIIU) {
> >                 del_timer_sync(&sc->ghl_poke_timer);
> > -               usb_free_urb(sc->ghl_urb);
> >         }
> >
> >         hid_hw_close(hdev);
> > ---
>
> Was your patch against the master branch of hid/hid.git ?

It was against the branch for-next of hid/hid.git, to account for the
PS3 fix that was sent earlier.

> I'm asking because it doesn't apply at all on my end, unless I use
> --ignore-whitespace in which case, 3 out of 8 hunks fail.
>
> I assume I may be doing something wrong. I tried both downloading the
> raw message from marc.info and from patchwork in case gmail would
> mangle spaces/tabs, same result.
>
> Any idea?

Usually opening the source of the email, and doing `git am -3`, hit
enter, then paste the content of the patch, then Ctrl-D is the
quickest you can do to apply such inlined patches (at least, that's
what I do).

But Daniel found out that the patch is buggy, so let's concentrate on
the next iteration.

Cheers,
Benjamin

>
> Thank you for your patience,
>
> -Pascal
>

