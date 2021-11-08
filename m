Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 387CC447F80
	for <lists+linux-input@lfdr.de>; Mon,  8 Nov 2021 13:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239541AbhKHMh6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Nov 2021 07:37:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239535AbhKHMh5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Nov 2021 07:37:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6651C061570;
        Mon,  8 Nov 2021 04:35:12 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 320F2E51;
        Mon,  8 Nov 2021 13:35:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636374909;
        bh=HRNa/ZVrLvCX78HK00UZgOgAd3EvsQWFkXO3bNwyEsI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=a6xma8pF1iu5hlJEj32zCGUwVlMME7Nrf8pj8y0uIWzDFSgfYFt/Ohf5cvmj3x3wO
         ZEC365zNBmDpxnDTVlQtGyUClfBSqAWNv07DuGZutcVK5VNde2INtH7qfBY/pOZ0AP
         VNLS504XON7rB1RBCeBA97EjPBC76MTHDd4ONz3U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdUUbzTGWSybSpEgaN1oCzV9o+tdKJHEsdVvPD--52RbQg@mail.gmail.com>
References: <20211105103508.4153491-1-kieran.bingham+renesas@ideasonboard.com> <20211105170037.GA65511@nixie71> <YYW4d/YK1MkIfGT/@google.com> <163619359511.3601475.3667763097540792609@Monstersaurus> <20211107061719.GA204396@nixie71> <CAMuHMdUUbzTGWSybSpEgaN1oCzV9o+tdKJHEsdVvPD--52RbQg@mail.gmail.com>
Subject: Re: [PATCH v2] Input: add 'safe' user switch codes
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Jeff LaBundy <jeff@labundy.com>
Date:   Mon, 08 Nov 2021 12:35:07 +0000
Message-ID: <163637490726.275423.1171114801185953486@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Geert Uytterhoeven (2021-11-08 11:00:20)
> Hi Jeff,
>=20
> On Sun, Nov 7, 2021 at 7:17 AM Jeff LaBundy <jeff@labundy.com> wrote:
> > On Sat, Nov 06, 2021 at 10:13:15AM +0000, Kieran Bingham wrote:
> > > Quoting Dmitry Torokhov (2021-11-05 23:04:23)
> > > > On Fri, Nov 05, 2021 at 12:00:37PM -0500, Jeff LaBundy wrote:
> > > > > On Fri, Nov 05, 2021 at 10:35:07AM +0000, Kieran Bingham wrote:
> > > > > > All existing SW input codes define an action which can be inter=
preted by
> > > > > > a user environment to adapt to the condition of the switch.
> > > > > >
> > > > > > For example, switches to define the audio mute, will prevent au=
dio
> > > > > > playback, and switches to indicate lid and covers being closed =
may
> > > > > > disable displays.
> > > > > >
> > > > > > Many evaluation platforms provide switches which can be connect=
ed to the
> > > > > > input system but associating these to an action incorrectly cou=
ld
> > > > > > provide inconsistent end user experiences due to unmarked switch
> > > > > > positions.
> > > > > >
> > > > > > Define two custom user defined switches allowing hardware descr=
iptions
> > > > > > to be created whereby the position of the switch is not interpr=
eted as
> > > > > > any standard condition that will affect a user experience.
> > > > > >
> > > > > > This allows wiring up custom generic switches in a way that wil=
l allow
> > > > > > them to be read and processed, without incurring undesired or o=
therwise
> > > > > > undocumented (by the hardware) 'default' behaviours.
> > > > > >
> > > > > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonbo=
ard.com>
> > > > > > ---
> > > > > >
> > > > > > Sigh, a compile test might have at least saved the buildbots th=
e trouble
> > > > > > of notifying me I also need to update the INPUT_DEVICE_ID_SW_MA=
X. But
> > > > > > even so - I'm really looking for a discussion on the best ways =
to
> > > > > > describe a non-defined switch in device tree.
> > > > > >
> > > > > > Here's a compiling v2 ;-) But the real questions are :
> > > > > >
> > > > > >  - Should an existing feature switch be used for generic switch=
es?
> > > > > >  - Should we even have a 'user' defined switch?
> > > > > >  - If we add user switches, how many?
> > > > > >
> > > > >
> > > > > This is merely my opinion, but if a hardware switch does not have=
 a defined
