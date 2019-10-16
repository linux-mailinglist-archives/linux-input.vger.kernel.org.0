Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8A23D99F2
	for <lists+linux-input@lfdr.de>; Wed, 16 Oct 2019 21:24:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732079AbfJPTYV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Oct 2019 15:24:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35442 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728944AbfJPTYR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Oct 2019 15:24:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571253854;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u+joB9E6UZPllDI/uMX85cBeAjG+t2HNX9sXYOx1X8g=;
        b=Hu69XPON+KyDUbg7ST83fNJYW8boJqu0hF/fZrzUUvotlJ0EdF+BlFeR4l0GwPKHiThBv/
        dz9e63t6B/m/Fx6sDMw9fTJmR1pzTV5qwG+4VwCxxJqLNRzzTdS2+UfrsFdj+SS409weFP
        KK0NL3RV/7dKMWLkIE0EwbohitDTlD0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-ne-K0QOsPqW29HUjVX2EVA-1; Wed, 16 Oct 2019 15:24:13 -0400
Received: by mail-qt1-f199.google.com with SMTP id p56so26020624qtj.14
        for <linux-input@vger.kernel.org>; Wed, 16 Oct 2019 12:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OG+jqdqRkE3Fucg+g07dRFYdPcRlmZaD+wZIXULv1fU=;
        b=T8zZBqCDhyEBl0nefTjvORzlPH+PRO/Rcnt5J17F07c4GdXYB/ToKYUzQu07j9PHge
         XRdrKpZGYf3VZcAPF08uIrDo5bUpB1DRkC8mp+Cm3bxyhs5etWC6iCVW92oOBog3xWQe
         P8EJNdKFna5cdNlt4OU7FeWsdqSMboMq85WCePq6f/rBU5BHrMzU4wCvHLqA/CEvq6cr
         pEBqRdkP2wDjoAU0Q0uObF/+//5dM34JicJRistvUpl53GXLuyQJGBXRsruQaJUqa+3X
         z5jYrPVxODFZZ6FZg5LB7O/IAioRBTWEA8WO1qhN/q8NhzNQWAAJoSUsidVxta/CmVNF
         VqdQ==
X-Gm-Message-State: APjAAAUfHcPj6M18KmIz3B0m+TgZfyN6Qej8YQ3qt28/yoz/Pk/lPOjU
        lItmIZh/d/EG0MydsexyjctiWt1ydUFnh8nSrz0X79RViZsPRAcTvk7i0fFtq4ySch3kZuKC0Ne
        uPQ0W+Ci3PIekPc+6+OBZ8+DoJdgoTgRWnQnAJ+k=
X-Received: by 2002:aed:2f04:: with SMTP id l4mr46618844qtd.345.1571253852069;
        Wed, 16 Oct 2019 12:24:12 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxJGUkVMN1rT2RR/9I/7CYwWp05qb4PET+7QL6jvz7eLSbBq0S4l3QRmyFViI/7SGmF8kDGBGlGhD/+k0HuDBo=
X-Received: by 2002:aed:2f04:: with SMTP id l4mr46618816qtd.345.1571253851841;
 Wed, 16 Oct 2019 12:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20191016182935.5616-1-andrew.smirnov@gmail.com> <20191016182935.5616-3-andrew.smirnov@gmail.com>
In-Reply-To: <20191016182935.5616-3-andrew.smirnov@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 16 Oct 2019 21:24:00 +0200
Message-ID: <CAO-hwJ++YWtX29YefGzaEfCLDA=npZwUxDCkDzxALAmLLqv7FQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] HID: logitech-hidpp: rework device validation
To:     Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Sam Bazely <sambazley@fastmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
        Austin Palmer <austinp@valvesoftware.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "3.8+" <stable@vger.kernel.org>
X-MC-Unique: ne-K0QOsPqW29HUjVX2EVA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Andrey,

