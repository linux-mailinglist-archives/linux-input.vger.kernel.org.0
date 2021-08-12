Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD5753EA8BD
	for <lists+linux-input@lfdr.de>; Thu, 12 Aug 2021 18:47:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233208AbhHLQsG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Aug 2021 12:48:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46498 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233226AbhHLQsF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Aug 2021 12:48:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628786859;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=GuvHNcPD7tAkZscFNYtEcPPD0X0BanCxV8C9iKBCvB0=;
        b=ggeGyAJA7XMtNhGJku/m0aHCvLPS1PlfyBLG/MnS8MD3buHmI0hxFJD/bDGqCBbQs3COt7
        gMmXk4o2/KnqBPiXB759NEBfSkDZdLN9cUqYhiGns8OQMkv20VE5NKH802k7gwPfssZ7Py
        e36RMAY9yPxzhCmKG+OsoVeE4b5Q7bs=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-LhIyYZNEOOOaseEY-7Wypg-1; Thu, 12 Aug 2021 12:47:38 -0400
X-MC-Unique: LhIyYZNEOOOaseEY-7Wypg-1
Received: by mail-pl1-f199.google.com with SMTP id 5-20020a170902ee45b029012d3a69c6c5so4155120plo.7
        for <linux-input@vger.kernel.org>; Thu, 12 Aug 2021 09:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GuvHNcPD7tAkZscFNYtEcPPD0X0BanCxV8C9iKBCvB0=;
        b=rWzcQnp8DoneASy/Kn28/oxetZ1ZnjAZCwWRvxGqfqu4Vbos7NFucYmU7bwhHXV4C3
         VXDpXJiEU+aWnk382c+nXFv7OAxm9B+1noJPPT5xoavjglksVojqIkwzdPurx+gmRers
         tr4ME1e2+TeXnUFpqrg4QkBfVRKAeNnkVYwq+ZbRQDYo4m2EBZ/0ZH+Hzi0UkQ2eb2vQ
         m1t8UWlkPMn8/PC36pTRdv9ESpoe3I1f6onfolS/Ud+MnYn35Z7YasastN3gM++l7OWl
         9eGiaWOLCxMaU2xGBxSz8tf12ZDGGJ6cPzBUjNoI6X/kO0JU8JLRHJI5MOgkcqopiP/A
         r4Bw==
X-Gm-Message-State: AOAM533kFBYHqR97Z2I4FW53kuax1PfayfkPQN9hNtVj+wreFi52NKLP
        awHgg84iB9+9xpVrkbHxdJ72e2jIBebYx4RUF5mBCTix+gsUqP6YvGRu2Lw1QnUkyGmOg/SeB0D
        Y1iaXfNdH5sRlAj41rgRpxQdlUdpSTwM3AHxsOuo=
X-Received: by 2002:aa7:921a:0:b029:2cf:b55b:9d52 with SMTP id 26-20020aa7921a0000b02902cfb55b9d52mr4880217pfo.35.1628786857568;
        Thu, 12 Aug 2021 09:47:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfxUIaxGGpFqvrJY+i1WzK+q9aO2eBIvEHdx42EM5yqDa7zfSkEZUT2LC+dh7+/MDS6s9SqfSd+MTIvSzRtAE=
X-Received: by 2002:aa7:921a:0:b029:2cf:b55b:9d52 with SMTP id
 26-20020aa7921a0000b02902cfb55b9d52mr4880198pfo.35.1628786857295; Thu, 12 Aug
 2021 09:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210812001250.1709418-1-dmanti@microsoft.com>
In-Reply-To: <20210812001250.1709418-1-dmanti@microsoft.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 12 Aug 2021 18:47:26 +0200
Message-ID: <CAO-hwJK1Jt+T_ZsvPj0=+hEt3XnALfnkmB++Kdk7bZV9FgE0Cg@mail.gmail.com>
Subject: Re: [PATCH] HID: Support Microsoft Surface Duo SPI-based touch
 controller driver as a module.
To:     Dmitry Antipov <daantipov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        felipe.balbi@microsoft.com, jeff.glaum@microsoft.com,
        Dmitry Antipov <dmanti@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Thu, Aug 12, 2021 at 2:13 AM Dmitry Antipov <daantipov@gmail.com> wrote:
>
> Surface Duo uses a touch digitizer that communicates to the main SoC via SPI
> and presents itself as a HID device. This patch contains the changes needed
> for the driver to work as a module: HID Core affordances for SPI devices,
> addition of the new Device IDs, and a new quirk in hid-microsoft. The driver
> itself is being prepared for a submission in the near future.
>
> Signed-off-by: Dmitry Antipov dmanti@microsoft.com

Though I really appreciate seeing a microsoft.com submission, the
commit description makes me wonder if we should not postpone the
inclusion of this patch with the "submission in the near future".

AFAIK, HID is not SPI aware. So basically, we are introducing dead
code in the upstream kernel if we take this patch.

Why is there a special need for us to take this one without the whole series?

Couple of additions to what Felipe said:

> ---
>  drivers/hid/hid-core.c      |  3 +++
>  drivers/hid/hid-ids.h       |  2 ++
>  drivers/hid/hid-microsoft.c | 15 +++++++++++++--
>  drivers/hid/hid-quirks.c    |  2 ++
>  include/linux/hid.h         |  2 ++
>  5 files changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index 7db332139f7d..123a0e3a6b1a 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -2005,6 +2005,9 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
>         case BUS_I2C:
>                 bus = "I2C";
>                 break;
> +       case BUS_SPI:
> +               bus = "SPI";
> +               break;

