Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8CB82007F6
	for <lists+linux-input@lfdr.de>; Fri, 19 Jun 2020 13:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730893AbgFSLgp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jun 2020 07:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730833AbgFSLgQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jun 2020 07:36:16 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E50EC06174E
        for <linux-input@vger.kernel.org>; Fri, 19 Jun 2020 04:35:41 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id i16so6877864qtr.7
        for <linux-input@vger.kernel.org>; Fri, 19 Jun 2020 04:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I+GLTeMugD00CfBYfwbkN2hClJZ3Jdd+SlxJVr52H4Y=;
        b=ed/C2SVQeqhJVdYXNT1RzUO97hLNjf4Y3JQoY0azDM1+vo1xsHS8vFWzx/B2+aQgp0
         60JhpoNYPvmhiz/FCDNFBCUWcUuFkdYza4daiw1+0dXqdU06BpZkc8Xtym1eFfJL1mdp
         JV6wB6pU5OT55GOkg1uCuAAxy/qS7eHTOEGZy1KY/6EB32pDydwhoFk1YTwoJw4S4hXF
         O0bugiwnVcPzHotGuzs2QqzwZyEZd6a7oClfUHad8d4NqgroV0vM1/nv3R049vMMT6Ta
         /J79wVyaDhBGYiXAV/054oFfj0chCDdVMvh5fNlWjLI/WTXmh67Yol8nbtu8YycMpyD0
         yrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I+GLTeMugD00CfBYfwbkN2hClJZ3Jdd+SlxJVr52H4Y=;
        b=TCMMYGvPe6L3abkRHZU63VLEdg8QtnNXpjnTDmrKFBXhix9WnjC/dLcSF3QcUu65zS
         IfmVpVX9Mmtx4TQPaaphKVX2oojGsnbxTbS1FgBF9/QL2oR6y7KPzYRCPRfyMby8+Xx/
         Ss742ctd0PjJQxj5+0a22CP4UVOJkFhCWbSJU1XViZPHjlvu+QwUAjDT0TwqOUqdqZOD
         zDXT3rE2AuL7uy8YTE31y8Sfjzfl2Zg3vbuAvrA+X6Mn2Sp49XRge0liJAKB15qz767X
         rcD7RYxv/eMwPnnFeTe5t4L2grqKgmwl+xCsI2kM+PLkoT8Qkw5IhKI7ynFFYxTijSdZ
         asaA==
X-Gm-Message-State: AOAM5311zGa29VEWku8Rvlk7nkKb88kqxk/Q1d+sdm5/oOwp6IZQk7xK
        hJHTNsVYij5J4Xzz736fY72y8P62jo/wsteWkvFf5A==
X-Google-Smtp-Source: ABdhPJwnD5e6gkdSs2K1IYpEmGxJfeIwZv4SGUj98bXyOg8sTnp4n030+wJkREA5uAL0CozTi11bW98NNJbCDUuWfyA=
X-Received: by 2002:ac8:357b:: with SMTP id z56mr2927817qtb.107.1592566535281;
 Fri, 19 Jun 2020 04:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <CANFaMLHQwNf3GnPYAxR-ryrYmO-wVmsEHijzVHEYozUt0EzDJw@mail.gmail.com>
 <nycvar.YFH.7.76.2006190924380.13242@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2006190924380.13242@cbobk.fhfr.pm>
From:   David Herrmann <dh.herrmann@gmail.com>
Date:   Fri, 19 Jun 2020 13:35:24 +0200
Message-ID: <CANq1E4RK_QymZwTB_PORc20K9QaJ=Tonuj7_RJQUj-xvqdjH8g@mail.gmail.com>
Subject: Re: [PATCH v3] HID: Wiimote: Treat the d-pad as an analogue stick
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Daniel Morse <dmorse@speedfox.co.uk>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

On Fri, Jun 19, 2020 at 9:25 AM Jiri Kosina <jikos@kernel.org> wrote:
>
>
> CCing David Hermann in case he has any review comments to this.
>
> Thanks.

Yes, all good!

Reviewed-by: David Herrmann <dh.herrmann@gmail.com>

(You want me to send an adjustment for `MAINTAINERS` to link to my new
email-address/name? Got married some time ago already, but forgot to
adjust the `MAINTAINERS` file.)

Thanks
David

