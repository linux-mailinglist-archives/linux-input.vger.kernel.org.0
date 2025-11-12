Return-Path: <linux-input+bounces-16039-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EA3C52A56
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 15:17:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E243834466B
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 14:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D338213959D;
	Wed, 12 Nov 2025 14:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="jo9QDEHO"
X-Original-To: linux-input@vger.kernel.org
Received: from relay14.grserver.gr (relay14.grserver.gr [46.224.16.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EFF25BEE5
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 14:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.224.16.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762957031; cv=none; b=DZb4ul0SBSL2qG09z9mcf8UKdAI7DEIu8ShROv/FMh7WWj+Clkp/rCorIfahZWXUnD2dx6Ho6WA1W5iDvnDy32uUnt5dKRYf+MeDFwVhHa6GHApeVKxucUv5FJx+XUF+rgKORmA6B/337VE2bSZF8Xj4WXwV3Gc07L8HSWPK6LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762957031; c=relaxed/simple;
	bh=pHowmRxxw+Z1SeIhTkAvHgshg8T3wUqTyFWEi+EF8Eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqKQDP+em6SFXjBz84flKceSxvHMM/eUznB1P/ZSg+n+jjvu1a1IcigTBwHKJ58JXZtG7LElrbPSVpsinjfRa9X+QsFtdwJE1sc+0Ac1sim4Ke82iUGSR9p87CDd35uvB5OdD+iK4b2uP+3HgNR0AUq+APG6c6P0g+o1nipnosM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=jo9QDEHO; arc=none smtp.client-ip=46.224.16.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id 0FBF64411A
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 14:17:05 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id 815B644186
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 14:17:03 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 003911FD0B1
	for <linux-input@vger.kernel.org>; Wed, 12 Nov 2025 16:17:02 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1762957023;
	bh=pHowmRxxw+Z1SeIhTkAvHgshg8T3wUqTyFWEi+EF8Eg=;
	h=Received:From:Subject:To;
	b=jo9QDEHOIGs6Av5PxZW47uTP7Ke5cW0sAYk5Q8sC+jcGsnPeiWDnnNv1zjJ0pGxEJ
	 His5beP8aFdU+vrRofaR6USeelw82ynmpy60s8u7yufuGO8nw/YK5WzTcYl/OjoNtf
	 JY6dIs4MGKRx2rQa7UXjpTOKGXUbXfElirpUIfF7K20FlEgm/HRvLa4/sIAcL+/FUi
	 qoolMb6RSXEiVVk1lSAoQvqpvrFFaMu1mf2UqXoIGD1WaqyPcJy0FqsRp53sbD3gCx
	 sWE1Bps/gdJQdGGYxOgye1aSfB+aMXW0bM1G4+R5g87RdSrAilaa8hlByZ/NPnmVSp
	 38EVcteDy58KQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.175) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f175.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-37a3340391cso7636441fa.3
        for <linux-input@vger.kernel.org>;
 Wed, 12 Nov 2025 06:17:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUHH1gTc5TAbFPNzX1fe/jo7lsVcDFvQaPpcR4olWajNrqva6vVXcYeZOrHdmpWYg7FfdhXGFaaIg2JgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybROZbuJwXm23pvjnkcM0oh7s12CVkk06n1oPs9hIwOeE8Zp4p
	DOvZZEMRgw0OU4dQkKi/orD99DAuOsOqx+KJhwaLL3sk1hwb777bWW5iDFJWYsFPZfIGTP3MuDK
	RgLAIgvP4PbKbL3/uJxpAYloYaQfOeV4=
X-Google-Smtp-Source: 
 AGHT+IFH4Sr3pjkjHTEStzcHuaReekjaAMPMMnsejMNBS81fTX8OEqJ5dNiaOUa1+kkhW7/BCz9mn9V//HQozChAmsU=
X-Received: by 2002:a2e:6e14:0:b0:37b:8b7e:efd with SMTP id
 38308e7fff4ca-37b8c438a16mr8653621fa.39.1762957022472; Wed, 12 Nov 2025
 06:17:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702034740.124817-1-vi@endrift.com>
 <bwun7yd3uwp3cqicg2euq5swxespqjiizxlioohgdk43emzwue@hzyz7gn4vfqb>
 <CAAfxzZ0p=2REL8fhnxe5HwpPK6U7Cat7euMcRnWvUnknrok3sA@mail.gmail.com>
 <b8933438-fd43-4e58-a26d-0febb27911c4@endrift.com>
 <CAAfxzZ1xJC2QRms4RMS54JCbieupt7XmxO6bwZc0vnx0thT4Yg@mail.gmail.com>
 <rkua5gpwvwcs5nb7u6dvab7xlgkpghaw6cezk5mztdkrdc7zch@lwflpa5wfe2e>
In-Reply-To: <rkua5gpwvwcs5nb7u6dvab7xlgkpghaw6cezk5mztdkrdc7zch@lwflpa5wfe2e>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 12 Nov 2025 15:16:51 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHfnuDrYHK557oDcRNxQvKx4BRSSgkL+ev1xuKNY39JVw@mail.gmail.com>
X-Gm-Features: AWmQ_blEKOyw_45mCPoiHu1SGughYBNQ7J2vnZ0oxCjiBYLYpsdxe9Eu_teg13U
Message-ID: 
 <CAGwozwHfnuDrYHK557oDcRNxQvKx4BRSSgkL+ev1xuKNY39JVw@mail.gmail.com>
Subject: Re: [PATCH] Input: xpad - Change buttons the D-Pad gets mapped as to
 BTN_DPAD_*
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Cameron Gutman <aicommander@gmail.com>, Vicki Pfau <vi@endrift.com>,
 linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176295702319.1955300.2716350716279391558@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 5 Nov 2025 at 06:04, Dmitry Torokhov <dmitry.torokhov@gmail.com> wr=
ote:
>
> On Sat, Nov 01, 2025 at 11:23:51AM -0500, Cameron Gutman wrote:
> > On Sat, Nov 1, 2025 at 12:52=E2=80=AFAM Vicki Pfau <vi@endrift.com> wro=
te:
> > >
> > >
> > >
> > > On 10/31/25 8:18 PM, Cameron Gutman wrote:
> > > > On Sun, Jul 27, 2025 at 3:23=E2=80=AFAM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > > >>
> > > >> On Tue, Jul 01, 2025 at 08:47:40PM -0700, Vicki Pfau wrote:
> > > >>> Since dance pads can have both up/down or left/right pressed at t=
he same time,
> > > >>> by design, they are not suitable for mapping the buttons to axes.=
 Historically,
> > > >>> this driver mapped the D-pad to BTN_TRIGGER_HAPPY1-4 in these cas=
es, and before
> > > >>> that as mouse buttons. However, BTN_DPAD_* exists for this and ma=
kes far more
> > > >>> sense than the arbitrary mapping it was before.
> > > >>>
> > > >>> Signed-off-by: Vicki Pfau <vi@endrift.com>
> > > >>
> > > >> This unfortunately changes existing mappings, but I guess new even=
ts are
> > > >> better than old ones...
> > > >>
> > > >> Applied, thank you.
> > > >
> > > > Unfortunately this mapping change caused major userspace breakages.
> > >
> > > This is unfortunate, however,>
> > > > I think it needs to be reverted.
> > > >
> > > > [0]: https://blog.dwickham.me.uk/why-your-xbox-360-wireless-control=
lers-d-pad-is-now-wrong-and-how-to-fix-it
> > > > [1]: https://github.com/libsdl-org/SDL/issues/14324
> > > > [2]: https://github.com/libsdl-org/SDL/pull/14339
> > >
> > > None of these pages suggest reverting the changes. The blog post sugg=
ests that these mappings are correct, and that the libraries need to be fix=
ed. Reverting it is mentioned as an absolute last case scenario. The SDL is=
sues say they need more testing, not an outright reversion.
> >
> > Breaking userspace is the #1 thing we cannot do as Linux kernel develop=
ers.
> >
> > The fact that it broke enough people to get a blog post is reason
> > enough to revert.
> >
> > >
> > > Reverting this is solely reverting to an old, uncomfortable status qu=
o instead of actually fixing the things that broke. If this gets reverted, =
presumably more stuff will ship this broken code that will break if we ever=
 fix this issue again, instead of things getting progressively fixed.
> > >
> >
> > The "broken" 360 wireless mapping has been used since wireless adapter
> > support was first implemented in 2008 [0].
> >
> > There's decades of software out there that already has workarounds for
> > these devices that we must not break.
> >
> > We can send the proper button codes for new controllers, but I think
> > we have to leave existing devices alone.
> >
> > [0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/commit/?id=3D99de0912be6f384fc31c8e8e7ba0850d0d670385
> >
> > > The abandonware being broken is unfortunate, but things like Steam In=
put exist specifically to work around issues like that.
> > >
> >
> > This isn't just breaking abandonware. It's breaking the *latest*
> > releases of SDL2 and SDL3.
>
> I agree that keeping the old mapping is not great idea, especially if we
> start having newer devices using new mapping while other devices use the
> old one. However we can't really be breaking existing user setup and now
> that we are aware of such breakages we have to react. I am open to
> suggestions.
>
> From my side I see a few options:
>
> 1. Introduce a module option, and allow controlling the behavior. Hope
> distributions will flip it when updating to new version of SDL that can
> hopefully handle this. Eventually flip the default to be the new
> mapping.
>
> 2. Allow overriding mapping from userspace. Allow [main] user (SDL or
> not) load an updated keymap if they desire to do so.
>
> 3. Maybe we can send both old and new events at the same time and let
> consumers decide which ones to act upon? Eventually we can drop the old
> mapping (maybe again having an option to use old one or implement option
> 2 and allow loading old mapping via udev or a utility).
>
> 4. ???

Hi,
jumping on this to give some background.

Currently, the way the kernel handles evdev gamepads is a bit of a
mess, specifically when it comes to DInput.

Essentially, gamepads are consumed using the legacy js API which does
not have event names but only button indexes. Or an evdev wrapper if
using an SDL-like backend that does something similar.

There are no specific mappings for each index, this is different for
every gamepad. Userspace software is supposed to know the mapping for
each gamepad based on a heuristic. The most widespread one is the SDL
mappings, which are also available in the form of a community database
[1].

You can see in the button index code in the kernel that it starts with
buttons from index BTN_JOYSTICK, goes up to KEY_MAX, then loops around
and registers the buttons until BTN_MISC (which skips most keyboard
buttons). Those are the buttons available in the legacy API. SDL is
different, in that it keeps registering the buttons after BTN_MISC
which is important for some gamepads that use KEY_MENU for e.g., the
Xbox button. This means that it is possible to use SDL mappings with
the joydev API while missing some buttons, but since those buttons are
at the end and usually special functions it is a NOOP.

Dinput is where it gets interesting and why it is kind of a fruitless
endeavor to try to rename buttons. In [3], the kernel starts
registering buttons with HID_GD_JOYSTICK from BTN_JOYSTICK onwards, so
all HID gamepads that do not bind to a driver have completely invalid
evdev event names. And this is most non-XInput gamepads (around 400
models) so no one in their right mind would rely on evdev names from
userspace and they would instead use that mapping.

WIth that in mind, it is very important to not shift the gamepad
button order when adding new mappings. By default, the Xbox 360 order
is used. E.g., dont use BTN_BASE for an extra utility button like the
hid-steam driver (which otherwise has an xbox 360 order), as because
it is before BTN_GAMEPAD this shifts the index of all buttons by 1 and
breaks all userspace software without a mapping (this is fixed in
userspace now).

With that in mind, commit [4] that adds button grips is also
problematic, as those buttons are BELOW trigger-happy which used to do
dpad buttons. If you revert just this commit, the grips will become
dpad buttons for devices that have both.

So both commits would have to be reverted. With them together or
without either, the button order is maintained. However, they have a
different order within them so dpad is broken. I suspect the grip
buttons for Xbox Elite might have a similar issue... Although I have
not had a bug report about it.

I already received and merged a PR that fixes this from user space[5],
and I saw that the SDL3 fix is not coming to SDL2, but i think that
fix might leave that config stuck in the user's Steam config dir, so
perhaps it would be prudent for me to undo it and instead just revert
both commits.

Antheas

[1] https://github.com/mdqinc/SDL_GameControllerDB
[2] drivers/input/joydev.c
[3] drivers/hid/hid-input.c
[4] Input: xpad - use new BTN_GRIP* buttons
[5] https://github.com/ublue-os/bazzite/issues/3399

> Thanks.
>
> --
> Dmitry


