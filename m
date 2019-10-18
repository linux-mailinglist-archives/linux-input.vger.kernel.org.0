Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00EA1DC8DD
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 17:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732188AbfJRPgV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 11:36:21 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:50150 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726796AbfJRPgV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 11:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571412979;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lyYjRHP3gN7IAdSg/zSTXjc0q+hU5LSKzHOdTvgAUVk=;
        b=dWIlHgEm6YEfpaijuGRdB2paS3IGGBADu42Ipuem/Sh1tJiWUkq4ZDGOF9ADFuknG9CA/I
        M9bKBoLZillET2jOol/L1oJVAKwezXL2UCqcKLjBOwkh2h0uUxohri/v3E1FMjdvCjkJMk
        O9jyR1Yxbmmzhzft0I/FSeWDxbe2iuc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-XzmLYxWbM9CsPrPdhe6wMQ-1; Fri, 18 Oct 2019 11:36:17 -0400
Received: by mail-qt1-f199.google.com with SMTP id z12so6274568qtn.3
        for <linux-input@vger.kernel.org>; Fri, 18 Oct 2019 08:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3XjpxhccyZHQzqrK60FF7DFkSZmCbVnNJ0TkofNodrU=;
        b=tyZO7TxEAruOGhF7kEKq1/GBkBcglxuhG/Q637M6wwwwLK4+3Z1M/mLSVLzNQ03rbd
         62bLUFU5gMamVyrGcwcnrCaOwbWhBhtA01HivXM3QrClKM62ko3u9vLLG/OlY0RYiyCa
         BovGw6KxM292O9aJBd383pC/wem/6vAbsBX9VFsIe3JOXW7BGr0CY5yqHn83Akxm7TC+
         MtmPteu+j13pL83jwl5hO/1WLf1RyER9c1phTSnxDcO276huDz+9k+oiMAiwv4zc0NPw
         i5zTfplGwRMJPGaFpC59DG4EorqVUXPoAfxf9Xoqtlyj7POOmI4okPlwY1iJDlUG7q/s
         n2iA==
X-Gm-Message-State: APjAAAVh9KbCJXC5SDOJEXYGgFZa0Gs22zFzP2H6Vv0Xv+6Rw27Iy5hi
        h0nnurNnW1MzGC1SCfHuzcFR0WnRZ4FoPnt9jVCjzxSDiYxlKBS73Va99p5k3EncszOE7XpfMbU
        Vu42GbLXI19NyrYaH7bVkNBGKx824A2E4qeOks6w=
X-Received: by 2002:a0c:8eca:: with SMTP id y10mr10417378qvb.138.1571412976769;
        Fri, 18 Oct 2019 08:36:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyTyDdlpvS579S+SFTu+02sCbWuhKx0mODNMGrum4qpeM6witBSpxOSFS1KklAzUZNuddH9XQ07M2b48KhYCS4=
X-Received: by 2002:a0c:8eca:: with SMTP id y10mr10417349qvb.138.1571412976482;
 Fri, 18 Oct 2019 08:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <ggKipcQplIlTFmoP3hPnrQ-7_5-C0PKGd5feFymts3uenIBA8zOwz47YmKheD34H1rpkguDAGdx5YbS9UqpwfjT5Ir0Lji941liLVp--QtQ=@protonmail.com>
In-Reply-To: <ggKipcQplIlTFmoP3hPnrQ-7_5-C0PKGd5feFymts3uenIBA8zOwz47YmKheD34H1rpkguDAGdx5YbS9UqpwfjT5Ir0Lji941liLVp--QtQ=@protonmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 18 Oct 2019 17:36:05 +0200
Message-ID: <CAO-hwJJ18L3nDMQ_OqCZPyA+FFk3QsnbY=dYSNkELWzTSAnQLA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] HID: logitech: Add MX Master over Bluetooth
To:     Mazin Rezk <mnrzk@protonmail.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
X-MC-Unique: XzmLYxWbM9CsPrPdhe6wMQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Mazin,

