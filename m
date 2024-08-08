Return-Path: <linux-input+bounces-5415-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5441F94B827
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 09:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D85001F24C5D
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 07:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E4E187875;
	Thu,  8 Aug 2024 07:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+Pyn54W"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E40013BACC
	for <linux-input@vger.kernel.org>; Thu,  8 Aug 2024 07:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723103187; cv=none; b=rtrXb4pfkRjVdePZXyH0KlPfOfXRKnvbWfusBpbrAHWvMg2vg1ztwRCvkv23ARX8EgYuwUwvRmQYMZdBvco+S5Uy4LGp4HZLi2Z3ClLK56Lz4Lrf9nNPTCWIaDw+oaqLv1dlgjaiddj7kz9iFNilc9kg3uAm7XJqjwQ8tJyjwKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723103187; c=relaxed/simple;
	bh=od7A9jN0iByU0KepauMqCfT1zMzNHfsvAFpvFZIXfdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IbrkUbPbNkxOJ/7NwVEicff1eUnFIBKOYwAKz0sIYfQxd0R1LgbQUWi0J8g6ShL6gje9AeE+wRYhjDQcSrhR/xOmS+PeJzfglwybAqOj4U5AWX6445a4x9x38bXo5/ISgMRSpyqQpxm5u6TZTNqUlPy8wJ9iBoOVG69Cd6QUssY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+Pyn54W; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-530e062217eso856078e87.1
        for <linux-input@vger.kernel.org>; Thu, 08 Aug 2024 00:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723103183; x=1723707983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiGTZS/Bz9vnnYE5uxcmD5mWEA36OAbMOAAk7DNi3P0=;
        b=E+Pyn54WIc2NlEM6F55uX68zF9/JPgGvvFJ2npLZhbxXpAFINEHNMPNykEC0i2KA6W
         6r4gn1Oc+/MV7Mkc/FDKlx23NisMVm/BQ204iGIppGMynPrMFfUIP42DvwxfgyfoqKra
         vESvYCzdSHsweagDn8QRCrWYTTXQ0Q6WhuXAOHKDIqtpvIgtIBceFGzUy5TX6/RQiX5C
         nlX2knmQK5SKcP2zVM/FmMVm9en0doMCLT61woYYVrwQLq/6BWNnJXFl60SiXQ5984yH
         SzHeTDbzXB3iD+SfHF2xn3xV9Nyse3frpZwpnMZWg4J+wl90N/jeeKg9XDXJlKcxnxiT
         tIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723103183; x=1723707983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiGTZS/Bz9vnnYE5uxcmD5mWEA36OAbMOAAk7DNi3P0=;
        b=Aq5Zvp6eBL2oykDu9sN6oCDdMeCQZgIpiZdm5/1OrS3v8ke27ZGtpuDgSfNlGqAN7q
         v37Z93akt38ZcB166RrFTpY2ks/UoCBKwa2O268vi/M83VgHoxxojqoS3LZRXhIEVefm
         wTUYP2B/6SfvNuS1RNbgdUN5fcZX0rHNDloLqru3ItobhDZ0CDk/bSC2PWRxBth9y2bX
         pLTPRX6WmuGg9XNsewOwhOfK9TS1rLZPKtWsbxLHH3SOJemKxWe+RLI8U3Y0Kh6m97/O
         r56FWqptUDEuq52Z3GRcoGNTseU7u8jLC5PHU4KQMb//MjryhYcRXdx0g1p0b1lL+Maf
         7b0g==
X-Forwarded-Encrypted: i=1; AJvYcCXzvx3LaUbEVMBj3FGbqQBPz0M05PMaByqt7hjuiCop6/TaQX45U53FxMfh5tzWHz26BOTuzo1J6hysSESV1F1AvwIfCjOZUECPj4c=
X-Gm-Message-State: AOJu0Yy5TGte8AJBM9yo8XfwF2gABu9b3iRcqqO2GqKgsPUkQoOENNAH
	lSdd8sipv2sOOU/AjxiLLuceOtlragCpcFZPXxWNkwdJmY2WeqRwY65S7IrX0tICh8shy+tbdeo
	LR9/a1AIJ8+lYdlS59A5rudL25nU=
