Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46205331905
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 22:05:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhCHVFQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 16:05:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbhCHVFQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Mar 2021 16:05:16 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA703C06174A
        for <linux-input@vger.kernel.org>; Mon,  8 Mar 2021 13:05:15 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id b15so371779pjb.0
        for <linux-input@vger.kernel.org>; Mon, 08 Mar 2021 13:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3P+WdufDQoPwQYmzPoKqDqU/YflQDmz29795M8RuwUU=;
        b=iJTtyRpZUb0IhX64lb0IzvFed3TqgyLvxv2u+lPj+4SLWzBbm4gn+B2tzJb4GCqz/N
         /e7hByi5+PfopdPvegIye3MvFlfKkhVPVMNLD4Rb2zroZ8aTYydhCmstIsubG+UTD1/J
         L7K+VKhjuyAM8pOJt+FbSbZKM9kbzh//qhB+e8WqgPOZJR0gvgtseGtXmUsX0dcqZEhd
         ppEJuT6hwGUngpnWaBpbRtowOsXfw6cpsXmFYEK5Btgdahp/1mFwCuqdXhErIoj8RPRy
         P+E9QdVsM2pXvTpishYoFyiIMR6Z5Depx7UXTSv+Eay6AK9s7QdOzICMhINQTE7kmrwN
         Zu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3P+WdufDQoPwQYmzPoKqDqU/YflQDmz29795M8RuwUU=;
        b=fCrluL3mjYRN9C6y/Oh7oQDyWXdDHtmZ9PcrXfQcP0laxKszki1WfX181/XGoMiSiX
         PZJIXC0bAJhlmycL3mGeQBVFulWJBsLUJ4zt1dsVZ8TPRqd1VqRTA+Wk2HP0FHXKhbbX
         LoIkJ1Y42NQBXiLw4UxGmNugNu/qGZ0rUiibnM6+or1EfZAk22Hg7sWvH/XsZrp67/yI
         /mph2Y+6UOsDc2/ooMVea/uk8VTEdV/8j9Kpv5cYG3gJPywM6DmSpbICCkEgYfJqsLTn
         jyhkUkmoUsaG5DPs5BlpXASGZnrPVyRLdcO5Cc7DiCc9k58kOIWCThphG3fWz6bV39dm
         oekg==
X-Gm-Message-State: AOAM531VEWqR4gKQxAbqpqCs0cD+kTzoLYtEW7OU1xvJYPWv+iwTMZ+q
        LwUlEn1jD5TtgrWo+vHj+MCAL6gad7LrTcLhKVA=
X-Google-Smtp-Source: ABdhPJxdxJPnbRG3+7CI9vVqzicDE3mszjjIeWVUhHTtK4y9/zTgCowHdbh98qQPjdCcGkD/RPYXwBb+ffiCjdvoQqs=
X-Received: by 2002:a17:90a:db49:: with SMTP id u9mr819951pjx.181.1615237515490;
 Mon, 08 Mar 2021 13:05:15 -0800 (PST)
MIME-Version: 1.0
References: <20210307220549.354263-1-andy.shevchenko@gmail.com>
 <YEVaYiA9Faylr9il@google.com> <CAHp75VerojbEjAjtmFqhyrmyhT_WCZxQihgAac80_GAZHyH9LQ@mail.gmail.com>
 <YEZ7Atrdg7CAEWYA@google.com>
In-Reply-To: <YEZ7Atrdg7CAEWYA@google.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Mar 2021 23:04:59 +0200
Message-ID: <CAHp75Ve+A+5tEw40P+JXa5sauqBiBesdccvHEDbxzDZc-FmH0g@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] Input: tsc2007 - convert to GPIO descriptors
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 8, 2021 at 9:29 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Mon, Mar 08, 2021 at 11:10:38AM +0200, Andy Shevchenko wrote:
> > On Mon, Mar 8, 2021 at 12:57 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > > On Mon, Mar 08, 2021 at 12:05:48AM +0200, Andy Shevchenko wrote:
> >
> > ...
> >
> > > > -     return !gpio_get_value(ts->gpio);
> > > > +     return !gpiod_get_value(ts->gpiod);
> > >
> > > This is not correct. gpio_get_value() is raw polarity vs
> > > gpiod_get_value() using logical active/inactive, and tsc2007 GPIO lines
> > > are active low. The negation must be dropped after switching to GPIOD
> > > API.
> >
> > Ah, indeed, I missed that, thanks!
> >
> > ...
> >
> > > > -     ts->gpio = of_get_gpio(np, 0);
> > > > -     if (gpio_is_valid(ts->gpio))
> > > > -             ts->get_pendown_state = tsc2007_get_pendown_state_gpio;
> > > > -     else
> > > > -             dev_warn(&client->dev,
> > > > -                      "GPIO not specified in DT (of_get_gpio returned %d)\n",
> > > > -                      ts->gpio);
> > > > +     ts->gpiod = devm_gpiod_get_optional(dev, NULL, GPIOD_IN);
> > >
> > > GPIO is definitely not optional in DT case, at least in the way the
> > > driver written right now.
> >
> > Can you elaborate this, please? I don't see from the dev_warn() w/o
> > any error code returned that it's mandatory.
> > In the bindings one may read:
> >
> >   Optional properties:
> >   - gpios: the interrupt gpio the chip is connected to (trough the penirq pin).
> >     The penirq pin goes to low when the panel is touched.
> >     (see GPIO binding[1] for more details).
> >
> > Nothing suggested it's mandatory. What have I missed?
>
> Ah, indeed, I misread the code and thought we'd abort if there is no
> pendown GPIO. I wonder if we should remove the warning since we seem to
> support operations without it.

But that's what I have done, i.e. removed the warning as well.

So, if there are no other concerns than inverted value, I'll send v2.

-- 
With Best Regards,
Andy Shevchenko
