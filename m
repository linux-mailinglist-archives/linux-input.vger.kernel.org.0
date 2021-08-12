Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C55833EAC2E
	for <lists+linux-input@lfdr.de>; Thu, 12 Aug 2021 23:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232697AbhHLVBs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Aug 2021 17:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbhHLVBs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Aug 2021 17:01:48 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EB0CC061756
        for <linux-input@vger.kernel.org>; Thu, 12 Aug 2021 14:01:22 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id x5so6541991ybe.12
        for <linux-input@vger.kernel.org>; Thu, 12 Aug 2021 14:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=634bZbdf/2YYf/9xygzUWNC0wQGiUqzivuAfRmFjJdQ=;
        b=FqjbF+2+pRSGa7z7iKU6DUMDhOmBKEgrFjDPwOvX7UYYi5dGA1AiTFMrLXVmlavaDa
         M+r54M3Mp6tcmRn6eQqx+yNA6piaBhnhpIe6t6oz67BMJGhLncmiUG6amefPapyGyUnJ
         lYLK6ADVE3gw1LqFPm9Z/PxTbE3I9RSe3Uw07e1C60Q1fe1e7OYpDv6PF5eL0cjeKcy9
         BuwpQrlEmRRIgCMBfbGMPf5FmrLuncIrV84M1FE+vP7zRas4N+bs136z1Mz+vP3M2z/W
         9VO8Uem3TBw71IUw/7MG77f5BySF6y5FPKQmWcS66KBI8oxReQUI48XU3OBpDA6R0j0D
         iUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=634bZbdf/2YYf/9xygzUWNC0wQGiUqzivuAfRmFjJdQ=;
        b=ObOv8vuYxBMk6sTF5hFu3kz0ph2UuQj+gIYGXvP2rMc8JTfyY8xAjohyWS58TpTaxP
         kHzzNvKfqb2Y4FmoCTzXuEJ+e+NY7wCC/t8zH2HrIWw6+rvfZ2PqEnL5JcntCx/F4J9y
         cWi4WAjdHWxZFKFCiEkepYM09tpJkSVX9FkJjsPCqKB/0WR8NH4qUAYiBOhSQLuqPf2H
         8vSs8tSlVQdM7ccMBEjRdh+Hc2YqRrcoqjfHmlyebpwhZWGp13Bq4BfPM7Gwsn4fxB/j
         4fBlznYB6uBpJGTyxXDkhUt0mrsmJOx3v5JL8grYSZfMi8LqJWm0t6gwkrp0UhNmpocR
         1wRw==
X-Gm-Message-State: AOAM531mPt+ACIgaPe3jSE9KwXFB21tTPkOWSt0xmnPWXRFdjmJS6zCc
        FZvkoua39NITCxOQhiJNlFkGKvXJUHb5wgmsZC8=
X-Google-Smtp-Source: ABdhPJyW/YYrBK3Ac9npU1hzI+cPDyIgQRHgyDRf1i0omJN8PyQf/8HE1EFeUo7cKzYhZvv+2bPCl/vlgQctCAd5RCA=
X-Received: by 2002:a25:8b90:: with SMTP id j16mr6554713ybl.493.1628802081723;
 Thu, 12 Aug 2021 14:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210812001250.1709418-1-dmanti@microsoft.com>
 <CAO-hwJK1Jt+T_ZsvPj0=+hEt3XnALfnkmB++Kdk7bZV9FgE0Cg@mail.gmail.com>
 <87lf56inxm.fsf@kernel.org> <CAO-hwJ+36wji=nWKxW-GFBj=o3yovr__3s+03SDdPHq1jO4WwQ@mail.gmail.com>
In-Reply-To: <CAO-hwJ+36wji=nWKxW-GFBj=o3yovr__3s+03SDdPHq1jO4WwQ@mail.gmail.com>
From:   Dmitry Antipov <daantipov@gmail.com>
Date:   Thu, 12 Aug 2021 14:01:10 -0700
Message-ID: <CAOtsYnwF6fcrVTcR=HmjwEdfNN=HJEgVQTN1wzo6+2DSNPCQJA@mail.gmail.com>
Subject: Re: [PATCH] HID: Support Microsoft Surface Duo SPI-based touch
 controller driver as a module.
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Felipe Balbi <balbi@kernel.org>, Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        jeff.glaum@microsoft.com, Dmitry Antipov <dmanti@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Benjamin,

First of all, apologies for the rookie mistakes in formatting and
bundling everything in one patch - this was my first patch sent to
the community. I will resend the series of patches once there is
agreement on what they should look like.

