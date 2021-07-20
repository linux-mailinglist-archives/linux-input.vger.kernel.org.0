Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0B43CF5E2
	for <lists+linux-input@lfdr.de>; Tue, 20 Jul 2021 10:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232806AbhGTHd0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Jul 2021 03:33:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25555 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232453AbhGTHcB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Jul 2021 03:32:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626768758;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gMMS5Nyp1gty+GDyH7M3faltrXcJNNb3kv+Uj+W2Bzs=;
        b=W7EzwY6tgcEBer13sZpOHdmmZD3Q359CiqKe1ghtXPz4Gy6jo3cAD7lqtarIsd+0q0R2Ab
        aO8D7/D1mgZ3OZF7Ib1RkMhHJ7vB2SerseYtFi13I2AZeV3MDxu+ByL1A7GE5S4zfMBMqf
        vgvwnijGuFeGYqTNpHlbaDVXHIyb054=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-z1YYXoRkPRea7TuESOlfPQ-1; Tue, 20 Jul 2021 04:12:36 -0400
X-MC-Unique: z1YYXoRkPRea7TuESOlfPQ-1
Received: by mail-pf1-f200.google.com with SMTP id 15-20020aa7924f0000b029033034a332ecso15637875pfp.16
        for <linux-input@vger.kernel.org>; Tue, 20 Jul 2021 01:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gMMS5Nyp1gty+GDyH7M3faltrXcJNNb3kv+Uj+W2Bzs=;
        b=ZuBqQxoKZe4k/PBgRLY+IiDAkYs6owSxUTySowmKCNlmyzTouG9D2x6QOAv93n+y7t
         XfniSpTkA68tyUd9EQe4X91VIfn2zznutDFNpMWtiGAd7YplimrYfg6hTmhcrMiizfRU
         7I84i8FbKks5nh0DqvckGYOobAS0D4LQaSuwvlEJCmB+gb69tBIY7XsGJskhnkEoZL0D
         Y6zJ3WBRJlQcSzSXc4JJ2vu9C57HPMLhyuMYxX9dqgBFmi9VLMlRc6Y8IZjXW9F1lF+H
         CvqZXaRi2OE68vDOIiNuLJb75ubJprpT/GoNtL94JCve0YcDTg5HH5YQyiGwLWwetALM
         Sd5A==
X-Gm-Message-State: AOAM532NwVs77dxTcFGBjOJn7gMuWYEkP09osL7OmMyk9MELqUOnqmTl
        /QACXFeqBhrdqT1OQ8yGoTXVfSCpk3ZdSBgYxUb/KKlI5Dnm5Mcf4ectNRshUmnWX1xZ4UBS4h7
        0eCPVXqcA5rRyyl5/yJWnTSO2Q2MNZxKJWefkC+o=
X-Received: by 2002:a05:6a00:bd3:b029:329:3e4f:eadb with SMTP id x19-20020a056a000bd3b02903293e4feadbmr30123632pfu.44.1626768755703;
        Tue, 20 Jul 2021 01:12:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx30wUbR3ZbkrRujufBm831KX8L1CnejyUseOrJxJgmHifMLp8k08WpoKQngJ4PWubxc4cXuMsbbYyzAH9MbGQ=
X-Received: by 2002:a05:6a00:bd3:b029:329:3e4f:eadb with SMTP id
 x19-20020a056a000bd3b02903293e4feadbmr30123613pfu.44.1626768755482; Tue, 20
 Jul 2021 01:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210704104906.78490-1-linux@weissschuh.net>
