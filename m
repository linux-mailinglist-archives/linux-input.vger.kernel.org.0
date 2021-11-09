Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 979C244AB13
	for <lists+linux-input@lfdr.de>; Tue,  9 Nov 2021 10:59:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243016AbhKIKBw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Nov 2021 05:01:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242969AbhKIKBw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Nov 2021 05:01:52 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D74DC061764;
        Tue,  9 Nov 2021 01:59:06 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id e144so22354288iof.3;
        Tue, 09 Nov 2021 01:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ocne8Jf+CRaD/PTxWbJMJ6anZESoWIg8oVwu3VA3RFU=;
        b=YAxtZaFHOVYY7fKxi+LYJgQHvvmv0hAuyglZVjIjIwHLY+bCP6iAExqHKMLrrp8slV
         QuilRboUyRYpGQiG3nMxSn3a3HzVb9NpMiDGEBMKyFaX4tH/YTWgr1wnbqpgmRzqubUq
         RtrHw0uVxvmoCTTm0JH09lOIbdXkN7saP+ygMEjmaKDVNq24tjoUSWv9KxnZsyV1D9xQ
         qVKKgMSapT+nFxt92e8pOCcIngXqlBz8aYfs7aJb5VnvExou7xV5+sSJFckDrXaSQSPO
         aB5ar8PN47ouJNHYA0/3f1c5NfpM0eBTEexV1zFFSIcecu+U/sQSlzhFmKA6PGHbOfF/
         KLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ocne8Jf+CRaD/PTxWbJMJ6anZESoWIg8oVwu3VA3RFU=;
        b=LUTalVAHNTA2O3mWIDHT4vvbXL/gT9QVAFQ/E7r10Ah1kRL2mjzU76keDZMPS/mRwT
         CHN0YdioK/2ZZMA2J0d1/4+h2+NZrAhhUHkR1sUcUQK5kfGsEcAqOstWuBht2j4WRLXa
         VAkcJyt/msx+FxfdSS2DrF6PX1aDkPPfccBFLGeErcoWOorDh8lac30t9W+E/JkGMUW5
         jv+r5zH6G0hozeqy2N300ahBGjLYGr7sqG/QfRuWopII0isOQfZiWlFRUqFrnrUOleI8
         CViCLe8o5W8LmDIy1oLVyzbp4tSOljB8o7luRMifmiJmmMrDuh6ARSvDLyCeY4S4uVEa
         2KTg==
X-Gm-Message-State: AOAM532r3hOyu8cx999tzNXdHnbdb/uA89qXexM8OkDAtC5kNaXfxuP8
        SuGWPdJAAbJiHYmJwKYIP9jKIOVQN6myvgw1Jc9ISZJeTWcWtA==
X-Google-Smtp-Source: ABdhPJyPbzQdQsyjjhdkzHW8mr8w4SV9+xLf/EJpbFPzWjjoHaAD+B/UmvqAkyRL8XOe3Ylo7pR5UMmv6kcS1fbBFpI=
X-Received: by 2002:a05:6638:d16:: with SMTP id q22mr4535814jaj.35.1636451945942;
 Tue, 09 Nov 2021 01:59:05 -0800 (PST)
MIME-Version: 1.0
References: <20211009113707.17568-1-alistair@alistair23.me>
 <20211009113707.17568-2-alistair@alistair23.me> <YWZYy8OsqJx1J8VA@google.com> <CAKmqyKM=wHN=NhfSBFT243oTkozcpFrqt1xM8xRP6Yf4ONGG1Q@mail.gmail.com>
