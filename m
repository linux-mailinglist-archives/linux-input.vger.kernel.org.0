Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A650C26BCFA
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 08:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbgIPG0N (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Sep 2020 02:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726180AbgIPG0G (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Sep 2020 02:26:06 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 794BBC06174A;
        Tue, 15 Sep 2020 23:26:04 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id y13so7058402iow.4;
        Tue, 15 Sep 2020 23:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=inU9HQxGgn9zMEqLIuw+Xknjlb1mjmi6s0LN1hojltI=;
        b=bWvDmp+AJNGzNJaYEjPYF6o1W6LB3wQct3PVhNkwW+pe5NusnpquwAOG0HNpcRLqWB
         DSPgxmxdoGl1ezpiy8JKKnn4V7K/bq5iwfic6q9zG2DgCvFW9OEWtlIOlb769xLG/EAJ
         VsN0zYQzxygIAla/JB6RIe8Desom6XNEbshvpGXDMkJzdaBJ6MzKIReL72MsswoLZXQG
         3xCwbQ4R3PPgXvxyqUvGwJPtQ1GSuqgA6aKvjUWT4gDRiofIdSeXr7cZ7ewh62CjQoDx
         2fvTKAFi2cL3WMkgFARRL+hUuE+cRoqe6zz/ukHP3ZaXmrM7sc/BlejdFRHC+Xt9qOos
         hu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=inU9HQxGgn9zMEqLIuw+Xknjlb1mjmi6s0LN1hojltI=;
        b=pwCD97Gvpzh0wu9BbCLfrXMY/LkSIaH2ZBBGDw1OleS+Rd3SfEEXX5Y6NvWkRtLsOb
         +shxVaPmCeU0dArT3BfNTq//Q0/uKcOkaAa8UzPtAbJfrDr85KoVgfYBkRD2BibcWBVS
         FQYQ4p0N2QyZKuHAqRPLqqGp5pE272r+mCRVmGiDn/Fnns/l/cZOlIuFm6aSMxciUWfI
         OFMedEnMGFwvAI4DfhOXrHv9GQTHUH24NaqAaL7yceTsJmPS3G69IxAjHMrJx+XtBt9m
         qQPmbBPIJKKivXUUJdRenNA/bHHZYHOk5LNpOr4hZF4GOdwvNAYuTAXzUJrQodg+zLPA
         QFhQ==
X-Gm-Message-State: AOAM533aYZiBiLBuM91s0aTbzW87UljvAKZUA5V7RkYLFP43CRb0ogEO
        VD1VgwL+Dgitp11mBjFGDDjKp+Gi1aQPC/VOLw0=
X-Google-Smtp-Source: ABdhPJxwlGyDvwij8LhFbiMQh+vooT4nocCqV4pMQ/4rkk73jny7kCtzqYteC36nwmwwY3rkfqIbS/mna/Sf2oJIcDI=
X-Received: by 2002:a02:734f:: with SMTP id a15mr21539888jae.120.1600237563687;
 Tue, 15 Sep 2020 23:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200828145744.3636-1-krzk@kernel.org> <20200828145744.3636-2-krzk@kernel.org>
 <20200916005359.GE1681290@dtor-ws> <CAJKOXPf5kjJitS=7_9wTWMmM4L1TwSnpdhspR9dQXpY2LH1y=g@mail.gmail.com>
In-Reply-To: <CAJKOXPf5kjJitS=7_9wTWMmM4L1TwSnpdhspR9dQXpY2LH1y=g@mail.gmail.com>
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Tue, 15 Sep 2020 23:25:52 -0700
Message-ID: <CAKdAkRQeh7R-AeiPS3C3JmYaK2MSAvtgg=0YxBj9id1otjAGig@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] Input: omap4-keypad - Fix handling of
 platform_get_irq() error
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 15, 2020 at 11:06 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, 16 Sep 2020 at 02:54, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >
> > On Fri, Aug 28, 2020 at 04:57:42PM +0200, Krzysztof Kozlowski wrote:
> > > platform_get_irq() returns -ERRNO on error.  In such case comparison
> > > to 0 would pass the check.
> > >
> > > Fixes: f3a1ba60dbdb ("Input: omap4-keypad - use platform device helpers")
> > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > >
> > > ---
> > >
> > > Changes since v1:
> > > 1. None
> > > ---
> > >  drivers/input/keyboard/omap4-keypad.c | 6 ++----
> > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
> > > index 94c94d7f5155..b075f1af0305 100644
> > > --- a/drivers/input/keyboard/omap4-keypad.c
> > > +++ b/drivers/input/keyboard/omap4-keypad.c
> > > @@ -240,10 +240,8 @@ static int omap4_keypad_probe(struct platform_device *pdev)
> > >       }
> > >
> > >       irq = platform_get_irq(pdev, 0);
> > > -     if (!irq) {
> > > -             dev_err(&pdev->dev, "no keyboard irq assigned\n");
> > > -             return -EINVAL;
> > > -     }
> > > +     if (irq < 0)
> > > +             return -irq;
> >
> > You must have meant just "irq", right?
>
> Damn it, of course. I'll send a v2 for this.

It's fine, I can fix it up locally.

Thanks.

-- 
Dmitry
