Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C6F8447F94
	for <lists+linux-input@lfdr.de>; Mon,  8 Nov 2021 13:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbhKHMoy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Nov 2021 07:44:54 -0500
Received: from mail-ua1-f52.google.com ([209.85.222.52]:35749 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239577AbhKHMoy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Nov 2021 07:44:54 -0500
Received: by mail-ua1-f52.google.com with SMTP id q13so31188020uaq.2;
        Mon, 08 Nov 2021 04:42:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9zP+VNV+6KkF7GoO1LSZyLAZ2MKqVKJkHlMGSlOkuyQ=;
        b=hXm+bMZIQ9VdqoP+j14YZgOJ+yqpRwfTx+kRFbJHUvYel9KGixa/OXdq5yjUAQucQk
         Sthegkf/hrOOAA+HYonSZMwanebFPd1SxqYHhEjMF+0fL5I5lVbAiFCOzjERh3/vR+xI
         E0dGVah+Jz6FnTNEJ/pH8ovyluiLBVyhpAKSQT7+cT80JJSmxdOjYBfeDmKEz6SJJvwn
         0YWl7lGkiI4acNAdXmCafZBWa6+JsdzDqCaMnNZJ+tcIRG4CeRzNxXNxWs9KydODvYEa
         9kKxI0uBk63IblSTIyAi9WJD5E3aiNcGJIw0Npq31xfJKOSDvAB4o+E5CHD3QzzejbEQ
         jSZw==
X-Gm-Message-State: AOAM530/eFyCa5z1qf9MrFAvjlKJ2JOB+HJKGdgw86j/XAXDXTBrtj0B
        FMqoCT/yBJmcJWILTHOoDhNhJbtdSA/pjdX5
X-Google-Smtp-Source: ABdhPJwc6T9a0Bs2IGOKa7a7nJr7vvWqHGt6Zb+kSpDqCnCVYEBHhC+mF9W6tkZk93T4unSzGmnHOQ==
X-Received: by 2002:a05:6102:38d1:: with SMTP id k17mr65773150vst.32.1636375329010;
        Mon, 08 Nov 2021 04:42:09 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id k185sm3097883vsc.21.2021.11.08.04.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 04:42:08 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id q13so31187920uaq.2;
        Mon, 08 Nov 2021 04:42:08 -0800 (PST)
X-Received: by 2002:a67:c38f:: with SMTP id s15mr40412626vsj.50.1636375327937;
 Mon, 08 Nov 2021 04:42:07 -0800 (PST)
MIME-Version: 1.0
References: <20211105103508.4153491-1-kieran.bingham+renesas@ideasonboard.com>
 <20211105170037.GA65511@nixie71> <YYW4d/YK1MkIfGT/@google.com>
 <163619359511.3601475.3667763097540792609@Monstersaurus> <20211107061719.GA204396@nixie71>
 <CAMuHMdUUbzTGWSybSpEgaN1oCzV9o+tdKJHEsdVvPD--52RbQg@mail.gmail.com> <163637490726.275423.1171114801185953486@Monstersaurus>
In-Reply-To: <163637490726.275423.1171114801185953486@Monstersaurus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 8 Nov 2021 13:41:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV98HKopvDcY-bGgTh2Az6eqRL29QH_mY9C_=60JBhy8w@mail.gmail.com>
Message-ID: <CAMuHMdV98HKopvDcY-bGgTh2Az6eqRL29QH_mY9C_=60JBhy8w@mail.gmail.com>
Subject: Re: [PATCH v2] Input: add 'safe' user switch codes
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jeff LaBundy <jeff@labundy.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Max Gurtovoy <mgurtovoy@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wu Hao <hao.wu@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Ertman <david.m.ertman@intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Xu Yilun <yilun.xu@intel.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Kieran,

On Mon, Nov 8, 2021 at 1:35 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Quoting Geert Uytterhoeven (2021-11-08 11:00:20)
> > On Sun, Nov 7, 2021 at 7:17 AM Jeff LaBundy <jeff@labundy.com> wrote:
> > > On Sat, Nov 06, 2021 at 10:13:15AM +0000, Kieran Bingham wrote:
> > > > Quoting Dmitry Torokhov (2021-11-05 23:04:23)
> > > > > On Fri, Nov 05, 2021 at 12:00:37PM -0500, Jeff LaBundy wrote:
> > > > > > On Fri, Nov 05, 2021 at 10:35:07AM +0000, Kieran Bingham wrote:
> > > > > > > All existing SW input codes define an action which can be interpreted by
> > > > > > > a user environment to adapt to the condition of the switch.
> > > > > > >
> > > > > > > For example, switches to define the audio mute, will prevent audio
> > > > > > > playback, and switches to indicate lid and covers being closed may
> > > > > > > disable displays.
> > > > > > >
> > > > > > > Many evaluation platforms provide switches which can be connected to the
> > > > > > > input system but associating these to an action incorrectly could
> > > > > > > provide inconsistent end user experiences due to unmarked switch
> > > > > > > positions.
> > > > > > >
> > > > > > > Define two custom user defined switches allowing hardware descriptions
> > > > > > > to be created whereby the position of the switch is not interpreted as
> > > > > > > any standard condition that will affect a user experience.
> > > > > > >
> > > > > > > This allows wiring up custom generic switches in a way that will allow
> > > > > > > them to be read and processed, without incurring undesired or otherwise
> > > > > > > undocumented (by the hardware) 'default' behaviours.
> > > > > > >
> > > > > > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > > > > > ---
> > > > > > >
> > > > > > > Sigh, a compile test might have at least saved the buildbots the trouble
> > > > > > > of notifying me I also need to update the INPUT_DEVICE_ID_SW_MAX. But
> > > > > > > even so - I'm really looking for a discussion on the best ways to
> > > > > > > describe a non-defined switch in device tree.
> > > > > > >
> > > > > > > Here's a compiling v2 ;-) But the real questions are :
> > > > > > >
> > > > > > >  - Should an existing feature switch be used for generic switches?
> > > > > > >  - Should we even have a 'user' defined switch?
> > > > > > >  - If we add user switches, how many?
> > > > > > >
> > > > > >
> > > > > > This is merely my opinion, but if a hardware switch does not have a defined
> > > > > > purpose, it does not seem necessary to represent it with an input device.
> > > > >
> > > > > Yes, exactly. For input core we are trying to avoid generic events with
> > > > > no defined meaning.
> > > >
> > > > That's understandable, particularly as I could then ponder - how do we
> > > > even define generic switches, and how many ;-) I wanted to discuss it
> > > > because otherwise these switches will be defined in DT as buttons. And
> > > > they are not buttons...
> > > >
> > > > > What are these switches? GPIOs? Maybe it would be better to use GPIO
> > > > > layer to test the state for them?
> > > >
> > > > They are physical slide switches on the board. But they have no defined
> > > > purpose by the hardware designer. The purpose would be defined by the
> > > > end user, as otherwise they are generic test switches.
> > > >
> > > > These have been previously handled as gpio-key buttons, for instance
> > > > key-1 to key-4 at [0] are actually four slides switches.
> > > >
> > > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e3414b8c45afa5cdfb1ffd10f5334da3458c4aa5
> > > >
> > > > What I'm trying to determine/promote is that they are not push buttons,
> > > > and shouldn't be described as such. I have posted [1] to add support for
> > > > these switches, but I am limited to chosing 'functions' which will have
> > > > an impact on the system...
> > > >
> > > > [1] https://lore.kernel.org/all/20211025130457.935122-1-kieran.bingham+renesas@ideasonboard.com/
> > > >
> > > > Presently in [1] I have chosen SW_LID and SW_DOCK as very arbitrary
> > > > functions for the switches. But my concern is that in doing so, the
> > > > SW_LID position could for instance suggest to a window environment or
> > > > power management system that the lid is closed, and the system should
> > > > be suspended (of course depending upon configurations). That would mean
> > > > that the board would now be potentially always heading into a suspend
> > > > after power up which would not be at all clear from the switch.
> > > >
> > > > I believe a 'switch' is the correct way to define this hardware, so that
> > > > both positions can be determined, and read, and events generated on
> > > > state change - but that there shouldn't be any artificially imposed side
> > > > effects from the description.
> > > >
> > > > If the answer is "no we can't have generic switches" then so be it, but
> > > > it feels wrong to further propogate the definition of these test
> > > > switches as keys.
> > >
> > > I agree that a slide switch tied to a GPIO is indeed a switch in terms of
> > > input core. Note, however, that definitions from your first example (such
> > > as KEY_1) are not any less generic; those have specific meanings too.
> >
> > But at least the KEY_* events are less likely to cause harmful side
> > effects than the SW_* events.  I have no idea which daemon in e.g. a
> > generic Ubuntu userspace would act on the SW_* events.
>
> The fact that they are no-less generic is precisely another reason why I
> don't think these switches should be bound to KEY_0/N either.
>
> If the switch is in the 'on' position - then it will cause repeated key
> press events... as the key will be permanantly in the active state.
>
> Holding KEY_0 down isn't necessarily as harmful to the user as having
> the screen disabled, but I'm sure it would have a painful impact
> depending upon various key repeat delays and such of course.

Switches behaving like stuck keys is indeed annoying.
I was mainly referring to using KEY_* being innocent for push buttons.

> The examples defined in [0] are (IMO) wrong, and have been implemented
> incorrectly because of a lack of a generic test switch position.

Sure. I do agree the switches should be described as switches
using SW_*, not KEY_* events.

> If we can come up with a solution, I think those definitions should be
> fixed up (if we're allowed to modify them now they exist? I expect so?).

I do think we can change them.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
