Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A893DF880
	for <lists+linux-input@lfdr.de>; Wed,  4 Aug 2021 01:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233537AbhHCXaQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Aug 2021 19:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbhHCXaP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Aug 2021 19:30:15 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38398C061757;
        Tue,  3 Aug 2021 16:30:03 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id k65so1243842yba.13;
        Tue, 03 Aug 2021 16:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1eYiH2RIdtTKLskKrOUgOTUIOKC/IGyj6bgmobHtNC0=;
        b=lxwrXA/ypnv5BHVBheuRh18BAUdAIQB9RTBTiidNYxsHHU8eNlN0Vw3awacInCQtED
         hAOm+5UrWoWArPliGs2anIimXLZqOZ/3hhRHKKAMKYsfLF2CrxfuuoxTKz4nFMso+osq
         mE6plNUzsJ75g7VItyC7a+CTaO4MNWP1Uwa6yd+y5eDo4cwIYFDl+W6DzhQi7LezO5tM
         riI0E97oaO+G6eQVz2HPH8wAWpPBy01knTYkWnma0ce2oDdl4hqzdYb5v9aXjjc6cLZS
         sTnH1dlqLytGCFlVei6pbrMCbK+WXCqDL8LYlaaUb78GeZpDJq2Z5ZsdPDB5VIH5pkV0
         5tZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1eYiH2RIdtTKLskKrOUgOTUIOKC/IGyj6bgmobHtNC0=;
        b=LpUYxqnUPjsbpIDli1+2MmAUFbmQ1cN87MGwsWEsh1qAo2orhrUU7/DAmHVYVtUdud
         3+lOE7HvCYCSiiSt3q86HUnQyZFjKDiS0FjJK07L3HEqR2grsxESw/x2LyGnKNUKlQvs
         UvMf7+jFXxBXe3CwQ6Ge91njhPDL1IRhxzYRVWFTN5odrwfZ2ySb1Lt/BiLtbAPZxqji
         hEp7/bFJDSgtwII2d/F64XPwdF7dHHkyuLnEn0JYMvahRDez1pfV8kXohyzK446PIpdQ
         zeK6zD2qP906gSDgi3M9TIi+BpeKDtTUvvAFY2IgH8vJLKeqkAmMxQvS8INTC8z2qDPV
         vu1A==
X-Gm-Message-State: AOAM533KEipoG1Mtdp9yYq4ih+FCjFFucfUIW6ggESUTL8vJmKsgaeiq
        bdsF+Q59s5OwdbUQUI/yADg7md3g3F4FkWt6w8Q=
X-Google-Smtp-Source: ABdhPJySJVCsuoxD0gUf9L1yBcHg/gALK4uBvdQA33Qd9q9BFQvEMIvMQ9Ox3aEG4s42fCmnWH3bUa00Ta4eVukhSGk=
X-Received: by 2002:a25:cd89:: with SMTP id d131mr32518579ybf.71.1628033402547;
 Tue, 03 Aug 2021 16:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210602061253.5747-1-roderick@gaikai.com> <20210602061253.5747-3-roderick@gaikai.com>
 <nycvar.YFH.7.76.2106241525330.18969@cbobk.fhfr.pm> <20210803221055.GA32527@amd>
In-Reply-To: <20210803221055.GA32527@amd>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Tue, 3 Aug 2021 16:29:51 -0700
Message-ID: <CAEc3jaAoDfJD92q9q_HoFq3nsjkDqfZHu-VO+Ei8xSP8QrE8rg@mail.gmail.com>
Subject: Re: [PATCH 2/3] leds: add new LED_FUNCTION_PLAYER for player LEDs for
 game controllers.
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Roderick Colenbrander <roderick@gaikai.com>,
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

See some quick comments inline.

On Tue, Aug 3, 2021 at 3:39 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
>
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
>
> I'm sorry for delays.
>
> But no, player is not suitable function. Function would be "player1"
> AFAICT, right?

A given gaming device such as Sony or Nintendo controllers have a
multiple of these LEDs, which are meant to be configured with a player
number. A typical device has like 4 of these LEDs, so a single
controller would have: "player-1", "player-2", "player-3" and
"player-4". It is up to userspace to configure the player number (a
driver may set a default number across a number of LEDs).

If player is not the right term (many people know it), what would it be?

>
> I'm not sure "function" is suitable here, and we may want to create
> documentation like this... where it would be explained which functions
> apply to which devices and what they actually mean.
>
> Best regards,
>                                                                 Pavel
>
> -*- org -*-
>
> It is somehow important to provide consistent interface to the
> userland. LED devices have one problem there, and that is naming of
> directories in /sys/class/leds. It would be nice if userland would
> just know right "name" for given LED function, but situation got more
> complex.
>
> Anyway, if backwards compatibility is not an issue, new code should
> use one of the "good" names from this list, and you should extend the
> list where applicable.
>
> Bad names are listed, too; in case you are writing application that
> wants to use particular feature, you should probe for good name, first,
> but then try the bad ones, too.
>
> * Keyboards
>
> Good: "input*:*:capslock"
> Good: "input*:*:scrolllock"
> Good: "input*:*:numlock"
> Bad: "shift-key-light" (Motorola Droid 4, capslock)
>
> Set of common keyboard LEDs, going back to PC AT or so.
>
> Good: "platform::kbd_backlight"
> Bad: "tpacpi::thinklight" (IBM/Lenovo Thinkpads)
> Bad: "lp5523:kb{1,2,3,4,5,6}" (Nokia N900)
>
> Frontlight/backlight of main keyboard.
>
> Bad: "button-backlight" (Motorola Droid 4)
>
> Some phones have touch buttons below screen; it is different from main
> keyboard. And this is their backlight.
>
> * Sound subsystem
>
> Good: "platform:*:mute"
> Good: "platform:*:micmute"
>
> LEDs on notebook body, indicating that sound input / output is muted.
>
> * System notification
>
> Good: "status-led:{red,green,blue}" (Motorola Droid 4)
> Bad: "lp5523:{r,g,b}" (Nokia N900)
>
> Phones usually have multi-color status LED.
>
> * Power management
>
> Good: "platform:*:charging" (allwinner sun50i)
>
> * Screen
>
> Good: ":backlight" (Motorola Droid 4)
>
>
> --
> http://www.livejournal.com/~pavelmachek
