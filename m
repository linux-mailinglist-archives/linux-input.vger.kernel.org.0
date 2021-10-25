Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A04164396AB
	for <lists+linux-input@lfdr.de>; Mon, 25 Oct 2021 14:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233234AbhJYMw4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Oct 2021 08:52:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46222 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233071AbhJYMwz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Oct 2021 08:52:55 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 223353F0;
        Mon, 25 Oct 2021 14:50:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635166231;
        bh=JT5dBRuciz8zn5xustXG4zmo0JoJ0EcYyoNnEu6vgiM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MW1GzZyadLln+MANjZHZ9bhgSjSEEh4heWQtRjOjn5kiBRCkc2HAN297Y3Eu+Pz0D
         hNEUywUSc5e/jxVe7Y5ec27/hVh2KPaGgUFVcd2XUTwf3FZrr/ojhcaY0n3P13ci4i
         6vHzcLUH+J6MV+Zge7ptcuhhl0hrrG5GNQvWBz8I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <eda13f7c-b353-dcf4-c4ea-c2aa65858e7a@ideasonboard.com>
References: <20210922203027.3229474-1-kieran.bingham@ideasonboard.com> <CAMuHMdULHnztv=7i1b1x9BEsO8pu=J3Af_Qx7=CzD3qJhYRNBA@mail.gmail.com> <eda13f7c-b353-dcf4-c4ea-c2aa65858e7a@ideasonboard.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779a0: falcon-cpu: Add SW46 switch support
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, open list:
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>, ;
Illegal-Object: Syntax error in Cc: address found on vger.kernel.org:
        Cc:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-input <linux-input@vger.kernel.org>
Date:   Mon, 25 Oct 2021 13:50:28 +0100
Message-ID: <163516622846.905629.2499825068313249631@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Is there anyone from linux-input that can help with the feedback
requested below please?

I've held off sending my v2 of this patch awaiting to see if anyone has
further comments on the use of 'generic' test switches.

...

Quoting Kieran Bingham (2021-09-23 13:17:09)
> On 23/09/2021 08:32, Geert Uytterhoeven wrote:
> > Hi Kieran,
> >=20
> > CC input
> >=20
> > On Wed, Sep 22, 2021 at 10:30 PM Kieran Bingham
> > <kieran.bingham@ideasonboard.com> wrote:
> >> Add support for SW46-1 and SW46-2 as switches using the gpio-keys
> >> framework.
> >>
> >> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> >=20
> > Thanks for your patch!
> >=20
> >> ---
> >>
> >> SW_LID and SW_DOCK are selected as low-impact switch events for the
> >> default configuration. Would SW_RFKILL_ALL, and SW_MUTE_DEVICE be
> >> preferred as more 'functional' defaults? (I have otherwise avoided the=
se
> >> to hopefully prevent unwanted / undocumented effects occuring on
> >> development hardware running a full interface which may parse these)
> >>
> >> I'd expect them to be overridden by any platform using them anyway.
> >=20
> > That's a good question
> >=20
> > BTW, I'm happy you brought this up.  I discovered EV_SW only
>=20
> I hoped it would start a discussion ;-) I noticed no one else was using
> EV_SW ... and ... well the slide switches just aren't buttons ;-)
>=20
> > recently, and had just started wondering whether we should use it
> > for the various slide switches on Renesas R-Car Gen2 and Gen3 boards,
> > which are modelled using the default EV_KEY and KEY_[1-4].
>=20
> Indeed, that was my dilemma - there isn't really a 'generic' zero-impact
> choice for the slide switches. They all imply that they are likely to be
> interpreted by a window manager / gui to make some adjustment to the syst=
em.
>=20
> Which is of course desired in a product/device - but on a test board
> like the evaluation modules - I can imagine someone saying they can't
> understand why the screen isn't working / is in powersave ... because
> ... of the undocumented feature that the SW46-1 position indicating that
> the 'lid' is closed ...
>=20

