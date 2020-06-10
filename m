Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1BC1F4CE9
	for <lists+linux-input@lfdr.de>; Wed, 10 Jun 2020 07:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgFJF2P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Jun 2020 01:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726051AbgFJF2N (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Jun 2020 01:28:13 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1756DC03E96F
        for <linux-input@vger.kernel.org>; Tue,  9 Jun 2020 22:28:13 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id l12so1080290ejn.10
        for <linux-input@vger.kernel.org>; Tue, 09 Jun 2020 22:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T/jnmVd/bh9loEdDEgeb3HlsdzM3UCvTcIUqLjOK8wM=;
        b=NVKK8Ncy1CLQa1GlK2EjqNT2z0/cxOFotcgTyS92UZqtKAixCKZm5P7LgHCa7PP2ZI
         flclmztcZcsY97HSfIjpavaBhH70f7SwiaDd+gawqqoyVQlxTMpEdNgc/jgzcCjWhhOW
         IgLUEocOdgu4TeJds3+h6ALqtlmtSFVLyCp72tDI98Jd5HlUjBP/m1ptwaW494vPhlbL
         89LaiuT6ofUQDTvESFwkYMIu3CNjtgnVg8FPjvrogRE77m2XTcyS72gpTNhIcBxtoZSl
         fKqk4/D7LjIeJA8S65IHkkW364GmTwj8Ucz4eCMw+TqvWNyuVMQclYcWPDll7rLd/V1t
         /O9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T/jnmVd/bh9loEdDEgeb3HlsdzM3UCvTcIUqLjOK8wM=;
        b=QLzx5iQXBaCwvBrTF6HZKCevsolpkKw12PA4Q2FuM/+Y7mSzgYizQaUwLclKhBH1Lq
         L4h4fcjCGQHyMoCol4+HF/omuWEUJuUviKncxym11K1FGFggBq4U4i8qa2KdGqQyH2gZ
         7OB6lKYRWdzvZw2FpDb1ZXgJmDJihs/TAMufMed80qkWeQqNHsOcOwib9SKdF01ifQhM
         KerhKPZIzZSWIWvRNACEfWu+GsbzxHN01I0syAW5j4XEfrBrRsn6PesXIdm5xcQUTb26
         M6TCSbD4tbKhAcD9YjnbN1M7vVTi2efLJNHTjfIqiDsKQq2qEdusDfbmmt7YDQa+HZ/O
         Z1Ag==
X-Gm-Message-State: AOAM533gqSKjTQbP/SgC11Z5wtBfR+vG24iyzLq5+UwhhcAi2BKEAG+r
        nuXyQ3Z0FElNp/Pr2CqM0ML+D6hdGpm2rKvK2VEybQ==
X-Google-Smtp-Source: ABdhPJz0/EqE/wsKuHGBezMRKKF5qcxIfkGPjwwqO2vlE2Lz0OqDCLBvz2CrRh6NSHlfDRU79JvbMI9q2sJ2yf+qmxg=
X-Received: by 2002:a17:906:9a02:: with SMTP id ai2mr1671514ejc.97.1591766891357;
 Tue, 09 Jun 2020 22:28:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200610043824.GA171503@dtor-ws>
In-Reply-To: <20200610043824.GA171503@dtor-ws>
From:   Guenter Roeck <groeck@google.com>
Date:   Tue, 9 Jun 2020 22:28:00 -0700
Message-ID: <CABXOdTfdLv5iiZhyGmrmYfk15esoiJhshs_ey+9ma7hLqC4p2A@mail.gmail.com>
Subject: Re: [PATCH v2] HID: usbhid: do not sleep when opening device
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Guenter Roeck <groeck@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        linux-usb@vger.kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 9, 2020 at 9:38 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> usbhid tries to give the device 50 milliseconds to drain its queues when
> opening the device, but dies it naively by simply sleeping in open handler,
> which slows down device probing (and thus may affect overall boot time).
>
> However we do not need to sleep as we can instead mark a point of time in
> the future when we should start processing the events.
>
> Reported-by: Nicolas Boichat <drinkcat@chromium.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Guenter Roeck <groeck@chromium.org>

> ---
>
> v2: switched from using jiffies to ktime_t to make sure we won't have
> issues with jiffies overflowing.
>
>  drivers/hid/usbhid/hid-core.c | 53 +++++++++++++++++++----------------
>  drivers/hid/usbhid/usbhid.h   |  2 ++
>  2 files changed, 31 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> index c7bc9db5b192..72c92aab2b18 100644
> --- a/drivers/hid/usbhid/hid-core.c
> +++ b/drivers/hid/usbhid/hid-core.c
> @@ -26,6 +26,7 @@
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>  #include <linux/string.h>
> +#include <linux/timekeeping.h>
>
>  #include <linux/usb.h>
>
> @@ -95,6 +96,18 @@ static int hid_start_in(struct hid_device *hid)
>                                 set_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
>                 } else {
>                         clear_bit(HID_NO_BANDWIDTH, &usbhid->iofl);
> +
> +                       if (test_bit(HID_RESUME_RUNNING, &usbhid->iofl)) {
> +                               /*
> +                                * In case events are generated while nobody was
> +                                * listening, some are released when the device
> +                                * is re-opened. Wait 50 msec for the queue to
> +                                * empty before allowing events to go through
> +                                * hid.
> +                                */
> +                               usbhid->input_start_time =
> +                                       ktime_add_ms(ktime_get_coarse(), 50);
> +                       }
>                 }
>         }
>         spin_unlock_irqrestore(&usbhid->lock, flags);
> @@ -280,20 +293,23 @@ static void hid_irq_in(struct urb *urb)
>                 if (!test_bit(HID_OPENED, &usbhid->iofl))
>                         break;
>                 usbhid_mark_busy(usbhid);
> -               if (!test_bit(HID_RESUME_RUNNING, &usbhid->iofl)) {
> -                       hid_input_report(urb->context, HID_INPUT_REPORT,
> -                                        urb->transfer_buffer,
> -                                        urb->actual_length, 1);
> -                       /*
> -                        * autosuspend refused while keys are pressed
> -                        * because most keyboards don't wake up when
> -                        * a key is released
> -                        */
> -                       if (hid_check_keys_pressed(hid))
> -                               set_bit(HID_KEYS_PRESSED, &usbhid->iofl);
> -                       else
> -                               clear_bit(HID_KEYS_PRESSED, &usbhid->iofl);
> +               if (test_bit(HID_RESUME_RUNNING, &usbhid->iofl)) {
> +                       if (ktime_before(ktime_get_coarse(),
> +                                        usbhid->input_start_time))
> +                               break;
> +                       clear_bit(HID_RESUME_RUNNING, &usbhid->iofl);
>                 }
> +               hid_input_report(urb->context, HID_INPUT_REPORT,
> +                                urb->transfer_buffer, urb->actual_length, 1);
> +               /*
> +                * autosuspend refused while keys are pressed
> +                * because most keyboards don't wake up when
> +                * a key is released
> +                */
> +               if (hid_check_keys_pressed(hid))
> +                       set_bit(HID_KEYS_PRESSED, &usbhid->iofl);
> +               else
> +                       clear_bit(HID_KEYS_PRESSED, &usbhid->iofl);
>                 break;
>         case -EPIPE:            /* stall */
>                 usbhid_mark_busy(usbhid);
> @@ -714,17 +730,6 @@ static int usbhid_open(struct hid_device *hid)
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
> index 8620408bd7af..0f0bcf7037f8 100644
> --- a/drivers/hid/usbhid/usbhid.h
> +++ b/drivers/hid/usbhid/usbhid.h
> @@ -13,6 +13,7 @@
>
>  #include <linux/types.h>
>  #include <linux/slab.h>
> +#include <linux/ktime.h>
>  #include <linux/list.h>
>  #include <linux/mutex.h>
>  #include <linux/timer.h>
> @@ -82,6 +83,7 @@ struct usbhid_device {
>
>         spinlock_t lock;                                                /* fifo spinlock */
>         unsigned long iofl;                                             /* I/O flags (CTRL_RUNNING, OUT_RUNNING) */
> +       ktime_t input_start_time;                                       /* When to start handling input */
>         struct timer_list io_retry;                                     /* Retry timer */
>         unsigned long stop_retry;                                       /* Time to give up, in jiffies */
>         unsigned int retry_delay;                                       /* Delay length in ms */
> --
> 2.27.0.278.ge193c7cf3a9-goog
>
>
> --
> Dmitry
