Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4900D3D2779
	for <lists+linux-input@lfdr.de>; Thu, 22 Jul 2021 18:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbhGVPl5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Jul 2021 11:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbhGVPl5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Jul 2021 11:41:57 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039F2C061575;
        Thu, 22 Jul 2021 09:22:32 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id v189so5310511ybg.3;
        Thu, 22 Jul 2021 09:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dMYf4pzancIK2Asihj8gU3R0yHPVZZfKrlyCz6qtoLE=;
        b=FABhe+DnqSOco/bLTHXW6PTIafMY/Es/tNC1ptu60s7yibz/a6FWgDDDqlFiY4pcaz
         B0iwXgrI6xHLYRM8u9pxwo1QjDAcuesBeWy5GB9z6AeBs/wScXaffJeEt+6A1gnkD9Ad
         a4diqQfhbdlv6gkJy/aHR9DNYY/Ir9cRP7zqlVRAHMIv7MjVozRjeAA1h/eakoZmckS2
         3qHUxBq24J5pzf6LEWfBrK1Dgrvws9ik5nthpiCRTJMhKosM6WXzbXERPxLDDP20fxrl
         w60MR+xgoQo0Rf48i02iWtO9vkeLyXBAZ9a8gyJKJQbDu4wu0q/zRT2ZtIAy9AgAM5Vx
         pFNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dMYf4pzancIK2Asihj8gU3R0yHPVZZfKrlyCz6qtoLE=;
        b=RCwjd+jGurSPS//EWZXBEeW8VTIr35knzR8AFYRumofd6Uzpoi37da2EiztRKDo9q0
         PhPRZ6FoTGvDjXaVvMGkBS5OWdc9d05Le8qi3NXOoQJkH2U68LLecGzQd6hxJr7hX612
         wVw2SC0TE7OdCEBa+nsbkrHUzkEtKeIMmc0S9w8jnvmoenA+8Q1sOWzaDD1pX6Mf83pR
         06Uhj5aQ+jCZafJKrZ+D/HG6iHWeoqqbHURMvFsS0WW85ClfuNyjRd7PbbCWOihT3v+9
         8g0o5HLHJrNpyqFrsfhbqpk2rwnVMuH29GcLL7g/LlQXpvnlqjjui3RtJuObS4wZEu6A
         y2Hg==
X-Gm-Message-State: AOAM533jozQJZe7ie3eAzpgI3AfXnBgXDsXy6OWiWBYluG7mF7221TE7
        XVeZgJC5M7n6+IkIonlzcPYUvRmKX5QWBscAOBY=
X-Google-Smtp-Source: ABdhPJxL54ILaZnBa+H9VZepcZE2c8UfQzbcK76bfjSGkgwgAI3Oy9V4ZqkyCTXNLowehv/1u7EDfmnfuGrFX8j09Qs=
X-Received: by 2002:a25:ada1:: with SMTP id z33mr402873ybi.438.1626970951302;
 Thu, 22 Jul 2021 09:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210602061253.5747-1-roderick@gaikai.com> <20210602061253.5747-3-roderick@gaikai.com>
 <nycvar.YFH.7.76.2106241525330.18969@cbobk.fhfr.pm> <CAEc3jaDN7iHDYD868LeMBSr-zrgGEu7s-_PQgh9ffzgL1BWBtg@mail.gmail.com>
In-Reply-To: <CAEc3jaDN7iHDYD868LeMBSr-zrgGEu7s-_PQgh9ffzgL1BWBtg@mail.gmail.com>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Thu, 22 Jul 2021 09:22:20 -0700
Message-ID: <CAEc3jaDsGGvExn_-p7ybZGwWmQx9cKXgb3cB+fx07AWM+aE5+A@mail.gmail.com>
Subject: Re: [PATCH 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs for
 game controllers.
To:     Jiri Kosina <jikos@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        "Daniel J . Ogorchock" <djogorchock@gmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Pavel,

Any update on this topic?

Thanks,
Roderick

On Mon, Jul 5, 2021 at 9:51 PM Roderick Colenbrander
<thunderbird2k@gmail.com> wrote:
>
> Hi Pavel,
>
> Any feedback on this patch, which introduces a new player led type,
> which is common on game controllers?
>
> Thanks,
> Roderick Colenbrander
>
> On Thu, Jun 24, 2021 at 6:26 AM Jiri Kosina <jikos@kernel.org> wrote:
> >
> > On Tue, 1 Jun 2021, Roderick Colenbrander wrote:
> >
> > > From: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > >
> > > Player LEDs are commonly found on game controllers from Nintendo and Sony
> > > to indicate a player ID across a number of LEDs. For example, "Player 2"
> > > might be indicated as "-x--" on a device with 4 LEDs where "x" means on.
> > >
> > > This patch introduces a new LED_FUNCTION_PLAYER to properly indicate
> > > player LEDs from the kernel. Until now there was no good standard, which
> > > resulted in inconsistent behavior across xpad, hid-sony, hid-wiimote and
> > > other drivers. Moving forward new drivers should use LED_FUNCTION_PLAYER.
> > >
> > > Note: management of Player IDs is left to user space, though a kernel
> > > driver may pick a default value.
> > >
> > > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > > ---
> > >  include/dt-bindings/leds/common.h | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
> > > index 52b619d44ba2..94999c250e4d 100644
> > > --- a/include/dt-bindings/leds/common.h
> > > +++ b/include/dt-bindings/leds/common.h
> > > @@ -60,6 +60,9 @@
> > >  #define LED_FUNCTION_MICMUTE "micmute"
> > >  #define LED_FUNCTION_MUTE "mute"
> > >
> > > +/* Used for player LEDs as found on game controllers from e.g. Nintendo, Sony. */
> > > +#define LED_FUNCTION_PLAYER "player"
> > > +
> > >  /* Miscelleaus functions. Use functions above if you can. */
> > >  #define LED_FUNCTION_ACTIVITY "activity"
> > >  #define LED_FUNCTION_ALARM "alarm"
> >
> > Pavel, can I please get your Ack on this one, so that I can take it with
> > the rest of the series?
> >
> > Thanks,
> >
> > --
> > Jiri Kosina
> > SUSE Labs
> >
