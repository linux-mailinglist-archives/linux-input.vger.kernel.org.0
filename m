Return-Path: <linux-input+bounces-11132-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D1949A6D5F0
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 09:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 650C27A46F3
	for <lists+linux-input@lfdr.de>; Mon, 24 Mar 2025 08:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE28F2571D9;
	Mon, 24 Mar 2025 08:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="Ls7WTJm6"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA6114F9FB;
	Mon, 24 Mar 2025 08:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803928; cv=none; b=E6nvkFzz305GqsgICVmTRFGoykUp/U7UIOeooBa3wiLC7jxVhsVuAN/Gyw28RXHtZA6EYHUHvFHIPNskMZLxfwXzwOBWH1weQhXHQoHYLdzf1Nqa6NHjPlIfZyVmpTNr9+1ZLKSIoxdBhOdb0OJ/j9r+fwPMtV9HBxunCmpXrwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803928; c=relaxed/simple;
	bh=eHIp7iBjf1YOUYhvDxBBc9hk7NqJcL+qN+rp5uGZSxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZVFX9b86iJLwhk2VPb70dUcb4cTKLXG6f7sDtWzlD5mBCSUFlap6ot+1uLUyaVub4ZXxTkqmd5IjfsJ+f+yWNmd1y88ECLVV29DtbiZ3v1NfL9+vkPiuuKxykBfZfL3W9jazDaCjQLqE5FbElcFRZwaApq6xY3Mve4xHnm0uxYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=Ls7WTJm6; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id C527C2E08A34;
	Mon, 24 Mar 2025 10:11:51 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742803912;
	bh=KZtOYyN6u7iUxDu2dd+wxNF4m9YyO0dH7S4MRGpkHe0=;
	h=Received:From:Subject:To;
	b=Ls7WTJm6jU+hj97Re0n/KRBk4qmMy3mhPJBgSrhGbuBLMGmKuZ1u/8T4BxgubPCPf
	 wFG6PBhCK6qPfoZjGmKnlnM7fBDRWhJtUBL9rLRZrtQTIBzBUn3kezQJK2ERYQRkIK
	 G2qGrfB8T7SYKPapOL2FQSxmCZ2f8EMUbOqIzhcA=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.178) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f178.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30bd11bfec6so45494461fa.0;
        Mon, 24 Mar 2025 01:11:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW9sR4V80o/3+iyv2TIlJeXLvqxUVwYeg/80pAzwCTozFgPp/848aRqS2mOdX9XtbkKbO6HLTHzfYEeEDrL4TSARtlVhw==@vger.kernel.org,
 AJvYcCWvpTwzmvgpFQEi99YUuMEq2fWKJZNJUVRpO8S4H6GcQQD4DwcXmkEj9SRGqF4SnBgnnOt3dPE0jyxRcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDiFUT6vxqX3rePcVnA/jaJgD+XZfj46pPZzDY8j1WM7PExR7R
	kvMdeNihhJ6kt0Pdlzj6JGVRLpXxwvCx5Sny2HO2hINtKSui83U8mgmT/P53TqszOHkLP4YBdL5
	shosA7yJHtp9GSQXUfX/qPmX+7KA=
X-Google-Smtp-Source: 
 AGHT+IGDnUrS3HDfaYxsBYjwNZBsErQkNIuGDhNymONcMea26ATAGittZt2w8XjXXQJBKEJHaSxIGsZKsQI1rVk2V+0=
X-Received: by 2002:a2e:bc11:0:b0:30b:b987:b676 with SMTP id
 38308e7fff4ca-30d7e2063efmr45944701fa.2.1742803910976; Mon, 24 Mar 2025
 01:11:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250323023421.78012-1-luke@ljones.dev>
 <CAGwozwE4oXmFMRO5jZJC4d11TstTqSC8ZUZ1CCkZMWYZKTKF_w@mail.gmail.com>
 <deeb4946-dd66-4a82-a8f0-5e8b1751899e@ljones.dev>
