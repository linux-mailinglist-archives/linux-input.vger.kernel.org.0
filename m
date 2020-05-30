Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 589BA1E910C
	for <lists+linux-input@lfdr.de>; Sat, 30 May 2020 14:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728875AbgE3MDa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 May 2020 08:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgE3MDa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 30 May 2020 08:03:30 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2CB6C03E969
        for <linux-input@vger.kernel.org>; Sat, 30 May 2020 05:03:29 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id l26so6340979wme.3
        for <linux-input@vger.kernel.org>; Sat, 30 May 2020 05:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/Uo15bV6b2+DiB90R+dweA7Y2L+A/FxsJ29+EhHcmUU=;
        b=ZOy/WHB0fWsZMTI/xvh7rmCKjO/Ypl2UCV4IZFIUc5SO8q54PHQvyKtniIjlNm/f0i
         OlSgbya3nqUEpb9ODQcrpNnT9X+FSGiKfVC6xI6TD0PccQ9iWTik3+fZxbVpHxrdNdCi
         iYOj/XJzQlT9gyFDCZiYMrpu2rwUwRP2hRiqfmCUXarTrH25OhJmf6AwEP/D0yj6SIka
         Z+vTQLQj7f7SkGapmjZAvx+bexFM3S2N82ojDYcyIvp95rL2owZqM7qQOgUuEG054Wmv
         Cc20dyz+u2ki+MrxVlcCL0D7pJ/94g82o5N/doocRcRXcHJK/t/2H8sYkKvJZ3imcwjx
         +Eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/Uo15bV6b2+DiB90R+dweA7Y2L+A/FxsJ29+EhHcmUU=;
        b=QJTtgeXgz6EqMSYm4ecSGiS0PJJ7WM7CN+U1ew82PskoSw9vHB8aSyfGrGjY2VbALv
         FTnT2n1OgMCy643e0SDG1pivkf7DcJSCcM3G+EKP2VTH1dwIIxfWk/XhKIRHvNNObOB+
         iKsy4HZ/VhEhbz3ruJx5fUe7V4DqfTTi+ygX8nBhaezd3dUWniooMWNrb/ZIJqA7y8+i
         Fz/ZTG5QgTjPMg1iGtVBKjH33sNbgkv6/B4wx0QnDhkT7i9GosEWheq2T7k0u7FmMhYh
         HzSCtY8A1jIaM+pTZjE+qB8yKBFUIXdGEwcjbhH9fyBdanU/Kr62aU6StPTqAAiISOvc
         3CqA==
X-Gm-Message-State: AOAM530aSutg/pjc089ViIjCxWd7ek2cx/NGvhvFA4+zckIjni7vTbrr
        UEvstvnvvmC+WchgkhTRPng56EDiHqOOOrgEuF8=
X-Google-Smtp-Source: ABdhPJzpMntUZHAL2HRjqcOqnG39p7G1nYQ+eya++SXNZTg74RSs5nwEkhnQvCTRPgZQCsI3C+nNy/olKDWrlUWvs14=
X-Received: by 2002:a7b:c5d7:: with SMTP id n23mr13972391wmk.185.1590840208290;
 Sat, 30 May 2020 05:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <CANFaMLGVGmS4i3fdH2rYeqSgqk3Gm=sxaLLMuKx4T1eY9ZvyEg@mail.gmail.com>
 <CANq1E4QUMssPJXvR4njunbV4+2-0ojYvvDxQSTX_0iFPGoTYVw@mail.gmail.com>
 <CANFaMLH69uwUrwcn060wCz1YxaDNS+jbbduXA6ORgO7Gst3=hw@mail.gmail.com>
 <CANFaMLHu3Eo5oZ3jMw_Rx6NGtJ1UePWiTtQm942DHqvP33EQTA@mail.gmail.com> <CADyDSO5CTkMeiOPbZG7SX=z7-sM-nbpvcDHRYfB5VqZCJHEWGA@mail.gmail.com>