On Thu, Aug 12, 2021 at 9:47 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Hi Dmitry,
>
> On Thu, Aug 12, 2021 at 2:13 AM Dmitry Antipov <daantipov@gmail.com> wrote:
> >
> > Surface Duo uses a touch digitizer that communicates to the main SoC via SPI
> > and presents itself as a HID device. This patch contains the changes needed
> > for the driver to work as a module: HID Core affordances for SPI devices,
> > addition of the new Device IDs, and a new quirk in hid-microsoft. The driver
> > itself is being prepared for a submission in the near future.
> >
> > Signed-off-by: Dmitry Antipov dmanti@microsoft.com
>
> Though I really appreciate seeing a microsoft.com submission, the
> commit description makes me wonder if we should not postpone the
> inclusion of this patch with the "submission in the near future".
>
> AFAIK, HID is not SPI aware. So basically, we are introducing dead
> code in the upstream kernel if we take this patch.
>
> Why is there a special need for us to take this one without the whole series?

This patch allows our spi-hid driver to function correctly as an out of
tree module. Prior to Android 12, OEMs were allowed to modify and build
their  own kernels, but that is changing with Google's GKI initiative.
For Android 12 we will need to use the signed image provided by Google,
and this patch is meant to prepare us for that.

If you are curious, here is a published (older) version of our spi-hid:
https://github.com/microsoft/surface-duo-oss-kernel.msm-4..14/tree/surfaceduo/10/2021.622.47/drivers/hid/spi-hid

We are working on finalizing the SPI HID spec and making it public, and
then preparing the transport driver for submission as a patch. The
reason for this first patch is to unblock our development work in the
meantime.

I see in a branch of this thread Felipe asked some questions seeing if
it is possible to get our device installed as hidraw without making
some of the code changes in this patch. I will follow that discussion,
test suggested approaches and will adjust the v2 of this patch
accordingly.

Thank you,
Dmitry

