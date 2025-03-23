Return-Path: <linux-input+bounces-11122-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBD0A6CEF9
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 12:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A25D616ED36
	for <lists+linux-input@lfdr.de>; Sun, 23 Mar 2025 11:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A707B204C24;
	Sun, 23 Mar 2025 11:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="A8uzxobq"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2661F8EEE;
	Sun, 23 Mar 2025 11:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742730106; cv=none; b=j/9jEO/Ca1xI79Zme58FG7500goMPI8bvqvCFgDghInrI6VYzn4zrvxt6fWHiF1HfXIR+EqlO+kIUVCEq5MfvPI3Vz2TRhSBphrBlvKHJ1KTtAgvMw1gdeAiSFnEmHzIsmyKSW5IHtWy4M/vQWt6+/dYya1K8BgQr4RLtRXEoGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742730106; c=relaxed/simple;
	bh=hynN0wNgw3xhQmZz9dAHlY94QJJave8fkuuEYmEO3kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W+oM2Nz18C3mCijoO+RkkT4TSbWiUW9Jv/yM9/Lev4vtPAvFwDTXQt3XF12kq/fAa1ausL/7n/z/bCVAUe4T7RiwjrDdGKc7IsX1EsCuILcdpvP38zD6nNsmcPfIrrnO21uup20EihU2fCqmB5c/jMs/szYTmJXqZsCDAhPAHWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=A8uzxobq; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 24E782E08E61;
	Sun, 23 Mar 2025 13:41:41 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742730102;
	bh=j8BJJEqej1o+O+yRIHQPQw9NYJ7yZENuE0fwF2Cw3ko=;
	h=Received:From:Subject:To;
	b=A8uzxobqsJa4uxt3tAnT8JIgdmYCZysdapGzCgcgn5PwKTMOfsaqcIGDH7JPTR7eD
	 ByXqdNkK2hOSrNPNYMDsQ1UufweMDRDlhSpiUc+ROMsnRGRQv0PFGgV2kDi2no7mqY
	 +EOdKUBDJo0whTXTB89uCJI2tLEEPZrEQ3RstnH0=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.170) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f170.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-30bf1d48843so33397851fa.2;
        Sun, 23 Mar 2025 04:41:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVMWwRtRak352niqEDNrCanNmcapdk6pMCpyuE1r8UwIUV3iWNRK0iWlg9QW1TNW/c5UU5/2vMXVuHAc4zwHKYcTjqplg==@vger.kernel.org,
 AJvYcCXPnsPaNF/c0oMwfVFNzteWZCEeBCN/ihDIm/XT0xCWEnpwy1WNAoUmHa0dI4Ch7knY5LdeeJZPgjZaww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxU7Q7W8cHk2xcQIAtRkshz7MZwci8Y6qYFb2oIi7WQKvsAsjUN
	N1+qELvTk9kRnKVk1yzJ+8CGzFkJJBfNdwr87Vmhp1Ra8CFX0SwZ16UXnJ8ucBIpuwob5juM8vf
	+a6S3GapIKDuotw4JNy4aGHq7bQw=
X-Google-Smtp-Source: 
 AGHT+IHSLib/LjGTMrHC50Xwd9ZaGGQfdwLLkQrCK0BIPwmNBbHWwYV+UOqYalzSmxx6ELxD7d6sfX01UWdMjMd0gSA=
X-Received: by 2002:a2e:9916:0:b0:30b:cd41:89c7 with SMTP id
 38308e7fff4ca-30d7e242a33mr32755891fa.22.1742730100469; Sun, 23 Mar 2025
 04:41:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250323023421.78012-1-luke@ljones.dev>
In-Reply-To: <20250323023421.78012-1-luke@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 23 Mar 2025 12:41:28 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwE4oXmFMRO5jZJC4d11TstTqSC8ZUZ1CCkZMWYZKTKF_w@mail.gmail.com>
X-Gm-Features: AQ5f1JoF94kWaG8jXbBPjG46-oIumqoywTx7_hHJaCO2qx9_rc6vs1vh0s6fq5Y
Message-ID: 
 <CAGwozwE4oXmFMRO5jZJC4d11TstTqSC8ZUZ1CCkZMWYZKTKF_w@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] hid-asus: asus-wmi: refactor Ally suspend/resume
To: Luke Jones <luke@ljones.dev>
Cc: linux-kernel@vger.kernel.org, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, bentiss@kernel.org, jikos@kernel.org,
	mario.limonciello@amd.com
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <174273010157.17532.3995022788196924961@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Sun, 23 Mar 2025 at 03:34, Luke Jones <luke@ljones.dev> wrote:
>
> This short series refactors the Ally suspend/resume functionality in the
> asus-wmi driver along with adding support for ROG Ally MCU version checking.
>
> The version checking is then used to toggle the use of older CSEE call hacks
> that were initially used to combat Ally suspend/wake issues arising from the MCU
> not clearing a particular flag on resume. ASUS have since corrected this
> especially for Linux in newer firmware versions.
>
> - hid-asus requests the MCU version and displays a warning if the version is
>   older than the one that fixes the issue.
> - hid-asus awill also toggle the CSEE hack off, and mcu_powersave to on if the
> version is high enough.
>
> *Note: In review it was requested by Mario that I try strsep() for parsing
> the version. I did try this and a few variations but the result was much
> more code due to having to check more edge cases due to the input being
> raw bytes. In the end the cleaned up while loop proved more robust.
>
> - Changelog:
>   + V2: https://lore.kernel.org/platform-driver-x86/20250226010129.32043-1-luke@ljones.dev/T/#t
>     - Adjust warning message to explicitly mention suspend issues

How did the testing go with this one, especially with mcu_powersave 0?

>     - Use switch/case block to set min_version
>       - Set min_version to 0 by default and toggle hacks off
>   + V3
>     - Remove noise (excess pr_info)
>     - Use kstrtoint, not kstrtolong
>     - Use __free(kfree) for allocated mem and drop goto + logging
>     - Use print_hex_dump() to show failed data after pr_err in mcu_request_version()
>     - Use pr_debug in set_ally_mcu_hack() and set_ally_mcu_powersave() plus
>       correct the message.
>   + V4
>     - Change use_ally_mcu_hack var to enum to track init state and
>       prevent a race condition
>
> Luke D. Jones (2):
>   hid-asus: check ROG Ally MCU version and warn
>   platform/x86: asus-wmi: Refactor Ally suspend/resume
>
>  drivers/hid/hid-asus.c                     | 111 ++++++++++++++++-
>  drivers/platform/x86/asus-wmi.c            | 133 +++++++++++++++------
>  include/linux/platform_data/x86/asus-wmi.h |  19 +++
>  3 files changed, 222 insertions(+), 41 deletions(-)
>
> --
> 2.49.0
>