> > > > > purpose, it does not seem necessary to represent it with an input=
 device.
> > > >
> > > > Yes, exactly. For input core we are trying to avoid generic events =
with
> > > > no defined meaning.
> > >
> > > That's understandable, particularly as I could then ponder - how do we
> > > even define generic switches, and how many ;-) I wanted to discuss it
> > > because otherwise these switches will be defined in DT as buttons. And
> > > they are not buttons...
> > >
> > > > What are these switches? GPIOs? Maybe it would be better to use GPIO
> > > > layer to test the state for them?
> > >
> > > They are physical slide switches on the board. But they have no defin=
ed
> > > purpose by the hardware designer. The purpose would be defined by the
> > > end user, as otherwise they are generic test switches.
> > >
> > > These have been previously handled as gpio-key buttons, for instance
> > > key-1 to key-4 at [0] are actually four slides switches.
> > >
> > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De3414b8c45afa5cdfb1ffd10f5334da3458c4aa5
> > >
> > > What I'm trying to determine/promote is that they are not push button=
s,
> > > and shouldn't be described as such. I have posted [1] to add support =
for
> > > these switches, but I am limited to chosing 'functions' which will ha=
ve
> > > an impact on the system...
> > >
> > > [1] https://lore.kernel.org/all/20211025130457.935122-1-kieran.bingha=
m+renesas@ideasonboard.com/
> > >
> > > Presently in [1] I have chosen SW_LID and SW_DOCK as very arbitrary
> > > functions for the switches. But my concern is that in doing so, the
> > > SW_LID position could for instance suggest to a window environment or
> > > power management system that the lid is closed, and the system should
> > > be suspended (of course depending upon configurations). That would me=
an
> > > that the board would now be potentially always heading into a suspend
> > > after power up which would not be at all clear from the switch.
> > >
> > > I believe a 'switch' is the correct way to define this hardware, so t=
hat
> > > both positions can be determined, and read, and events generated on
> > > state change - but that there shouldn't be any artificially imposed s=
ide
> > > effects from the description.
> > >
> > > If the answer is "no we can't have generic switches" then so be it, b=
ut
> > > it feels wrong to further propogate the definition of these test
> > > switches as keys.
> >
> > I agree that a slide switch tied to a GPIO is indeed a switch in terms =
of
> > input core. Note, however, that definitions from your first example (su=
ch
> > as KEY_1) are not any less generic; those have specific meanings too.
>=20
> But at least the KEY_* events are less likely to cause harmful side
> effects than the SW_* events.  I have no idea which daemon in e.g. a
> generic Ubuntu userspace would act on the SW_* events.

The fact that they are no-less generic is precisely another reason why I
don't think these switches should be bound to KEY_0/N either.

If the switch is in the 'on' position - then it will cause repeated key
press events... as the key will be permanantly in the active state.

Holding KEY_0 down isn't necessarily as harmful to the user as having
the screen disabled, but I'm sure it would have a painful impact
depending upon various key repeat delays and such of course.

The examples defined in [0] are (IMO) wrong, and have been implemented
incorrectly because of a lack of a generic test switch position.

If we can come up with a solution, I think those definitions should be
fixed up (if we're allowed to modify them now they exist? I expect so?).

> > If the concern is that toggling a switch effects undesired behavior, su=
ch
> > as turning a display on or off, then the switch should not be represent=
ed
> > with a gpio-keys node in the first place.
> >
> > Stated another way, the fact that the GPIO are connected to something d=
oes
> > not necessarily mean they need to be supported. Only once they map to s=
ome
> > function should they be defined, in my opinion.
>=20
> Following the mantra "DT describes hardware, not software policy", I
> think we should describe generic switches in DT, and perhaps have a way
> to configure the actual event code from userspace (e.g. using sysfs?).
> Without such configuration, perhaps they could emit a SW_* event with
> the MSB set, so at least their state can be queried using e.g. evtest?

The hardware exists, and it's permanantly wired this way, we 'just' need
to describe it somehow...

> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
