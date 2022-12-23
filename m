Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4AE4654D10
	for <lists+linux-input@lfdr.de>; Fri, 23 Dec 2022 08:58:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236002AbiLWH57 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Dec 2022 02:57:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235972AbiLWH56 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Dec 2022 02:57:58 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43373303F5
        for <linux-input@vger.kernel.org>; Thu, 22 Dec 2022 23:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671782229;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h6JPSOz29jTwJ0YryUTZktETnZ1Pej5C93Cx+9Ku8p8=;
        b=e4KHlAtNfPiRtIGhoyHK1ZhV1yaz2Pk+y53NDwmW7ysVN3+5lQYQ1eRFcT2M7KAT8l40Md
        ADxMngyJyOQWAw/cUM3N3OpFizQpYtrFFU+abtVhQHpH5jnMcKN4BHSDEMGyMxjE3sKMJV
        XSIa5lMH1AFgG2tz8xJjLGM/tLYin3s=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-258-ogcm8gMPOoemDdQQdbuz7A-1; Fri, 23 Dec 2022 02:57:07 -0500
X-MC-Unique: ogcm8gMPOoemDdQQdbuz7A-1
Received: by mail-io1-f71.google.com with SMTP id h26-20020a5e841a000000b006e408c1d2a1so1656187ioj.1
        for <linux-input@vger.kernel.org>; Thu, 22 Dec 2022 23:57:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6JPSOz29jTwJ0YryUTZktETnZ1Pej5C93Cx+9Ku8p8=;
        b=6hs5KRyzhG9iYzdMp/ac5/FH+0XWowvLK8pvHekVpO4nwisQJGDJunuCqCaxfEPhdM
         wbRNjrxLeCSXF71M2O43ZysWcwytM2Rpz0YCwZPluWC4nG1LYIQ6H/XJhfBwwq9UpbhZ
         Hj9keXWmt7q4BqOQI6aU/Oc5s8CrCTjeG4cFZ26sRWKryhEBYFVHcmsHHhHihfB8q/VX
         +7CmpF8YPJGrbMJEbbGUvpHcon+kB/CxYtCrpS8gk+CRnNs+yOJJE2/wK0EDLF7wF/Kl
         Xl3VTpiivCXowRel6QV7w3U8EMBjiIB1oyHfZzZx09373lFI0QQUD4Ynn0rwkupVKvdO
         0NJw==
X-Gm-Message-State: AFqh2koW5tkOX8AchgrKUb+1FNFHzAlXBJQ7/lTKaEoVKSEVASxcbCiD
        u+0J3O2P7qNaq6FHtYy+sGBUBkh8r7ckIxHVysqjlREargwb8lvNjSN1Y4rFKiZrIj7E2oKx/Vy
        bzJ5MuDMEySPc5qNeAjQbyU9DJmvfgWrfwOI/U5k=
X-Received: by 2002:a05:6602:449:b0:6df:bfeb:f15d with SMTP id e9-20020a056602044900b006dfbfebf15dmr601726iov.122.1671782226860;
        Thu, 22 Dec 2022 23:57:06 -0800 (PST)
X-Google-Smtp-Source: AMrXdXul/JG3tU45yCxXjtY5y0PD+KTdx2NAOL+RzXburGwdZQDXglWOwUDoX2f7f5t5Ph0s+MIs+kvGCZDgTzAD7Ng=
X-Received: by 2002:a05:6602:449:b0:6df:bfeb:f15d with SMTP id
 e9-20020a056602044900b006dfbfebf15dmr601713iov.122.1671782226592; Thu, 22 Dec
 2022 23:57:06 -0800 (PST)
MIME-Version: 1.0
References: <20221222-hid-v1-0-f4a6c35487a5@weissschuh.net>
 <20221222-hid-v1-2-f4a6c35487a5@weissschuh.net> <CAO-hwJL+zenkC+qPuPWLO-dFkg_pWoGTQYXR5mzSqUrnX6MObA@mail.gmail.com>
 <4d42a44d-e0f3-4d01-8564-267d0f3f061a@t-8ch.de>
