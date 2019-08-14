Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDBD8CE72
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2019 10:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfHNIaf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Aug 2019 04:30:35 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:33263 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbfHNIae (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Aug 2019 04:30:34 -0400
Received: by mail-ot1-f68.google.com with SMTP id q20so27583988otl.0;
        Wed, 14 Aug 2019 01:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nZHd0Mwvau9he5/1FmiwSLgH5Qz9c3ZEqp2z+9qu40w=;
        b=IebKRSQNeCrFckv0XtH4F9f5wyBIk7dKKOKF31700y2SakCimIj8RonThKSr+GnDD6
         wneeWv1H1j1VTrLwGu8VdCcEdkcweRtmfrMj3FNCKzbiWZd6Xw3X0IQ+PeESM7Rzmnbm
         Z6HLuA55H7CJ/96g5lxG27w03Tyfb9OQYMBV2QdpL6pw9iWV9TiOCvs5/8nGTCyRvxju
         Gz2qFQLm9fgC7DK777OGI2TIZFyh8ZFj3RN6BSY5Gm8U/6AcZY6vZBj2xHtUL9VJXuF5
         RtyVkOlz2/B2jF+GCGtJmcLYsXQnwiP/PeM7YlaMnM8M33taBKQWHNGmhsEfk88EMZLe
         r7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nZHd0Mwvau9he5/1FmiwSLgH5Qz9c3ZEqp2z+9qu40w=;
        b=FvwqcjhR1UqWdLnR+A+rYYVQEk1+PLRGM+jYhezudPqjY7pc5F+BPB2ZpM6gnrA24f
         jF1w1ukLABxEvVz+q/vcwKr3Fext+wwuL99qjd1KbrZVO0LmRy6dRFH0ABEUL8QHJd9q
         bNAxinpJ9kmUI5sGx5DbC0Gp7Q9yshp21rk2HC3xuFHZ28SVuxLIGD7Axp4mhYRUNSOq
         Nfg6Vvvzz07X4CHOPATE59UF6GH9ZLBm/FPiO9DhWMGZLGrg4eH2UxVIRGTWofhy1lz/
         WG4lnZIX8V3V5VAV7EbjaAcN6XdUpcebU7oxQhoOegL0m6sTdRxZqmDUQKGvwwaRlIlh
         Yw9A==
X-Gm-Message-State: APjAAAWgKi4GPEfDKfO0lMIx2I2eruO91fvOtrQ7qLiTrvDsVbUXAuy7
        L9oCu9fxOPNZaiWAIkWZzPj0/2NeYPFxG1umcEY=
X-Google-Smtp-Source: APXvYqwfNbhvjEBZSUb/GfOA3cYjubj1vvG5ANK36Sberlj1MUB9i+dySW1GmegE8C+a4ZUImDQ0ocWnA8g+P6KF31U=
X-Received: by 2002:a6b:f906:: with SMTP id j6mr43925234iog.26.1565771433842;
 Wed, 14 Aug 2019 01:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190812162105.13428-1-benjamin.tissoires@redhat.com>
 <CADyDSO4x49GWdRVkW=cytvMc7rM3NJkJ4-Sj-FjM9Gday7C-iw@mail.gmail.com> <CAO-hwJ+z0szwuQrUxpQhii2z_jwxMX91df0ynK5QbZpMhg79-g@mail.gmail.com>
In-Reply-To: <CAO-hwJ+z0szwuQrUxpQhii2z_jwxMX91df0ynK5QbZpMhg79-g@mail.gmail.com>
From:   David Rheinsberg <david.rheinsberg@gmail.com>
Date:   Wed, 14 Aug 2019 10:30:22 +0200
Message-ID: <CADyDSO7wyG7Zp6nFAL84b1tQ30t5x-5P+0QZBD-dx6VNm=WoeA@mail.gmail.com>
Subject: Re: [PATCH] HID: uhid: actually use the err number from userspace
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hey

> > 2) I think you have to filter some of the error codes. For instance,
> > if you return one of the -ERESTARTSYS codes, this might cause the
> > syscall to restart (if auto-restart is enabled on this context). At
> > the same time, this is not *that* bad. It might even be useful for the
> > userspace driver to trigger an EINTR. At least we should be aware of
> > this. So maybe filters are not necessary.. Mhhh. Comments?
>
> I haven't thought at all of the side effects of letting the user
> return a random error code.
> I have the impression that anything below EHWPOISON (133) is
> relatively safe. So maybe we should just make sure the error code is
> below 134?
>
> The ERESTARTSYS has a few warnings in the include file, so I guess the
> side effects might be too much for what we want to deal with.

How about `err < ERESTARTSYS`? That is, we grant user-space the entire
range [1-511]. This seems to be the range reserved for uapi.

I think the ERESTART* codes would be fine as well, but I also don't
believe there to be any actual use-case for them. Anyway, I am fine
with either range.

Thanks
David
