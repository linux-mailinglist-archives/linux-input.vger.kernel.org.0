Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84E7D1E8C98
	for <lists+linux-input@lfdr.de>; Sat, 30 May 2020 02:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728525AbgE3Ask (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 May 2020 20:48:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728297AbgE3Asj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 May 2020 20:48:39 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97113C03E969
        for <linux-input@vger.kernel.org>; Fri, 29 May 2020 17:48:39 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id h21so3813016ejq.5
        for <linux-input@vger.kernel.org>; Fri, 29 May 2020 17:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SnGa+sp06YGgurCULp59Dm5yJ72F3Q121M3j0Zokm2c=;
        b=d/wcQy8elcjGFNAUc1MXBBI2fcayOPmE9V8XLfJsTJOqDasbkiEtu7xxWmrYwcBvXi
         oGfybuS74o+QWL/KgFLhwviOMp6+xWBLNWfAQoLE10/bbsgA6S2eVuMrdXUSijKdCp83
         T5ckrCWcEaST8oZHFwjxIkK0tOW3XYgvfzdgChJOBkjjlUa58r3VNREsyNUA28TUA+hJ
         lrVOExkoWYhgTVW6l9LM0O8KizleAnyYv72I1mGIIvWQQ4Ki5ZdtieSpmhyOmfDZTIey
         2NRgQpjjf58c5lwnLwPrkLMCbLSus1pm7PW6AAH/2PW1kq+NKcaAYZnl6R2TXFusg0+U
         1chA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SnGa+sp06YGgurCULp59Dm5yJ72F3Q121M3j0Zokm2c=;
        b=Z1GVcLoUDloEb4adp5syh4gM3VTYn+TwXa0PKcRd4NGee6aeZFUTvoLdMPm2PxFy3a
         awS7BJ2S0F73BlkhxgQO4/nF4cCNaVrGHdKs13wAEMavKHmrUoWJ0F+Cltnh8XtWAs9W
         L3idnYIJNPXMJOOEdu5NqMAO/EIlCoVfvYqL6pYkOPRnCqC/znBK44C4sYQrGRJXigoI
         ro5gsMCYbhBlgQhraY86YM8owFXcUpZ2y+cOJ8NO45rg9FnwJIynjJFSuxpVpshZBBXs
         ypLDutaAkWpxGZ99em/FU+b75/YhRYv+lF93RkOkXyrclbmfvm8FD3yJ0tyQuUSfcUK2
         fqJA==
X-Gm-Message-State: AOAM531ZfzNiGMXnv5Hiql3akP4Rw9RieEdBr/gS8EE5FUOGlMK3ydNu
        gbq75YbYWzpsi3eP+BLrtl0qy27OUc3vAEDWElCa4A==
X-Google-Smtp-Source: ABdhPJypD7frdxZN6b2D5S9ea/dW3yRBa9cd74/PY/29S9QEb0yzpgWJOBIooKyalj7pZk/Wxf6V2xzf6BqFCE7LQ3A=
X-Received: by 2002:a17:906:dc2:: with SMTP id p2mr10002030eji.212.1590799717876;
 Fri, 29 May 2020 17:48:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200529195951.GA3767@dtor-ws> <CANMq1KDDa8jGwo9BNneJ=8y1HunM9hiRS2c0i5ASJ6+X4qvodw@mail.gmail.com>
In-Reply-To: <CANMq1KDDa8jGwo9BNneJ=8y1HunM9hiRS2c0i5ASJ6+X4qvodw@mail.gmail.com>
From:   Guenter Roeck <groeck@google.com>
Date:   Fri, 29 May 2020 17:48:26 -0700
Message-ID: <CABXOdTeTHUtWyutfQ3oO7c_g=q5GrDsdKZbSe1dwLWSeNFi-sQ@mail.gmail.com>
Subject: Re: [PATCH] HID: usbhid: do not sleep when opening device
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Guenter Roeck <groeck@chromium.org>, linux-usb@vger.kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 29, 2020 at 4:50 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> On Sat, May 30, 2020 at 3:59 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > usbhid tries to give the device 50 milliseconds to drain its queues
> > when opening the device, but does it naively by simply sleeping in open
> > handler, which slows down device probing (and thus may affect overall
> > boot time).
> >
> > However we do not need to sleep as we can instead mark a point of time
> > in the future when we should start processing the events.
> >
> > Reported-by: Nicolas Boichat <drinkcat@chromium.org>
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/hid/usbhid/hid-core.c | 27 +++++++++++++++------------
> >  drivers/hid/usbhid/usbhid.h   |  1 +
> >  2 files changed, 16 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> > index c7bc9db5b192..e69992e945b2 100644
> > --- a/drivers/hid/usbhid/hid-core.c
> > +++ b/drivers/hid/usbhid/hid-core.c
> > @@ -95,6 +95,19 @@ static int hid_start_in(struct hid_device *hid)
> >                                 set_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> >                 } else {
> >                         clear_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> > +
> > +                       if (test_and_clear_bit(HID_RESUME_RUNNING,
> > +                                              &usbhid->iofl)) {
> > +                               /*
> > +                                * In case events are generated while nobody was
> > +                                * listening, some are released when the device
> > +                                * is re-opened. Wait 50 msec for the queue to
> > +                                * empty before allowing events to go through
> > +                                * hid.
> > +                                */
> > +                               usbhid->input_start_time = jiffies +
> > +                                                          msecs_to_jiffies(50);
> > +                       }
> >                 }
> >         }
> >         spin_unlock_irqrestore(&usbhid->lock, flags);
> > @@ -280,7 +293,8 @@ static void hid_irq_in(struct urb *urb)
> >                 if (!test_bit(HID_OPENED, &usbhid->iofl))
> >                         break;
> >                 usbhid_mark_busy(usbhid);
> > -               if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl)) {
> > +               if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl) &&
> > +                   time_after(jiffies, usbhid->input_start_time)) {
>
> Are we worried about jiffies overflowing (32-bit@1000Hz is "only" 49.7 days...)
>

time_after() is overflow-safe. That is why it is used and jiffies is
not compared directly.

Guenter

> >                         hid_input_report(urb->context, HID_INPUT_REPORT,
> >                                          urb->transfer_buffer,
> >                                          urb->actual_length, 1);
> > @@ -714,17 +728,6 @@ static int usbhid_open(struct hid_device *hid)
> >         }
> >
> >         usb_autopm_put_interface(usbhid->intf);
> > -
> > -       /*
> > -        * In case events are generated while nobody was listening,
> > -        * some are released when the device is re-opened.
> > -        * Wait 50 msec for the queue to empty before allowing events
> > -        * to go through hid.
> > -        */
> > -       if (res == 0)
> > -               msleep(50);
> > -
> > -       clear_bit(HID_RESUME_RUNNING, &usbhid->iofl);
> >         return res;
> >  }
> >
> > diff --git a/drivers/hid/usbhid/usbhid.h b/drivers/hid/usbhid/usbhid.h
> > index 8620408bd7af..805949671b96 100644
> > --- a/drivers/hid/usbhid/usbhid.h
> > +++ b/drivers/hid/usbhid/usbhid.h
> > @@ -82,6 +82,7 @@ struct usbhid_device {
> >
> >         spinlock_t lock;                                                /* fifo spinlock */
> >         unsigned long iofl;                                             /* I/O flags (CTRL_RUNNING, OUT_RUNNING) */
> > +       unsigned long input_start_time;                                 /* When to start handling input, in jiffies */
> >         struct timer_list io_retry;                                     /* Retry timer */
> >         unsigned long stop_retry;                                       /* Time to give up, in jiffies */
> >         unsigned int retry_delay;                                       /* Delay length in ms */
> > --
> > 2.27.0.rc0.183.gde8f92d652-goog
> >
> >
> > --
> > Dmitry
