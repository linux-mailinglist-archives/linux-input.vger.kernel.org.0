Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 248942CBA76
	for <lists+linux-input@lfdr.de>; Wed,  2 Dec 2020 11:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729351AbgLBKWo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Dec 2020 05:22:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26697 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727873AbgLBKWn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 2 Dec 2020 05:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606904477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oegfJFOhvCdJGP+VONmFh1f37ulw7B2LInL2YgadOGA=;
        b=PDA4zVEvvwUbRSlZcz7W4vWmWJICCf/1lwHjILjhMeoN8gshaffsMc491gR1ehtqJAAMM3
        Sbxwsor2ul8/RqaQ84qLM1C1VfHohinaNRG+q7ReiliNraxHv+hsFGDr46IPoMNid3kwrX
        lGtdVkxeq8GNE+IckdvrMqozivxbGxo=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-iEQc2dTyP-6ixdAq9xCIUg-1; Wed, 02 Dec 2020 05:21:15 -0500
X-MC-Unique: iEQc2dTyP-6ixdAq9xCIUg-1
Received: by mail-pl1-f200.google.com with SMTP id w9so831643plp.1
        for <linux-input@vger.kernel.org>; Wed, 02 Dec 2020 02:21:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oegfJFOhvCdJGP+VONmFh1f37ulw7B2LInL2YgadOGA=;
        b=g2w7zXFjc+EoVu4hsopOFwObic7b8ors+lBp31q1FbZIMIMpMHlHzCtQduVz1EF2Z8
         xfsEdHfn2/ExUaR+yAwLHdvXGvcoLaIgnUPEQOBdk4ecJ+IhnV5hXCG59vlKlljfKA/o
         XPRoWFn1BTTam1Cs7Ce1byaXfzGdqRATIi80dnoub15AY3+GzmStRf7ZJHmSFbG894wc
         13co/5KZzpnEcZk+eXMQzohUlq9cI0Of7ilEpXn9W2rj9yH2AeNWcXMJMWuE7przrmln
         59ejAOC6v5fCh6vxFD09fg+LgO/sAiM3hX49r7ZbfZp6qD85EZ6KD+O1A91QDZvtmGsp
         +jyw==
X-Gm-Message-State: AOAM533Af0Uunl5UtIET2sopvZhafmzxdFpmmKd60Ua/iIdmaieHlMfJ
        7bUeVuSdGC3BmLR3l0U9wKWpGebgPDU1H41Mfzzvj4fySTQWJRk4mGri0HcLw1XCb+JfWC+K8Eg
        MeRymmsp2CmPypOsF1r9jybTNMmV5+1igeZUe0ZI=
X-Received: by 2002:a63:b60:: with SMTP id a32mr1967998pgl.275.1606904474353;
        Wed, 02 Dec 2020 02:21:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvdAOKkQnkechwxaXwXokr1ZNaTIHdeJBUyuOQeYlCFBsPUQEDz8ggCQYX8l2N4hm+hMQYzqkBX4blUP+WPdU=
X-Received: by 2002:a63:b60:: with SMTP id a32mr1967984pgl.275.1606904474094;
 Wed, 02 Dec 2020 02:21:14 -0800 (PST)
MIME-Version: 1.0
References: <20201119082232.8774-1-felixhaedicke@web.de> <CAKdAkRSyi53f0pwyzmNP4fNhkDT4P5vV_aDneZuCKTqWDvb+Kg@mail.gmail.com>
In-Reply-To: <CAKdAkRSyi53f0pwyzmNP4fNhkDT4P5vV_aDneZuCKTqWDvb+Kg@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 2 Dec 2020 11:21:03 +0100
Message-ID: <CAO-hwJLk5hpBQA=Xy4Hmfhx8iMJp+TuqyV33r2ocJX7JW-PkFQ@mail.gmail.com>
Subject: Re: [PATCH] HID: quirks: Add Apple Magic Trackpad 2 to
 hid_have_special_driver list
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?Q?Felix_H=C3=A4dicke?= <felixhaedicke@web.de>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "Sean O'Brien" <seobrien@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Felix,

On Wed, Dec 2, 2020 at 5:31 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Thu, Nov 19, 2020 at 12:31 AM Felix H=C3=A4dicke <felixhaedicke@web.de=
> wrote:
> >
> > The Apple Magic Trackpad 2 is handled by the magicmouse driver. And
> > there were severe stability issues when both drivers (hid-generic and
> > hid-magicmouse) were loaded for this device.
> >
> > Fixes: https://bugzilla.kernel.org/show_bug.cgi?id=3D210241

As mentioned in the bug, this hardly looks like the correct solution.

The magicmouse is one of the 2 only drivers that calls
`hid_register_report` and then overwrites the size of the report
manually. I can not figure out immediately if this is wrong, and how
that would impact a free in usbhid, but this is highly suspicious to
me.

Cheers,
Benjamin

>
> +Jiri Kosina +Benjamin Tissoires for visibility.
>
> >
> > Signed-off-by: Felix H=C3=A4dicke <felixhaedicke@web.de>
> > ---
> >  drivers/hid/hid-quirks.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> > index 7a2be0205dfd..0a589d956e5c 100644
> > --- a/drivers/hid/hid-quirks.c
> > +++ b/drivers/hid/hid-quirks.c
> > @@ -473,6 +473,8 @@ static const struct hid_device_id hid_have_special_=
driver[] =3D {
> >  #if IS_ENABLED(CONFIG_HID_MAGICMOUSE)
> >         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE=
_MAGICMOUSE) },
> >         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE=
_MAGICTRACKPAD) },
> > +       { HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_=
MAGICTRACKPAD2) },
> > +       { HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC=
TRACKPAD2) },
> >  #endif
> >  #if IS_ENABLED(CONFIG_HID_MAYFLASH)
> >         { HID_USB_DEVICE(USB_VENDOR_ID_DRAGONRISE, USB_DEVICE_ID_DRAGON=
RISE_PS3) },
> > --
> > 2.29.2
> >
>
> Thanks.
>
> --
> Dmitry
>

