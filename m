Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8FC132814B
	for <lists+linux-input@lfdr.de>; Mon,  1 Mar 2021 15:49:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236578AbhCAOs1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Mar 2021 09:48:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49978 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236569AbhCAOsH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Mar 2021 09:48:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614609993;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VJu+0xRzX8dW8f5MmX386uG53+FOz/FIJoLfVMtnB30=;
        b=MqTOEhX20IYX9Qc2Pd7nI40sBB70zfs7n56YVDi3H3JZIOuBOZcrCDy2IGIIMVaDHufEu+
        GElyeLuzrNbLjFhRDkfGT8RQncj8FaZ1Fd4TMLrbfCUYZVDWfQyCa9dpQA1Bs6y15irOA2
        h0ERjjGcUlGj+uuMINDh7S1chmgG09Y=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-4kgOgRNlOZqgoIxi7JrggQ-1; Mon, 01 Mar 2021 09:46:24 -0500
X-MC-Unique: 4kgOgRNlOZqgoIxi7JrggQ-1
Received: by mail-pl1-f200.google.com with SMTP id f10so980459plt.6
        for <linux-input@vger.kernel.org>; Mon, 01 Mar 2021 06:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VJu+0xRzX8dW8f5MmX386uG53+FOz/FIJoLfVMtnB30=;
        b=nqaO2vx6gmp+A9l69SmfR0QPMGwzCkElAw5y0cu6jCKAbvG7E/grCVWvbPqCmrW2Fs
         RlxZ7lMI9dB2vS2u3KE30k6kJTvTvb7a+BG+kD/rB1jXxDQ5HHZUymjKlcviadEaDiSb
         hLo4IXdOFolreSqypeNLwRrXQanSZTiC5VwxZm54gLeV0HwRJLhcxc67ALDsgKU5SMMC
         z3rtwcFPT5GFm9NUDPry5LZvzoNHP0N2A4gnXBH6Pn4lfyt9BltsPgyQUjB1v3JUeTAs
         GbQ9tDSic6i+sU8cJa0ZtqyKwri4MzbCDZpKJG5lJGVZK4M5s7Sc5tUAnCu9D7GgtvLw
         UyxQ==
X-Gm-Message-State: AOAM5319YksR+KyfiZQHEGT+zRLMrubuD4IO2ibkV9QOf7bEjP9hAvxk
        44dY69LlPfaUUMxnDG8UeyME1Lexc47geex6VONzUuTXJ1Zhb+QKu18IIUTlVTR8+NQqox8viGi
        e8Afim7gX1r9/qsRyAE+QFV7PMpIrANjqPp6e8kw=
X-Received: by 2002:a17:902:9b91:b029:e2:898c:d721 with SMTP id y17-20020a1709029b91b02900e2898cd721mr15973676plp.32.1614609982793;
        Mon, 01 Mar 2021 06:46:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5+3xi5NcVVVbw6DcEuEhe4KXXDIJAtP4PYSZb086wEngcQ2wTckwR/1SA/5V1nq9dE82agTVRGyXYhu/eLRU=
X-Received: by 2002:a17:902:9b91:b029:e2:898c:d721 with SMTP id
 y17-20020a1709029b91b02900e2898cd721mr15973659plp.32.1614609982552; Mon, 01
 Mar 2021 06:46:22 -0800 (PST)
