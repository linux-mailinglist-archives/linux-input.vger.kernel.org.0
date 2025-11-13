Return-Path: <linux-input+bounces-16113-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EE9C5A5D3
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 23:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE6DA3ACF7F
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 22:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C250931BC8F;
	Thu, 13 Nov 2025 22:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Ber6CMiJ"
X-Original-To: linux-input@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6CB3161A2
	for <linux-input@vger.kernel.org>; Thu, 13 Nov 2025 22:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763073737; cv=none; b=iXFqEx9MVRExjKaX+ypXc26UzTrKJ+8RKmv+6QJx9ASaEbtMJCmqnkUS5o9rfmmiikfecdQt2fm+ScgtJrJVRIwwipi4SbA9sDO0NXsUjvaWA4pGcez0OH3bu74OeRIVFV+BXyVNQqV6jRPAVAC/8AQlFMubjuilRcN2Zad9bY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763073737; c=relaxed/simple;
	bh=p4c4E5brZmcjZwNW0OwviHBoznMpzfvT5XwGUPY/wtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pcuEr4Sho3ULjYKwVbM+Pg4R1jdTAQo3EYFwispUH8GMNlgTvpcN7L4tW2Y8j3FQLA1snpTLn1d/RBrj2/k/oL/uU0FfswWddQ6Ed7sZz+Wf6BoAPK/7QFFTSsu0nyjzskDr5CyNrImPxfsX0GRhQr/QhFzfwY5/oijPu2rQYjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Ber6CMiJ; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id AF4E95E62C
	for <linux-input@vger.kernel.org>; Fri, 14 Nov 2025 00:42:08 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 667CF5E491
	for <linux-input@vger.kernel.org>; Fri, 14 Nov 2025 00:42:06 +0200 (EET)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 4D9F12007EB
	for <linux-input@vger.kernel.org>; Fri, 14 Nov 2025 00:42:05 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1763073725;
	bh=qddtl9L1hFvfs58FwGYLj3cTwS7lj7iN/hnnZASIR8E=;
	h=Received:From:Subject:To;
	b=Ber6CMiJfJ5a+k7lhMYwhRB4lYXv+u6jWfLDYixcTtp28wsTywq2BE7Mmd7GmzWZi
	 2MgTTLejSINGjA+Wbnk05TGtjhPpJBGssy8nn3timuauRKMEtfYATebDM/tbZES+tr
	 P1ulYIHhxcQjUHvIh1C4+7a6i+6YxU1ruAe4H3dGsA88UYjJN6cA9ReycRms1/zgQC
	 W4WRR1G1gJ3NW5oVxjzDliewA3jRbVFRiJ1426kCRnL6Vcoup7wotaIWEfF+r0yKuk
	 eoOUngp8hr4HIecnfWQrcVHnNFtaYP3hQ/8mWoZN6MTKkoN/q4UnXGESY72lDQFNej
	 JvnwylvlFsagg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.181) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f181.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-37b495ce059so11573261fa.0
        for <linux-input@vger.kernel.org>;
 Thu, 13 Nov 2025 14:42:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU623gmfiviUA69mOYcdlDre5ayCbO1psxhaE/YfD5ELwDR4LFK0vpCf2n31eZCKYy5MuKW2+Pq0//oGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Ka3ppsfmx2Ping100F707AKlDhBNJtw/ZcKOYCEAI+jSxPZC
	TeaKWSseBh6uAn1KwJs7hY1OtAP1V2LGBC4nkP8oZqh2fVn4DkhSUwpAv51TzNHlGhtbDuKjBMZ
	Ew0AEXbX7/UF+lP2zFA4iuKCc3ZVb4EQ=
X-Google-Smtp-Source: 
 AGHT+IFvMHEBqvHtDs0WpXFW2sCggplEa9I//numiqw5wRa2wGiRbGPUNIhn84dcQ0vxhxIGvXBBn7nrbByAbSE8qec=
