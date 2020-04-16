Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17081ACE8B
	for <lists+linux-input@lfdr.de>; Thu, 16 Apr 2020 19:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728863AbgDPRT7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Apr 2020 13:19:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728741AbgDPRT6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Apr 2020 13:19:58 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B772DC061A0F
        for <linux-input@vger.kernel.org>; Thu, 16 Apr 2020 10:19:56 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e25so2182032ljg.5
        for <linux-input@vger.kernel.org>; Thu, 16 Apr 2020 10:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xmgjy0ty5RO8ShykGtS92qM5szeKa7pfy8ZG6OZmBfs=;
        b=mtYFXncU6tDw39rbFA2+QWLItOxC4YgplWiP4MiUaJ6xzioFinv8X6aFBtXS19dxBB
         66OT9EQgpX7njBmYv3h9kc6vi/lxjg/ElUgQXDgpohHEetZ55AI1S8Fy/Tg2ultOayWp
         oURHqvXe/xrBSTZUqTcdB1Wh0jKoqKbtUYTiKY0cFE+WvW6z3LDM7ve+Ed1NyDkn7Y0M
         NYVbpSk2j09PA8stn2qURCsUI8KhXza6zl0hCS1cTBuOMHAeS1xK67jFORs9AC5kiGAp
         5gaDgiLifDkdg6PQiShAp4TFRNKf7XI+c8K203/VSrHvuDJGniOU4rWudi+k2vs0UtrO
         5O6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xmgjy0ty5RO8ShykGtS92qM5szeKa7pfy8ZG6OZmBfs=;
        b=Syl3zAxpTp/RvXpoMVvvCgGU1eeOVnUmY1mFN1O/L9WAd46Ji2S/Z+iLpQSH4WWdyi
         YBHok6z+WLDfB/d8cj3taq/mcZJglbTsPPfGRWMn1qKLr2X2s35LXCvRff9F0iQO49jD
         TWmHJk46vLRInBq6blF3Y9XT2pLZDcMi328kWQwch3Xz5CvlOcv1WxMGS6fUgY1PipOq
         rN16B7zTWva8UOOuWiPVif0yB5YRESWvsCnBMhcRuZzm22F1/J9TcUQLnk1avrxO65es
         uD8WVZ0A4ZvlYoBfiDfbgPzUEspnNLpD78yfF6JKzQLi1AwzDhx1JctgfMuW6Mj+vFQ6
         trWQ==
X-Gm-Message-State: AGi0PuZPFdPgBS6Vo7969G/+vXqdlKK7mNRSV38qb2Bjf/MjBrEk3sgV
        Eq3X7VVrlIPt3LWn+hHvjhmvWmMbNCX2blAve0HQcg==
X-Google-Smtp-Source: APiQypLozgZJM/HTHaYnPJVi/Mw+Ley5k/K1BjqUZ9QmAHQmtUBpjJ5zYF6rkNgMW++kGOXpJaSG6QFhkR2UMRZ9ShA=
X-Received: by 2002:a2e:8805:: with SMTP id x5mr3594739ljh.223.1587057595108;
 Thu, 16 Apr 2020 10:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200416140917.8087-1-linus.walleij@linaro.org>
 <20200416140917.8087-2-linus.walleij@linaro.org> <20200416153200.GA897@gerhold.net>
In-Reply-To: <20200416153200.GA897@gerhold.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 19:19:43 +0200
Message-ID: <CACRpkdY9-QPAVT=WgbsWWzLeB5k-7JWB_YnppqeZ_OHr5kssNw@mail.gmail.com>
Subject: Re: [PATCH 2/2 v2] iio: magnetometer: ak8974: Provide scaling
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        linux-iio <linux-iio@vger.kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Linux Input <linux-input@vger.kernel.org>,
        Nick Reitemeyer <nick.reitemeyer@web.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 16, 2020 at 5:32 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> On Thu, Apr 16, 2020 at 04:09:17PM +0200, Linus Walleij wrote:

> > The manual for the HSCDTD008A gives us a scaling for the
> > three axis as +/- 2.4mT per axis.
>
> I wonder if we can really assume that this applies to
> the other models (e.g. AK8974) as well?

Patches are for testing :D

I have a Ux500 reference board with the AK8974 vanilla
variant mounted so I will check with that one.

> > +     case IIO_CHAN_INFO_SCALE:
> > +             /*
> > +              * The datasheet for HSCDTF008A, page 3 specifies the
> > +              * range of the sensor as +/- 2.4 mT per axis, which corresponds
> > +              * to +/- 2400 uT = +/- 24 Gauss. So 0x7fff is 24 Gauss and
> > +              * 0xffff is -24 Gauss. To account for the one missing value if
> > +              * we multiply by 1/S16_MAX, instead multiply with 2/U16_MAX.
> > +              */
>
> I just want to note that (according to the datasheet), HSCDTD008A
> produces either 14-bit or 15-bit measurements (depending on
> the HSCDTD008A_CTRL4_RANGE bit that we set by default).

Argh OK I will fix this. I try to get an AMI datasheet as well.

> I think this isn't exposed correctly in the AK8974_AXIS_CHANNEL() macro
> (realbits is 16 instead of 15), so this might need special casing for
> hscdt008a?

Yes definately. It's a bug. I'll make a separate patch for this.

> The reason I mention this is because I think it would also affect the
> scaling that you implement here. With 15-bit output it produces values
> from +16383 (0x3fff) (= 2.4 mT?) to -16384 (0xc000) (= -2.4 mT?).
>
> So it would never reach the 0x7fff and 0xffff you mention
> in your comment.

You're right. What I need to do is put the HSCDTD008A and
AK8974 side by side and compare.

Yours,
Linus Walleij
