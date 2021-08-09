Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E8783E4C25
	for <lists+linux-input@lfdr.de>; Mon,  9 Aug 2021 20:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235234AbhHISbT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Aug 2021 14:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbhHISbT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Aug 2021 14:31:19 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B37AC0613D3;
        Mon,  9 Aug 2021 11:30:58 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id c25so16743613ejb.3;
        Mon, 09 Aug 2021 11:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y6mW7b3jlZZ1bwl9ECgbw+U1s4aev/lYWXygt+p65GQ=;
        b=fi/0VEG0RbAL57owiPQMUMOEzWJLzESizaZ+ot53JGtYl2x6ZfpBdkVlJqul3YCBC0
         oaZf8vpELNcZ3q33S3+nxkNTKvQPbXOhIJVm/i/odkRzMbpRFBNEjk6Cy3MijVir79j2
         Xv6D2r10iZjiKvfQio/2n1qGEm5AzVqvTLE7946vvrHD3tuXwnI4/ZyyZP4C3uulHksS
         BmqVzRqH8eF6MXV3t52mN5XXmCfgr7wPX0FsQmaKVCBZ8uKB/jGAk0B4yqSVFNThEQz3
         7efhFJJSFubgGxqo3GFPn6DSvzanuUJmhuHbq+Y5xCWd3Ha/d90ziAwlvwqqPJFMDVd+
         ak2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y6mW7b3jlZZ1bwl9ECgbw+U1s4aev/lYWXygt+p65GQ=;
        b=lmuezCi6MgS+1vhlAaUB/Jr4luNAZzz+CZzhjCwp3srYA2MfWureUs6VhsmyJUQQ3F
         IBjvsynesZXQf5qsl90z3mys5LUcDUuW6oyBhm0MHpIzw2WdKk98uD2rUuS7CVsHz6a1
         dm92rQbw2hZFnYcLWGvc4y/ksxKum87+q/zznRNWbJUDLmth4STAXwMZET1hZaRah7L3
         iT8Iagvh6UJpnQ2ttZp3IZp0AHPEZTXFSc31oZBqgh8T9kdpv8v5qy/TvC2HnyjJzTTQ
         2xRCaQrT+NUFgB6c8LQkwlxlKUWdD8zQtHYIkOrLWQA9McKGVblVBMOE5dhdXbcf2R9Y
         7TeQ==
X-Gm-Message-State: AOAM532s2BYofR0niQt2FmFdM0hwiHovKta92oIJc43Yu4V3FFB17jMP
        idxMD1AykCUtRsvsDm5KyYH0zwXsjWkKp8q5+8o=
X-Google-Smtp-Source: ABdhPJwmBh2xqsB1E41vMQ3zfnA6NpFwAJDgxCyMAv4ncFwSxxN65ruIX5DjcTkSGe8WxQxP9oaMQwBndxiqZZyz/ME=
X-Received: by 2002:a17:906:408d:: with SMTP id u13mr6110485ejj.344.1628533856564;
 Mon, 09 Aug 2021 11:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210703220202.5637-1-maxtram95@gmail.com> <20210703220202.5637-2-maxtram95@gmail.com>
 <CAO-hwJJxJqgW6CGPmvL41teh6vgWfSg55qoXWL3TjQx+mvsbHg@mail.gmail.com>
 <nycvar.YFH.7.76.2107152057230.8253@cbobk.fhfr.pm> <YPCc/k89XNTmeKVo@google.com>
 <20210715224905.GA18180@duo.ucw.cz> <CAKErNvrc0NjVwpXiGVED0c2PatVh9ObUBjqem9mi8hq_TZcyWw@mail.gmail.com>
In-Reply-To: <CAKErNvrc0NjVwpXiGVED0c2PatVh9ObUBjqem9mi8hq_TZcyWw@mail.gmail.com>
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
Date:   Mon, 9 Aug 2021 21:30:30 +0300
Message-ID: <CAKErNvokonsQr=j8cSXGRkVUTopBqq3k5NeiqTUWPKmefmOaJw@mail.gmail.com>
Subject: Re: [PATCH 1/6] HID: hid-input: Add offhook and ring LEDs for headsets
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-leds@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>,
        Oliver Neukum <oneukum@suse.de>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dmitry, what's your opinion on the points that I raised? I would like
to progress with this patch set, let's discuss the direction and sum
up the requirements.

