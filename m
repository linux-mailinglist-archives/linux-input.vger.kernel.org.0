Return-Path: <linux-input+bounces-11159-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0047EA6E750
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 00:47:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DB261897A8A
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 23:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5375F1EDA1E;
	Mon, 24 Mar 2025 23:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="q5W0pPGV"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8E11A317D;
	Mon, 24 Mar 2025 23:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742860067; cv=none; b=EKQw+7pYmtd2Ekh/6uYpddw5vWAZLd9UwX/YvY6jeJbai2cDgG5UyDRh+3KM94g4AJy24Nx80sW722gGjwfcPLfXPeevw8BEWmAsquCDDVJV1hNolLkJaAH2kOhE3f8tmbRtTLcVhd3LY9etbg5bDoZeb3Oe4T3lMZWatYnGH4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742860067; c=relaxed/simple;
	bh=QrPBHLeAzOPBTQ6zTG+HdJicAkfJR4NUKrX8iW/6/W8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLE5vBiUpb7A2pSFH1zMaMmmkknu+2WikC4eZc9kTv47hmd+y09MtTrOzNH1KCccEvqVyonRA905STP/W5IIfZpWUotC19HO7gzTpyaUB3DeSwScH0tLsHIZFe3Zvp/+7xv9P+GQNxmJ3lGiWZTCaNmJYY/TID7AsTH2+GjUUBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=q5W0pPGV; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 5D4692E0A471;
	Tue, 25 Mar 2025 01:47:40 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742860060;
	bh=PYcQ5n7onr2JZZUax0U38zZtRs3TTLG4Sdybmv++n/M=;
	h=Received:From:Subject:To;
	b=q5W0pPGVCkycpXfLtW5n8Ri6VVwtdzINUKJYM5U7twevstDNYO9/PBvRowntTy0DS
	 MGlKkjBiIEWuEeHz91R+68Y6Ny4uAHLnEIjFaAPsiT9AAidojAqqX2co4Zi36qQc9n
	 wkHjIQoObz5euCGvDmwwT1yNlXaRMk6xlNzqun0Q=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.172) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f172.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30c461a45f8so50187431fa.1;
        Mon, 24 Mar 2025 16:47:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW0yme5aWEv/I9v8oIGx5asizTHqDyGtxTHQlav5N2pBU8qm1jgP9H49aelgni4j6IBPX3Aruajk4UeRw==@vger.kernel.org,
 AJvYcCWMKSMe9yiAmdZZrzUm8D1XeY7FvU86eILSCnhTP3IaV6/DgiF/MHhzMaJcyRLkg18jcchDbiKKi5pTJ5dRfGg+9T1/AA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxAb5ovTqTTqta+5djVafayavYOs2WZ/ZEurHjdSC6t78svYXWr
	9n2hgf15ZiLIXPW5AM0MItiW9QtP1iSIgYv6NV2PCj8TkWymdkOX+BMoPUBwm163yjIR1bVOh11
	Pd5iuxT3Qv7FASLKSeUR9M326JVU=
X-Google-Smtp-Source: 
 AGHT+IHU4plpPFAMu8DHL+He4gueN4WbmcDeLY3sJYIm30ffOR4sdSoWh5oADOhB+oaEzDDVrftQSdsv0arwtdNPASs=
X-Received: by 2002:a2e:be1d:0:b0:30d:62c1:3c0a with SMTP id
 38308e7fff4ca-30d7e2aa82cmr61846191fa.25.1742860059463; Mon, 24 Mar 2025
 16:47:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250323023421.78012-1-luke@ljones.dev>
 <CAGwozwE4oXmFMRO5jZJC4d11TstTqSC8ZUZ1CCkZMWYZKTKF_w@mail.gmail.com>
 <deeb4946-dd66-4a82-a8f0-5e8b1751899e@ljones.dev>
 <CAGwozwGPVJznyX4Vp5vNfb1JOP7AGoZV3vOkRwT_W=_0g+gkJQ@mail.gmail.com>
 <41bf9d87-be11-4814-bc3e-c6c9297e0cc4@ljones.dev>
 <CAGwozwGE0vVUEn=1pCakhcMZP8oT=9jzrYMNYM8RvBvE9Wq0WQ@mail.gmail.com>
 <0badc4de-92c7-4de6-b609-cb0ea1ef50d7@ljones.dev>
