Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA09541C122
	for <lists+linux-input@lfdr.de>; Wed, 29 Sep 2021 10:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244961AbhI2I47 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Sep 2021 04:56:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38387 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244951AbhI2I45 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Sep 2021 04:56:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632905716;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yseANl8cz/oeon8Zy6PuBbVnHsn80AhKKFxnG1Ddc64=;
        b=RDH8mOfUcDsrq+Pxyoh0OJxQDivbtoF4WYtnJ1L8iFMf/QVIVtqbnoNf/vy4tEameP9sLZ
        cBMkc+XlvMrHagoSWOE54hWSHrxPpnwEUdOlqIVPNQZB4Wx3Ba2lJ/vL3LEqcdklqawWjL
        qgJyUtoLmZikyOOBR4ERat1jgl6g06c=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471--E3UeFHbMPaOxBCpiz65YQ-1; Wed, 29 Sep 2021 04:55:14 -0400
X-MC-Unique: -E3UeFHbMPaOxBCpiz65YQ-1
Received: by mail-pf1-f197.google.com with SMTP id l201-20020a6288d2000000b0044b825184a9so1385523pfd.0
        for <linux-input@vger.kernel.org>; Wed, 29 Sep 2021 01:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yseANl8cz/oeon8Zy6PuBbVnHsn80AhKKFxnG1Ddc64=;
        b=5FO3dH8TAV47QSXW8lBgJfxY8Y/pQJsFHfuT1q7TSEAoytTER5lpu7fuLbjFTuB+XS
         H5s8QPJUJX+5xycs+xEbPqQZFFuCZ85Qs0+99QTdaBl+TuM21NeWqXTyNMV+0c82ARpz
         OE3uy+dqZHWBVUgiPrSaP65CHdcPdFth34LDUXd4eOM386kfOG4/v8OOS2Vh+mDOA3WA
         5OrOZXQc9W4l0Pk8upLPLrhXmRNg0S2vagUdkr+5G+Gkeyrz8ngQHtCnUmSDI6S3mFRl
         PqwQhIeDlRVAukzOiBZlzfgTw2fz5wBdClq7VwU1bGXTjkJ35ufqGaKr9iXOkfDEW0cu
         jG2g==
X-Gm-Message-State: AOAM530WdtuAS4a/sPLNBmb5L5imZQ+dCwSdlc3RC60//Qj3KfR944TQ
        QzUGR7V5J4M6n5+PzQJw6TKPjXiwg20aeTXkxzqtf+BaUKuULvPBJLVuitVnSY+ckBKdYxaD2SF
        UyvpWFfqSIn2VGZ5hD0bQq8wRXFFrW2ZNjn5CCqs=
X-Received: by 2002:a17:90a:4681:: with SMTP id z1mr5183990pjf.113.1632905713771;
        Wed, 29 Sep 2021 01:55:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydUreqCR7ZXrQxa1ejm5Ws4DLk1ZdEDvtvnO4+uuq60yPu0mZeyc+UQwCz5Ni75631zxPLHFOTzFhdxTyuRMo=
X-Received: by 2002:a17:90a:4681:: with SMTP id z1mr5183972pjf.113.1632905713412;
 Wed, 29 Sep 2021 01:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210928083906.43983-1-benjamin.tissoires@redhat.com>
 <20210928083906.43983-3-benjamin.tissoires@redhat.com> <5a90b82581ded600971076c3d4d28caa5fc24c33.camel@devoid-pointer.net>
