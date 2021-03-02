Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB8D32B4CE
	for <lists+linux-input@lfdr.de>; Wed,  3 Mar 2021 06:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354234AbhCCF3I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 00:29:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234742AbhCBX6L (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 18:58:11 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D985C06178C
        for <linux-input@vger.kernel.org>; Tue,  2 Mar 2021 15:57:23 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id p21so34101265lfu.11
        for <linux-input@vger.kernel.org>; Tue, 02 Mar 2021 15:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6fCVkbah6pSIEP9uT2I1gEQN4XMZej1XdHi/fOlEwxc=;
        b=uLY6Ewk8O4OadIFIg7ecEqKC3J+ynPM/uF4lqOSOwtcsz7zzX2BljRT4YVWoaKiK/0
         TCP4VwNrkdir+GJQR/qvCnsILikTxII1Z0BeYt/VXCF29k0xZ6c+bb3lgKGhEeLTlp6m
         EKqGmx8kFtNFlPDJMY/BpCBxc11OQTtPcXbvZ95fEDb1/YnvprMJjucf1ZOJLMbASKhz
         2GVwpuf20uGYgMyrJYmmEZkv3l43L9YTzV+fgVdZiOsNeGYkuG5TSAYKEWZ9kwZuMioM
         ytmIGC+RcUYuRv60Lf0Asv6zzIznnX1MP9rjphl8G1Zp0gQ+D0kGcK/kca/HdzizknCd
         k0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6fCVkbah6pSIEP9uT2I1gEQN4XMZej1XdHi/fOlEwxc=;
        b=cL+wkzTkdSGFnq85kx+lqZNuZxSZ8KNg7bBjnNhb/eRS624wdZheMqZBYi7p1eVChK
         M01+KyltjcoYCw6kVyUgi/NR/8meKnny9sTw577/HaFHdnClNIWcjJqFTedONiE8Ncui
         EXEIEAduCAPXLKAO6UefElm0xkIUwFOdtv3DDIltvv+ul44qZwTqKCR9/oB9I23+eYaq
         0OmCitk1L74dv2wrfFdzwxEHTyaoUYlfQdjdR3uPmu3VL6JcE7KEd1ahRnfJ8DX1Bcu6
         JxKVK64YyZdJHRER4pp7ehq5DlFrPIL0tquHnNbRDaJKoI3TBst/JVWPv3CeloXtNqmv
         tioA==
X-Gm-Message-State: AOAM533dmcQ/I8kd5bk03ZR4BU+fbvcw9dbQ/DlqK6mmELgMB47P43Zv
        4j9ZtanU9PtDUtG0EDoEzXv82IrLqX+JEt9CnSSPgvSh2NRnTA==
X-Google-Smtp-Source: ABdhPJx9+8kF2fruR0C99yWVQkQmsnkFwPk5CaxSZycKlxUBaBvYeA/45SEnP9Bzt2oDwvg4os31NMmmUWvBwhy5dOA=
X-Received: by 2002:ac2:4255:: with SMTP id m21mr12926860lfl.482.1614729441728;
 Tue, 02 Mar 2021 15:57:21 -0800 (PST)
MIME-Version: 1.0
References: <20210225053204.697951-1-lzye@google.com> <1b315e2cd02f4017cc746909088cc8bc1a39024e.camel@hadess.net>
In-Reply-To: <1b315e2cd02f4017cc746909088cc8bc1a39024e.camel@hadess.net>
From:   Chris Ye <lzye@google.com>
Date:   Tue, 2 Mar 2021 15:57:10 -0800
Message-ID: <CAFFuddJKqkUEFdqhk8o+6K3_a42UyT934dmj002MS8deLD6fdA@mail.gmail.com>
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

Hi Bastien,
    The "Share button" is a name Microsoft calls it, it actually has
HID descriptor defined in the bluetooth interface, which the HID usage
is:
consumer 0xB2:
0x05, 0x0C,        //   Usage Page (Consumer)
0x0A, 0xB2, 0x00,  //   Usage (Record)
Microsoft wants the same key code to be generated consistently for USB
and bluetooth.
Thanks!
Chris


On Tue, Mar 2, 2021 at 1:50 AM Bastien Nocera <hadess@hadess.net> wrote:
>
> On Thu, 2021-02-25 at 05:32 +0000, Chris Ye wrote:
> > Add "Share" button input capability and input event mapping for
> > Microsoft Xbox One controller.
> > Fixed Microsoft Xbox One controller share button not working under USB
> > connection.
> >
> > Signed-off-by: Chris Ye <lzye@google.com>
> > ---
> >  drivers/input/joystick/xpad.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/input/joystick/xpad.c
> > b/drivers/input/joystick/xpad.c
> > index 9f0d07dcbf06..0c3374091aff 100644
> > --- a/drivers/input/joystick/xpad.c
> > +++ b/drivers/input/joystick/xpad.c
> > @@ -79,6 +79,7 @@
> >  #define MAP_DPAD_TO_BUTTONS            (1 << 0)
> >  #define MAP_TRIGGERS_TO_BUTTONS                (1 << 1)
> >  #define MAP_STICKS_TO_NULL             (1 << 2)
> > +#define MAP_SHARE_BUTTON               (1 << 3)
> >  #define DANCEPAD_MAP_CONFIG    (MAP_DPAD_TO_BUTTONS
> > |                  \
> >                                 MAP_TRIGGERS_TO_BUTTONS |
> > MAP_STICKS_TO_NULL)
> >
> > @@ -130,6 +131,7 @@ static const struct xpad_device {
> >         { 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0,
> > XTYPE_XBOXONE },
> >         { 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE
> > },
> >         { 0x045e, 0x0719, "Xbox 360 Wireless Receiver",
> > MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
> > +       { 0x045e, 0x0b12, "Microsoft X-Box One X pad",
> > MAP_SHARE_BUTTON, XTYPE_XBOXONE },
> >         { 0x046d, 0xc21d, "Logitech Gamepad F310", 0, XTYPE_XBOX360 },
> >         { 0x046d, 0xc21e, "Logitech Gamepad F510", 0, XTYPE_XBOX360 },
> >         { 0x046d, 0xc21f, "Logitech Gamepad F710", 0, XTYPE_XBOX360 },
> > @@ -862,6 +864,8 @@ static void xpadone_process_packet(struct usb_xpad
> > *xpad, u16 cmd, unsigned char
> >         /* menu/view buttons */
> >         input_report_key(dev, BTN_START,  data[4] & 0x04);
> >         input_report_key(dev, BTN_SELECT, data[4] & 0x08);
> > +       if (xpad->mapping & MAP_SHARE_BUTTON)
> > +               input_report_key(dev, KEY_RECORD, data[22] & 0x01);
> >
> >         /* buttons A,B,X,Y */
> >         input_report_key(dev, BTN_A,    data[4] & 0x10);
> > @@ -1669,9 +1673,12 @@ static int xpad_init_input(struct usb_xpad
> > *xpad)
> >
> >         /* set up model-specific ones */
> >         if (xpad->xtype == XTYPE_XBOX360 || xpad->xtype ==
> > XTYPE_XBOX360W ||
> > -           xpad->xtype == XTYPE_XBOXONE) {
> > +               xpad->xtype == XTYPE_XBOXONE) {
> >                 for (i = 0; xpad360_btn[i] >= 0; i++)
> >                         input_set_capability(input_dev, EV_KEY,
> > xpad360_btn[i]);
> > +               if (xpad->mapping & MAP_SHARE_BUTTON) {
> > +                       input_set_capability(input_dev, EV_KEY,
> > KEY_RECORD);
>
> Is there not a better keycode to use than "Record"? Should a "share"
> keycode be added?
>
> I couldn't find a share button in the most recent USB HID Usage Tables:
> https://www.usb.org/document-library/hid-usage-tables-121
>
> > +               }
> >         } else {
> >                 for (i = 0; xpad_btn[i] >= 0; i++)
> >                         input_set_capability(input_dev, EV_KEY,
> > xpad_btn[i]);
>
>