In-Reply-To: <deeb4946-dd66-4a82-a8f0-5e8b1751899e@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 24 Mar 2025 09:11:39 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGPVJznyX4Vp5vNfb1JOP7AGoZV3vOkRwT_W=_0g+gkJQ@mail.gmail.com>
X-Gm-Features: AQ5f1JpHGo1PrvqvdWj7BcyQHZcTO5OlmIFdxKcqLUZj5X_HGdIimz7aZ-FqyPQ
Message-ID: 
 <CAGwozwGPVJznyX4Vp5vNfb1JOP7AGoZV3vOkRwT_W=_0g+gkJQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] hid-asus: asus-wmi: refactor Ally suspend/resume
To: "Luke D. Jones" <luke@ljones.dev>
Cc: linux-kernel@vger.kernel.org, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, bentiss@kernel.org, jikos@kernel.org,
	mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: <174280391223.1607.13078467718376702@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Mon, 24 Mar 2025 at 02:41, Luke D. Jones <luke@ljones.dev> wrote:
>
> On 24/03/25 00:41, Antheas Kapenekakis wrote:
> > On Sun, 23 Mar 2025 at 03:34, Luke Jones <luke@ljones.dev> wrote:
> >>
> >> This short series refactors the Ally suspend/resume functionality in the
> >> asus-wmi driver along with adding support for ROG Ally MCU version checking.
> >>
> >> The version checking is then used to toggle the use of older CSEE call hacks
> >> that were initially used to combat Ally suspend/wake issues arising from the MCU
> >> not clearing a particular flag on resume. ASUS have since corrected this
> >> especially for Linux in newer firmware versions.
> >>
> >> - hid-asus requests the MCU version and displays a warning if the version is
> >>    older than the one that fixes the issue.
> >> - hid-asus awill also toggle the CSEE hack off, and mcu_powersave to on if the
> >> version is high enough.
> >>
> >> *Note: In review it was requested by Mario that I try strsep() for parsing
> >> the version. I did try this and a few variations but the result was much
> >> more code due to having to check more edge cases due to the input being
> >> raw bytes. In the end the cleaned up while loop proved more robust.
> >>
> >> - Changelog:
> >>    + V2: https://lore.kernel.org/platform-driver-x86/20250226010129.32043-1-luke@ljones.dev/T/#t
> >>      - Adjust warning message to explicitly mention suspend issues
> >
> > How did the testing go with this one, especially with mcu_powersave 0?
>
> Appears to be good. Checked a few reboots with powersave off - it is
> setting on as I expect every time. Did modules unload/load also. And
> tested with it set off after boot plus suspend resumes.

Did you test suspends with mcu_powersave to 0 and rgb on? I had a few
issues you can reference the previous version for and I want to see if
you have them.

Even with powersave set to 1, the RGB does not fade anymore without the quirk

Antheas

> Very much hope this is the end of that particular saga, and with
> bazzites help we can hopefully get everyone on November MCU FW or later,
> then finally remove the hack completely this year.
>
> A small side note - I expect ASUS to fully reuse the X hardware, or at
> least the bios/acpi/mcu-fw for that new windows handheld they've doing,
> so fingers crossed that they actually do, and there will be nomore
> suspend issues with current kernels plus this patch.
>
> Cheers,
> Luke.
>
> >>      - Use switch/case block to set min_version
> >>        - Set min_version to 0 by default and toggle hacks off
> >>    + V3
> >>      - Remove noise (excess pr_info)
> >>      - Use kstrtoint, not kstrtolong
> >>      - Use __free(kfree) for allocated mem and drop goto + logging
> >>      - Use print_hex_dump() to show failed data after pr_err in mcu_request_version()
> >>      - Use pr_debug in set_ally_mcu_hack() and set_ally_mcu_powersave() plus
> >>        correct the message.
> >>    + V4
> >>      - Change use_ally_mcu_hack var to enum to track init state and
> >>        prevent a race condition
> >>
> >> Luke D. Jones (2):
> >>    hid-asus: check ROG Ally MCU version and warn
> >>    platform/x86: asus-wmi: Refactor Ally suspend/resume
> >>
> >>   drivers/hid/hid-asus.c                     | 111 ++++++++++++++++-
> >>   drivers/platform/x86/asus-wmi.c            | 133 +++++++++++++++------
> >>   include/linux/platform_data/x86/asus-wmi.h |  19 +++
> >>   3 files changed, 222 insertions(+), 41 deletions(-)
> >>
> >> --
> >> 2.49.0
> >>
>