X-Received: by 2002:a05:651c:223:b0:37b:9101:77e6 with SMTP id
 38308e7fff4ca-37babb81c7fmr1001261fa.15.1763073724554; Thu, 13 Nov 2025
 14:42:04 -0800 (PST)
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
 <CAGwozwGwtivKnC6ucCGwJiu2yLLbddFXG+jYTaMTwU4Zt=CAfQ@mail.gmail.com>
 <5440F7FC-14A0-45A0-9E84-1DE5285F9F3F@ljones.dev>
In-Reply-To: <5440F7FC-14A0-45A0-9E84-1DE5285F9F3F@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 13 Nov 2025 23:41:53 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEsh9xz85hYFUBg5T5sTeit7aGMRLK=4anzhtUagSseYw@mail.gmail.com>
X-Gm-Features: AWmQ_bmSYcTtM4yuHjGWn7_aMayeUTbtD6-zfgcHMJxljqYWpU7CS-FwW0cQhgo
Message-ID: 
 <CAGwozwEsh9xz85hYFUBg5T5sTeit7aGMRLK=4anzhtUagSseYw@mail.gmail.com>
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
 <176307372552.932813.10944192527803272401@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 13 Nov 2025 at 23:09, <luke@ljones.dev> wrote:
>
>
>
> > On 14 Nov 2025, at 10:17, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> >
> > On Thu, 13 Nov 2025 at 21:23, <luke@ljones.dev> wrote:
> >>
> >>
> >>> On 13 Nov 2025, at 21:44, Antheas Kapenekakis <lkml@antheas.dev> wrot=
e:
> >>>
> >>> On Thu, 13 Nov 2025 at 02:14, Denis Benato <benato.denis96@gmail.com>=
 wrote:
> >>>>
> >>>>
> >>>> On 11/12/25 23:08, Antheas Kapenekakis wrote:
> >>>>> On Wed, 12 Nov 2025 at 20:51, Denis Benato <benato.denis96@gmail.co=
m> wrote:
> >>>>>>
> >>>>>> On 11/12/25 14:41, Antheas Kapenekakis wrote:
> >>>>>>> On Wed, 12 Nov 2025 at 14:22, Ilpo J=C3=A4rvinen
> >>>>>>> <ilpo.jarvinen@linux.intel.com> wrote:
> >>>>>>>> On Wed, 12 Nov 2025, Antheas Kapenekakis wrote:
> >>>>>>>>
> >>>>>>>>> On Sat, 1 Nov 2025 at 11:47, Antheas Kapenekakis <lkml@antheas.=
dev> wrote:
> >>>>>>>>>> This is a two part series which does the following:
> >>>>>>>>>> - Clean-up init sequence
> >>>>>>>>>> - Unify backlight handling to happen under asus-wmi so that al=
l Aura
> >>>>>>>>>>   devices have synced brightness controls and the backlight bu=
tton works
> >>>>>>>>>>   properly when it is on a USB laptop keyboard instead of one =
w/ WMI.
> >>>>>>>>>>
> >>>>>>>>>> For more context, see cover letter of V1. Since V5, I removed =
some patches
> >>>>>>>>>> to make this easier to merge.
> >>>>>>>>> Small bump for this.
> >>>>>>>> I looked at v8 earlier but then got an impression some of Denis'=
 comments
> >>>>>>>> against v7 were not taken into account in v8, which implies ther=
e will be
> >>>>>>>> delay until I've time to delve into the details (I need to under=
stand
> >>>>>>>> things pretty deeply in such a case, which does take lots of tim=
e).
> >>>>>>>>
> >>>>>>>> Alternatively, if Denis says v8 is acceptable, then I don't need=
 to spend
> >>>>>>>> so much time on it, but somehow I've a feeling he isn't happy wi=
th v8
> >>>>>>>> but just hasn't voiced it again...
> >>>>>>>>
> >>>>>>>> Please do realize that ignoring reviewer feedback without a very=
 very good
