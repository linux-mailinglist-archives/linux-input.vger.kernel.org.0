Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 119DF455C01
	for <lists+linux-input@lfdr.de>; Thu, 18 Nov 2021 13:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344860AbhKRM7S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Nov 2021 07:59:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244640AbhKRM5r (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Nov 2021 07:57:47 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55073C0797BD;
        Thu, 18 Nov 2021 04:52:08 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id x10so7734751ioj.9;
        Thu, 18 Nov 2021 04:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hh6WFJbrjkxar19GKDaTBBspe0IRHAyuOKu9Kp1/cDA=;
        b=NAaZpLeTqNCDp9En3qKeDV5jszC/FGakNoK2ytbCmZW+lejAcmA5cI6Q4fuL4FOYb7
         LRL2Hsem5g57/046Ey+oMb/iF/siq0c1KP7u6LNHjV7A5caPk5/GhZCAkeEhHR4wS4m2
         Eo2AVgLV4/6MjpgndbJvMzcjWJ7rXynYAVJ668HrIGTlPijmRCI8II8FHwRebickVqO+
         VsULr0vxbzChoMLpscGhjanlIhUzyGw2Hieg2cX/jjp4X7TJ5PSuDTg8uNFLKOOFDjrp
         FJjGNL2TqAj3ASsKORgfKNqDlxE7UnhiRUhWD9sRf8kNEli66/xHyVFYV/kOehOetaws
         Bqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hh6WFJbrjkxar19GKDaTBBspe0IRHAyuOKu9Kp1/cDA=;
        b=g9bouWw28NpsMCpdAZI/ze1Rug6OeZyrSt/ItwRtzOKWw0eNf4Qjay0Aq571OJtpOP
         t4mFC8oXK/lgSzBHXcjEFENNAUa2CyosxLuYIdXhfkqjwyPOwPxgzMdeWqqN9P3c5i+5
         e6WXcKzqnQgZNHoz7a9Fb0UQlA/6hCZgyjELsxPHc4Z/fuptyNSDg1odeYRuElLTuzsU
         k4BCW+bj2p00nzWGQU7Y6mg8LVMPWmvfS7J+z/OArLe0D8EZnH2zP1xCWYQivfhJEnnp
         VIxKaWuA2Qaqm3wnoULMvxeGz9Iqk0oYlhw9Zfbv1cDje5me5MqRSsB1kLEYhXQ4UvnV
         NrZw==
X-Gm-Message-State: AOAM530z5plKpCBOtzE/lb4o0G1yTowQ4/MfWJ4dhADjEbcAxoe4cPmc
        ov5VOp/hxGB93dBIp85a43JAtDLISfwqFt40C/d2pw+KZPTYONgC
X-Google-Smtp-Source: ABdhPJx5EhnYWpEZOUik32wYJq838uTveeLUrceUgABJecPHCC8kS5Dj+aDby9ceIVI2hoeZIGAm/F7LdcA47MkjDhQ=
X-Received: by 2002:a05:6602:204e:: with SMTP id z14mr17452585iod.90.1637239927727;
 Thu, 18 Nov 2021 04:52:07 -0800 (PST)
MIME-Version: 1.0
References: <20211103114830.62711-1-alistair@alistair23.me>
 <20211103114830.62711-3-alistair@alistair23.me> <20211105152154.20f5cbd1@aktux>
 <CAKmqyKNx00ecsAyOjtLk8i6r75WD0uw=nd=fd9z44yBuau+Vdw@mail.gmail.com>
 <20211110183654.61328998@kemnade.info> <CACRpkdbrf8a7B-J=3s9x7JCyGgDk9VcsTd_-9o484MtfapVzHQ@mail.gmail.com>
In-Reply-To: <CACRpkdbrf8a7B-J=3s9x7JCyGgDk9VcsTd_-9o484MtfapVzHQ@mail.gmail.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Thu, 18 Nov 2021 22:51:41 +1000
Message-ID: <CAKmqyKPOGyY3=1vJH50h=qfRfwFgMZAM1U+T1nKnSBk5WGyd6w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] Documentation: DT: bindings: input: Add
 documentation for cyttsp5
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andreas Kemnade <andreas@kemnade.info>,
        Alistair Francis <alistair@alistair23.me>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mylene Josserand <mylene.josserand@free-electrons.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 12, 2021 at 1:16 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Nov 10, 2021 at 6:37 PM Andreas Kemnade <andreas@kemnade.info> wrote:
> > Alistair Francis <alistair23@gmail.com> wrote:
>
> > You have a kind of double inversion here, so things are automagically fixed.
> > IMHO to describe it correctly would be to set GPIO_ACTIVE_LOW here
> > and in the driver
> >
> >         /* Reset the gpio to be in a reset state */
> >         ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> >         if (IS_ERR(ts->reset_gpio)) {
> >                 rc = PTR_ERR(ts->reset_gpio);
> >                 dev_err(dev, "Failed to request reset gpio, error %d\n", rc);
> >                 return rc;
> >         }
> >         gpiod_set_value(ts->reset_gpio, 0);
> >
> > That is the way how other active-low reset lines are handled.
>
> Correct.
>
> This is a source of confusion, I contemplated just changing the name
> of GPIOD_OUT_HIGH to GPIOD_OUT_ASSERTED etc to indicate
> what is going on.
>
> gpiod_set_value(ts->reset_gpio, 0) should similarly be interpreted
> as "de-assert this line" no matter the polarity.

Thanks! I have fixed this

Alistair

>
> Yours,
> Linus Walleij
