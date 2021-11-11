Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E68344D52C
	for <lists+linux-input@lfdr.de>; Thu, 11 Nov 2021 11:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbhKKKnH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Nov 2021 05:43:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232944AbhKKKnH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Nov 2021 05:43:07 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F217C061766
        for <linux-input@vger.kernel.org>; Thu, 11 Nov 2021 02:40:17 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id b40so13112891lfv.10
        for <linux-input@vger.kernel.org>; Thu, 11 Nov 2021 02:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9tIx/igNKPYVIrwndCggjgpScM833Y4RL5Ah+VgOguU=;
        b=DimTsruqEQMoF6afspPb/WQy4ew0Vd3WE4uUd9Bcq6kQ2kby/N9oSKkMx/WMc8aGMF
         lwfmDXtMz9QmQrtpJWlpZS3P/k1+l+TZBhAQYqLvKU5kDenjkHerHRNJ+QBwFVchbM1k
         k+dnVSZzel1b8uFhnDZaSpoUvsn/fhz+g+uPEiOAXXlyO+wID55gcsp1B5dR4IX5xpFD
         +d3d2wGMf7NF2U6Sno4QqHQ0aYuF9ihzOhbwe9R2bjIxPn7ETuRf19qjThfxDYUQuBFW
         f/wiamhlhi0xgGf2ncaD5yvplDL/3Z7wmkTVSs0ea8ByocaxleBny0xsujWZTfWtyIks
         csEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9tIx/igNKPYVIrwndCggjgpScM833Y4RL5Ah+VgOguU=;
        b=PgUKNpjPoN+ZUvnzwNokMafuBjpUyzsv7fXxNXM4qZ//xGQBr80deraP/I12YbN1RK
         MXoMx93pI1NbJ3J5CYY1GFKD624WC+H/d22Me8CMSi5dhyWFOalVG8deKw6nBHbEEjVK
         PmUFFv/Pjsa9UPoeoIcolz1FO7cWpcFnAVJ1aLkC8bPCByQ6ctmGwksca8LzhvPsBYzd
         IfFcr/lLg70ItzU7xH/3aXaugs0SDWY+mJkIxkiks/fDMyEOeca7Uk/QgJd+JZg1Xo42
         hqXnE6ft8q57HKfGwQgg8n5ClBWZFfX/9T83oCjb6GvyL/29hFZC+UmxluanDsLWJDhT
         3b+A==
X-Gm-Message-State: AOAM533XUGJbFA8i58aMqKppecO4Ia6fioY3LPG1ndGLdCC8cHEZn8W6
        G5ZR2xt4jkBQbUrsZzzUt2TYb4CFMxUQU/zQlzIlWg==
X-Google-Smtp-Source: ABdhPJxxMnc/++Ejn4mwaEgWk7yDts/ov3C1q1UFglFDJR1j83ZeQbo+BIoKTPuhhKDDvw47Oef3D/aDqV3Dz4XMJgU=
X-Received: by 2002:a05:6512:2305:: with SMTP id o5mr5308056lfu.362.1636627215652;
 Thu, 11 Nov 2021 02:40:15 -0800 (PST)
MIME-Version: 1.0
References: <20211027181350.91630-1-nikita@trvn.ru> <CACRpkda_EM9mXuJdrZcpFaJCKF1UDgXkfdxkaniyXFHFd_7+Pw@mail.gmail.com>
 <ec9185459dbc0e95dc2f2cdf27baa0f6@trvn.ru>
In-Reply-To: <ec9185459dbc0e95dc2f2cdf27baa0f6@trvn.ru>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Nov 2021 11:40:04 +0100
Message-ID: <CACRpkdbp6udtBsDHkLmCivRcxCCCbMcGu5z41HVgMpLkPCkLGA@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add touch-keys support to the Zinitix touch driver
To:     Nikita Travkin <nikita@trvn.ru>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        Michael.Srba@seznam.cz, broonie@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 9, 2021 at 4:23 PM Nikita Travkin <nikita@trvn.ru> wrote:
> [Me]
> > Have you notices some behaviour like surplus touch events
> > (like many press/release events fall through to the UI)
> > when using this driver? I think it might need some z fuzzing
> > but I am not sure.
> >
>
> On my device (8 inch tablet with BT532) I saw no problems with touch
> so far. However another person with a different tablet (10 inch with
> ZT7554)
> indeed says that they notice "multiplied" touches that make typing hard
> so maybe that depends on controller model/firmware...

It may even be depending on specimen. I saw that the vendor driver
does contain some debouncing code.

> And speaking of that ZT7554: Seems like it's works with the driver
> and I'd like to add the compatible for it in v2 but I'd also have to add
> it to the bindings. Looking at how you add all other similar names for BT*
> there does it make sense to add ZT* as well?

Yeah probably, if they are electrically very similar.

> Maybe you have some hints where
> to look for a list of the models?

I usually google ... try to find things like powerpoints with roadmaps
from the vendor and things like that. Best thing is if they answer
to mail but I don't know if Zinitix are even around anymore.

> I've noticed a yet another quirky issue with the touch controller:
> At least on my device, for some reason enabling touchkeys changes the
> way the
> controller reports the finger touch events which breaks multi-touch...
> Assuming that *not* enabling the touchkeys leads to calibration being
> wrong
> (controller assigns the touchkey sense lines to the touch area in that
> case)
> I now have to resolve this quirk as well...

Hm yeah I guess refer to the (messy) vendor driver for hints.

Yours,
Linus Walleij
