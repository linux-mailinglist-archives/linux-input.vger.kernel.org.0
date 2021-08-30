Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55B793FB6DA
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 15:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbhH3NSk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 09:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhH3NSk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 09:18:40 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDE17C061575
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 06:17:46 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id ay33so15475118qkb.10
        for <linux-input@vger.kernel.org>; Mon, 30 Aug 2021 06:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mZD5WdCmQy5NfKSZ0eTsTvF8nFDqRxp0V0+luWRyj9k=;
        b=M+T5pzl6leAdOpTuMn8+NzADhV/YT2PwPGvQNNGz2y7veRV9xaH7fJZ6sFD0E6bpNz
         A0ESLFxLvnz0dbv4eAiguiPacmm7PtywkEZ4LfEElhvSREHkpDu8Bwd4+rUIeviDBbX8
         QXuAfYHJK7ZRdrWt5fFcp6EGDvM92JsBEqqZ+RV0d9dRp2PIYUPi8L1NMUoczYCEnx8x
         XvBQVVH8KlT0hGjr07lX3SXiyaZN3Xrcuz44wcigwK/d+A2FWjF/PT1qUFL2/XIWPJMB
         sBdUSHtyCNmBNCZlaXjB0tyIVqxZ+Oc4F1ZsIRh/wnw8DAYJ0PNbb3X6cJ3l9bjonm3e
         nQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mZD5WdCmQy5NfKSZ0eTsTvF8nFDqRxp0V0+luWRyj9k=;
        b=TMAWOfN1NRq5cc8bgYGIcSMR/l8Sh5ZY+KrT15XZFECxd7lex53WTMjqZJXbByfi+Y
         jKL2TDnhsz37RWONTooY3FAl/JYwJYF/zch/W2cP/1yOkufiDUEM9gFJzTxlZAxSz9zm
         Aep4d6zANF+DJbcxjAq7OE/96GkfiWoOj8xFwFFdCa6jlZsSxUCTBLY24rOkeiF7Zicb
         0p8ucF8p/x3G8rg+fKbc1NZZqfSlw1hgTfJMMjYey1CuuT1gBfbjmki5wRFbsvF1cFGb
         2dRAxpRPXVePzL35mzCAzmg2SkhbcLB5Mbn+hjM+qG8Admj6TiYugZT+u0ylP8sMUpPr
         Y+JQ==
X-Gm-Message-State: AOAM533Xkev5JVT5gZUe4DVeYslxFdnHKh+l6Zf2VrfTLHVSnjFn7c/N
        96YpFnrYQoP2KJhh8/AppyjLNiYTPY+8LKntX7I=
X-Google-Smtp-Source: ABdhPJwEAbukUumnJTjTsuU1RxiB6Dz/LiG5nOypxF+AhX69rn4oi6Yf8tAYQTR+5Rr7oTDYsBE2tDkYVQ2BoI4+sa0=
X-Received: by 2002:a05:620a:6b3:: with SMTP id i19mr22895006qkh.74.1630329466072;
 Mon, 30 Aug 2021 06:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210818152743.163929-1-tobias.junghans@inhub.de>
 <3135482.aeNJFYEL58@306e6e011c15> <CALUj-gt65tjukmJpuqQL5_L7MgewUmstp68MhuSa53FCaf1Few@mail.gmail.com>
 <3382390.V25eIC5XRa@306e6e011c15>
In-Reply-To: <3382390.V25eIC5XRa@306e6e011c15>
From:   rishi gupta <gupt21@gmail.com>
Date:   Mon, 30 Aug 2021 18:47:34 +0530
Message-ID: <CALUj-gvwPJW6qND7_8eBPLjdXe9OienMeSNu7zAgq6Q-YEitiQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: mcp2221: configure GP pins for GPIO function
To:     Tobias Junghans <tobias.junghans@inhub.de>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

By mistake during development it may happen or a rogue application can
knowingly play with our hardware (commercial product may be
vulnerable). What are your thoughts?

-Rishi

On Mon, Aug 30, 2021 at 6:39 PM Tobias Junghans
<tobias.junghans@inhub.de> wrote:
>
> Hi Rishi,
>
> thank you for your questions. I agree with you that one usually would
> reprogram the flash when manufacturing commercial products. However there's not
> always the need to do so if things can be done in software as well. The code
> will do no harm since a GPIO line initially is configured as input
> (MCP2221_GP_GPIO_DIR_IN) when being requested. Like with any other GPIO
> (driver), it's up to the user to take care of not configuring both ends as
> outputs with conflicting pull downs/ups or logic levels. Also the driver's
> default behaviour remains unchanged, i.e. it will not change the GP pin config
> unless requested explicitly.
>
> So all the proposed patch does it is to make the GPIO functions work as
> expected OOTB when explicitly controlling them with the appropriate tools or
> interfaces (libgpiod/sysfs).
>
> Best regards
>
> Tobias
>
>
> > Hi Tobias,
> >
> > To me it sounds like we are discussing about commercial product
> > (predefined internal flash fw) v/s prototype (we want to play with
> > settings at runtime with ease).
> >
> > Let us assume a GPx pin is configured as input and pulled up in
> > hardware board originally. A microcontroller's GPIO is configured as
> > output and connected to this GPx on MCP2221.
> > MCP2221 (GPx, input, pulled up) <----------- (output, no pull up/down)
> > STM32 Microcontroller
> >
> > 1. The STM32 Microcontroller drives this pin and set it to logic low
> > 2. Driver using this patch configure this GPIO on mcp2221 end as
> > output and drives it to logic high
> > It is like two devices trying to drive same (physical wire) GPIO pin
> > at the same time. How we plan to handle this.
> >
> > Will the GPx side will fuse or malfunction because of infinite current flow
> > ?
> >
> > Regards,
> > Rishi
>
>
