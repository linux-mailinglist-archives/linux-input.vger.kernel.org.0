Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB1FA139EBA
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2020 02:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729153AbgANBGM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 20:06:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35094 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728896AbgANBGM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 20:06:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578963970;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pcPgHMjbM1tTuJs57rpRm00UDVEplEHbWgFk0hTeOZ4=;
        b=hV5nmls0y+UjjLdXrdHioATIafPa74aOEh3qZHQJvgy5NC7qEDePpvhwg5hdNV3a2liUXr
        NmAh3TeJFoNw8tYD7ZNmETxkud3jxtY1S+9MR/TiJo4DuibrIH4CynbsIr0Ja+UMrWz5fn
        hfhrY0AeLkUhtu80W49bSBmGLgjeamI=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-8PLzc5h4MQqROY_aihn4Ug-1; Mon, 13 Jan 2020 20:06:08 -0500
X-MC-Unique: 8PLzc5h4MQqROY_aihn4Ug-1
Received: by mail-qt1-f199.google.com with SMTP id b7so7890427qtg.23
        for <linux-input@vger.kernel.org>; Mon, 13 Jan 2020 17:06:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pcPgHMjbM1tTuJs57rpRm00UDVEplEHbWgFk0hTeOZ4=;
        b=mknvF30kiN3HS/ak7lnkSTOpQlIDbJ7vsLapoGUgdDl5G8Mg7OJD6zVRQEDRUC8SbJ
         L8lCNT5SeDPHSSN4Z22Rdgo7ToQX7njcGhT7jOZFuZt+9NF9FVznEo7Lb0MoVMIvK8QV
         dPssymwybpjAhIIuqtoxoBw9drGVQEOO0GFuPHg8ss8W2l6Ee1saFNmfSB9zx24318UR
         uv8xXXI8lKmDyDz+36hmt7ryyBbGl62x1eKiEct2vv8gm07qQxOhaqYDGVZLEKMQvK7t
         eY+TducdWkYQlste1t4c+GIOY0ToLchplpO2P1gELI+AhMphO4ovVMgzNJeolWOveSrv
         kyCw==
X-Gm-Message-State: APjAAAXbGhtQHrawd+8hcCq0IO87FerRMbPDgOqo+xS/AiSjNQ4lvDMS
        D/uQXZdjO3jVV/VJY9QBH2dwS6TDCFSESRdnYCb1l+aY+UO4VefxJampmXjBO5mv76xLvuejaXl
        fRqJ2r6vQgWodnU+iRUJVtzJ0hvxxmKe/1tT5zsA=
X-Received: by 2002:a37:a086:: with SMTP id j128mr14135969qke.459.1578963968132;
        Mon, 13 Jan 2020 17:06:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqzFgUVJ57OMm6qYtoPN41WVqMHNymaDdu9B+b9YyZZgWZjfQ9S0NylFBVceVMYo3g/DIWX4riFinR12zotGq5c=
X-Received: by 2002:a37:a086:: with SMTP id j128mr14135942qke.459.1578963967884;
 Mon, 13 Jan 2020 17:06:07 -0800 (PST)
MIME-Version: 1.0
References: <20200112220612.3448741-1-lains@archlinux.org>
In-Reply-To: <20200112220612.3448741-1-lains@archlinux.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 14 Jan 2020 21:03:30 +1000
Message-ID: <CAO-hwJJJYRc8_kRiGGu9E4Dx-WpSADro4b28D8QoE87FBUTnOA@mail.gmail.com>
Subject: Re: [PATCH v2] HID: logitech-hidpp: add support for the Powerplay mat/receiver
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Filipe,

On Mon, Jan 13, 2020 at 8:07 AM Filipe La=C3=ADns <lains@archlinux.org> wro=
te:
>
> The Logitech G Powerplay has a lightspeed receiver with a static HID++
> device with ID 7 attached to it to. It is used to configure the led on
> the mat. For this reason I increased the max number of devices.
>
> I also marked all lightspeed devices as HID++ compatible. As the
> internal powerplay device does not have REPORT_TYPE_KEYBOARD or
> REPORT_TYPE_MOUSE it was not being marked as HID++ compatible in
> logi_hidpp_dev_conn_notif_equad.
>
> Signed-off-by: Filipe La=C3=ADns <lains@archlinux.org>
> ---
>  drivers/hid/hid-logitech-dj.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.=
c
> index bb50d6e7745b..732380b55b15 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -16,11 +16,11 @@
>  #include <asm/unaligned.h>
>  #include "hid-ids.h"
>
> -#define DJ_MAX_PAIRED_DEVICES                  6
> +#define DJ_MAX_PAIRED_DEVICES                  7
>  #define DJ_MAX_NUMBER_NOTIFS                   8
>  #define DJ_RECEIVER_INDEX                      0
>  #define DJ_DEVICE_INDEX_MIN                    1
> -#define DJ_DEVICE_INDEX_MAX                    6
> +#define DJ_DEVICE_INDEX_MAX                    7
>
>  #define DJREPORT_SHORT_LENGTH                  15
>  #define DJREPORT_LONG_LENGTH                   32
> @@ -971,7 +971,7 @@ static void logi_hidpp_recv_queue_notif(struct hid_de=
vice *hdev,
>         case 0x0c:
>                 device_type =3D "eQUAD Lightspeed 1";
>                 logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report, &work=
item);
> -               workitem.reports_supported |=3D STD_KEYBOARD;
> +               workitem.reports_supported |=3D STD_KEYBOARD | HIDPP;

This feels wrong. The whole initial code was hack-ish, and now this is
even more hack-ish.

I don't have a simple solution right now (at a conference this week),
but I will need to be convinced this is the only sane solution :/

Cheers,
Benjamin

>                 break;
>         case 0x0d:
>                 device_type =3D "eQUAD Lightspeed 1_1";
> @@ -1850,6 +1850,10 @@ static const struct hid_device_id logi_dj_receiver=
s[] =3D {
>           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
>                 USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1),
>          .driver_data =3D recvr_type_gaming_hidpp},
> +       { /* Logitech powerplay mat/receiver (0xc539) */
> +         HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> +               0xc53a),
> +        .driver_data =3D recvr_type_gaming_hidpp},
>         { /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
>           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_MX3000_REC=
EIVER),
>          .driver_data =3D recvr_type_27mhz},
> --
> 2.24.1
>