> >>>>>>>> reason always risks adding delay or friction into getting things
> >>>>>>>> upstreamed. Especially, when the review comes from a person who =
has been
> >>>>>>>> around for me to learn to trust their reviews or from a maintain=
er of the
> >>>>>>>> code in question.
> >>>>>>> Sure, sorry if it came out this way. Dennis had two comments on t=
he V7
> >>>>>>> version of the series.
> >>>>>>>
> >>>>>>> The first one was that asusctl has a hang bug, which he hasn't ha=
d
> >>>>>>> time to look into yet. This should have been fixed by dropping th=
e
> >>>>>>> HID_QUIRK_INPUT_PER_APP. I retested the series and that QUIRK was=
 a
> >>>>>>> bit of a NOOP that does not need to be added in the future.
> >>>>>> So it is supposed to not regress it now, correct?
> >>>>>>> The second is he is concerned with dropping the 0x5d/0x5e inits. =
Luke
> >>>>>>> said (back in March) that it is fine to drop 0x5e because it is o=
nly
> >>>>>>> used for ANIME displays. However, for 0x5d, it is hard to verify =
some
> >>>>>>> of the older laptops because they have only been tested with 0x5d=
 and
> >>>>>>> we do not have the hardware in question to test.
> >>>>>>>
> >>>>>>> For this series, I re-added "initialize LED endpoint early for ol=
d
> >>>>>>> NKEY keyboards" that re-adds 0x5d for the keyboards that cannot b=
e
> >>>>>>> tested again so this comment should be resolved too. With that in
> >>>>>>> mind, we do end up with an additional quirk/command that may be
> >>>>>>> unneeded and will remain there forever, but since it was a point =
of
> >>>>>>> contention, it is not worth arguing over.
> >>>>>>>
> >>>>>>> So both comments should be resolved
> >>>>>> The driver should also not late-initialize anything.
> >>>>>>
> >>>>>> Windows doesn't do it and the official asus application
> >>>>>> can freely send LEDs changing commands to either WMI or USB
> >>>>>> so I don't see any reason to do things differently [than windows]
> >>>>>> and not prepare every USB endpoint to receive commands,
> >>>>>> this has not been addressed unless I confused v7 and v8?
> >>>>> Yes, it's been added on v8. 0x5d is init for the laptops it is
> >>>>> problematic for. Not because it does not work, but because it has n=
ot
> >>>>> been verified to work for those laptops.
> >>>> I am not sure I am reading this right:
> >>>> are you telling me that on recent models the windows driver
> >>>> doesn't issue 0x5d?
> >>>
> >>> Try to add spaces in your replies. This is hard to follow.
> >>>
> >>> Do not conflate driver with software. 0x5a (over the application
> >>> 0xff310076) has traditionally been used by a driver in Windows to
> >>> control the backlight level, as it is done in this driver. 0x5d (over
> >>> the application 0xff310079) is only used by laptops with RGB by
> >>> Armoury crate. But this driver does not do RGB. No device
> >>> functionality relies on it being sent for any device I've seen. The
> >>> device remembers its Windows settings, incl. the backlight color, in
> >>> the absence of a driver.
> >>>
> >>> Laptops without RGB such as the Duo series which I would like to add
> >>> support for next only have a 0x5a endpoint. But, they are sent garbag=
e
> >>> inits for 0x5d and 0x5e currently. This should be fixed.
> >>>
> >>> Moreso, it seems that Armoury crate on the Xbox Ally series uses
> >>> exclusively 0x5a commands and if you use 0x5d it ignores them (perhap=
s
> >>> RGB still works though). With the previous generation, commands worke=
d
> >>> for either report id.
> >>>
> >>>>>>> @Denis: can give an ack if this is the case?
> >>>>>>>
> >>>>>>> As for Derek's comment, he has a PR for his project where he remo=
ves
> >>>>>>> the name match for Ally devices with ample time for it to be merg=
ed
> >>>>>>> until kernel 6.19 is released. In addition, that specific softwar=
e for
> >>>>>>> full functionality relies on OOT drivers on the distros it ships =
with,
> >>>>>>> so it is minimally affected in either case.
> >>>>>> The part we are talking about depends on this driver (hid-asus)
> >>>>>> and there are people on asus-linux community using inputplumber
> >>>>>> for non-ally devices (the OOT driver is only for ally devices)
> >>>>>> therefore it is very important to us (and various other distributi=
ons)
> >>>>>> not to break that software in any way.
> >>>>> This driver is only used for Ally devices. If you mean that people
> >>>>> remap their keyboards using inputplumber I guess they could but I h=
ave
> >>>>> not seen it.
> >>>> I meant people remap keyboards using IP. I am sure there were
> >>>> (and very probably still are) people doing that.
> >>>>>> Weighting pros and cons of changing the name I am not sure
> >>>>>> changing name brings any benefit? Or am I missing something here?
> >>>>>> It's simply used by userspace so the hardware should be loading
> >>>>>> regardless of the name...
> >>>>> Users see the name of their devices in their settings menu. They
> >>>>> should be accurate. Also, the early entry needs to be added anyway =
to
> >>>>> prevent kicking devices.
> >>>> If it's just aesthetics I don't see much reasons in changing the nam=
e.
> >>>>
> >>>> "the early entry needs to be added anyway ...." has no meaning to me=
,
> >>>> please rephrase. Sorry.
> >>>
> >>> Early exit-
> >>>
> >>>>>> Along with IP and your tool and asusctl there is also openrgb,
> >>>>>> and a newborn application for asus devices (I don't have contacts
> >>>>>> with that dev nor I remember the name of the tool)
> >>>>>> and I am not even that sure these are all asus-related
> >>>>>> applications.
> >>>>> My tool never checked for names, it briefly did for around a month
> >>>>> after its creation for some devices until capability matches. Aroun=
d
> >>>>> 6.1 and 6.7 the kernel changed the names of most USB devices and th=
at
> >>>>> caused issues. It currently only uses name matches for VID/PID 0/0
> >>>>> devices created by the kernel. Specifically, WMI and AT Keyboards. =
I
> >>>>> am not sure there is a workaround for those. Asusctl also does not =
use
> >>>>> names either.
> >>>> But IP does, so I would like to hear confirmation from at least Dere=
k
> >>>> before the merge that there won't be future issues.
> >>>>
> >>>> Interpret what I say here as a broad topic, not just name/PER_APP fl=
ag:
> >>>> avoid changing data flow on older models...
> >>>
> >>> In [1] Derek removes the name matches
> >>>
> >>> There are no other name matches concerning this driver in it.
> >>>
> >>> The data flow is not changed in this series; you should go through th=
e
> >>> patches once again if you think that. The only difference is 0x5e is
> >>> not sent, and 0x5d is not sent for newer devices.
> >>>
> >>> [1] https://github.com/ShadowBlip/InputPlumber/pull/453
> >>>
> >>>>>> Excercise EXTRA care touching this area as these are enough change=
s
> >>>>>> to make it difficult to understand what exactly is the problem if
> >>>>>> someone shows up with LEDs malfunctioning, laptop not entering sle=
ep
> >>>>>> anymore or something else entirely. Plus over time
> >>>>>> ASUS has used various workarounds for windows problems
> >>>>>> and I am not eager to find out what those are since there is only
> >>>>>> a realistic way it's going to happen....
> >>>>> These changes are not doing something extraordinary. It's just a mi=
nor cleanup.
> >>>>>
> >>>>>>> Moreover, that specific commit is needed for Xbox Ally devices an=
yway,
> >>>>>>> as the kernel kicks one of the RGB endpoints because it does not
> >>>>>>> register an input device (the check skipped by early return) so
> >>>>>>> userspace becomes unable to control RGB on a stock kernel
> >>>>>>> (hidraw/hiddev nodes are gone). For more context here, this speci=
fic
> >>>>>>> endpoint implements the RGB Lamparray protocol for Windows dynami=
c
> >>>>>>> lighting, and I think in an attempt to make it work properly in
> >>>>>>> Windows, Asus made it so Windows has to first disable dynamic lig=
hting
> >>>>>>> for armoury crate RGB commands to work (the 0x5a ones over the 0x=
ff31
> >>>>>>> hid page).
>
> Ah=E2=80=A6 this was an annoyance. In the hid-asus driver I did I ended u=
p defaulting the LED control to the lamp-array style because it enabled fas=
ter per-led control. Then on sleep/resume it applied static colour matching=
 first LED to keep some consistency. It works fine and there is no noticeab=