X-Google-Smtp-Source: AGHT+IHLXlj8QlSNeIl69VTCa2i0ju0ySyH9US1Bc3AyRtHYKW2tG7uZ2NMLmLo6fzsI+70Aw5zQpYZSWPV7oqlzKHo=
X-Received: by 2002:a05:6512:1391:b0:530:ad7d:8957 with SMTP id
 2adb3069b0e04-530e588b63amr656844e87.49.1723103182534; Thu, 08 Aug 2024
 00:46:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zq1ypyDxAVQsjpjB@google.com> <20240805053445.GA3149961@quokka>
 <CAFqprmwOR7i+gA6hcou3NkY_CZXVANfSQVq6f_ZAAkHGmNLqZA@mail.gmail.com>
 <20240807031245.GA3526220@quokka> <ZrL0KD9yDnfHMbL-@google.com>
 <20240807051708.GA3551201@quokka> <CAFqprmwT5tzvTg92eAobN8s1zdAUsBUm2P9X6NjbdcMR33ijww@mail.gmail.com>
 <CACa7zymOLKZE03xQMGG3ZS=sJLrjAN1Xk6MKkZuCKzmpS4pPVA@mail.gmail.com>
 <ZrPEgZ9_ahKx2WTu@google.com> <CAFqprmwT2ppX5S+KXrCebuw=PCtZNu+6C0Y95=Ld-uWVOa331Q@mail.gmail.com>
 <ZrPh9F5lhUKLLSQk@google.com>
In-Reply-To: <ZrPh9F5lhUKLLSQk@google.com>
From: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Date: Thu, 8 Aug 2024 09:46:09 +0200
Message-ID: <CAFqprmwb_nDc1EgMSHMgy2KX7O9NO5WaesYASV8Vkzm2tOp2Pw@mail.gmail.com>
Subject: Re: [PATCH] [v2] Input: increase max button number to 0x340
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Wei Shuai <cpuwolf@gmail.com>, Peter Hutterer <peter.hutterer@who-t.net>, bentiss@kernel.org, 
	linux-input@vger.kernel.org, oleg@makarenk.ooo, torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 7 Aug 2024 at 23:07, Dmitry Torokhov <dmitry.torokhov@gmail.com> wr=
ote:
>
> On Wed, Aug 07, 2024 at 10:22:13PM +0200, Tomasz Paku=C5=82a wrote:
> > On Wed, 7 Aug 2024 at 21:01, Dmitry Torokhov <dmitry.torokhov@gmail.com=
> wrote:
> > >
> > > On Wed, Aug 07, 2024 at 04:42:56PM +0800, Wei Shuai wrote:
> > > > yes, agree. either way, will be a revolution.
> > > >
> > > > At least, for me as X-Plane flight simulator gamer, a small change =
in
> > > > expanding the key max number can make my device work immediately
> > > >
> > > > Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com> =E4=BA=8E202=
4=E5=B9=B48=E6=9C=887=E6=97=A5=E5=91=A8=E4=B8=89 14:23=E5=86=99=E9=81=93=EF=
=BC=9A
> > > > >
> > > > > On Wed, 7 Aug 2024 at 07:17, Peter Hutterer <peter.hutterer@who-t=
.net> wrote:
> > > > > >
> > > > > > On Tue, Aug 06, 2024 at 09:12:24PM -0700, Dmitry Torokhov wrote=
:
> > > > > > > > > > > 2. Can we consider using something other than EV_KEY?=
 For example we
> > > > > > > > > > > could define EV_MSC/MSC_PROG_KEY and EV_MSC/MSG_PROG_=
VAL pair to allow
> > > > > > > > > > > transmitting key number and state of keys that do not=
 have pre-defined