In-Reply-To: <CADyDSO5CTkMeiOPbZG7SX=z7-sM-nbpvcDHRYfB5VqZCJHEWGA@mail.gmail.com>
From:   Daniel Morse <daniel.morse@gmail.com>
Date:   Sat, 30 May 2020 13:03:16 +0100
Message-ID: <CANFaMLEBEgqeBRW3aN6NX=HU0J8AoQxsRVQymDLHShy1RH2OGg@mail.gmail.com>
Subject: Re: [PATCH v2] HID: Wiimote: Treat the d-pad as an analogue stick
To:     David Rheinsberg <david.rheinsberg@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 29 May 2020 at 08:57, David Rheinsberg
<david.rheinsberg@gmail.com> wrote:
>
> Hi
>
> On Tue, 26 May 2020 at 23:41, Daniel Morse <daniel.morse@gmail.com> wrote:
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
> > Changes from V1 to V2
> > * 3 if statements to control the behaviour, one to make the d-pad
> > register as button presses when the behaviour is disabled, and 2 to
> > make it act as an analog stick when enabled (once for each of the
> > motion plus states)
> > * the values for lx and ly are calculated and then passed to
> > input_report_abs() in one place, rather then calling
> > input_report_abs() from different places depending on how the values
> > are determined.
> > * using an array to map from button presses to analog value.
> > * reduced the values used to indicate the position of the analog stick
> > so they can fit inside a __s8
>
> Thanks a lot for the followup. I have minor questions and suggestions,
> but I am ok with this going in. Please see below.
>
> > Signed-off-by: Daniel G. Morse <dmorse@speedfox.co.uk>
> > ---
> >  drivers/hid/hid-wiimote-core.c    |  5 +++
> >  drivers/hid/hid-wiimote-modules.c | 67 ++++++++++++++++++++-----------
> >  drivers/hid/hid-wiimote.h         |  1 +
> >  3 files changed, 49 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
> > index 92874dbe4d4a..f83c6356879e 100644
> > --- a/drivers/hid/hid-wiimote-core.c
> > +++ b/drivers/hid/hid-wiimote-core.c
> > @@ -1870,6 +1870,11 @@ static const struct hid_device_id
> > wiimote_hid_devices[] = {
> >                  USB_DEVICE_ID_NINTENDO_WIIMOTE2) },
> >      { }
> >  };
> > +
> > +bool dpad_as_analog = false;
> > +module_param(dpad_as_analog, bool, 0644);
> > +MODULE_PARM_DESC(dpad_as_analog, "Use D-Pad as main analog input");
> > +
>
> This might be overly pedantic, but I like the variables in hid-wiimote
> prefixed with their namespace. So how about:
>
> bool wiimote_dpad_as_analog = false;
> module_param_named(dpad_as_analog, wiimote_dpad_as_analog, bool, 0644);
> MODULE_PARM_DESC(dpad_as_analog, "Use D-Pad as main analog input");
>

OK, I'll add wiimote_ to start start of the variable.