In-Reply-To: <4d42a44d-e0f3-4d01-8564-267d0f3f061a@t-8ch.de>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 23 Dec 2022 08:56:55 +0100
Message-ID: <CAO-hwJKc6-9-sLrm8rAkk24diRAUcz2Y30bsCdeh63d_wMOWFA@mail.gmail.com>
Subject: Re: [PATCH 2/8] HID: usbhid: Make hid_is_usb() non-inline
To:     =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc:     =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        David Rheinsberg <david.rheinsberg@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 22, 2022 at 10:46 PM Thomas Wei=C3=9Fschuh <thomas@t-8ch.de> wr=
ote:
>
>
> Dec 22, 2022 16:13:06 Benjamin Tissoires <benjamin.tissoires@redhat.com>:
>
> > On Thu, Dec 22, 2022 at 6:16 AM Thomas Wei=C3=9Fschuh <linux@weissschuh=
.net> wrote:
> >>
> >> By making hid_is_usb() a non-inline function the lowlevel usbhid drive=
r
> >> does not have to be exported anymore.
> >>
> >> Also mark the argument as const as it is not modified.
> >>
> >> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> >> ---
> >> drivers/hid/usbhid/hid-core.c | 6 ++++++
> >> include/linux/hid.h           | 5 +----
> >> 2 files changed, 7 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-co=
re.c
> >> index be4c731aaa65..54b0280d0073 100644
> >> --- a/drivers/hid/usbhid/hid-core.c
> >> +++ b/drivers/hid/usbhid/hid-core.c
> >> @@ -1334,6 +1334,12 @@ struct hid_ll_driver usb_hid_driver =3D {
> >> };
> >> EXPORT_SYMBOL_GPL(usb_hid_driver);
> >>
> >> +bool hid_is_usb(const struct hid_device *hdev)
> >> +{
> >> +       return hdev->ll_driver =3D=3D &usb_hid_driver;
> >> +}
> >> +EXPORT_SYMBOL_GPL(hid_is_usb);
> >> +
> >> static int usbhid_probe(struct usb_interface *intf, const struct usb_d=
evice_id *id)
> >> {
> >>         struct usb_host_interface *interface =3D intf->cur_altsetting;
> >> diff --git a/include/linux/hid.h b/include/linux/hid.h
> >> index 8677ae38599e..e8400aa78522 100644
> >> --- a/include/linux/hid.h
> >> +++ b/include/linux/hid.h
> >> @@ -864,10 +864,7 @@ static inline bool hid_is_using_ll_driver(struct =
hid_device *hdev,
> >>         return hdev->ll_driver =3D=3D driver;
> >> }
> >>
> >> -static inline bool hid_is_usb(struct hid_device *hdev)
> >> -{
> >> -       return hid_is_using_ll_driver(hdev, &usb_hid_driver);
> >> -}
> >> +extern bool hid_is_usb(const struct hid_device *hdev);
> >
> > The problem here is that CONFIG_USB_HID can be set to either m or n.
> > In the n case, you'll end up with an undefined symbol, in the m case,
> > it won't link too if CONFIG_HID is set to Y (and it'll be quite a mess
> > to call it if the module is not loaded yet).
>
> Shouldn't we already have the same problem with
> the symbol usb_hid_driver itself that is defined
> right next to the new hid_is_usb()?

Yeah, sorry, my bad. All of the callers of this function are modules
which depend on CONFIG_USB_HID in the Kconfig, so we should be good.
Sorry for the noise.

I shouldn't do reviews at 10pm :(

Cheers,
Benjamin

>
> Thomas
>
> >>
> >> #define        PM_HINT_FULLON  1<<5
> >> #define PM_HINT_NORMAL 1<<1
> >>
> >> --
> >> 2.39.0
> >>
>