On Wed, Oct 16, 2019 at 8:30 PM Andrey Smirnov <andrew.smirnov@gmail.com> w=
rote:
>
> G920 device only advertises REPORT_ID_HIDPP_LONG and
> REPORT_ID_HIDPP_VERY_LONG in its HID report descriptor, so querying
> for REPORT_ID_HIDPP_SHORT with optional=3Dfalse will always fail and
> prevent G920 to be recognized as a valid HID++ device.
>
> To fix this and improve some other aspects, modify
> hidpp_validate_device() as follows:
>
>   - Inline the code of hidpp_validate_report() to simplify
>     distingushing between non-present and invalid report descriptors
>
>   - Drop the check for id >=3D HID_MAX_IDS || id < 0 since all of our
>     IDs are static and known to satisfy that at compile time
>
>   - Change the algorithms to check all possible report
>     types (including very long report) and deem the device as a valid
>     HID++ device if it supports at least one
>
>   - Treat invalid report length as a hard stop for the validation
>     algorithm, meaning that if any of the supported reports has
>     invalid length we assume the worst and treat the device as a
>     generic HID device.
>
>   - Fold initialization of hidpp->very_long_report_length into
>     hidpp_validate_device() since it already fetches very long report
>     length and validates its value
>
> Fixes: fe3ee1ec007b ("HID: logitech-hidpp: allow non HID++ devices to be =
handled by this module")
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=3D204191
> Reported-by: Sam Bazely <sambazley@fastmail.com>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: Pierre-Loup A. Griffais <pgriffais@valvesoftware.com>
> Cc: Austin Palmer <austinp@valvesoftware.com>
> Cc: linux-input@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: stable@vger.kernel.org # 5.2+
> ---
>  drivers/hid/hid-logitech-hidpp.c | 54 ++++++++++++++++++--------------
>  1 file changed, 30 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-=
hidpp.c
> index 85911586b3b6..8c4be991f387 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -3498,34 +3498,45 @@ static int hidpp_get_report_length(struct hid_dev=
ice *hdev, int id)
>         return report->field[0]->report_count + 1;
>  }
>
> -static bool hidpp_validate_report(struct hid_device *hdev, int id,
> -                                 int expected_length, bool optional)
> +static bool hidpp_validate_device(struct hid_device *hdev)
>  {
> -       int report_length;
> +       struct hidpp_device *hidpp =3D hid_get_drvdata(hdev);
> +       int id, report_length, supported_reports =3D 0;
> +
> +       id =3D REPORT_ID_HIDPP_SHORT;
> +       report_length =3D hidpp_get_report_length(hdev, id);
> +       if (report_length) {
> +               if (report_length < HIDPP_REPORT_SHORT_LENGTH)
> +                       goto bad_device;
>
> -       if (id >=3D HID_MAX_IDS || id < 0) {
> -               hid_err(hdev, "invalid HID report id %u\n", id);
> -               return false;
> +               supported_reports++;
>         }
>
> +       id =3D REPORT_ID_HIDPP_LONG;
>         report_length =3D hidpp_get_report_length(hdev, id);
> -       if (!report_length)
> -               return optional;
> +       if (report_length) {
> +               if (report_length < HIDPP_REPORT_LONG_LENGTH)
> +                       goto bad_device;
>
> -       if (report_length < expected_length) {
> -               hid_warn(hdev, "not enough values in hidpp report %d\n", =
id);
> -               return false;
> +               supported_reports++;
>         }
>
> -       return true;
> -}
> +       id =3D REPORT_ID_HIDPP_VERY_LONG;
> +       report_length =3D hidpp_get_report_length(hdev, id);
> +       if (report_length) {
> +               if (report_length > HIDPP_REPORT_LONG_LENGTH &&
> +                   report_length < HIDPP_REPORT_VERY_LONG_MAX_LENGTH)

Can you double check the conditions here?
It's late, but I think you inverted the tests as we expect the report
length to be between HIDPP_REPORT_LONG_LENGTH and
HIDPP_REPORT_VERY_LONG_MAX_LENGTH inclusive, while here this creates a
bad_device.

Other than that, I really like the series.

Cheers,
Benjamin

> +                       goto bad_device;
>
> -static bool hidpp_validate_device(struct hid_device *hdev)
> -{
> -       return hidpp_validate_report(hdev, REPORT_ID_HIDPP_SHORT,
> -                                    HIDPP_REPORT_SHORT_LENGTH, false) &&
> -              hidpp_validate_report(hdev, REPORT_ID_HIDPP_LONG,
> -                                    HIDPP_REPORT_LONG_LENGTH, true);
> +               supported_reports++;
> +               hidpp->very_long_report_length =3D report_length;
> +       }
> +
> +       return supported_reports;
> +
> +bad_device:
> +       hid_warn(hdev, "not enough values in hidpp report %d\n", id);
> +       return false;
>  }
>
>  static bool hidpp_application_equals(struct hid_device *hdev,
> @@ -3572,11 +3583,6 @@ static int hidpp_probe(struct hid_device *hdev, co=
nst struct hid_device_id *id)
>                 return hid_hw_start(hdev, HID_CONNECT_DEFAULT);
>         }
>
> -       hidpp->very_long_report_length =3D
> -               hidpp_get_report_length(hdev, REPORT_ID_HIDPP_VERY_LONG);
> -       if (hidpp->very_long_report_length > HIDPP_REPORT_VERY_LONG_MAX_L=
ENGTH)
> -               hidpp->very_long_report_length =3D HIDPP_REPORT_VERY_LONG=
_MAX_LENGTH;
> -
>         if (id->group =3D=3D HID_GROUP_LOGITECH_DJ_DEVICE)
>                 hidpp->quirks |=3D HIDPP_QUIRK_UNIFYING;
>
> --
> 2.21.0
>

