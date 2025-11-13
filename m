Return-Path: <linux-input+bounces-16111-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 07701C5A164
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 22:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 36FE03425FD
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 21:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9DB31B839;
	Thu, 13 Nov 2025 21:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="g86tM0Sh"
X-Original-To: linux-input@vger.kernel.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6C6261B6D
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 21:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763068681; cv=none; b=jalwOIFRO9tfff8KwIuwrJMNM4r54rZyqSRLnuvehlaBmKx5bOJdzxbkU29MmfwcIMYBI8eBtRpGUOgN2g4GwDqcvQN/HQkNaiiTSqG52FDr+U3Kc/tcgffiGG051n0gHU0Ik8vfELd2iL7xqpBzRsVj3RaR++mFFjm385r2ZHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763068681; c=relaxed/simple;
	bh=GlfkTITwtbJlkX8k2q2QKcFvhfN7w1HpqQyMEV7y9BI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oXdNrJkB//QGINB/PmmDYvz5WCAL9vhPN5TB4Myf1An+jC60fOHkq+j0gm2eJ15EzH6CRusHRejwX3xm6v1NqbvK3VujpSgN0F1V+g2PBT6LOsHBqQZx+s1N7L0iDMoSPUo7qP1NEEwtoA9o+sFhnlVwwkVDpl6QG8xviuX8klk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=g86tM0Sh; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 704C4BD98F
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 23:17:51 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id D08A0BCF37
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 23:17:49 +0200 (EET)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id E9E1E200A65
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 23:17:48 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763068669;
	bh=/7lvFGiPFi+90c5g2k0MaW/3TKAppygH7KbvwXTOU/E=;
	h=Received:From:Subject:To;
	b=g86tM0Shx2LDmJ+N2Wqmi3opreQRhq8PReZZ+NtMEv65rM0GzEQrIu4U6li5beVTm
	 WlCTUTanCVyuxiYCWP7A8PPOF6ESZduQ3vEemiwDOXvq49j0hDOUGUSNEdCHJeTE2Z
	 aDhAyvDOaqzNtCewmy4SmkdrUiMjjcdSfOn+W3TVMkFH54RogPgJ6pM6xMDIFVApiA
	 oXTCYhMc7eytXG1mjs/+KY+5TeSeRJzXCzJDXXGeByvBm2oxMXDS2oQgtJuwc/AK9F
	 QxGS16do0isYt4jk7zzt1Bapbsyv2yL0oDoc7uG/MysOaVhUV3rub+hMVMktdqcqa0
	 5wNLzTLxwF6CQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.179) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f179.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-37a5bc6b491so10342071fa.0
        for <linux-input@vger.kernel.org>;
 Thu, 13 Nov 2025 13:17:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWSGsDapgiZ4lBCIXGnVinduAadpLGNTe3gtweGHsZlxvmmfVSiwXiuwD99OuYF8yhYOoBVBAmEvzgo9A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoXiwPItpmk2uZ3UJUTorcctgHAdFNyE3VhxOKEuXmglOCvmbg
	24FHDUJPVjdO5Ogk7dUAs8c0JsisObg1lpsHkiN9DCklLY3+riV/31wG/4JXFJvu+49p0OJ6ytx
	99+ex6Q/dBIe+E5og7E8kh45x42LGt1w=
X-Google-Smtp-Source: 
 AGHT+IHXUkbjkZUqdigPK77UGAiDHp0dncnzw/kcI0J6M6GQn5n3J9PyT8HuvyClOKh594mgbo0DU7w/FmI7wT1TAMM=
X-Received: by 2002:a2e:9ace:0:b0:372:904d:add4 with SMTP id
 38308e7fff4ca-37babd35f8amr641131fa.28.1763068668207; Thu, 13 Nov 2025
 13:17:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251101104712.8011-1-lkml@antheas.dev>
 <CAGwozwE+3vkm0-amRqnNJBzxTvXabgBF9h_G_vG_L7OJj91LBg@mail.gmail.com>
 <27a74ecc-bff7-f3ae-b23e-a8362ac3a6b3@linux.intel.com>
 <CAGwozwGpacR=wYXpf3vOiwWNxaV6pJ6CdE-E-G1gRRpO4VHVMg@mail.gmail.com>
 <74f91d3c-6494-4754-a10f-4d8c1d45f7ff@gmail.com>
 <CAGwozwEKqqJxxmtjJhy2MzNVhmBTMmy8xG5TZGkKJqJCgK=X5w@mail.gmail.com>
 <4671d267-d823-4bf7-af30-b587e67dec49@gmail.com>
 <CAGwozwFDm80YuC9AfES2d7Xk2bnCNPjHtgXCz5gZuh7fuajHgg@mail.gmail.com>
 <AC058796-5255-41AE-93A1-1D5382F8FDDE@ljones.dev>
