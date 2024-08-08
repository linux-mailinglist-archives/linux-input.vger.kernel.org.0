Return-Path: <linux-input+bounces-5449-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC32794C2EF
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 18:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF4E81C214BD
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 16:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B6F190489;
	Thu,  8 Aug 2024 16:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+xPz7+I"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5648719007C
	for <linux-input@vger.kernel.org>; Thu,  8 Aug 2024 16:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723135392; cv=none; b=vEniyxJ5I+m2hB6qxRruLvRU5izbROPdzePn2oUmJrRfX0PkMzi3/XMd+L/Zta/bOpptPnG3af8W3JOozXCKNOGKt8hhRlVggCHV9EW9EVnDBsZrBCviA4vsDJEiBlcY72tofmHCYr8bWhRVSDYrrAiJ0NdyHRvxh/fe9fwiBQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723135392; c=relaxed/simple;
	bh=MpZyl0dHzPjoKJAip0/FqP4n91coEiTRqUumRR8OIcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PmfeACrssOzJBP4K+WledSY9tS653cBo2WesA/SnzKw1/aC0992HMpK5RNw23kQV65XptvCJ5kNYS3sopGY1TujQ8wn8OStYWaB+wuk1xxN7czx5L6MRfx0wTSrSrE/Nl+B94DYveVKrZpPKny1S7oGJOYKmmq5SHPtRui7hxCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+xPz7+I; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52f025ab3a7so1503554e87.2
        for <linux-input@vger.kernel.org>; Thu, 08 Aug 2024 09:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723135388; x=1723740188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2xIG0cJvqpcHoG1EPJZO6ONc5Qcimf+JtZGW3mrgao=;
        b=J+xPz7+I0bTSqq/9YS07er9FYW8dIlfVHpghXSCiPuwc6FMT5MS+E4EozOXnUE/aH6
         ms53gCZ1In6XM+hiBhJSHxLQgkldNZjbWkkwHRkBCCp3AF/JJXb9foNSnWH3GrxSn7IM
         z5poN5W2MhE1e4Bg3DuvxGe2Zt4Z3KDXZOxUsE31G+BPOulMtuDZqUttwUcZeOjKzeNC
         Me+8hcUjPL/QQSUmx+zBoTtr7hT7jZ4EbcV3kQ6PlpDb7iL6G83RFKMz9KpIj+IjAZkv
         aIBnNKmGQ0ABPpwTOAwYLI+Ixgg5Y+9UI2+HlwiH71C1UJCALTctBosESIZhZQcSx1vI
         UHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723135388; x=1723740188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2xIG0cJvqpcHoG1EPJZO6ONc5Qcimf+JtZGW3mrgao=;
        b=UMmtP1mgYNMxSF8CbpYlBbtfmP6aD2DDfYsj3ruDxJvNOhfsLIUqMR3SdBlBbKt7HP
         lfPFbnazRp+u0lxgrEr7mYJxT2CebFJieBRAQy3Spq1LqnUWWlTAXNMrEwMgQi+DXOHs
         viMiKYZzK+44ckYv8vZ5nS4nrvkjg9+hS+N6wT0290xNQGuaYjchnbTgyC/upI7GtR5G
         0HrZYJNh+ItMmyN/av3yYx3TWxqshKjcuwn2x6uUVKkKEYbiPIboleYrjDAseYCBTDqm
         cB+jzWzZ2SoLFuPV1qz05AIEC4CCV+bOLxAjygJe7tOIoLb0RNI5zW741c6L6Dsra0bU
         2U6A==
X-Forwarded-Encrypted: i=1; AJvYcCXEFRMBOd3NNg1ROjouUDL7SU0TVpU3SjofzGJ9UEPQVt62YG5ZZYZXl3rMnIbsz3XRCTF0m92imtJsHt0oRy60vN2K3xlKJ0NpxpE=
X-Gm-Message-State: AOJu0YwuDCGzhOz5mCkiEgybqTgYKRFzK3A0ExvgQnjsHQs6FP9ZOwhl
	K90e0M5mmMVl39+1tl6XpjoYGJv7h6BARd2xdPGaxCPfipaDL87+sraw2lA2UHNTxd1P49eRXSR
	qh87nsRDD/XjC/hPd2iN6pBup8lsS7P1ysJ8=
