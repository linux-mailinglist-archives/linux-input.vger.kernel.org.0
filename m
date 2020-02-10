Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33777157B4B
	for <lists+linux-input@lfdr.de>; Mon, 10 Feb 2020 14:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728420AbgBJN3G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Feb 2020 08:29:06 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46832 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731252AbgBJN2z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Feb 2020 08:28:55 -0500
Received: by mail-lj1-f196.google.com with SMTP id x14so7102006ljd.13
        for <linux-input@vger.kernel.org>; Mon, 10 Feb 2020 05:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GL95utwxmEArT7vI8ObsI7B11hY/zujvM5ThMP8bEas=;
        b=HlTnbr39ioZad7NdEVerZKdWDhH/IBPgLX8Ypzeu1N2Op81pMcwCT4CTm5aaB9WqUa
         MyiDoeQBRmPEwZu6AWC794yi37MaZu3CHMuH6F3e2xoocV+bwPEypel8RE3yNje41AO3
         3jJ/QlpjUmRMHTZKhuVJZtw9IVOvNyH4HxOLIa+feoFA3VgLqw0TQk72i9VjCIe0fXDS
         ugOuO9zQIxDghuvv6OC1DdprRzs1+iJ4+9xARK75BDuvyDMhHr67Hz5ZskSLRolx9T3J
         Vv82IQyIevp24q2eSZrKim/vlmmjdxkq1PiSmD44kkC5QVuVAJGMIhHCCg2MikVe0rl4
         tF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GL95utwxmEArT7vI8ObsI7B11hY/zujvM5ThMP8bEas=;
        b=sorsYJbhstaSUS9ghdvwfHwRDvCIYWSYoQUoKF8ucsGOcuR3I8VyZZ6TB4yA6B5/Gi
         6xcWZxg1hXPtGgtzAszXnaQ40tBkNghE3U0SshyHjuegC3hYu8Cog80Siv7QMx+ehbot
         moV/GdWw14O/9xD4zioadG0McCb8Aw2DXSR3JezgIteKl69vicThaBswG9JJYbdNmYFO
         656lLTNoDfCkXll3Gd64EPapQHPYZ8mw08sF8c637OF44Me1nLqYW4Qk1Yvt+PEMsOft
         fFh292pX0Cqa07DpE4lNXwIq43c3dWjFdFyEtjWkg2T5dvsqY1xlfRM5slP6Q98eDd1P
         IUDg==
X-Gm-Message-State: APjAAAURyvGELvCFRuk/SvWmN8C/owcyweruvwlANlILJmEOdpVXmplF
        V4whG34Kf7fbjpRW2e3AZRuGOT1WgBLHLGMcYWGCxg==
X-Google-Smtp-Source: APXvYqx0p2nrbVo5AE5n9t4ataK9s2DOHbeNllX/3kCHrlwuBIv1GbKOC7KgB2bEf7PQBc9a6S9oI5MyOiyyrHGK9OI=
X-Received: by 2002:a2e:9013:: with SMTP id h19mr958186ljg.223.1581341333553;
 Mon, 10 Feb 2020 05:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20200208123359.396-1-linus.walleij@linaro.org> <74ab4b7b-eae2-0c6f-bb4a-eabbd3b4d042@gmail.com>
In-Reply-To: <74ab4b7b-eae2-0c6f-bb4a-eabbd3b4d042@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 10 Feb 2020 14:28:42 +0100
Message-ID: <CACRpkdau3ei4OXcpucctxKqb7baHsMf8a0Q6sQ4P=gOf=bxQ5A@mail.gmail.com>
Subject: Re: [PATCH] RFT: iio: gp2ap002: Replace LUT with math
To:     Gregor Riepl <onitake@gmail.com>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Linux Input <linux-input@vger.kernel.org>,
        Jonathan Bakker <xc-racer2@live.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Feb 9, 2020 at 11:27 AM Gregor Riepl <onitake@gmail.com> wrote:

> > -     for (i = 0; i < ARRAY_SIZE(gp2ap002_illuminance_table) - 1; i++) {
> > -             ill1 = &gp2ap002_illuminance_table[i];
> > -             ill2 = &gp2ap002_illuminance_table[i + 1];
> > -
> > -             if (res > ill2->curr)
> > -                     continue;
> > -             if ((res <= ill1->curr) && (res >= ill2->curr))
> > -                     break;
>
> That seems like a really, really contrived way to do a table lookup.
(...)
> And since res is linear, interpolation won't even be needed.

Sorry for my quick hack, patches welcome ;)

> > +     lux = int_pow(10, (res/10));
> > +     if (lux > INT_MAX) {
> > +             dev_err(gp2ap002->dev, "lux overflow, capped\n");
> > +             lux = INT_MAX;
> >       }
>
> This is certainly better, but I wonder if it's worth the computational cost.

We don't do this much so certainly the linecount shrink is
worth it.

> Also: It looks like int_pow doesn't saturate, so even though it uses 64bit
> integer math, it might be better to move the range check before the calculation.

How do you mean I should be doing that without actually
doing the power calculation? (Maybe a dumb question but
math was never my best subject.)

Yours,
Linus Walleij
