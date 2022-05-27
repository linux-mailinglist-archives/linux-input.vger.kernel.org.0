Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9C5536351
	for <lists+linux-input@lfdr.de>; Fri, 27 May 2022 15:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237158AbiE0Nag (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 May 2022 09:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233006AbiE0Naf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 May 2022 09:30:35 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FBA713F90C
        for <linux-input@vger.kernel.org>; Fri, 27 May 2022 06:30:34 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id d2so3938487ybc.12
        for <linux-input@vger.kernel.org>; Fri, 27 May 2022 06:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B7wFhtK6uDprBFfQl4Aeni4Wblda2Qx79xL8geiS8oY=;
        b=qxXnQ7T6ZDa4a1skN3GxePhTWjgS12q1eTcV2DhhbC/0O5dhV7Tn+dWHj1/6fth6KZ
         0Emi8PIZqSKGQTpEoYBaD80aRD2ZhuGy0Mn+1KgpKYJHxf+aXedVdCJo8G7TaNABGbWP
         4vpbzQ/XTrihkoSCBP79OIqphJjbeKrLJpCmndJnQjdBcX+DHBuO3YbznJNC+ICgC3S1
         PhetlFJGPACDm6l+MCb/igZadvvCyM1KS1026yt+isnjpqQhw0mWGMC5/kGWweHy3Giq
         9Om8PaePdm50faoVM8d4T55GKjU7xUi77GkakVEzoi+rVnRErWcDKy2E1RXGP/cqfF3p
         uTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B7wFhtK6uDprBFfQl4Aeni4Wblda2Qx79xL8geiS8oY=;
        b=RQ6V+pEAbBqO7x2gfeaprOnU/3SHYbBK3b+iHcp6bCKjpELmpMdj7pyZfPsTGrUQt5
         CWQIhspGB0gsMDyrSUibfJPiO4Xz+yiFhMZUP68RfregTXNWEg0ya5Ukog4N4mWqUpC1
         3QwGrR63MUnDhSeyi5SV11Hb9xTBAjyxrbUiwWpKOdyx7wzhxX1ucVkDIffzLQUyTnKw
         BE6J4d7gxgKBfszFr+L0f9jJug5j3JQecqQ0JBnWBglrUgU1dxYSuOWR4YMZYkQjRLaU
         S77ToMoAliNcT8ZwaZsdNo2xm/16jAkVKNpK+uvVJvIKFs7wb/gyE+XWw/CadrryYrtc
         7+Jw==
X-Gm-Message-State: AOAM532GUF5qkYHzNcTUmdV+9Stw/cf9JvY8upHiTVwpV2Jh1SyBHlhP
        6AGnBafuQmMyJmUJF5ZF4Ub6x0t01VWTCaj9v/LGb4F1HLE=
X-Google-Smtp-Source: ABdhPJzRJbc/WkY8PUU7TqK5tUREMtuePPPTuGMUi+QdNAQqt9uPL6Q4KNLuYHBl+LzWQbjF0DgDgV71yg9qyoN+gPk=
X-Received: by 2002:a25:aa6f:0:b0:655:8d2d:6088 with SMTP id
 s102-20020a25aa6f000000b006558d2d6088mr13666830ybi.291.1653658233722; Fri, 27
 May 2022 06:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220410120059.2583849-1-linus.walleij@linaro.org> <YpBjatmHD6hZgDGx@google.com>
In-Reply-To: <YpBjatmHD6hZgDGx@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 May 2022 15:30:22 +0200
Message-ID: <CACRpkdbLpjdGaUnCYExJbKYfvTSAVh6Ugvq4bcb_=kOXDXKtKA@mail.gmail.com>
Subject: Re: [PATCH 1/5] Input: zinitix - Helper dev variable in probe()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
        Michael Srba <Michael.Srba@seznam.cz>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 27, 2022 at 7:36 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Sun, Apr 10, 2022 at 02:00:55PM +0200, Linus Walleij wrote:

> > Create a helper variable struct device *dev in probe() to
> > make the code more compact and easier to read.
>
> Actually I wonder if this is a good idea: when just seeing "dev" I often
> have hard time to remember what device we are dealing with, whereas
> "client->dev" gives a very string hint that we are dealing with I2C
> peripheral physical device.

Hm yeah that has a point I suppose.

> Did you observe object code savings from the conversion by chance?

No it is just cognitively easier for me (less characters on the screen)
but that is admittedly a bit of personal preference.

I'll drop this patch, because the subsystem maintainer's taste is
more important than mine.

Yours,
Linus Walleij
