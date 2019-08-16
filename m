Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3996590AAB
	for <lists+linux-input@lfdr.de>; Sat, 17 Aug 2019 00:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727716AbfHPWED (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 18:04:03 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42264 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727709AbfHPWED (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 18:04:03 -0400
Received: by mail-pf1-f194.google.com with SMTP id i30so3781418pfk.9;
        Fri, 16 Aug 2019 15:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+w2U2crS2vYRRyWIjo0qOL4Zpteqtr+zKOK/7hnhR/E=;
        b=l1F5DOKT/ow7/8fIvTG4D5ibJbrThnomLRRwUvMuk4X+Upj9jA27qTzag79sVIojb/
         AW5Z2jtlcSj+Pv9LTdF3obeReU60kYbLeN2/y9FwXCgTBibsd4AjjCRkVbf6A3paHdKe
         pV24YMI3zulrvc/rDAZCkn2GaM/41uJk0bohWd33h0+z2jCKOcrdelf+cQeJ8bFVdWnU
         xvWh3LoQ8ZWW/yTR+CvLT545JBTnZ1GyqjmlpeQv9Rzoz+uuYDdHrdNjaH1YKWyJck/h
         c1QirhD7fR6mzpEEXUX/4JjyhCi8BtxBgBqTdV4SN13F5rAQESWMTtNnqKnDbZFx3bJF
         RtPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+w2U2crS2vYRRyWIjo0qOL4Zpteqtr+zKOK/7hnhR/E=;
        b=FW/FlgMkSGwmgc0/WGplxKsmL7g/Qmqdg9JbCgiLM3LPNmRNIflQsVVjqE5r0eLEdH
         rC2Uvxk6WaURhpUgbI/MiwiT1AM2JRF1jJg0m/GKDlyUY2TcHsx5MSyuRnuFYGDRRwdp
         VUX1BO0F+Qne0xLvvnIDposwBoswO6wx3mLxKRcF3We3qqqg+mLqjE9pZ1UC3ccUzd3G
         78L2+1qmaU3vyl5qXWzsji/D3GB7YumofaQThkZVvbjRPcPCQMKYqprrE+F7bapV6aqC
         PeEIFH94X+G9mjWJYRMlwZ4PZYaz69VRq+4SSODN6hOk+DBfNBlUwoV1Dk3qo7rdBDEO
         TCTA==
X-Gm-Message-State: APjAAAXMkDYrQt3CWdQuiKTx5AhYOuIvsKPn9VHH0Ftm8wX1Hz3x9IdQ
        MPBwMGFY4O0X1AHAkv7fXocJnGEkn3LmOC004rc=
X-Google-Smtp-Source: APXvYqyKyPFzXQlXR61APFYyTUCAMuIP3xbCdeKwBgEhuLESwGKsX/Ae1p89bbLbv60V6ZpbI7uV7PdmA6RdCAQIUGs=
X-Received: by 2002:a65:64c6:: with SMTP id t6mr9762346pgv.323.1565993042598;
 Fri, 16 Aug 2019 15:04:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190812162740.15898-1-benjamin.tissoires@redhat.com> <20190812162740.15898-3-benjamin.tissoires@redhat.com>
In-Reply-To: <20190812162740.15898-3-benjamin.tissoires@redhat.com>
From:   Jason Gerecke <killertofu@gmail.com>
Date:   Fri, 16 Aug 2019 15:03:51 -0700
Message-ID: <CANRwn3QQcGVGx2KjoU0sG70gSjzwjDKUuL_8q-oYFHRYrn4qGQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: wacom: do not call hid_set_drvdata(hdev, NULL)
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     =?UTF-8?Q?Bruno_Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Ping Cheng <pinglinux@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Jiri Kosina <jikos@kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 12, 2019 at 9:29 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> This is a common pattern in the HID drivers to reset the drvdata.
> However, this is actually already handled by driver core, so there
> is no need to do it manually.
>
> Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Acked-by: Jason Gerecke <jason.gerecke@wacom.com>

Jason
---
Now instead of four in the eights place /
you=E2=80=99ve got three, =E2=80=98Cause you added one  /
(That is to say, eight) to the two,     /
But you can=E2=80=99t take seven from three,    /
So you look at the sixty-fours....


> ---
>  drivers/hid/wacom_sys.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> index 53bddb50aeba..69ccfdd51a6f 100644
> --- a/drivers/hid/wacom_sys.c
> +++ b/drivers/hid/wacom_sys.c
> @@ -2718,14 +2718,12 @@ static int wacom_probe(struct hid_device *hdev,
>         wacom_wac->features =3D *((struct wacom_features *)id->driver_dat=
a);
>         features =3D &wacom_wac->features;
>
> -       if (features->check_for_hid_type && features->hid_type !=3D hdev-=
>type) {
> -               error =3D -ENODEV;
> -               goto fail;
> -       }
> +       if (features->check_for_hid_type && features->hid_type !=3D hdev-=
>type)
> +               return -ENODEV;
>
>         error =3D kfifo_alloc(&wacom_wac->pen_fifo, WACOM_PKGLEN_MAX, GFP=
_KERNEL);
>         if (error)
> -               goto fail;
> +               return error;
>
>         wacom_wac->hid_data.inputmode =3D -1;
>         wacom_wac->mode_report =3D -1;
> @@ -2743,12 +2741,12 @@ static int wacom_probe(struct hid_device *hdev,
>         error =3D hid_parse(hdev);
>         if (error) {
>                 hid_err(hdev, "parse failed\n");
> -               goto fail;
> +               return error;
>         }
>
>         error =3D wacom_parse_and_register(wacom, false);
>         if (error)
> -               goto fail;
> +               return error;
>
>         if (hdev->bus =3D=3D BUS_BLUETOOTH) {
>                 error =3D device_create_file(&hdev->dev, &dev_attr_speed)=
;
> @@ -2759,10 +2757,6 @@ static int wacom_probe(struct hid_device *hdev,
>         }
>
>         return 0;
> -
> -fail:
> -       hid_set_drvdata(hdev, NULL);
> -       return error;
>  }
>
>  static void wacom_remove(struct hid_device *hdev)
> @@ -2791,8 +2785,6 @@ static void wacom_remove(struct hid_device *hdev)
>                 wacom_release_resources(wacom);
>
>         kfifo_free(&wacom_wac->pen_fifo);
> -
> -       hid_set_drvdata(hdev, NULL);
>  }
>
>  #ifdef CONFIG_PM
> --
> 2.19.2
>
