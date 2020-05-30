Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 482D11E8CE5
	for <lists+linux-input@lfdr.de>; Sat, 30 May 2020 03:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbgE3BeY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 May 2020 21:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbgE3BeX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 May 2020 21:34:23 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8A9C03E969;
        Fri, 29 May 2020 18:34:23 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id y17so104966plb.8;
        Fri, 29 May 2020 18:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e7TKsX2I23KtKFJuZmsSEUE29ExmC22rZnMKfer3ZQY=;
        b=qvTZkjZPEnvm30LRgh8JYDhLR4lPt96iqQPRBk9zZCuH1toUB2wRtiWzLD9cViqVrZ
         aqmpw9+UqlWo93wXB80iQTGQ4Pr6I3+BaScBfTWwVaupLmRpSU/jPRbk+9cTpy7237+B
         1K+UD3VwfWU1N51aFVOtMLx1oEM+lFYvoA+op70a9sol6j9naStLLQbA/TJPQF9Yd8wb
         49sgSut/E0f//Omk46eQinqPKdiqdZnati89ERcC3ErzD8ftlNVl7ogHieTgcdzrSHVw
         g3122sSWR8/ZaK8pR+6Ne1BSMw1qCjmxqYj9VfEmq2foRuCvjDmF45R8BuCaYHVZ5VBI
         g/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e7TKsX2I23KtKFJuZmsSEUE29ExmC22rZnMKfer3ZQY=;
        b=lT9OBqjjxmRNrRJ4K8XzApKC0AxYV9DXesyUTF7n+S/kGzj0hGXJ7x2hO0BG242oZ6
         ObHpf+yIcf0/x4omU6KfLBydVTl7KNjXPIajIbHUksg9KPV4CY4lQ7AaYxmZ2HpYFoOO
         KgosmEfmCZt+xemmNT//n6Ydzf2mCbem7tEZUFTtaetSzMX3B7BJls7Zhqh+dpmyaoh+
         6qAADabM1fwqv3WUqTrKgEGvlDi1/01qV/BXowRznjHAH2RCn9C3TK8pmysgulciKhXb
         0+gDbYN48j9/INPh9WWhni5duslW7lvjg5YBrtgl6CId5Lw76ph6oGHzXw4ufAVvpoOC
         oP+w==
X-Gm-Message-State: AOAM531hR8+r02NxR++V8N06CdG2Ie8bXpsR/cppZMRgo91aKVoPDTuL
        pssTTW0XAWOL1/9GbfOFSOY=
X-Google-Smtp-Source: ABdhPJxIlWWAVQcuAyA5MogRTJmSn5wCHNmQTkkSv+ys5j1Md2w3pX/dBBOuVkrPqi9ZApaJxG5rYw==
X-Received: by 2002:a17:90a:8409:: with SMTP id j9mr10901882pjn.203.1590802462510;
        Fri, 29 May 2020 18:34:22 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id x2sm1902192pff.103.2020.05.29.18.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 18:34:21 -0700 (PDT)
Date:   Fri, 29 May 2020 18:34:19 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Guenter Roeck <groeck@google.com>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Guenter Roeck <groeck@chromium.org>, linux-usb@vger.kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: usbhid: do not sleep when opening device
Message-ID: <20200530013419.GN89269@dtor-ws>
References: <20200529195951.GA3767@dtor-ws>
 <CANMq1KDDa8jGwo9BNneJ=8y1HunM9hiRS2c0i5ASJ6+X4qvodw@mail.gmail.com>
 <CABXOdTeTHUtWyutfQ3oO7c_g=q5GrDsdKZbSe1dwLWSeNFi-sQ@mail.gmail.com>
 <20200530010926.GM89269@dtor-ws>
 <CABXOdTexbFqvHNALBeXrU5djbrLaK93fBTd6_rTCOhbEadYRgg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABXOdTexbFqvHNALBeXrU5djbrLaK93fBTd6_rTCOhbEadYRgg@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 29, 2020 at 06:22:49PM -0700, Guenter Roeck wrote:
> On Fri, May 29, 2020 at 6:09 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Fri, May 29, 2020 at 05:48:26PM -0700, Guenter Roeck wrote:
> > > On Fri, May 29, 2020 at 4:50 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> > > >
> > > > On Sat, May 30, 2020 at 3:59 AM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > > > >
> > > > > usbhid tries to give the device 50 milliseconds to drain its queues
> > > > > when opening the device, but does it naively by simply sleeping in open
> > > > > handler, which slows down device probing (and thus may affect overall
> > > > > boot time).
> > > > >
> > > > > However we do not need to sleep as we can instead mark a point of time
> > > > > in the future when we should start processing the events.
> > > > >
> > > > > Reported-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > > ---
> > > > >  drivers/hid/usbhid/hid-core.c | 27 +++++++++++++++------------
> > > > >  drivers/hid/usbhid/usbhid.h   |  1 +
> > > > >  2 files changed, 16 insertions(+), 12 deletions(-)
> > > > >
> > > > > diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> > > > > index c7bc9db5b192..e69992e945b2 100644
> > > > > --- a/drivers/hid/usbhid/hid-core.c
> > > > > +++ b/drivers/hid/usbhid/hid-core.c
> > > > > @@ -95,6 +95,19 @@ static int hid_start_in(struct hid_device *hid)
> > > > >                                 set_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> > > > >                 } else {
> > > > >                         clear_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> > > > > +
> > > > > +                       if (test_and_clear_bit(HID_RESUME_RUNNING,
> > > > > +                                              &usbhid->iofl)) {
> > > > > +                               /*
> > > > > +                                * In case events are generated while nobody was
> > > > > +                                * listening, some are released when the device
> > > > > +                                * is re-opened. Wait 50 msec for the queue to
> > > > > +                                * empty before allowing events to go through
> > > > > +                                * hid.
> > > > > +                                */
> > > > > +                               usbhid->input_start_time = jiffies +
> > > > > +                                                          msecs_to_jiffies(50);
> > > > > +                       }
> > > > >                 }
> > > > >         }
> > > > >         spin_unlock_irqrestore(&usbhid->lock, flags);
> > > > > @@ -280,7 +293,8 @@ static void hid_irq_in(struct urb *urb)
> > > > >                 if (!test_bit(HID_OPENED, &usbhid->iofl))
> > > > >                         break;
> > > > >                 usbhid_mark_busy(usbhid);
> > > > > -               if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl)) {
> > > > > +               if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl) &&
> > > > > +                   time_after(jiffies, usbhid->input_start_time)) {
> > > >
> > > > Are we worried about jiffies overflowing (32-bit@1000Hz is "only" 49.7 days...)
> > > >
> > >
> > > time_after() is overflow-safe. That is why it is used and jiffies is
> > > not compared directly.
> >
> > Well, it is overflow safe, but still can not measure more than 50 days,
> > so if you have a device open for 50+ days there will be a 50msec gap
> > where it may lose events.
> >
> 
> Or you could explicitly use 64-bit jiffies.

Indeed.

Jiri, Benjamin, do you have preference between jiffies64 and ktime_t? I
guess jiffies64 is a tiny bit less expensive.

Thanks.

-- 
Dmitry
