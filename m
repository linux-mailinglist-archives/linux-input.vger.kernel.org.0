Return-Path: <linux-input+bounces-16074-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C547C5656F
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 09:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49D933B842D
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 08:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF56330316;
	Thu, 13 Nov 2025 08:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="CNN7rVJ5"
X-Original-To: linux-input@vger.kernel.org
Received: from relay14.grserver.gr (relay14.grserver.gr [46.224.16.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05E92FF663
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 08:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.224.16.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763023489; cv=none; b=gNhHl+kT3XN18ZpLCvKDlDwAMrObkRKdBK6LmmiX6+TIWnQudVFYP7U8AtfDea2EY4SO0ZR7Oy/ax8l+jH7vBqGb1el6EqHM82edhojdLB4FJaOzwUizsvwNBPBCC33hUnxU6RR0xamzBAL+ccpdhEN8TDzH25sA7ifa3ey1hCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763023489; c=relaxed/simple;
	bh=p8k7WifucDpT6EGz4jqiedoInt47e2DEoyTztAVmg8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGWpe0IFy8ZBBynXPGE4/ArvvFqL3I7B4wSoHf9VPH9vooGY0iCqNbPYahXtD3Bdaq2N8scmcXl/yvCTGrR0/CkbuXp2pZAhWushtygH55C55zKB1c3r4DBIPJEpbklfV7GjxRz8Hi7mcFbA75cYFCRwHJZzaX2qk3ZMTfYi7wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=CNN7rVJ5; arc=none smtp.client-ip=46.224.16.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id BD0CA44052
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 08:44:43 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id 7E3CD44042
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 08:44:42 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 73C811FD4E9
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 10:44:41 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763023482;
	bh=dhovFHoHb8qSQBovicVWAESq7ahI0AP216oMQOcv1DU=;
	h=Received:From:Subject:To;
	b=CNN7rVJ53jmMheumw/yD33wIT3NCKLwnQn3dFxE9mNhpk4tojkyUipUNXQWDAqXwB
	 Dm3Yzd2di+9mx/c3hsbKoZSUWdNW8UXMLtk0CZryFaGdulqlS0Xj1omKIvZ24D05ZD
	 BCJOf3j+v35cfUZfOmFvOGcQy4SvS6t7LaF8n0zZNBBkZtrFrETrPM6mdhuug5hHCl
	 IOcNAo3hWSErPMw7iF8nIRYes+W0ERHQj/ghLV3s6wpzeVpehUinmcufBdeKV41of7
	 zSUfvN0CJtuZArXYKzYc/gWx3W4afvtC4ILUKl18VcCp5q7f/wlZVwFofCZsMACGGN
	 oTlQDnH5K2ndA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.171) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f171.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-37a3d86b773so6101161fa.0
        for <linux-input@vger.kernel.org>;
 Thu, 13 Nov 2025 00:44:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXgjpCOne51w9Oy52mAx38EwhpWFRIi+c3rZgG3GWkEsvCQG2eYZGNCYPUcKybK0Qg4QXcbu+Z7M4QG4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ+8CpuWlPzDU6KDt/reURn+BKMxK5+uJ9qB8BDE4Mym7355A+
	9kNl5Sg7oaEHAbo7huTDX60XcEyd2eXep9RK/t7jdHp88vCOqME69Slhj+meE2srZLccUirNypV
	lpzxae8ZEMNSalLDkdst0e2bOERzy3c0=
X-Google-Smtp-Source: 
 AGHT+IFcvnlK1g9gem08iqzl3IeGNTJP877Z1QLrGtuXpfBlosJ62owDR4OYnKTypeP8yOawbHwYcXU2tGaqREB0LnE=
X-Received: by 2002:a05:651c:3043:b0:37a:2dca:cfaf with SMTP id
 38308e7fff4ca-37b8c2ec367mr15230501fa.20.1763023480919; Thu, 13 Nov 2025
 00:44:40 -0800 (PST)
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
In-Reply-To: <4671d267-d823-4bf7-af30-b587e67dec49@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 13 Nov 2025 09:44:28 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFDm80YuC9AfES2d7Xk2bnCNPjHtgXCz5gZuh7fuajHgg@mail.gmail.com>
X-Gm-Features: AWmQ_bk4ktN1laFYsydus_0eoARRn9jxNUvpvSPEDxKLDO3uwo9j9jLqdkTKno8
Message-ID: 
 <CAGwozwFDm80YuC9AfES2d7Xk2bnCNPjHtgXCz5gZuh7fuajHgg@mail.gmail.com>
Subject: Re: [PATCH v8 00/10] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: Denis Benato <benato.denis96@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176302348183.1956568.13831703009993737565@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 13 Nov 2025 at 02:14, Denis Benato <benato.denis96@gmail.com> wrote=
:
>
>
> On 11/12/25 23:08, Antheas Kapenekakis wrote:
> > On Wed, 12 Nov 2025 at 20:51, Denis Benato <benato.denis96@gmail.com> w=
rote:
> >>
> >> On 11/12/25 14:41, Antheas Kapenekakis wrote:
> >>> On Wed, 12 Nov 2025 at 14:22, Ilpo J=C3=A4rvinen
> >>> <ilpo.jarvinen@linux.intel.com> wrote:
> >>>> On Wed, 12 Nov 2025, Antheas Kapenekakis wrote:
> >>>>
> >>>>> On Sat, 1 Nov 2025 at 11:47, Antheas Kapenekakis <lkml@antheas.dev>=
 wrote:
> >>>>>> This is a two part series which does the following:
> >>>>>>   - Clean-up init sequence
> >>>>>>   - Unify backlight handling to happen under asus-wmi so that all =
Aura
> >>>>>>     devices have synced brightness controls and the backlight butt=
on works
> >>>>>>     properly when it is on a USB laptop keyboard instead of one w/=
 WMI.
> >>>>>>
> >>>>>> For more context, see cover letter of V1. Since V5, I removed some=
 patches
> >>>>>> to make this easier to merge.
> >>>>> Small bump for this.
> >>>> I looked at v8 earlier but then got an impression some of Denis' com=
ments
> >>>> against v7 were not taken into account in v8, which implies there wi=
ll be
> >>>> delay until I've time to delve into the details (I need to understan=
d
> >>>> things pretty deeply in such a case, which does take lots of time).
> >>>>
> >>>> Alternatively, if Denis says v8 is acceptable, then I don't need to =
spend
> >>>> so much time on it, but somehow I've a feeling he isn't happy with v=
8
> >>>> but just hasn't voiced it again...
> >>>>
> >>>> Please do realize that ignoring reviewer feedback without a very ver=
y good
> >>>> reason always risks adding delay or friction into getting things
> >>>> upstreamed. Especially, when the review comes from a person who has =
been
> >>>> around for me to learn to trust their reviews or from a maintainer o=
f the
> >>>> code in question.
> >>> Sure, sorry if it came out this way. Dennis had two comments on the V=
7
> >>> version of the series.
> >>>
> >>> The first one was that asusctl has a hang bug, which he hasn't had
> >>> time to look into yet. This should have been fixed by dropping the
> >>> HID_QUIRK_INPUT_PER_APP. I retested the series and that QUIRK was a
> >>> bit of a NOOP that does not need to be added in the future.
> >> So it is supposed to not regress it now, correct?
> >>> The second is he is concerned with dropping the 0x5d/0x5e inits. Luke
> >>> said (back in March) that it is fine to drop 0x5e because it is only
> >>> used for ANIME displays. However, for 0x5d, it is hard to verify some
> >>> of the older laptops because they have only been tested with 0x5d and
> >>> we do not have the hardware in question to test.
> >>>
> >>> For this series, I re-added "initialize LED endpoint early for old
> >>> NKEY keyboards" that re-adds 0x5d for the keyboards that cannot be
> >>> tested again so this comment should be resolved too. With that in
> >>> mind, we do end up with an additional quirk/command that may be
> >>> unneeded and will remain there forever, but since it was a point of
> >>> contention, it is not worth arguing over.
> >>>
> >>> So both comments should be resolved
> >> The driver should also not late-initialize anything.
> >>
> >> Windows doesn't do it and the official asus application
> >> can freely send LEDs changing commands to either WMI or USB
> >> so I don't see any reason to do things differently [than windows]
> >> and not prepare every USB endpoint to receive commands,
> >> this has not been addressed unless I confused v7 and v8?
> > Yes, it's been added on v8. 0x5d is init for the laptops it is
> > problematic for. Not because it does not work, but because it has not
> > been verified to work for those laptops.
> I am not sure I am reading this right:
> are you telling me that on recent models the windows driver
> doesn't issue 0x5d?

