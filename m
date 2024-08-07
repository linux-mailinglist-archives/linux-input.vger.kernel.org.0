Return-Path: <linux-input+bounces-5411-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8627794B130
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 22:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA6BC1C21CC8
	for <lists+linux-input@lfdr.de>; Wed,  7 Aug 2024 20:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5E96F315;
	Wed,  7 Aug 2024 20:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWnli/mR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C215C364BC
	for <linux-input@vger.kernel.org>; Wed,  7 Aug 2024 20:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723062149; cv=none; b=GRGkyp0ncJerxgStDSostIXY1v5Oakb58lfoOCprGr2o/GqovrlB6iCrCwzcjiBYY+A1/QE5SUiH2p/aTquio/rKd6i9y+6aXkjOEq1hyGy9IILAaNew0tkztJiAOMAwAHCg8SDhGlzJyfQC9Z1ZUfN27y3bimA/1IZ7txV+J4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723062149; c=relaxed/simple;
	bh=xu31sJcGRnKqFjmxeqtOrntw73uYRc1DkKSzTnf6YnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgNCui/GZdtbYBn9f7WRP1hHot3rQxmYFSGqJtR/HiIetvb0EoCHo72isj2InX6hLvhnsdH1mSUxa+JdxQdC1FSFWDYfdMgu/zAF+3iXy/3R0fp6Iv13n4gTvvPsIHfoZaCIOjNE+Qx9L7n4pDu/kW5DnNNfhXJl4DTZe7vWOQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWnli/mR; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5a1c496335aso64321a12.1
        for <linux-input@vger.kernel.org>; Wed, 07 Aug 2024 13:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723062146; x=1723666946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgrEcGfWSFeH6MU1fTKId1V2ipRgyCZ4th0m/RD7O9c=;
        b=iWnli/mRxpe/Nr6F2xd6jPnBB4S+gPiIVAYfxO7ZwFGzKeRwX8x31svQktzsKuHNjy
         ivSxAfi2rEqT8fiO4kEDDkO+d/QbR2F2lnNIbneZ1IZhTEzPh8b+qEgs8mFB28dDDsVc
         CJL6wUxRJLkXqoaZ3YTMiVmaDj8KhBrs5crlB+OG0hoKohKsnoq47LF25BwZ1vbzAzuD
         oKzFGw7/E19trfe8mNcxHknBq9gFzhmk+MWHKgOpyMwMnvrsMOECt2KNIS8OYot0eY8u
         AorHPc8PmpYc+PaNPRJ6oR8+PND6vbK0LJ7CNVUN1suVk3DeEXIMTHfewe78Lyk/uJms
         NW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723062146; x=1723666946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgrEcGfWSFeH6MU1fTKId1V2ipRgyCZ4th0m/RD7O9c=;
        b=nye3fRYV2l/DMC9K4BsAV7z3P5AxB5zxZab4orzay2atE0NkcsjLOOUw3rcQKbJ7g2
         oXmGO9Smqnk0aKFPEa6O2O6+/GQXGu60l8H23AXzbQ/RCDMv0n2nVwQ7b43sLTIeBf2O
         fFOKCl/yXpO+FUTPhnMJ3MuPh9/tQ1TDjQYRPw6lJSuDu+cz2FcK3tAB9+4arnS4XL4w
         lmHbR1/6WwGzFprOS+IQkRojyrteDRsNuH+mZzPwfL0lcfxu+tWOYUkr4aNaiHfwemA/
         ud7QaSWAlSOTYIzaGYvBFQ5ctGwIKGANtTwo6ovXPXJB/bCw1Hh55x/HEuooKn2QtIrh
         YutA==
