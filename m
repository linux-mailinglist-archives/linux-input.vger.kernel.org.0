Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB615EE823
	for <lists+linux-input@lfdr.de>; Wed, 28 Sep 2022 23:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234405AbiI1VQr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Sep 2022 17:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234497AbiI1VQ0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Sep 2022 17:16:26 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5159C50504
        for <linux-input@vger.kernel.org>; Wed, 28 Sep 2022 14:10:54 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id y20so2697627plb.2
        for <linux-input@vger.kernel.org>; Wed, 28 Sep 2022 14:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=9t1zC330HUR2z0lQkNzGtWIQnlQT+GzrLYZrL9egK1U=;
        b=JDX3GYUhPjHCWI9lm9NZcjbU+aMhiRXuYEclhJtT4AZ7VuiPWPseLSUDBsDNdO/Xg/
         RTeu3E/XB8AoR2yDZEyCK0Cazj/HOIFifbRDPm9EDijegDsq78fkSCnmQZe4OKRlzXCp
         xCD5SSeVhuf6yuf7sxeUwcIFK0U9QHmM3LN3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9t1zC330HUR2z0lQkNzGtWIQnlQT+GzrLYZrL9egK1U=;
        b=xVz+oMLVJlAsJZfMwXMN5xj5EGQGh732t6TYH7oY5XbWNUy8QpniIWixhDyZESJSq0
         7adgW18zF5DDCzkVsh8QSdrwJrg4veZEWS3z6V+d84Dz02NIDngxiCQQZZgB8Wn/6EX8
         HLRqJ0vRJcvc3pF4kuzszb/aQ7y97+U6iQbRitw+pn75xfFTuWP/9hfTSxOl3OLLrpsw
         jokRq7JsB8b2sVwEMSWvmG9kYGPHaZmC+1BOyUwZvJ7ZDxAly21MIllPpC2yIuPyovzQ
         XozwKXMJXpOMrseEa7TjqyKECyiYJSoxCgFFL0zjywQ7YEgpFN4q+ZHqCOSiWwE7A4nT
         uRCQ==
X-Gm-Message-State: ACrzQf23P2metG8Kk6e0tPov87iXC+taVdN6QVixs2TMMGIT18jybhrs
        6/kU0d/d7qiQw+Xy6AJstKqKzXFO3/XlLg==
X-Google-Smtp-Source: AMsMyM4LObYOb4DEXkOqNTawTKV/PZ0anaj6Q/JTlD5qj7bfszsvTJ4gIrAODgolxJlcNxwLK4UsiA==
X-Received: by 2002:a17:90b:3951:b0:205:ef51:98e3 with SMTP id oe17-20020a17090b395100b00205ef5198e3mr5586857pjb.138.1664399453023;
        Wed, 28 Sep 2022 14:10:53 -0700 (PDT)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id z16-20020a170902ccd000b00172b87d9770sm4177151ple.81.2022.09.28.14.10.52
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 14:10:52 -0700 (PDT)
Received: by mail-pj1-f41.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so3945060pjq.3
        for <linux-input@vger.kernel.org>; Wed, 28 Sep 2022 14:10:52 -0700 (PDT)
X-Received: by 2002:a17:902:f68d:b0:178:41dd:12ad with SMTP id
 l13-20020a170902f68d00b0017841dd12admr1645115plg.25.1664399451471; Wed, 28
 Sep 2022 14:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220921155205.1332614-1-rrangel@chromium.org>
 <20220921094736.v5.8.I7d9202463f08373feccd6e8fd87482c4f40ece5d@changeid> <CAJZ5v0g57mF-4ZC2ajL5+JE+q9y=fW1G-OXR8tuOk4TYxHPWtQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0g57mF-4ZC2ajL5+JE+q9y=fW1G-OXR8tuOk4TYxHPWtQ@mail.gmail.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Wed, 28 Sep 2022 15:10:40 -0600
X-Gmail-Original-Message-ID: <CAHQZ30BZ5jnTY4DQD5mxpnLcLxn5Oo=izB1+f06JOqXU5VGz_A@mail.gmail.com>
Message-ID: <CAHQZ30BZ5jnTY4DQD5mxpnLcLxn5Oo=izB1+f06JOqXU5VGz_A@mail.gmail.com>
Subject: Re: [PATCH v5 08/13] ACPI: PM: Take wake IRQ into consideration when
 entering suspend-to-idle
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Tim Van Patten <timvp@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "jingle.wu" <jingle.wu@emc.com.tw>,
        Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Len Brown <lenb@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Sep 24, 2022 at 11:00 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Wed, Sep 21, 2022 at 5:52 PM Raul E Rangel <rrangel@chromium.org> wrote:
> >
> > This change adds support for ACPI devices that use ExclusiveAndWake or
> > SharedAndWake in their _CRS GpioInt definition (instead of using _PRW),
> > and also provide power resources. Previously the ACPI subsystem had no
> > idea if the device had a wake capable interrupt armed. This resulted
> > in the ACPI device PM system placing the device into D3Cold, and thus
> > cutting power to the device. With this change we will now query the
> > _S0W method to figure out the appropriate wake capable D-state.
> >
> > Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> > ---
> >
> > Changes in v5:
> > - Go back to using adev->wakeup.flags.valid to keep the diff cleaner
> > - Fix a typo in comment
> >
> >  drivers/acpi/device_pm.c | 19 +++++++++++++++++--
> >  1 file changed, 17 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/acpi/device_pm.c b/drivers/acpi/device_pm.c
> > index 9dce1245689ca2..3111fc426e04fd 100644
> > --- a/drivers/acpi/device_pm.c
> > +++ b/drivers/acpi/device_pm.c

> > @@ -681,8 +681,23 @@ static int acpi_dev_pm_get_state(struct device *dev, struct acpi_device *adev,
> >                 d_min = ret;
> >                 wakeup = device_may_wakeup(dev) && adev->wakeup.flags.valid
> >                         && adev->wakeup.sleep_state >= target_state;
Just an FYI, I didn't update the code that handles the target state >
S0. I need to get a
device that has S3 capabilities and the correct firmware to test this.
I figure I can do
that as a different patch when I have time to test with an S3 device.

> > -       } else {
> > -               wakeup = adev->wakeup.flags.valid;
> > +       } else if (adev->wakeup.flags.valid) {
> > +               /* ACPI GPE specified in _PRW. */
> > +               wakeup = true;

>
> I would retain the "else" clause as it was and just add a new "else
> if" one before it.
>
Done

> > +       } else if (device_may_wakeup(dev) && dev->power.wakeirq) {
> > +               /*
> > +                * The ACPI subsystem doesn't manage the wake bit for IRQs
> > +                * defined with ExclusiveAndWake and SharedAndWake. Instead we
> > +                * expect them to be managed via the PM subsystem. Drivers
> > +                * should call dev_pm_set_wake_irq to register an IRQ as a wake
> > +                * source.
> > +                *
> > +                * If a device has a wake IRQ attached we need to check the
> > +                * _S0W method to get the correct wake D-state. Otherwise we
> > +                * end up putting the device into D3Cold which will more than
> > +                * likely disable wake functionality.
> > +                */
> > +               wakeup = true;
> >         }
> >
> >         /*
> > --

I'll send out v6 soon unless anyone else has any comments.
