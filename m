Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18E4614ECFB
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2020 14:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728514AbgAaNLC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jan 2020 08:11:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38856 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728570AbgAaNLC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jan 2020 08:11:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580476259;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YeWz6wTqFB6jQf92ES3Y1G07wFjIIFkK1UQrDoIRD8I=;
        b=aB6Vjt9TLQ8ZqIBLeBL/Fc25V7hfp8TWF7QVK8iK5D9s18Phto3QFZ9wGsz8w98Qv7ye17
        ppbGYSzp1ElIHAjeT3rZX+4HsndUZsIhth1WZGHilFuwi7bQGYtRo3a78eFskKQnlciILj
        jmQPQRNkhkNIExv+84gNkBJ6SbmNqfU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-r8H1EFF4PqSWNh6GxrlluA-1; Fri, 31 Jan 2020 08:10:53 -0500
X-MC-Unique: r8H1EFF4PqSWNh6GxrlluA-1
Received: by mail-qk1-f200.google.com with SMTP id 12so3990996qkf.20
        for <linux-input@vger.kernel.org>; Fri, 31 Jan 2020 05:10:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YeWz6wTqFB6jQf92ES3Y1G07wFjIIFkK1UQrDoIRD8I=;
        b=LqBhKpsCw6/Vr3yeblzZeHcg0Av4FzEmGxA3VKTLMA0e/Ano9MUkEkPa5Oirv7ySMg
         4tFycxWyZO6Vk4ZhgY6kID1P1X6D+hcYLkLWB9AL0FWykX/2xlcI4OGhl0s53sAbgYQv
         RTo4chdpG3snpVCaIezlas3DqSWgkoibBAvm9ZnoEKaT2i8Xd5Vk246MhWgqeasI5bEj
         5vuZrbSTalrUQmWzLDP+TdZlLU5K1T72JfT5/YUu/69S8Dhwrk52TcLJJolNskr+S9LV
         8+V9hhp+8zXKrjjL0Hz/eyxxd0ky1D1MKVbZpdzH3xV2jB+y/Xsqx1gfFlyAyWbIcLic
         k2wg==
X-Gm-Message-State: APjAAAVvpw+SzX4O6n6NXPLW/F256A/AuRB/JLQnySTNrXcU0Sv+qbyl
        AfRPg5YdVNSoE0EYo3Ih9ch7dwTbaq8GZjyrW9qWwdNalAXNLjKHVdLtZK0eJhjkWvLFXm8eOzk
        g+tmOL5T0VK1uWSVALguVTV1NhSrJUoNE79LVlzE=
X-Received: by 2002:a05:620a:1502:: with SMTP id i2mr10502627qkk.230.1580476253115;
        Fri, 31 Jan 2020 05:10:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqw7+G5+GyafcDPDea7m0XyHvK8A5bW8xHgHFQQbdfosXUhubg+U4ToOyfTHiv9GjCc3Hd3/dBMfvN7LoYOkwog=
X-Received: by 2002:a05:620a:1502:: with SMTP id i2mr10502597qkk.230.1580476252769;
 Fri, 31 Jan 2020 05:10:52 -0800 (PST)
