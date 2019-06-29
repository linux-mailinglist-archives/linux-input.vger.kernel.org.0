Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0CDE5AB7F
	for <lists+linux-input@lfdr.de>; Sat, 29 Jun 2019 15:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbfF2NU5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Jun 2019 09:20:57 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39955 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726723AbfF2NU4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Jun 2019 09:20:56 -0400
Received: by mail-pl1-f195.google.com with SMTP id a93so4805250pla.7;
        Sat, 29 Jun 2019 06:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qVWlkgDtNHs2MahKNDhJBOaCpu0T2opP380xlBFFRwI=;
        b=HctMOvKuvZhajKyzllXNX3Tdfo7GSV+je4NhysGL5i4Fl4JLZsRmMatI+EOTl8Pm1A
         vSA/GxrhooP9G3TtWop922txzsd51crNKp53hK0alP50gs4sqlA1QLT9YB90o4533ZC3
         wPfa16vrv9T9oy2RzuK4JVFeaTXdxKpU13HWBc6IxQut/eBopKYbrvTZX3tkz4CCDx7j
         iqApv/fMMrpzat/drrI1RDM8eZH2gQhJjvIU9RmzRAu3d55Ke2FX4GhxEIzC1rz1BySn
         wYAbZKD5bPDSXKPak6OIrbk6Z19gv0z3qpKp0mcCufcDjRGvn1o9Bf65nig/4MWpJhcZ
         EhYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qVWlkgDtNHs2MahKNDhJBOaCpu0T2opP380xlBFFRwI=;
        b=B9SLL9dcavWl5hEOchEFWSTnhzCLbfnzXJ2X11XLRVAVR7NB/ng/x4tc6Uqb+3p54O
         KUEauweljJHNwwbvcoH6P5/J8w0Bl7ajnZmxPY0icT7bP2Ed5fqkgQM3tUfogwyQ22Yd
         dhga/2g2MNG3Sg6vu6blDsQi9kdzyOCvPAMKqpXKDTFtelGd/e3TT6ltk3gfjHJdw86a
         KygS+59KSZQKPcj9EUkFAVMn0PnnLW7Y+RSYJ7AUXqTWKiO6WGNXKV9Yb8bCavYzWx13
         up+6//SmZxM0NmguADMaEpcsOV9wzfdh2SpSpSpsE4wVKQfTjAd9CweDo4w405NM/OkL
         d0jg==
X-Gm-Message-State: APjAAAU8ggzuEZPQYSsxdIrB9zNztZCWGLElhW+rxpbS2hT41RiP6Oj4
        tvOJ+OwSu6vvGV6XirpbLP/fGBCKshnvWCtfzMI=
X-Google-Smtp-Source: APXvYqwSakAGTAQHXwLX9TjPzrjrFxJ5kxivNOK21r1IhP+HbenqJ9+MFSQqqVYffJBukenwrYdcC8RgJbD3dldFnnM=
X-Received: by 2002:a17:902:934a:: with SMTP id g10mr18049015plp.18.1561814455839;
 Sat, 29 Jun 2019 06:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190612124053.119182-1-me@myself5.de> <736848fd-1c45-0bd9-bfd1-747c716bd953@redhat.com>
In-Reply-To: <736848fd-1c45-0bd9-bfd1-747c716bd953@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 29 Jun 2019 16:20:44 +0300
Message-ID: <CAHp75VcxiKMWnXe_oFu-9JCfDuXa9hOUi2Qy6bNQiREH_i621Q@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Update Hi10 Air filter
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Christian Oder <me@myself5.de>, Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 12, 2019 at 3:55 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 12-06-19 14:40, Christian Oder wrote:
> > Turns out the Hi10 Air is built by multiple companies so using Hampoo
> > as a filter is not enough to cover all variants.
> >
> > This has been verified as working on the Hampoo and Morshow version.
> >
> > Signed-off-by: Christian Oder <me@myself5.de>
>
> Patch looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>

I have pushed it, though I forget about this issue, it went without
this tag, sorry.

> Regards,
>
> Hans
>
>
> > ---
> >   drivers/platform/x86/touchscreen_dmi.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> > index b662cb2d7cd5..61e7c4987d0d 100644
> > --- a/drivers/platform/x86/touchscreen_dmi.c
> > +++ b/drivers/platform/x86/touchscreen_dmi.c
> > @@ -597,7 +597,8 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
> >               /* Chuwi Hi10 Air */
> >               .driver_data = (void *)&chuwi_hi10_air_data,
> >               .matches = {
> > -                     DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "CHUWI INNOVATION AND TECHNOLOGY(SHENZHEN)CO.LTD"),
> > +                     DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
> >                       DMI_MATCH(DMI_PRODUCT_SKU, "P1W6_C109D_B"),
> >               },
> >       },
> >



-- 
With Best Regards,
Andy Shevchenko
