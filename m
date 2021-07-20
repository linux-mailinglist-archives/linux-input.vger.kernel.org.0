Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6A43CFCAF
	for <lists+linux-input@lfdr.de>; Tue, 20 Jul 2021 16:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233843AbhGTOLh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Jul 2021 10:11:37 -0400
Received: from relais.etsmtl.ca ([142.137.1.25]:59536 "EHLO relais.etsmtl.ca"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239532AbhGTNwm (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Jul 2021 09:52:42 -0400
Content-Type: text/plain; charset="UTF-8"
DKIM-Signature: v=1; a=rsa-sha256; d=etsmtl.ca; s=bbb; c=relaxed/relaxed;
        t=1626791595; h=from:subject:to:date:ad-hoc;
        bh=tpX9BfjN998uzUSKnIsaWkou/fQPDZmUdHvGH+nVORM=;
        b=XsbqATyRjHsy0s0AjiRM44ThPc2UdzeVFQX+szLNK5gD1SqoUMYJyn/8FI6K3udlEsPGU1CtNX+
        1kclwqmlYqVYXYLYwiRKeRZMpYmme4lULPfnQi12eGLSY/Go28pvcyW1bUNawjl4ll/yKsv8D9yuw
        dcF/hKDDDIV4PJ7GZwk=
X-Gm-Message-State: AOAM532omYPExDdBCyeV7rxD2I+BKBDL2SeaOpYhjjLxukVr9r2+y2GK
        /dzvNaklr+D/Xscby5w5bD+NWAtf+L1dEVfrB4s=
X-Google-Smtp-Source: ABdhPJyqrE4tXVJMT+RFkZbhlAhkVmWRGzzlr76kSaOr10WMZQ0UQo7cL4DGO5G3ZyvJQHcHuaiiwJoogar1IVfGoPI=
X-Received: by 2002:a9f:3848:: with SMTP id q8mr31538531uad.114.1626791593665;
 Tue, 20 Jul 2021 07:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210715195720.169385-1-daniel.nguyen.1@ens.etsmtl.ca> <951c38d5-934e-eca7-a025-9cf074771764@redhat.com>
In-Reply-To: <951c38d5-934e-eca7-a025-9cf074771764@redhat.com>
From:   Pascal Giard <pascal.giard@etsmtl.ca>
Date:   Tue, 20 Jul 2021 10:33:02 -0400
X-Gmail-Original-Message-ID: <CAJNNDmn5V94mb0G9ZfxWDadxe17tEDKqWtfJErSjQxiRFd0ycA@mail.gmail.com>
Message-ID: <CAJNNDmn5V94mb0G9ZfxWDadxe17tEDKqWtfJErSjQxiRFd0ycA@mail.gmail.com>
Subject: Re: [PATCH] HID: sony: support for the ghlive ps4 dongles
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC:     Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
X-Originating-IP: [142.137.250.50]
X-ClientProxiedBy: FacteurA.ad.etsmtl.ca (10.162.28.14) To
 FacteurB.ad.etsmtl.ca (10.162.28.15)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On Tue, Jul 20, 2021 at 7:39 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Hi Daniel (and Pascal),
>
> [adding Roderick in Cc who is dealing with the Sony driver from Sony
> itself :) ]
>
>
> On Thu, Jul 15, 2021 at 9:58 PM Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca> wrote:
> >
> > This commit adds support for the Guitar Hero Live PS4 dongles.
>
> I was about to ask you to add some regression tests to
> https://gitlab.freedesktop.org/libevdev/hid-tools/-/blob/master/tests/test_sony.py
>
> This would likely have avoided the previous patch that was required and
> cc-ed to stable.
>
> But after looking slightly at the patch, I realized that the Guitar Hero
> code uses direct USB calls, which is not something we can emulate at the
> hid-tools level.
>
> However, after a second look at the code, I think that this part of the
> code just reimplements its own HID SET_OUTPUT code, and that is
> something we can easily emulate.
>
> Could you check if the following patch is still working properly on a
> PS3 dongle? and if so, add your PS4 support on top?
>
[...]

I wasn't aware that this was possible. Of course we will check whether
that works or not.

> ---
> commit 10e14f105553d2bd88bc7748e87154c5a8131e9e
> Author: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Date:   Tue Jul 20 11:44:10 2021 +0200
>
>      HID: sony: GHL: do not use raw USB calls
>
>      We can rely on HID to do the job for us.
>      This simplifies the code and also allows to implement regression tests.
>
>      Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>
> diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> index b3722c51ec78..901f61d286e8 100644
> --- a/drivers/hid/hid-sony.c
> +++ b/drivers/hid/hid-sony.c
> @@ -37,7 +37,6 @@
>   #include <linux/idr.h>
>   #include <linux/input/mt.h>
>   #include <linux/crc32.h>
> -#include <linux/usb.h>
>   #include <linux/timer.h>
>   #include <asm/unaligned.h>
>
> @@ -92,7 +91,7 @@
>    * https://github.com/ghlre/GHLtarUtility/blob/master/PS3Guitar.cs
>    * Note: The Wii U and PS3 dongles happen to share the same!
>    */
> -static const u16 ghl_ps3wiiu_magic_value = 0x201;
> +static const u16 ghl_ps3wiiu_magic_report = 1;
>   static const char ghl_ps3wiiu_magic_data[] = {
>         0x02, 0x08, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00
>   };
> @@ -597,7 +596,6 @@ struct sony_sc {
>         /* DS4 calibration data */
>         struct ds4_calibration_data ds4_calib_data[6];
>         /* GH Live */
> -       struct urb *ghl_urb;
>         struct timer_list ghl_poke_timer;
>   };
>
> @@ -622,56 +620,29 @@ static inline void sony_schedule_work(struct sony_sc *sc,
>         }
>   }
>
> -static void ghl_magic_poke_cb(struct urb *urb)
> -{
> -       struct sony_sc *sc = urb->context;
> -
> -       if (urb->status < 0)
> -               hid_err(sc->hdev, "URB transfer failed : %d", urb->status);
> -
> -       mod_timer(&sc->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
> -}
> -
>   static void ghl_magic_poke(struct timer_list *t)
>   {
>         int ret;
>         struct sony_sc *sc = from_timer(sc, t, ghl_poke_timer);
> +       const int buf_size = ARRAY_SIZE(ghl_ps3wiiu_magic_data);
> +       u8 *buf;
>
> -       ret = usb_submit_urb(sc->ghl_urb, GFP_ATOMIC);
> -       if (ret < 0)
> -               hid_err(sc->hdev, "usb_submit_urb failed: %d", ret);
> -}
> -
> -static int ghl_init_urb(struct sony_sc *sc, struct usb_device *usbdev)
> -{
> -       struct usb_ctrlrequest *cr;
> -       u16 poke_size;
> -       u8 *databuf;
> -       unsigned int pipe;
> -
> -       poke_size = ARRAY_SIZE(ghl_ps3wiiu_magic_data);
> -       pipe = usb_sndctrlpipe(usbdev, 0);
> +       buf = kmemdup(ghl_ps3wiiu_magic_data, buf_size, GFP_KERNEL);
> +       if (!buf)
> +               return;
>
> -       cr = devm_kzalloc(&sc->hdev->dev, sizeof(*cr), GFP_ATOMIC);
> -       if (cr == NULL)
> -               return -ENOMEM;
> +       ret = hid_hw_raw_request(sc->hdev, ghl_ps3wiiu_magic_report, buf,
> +                                buf_size,
> +                                HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
> +       if (ret < 0) {
> +               hid_err(sc->hdev, "can't poke ghl magic\n");
> +               goto out;
> +       }
>
> -       databuf = devm_kzalloc(&sc->hdev->dev, poke_size, GFP_ATOMIC);
> -       if (databuf == NULL)
> -               return -ENOMEM;
> +       mod_timer(&sc->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
>
> -       cr->bRequestType =
> -               USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT;
> -       cr->bRequest = USB_REQ_SET_CONFIGURATION;
> -       cr->wValue = cpu_to_le16(ghl_ps3wiiu_magic_value);
> -       cr->wIndex = 0;
> -       cr->wLength = cpu_to_le16(poke_size);
> -       memcpy(databuf, ghl_ps3wiiu_magic_data, poke_size);
> -       usb_fill_control_urb(
> -               sc->ghl_urb, usbdev, pipe,
> -               (unsigned char *) cr, databuf, poke_size,
> -               ghl_magic_poke_cb, sc);
> -       return 0;
> +out:
> +       kfree(buf);
>   }
>
>   static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
> @@ -2968,7 +2939,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
>         int ret;
>         unsigned long quirks = id->driver_data;
>         struct sony_sc *sc;
> -       struct usb_device *usbdev;
>         unsigned int connect_mask = HID_CONNECT_DEFAULT;
>
>         if (!strcmp(hdev->name, "FutureMax Dance Mat"))
> @@ -2988,7 +2958,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
>         sc->quirks = quirks;
>         hid_set_drvdata(hdev, sc);
>         sc->hdev = hdev;
> -       usbdev = to_usb_device(sc->hdev->dev.parent->parent);
>
>         ret = hid_parse(hdev);
>         if (ret) {
> @@ -3031,15 +3000,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
>         }
>
>         if (sc->quirks & GHL_GUITAR_PS3WIIU) {
> -               sc->ghl_urb = usb_alloc_urb(0, GFP_ATOMIC);
> -               if (!sc->ghl_urb)
> -                       return -ENOMEM;
> -               ret = ghl_init_urb(sc, usbdev);
> -               if (ret) {
> -                       hid_err(hdev, "error preparing URB\n");
> -                       return ret;
> -               }
> -
>                 timer_setup(&sc->ghl_poke_timer, ghl_magic_poke, 0);
>                 mod_timer(&sc->ghl_poke_timer,
>                           jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
> @@ -3054,7 +3014,6 @@ static void sony_remove(struct hid_device *hdev)
>
>         if (sc->quirks & GHL_GUITAR_PS3WIIU) {
>                 del_timer_sync(&sc->ghl_poke_timer);
> -               usb_free_urb(sc->ghl_urb);
>         }
>
>         hid_hw_close(hdev);
> ---

Was your patch against the master branch of hid/hid.git ?
I'm asking because it doesn't apply at all on my end, unless I use
--ignore-whitespace in which case, 3 out of 8 hunks fail.

I assume I may be doing something wrong. I tried both downloading the
raw message from marc.info and from patchwork in case gmail would
mangle spaces/tabs, same result.

Any idea?

Thank you for your patience,

-Pascal
