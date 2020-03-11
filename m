Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB05D18139E
	for <lists+linux-input@lfdr.de>; Wed, 11 Mar 2020 09:53:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgCKIqW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Mar 2020 04:46:22 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34133 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728146AbgCKIqV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Mar 2020 04:46:21 -0400
Received: by mail-ot1-f68.google.com with SMTP id j16so1124800otl.1
        for <linux-input@vger.kernel.org>; Wed, 11 Mar 2020 01:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=T+VnVUjOH3aAx1YbDaN5DsSnnmcAC0nSmQ0YZuHvz3I=;
        b=pCnLCo+J9n+C8BiYJpqLY4Vk1lKXvk8/APcDVFT/W0ixiyVGP9BfqGu/SdCLRbkv89
         PBckSxkLjwyDJyoMNVCtS7RcgY9D7xSmptJGsxPQBqncmV6BpKlHXBVILH4YvNyWcTj0
         ZqWNAE255RkNPvb5MzpgQJ4bNGYYsMCcUzbCJP88BLaW4k2v0ZLNbT/TOY7oGmBNhRcH
         YOI4JMGDtpeh79FiSBqKgsTzL6Z9vZtQmk6Lqo+dwygKcfnbuu2QkKSE9MrNyrjH2wIO
         xWVAvibaCCDRoS9m8vo5FuOpBWKFkdcNCgL9FYDNsJoLxp/ydtdvJekun5WsmsSeWzOT
         XfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=T+VnVUjOH3aAx1YbDaN5DsSnnmcAC0nSmQ0YZuHvz3I=;
        b=fvphupBbemAvt8VmwgotR1/VubdpxJhI3v8lekuR/IL5iuXql46UmIrbBqsLAQ81w8
         7IdVKKAE4HYGMZjD9yUQBN/Aa5qxKYshrc/tWg2lmkYXzOeRBx7vZBLQnEFd6p8hBOrp
         3eZ1DxdHHDK0v3+q/374+EnYet8MIK3vMwp8j5Dxm8A2K4hpMYPEk0AGRJwTM5Fx7AZ1
         XrwvHPVBxPOyopon/j9QJir7RK4C3SE19s1v5Zz5Q2ZtSUldClBcq68utYyVNmZVHLHS
         LCRNtIznYcLTgoJsKSCcz4Y/Ey/sefcAWXkHGP8weMtyceq56ZYNNvsBldXx35Fcto8J
         V6wg==
X-Gm-Message-State: ANhLgQ2i7H/G/ZwvbHfy0To8PP4Ae2NfYCu+eOlhyQ+LO1I45dOYjHO+
        hWRRqJB9WGz3QqZgl9AWm0TqjjkiimjX1C4KTE8=
X-Google-Smtp-Source: ADFU+vuFvPwfVTd0tFRyFuvrdbVckdVHmfHs/XWiY67Z20S9AvqQeZp+D56x92Uj50Z9CWzI460u78f8z9coVc8VdNk=
X-Received: by 2002:a9d:19ef:: with SMTP id k102mr1510311otk.220.1583916380725;
 Wed, 11 Mar 2020 01:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200308212729.51336-1-sammko@sammserver.com>
In-Reply-To: <20200308212729.51336-1-sammko@sammserver.com>
From:   Silvan Jegen <s.jegen@gmail.com>
Date:   Wed, 11 Mar 2020 09:46:09 +0100
Message-ID: <CAKvUva-5FoJnhNdKaZFgbNgPyKKx8aSThUwFJH5gsz3hnsWdMg@mail.gmail.com>
Subject: Re: [PATCH] HID: Add driver fixing Glorious PC Gaming Race mouse
 report descriptor
To:     =?UTF-8?Q?Samuel_=C4=8Cavoj?= <sammko@sammserver.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

Just one small comment below.

On Sun, Mar 8, 2020 at 10:38 PM Samuel =C4=8Cavoj <sammko@sammserver.com> w=
rote:
>
> The Glorious Model O mice (and also at least the Model O-, which is
> driver-wise the same mouse) have a bug in the descriptor of HID
> Report with ID 2. This report is used for Consumer Control buttons,
> which can be mapped using the provided Windows only software.
>
> Here is an excerpt from the original descriptor:
>
>   INPUT(2)[INPUT]
>     Field(0)
>       Flags( Constant Variable Absolute )
>     Field(1)
>       Flags( Constant Variable Absolute )
>     Field(2)
>       Flags( Constant Variable Absolute )
>
> The issue is the Constant flag specified on all 3 fields, which
> causes the hid driver to ignore changes in these fields and
> essentialy causes the buttons to not work at all. The submitted driver
> patches the descriptor to end up with the following:
>
>   INPUT(2)[INPUT]
>     Field(0)
>       Flags( Variable Relative )
>     Field(1)
>       Flags( Variable Relative )
>     Field(2)
>       Flags( Variable Relative )
>
> The Constant bit is reset and the Relative bit has been set in
> order to prevent repeat events when holding down the button.
> Additionally, the device name is set to "Glorious Model O",
> where the original was "SINOWEALTH Wired Gaming Mouse".
>
> Signed-off-by: Samuel =C4=8Cavoj <sammko@sammserver.com>
> ---
>  drivers/hid/Kconfig        |  9 ++++-
>  drivers/hid/Makefile       |  1 +
>  drivers/hid/hid-glorious.c | 69 ++++++++++++++++++++++++++++++++++++++
>  drivers/hid/hid-ids.h      |  3 ++
>  4 files changed, 81 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/hid/hid-glorious.c
>
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 494a39e74939..1e1f1b16d44d 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -362,6 +362,13 @@ config HID_GFRM
>         ---help---
>         Support for Google Fiber TV Box remote controls
>
> +config HID_GLORIOUS
> +       tristate "Glorious PC Gaming Race mice"
> +       depends on HID
> +       help
> +         Support for Glorious PC Gaming Race mice such as
> +         the Glorious Model O and O-.
> +
>  config HID_HOLTEK
>         tristate "Holtek HID devices"
>         depends on USB_HID
> @@ -892,7 +899,7 @@ config HID_SONY
>           * Logitech Harmony adapter for Sony Playstation 3 (Bluetooth)
>
>  config SONY_FF
> -       bool "Sony PS2/3/4 accessories force feedback support"
> +       bool "Sony PS2/3/4 accessories force feedback support"