MIME-Version: 1.0
References: <20210123180334.3062995-1-lains@archlinux.org>
In-Reply-To: <20210123180334.3062995-1-lains@archlinux.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 1 Mar 2021 15:46:11 +0100
Message-ID: <CAO-hwJKdfAy9i28iFEKi5DWU0SPOopiEyjT_2HdpL7ahFhdGFg@mail.gmail.com>
Subject: Re: [PATCH 1/2] HID: logitech-dj: add support for the new lightspeed
 receiver iteration
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jan 23, 2021 at 7:03 PM Filipe La=C3=ADns <lains@archlinux.org> wro=
te:
>
> From: Filipe La=C3=ADns <lains@riseup.net>
>
> Tested with the G Pro X Superlight. libratbag sees the device, as
> expected, and input events are passing trough.
>
> https://github.com/libratbag/libratbag/pull/1122
>
> The receiver has a quirk where the moused interface doesn't have a
> report ID, I am not sure why, perhaps they forgot. All other interfaces
> have report IDs so I am left scratching my head.
> Since this driver doesn't have a quirk system, I simply implemented it
> as a different receiver type, which is true, it just wouldn't be the
> prefered approach :P
>
> Signed-off-by: Filipe La=C3=ADns <lains@riseup.net>
> ---
>  drivers/hid/hid-ids.h         |  1 +
>  drivers/hid/hid-logitech-dj.c | 49 +++++++++++++++++++++++++----------
>  2 files changed, 37 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 4c5f23640f9c..8eac3c93fa38 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -803,6 +803,7 @@
>  #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1      0xc539
>  #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1    0xc53f
>  #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY 0xc53a
> +#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_2    0xc547
>  #define USB_DEVICE_ID_SPACETRAVELLER   0xc623
>  #define USB_DEVICE_ID_SPACENAVIGATOR   0xc626
>  #define USB_DEVICE_ID_DINOVO_DESKTOP   0xc704
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.=
c
> index 1401ee2067ca..6596c81947a8 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -114,6 +114,7 @@ enum recvr_type {
>         recvr_type_dj,
>         recvr_type_hidpp,
>         recvr_type_gaming_hidpp,
> +       recvr_type_gaming_hidpp_missing_mse_report_id,  /* lightspeed rec=
eiver missing the mouse report ID */
>         recvr_type_mouse_only,
>         recvr_type_27mhz,
>         recvr_type_bluetooth,
> @@ -1360,6 +1361,7 @@ static int logi_dj_ll_parse(struct hid_device *hid)
>                 dbg_hid("%s: sending a mouse descriptor, reports_supporte=
d: %llx\n",
>                         __func__, djdev->reports_supported);
>                 if (djdev->dj_receiver_dev->type =3D=3D recvr_type_gaming=
_hidpp ||
> +                   djdev->dj_receiver_dev->type =3D=3D recvr_type_gaming=
_hidpp_missing_mse_report_id ||
>                     djdev->dj_receiver_dev->type =3D=3D recvr_type_mouse_=
only)
>                         rdcat(rdesc, &rsize, mse_high_res_descriptor,
>                               sizeof(mse_high_res_descriptor));
> @@ -1605,19 +1607,35 @@ static int logi_dj_raw_event(struct hid_device *h=
dev,
>                         data[0] =3D data[1];
>                         data[1] =3D 0;
>                 }
> -               /*
> -                * Mouse-only receivers send unnumbered mouse data. The 2=
7 MHz
> -                * receiver uses 6 byte packets, the nano receiver 8 byte=
s.
> -                */
> -               if (djrcv_dev->unnumbered_application =3D=3D HID_GD_MOUSE=
 &&
> -                   size <=3D 8) {
> -                       u8 mouse_report[9];
> -
> -                       /* Prepend report id */
> -                       mouse_report[0] =3D REPORT_TYPE_MOUSE;
> -                       memcpy(mouse_report + 1, data, size);
> -                       logi_dj_recv_forward_input_report(hdev, mouse_rep=
ort,
> -                                                         size + 1);
> +
> +
> +               if (djrcv_dev->unnumbered_application =3D=3D HID_GD_MOUSE=
) {
> +                       /*
> +                        * Mouse-only receivers send unnumbered mouse dat=
a. The 27 MHz
> +                        * receiver uses 6 byte packets, the nano receive=
r 8 bytes.
> +                        */
> +                       if (size <=3D 8) {
> +                               u8 mouse_report[9];

Hmm, as stated above, the 27 MHz receiver already does the exact same thing=
.

Can't we just bump the array size and check above to the following:

if (size <=3D 16) {
  u8 mouse_report[17];

The property "djrcv_dev->unnumbered_application" is based on the
report descriptor entirely, and they are just following the HID norm
here. So I think this should be enough.

Cheers,
Benjamin

> +
> +                               /* Prepend report id */
> +                               mouse_report[0] =3D REPORT_TYPE_MOUSE;
> +                               memcpy(mouse_report + 1, data, size);
> +                               logi_dj_recv_forward_input_report(hdev, m=
ouse_report,
> +                                                                 size + =
1);
> +
> +                       /*
> +                        * A variant of the ligtpseed receivers is missin=
g the mouse
> +                        * report ID.
> +                        */
> +                       } else if (djrcv_dev->type =3D=3D recvr_type_gami=
ng_hidpp_missing_mse_report_id) {
> +                               u8 mouse_report[17];
> +
> +                               /* Prepend report id */
> +                               mouse_report[0] =3D REPORT_TYPE_MOUSE;
> +                               memcpy(mouse_report + 1, data, size);
> +                               logi_dj_recv_forward_input_report(hdev, m=
ouse_report,
> +                                                                 size + =
1);
> +                       }
>                 }
>
>                 return false;
> @@ -1688,6 +1706,7 @@ static int logi_dj_probe(struct hid_device *hdev,
>         case recvr_type_dj:             no_dj_interfaces =3D 3; break;
>         case recvr_type_hidpp:          no_dj_interfaces =3D 2; break;
>         case recvr_type_gaming_hidpp:   no_dj_interfaces =3D 3; break;
> +       case recvr_type_gaming_hidpp_missing_mse_report_id: no_dj_interfa=
ces =3D 3; break;
>         case recvr_type_mouse_only:     no_dj_interfaces =3D 2; break;
>         case recvr_type_27mhz:          no_dj_interfaces =3D 2; break;
>         case recvr_type_bluetooth:      no_dj_interfaces =3D 2; break;
> @@ -1886,6 +1905,10 @@ static const struct hid_device_id logi_dj_receiver=
s[] =3D {
>           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
>                 USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1),
>          .driver_data =3D recvr_type_gaming_hidpp},
> +       { /* Logitech lightspeed receiver (0xc547) */
> +         HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> +               USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_2),
> +        .driver_data =3D recvr_type_gaming_hidpp_missing_mse_report_id},
>         { /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
>           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_MX3000_REC=
EIVER),
>          .driver_data =3D recvr_type_27mhz},
> --
> 2.30.0
>

