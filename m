Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DF981001F5
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2019 11:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfKRKDF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Nov 2019 05:03:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56390 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726460AbfKRKDF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Nov 2019 05:03:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574071383;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dIkGq7bbUWzIvjaMGRoUYkGrMUtG7hNNaMVTfE0qYxY=;
        b=c3zeqORFsNW/wurWZHPbxw2SXYr9Z7M2beWwf3ehq+XeIkepAtr96IcvDWsX03Fa2mCAjw
        cbX9DN1mjWdm4HKQbXfic/BzBPm++ueDP995mTBnnyp9w3k8RUAvRYN171QBuc996z/U94
        KqpENKBS4PhjE1QnncRFPN81HNBkiE8=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-NmY-UZu7PkSiEgOqNjMwFw-1; Mon, 18 Nov 2019 05:03:00 -0500
Received: by mail-qt1-f200.google.com with SMTP id g5so11921540qtc.5
        for <linux-input@vger.kernel.org>; Mon, 18 Nov 2019 02:03:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/rqqZNa+HN6wbsGqHDBQO0XFG3gcin7AZ3JY1HAd1Hk=;
        b=RobZKxT3Xx2rcohQpy6DpMGZaczSamzn+bBALKafMH3X4x0rRwZk5clVE3k2NYUCsA
         Ihtoybp+FNQa3BFym6GdN46uTuyhEBZB9mRpOp123sOzV2nE43yfzfhHN+9plI3iGiQC
         uThhqDy95PN3OtFgvgfxJ73u9EjmteWmNhjJqZEgZBkgRHpK8ucWlEa2aTwb5EYKmSFy
         jvzPcTPBFRJbGuDiUiUmipB33qDYuFZ6lIacSRjZ+1VKXcLVwhClPJ+S4F94IlQTbnyw
         zAj3o8fs8uZSURdAKhm+yWn5o22yg3wWoJRkWu1IISDhTBd6iYcpU7tWooU9Uk7HHh/9
         d0Iw==
X-Gm-Message-State: APjAAAXyDBu19A+QQFI68rRXxlg1zMxNldEF+yYf4zfTK6QrZwpt3kew
        1hNa+hfcz27EDy5OngnpAnvOph+8gGh2V4xJJ66hpuHAYKGvAEnlIczwlFlzWRH/v0BCV0W4FJX
        PwogdkmnwAbyuDA3ED3avaE7HBYZoWE3KK9FGWBQ=
X-Received: by 2002:aed:20e5:: with SMTP id 92mr26399718qtb.294.1574071380317;
        Mon, 18 Nov 2019 02:03:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqyUkiClUr46hBKdmpDUhUHtPYZ/+bjOjvKt3/ROCG82nZMPZOTzFlbeH+XPgGZax2EY0LIG1thhzc4VAfne35c=
X-Received: by 2002:aed:20e5:: with SMTP id 92mr26399709qtb.294.1574071380167;
 Mon, 18 Nov 2019 02:03:00 -0800 (PST)
MIME-Version: 1.0
References: <dee18394-b0cb-8f85-2db3-9e07407184ba@gmail.com>
In-Reply-To: <dee18394-b0cb-8f85-2db3-9e07407184ba@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 18 Nov 2019 11:02:48 +0100
Message-ID: <CAO-hwJL7uA3nCOKbOyyLZHiGZGfD=N+Mvo-iye15Y4Dn89k69w@mail.gmail.com>
Subject: Re: [PATCH] HID: quirks: remove hid-led devices from hid_have_special_driver
To:     Heiner Kallweit <hkallweit1@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
X-MC-Unique: NmY-UZu7PkSiEgOqNjMwFw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 11, 2019 at 10:38 PM Heiner Kallweit <hkallweit1@gmail.com> wro=
te:
>
> Since e04a0442d33b ("HID: core: remove the absolute need of
> hid_have_special_driver[]") it's no longer needed to list these LED
> devices in hid_have_special_driver[]. This allows libraries needing
> access to the hidraw device to work properly.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---

Applied to for-5.5/core.

Thanks a lot for the submission.

Cheers,
Benjamin

>  drivers/hid/hid-quirks.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index c50bcd967..bdaab79f7 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -419,13 +419,6 @@ static const struct hid_device_id hid_have_special_d=
river[] =3D {
>  #if IS_ENABLED(CONFIG_HID_LCPOWER)
>         { HID_USB_DEVICE(USB_VENDOR_ID_LCPOWER, USB_DEVICE_ID_LCPOWER_LC1=
000) },
>  #endif
> -#if IS_ENABLED(CONFIG_HID_LED)
> -       { HID_USB_DEVICE(USB_VENDOR_ID_DREAM_CHEEKY, USB_DEVICE_ID_DREAM_=
CHEEKY_WN) },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_DREAM_CHEEKY, USB_DEVICE_ID_DREAM_=
CHEEKY_FA) },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_MICROCHIP, USB_DEVICE_ID_LUXAFOR) =
},
> -       { HID_USB_DEVICE(USB_VENDOR_ID_RISO_KAGAKU, USB_DEVICE_ID_RI_KA_W=
EBMAIL) },
> -       { HID_USB_DEVICE(USB_VENDOR_ID_THINGM, USB_DEVICE_ID_BLINK1) },
> -#endif
>  #if IS_ENABLED(CONFIG_HID_LENOVO)
>         { HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_TPKBD=
) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_LENOVO, USB_DEVICE_ID_LENOVO_CUSBK=
BD) },
> --
> 2.24.0
>

