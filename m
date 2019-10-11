Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A682D3B9E
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 10:51:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbfJKIvh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 04:51:37 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42030 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726397AbfJKIvg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 04:51:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570783894;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wu/Rf3zNUutfn3m2zM9kQv92cgKYcwMDqv7vUduVPBc=;
        b=RqxlguSJrlVisROZzqXq8Te76V6MvvFm/zOQRWWv0zwrMU8R7hNdLr2xRGNmx1mdvI8cjZ
        eaGWc+k0Zg7DVXlieVjxj7zKFZur3ivBvtVoBF7tlTDcI+O4dmgrp8yFkaU6+8QkwYBEzi
        SZ3KNn7H2vKkxIujGyzO3NrCq4d+JPw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-OIBPu9h2O7-Btho1jVCy0w-1; Fri, 11 Oct 2019 04:51:33 -0400
Received: by mail-qt1-f200.google.com with SMTP id n59so8665110qtd.8
        for <linux-input@vger.kernel.org>; Fri, 11 Oct 2019 01:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N10/dTN197PTl0+siuLFDZWqlAaRDfdqpN7eV7M6lL0=;
        b=iyP7sihD3VsfjQyIsrkzM7sEj5zISon1XXW8J7ZEuoH03xuWzKhOEnlV3aovIy8tax
         0cjiLMIvTqm3TAZAnhFAQMPAlEvXdEa7Y6A4RkbJLmv6m8UsX+vSUHcTPiAohcJf27vB
         FBDpg57R/lt4YQ9hojYSf7IUZ+z1oXY2WtU2XMgHpD3hESIa83VWC8lVCCUUyV2cY8BU
         M17yoesz7O1dOWQIEPYjGhJ6XlA1BTbrsooHdRwjaErdCT8nNgJ6ONcFFxldEpUPAkza
         z8+9imbbtnw7AP/KHP2tw+n/Cadlzu40jhpwkiU+Bw9p3k2JHtGoc3Lk2AzZOI7ySqfg
         obbA==
X-Gm-Message-State: APjAAAXt4CRCSExfZod/44pDIiLiH5uhaGwy9n+q17+voiF40aZI+Yxh
        8g8kIBEiwQjmoMRJRcyQYLGJb3ltwr0UMoOGGIELUVZzY0rdzCKP+8bCeB/2NsGU5EGyIrPf70b
        dJd9ZiVNyFkC8xvKYOxADyy9QCdcvyT7Iq+UJThc=
X-Received: by 2002:a37:648d:: with SMTP id y135mr13907179qkb.459.1570783893299;
        Fri, 11 Oct 2019 01:51:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySLoMI6pvZ557naSRkGTpWHJHszarZ6iWrS7WWNjAZXtz1Nf2y0fUJ33374bS3uf3RZwpModlRILODHjD/gQI=
X-Received: by 2002:a37:648d:: with SMTP id y135mr13907169qkb.459.1570783893028;
 Fri, 11 Oct 2019 01:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <GOPSiaLYzQc3Hi9-MvdMQOmiF6O9whCeVYWavirKdm-9VHGb37VtawOPII8FEdYAOWZYFvk3oSQcHkPGazJKZNx8DEwBO7JfrRjLjWA84UI=@protonmail.com>
In-Reply-To: <GOPSiaLYzQc3Hi9-MvdMQOmiF6O9whCeVYWavirKdm-9VHGb37VtawOPII8FEdYAOWZYFvk3oSQcHkPGazJKZNx8DEwBO7JfrRjLjWA84UI=@protonmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 11 Oct 2019 10:51:22 +0200
Message-ID: <CAO-hwJL=j_toocbX2qqjt7JJdZS9CswPBo2fXich-7yYgKyd0A@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] HID: logitech: Support WirelessDeviceStatus
 connect events
