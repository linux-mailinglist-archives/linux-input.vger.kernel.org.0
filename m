Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96265DC8E3
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 17:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393206AbfJRPic (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 11:38:32 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:45783 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730468AbfJRPic (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 11:38:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571413110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JTdnWheKvkUYrVaMeY3lYJ2nHqs52mFAjqgDCc0VsJM=;
        b=i2IFwS6GQimiSNUJE4nROXJ53VZsFLQtow/FpkQ3M57LGLeBIwd2q9ENgM5OkC3DWsHYNC
        r77biHbnwnnNuJMUplpA0gcrE9b3PDw4atAcDImX4oS84JNT2Ek9FhhG6c/xbsE8ftdY4k
        rfOemFuXYVhDbGObLup9E6eXrEB7Dng=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-UuvGurR5MbSmLswKLXQzWw-1; Fri, 18 Oct 2019 11:38:27 -0400
Received: by mail-qt1-f198.google.com with SMTP id t25so6271858qtq.9
        for <linux-input@vger.kernel.org>; Fri, 18 Oct 2019 08:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AHpooU0lck0YMXNkAeb+yjAvWSzG5nXB8oRVtwMgBWg=;
        b=N0wDj7V9FOrYOb/a4vMtndDEtCISmRAXDulSod29AsjMSB1JpdEQqjE0VivOglZsxw
         da2wiVTAqYxRtzrn2jdxYWSo7R9tdoAVHuU06PIWEDRdHYZ+vGtbC/8L15Do69/SQAXe
         r64SiN6AF1giIjMwgjt4WUJPeBSi9GA0dI2ygSaJNKzAi4XlmB5zSc0TM8U+0okfRH7r
         2+NVqve8A2xIRGlaqc9yjdwBXMehE9q/sBZEhMhz51+Sr0rRJVT9LhF/2nVU84LQgC4L
         G5N7Q1LNbgaYCWYhNp8C+RM1GgL/lE7MF5Epxg/Q4A7sAYpp1Li7kNy/5pknSNpFzgm6
         U4BQ==
X-Gm-Message-State: APjAAAWkWxzjDjAeXf6zcV/xLFDwcTEwrY+7kBXUDW9nxCoZh+++fEp3
        spr1DpqND7XLVRI7HuCGrvk3VVJ3TeQAU/oasu8iEW4Upg9U3q8iJiHMlUHHBNe2rjt+XH3q9Ah
        lJw/NvVTK9GVCSAxT2oINrbDWXbQljnW6ZnhnxZU=
X-Received: by 2002:ac8:1e83:: with SMTP id c3mr10653475qtm.294.1571413106413;
        Fri, 18 Oct 2019 08:38:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxK/5QurjRG7eDYqrF+2bk1Vi3nAVRG9WhS28hkPLqaIdu1lKgJvcG0oIkVSCiDU6yOT0bpc8h31isrSSj1uvI=
X-Received: by 2002:ac8:1e83:: with SMTP id c3mr10653425qtm.294.1571413106084;
 Fri, 18 Oct 2019 08:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <_1Ewv9AvBhbWTNcFOkmvCyjVph73eQIz23Plyv5ffgaWWHnmPBTbSIJhs47AnYatJsmDWu4JlMjcsKE8Cf31lvmwQipYEu47YglNfroyJtM=@protonmail.com>
In-Reply-To: <_1Ewv9AvBhbWTNcFOkmvCyjVph73eQIz23Plyv5ffgaWWHnmPBTbSIJhs47AnYatJsmDWu4JlMjcsKE8Cf31lvmwQipYEu47YglNfroyJtM=@protonmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 18 Oct 2019 17:38:14 +0200
Message-ID: <CAO-hwJK3Q1Bu+6JVbXmbZ2-JqaPzX=dEVPfue=v2LRJsU7FmGA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] HID: logitech: Support WirelessDeviceStatus
 connect events
To:     Mazin Rezk <mnrzk@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
X-MC-Unique: UuvGurR5MbSmLswKLXQzWw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 14, 2019 at 8:36 PM Mazin Rezk <mnrzk@protonmail.com> wrote:
>
> This patch allows WirelessDeviceStatus (0x1d4b) events to be detected as
> connection events in the hid-logitech-hidpp module.
>
> Devices with HIDPP_QUIRK_WIRELESS_DEVICE_STATUS use WirelessDeviceStatus
> instead of traditional connect events. Since all Bluetooth LE devices see=
m
> to act this way, HIDPP_QUIRK_CLASS_BLUETOOTH_LE aliases this quirk.
>
> Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 42 ++++++++++++++++++++++++++++----
>  1 file changed, 37 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-=
hidpp.c
> index 997b1056850a..9b3df57ca857 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -60,6 +60,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
>  #define HIDPP_QUIRK_CLASS_K750                 BIT(4)
>
>  /* bits 2..15 are reserved for classes */
> +#define HIDPP_QUIRK_WIRELESS_DEVICE_STATUS     BIT(19)
>  #define HIDPP_QUIRK_MISSING_SHORT_REPORTS      BIT(20)
>  /* #define HIDPP_QUIRK_CONNECT_EVENTS          BIT(21) disabled */
>  #define HIDPP_QUIRK_WTP_PHYSICAL_BUTTONS       BIT(22)
> @@ -82,7 +83,8 @@ MODULE_PARM_DESC(disable_tap_to_click,
>                                          HIDPP_QUIRK_HI_RES_SCROLL_X2120 =
| \
>                                          HIDPP_QUIRK_HI_RES_SCROLL_X2121)
>
> -#define HIDPP_QUIRK_CLASS_BLUETOOTH_LE HIDPP_QUIRK_MISSING_SHORT_REPORTS
> +#define HIDPP_QUIRK_CLASS_BLUETOOTH_LE (HIDPP_QUIRK_MISSING_SHORT_REPORT=
S | \
> +                                        HIDPP_QUIRK_WIRELESS_DEVICE_STAT=
US)
>
>  #define HIDPP_QUIRK_DELAYED_INIT               HIDPP_QUIRK_NO_HIDINPUT
>
> @@ -189,6 +191,8 @@ struct hidpp_device {
>
>         struct hidpp_battery battery;
>         struct hidpp_scroll_counter vertical_wheel_counter;
> +
> +       u8 wireless_feature_index;
>  };
>
>  /* HID++ 1.0 error codes */
> @@ -402,10 +406,14 @@ static inline bool hidpp_match_error(struct hidpp_r=
eport *question,
>             (answer->fap.params[0] =3D=3D question->fap.funcindex_clienti=
d);
>  }
>
> -static inline bool hidpp_report_is_connect_event(struct hidpp_report *re=
port)
> +static inline bool hidpp_report_is_connect_event(struct hidpp_device *hi=
dpp,
> +                                                struct hidpp_report *rep=
ort)
>  {
> -       return (report->report_id =3D=3D REPORT_ID_HIDPP_SHORT) &&
> -               (report->rap.sub_id =3D=3D 0x41);
> +       return ((hidpp->quirks & HIDPP_QUIRK_WIRELESS_DEVICE_STATUS) &&
> +               (report->fap.feature_index =3D=3D hidpp->wireless_feature=
_index)) ||
> +             (((report->report_id =3D=3D REPORT_ID_HIDPP_SHORT) ||
> +               (hidpp->quirks & HIDPP_QUIRK_MISSING_SHORT_REPORTS)) &&
> +               (report->rap.sub_id =3D=3D 0x41));

I wonder if we need a quirk after all: if
hidpp->wireless_feature_index is non null, that means that we have the
quirk.
Unless the feature is present for non BLE devices, in which case, we
might want to enable them one by one, for now.

Cheers,
Benjamin

>  }
>
>  /**
> @@ -1282,6 +1290,24 @@ static int hidpp_battery_get_property(struct power=
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
> @@ -3077,7 +3103,7 @@ static int hidpp_raw_hidpp_event(struct hidpp_devic=
e *hidpp, u8 *data,
>                 }
>         }
>
> -       if (unlikely(hidpp_report_is_connect_event(report))) {
> +       if (unlikely(hidpp_report_is_connect_event(hidpp, report))) {
>                 atomic_set(&hidpp->connected,
>                                 !(report->rap.params[0] & (1 << 6)));
>                 if (schedule_work(&hidpp->work) =3D=3D 0)
> @@ -3624,6 +3650,12 @@ static int hidpp_probe(struct hid_device *hdev, co=
nst struct hid_device_id *id)
>                 hidpp_overwrite_name(hdev);
>         }
>
> +       if (connected && (hidpp->quirks & HIDPP_QUIRK_WIRELESS_DEVICE_STA=
TUS)) {
> +               ret =3D hidpp_set_wireless_feature_index(hidpp);
> +               if (ret)
> +                       goto hid_hw_init_fail;
> +       }
> +
>         if (connected && (hidpp->quirks & HIDPP_QUIRK_CLASS_WTP)) {
>                 ret =3D wtp_get_config(hidpp);
>                 if (ret)
> --
> 2.23.0
>