This change seems to be completely unrelated and should probably removed.


Cheers,

Silvan



>         depends on HID_SONY
>         select INPUT_FF_MEMLESS
>         ---help---
> diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> index bfefa365b1ce..be0f38dcf942 100644
> --- a/drivers/hid/Makefile
> +++ b/drivers/hid/Makefile
> @@ -48,6 +48,7 @@ obj-$(CONFIG_HID_ELO)         +=3D hid-elo.o
>  obj-$(CONFIG_HID_EZKEY)                +=3D hid-ezkey.o
>  obj-$(CONFIG_HID_GEMBIRD)      +=3D hid-gembird.o
>  obj-$(CONFIG_HID_GFRM)         +=3D hid-gfrm.o
> +obj-$(CONFIG_HID_GLORIOUS)  +=3D hid-glorious.o
>  obj-$(CONFIG_HID_GOOGLE_HAMMER)        +=3D hid-google-hammer.o
>  obj-$(CONFIG_HID_GT683R)       +=3D hid-gt683r.o
>  obj-$(CONFIG_HID_GYRATION)     +=3D hid-gyration.o
> diff --git a/drivers/hid/hid-glorious.c b/drivers/hid/hid-glorious.c
> new file mode 100644
> index 000000000000..c12bf36b8d4c
> --- /dev/null
> +++ b/drivers/hid/hid-glorious.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  USB HID driver for Glorious PC Gaming Race
> + *  Glorious Model O and O- mice.
> + *
> + *  Copyright (c) 2020 Samuel =C4=8Cavoj <sammko@sammserver.com>
> + */
> +
> +/*
> + */
> +
> +#include <linux/hid.h>
> +#include <linux/module.h>
> +
> +#include "hid-ids.h"
> +
> +MODULE_AUTHOR("Samuel =C4=8Cavoj <sammko@sammserver.com>");
> +MODULE_DESCRIPTION("HID driver for Glorious PC Gaming Race mice");
> +
> +/*
> + * Glorious Model O and O- specify the const flag in the consumer input
> + * report descriptor, which leads to inputs being ignored. Fix this
> + * by patching the descriptor.
> + */
> +static __u8 *glorious_report_fixup(struct hid_device *hdev, __u8 *rdesc,
> +               unsigned int *rsize)
> +{
> +       if (*rsize =3D=3D 213 &&
> +               rdesc[84] =3D=3D 129 && rdesc[112] =3D=3D 129 && rdesc[14=
0] =3D=3D 129 &&
> +               rdesc[85] =3D=3D 3   && rdesc[113] =3D=3D 3   && rdesc[14=
1] =3D=3D 3) {
> +               hid_info(hdev, "patching Glorious Model O consumer contro=
l report descriptor\n");
> +               rdesc[85] =3D rdesc[113] =3D rdesc[141] =3D 6;
> +       }
> +       return rdesc;
> +}
> +
> +static int glorious_probe(struct hid_device *hdev,
> +               const struct hid_device_id *id)
> +{
> +       int ret;
> +
> +       hdev->quirks |=3D HID_QUIRK_INPUT_PER_APP;
> +
> +       ret =3D hid_parse(hdev);
> +       if (ret)
> +               return ret;
> +
> +       snprintf(hdev->name, sizeof(hdev->name), "%s", "Glorious Model O"=
);
> +
> +       return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> +}
> +
> +static const struct hid_device_id glorious_devices[] =3D {
> +       { HID_USB_DEVICE(USB_VENDOR_ID_GLORIOUS,
> +               USB_DEVICE_ID_GLORIOUS_MODEL_O) },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(hid, glorious_devices);
> +
> +static struct hid_driver glorious_driver =3D {
> +       .name =3D "glorious",
> +       .id_table =3D glorious_devices,
> +       .probe =3D glorious_probe,
> +       .report_fixup =3D glorious_report_fixup
> +};
> +
> +module_hid_driver(glorious_driver);
> +
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 3a400ce603c4..3256ac6953fc 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -464,6 +464,9 @@
>  #define USB_DEVICE_ID_GENERAL_TOUCH_WIN8_PIT_010A 0x010a
>  #define USB_DEVICE_ID_GENERAL_TOUCH_WIN8_PIT_E100 0xe100
>
> +#define USB_VENDOR_ID_GLORIOUS  0x258a
> +#define USB_DEVICE_ID_GLORIOUS_MODEL_O 0x0036
> +
>  #define I2C_VENDOR_ID_GOODIX           0x27c6
>  #define I2C_DEVICE_ID_GOODIX_01F0      0x01f0
>
> --
> 2.25.1
>