We have evaluation boards, with switches and buttons. Buttons are not so
painful for an impact, as they default to 'not-pressed' ... however a
switch ... always has a position.

From my understanding of the available switch codes, they all imply some
sort of system configuration, meaning that the position of the switch
may be likely to cause an effect in a graphical user interface when
running on these boards if the switches are configured to be one of
those keys.

Is there an accepted default/test key already that should be used? or
should I propose a new code which is not expected to have any effects
other than report its position?

--
Kieran

> > I see several DTS files using EV_SW (or hardcoded 5) with KEY_*
> > codes instead of EV_* codes, so perhaps KEY_A or KEY_B would be
> > suited better, to avoid strange effects? But SW_LID (and KEY_RESERVED)
> > seem to be quite popular, too.
>=20
> It feels 'horrible' reporting Key events on switch events ... but if
> it's an approved solution - I'm fine with that.
>=20
> As long as there is no further side impact of suddenly 'KEY_B' is
> constantly pressed, and so the WM is going to act as though a key
> modifier is active ...
>=20
>=20
> > Any input^Wgood advice from the input people? TIA!
>=20
> Yes please ;-)
>=20
> Maybe we need some 'test' keys / events that can be hooked up that allow
> testing/validation but represent that these keys/switches/buttons have
> no current definition for their operation...
>=20
> They're just generic buttons and switches ..
>=20
> >=20
> >> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> >> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> >> @@ -52,6 +52,24 @@ keys {
> >>                 pinctrl-0 =3D <&keys_pins>;
> >>                 pinctrl-names =3D "default";
> >>
> >> +               sw-1 {
> >> +                       gpios =3D <&gpio1 28 GPIO_ACTIVE_LOW>;
> >> +                       linux,code =3D <SW_LID>;
> >> +                       linux,input-type =3D <EV_SW>;
> >> +                       label =3D "SW46-1";
> >> +                       wakeup-source;
> >> +                       debounce-interval =3D <20>;
> >> +               };
> >> +
> >> +               sw-2 {
> >> +                       gpios =3D <&gpio1 29 GPIO_ACTIVE_LOW>;
> >> +                       linux,code =3D <SW_DOCK>;
> >> +                       linux,input-type =3D <EV_SW>;
> >> +                       label =3D "SW46-2";
> >> +                       wakeup-source;
> >> +                       debounce-interval =3D <20>;
> >> +               };
> >> +
> >>                 key-1 {
> >>                         gpios =3D <&gpio6 18 GPIO_ACTIVE_LOW>;
> >>                         linux,code =3D <KEY_1>;
> >=20
> > Looks good to me.
> >=20
> >> @@ -193,7 +211,8 @@ i2c6_pins: i2c6 {
> >>         };
> >>
> >>         keys_pins: keys {
> >> -               pins =3D "GP_6_18", "GP_6_19", "GP_6_20";
> >> +               pins =3D "GP_1_28", "GP_1_29",
> >> +                      "GP_6_18", "GP_6_19", "GP_6_20";
> >>                 bias-pull-up;
> >>         };
> >=20
> > This part is not needed, as the GPIOs connected to the slide switches
> > have external pull-up resistors (unlike the GPIOs connected to the
> > push switches, which are driven low by open-drain buffers, without
> > external pull-up resistors).
> >=20
>=20
> Ah - for some reason I thought it was required to configure the PFC
> regardless, and show that these pins are acquired by the gpio function -
> but of course I'd expect 'getting' the gpio would do that..
>=20
> I'll await some feedback on the best key codes to use before reposting.
>=20
>=20
> Out of interest, is the OD buffer there to act as a hardware debounce or
> such? or is there another likely reason?
>=20
> --
> Kieran
>=20
>=20
>=20
> > Gr{oetje,eeting}s,
> >=20
> >                         Geert
> >
