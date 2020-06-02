Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 423541EB81A
	for <lists+linux-input@lfdr.de>; Tue,  2 Jun 2020 11:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgFBJOZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 2 Jun 2020 05:14:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20034 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726215AbgFBJOY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Jun 2020 05:14:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591089262;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=4RDDGu/p3yDXdb7tcQQ0NXx81PbLpa+m/UKBUd+JAOM=;
        b=Oo56AxdHmF7A3xu3tjLlX+cY6uR00oyqyghbu8RBjn3LyKNkuLKpxAIzLHxzjRZNF7k/nW
        /g/CpN9jkiqQqZ+oByJwgBEEwlfEgB/KtCaVMhpVY7CEgXkQ0VZA5P7+vSwdtmePMb4Ybc
        fQnWKHirGKwHwaiCCgYelG/XriIzxWQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-3d_pAlHFOGOFJI-o--4WfA-1; Tue, 02 Jun 2020 05:14:21 -0400
X-MC-Unique: 3d_pAlHFOGOFJI-o--4WfA-1
Received: by mail-qv1-f72.google.com with SMTP id a8so2930546qvt.7
        for <linux-input@vger.kernel.org>; Tue, 02 Jun 2020 02:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4RDDGu/p3yDXdb7tcQQ0NXx81PbLpa+m/UKBUd+JAOM=;
        b=BH8cSB97nm63lZoowoO90HC11wgUWAvYuVnDGDmKt6NT44ouAeh4wpssgdJq1uRaq3
         uKW8yhayhaMxfHsmU7a1SP8AgJWJ2f5Mo9sVdME+VbUVmYf0l2DIHYmEfMrc9Ej32Cht
         V7hn7bEmUft0OBlUmfcArwAD6t52gll+2ErT4pf57Ga+5bkh44s7kPrBAwCD2/q8vlSu
         nv43XWz6rEpIM4Hk45jv5dadhciHUaOLWtBTWd5xf4sutteBOe4FWG4LohOO+LBTC5dX
         xK4HuGgsrT4W8gUPmLSC2i/and9CB9RVv3RpsyMfCZtW4m+ZHbNAObRoEWr+eMz/ZXRM
         jjVg==
X-Gm-Message-State: AOAM533TJ2Sbj9WZBi4JDdGF8P0KD6gJaxeyzn5EefHUrFmpRP32Lv08
        Fb6OqU7Q3y2xEjcRa1Xy3a8OZZiUDFv9JDWy1ArKVvpO0R68fN5EAr+gOJNEGm2isOb9NEKhIXb
        ALwpfwiZIRwJBS+B/AcWwrGnm8rjGwtBta4DkoSY=
X-Received: by 2002:ac8:2a3a:: with SMTP id k55mr25902497qtk.294.1591089260954;
        Tue, 02 Jun 2020 02:14:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1WsROjUW769DDxgpU4rag4njM1zCpRsTRcIP45qynEm0hFX3w+3IiwkjfSW1L8qjbkw7t1oMXMfjCmYljgak=
X-Received: by 2002:ac8:2a3a:: with SMTP id k55mr25902481qtk.294.1591089260695;
 Tue, 02 Jun 2020 02:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200529195951.GA3767@dtor-ws> <CANMq1KDDa8jGwo9BNneJ=8y1HunM9hiRS2c0i5ASJ6+X4qvodw@mail.gmail.com>
 <CABXOdTeTHUtWyutfQ3oO7c_g=q5GrDsdKZbSe1dwLWSeNFi-sQ@mail.gmail.com>
 <20200530010926.GM89269@dtor-ws> <CABXOdTexbFqvHNALBeXrU5djbrLaK93fBTd6_rTCOhbEadYRgg@mail.gmail.com>
 <20200530013419.GN89269@dtor-ws> <nycvar.YFH.7.76.2006011912150.13242@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2006011912150.13242@cbobk.fhfr.pm>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 2 Jun 2020 11:14:09 +0200
