Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D575E01D1
	for <lists+linux-input@lfdr.de>; Tue, 22 Oct 2019 12:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731790AbfJVKPZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 06:15:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25698 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731778AbfJVKPY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 06:15:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571739323;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jb+jSLMMXhdA2TXJb5G1pOFPifh/azLKzIqyNehvil8=;
        b=M0Fz+M0qLu8gvhrK6m8BNJl2L2LNp76WtJ2I0Q/KzZos8lzUKF9cQs4+yHuVv/x/tR41qT
        PgMcALCZSG2VRMV8Njyn4G7Xy1NKqROCkcROfXA3sMt5rEZArxkVT8Xj9Yd3n+69RgV7n2
        rIyUyskKSwpS+BcmYRdXr2umQ5yzNfQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-6H-3cafQPcqKn9jY3d1P0Q-1; Tue, 22 Oct 2019 06:15:21 -0400
Received: by mail-qk1-f197.google.com with SMTP id h4so16146468qkd.18
        for <linux-input@vger.kernel.org>; Tue, 22 Oct 2019 03:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/+tB79fPqhNVkFo2VEsWEyKbhlVTlDgMTu/kLHgRvk0=;
        b=Tbq1+TdwpOTS77KTSlSZu4nftaLgdWC5mKb8sgok6gbhDvRe3h0LAsI8R+FyoND7Z+
         GF9edY4iJytM4o2rss/WNXhZ+zqJPkIr+CSH8cNt4eRbLMbFVYDaSMqpsDir+DfS2bBZ
         w5PSzZL7xXPz1QUlir4SIdlfNqmEOkzA2kXiEjIirpdP+sV1tlGTxsFn3BqR8KclJZ4x
         wezhowaSce/pGbdZ4SgUK+zAlBGHDVAjbjx/H7rmSVAkzuEhNjtcx3sW0AbHjsg2jCFW
         5FT2QeCHlLDhbvHCOcoSzfFAEIth+QB17EhEzExbuMaheSVFtwG6gc17N6SiS+rH16gS
         +cJw==
X-Gm-Message-State: APjAAAWtUKYbV3UeKRjkQu+DIGeZlgZnEA8IF0W0kc/WM3Zzxx4zJdVu
        oo2NtW+rNlGYtRGPHJ/WsV2L+Hm5lJrKUXv0CA9Jeltkia3ZrXxB3nTFQsM1j0t4cadCHmXYScb
        cWMxz2WrSI+Rc3hm6P8BWwK+/eIBGipVfUxnZbqI=
X-Received: by 2002:a0c:abcc:: with SMTP id k12mr2302872qvb.101.1571739321348;
        Tue, 22 Oct 2019 03:15:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw3wlp22/ODzKPhuKB4Wguk4PUNSjqc4San3at8E7aERmoz6go8O9OAAVKGDfW8/RCdENvOC2RZnVCL4j6Ezjg=
X-Received: by 2002:a0c:abcc:: with SMTP id k12mr2302839qvb.101.1571739321002;
 Tue, 22 Oct 2019 03:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <rzUqln0ASGmn_QTpqCkke6UzMFQDj2H7fIngMOxQwtiX52PkWc_BbxkGy4XcIm7kaVcQHwAYhO7ITZoMotLSHw_2WZre9_QJBDhXoMPTLsw=@protonmail.com>
In-Reply-To: <rzUqln0ASGmn_QTpqCkke6UzMFQDj2H7fIngMOxQwtiX52PkWc_BbxkGy4XcIm7kaVcQHwAYhO7ITZoMotLSHw_2WZre9_QJBDhXoMPTLsw=@protonmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 22 Oct 2019 12:15:09 +0200
Message-ID: <CAO-hwJKmZX8MksRvXC=iyG_eaDxmr3N4tRM_moACxX1aNYSokg@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] HID: logitech-hidpp: Support translations from
 short to long reports
To:     Mazin Rezk <mnrzk@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
X-MC-Unique: 6H-3cafQPcqKn9jY3d1P0Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Mazin,

On Sun, Oct 20, 2019 at 6:41 AM Mazin Rezk <mnrzk@protonmail.com> wrote:
>
> This patch allows short reports to be translated into long reports.
>
> hidpp_validate_device now returns a u8 instead of a bool which represents
> the supported reports. The corresponding bits (i.e.
> HIDPP_REPORT_*_SUPPORTED) are set if an HID++ report is supported.
>
> If a short report is being sent and the device does not support it, it is
> instead sent as a long report.
>
> Thanks,
> Mazin
>
> Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
> ---

Yep, I like this patch much better.

I also tested the 0xb012 MX Master, and it now works like a charm :)

