Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDBA54CB1
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2019 12:50:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729278AbfFYKuf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Jun 2019 06:50:35 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40511 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfFYKuf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Jun 2019 06:50:35 -0400
Received: by mail-pg1-f195.google.com with SMTP id w10so8761316pgj.7;
        Tue, 25 Jun 2019 03:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r0LFmQkQla4HoW+LfNI4MhAT+RGO2NBR67tJFxhVMYA=;
        b=RgaUm+qJjkLB9lZGfcuGq/HeAYlb0vYEym0EmhnTNGgxpxnhKV55KX8mCi6Sx3/HBg
         vra836ZiOxIplDeGrc3xjW12mr4ggim0dnrCBbKGxKvE3QxkOZaNOuRPHAZLUU6IeRuF
         6FV7ljhnPmLONQfPZ9qei8+iwCwfqCZtK59aJeC7i9a4sZmoHr7IxNx3NgTom5Bx4q0L
         AckSssmUa0slmODVkOuz1ZrkcTd8g4Zq3Q0NsG9cU2EyxvvB6vb8AsFUdzrv09744GkW
         SuIbjrnEgkCOFF7psj4zn2MkfLkcQDcASdnSw8c6HkjjtApMIjaQL2kWAmxz548PkFjC
         Yxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r0LFmQkQla4HoW+LfNI4MhAT+RGO2NBR67tJFxhVMYA=;
        b=fa283lBrbuy5+CsMra9g2V5cWgdIZIG+AOpDRmG5GmBDp4/oeukt7AYRHKstNeyI7N
         h1TlIs8EkDMeaBj2SFVzk/eIazxOcntmZfvowzilKIwr0OtU9IQqhzQXdxX7daTDX2TX
         GTdGPEE5V3HxNqs8A2BNzpcExB1T0d3W1VN/jRYqVbwfx6hS89lpXMVpQ8vtdQD+WzBa
         kGALmRI/s4YvPhRnqlS6qvMf8R6BC9YULbe7Uv3XH1u+hg6IkK7iyrQAxiSJT1NTucqB
         O2XVaQopq2aZRbpzCgVKlC1JJ2+SIKXCSqHmE9rIGK/lNHYJby+TMkUS3GuoTROC/h53
         +ViA==
X-Gm-Message-State: APjAAAX98aYm/nYm/yRspli/w80Ax3k7g5xlci5lrcyLgquNV8lFF2e/
        nO60NImGPKIxHSI2hm3vwjzBgWODRC777U1ybQ8=
X-Google-Smtp-Source: APXvYqw8/WnFgJMq0p4EVEtYRG/6voqYxOv6BWVlhTC1mMcbdLLY8uqmSX0j90biOb9Jv2nuh8Ypn/SA+YCJ5Nc1bYM=
X-Received: by 2002:a17:90a:35e6:: with SMTP id r93mr31470076pjb.20.1561459834178;
 Tue, 25 Jun 2019 03:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190623063153.261546-1-dmitry.torokhov@gmail.com> <011d62995b20493f977ead43f4b494a2@AcuMS.aculab.com>
In-Reply-To: <011d62995b20493f977ead43f4b494a2@AcuMS.aculab.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 25 Jun 2019 13:50:23 +0300
Message-ID: <CAHp75VfJQp4TqfyvjGtFcnvN-md++9fQUis6a-dFKn_2OUN=0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] Input: edt-ft5x06 - use get_unaligned_be16()
To:     David Laight <David.Laight@aculab.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Benoit Parrot <bparrot@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 25, 2019 at 11:44 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Dmitry Torokhov
> > Sent: 23 June 2019 07:32
> >
> > Instead of doing conversion by hand, let's use the proper accessors.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/input/touchscreen/edt-ft5x06.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> > index c639ebce914c..ec770226e119 100644
> > --- a/drivers/input/touchscreen/edt-ft5x06.c
> > +++ b/drivers/input/touchscreen/edt-ft5x06.c
> > @@ -27,6 +27,7 @@
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/input/mt.h>
> >  #include <linux/input/touchscreen.h>
> > +#include <asm/unaligned.h>
> >
> >  #define WORK_REGISTER_THRESHOLD              0x00
> >  #define WORK_REGISTER_REPORT_RATE    0x08
> > @@ -239,8 +240,8 @@ static irqreturn_t edt_ft5x06_ts_isr(int irq, void *dev_id)
> >               if (tsdata->version == EDT_M06 && type == TOUCH_EVENT_DOWN)
> >                       continue;
> >
> > -             x = ((buf[0] << 8) | buf[1]) & 0x0fff;
> > -             y = ((buf[2] << 8) | buf[3]) & 0x0fff;
> > +             x = get_unaligned_be16(buf) & 0x0fff;
> > +             y = get_unaligned_be16(buf + 2) & 0x0fff;
>
> You might as well delete the pointless masking with 0xff.

Hmm... Does it guarantee the most significant nibble to be always 0?
(Note 16-bit value and three f:s in the mask)


-- 
With Best Regards,
Andy Shevchenko
