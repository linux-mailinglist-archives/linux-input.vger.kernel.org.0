Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19DF22070B2
	for <lists+linux-input@lfdr.de>; Wed, 24 Jun 2020 12:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389911AbgFXKFJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Jun 2020 06:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387927AbgFXKFI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Jun 2020 06:05:08 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D7EBC061573;
        Wed, 24 Jun 2020 03:05:08 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id v19so1187037qtq.10;
        Wed, 24 Jun 2020 03:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z5maTgbwq1mBVwGkwVDUzGasDeReJzYQw9cSssN0qDc=;
        b=CSd/2NsVZaadxg2J7hRL9VtzsuIkYfWnGji5R1eNqe8DlU6PEEBLYFUn4JZTQJt5eP
         sSEiRsZDCD2H2dY5ZH7RDA2EysUuehQp5H3yAI3CUJBb1XD8rfD5Xrunctov4hmgLxKg
         uq5HigZN5pcA27k7m5rm4rjuyZ9YUSj4tC5xLVFbGX0vZt94Ls1o4F83Bnvf/sZjgE9G
         JI5rtbrWXpSN0moSsB9kZvOuNHPtF8HvJpa5Mx8aqpZLiIm5zyVKVEk8f547b5c6oGsE
         GPTbMhbI+7Ez8tJfeVdrMvxTw8j+7L0Sm5Nb1tr0yinPH4zCV4BTzNuiLF/IdYbiB2NI
         vljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z5maTgbwq1mBVwGkwVDUzGasDeReJzYQw9cSssN0qDc=;
        b=NmBj2lFEWxgKRF/W+2cYkm3gvmSKw78vFrTwtublAUEXtWelGqudjpRxN+pCIhIrnF
         d01GOEbfzYPBBdwL0edxc7S2P1nlQQ0mtc3AHG+YSOijo3bYozCr7VF0LRHfsVh9iFf9
         k8OJxrwQAvPjNFBp8hxajDzSCrpN88zzeV2Wnngv38LSlWlc1PdYYvzKscEYqof1qijY
         qSZ8zdZhpWFm5l7pbye3plY7f7ZzquxH5lUEm4aTItX6K2kToEhB2LaELVcEssc6YDgJ
         hWYVHn+zhY1SC8+rgPV8sth6BSONF7c8Jn8leDKlxvwdGbp7ssXF2jPzPR64WLLFBgPT
         25Cg==
X-Gm-Message-State: AOAM5320kiteWY37Fpt69+wuDVNmadgIirhfov58M8qhUxF0zvLtKCGZ
        71se9raitjkTz25I9pNYeT9JaRGmMQXaPtzmoeRjUg==
X-Google-Smtp-Source: ABdhPJzaue1H3muo3r9o+r2OeMQI4vyL6SMZvtfU5NWe2avMvZxkRwTSUwKxuRaX6jsD8sFvVC/rd2WnA3Gwx+m32NE=
X-Received: by 2002:ac8:357b:: with SMTP id z56mr26595034qtb.107.1592993107331;
 Wed, 24 Jun 2020 03:05:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200622225728.330-1-gerbilsoft@gerbilsoft.com>
In-Reply-To: <20200622225728.330-1-gerbilsoft@gerbilsoft.com>
From:   David Rheinsberg <david.rheinsberg@gmail.com>
Date:   Wed, 24 Jun 2020 12:04:55 +0200
Message-ID: <CANq1E4T_SNUrewDQ59bonr7tTKFa=wRYwXLWHMCiNA0KN0H9Aw@mail.gmail.com>
Subject: Re: [PATCH 1/2] HID: wiimote: Initialize the controller LEDs with a
 device ID value
To:     David Korth <gerbilsoft@gerbilsoft.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

On Tue, Jun 23, 2020 at 12:57 AM David Korth <gerbilsoft@gerbilsoft.com> wrote:
>
> Based on a similar commit for Sony Sixaxis and DualShock 4 controllers:
> HID: sony: Initialize the controller LEDs with a device ID value
>
> Wii remotes have the same player LED layout as Sixaxis controllers,
> so the wiimote setup is based on the Sixaxis code.

Please include a description of the patch in the commit-message. It
took me quite a while to understand what the intention of this patch
is.