On Mon, Oct 14, 2019 at 8:36 PM Mazin Rezk <mnrzk@protonmail.com> wrote:
>
> This patch adds support for the MX Master (b01e and b012) and also adds
> foundational code for other Bluetooth LE HID++ devices to be added.
>
> Some devices do not support short reports and thus have a quirk
> (HIDPP_QUIRK_MISSING_SHORT_REPORTS) that forces short reports to be sent =
as
> long reports. Since all Bluetooth LE HID++ devices seem to act this way,
> HIDPP_QUIRK_CLASS_BLUETOOTH_LE aliases this quirk.
>
> To allow for some space for future quirks, I changed the comment that
> defines the bits reserved for classes from 2...20 to 2..15.
>
> Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-=
hidpp.c
> index 0179f7ed77e5..997b1056850a 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -59,7 +59,8 @@ MODULE_PARM_DESC(disable_tap_to_click,
>  #define HIDPP_QUIRK_CLASS_G920                 BIT(3)
>  #define HIDPP_QUIRK_CLASS_K750                 BIT(4)
>
> -/* bits 2..20 are reserved for classes */
> +/* bits 2..15 are reserved for classes */
> +#define HIDPP_QUIRK_MISSING_SHORT_REPORTS      BIT(20)
>  /* #define HIDPP_QUIRK_CONNECT_EVENTS          BIT(21) disabled */
>  #define HIDPP_QUIRK_WTP_PHYSICAL_BUTTONS       BIT(22)
>  #define HIDPP_QUIRK_NO_HIDINPUT                        BIT(23)
> @@ -81,6 +82,8 @@ MODULE_PARM_DESC(disable_tap_to_click,
>                                          HIDPP_QUIRK_HI_RES_SCROLL_X2120 =
| \
>                                          HIDPP_QUIRK_HI_RES_SCROLL_X2121)
>
> +#define HIDPP_QUIRK_CLASS_BLUETOOTH_LE HIDPP_QUIRK_MISSING_SHORT_REPORTS
> +
>  #define HIDPP_QUIRK_DELAYED_INIT               HIDPP_QUIRK_NO_HIDINPUT
>
>  #define HIDPP_CAPABILITY_HIDPP10_BATTERY       BIT(0)
> @@ -340,6 +343,12 @@ static int hidpp_send_rap_command_sync(struct hidpp_=
device *hidpp_dev,
>         struct hidpp_report *message;
>         int ret, max_count;
>
> +       /* Force long reports on devices that do not support short report=
s */
> +       if (hidpp_dev->quirks & HIDPP_QUIRK_MISSING_SHORT_REPORTS &&
> +           report_id =3D=3D REPORT_ID_HIDPP_SHORT)
> +               report_id =3D REPORT_ID_HIDPP_LONG;

Wouldn't it be faster to just store which report needs to be put here
in struct hidpp_device?

> +
> +
>         switch (report_id) {
>         case REPORT_ID_HIDPP_SHORT:
>                 max_count =3D HIDPP_REPORT_SHORT_LENGTH - 4;
> @@ -3482,6 +3491,12 @@ static bool hidpp_validate_report(struct hid_devic=
e *hdev, int id,
>
>  static bool hidpp_validate_device(struct hid_device *hdev)
>  {
> +       struct hidpp_device *hidpp =3D hid_get_drvdata(hdev);
> +       /* Skip the short report check if the device does not support it =
*/
> +       if (hidpp->quirks & HIDPP_QUIRK_MISSING_SHORT_REPORTS)
> +               return hidpp_validate_report(hdev, REPORT_ID_HIDPP_LONG,
> +                                            HIDPP_REPORT_LONG_LENGTH, fa=
lse);
> +

I just merged Andrey's report detection, which means you will need to
update this hunk:
https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=3Dfor=
-5.4/upstream-fixes&id=3D905d754c53a522aacf806ea1d3e7c929148c1910

The good thing, is that now you can simply auto-detect if the short
report is missing. If the returned report_length is null, you know
that the report is missing (and thus you can remember to set the
quirk/which report id is needed).

Cheers,
Benjamin

>         return hidpp_validate_report(hdev, REPORT_ID_HIDPP_SHORT,
>                                      HIDPP_REPORT_SHORT_LENGTH, false) &&
>                hidpp_validate_report(hdev, REPORT_ID_HIDPP_LONG,
> @@ -3773,6 +3788,13 @@ static const struct hid_device_id hidpp_devices[] =
=3D {
>         { /* MX5500 keyboard over Bluetooth */
>           HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb30b),
>           .driver_data =3D HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
> +       { /* MX Master mouse over Bluetooth */
> +         HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012),
> +         .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
> +                        HIDPP_QUIRK_CLASS_BLUETOOTH_LE },
> +       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
> +         .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 |
> +                        HIDPP_QUIRK_CLASS_BLUETOOTH_LE },
>         {}
>  };
>
> --
> 2.23.0
>