In-Reply-To: <20210704104906.78490-1-linux@weissschuh.net>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 20 Jul 2021 10:12:24 +0200
Message-ID: <CAO-hwJLtUNUZuix08DndOpQ7Z9bYj+G0V-zyCxmr_tRgQPROkw@mail.gmail.com>
Subject: Re: [PATCH] HID: add cmedia-fixup driver
To:     =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.or>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jul 4, 2021 at 12:49 PM Thomas Wei=C3=9Fschuh <linux@weissschuh.net=
> wrote:
>
> This driver provides HID fixups for CMedia audio chips.
> For now this enables the recognition of the microphone mute button for th=
e
> HS-100B.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
>  drivers/hid/Kconfig            |  6 +++
>  drivers/hid/Makefile           |  1 +
>  drivers/hid/hid-cmedia-fixup.c | 82 ++++++++++++++++++++++++++++++++++
>  drivers/hid/hid-ids.h          |  1 +
>  drivers/hid/hid-quirks.c       |  3 ++
>  5 files changed, 93 insertions(+)
>  create mode 100644 drivers/hid/hid-cmedia-fixup.c
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 160554903ef9..5e139c93f75a 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -264,6 +264,12 @@ config HID_CMEDIA
>         help
>         Support for CMedia CM6533 HID audio jack controls.
>
> +config HID_CMEDIA_FIXUP
> +       tristate "CMedia hid fixup"
> +       depends on HID
> +       help
> +       Fixups for CMedia based audio chips.
> +
>  config HID_CP2112
>         tristate "Silicon Labs CP2112 HID USB-to-SMBus Bridge support"
>         depends on USB_HID && HIDRAW && I2C && GPIOLIB
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index 1ea1a7c0b20f..66d6b06ce4d2 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_HID_BIGBEN_FF)   +=3D hid-bigbenff.o
>  obj-$(CONFIG_HID_CHERRY)       +=3D hid-cherry.o
>  obj-$(CONFIG_HID_CHICONY)      +=3D hid-chicony.o
>  obj-$(CONFIG_HID_CMEDIA)       +=3D hid-cmedia.o
> +obj-$(CONFIG_HID_CMEDIA_FIXUP) +=3D hid-cmedia-fixup.o
>  obj-$(CONFIG_HID_CORSAIR)      +=3D hid-corsair.o
>  obj-$(CONFIG_HID_COUGAR)       +=3D hid-cougar.o
>  obj-$(CONFIG_HID_CP2112)       +=3D hid-cp2112.o
> diff --git a/drivers/hid/hid-cmedia-fixup.c b/drivers/hid/hid-cmedia-fixu=
p.c
> new file mode 100644
> index 000000000000..c9a984ea6f0a
> --- /dev/null
> +++ b/drivers/hid/hid-cmedia-fixup.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * HID driver containing fixups for CMedia audio chips.
> + *
> + * Copyright (C) 2021 Thomas Wei=C3=9Fschuh <thomas@weissschuh.net>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/hid.h>
> +#include <linux/module.h>
> +#include "hid-ids.h"
> +
> +#define HS100B_RDESC_ORIG_SIZE 60
> +
> +/* Fixed report descriptor of HS-100B audio chip
> + * Bit 4 is an abolute Microphone mute usage instead of being unassigned=
.
> + */
> +static __u8 hs100b_rdesc_fixed[] =3D {
> +       0x05, 0x0C,         /*  Usage Page (Consumer),          */
> +       0x09, 0x01,         /*  Usage (Consumer Control),       */
> +       0xA1, 0x01,         /*  Collection (Application),       */
> +       0x15, 0x00,         /*      Logical Minimum (0),        */
> +       0x25, 0x01,         /*      Logical Maximum (1),        */
> +       0x09, 0xE9,         /*      Usage (Volume Inc),         */
> +       0x09, 0xEA,         /*      Usage (Volume Dec),         */
> +       0x75, 0x01,         /*      Report Size (1),            */
> +       0x95, 0x02,         /*      Report Count (2),           */
> +       0x81, 0x02,         /*      Input (Variable),           */
> +       0x09, 0xE2,         /*      Usage (Mute),               */
> +       0x95, 0x01,         /*      Report Count (1),           */
> +       0x81, 0x06,         /*      Input (Variable, Relative), */
> +       0x05, 0x0B,         /*      Usage Page (Telephony),     */
> +       0x09, 0x2F,         /*      Usage (2Fh),                */
> +       0x81, 0x02,         /*      Input (Variable),           */
> +       0x09, 0x20,         /*      Usage (20h),                */
> +       0x81, 0x06,         /*      Input (Variable, Relative), */
> +       0x05, 0x0C,         /*      Usage Page (Consumer),      */
> +       0x09, 0x00,         /*      Usage (00h),                */
> +       0x95, 0x03,         /*      Report Count (3),           */
> +       0x81, 0x02,         /*      Input (Variable),           */
> +       0x26, 0xFF, 0x00,   /*      Logical Maximum (255),      */
> +       0x09, 0x00,         /*      Usage (00h),                */
> +       0x75, 0x08,         /*      Report Size (8),            */
> +       0x95, 0x03,         /*      Report Count (3),           */
> +       0x81, 0x02,         /*      Input (Variable),           */
> +       0x09, 0x00,         /*      Usage (00h),                */
> +       0x95, 0x04,         /*      Report Count (4),           */
> +       0x91, 0x02,         /*      Output (Variable),          */
> +       0xC0                /*  End Collection                  */
> +};
> +
> +static __u8 *cmhid_fixup_report_fixup(struct hid_device *hdev, __u8 *rde=
sc,
> +                                     unsigned int *rsize)
> +{
> +       switch (hdev->product) {
> +       case USB_DEVICE_ID_CMEDIA_HS100B:
> +               if (*rsize =3D=3D HS100B_RDESC_ORIG_SIZE) {
> +                       hid_info(hdev, "Fixing CMedia HS-100B report desc=
riptor\n");
> +                       rdesc =3D hs100b_rdesc_fixed;
> +                       *rsize =3D sizeof(hs100b_rdesc_fixed);
> +               }
> +               break;
> +       }
> +       return rdesc;
> +}
> +
> +static const struct hid_device_id cmhid_fixup_devices[] =3D {
> +       { HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CMEDIA_HS100=
B) },
> +       { }
> +};
> +
> +static struct hid_driver cmhid_fixup_driver =3D {
> +       .name =3D "cmedia_fixups",
> +       .id_table =3D cmhid_fixup_devices,
> +       .report_fixup =3D cmhid_fixup_report_fixup,
> +};
> +module_hid_driver(cmhid_fixup_driver);
> +
> +MODULE_DEVICE_TABLE(hid, cmhid_fixup_devices);
> +MODULE_AUTHOR("Thomas Wei=C3=9Fschuh <thomas@weissschuh.net>");
> +MODULE_DESCRIPTION("CMedia HID fixup");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 8f1893e68112..6864e4e6ac8b 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -292,6 +292,7 @@
>
>  #define USB_VENDOR_ID_CMEDIA           0x0d8c
>  #define USB_DEVICE_ID_CM109            0x000e
> +#define USB_DEVICE_ID_CMEDIA_HS100B    0x0014
>  #define USB_DEVICE_ID_CM6533           0x0022
>
>  #define USB_VENDOR_ID_CODEMERCS                0x07c0
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 51b39bda9a9d..7776aa13ee27 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -346,6 +346,9 @@ static const struct hid_device_id hid_have_special_dr=
iver[] =3D {
>  #if IS_ENABLED(CONFIG_HID_CMEDIA)
>         { HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CM6533) },
>  #endif
> +#if IS_ENABLED(CONFIG_HID_CMEDIA_FIXUP)
> +       { HID_USB_DEVICE(USB_VENDOR_ID_CMEDIA, USB_DEVICE_ID_CMEDIA_HS100=
B) },
> +#endif

FWIW, this hunk should be dropped entirely if the driver works without it.

Cheers,
Benjamin

>  #if IS_ENABLED(CONFIG_HID_CORSAIR)
>         { HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_K90=
) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_CORSAIR, USB_DEVICE_ID_CORSAIR_GLA=
IVE_RGB) },
>
> base-commit: df04fbe8680bfe07f3d7487eccff9f768bb02533
> --
> 2.32.0
>