> Signed-off-by: David Korth <gerbilsoft@gerbilsoft.com>
> ---
>  drivers/hid/hid-wiimote-core.c    | 57 ++++++++++++++++++++++++++++++-
>  drivers/hid/hid-wiimote-modules.c |  7 ----
>  drivers/hid/hid-wiimote.h         |  1 +
>  3 files changed, 57 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
> index 92874dbe4d4a..9662c2ce5e99 100644
> --- a/drivers/hid/hid-wiimote-core.c
> +++ b/drivers/hid/hid-wiimote-core.c
> @@ -14,9 +14,12 @@
>  #include <linux/module.h>
>  #include <linux/mutex.h>
>  #include <linux/spinlock.h>
> +#include <linux/idr.h>
>  #include "hid-ids.h"
>  #include "hid-wiimote.h"
>
> +static DEFINE_IDA(wiimote_device_id_allocator);
> +
>  /* output queue handling */
>
>  static int wiimote_hid_send(struct hid_device *hdev, __u8 *buffer,
> @@ -694,6 +697,10 @@ static void wiimote_modules_unload(struct wiimote_data *wdata)
>         wdata->state.devtype = WIIMOTE_DEV_UNKNOWN;
>         spin_unlock_irqrestore(&wdata->state.lock, flags);
>
> +       if (wdata->device_id >= 0)
> +               ida_simple_remove(&wiimote_device_id_allocator,
> +                                       wdata->device_id);
> +
>         /* find end of list */
>         for (iter = mods; *iter != WIIMOD_NULL; ++iter)
>                 /* empty */ ;
> @@ -802,6 +809,20 @@ static const char *wiimote_devtype_names[WIIMOTE_DEV_NUM] = {
>         [WIIMOTE_DEV_PRO_CONTROLLER] = "Nintendo Wii U Pro Controller",
>  };
>
> +static __u8 wiimote_set_leds_from_id(int id)
> +{
> +       static const __u8 wiimote_leds[10] = {
> +               0x01, 0x02, 0x04, 0x08,
> +               0x09, 0x0A, 0x0C, 0x0D,
> +               0x0E, 0x0F
> +       };
> +
> +       if (id < 0)
> +               return wiimote_leds[0];
> +
> +       return wiimote_leds[id % 10];
> +}
> +
>  /* Try to guess the device type based on all collected information. We
>   * first try to detect by static extension types, then VID/PID and the
>   * device name. If we cannot detect the device, we use
> @@ -810,8 +831,10 @@ static void wiimote_init_set_type(struct wiimote_data *wdata,
>                                   __u8 exttype)
>  {
>         __u8 devtype = WIIMOTE_DEV_GENERIC;
> +       __u8 leds;
>         __u16 vendor, product;
>         const char *name;
> +       int device_id;
>
>         vendor = wdata->hdev->vendor;
>         product = wdata->hdev->product;
> @@ -858,6 +881,24 @@ static void wiimote_init_set_type(struct wiimote_data *wdata,
>                          wiimote_devtype_names[devtype]);
>
>         wiimote_modules_load(wdata, devtype);
> +
> +       /* set player number to stop initial LED-blinking */
> +       device_id = ida_simple_get(&wiimote_device_id_allocator, 0, 0,
> +                               GFP_KERNEL);
> +       if (device_id < 0) {
> +               /* Unable to get a device ID. */
> +               /* Set LED1 anyway to stop the blinking. */
> +               leds = WIIPROTO_FLAG_LED1;
> +               wdata->device_id = -1;
> +       } else {
> +               /* Device ID obtained. */
> +               leds = wiimote_set_leds_from_id(device_id);
> +               wdata->device_id = device_id;
> +       }
> +
> +       spin_lock_irq(&wdata->state.lock);
> +       wiiproto_req_leds(wdata, leds);
> +       spin_unlock_irq(&wdata->state.lock);

So what you are trying is to allocate a unique ID to each connected
wiimote, so they automatically display unique IDs, right?

Can you explain why this has to be done in the kernel driver? Why
isn't user-space assigning the right ID? User-space needs to attach
controllers to their respective engine anyway, in which case the IDs
the kernel assigns would be wrong, right? How does user-space display
the matching ID in their UI (e.g., for configuration use-cases)? The
way you set them does not allow user-space to query the ID, does it?
Lastly, wouldn't a device-reconnect want the same ID to be assigned
again? With the logic you apply, user-space would have to override
every ID for that to work.

Is there an actual use-case for this? Or is this just to align the
driver with the other gamepads?

Thanks
David

>  }
>
>  static void wiimote_init_detect(struct wiimote_data *wdata)
> @@ -1750,6 +1791,8 @@ static struct wiimote_data *wiimote_create(struct hid_device *hdev)
>         wdata->state.drm = WIIPROTO_REQ_DRM_K;
>         wdata->state.cmd_battery = 0xff;
>
> +       wdata->device_id = -1;
> +
>         INIT_WORK(&wdata->init_worker, wiimote_init_worker);
>         timer_setup(&wdata->timer, wiimote_init_timeout, 0);
>
> @@ -1879,7 +1922,19 @@ static struct hid_driver wiimote_hid_driver = {
>         .remove = wiimote_hid_remove,
>         .raw_event = wiimote_hid_event,
>  };
> -module_hid_driver(wiimote_hid_driver);
> +
> +static int __init wiimote_init(void)
> +{
> +       return hid_register_driver(&wiimote_hid_driver);
> +}
> +
> +static void __exit wiimote_exit(void)
> +{
> +       ida_destroy(&wiimote_device_id_allocator);
> +       hid_unregister_driver(&wiimote_hid_driver);
> +}
> +module_init(wiimote_init);
> +module_exit(wiimote_exit);
>
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("David Herrmann <dh.herrmann@gmail.com>");
> diff --git a/drivers/hid/hid-wiimote-modules.c b/drivers/hid/hid-wiimote-modules.c
> index 2c3925357857..0cdd6c219b5d 100644
> --- a/drivers/hid/hid-wiimote-modules.c
> +++ b/drivers/hid/hid-wiimote-modules.c
> @@ -362,13 +362,6 @@ static int wiimod_led_probe(const struct wiimod_ops *ops,
>         if (ret)
>                 goto err_free;
>
> -       /* enable LED1 to stop initial LED-blinking */
> -       if (ops->arg == 0) {
> -               spin_lock_irqsave(&wdata->state.lock, flags);
> -               wiiproto_req_leds(wdata, WIIPROTO_FLAG_LED1);
> -               spin_unlock_irqrestore(&wdata->state.lock, flags);
> -       }
> -
>         return 0;
>
>  err_free:
> diff --git a/drivers/hid/hid-wiimote.h b/drivers/hid/hid-wiimote.h
> index b2a26a0a8f12..800849427947 100644
> --- a/drivers/hid/hid-wiimote.h
> +++ b/drivers/hid/hid-wiimote.h
> @@ -160,6 +160,7 @@ struct wiimote_data {
>         struct wiimote_queue queue;
>         struct wiimote_state state;
>         struct work_struct init_worker;
> +       int device_id;
>  };
>
>  /* wiimote modules */
> --
> 2.27.0
>
