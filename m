Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7831E8C51
	for <lists+linux-input@lfdr.de>; Sat, 30 May 2020 01:50:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728396AbgE2Xu0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 May 2020 19:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728142AbgE2XuZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 May 2020 19:50:25 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D23C03E969
        for <linux-input@vger.kernel.org>; Fri, 29 May 2020 16:50:25 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id r10so2483637vsa.12
        for <linux-input@vger.kernel.org>; Fri, 29 May 2020 16:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0JbQNWDJY/iBtI7a1J3Ulm1IhkvGCv0bKNMjqUbLbFc=;
        b=TwKtg5QCy6e5h6LnSHn+auoK4ebqhYIgRGclRm/GOIwwxT1NPjASdh3XdSqRUaiGBy
         Gw+moxo+1tfbMGxUpDsUcxFq3+GbMS9J3G5VOlOPK91bNZ+/ps9QNNfW0x2yA+Jciy60
         BGhmlPdUybyY7RMepoJAy+LEr7KAjRrXlp8to=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0JbQNWDJY/iBtI7a1J3Ulm1IhkvGCv0bKNMjqUbLbFc=;
        b=GgScQIyNXFgHTd5fLiMXQv+LOrv2y4LIDespLhfZ1daJ34HDYTxCyCgCw4cOUSTnOT
         38GMmLI6aVaf/RlKrqYrRIdt5qMvndNFGim68wEmgZFjj1+WZyehHfaKuIp+Qo90UAu7
         osOiDaq5dbeMO+cxw/dw+oivnguoC1hBnwVURQS7xRy4LsxVmjuh0HwKdh6BElCAne++
         KWYtGIN6LV9SU5S7t8QluV8AkEoaapl0/VTNxpn4MQfEPvt7GP38zMmxlTWPbvIYg/Jd
         iNPo5ichyxLggleJ86cJhoqEmhqGsEssbVN42N7ce0FINVQW+n3RPY3MPiP8xqQ07n9T
         QEcA==
X-Gm-Message-State: AOAM533kBOuya+shTw1ltndjV4A5n8g0D19me9vNstqdb9Nb1gGZySjn
        f1FlshfERbe1ttdlTlyjqWeXvmwbrMUK6fuNCMDKQg==
X-Google-Smtp-Source: ABdhPJyBQi7QLqN/2zmcrtER6C4MDYKv5+MDWVy+YvE3kmlkBFB/kEygHP2M+kvoZHlssTWDf0Ncpl8uHJYTAfydy00=
X-Received: by 2002:a05:6102:242b:: with SMTP id l11mr7188242vsi.14.1590796224606;
 Fri, 29 May 2020 16:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200529195951.GA3767@dtor-ws>
In-Reply-To: <20200529195951.GA3767@dtor-ws>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Sat, 30 May 2020 07:50:13 +0800
Message-ID: <CANMq1KDDa8jGwo9BNneJ=8y1HunM9hiRS2c0i5ASJ6+X4qvodw@mail.gmail.com>
Subject: Re: [PATCH] HID: usbhid: do not sleep when opening device
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Guenter Roeck <groeck@chromium.org>, linux-usb@vger.kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, May 30, 2020 at 3:59 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> usbhid tries to give the device 50 milliseconds to drain its queues
> when opening the device, but does it naively by simply sleeping in open
> handler, which slows down device probing (and thus may affect overall
> boot time).
>
> However we do not need to sleep as we can instead mark a point of time
> in the future when we should start processing the events.
>
> Reported-by: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/hid/usbhid/hid-core.c | 27 +++++++++++++++------------
>  drivers/hid/usbhid/usbhid.h   |  1 +
>  2 files changed, 16 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> index c7bc9db5b192..e69992e945b2 100644
> --- a/drivers/hid/usbhid/hid-core.c
> +++ b/drivers/hid/usbhid/hid-core.c
> @@ -95,6 +95,19 @@ static int hid_start_in(struct hid_device *hid)
>                                 set_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
>                 } else {
>                         clear_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> +
> +                       if (test_and_clear_bit(HID_RESUME_RUNNING,
> +                                              &usbhid->iofl)) {
> +                               /*
> +                                * In case events are generated while nobody was
> +                                * listening, some are released when the device
> +                                * is re-opened. Wait 50 msec for the queue to
> +                                * empty before allowing events to go through
> +                                * hid.
> +                                */
> +                               usbhid->input_start_time = jiffies +
> +                                                          msecs_to_jiffies(50);
> +                       }
>                 }
>         }
>         spin_unlock_irqrestore(&usbhid->lock, flags);
> @@ -280,7 +293,8 @@ static void hid_irq_in(struct urb *urb)
>                 if (!test_bit(HID_OPENED, &usbhid->iofl))
>                         break;
>                 usbhid_mark_busy(usbhid);
> -               if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl)) {
> +               if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl) &&
> +                   time_after(jiffies, usbhid->input_start_time)) {

Are we worried about jiffies overflowing (32-bit@1000Hz is "only" 49.7 days...)

>                         hid_input_report(urb->context, HID_INPUT_REPORT,
>                                          urb->transfer_buffer,
>                                          urb->actual_length, 1);
> @@ -714,17 +728,6 @@ static int usbhid_open(struct hid_device *hid)
>         }
>
>         usb_autopm_put_interface(usbhid->intf);
> -
> -       /*
> -        * In case events are generated while nobody was listening,
> -        * some are released when the device is re-opened.
> -        * Wait 50 msec for the queue to empty before allowing events
> -        * to go through hid.
> -        */
> -       if (res == 0)
> -               msleep(50);
> -
> -       clear_bit(HID_RESUME_RUNNING, &usbhid->iofl);
>         return res;
>  }
>
> diff --git a/drivers/hid/usbhid/usbhid.h b/drivers/hid/usbhid/usbhid.h
> index 8620408bd7af..805949671b96 100644
> --- a/drivers/hid/usbhid/usbhid.h
> +++ b/drivers/hid/usbhid/usbhid.h
> @@ -82,6 +82,7 @@ struct usbhid_device {
>
>         spinlock_t lock;                                                /* fifo spinlock */
>         unsigned long iofl;                                             /* I/O flags (CTRL_RUNNING, OUT_RUNNING) */
> +       unsigned long input_start_time;                                 /* When to start handling input, in jiffies */
>         struct timer_list io_retry;                                     /* Retry timer */
>         unsigned long stop_retry;                                       /* Time to give up, in jiffies */
>         unsigned int retry_delay;                                       /* Delay length in ms */
> --
> 2.27.0.rc0.183.gde8f92d652-goog
>
>
> --
> Dmitry
