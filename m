Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A663640230F
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 07:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233434AbhIGF3n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 01:29:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233236AbhIGF3n (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 01:29:43 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F03C061575;
        Mon,  6 Sep 2021 22:28:37 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id z5so17535835ybj.2;
        Mon, 06 Sep 2021 22:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QruAUQz4oH1n5QRKELltRN9ZHlZR9+cOGgLRtTuYbco=;
        b=qj2+Ban/tPvAguGdfjD+hxhnXK61pzkSiv5muAVxV+zm24I/P6/sg29xnTe2W1XgcL
         yg2aO4Fbgey4BMs2mtY/xBt1/hMa4d9NojzKaXmW9q9zJZQaKDtXFaLwTcRDBvHLfAOM
         NASVfUNbtLgVpT1OiFH/KYtlWzcjDxdHXOujnwW+KuFmhbIZnoXiXRDgJxZUeAOPEa+y
         vCZq6SvhBtZuSWDD/xYOnKzsYvWvYkCk3v+wkEXCWjV3S6O7IHB7u33RmL6mMaM0ciR0
         1JS300xXB9Pz/0J6i1aKn7nmlP/WPkdxfI+TP6pUu25dv5NRtOl0ZPHXtFA7+8bMl3UA
         d+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QruAUQz4oH1n5QRKELltRN9ZHlZR9+cOGgLRtTuYbco=;
        b=XjpnYew4osaiIksR8J+eVTnuS+Q9gr0HKs+4tP3OY4i+VfrIWCjzFm0N0i14zSkXfR
         uzndlREQHPRHx9hn1T5ex8egq47038x2nmDMKz+4fOOrN+bJ4ceRyOm09ZMLfv08uGaq
         uAiSqxoeT8QHuR8JraZT7SKRlq0F947CUsr+5xwKHkQQRUZ2MnilwFm8XMdUJTwd3Ch7
         0pttLzdE0Ds94nvEEGLDTFqLxsBdWfHd03J1onROzi1eDrA/wgoap5QaZ472vcWXVEud
         jfvH0Lj0wwaS4voVfgN2/TFoP52wClL7ufwHUWQ1WbQoNcNmCbBHIACUcQp0p4bduXeB
         QKLA==
X-Gm-Message-State: AOAM532gWNFkKkqhnTxWmdGprlx+5DNS1NY2o0PPLt+JqEhjTSMP6MOi
        fdgYhI21Uvf6LGy4wWWFvrSGQ7llp0GhtvCV/ug=
X-Google-Smtp-Source: ABdhPJxRyjVbWxAHvmfJTS3PKD27kRJ8R7+O9ZJZ0ltljMU5u2M+1Bi97OIcRfD3RCEgKZxwqgvc0lX2GIvVBAXUYk4=
X-Received: by 2002:a25:7cc3:: with SMTP id x186mr20379643ybc.227.1630992515992;
 Mon, 06 Sep 2021 22:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210901223037.2964665-1-roderick.colenbrander@sony.com>
 <20210901223037.2964665-4-roderick.colenbrander@sony.com> <20210903161724.GC2209@bug>
In-Reply-To: <20210903161724.GC2209@bug>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Mon, 6 Sep 2021 22:28:24 -0700
Message-ID: <CAEc3jaC10g4LV7dwurzPsQfFpnb6Q1JY3+1sEcyeb88+73rQ=Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] HID: playstation: expose DualSense player LEDs
 through LED class.
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Pavel,

On Fri, Sep 3, 2021 at 9:25 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > The DualSense player LEDs were so far not adjustable from user-space.
> > This patch exposes each LED individually through the LED class. Each
> > LED uses the new 'player' function resulting in a name like:
> > 'inputX:white:player-1' for the first LED.
> >
> >
> > +struct ps_led_info {
> ...
> > +     enum led_brightness (*brightness_get)(struct led_classdev *cdev);
> > +     void (*brightness_set)(struct led_classdev *cdev, enum led_brightness);
> > +};
>
> Do you need these fields? They are constant in the driver...

Currently they are constant, but over time support for some other
devices (e.g. DualShock 4) will be moved into this driver as well and
then these are needed.

>
> > +static enum led_brightness dualsense_player_led_get_brightness(struct led_classdev *led)
> > +{
> > +     struct hid_device *hdev = to_hid_device(led->dev->parent);
> > +     struct dualsense *ds = hid_get_drvdata(hdev);
> > +
> > +     return !!(ds->player_leds_state & BIT(led - ds->player_leds));
> > +}
>
> You should not need to implement get if all it does is returning cached state.

The player LEDs are configured at driver loading time with an initial
value by calling 'dualsense_set_player_leds'. This is done behind the
back of the LED framework, so it is driver internal state. The problem
is that we need to set multiple LEDs at once at driver startup and
they share a common HID output report. The LED framework has no 'group
LED support' (outside the new multicolor class), so there is no way to
really synchronize multiple LEDs right now.

> > +static void dualsense_player_led_set_brightness(struct led_classdev *led, enum led_brightness value)
> > +{
> > +     struct hid_device *hdev = to_hid_device(led->dev->parent);
> > +     struct dualsense *ds = hid_get_drvdata(hdev);
> > +     unsigned long flags;
> > +     unsigned int led_index;
> > +
> > +     spin_lock_irqsave(&ds->base.lock, flags);
> > +
> > +     led_index = led - ds->player_leds;
> > +     if (value == LED_OFF)
> > +             ds->player_leds_state &= ~BIT(led_index);
> > +     else
> > +             ds->player_leds_state |= BIT(led_index);
> > +
> > +     ds->update_player_leds = true;
> > +     spin_unlock_irqrestore(&ds->base.lock, flags);
> > +
> > +     schedule_work(&ds->output_worker);
> > +}
>
> LED core can handle scheduling the work for you. You should use it, in similar
> way you handle the RGB led.

I'm not entirely sure what you meant. I guess you mean I should use
'cdev->brightness_set_blocking' instead of 'cdev->brightness_set' when
setting up the LED, so LED core can do more things itself? That's the
main difference I saw between my RGB and regular LED code. Both rely
on updating the internal dualsense structure and calling schedule_work
to schedule a HID output report (the output report contains data for
many things outside of just the LEDs). Is that indeed what you meant
or did I miss something (it is getting late here)?

>
> Best regards,
>                                                                         Pavel
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html

Regards,
Roderick