In-Reply-To: <5a90b82581ded600971076c3d4d28caa5fc24c33.camel@devoid-pointer.net>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 29 Sep 2021 10:55:01 +0200
Message-ID: <CAO-hwJJTYvDmyyVEuYPQ-M2kvoKndwH7JOAy7h5YVc3GGAHObw@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: lg4ff: do not return a value for deinit
To:     =?UTF-8?B?TWljaGFsIE1hbMO9?= <madcatxster@devoid-pointer.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 29, 2021 at 9:50 AM Michal Mal=C3=BD
<madcatxster@devoid-pointer.net> wrote:
>
> On Tue, 2021-09-28 at 10:39 +0200, Benjamin Tissoires wrote:
> > When removing a device, we can not do much if there is an error while
> > removing it. Use the common pattern of returning void there so we are
> > not tempted to check on the return value.
> > And honestly, we were not looking at it, so why bother?
> >
> > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > ---
> >  drivers/hid/hid-lg4ff.c | 5 ++---
> >  drivers/hid/hid-lg4ff.h | 4 ++--
> >  2 files changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/hid/hid-lg4ff.c b/drivers/hid/hid-lg4ff.c
> > index 5e6a0cef2a06..ad75c86e0bf5 100644
> > --- a/drivers/hid/hid-lg4ff.c
> > +++ b/drivers/hid/hid-lg4ff.c
> > @@ -1445,7 +1445,7 @@ int lg4ff_init(struct hid_device *hid)
> >         return error;
> >  }
> >
> > -int lg4ff_deinit(struct hid_device *hid)
> > +void lg4ff_deinit(struct hid_device *hid)
> >  {
> >         struct lg4ff_device_entry *entry;
> >         struct lg_drv_data *drv_data;
> > @@ -1453,7 +1453,7 @@ int lg4ff_deinit(struct hid_device *hid)
> >         drv_data =3D hid_get_drvdata(hid);
> >         if (!drv_data) {
> >                 hid_err(hid, "Error while deinitializing device, no
> > private driver data.\n");
> > -               return -1;
> > +               return;
> >         }
> >         entry =3D drv_data->device_props;
> >         if (!entry)
> > @@ -1489,5 +1489,4 @@ int lg4ff_deinit(struct hid_device *hid)
> >         kfree(entry);
> >  out:
> >         dbg_hid("Device successfully unregistered\n");
> > -       return 0;
> >  }
> > diff --git a/drivers/hid/hid-lg4ff.h b/drivers/hid/hid-lg4ff.h
> > index 25bc88cd877e..4440e4ea2267 100644
> > --- a/drivers/hid/hid-lg4ff.h
> > +++ b/drivers/hid/hid-lg4ff.h
> > @@ -10,14 +10,14 @@ int lg4ff_adjust_input_event(struct hid_device
> > *hid, struct hid_field *field,
> >  int lg4ff_raw_event(struct hid_device *hdev, struct hid_report
> > *report,
> >                 u8 *rd, int size, struct lg_drv_data *drv_data);
> >  int lg4ff_init(struct hid_device *hdev);
> > -int lg4ff_deinit(struct hid_device *hdev);
> > +void lg4ff_deinit(struct hid_device *hdev);
> >  #else
> >  static inline int lg4ff_adjust_input_event(struct hid_device *hid,
> > struct hid_field *field,
> >                                            struct hid_usage *usage, s32
> > value, struct lg_drv_data *drv_data) { return 0; }
> >  static inline int lg4ff_raw_event(struct hid_device *hdev, struct
> > hid_report *report,
> >                 u8 *rd, int size, struct lg_drv_data *drv_data) {
> > return 0; }
> >  static inline int lg4ff_init(struct hid_device *hdev) { return 0; }
> > -static inline int lg4ff_deinit(struct hid_device *hdev) { return 0; }
> > +static inline void lg4ff_deinit(struct hid_device *hdev) { return; }
> >  #endif
> >
> >  #endif
>
> I'll try to dig up some lg4ff hardware to make sure but AFAICT skipping
> the init routines will make all of the devices look like standard HID
> stuff. Mind that disabling lg4ff disables more than just FF for the
> affected Logitech wheels but that probably doesn't matter.
>
> Perhaps a bit better approach would be to remove the special handling
> of these devices from the hid-lg driver altogether when the respective
> submodules are switched off. That way the devices should be handled
> just by the generic HID code and we won't need the dud functions at
> all.

I'm OK with that approach. there are a few bits in the following code
that need changes, see my replies inline.

>
> I only checked that this compiles. I can test this with real HW if you
> find this acceptable.

That would be great, I don't have the HW :)

>
> MM
>
> ---
>
> diff --git a/drivers/hid/hid-lg.c b/drivers/hid/hid-lg.c
> index d40af911df63..f698c2f6e810 100644
> --- a/drivers/hid/hid-lg.c
> +++ b/drivers/hid/hid-lg.c
> @@ -49,6 +49,19 @@
>  #define FFG_RDESC_ORIG_SIZE    85
>  #define FG_RDESC_ORIG_SIZE     82
>
> +#ifndef CONFIG_LOGITECH_FF
> +static int lgff_init(struct hid_device *hid) { return 0; }
> +#endif
> +#ifndef CONFIG_LOGIRUMBLEPAD2_FF
> +static int lg2ff_init(struct hid_device *hid) { return 0; }
> +#endif
> +#ifndef CONFIG_LOGIG940_FF
> +static int lg3ff_init(struct hid_device *hid) { return 0; }
> +#endif
> +#ifndef CONFIG_LOGIWHEELS_FF
> +static int lg4ff_init(struct hid_device *hid) { return 0; }
> +#endif

I would rather keep those definitions in hid-lg.h, not inlined in the code

> +
>  /* Fixed report descriptors for Logitech Driving Force (and Pro)
>   * wheel controllers
>   *
> @@ -729,9 +742,11 @@ static int lg_event(struct hid_device *hdev, struct =
hid_field *field,
>                                 -value);
>                 return 1;
>         }
> +#ifdef CONFIG_LOGIWHEELS_FF
>         if (drv_data->quirks & LG_FF4) {
>                 return lg4ff_adjust_input_event(hdev, field, usage, value=
, drv_data);
>         }
> +#endif

Let's not sprinkle the code with #ifdef. Just add an inline
lg4ff_adjust_input_event() in hid-lg4ff.h that returns 0.

>
>         return 0;
>  }
> @@ -741,8 +756,10 @@ static int lg_raw_event(struct hid_device *hdev, str=
uct hid_report *report,
>  {
>         struct lg_drv_data *drv_data =3D hid_get_drvdata(hdev);
>
> +#ifdef CONFIG_LOGIWHEELS_FF
>         if (drv_data->quirks & LG_FF4)
>                 return lg4ff_raw_event(hdev, report, rd, size, drv_data);
> +#endif

same here

>
>         return 0;
>  }
> @@ -844,8 +861,10 @@ static int lg_probe(struct hid_device *hdev, const s=
truct hid_device_id *id)
>  static void lg_remove(struct hid_device *hdev)
>  {
>         struct lg_drv_data *drv_data =3D hid_get_drvdata(hdev);
> +#ifdef CONFIG_LOGIWHEELS_FF
>         if (drv_data->quirks & LG_FF4)
>                 lg4ff_deinit(hdev);
> +#endif

same here :)

>         hid_hw_stop(hdev);
>         kfree(drv_data);
>  }
> @@ -869,45 +888,54 @@ static const struct hid_device_id lg_devices[] =3D =
{
>                 .driver_data =3D LG_NOGET },
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_D=
UAL_ACTION),
>                 .driver_data =3D LG_NOGET },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_W=
HEEL),
> -               .driver_data =3D LG_NOGET | LG_FF4 },
> -
> -       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_R=
UMBLEPAD_CORD),
> -               .driver_data =3D LG_FF2 },
> +#ifdef CONFIG_LOGITECH_FF
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_R=
UMBLEPAD),
>                 .driver_data =3D LG_FF },
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_R=
UMBLEPAD2_2),
>                 .driver_data =3D LG_FF },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G=
29_WHEEL),
> -               .driver_data =3D LG_FF4 },
> +
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_W=
INGMAN_F3D),
>                 .driver_data =3D LG_FF },
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_F=
ORCE3D_PRO),
>                 .driver_data =3D LG_FF },
> +#endif
> +#ifdef CONFIG_LOGIRUMBLEPAD2_FF
> +       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_R=
UMBLEPAD_CORD),
> +               .driver_data =3D LG_FF2 },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_V=
IBRATION_WHEEL),
> +               .driver_data =3D LG_FF2 },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_R=
UMBLEPAD2),
> +               .driver_data =3D LG_NOGET | LG_FF2 },

That's the part I was not entirely sure: I *think* not having NOGET
when using the generic path is OK now, but having a real hardware test
would be nice (if you still have this one).
Worse case I should be able to get this tested through the RHEL bug,
but that would take some time to get.

> +#endif
> +#ifdef CONFIG_LOGIG940_FF
> +       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_F=
LIGHT_SYSTEM_G940),
> +               .driver_data =3D LG_FF3 },
> +#endif
> +#ifdef CONFIG_LOGIWHEELS_FF
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_M=
OMO_WHEEL),
>                 .driver_data =3D LG_NOGET | LG_FF4 },
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_M=
OMO_WHEEL2),
>                 .driver_data =3D LG_FF4 },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_V=
IBRATION_WHEEL),
> -               .driver_data =3D LG_FF2 },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_W=
HEEL),
> +               .driver_data =3D LG_NOGET | LG_FF4 },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_D=
FP_WHEEL),
> +               .driver_data =3D LG_NOGET | LG_FF4 },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G=
27_WHEEL),
> +               .driver_data =3D LG_FF4 },
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G=
25_WHEEL),
>                 .driver_data =3D LG_FF4 },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_D=
FGT_WHEEL),
> +       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G=
29_WHEEL),
>                 .driver_data =3D LG_FF4 },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G=
27_WHEEL),
> +       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_D=
FGT_WHEEL),
>                 .driver_data =3D LG_FF4 },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_D=
FP_WHEEL),
> +       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_W=
INGMAN_FFG),
>                 .driver_data =3D LG_NOGET | LG_FF4 },
> +#else  /* Wii wheel still needs a bit of special handling */
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_W=
II_WHEEL),
> -               .driver_data =3D LG_FF4 },
> +               .driver_data =3D 0 },

