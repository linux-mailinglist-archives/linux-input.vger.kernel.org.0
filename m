Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 269DB1EA83F
	for <lists+linux-input@lfdr.de>; Mon,  1 Jun 2020 19:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgFARNP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jun 2020 13:13:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:50686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726067AbgFARNP (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Jun 2020 13:13:15 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F365A206E2;
        Mon,  1 Jun 2020 17:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591031594;
        bh=MW1zQ6O98JjAj7Zrj46pW1wRQMbf9VGw6ZzUx98FmIo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=WdtqwN2XruYNTB9JTpUHRMAV5zDpD6WysecesAw6sY5+fTEdHfWr37bA6tbkcv/Or
         4jdI0PkcpNXA1jaeLMyQvjhaqOEk9gfF1G6eMxujmndO9LMF4Hf+s9p9MA7D3u7HpK
         2jcM7eQHpBGt1hRgdC4sP27/e7hJWt7rfqoT9I98=
Date:   Mon, 1 Jun 2020 19:13:02 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc:     Guenter Roeck <groeck@google.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Guenter Roeck <groeck@chromium.org>, linux-usb@vger.kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: usbhid: do not sleep when opening device
In-Reply-To: <20200530013419.GN89269@dtor-ws>
Message-ID: <nycvar.YFH.7.76.2006011912150.13242@cbobk.fhfr.pm>
References: <20200529195951.GA3767@dtor-ws> <CANMq1KDDa8jGwo9BNneJ=8y1HunM9hiRS2c0i5ASJ6+X4qvodw@mail.gmail.com> <CABXOdTeTHUtWyutfQ3oO7c_g=q5GrDsdKZbSe1dwLWSeNFi-sQ@mail.gmail.com> <20200530010926.GM89269@dtor-ws> <CABXOdTexbFqvHNALBeXrU5djbrLaK93fBTd6_rTCOhbEadYRgg@mail.gmail.com>
 <20200530013419.GN89269@dtor-ws>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 29 May 2020, Dmitry Torokhov wrote:

> > > > > > usbhid tries to give the device 50 milliseconds to drain its queues
> > > > > > when opening the device, but does it naively by simply sleeping in open
> > > > > > handler, which slows down device probing (and thus may affect overall
> > > > > > boot time).
> > > > > >
> > > > > > However we do not need to sleep as we can instead mark a point of time
> > > > > > in the future when we should start processing the events.
> > > > > >
> > > > > > Reported-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > > > ---
> > > > > >  drivers/hid/usbhid/hid-core.c | 27 +++++++++++++++------------
> > > > > >  drivers/hid/usbhid/usbhid.h   |  1 +
> > > > > >  2 files changed, 16 insertions(+), 12 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> > > > > > index c7bc9db5b192..e69992e945b2 100644
> > > > > > --- a/drivers/hid/usbhid/hid-core.c
> > > > > > +++ b/drivers/hid/usbhid/hid-core.c
> > > > > > @@ -95,6 +95,19 @@ static int hid_start_in(struct hid_device *hid)
> > > > > >                                 set_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> > > > > >                 } else {
> > > > > >                         clear_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> > > > > > +
> > > > > > +                       if (test_and_clear_bit(HID_RESUME_RUNNING,
> > > > > > +                                              &usbhid->iofl)) {
> > > > > > +                               /*
> > > > > > +                                * In case events are generated while nobody was
> > > > > > +                                * listening, some are released when the device
> > > > > > +                                * is re-opened. Wait 50 msec for the queue to
> > > > > > +                                * empty before allowing events to go through
> > > > > > +                                * hid.
> > > > > > +                                */
> > > > > > +                               usbhid->input_start_time = jiffies +
> > > > > > +                                                          msecs_to_jiffies(50);
> > > > > > +                       }
> > > > > >                 }
> > > > > >         }
> > > > > >         spin_unlock_irqrestore(&usbhid->lock, flags);
> > > > > > @@ -280,7 +293,8 @@ static void hid_irq_in(struct urb *urb)
> > > > > >                 if (!test_bit(HID_OPENED, &usbhid->iofl))
> > > > > >                         break;
> > > > > >                 usbhid_mark_busy(usbhid);
> > > > > > -               if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl)) {
> > > > > > +               if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl) &&
> > > > > > +                   time_after(jiffies, usbhid->input_start_time)) {
> > > > >
> > > > > Are we worried about jiffies overflowing (32-bit@1000Hz is "only" 49.7 days...)
> > > > >
> > > >
> > > > time_after() is overflow-safe. That is why it is used and jiffies is
> > > > not compared directly.
> > >
> > > Well, it is overflow safe, but still can not measure more than 50 days,
> > > so if you have a device open for 50+ days there will be a 50msec gap
> > > where it may lose events.
> > >
> > 
> > Or you could explicitly use 64-bit jiffies.
> 
> Indeed.
> 
> Jiri, Benjamin, do you have preference between jiffies64 and ktime_t? I
> guess jiffies64 is a tiny bit less expensive.

If I would be writing the code, I'd use ktime_t, because I personally like 
that abstraction more :) But either variant works for me.

Thanks!

-- 
Jiri Kosina
SUSE Labs