In-Reply-To: <0badc4de-92c7-4de6-b609-cb0ea1ef50d7@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 25 Mar 2025 00:47:26 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFR0gJaOwoJhE47qcecr+DvK6=f0stCc+nnFOzF4y8HJw@mail.gmail.com>
X-Gm-Features: AQ5f1JoxmXN1kxg3tXml-UCai3faIVK9NtEcLsSmHkyQeFPq3WXx5oL7uz7JwsM
Message-ID: 
 <CAGwozwFR0gJaOwoJhE47qcecr+DvK6=f0stCc+nnFOzF4y8HJw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] hid-asus: asus-wmi: refactor Ally suspend/resume
To: "Luke D. Jones" <luke@ljones.dev>
Cc: linux-kernel@vger.kernel.org, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, bentiss@kernel.org, jikos@kernel.org,
	mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174286006076.14388.8429116540456581861@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Tue, 25 Mar 2025 at 00:44, Luke D. Jones <luke@ljones.dev> wrote:
>
> On 25/03/25 03:46, Antheas Kapenekakis wrote:
> > On Mon, 24 Mar 2025 at 11:34, Luke D. Jones <luke@ljones.dev> wrote:
> >>
> >> On 24/03/25 21:11, Antheas Kapenekakis wrote:
> >>> On Mon, 24 Mar 2025 at 02:41, Luke D. Jones <luke@ljones.dev> wrote:
> >>>>
> >>>> On 24/03/25 00:41, Antheas Kapenekakis wrote:
> >>>>> On Sun, 23 Mar 2025 at 03:34, Luke Jones <luke@ljones.dev> wrote:
> >>>>>>
> >>>>>> This short series refactors the Ally suspend/resume functionality in the
> >>>>>> asus-wmi driver along with adding support for ROG Ally MCU version checking.
> >>>>>>
> >>>>>> The version checking is then used to toggle the use of older CSEE call hacks
> >>>>>> that were initially used to combat Ally suspend/wake issues arising from the MCU
> >>>>>> not clearing a particular flag on resume. ASUS have since corrected this
> >>>>>> especially for Linux in newer firmware versions.
> >>>>>>
> >>>>>> - hid-asus requests the MCU version and displays a warning if the version is
> >>>>>>      older than the one that fixes the issue.
> >>>>>> - hid-asus awill also toggle the CSEE hack off, and mcu_powersave to on if the
> >>>>>> version is high enough.
> >>>>>>
> >>>>>> *Note: In review it was requested by Mario that I try strsep() for parsing
> >>>>>> the version. I did try this and a few variations but the result was much
> >>>>>> more code due to having to check more edge cases due to the input being
> >>>>>> raw bytes. In the end the cleaned up while loop proved more robust.
> >>>>>>
> >>>>>> - Changelog:
> >>>>>>      + V2: https://lore.kernel.org/platform-driver-x86/20250226010129.32043-1-luke@ljones.dev/T/#t
> >>>>>>        - Adjust warning message to explicitly mention suspend issues
> >>>>>
> >>>>> How did the testing go with this one, especially with mcu_powersave 0?
> >>>>
> >>>> Appears to be good. Checked a few reboots with powersave off - it is
> >>>> setting on as I expect every time. Did modules unload/load also. And
> >>>> tested with it set off after boot plus suspend resumes.
> >>>
> >>> Did you test suspends with mcu_powersave to 0 and rgb on? I had a few
> >>> issues you can reference the previous version for and I want to see if
> >>> you have them.
> >>>
> >>> Even with powersave set to 1, the RGB does not fade anymore without the quirk
> >>
> >> Yes I tested every scenario I could think of. I don't think the fade is
> >> something to worry about
> >
> >  From my testing, I got it to flash random colors and not disconnect
> > properly, so if you really want to remove it, you should make sure to
> > test the version that disables the quirk properly first.
>
> Like I said I have. This "random colours" sounds like a userspace issue
> such as the solid/static colour not having set/apply/save after it.
> There is zero in this patch to cause anything like that.