le delay between switching to/from since the LampArray commands are instant=
 (no set/apply required).
>
> Anyhow, that driver created proper new LED device just for LED control. B=
ut it could only do that by taking the Ally HID off of the current driver a=
nd managing the whole lot. The end result I thought was much cleaner and se=
parated the actual endpoints out to specific functions instead of how the c=
urrent driver takes *all* the endpoints and tries to work off usage pages o=
r report ID only.
>
> For example use endpoint 0x83 for configuration (of gamepad) and LED. 0x8=
7 is typically keyboard press events etc.
>
> It did make me wonder if a newer cleaner driver for new MCU 0x19b6 onward=
s would have worked better instead of trying to shoehorn stuff in to the cu=
rrent driver constantly. It=E2=80=99s dead easy to bring up a new driver fo=
r this as an experiment. Maybe both you and Denis could investigate doing s=
o?

Yeah, this driver is not ideal for the Ally devices. They are not
keyboards. At least for now we can make sure that endpoint is not
ejected so that userspace programs work.

At this point its a party, disable this do that, then flip around for
the RGB to work.

I barely have time to cleanup and upstream the TDP stuff, less so
having the luxury of doing the controller in kernel as well.

>
> >>>>>> Yes once ASUS introduces something new it sticks with that for
> >>>>>> future models so it's expected more and more laptops will have
> >>>>>> the same problem: I am not questioning if these patches are needed
> >>>>>> as they very clearly are; I am questioning if everything that thes=
e
> >>>>>> patches are doing are worth doing and aren't breaking/regressing
> >>>>>> either tools or the flow of actions between the EC and these USB d=
evices.
> >>>>> Well, this series is needed to account for that. Sending the disabl=
e
> >>>>> command is out of scope for now though.
> >>>> Here I apologize for confusion: my comments were mostly about
> >>>> older models: I absolutely don't want to break those, but if you fin=
d a way
> >>>> to distinguish them from newer models that would give you more freed=
om with those.
> >>>
> >>> Yes, we know their specific PIDs, so if you see the patch that adds
> >>> the 0x5d init, it is only added for those models.
> >>
> >> I=E2=80=99m only half keeping up to date on this. I do recall however =
that the 0x5D init was definitely required for the first ASUS laptop I work=
ed on, and old GX502 - the PID for keyboard is 0x1866 and I think that was =
the last of that generation MCU. All the previous MCU also required it.
> >
> > You recall if it was needed to enable the RGB commands or was it only
> > for keyboard shortcuts? If it is needed for keyboard shortcuts it is
> > correct for it to stay. If RGB does not turn on where it has been
> > enabled before, it should also stay.
>
> It was for shortcuts and the ROG buttons above the keyboard. There may ha=
ve been some laptops using the same MCU that required it to enable LEDs too=
.

