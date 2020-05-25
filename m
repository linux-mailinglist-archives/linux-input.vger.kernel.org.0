Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50DD11E0D3D
	for <lists+linux-input@lfdr.de>; Mon, 25 May 2020 13:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390403AbgEYLbh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 May 2020 07:31:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390439AbgEYLbg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 May 2020 07:31:36 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B352C061A0E
        for <linux-input@vger.kernel.org>; Mon, 25 May 2020 04:31:36 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x6so3161741wrm.13
        for <linux-input@vger.kernel.org>; Mon, 25 May 2020 04:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EMlCj5pdoWlNIYmtQO9G+i5S+UARnCjb6k6rDONqbJg=;
        b=LlCs91VZR6X9sMLvLSLxNFt3GF3ZBU5r1EolA5cjmgOdDyZmyf9as389tVG8ARnhsD
         /30xhBcn9x8NDd3yuPYIXwTdh1fReakgoF60ScOdhKMFnFMu0wJInZkBxQUhk2EBBoOg
         IKKeku0oYdSY1eWigu6X84naaYX8L6gh+ItOZWIlhTnbrYvQ02uXhjF9g19fLWaWgoHh
         kuAaeMhaxqHVuT0BLGAbjf1syYZGjTE/CnP0MAjfSAb0S/QjSk4vB5eDZU14aktvaWgd
         q3g79gT52o5WcqDAGHAnx051u/hgDjpwG2o4uSMYk8Fkx2t9KNYlAcX4iitJafk+75o9
         5FFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EMlCj5pdoWlNIYmtQO9G+i5S+UARnCjb6k6rDONqbJg=;
        b=PbjT4j9zqgjG57yH25HxeDankkQ64AztW4YQzNmaZpdNeXQZU5DPa1Z3QIhGATMWs4
         1qTW+gEppMAVsQsHn42f2kiA1mOMtaQIAuWEqUkxf/8sWXqbfvYwwWqW4bANBHJjQZ7X
         bf9xLl8jk68d63T8hWqJQ1BSlWgbireqJvhO6J/G+mATdCjp5KGKFsYNa3tDh2Qybwqh
         m8t5QCv3T2aMd2niECptlooSYeBSapEWdIh4DJ2iQuSINmSMlA2qXiKWrwXPQsoLSgeu
         KUN8eDbHVlNtVl6acZb1itj21fv9wZNMThJ21O9JGzwHWkodOIlJCD85ZApV3/cgudji
         1lKA==
X-Gm-Message-State: AOAM531spQ/Ilvwa9LQm8SRN4Qow8Ng6w7huI8vUVe3AnSZa+4CaeSRL
        3ElklMPUvM2Cb2R7iULqBjJk5smuNPUH4PiWl24gIA==
X-Google-Smtp-Source: ABdhPJzzCs8U3Z2wSbi2LNLY5vVEdq2DAFeGBmESojXhgyCMMr+h2r19FHsJ6rFQDjSBV8sCCVRZhoaNheo0Z9SsbKw=
X-Received: by 2002:a5d:6448:: with SMTP id d8mr15860285wrw.118.1590406294841;
 Mon, 25 May 2020 04:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <CANFaMLGVGmS4i3fdH2rYeqSgqk3Gm=sxaLLMuKx4T1eY9ZvyEg@mail.gmail.com>
 <CANq1E4QUMssPJXvR4njunbV4+2-0ojYvvDxQSTX_0iFPGoTYVw@mail.gmail.com>
