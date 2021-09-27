Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58FD84198E0
	for <lists+linux-input@lfdr.de>; Mon, 27 Sep 2021 18:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235375AbhI0Qbc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Sep 2021 12:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235338AbhI0Qbc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Sep 2021 12:31:32 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C135C061575;
        Mon, 27 Sep 2021 09:29:54 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id m132so5213171ybf.8;
        Mon, 27 Sep 2021 09:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GOt10TfrlORdCOzbujAZfUg8LvCI74MFwT719xp10ic=;
        b=XB40gH412JkfjfPD+P0uEfE5AipnhWoHiXXkwpvWeJ+KNp/8VRNYMRd6QlJlv8Pp/w
         xJOA/QE4GawxruY+DZRgteY8V7SFvIUh8b4Zt2OiKlrhaA7Y0TcJlGkiCUQDtBqsQp6H
         7K/nGECzd7+PUXQ+ZeCGX4wGmjr4veHDJXRmKkyn6fOz81FQO6oUVwTI11TI4+4Js/lp
         n8ZzOXlgwCacI5ky9HUOnZAbVVnMq1sbNs8/NotiFCA3/fIUGkWl7ZoTmg/fmupj8VrV
         fE4WFXN+fM5CYpfWSSVhjTbg6NM9jnz3oR1XdTa6tRkJTpgsKohFOfHZG+rgV2qja3sf
         1HPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GOt10TfrlORdCOzbujAZfUg8LvCI74MFwT719xp10ic=;
        b=LAcHLlLOVAX24+fcSKqkSuQLU/a3ZkEgralY5vimQ+hl6Y7Vx0zfBgjA/t9hdxoH0c
         SY1WaW1vHdPIWnhucC9D0YmsKmOWrb1npX1VsktEHMVW6b0y2ADQpzKm4Y3bAciEYi9c
         ocOLtwHMM6uxJRk+D12Iz2Kf2du98MX5W2xy++94lmcsqT+SO2qpE0Bf2/cb7gKkz/RA
         oQC3DEbXHhCPg7NgYcLzt0zMhgUL/dn/rDWTMLgkEfgyExP7Idzpuvb9K9reaHXB+y20
         A/ON/Rru6S9BjOmD+qDKCFXqn3nrxPD1N+JnR0t7Qm39m3tI/nnr8KIhqwGXWXOIk7a5
         o8+A==
X-Gm-Message-State: AOAM533P70rykH0VrMGA/khta6yZnKBjJDVwrO2KlxZNPZ0bxtHhJYzf
        QWqfp+Jmky4KeYPd1rPBUFB0slmS0/Sy8I8E8tg=
X-Google-Smtp-Source: ABdhPJyeYOrLsxFVI0qtuk+ovYF1d9hsWuDunMTTVlQXSZXcFLwyQpMx9854X2pKqFPdaYe468CSiowJC4PJ4cHLbZk=
X-Received: by 2002:a25:cb4c:: with SMTP id b73mr782765ybg.209.1632760193727;
 Mon, 27 Sep 2021 09:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210908165539.3102929-1-roderick.colenbrander@sony.com>
 <20210908165539.3102929-3-roderick.colenbrander@sony.com> <nycvar.YFH.7.76.2109221150110.15944@cbobk.fhfr.pm>
 <20210927141109.GB5809@duo.ucw.cz>
In-Reply-To: <20210927141109.GB5809@duo.ucw.cz>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Mon, 27 Sep 2021 09:29:42 -0700
Message-ID: <CAEc3jaCxBn=2UU5bDva0mnjhwJpQBwKqmWnyAwFDNjBAV7MBng@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs
 for game controllers.
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick@gaikai.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Pavel,

On Mon, Sep 27, 2021 at 7:12 AM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
> > > Player LEDs are commonly found on game controllers from Nintendo and Sony
> > > to indicate a player ID across a number of LEDs. For example, "Player 2"
> > > might be indicated as "-x--" on a device with 4 LEDs where "x" means on.
> > >
> > > This patch introduces LED_FUNCTION_PLAYER1-5 defines to properly indicate
> > > player LEDs from the kernel. Until now there was no good standard, which
> > > resulted in inconsistent behavior across xpad, hid-sony, hid-wiimote and
> > > other drivers. Moving forward new drivers should use LED_FUNCTION_PLAYERx.
> > >
> > > Note: management of Player IDs is left to user space, though a kernel
> > > driver may pick a default value.
> > >
> > > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > > ---
> > >  Documentation/leds/well-known-leds.txt | 14 ++++++++++++++
> > >  include/dt-bindings/leds/common.h      |  7 +++++++
> > >  2 files changed, 21 insertions(+)
> >
> > Pavel, could you please eventually Ack this, so that I can take it
> > together with the rest?
>
> I'm willing to take Documentation/leds/well-known-leds.txt part
> through LED tree.
>
> I don't like the common.h change; either avoid the define or put it
> into your local header.

If the LED_FUNCTION_PLAYER* defines don't belong in common with the
other LED_FUNCTION* ones, where should it go? The hid-nintendo driver
intends to use the same defines, so defining it local to each driver
isn't right. Not sure if there is a great place in the input system
either (you would then have to move scrolllock and all those other LED
definitions too.)

Thanks,
Roderick


>
> Best regards,
>                                                                 Pavel
> --
> http://www.livejournal.com/~pavelmachek
