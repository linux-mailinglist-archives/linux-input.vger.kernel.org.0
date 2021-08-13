Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93BA43EB1FF
	for <lists+linux-input@lfdr.de>; Fri, 13 Aug 2021 09:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234844AbhHMHyE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Aug 2021 03:54:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42313 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232642AbhHMHyE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Aug 2021 03:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628841216;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=v4LUjz9QUhjADV7glqPhKE5n8n5Aj9FWeuP6z2JDw5s=;
        b=bmKhTi0N6j85CItd9kzzXcBSp7gHkKoWsIcTrnJJmJglr12fjtoUgAtNN82H3t/ssKF4bV
        Q9eeQnE3f71f9E9c14b7YSsTe+SjTJEDmc8BwH3y1/axgChJ2DSjDJ5jgOUkJTUCOUvjT4
        QDis1+dN2fsdj+QU88fv8Ms4gzpo2BQ=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-8BkV08MLNc6Zm_ya339myQ-1; Fri, 13 Aug 2021 03:53:35 -0400
X-MC-Unique: 8BkV08MLNc6Zm_ya339myQ-1
Received: by mail-pj1-f69.google.com with SMTP id d35-20020a17090a6f26b0290178ab46154dso6236611pjk.3
        for <linux-input@vger.kernel.org>; Fri, 13 Aug 2021 00:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v4LUjz9QUhjADV7glqPhKE5n8n5Aj9FWeuP6z2JDw5s=;
        b=Ta5d4TzMgZfb0SE7p+cyAmP5jZAOQNQwkh4zajsCX1aIie9V7H8zZZgAU8hPDYekFp
         Q810vZ+xS4NTO6WDJZQkc7y45MWhAOg0kWO4zemcrUrMDAfZ9JEF1ipl0QtqnuNzF5H6
         zoW9CEEoPj+mMm2c0IkrJxiWArzUlrZQbf7COikRWbn8mTH/kGYHrREO830w3iv/uJOr
         caDhxIiSX5F17rHJOjRSrbBbIiB8K4PRzrGw7Mkph2r/NwKmNaAhq6y7uqOBYhUZNJd3
         ZElk94jSbtbYE8PYvCIW2p2Xb/bRZTLyVApsEToNSOYU7ofk8AKXOxAY9gF3gDdpFNqB
         xCgA==
X-Gm-Message-State: AOAM5317y+x/nl21AXvMQh12hUIugx+wRyWRbemXci0Ph2Ilvnzgoj88
        IDjY69hFVFtuF1iaWKjPnNpqBBoDNBQMjoAncCT+sRmw03psE4irpmz5Xpx4yM0TBvBvNiEEYml
        jDm51kxYmHutQztCxB9ihQi3lerPrPFy7fMOfTTQ=
X-Received: by 2002:a17:902:6ac1:b029:12c:e955:c9f9 with SMTP id i1-20020a1709026ac1b029012ce955c9f9mr1074040plt.32.1628841214618;
        Fri, 13 Aug 2021 00:53:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzz59KNYboSC4HADOC37rnJEZrbDxD8Ag3KE2mcEqMDvjoY6FPh4yDdxYiaBZrP4QsHf2EpmnSrGZRFSt26Lus=
X-Received: by 2002:a17:902:6ac1:b029:12c:e955:c9f9 with SMTP id
 i1-20020a1709026ac1b029012ce955c9f9mr1074024plt.32.1628841214388; Fri, 13 Aug
 2021 00:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210812001250.1709418-1-dmanti@microsoft.com>
In-Reply-To: <20210812001250.1709418-1-dmanti@microsoft.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 13 Aug 2021 09:53:23 +0200
Message-ID: <CAO-hwJ+saS7yffMt553gYaOZsrsiN93_JOeEmE4kNxF4zxU8OA@mail.gmail.com>
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

I made a second pass at this, and I have a few more comments.

On Thu, Aug 12, 2021 at 2:13 AM Dmitry Antipov <daantipov@gmail.com> wrote:
>
> Surface Duo uses a touch digitizer that communicates to the main SoC via SPI
> and presents itself as a HID device. This patch contains the changes needed
> for the driver to work as a module: HID Core affordances for SPI devices,
> addition of the new Device IDs, and a new quirk in hid-microsoft. The driver
> itself is being prepared for a submission in the near future.
>
> Signed-off-by: Dmitry Antipov dmanti@microsoft.com
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

I think it would be clearer to group all connect_mask together, and
remove the '?' which hides a bit what we expect to have.

How about?:
---
+       connect_mask = HID_CONNECT_DEFAULT;
+       if (quirks & MS_HIDINPUT)
+              connect_mask |= HID_CONNECT_HIDINPUT_FORCE;
+       if (quirks & MS_NOHIDINPUT)
+              connect_mask &= ~HID_CONNECT_HIDINPUT;
+
+       ret = hid_hw_start(hdev, connect_mask);
---

Cheers,
Benjamin

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
>
>  #define HID_REPORT_ID(rep) \
>         .report_type = (rep)
> --
> 2.25.1
>