On Fri, Jul 16, 2021 at 8:23 PM Maxim Mikityanskiy <maxtram95@gmail.com> wrote:
>
> On Fri, Jul 16, 2021 at 1:49 AM Pavel Machek <pavel@ucw.cz> wrote:
> >
> > On Thu 2021-07-15 13:39:26, Dmitry Torokhov wrote:
> > > On Thu, Jul 15, 2021 at 08:57:44PM +0200, Jiri Kosina wrote:
> > > > On Tue, 6 Jul 2021, Benjamin Tissoires wrote:
> > > >
> > > > > > A lot of USBHID headsets available on the market have LEDs that indicate
> > > > > > ringing and off-hook states when used with VoIP applications. This
> > > > > > commit exposes these LEDs via the standard sysfs interface.
> >
> > > > > > diff --git a/drivers/input/input-leds.c b/drivers/input/input-leds.c
> > > > > > index 0b11990ade46..bc6e25b9af25 100644
> > > > > > --- a/drivers/input/input-leds.c
> > > > > > +++ b/drivers/input/input-leds.c
> > > > > > @@ -33,6 +33,8 @@ static const struct {
> > > > > >         [LED_MISC]      = { "misc" },
> > > > > >         [LED_MAIL]      = { "mail" },
> > > > > >         [LED_CHARGING]  = { "charging" },
> > > > > > +       [LED_OFFHOOK]   = { "offhook" },
> > > > >
> > > > > I am pretty sure this also needs to be reviewed by the led folks.
> > > > > Adding them in Cc.
> > > >
> > > > Can we please get Ack from the LED maintainers? Thanks.
> > >
> > > I do not think we should be adding more LED bits to the input
> > > subsystem/events; this functionality should be routed purely though LED
> > > subsystem. input-leds is a bridge for legacy input functionality
> > > reflecting it onto the newer LED subsystem.
>
> I'm a bit confused by this answer. I wasn't aware that input-leds was
> some legacy stuff. Moreover, hid-input only handles LEDs through
> input-leds, it doesn't use any modern replacement. So, does your
> answer mean I need to implement this replacement? If so, I anticipate
> some issues with this approach:
>
> 1. hid-input will handle different LEDs in different ways, which will
> make code complicated and error-prone. There will be two parallel
> implementations for LEDs.
>
> 2. A lot of code will be similar with input-leds, but not shared/reused.
>
> 3. New driver callbacks may be needed if drivers want to override the
> default behavior, like they do with input_mapping/input_mapped.
>
> 4. If some hypothetical input device is a headset, but not HID, it
> won't be able to reuse the LED handling code. With input-leds it
> wouldn't be a problem.
>
> 5. (Minor) LED_MUTE is already there. If we handle LED_OFFHOOK and
> LED_RING in a different way, it would be confusing.
>
> Let's discuss the architecture before I write any new code, if we are
> going to take this way. However, to me, input-leds looks like a better
> fit: the implementation is much simpler and follows existing patterns,
> and it integrates well with drivers and hid-input. If we throw away
> input-leds, we'll have to do its job ourselves, and if we throw it
> away only for part of LEDs, the code will likely be ugly.
>
> > If we do it purely through the LED subsystem, will it get trickier to
> > associate the devices?
>
> I agree with this point. With the current approach, it's easy to look
> up all LEDs of an input device. If the suggested approach makes it
> hard, it's a serious drawback.
>
> > Anyway, it is a headset. What does headset have to do with input
> > subsystem? Sounds like sound device to me...
>
> That's right, the main function of a headset is of course sound, but
> such headsets also have buttons (vol up/down, mic mute, answer the
> call) and LEDs (mic muted, ringing, offhook). The sound "subdevice"
> (sorry, I'm not really familiar with USB terminology) is handled by
> snd-usb-audio, and the buttons/LEDs are handled by usbhid.
>
> Two examples of such headsets are mentioned in commit messages in this
> patch series. Such headsets are usually "certified for skype for
> business", but of course can be used with a variety of other VoIP
> applications. The goal of this series is to provide a standard
> interface between headsets and userspace applications, so that VoIP
> applications could react to buttons and set LED state, making Linux
> more ready for desktop.
>
> > And we already have a
> > "micmute" LED which sounds quite similar to the "offhook" LED... no?
>
> These two are different. A typical headset has three LEDs: micmute,
> ring and offhook (ring and offhook are often one physical LED, which
> blinks in the ring state and glows constantly in the offhook state).
>
> Offhook indicates that a call is in progress, while micmute shows that
> the microphone is muted. These two states are orthogonal and may
> happen in any combination. On the tested devices, offhook state didn't
> affect sound, it was just a logical indication of an active call.
>
> If you are interested in more details, I can describe the behavior of
> the headsets that I tested (some info is actually in the commit
> messages), but the short answer is that micmute and offhook are two
> different physical LEDs with completely different functions.
>
> >
> > Best regards,
> >                                                                 Pavel
> > --
> > http://www.livejournal.com/~pavelmachek