X-Forwarded-Encrypted: i=1; AJvYcCX+K2J/XW4BK2y+xNzuDAAw3AddDrkljm8oJdWQUPQvRuUjWtp8eWkABpST2Ab0yI8K69HvhxfMZZ+8KJe5ymFeJ+pABy3vQ5zPREI=
X-Gm-Message-State: AOJu0YyzDGDcC5+5Cbu3ebPZgKOFD2CSh9+rraN/skB2h7OSIMZsYXkt
	ixpk9/IMJ6ubR0zvR4UnjhWDz2YoZwg4XEvigYIKJUnJpI0yXZ/HRhMXGyNc2EAEorVRK+ARPwa
	oc5i8vlUgvJVFwTnmWxxbx7MFpGbQMcBlMeQ=
X-Google-Smtp-Source: AGHT+IGc7lpuPT2Ch9joCf4xJFSz0sLGhPZ3avyEzVw/jPXSjvhxddA4NvMX4VDXesx9323kv9DNUcKqNdKU5YiHuMY=
X-Received: by 2002:a05:6402:457:b0:5a3:d140:1a57 with SMTP id
 4fb4d7f45d1cf-5b7f3502166mr18066885a12.1.1723062145796; Wed, 07 Aug 2024
 13:22:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240802201001.406898-1-tomasz.pakula.oficjalny@gmail.com>
 <Zq1ypyDxAVQsjpjB@google.com> <20240805053445.GA3149961@quokka>
 <CAFqprmwOR7i+gA6hcou3NkY_CZXVANfSQVq6f_ZAAkHGmNLqZA@mail.gmail.com>
 <20240807031245.GA3526220@quokka> <ZrL0KD9yDnfHMbL-@google.com>
 <20240807051708.GA3551201@quokka> <CAFqprmwT5tzvTg92eAobN8s1zdAUsBUm2P9X6NjbdcMR33ijww@mail.gmail.com>
 <CACa7zymOLKZE03xQMGG3ZS=sJLrjAN1Xk6MKkZuCKzmpS4pPVA@mail.gmail.com> <ZrPEgZ9_ahKx2WTu@google.com>
In-Reply-To: <ZrPEgZ9_ahKx2WTu@google.com>
From: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Date: Wed, 7 Aug 2024 22:22:13 +0200
Message-ID: <CAFqprmwT2ppX5S+KXrCebuw=PCtZNu+6C0Y95=Ld-uWVOa331Q@mail.gmail.com>
Subject: Re: [PATCH] [v2] Input: increase max button number to 0x340
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Wei Shuai <cpuwolf@gmail.com>, Peter Hutterer <peter.hutterer@who-t.net>, bentiss@kernel.org, 
	linux-input@vger.kernel.org, oleg@makarenk.ooo, torvalds@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 7 Aug 2024 at 21:01, Dmitry Torokhov <dmitry.torokhov@gmail.com> wr=
ote:
>
> On Wed, Aug 07, 2024 at 04:42:56PM +0800, Wei Shuai wrote:
> > yes, agree. either way, will be a revolution.
> >
> > At least, for me as X-Plane flight simulator gamer, a small change in
> > expanding the key max number can make my device work immediately
> >
> > Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com> =E4=BA=8E2024=E5=
=B9=B48=E6=9C=887=E6=97=A5=E5=91=A8=E4=B8=89 14:23=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Wed, 7 Aug 2024 at 07:17, Peter Hutterer <peter.hutterer@who-t.net=
> wrote:
> > > >
> > > > On Tue, Aug 06, 2024 at 09:12:24PM -0700, Dmitry Torokhov wrote:
> > > > > > > > > 2. Can we consider using something other than EV_KEY? For=
 example we