X-Google-Smtp-Source: AGHT+IH25RrTjIsqvWj5dpfEXfAie4EakksSz4uhOR4gO8b7WXiCUFSfF0pu/l4MiaDPq1rseSx/chtQKkxr2cZeLik=
X-Received: by 2002:a05:6512:e99:b0:52e:8b15:7c55 with SMTP id
 2adb3069b0e04-530e58767dfmr1599542e87.27.1723135387761; Thu, 08 Aug 2024
 09:43:07 -0700 (PDT)
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
 <ZrPh9F5lhUKLLSQk@google.com> <CAFqprmwb_nDc1EgMSHMgy2KX7O9NO5WaesYASV8Vkzm2tOp2Pw@mail.gmail.com>
In-Reply-To: <CAFqprmwb_nDc1EgMSHMgy2KX7O9NO5WaesYASV8Vkzm2tOp2Pw@mail.gmail.com>
From: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
Date: Thu, 8 Aug 2024 18:42:37 +0200
Message-ID: <CAFqprmxs3VxDofat584GBX09y-Z0Xwq0qy2GAO2VQryF6+RTaQ@mail.gmail.com>
Subject: Re: [PATCH] [v2] Input: increase max button number to 0x340
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Peter Hutterer <peter.hutterer@who-t.net>, bentiss@kernel.org, 
	linux-input@vger.kernel.org, oleg@makarenk.ooo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 8 Aug 2024 at 09:46, Tomasz Paku=C5=82a
<tomasz.pakula.oficjalny@gmail.com> wrote:
>
> On Wed, 7 Aug 2024 at 23:07, Dmitry Torokhov <dmitry.torokhov@gmail.com> =
wrote:
> >
> > On Wed, Aug 07, 2024 at 10:22:13PM +0200, Tomasz Paku=C5=82a wrote:
> > > On Wed, 7 Aug 2024 at 21:01, Dmitry Torokhov <dmitry.torokhov@gmail.c=
om> wrote:
> > > >
> > > > On Wed, Aug 07, 2024 at 04:42:56PM +0800, Wei Shuai wrote:
> > > > > yes, agree. either way, will be a revolution.
> > > > >
> > > > > At least, for me as X-Plane flight simulator gamer, a small chang=
e in
> > > > > expanding the key max number can make my device work immediately
> > > > >
> > > > > Tomasz Paku=C5=82a <tomasz.pakula.oficjalny@gmail.com> =E4=BA=8E2=
024=E5=B9=B48=E6=9C=887=E6=97=A5=E5=91=A8=E4=B8=89 14:23=E5=86=99=E9=81=93=
=EF=BC=9A
> > > > > >
> > > > > > On Wed, 7 Aug 2024 at 07:17, Peter Hutterer <peter.hutterer@who=
-t.net> wrote:
> > > > > > >
> > > > > > > On Tue, Aug 06, 2024 at 09:12:24PM -0700, Dmitry Torokhov wro=
te:
> > > > > > > > > > > > 2. Can we consider using something other than EV_KE=
Y? For example we
> > > > > > > > > > > > could define EV_MSC/MSC_PROG_KEY and EV_MSC/MSG_PRO=
G_VAL pair to allow
> > > > > > > > > > > > transmitting key number and state of keys that do n=
ot have pre-defined
> > > > > > > > > > > > meaning. Here we are losing event deduplication and=
 ability to query