> >  MODULE_DEVICE_TABLE(hid, wiimote_hid_devices);
> >
> >  static struct hid_driver wiimote_hid_driver = {
> > diff --git a/drivers/hid/hid-wiimote-modules.c
> > b/drivers/hid/hid-wiimote-modules.c
> > index 2c3925357857..cfd2f0f8318a 100644
> > --- a/drivers/hid/hid-wiimote-modules.c
> > +++ b/drivers/hid/hid-wiimote-modules.c
> > @@ -1088,12 +1088,28 @@ static void wiimod_classic_in_ext(struct
> > wiimote_data *wdata, const __u8 *ext)
> >       * is the same as before.
> >       */
> >
> > +    __s8 digital_to_analog[3] = {0x20, 0, -0x20};
>
> You mentioned it in your commit-msg, but I could not follow. Why did
> you reduce these values? 0x7f should fit into __s8, shouldn't it?

I was thinking about it that way because my in my original
implementation 0xFF was getting cast to an int, not an s8 because I
was passing into input_report_abs() directly. It doesn't really matter
what goes in there as long as max is >30 and min is <-30, as that is
the range for that axis.

I'll update the commit message.

>
> Also, you can drop the `__` prefix, it is only needed in uapis. And I
> would make this `static const`:
>
>     static const s8 digital_to_analog[3] = {0x20, 0, -0x20};

OK.

>
> > +
> >      if (wdata->state.flags & WIIPROTO_FLAG_MP_ACTIVE) {
> > -        lx = ext[0] & 0x3e;
> > -        ly = ext[1] & 0x3e;
> > +        if (dpad_as_analog) {
> > +             lx = digital_to_analog[(1 - !(ext[4] & 0x80)
> > +                     + !(ext[1] & 0x01))];
> > +             ly = digital_to_analog[(1 - !(ext[4] & 0x40)
> > +                     + !(ext[0] & 0x01))];
>
> Oh, right, buttons are inverted. Sorry for missing that in my ealier
> suggestion. This looks good! Btw., if you drop the parenthesis around
> the entire expression, it should fit into 80ch and thus into one line:
>
>              lx = digital_to_analog[1 - !(ext[4] & 0x80) + !(ext[1] & 0x01)];
> => 78ch

I get 88 characters if I use an 8 char tab width (which is what is
specified in the coding style guide). I'll remove the outer braces
none the less.

>
> (same for the other 3 occurrences)
>
> > +        } else {
> > +            lx = (ext[0] & 0x3e) - 0x20;
> > +            ly = (ext[1] & 0x3e) - 0x20;
> > +        }
> >      } else {
> > -        lx = ext[0] & 0x3f;
> > -        ly = ext[1] & 0x3f;
> > +        if (dpad_as_analog) {
> > +             lx = digital_to_analog[(1 - !(ext[4] & 0x80)
> > +                     + !(ext[5] & 0x02))];
> > +             ly = digital_to_analog[(1 - !(ext[4] & 0x40)
> > +                     + !(ext[5] & 0x01))];
> > +        } else {
> > +            lx = (ext[0] & 0x3f) - 0x20;
> > +            ly = (ext[1] & 0x3f) - 0x20;
> > +        }
> >      }
> >
> >      rx = (ext[0] >> 3) & 0x18;
> > @@ -1110,19 +1126,13 @@ static void wiimod_classic_in_ext(struct
> > wiimote_data *wdata, const __u8 *ext)
> >      rt <<= 1;
> >      lt <<= 1;
> >
> > -    input_report_abs(wdata->extension.input, ABS_HAT1X, lx - 0x20);
> > -    input_report_abs(wdata->extension.input, ABS_HAT1Y, ly - 0x20);
> > +    input_report_abs(wdata->extension.input, ABS_HAT1X, lx);
> > +    input_report_abs(wdata->extension.input, ABS_HAT1Y, ly);
> >      input_report_abs(wdata->extension.input, ABS_HAT2X, rx - 0x20);
> >      input_report_abs(wdata->extension.input, ABS_HAT2Y, ry - 0x20);
> >      input_report_abs(wdata->extension.input, ABS_HAT3X, rt);
> >      input_report_abs(wdata->extension.input, ABS_HAT3Y, lt);
> >
> > -    input_report_key(wdata->extension.input,
> > -             wiimod_classic_map[WIIMOD_CLASSIC_KEY_RIGHT],
> > -             !(ext[4] & 0x80));
> > -    input_report_key(wdata->extension.input,
> > -             wiimod_classic_map[WIIMOD_CLASSIC_KEY_DOWN],
> > -             !(ext[4] & 0x40));
> >      input_report_key(wdata->extension.input,
> >               wiimod_classic_map[WIIMOD_CLASSIC_KEY_LT],
> >               !(ext[4] & 0x20));
> > @@ -1157,20 +1167,29 @@ static void wiimod_classic_in_ext(struct
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
> > +    if (!dpad_as_analog) {
> >          input_report_key(wdata->extension.input,
> > -             wiimod_classic_map[WIIMOD_CLASSIC_KEY_LEFT],
> > -             !(ext[5] & 0x02));
> > +                 wiimod_classic_map[WIIMOD_CLASSIC_KEY_RIGHT],
> > +                 !(ext[4] & 0x80));
> >          input_report_key(wdata->extension.input,
> > -             wiimod_classic_map[WIIMOD_CLASSIC_KEY_UP],
> > -             !(ext[5] & 0x01));
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
> >      }
> >
> >      input_sync(wdata->extension.input);
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
>
> Can you move this up? It is kinda hidden down here. The order in the
> wiimote header usually is types,variables,functions,inlines. So
> basically between `struct wiimote_data` and `/* wiimote modules */`.

Yep, no problem with that.

I'll have a final version of the patch done this weekend. Thanks for
reviewing this.


>
> When you resend, can you include:
>
>     Reviewed-by: David Rheinsberg <david.rheinsberg@gmail.com>
>
> and then please include in CC:
>
>     Jiri Kosina <jikos@kernel.org>
>
> He will then apply it to the HID tree.
>
> Thanks a lot!
>
> > --
> > 2.25.1
