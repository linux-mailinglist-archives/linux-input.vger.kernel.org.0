Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5941E37ECFB
	for <lists+linux-input@lfdr.de>; Thu, 13 May 2021 00:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354186AbhELUEI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 May 2021 16:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245126AbhELSYW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 May 2021 14:24:22 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F97C0613ED
        for <linux-input@vger.kernel.org>; Wed, 12 May 2021 11:21:31 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id c3so35073042lfs.7
        for <linux-input@vger.kernel.org>; Wed, 12 May 2021 11:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dg0aT9CGnTa3wuH7NsxQOFQv42isTf38NzWAad/uPQE=;
        b=ctV+PfMrQmaJ6slkQjOSQ6FIInzYoAdDelIR0/I7GSCPQ4WH2Q8dxhHwgJMrmZbwGL
         kh6tCAmEynkqhBqS2Zq535RALK3OuF+bx9QSLY5qSu3hgltGeBxYdo2kf08oONihR7MR
         hR6/ZCVFamIbKX3nUP3xLRMq0Ew0MuQNkLrDr5/H2rsOtDKcCuBLixVoYhpoXQZTsEl3
         SGcq8ehsB83FCjS3drP5fg7FkAKKbXe2nsbpRhVUKeyiBErpIdAdlPPoIQ/dWMzCnecd
         xHEgkbJmZjX1Y32vvilyiCyPYdhgJ1mBKRj9+8kHUGCzaO3SprhU7wjBjmCZ9hgSUpSy
         okag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dg0aT9CGnTa3wuH7NsxQOFQv42isTf38NzWAad/uPQE=;
        b=svBBjuLyzAEqxZtFixy+OOXGOlyX1OZ+V+oVq2yNansmOYtctHf3zxpytiuN0CE77k
         ulFwzrlXnGVlrLsgH8srfDrRrArIuv+1iAxlBrlQrNldG/ndMC5lbvQJ9gXLayj3I/Y9
         ygUUb0hDA8W9lmPxn1BuZFwr6GCsnRoWLXMsfNHnLEixWNe5GJCnz6oMnDWwiMFC/0RX
         7HboehnJnnaV6dCkpyG/UiEycznxT9ZLt28bLglRasNS1RKSW2yZSgxwpX/1YXfLyWPK
         rDo64pFZnyuRDMxDBQLBYRQzO8WHmG3vhFoCW36oTFiPvcbej0h8WtzCVYi0Ppvoy06C
         wcbA==
X-Gm-Message-State: AOAM530YUOw90na7hBAxF9eB9QmPFQtJjuBNJxGq3ZNUG9OOI7DZaleR
        rNwl0dzkv2KUdctfbw/ofFXCKGhq39kZLtjkBaBl+Q==
X-Google-Smtp-Source: ABdhPJyMQQ57JywNBx+Etccl693u861JrcS1dP7sUHeNMxrNogeWNU6kbdnM9bk0QULlC4xClEAX/ReXS4wVQSi6JgM=
X-Received: by 2002:ac2:428e:: with SMTP id m14mr25450552lfh.478.1620843689766;
 Wed, 12 May 2021 11:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210414021201.2462114-1-lzye@google.com> <CAFFuddLDgidkqDsihCU0VpXC_qEXVww67DmoFOvRdgrrPgOj_A@mail.gmail.com>
In-Reply-To: <CAFFuddLDgidkqDsihCU0VpXC_qEXVww67DmoFOvRdgrrPgOj_A@mail.gmail.com>
From:   Chris Ye <lzye@google.com>
Date:   Wed, 12 May 2021 11:21:18 -0700
Message-ID: <CAFFuddK_u2XxjbXnvhaRP1PakMCPDD5tV2T6ihXcAzzC72fu9g@mail.gmail.com>
Subject: Re: [PATCH] [v5] Input: Add "Select" button to Microsoft Xbox One controller.
To:     =?UTF-8?Q?=C5=81ukasz_Patron?= <priv.luk@gmail.com>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Chris Ye <lzye@google.com>, Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?Olivier_Cr=C3=AAte?= <olivier.crete@ocrete.ca>,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, trivial@kernel.org,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,
     It seems I don't have any further comments on patch v5, do you
think we can land the patch in the next kernel release? Please advise
if there are any further comments.
Thank you!

Regards,
Chris

On Wed, May 5, 2021 at 9:57 AM Chris Ye <lzye@google.com> wrote:
>
> Hi Bastien,
>       Can you please take a look at the patch v5, which has restored
> the same tab formatting?
> Thanks! Regards,
> Chris
>
> On Tue, Apr 13, 2021 at 7:12 PM Chris Ye <lzye@google.com> wrote:
> >
> > Add "Select" button input capability and input event mapping for
> > Microsoft Xbox One controller. From product site this is also referred as
> > "Share" button.
> > Fixed Microsoft Xbox One controller select button not working under USB
> > connection.
> >
> > Signed-off-by: Chris Ye <lzye@google.com>
> > ---
> >  drivers/input/joystick/xpad.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> > index 9f0d07dcbf06..cfbf1747b205 100644
> > --- a/drivers/input/joystick/xpad.c
> > +++ b/drivers/input/joystick/xpad.c
> > @@ -79,6 +79,7 @@
> >  #define MAP_DPAD_TO_BUTTONS            (1 << 0)
> >  #define MAP_TRIGGERS_TO_BUTTONS                (1 << 1)
> >  #define MAP_STICKS_TO_NULL             (1 << 2)
> > +#define MAP_SELECT_BUTTON              (1 << 3)
> >  #define DANCEPAD_MAP_CONFIG    (MAP_DPAD_TO_BUTTONS |                  \
> >                                 MAP_TRIGGERS_TO_BUTTONS | MAP_STICKS_TO_NULL)
> >
> > @@ -130,6 +131,7 @@ static const struct xpad_device {
> >         { 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0, XTYPE_XBOXONE },
> >         { 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
> >         { 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
> > +       { 0x045e, 0x0b12, "Microsoft Xbox One X pad", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
> >         { 0x046d, 0xc21d, "Logitech Gamepad F310", 0, XTYPE_XBOX360 },
> >         { 0x046d, 0xc21e, "Logitech Gamepad F510", 0, XTYPE_XBOX360 },
> >         { 0x046d, 0xc21f, "Logitech Gamepad F710", 0, XTYPE_XBOX360 },
> > @@ -862,6 +864,8 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
> >         /* menu/view buttons */
> >         input_report_key(dev, BTN_START,  data[4] & 0x04);
> >         input_report_key(dev, BTN_SELECT, data[4] & 0x08);
> > +       if (xpad->mapping & MAP_SELECT_BUTTON)
> > +               input_report_key(dev, KEY_RECORD, data[22] & 0x01);
> >
> >         /* buttons A,B,X,Y */
> >         input_report_key(dev, BTN_A,    data[4] & 0x10);
> > @@ -1672,6 +1676,8 @@ static int xpad_init_input(struct usb_xpad *xpad)
> >             xpad->xtype == XTYPE_XBOXONE) {
> >                 for (i = 0; xpad360_btn[i] >= 0; i++)
> >                         input_set_capability(input_dev, EV_KEY, xpad360_btn[i]);
> > +               if (xpad->mapping & MAP_SELECT_BUTTON)
> > +                       input_set_capability(input_dev, EV_KEY, KEY_RECORD);
> >         } else {
> >                 for (i = 0; xpad_btn[i] >= 0; i++)
> >                         input_set_capability(input_dev, EV_KEY, xpad_btn[i]);
> > --
> > 2.31.1.295.g9ea45b61b8-goog
> >