>
> Couple of additions to what Felipe said:
>
> > ---
> >  drivers/hid/hid-core.c      |  3 +++
> >  drivers/hid/hid-ids.h       |  2 ++
> >  drivers/hid/hid-microsoft.c | 15 +++++++++++++--
> >  drivers/hid/hid-quirks.c    |  2 ++
> >  include/linux/hid.h         |  2 ++
> >  5 files changed, 22 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > index 7db332139f7d..123a0e3a6b1a 100644
> > --- a/drivers/hid/hid-core.c
> > +++ b/drivers/hid/hid-core.c
> > @@ -2005,6 +2005,9 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
> >         case BUS_I2C:
> >                 bus = "I2C";
> >                 break;
> > +       case BUS_SPI:
> > +               bus = "SPI";
> > +               break;
>
> I'd like to have the SPI specific changes that are touching hid core
> in a separate patch, or with the SPI-HID transport layer.
>
> >         case BUS_VIRTUAL:
> >                 bus = "VIRTUAL";
> >                 break;
> > diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> > index 8f1893e68112..5c181d23a7ae 100644
> > --- a/drivers/hid/hid-ids.h
> > +++ b/drivers/hid/hid-ids.h
> > @@ -885,6 +885,8 @@
> >  #define USB_DEVICE_ID_MS_XBOX_ONE_S_CONTROLLER 0x02fd
> >  #define USB_DEVICE_ID_MS_PIXART_MOUSE    0x00cb
> >  #define USB_DEVICE_ID_8BITDO_SN30_PRO_PLUS      0x02e0
> > +#define SPI_DEVICE_ID_MS_SURFACE_G6_0  0x0c1d
> > +#define SPI_DEVICE_ID_MS_SURFACE_G6_1  0x0c42
> >
> >  #define USB_VENDOR_ID_MOJO             0x8282
> >  #define USB_DEVICE_ID_RETRO_ADAPTER    0x3201
> > diff --git a/drivers/hid/hid-microsoft.c b/drivers/hid/hid-microsoft.c
> > index 071fd093a5f4..50ea1f68c285 100644
> > --- a/drivers/hid/hid-microsoft.c
> > +++ b/drivers/hid/hid-microsoft.c
> > @@ -27,6 +27,7 @@
> >  #define MS_DUPLICATE_USAGES    BIT(5)
> >  #define MS_SURFACE_DIAL                BIT(6)
> >  #define MS_QUIRK_FF            BIT(7)
> > +#define MS_NOHIDINPUT          BIT(8)
> >
> >  struct ms_data {
> >         unsigned long quirks;
> > @@ -367,6 +368,7 @@ static int ms_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >         unsigned long quirks = id->driver_data;
> >         struct ms_data *ms;
> >         int ret;
> > +       unsigned int connect_mask;
> >
> >         ms = devm_kzalloc(&hdev->dev, sizeof(*ms), GFP_KERNEL);
> >         if (ms == NULL)
> > @@ -376,20 +378,25 @@ static int ms_probe(struct hid_device *hdev, const struct hid_device_id *id)
> >
> >         hid_set_drvdata(hdev, ms);
> >
> > +       connect_mask = HID_CONNECT_DEFAULT | ((quirks & MS_HIDINPUT) ?
> > +                       HID_CONNECT_HIDINPUT_FORCE : 0);
> > +
> >         if (quirks & MS_NOGET)
> >                 hdev->quirks |= HID_QUIRK_NOGET;
> >
> >         if (quirks & MS_SURFACE_DIAL)
> >                 hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
> >
> > +       if (quirks & MS_NOHIDINPUT)
> > +               connect_mask &= ~HID_CONNECT_HIDINPUT;
> > +
> >         ret = hid_parse(hdev);
> >         if (ret) {
> >                 hid_err(hdev, "parse failed\n");
> >                 goto err_free;
> >         }
> >
> > -       ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT | ((quirks & MS_HIDINPUT) ?
> > -                               HID_CONNECT_HIDINPUT_FORCE : 0));
> > +       ret = hid_hw_start(hdev, connect_mask);
> >         if (ret) {
> >                 hid_err(hdev, "hw start failed\n");
> >                 goto err_free;
> > @@ -450,6 +457,10 @@ static const struct hid_device_id ms_devices[] = {
> >                 .driver_data = MS_QUIRK_FF },
> >         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_8BITDO_SN30_PRO_PLUS),
> >                 .driver_data = MS_QUIRK_FF },
> > +       { HID_SPI_DEVICE(USB_VENDOR_ID_MICROSOFT, SPI_DEVICE_ID_MS_SURFACE_G6_0),
> > +               .driver_data = MS_NOHIDINPUT },
> > +       { HID_SPI_DEVICE(USB_VENDOR_ID_MICROSOFT, SPI_DEVICE_ID_MS_SURFACE_G6_1),
> > +               .driver_data = MS_NOHIDINPUT },
> >         { }
> >  };
> >  MODULE_DEVICE_TABLE(hid, ms_devices);
> > diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> > index 51b39bda9a9d..01609e5425b9 100644
> > --- a/drivers/hid/hid-quirks.c
> > +++ b/drivers/hid/hid-quirks.c
> > @@ -506,6 +506,8 @@ static const struct hid_device_id hid_have_special_driver[] = {
> >         { HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_DIGITAL_MEDIA_3KV1) },
> >         { HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_POWER_COVER) },
> >         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_PRESENTER_8K_BT) },
> > +       { HID_SPI_DEVICE(USB_VENDOR_ID_MICROSOFT, SPI_DEVICE_ID_MS_SURFACE_G6_0) },
> > +       { HID_SPI_DEVICE(USB_VENDOR_ID_MICROSOFT, SPI_DEVICE_ID_MS_SURFACE_G6_1) },
>
> This hunk should be dropped if it just works without. If it doesn't
> work without it, we probably need to fix why.
> So, yes, please drop these additions to hid-quirks :)
>
> >  #endif
> >  #if IS_ENABLED(CONFIG_HID_MONTEREY)
> >         { HID_USB_DEVICE(USB_VENDOR_ID_MONTEREY, USB_DEVICE_ID_GENIUS_KB29E) },
> > diff --git a/include/linux/hid.h b/include/linux/hid.h
> > index 9e067f937dbc..32823c6b65f6 100644
> > --- a/include/linux/hid.h
> > +++ b/include/linux/hid.h
> > @@ -684,6 +684,8 @@ struct hid_descriptor {
> >         .bus = BUS_BLUETOOTH, .vendor = (ven), .product = (prod)
> >  #define HID_I2C_DEVICE(ven, prod)                              \
> >         .bus = BUS_I2C, .vendor = (ven), .product = (prod)
> > +#define HID_SPI_DEVICE(ven, prod)                              \
> > +       .bus = BUS_SPI, .vendor = (ven), .product = (prod)
>
> That one should be separated and merged with the first hunk.
>
> Cheers,
> Benjamin
>
> >
> >  #define HID_REPORT_ID(rep) \
> >         .report_type = (rep)
> > --
> > 2.25.1
> >
>
