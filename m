Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF226667B4
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2019 09:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfGLHXd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Jul 2019 03:23:33 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:36888 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfGLHXd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Jul 2019 03:23:33 -0400
Received: by mail-qt1-f194.google.com with SMTP id y26so7144922qto.4
        for <linux-input@vger.kernel.org>; Fri, 12 Jul 2019 00:23:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EZN5x6Ys58BLlrYAsJgOSevY7V/yhMtrVcdtnejK+Hg=;
        b=CqWC79mWdXhk2ecWuCUGrwUunIjqjkGd6nw8wFUWNzj+c0MnSmtqyvDiNGzIyigD00
         oGA7s5IkJwwmRueDCB/22g28WOF6bUtcSVsfjTyDiYd/ljUHu6CxA25Vx4YJnt9ta44c
         YN45XhIbz2lbLgd04rCPMMSLaeYa9r40e1nTIQT2pE0O86jdErRCYonc+OLY6KAR36G+
         9V7N22gP/B/R7L0OPFIuwG7/wahexDLCjQNbRT9tAVhsBc+wJCVFlfUroc/XEnydCnl6
         ZTYL0Zk54NC/gjk9kADQIq1n3GrHc0zk62GKrYqa5PCGiIQfYmXUiDwUNiD3qZh/dMsm
         YIgg==
X-Gm-Message-State: APjAAAUt9cDCvjDB82DW0NGHeEhpkRfHUHWHeNIJUV9Tmq0BgRDVcY2x
        sFHsrzuQxj+fc+J1fRJseZisa4K47T4hyp+regPUTw==
X-Google-Smtp-Source: APXvYqwV3Hjfdt6v18zMFmkS67+5p5Zd40nf+pcaUCmEGumWxDpBUOzadiADlSsmIQ7Yr4lOasrqfw7oAs278LCDhFw=
X-Received: by 2002:aed:3ac1:: with SMTP id o59mr5149174qte.260.1562916212139;
 Fri, 12 Jul 2019 00:23:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190710230410.9386-1-atifniyaz@google.com> <20190712064134.GA150689@dtor-ws>
In-Reply-To: <20190712064134.GA150689@dtor-ws>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 12 Jul 2019 09:23:20 +0200
Message-ID: <CAO-hwJK-VAGpjN03XDTmmT4fYxb1V_izfvT9Z3tKDmLJ3henGw@mail.gmail.com>
Subject: Re: [PATCH] input: API for Setting a Timestamp from a Driver
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Atif Niyaz <atifniyaz@google.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Atif Niyaz <atifniyaz11@gmail.com>,
        Siarhei Vishniakou <svv@google.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jul 12, 2019 at 8:41 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Atif,
>
> On Wed, Jul 10, 2019 at 04:04:10PM -0700, Atif Niyaz wrote:
> > Currently, evdev stamps time with timestamps acquired in
> > evdev_events. However, this timestamping may not be accurate in terms of
> > measuring when the actual event happened. This API allows any 3rd party
> > driver to be able to call input_set_timestamp, and provide a timestamp
> > that can be utilized in order to provide a more accurate sense of time
> > for the event
> >
> > Signed-off-by: Atif Niyaz <atifniyaz@google.com>
>
> This looks OK to me. Benjamin, Peter, any concerns here?
>

No red flags from me (though Peter is the one using all of this).

Just curious, which drivers do you think will be using this new API?
I can see that we might want to use hid-multitouch for it, with the
Scan Time forwarded by the device, but what do you have in mind?

Cheers,
Benjamin

