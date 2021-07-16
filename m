Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23D943CBB1C
	for <lists+linux-input@lfdr.de>; Fri, 16 Jul 2021 19:23:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbhGPR00 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Jul 2021 13:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbhGPR00 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Jul 2021 13:26:26 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF3CC06175F;
        Fri, 16 Jul 2021 10:23:30 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id bu12so16354036ejb.0;
        Fri, 16 Jul 2021 10:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qZ2DK15Kq7udcyL2I98hwSDJ/4D1rlU31IVeu+Pbg5I=;
        b=PPaw1wWyp29w2I7OeXk8COAxvCMeQq9MX5dVI08+lA0B3XGqRAWuTZuGvguQmWmoIO
         Qy7iVaS8C8OYGMb2PaJUHcevotaLCoiepG7ucTdQBK1Xz0vMHIIo+h825u7DCE2qTC4v
         5rICFn0kQdRqkRoXHLsViYY+gAO3GynetU1xr42bdVife0W+Dj7dZY3eVg+7wZSoW+Qs
         x4rZzX9Hhxbq3o+Ik3GlPuWUDfkjiCGc4th/7dBO0PE3yDC50XmkrC+8jl8W/tfMo8VY
         aOE1n7j1SRJxbdKZc3eFgwudGxey7PAsBxSJzpdDvZw8EJ/kC4b3QRLy/k5ygWN09wlJ
         v7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qZ2DK15Kq7udcyL2I98hwSDJ/4D1rlU31IVeu+Pbg5I=;
        b=hXT/TLyka6DOMZi//9ic1Sfup6ruWdg7H19L+i9yT7Js3Lke/4oJHjkZhXGx0TFxyb
         F0I9cmWFax869/ms6UuG1qoOd5hruD2wHAK7sYFQcyxkSDK1AvK2GHrYZFaLAMhzdmTf
         j7uuivNM3rAnaKhxCQHloLRcNK0qwUEw82HWqTjIK92aLk+VukXdjeleWQow9UZNFQvM
         p9SmXn+vNm43h7diKHYcxLUlCi3ovfCAzZ53QMzrWfUzF+8MfRdubRRhEzPBqilKo9Kt
         TUVk60Woo6eh1AqaM/u4a/T6Fs+9mDOI6JFi90bnaBl3viFQPbPJGZQ/1k7fW0v64JDj
         32Ng==
X-Gm-Message-State: AOAM533Kt6sj+J7HM+o17CYYpR2vSf3YqqCOt4L5kF0utNxopItwgWQf
        Ti1eDYFa799NDKX5C7MZsjO3jQpTSvnWArrP+90=
X-Google-Smtp-Source: ABdhPJx/YSwMk/X7h1IvUMI7tNTP3Cb7B66n/uLPx4apIWw08GIiMtKfQWarDUNYo89qwzYF1NwWeZlmRxqPXIdRCAg=
X-Received: by 2002:a17:906:190c:: with SMTP id a12mr13023343eje.37.1626456208797;
 Fri, 16 Jul 2021 10:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210703220202.5637-1-maxtram95@gmail.com> <20210703220202.5637-2-maxtram95@gmail.com>
 <CAO-hwJJxJqgW6CGPmvL41teh6vgWfSg55qoXWL3TjQx+mvsbHg@mail.gmail.com>
 <nycvar.YFH.7.76.2107152057230.8253@cbobk.fhfr.pm> <YPCc/k89XNTmeKVo@google.com>
 <20210715224905.GA18180@duo.ucw.cz>
In-Reply-To: <20210715224905.GA18180@duo.ucw.cz>
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
Date:   Fri, 16 Jul 2021 20:23:02 +0300
Message-ID: <CAKErNvrc0NjVwpXiGVED0c2PatVh9ObUBjqem9mi8hq_TZcyWw@mail.gmail.com>
Subject: Re: [PATCH 1/6] HID: hid-input: Add offhook and ring LEDs for headsets
To:     Pavel Machek <pavel@ucw.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-leds@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>,
        Oliver Neukum <oneukum@suse.de>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jul 16, 2021 at 1:49 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> On Thu 2021-07-15 13:39:26, Dmitry Torokhov wrote:
> > On Thu, Jul 15, 2021 at 08:57:44PM +0200, Jiri Kosina wrote:
> > > On Tue, 6 Jul 2021, Benjamin Tissoires wrote:
> > >
> > > > > A lot of USBHID headsets available on the market have LEDs that indicate
> > > > > ringing and off-hook states when used with VoIP applications. This
> > > > > commit exposes these LEDs via the standard sysfs interface.
>
> > > > > diff --git a/drivers/input/input-leds.c b/drivers/input/input-leds.c
> > > > > index 0b11990ade46..bc6e25b9af25 100644
> > > > > --- a/drivers/input/input-leds.c
> > > > > +++ b/drivers/input/input-leds.c
> > > > > @@ -33,6 +33,8 @@ static const struct {
> > > > >         [LED_MISC]      = { "misc" },
> > > > >         [LED_MAIL]      = { "mail" },
> > > > >         [LED_CHARGING]  = { "charging" },
> > > > > +       [LED_OFFHOOK]   = { "offhook" },
> > > >
> > > > I am pretty sure this also needs to be reviewed by the led folks.
> > > > Adding them in Cc.
> > >
> > > Can we please get Ack from the LED maintainers? Thanks.
> >
> > I do not think we should be adding more LED bits to the input
> > subsystem/events; this functionality should be routed purely though LED
> > subsystem. input-leds is a bridge for legacy input functionality
> > reflecting it onto the newer LED subsystem.

I'm a bit confused by this answer. I wasn't aware that input-leds was
some legacy stuff. Moreover, hid-input only handles LEDs through
input-leds, it doesn't use any modern replacement. So, does your
answer mean I need to implement this replacement? If so, I anticipate
some issues with this approach:

1. hid-input will handle different LEDs in different ways, which will
make code complicated and error-prone. There will be two parallel
implementations for LEDs.

2. A lot of code will be similar with input-leds, but not shared/reused.

3. New driver callbacks may be needed if drivers want to override the
default behavior, like they do with input_mapping/input_mapped.

4. If some hypothetical input device is a headset, but not HID, it
won't be able to reuse the LED handling code. With input-leds it
wouldn't be a problem.

5. (Minor) LED_MUTE is already there. If we handle LED_OFFHOOK and
LED_RING in a different way, it would be confusing.

Let's discuss the architecture before I write any new code, if we are
going to take this way. However, to me, input-leds looks like a better
fit: the implementation is much simpler and follows existing patterns,
and it integrates well with drivers and hid-input. If we throw away
input-leds, we'll have to do its job ourselves, and if we throw it
away only for part of LEDs, the code will likely be ugly.

> If we do it purely through the LED subsystem, will it get trickier to
> associate the devices?

I agree with this point. With the current approach, it's easy to look
up all LEDs of an input device. If the suggested approach makes it
hard, it's a serious drawback.

> Anyway, it is a headset. What does headset have to do with input
> subsystem? Sounds like sound device to me...

That's right, the main function of a headset is of course sound, but
such headsets also have buttons (vol up/down, mic mute, answer the
call) and LEDs (mic muted, ringing, offhook). The sound "subdevice"
(sorry, I'm not really familiar with USB terminology) is handled by
snd-usb-audio, and the buttons/LEDs are handled by usbhid.

Two examples of such headsets are mentioned in commit messages in this
patch series. Such headsets are usually "certified for skype for
business", but of course can be used with a variety of other VoIP
applications. The goal of this series is to provide a standard
interface between headsets and userspace applications, so that VoIP
applications could react to buttons and set LED state, making Linux
more ready for desktop.

> And we already have a
> "micmute" LED which sounds quite similar to the "offhook" LED... no?

These two are different. A typical headset has three LEDs: micmute,
ring and offhook (ring and offhook are often one physical LED, which
blinks in the ring state and glows constantly in the offhook state).

Offhook indicates that a call is in progress, while micmute shows that
the microphone is muted. These two states are orthogonal and may
happen in any combination. On the tested devices, offhook state didn't
affect sound, it was just a logical indication of an active call.

If you are interested in more details, I can describe the behavior of
the headsets that I tested (some info is actually in the commit
messages), but the short answer is that micmute and offhook are two
different physical LEDs with completely different functions.

>
> Best regards,
>                                                                 Pavel
> --
> http://www.livejournal.com/~pavelmachek