I'd like to have the SPI specific changes that are touching hid core
in a separate patch, or with the SPI-HID transport layer.

>         case BUS_VIRTUAL:
>                 bus = "VIRTUAL";
>                 break;
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 8f1893e68112..5c181d23a7ae 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -885,6 +885,8 @@
>  #define USB_DEVICE_ID_MS_XBOX_ONE_S_CONTROLLER 0x02fd
>  #define USB_DEVICE_ID_MS_PIXART_MOUSE    0x00cb
>  #define USB_DEVICE_ID_8BITDO_SN30_PRO_PLUS      0x02e0
> +#define SPI_DEVICE_ID_MS_SURFACE_G6_0  0x0c1d
> +#define SPI_DEVICE_ID_MS_SURFACE_G6_1  0x0c42
>
>  #define USB_VENDOR_ID_MOJO             0x8282
>  #define USB_DEVICE_ID_RETRO_ADAPTER    0x3201
> diff --git a/drivers/hid/hid-microsoft.c b/drivers/hid/hid-microsoft.c
> index 071fd093a5f4..50ea1f68c285 100644
> --- a/drivers/hid/hid-microsoft.c
> +++ b/drivers/hid/hid-microsoft.c
> @@ -27,6 +27,7 @@
>  #define MS_DUPLICATE_USAGES    BIT(5)
>  #define MS_SURFACE_DIAL                BIT(6)
>  #define MS_QUIRK_FF            BIT(7)
> +#define MS_NOHIDINPUT          BIT(8)
>
>  struct ms_data {
>         unsigned long quirks;
> @@ -367,6 +368,7 @@ static int ms_probe(struct hid_device *hdev, const struct hid_device_id *id)
>         unsigned long quirks = id->driver_data;
>         struct ms_data *ms;
>         int ret;
> +       unsigned int connect_mask;
>
>         ms = devm_kzalloc(&hdev->dev, sizeof(*ms), GFP_KERNEL);
>         if (ms == NULL)
> @@ -376,20 +378,25 @@ static int ms_probe(struct hid_device *hdev, const struct hid_device_id *id)
>
>         hid_set_drvdata(hdev, ms);
>
> +       connect_mask = HID_CONNECT_DEFAULT | ((quirks & MS_HIDINPUT) ?
> +                       HID_CONNECT_HIDINPUT_FORCE : 0);
> +
>         if (quirks & MS_NOGET)
>                 hdev->quirks |= HID_QUIRK_NOGET;
>
>         if (quirks & MS_SURFACE_DIAL)
>                 hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
>
> +       if (quirks & MS_NOHIDINPUT)
> +               connect_mask &= ~HID_CONNECT_HIDINPUT;
> +
>         ret = hid_parse(hdev);
>         if (ret) {
>                 hid_err(hdev, "parse failed\n");
>                 goto err_free;
>         }
>
> -       ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT | ((quirks & MS_HIDINPUT) ?
> -                               HID_CONNECT_HIDINPUT_FORCE : 0));
> +       ret = hid_hw_start(hdev, connect_mask);
>         if (ret) {
>                 hid_err(hdev, "hw start failed\n");
>                 goto err_free;
> @@ -450,6 +457,10 @@ static const struct hid_device_id ms_devices[] = {
>                 .driver_data = MS_QUIRK_FF },
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_8BITDO_SN30_PRO_PLUS),
>                 .driver_data = MS_QUIRK_FF },
> +       { HID_SPI_DEVICE(USB_VENDOR_ID_MICROSOFT, SPI_DEVICE_ID_MS_SURFACE_G6_0),
> +               .driver_data = MS_NOHIDINPUT },
> +       { HID_SPI_DEVICE(USB_VENDOR_ID_MICROSOFT, SPI_DEVICE_ID_MS_SURFACE_G6_1),
> +               .driver_data = MS_NOHIDINPUT },
>         { }
>  };
>  MODULE_DEVICE_TABLE(hid, ms_devices);
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 51b39bda9a9d..01609e5425b9 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -506,6 +506,8 @@ static const struct hid_device_id hid_have_special_driver[] = {
>         { HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_DIGITAL_MEDIA_3KV1) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_POWER_COVER) },
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_MS_PRESENTER_8K_BT) },
> +       { HID_SPI_DEVICE(USB_VENDOR_ID_MICROSOFT, SPI_DEVICE_ID_MS_SURFACE_G6_0) },
> +       { HID_SPI_DEVICE(USB_VENDOR_ID_MICROSOFT, SPI_DEVICE_ID_MS_SURFACE_G6_1) },

This hunk should be dropped if it just works without. If it doesn't
work without it, we probably need to fix why.
So, yes, please drop these additions to hid-quirks :)

>  #endif
>  #if IS_ENABLED(CONFIG_HID_MONTEREY)
>         { HID_USB_DEVICE(USB_VENDOR_ID_MONTEREY, USB_DEVICE_ID_GENIUS_KB29E) },
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index 9e067f937dbc..32823c6b65f6 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -684,6 +684,8 @@ struct hid_descriptor {
>         .bus = BUS_BLUETOOTH, .vendor = (ven), .product = (prod)
>  #define HID_I2C_DEVICE(ven, prod)                              \
>         .bus = BUS_I2C, .vendor = (ven), .product = (prod)
> +#define HID_SPI_DEVICE(ven, prod)                              \
> +       .bus = BUS_SPI, .vendor = (ven), .product = (prod)

That one should be separated and merged with the first hunk.

Cheers,
Benjamin

>
>  #define HID_REPORT_ID(rep) \
>         .report_type = (rep)
> --
> 2.25.1
>