Ok, so we should keep it for those then. This series keeps it for those.

> >
> >> I saw some messages in perhaps another thread where it was mentioned t=
hat 0x5E init should be removed? That I agreed with that?
> >> I know there are AniMe and Slash versions that use that init, and they=
 are on the same MCU as the keyboard. I had expected that just one init (on=
 0x5A or whatever) would work but it doesn=E2=80=99t - what I don=E2=80=99t=
 recall is if an incomplete init affected the keyboard features.
> >
> > Well, the way these devices work is that there are three hiddev
> > devices, usually nested within the same hid endpoint under up to three
> > collections. Each has one report ID. 0x5a is for brightness controls,
> > 0x5d is for RGB, and 0x5e is for anime. For the first two, I know the
> > usages are 76 and 79 (see above). I am not sure what the usage for
> > anime is because I do not have a hid descriptor for that device.
> >
> > In order to start talking to one of the hiddev devices, you are
> > supposed to start with an init. The init is bidirectional, so after
> > reading it back software knows it is talking to an Asus device (as it
> > is done in this series). Likewise, even though it is not the case for
> > all MCUs, the MCUs themselves can use it to verify they are talking to
> > an Asus application (as you said) and reject commands if it is not
> > sent.
>
> Yes, I know.
> Before I stopped on all this I built up a rather large (untidy) collectio=
n of dumps for various things here https://gitlab.com/asus-linux/reverse-en=
gineering/-/tree/master
>
> >
> > For this reason, I think it is a good idea before asusctl starts
> > controlling RGB, to always start with a 0x5d init to verify it is
> > talking to an Asus device. And before Anime, with a 0x5e init (if the
> > specific application for it is available). So since Dennis you are the
> > new maintainer, you should try to work that in. Sending it twice does
> > not hurt, even if not ideal.
> >
> > Similarly, because this driver does not do Anime currently, there is
> > no reason for it to send 0x5e. It also does not do RGB, so there is no
> > reason to send 0x5D (unless not sending it causes issues). For the RGB
> > patch I did, I delayed the init purposely until userspace interacts
> > with the sysfs RGB endpoint, partly to interfere with userspace
> > software less as well. So if the user does not use the sysfs RGB e.g.
> > asusctl is completely unaffected.
> >
> >> In all reality unless the full set of init is causing issues it=E2=80=
=99s best to leave them in. If it is then I guess this driver is going to b=
ecome a little more complex and have a few more quirks.
> >>
> >> Unfortunately I didn=E2=80=99t keep good records of my findings on thi=
s so it=E2=80=99s just my remembered observations that you=E2=80=99ll have =
to take at my word.
> >>
> >> It would be a good idea for you both to perhaps collaborate with Serge=
i from ghelper, he has put a huge amount of effort in to that tool and due =
to it being windows he gets a hell of a lot more use and bug reports/data t=
han this driver does. There=E2=80=99s no shame in looking to others for ins=
piration, ideas, or guidance.
> >
> > Good idea. From a quick look, indeed slash/anime is 0x5e. We could
> > interact with him more in the future.
> >
> > Although looking into it, to find the correct endpoint he does a dirty
> > check for report length being more than 128[1]. SIgh
>
> Sergei would appreciate any friendly hints for sure. He=E2=80=99s a very =
nice guy.
>
> >
> > I think it would be productive to try to merge this for 6.19. So
> > Dennis can you try to be a bit more cooperative?
>
> He=E2=80=99s not being intentionally recalcitrant. You both have vested i=
nterest in the outcomes of this review process and from what I=E2=80=99ve s=
een he has provided some excellent feedback.  If something isn=E2=80=99t go=
ing the way you want it doesn=E2=80=99t mean it=E2=80=99s personal. You wil=
l both converge on acceptable solutions through good faith and communicatio=
n.
>
> I=E2=80=99ll try to get a look in early on the next patch version and hel=
p a little if I can - it would be good to get this work in kernel and you b=
oth build off it.

