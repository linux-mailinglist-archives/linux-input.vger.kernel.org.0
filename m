Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C75113BC5C8
	for <lists+linux-input@lfdr.de>; Tue,  6 Jul 2021 06:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhGFExz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Jul 2021 00:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhGFExz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 6 Jul 2021 00:53:55 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600D7C061574;
        Mon,  5 Jul 2021 21:51:17 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id i4so32387709ybe.2;
        Mon, 05 Jul 2021 21:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ue8wfJArJUiAGRPLhV8O3dxTUdawONUoNb/La0Imkkw=;
        b=JJVzLqXtuUZceC9abhq3EYY1Kk9b29G0f7p5oxDtWlRYJHZmkoy87BQlVKH987qvaz
         C3npaiMjQNO9r0CkxpORfks6+jPpas429+U+lYbHbeFU68BNdlTZJEhKMayTpn3BwGAu
         GRX4v1fM1HK26nJthXlwhQOwW4mDMqUUmkTV3dS7uBvGmFYRW8WT8wrPvf4zwJHTtrtc
         nQzeQOWvOlu8UuORMh8WZb6UocUxpOAf97GUEJ1hAD52pHAJFgiIQNe3BLjO0Fme/Lwu
         vaRqk3VNeCdHPQ3S/D85fFnyk1f37EPCermc5K4jMCKcp3/uaciZCob8Td2rV6/YJtU1
         sviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ue8wfJArJUiAGRPLhV8O3dxTUdawONUoNb/La0Imkkw=;
        b=FWqpwDHcpLmWepeRfIqfA09CpRZ7yfKtqVLzjgv6+5WFeNnQ39bA3xPLGoQsj/5aMW
         QGJ1dkftm8WV5DkiS3UFhfv4cx/N9wyaQM3EDDSxKDNPZPjfLx+sBUJba8hzRtISruJJ
         gGGqgzmBDSaYcOeWJDKEV/4sezDszC7gN1/45EdaZgYbUtzBZVuaHa2e8mMJwLsczOZS
         9SKoV44eKsWdk5vOzxTdYijrJmSWxaQO2lDeAgOGMQ9RLbuSJTepSiZPp9Rz3jPrpZQB
         Wz038EgaLK6MfZD8fw4G/dU+HuNESoc/XY2J3eqs1pWrpDEZhtewkIYwhx3Twm6xZtiF
         mpCQ==
X-Gm-Message-State: AOAM533MudKfCLMs9Hd5WckUTOkf39j6TpIVxunTJBe+IElMpPrZFYMk
        SZeVqdGWOiIeeHU8H0NRXny8ib27cmy78rsuCR0=
X-Google-Smtp-Source: ABdhPJx51J0vU4ZpGr7dv1tMEffEAnRT6PC43l9dJWxu88g8PYQLJqkgwP3ocR5asqB1S4GVzh3G3r5v5bWba+tlJlU=
X-Received: by 2002:a25:dbce:: with SMTP id g197mr17599535ybf.152.1625547076665;
 Mon, 05 Jul 2021 21:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210602061253.5747-1-roderick@gaikai.com> <20210602061253.5747-3-roderick@gaikai.com>
 <nycvar.YFH.7.76.2106241525330.18969@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2106241525330.18969@cbobk.fhfr.pm>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Mon, 5 Jul 2021 21:51:05 -0700
Message-ID: <CAEc3jaDN7iHDYD868LeMBSr-zrgGEu7s-_PQgh9ffzgL1BWBtg@mail.gmail.com>
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

Any feedback on this patch, which introduces a new player led type,
which is common on game controllers?

Thanks,
Roderick Colenbrander

On Thu, Jun 24, 2021 at 6:26 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Tue, 1 Jun 2021, Roderick Colenbrander wrote:
>
> > From: Roderick Colenbrander <roderick.colenbrander@sony.com>
> >
> > Player LEDs are commonly found on game controllers from Nintendo and Sony
> > to indicate a player ID across a number of LEDs. For example, "Player 2"
> > might be indicated as "-x--" on a device with 4 LEDs where "x" means on.
> >
> > This patch introduces a new LED_FUNCTION_PLAYER to properly indicate
> > player LEDs from the kernel. Until now there was no good standard, which
> > resulted in inconsistent behavior across xpad, hid-sony, hid-wiimote and
> > other drivers. Moving forward new drivers should use LED_FUNCTION_PLAYER.
> >
> > Note: management of Player IDs is left to user space, though a kernel
> > driver may pick a default value.
> >
> > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > ---
> >  include/dt-bindings/leds/common.h | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
> > index 52b619d44ba2..94999c250e4d 100644
> > --- a/include/dt-bindings/leds/common.h
> > +++ b/include/dt-bindings/leds/common.h
> > @@ -60,6 +60,9 @@
> >  #define LED_FUNCTION_MICMUTE "micmute"
> >  #define LED_FUNCTION_MUTE "mute"
> >
> > +/* Used for player LEDs as found on game controllers from e.g. Nintendo, Sony. */
> > +#define LED_FUNCTION_PLAYER "player"
> > +
> >  /* Miscelleaus functions. Use functions above if you can. */
> >  #define LED_FUNCTION_ACTIVITY "activity"
> >  #define LED_FUNCTION_ALARM "alarm"
>
> Pavel, can I please get your Ack on this one, so that I can take it with
> the rest of the series?
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>
