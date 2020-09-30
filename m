Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 555D827EECB
	for <lists+linux-input@lfdr.de>; Wed, 30 Sep 2020 18:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731085AbgI3QSX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 12:18:23 -0400
Received: from mail.zx2c4.com ([192.95.5.64]:53599 "EHLO mail.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728744AbgI3QSX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 12:18:23 -0400
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95a18fe3
        for <linux-input@vger.kernel.org>;
        Wed, 30 Sep 2020 15:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=Uj66ldb25k27RZZgGeTwhYeibgM=; b=adxP3r
        d9bCSIuAaF7iFwPvZMJKPfkA2q+C9ob/nEMtG6bs+0nQwtaglbYfb09JLVK5sbMf
        W51KVtqSIiYftzYsn8PMmNBuJdDhZopYd4NNeW9CYEO2M64HFXnn7I4gEavy/b5Q
        TX93EfwOrGF8gHHMXi4nn7kXdhs7V2dd4wXbw9OoOapDSV65UVhZ56kN5ALcsTDP
        dKCTHcIvgjPcd45fdvHzjr5XMyzOU59K+LEuD6vTVxuvNnO1g1XxZVxUR0esPkKu
        tWZkN6Wm6Ot3Z05NZ8kwA4lJ0ytLO2NlnrhBu0zxhVxVy3vPlrkvzXN/OpC/ievZ
        JFd59tmpIufwDRNA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0b127a73 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
        for <linux-input@vger.kernel.org>;
        Wed, 30 Sep 2020 15:46:35 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id q4so2423819iop.5
        for <linux-input@vger.kernel.org>; Wed, 30 Sep 2020 09:18:20 -0700 (PDT)
X-Gm-Message-State: AOAM530Pm0Yi8q51b7GWqw5UjYiXsizGUlPSR9Wcs1QY1AAGRbp1ESDx
        MuT/F95wgLR8EK2oob8iohVYqZ+OWMMxdorlSKw=
X-Google-Smtp-Source: ABdhPJytbQBaOp8jj5qiOuhUqtX3t+zDHVs/95AUWqvH4Xp7gu5eQWSOJszH2JfAhbWlELy80HLbn7jbFeblK52+D/E=
X-Received: by 2002:a5e:d606:: with SMTP id w6mr2263653iom.67.1601482699102;
 Wed, 30 Sep 2020 09:18:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9pqrEW5CQbdSm6ckvB0b81ZBZ77CJC45BOqpiuZcgRnXQ@mail.gmail.com>
 <20200930112437.13705-1-Jason@zx2c4.com> <5bd2bb9d925cfc81392bd9bf93b31ce4fd81e107.camel@redhat.com>
In-Reply-To: <5bd2bb9d925cfc81392bd9bf93b31ce4fd81e107.camel@redhat.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Wed, 30 Sep 2020 18:18:08 +0200
X-Gmail-Original-Message-ID: <CAHmME9rY6RkJ7JHN=-=e=QaN=FZtqbhMJ8NqTwBtwDCw7K1bEA@mail.gmail.com>
Message-ID: <CAHmME9rY6RkJ7JHN=-=e=QaN=FZtqbhMJ8NqTwBtwDCw7K1bEA@mail.gmail.com>
Subject: Re: [PATCH v2] Input: synaptics - enable InterTouch for ThinkPad
 X1E/P1 2nd gen
To:     Lyude Paul <lyude@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 30, 2020 at 6:05 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Maybe correct the comment in smbus_pnp_ids to reflect this handles both the X1
> Extreme and P2 2nd Gen. Then I'd probably split the bootloader change into a
> commit that comes before adding the new PnP IDs.

Okay, I'll submit a v3.

One thing I should note is that the sensitivity sysfs entry doesn't
seem to do anything at all. push_to_click works, but not sensitivity.
I don't know if this has bitrotted over the years and I shouldn't
expect it to work, as it rarely does or something, but thought I
should mention this.

Jason

>
> Otherwise though:
>
> Acked-by: Lyude Paul <lyude@redhat.com>
>
> Let's see what the folks from synaptics say
>
> On Wed, 2020-09-30 at 13:24 +0200, Jason A. Donenfeld wrote:
> > With the new RMI4 F3A support posted yesterday, this appears to maybe
> > work, but requires us to add support for the newer bootloader, which
> > this commit does.
> >
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Vincent Huang <vincent.huang@tw.synaptics.com>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > ---
> >  drivers/input/mouse/synaptics.c | 1 +
> >  drivers/input/rmi4/rmi_f34v7.c  | 7 +++++--
> >  2 files changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/input/mouse/synaptics.c
> > b/drivers/input/mouse/synaptics.c
> > index 8a54efd6eb95..9d6fec84047b 100644
> > --- a/drivers/input/mouse/synaptics.c
> > +++ b/drivers/input/mouse/synaptics.c
> > @@ -180,6 +180,7 @@ static const char * const smbus_pnp_ids[] = {
> >       "LEN0096", /* X280 */
> >       "LEN0097", /* X280 -> ALPS trackpoint */
> >       "LEN0099", /* X1 Extreme 1st */
> > +     "LEN0402", /* X1 Extreme 2nd */
> >       "LEN009b", /* T580 */
> >       "LEN200f", /* T450s */
> >       "LEN2044", /* L470  */
> > diff --git a/drivers/input/rmi4/rmi_f34v7.c b/drivers/input/rmi4/rmi_f34v7.c
> > index 74f7c6f214ff..8cfaa2f19ed5 100644
> > --- a/drivers/input/rmi4/rmi_f34v7.c
> > +++ b/drivers/input/rmi4/rmi_f34v7.c
> > @@ -1364,9 +1364,12 @@ int rmi_f34v7_probe(struct f34_data *f34)
> >               f34->bl_version = 6;
> >       } else if (f34->bootloader_id[1] == 7) {
> >               f34->bl_version = 7;
> > +     } else if (f34->bootloader_id[1] == 8) {
> > +             f34->bl_version = 8;
> >       } else {
> > -             dev_err(&f34->fn->dev, "%s: Unrecognized bootloader
> > version\n",
> > -                             __func__);
> > +             dev_err(&f34->fn->dev, "%s: Unrecognized bootloader version:
> > %d (%c) %d (%c)\n",
> > +                             __func__, f34->bootloader_id[0], f34-
> > >bootloader_id[0],
> > +                             f34->bootloader_id[1], f34->bootloader_id[1]);
> >               return -EINVAL;
> >       }
> >
> --
> Cheers,
>         Lyude Paul (she/her)
>         Software Engineer at Red Hat