> On Sat, 30 May 2020, Daniel Morse wrote:
>
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
> >
> > Changes from V3 to V3
> > * Moved the definition of dpad_as_analog in hid-wiimote.h
> > * Renamed the dpad_as_analog vaiable to wiimote_dpad_as_analog
> > * changed digital_to_analog from an __s8 to static const s8
> > * Removed the unnecessary braces when getting values from digital_to_analog
> >
> > Note: I have also attached a patch file to this final version in
> > addition to the code in the body because gmail web client keeps
> > turning the tabs into spaces.
> >
> > Signed-off-by: Daniel G. Morse <dmorse@speedfox.co.uk>
> > Reviewed-by: David Rheinsberg <david.rheinsberg@gmail.com>
> >
> > >From 8909feec10fda919d1ec46c95418d63ac52ee41f Mon Sep 17 00:00:00 2001
> > From: Speedfox <speedfox@speedfox.co.uk>
> > Date: Tue, 26 May 2020 02:55:50 +0100
> > Subject: [PATCH] Added option to make d-pad analog
> >
> > Updates from code review
> > ---
> >  drivers/hid/hid-wiimote-core.c    |  5 +++
> >  drivers/hid/hid-wiimote-modules.c | 67 ++++++++++++++++++++-----------
> >  drivers/hid/hid-wiimote.h         |  2 +
> >  3 files changed, 50 insertions(+), 24 deletions(-)
> >
> > diff --git a/drivers/hid/hid-wiimote-core.c b/drivers/hid/hid-wiimote-core.c
> > index 92874dbe4d4a..679e142fc850 100644
> > --- a/drivers/hid/hid-wiimote-core.c
> > +++ b/drivers/hid/hid-wiimote-core.c
> > @@ -1870,6 +1870,11 @@ static const struct hid_device_id
> > wiimote_hid_devices[] = {
> >                  USB_DEVICE_ID_NINTENDO_WIIMOTE2) },
> >      { }
> >  };
> > +
> > +bool wiimote_dpad_as_analog = false;
> > +module_param_named(dpad_as_analog, wiimote_dpad_as_analog, bool, 0644);
> > +MODULE_PARM_DESC(dpad_as_analog, "Use D-Pad as main analog input");
> > +
> >  MODULE_DEVICE_TABLE(hid, wiimote_hid_devices);
> >
> >  static struct hid_driver wiimote_hid_driver = {
> > diff --git a/drivers/hid/hid-wiimote-modules.c
> > b/drivers/hid/hid-wiimote-modules.c
> > index 2c3925357857..213c58bf2495 100644
> > --- a/drivers/hid/hid-wiimote-modules.c
> > +++ b/drivers/hid/hid-wiimote-modules.c
> > @@ -1088,12 +1088,28 @@ static void wiimod_classic_in_ext(struct
> > wiimote_data *wdata, const __u8 *ext)
> >       * is the same as before.
> >       */
> >
> > +    static const s8 digital_to_analog[3] = {0x20, 0, -0x20};
> > +
> >      if (wdata->state.flags & WIIPROTO_FLAG_MP_ACTIVE) {
> > -        lx = ext[0] & 0x3e;
> > -        ly = ext[1] & 0x3e;
> > +        if (wiimote_dpad_as_analog) {
> > +            lx = digital_to_analog[1 - !(ext[4] & 0x80)
> > +                + !(ext[1] & 0x01)];
> > +            ly = digital_to_analog[1 - !(ext[4] & 0x40)
> > +                + !(ext[0] & 0x01)];
> > +        } else {
> > +            lx = (ext[0] & 0x3e) - 0x20;
> > +            ly = (ext[1] & 0x3e) - 0x20;
> > +        }
> >      } else {
> > -        lx = ext[0] & 0x3f;
> > -        ly = ext[1] & 0x3f;
> > +        if (wiimote_dpad_as_analog) {
> > +            lx = digital_to_analog[1 - !(ext[4] & 0x80)
> > +                + !(ext[5] & 0x02)];
> > +            ly = digital_to_analog[1 - !(ext[4] & 0x40)
> > +                + !(ext[5] & 0x01)];
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
> > +    if (!wiimote_dpad_as_analog) {
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
> > index b2a26a0a8f12..ad4ff837f43e 100644
> > --- a/drivers/hid/hid-wiimote.h
> > +++ b/drivers/hid/hid-wiimote.h
> > @@ -162,6 +162,8 @@ struct wiimote_data {
> >      struct work_struct init_worker;
> >  };
> >
> > +extern bool wiimote_dpad_as_analog;
> > +
> >  /* wiimote modules */
> >
> >  enum wiimod_module {
> > --
> > 2.25.1
> >
>
> --
> Jiri Kosina
> SUSE Labs
>
