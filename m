Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F564138864
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2020 23:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732914AbgALWC7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Jan 2020 17:02:59 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54067 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1732825AbgALWC7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Jan 2020 17:02:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578866578;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rSCFTAI+wk0Dg8E9VZJiKLl865QLUo2ai3rQpKta3fM=;
        b=DUPauVJCgHP1gCEyv70icSGkBU7LCADCvVMkqbwGarv9KXK5AP9hDOFejennymjgb8Ss84
        HqTwUaUWleDETZ2XDwpKpZM87QdNpv15uac61z3+Wc3oUle9FozApJXmYX9eq7xodRmeYz
        Hdd02odIJR9XKv8v4F7kJsfrsWfNxaM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-jfRzCJ1QNsqZK2PZqPaLTA-1; Sun, 12 Jan 2020 17:02:56 -0500
X-MC-Unique: jfRzCJ1QNsqZK2PZqPaLTA-1
Received: by mail-qv1-f69.google.com with SMTP id a14so5257153qvy.23
        for <linux-input@vger.kernel.org>; Sun, 12 Jan 2020 14:02:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rSCFTAI+wk0Dg8E9VZJiKLl865QLUo2ai3rQpKta3fM=;
        b=H+fKavdUxOEAJ+6zP/3NceT9vy1napBBvY9lBN+u0u0dQ3o9NKgHMeA0z2CHdcUg46
         TqjdCQm5NJ4P/V2JrcsWg82Tckk5vgbNfBlXhp9lYnEBcY/kbR592cjqc8RLX1ex+dY8
         pglu5HxfKwQKtGUvYW9/OEXmOfWgnKW3w/58KY7tkW97LLimxDzzxxIBtFdCjHBolYIl
         FkoegQwkhFSusXjAAYoRQ1ib+h2YS9pFcg25mdMlNAI6KDjqomyDyIj3ebf2LXeGJ/zq
         y6Oj9dGT93pHoipCdhcAbMrQdiZ22FFisv+XTQOvHNsSKCZnzsxnb4cpVBbcH46IAGDQ
         hl1Q==
X-Gm-Message-State: APjAAAUm9CQoKV5NyVLfoyROgrapwnmPtfpytzl4bxZaHORK2K/tfzrc
        kgrczuroah6ndhTrgMFPV8e6oCa3E9l5ud+m7JdDlMkE7Ud/PmRhlCtV1rKg2sgukZVI0I3HYpg
        JKn9VHO4tArb8smZJSPjKejEMfKx3CcGyx0Ys7QY=
X-Received: by 2002:a05:620a:1298:: with SMTP id w24mr13276582qki.170.1578866575832;
        Sun, 12 Jan 2020 14:02:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqxzT0foVOFPxvp83OMESm7URYtbJTEdQ+0SKh+HgT7DOstrS7E9KzD1fuiiETEDE8PWBVqBlOWYE10vRKg8okY=
X-Received: by 2002:a05:620a:1298:: with SMTP id w24mr13276562qki.170.1578866575522;
 Sun, 12 Jan 2020 14:02:55 -0800 (PST)
MIME-Version: 1.0
References: <20200112205021.3004703-1-lains@archlinux.org> <a69fce19ca3fe0c1f27c66b2444dc82891e8cf41.camel@archlinux.org>
In-Reply-To: <a69fce19ca3fe0c1f27c66b2444dc82891e8cf41.camel@archlinux.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 13 Jan 2020 08:02:44 +1000
Message-ID: <CAO-hwJJwpJ9j3QuQjptgmVaoquAGGZ40ii4_d4Ov6DmwH_ndrQ@mail.gmail.com>
Subject: Re: [PATCH] HID: logitech-hidpp: add support for the Powerplay mat/receiver
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Filipe,

On Mon, Jan 13, 2020 at 6:54 AM Filipe La=C3=ADns <lains@archlinux.org> wro=
te:
>
> On Sun, 2020-01-12 at 20:50 +0000, Filipe La=C3=ADns wrote:
> > The Logitech G Powerplay has a lightspeed receiver with a static
> > HID++
> > device with ID 7 attached to it to. It is used to configure the led
> > on
> > the mat. For this reason I increased the max number of devices.
> >
> > I also marked all lightspeed devices as HID++ compatible. As the
> > internal powerplay device does not have REPORT_TYPE_KEYBOARD or
> > REPORT_TYPE_KEYBOARD it was not being marked as HID++ compatible in
>   ^^^^^^^^^^^^^^^^^^^^
>    REPORT_TYPE_MOUSE
>
> Err, should I send another patch?

Yes please.

There are a few reasons for that:
- it takes more time to actually edit your commit message when
applying it, and this way I am actually testing your commit, not the
edited one
- it also means I have to remember that I need to fix up the commit
message (while if you send an updated version, you ensure that I will
not forget about it)
- it's a one patch series, so we can just have a look at the v2 (it
would have been a 20 patch series, things would have been different
because sending a v2 for one typo means you are sending 20 emails in
other maintainers mailbox)
- it's more efficient (you don't lose one hour waiting for me to
answer) to just send the v2 and a message telling us to discard the v1
:)

Cheers,
Benjamin
-

>
> > logi_hidpp_dev_conn_notif_equad.
> >
> > Signed-off-by: Filipe La=C3=ADns <lains@archlinux.org>
> > ---
> >  drivers/hid/hid-logitech-dj.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-
> > logitech-dj.c
> > index bb50d6e7745b..732380b55b15 100644
> > --- a/drivers/hid/hid-logitech-dj.c
> > +++ b/drivers/hid/hid-logitech-dj.c
> > @@ -16,11 +16,11 @@
> >  #include <asm/unaligned.h>
> >  #include "hid-ids.h"
> >
> > -#define DJ_MAX_PAIRED_DEVICES                        6
> > +#define DJ_MAX_PAIRED_DEVICES                        7
> >  #define DJ_MAX_NUMBER_NOTIFS                 8
> >  #define DJ_RECEIVER_INDEX                    0
> >  #define DJ_DEVICE_INDEX_MIN                  1
> > -#define DJ_DEVICE_INDEX_MAX                  6
> > +#define DJ_DEVICE_INDEX_MAX                  7
> >
> >  #define DJREPORT_SHORT_LENGTH                        15
> >  #define DJREPORT_LONG_LENGTH                 32
> > @@ -971,7 +971,7 @@ static void logi_hidpp_recv_queue_notif(struct
> > hid_device *hdev,
> >       case 0x0c:
> >               device_type =3D "eQUAD Lightspeed 1";
> >               logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report,
> > &workitem);
> > -             workitem.reports_supported |=3D STD_KEYBOARD;
> > +             workitem.reports_supported |=3D STD_KEYBOARD | HIDPP;
> >               break;
> >       case 0x0d:
> >               device_type =3D "eQUAD Lightspeed 1_1";
> > @@ -1850,6 +1850,10 @@ static const struct hid_device_id
> > logi_dj_receivers[] =3D {
> >         HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> >               USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1),
> >        .driver_data =3D recvr_type_gaming_hidpp},
> > +     { /* Logitech powerplay mat/receiver (0xc539) */
> > +       HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> > +             0xc53a),
> > +      .driver_data =3D recvr_type_gaming_hidpp},
> >       { /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
> >         HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> > USB_DEVICE_ID_MX3000_RECEIVER),
> >        .driver_data =3D recvr_type_27mhz},
>
> --
> Filipe La=C3=ADns

