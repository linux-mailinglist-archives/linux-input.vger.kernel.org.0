Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19D511E8CB4
	for <lists+linux-input@lfdr.de>; Sat, 30 May 2020 03:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728297AbgE3BJb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 May 2020 21:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728293AbgE3BJ3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 May 2020 21:09:29 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCF64C03E969;
        Fri, 29 May 2020 18:09:29 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id 5so2154043pjd.0;
        Fri, 29 May 2020 18:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hPTysRlNXEyQU9KOc8nLJua4qsfUj/Sh/DHXmNPcv6Q=;
        b=sAN67LxuNEAkaJ0lPyDCxOmn46gmo73ybv1ztVWD8FBGfu3st048dOxPIa4sBYLIUS
         cwebnLBqmv+cCqlgX9Epk+7WlaYqwFMze2fTN9ktaiIJiyTyZEr6KGu2YL5YfkUGLlRi
         fQZxpt9ImITEsBe5Yuicjt7HoPoCiKsq6UVZm5aRycZA994V5X7Uib2M/KNfX2/YPlbT
         qkNKCB0NCfy4R/4xciHzfH1oLykfADM85ly4XJDq5fdWJqYKBUgqi9byvx3/gCfRUNQ5
         6OyAQAfYMPMhOQ15xA89X6V1Lq/8dzhme5uStL3XjUf1WCHroEN+KCrN9JcyOBB1SDgS
         VC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hPTysRlNXEyQU9KOc8nLJua4qsfUj/Sh/DHXmNPcv6Q=;
        b=XQmQ8b0Xtu+SmNelJIK0oM6l2UdAYRo5K9FTi9/KM0duhOgvcRqp/iYX2OGTLDuWsg
         n51IqxGaaCKmLxmWClR+TzOFwKQ4G0N4gH/NKrbTGXFzqsCu/gseQfEtidwkY2wPKASb
         hccwRECO55B8jnmAmMGaGt+PdXT9G1c132p12FltPwdf/Q5qzAwFXXyG1keWDD5ocE8a
         OE95ywatSng+9Ny8p8HeU2RzdJG2JMKvfU61NCYI5JCPRHhF2GNQEScWQ9b6YH+5w+n+
         8AradH6EoyclGQdku0e8MJtOSt1E/el5chC1Z8ihXboLV4E055laR7kJ5fx3HCJHLcUo
         MeYQ==
X-Gm-Message-State: AOAM533WfL6Q2Z/YofV0aM5eOSxbd4qM66hxeMG1U+SydwY4JBfIG1Fn
        JAgDc9rtT9FqU7oNWlbKkGU=
X-Google-Smtp-Source: ABdhPJyoUpPnY/bGf1gLfl1ItZxnbsT6b7J5Y9Ttb1P+XgKb0EoBiNQzvP0i9Xzc/+maJLlIBmWvNg==
X-Received: by 2002:a17:902:30d:: with SMTP id 13mr11222273pld.197.1590800968935;
        Fri, 29 May 2020 18:09:28 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id 5sm7581035pgl.4.2020.05.29.18.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 18:09:28 -0700 (PDT)
Date:   Fri, 29 May 2020 18:09:26 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Guenter Roeck <groeck@google.com>
Cc:     Nicolas Boichat <drinkcat@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Guenter Roeck <groeck@chromium.org>, linux-usb@vger.kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: usbhid: do not sleep when opening device
Message-ID: <20200530010926.GM89269@dtor-ws>
References: <20200529195951.GA3767@dtor-ws>
 <CANMq1KDDa8jGwo9BNneJ=8y1HunM9hiRS2c0i5ASJ6+X4qvodw@mail.gmail.com>
 <CABXOdTeTHUtWyutfQ3oO7c_g=q5GrDsdKZbSe1dwLWSeNFi-sQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABXOdTeTHUtWyutfQ3oO7c_g=q5GrDsdKZbSe1dwLWSeNFi-sQ@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 29, 2020 at 05:48:26PM -0700, Guenter Roeck wrote:
> On Fri, May 29, 2020 at 4:50 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > On Sat, May 30, 2020 at 3:59 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > usbhid tries to give the device 50 milliseconds to drain its queues
> > > when opening the device, but does it naively by simply sleeping in open
> > > handler, which slows down device probing (and thus may affect overall
> > > boot time).
> > >
> > > However we do not need to sleep as we can instead mark a point of time
> > > in the future when we should start processing the events.
> > >
> > > Reported-by: Nicolas Boichat <drinkcat@chromium.org>
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > >  drivers/hid/usbhid/hid-core.c | 27 +++++++++++++++------------
> > >  drivers/hid/usbhid/usbhid.h   |  1 +
> > >  2 files changed, 16 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> > > index c7bc9db5b192..e69992e945b2 100644
> > > --- a/drivers/hid/usbhid/hid-core.c
> > > +++ b/drivers/hid/usbhid/hid-core.c
> > > @@ -95,6 +95,19 @@ static int hid_start_in(struct hid_device *hid)
> > >                                 set_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> > >                 } else {
> > >                         clear_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> > > +
> > > +                       if (test_and_clear_bit(HID_RESUME_RUNNING,
> > > +                                              &usbhid->iofl)) {
> > > +                               /*
> > > +                                * In case events are generated while nobody was
> > > +                                * listening, some are released when the device
> > > +                                * is re-opened. Wait 50 msec for the queue to
> > > +                                * empty before allowing events to go through
> > > +                                * hid.
> > > +                                */
> > > +                               usbhid->input_start_time = jiffies +
> > > +                                                          msecs_to_jiffies(50);
> > > +                       }
> > >                 }
> > >         }
> > >         spin_unlock_irqrestore(&usbhid->lock, flags);
> > > @@ -280,7 +293,8 @@ static void hid_irq_in(struct urb *urb)
> > >                 if (!test_bit(HID_OPENED, &usbhid->iofl))
> > >                         break;
> > >                 usbhid_mark_busy(usbhid);
> > > -               if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl)) {
> > > +               if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl) &&
> > > +                   time_after(jiffies, usbhid->input_start_time)) {
> >
> > Are we worried about jiffies overflowing (32-bit@1000Hz is "only" 49.7 days...)
> >
> 
> time_after() is overflow-safe. That is why it is used and jiffies is
> not compared directly.

Well, it is overflow safe, but still can not measure more than 50 days,
so if you have a device open for 50+ days there will be a 50msec gap
where it may lose events.

I guess we can switch to ktime(). A bit more expensive on 32 bits, but
in reality I do not think anyone would care.

Thanks.

-- 
Dmitry
