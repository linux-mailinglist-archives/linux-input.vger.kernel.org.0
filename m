Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2B532DFA4
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 03:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbhCECZd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 21:25:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhCECZd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Mar 2021 21:25:33 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45662C061756
        for <linux-input@vger.kernel.org>; Thu,  4 Mar 2021 18:25:33 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id h4so877044ljl.0
        for <linux-input@vger.kernel.org>; Thu, 04 Mar 2021 18:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2FGTyyXGBlrhr2U0Y+zu7HE9K3MeHxtD2Y4He3VPYgY=;
        b=dsvHLQY6xZe01a5ElvrEKz2pi2TzN4XqbM2bPG3BcVWYMkAt1L46kzpBrdiL/S7gZh
         z0gvyLN132f+PtGiObi6hJSzO+5GunORowUlDFpQFrRd10F77NUVToUY4kwxv7eqltZ3
         2zcmmsBl5Nam3WZBemqCHgtVPD0X4BV3HVEVEgdMIEOfUmBw2kojQRiJkdAPXT7gUXx7
         f/+RtIQ/XP/WsODFr4OVERBKz8QrZDGf4HvNGKEoZi7Z21u/cBA1ZYKbVYRO5wvbpsfT
         OXjhj/cl0EpCdJTuc0QiMiKAwnzLGH2EpVToNseuUNO1LPb7Ti8iktjtHNWePdyT7Fbb
         J/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2FGTyyXGBlrhr2U0Y+zu7HE9K3MeHxtD2Y4He3VPYgY=;
        b=h4Lkt7H+1mS8K06hQvgp9fm78Kd3hXvvrZTXhqjrb1NtDwaVp5L3AUr2J4yH32vbzc
         15StWXNvBjI9/bROdfAG7UUxEF8Yz1EAw7wMMssb3KHp9aQG3h1h1/bJB+ydG6XvHmRD
         0c9ltaWAI5iGC2n1ZwqsFG4qyrR/+idfeyW6+0tzBPeLm64jBtH4JaccWGOuVmUyRjFq
         vpFdVr9p2JR4od98mzv+qrnBe8B0E6CcZwM+HewsVIjdQNOmoFsSQpB1tGi6dWHOXJZ/
         A3QS6a4nR3OPoz4CuHc4nbJ8sT3JO5zeJVImfwybsp+HRLGHDs8WdbH2gCBixvb12CqB
         Knfw==
X-Gm-Message-State: AOAM5339GYvrnUlKwS3y6hkuJURB6ULyVijrAXDJK65y2+96cJrpyw9B
        xBlycl17xbjxlATWhjttsB4M3rn/m+yJcQTfkYuijw==
X-Google-Smtp-Source: ABdhPJwe/5pWuEwctojiEqkxaWP/Hd/Y+WMdhvJlCfoB36pYIQsTTJub01OtXWwlx0Dji3uBg8tPbSm0uF9ia4ywm9o=
X-Received: by 2002:a19:7e0b:: with SMTP id z11mr4314739lfc.320.1614911131451;
 Thu, 04 Mar 2021 18:25:31 -0800 (PST)
MIME-Version: 1.0
References: <20210225053204.697951-1-lzye@google.com> <1b315e2cd02f4017cc746909088cc8bc1a39024e.camel@hadess.net>
 <CAFFuddJKqkUEFdqhk8o+6K3_a42UyT934dmj002MS8deLD6fdA@mail.gmail.com>
In-Reply-To: <CAFFuddJKqkUEFdqhk8o+6K3_a42UyT934dmj002MS8deLD6fdA@mail.gmail.com>
From:   Chris Ye <lzye@google.com>
Date:   Thu, 4 Mar 2021 18:25:20 -0800
Message-ID: <CAFFudd+Y6maj=F8LwGeakvkRoh_a_s2yi_rtB4LUnY=CVrMGWA@mail.gmail.com>
Subject: Re: [PATCH] [v2] Input: Add "Share" button to Microsoft Xbox One controller.
To:     Bastien Nocera <hadess@hadess.net>
Cc:     =?UTF-8?Q?=C5=81ukasz_Patron?= <priv.luk@gmail.com>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?Olivier_Cr=C3=AAte?= <olivier.crete@ocrete.ca>,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        trivial@kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Bastien,  just want to follow up again on this.  I've checked again
with the Xbox team that the "Share button" is given for the product,
the HID usage profile and mapping to RECORD is what Xbox team expects
and they want the same mapping for USB.

Thanks!
Chris