MIME-Version: 1.0
References: <20200131124553.27796-1-hdegoede@redhat.com>
In-Reply-To: <20200131124553.27796-1-hdegoede@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 31 Jan 2020 14:10:41 +0100
Message-ID: <CAO-hwJK-wwZ8UJRaBgjVc0ZXakU9C3eDbh+i6Q5vm8xh1P76LQ@mail.gmail.com>
Subject: Re: [PATCH] HID: ite: Only bind to keyboard USB interface on Acer
 SW5-012 keyboard dock
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        "3.8+" <stable@vger.kernel.org>,
        =?UTF-8?Q?Zden=C4=9Bk_Rampas?= <zdenda.rampas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Fri, Jan 31, 2020 at 1:46 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Commit 8f18eca9ebc5 ("HID: ite: Add USB id match for Acer SW5-012 keyboar=
d
> dock") added the USB id for the Acer SW5-012's keyboard dock to the
> hid-ite driver to fix the rfkill driver not working.
>
> Most keyboard docks with an ITE 8595 keyboard/touchpad controller have th=
e
> "Wireless Radio Control" bits which need the special hid-ite driver on th=
e
> second USB interface (the mouse interface) and their touchpad only suppor=
ts
> mouse emulation, so using generic hid-input handling for anything but
> the "Wireless Radio Control" bits is fine. On these devices we simply bin=
d
> to all USB interfaces.
>
> But unlike other ITE8595 using keyboard docks, the Acer Aspire Switch 10
> (SW5-012)'s touchpad not only does mouse emulation it also supports
> HID-multitouch and all the keys including the "Wireless Radio Control"
> bits have been moved to the first USB interface (the keyboard intf).
>
> So we need hid-ite to handle the first (keyboard) USB interface and have
> it NOT bind to the second (mouse) USB interface so that that can be
> handled by hid-multitouch.c and we get proper multi-touch support.
>
> This commit adds a match callback to hid-ite which makes it only
> match the first USB interface when running on the Acer SW5-012,
> fixing the regression to mouse-emulation mode introduced by adding the
> keyboard dock USB id.
>
> Note the match function only does the special only bind to the first
> USB interface on the Acer SW5-012, on other devices the hid-ite driver
> actually must bind to the second interface as that is where the
> "Wireless Radio Control" bits are.

This is not a full review, but a couple of things that popped out
while scrolling through the patch.

>
> Cc: stable@vger.kernel.org
> Fixes: 8f18eca9ebc5 ("HID: ite: Add USB id match for Acer SW5-012 keyboar=
d dock")
> Reported-by: Zden=C4=9Bk Rampas <zdenda.rampas@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/hid-ite.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/drivers/hid/hid-ite.c b/drivers/hid/hid-ite.c
> index c436e12feb23..69a4ddfd033d 100644
> --- a/drivers/hid/hid-ite.c
> +++ b/drivers/hid/hid-ite.c
> @@ -8,9 +8,12 @@
>  #include <linux/input.h>
>  #include <linux/hid.h>
>  #include <linux/module.h>
> +#include <linux/usb.h>
>
>  #include "hid-ids.h"
>
> +#define ITE8595_KBD_USB_INTF           0
> +
>  static int ite_event(struct hid_device *hdev, struct hid_field *field,
>                      struct hid_usage *usage, __s32 value)
>  {
> @@ -37,6 +40,36 @@ static int ite_event(struct hid_device *hdev, struct h=
id_field *field,
>         return 0;
>  }
>
> +static bool ite_match(struct hid_device *hdev, bool ignore_special_drive=
r)
> +{
> +       struct usb_interface *intf;
> +
> +       if (ignore_special_driver)
> +               return false;
> +
> +       /*
> +        * Most keyboard docks with an ITE 8595 keyboard/touchpad control=
ler
> +        * have the "Wireless Radio Control" bits which need this special
> +        * driver on the second USB interface (the mouse interface). On
> +        * these devices we simply bind to all USB interfaces.
> +        *
> +        * The Acer Aspire Switch 10 (SW5-012) is special, its touchpad
> +        * not only does mouse emulation it also supports HID-multitouch
> +        * and all the keys including the "Wireless Radio Control" bits
> +        * have been moved to the first USB interface (the keyboard intf)=
.
> +        *
> +        * We want the hid-multitouch driver to bind to the touchpad, so =
on
> +        * the Acer SW5-012 we should only bind to the keyboard USB intf.
> +        */
> +       if (hdev->bus !=3D BUS_USB || hdev->vendor !=3D USB_VENDOR_ID_SYN=
APTICS ||
> +                    hdev->product !=3D USB_DEVICE_ID_SYNAPTICS_ACER_SWIT=
CH5_012)

Isn't there an existing matching function we can use here, instead of
checking each individual field?

> +               return true;
> +
> +       intf =3D to_usb_interface(hdev->dev.parent);

And this is oops-prone. You need:
- ensure hid_is_using_ll_driver(hdev, &usb_hid_driver) returns true.
- add a dependency on USBHID in the KConfig now that you are checking
on the USB transport layer.

That being said, I would love instead:
- to have a non USB version of this match, where you decide which
component needs to be handled based on the report descriptor
- have a regression test in
https://gitlab.freedesktop.org/libevdev/hid-tools for this particular
device, because I never intended the .match callback to be used by
anybody else than hid-generic, and opening this can of worms is prone
to introduce regressions in the future.

easy, no? :)

Cheers,
Benjamin

> +
> +       return intf->altsetting->desc.bInterfaceNumber =3D=3D ITE8595_KBD=
_USB_INTF;
> +}
> +
>  static const struct hid_device_id ite_devices[] =3D {
>         { HID_USB_DEVICE(USB_VENDOR_ID_ITE, USB_DEVICE_ID_ITE8595) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_258A, USB_DEVICE_ID_258A_6A88) },
> @@ -50,6 +83,7 @@ MODULE_DEVICE_TABLE(hid, ite_devices);
>  static struct hid_driver ite_driver =3D {
>         .name =3D "itetech",
>         .id_table =3D ite_devices,
> +       .match =3D ite_match,
>         .event =3D ite_event,
>  };
>  module_hid_driver(ite_driver);
> --
> 2.23.0
>