>
> > ---
> >  drivers/input/evdev.c | 42 ++++++++++++++++--------------------------
> >  drivers/input/input.c | 17 +++++++++++++++++
> >  include/linux/input.h | 38 ++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 71 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
> > index 867c2cfd0038..a331efa0a3f6 100644
> > --- a/drivers/input/evdev.c
> > +++ b/drivers/input/evdev.c
> > @@ -25,13 +25,6 @@
> >  #include <linux/cdev.h>
> >  #include "input-compat.h"
> >
> > -enum evdev_clock_type {
> > -     EV_CLK_REAL = 0,
> > -     EV_CLK_MONO,
> > -     EV_CLK_BOOT,
> > -     EV_CLK_MAX
> > -};
> > -
> >  struct evdev {
> >       int open;
> >       struct input_handle handle;
> > @@ -53,7 +46,7 @@ struct evdev_client {
> >       struct fasync_struct *fasync;
> >       struct evdev *evdev;
> >       struct list_head node;
> > -     unsigned int clk_type;
> > +     input_clk_t clk_type;
> >       bool revoked;
> >       unsigned long *evmasks[EV_CNT];
> >       unsigned int bufsize;
> > @@ -150,16 +143,18 @@ static void __evdev_flush_queue(struct evdev_client *client, unsigned int type)
> >  static void __evdev_queue_syn_dropped(struct evdev_client *client)
> >  {
> >       struct input_event ev;
> > -     ktime_t time;
> >       struct timespec64 ts;
> > +     ktime_t *time = input_get_timestamp(client->evdev->handle.dev);
> >
> > -     time = client->clk_type == EV_CLK_REAL ?
> > -                     ktime_get_real() :
> > -                     client->clk_type == EV_CLK_MONO ?
> > -                             ktime_get() :
> > -                             ktime_get_boottime();
> > +     switch (client->clk_type) {
> > +     case INPUT_CLK_REAL:
> > +     case INPUT_CLK_MONO:
> > +             ts = ktime_to_timespec64(time[client->clk_type]);
> > +             break;
> > +     default:
> > +             ts = ktime_to_timespec64(time[INPUT_CLK_BOOT]);
>
> Add "break" here please.
>
> > +     }
> >
> > -     ts = ktime_to_timespec64(time);
> >       ev.input_event_sec = ts.tv_sec;
> >       ev.input_event_usec = ts.tv_nsec / NSEC_PER_USEC;
> >       ev.type = EV_SYN;
> > @@ -185,21 +180,21 @@ static void evdev_queue_syn_dropped(struct evdev_client *client)
> >       spin_unlock_irqrestore(&client->buffer_lock, flags);
> >  }
> >
> > -static int evdev_set_clk_type(struct evdev_client *client, unsigned int clkid)
> > +static int evdev_set_clk_type(struct evdev_client *client, clockid_t clkid)
> >  {
> >       unsigned long flags;
> > -     unsigned int clk_type;
> > +     input_clk_t clk_type;
> >
> >       switch (clkid) {
> >
> >       case CLOCK_REALTIME:
> > -             clk_type = EV_CLK_REAL;
> > +             clk_type = INPUT_CLK_REAL;
> >               break;
> >       case CLOCK_MONOTONIC:
> > -             clk_type = EV_CLK_MONO;
> > +             clk_type = INPUT_CLK_MONO;
> >               break;
> >       case CLOCK_BOOTTIME:
> > -             clk_type = EV_CLK_BOOT;
> > +             clk_type = INPUT_CLK_BOOT;
> >               break;
> >       default:
> >               return -EINVAL;
> > @@ -307,12 +302,7 @@ static void evdev_events(struct input_handle *handle,
> >  {
> >       struct evdev *evdev = handle->private;
> >       struct evdev_client *client;
> > -     ktime_t ev_time[EV_CLK_MAX];
> > -
> > -     ev_time[EV_CLK_MONO] = ktime_get();
> > -     ev_time[EV_CLK_REAL] = ktime_mono_to_real(ev_time[EV_CLK_MONO]);
> > -     ev_time[EV_CLK_BOOT] = ktime_mono_to_any(ev_time[EV_CLK_MONO],
> > -                                              TK_OFFS_BOOT);
> > +     ktime_t *ev_time = input_get_timestamp(handle->dev);
> >
> >       rcu_read_lock();
> >
> > diff --git a/drivers/input/input.c b/drivers/input/input.c
> > index 7f3c5fcb9ed6..ae8b0ee58120 100644
> > --- a/drivers/input/input.c
> > +++ b/drivers/input/input.c
> > @@ -1894,6 +1894,23 @@ void input_free_device(struct input_dev *dev)
> >  }
> >  EXPORT_SYMBOL(input_free_device);
> >
> > +/**
> > + * input_get_timestamp - get timestamp for input events
> > + * @dev: input device to get timestamp from
> > + *
> > + * A valid timestamp is a timestamp of non-zero value.
> > + */
> > +ktime_t *input_get_timestamp(struct input_dev *dev)
> > +{
> > +     const ktime_t invalid_timestamp = ktime_set(0, 0);
> > +
> > +     if (!ktime_compare(dev->timestamp[INPUT_CLK_MONO], ktime_zero)) {
>
> You need to replace ktime_zero with invalid_timestamp here.
>
> > +             input_set_timestamp(dev, ktime_get());
> > +     }
>
> No need for curly braces for 1-line body.
>
> > +     return dev->timestamp;
> > +}
> > +EXPORT_SYMBOL(input_get_timestamp);
> > +
> >  /**
> >   * input_set_capability - mark device as capable of a certain event
> >   * @dev: device that is capable of emitting or accepting event
> > diff --git a/include/linux/input.h b/include/linux/input.h
> > index 510e78558c10..3929b62ccbe5 100644
> > --- a/include/linux/input.h
> > +++ b/include/linux/input.h
> > @@ -33,6 +33,14 @@ struct input_value {
> >       __s32 value;
> >  };
> >
> > +enum input_clock_type {
> > +     INPUT_CLK_REAL = 0,
> > +     INPUT_CLK_MONO,
> > +     INPUT_CLK_BOOT,
> > +     INPUT_CLK_MAX
> > +};
> > +typedef enum input_clock_type input_clk_t;
>
> We typically avoid typedefs unless we really want to hide kind of data
> we are dealing with. Let's just use "enum input_clock_type" everywhere.
>
> > +
> >  /**
> >   * struct input_dev - represents an input device
> >   * @name: name of the device
> > @@ -114,6 +122,8 @@ struct input_value {
> >   * @vals: array of values queued in the current frame
> >   * @devres_managed: indicates that devices is managed with devres framework
> >   *   and needs not be explicitly unregistered or freed.
> > + * @timestamp: storage for a timestamp set by input_set_timestamp called
> > + *  by a driver
> >   */
> >  struct input_dev {
> >       const char *name;
> > @@ -184,6 +194,8 @@ struct input_dev {
> >       struct input_value *vals;
> >
> >       bool devres_managed;
> > +
> > +     ktime_t timestamp[INPUT_CLK_MAX];
> >  };
> >  #define to_input_dev(d) container_of(d, struct input_dev, dev)
> >
> > @@ -382,6 +394,32 @@ void input_close_device(struct input_handle *);
> >
> >  int input_flush_device(struct input_handle *handle, struct file *file);
> >
> > +/**
> > + * input_set_timestamp - set timestamp for input events
> > + * @dev: input device to set timestamp for
> > + * @timestamp: the time at which the event has occurred
> > + *   in CLOCK_MONOTONIC
> > + *
> > + * This function is intended to provide to the input system a more
> > + * accurate time of when an event actually occurred. The driver should
> > + * call this function as soon as a timestamp is acquired ensuring
> > + * clock conversions in input_set_timestamp are done correctly.
> > + *
> > + * The system entering a suspend between timestamp acquisition and
> > + * calling input_set_timestamp can result in inaccurate conversions.
> > + *
> > + */
> > +static inline void input_set_timestamp(struct input_dev *dev,
> > +     ktime_t timestamp)
> > +{
> > +     dev->timestamp[INPUT_CLK_MONO] = timestamp;
> > +     dev->timestamp[INPUT_CLK_REAL] = ktime_mono_to_real(timestamp);
> > +     dev->timestamp[INPUT_CLK_BOOT] = ktime_mono_to_any(
> > +             timestamp, TK_OFFS_BOOT);
> > +}
> > +
> > +ktime_t *input_get_timestamp(struct input_dev *dev);
> > +
> >  void input_event(struct input_dev *dev, unsigned int type, unsigned int code, int value);
> >  void input_inject_event(struct input_handle *handle, unsigned int type, unsigned int code, int value);
> >
> > --
> > 2.22.0.410.gd8fdbe21b5-goog
> >
>
> --
> Dmitry
