Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3E3E01E2
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 12:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730026AbfJVKSC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 06:18:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33770 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727805AbfJVKSB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 06:18:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571739480;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T2JjnBVbuvNA+a+iyFrGGYLzCQFQ6thLyM4zkKmPzKo=;
        b=QEMwGJQRtUGWcVv5yunCrLK2CW/1HCnfTf0gsUDQQO1Vdm2l9abjnCiR+OBM2rinzNhhuY
        ZfBmKJdFUaxPKTypagjybN+EQE887tDa4lEVvE5BWuHuMsQCDUlSTbbFZ9N7bBqmAAQYPa
        ij0vl3y21gN9hgFX4bMDT3Ekujbc11U=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-4ox_IdnPPqaD8JvtRsXUjg-1; Tue, 22 Oct 2019 06:17:59 -0400
Received: by mail-qk1-f199.google.com with SMTP id s14so16202200qkg.12
        for <linux-input@vger.kernel.org>; Tue, 22 Oct 2019 03:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cBPk6NpJpRbeX/hvTSHLW/B7rmGZEoFd69lGljlY5IM=;
        b=Pn0hi/h7lCevWcDZDP5lmQzWkin7Lwdola2uur1lcdhMU7o/24jG8ylTZ18helARbv
         gqQa+e+zwVuKEUS1ZdsNeZlj5lFAewYGJ2/Ww8Fa4/Nz6d/PUkEA3qztNdiT3XWAeqDS
         F4buwcXsI0HGtMEd0NgIwHDfg5mljL/fswAW6I+LdsjytHzvue991DvMsQRhFoJBdjvS
         KD+lqRBDWB8j17RnsRMMgDOYyqjP3a0NedcwSbtvdxjw5/6+Dg+CORLh0LktaR3uGdMr
         2gKNBf3k00iPNvKAo8fwej4ZdV7f3GA638O2W/mc+6NBy1AGTkJSrLIZu/mmtCRy2eit
         NrnA==
X-Gm-Message-State: APjAAAWk2oEkJBTLMTlAErwKFVeVQSrEhIfccrTZ1oQWAMwYk1etytGt
        Fk5WNHpTTxz/emLDQrY1wWKMcVkRqNEOK2FZ20pir3GMtwCWjHaVK4cLsECmGXAZ8sAf47PQBsY
        Ua2K10e+FQE3Iqe7hkyIZhfaMOEvw8a3WhMshGgQ=
X-Received: by 2002:ac8:4608:: with SMTP id p8mr2428313qtn.345.1571739478918;
        Tue, 22 Oct 2019 03:17:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzQNKkhUU10oDsqF2PviZ9r+eHyqaa1vwFgGOBnBw4eEt4EDutMfUpxnZu4quob/eUu1PQ+WEeZOHOiLZRaLDA=
X-Received: by 2002:ac8:4608:: with SMTP id p8mr2428294qtn.345.1571739478642;
 Tue, 22 Oct 2019 03:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <yqo4xUWK3dmAH59Oyn2JK3cV_xDNVaULp7MRQ0afuT1IDqOPRauLpjRiOaUnTgCNeHvOL_lIL_IHzg4zs6-cHfB3Cz0awCWe2mjvuchYWFk=@protonmail.com>
In-Reply-To: <yqo4xUWK3dmAH59Oyn2JK3cV_xDNVaULp7MRQ0afuT1IDqOPRauLpjRiOaUnTgCNeHvOL_lIL_IHzg4zs6-cHfB3Cz0awCWe2mjvuchYWFk=@protonmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 22 Oct 2019 12:17:47 +0200
Message-ID: <CAO-hwJKbXN8MVJxEoLSe+7GXZ+6r4LX3S83YUO7naK_FMfHcYg@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] HID: logitech-hidpp: Support WirelessDeviceStatus
 connect events
To:     Mazin Rezk <mnrzk@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
X-MC-Unique: 4ox_IdnPPqaD8JvtRsXUjg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Mazin

