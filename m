Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F300272F8FA
	for <lists+linux-input@lfdr.de>; Wed, 14 Jun 2023 11:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243949AbjFNJYh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Jun 2023 05:24:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243948AbjFNJYg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Jun 2023 05:24:36 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1581FE1
        for <linux-input@vger.kernel.org>; Wed, 14 Jun 2023 02:24:34 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-bd20beffda6so451127276.1
        for <linux-input@vger.kernel.org>; Wed, 14 Jun 2023 02:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686734673; x=1689326673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDzVk9mbx2ENLo9ymz2uOt/ZtkFOrIJEhlU5orTbleQ=;
        b=sde83aXm1cl1eZQWPUv7ef+5jywB0AT6IWQ30gacpvABRNtKMw94Dd7ZMWzR0lgost
         qw01q9JSxV4mezvX0Yp7sZ3hCGOdmxZIegCf26C+2vIK/8TapigQviaNwjGraNAhDioP
         cs0CyUcn34b3U5AkmyftkpDQP2fcRyavmf/WwK8aISCf1tYuzB9cJY/+mwuh0b8qedYw
         31tM/L+CLjRjwmKsq4smKSDTNFlWItQqQVbIfFd0XY5fFdCnjxV4QIv8QlRuDk7wDeXu
         Fwx9Ls7qlw2G2P1Rjh7dFNYIPazvD3lYTSeZtOhsylmAM4nkmhhbkOS5AH8NVk7+JIpm
         suMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734673; x=1689326673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDzVk9mbx2ENLo9ymz2uOt/ZtkFOrIJEhlU5orTbleQ=;
        b=A6i7cz5oJdYSC7kGqYScQn9wmSwJQ9Iqdm24LFRJ3cfci4W9Fx+1saB2wigPWTRgW0
         pgPuhORojdq8Nq9X/W2yCtM1+muNbWISq/XAkW8rl4/OAiq0QV+3GK4tB6udXJvW5gIO
         0G++kMAfm+2cZ7vYIP4de8pcscUVUyAEwi9mOF8/sJ0enK0aV6J4MzjaJQ8A3Dyowyca
         6a6cbxjuxsKZdraSiQdvtVOAvd8Co9ml4em1sMp/mLItexaTLGTZzjLVCeupJL2mS3zh
         Mw/XeoGopItzyEf4YhGFlw/OgWrUAXvUJJ4ktIVhJ1b96lmHYc3nMlCBLIcoNT6w88Xv
         bz8w==
X-Gm-Message-State: AC+VfDzsW1XlouJRCk2yt43URSEKxoGnT37kIhwrzSyTsMZjp4L3o5S1
        tgixPkC1EEN/YDiUmHkHC67kreC2467xt1sh3a06EQ==
X-Google-Smtp-Source: ACHHUZ7ApgUjIZxAaCm6dCl2/94Zm+UeRt4nf60jMnzsYw3Wof9X0HlPJvyEK0yKlgwJP9KALU4KI90KVetUMvCV1OY=
X-Received: by 2002:a25:bcd1:0:b0:b8f:5639:cb8a with SMTP id
 l17-20020a25bcd1000000b00b8f5639cb8amr1603329ybm.9.1686734672948; Wed, 14 Jun
 2023 02:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230430-nokia770-regression-v4-0-9b6dc5536b17@linaro.org>
 <20230430-nokia770-regression-v4-2-9b6dc5536b17@linaro.org> <CAFwpezXJkXRr0Es=owr6fJ8BB_DETYPWdj_EzLbw9+5d7YOxxQ@mail.gmail.com>
In-Reply-To: <CAFwpezXJkXRr0Es=owr6fJ8BB_DETYPWdj_EzLbw9+5d7YOxxQ@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Jun 2023 11:24:21 +0200
Message-ID: <CACRpkdbwpWn4h+yBkwosrZjoCw_uoh58yFJFE=JLKXocT0uEjA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] ARM/mmc: Convert old mmci-omap to GPIO descriptors
To:     Peter Vasil <petervasil@gmail.com>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andreas Kemnade <andreas@kemnade.info>,
        Helge Deller <deller@gmx.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-input@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 14, 2023 at 10:44=E2=80=AFAM Peter Vasil <petervasil@gmail.com>=
 wrote:
> On Mon, May 8, 2023 at 11:21=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:

> > +static struct gpiod_lookup_table nokia810_mmc_gpio_table =3D {
> > +       .dev_id =3D "mmci-omap",
> > +       .table =3D {
> > +               /* Slot index 1, VSD power, GPIO 23 */
> > +               GPIO_LOOKUP_IDX("gpio-16-31", 7,
> > +                               "vsd", 1, GPIO_ACTIVE_HIGH),
>
> Hello everyone,
> not sure if anyone noticed this already, or if I understand it
> wrong... shouldn't the "vsd" name in following lookup descriptor
> actually be "vio"?
>
> > +               /* Slot index 1, VIO power, GPIO 9 */
> > +               GPIO_LOOKUP_IDX("gpio-0-15", 9,
> > +                               "vsd", 1, GPIO_ACTIVE_HIGH),


Ooops. Copy/paste bug.

I'll send a fix.

Yours,
Linus Walleij
