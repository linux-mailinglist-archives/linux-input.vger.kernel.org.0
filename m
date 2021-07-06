Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2D63BC799
	for <lists+linux-input@lfdr.de>; Tue,  6 Jul 2021 10:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhGFIF3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jul 2021 04:05:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54881 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230257AbhGFIF3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 6 Jul 2021 04:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625558570;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+swUsT6jfn8OEw879qU85kP2j+79w+z6Jt4ztqDMvpo=;
        b=dFimcwSZhIoQiGuKQvuJhEhkh5uC+xnxsqvzeRfdRRtgL+V9p+5F3IvJogoHn/Pqc0wv53
        RxMYNjIcLf+8cMWk/YHFKEPpb3Kpm2t9qhzSVh/iVb0LRf2EpkzHl1vDHoyIlIXKa98bWe
        L0rYHIZyZvWUj/Pdx3p5UYbLoxgLB80=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-5CzXzNiFNEubWzBQ9VluNQ-1; Tue, 06 Jul 2021 04:02:49 -0400
X-MC-Unique: 5CzXzNiFNEubWzBQ9VluNQ-1
Received: by mail-pf1-f198.google.com with SMTP id 124-20020a6217820000b02902feebfd791eso13564219pfx.19
        for <linux-input@vger.kernel.org>; Tue, 06 Jul 2021 01:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+swUsT6jfn8OEw879qU85kP2j+79w+z6Jt4ztqDMvpo=;
        b=lo379/5HK7QhKezQkCgx+R40gVRwa1Ry+VbpM4qI02MTw2THC73sg4r3wPiTy9IF6U
         Ud2iUUOaflTbfilIizwagVTO5C1+PDXVUp3RembHNRjmAoT5xAA3KXYhnitnLCeH/zb1
         tsDU5sIOiqbwpcTrqDAa0VnOfYnMImD4JVcCZb9DpMZHksJWu4XfgjnFglGGzA+MM3nj
         L+mJ1MaDG9/Umoqju6IoRxSt+O/BQcR0Oi5rHadPEUikR9MnWISRpDLySOHI9Ox5j92a
         5JS8YGKX74W3BFcV1uIsnC5sthBzoEOumXWCQXW7IM7qlijpV6kuvnuTtE4aeb6rFk3L
         GfvA==
X-Gm-Message-State: AOAM532WVObCGxtGC3CE0/DmMEpiVmWA5c1gJWPDQhKeVtzMc7p2atXU
        zgr8chsf+PHxyPiTWiAWBeuiwnYutD/n+fjFlviWUzbbgnK/67jx/kAMzS03COlFTc5DhnzL/dF
        ozRgpr5rdvoCQDaT3pXhhXvtcsv10ni3h3Zdob0w=
X-Received: by 2002:a17:902:e5d0:b029:129:b045:ffb with SMTP id u16-20020a170902e5d0b0290129b0450ffbmr1180042plf.41.1625558567987;
        Tue, 06 Jul 2021 01:02:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7uA1JRg8MsIVmaLevHXUJY8rWznA01LvLEUQpGY5+hHO4RWODpYWBnxeZnbAMkItBKZKlnG/RDG4srQa9Ssg=
X-Received: by 2002:a17:902:e5d0:b029:129:b045:ffb with SMTP id
 u16-20020a170902e5d0b0290129b0450ffbmr1180019plf.41.1625558567746; Tue, 06
 Jul 2021 01:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210703220202.5637-1-maxtram95@gmail.com> <20210703220202.5637-2-maxtram95@gmail.com>
In-Reply-To: <20210703220202.5637-2-maxtram95@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 6 Jul 2021 10:02:36 +0200
Message-ID: <CAO-hwJJxJqgW6CGPmvL41teh6vgWfSg55qoXWL3TjQx+mvsbHg@mail.gmail.com>
Subject: Re: [PATCH 1/6] HID: hid-input: Add offhook and ring LEDs for headsets
To:     Maxim Mikityanskiy <maxtram95@gmail.com>,
        linux-leds@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Kurtz <djkurtz@chromium.org>,
        Oliver Neukum <oneukum@suse.de>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Maxim,

On Sun, Jul 4, 2021 at 12:02 AM Maxim Mikityanskiy <maxtram95@gmail.com> wrote:
>
> A lot of USBHID headsets available on the market have LEDs that indicate
> ringing and off-hook states when used with VoIP applications. This
> commit exposes these LEDs via the standard sysfs interface.
>
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> ---
>  drivers/hid/hid-input.c                | 2 ++
>  drivers/input/input-leds.c             | 2 ++
>  include/uapi/linux/input-event-codes.h | 2 ++
>  3 files changed, 6 insertions(+)
>
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 4286a51f7f16..44b8243f9924 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -798,6 +798,8 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>                 case 0x4b:  map_led (LED_MISC);     break;    /*   "Generic Indicator"        */
>                 case 0x19:  map_led (LED_MAIL);     break;    /*   "Message Waiting"          */
>                 case 0x4d:  map_led (LED_CHARGING); break;    /*   "External Power Connected" */
> +               case 0x17:  map_led (LED_OFFHOOK);  break;    /*   "Off-Hook"                 */
> +               case 0x18:  map_led (LED_RING);     break;    /*   "Ring"                     */
>
>                 default: goto ignore;
>                 }
> diff --git a/drivers/input/input-leds.c b/drivers/input/input-leds.c
> index 0b11990ade46..bc6e25b9af25 100644
> --- a/drivers/input/input-leds.c
> +++ b/drivers/input/input-leds.c
> @@ -33,6 +33,8 @@ static const struct {
>         [LED_MISC]      = { "misc" },
>         [LED_MAIL]      = { "mail" },
>         [LED_CHARGING]  = { "charging" },
> +       [LED_OFFHOOK]   = { "offhook" },

I am pretty sure this also needs to be reviewed by the led folks.
Adding them in Cc.

Cheers,
Benjamin

> +       [LED_RING]      = { "ring" },
>  };
>
>  struct input_led {
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 225ec87d4f22..dd785a5b5076 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -925,6 +925,8 @@
>  #define LED_MISC               0x08
>  #define LED_MAIL               0x09
>  #define LED_CHARGING           0x0a
> +#define LED_OFFHOOK            0x0b
> +#define LED_RING               0x0c
>  #define LED_MAX                        0x0f
>  #define LED_CNT                        (LED_MAX+1)
>
> --
> 2.32.0
>