On Sun, Oct 20, 2019 at 6:43 AM Mazin Rezk <mnrzk@protonmail.com> wrote:
>
> This patch allows hidpp_report_is_connect_event to support
> WirelessDeviceStatus connect events.
>
> The WirelessDeviceStatus feature index is stored in hidpp_device when
> probed. The connect event's fap feature_index is compared against it if t=
he
> device supports it.
>
> Thanks,
> Mazin

huh, this "Thanks" bit should be after the first "---", because we
don't want it in the final commit :)

BTW, I haven't been able to trigger this one yet. Patch looks good,
but I'd rather be sure it works on many Logitech devices before we
include it.

Cheers,
Benjamin

>
> Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 39 ++++++++++++++++++++++++++++----
>  1 file changed, 35 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-=
hidpp.c
> index 19b315e4e91b..c8b23568d0b1 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -191,6 +191,8 @@ struct hidpp_device {
>
>         struct hidpp_battery battery;
>         struct hidpp_scroll_counter vertical_wheel_counter;
> +
> +       u8 wireless_feature_index;
>  };
>
>  /* HID++ 1.0 error codes */
> @@ -403,10 +405,13 @@ static inline bool hidpp_match_error(struct hidpp_r=
eport *question,
>             (answer->fap.params[0] =3D=3D question->fap.funcindex_clienti=
d);
>  }
>
> -static inline bool hidpp_report_is_connect_event(struct hidpp_report *re=
port)
> +static inline bool hidpp_report_is_connect_event(struct hidpp_device *hi=
dpp,
> +               struct hidpp_report *report)
>  {
> -       return (report->report_id =3D=3D REPORT_ID_HIDPP_SHORT) &&
> -               (report->rap.sub_id =3D=3D 0x41);
> +       return (hidpp->wireless_feature_index &&
> +               (report->fap.feature_index =3D=3D hidpp->wireless_feature=
_index)) ||
> +               ((report->report_id =3D=3D REPORT_ID_HIDPP_SHORT) &&
> +               (report->rap.sub_id =3D=3D 0x41));
>  }
>
>  /**
> @@ -1283,6 +1288,24 @@ static int hidpp_battery_get_property(struct power=
_supply *psy,
>         return ret;
>  }
>
> +/* ---------------------------------------------------------------------=
----- */
> +/* 0x1d4b: Wireless device status                                       =
      */
> +/* ---------------------------------------------------------------------=
----- */
> +#define HIDPP_PAGE_WIRELESS_DEVICE_STATUS                      0x1d4b
> +
> +static int hidpp_set_wireless_feature_index(struct hidpp_device *hidpp)
> +{
> +       u8 feature_type;
> +       int ret;
> +
> +       ret =3D hidpp_root_get_feature(hidpp,
> +                                    HIDPP_PAGE_WIRELESS_DEVICE_STATUS,
> +                                    &hidpp->wireless_feature_index,
> +                                    &feature_type);
> +
> +       return ret;
> +}
> +
>  /* ---------------------------------------------------------------------=
----- */
>  /* 0x2120: Hi-resolution scrolling                                      =
      */
>  /* ---------------------------------------------------------------------=
----- */
> @@ -3078,7 +3101,7 @@ static int hidpp_raw_hidpp_event(struct hidpp_devic=
e *hidpp, u8 *data,
>                 }
>         }
>
> -       if (unlikely(hidpp_report_is_connect_event(report))) {
> +       if (unlikely(hidpp_report_is_connect_event(hidpp, report))) {
>                 atomic_set(&hidpp->connected,
>                                 !(report->rap.params[0] & (1 << 6)));
>                 if (schedule_work(&hidpp->work) =3D=3D 0)
> @@ -3628,6 +3651,14 @@ static int hidpp_probe(struct hid_device *hdev, co=
nst struct hid_device_id *id)
>                 hidpp_overwrite_name(hdev);
>         }
>
> +       if (connected && hidpp->protocol_major >=3D 2) {
> +               ret =3D hidpp_set_wireless_feature_index(hidpp);
> +               if (ret =3D=3D -ENOENT)
> +                       hidpp->wireless_feature_index =3D 0;
> +               else if (ret)
> +                       goto hid_hw_init_fail;
> +       }
> +
>         if (connected && (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP)) {
>                 ret =3D wtp_get_config(hidpp);
>                 if (ret)
> --
> 2.23.0
>