> > > > > > > > > > > > full keyboard state, but I wonder how important tha=
t is for the devices
> > > > > > > > > > > > in question.
> > > > > > > > > > >
> > > > > > > > > > > The same problem rears its head in the EV_ABS and EV_=
REL range, so
> > > > > > > > > > > fixing it for EV_KEY doesn't necessarily fix it for t=
hose.
> > > > > > > > > > >
> > > > > > > > > > > MSC_PROG_KEY/VAL pairs would make it difficult to sen=
d two button
> > > > > > > > > > > updates in the same frame without an SYN_MT_REPORT eq=
uivalent.
> > > > > > > >
> > > > > > > > I do not think that frame notion is that important for keys=
. It is
> > > > > > > > typically important for a pointing device state.
> > > > > > >
> > > > > > > true, I remember a conversation years back that frames aren't
> > > > > > > consistently implemented in keyboard drivers anyway which is =
the reason
> > > > > > > libinput sends (most) EV_KEY events immediately instad of wai=
ting for a
> > > > > > > SYN_REPORT.
> > > > > > >
> > > > > > > > > > All in all, we've had people using this patch (but incr=
easing KEY_MAX to a
> > > > > > > > > > whopping 0x4ff) for the past few years with no adverse =
effects. I've been
> > > > > > > > > > using a custom Linux kernel with this patch on my Arch =
machine since about
> > > > > > > > > > May, and didn't notice anything, even when compiling wi=
th debug flags and
> > > > > > > > > > following and filtering dmesg.
> > > > > > > > > >
> > > > > > > > > > So here's the thing I'm most curious about. Is this som=
ething, you'd just
> > > > > > > > > > want to resolve differently, to make it nicer and more =
logical, or is this
> > > > > > > > > > really something that would break everything and doing =
it in this way will
> > > > > > > > > > never be allowed/merged? That would make a lot of us sa=
d :(
> > > > > > > >
> > > > > > > > We need to figure out not only how to handle your class of =
devices, but
> > > > > > > > also allow extending number of keys that do have certain se=
mantic
> > > > > > > > meaning. Peter raised a lot of questions that we need to an=
swer.
> > > > > > > >
> > > > > > > > But I wonder, these devices with large number of buttons th=
at do not
> > > > > > > > have predefined meaning - do they have to be a single input=
 device? Can
> > > > > > > > we create N input devices if we exceed the "trigger happy" =
range, all of
> > > > > > > > them mapping to "trigger happy"? That would mean that users=
pace would
> > > > > > > > keep track of key assignment on per-device basis.
> > > > > > > >
> > > > > > > > We already split HID devices on per-apllication (not usersp=
ace but HID
> > > > > > > > application) basis, and also when there are several USB int=
erfaces.
> > > > > > >
> > > > > > > Honestly, I'd vote against this.
> > > > > > > re-combining input devices into a single device in userspace =
is a pain.
> > > > > > > The split per application in HID is mostly fine because they'=
re
> > > > > > > usually physically different devices but I recently ran into =
the issue
> > > > > > > with the uclogic drivers where various features are split acr=
oss
> > > > > > > event nodes. Thse devices have the ring on one event node, th=
e buttons
> > > > > > > on another, etc. Nothing in (my) userspace is currently set u=
p for this
> > > > > > > and it'd require a major rework in many places to be able to =
handle this
> > > > > > > properly. And it requires that rework in every userspace stac=
k, possibly
> > > > > > > special-cased on a vendor id. In the end it was easier (re-)w=
riting BPFs
> > > > > > > to get the expected event node behaviour than dealing with th=
e split.
> > > > > > >
> > > > > > > A device that arbitrarily splits makes this even more difficu=
lt - which
> > > > > > > one of the event nodes has buttons 1-20 and which one has 21-=
40? We'd need
> > > > > > > some other magic somewhere (e.g. hiding in uniq) and some dig=
ging around
> > > > > > > in udev to figure out which ones are part of the same device.
> > > > > > >
> > > > > > > I'd rather not go with a simple-for-now solution that makes e=
verything
> > > > > > > in userspace more complicated, forever.
> > > > > > >
> > > > > > > Cheers,
> > > > > > >   Peter
> > > > > >
> > > > > > Yes, I would also say splitting is, unfortunately, out of the q=
uestion, because
> > > > > > of the intended use-case of joysticks and other gaming devices.=
 Most games do
> > > > > > not handle multiple inputs and only allow for one device to be =
set up at the
> > > > > > same time. This means, any buttons not present on the first dev=
ice would simply
> > > > > > be inaccessible and the end result would be the same as now.
> > > >
> > > > So how does this work with, for example, DualShock controllers. IIR=
C
> > > > they are split into several sub-devices, such as game controller it=
self,
> > > > accelerometer piece, and touchpad piece.
> > >
> > > Touchpad is easy as it's just a generic mouse. It just works as any o=
ther mouse.
> > > Accelerometer can be dealt with Steam input/or maybe emulator that su=
pports
> > > gyro. But TBH, many games would just not support both gyro and button=
s for
> > > this reason. Fortunately, most games that actually need this gyro fun=
ctionality
> > > would be emulated as they're most likely Nintendo titles.
> > >
> > > >
> > > > > >
> > > > > > It seems like we're stuck between a rock and a hard place, but =
at least one
> > > > > > thing makes this easier. Even if a new usage shows up, it doesn=
't really
> > > > > > matter for games and especially sdl. Given button must just wor=
k, and it's
> > > > > > designated usage is of no concern. For all intents and purposes=
, it's just a
> > > > > > random name that may or may not show up in the binding settings=
.
> > > > > >
> > > > > > Moreover, all these usages are lost in the proton translation l=
ayer, and most
> > > > > > games are played with it's help nowadays. For the Windows games=
 behind wine,
> > > > > > these buttons don't have any special meaning and just have numb=
ers.
> > > >
> > > > They however do have meaning for the rest of the system. SDL client=
s are
> > > > not only ones who listen to input events, so if we extend the "butt=
on
> > > > happy" range we will not be able to use it for anything else, like =
Peter
> > > > said.
> > > >
> > > > If you do not care about meaning of the events sent out by the kern=
el
> > > > then maybe you can "grab" the device (EVIOCGRAB) and completely ove=
rride
> > > > the keymap? Will that will work for you?
> > >
> > > Wouldn't that defeat the whole point of input devices being HID compl=
iant, if
> > > any device that wants to exceed this button range, has to have it's o=
wn driver?
> >
> > No, not really. EVIOCGRAB is an ioctl on evdev, as well as
> > EVIOCGKEYCODE_V2 and EVIOCSKEYCODE_V2. If you do not care about meaning
> > the kernel assigns to the buttons you can remap usages to whatever
> > (maybe withing the range of 0x160 - 0x2ff) using EVIOCSKEYCODE_V2, and
> > use EVIOCGRAB to stop events being delivered to anything but your
> > application (so the rest of the system is not confused).
> >
> > These are existing userspace APIs that SDL can use.
>
> But to remap a usage, it would still have to be in range to actually
> show up in evdev?
>
> > What do you mean? If we go to separate event namespace then what KEY_MA=
X
> > would have to do with it?
>
> I guess, in that instance it maybe would not matter, as legacy
> software would not
> be able to read the new namespace and KEY_MAX wouldn't even be considered
> there.
>
> >
> > Would it take that long to teach SDL about new event types (EV_BTN that
> > Peter suggested or MSC_KEY* pairs)?
> >
> > Can we also talk again about the exact use case we need to solve. It is
> > not a random Steam game that will make use of tens or hundreds of
> > keys/buttons and only support a single input device. Don't you already
> > have to deal with let's say racing wheel and pedals being separate
> > devices?
>
> SDL would be easy I think, but there are actually native linux games,
> and they, sadly
> have their own statically linked SDL versions. Well, nothing we can do
> about it really.
>
> Simracing equipment supports dual mode operation more often than not, to
> combat the exact issues of multiple devices. Most of the time, it's recom=
mended
> to connect everything through the wheelbase. Moreover, even if such devic=
es are
> connected directly through USB, they can still define a lot of buttons
> just to keep
> the assignments the same. My h-pattern shifter does this, as even when us=
ed
> standalone, it sends its events in the 112-120 range.
>
> The use case is I want to use every button that's available to me. My
> steering wheel
> has 5 rotary knobs, each has 12 states that appear as separate
> buttons. This means
> they alone define 60 buttons. And even If I wanted to use just one,
> the buttons don't
> even show up.
>
> Currently additional buttons just overflow into the undefined range and s=
top at
> KEY_MAX, and that's why my first intention was to just increase this
> define, as it
> would be the fastest fix.
>
> > I feel we are talking about pretty specialized hardware and pretty
> > specialized applications and that is why I was wondering if using HID
> > instead of input would not be a better choice here.
>
> Just Racing simulators, Slight simulators, button boxes of any kind.
> Honestly, anything that would make it possible to define and receive
> buttons. I just wonder if it would be good to spinn off the whole joystic=
k stuff
> so devices like that (gamepads, wheels, etc) would have their own subsyst=
em.
> Current stuff could be kept for compatibility reasons, but this new compo=
nent
> would take care of all the events, buttons, ranges. This would be a compl=
ete
> and singular source of "truth".
>
> > >
> > > Though, at some point, there won't be any more space for new key code=
s and
> > > BTN_MAX will have to be increased no matter what.
> >
> > Yes, but the growth is slower than 60+ keycodes at time, especially if
> > they to not carry any meaning but rather just placeholders.
> >
> > Thanks.
> >
> > --
> > Dmitry
>
> I'm way over my head now.
> Thanks for your patience
>
> Tomasz

I dug around the kernel some more, and have few ideas and questions I would=
 like
to pose, before I send out another patch and make a fool of myself.

1. For the compatible solution, and I know this might sound
sacreligious, but would it
be at all considered ok, if joysticks could use the KEY_MACRO range?
Current behavior
in hid-input.c is to just add (BTN_TRIGGER_HAPPY - 0x10) after 16 buttons.
KEY_MACRO range lies directly beneath TRIGGER_HAPPY so we would only replac=
e
BTN_TRIGGER_HAPPY with KEY_MACRO1. I know this is not their intended use, b=
ut
their description says "Some keyboards have keys which do not have a
defined meaning,
these keys are intended to be programmed / bound to macros by the user"

Binding buttons to do some actions sounds just like a dame controller,
in a way :P
I already tested this change and it enabled over 40 additional buttons
without the need
to intervene in software. This was picked up by SDL, proton, firefox
and basically
everything, as these usages are obviously not crossing KEY_MAX.

To squeeze just a little bit more, we could utilize the BTN_0 to BTN_9
range. I couldn't
find their meaning, but I suppose the definition of a joystick/gamepad
could be stretched
to include these.

2. For the better, more scalable solution, your proposition from the
start is the best one.
I thought that overflowing buttons could be just hardcoded to one
selected usage in
hid-input.c. Be it BTN_MISC, BTN_JOYSTICK. Deduplication would make sure, t=
hey
don't actually send any bogus EV_KEY events.

Let's take a look at usage setup in hid-input.c
We can see that if a usage is from EV_KEY range, EV_MSC usage is always app=
ended
and it will send not only EV_KEY events, but EV_MSC MSC_SCAN events as well=
.

if (usage->type =3D=3D EV_KEY) {
    set_bit(EV_MSC, input->evbit);
    set_bit(MSC_SCAN, input->mscbit);
}

This sadly comes AFTER deduplication. It would probably be better to
set it explicitly in the
joystick/gamepad switch entry. MSC_SCAN already has a value that seems
to depend on the
button number, but a dedicated MSC_PROG_KEY would indeed be better
suited for this, along
with MSC_PROG_VAL, as you said, as MSC_SCAN and MSC_PROG_KEY would not cont=
ain
it. Or maybe we could do some bit magic and send the state with the
value. MSG could indicate
state. This is a bit less self explanatory but we only need to handle one e=
vent.

Now, software such as SDL could be changed so it doesn't care about
usages at all, and
gets the button number from these two. A legacy path could be retained
as detection could be
based on the existence of these MSC_PROG_* events.

Cheers
Tomasz