I do not have any comments to go through for a next revision yet. I
tried to fix Denis' comments in this revision, I have not received
something actionable from him for this revision yet.

> >
> > I already have 6 more patches for duo keyboards. Although the keyboard
> > brightness button on those seems to not work (?)[2]. I am waiting on a
> > reply for that. Perhaps it uses a slightly different ID code. However,
> > it seems that brightness works even when disconnecting and connecting
> > the keyboard. Which is great.
>
> Do the keys emit any codes? Maybe checking the raw output before it all g=
ets filtered by the driver could help (like printing the raw array as hex) =
in asus_raw_event(). If there is nothing it could be emitting WMI events. A=
SUS did a dirty on some laptops and left the default WMI (I probably misrem=
ember, but ACPI event at least) in the ACPI, but made them emit nothing and=
 used HID for brightness control instead.
>
> That was this patch: https://github.com/torvalds/linux/commit/a720dee5e03=
9238a44c0142dfccdc0e35c1125f7

This series fixes that problem. It makes all HID and WMI RGB stuff go
under a single device under asus-wmi and be controlled together.
Solves a lot of problems. For the Z13, it has two devices for
brightness: lightbar and keyboard. The duo has a detacheable keyboard
that switches from USB to bluetooth. The devices on that patch have
both WMI and HID. And while you say that only one controls RGB, there
is probably something little like a lid light that is controlled by
WMI/HID and was missed by that patch. Also makes us not require a
quirk.