To:     Mazin Rezk <mnrzk@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
X-MC-Unique: OIBPu9h2O7-Btho1jVCy0w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 11, 2019 at 2:58 AM Mazin Rezk <mnrzk@protonmail.com> wrote:
>
> On Saturday, October 5, 2019 9:05 PM, Mazin Rezk <mnrzk@protonmail.com> w=
rote:
>
> > This patch makes WirelessDeviceStatus (0x1d4b) events get detected as
> > connection events on devices with HIDPP_QUIRK_WIRELESS_DEVICE_STATUS.
> >
> > This quirk is currently an alias for HIDPP_QUIRK_CLASS_BLUETOOTH since
> > the added Bluetooth devices do not support regular connect events.
>
> No changes have been made to this patch in v4.
>
> Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-=
hidpp.c
> index 2062be922c08..b2b5fe2c74db 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -84,6 +84,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
>
>  /* Just an alias for now, may possibly be a catch-all in the future */
>  #define HIDPP_QUIRK_MISSING_SHORT_REPORTS      HIDPP_QUIRK_CLASS_BLUETOO=
TH
> +#define HIDPP_QUIRK_WIRELESS_DEVICE_STATUS     HIDPP_QUIRK_CLASS_BLUETOO=
TH

Hmm, I don't like the idea of aliasing quirks on a class. Either it's
a class of devices, and you use it as such in the code, either you
want to use individual quirks, and so each one of those needs its own
bit definition.

If you take my advice in 2/4, please assign a new bit for
HIDPP_QUIRK_WIRELESS_DEVICE_STATUS (0x1f IIRC), and logically and it
on the HIDPP_QUIRK_CLASS_BLUETOOTH here.



>
>  #define HIDPP_QUIRK_DELAYED_INIT               HIDPP_QUIRK_NO_HIDINPUT
>
> @@ -406,9 +407,22 @@ static inline bool hidpp_match_error(struct hidpp_re=
port *question,
>             (answer->fap.params[0] =3D=3D question->fap.funcindex_clienti=
d);
>  }
>
> -static inline bool hidpp_report_is_connect_event(struct hidpp_report *re=
port)
> +#define HIDPP_PAGE_WIRELESS_DEVICE_STATUS              0x1d4b
> +
> +static inline bool hidpp_report_is_connect_event(struct hidpp_device *hi=
dpp,
> +                                                struct hidpp_report *rep=
ort)
>  {
> -       return (report->report_id =3D=3D REPORT_ID_HIDPP_SHORT) &&
> +       if (hidpp->quirks & HIDPP_QUIRK_WIRELESS_DEVICE_STATUS) {
> +               /* If feature is invalid, skip array check */
> +               if (report->fap.feature_index > hidpp->feature_count)
> +                       return false;

This should probably be merged with the next return (if bool0, return
false else return bool1 can easily be transformed into return !bool0
&& bool1)

> +
> +               return (hidpp->features[report->fap.feature_index] =3D=3D
> +                        HIDPP_PAGE_WIRELESS_DEVICE_STATUS);

Oh, so that's why you need the feature enumeration.

Though, it's a costly operation when you could simply:
- add a wireless_feature_index in struct hidpp_device,
- gets this feature index at probe with a single call to
hidpp_root_get_feature()
- and check here if this feature index of the report is not null and
equal to wireless_feature_index.

Cheers,
Benjamin

> +       }
> +
> +       return ((report->report_id =3D=3D REPORT_ID_HIDPP_SHORT) ||
> +               (hidpp->quirks & HIDPP_QUIRK_MISSING_SHORT_REPORTS)) &&
>                 (report->rap.sub_id =3D=3D 0x41);
>  }
>
> @@ -3157,7 +3171,7 @@ static int hidpp_raw_hidpp_event(struct hidpp_devic=
e *hidpp, u8 *data,
>                 }
>         }
>
> -       if (unlikely(hidpp_report_is_connect_event(report))) {
> +       if (unlikely(hidpp_report_is_connect_event(hidpp, report))) {
>                 atomic_set(&hidpp->connected,
>                                 !(report->rap.params[0] & (1 << 6)));
>                 if (schedule_work(&hidpp->work) =3D=3D 0)
> --
> 2.23.0