> > > > > > > > > > > meaning. Here we are losing event deduplication and a=
bility to query
> > > > > > > > > > > full keyboard state, but I wonder how important that =
is for the devices
> > > > > > > > > > > in question.
> > > > > > > > > >
> > > > > > > > > > The same problem rears its head in the EV_ABS and EV_RE=
L range, so
> > > > > > > > > > fixing it for EV_KEY doesn't necessarily fix it for tho=
se.
> > > > > > > > > >
> > > > > > > > > > MSC_PROG_KEY/VAL pairs would make it difficult to send =
two button
> > > > > > > > > > updates in the same frame without an SYN_MT_REPORT equi=
valent.
> > > > > > >
> > > > > > > I do not think that frame notion is that important for keys. =
It is
> > > > > > > typically important for a pointing device state.
> > > > > >
> > > > > > true, I remember a conversation years back that frames aren't
> > > > > > consistently implemented in keyboard drivers anyway which is th=
e reason
> > > > > > libinput sends (most) EV_KEY events immediately instad of waiti=
ng for a
> > > > > > SYN_REPORT.
> > > > > >
> > > > > > > > > All in all, we've had people using this patch (but increa=
sing KEY_MAX to a
> > > > > > > > > whopping 0x4ff) for the past few years with no adverse ef=
fects. I've been
> > > > > > > > > using a custom Linux kernel with this patch on my Arch ma=
chine since about
> > > > > > > > > May, and didn't notice anything, even when compiling with=
 debug flags and
> > > > > > > > > following and filtering dmesg.
> > > > > > > > >
> > > > > > > > > So here's the thing I'm most curious about. Is this somet=
hing, you'd just
> > > > > > > > > want to resolve differently, to make it nicer and more lo=
gical, or is this
> > > > > > > > > really something that would break everything and doing it=
 in this way will