In-Reply-To: <CANq1E4QUMssPJXvR4njunbV4+2-0ojYvvDxQSTX_0iFPGoTYVw@mail.gmail.com>
From:   Daniel Morse <daniel.morse@gmail.com>
Date:   Mon, 25 May 2020 12:31:22 +0100
Message-ID: <CANFaMLH69uwUrwcn060wCz1YxaDNS+jbbduXA6ORgO7Gst3=hw@mail.gmail.com>
Subject: Re: [PATCH[ HID: Wiimote: Treat the d-pad as an analogue stick
To:     David Rheinsberg <david.rheinsberg@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 25 May 2020 at 07:13, David Rheinsberg
<david.rheinsberg@gmail.com> wrote:
>
> Hi
>
> On Sun, May 24, 2020 at 12:03 AM Daniel Morse <dmorse@speedfox.co.uk> wrote:
> >
> > The controllers from the Super Nintendo Classic Edition (AKA the SNES
> > Mini) appear as a Classic Controller Pro when connected to a Wii
> > Remote. All the buttons work as the same, with the d-pad being mapped
> > the same as the d-pad on the Classic Controller Pro. This differs from
> > the behaviour of most controllers with d-pads and no analogue sticks,
> > where the d-pad maps to ABS_HAT1X for left and right, and ABS_HAT1Y
> > for up and down. This patch adds an option to the hid-wiimote module
> > to make the Super Nintendo Classic Controller behave this way.
> >
> > The patch has been tested with a Super Nintendo Classic Controller
> > plugged into a Wii Remote in both with the option both enabled and
> > disabled. When enabled the d-pad acts as the analogue control, and
> > when disabled it acts as it did before the patch was applied. This
> > patch has not been tested with e Wii Classic Controller (either the
> > original or the pro version) as I do not have one of these
> > controllers.
> >
> > Although I have not tested it with these controllers, I think it is
> > likely this patch will also work with the NES Classic Edition
> > Controllers.
> >
> > Signed-off-by: Daniel G. Morse <dmorse@speedfox.co.uk>
> > ---
> >  drivers/hid/hid-wiimote-core.c    |  6 ++
> >  drivers/hid/hid-wiimote-modules.c | 98 +++++++++++++++++++++++--------
> >  drivers/hid/hid-wiimote.h         |  1 +
> >  3 files changed, 82 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
> > index 92874dbe4d4a..4e75d7b7446f 100644
> > --- a/drivers/hid/hid-wiimote-core.c
> > +++ b/drivers/hid/hid-wiimote-core.c
> > @@ -1870,6 +1870,12 @@ static const struct hid_device_id
> > wiimote_hid_devices[] = {
> >                  USB_DEVICE_ID_NINTENDO_WIIMOTE2) },
> >      { }
> >  };
> > +
> > +bool dpad_as_analog = false;
> > +module_param(dpad_as_analog, bool, 0644);
> > +MODULE_PARM_DESC(dpad_as_analog,
> > +        "Treats the D-Pad as the main analog input");
>
> This can be put on one line:
>
>     MODULE_PARM_DESC(dpad_as_analog, "Use D-Pad as main analog input");
>
> (I would also slightly adjust the description as suggested).

No problem with that.