In-Reply-To: <CAKmqyKM=wHN=NhfSBFT243oTkozcpFrqt1xM8xRP6Yf4ONGG1Q@mail.gmail.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Tue, 9 Nov 2021 19:58:00 +1000
Message-ID: <CAKmqyKO1q4k8eXsJF1fGu6CNR1q9=_1MhwyCoJ2858rCNQBZKQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: wacom_i2c - Use macros for the bit masks
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Alistair Francis <alistair@alistair23.me>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 13, 2021 at 11:04 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Wed, Oct 13, 2021 at 1:56 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Alistair,
> >
> > On Sat, Oct 09, 2021 at 09:37:07PM +1000, Alistair Francis wrote:
> > > To make the code easier to read use macros for the bit masks.
> > >
> > > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > > ---
> > >  drivers/input/touchscreen/wacom_i2c.c | 14 ++++++++++----
> > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> > > index 8d7267ccc661..6865342db659 100644
> > > --- a/drivers/input/touchscreen/wacom_i2c.c
> > > +++ b/drivers/input/touchscreen/wacom_i2c.c
> > > @@ -14,6 +14,12 @@
> > >  #include <linux/interrupt.h>
> > >  #include <asm/unaligned.h>
> > >
> > > +// Bitmasks (for data[3])
> > > +#define WACOM_TIP_SWITCH_bm         (1 << 0)
> > > +#define WACOM_BARREL_SWITCH_bm      (1 << 1)
> > > +#define WACOM_ERASER_bm             (1 << 2)
> > > +#define WACOM_BARREL_SWITCH_2_bm    (1 << 4)
> >
> > We have BIT() for that.
> >
> > By the way, do you know what is the good name for bit 3? I see it is
> > being used in:
>
> I have this for bit 3:
>
> #define WACOM_INVERT_bm             (1 << 3)
>
>
> >
> >         if (!wac_i2c->prox)
> >                 wac_i2c->tool = (data[3] & 0x0c) ?
> >                         BTN_TOOL_RUBBER : BTN_TOOL_PEN;
> >
> >         wac_i2c->prox = data[3] & WACOM_IN_PROXIMITY;
> >
> > 0x0c is (WACOM_ERASER | <something else>).
> >
> > Also, I am a bit confused by this code, now that I look at it closer.
> > Are we saying that the tool type (eraser or something else) is set only
> > in first packet for contact/touch?
>
> I'm not sure, you would have to check with the wacom people.
>
> >
> > > +
> > >  // Registers
> > >  #define WACOM_COMMAND_LSB   0x04
> > >  #define WACOM_COMMAND_MSB   0x00
> > > @@ -110,10 +116,10 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
> > >       if (error < 0)
> > >               goto out;
> > >
> > > -     tsw = data[3] & 0x01;
> > > -     ers = data[3] & 0x04;
> > > -     f1 = data[3] & 0x02;
> > > -     f2 = data[3] & 0x10;
> > > +     tsw = data[3] & WACOM_TIP_SWITCH_bm;
> > > +     ers = data[3] & WACOM_ERASER_bm;
> > > +     f1 = data[3] & WACOM_BARREL_SWITCH_bm;
> > > +     f2 = data[3] & WACOM_BARREL_SWITCH_2_bm;
> > >       x = le16_to_cpup((__le16 *)&data[4]);
> > >       y = le16_to_cpup((__le16 *)&data[6]);
> > >       pressure = le16_to_cpup((__le16 *)&data[8]);
> > > --
> > > 2.31.1
> > >
> >
> > How about the version of the patch below?
>
> Looks good to me!
>
> Alistair
>
> >
> > --
> > Dmitry
> >
> > Input: wacom_i2c - use macros for the bit masks
> >
> > From: Alistair Francis <alistair@alistair23.me>
> >
> > To make the code easier to read use macros for the bit masks.
> >
> > Signed-off-by: Alistair Francis <alistair@alistair23.me>
> > Link: https://lore.kernel.org/r/20211009113707.17568-2-alistair@alistair23.me
> > Patchwork-Id: 12547519
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

I'm assuming you don't need me to re-send this. Let me know if you
want me to though.

Alistair

> > ---
> >  drivers/input/touchscreen/wacom_i2c.c |   19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> > index 22826c387da5..d3ea9aa8a98c 100644
> > --- a/drivers/input/touchscreen/wacom_i2c.c
> > +++ b/drivers/input/touchscreen/wacom_i2c.c
> > @@ -6,6 +6,7 @@
> >   * <tobita.tatsunosuke@wacom.co.jp>
> >   */
> >
> > +#include <linux/bits.h>
> >  #include <linux/module.h>
> >  #include <linux/input.h>
> >  #include <linux/i2c.h>
> > @@ -14,6 +15,14 @@
> >  #include <linux/interrupt.h>
> >  #include <asm/unaligned.h>
> >
> > +// Bitmasks (for data[3])
> > +#define WACOM_TIP_SWITCH       BIT(0)
> > +#define WACOM_BARREL_SWITCH    BIT(1)
> > +#define WACOM_ERASER           BIT(2)
> > +#define WACOM_BARREL_SWITCH_2  BIT(4)
> > +#define WACOM_IN_PROXIMITY     BIT(5)
> > +
> > +// Registers
> >  #define WACOM_CMD_QUERY0       0x04
> >  #define WACOM_CMD_QUERY1       0x00
> >  #define WACOM_CMD_QUERY2       0x33
> > @@ -99,10 +108,10 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
> >         if (error < 0)
> >                 goto out;
> >
> > -       tsw = data[3] & 0x01;
> > -       ers = data[3] & 0x04;
> > -       f1 = data[3] & 0x02;
> > -       f2 = data[3] & 0x10;
> > +       tsw = data[3] & WACOM_TIP_SWITCH;
> > +       ers = data[3] & WACOM_ERASER;
> > +       f1 = data[3] & WACOM_BARREL_SWITCH;
> > +       f2 = data[3] & WACOM_BARREL_SWITCH_2;
> >         x = le16_to_cpup((__le16 *)&data[4]);
> >         y = le16_to_cpup((__le16 *)&data[6]);
> >         pressure = le16_to_cpup((__le16 *)&data[8]);
> > @@ -111,7 +120,7 @@ static irqreturn_t wacom_i2c_irq(int irq, void *dev_id)
> >                 wac_i2c->tool = (data[3] & 0x0c) ?
> >                         BTN_TOOL_RUBBER : BTN_TOOL_PEN;
> >
> > -       wac_i2c->prox = data[3] & 0x20;
> > +       wac_i2c->prox = data[3] & WACOM_IN_PROXIMITY;
> >
> >         input_report_key(input, BTN_TOUCH, tsw || ers);
> >         input_report_key(input, wac_i2c->tool, wac_i2c->prox);
