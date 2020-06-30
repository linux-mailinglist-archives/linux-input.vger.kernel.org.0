Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6693E20FF63
	for <lists+linux-input@lfdr.de>; Tue, 30 Jun 2020 23:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbgF3VpB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Jun 2020 17:45:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgF3VpB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Jun 2020 17:45:01 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D93C061755
        for <linux-input@vger.kernel.org>; Tue, 30 Jun 2020 14:45:01 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id s1so10836076ybo.7
        for <linux-input@vger.kernel.org>; Tue, 30 Jun 2020 14:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MV644q9HdgOcMKjgfG3T+AvIinwaeIV1aDYJmZ0o2No=;
        b=HchvKg8aGsg2M1dEaZcfZu7LlzxTSPddVSg1ojsLydYKfMBLGtZR5sC4jXYsApabBl
         BkvwGrJ0KtlKu/1DVZSXDWActWbw4zH5L/lN1sRVI72DBdxEq8DouKLQwj8vPD+RZBeu
         qm8p4G50gMANVFwvIzdZRLOT0+sZxDUDCeGW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MV644q9HdgOcMKjgfG3T+AvIinwaeIV1aDYJmZ0o2No=;
        b=GT5+9vmmaNUvlyD5LzneH30cfUEcN77uVHwL4o+O7u6DPIKjcaoz/cOI8sTszRXiEX
         EWBrXaTUFPTlKdPKUSX9I6VLw5bfilMVFIALRb+4kB+IYRWX/1igTrwiKPcSai1FSOmV
         hmGHNmuQ3poXAq8BN/JZJ3gwis3u5s0SwetZKOoBE9+JjFUGEjXH28jzfJ/lMeovaody
         D1e+vp8f0NrL5pVQOJeqbwnOKkCr48oUVRceQ8yedZVLS0+wCA3t0uoGLmff5eI28f5r
         Sl8kO86SiYyCygCEhiKatMjT65dIdbVeBBbnlNAgL63Gsvh1EZOV6iOo+I3v0lZQ8EQH
         6Wjw==
X-Gm-Message-State: AOAM533P9HI4fF22XL0kR+3TfbWtz8vxG/C9Ra97GlmCJTkHDkp+u622
        EKJLVYMTi0geILfBYLWQqSr1Aoe5b1MYzh6yJQ99Fg==
X-Google-Smtp-Source: ABdhPJxNR194x+9wZPmD+dw/0ZTOItOzDJyKjyz3QG6PjyroZdSf7EIKV1y/dOZKNW2kYEIBirN1Nde4YHSYxCPvDwU=
X-Received: by 2002:a25:ae8c:: with SMTP id b12mr34313493ybj.502.1593553500134;
 Tue, 30 Jun 2020 14:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200630005707.2181126-1-dbasehore@chromium.org> <20200630051619.GG248110@dtor-ws>
In-Reply-To: <20200630051619.GG248110@dtor-ws>
From:   "dbasehore ." <dbasehore@chromium.org>
Date:   Tue, 30 Jun 2020 14:44:48 -0700
Message-ID: <CAGAzgsoqsETR79hzdcWjyrPYeLJeM5aUNnxUXsdRQowjsdwLZg@mail.gmail.com>
Subject: Re: [PATCH] Input: elan_i2c - only increment wakeup count on touch
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     jiada_wang@mentor.com, jeffrey.l.hugo@gmail.com,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jun 29, 2020 at 10:16 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Mon, Jun 29, 2020 at 05:57:07PM -0700, Derek Basehore wrote:
> > This moves the wakeup increment for elan devices to the touch report.
> > This prevents the drivers from incorrectly reporting a wakeup when the
> > resume callback resets then device, which causes an interrupt to
> > occur. This also avoids error messages when these interrupts occur,
> > since this behavior is expected.
> >
> > Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> > ---
> >  drivers/input/mouse/elan_i2c_core.c | 16 +++++++++++++---
> >  1 file changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> > index cdbe6b38c73c1..6ad53a75f9807 100644
> > --- a/drivers/input/mouse/elan_i2c_core.c
> > +++ b/drivers/input/mouse/elan_i2c_core.c
> > @@ -49,6 +49,7 @@
> >
> >  #define ETP_MAX_FINGERS              5
> >  #define ETP_FINGER_DATA_LEN  5
> > +#define ETP_REPORT_LEN_OFFSET        0
> >  #define ETP_REPORT_ID                0x5D
> >  #define ETP_TP_REPORT_ID     0x5E
> >  #define ETP_REPORT_ID_OFFSET 2
> > @@ -1018,6 +1019,8 @@ static void elan_report_absolute(struct elan_tp_data *data, u8 *packet)
> >       u8 hover_info = packet[ETP_HOVER_INFO_OFFSET];
> >       bool contact_valid, hover_event;
> >
> > +     pm_wakeup_event(&data->client->dev, 0);
> > +
> >       hover_event = hover_info & 0x40;
> >       for (i = 0; i < ETP_MAX_FINGERS; i++) {
> >               contact_valid = tp_info & (1U << (3 + i));
> > @@ -1041,6 +1044,8 @@ static void elan_report_trackpoint(struct elan_tp_data *data, u8 *report)
> >       u8 *packet = &report[ETP_REPORT_ID_OFFSET + 1];
> >       int x, y;
> >
> > +     pm_wakeup_event(&data->client->dev, 0);
> > +
> >       if (!data->tp_input) {
> >               dev_warn_once(&data->client->dev,
> >                             "received a trackpoint report while no trackpoint device has been created. Please report upstream.\n");
> > @@ -1065,7 +1070,6 @@ static void elan_report_trackpoint(struct elan_tp_data *data, u8 *report)
> >  static irqreturn_t elan_isr(int irq, void *dev_id)
> >  {
> >       struct elan_tp_data *data = dev_id;
> > -     struct device *dev = &data->client->dev;
> >       int error;
> >       u8 report[ETP_MAX_REPORT_LEN];
> >
> > @@ -1083,7 +1087,13 @@ static irqreturn_t elan_isr(int irq, void *dev_id)
> >       if (error)
> >               goto out;
> >
> > -     pm_wakeup_event(dev, 0);
> > +     /*
> > +      * Controllers may send a full length report on power on and reset
> > +      * cases. There are only meaningless bytes in these reports except for
> > +      * report[ETP_REPORT_LEN_OFFSET], which is 0.
> > +      */
>
> Is this true for all versions of firmware? Also, should we pay attention
> to the value of this field for various types of reports?
>

I wrote the patch with input from Elan on our bug tracker, and they
say that this will work. This is HID over I2C, so the first and second
byte are the length. Since the packets are never long, just the first
byte suffices for everything, but I think we should actually take the
first and second byte for the length. Just in case some new version of
the chip starts sending 256+ byte responses.

> > +     if (!report[ETP_REPORT_LEN_OFFSET])
> > +             goto out;
> >
> >       switch (report[ETP_REPORT_ID_OFFSET]) {
> >       case ETP_REPORT_ID:
> > @@ -1093,7 +1103,7 @@ static irqreturn_t elan_isr(int irq, void *dev_id)
> >               elan_report_trackpoint(data, report);
> >               break;
> >       default:
> > -             dev_err(dev, "invalid report id data (%x)\n",
> > +             dev_err(&data->client->dev, "invalid report id data (%x)\n",
> >                       report[ETP_REPORT_ID_OFFSET]);
> >       }
> >
> > --
> > 2.27.0.212.ge8ba1cc988-goog
> >
>
> Thanks.
>
> --
> Dmitry