> > > > > > > > > could define EV_MSC/MSC_PROG_KEY and EV_MSC/MSG_PROG_VAL =
pair to allow
> > > > > > > > > transmitting key number and state of keys that do not hav=
e pre-defined
> > > > > > > > > meaning. Here we are losing event deduplication and abili=
ty to query
> > > > > > > > > full keyboard state, but I wonder how important that is f=
or the devices
> > > > > > > > > in question.
> > > > > > > >
> > > > > > > > The same problem rears its head in the EV_ABS and EV_REL ra=
nge, so
> > > > > > > > fixing it for EV_KEY doesn't necessarily fix it for those.
> > > > > > > >
> > > > > > > > MSC_PROG_KEY/VAL pairs would make it difficult to send two =
button
> > > > > > > > updates in the same frame without an SYN_MT_REPORT equivale=
nt.
> > > > >
> > > > > I do not think that frame notion is that important for keys. It i=
s
> > > > > typically important for a pointing device state.
> > > >
> > > > true, I remember a conversation years back that frames aren't
> > > > consistently implemented in keyboard drivers anyway which is the re=
ason
> > > > libinput sends (most) EV_KEY events immediately instad of waiting f=
or a
> > > > SYN_REPORT.
> > > >
> > > > > > > All in all, we've had people using this patch (but increasing=
 KEY_MAX to a
> > > > > > > whopping 0x4ff) for the past few years with no adverse effect=
s. I've been
> > > > > > > using a custom Linux kernel with this patch on my Arch machin=
e since about
> > > > > > > May, and didn't notice anything, even when compiling with deb=
ug flags and
> > > > > > > following and filtering dmesg.
> > > > > > >
> > > > > > > So here's the thing I'm most curious about. Is this something=
, you'd just
> > > > > > > want to resolve differently, to make it nicer and more logica=
l, or is this
> > > > > > > really something that would break everything and doing it in =
this way will
> > > > > > > never be allowed/merged? That would make a lot of us sad :(
> > > > >
> > > > > We need to figure out not only how to handle your class of device=
s, but
> > > > > also allow extending number of keys that do have certain semantic
> > > > > meaning. Peter raised a lot of questions that we need to answer.
> > > > >
> > > > > But I wonder, these devices with large number of buttons that do =
not
> > > > > have predefined meaning - do they have to be a single input devic=
e? Can
> > > > > we create N input devices if we exceed the "trigger happy" range,=
 all of
> > > > > them mapping to "trigger happy"? That would mean that userspace w=
ould
> > > > > keep track of key assignment on per-device basis.
> > > > >
> > > > > We already split HID devices on per-apllication (not userspace bu=
t HID
> > > > > application) basis, and also when there are several USB interface=
s.
> > > >
> > > > Honestly, I'd vote against this.
> > > > re-combining input devices into a single device in userspace is a p=
ain.
> > > > The split per application in HID is mostly fine because they're
> > > > usually physically different devices but I recently ran into the is=
sue
> > > > with the uclogic drivers where various features are split across
> > > > event nodes. Thse devices have the ring on one event node, the butt=
ons
> > > > on another, etc. Nothing in (my) userspace is currently set up for =
this
> > > > and it'd require a major rework in many places to be able to handle=
 this
> > > > properly. And it requires that rework in every userspace stack, pos=
sibly
> > > > special-cased on a vendor id. In the end it was easier (re-)writing=
 BPFs
> > > > to get the expected event node behaviour than dealing with the spli=
t.
> > > >
> > > > A device that arbitrarily splits makes this even more difficult - w=
hich
> > > > one of the event nodes has buttons 1-20 and which one has 21-40? We=
'd need
> > > > some other magic somewhere (e.g. hiding in uniq) and some digging a=
round
> > > > in udev to figure out which ones are part of the same device.
> > > >
> > > > I'd rather not go with a simple-for-now solution that makes everyth=
ing
> > > > in userspace more complicated, forever.
> > > >
> > > > Cheers,
> > > >   Peter
> > >
> > > Yes, I would also say splitting is, unfortunately, out of the questio=
n, because
> > > of the intended use-case of joysticks and other gaming devices. Most =
games do
> > > not handle multiple inputs and only allow for one device to be set up=
 at the
> > > same time. This means, any buttons not present on the first device wo=
uld simply
> > > be inaccessible and the end result would be the same as now.
>
> So how does this work with, for example, DualShock controllers. IIRC
> they are split into several sub-devices, such as game controller itself,
> accelerometer piece, and touchpad piece.

Touchpad is easy as it's just a generic mouse. It just works as any other m=
ouse.
Accelerometer can be dealt with Steam input/or maybe emulator that supports
gyro. But TBH, many games would just not support both gyro and buttons for
this reason. Fortunately, most games that actually need this gyro functiona=
lity
would be emulated as they're most likely Nintendo titles.

>
> > >
> > > It seems like we're stuck between a rock and a hard place, but at lea=
st one
> > > thing makes this easier. Even if a new usage shows up, it doesn't rea=
lly
> > > matter for games and especially sdl. Given button must just work, and=
 it's
> > > designated usage is of no concern. For all intents and purposes, it's=
 just a
> > > random name that may or may not show up in the binding settings.
> > >
> > > Moreover, all these usages are lost in the proton translation layer, =
and most
> > > games are played with it's help nowadays. For the Windows games behin=
d wine,
> > > these buttons don't have any special meaning and just have numbers.
>
> They however do have meaning for the rest of the system. SDL clients are
> not only ones who listen to input events, so if we extend the "button
> happy" range we will not be able to use it for anything else, like Peter
> said.
>
> If you do not care about meaning of the events sent out by the kernel
> then maybe you can "grab" the device (EVIOCGRAB) and completely override
> the keymap? Will that will work for you?

Wouldn't that defeat the whole point of input devices being HID compliant, =
if
any device that wants to exceed this button range, has to have it's own dri=
ver?

>
> > >
> > > While I understand that a new usage might show up someday, I wonder h=
ow
> > > likely it is in the near future.
>
> dtor@dtor-ws:~/kernel/work $ git log --oneline --since=3D01-01-2024 -- in=
clude/uapi/linux/input-event-codes.h
> 22d6d060ac77 input: Add support for "Do Not Disturb"
> 0c7dd00de018 input: Add event code for accessibility key
> cfeb98b95fff Input: allocate keycode for Display refresh rate toggle
>
> 3 new ones since the beginning of the year.
>
>
> > > TRIGGER_HAPPY range was added about 20 years
> > > ago? For me, as a 27 year old it seems like a lifetime ago.
>
> 2010 so only 14 years ;)
>
> > >
> > > I guess my point is that if we were to increase these button ranges i=
n ANY
> > > different way than increasing this limit, we would still need massive=
 movement