Message-ID: <CAO-hwJLTrGs39OsxtY_r0He02Au64vg1x1_tzGjCQzyNzBCARw@mail.gmail.com>
Subject: Re: [PATCH] HID: usbhid: do not sleep when opening device
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Guenter Roeck <groeck@google.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jun 1, 2020 at 7:13 PM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Fri, 29 May 2020, Dmitry Torokhov wrote:
>
> > > > > > > usbhid tries to give the device 50 milliseconds to drain its queues
> > > > > > > when opening the device, but does it naively by simply sleeping in open
> > > > > > > handler, which slows down device probing (and thus may affect overall
> > > > > > > boot time).
> > > > > > >
> > > > > > > However we do not need to sleep as we can instead mark a point of time
> > > > > > > in the future when we should start processing the events.
> > > > > > >
> > > > > > > Reported-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > > > > ---
> > > > > > >  drivers/hid/usbhid/hid-core.c | 27 +++++++++++++++------------
> > > > > > >  drivers/hid/usbhid/usbhid.h   |  1 +
> > > > > > >  2 files changed, 16 insertions(+), 12 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> > > > > > > index c7bc9db5b192..e69992e945b2 100644
> > > > > > > --- a/drivers/hid/usbhid/hid-core.c
> > > > > > > +++ b/drivers/hid/usbhid/hid-core.c
> > > > > > > @@ -95,6 +95,19 @@ static int hid_start_in(struct hid_device *hid)
> > > > > > >                                 set_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> > > > > > >                 } else {
> > > > > > >                         clear_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> > > > > > > +
> > > > > > > +                       if (test_and_clear_bit(HID_RESUME_RUNNING,
> > > > > > > +                                              &usbhid->iofl)) {
> > > > > > > +                               /*
> > > > > > > +                                * In case events are generated while nobody was
> > > > > > > +                                * listening, some are released when the device
> > > > > > > +                                * is re-opened. Wait 50 msec for the queue to
> > > > > > > +                                * empty before allowing events to go through
> > > > > > > +                                * hid.
> > > > > > > +                                */
> > > > > > > +                               usbhid->input_start_time = jiffies +
> > > > > > > +                                                          msecs_to_jiffies(50);
> > > > > > > +                       }
> > > > > > >                 }
> > > > > > >         }
> > > > > > >         spin_unlock_irqrestore(&usbhid->lock, flags);
> > > > > > > @@ -280,7 +293,8 @@ static void hid_irq_in(struct urb *urb)
> > > > > > >                 if (!test_bit(HID_OPENED, &usbhid->iofl))
> > > > > > >                         break;
> > > > > > >                 usbhid_mark_busy(usbhid);
> > > > > > > -               if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl)) {
> > > > > > > +               if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl) &&
> > > > > > > +                   time_after(jiffies, usbhid->input_start_time)) {
> > > > > >
> > > > > > Are we worried about jiffies overflowing (32-bit@1000Hz is "only" 49.7 days...)
> > > > > >
> > > > >
> > > > > time_after() is overflow-safe. That is why it is used and jiffies is
> > > > > not compared directly.
> > > >
> > > > Well, it is overflow safe, but still can not measure more than 50 days,
> > > > so if you have a device open for 50+ days there will be a 50msec gap
> > > > where it may lose events.
> > > >
> > >
> > > Or you could explicitly use 64-bit jiffies.
> >
> > Indeed.
> >
> > Jiri, Benjamin, do you have preference between jiffies64 and ktime_t? I
> > guess jiffies64 is a tiny bit less expensive.
>
> If I would be writing the code, I'd use ktime_t, because I personally like
> that abstraction more :) But either variant works for me.

I don't have a strong opinion on either variant. Feel free to use
whatever you like the most.

Cheers,
Benjamin

>
> Thanks!
>
> --
> Jiri Kosina
> SUSE Labs
>

