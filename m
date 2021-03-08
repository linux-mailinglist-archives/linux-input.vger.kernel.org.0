Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0C1331924
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 22:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbhCHVNT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 16:13:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231506AbhCHVM4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Mar 2021 16:12:56 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A76CEC06174A
        for <linux-input@vger.kernel.org>; Mon,  8 Mar 2021 13:12:56 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id 18so8011918pfo.6
        for <linux-input@vger.kernel.org>; Mon, 08 Mar 2021 13:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jdH86y4Es+0CIE2VD6ULDfjPCdC5LW9r4yUAS5hiKmY=;
        b=rf0OyOHVGyMaZ6LIIiN9UonGaFXDl1eAAuB/ykE+/8Fh2+9TdrmvuvgToNNi02Tw7i
         nhMcqvMLLbCgaAqk8EoTggBOqck6/8bTSLlthxP5QqkxP4rWw8YRAcUarqJUXHz0ixyf
         tyhOFimg/rJazNKBLMHwdW+HKxVjcw3uacWqbrKnteJIESIaS9l6H8u3E+k+7yU3DLjX
         GJJUQd7phfAcYwVzB4jr42bfLpizyNanhnjy05KWo+zTas9bSwr4Rk/4HGHfAi8EImfX
         gE7V0pP7TzihMZ/u1fzIj3Y/7f6QBGDvbJoKwJBJOZu7kF8wqNT/+s3o5KaHm0JtLxAL
         MBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jdH86y4Es+0CIE2VD6ULDfjPCdC5LW9r4yUAS5hiKmY=;
        b=aiid/X/52nidgpQ85CNddFfiK2WD7DaZ07gHPheHT8021bEBALxhM6F305vEfcKS42
         9CQB3twYFEyJRi9CeYEb9MNQdg8X0CiJE0zAG2vuvFld/SG7La761OaNsV9M3H7XAch7
         8FeEIDmwW/EneoVFvLphYe9b9x1r8D6A4gTdGROVcU1hA+zaQEuYMGHP907SSUWDkNkE
         3nGXLv8lUFj8+5XD4ZM9u/+Dvgs6vC+2MIRi0/NWQg3xm7O4n1qa6gS+wRlQAt1TScrf
         4aK4SjeS0hca6fiz15VHn0Ja+/BjtXnVv3QLSTmAIg6S322PbwukYDylvrFt4/4EjyEy
         vgzg==
X-Gm-Message-State: AOAM532x6Nj8aCkLeyhe0TNe/6J5WRnuXtxgJQJrMhFcMvQV3+P+7wBn
        C6fnkQWXd/HDUX94kIUgaeSDQlUPQdY=
X-Google-Smtp-Source: ABdhPJxSiGqEfkGorIYqq8cBaMFKG3dLQZJawAoCT4zckQHqvSwmkgT2/Tr7mB3hx4I31paHttOTWw==
X-Received: by 2002:a63:9811:: with SMTP id q17mr22399722pgd.238.1615237976062;
        Mon, 08 Mar 2021 13:12:56 -0800 (PST)
Received: from google.com ([2620:15c:202:201:39e0:7b5c:9fa7:f6e0])
        by smtp.gmail.com with ESMTPSA id 133sm11484585pfa.130.2021.03.08.13.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 13:12:55 -0800 (PST)
Date:   Mon, 8 Mar 2021 13:12:52 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] Input: tsc2007 - convert to GPIO descriptors
Message-ID: <YEaTVGVbMJzOPHJ6@google.com>
References: <20210307220549.354263-1-andy.shevchenko@gmail.com>
 <YEVaYiA9Faylr9il@google.com>
 <CAHp75VerojbEjAjtmFqhyrmyhT_WCZxQihgAac80_GAZHyH9LQ@mail.gmail.com>
 <YEZ7Atrdg7CAEWYA@google.com>
 <CAHp75Ve+A+5tEw40P+JXa5sauqBiBesdccvHEDbxzDZc-FmH0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Ve+A+5tEw40P+JXa5sauqBiBesdccvHEDbxzDZc-FmH0g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 08, 2021 at 11:04:59PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 8, 2021 at 9:29 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Mon, Mar 08, 2021 at 11:10:38AM +0200, Andy Shevchenko wrote:
> > > On Mon, Mar 8, 2021 at 12:57 AM Dmitry Torokhov
> > > <dmitry.torokhov@gmail.com> wrote:
> > > > On Mon, Mar 08, 2021 at 12:05:48AM +0200, Andy Shevchenko wrote:
> > >
> > > ...
> > >
> > > > > -     return !gpio_get_value(ts->gpio);
> > > > > +     return !gpiod_get_value(ts->gpiod);
> > > >
> > > > This is not correct. gpio_get_value() is raw polarity vs
> > > > gpiod_get_value() using logical active/inactive, and tsc2007 GPIO lines
> > > > are active low. The negation must be dropped after switching to GPIOD
> > > > API.
> > >
> > > Ah, indeed, I missed that, thanks!
> > >
> > > ...
> > >
> > > > > -     ts->gpio = of_get_gpio(np, 0);
> > > > > -     if (gpio_is_valid(ts->gpio))
> > > > > -             ts->get_pendown_state = tsc2007_get_pendown_state_gpio;
> > > > > -     else
> > > > > -             dev_warn(&client->dev,
> > > > > -                      "GPIO not specified in DT (of_get_gpio returned %d)\n",
> > > > > -                      ts->gpio);
> > > > > +     ts->gpiod = devm_gpiod_get_optional(dev, NULL, GPIOD_IN);
> > > >
> > > > GPIO is definitely not optional in DT case, at least in the way the
> > > > driver written right now.
> > >
> > > Can you elaborate this, please? I don't see from the dev_warn() w/o
> > > any error code returned that it's mandatory.
> > > In the bindings one may read:
> > >
> > >   Optional properties:
> > >   - gpios: the interrupt gpio the chip is connected to (trough the penirq pin).
> > >     The penirq pin goes to low when the panel is touched.
> > >     (see GPIO binding[1] for more details).
> > >
> > > Nothing suggested it's mandatory. What have I missed?
> >
> > Ah, indeed, I misread the code and thought we'd abort if there is no
> > pendown GPIO. I wonder if we should remove the warning since we seem to
> > support operations without it.
> 
> But that's what I have done, i.e. removed the warning as well.

Well, what can I say, -ENOCOFFEE.
> 
> So, if there are no other concerns than inverted value, I'll send v2.

Yes, please.

-- 
Dmitry