> > > to get all the software to handle these new cases, if they ever would=
 actually
> > > care/have resources to do so.
>
> Yes, but this is the right thing to do. Otherwise next year you will
> create a joystick with 512 buttons and we will be back to square one.
> After all we though that 40 extra buttons should be more than enough,
> and we were wrong.
>
> Thanks.
>
> --
> Dmitry

Wouldn't that defeat the whole point of input devices being HID compliant, =
if
any device that wants to exceed this button range, has to have it's own dri=
ver?

I just about understand your reasoning, but I assume this would actually ta=
ke
years to implement across userspace, not mentioning first we would need wor=
k
to happen inside kernel, and that would take another bunch of time as this
isn't a priority to just about anyone who would have the actual knowledge t=
o
come up with a sane solution. Not mentioning the fact, that just having BTN=
_MAX
defined in the first place would rear it's ugly head.

Yeas, 512 buttons MIGHT be doable, but the truth is, there are A LOT of dev=
ices
with over 80 buttons (and BTN_TRIGGER_HAPPY range actually ends at button 5=
7),
over 140 though? Not so much, if any. Extending BTN_TRIGGER_HAPPY range by
another 60 usages is just THE fix for current state of input. If it is just
too ugly then I guess that's that. Sadly, it would seem that this issue
won't be resolved for years in that case. 2030?

Though, at some point, there won't be any more space for new key codes and
BTN_MAX will have to be increased no matter what.

At least I gathered some much needed info and insight. Still compiling my o=
wn
kernel every time is not something I look for :/

Respectfully
Tomasz