>
> > +
> >  MODULE_DEVICE_TABLE(hid, wiimote_hid_devices);
> >
> >  static struct hid_driver wiimote_hid_driver = {
> > diff --git a/drivers/hid/hid-wiimote-modules.c
> > b/drivers/hid/hid-wiimote-modules.c
> > index 2c3925357857..2c491c92cd8e 100644
> > --- a/drivers/hid/hid-wiimote-modules.c
> > +++ b/drivers/hid/hid-wiimote-modules.c
> > @@ -1110,19 +1110,85 @@ static void wiimod_classic_in_ext(struct
> > wiimote_data *wdata, const __u8 *ext)
> >      rt <<= 1;
> >      lt <<= 1;
> >
> > -    input_report_abs(wdata->extension.input, ABS_HAT1X, lx - 0x20);
> > -    input_report_abs(wdata->extension.input, ABS_HAT1Y, ly - 0x20);
> >      input_report_abs(wdata->extension.input, ABS_HAT2X, rx - 0x20);
> >      input_report_abs(wdata->extension.input, ABS_HAT2Y, ry - 0x20);
> >      input_report_abs(wdata->extension.input, ABS_HAT3X, rt);
> >      input_report_abs(wdata->extension.input, ABS_HAT3Y, lt);
> > +    if(dpad_as_analog) {
> > +        if(wdata->state.flags & WIIPROTO_FLAG_MP_ACTIVE){
>
> Missing space between `if` and `(`, as well as `(` and `{`.
>

OK, I'll clean all of these up.

> And more missing spaces between your `if` and opening parentheses below.
>
> > +            if((ext[4] & 0x80) && !(ext[1] & 0x01)) {
> > +                input_report_abs(wdata->extension.input,
> > +                        ABS_HAT1X, 0x7F);
> > +            } else if(!(ext[4] & 0x80) && (ext[1] & 0x01)) {
> > +                input_report_abs(wdata->extension.input,
> > +                        ABS_HAT1X, 0xFF);
> > +            } else {
> > +                input_report_abs(wdata->extension.input,
> > +                        ABS_HAT1X, 0x00);
> > +            }
> > +
> > +            if((ext[4] & 0x40) && !(ext[0] & 0x01)) {
> > +                input_report_abs(wdata->extension.input,
> > +                        ABS_HAT1Y, 0x7F);
> > +            } else if(!(ext[4] & 0x40) && (ext[0] & 0x01)) {
> > +                input_report_abs(wdata->extension.input,
> > +                        ABS_HAT1Y, 0xFF);
> > +            } else {
> > +                input_report_abs(wdata->extension.input,
> > +                        ABS_HAT1Y, 0x00);
> > +            }
> > +        } else {
> > +            if((ext[4] & 0x80) && !(ext[5] & 0x02)) {
> > +                input_report_abs(wdata->extension.input,
> > +                        ABS_HAT1X, 0x7F);
> > +            } else if(!(ext[4] & 0x80) && (ext[5] & 0x02)) {
> > +                input_report_abs(wdata->extension.input,
> > +                        ABS_HAT1X, 0xFF);
> > +            } else {
> > +                input_report_abs(wdata->extension.input,
> > +                        ABS_HAT1X, 0x00);
> > +            }
> > +
> > +            if((ext[4] & 0x40) && !(ext[5] & 0x01)) {
> > +                input_report_abs(wdata->extension.input,
> > +                        ABS_HAT1Y, 0x7F);
> > +            } else if(!(ext[4] & 0x40) && (ext[5] & 0x01)) {
> > +                input_report_abs(wdata->extension.input,
> > +                        ABS_HAT1Y, 0xFF);
> > +            } else {
> > +                input_report_abs(wdata->extension.input,
> > +                        ABS_HAT1Y, 0x00);
> > +            }
> > +        }
> > +
>
> I would prefer if we calculated these values up-front and then just
> call input_report_abs() once. It nicely splits data-calculation from
> data-reporting and makes it easier to read (I think). Also, we can
> then simplify the digital-to-analog conversion, to avoid all the
> conditionals.
>
> What do you think of something like this:
>
>     unsigned int digital_to_analog[3] = [0xff, 0x00, 0x7f];
>
>     if (wdata->state.flags & WIIPROTO_FLAG_MP_ACTIVE) {
>         if (dpad_as_analog) {
>             lx = digital_to_analog[1 + !!(ext[4] & 0x80) - !!(ext[1] & 0x01)];
>             ly = digital_to_analog[1 + !!(ext[4] & 0x40) - !!(ext[0] & 0x01)];
>         } else {
>             lx = (ext[0] & 0x3e) - 0x20;
>             ly = (ext[1] & 0x3e) - 0x20;
>         }
>     } else {
>         if (dpad_as_analog) {
>             lx = digital_to_analog[1 + !!(ext[4] & 0x80) - !!(ext[5] & 0x02)];
>             ly = digital_to_analog[1 + !!(ext[4] & 0x40) - !!(ext[5] & 0x01)];
>         } else {
>             lx = (ext[0] & 0x3f) - 0x20;
>             ly = (ext[1] & 0x3f) - 0x20;
>         }
>     }
>
>     input_report_abs(wdata->extension.input, ABS_HAT1X, lx);
>     input_report_abs(wdata->extension.input, ABS_HAT1X, ly);
>     ...
>     if (!dpad_as_analog) {
>         ...report-keys-as-before...
>     }

I was trying to avoid having two blocks where there was a condition
based on "dpad_as_analog" but on seeing this I think it is cleaner and
it avoids having two "(wdata->state.flags & WIIPROTO_FLAG_MP_ACTIVE)"
condition.

>
> > +    } else {
> > +        input_report_abs(wdata->extension.input, ABS_HAT1X, lx - 0x20);
> > +        input_report_abs(wdata->extension.input, ABS_HAT1Y, ly - 0x20);
> > +        input_report_key(wdata->extension.input,
> > +                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_RIGHT],
> > +                 !(ext[4] & 0x80));
> > +        input_report_key(wdata->extension.input,
> > +                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_DOWN],
> > +                 !(ext[4] & 0x40));
> > +
> > +        if (wdata->state.flags & WIIPROTO_FLAG_MP_ACTIVE) {
> > +            input_report_key(wdata->extension.input,
> > +                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_LEFT],
> > +                 !(ext[1] & 0x01));
> > +            input_report_key(wdata->extension.input,
> > +                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_UP],
> > +                 !(ext[0] & 0x01));
> > +        } else {
> > +            input_report_key(wdata->extension.input,
> > +                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_LEFT],
> > +                 !(ext[5] & 0x02));
> > +            input_report_key(wdata->extension.input,
> > +                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_UP],
> > +                 !(ext[5] & 0x01));
> > +        }
> > +    }
> > +
> >
>
> ^^Usually no double-newlines in kernel-code.