I am not sure about this bit. Can you expand on it a bit?

> +#endif
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_W=
INGMAN_FG),
>                 .driver_data =3D LG_NOGET },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_W=
INGMAN_FFG),
> -               .driver_data =3D LG_NOGET | LG_FF4 },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_R=
UMBLEPAD2),
> -               .driver_data =3D LG_NOGET | LG_FF2 },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_F=
LIGHT_SYSTEM_G940),
> -               .driver_data =3D LG_FF3 },
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_SPACENAVIG=
ATOR),
>                 .driver_data =3D LG_RDESC_REL_ABS },
>         { HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_SPACETRAVE=
LLER),
> diff --git a/drivers/hid/hid-lg.h b/drivers/hid/hid-lg.h
> index 3d8902ba1c6c..5bcb918f4741 100644
> --- a/drivers/hid/hid-lg.h
> +++ b/drivers/hid/hid-lg.h
> @@ -9,20 +9,14 @@ struct lg_drv_data {
>
>  #ifdef CONFIG_LOGITECH_FF
>  int lgff_init(struct hid_device *hdev);
> -#else
> -static inline int lgff_init(struct hid_device *hdev) { return -1; }
>  #endif
>
>  #ifdef CONFIG_LOGIRUMBLEPAD2_FF
>  int lg2ff_init(struct hid_device *hdev);
> -#else
> -static inline int lg2ff_init(struct hid_device *hdev) { return -1; }
>  #endif
>
>  #ifdef CONFIG_LOGIG940_FF
>  int lg3ff_init(struct hid_device *hdev);
> -#else
> -static inline int lg3ff_init(struct hid_device *hdev) { return -1; }
>  #endif
>
>  #endif
> diff --git a/drivers/hid/hid-lg4ff.h b/drivers/hid/hid-lg4ff.h
> index e5c55d515ac2..c529135bba96 100644
> --- a/drivers/hid/hid-lg4ff.h
> +++ b/drivers/hid/hid-lg4ff.h
> @@ -11,13 +11,6 @@ int lg4ff_raw_event(struct hid_device *hdev, struct hi=
d_report *report,
>                 u8 *rd, int size, struct lg_drv_data *drv_data);
>  int lg4ff_init(struct hid_device *hdev);
>  int lg4ff_deinit(struct hid_device *hdev);
> -#else
> -static inline int lg4ff_adjust_input_event(struct hid_device *hid, struc=
t hid_field *field,
> -                                          struct hid_usage *usage, s32 v=
alue, struct lg_drv_data *drv_data) { return 0; }
> -static inline int lg4ff_raw_event(struct hid_device *hdev, struct hid_re=
port *report,
> -               u8 *rd, int size, struct lg_drv_data *drv_data) { return =
0; }
> -static inline int lg4ff_init(struct hid_device *hdev) { return -1; }
> -static inline int lg4ff_deinit(struct hid_device *hdev) { return -1; }
>  #endif

I would keep all of those static inline defines here, as mentioned above.

This patch is also missing a change in hid-quirks.c: we need to remove
them from the hid_have_special_driver[] list, or they will simply not
bind to anything when they are plugged with the FF disabled.
We could also add #ifdef in hid_have_special_driver[], but if it works
without, that would be better actually.

Cheers,
Benjamin

>
>  #endif
>
>