On Tue, Mar 2, 2021 at 3:57 PM Chris Ye <lzye@google.com> wrote:
>
> Hi Bastien,
>     The "Share button" is a name Microsoft calls it, it actually has
> HID descriptor defined in the bluetooth interface, which the HID usage
> is:
> consumer 0xB2:
> 0x05, 0x0C,        //   Usage Page (Consumer)
> 0x0A, 0xB2, 0x00,  //   Usage (Record)
> Microsoft wants the same key code to be generated consistently for USB
> and bluetooth.
> Thanks!
> Chris
>
>
> On Tue, Mar 2, 2021 at 1:50 AM Bastien Nocera <hadess@hadess.net> wrote:
> >
> > On Thu, 2021-02-25 at 05:32 +0000, Chris Ye wrote:
> > > Add "Share" button input capability and input event mapping for
> > > Microsoft Xbox One controller.
> > > Fixed Microsoft Xbox One controller share button not working under USB
> > > connection.
> > >
> > > Signed-off-by: Chris Ye <lzye@google.com>
> > > ---
> > >  drivers/input/joystick/xpad.c | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/input/joystick/xpad.c
> > > b/drivers/input/joystick/xpad.c
> > > index 9f0d07dcbf06..0c3374091aff 100644
> > > --- a/drivers/input/joystick/xpad.c
> > > +++ b/drivers/input/joystick/xpad.c
> > > @@ -79,6 +79,7 @@
> > >  #define MAP_DPAD_TO_BUTTONS            (1 << 0)
> > >  #define MAP_TRIGGERS_TO_BUTTONS                (1 << 1)
> > >  #define MAP_STICKS_TO_NULL             (1 << 2)
> > > +#define MAP_SHARE_BUTTON               (1 << 3)
> > >  #define DANCEPAD_MAP_CONFIG    (MAP_DPAD_TO_BUTTONS
> > > |                  \
> > >                                 MAP_TRIGGERS_TO_BUTTONS |
> > > MAP_STICKS_TO_NULL)
> > >
> > > @@ -130,6 +131,7 @@ static const struct xpad_device {
> > >         { 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0,
> > > XTYPE_XBOXONE },
> > >         { 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE
> > > },
> > >         { 0x045e, 0x0719, "Xbox 360 Wireless Receiver",
> > > MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
> > > +       { 0x045e, 0x0b12, "Microsoft X-Box One X pad",
> > > MAP_SHARE_BUTTON, XTYPE_XBOXONE },
> > >         { 0x046d, 0xc21d, "Logitech Gamepad F310", 0, XTYPE_XBOX360 },
> > >         { 0x046d, 0xc21e, "Logitech Gamepad F510", 0, XTYPE_XBOX360 },
> > >         { 0x046d, 0xc21f, "Logitech Gamepad F710", 0, XTYPE_XBOX360 },
> > > @@ -862,6 +864,8 @@ static void xpadone_process_packet(struct usb_xpad
> > > *xpad, u16 cmd, unsigned char
> > >         /* menu/view buttons */
> > >         input_report_key(dev, BTN_START,  data[4] & 0x04);
> > >         input_report_key(dev, BTN_SELECT, data[4] & 0x08);
> > > +       if (xpad->mapping & MAP_SHARE_BUTTON)
> > > +               input_report_key(dev, KEY_RECORD, data[22] & 0x01);
> > >
> > >         /* buttons A,B,X,Y */
> > >         input_report_key(dev, BTN_A,    data[4] & 0x10);
> > > @@ -1669,9 +1673,12 @@ static int xpad_init_input(struct usb_xpad
> > > *xpad)
> > >
> > >         /* set up model-specific ones */
> > >         if (xpad->xtype == XTYPE_XBOX360 || xpad->xtype ==
> > > XTYPE_XBOX360W ||
> > > -           xpad->xtype == XTYPE_XBOXONE) {
> > > +               xpad->xtype == XTYPE_XBOXONE) {
> > >                 for (i = 0; xpad360_btn[i] >= 0; i++)
> > >                         input_set_capability(input_dev, EV_KEY,
> > > xpad360_btn[i]);
> > > +               if (xpad->mapping & MAP_SHARE_BUTTON) {
> > > +                       input_set_capability(input_dev, EV_KEY,
> > > KEY_RECORD);
> >
> > Is there not a better keycode to use than "Record"? Should a "share"
> > keycode be added?
> >
> > I couldn't find a share button in the most recent USB HID Usage Tables:
> > https://www.usb.org/document-library/hid-usage-tables-121
> >
> > > +               }
> > >         } else {
> > >                 for (i = 0; xpad_btn[i] >= 0; i++)
> > >                         input_set_capability(input_dev, EV_KEY,
> > > xpad_btn[i]);
> >
> >