In-Reply-To: <AC058796-5255-41AE-93A1-1D5382F8FDDE@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 13 Nov 2025 22:17:36 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGwtivKnC6ucCGwJiu2yLLbddFXG+jYTaMTwU4Zt=CAfQ@mail.gmail.com>
X-Gm-Features: AWmQ_bmbLoT-gE2sUjF0qZgVXh6pLJ-giHgVzfgJiuNiLNGERg49wzJ1DOX7rEg
Message-ID: 
 <CAGwozwGwtivKnC6ucCGwJiu2yLLbddFXG+jYTaMTwU4Zt=CAfQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: luke@ljones.dev
Cc: Denis Benato <benato.denis96@gmail.com>,
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176306866919.647427.11048506813662191871@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 13 Nov 2025 at 21:23, <luke@ljones.dev> wrote:
>
>
> > On 13 Nov 2025, at 21:44, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> >
> > On Thu, 13 Nov 2025 at 02:14, Denis Benato <benato.denis96@gmail.com> w=
rote:
> >>
> >>
> >> On 11/12/25 23:08, Antheas Kapenekakis wrote:
> >>> On Wed, 12 Nov 2025 at 20:51, Denis Benato <benato.denis96@gmail.com>=
 wrote:
> >>>>
> >>>> On 11/12/25 14:41, Antheas Kapenekakis wrote:
> >>>>> On Wed, 12 Nov 2025 at 14:22, Ilpo J=C3=A4rvinen
> >>>>> <ilpo.jarvinen@linux.intel.com> wrote:
> >>>>>> On Wed, 12 Nov 2025, Antheas Kapenekakis wrote:
> >>>>>>
> >>>>>>> On Sat, 1 Nov 2025 at 11:47, Antheas Kapenekakis <lkml@antheas.de=
v> wrote:
> >>>>>>>> This is a two part series which does the following:
> >>>>>>>>  - Clean-up init sequence
> >>>>>>>>  - Unify backlight handling to happen under asus-wmi so that all=
 Aura
> >>>>>>>>    devices have synced brightness controls and the backlight but=
ton works
> >>>>>>>>    properly when it is on a USB laptop keyboard instead of one w=
/ WMI.
> >>>>>>>>
> >>>>>>>> For more context, see cover letter of V1. Since V5, I removed so=
me patches
> >>>>>>>> to make this easier to merge.
> >>>>>>> Small bump for this.
> >>>>>> I looked at v8 earlier but then got an impression some of Denis' c=
omments
> >>>>>> against v7 were not taken into account in v8, which implies there =
will be
> >>>>>> delay until I've time to delve into the details (I need to underst=
and
> >>>>>> things pretty deeply in such a case, which does take lots of time)=
.
> >>>>>>
> >>>>>> Alternatively, if Denis says v8 is acceptable, then I don't need t=
o spend
> >>>>>> so much time on it, but somehow I've a feeling he isn't happy with=
 v8
> >>>>>> but just hasn't voiced it again...
> >>>>>>
> >>>>>> Please do realize that ignoring reviewer feedback without a very v=
ery good
> >>>>>> reason always risks adding delay or friction into getting things
> >>>>>> upstreamed. Especially, when the review comes from a person who ha=
s been
> >>>>>> around for me to learn to trust their reviews or from a maintainer=
 of the
> >>>>>> code in question.
> >>>>> Sure, sorry if it came out this way. Dennis had two comments on the=
 V7