> > > > > > > > > never be allowed/merged? That would make a lot of us sad =
:(
> > > > > > >
> > > > > > > We need to figure out not only how to handle your class of de=
vices, but
> > > > > > > also allow extending number of keys that do have certain sema=
ntic
> > > > > > > meaning. Peter raised a lot of questions that we need to answ=
er.
> > > > > > >
> > > > > > > But I wonder, these devices with large number of buttons that=
 do not
> > > > > > > have predefined meaning - do they have to be a single input d=
evice? Can
> > > > > > > we create N input devices if we exceed the "trigger happy" ra=
nge, all of
> > > > > > > them mapping to "trigger happy"? That would mean that userspa=
ce would
> > > > > > > keep track of key assignment on per-device basis.
> > > > > > >
> > > > > > > We already split HID devices on per-apllication (not userspac=
e but HID
> > > > > > > application) basis, and also when there are several USB inter=
faces.
> > > > > >
> > > > > > Honestly, I'd vote against this.
> > > > > > re-combining input devices into a single device in userspace is=
 a pain.
> > > > > > The split per application in HID is mostly fine because they're
> > > > > > usually physically different devices but I recently ran into th=
e issue
> > > > > > with the uclogic drivers where various features are split acros=
s
> > > > > > event nodes. Thse devices have the ring on one event node, the =
buttons
> > > > > > on another, etc. Nothing in (my) userspace is currently set up =
for this
> > > > > > and it'd require a major rework in many places to be able to ha=
ndle this
> > > > > > properly. And it requires that rework in every userspace stack,=
 possibly
> > > > > > special-cased on a vendor id. In the end it was easier (re-)wri=
ting BPFs
> > > > > > to get the expected event node behaviour than dealing with the =
split.
> > > > > >
> > > > > > A device that arbitrarily splits makes this even more difficult=
 - which
> > > > > > one of the event nodes has buttons 1-20 and which one has 21-40=
? We'd need
> > > > > > some other magic somewhere (e.g. hiding in uniq) and some diggi=
ng around
> > > > > > in udev to figure out which ones are part of the same device.
> > > > > >
> > > > > > I'd rather not go with a simple-for-now solution that makes eve=
rything
> > > > > > in userspace more complicated, forever.
> > > > > >
> > > > > > Cheers,
> > > > > >   Peter
> > > > >
> > > > > Yes, I would also say splitting is, unfortunately, out of the que=
stion, because
> > > > > of the intended use-case of joysticks and other gaming devices. M=
ost games do
> > > > > not handle multiple inputs and only allow for one device to be se=
t up at the
> > > > > same time. This means, any buttons not present on the first devic=
e would simply
> > > > > be inaccessible and the end result would be the same as now.
> > >
> > > So how does this work with, for example, DualShock controllers. IIRC
> > > they are split into several sub-devices, such as game controller itse=
lf,
> > > accelerometer piece, and touchpad piece.
> >
> > Touchpad is easy as it's just a generic mouse. It just works as any oth=
er mouse.
> > Accelerometer can be dealt with Steam input/or maybe emulator that supp=
orts
> > gyro. But TBH, many games would just not support both gyro and buttons =
for
> > this reason. Fortunately, most games that actually need this gyro funct=
ionality
> > would be emulated as they're most likely Nintendo titles.
> >
> > >
> > > > >
> > > > > It seems like we're stuck between a rock and a hard place, but at=
 least one
> > > > > thing makes this easier. Even if a new usage shows up, it doesn't=
 really
> > > > > matter for games and especially sdl. Given button must just work,=
 and it's
> > > > > designated usage is of no concern. For all intents and purposes, =
it's just a
> > > > > random name that may or may not show up in the binding settings.
> > > > >
> > > > > Moreover, all these usages are lost in the proton translation lay=
er, and most
> > > > > games are played with it's help nowadays. For the Windows games b=
ehind wine,
> > > > > these buttons don't have any special meaning and just have number=
s.
> > >
> > > They however do have meaning for the rest of the system. SDL clients =
are
> > > not only ones who listen to input events, so if we extend the "button
> > > happy" range we will not be able to use it for anything else, like Pe=
ter
> > > said.
> > >
> > > If you do not care about meaning of the events sent out by the kernel
> > > then maybe you can "grab" the device (EVIOCGRAB) and completely overr=
ide
> > > the keymap? Will that will work for you?
> >
> > Wouldn't that defeat the whole point of input devices being HID complia=
nt, if
> > any device that wants to exceed this button range, has to have it's own=
 driver?
>
> No, not really. EVIOCGRAB is an ioctl on evdev, as well as
> EVIOCGKEYCODE_V2 and EVIOCSKEYCODE_V2. If you do not care about meaning
> the kernel assigns to the buttons you can remap usages to whatever
> (maybe withing the range of 0x160 - 0x2ff) using EVIOCSKEYCODE_V2, and
> use EVIOCGRAB to stop events being delivered to anything but your
> application (so the rest of the system is not confused).
>
> These are existing userspace APIs that SDL can use.

But to remap a usage, it would still have to be in range to actually
show up in evdev?

> What do you mean? If we go to separate event namespace then what KEY_MAX
> would have to do with it?

I guess, in that instance it maybe would not matter, as legacy
software would not
be able to read the new namespace and KEY_MAX wouldn't even be considered
there.

>
> Would it take that long to teach SDL about new event types (EV_BTN that
> Peter suggested or MSC_KEY* pairs)?
>
> Can we also talk again about the exact use case we need to solve. It is
> not a random Steam game that will make use of tens or hundreds of
> keys/buttons and only support a single input device. Don't you already
> have to deal with let's say racing wheel and pedals being separate
> devices?

SDL would be easy I think, but there are actually native linux games,
and they, sadly
have their own statically linked SDL versions. Well, nothing we can do
about it really.

Simracing equipment supports dual mode operation more often than not, to
combat the exact issues of multiple devices. Most of the time, it's recomme=
nded
to connect everything through the wheelbase. Moreover, even if such devices=
 are
connected directly through USB, they can still define a lot of buttons
just to keep
the assignments the same. My h-pattern shifter does this, as even when used
standalone, it sends its events in the 112-120 range.

The use case is I want to use every button that's available to me. My
steering wheel
has 5 rotary knobs, each has 12 states that appear as separate
buttons. This means
they alone define 60 buttons. And even If I wanted to use just one,
the buttons don't
even show up.

Currently additional buttons just overflow into the undefined range and sto=
p at
KEY_MAX, and that's why my first intention was to just increase this
define, as it
would be the fastest fix.

> I feel we are talking about pretty specialized hardware and pretty
> specialized applications and that is why I was wondering if using HID
> instead of input would not be a better choice here.

Just Racing simulators, Slight simulators, button boxes of any kind.
Honestly, anything that would make it possible to define and receive
buttons. I just wonder if it would be good to spinn off the whole joystick =
stuff
so devices like that (gamepads, wheels, etc) would have their own subsystem=
.
Current stuff could be kept for compatibility reasons, but this new compone=
nt
would take care of all the events, buttons, ranges. This would be a complet=
e
and singular source of "truth".

> >
> > Though, at some point, there won't be any more space for new key codes =
and
> > BTN_MAX will have to be increased no matter what.
>
> Yes, but the growth is slower than 60+ keycodes at time, especially if
> they to not carry any meaning but rather just placeholders.
>
> Thanks.
>
> --
> Dmitry

I'm way over my head now.
Thanks for your patience

Tomasz

