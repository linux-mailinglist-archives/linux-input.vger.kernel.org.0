Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8497E4829C
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2019 14:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbfFQMhq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jun 2019 08:37:46 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37440 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbfFQMhq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jun 2019 08:37:46 -0400
Received: by mail-pg1-f195.google.com with SMTP id n65so1302342pga.4;
        Mon, 17 Jun 2019 05:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AE6Et66yryfONYAMntqgdER4kITdwcL5ML+i9VnMs/g=;
        b=cqZZGlvd+Zl4W5jMYAk32QGfO3OEQpJTfcCzuh+wxK0pWmggZCnfxng+QKe6or/B7k
         /vWLTbCYdltTYOmhAZg15CT91dRlIn2l2klflxkj2Jk7mFC/pfVGoDkO/dnjrEsEyBXN
         pimbNwEjN2vFnq4COWOId38M1GOV1HMFogBlGq/iEEhP+YPEkf4+lEBzH2EhTSWNizyC
         O2McxuBW2rKav62BGpET79Wqrm1IMxvHqkfY9VwAA7EjXw0IpciBc8xP2Cgoq3yIZAWg
         i5X3FixUmucP5D6B4G6H/2JwEH77QouB4mjbOiKGCY8qfmWEkkWheCG/YfLywO1J1aS+
         A9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AE6Et66yryfONYAMntqgdER4kITdwcL5ML+i9VnMs/g=;
        b=RBQyGgaUW3EtoS3/aVetijBfSqWHPxUV9A0mGlTBLRTdetZwucqPYbAwC8GSc1wiCt
         /4WBWAmzdNvjHKYq5p/v45n2RQ2OOhwg8O30yYtS/DYe1V2xICuJu+Ztb3j32BqZp0Cd
         XVmEDyTKf64nALY2TY6T4uju5ldWJOAV4/R8EEeEtgWqySA4UquetrGlrvjRSTtc4sON
         Sgh5XTA/6RYkIT2eu3sqz136uMYoHhMRF5nHZRwAj0d9bWJMEiI0TCrVWItWieTcqeFT
         TTkLdVVkhD9cjnfrGfpYImS/oHQ1+u2bYD1UpapBanJP38zR6tSNMfUNoOW6AwYCNvtQ
         qhRw==
X-Gm-Message-State: APjAAAUKNI9aeR8BIDT9pSKH0Z3odxiZGXM7U/+po0pMMEyxyuhciJG/
        iKOQvmIRCnmnBVZ8Xq1mKs1wO+h23z1lMkYJ3bQ=
X-Google-Smtp-Source: APXvYqyGgsn1lKfEW49fWsF/lsg3qMdplI5bCfSwovHXs50WzCRLKF3s8LXACrS4vxqBwJdgsQggoOK5CMoZLOdJ4NA=
X-Received: by 2002:a17:90b:d8b:: with SMTP id bg11mr25973351pjb.30.1560775065609;
 Mon, 17 Jun 2019 05:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190612124053.119182-1-me@myself5.de> <736848fd-1c45-0bd9-bfd1-747c716bd953@redhat.com>
In-Reply-To: <736848fd-1c45-0bd9-bfd1-747c716bd953@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 17 Jun 2019 15:37:34 +0300
Message-ID: <CAHp75Vdzf7bMQq2WP59Pux6QXD4GTcPLjryEecAsHJiAEewjcA@mail.gmail.com>
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

By some reason patchwork doesn't have a trace of this.

>
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