> >>>>> version of the series.
> >>>>>
> >>>>> The first one was that asusctl has a hang bug, which he hasn't had
> >>>>> time to look into yet. This should have been fixed by dropping the
> >>>>> HID_QUIRK_INPUT_PER_APP. I retested the series and that QUIRK was a
> >>>>> bit of a NOOP that does not need to be added in the future.
> >>>> So it is supposed to not regress it now, correct?
> >>>>> The second is he is concerned with dropping the 0x5d/0x5e inits. Lu=
ke
> >>>>> said (back in March) that it is fine to drop 0x5e because it is onl=
y
> >>>>> used for ANIME displays. However, for 0x5d, it is hard to verify so=
me
> >>>>> of the older laptops because they have only been tested with 0x5d a=
nd
> >>>>> we do not have the hardware in question to test.
> >>>>>
> >>>>> For this series, I re-added "initialize LED endpoint early for old
> >>>>> NKEY keyboards" that re-adds 0x5d for the keyboards that cannot be
> >>>>> tested again so this comment should be resolved too. With that in
> >>>>> mind, we do end up with an additional quirk/command that may be
> >>>>> unneeded and will remain there forever, but since it was a point of
> >>>>> contention, it is not worth arguing over.
> >>>>>
> >>>>> So both comments should be resolved
> >>>> The driver should also not late-initialize anything.
> >>>>
> >>>> Windows doesn't do it and the official asus application
> >>>> can freely send LEDs changing commands to either WMI or USB
> >>>> so I don't see any reason to do things differently [than windows]
> >>>> and not prepare every USB endpoint to receive commands,
> >>>> this has not been addressed unless I confused v7 and v8?
> >>> Yes, it's been added on v8. 0x5d is init for the laptops it is
> >>> problematic for. Not because it does not work, but because it has not
> >>> been verified to work for those laptops.
> >> I am not sure I am reading this right:
> >> are you telling me that on recent models the windows driver
> >> doesn't issue 0x5d?
> >
> > Try to add spaces in your replies. This is hard to follow.
> >
> > Do not conflate driver with software. 0x5a (over the application
> > 0xff310076) has traditionally been used by a driver in Windows to
> > control the backlight level, as it is done in this driver. 0x5d (over
> > the application 0xff310079) is only used by laptops with RGB by
> > Armoury crate. But this driver does not do RGB. No device
> > functionality relies on it being sent for any device I've seen. The
> > device remembers its Windows settings, incl. the backlight color, in
> > the absence of a driver.
> >
> > Laptops without RGB such as the Duo series which I would like to add
> > support for next only have a 0x5a endpoint. But, they are sent garbage
> > inits for 0x5d and 0x5e currently. This should be fixed.
> >
> > Moreso, it seems that Armoury crate on the Xbox Ally series uses
> > exclusively 0x5a commands and if you use 0x5d it ignores them (perhaps
> > RGB still works though). With the previous generation, commands worked
> > for either report id.
> >
> >>>>> @Denis: can give an ack if this is the case?
> >>>>>
> >>>>> As for Derek's comment, he has a PR for his project where he remove=
s
> >>>>> the name match for Ally devices with ample time for it to be merged
> >>>>> until kernel 6.19 is released. In addition, that specific software =
for
> >>>>> full functionality relies on OOT drivers on the distros it ships wi=
th,
> >>>>> so it is minimally affected in either case.
> >>>> The part we are talking about depends on this driver (hid-asus)
> >>>> and there are people on asus-linux community using inputplumber
> >>>> for non-ally devices (the OOT driver is only for ally devices)
> >>>> therefore it is very important to us (and various other distribution=
s)
> >>>> not to break that software in any way.
> >>> This driver is only used for Ally devices. If you mean that people
> >>> remap their keyboards using inputplumber I guess they could but I hav=
e
> >>> not seen it.
> >> I meant people remap keyboards using IP. I am sure there were
> >> (and very probably still are) people doing that.
> >>>> Weighting pros and cons of changing the name I am not sure
> >>>> changing name brings any benefit? Or am I missing something here?
> >>>> It's simply used by userspace so the hardware should be loading
> >>>> regardless of the name...
> >>> Users see the name of their devices in their settings menu. They
> >>> should be accurate. Also, the early entry needs to be added anyway to
> >>> prevent kicking devices.
> >> If it's just aesthetics I don't see much reasons in changing the name.
> >>
> >> "the early entry needs to be added anyway ...." has no meaning to me,
> >> please rephrase. Sorry.
> >
> > Early exit-
> >
> >>>> Along with IP and your tool and asusctl there is also openrgb,
> >>>> and a newborn application for asus devices (I don't have contacts
> >>>> with that dev nor I remember the name of the tool)
> >>>> and I am not even that sure these are all asus-related
> >>>> applications.
> >>> My tool never checked for names, it briefly did for around a month
> >>> after its creation for some devices until capability matches. Around
> >>> 6.1 and 6.7 the kernel changed the names of most USB devices and that
> >>> caused issues. It currently only uses name matches for VID/PID 0/0
> >>> devices created by the kernel. Specifically, WMI and AT Keyboards. I
> >>> am not sure there is a workaround for those. Asusctl also does not us=
e
> >>> names either.
> >> But IP does, so I would like to hear confirmation from at least Derek
> >> before the merge that there won't be future issues.
> >>
> >> Interpret what I say here as a broad topic, not just name/PER_APP flag=
:
> >> avoid changing data flow on older models...
> >
> > In [1] Derek removes the name matches
> >
> > There are no other name matches concerning this driver in it.
> >
> > The data flow is not changed in this series; you should go through the
> > patches once again if you think that. The only difference is 0x5e is
> > not sent, and 0x5d is not sent for newer devices.
> >
> > [1] https://github.com/ShadowBlip/InputPlumber/pull/453
> >
> >>>> Excercise EXTRA care touching this area as these are enough changes
> >>>> to make it difficult to understand what exactly is the problem if
> >>>> someone shows up with LEDs malfunctioning, laptop not entering sleep
> >>>> anymore or something else entirely. Plus over time
> >>>> ASUS has used various workarounds for windows problems
> >>>> and I am not eager to find out what those are since there is only
> >>>> a realistic way it's going to happen....
> >>> These changes are not doing something extraordinary. It's just a mino=
r cleanup.
> >>>
> >>>>> Moreover, that specific commit is needed for Xbox Ally devices anyw=
ay,
> >>>>> as the kernel kicks one of the RGB endpoints because it does not
> >>>>> register an input device (the check skipped by early return) so
> >>>>> userspace becomes unable to control RGB on a stock kernel
> >>>>> (hidraw/hiddev nodes are gone). For more context here, this specifi=
c
> >>>>> endpoint implements the RGB Lamparray protocol for Windows dynamic
> >>>>> lighting, and I think in an attempt to make it work properly in
> >>>>> Windows, Asus made it so Windows has to first disable dynamic light=
ing
> >>>>> for armoury crate RGB commands to work (the 0x5a ones over the 0xff=
31
> >>>>> hid page).
> >>>> Yes once ASUS introduces something new it sticks with that for
> >>>> future models so it's expected more and more laptops will have
> >>>> the same problem: I am not questioning if these patches are needed
> >>>> as they very clearly are; I am questioning if everything that these
> >>>> patches are doing are worth doing and aren't breaking/regressing
> >>>> either tools or the flow of actions between the EC and these USB dev=
ices.
> >>> Well, this series is needed to account for that. Sending the disable
> >>> command is out of scope for now though.
> >> Here I apologize for confusion: my comments were mostly about
> >> older models: I absolutely don't want to break those, but if you find =
a way
> >> to distinguish them from newer models that would give you more freedom=
 with those.