Try to add spaces in your replies. This is hard to follow.

Do not conflate driver with software. 0x5a (over the application
0xff310076) has traditionally been used by a driver in Windows to
control the backlight level, as it is done in this driver. 0x5d (over
the application 0xff310079) is only used by laptops with RGB by
Armoury crate. But this driver does not do RGB. No device
functionality relies on it being sent for any device I've seen. The
device remembers its Windows settings, incl. the backlight color, in
the absence of a driver.

Laptops without RGB such as the Duo series which I would like to add
support for next only have a 0x5a endpoint. But, they are sent garbage
inits for 0x5d and 0x5e currently. This should be fixed.

Moreso, it seems that Armoury crate on the Xbox Ally series uses
exclusively 0x5a commands and if you use 0x5d it ignores them (perhaps
RGB still works though). With the previous generation, commands worked
for either report id.

> >>> @Denis: can give an ack if this is the case?
> >>>
> >>> As for Derek's comment, he has a PR for his project where he removes
> >>> the name match for Ally devices with ample time for it to be merged
> >>> until kernel 6.19 is released. In addition, that specific software fo=
r
> >>> full functionality relies on OOT drivers on the distros it ships with=
,
> >>> so it is minimally affected in either case.
> >> The part we are talking about depends on this driver (hid-asus)
> >> and there are people on asus-linux community using inputplumber
> >> for non-ally devices (the OOT driver is only for ally devices)
> >> therefore it is very important to us (and various other distributions)
> >> not to break that software in any way.
> > This driver is only used for Ally devices. If you mean that people
> > remap their keyboards using inputplumber I guess they could but I have
> > not seen it.
> I meant people remap keyboards using IP. I am sure there were
> (and very probably still are) people doing that.
> >> Weighting pros and cons of changing the name I am not sure
> >> changing name brings any benefit? Or am I missing something here?
> >> It's simply used by userspace so the hardware should be loading
> >> regardless of the name...
> > Users see the name of their devices in their settings menu. They
> > should be accurate. Also, the early entry needs to be added anyway to
> > prevent kicking devices.
> If it's just aesthetics I don't see much reasons in changing the name.
>
> "the early entry needs to be added anyway ...." has no meaning to me,
> please rephrase. Sorry.