nitpick: can you squash the next patch into this one? Because to be
useful, this patch really need one or 2 supported devices.

Cheers,
Benjamin



>  drivers/hid/hid-logitech-hidpp.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-=
hidpp.c
> index e9bba282f9c1..ee604b17514f 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -49,6 +49,10 @@ MODULE_PARM_DESC(disable_tap_to_click,
>  #define HIDPP_REPORT_LONG_LENGTH               20
>  #define HIDPP_REPORT_VERY_LONG_MAX_LENGTH      64
>
> +#define HIDPP_REPORT_SHORT_SUPPORTED           BIT(0)
> +#define HIDPP_REPORT_LONG_SUPPORTED            BIT(1)
> +#define HIDPP_REPORT_VERY_LONG_SUPPORTED       BIT(2)
> +
>  #define HIDPP_SUB_ID_CONSUMER_VENDOR_KEYS      0x03
>  #define HIDPP_SUB_ID_ROLLER                    0x05
>  #define HIDPP_SUB_ID_MOUSE_EXTRA_BTNS          0x06
> @@ -183,6 +187,7 @@ struct hidpp_device {
>
>         unsigned long quirks;
>         unsigned long capabilities;
> +       u8 supported_reports;
>
>         struct hidpp_battery battery;
>         struct hidpp_scroll_counter vertical_wheel_counter;
> @@ -340,6 +345,11 @@ static int hidpp_send_rap_command_sync(struct hidpp_=
device *hidpp_dev,
>         struct hidpp_report *message;
>         int ret, max_count;
>
> +       /* Send as long report if short reports are not supported. */
> +       if (report_id =3D=3D REPORT_ID_HIDPP_SHORT &&
> +           !(hidpp_dev->supported_reports & HIDPP_REPORT_SHORT_SUPPORTED=
))
> +               report_id =3D REPORT_ID_HIDPP_LONG;
> +
>         switch (report_id) {
>         case REPORT_ID_HIDPP_SHORT:
>                 max_count =3D HIDPP_REPORT_SHORT_LENGTH - 4;
> @@ -3458,10 +3468,11 @@ static int hidpp_get_report_length(struct hid_dev=
ice *hdev, int id)
>         return report->field[0]->report_count + 1;
>  }
>
> -static bool hidpp_validate_device(struct hid_device *hdev)
> +static u8 hidpp_validate_device(struct hid_device *hdev)
>  {
>         struct hidpp_device *hidpp =3D hid_get_drvdata(hdev);
> -       int id, report_length, supported_reports =3D 0;
> +       int id, report_length;
> +       u8 supported_reports =3D 0;
>
>         id =3D REPORT_ID_HIDPP_SHORT;
>         report_length =3D hidpp_get_report_length(hdev, id);
> @@ -3469,7 +3480,7 @@ static bool hidpp_validate_device(struct hid_device=
 *hdev)
>                 if (report_length < HIDPP_REPORT_SHORT_LENGTH)
>                         goto bad_device;
>
> -               supported_reports++;
> +               supported_reports |=3D HIDPP_REPORT_SHORT_SUPPORTED;
>         }
>
>         id =3D REPORT_ID_HIDPP_LONG;
> @@ -3478,7 +3489,7 @@ static bool hidpp_validate_device(struct hid_device=
 *hdev)
>                 if (report_length < HIDPP_REPORT_LONG_LENGTH)
>                         goto bad_device;
>
> -               supported_reports++;
> +               supported_reports |=3D HIDPP_REPORT_LONG_SUPPORTED;
>         }
>
>         id =3D REPORT_ID_HIDPP_VERY_LONG;
> @@ -3488,7 +3499,7 @@ static bool hidpp_validate_device(struct hid_device=
 *hdev)
>                     report_length > HIDPP_REPORT_VERY_LONG_MAX_LENGTH)
>                         goto bad_device;
>
> -               supported_reports++;
> +               supported_reports |=3D HIDPP_REPORT_VERY_LONG_SUPPORTED;
>                 hidpp->very_long_report_length =3D report_length;
>         }
>
> @@ -3536,7 +3547,9 @@ static int hidpp_probe(struct hid_device *hdev, con=
st struct hid_device_id *id)
>         /*
>          * Make sure the device is HID++ capable, otherwise treat as gene=
ric HID
>          */
> -       if (!hidpp_validate_device(hdev)) {
> +       hidpp->supported_reports =3D hidpp_validate_device(hdev);
> +
> +       if (!hidpp->supported_reports) {
>                 hid_set_drvdata(hdev, NULL);
>                 devm_kfree(&hdev->dev, hidpp);
>                 return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> --
> 2.23.0
>

