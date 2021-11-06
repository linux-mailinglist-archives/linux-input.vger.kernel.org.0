Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7612A446D5E
	for <lists+linux-input@lfdr.de>; Sat,  6 Nov 2021 11:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbhKFKQA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Nov 2021 06:16:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:43306 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229645AbhKFKP7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 6 Nov 2021 06:15:59 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7025D18FC;
        Sat,  6 Nov 2021 11:13:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636193597;
        bh=pWHsN85WQE04ifv7GnoCEhAUNAYLGxlr6rj0B8T8H+Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=aX4+ukReNH2TvvALnKExXBbdCMgB8yR1AJiq7A/sxMEfOveQ2jO8BnW0cjnX1lNA6
         YM3GRHxa7o19KNhFPjlsOKVD/90R/XIsrLUysuPSdIZatON9TPKvHv8OOkl603p7vT
         RU+/tqlEUZKA6c8WlQKDkH722qzUabhtNbIjcFQ0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YYW4d/YK1MkIfGT/@google.com>
References: <20211105103508.4153491-1-kieran.bingham+renesas@ideasonboard.com> <20211105170037.GA65511@nixie71> <YYW4d/YK1MkIfGT/@google.com>
Subject: Re: [PATCH v2] Input: add 'safe' user switch codes
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-input@vger.kernel.org, Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Max Gurtovoy <mgurtovoy@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wu Hao <hao.wu@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Ertman <david.m.ertman@intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Xu Yilun <yilun.xu@intel.com>,
        open list <linux-kernel@vger.kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jeff LaBundy <jeff@labundy.com>
Date:   Sat, 06 Nov 2021 10:13:15 +0000
Message-ID: <163619359511.3601475.3667763097540792609@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry, Jeff,

Thanks for looking into this,

Quoting Dmitry Torokhov (2021-11-05 23:04:23)
> Hi Jeff, Kieran,
>=20
> On Fri, Nov 05, 2021 at 12:00:37PM -0500, Jeff LaBundy wrote:
> > Hi Kieran,
> >=20
> > On Fri, Nov 05, 2021 at 10:35:07AM +0000, Kieran Bingham wrote:
> > > All existing SW input codes define an action which can be interpreted=
 by
> > > a user environment to adapt to the condition of the switch.
> > >=20
> > > For example, switches to define the audio mute, will prevent audio
> > > playback, and switches to indicate lid and covers being closed may
> > > disable displays.
> > >=20
> > > Many evaluation platforms provide switches which can be connected to =
the
> > > input system but associating these to an action incorrectly could
> > > provide inconsistent end user experiences due to unmarked switch
> > > positions.
> > >=20
> > > Define two custom user defined switches allowing hardware descriptions
> > > to be created whereby the position of the switch is not interpreted as
> > > any standard condition that will affect a user experience.
> > >=20
> > > This allows wiring up custom generic switches in a way that will allow
> > > them to be read and processed, without incurring undesired or otherwi=
se
> > > undocumented (by the hardware) 'default' behaviours.
> > >=20
> > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.co=
m>
> > > ---
> > >=20
> > > Sigh, a compile test might have at least saved the buildbots the trou=
ble
> > > of notifying me I also need to update the INPUT_DEVICE_ID_SW_MAX. But
> > > even so - I'm really looking for a discussion on the best ways to
> > > describe a non-defined switch in device tree.
> > >=20
> > > Here's a compiling v2 ;-) But the real questions are :
> > >=20
> > >  - Should an existing feature switch be used for generic switches?
> > >  - Should we even have a 'user' defined switch?
> > >  - If we add user switches, how many?
> > >=20
> >=20
> > This is merely my opinion, but if a hardware switch does not have a def=
ined
> > purpose, it does not seem necessary to represent it with an input devic=
e.
>=20
> Yes, exactly. For input core we are trying to avoid generic events with
> no defined meaning.

That's understandable, particularly as I could then ponder - how do we
even define generic switches, and how many ;-) I wanted to discuss it
because otherwise these switches will be defined in DT as buttons. And
they are not buttons...


> What are these switches? GPIOs? Maybe it would be better to use GPIO
> layer to test the state for them?

They are physical slide switches on the board. But they have no defined
purpose by the hardware designer. The purpose would be defined by the
end user, as otherwise they are generic test switches.

These have been previously handled as gpio-key buttons, for instance
key-1 to key-4 at [0] are actually four slides switches.=20

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3De3414b8c45afa5cdfb1ffd10f5334da3458c4aa5

What I'm trying to determine/promote is that they are not push buttons,
and shouldn't be described as such. I have posted [1] to add support for
these switches, but I am limited to chosing 'functions' which will have
an impact on the system...

[1] https://lore.kernel.org/all/20211025130457.935122-1-kieran.bingham+rene=
sas@ideasonboard.com/

Presently in [1] I have chosen SW_LID and SW_DOCK as very arbitrary
functions for the switches. But my concern is that in doing so, the
SW_LID position could for instance suggest to a window environment or
power management system that the lid is closed, and the system should
be suspended (of course depending upon configurations). That would mean
that the board would now be potentially always heading into a suspend
after power up which would not be at all clear from the switch.

I believe a 'switch' is the correct way to define this hardware, so that
both positions can be determined, and read, and events generated on
state change - but that there shouldn't be any artificially imposed side
effects from the description.

If the answer is "no we can't have generic switches" then so be it, but
it feels wrong to further propogate the definition of these test
switches as keys.

--
Regards

Kieran
