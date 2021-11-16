Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1574B452D9F
	for <lists+linux-input@lfdr.de>; Tue, 16 Nov 2021 10:12:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232643AbhKPJPJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Nov 2021 04:15:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55194 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232832AbhKPJOw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Nov 2021 04:14:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637053914;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cKKKPjRmVQQMXFBw4I5WdeXLUXv1of0/lTkYOZVFM6o=;
        b=K2rKkN8dtl+/6CGhHLeVe3OLW1zqYdDYk839rahSWcst/5z17Aye/ApxSOMbZXlKSa+Dny
        mwmPNJwnq8iNglSj7C09bi3oqnLCiWEOQS9hZEJpAV2Lwgut+xVRFsg/2qJ7JRq5bFLtKk
        yXePMHiF4vCgYX5xFQPowY97i74z/hQ=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-PGCMontcPKa0jhAhA2J5ag-1; Tue, 16 Nov 2021 04:11:52 -0500
X-MC-Unique: PGCMontcPKa0jhAhA2J5ag-1
Received: by mail-pj1-f72.google.com with SMTP id iq9-20020a17090afb4900b001a54412feb0so1294520pjb.1
        for <linux-input@vger.kernel.org>; Tue, 16 Nov 2021 01:11:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cKKKPjRmVQQMXFBw4I5WdeXLUXv1of0/lTkYOZVFM6o=;
        b=kBMOGclUmA98cgB01vXgPsJJ6V4JTSjpn8b1VctTOAzkPKHk8cZtE+DnjIoXgl2hDM
         O6vQYpUnKMigwQ+S5iIOx6oDvwkdhGUxURUmXH6jlNmcoRIHEg6L4NKlQrQQthE17B97
         2qfnrAmHeo3y9tzWryxie1Vx9G7lQ4ZrUOceqhfrzzygOBGQy2Tbr3R9ZSXAZYwMR9Ma
         rsM6ykuzRoRNz6xujoW8HdjOQVrvPwtR2WVqARFat1EUyeHxpV9COqDIe2tq0mHwNCjQ
         +PqKk8SdJJPr6bghsBUEcVoDgwkGO6j2tJsqtgKoWduRqZBRylkqwk5pyC1uOq6yw8HR
         wrYQ==
X-Gm-Message-State: AOAM532rCMUkHxJmblCP4mD/4Tc/ME8zhQWKAf9VewW2ftEStn4kMMot
        bLh3wIorFf9jOlNp09me6I9RBP80sIefM659bWmabo5EnqYx7efbfbXfqvNMrPk5RlNN/+PlXFX
        9SMLyl35ZgYihQGJglqb74Jj5VfRjmrTDGp+TP+4=
X-Received: by 2002:a17:902:6acb:b0:142:76c3:d35f with SMTP id i11-20020a1709026acb00b0014276c3d35fmr43033846plt.89.1637053911527;
        Tue, 16 Nov 2021 01:11:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdIhzemi1V7+z3ke5bwP8cY8U1AZOOOEYZgffpWrUno8OAT6qpNQ+lsidETLKrDsyjbci9wDcYTqkgxnEneB0=
X-Received: by 2002:a17:902:6acb:b0:142:76c3:d35f with SMTP id
 i11-20020a1709026acb00b0014276c3d35fmr43033819plt.89.1637053911310; Tue, 16
 Nov 2021 01:11:51 -0800 (PST)
MIME-Version: 1.0
References: <20211112135511.29573-1-linux@zary.sk> <CAO-hwJLZ8roXUxnB5Umyjd_22KFGbFMouxdVM0GLSSLrktteAg@mail.gmail.com>
 <202111150937.31306.linux@zary.sk>
In-Reply-To: <202111150937.31306.linux@zary.sk>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 16 Nov 2021 10:11:40 +0100
Message-ID: <CAO-hwJ+B3er4PdNh1Nq3iGC+1bC1Gd0NZZ+UkRvGDXocTiXrXg@mail.gmail.com>
Subject: Re: [PATCH] hid-multitouch: Fix Iiyama ProLite T1931SAW (0eef:0001 again!)
To:     Ondrej Zary <linux@zary.sk>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 15, 2021 at 9:37 AM Ondrej Zary <linux@zary.sk> wrote:
>
> On Friday 12 November 2021, Benjamin Tissoires wrote:
> > Hi Ondrej,
> >
> > On Fri, Nov 12, 2021 at 3:00 PM Ondrej Zary <linux@zary.sk> wrote:
> > >
> > > Iiyama ProLite T1931SAW does not work with Linux - input devices are
> > > created but cursor does not move.
> > >
> > > It has the infamous 0eef:0001 ID which has been reused for various
> > > devices before.
> > >
> > > It seems to require export_all_inputs = true.
> > > Add it to mt_devices[] as MT_CLS_WIN_8 to fix the problem.
> > > Hopefully there are no HID devices using this ID that will break.
> > > It should not break non-HID devices (handled by usbtouchscreen).
> >
> > Hmm, this is worrisome. I am pretty sure there were some eGalax 0001
> > devices that were Win 7 compatible and I am not sure if they are
> > compatible with Win8...
> >
> > I guess that if you have to set MT_CLS_WIN_8, the device is not
> > detected as such. so how about you use:
> > MT_CLS_EXPORT_ALL_INPUTS instead, (to keep MT_CLS_DEFAULT for those
> > devices), and restrict the VID/PID matching to the non Win8 devices:
>
> It works with MT_CLS_EXPORT_ALL_INPUTS.
>
> > HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, USB_VENDOR_ID_DWAV,
> > USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER)
>
> But does not match HID_GROUP_GENERIC.

Sorry, it should have been HID_GROUP_MULTITOUCH

Cheers,
Benjamin

>
> >
> > ?
> >
> > Cheers,
> > Benjamin
> >
> > >
> > > Signed-off-by: Ondrej Zary <linux@zary.sk>
> > > ---
> > >  drivers/hid/hid-multitouch.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> > > index e1afddb7b33d..099daf590392 100644
> > > --- a/drivers/hid/hid-multitouch.c
> > > +++ b/drivers/hid/hid-multitouch.c
> > > @@ -1888,6 +1888,11 @@ static const struct hid_device_id mt_devices[] = {
> > >                 MT_USB_DEVICE(USB_VENDOR_ID_CVTOUCH,
> > >                         USB_DEVICE_ID_CVTOUCH_SCREEN) },
> > >
> > > +       /* eGalax devices (SAW) */
> > > +       { .driver_data = MT_CLS_WIN_8,
> > > +               MT_USB_DEVICE(USB_VENDOR_ID_DWAV,
> > > +                       USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER) },
> > > +
> > >         /* eGalax devices (resistive) */
> > >         { .driver_data = MT_CLS_EGALAX,
> > >                 MT_USB_DEVICE(USB_VENDOR_ID_DWAV,
> > > --
> > > Ondrej Zary
> > >
> >
> >
>
>
>
> --
> Ondrej Zary
>