It also means that a WMI event would then control the USB backlight too.

> Seems likely that because it appears to be a single button brightness cyc=
le it could be a new code. In any case, debug printing the raw array as hex=
 will show it if it=E2=80=99s being emitted.

Yeah, its not an unmapped event because it did not show up in the log.
It is probably mapped to something. I am waiting for the user to tell
me the event.

> While I remember, if you ever start playing with per-key RGB I mapped a l=
ot of laptops https://gitlab.com/asus-linux/reverse-engineering/-/blob/mast=
er/keyboard/per_key_raw_bytes.ods?ref_type=3Dheads - something to note is t=
hat each packet takes 1ms, but due to kernel internals it may attempt a bur=
st of a few, or there could be up to 5ms delay. So a full sequence per row =
can be 8-20ms or more.
>
> Oh, small reminder: if any patch changes dramatically from what I reviewe=
d my tags should be removed.

I removed some reviewed-by when i rewrote the first part of the
series. The latter part is mostly unchanged, although perhaps after
switching to the work queue, there was a leftover reviewed-by that was
kept.

Antheas

> >
> > Antheas
> >
> > [1] https://github.com/seerge/g-helper/blob/610b11749b4da97346012e5d47f=
0a9bbc93b94af/app/AnimeMatrix/Communication/Platform/WindowsUsbProvider.cs#=
L37
> > [2] https://github.com/bazzite-org/kernel-bazzite/issues/35
> >
> >> Cheers,
> >> Luke.
> >>
> >>>
> >>>> No disable commands unless we find hard evidence those are strictly =
needed.
> >>>
> >>> They are needed for the Xbox Ally series, but since this driver does
> >>> not do RGB it is out of scope.
> >>>
> >>>>> Antheas
> >>>>>
> >>>>>>> Hopefully this clears things up
> >>>>>>>
> >>>>>>> Antheas
> >>>>>>>
> >>>>>>>>> Unrelated but I was b4ing this series on Ubuntu 24 and got BADS=
IG:
> >>>>>>>>> DKIM/antheas.dev. Is there a reference for fixing this on my ho=
st?
> >>>>>>>>> Perhaps it would help with spam
> >>>>>>>> I see BADSIG very often these days from b4 (thanks to gmail expi=
ring
> >>>>>>>> things after 7 days or so, I recall hearing somewhere), I just i=
gnore them
> >>>>>>>> entirely.
> >>>>>>>>
> >>>>>>>> AFAIK, that has never caused any delay to any patch in pdx86 dom=
ain so if
> >>>>>>>> that is what you thought is happening here, it's not the case.
> >>>>>>>> If your patch does appear in the pdx86 patchwork, there's even l=
ess reason
> >>>>>>>> to worry as I mostly pick patches to process using patchwork's l=
ist.
> >>>>>>> Turns out I had to update my DNS records. It should be good now.
> >>>>>>>
> >>>>>>>> --
> >>>>>>>> i.
> >>>>>> snipp
> >>>>>>>>>> 2.51.2
> >>
> >>
> >>
> >
>
>