> >
> > Yes, we know their specific PIDs, so if you see the patch that adds
> > the 0x5d init, it is only added for those models.
>
> I=E2=80=99m only half keeping up to date on this. I do recall however tha=
t the 0x5D init was definitely required for the first ASUS laptop I worked =
on, and old GX502 - the PID for keyboard is 0x1866 and I think that was the=
 last of that generation MCU. All the previous MCU also required it.

You recall if it was needed to enable the RGB commands or was it only
for keyboard shortcuts? If it is needed for keyboard shortcuts it is
correct for it to stay. If RGB does not turn on where it has been
enabled before, it should also stay.

> I saw some messages in perhaps another thread where it was mentioned that=
 0x5E init should be removed? That I agreed with that?
> I know there are AniMe and Slash versions that use that init, and they ar=
e on the same MCU as the keyboard. I had expected that just one init (on 0x=
5A or whatever) would work but it doesn=E2=80=99t - what I don=E2=80=99t re=
call is if an incomplete init affected the keyboard features.

Well, the way these devices work is that there are three hiddev
devices, usually nested within the same hid endpoint under up to three
collections. Each has one report ID. 0x5a is for brightness controls,
0x5d is for RGB, and 0x5e is for anime. For the first two, I know the
usages are 76 and 79 (see above). I am not sure what the usage for
anime is because I do not have a hid descriptor for that device.

