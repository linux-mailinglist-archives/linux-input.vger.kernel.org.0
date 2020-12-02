Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF8812CB3EE
	for <lists+linux-input@lfdr.de>; Wed,  2 Dec 2020 05:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgLBEb5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 23:31:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbgLBEb4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Dec 2020 23:31:56 -0500
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B26C0613CF
        for <linux-input@vger.kernel.org>; Tue,  1 Dec 2020 20:31:16 -0800 (PST)
Received: by mail-il1-x141.google.com with SMTP id z14so346820ilm.10
        for <linux-input@vger.kernel.org>; Tue, 01 Dec 2020 20:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DanhsUlifIoCTIthIs1n43gfefn3vyWMJQs2RPqSdds=;
        b=gQUkYqHmJbnJTzO+LQQyRp2i51AqMF1wqOne4732g3Xv0iRCBzhmRHqWJkSdDceWQD
         JMW1D49wJwyFsXBcE4YDeY/aHbK745YC0kmbMWXRN1wtRKEXSpagLWhOovNMiELd3cp9
         8FD+FxQ6UTMrrnPxL4MAUgZzadTsNkOf22k0DRL/6JYXS0MZJOz8w1ng6225Ml7+Rw3X
         rGtTWSjbtaALoCAF+Na4kHbaMIl3QlD0iNcJ6lPJM3+MYUvS5AEaIHbZXU9o8DggF30I
         MvyF8mfNjX9RSfkj+/60I7KkyJgoQqa/G4PepIBu1lYsXjnkLJLC2h5SoScBeuNPWJf6
         6daA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DanhsUlifIoCTIthIs1n43gfefn3vyWMJQs2RPqSdds=;
        b=AciacJqWxU3T2mlMF4x3LBuwbCPChasgD6LuXvaDaOR0g/jj4tLjfU1gYU2KrFf30T
         um8GJUun+H2LjcGQAtwDnmGzdu6zZlABOAJnnQBEJnlLdLWkNKS/UqKHWtSeaB1rOpzK
         NOg9Up3R5OPg+mvMPCeS+hJcK3UoHAPmD3sqDNfRQHsZ08F3W1reQiF40YjP5pBm3TDO
         M8g6iiVQ9tu4ZVkYKmVRrps3vPx9i1d+SAzFOQEcG3jd9eaf4OnfmCZebqD5XbO9/WjM
         VaeShd+Nq/cuE5Q/pSpEHjF9+yx3qjjAIuZvXHEjju9Mt/8t8DtVY9ZlWxhot0ZtI7oP
         zjGQ==
X-Gm-Message-State: AOAM533bHwD1R5GjKS9Z5AjVUH/I+d145f35YXjWDhoBnxGazXgFd2L8
        BeTwhHat67P+AEfLxikl74rVJJFn5WVDVQx3jrA=
X-Google-Smtp-Source: ABdhPJzS3aUnsq97hhIp0jJzWr/Moa1H0P/JDhr/YuhKFIuwWzhTkGhMTub1FOs2pRzclN9+S4QA274gb+ZlTIy3X3U=
X-Received: by 2002:a05:6e02:80b:: with SMTP id u11mr791592ilm.43.1606883475696;
 Tue, 01 Dec 2020 20:31:15 -0800 (PST)
MIME-Version: 1.0
References: <20201119082232.8774-1-felixhaedicke@web.de>
In-Reply-To: <20201119082232.8774-1-felixhaedicke@web.de>
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Tue, 1 Dec 2020 20:31:04 -0800
Message-ID: <CAKdAkRSyi53f0pwyzmNP4fNhkDT4P5vV_aDneZuCKTqWDvb+Kg@mail.gmail.com>
Subject: Re: [PATCH] HID: quirks: Add Apple Magic Trackpad 2 to
 hid_have_special_driver list
To:     =?UTF-8?Q?Felix_H=C3=A4dicke?= <felixhaedicke@web.de>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "Sean O'Brien" <seobrien@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 19, 2020 at 12:31 AM Felix H=C3=A4dicke <felixhaedicke@web.de> =
wrote:
>
> The Apple Magic Trackpad 2 is handled by the magicmouse driver. And
> there were severe stability issues when both drivers (hid-generic and
> hid-magicmouse) were loaded for this device.
>
> Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=3D210241

+Jiri Kosina +Benjamin Tissoires for visibility.

>
> Signed-off-by: Felix H=C3=A4dicke <felixhaedicke@web.de>
> ---
>  drivers/hid/hid-quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 7a2be0205dfd..0a589d956e5c 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -473,6 +473,8 @@ static const struct hid_device_id hid_have_special_dr=
iver[] =3D {
>  #if IS_ENABLED(CONFIG_HID_MAGICMOUSE)
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_M=
AGICMOUSE) },
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_M=
AGICTRACKPAD) },
> +       { HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MA=
GICTRACKPAD2) },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGICTR=
ACKPAD2) },
>  #endif
>  #if IS_ENABLED(CONFIG_HID_MAYFLASH)
>         { HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGONRI=
SE_PS3) },
> --
> 2.29.2
>

Thanks.

--=20
Dmitry
