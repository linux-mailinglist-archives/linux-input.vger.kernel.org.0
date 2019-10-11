Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7A35D3ACD
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 10:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbfJKIUC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 04:20:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31771 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726533AbfJKIUC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 04:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570782000;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eEtdWRL47++4bBMWcjannbQWaXKh2s1hZrEOt0fm3i4=;
        b=TlSAwtepbxbzQRG8Yqs4NeMNGjLG1sJrkvhTbR7FJlFMUCUrr4sXExPHZ1aKFSx4v+NfnR
        jWYZvESuyjz4ZgC6/tpvd2mnJ4FKO7fkSgH2IQNQC60ytJBXQRMYMgyPJihsfx3ifkD6Tl
        oKzhfy3CjuEUydxZ2ODhYMg7DX0bLQ8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-aB1Bf8z_MtKlu4owB2lsSQ-1; Fri, 11 Oct 2019 04:19:59 -0400
Received: by mail-qk1-f199.google.com with SMTP id o133so8222530qke.4
        for <linux-input@vger.kernel.org>; Fri, 11 Oct 2019 01:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vKh+g1OVwvKv2lQA+PWVSzl6Rx23w97PxJNZAisVZ5I=;
        b=DjzMXu5ZMAKeJXulA09PEnupk79gdAwCWweUi8NyRGn4uWCt+X6jTQnWPADxPXmN6E
         gCVE/J7KvupJur1gZsC0eoLR0aUBwmdkkCD3YbZ+joNRuGbmYmzl5dbakn8TeSNVpLCC
         z8Ho7h8Z8D2KtQTCI2KEUCCNu6gHYwrTMqzcviNydxgDRZ8d11fXCAi4Il+XTqxYxG8Y
         UluRJH+yis6R2IxPZMv64+KaQ4sLbhTT3bRKfb/8BncHEkd/WECdjXgLSHkfQH3pQrFe
         xP2vwAx75TkCNq9yqRrpLwto/abioec8/PFy/eTcS0HR8Htbdtd6CDPG3p74b17jADXo
         psug==
X-Gm-Message-State: APjAAAUWbO9SeOZ+bL3YQRDZBlVwoIFtKu7qsmoMDyt56IfXwTQ8+2wt
        kQ7mWao+hWSmjh2djfknO4U4Bg5uhQ/A5s3v5mIob6XViG7GPyebiuvZBnASov8BvX9vDUB6bF8
        Lrd7xWlEGg38slHJC5OTV0QxKNN1hIk9PIbWIEsk=
X-Received: by 2002:a37:50a:: with SMTP id 10mr13770334qkf.27.1570781998822;
        Fri, 11 Oct 2019 01:19:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzn++uKvCktz9JlgTA1QiajDuKgosJ+oDfPWoZz+7UavKQQrrBSDGIwaVMdMCBKoZt015a95Bq6EmIDsD5cUhc=
X-Received: by 2002:a37:50a:: with SMTP id 10mr13770315qkf.27.1570781998549;
 Fri, 11 Oct 2019 01:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <uBbIS3nFJ1jdYNLHcqjW5wxQAwmZv0kmYEoeoPrxNhfzi6cHwmCOY-ewdqe7S1hNEj-p4Hd9D0_Y3PymUTdh_6WFXuMmIYUkV2xaKCPMYz0=@protonmail.com>
In-Reply-To: <uBbIS3nFJ1jdYNLHcqjW5wxQAwmZv0kmYEoeoPrxNhfzi6cHwmCOY-ewdqe7S1hNEj-p4Hd9D0_Y3PymUTdh_6WFXuMmIYUkV2xaKCPMYz0=@protonmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 11 Oct 2019 10:19:47 +0200
Message-ID: <CAO-hwJK7gaL7pcTji3buN-wdp4HJw497Zi0S47Xr21FRHffLXQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] HID: logitech: Add MX Mice over Bluetooth
To:     Mazin Rezk <mnrzk@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
X-MC-Unique: aB1Bf8z_MtKlu4owB2lsSQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Mazin,

On Fri, Oct 11, 2019 at 2:57 AM Mazin Rezk <mnrzk@protonmail.com> wrote:
>
> On Saturday, October 5, 2019 9:04 PM, Mazin Rezk <mnrzk@protonmail.com> w=
rote:
>
> > This patch adds support for several MX mice over Bluetooth. The device =
IDs
> > have been copied from the libratbag device database and their features
> > have been based on their DJ device counterparts.
>
> No changes have been made to this patch in v4. However, it should be note=
d
> that the only device that has been thoroughly tested in this patch is the
> MX Master (b01e). Further testing for the other devices may be required.

Thanks a lot for the series, but please amend your format-patch process:
- The commit message should not contain the leading `>` characters,
and checkpath.pl then complains about Possible unwrapped commit
description (prefer a maximum 75 chars per line)
- this description of the changes is very useful, but it should go
after the first `---` so that we do not pull it while applying the
patch.

Also, this patch introduces a breakage in the bisectability of the
devices it adds. If we were to bisect a breakage in one of those
devices, the device will fail to work, and we could not detect where
the error comes from.

So please squash this patch with the next one.

Last, if we need "Further testing for the other devices may be
required", then I'd rather enable those device one by one when ewe get
the confirmation they are working. Adding a new device costs, but not
as much than breaking an existing one, especially when it gets
detected later, when the kernel gets shipped in distributions.
Note that I have the MX Master 0xB012, so you can safely keep that one
on the list, I'll test it myself.

Cheers,
Benjamin


>
> Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-=
hidpp.c
> index 0179f7ed77e5..85fd0c17cc2f 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -3773,6 +3773,24 @@ static const struct hid_device_id hidpp_devices[] =
=3D {
>         { /* MX5500 keyboard over Bluetooth */
>           HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb30b),
>           .driver_data =3D HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
> +       { /* MX Anywhere 2 mouse over Bluetooth */
> +         HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb013),
> +         .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb018),
> +         .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +       { /* MX Anywhere 2S mouse over Bluetooth */
> +         HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01a),
> +         .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +       { /* MX Master mouse over Bluetooth */
> +         HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012),
> +         .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb017),
> +         .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
> +         .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +       { /* MX Master 2S mouse over Bluetooth */
> +         HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb019),
> +         .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
>         {}
>  };
>
> --
> 2.23.0
>

