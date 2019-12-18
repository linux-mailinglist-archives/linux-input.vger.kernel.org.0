Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD24D124C31
	for <lists+linux-input@lfdr.de>; Wed, 18 Dec 2019 16:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbfLRPva (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Dec 2019 10:51:30 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:42678 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726987AbfLRPv3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Dec 2019 10:51:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576684288;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=hjoNYTB0nwjtBMHN5Fv/eqnWp7ARXc/eIJAPBJb5kFE=;
        b=O98W1ErLi/DMU9fR17Ehj3rGQ0rMBXuufm79VCq9rIC4GT9c8RfpezeOC7Li09ONWlkYiX
        Np4dM4Mn70Ek5SrKNf7PpX2mEnwZU3dObmvwybvd5wNqiA498TxXZE0FM6KTj11/Z8ZqHb
        WVnrCaabg/UxGqe72geZzjJNeXmZkfE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-LqhHntCfNQKZHCboEbXm_w-1; Wed, 18 Dec 2019 10:51:27 -0500
X-MC-Unique: LqhHntCfNQKZHCboEbXm_w-1
Received: by mail-qv1-f72.google.com with SMTP id g6so1610269qvp.0
        for <linux-input@vger.kernel.org>; Wed, 18 Dec 2019 07:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hjoNYTB0nwjtBMHN5Fv/eqnWp7ARXc/eIJAPBJb5kFE=;
        b=pt0NfjEcE3JhWR72TnUFcF2EE/weWeKwkIe8g/knckz3i6k2041aM3EjD8mpyL67Ll
         o9dI8U4yKOUC3i9DimITLPC4pxB6qL+peoPL0bIRTffbH2Tp2cTT3xdJsT22kq3HX8ua
         zzE9Ix54iDUi8rVra4bGWaOO9QVWVgTNZNKzwYMxGaKUSdvuCdd4yJi49O6acj21bPAA
         Q9xvH+WwpA1YOZm3tzE5Hke8z8iAEbz5CeEOej1wMKP04XXSR71Jx5vElySl94wQjtpN
         jpbR6nmVCDsAUqXUANdWzioYDYFq2nVyCk2rT92Sj+9M2WLzARDSVMUZR4WveNSkyZ52
         EmIA==
X-Gm-Message-State: APjAAAV7O6RA4aA0m8W8LUiuCN9XUUCLsNWLUkt/8aTWTV5jHIhZrJHe
        gRFKCgmuFnFePzayRs45fPP09EzQuXWWH4ETEdU2xqkN1O19Hs42ds1ZZGHx4uzLMgVsQLWPPAI
        2EjcLqehg9PGVHVTRuBXvW0NLq/M6hL0k1SfEYjA=
X-Received: by 2002:a05:620a:1298:: with SMTP id w24mr3168686qki.170.1576684286789;
        Wed, 18 Dec 2019 07:51:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqwTGx09A7rOTcxpydZHHCU5OCDCUka85+n1TFEINxGXGAHVTOA8RI1bZgWXgm5MUSGoVIrN7IpJBkxdGqAgepI=
X-Received: by 2002:a05:620a:1298:: with SMTP id w24mr3168676qki.170.1576684286561;
 Wed, 18 Dec 2019 07:51:26 -0800 (PST)
MIME-Version: 1.0
References: <20191025205928.87295-1-adrian@freund.io> <De3ZOlDrC8MZTFGbvc8QlYmWDm7P6Lm69IYASbTfvHaX6FbLYT6ZTznFRNZVvKiBD1lGbp5Om90U_EPPRP6IafvJ19ebBm-RWx69MRZYy4E=@protonmail.com>
In-Reply-To: <De3ZOlDrC8MZTFGbvc8QlYmWDm7P6Lm69IYASbTfvHaX6FbLYT6ZTznFRNZVvKiBD1lGbp5Om90U_EPPRP6IafvJ19ebBm-RWx69MRZYy4E=@protonmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 18 Dec 2019 16:51:15 +0100
Message-ID: <CAO-hwJJpt0z-LdgyV_ujTFizeDF1ZM1D5Fik=KupobxGRY3+LQ@mail.gmail.com>
Subject: Re: [PATCH v3] HID: logitech: Add MX Master 3 Mouse
To:     Mazin Rezk <mnrzk@protonmail.com>
Cc:     Adrian Freund <adrian@freund.io>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Oct 27, 2019 at 6:51 PM Mazin Rezk <mnrzk@protonmail.com> wrote:
>
> On Friday, October 25, 2019 4:59 PM, Adrian Freund <adrian@freund.io> wrote:
>
> > This patch adds support for the Logitech MX Master 3 Mouse using the
> > Logitech Unifying Receiver and Bluetooth LE.
> >
> > Signed-off-by: Adrian Freund adrian@freund.io
> >
> > v3:
> >
> > -   rebased on top of https://patchwork.kernel.org/project/linux-input/list/?series=190445
>
> I have updated this series over here:
> https://patchwork.kernel.org/project/linux-input/list/?series=194201
>
> However, the update only squashed two commits within the series so nothing
> needs to be done here.

Yep, thanks both of you.

Applied to for-5.6/logitech, sorry for the delay.

Cheers,
Benjamin

>
> Thanks,
> Mazin
>
> > -   Added bluetooth id
> >
> >     v2:
> >
> > -   added Signed-off-by line
> >
> > drivers/hid/hid-logitech-hidpp.c | 5 +++++
> > 1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> > index 23baf9b09c48..74f2517d88d5 100644
> > --- a/drivers/hid/hid-logitech-hidpp.c
> > +++ b/drivers/hid/hid-logitech-hidpp.c
> > @@ -3793,6 +3793,8 @@ static const struct hid_device_id hidpp_devices[] = {
> > { LDJ_DEVICE(0x4071), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > { /* Mouse Logitech MX Master 2S */
> > LDJ_DEVICE(0x4069), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> >
> > -   { /* Mouse Logitech MX Master 3 */
> > -       LDJ_DEVICE(0x4082), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> >
> >
> >     { /* Mouse Logitech Performance MX/
> >     LDJ_DEVICE(0x101a), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_1P0 },
> >     { / Keyboard logitech K400 */@@ -3854,6 +3856,9 @@ static const struct hid_device_id hidpp_devices[] = {
> >     .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> >     { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
> >     .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> >
> > -   { /* MX Master 3 mouse over Bluetooth */
> > -       HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb023),
> >
> >
> > -       .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> >
> >
> >     {}
> >     };
> >
> >     --
> >     2.23.0
> >
>
>

