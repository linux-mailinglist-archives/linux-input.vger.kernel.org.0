Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC2F3EAFD4
	for <lists+linux-input@lfdr.de>; Fri, 13 Aug 2021 08:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238771AbhHMGBO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Aug 2021 02:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238766AbhHMGBN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Aug 2021 02:01:13 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A053C061756;
        Thu, 12 Aug 2021 23:00:47 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id z128so16750092ybc.10;
        Thu, 12 Aug 2021 23:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gZZX1SNwCRBnn0U8Sid0RbkcxFib76QfV6XCZITDmnY=;
        b=om4mEgwIV25ngYdR6U9NqzIcVjXBL1duBcEy+NFwUedW4/5IQ/StArjOpVlqjZ684Z
         I2EGKq6ZspEq15DPR1qnmRKGrcggRrj4lZUMwKj4FhI1suruJ5WLZI8b9VjTZmbF2wXP
         Fej46wrc/t4wWAbFM3uvVVlfwIK9uE6PNLCugpYVNzUUdOoYJ3PrIKHLcx7H0yjY3f7m
         uHxpR6XcfnmBS5sVUxIbAtSVJY08KU+XO8RenMbTxSMXaCYB2gtWkdWQGPDE58tQQcSv
         trt9P+/8eDuN5Yhy7LDokZ3NHJvEoQD6R0yf78u4fYieyO3qyEefPkuxm8plyE0G1tg4
         e8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gZZX1SNwCRBnn0U8Sid0RbkcxFib76QfV6XCZITDmnY=;
        b=WfYoXZ5erNy/1asROjxraNb8kbbqaq64YQk2vnXaFaLS206M/eSZBPWoxX0bpdiacq
         0fOpJ4TqkK0NHfYuQBd4i5v2JbIt7PFeI3jdJViTxJezOpKRXWrTqVnherPqeMdMr2Gz
         G0CfBEbILbSR0+QJgKFb60OFnxnIceaLdRimkW5JLQiE+C6tMk4g0zktCyhodJm/C0T4
         8pHm+0EkJ+VwQlACBm1CxFel9dd1aM09hxPE06rwAQXezCGjVx5cd77/z0KUXDO70x65
         inI7T+XANgAqF2Z2YKsK4syKetoSgpP947YN9aeSMpvfQ7xtOWG9IdpW1oKEArpJ5nxS
         /oMw==
X-Gm-Message-State: AOAM530hUmYu6kuOb/j/nwERjZau3nKMqREt4CYxHDDnj+vIif/PkOZC
        TN6qTkrJM26qUnK+5rzhOX5Uco5MGgv0xfwttPI=
X-Google-Smtp-Source: ABdhPJwIv3gKu0b6gimf0i6fuzjyyNpCjIHJtjlErgwrcyE7I29Ro5o6YZFDUmafGwak+DdTcS/UAAMaEuzVttX4nVA=
X-Received: by 2002:a25:1056:: with SMTP id 83mr958088ybq.52.1628834446559;
 Thu, 12 Aug 2021 23:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210602061253.5747-1-roderick@gaikai.com> <20210602061253.5747-3-roderick@gaikai.com>
 <nycvar.YFH.7.76.2106241525330.18969@cbobk.fhfr.pm> <20210803221055.GA32527@amd>
 <CAEc3jaAoDfJD92q9q_HoFq3nsjkDqfZHu-VO+Ei8xSP8QrE8rg@mail.gmail.com>
In-Reply-To: <CAEc3jaAoDfJD92q9q_HoFq3nsjkDqfZHu-VO+Ei8xSP8QrE8rg@mail.gmail.com>
From:   Daniel Ogorchock <djogorchock@gmail.com>
Date:   Fri, 13 Aug 2021 02:00:35 -0400
Message-ID: <CAEVj2tkfLjWKOaecY7t-idGaqjZ45wXhmjbUR87AoC2Dkm45vQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs for
 game controllers.
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick@gaikai.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        linux-leds@vger.kernel.org,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Roderick Colenbrander <thunderbird2k@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Pavel,

Do you have any recommendations on what would be an appropriate
function string for player indicator LEDs? Would some variant such as:
  "status-x"
  "player-status-x"
  "indicator-x"
  "player-indicator-x"
be more suitable? It looks like the string "status" has been used for
other existing LED names.

I think we are pretty happy to use whatever naming scheme fits the
standards of the led subsystem's userspace api for the Nintendo/Sony
HID drivers, and any future game controller drivers featuring player
LEDs could conform to that going forward.

Thanks,
Daniel

