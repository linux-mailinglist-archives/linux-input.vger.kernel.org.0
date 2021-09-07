Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2658402375
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 08:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231931AbhIGGbk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 02:31:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbhIGGbj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 02:31:39 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 050AEC061575;
        Mon,  6 Sep 2021 23:30:33 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so859377pjc.3;
        Mon, 06 Sep 2021 23:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=imT5AwR7rVdHL3kGC1+hyeiMX42yzFCZ1Les27iTujc=;
        b=JV1D59dzRrdKSBeiY4A9a41t1gtvvyh6+H5WS44AglzJ268kxHDt6AIzPEJNw7Y+p3
         Y1S1Ufu5yB1HdB8uEZL35k5FJGEHszOr0f8Kki3NHgwJstWvvCyJlwOmvBoqjAnH01zd
         46TUWQpS/2Lv8iqXFv4ZlA000if4ebNUqn2GkxG3MTwVkx0Kz9ZEf6JIr2oGJS20mcLn
         02tlJQRNQ1rnNj87UXVM20K1hm/jQt+WorRFA7mv5IjBUaev5zX908gqsDDKpcacZE3X
         0Jt4iYDrNX6hoIkN1lDc7j6pP1IuO4zvYCHKEmQ+GnPnzezOADi7BCU3DLi/I957wNet
         R8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=imT5AwR7rVdHL3kGC1+hyeiMX42yzFCZ1Les27iTujc=;
        b=Ybm2QQXIUSKz6+ccSEINFo31FbQq8QyiABosmjGnr9S3739p74no3P/5CWnwUFNB28
         MfX13hq8fEciu2D4uNJhAJ5PtOcRrrVWmatvcci8X0dmnPG/9bV4ndsAS1fZBO22p38h
         ut2A7A+f59RSXClsBwd/81DEffH6ySHCYSIAbbpE+3G6ge4C4tQh9jeOk59LkY80YbtS
         ClFi/3IZGHHoDGlnLFUTuitO4Y3xPpQL9F6nOsXij+QG6dzcMpYQ+I5f9abgXQW8lW7t
         4q8WopCOFgZ5Fp5s2RyFfZUMnIQ5tbA/3p7veof7SOtlV10H5UYqESRw97B7gst8b8HM
         xYVA==
X-Gm-Message-State: AOAM530NGk0mznD95pyFfQNPnnL4ZaEcOumVA1G0Qm+JG8SUOapmxYKs
        gS95N+bmEu7Vi1N0l7PBQco=
X-Google-Smtp-Source: ABdhPJySzShbrWq23QOcs5iRO7dpdklAThwpqb0zZxXxwWhGXDOJUmGY//RshaPM2CY97CWoCuW7fQ==
X-Received: by 2002:a17:90a:8a13:: with SMTP id w19mr2864531pjn.245.1630996231086;
        Mon, 06 Sep 2021 23:30:31 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:668f:8a8e:5bc5:fb2d])
        by smtp.gmail.com with ESMTPSA id l6sm9536422pff.74.2021.09.06.23.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 23:30:30 -0700 (PDT)
Date:   Mon, 6 Sep 2021 23:30:27 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Maxim Mikityanskiy <maxtram95@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-leds@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>,
        Oliver Neukum <oneukum@suse.de>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] HID: hid-input: Add offhook and ring LEDs for
 headsets
Message-ID: <YTcHA+Irh4QHTBNC@google.com>
References: <20210703220202.5637-1-maxtram95@gmail.com>
 <20210703220202.5637-2-maxtram95@gmail.com>
 <CAO-hwJJxJqgW6CGPmvL41teh6vgWfSg55qoXWL3TjQx+mvsbHg@mail.gmail.com>
 <nycvar.YFH.7.76.2107152057230.8253@cbobk.fhfr.pm>
 <YPCc/k89XNTmeKVo@google.com>
 <20210715224905.GA18180@duo.ucw.cz>
 <CAKErNvrc0NjVwpXiGVED0c2PatVh9ObUBjqem9mi8hq_TZcyWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKErNvrc0NjVwpXiGVED0c2PatVh9ObUBjqem9mi8hq_TZcyWw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Jul 16, 2021 at 08:23:02PM +0300, Maxim Mikityanskiy wrote:

Sorry for disappearing for a while.

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
> some legacy stuff.

Yes, input-leds provides bridge from legacy leds defined in input
subsystem over to proper LED subsystem that we have now. Now that we
have proper LED subsystem all new LEDs should be introduced via it.
Especially given that some of the LEDs defined in HID have little
relation to input (Printer Out of Paper, Battery OK, RGB LEDs, etc).

> Moreover, hid-input only handles LEDs through
> input-leds, it doesn't use any modern replacement. So, does your
> answer mean I need to implement this replacement?

Yes.

> If so, I anticipate
> some issues with this approach:
> 
> 1. hid-input will handle different LEDs in different ways, which will
> make code complicated and error-prone. There will be two parallel
> implementations for LEDs.

Yes you will need to route currently defined input LEDs as they are now
to keep compatibility with existing userspace, and new LEDs should be
registered directly.

> 
> 2. A lot of code will be similar with input-leds, but not shared/reused.

Hmm, not really. I mean you will need to call to register LEDs and
toggle them, but that's the same as any other driver registering LEDs.

> 
> 3. New driver callbacks may be needed if drivers want to override the
> default behavior, like they do with input_mapping/input_mapped.

OK.

> 
> 4. If some hypothetical input device is a headset, but not HID, it
> won't be able to reuse the LED handling code. With input-leds it
> wouldn't be a problem.

We have a lot of non-HID touchpads, touchscreens, mice, joysticks, etc
that do it for all other data. LEDs are not different.

> 
> 5. (Minor) LED_MUTE is already there. If we handle LED_OFFHOOK and
> LED_RING in a different way, it would be confusing.

Not to userspace that uses LED subsystem. And I admit that adding LEDs
beyond keyboard indicators was a mistake (but we did not have proper LED
subsystem back then).

> 
> Let's discuss the architecture before I write any new code, if we are
> going to take this way. However, to me, input-leds looks like a better
> fit: the implementation is much simpler and follows existing patterns,
> and it integrates well with drivers and hid-input. If we throw away
> input-leds, we'll have to do its job ourselves, and if we throw it
> away only for part of LEDs, the code will likely be ugly.

I think it will be OK. You just need to note how each led should be
routed, and then call appropriate API when handling events.

> 
> > If we do it purely through the LED subsystem, will it get trickier to
> > associate the devices?
> 
> I agree with this point. With the current approach, it's easy to look
> up all LEDs of an input device. If the suggested approach makes it
> hard, it's a serious drawback.

You already need to deal with composite devices and figure a way to
associate all parts of them. And you already need to locate LED devices
associated with the input device because you are supposed to interface
via LED subsystem and not input (i.e. new applications should not be
using EVIOCGLED and writing EV_LED to evdev to control LEDs).

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

Thanks.

-- 
Dmitry