In order to start talking to one of the hiddev devices, you are
supposed to start with an init. The init is bidirectional, so after
reading it back software knows it is talking to an Asus device (as it
is done in this series). Likewise, even though it is not the case for
all MCUs, the MCUs themselves can use it to verify they are talking to
an Asus application (as you said) and reject commands if it is not
sent.

For this reason, I think it is a good idea before asusctl starts
controlling RGB, to always start with a 0x5d init to verify it is
talking to an Asus device. And before Anime, with a 0x5e init (if the
specific application for it is available). So since Dennis you are the
new maintainer, you should try to work that in. Sending it twice does
not hurt, even if not ideal.

Similarly, because this driver does not do Anime currently, there is
no reason for it to send 0x5e. It also does not do RGB, so there is no
reason to send 0x5D (unless not sending it causes issues). For the RGB
patch I did, I delayed the init purposely until userspace interacts
with the sysfs RGB endpoint, partly to interfere with userspace
software less as well. So if the user does not use the sysfs RGB e.g.
asusctl is completely unaffected.

> In all reality unless the full set of init is causing issues it=E2=80=99s=
 best to leave them in. If it is then I guess this driver is going to becom=
e a little more complex and have a few more quirks.
>
> Unfortunately I didn=E2=80=99t keep good records of my findings on this s=
o it=E2=80=99s just my remembered observations that you=E2=80=99ll have to =
take at my word.
>
> It would be a good idea for you both to perhaps collaborate with Sergei f=
rom ghelper, he has put a huge amount of effort in to that tool and due to =
it being windows he gets a hell of a lot more use and bug reports/data than=
 this driver does. There=E2=80=99s no shame in looking to others for inspir=
ation, ideas, or guidance.

Good idea. From a quick look, indeed slash/anime is 0x5e. We could
interact with him more in the future.

Although looking into it, to find the correct endpoint he does a dirty
check for report length being more than 128[1]. SIgh

I think it would be productive to try to merge this for 6.19. So
Dennis can you try to be a bit more cooperative?

I already have 6 more patches for duo keyboards. Although the keyboard
brightness button on those seems to not work (?)[2]. I am waiting on a
reply for that. Perhaps it uses a slightly different ID code. However,
it seems that brightness works even when disconnecting and connecting
the keyboard. Which is great.

Antheas

[1] https://github.com/seerge/g-helper/blob/610b11749b4da97346012e5d47f0a9b=
bc93b94af/app/AnimeMatrix/Communication/Platform/WindowsUsbProvider.cs#L37
[2] https://github.com/bazzite-org/kernel-bazzite/issues/35

> Cheers,
> Luke.
>
> >
> >> No disable commands unless we find hard evidence those are strictly ne=
eded.
> >
> > They are needed for the Xbox Ally series, but since this driver does
> > not do RGB it is out of scope.
> >
> >>> Antheas
> >>>
> >>>>> Hopefully this clears things up
> >>>>>
> >>>>> Antheas
> >>>>>
> >>>>>>> Unrelated but I was b4ing this series on Ubuntu 24 and got BADSIG=
:
> >>>>>>> DKIM/antheas.dev. Is there a reference for fixing this on my host=
?
> >>>>>>> Perhaps it would help with spam
> >>>>>> I see BADSIG very often these days from b4 (thanks to gmail expiri=
ng
> >>>>>> things after 7 days or so, I recall hearing somewhere), I just ign=
ore them
> >>>>>> entirely.
> >>>>>>
> >>>>>> AFAIK, that has never caused any delay to any patch in pdx86 domai=
n so if
> >>>>>> that is what you thought is happening here, it's not the case.
> >>>>>> If your patch does appear in the pdx86 patchwork, there's even les=
s reason
> >>>>>> to worry as I mostly pick patches to process using patchwork's lis=
t.
> >>>>> Turns out I had to update my DNS records. It should be good now.
> >>>>>
> >>>>>> --
> >>>>>> i.
> >>>> snipp
> >>>>>>>> 2.51.2
>
>
>


