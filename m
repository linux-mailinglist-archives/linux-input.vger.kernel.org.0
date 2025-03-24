Return-Path: <linux-input+bounces-11142-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4916EA6DD4B
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 15:46:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69A503A82FC
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 14:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C22125F79B;
	Mon, 24 Mar 2025 14:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="aXDT7Evh"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4532F2628C;
	Mon, 24 Mar 2025 14:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742827579; cv=none; b=tDgq9LvEeU3tWGYi4XydM0T53S/eFAEY3XN18uArcF4soZcHz17bFirflTz4S71g0hjX5Xl/ljsY8KaM4AgBPK/3TD2KLof2t7Yf+hQ+TE+j1OR31+YiS5KzCdk/UKGPfLFscMUYJLP+DX4yu2wtAhvBUXUenK2zxIoiLmdBK1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742827579; c=relaxed/simple;
	bh=ToTpe1LYw9DyodZumYyKXOyXesV7edGmIPf4l5abzO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VoMUIIpaPNlxuJVtmykE02M7IZp2BMGsPjXFTAra6u1IV74UJeluP7upbaDA0h6EySHUrLj+D69IkFONxLgS8DU7/k51VHZ7xhYDSnMZGS7vpDBmfAL9Bq5BXqiZI0hbCYORzCCTWnidrGrCNJEBE/GiSSIllvz3Yt/Rasqg/mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=aXDT7Evh; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 2C5602E00F59;
	Mon, 24 Mar 2025 16:46:12 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742827572;
	bh=u9IU7+meIOr371mEdgZ5pCKYmQvhV+O9kkQwA6cXgqA=;
	h=Received:From:Subject:To;
	b=aXDT7EvhoBhi9UTolqPDg5rsjBJ+DZI4EQ5ISBXalkRv8YGsjtaLeIsLG3Xgj4t0y
	 PW8/4pYPLXvTAkG+DQem9s4JIm7zdUELXrUF1cAvRkifqHQTHJocaxu5daFlWlsuNH
	 j3i+8TdomIyWts4cxV841AmWxotBzILkwwEJd0ZA=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.180) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f180.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-30bfed67e08so50912141fa.2;
        Mon, 24 Mar 2025 07:46:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVA0K5oVvecOL+kwZXbriEbUYxObINbZTCHNjlsmx8jfh2hevSj4ac7jzoUKZOE+2pgZq96R+8MZc7XcQ==@vger.kernel.org,
 AJvYcCXIs2Mfpsmv86jBUj2Wl3YpRLOnATl5poH1a/1rKj6fwnOaD/ACUnRCABcQMOWYdBhKZRH0XkXV6rA+JmIp9qN13Y1BVA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuNp28w6D5ZpDU+WosvsoQIJuW5Brh0K1dYPDF3TIJzRSBa5uU
	4UlnY9GkKBbH4hciMVXnPmlS+9ckcTt2fi6kLP6Dh+BlzjA6tSvph+vSLdFdgQ1hahY3ofjvbXG
	V90nl6xWM7U9HzITRIZWdrJiwK5Y=
X-Google-Smtp-Source: 
 AGHT+IG1p8/DmYpOK8sy9cB93Dxy5t2DVU+b7G1nWVZeFTjaZ7IkdowFc9dZ5907eE+CcbMg5YGyY6jhIAa8bcUpKrQ=
X-Received: by 2002:a2e:8612:0:b0:30b:e440:dbdb with SMTP id
 38308e7fff4ca-30d7e31c966mr46041311fa.37.1742827571490; Mon, 24 Mar 2025
 07:46:11 -0700 (PDT)
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
In-Reply-To: <41bf9d87-be11-4814-bc3e-c6c9297e0cc4@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 24 Mar 2025 15:46:00 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGE0vVUEn=1pCakhcMZP8oT=9jzrYMNYM8RvBvE9Wq0WQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jr4NC78r4qNNNTLJDqqS3v7268tJEAEM67O7hxcO8RLWmmyIYj8P_JJigU
Message-ID: 
 <CAGwozwGE0vVUEn=1pCakhcMZP8oT=9jzrYMNYM8RvBvE9Wq0WQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] hid-asus: asus-wmi: refactor Ally suspend/resume
To: "Luke D. Jones" <luke@ljones.dev>
Cc: linux-kernel@vger.kernel.org, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, bentiss@kernel.org, jikos@kernel.org,
	mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174282757277.17451.1073231361952910226@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Mon, 24 Mar 2025 at 11:34, Luke D. Jones <luke@ljones.dev> wrote:
>
> On 24/03/25 21:11, Antheas Kapenekakis wrote:
> > On Mon, 24 Mar 2025 at 02:41, Luke D. Jones <luke@ljones.dev> wrote:
> >>
> >> On 24/03/25 00:41, Antheas Kapenekakis wrote:
> >>> On Sun, 23 Mar 2025 at 03:34, Luke Jones <luke@ljones.dev> wrote:
> >>>>
> >>>> This short series refactors the Ally suspend/resume functionality in the
> >>>> asus-wmi driver along with adding support for ROG Ally MCU version checking.
> >>>>
> >>>> The version checking is then used to toggle the use of older CSEE call hacks
> >>>> that were initially used to combat Ally suspend/wake issues arising from the MCU
> >>>> not clearing a particular flag on resume. ASUS have since corrected this
> >>>> especially for Linux in newer firmware versions.
> >>>>
> >>>> - hid-asus requests the MCU version and displays a warning if the version is
> >>>>     older than the one that fixes the issue.
> >>>> - hid-asus awill also toggle the CSEE hack off, and mcu_powersave to on if the
> >>>> version is high enough.
> >>>>
> >>>> *Note: In review it was requested by Mario that I try strsep() for parsing
> >>>> the version. I did try this and a few variations but the result was much
> >>>> more code due to having to check more edge cases due to the input being
> >>>> raw bytes. In the end the cleaned up while loop proved more robust.
> >>>>
> >>>> - Changelog:
> >>>>     + V2: https://lore.kernel.org/platform-driver-x86/20250226010129.32043-1-luke@ljones.dev/T/#t
> >>>>       - Adjust warning message to explicitly mention suspend issues
> >>>
> >>> How did the testing go with this one, especially with mcu_powersave 0?
> >>
> >> Appears to be good. Checked a few reboots with powersave off - it is
> >> setting on as I expect every time. Did modules unload/load also. And
> >> tested with it set off after boot plus suspend resumes.
> >
> > Did you test suspends with mcu_powersave to 0 and rgb on? I had a few
> > issues you can reference the previous version for and I want to see if
> > you have them.
> >
> > Even with powersave set to 1, the RGB does not fade anymore without the quirk
>
> Yes I tested every scenario I could think of. I don't think the fade is
> something to worry about

From my testing, I got it to flash random colors and not disconnect
properly, so if you really want to remove it, you should make sure to
test the version that disables the quirk properly first.

> seems like it happening at all previously was
> just due to suspend being held up for a bit longer and now that the hack

Yes, because Windows does not enter s0i3 instantly, so some devices,
like the Ally units, like the Go S, rely on that for different
purposes. 500ms is perfectly fine for both, and since it happens
during suspend and not resume, provided that the screen has been
turned off, it is transparent. (The Go S gets an APU hang due to very
aggressive TDP tuning; a delay after the sleep entry call and
userspace suspend lets the VRMs cool off a bit)

> is disabled for new FW, it relies fully on Linux suspend (async?
> Honestly it's never been fully clear how async it really is).

The call is at the wrong place unfortunately. That's about it

> I'd rather the faster suspend/resume. And so far I've heard no
> complaints (although my userbase is smaller than bazzites).

Have you deployed the V4 though? Because the behavior with the quirk
is fine. WIthout, it is soso.

> Cheers,
> Luke.
>
> > Antheas
> >
> >> Very much hope this is the end of that particular saga, and with
> >> bazzites help we can hopefully get everyone on November MCU FW or later,
> >> then finally remove the hack completely this year.
> >>
> >> A small side note - I expect ASUS to fully reuse the X hardware, or at
> >> least the bios/acpi/mcu-fw for that new windows handheld they've doing,
> >> so fingers crossed that they actually do, and there will be nomore
> >> suspend issues with current kernels plus this patch.
> >>
> >> Cheers,
> >> Luke.
> >>
> >>>>       - Use switch/case block to set min_version
> >>>>         - Set min_version to 0 by default and toggle hacks off
> >>>>     + V3
> >>>>       - Remove noise (excess pr_info)
> >>>>       - Use kstrtoint, not kstrtolong
> >>>>       - Use __free(kfree) for allocated mem and drop goto + logging
> >>>>       - Use print_hex_dump() to show failed data after pr_err in mcu_request_version()
> >>>>       - Use pr_debug in set_ally_mcu_hack() and set_ally_mcu_powersave() plus
> >>>>         correct the message.
> >>>>     + V4
> >>>>       - Change use_ally_mcu_hack var to enum to track init state and
> >>>>         prevent a race condition
> >>>>
> >>>> Luke D. Jones (2):
> >>>>     hid-asus: check ROG Ally MCU version and warn
> >>>>     platform/x86: asus-wmi: Refactor Ally suspend/resume
> >>>>
> >>>>    drivers/hid/hid-asus.c                     | 111 ++++++++++++++++-
> >>>>    drivers/platform/x86/asus-wmi.c            | 133 +++++++++++++++------
> >>>>    include/linux/platform_data/x86/asus-wmi.h |  19 +++
> >>>>    3 files changed, 222 insertions(+), 41 deletions(-)
> >>>>
> >>>> --
> >>>> 2.49.0
> >>>>
> >>
>

