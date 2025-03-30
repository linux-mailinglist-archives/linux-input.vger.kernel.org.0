Return-Path: <linux-input+bounces-11363-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A13DA758F3
	for <lists+linux-input@lfdr.de>; Sun, 30 Mar 2025 10:40:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC2C3168EED
	for <lists+linux-input@lfdr.de>; Sun, 30 Mar 2025 08:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31F871991CD;
	Sun, 30 Mar 2025 08:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="RzV0fq7o"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B5B17B418;
	Sun, 30 Mar 2025 08:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743324005; cv=none; b=CQVkSUDTPXuS+uoPCGnqBIUd6YPBLzBnyOlmaKhpCNhGqBQaW94IS/9bSCN3Emr9phCnqFTfJBJAy5A+I5sbw2BIE7b9flENFX6KgOh9djF4nbEPxJuGZ1WvDNYhKV00Gdzl5rO4fH3yqYL1fTMctenfWpvqCV1TtK4348oKjAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743324005; c=relaxed/simple;
	bh=8NFl9Rm+/neaLUUhF6x3kk32vpPnZ0g7mkwNz2mowVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+ws7vPVgI51cyPzNUSfzpUWdnrmWQUuU0joh/Y7DAKzqkt8FKgCcTOUVoO+VbV8728zyAkyT6U4iKxP2MFx4c2ZUQZDJGSE7fDLr1+35SID0AvFvxorjtqU8NW0fyICvEQdJpwduVtYSH60+OfdJ7BtvQ1A+hzR9ALdjVe2oZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=RzV0fq7o; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 453832E02C63;
	Sun, 30 Mar 2025 11:39:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1743323991;
	bh=8NFl9Rm+/neaLUUhF6x3kk32vpPnZ0g7mkwNz2mowVM=;
	h=Received:From:Subject:To;
	b=RzV0fq7oT7DUunroLGA9rHPWnECB6Z+U93wO0tgkiseEpH8zkEj5qTujRb166vOI6
	 cEpdsx25mvwH9aqiRZxtNEWAeLy2NVjYijQShNUf4QC9uHH+f40wovUWBBrOkRkRKM
	 zgs6fo4t81Z3Odr6KknJjTG1rJWyw+Iy/30/1Fyc=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.179) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f179.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-307c13298eeso40425401fa.0;
        Sun, 30 Mar 2025 01:39:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVR9oRApgSafWb3gY26r3pJ/j9BtiM4rb5HqO1hVsudIA9DR507IcjC9cH53xunss1SQ0xU+iEIkXT6GQ==@vger.kernel.org,
 AJvYcCWiJojYEzhlIZFnk/4/feV6x2qYgCvllgdWp4DBd5vKwdcfnT7P5np77WsdqikIjkaw6rG/ghaDBuFueoRb5M5qNmegXg==@vger.kernel.org,
 AJvYcCXw99wky5o3bOcqiarzY2mxqle/kpRrsIRyQ6/xkjpP2eKBJ4fWOeDo2rtjyOnoMrALw7Zj2Jjr8Kdzf3ni@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9FTZ+HLlcrPAbnks3+Lk5zJu9sfhzXdbgS1XP5nWrkqSpTFjV
	KIP1wX97vKEVnu0k9gMQYiKFTccQRW/8pcU16192i3BJ730Irelnp/yMU2uS85FrfTQQ7REpkM5
	ODCTGnKaaoyGr7FloQ+1jf5/kQd4=
X-Google-Smtp-Source: 
 AGHT+IERs4pT/k/49aQC65OzWEWwormi5XQVt1V4Fo2YyTJWPbmDq1/t81uPTRhJx0gJ1zThqnVkJxkNvqPiqIfbNls=
X-Received: by 2002:a2e:9182:0:b0:30b:f0dd:9096 with SMTP id
 38308e7fff4ca-30dd409e992mr28942311fa.12.1743323990661; Sun, 30 Mar 2025
 01:39:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325184601.10990-1-lkml@antheas.dev>
 <20250325184601.10990-10-lkml@antheas.dev>
 <f04e6a59-cb72-9ca9-2c98-85702b6194fa@linux.intel.com>
 <CAGwozwF8PZczpqOFm3ONDdJTVCgcWOZ8mXrASbmiAXUhQvOhdg@mail.gmail.com>
 <43c4dd17-de34-804f-7080-b287ac4a0cac@linux.intel.com>
 <26s13395-1ro2-37o8-01q5-6r4p09p69174@xreary.bet>
In-Reply-To: <26s13395-1ro2-37o8-01q5-6r4p09p69174@xreary.bet>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 30 Mar 2025 10:39:38 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwHbZHk_eSe-ZEM6jYM2HC4GxwnUrreZSh=+xJrKquEi9g@mail.gmail.com>
X-Gm-Features: AQ5f1Jra7sQb-aaz8rgqvtj8FVHUmYutqJvSPeAOe85u6LHamCT55MgFfnENILI
Message-ID: 
 <CAGwozwHbZHk_eSe-ZEM6jYM2HC4GxwnUrreZSh=+xJrKquEi9g@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] HID: asus: add basic RGB support
To: Jiri Kosina <jikos@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <174332399157.10109.13157866496455022773@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Wed, 26 Mar 2025 at 12:00, Jiri Kosina <jikos@kernel.org> wrote:
>
> On Wed, 26 Mar 2025, Ilpo J=C3=A4rvinen wrote:
>
> > You don't need to "pause" for the merge window, in some subsystem
> > there's mandatory pause during merge window but I find that unnecessary=
.
> > I know people on pdx86 do review during merge window so no need to wait
> > when working with patches related to pdx86. Just don't expect patches
> > get applied during the merge window or right after it (the latter tends=
 to
> > be the most busiest time of cycle for me) :-).
> >
> > It's more about the frequency, how often to send a series which is
> > relatively large. Large number of versions end up just filling inboxes
> > (and patchwork's pending patches list) and we don't have time to read t=
hem
> > all through so I suggest waiting like 3 days at minimum between version=
s
> > when the series is large or complex to give time to go through the seri=
es.
> >
> > This is not a hard rule, so if there are e.g. many significant changes,
> > feel free to "violate" it in that case.
>
> Exactly. I am unlikely to do much review during the merge window myself,
> but I'll pick up the patchset and followup once the merge window is over,
> so feel free to keep discussing and polishing it with me on CC :)
>
> Thanks,

I think we have reached a good point with this series. We can pick up
again when you guys are ready.

I will switch gears and look a bit into msi-wmi-platform for the MSI
Claw with Armin and we can revisit this come rc1.

Let's try to get through it early in 6.16 so that Luke can also do
what he wants to with the Ally, and let's push the oxpec move as well,
so I can get those two off my plate.

Antheas

> --
> Jiri Kosina
> SUSE Labs
>