On Tue, Aug 3, 2021 at 7:30 PM Roderick Colenbrander
<thunderbird2k@gmail.com> wrote:
>
> Hi Pavel,
>
> See some quick comments inline.
>
> On Tue, Aug 3, 2021 at 3:39 PM Pavel Machek <pavel@ucw.cz> wrote:
> >
> > Hi!
> >
> > > > From: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > > >
> > > > Player LEDs are commonly found on game controllers from Nintendo and Sony
> > > > to indicate a player ID across a number of LEDs. For example, "Player 2"
> > > > might be indicated as "-x--" on a device with 4 LEDs where "x" means on.
> > > >
> > > > This patch introduces a new LED_FUNCTION_PLAYER to properly indicate
> > > > player LEDs from the kernel. Until now there was no good standard, which
> > > > resulted in inconsistent behavior across xpad, hid-sony, hid-wiimote and
> > > > other drivers. Moving forward new drivers should use LED_FUNCTION_PLAYER.
> > > >
> > > > Note: management of Player IDs is left to user space, though a kernel
> > > > driver may pick a default value.
> > > >
> > > > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > > > ---
> > > >  include/dt-bindings/leds/common.h | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
> > > > index 52b619d44ba2..94999c250e4d 100644
> > > > --- a/include/dt-bindings/leds/common.h
> > > > +++ b/include/dt-bindings/leds/common.h
> > > > @@ -60,6 +60,9 @@
> > > >  #define LED_FUNCTION_MICMUTE "micmute"
> > > >  #define LED_FUNCTION_MUTE "mute"
> > > >
> > > > +/* Used for player LEDs as found on game controllers from e.g. Nintendo, Sony. */
> > > > +#define LED_FUNCTION_PLAYER "player"
> > > > +
> > > >  /* Miscelleaus functions. Use functions above if you can. */
> > > >  #define LED_FUNCTION_ACTIVITY "activity"
> > > >  #define LED_FUNCTION_ALARM "alarm"
> > >
> > > Pavel, can I please get your Ack on this one, so that I can take it with
> > > the rest of the series?
> >
> > I'm sorry for delays.
> >
> > But no, player is not suitable function. Function would be "player1"
> > AFAICT, right?
>
> A given gaming device such as Sony or Nintendo controllers have a
> multiple of these LEDs, which are meant to be configured with a player
> number. A typical device has like 4 of these LEDs, so a single
> controller would have: "player-1", "player-2", "player-3" and
> "player-4". It is up to userspace to configure the player number (a
> driver may set a default number across a number of LEDs).
>
> If player is not the right term (many people know it), what would it be?
>
> >
> > I'm not sure "function" is suitable here, and we may want to create
> > documentation like this... where it would be explained which functions
> > apply to which devices and what they actually mean.
> >
> > Best regards,
> >                                                                 Pavel
> >
> > -*- org -*-
> >
> > It is somehow important to provide consistent interface to the
> > userland. LED devices have one problem there, and that is naming of
> > directories in /sys/class/leds. It would be nice if userland would
> > just know right "name" for given LED function, but situation got more
> > complex.
> >
> > Anyway, if backwards compatibility is not an issue, new code should
> > use one of the "good" names from this list, and you should extend the
> > list where applicable.
> >
> > Bad names are listed, too; in case you are writing application that
> > wants to use particular feature, you should probe for good name, first,
> > but then try the bad ones, too.
> >
> > * Keyboards
> >
> > Good: "input*:*:capslock"
> > Good: "input*:*:scrolllock"
> > Good: "input*:*:numlock"
> > Bad: "shift-key-light" (Motorola Droid 4, capslock)
> >
> > Set of common keyboard LEDs, going back to PC AT or so.
> >
> > Good: "platform::kbd_backlight"
> > Bad: "tpacpi::thinklight" (IBM/Lenovo Thinkpads)
> > Bad: "lp5523:kb{1,2,3,4,5,6}" (Nokia N900)
> >
> > Frontlight/backlight of main keyboard.
> >
> > Bad: "button-backlight" (Motorola Droid 4)
> >
> > Some phones have touch buttons below screen; it is different from main
> > keyboard. And this is their backlight.
> >
> > * Sound subsystem
> >
> > Good: "platform:*:mute"
> > Good: "platform:*:micmute"
> >
> > LEDs on notebook body, indicating that sound input / output is muted.
> >
> > * System notification
> >
> > Good: "status-led:{red,green,blue}" (Motorola Droid 4)
> > Bad: "lp5523:{r,g,b}" (Nokia N900)
> >
> > Phones usually have multi-color status LED.
> >
> > * Power management
> >
> > Good: "platform:*:charging" (allwinner sun50i)
> >
> > * Screen
> >
> > Good: ":backlight" (Motorola Droid 4)
> >
> >
> > --
> > http://www.livejournal.com/~pavelmachek



-- 
Daniel Ogorchock