Will clean up these too.

>
> > -    input_report_key(wdata->extension.input,
> > -             wiimod_classic_map[WIIMOD_CLASSIC_KEY_RIGHT],
> > -             !(ext[4] & 0x80));
> > -    input_report_key(wdata->extension.input,
> > -             wiimod_classic_map[WIIMOD_CLASSIC_KEY_DOWN],
> > -             !(ext[4] & 0x40));
> >      input_report_key(wdata->extension.input,
> >               wiimod_classic_map[WIIMOD_CLASSIC_KEY_LT],
> >               !(ext[4] & 0x20));
> > @@ -1157,21 +1223,7 @@ static void wiimod_classic_in_ext(struct
> > wiimote_data *wdata, const __u8 *ext)
> >               wiimod_classic_map[WIIMOD_CLASSIC_KEY_ZR],
> >               !(ext[5] & 0x04));
> >
> > -    if (wdata->state.flags & WIIPROTO_FLAG_MP_ACTIVE) {
> > -        input_report_key(wdata->extension.input,
> > -             wiimod_classic_map[WIIMOD_CLASSIC_KEY_LEFT],
> > -             !(ext[1] & 0x01));
> > -        input_report_key(wdata->extension.input,
> > -             wiimod_classic_map[WIIMOD_CLASSIC_KEY_UP],
> > -             !(ext[0] & 0x01));
> > -    } else {
> > -        input_report_key(wdata->extension.input,
> > -             wiimod_classic_map[WIIMOD_CLASSIC_KEY_LEFT],
> > -             !(ext[5] & 0x02));
> > -        input_report_key(wdata->extension.input,
> > -             wiimod_classic_map[WIIMOD_CLASSIC_KEY_UP],
> > -             !(ext[5] & 0x01));
> > -    }
> > +
> >
>
> ^^There is usually no double-newlines in kernel-code.
>
> This patch looks fine to me. I wonder though whether we will just end
> up with lots of remappings if we add this for every mismatch between
> two controller mappings. All the information is still reported
> consistently by the kernel. It is just user-space that needs to fetch
> the right data.

I thought the same and wondered if I should submit this patch for that
reason. I actually had another patch that I wrote that disabled the
analog triggers (L & R buttons show up both as buttons and analog
triggers when you press them on this controller) but thought that did
not impact the userspace enough to warrant another kernel option. I
think in this specific case the current behaviour of the d-pad acting
as the analog control when there are no analog sticks is so ubiquitous
that it does warrant the ability to enable this behaviour.

FWIW I had hoped when I started looking into this that the identifier
for the SNES Classic Controller would be different to the Wii Classic
Controller so the switch in the mapping could be done without a kernel
option. Alas there is no way to distinguish between the two.

>
> There has never been wide-spread agreement on which data a controller
> should report. We have different drivers returning information in
> different IDs. This gets more problematic the more information a
> driver returns, as the ID space for ABS axes is quite limited.
> Generally, for any non-standard input I recommend user-space to remap
> driver data to their internal data. This way, you do not care what
> information is exactly returned by the kernel. Similar issues existed
> with DirectInput/XInput as part of DirectX, but they did provide easy
> remappings.
>
> I am unsure about this patch. Hmmm. It is simple enough, and you can
> modify the module-parameters without reloading the module, so this
> should be fine.
>
> Thanks
> David

Thanks for getting to this so quickly. I'll update the patch with the
suggested modifications this evening and post an updated patch after I
have tested the changes.

--Daniel

>
> >      input_sync(wdata->extension.input);
> >  }
> > diff --git a/drivers/hid/hid-wiimote.h b/drivers/hid/hid-wiimote.h
> > index b2a26a0a8f12..0079801f599c 100644
> > --- a/drivers/hid/hid-wiimote.h
> > +++ b/drivers/hid/hid-wiimote.h
> > @@ -372,4 +372,5 @@ static inline int wiimote_cmd_wait_noint(struct
> > wiimote_data *wdata)
> >          return 0;
> >  }
> >
> > +extern bool dpad_as_analog;
> >  #endif
> > --
> > 2.25.1