Early exit-

> >> Along with IP and your tool and asusctl there is also openrgb,
> >> and a newborn application for asus devices (I don't have contacts
> >> with that dev nor I remember the name of the tool)
> >> and I am not even that sure these are all asus-related
> >> applications.
> > My tool never checked for names, it briefly did for around a month
> > after its creation for some devices until capability matches. Around
> > 6.1 and 6.7 the kernel changed the names of most USB devices and that
> > caused issues. It currently only uses name matches for VID/PID 0/0
> > devices created by the kernel. Specifically, WMI and AT Keyboards. I
> > am not sure there is a workaround for those. Asusctl also does not use
> > names either.
> But IP does, so I would like to hear confirmation from at least Derek
> before the merge that there won't be future issues.
>
> Interpret what I say here as a broad topic, not just name/PER_APP flag:
> avoid changing data flow on older models...

In [1] Derek removes the name matches

There are no other name matches concerning this driver in it.

The data flow is not changed in this series; you should go through the
patches once again if you think that. The only difference is 0x5e is
not sent, and 0x5d is not sent for newer devices.

[1] https://github.com/ShadowBlip/InputPlumber/pull/453

> >> Excercise EXTRA care touching this area as these are enough changes
> >> to make it difficult to understand what exactly is the problem if
> >> someone shows up with LEDs malfunctioning, laptop not entering sleep
> >> anymore or something else entirely. Plus over time
> >> ASUS has used various workarounds for windows problems
> >> and I am not eager to find out what those are since there is only
> >> a realistic way it's going to happen....
> > These changes are not doing something extraordinary. It's just a minor =
cleanup.
> >
> >>> Moreover, that specific commit is needed for Xbox Ally devices anyway=
,
> >>> as the kernel kicks one of the RGB endpoints because it does not
> >>> register an input device (the check skipped by early return) so
> >>> userspace becomes unable to control RGB on a stock kernel
> >>> (hidraw/hiddev nodes are gone). For more context here, this specific
> >>> endpoint implements the RGB Lamparray protocol for Windows dynamic
> >>> lighting, and I think in an attempt to make it work properly in
> >>> Windows, Asus made it so Windows has to first disable dynamic lightin=
g
> >>> for armoury crate RGB commands to work (the 0x5a ones over the 0xff31
> >>> hid page).
> >> Yes once ASUS introduces something new it sticks with that for
> >> future models so it's expected more and more laptops will have
> >> the same problem: I am not questioning if these patches are needed
> >> as they very clearly are; I am questioning if everything that these
> >> patches are doing are worth doing and aren't breaking/regressing
> >> either tools or the flow of actions between the EC and these USB devic=
es.
> > Well, this series is needed to account for that. Sending the disable
> > command is out of scope for now though.
> Here I apologize for confusion: my comments were mostly about
> older models: I absolutely don't want to break those, but if you find a w=
ay
> to distinguish them from newer models that would give you more freedom wi=
th those.

Yes, we know their specific PIDs, so if you see the patch that adds
the 0x5d init, it is only added for those models.

> No disable commands unless we find hard evidence those are strictly neede=
d.

They are needed for the Xbox Ally series, but since this driver does
not do RGB it is out of scope.

> > Antheas
> >
> >>> Hopefully this clears things up
> >>>
> >>> Antheas
> >>>
> >>>>> Unrelated but I was b4ing this series on Ubuntu 24 and got BADSIG:
> >>>>> DKIM/antheas.dev. Is there a reference for fixing this on my host?
> >>>>> Perhaps it would help with spam
> >>>> I see BADSIG very often these days from b4 (thanks to gmail expiring
> >>>> things after 7 days or so, I recall hearing somewhere), I just ignor=
e them
> >>>> entirely.
> >>>>
> >>>> AFAIK, that has never caused any delay to any patch in pdx86 domain =
so if
> >>>> that is what you thought is happening here, it's not the case.
> >>>> If your patch does appear in the pdx86 patchwork, there's even less =
reason
> >>>> to worry as I mostly pick patches to process using patchwork's list.
> >>> Turns out I had to update my DNS records. It should be good now.
> >>>
> >>>> --
> >>>>  i.
> >> snipp
> >>>>>> 2.51.2
> >>>>>>
> >>>>>>
>