No userspace software was running at the time and hhd will always do
b3/b4/b5 at least once. It looks like a firmware bug that is triggered
because of the reorder.

> 1` hour later: I'm currently doing a very heavy refactor of the
> hid-asus-ally driver and it looks like I've solved both the fade (a very
> noticeable improvement), and the random colour issue. I'll do my best to
> get this done by the middle of weekend (I'm UTC+12) so you can have a
> test - to save you some time I'll have your patch series on top with
> conflicts solved.
>
> >> seems like it happening at all previously was
> >> just due to suspend being held up for a bit longer and now that the hack
> >
> > Yes, because Windows does not enter s0i3 instantly, so some devices,
> > like the Ally units, like the Go S, rely on that for different
> > purposes. 500ms is perfectly fine for both, and since it happens
> > during suspend and not resume, provided that the screen has been
> > turned off, it is transparent. (The Go S gets an APU hang due to very
> > aggressive TDP tuning; a delay after the sleep entry call and
> > userspace suspend lets the VRMs cool off a bit)
> >
> >> is disabled for new FW, it relies fully on Linux suspend (async?
> >> Honestly it's never been fully clear how async it really is).
> >
> > The call is at the wrong place unfortunately. That's about it
> >
> >> I'd rather the faster suspend/resume. And so far I've heard no
> >> complaints (although my userbase is smaller than bazzites).
> >
> > Have you deployed the V4 though? Because the behavior with the quirk
> > is fine. WIthout, it is soso.
>
> I have. I agree it was... meh. But the hid-asus-ally rewrite is solving
> a lot of issues now, and I'm thoroughly testing every scenario and
> applying a lot of lessons learned.
>
> To be clear: Right now this current series is good. The issues
> encountered are solved in hid-asus-ally, so I'm comfortable with merging
> this upstream and I'll try crack on with the new driver.
>
> >> Cheers,
> >> Luke.
> >>
> >>> Antheas
> >>>
> >>>> Very much hope this is the end of that particular saga, and with
> >>>> bazzites help we can hopefully get everyone on November MCU FW or later,
> >>>> then finally remove the hack completely this year.
> >>>>
> >>>> A small side note - I expect ASUS to fully reuse the X hardware, or at
> >>>> least the bios/acpi/mcu-fw for that new windows handheld they've doing,
> >>>> so fingers crossed that they actually do, and there will be nomore
> >>>> suspend issues with current kernels plus this patch.
> >>>>
> >>>> Cheers,
> >>>> Luke.
> >>>>
> >>>>>>        - Use switch/case block to set min_version
> >>>>>>          - Set min_version to 0 by default and toggle hacks off
> >>>>>>      + V3
> >>>>>>        - Remove noise (excess pr_info)
> >>>>>>        - Use kstrtoint, not kstrtolong
> >>>>>>        - Use __free(kfree) for allocated mem and drop goto + logging
> >>>>>>        - Use print_hex_dump() to show failed data after pr_err in mcu_request_version()
> >>>>>>        - Use pr_debug in set_ally_mcu_hack() and set_ally_mcu_powersave() plus
> >>>>>>          correct the message.
> >>>>>>      + V4
> >>>>>>        - Change use_ally_mcu_hack var to enum to track init state and
> >>>>>>          prevent a race condition
> >>>>>>
> >>>>>> Luke D. Jones (2):
> >>>>>>      hid-asus: check ROG Ally MCU version and warn
> >>>>>>      platform/x86: asus-wmi: Refactor Ally suspend/resume
> >>>>>>
> >>>>>>     drivers/hid/hid-asus.c                     | 111 ++++++++++++++++-
> >>>>>>     drivers/platform/x86/asus-wmi.c            | 133 +++++++++++++++------
> >>>>>>     include/linux/platform_data/x86/asus-wmi.h |  19 +++
> >>>>>>     3 files changed, 222 insertions(+), 41 deletions(-)
> >>>>>>
> >>>>>> --
> >>>>>> 2.49.0
> >>>>>>
> >>>>
> >>
>

