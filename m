Return-Path: <linux-input+bounces-11376-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A0DA76282
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 10:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1318D3A89C5
	for <lists+linux-input@lfdr.de>; Mon, 31 Mar 2025 08:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E1F19259E;
	Mon, 31 Mar 2025 08:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="loquEBlS"
X-Original-To: linux-input@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59B11D7E57;
	Mon, 31 Mar 2025 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743410173; cv=none; b=MX4IxnN3bxjHDvpa8Erj1faJ2ytwpxgQrxATyS0hkRxEbY1nkDpG9yreT/v9xm1nmBCFw5RaR5LJ1xcFzjHXxJVG/P2xDVx6TYAuwpDCANpzTCVblboqgU4ctUNQZOdbjwjvfP2osEBLFLG+zM2aGxlNqDKfmrg3ys38QWH9Bq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743410173; c=relaxed/simple;
	bh=DI90Fv72oQlEdDRAnNvlmspBMg85bwitY3HL32Kb9oQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m4xh82K9yIw/zPcAJfgNU0cOUAgWoFLOhK8zHHN5GEd0JA/0ZFnfavZXXPL/CekHqH4vsvDjUNML+ufvoiJ96mIfKjVcksWP+n/1DF8B8E+6d+eMOMJDtwtwucfTEhLPguFqGjFj7JbT/KstO0F4Akg1ctVguCw6LtuOjdMO7Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=loquEBlS; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id 4DBE42E07B1A;
	Mon, 31 Mar 2025 11:36:03 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1743410168;
	bh=DI90Fv72oQlEdDRAnNvlmspBMg85bwitY3HL32Kb9oQ=;
	h=Received:From:Subject:To;
	b=loquEBlSZohbbq2y1xdaRR7/Ldo1m0EeItX87OyGZH4APfy37G+0xTlnDjy/yjiv1
	 Qumptpy0roII7Z3HlMIU80Gmb/racyY15WrslNOLbs/KQMcA2FCE5kZZ6YN6Jee9ox
	 G5QsHp7gciIBdgWvjPGlkSZu3a/IZueNK4hN/8I4=
Authentication-Results: linux1587.grserver.gr;
        spf=pass (sender IP is 209.85.208.181) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f181.google.com
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-307325f2436so41522171fa.0;
        Mon, 31 Mar 2025 01:36:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVUHzutR/m0mEVRWygymVCLW/7ZGfps5q//X7n3HqcavYdjq2pd9i5WQU9uUQyzg5zwczF7v2jKZ9YNaRTcVN0ugeptgg==@vger.kernel.org,
 AJvYcCWDHFf+3q1o0VNvNWC0ajOwmOSRO1WQCR3gggYyxWOX7ndd4Y58BpR1cG4aIwQrIprWYJNQdDfRmLwa0Ftz@vger.kernel.org,
 AJvYcCXr2CT/kt4+0MEaffMrxWeRxDO1y9OYt/6wSX3rGOTozMlhWNddAyNbFnrBOT6k/yqLEi5rxafcoBjfWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgzBPJ/GxB2So0w9Ru8dr8yhoLAAV3vyQFKYJy1ABOvI/mpz4d
	xZrrAgydwUc1ZaCMwO1i2Xvck9o38Uk1/hddkUB0HjxvfkzOOdfHtYTJukGMVbAf84euvRhIcun
	TgLM3Csw8ID/kTf2mtNefPv6/+OE=
X-Google-Smtp-Source: 
 AGHT+IH/vVp8jM3walb22/hze2eC/gxUBtQBU+F1MYf7U+5sHREAjclNITYFdwHBGLV1TXz5MAqf64689vv7zxGnKOY=
X-Received: by 2002:a05:651c:50a:b0:30d:7c12:5725 with SMTP id
 38308e7fff4ca-30de032f85cmr29440651fa.33.1743410162685; Mon, 31 Mar 2025
 01:36:02 -0700 (PDT)
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
 <CAGwozwHbZHk_eSe-ZEM6jYM2HC4GxwnUrreZSh=+xJrKquEi9g@mail.gmail.com>
 <11155669-5168-4460-aa4f-849b764a5ec2@ljones.dev>
In-Reply-To: <11155669-5168-4460-aa4f-849b764a5ec2@ljones.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 31 Mar 2025 10:35:51 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFBcmawucqfyTOD-S0Ah6dnKBao75Z3J0K0J3FbVhth-Q@mail.gmail.com>
X-Gm-Features: AQ5f1Jr0VBOwvDyv0QVadOGIJqE6C_--iyCZm29a1wlqzeHFDQ0vz6BQ1VE0RVY
Message-ID: 
 <CAGwozwFBcmawucqfyTOD-S0Ah6dnKBao75Z3J0K0J3FbVhth-Q@mail.gmail.com>
Subject: Re: [PATCH v5 09/11] HID: asus: add basic RGB support
To: "Luke D. Jones" <luke@ljones.dev>
Cc: Jiri Kosina <jikos@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <174341016396.1750.14664751593540199959@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

On Mon, 31 Mar 2025 at 10:19, Luke D. Jones <luke@ljones.dev> wrote:
>
> On 30/03/25 21:39, Antheas Kapenekakis wrote:
> > On Wed, 26 Mar 2025 at 12:00, Jiri Kosina <jikos@kernel.org> wrote:
> >>
> >> On Wed, 26 Mar 2025, Ilpo J=C3=A4rvinen wrote:
> >>
> >>> You don't need to "pause" for the merge window, in some subsystem
> >>> there's mandatory pause during merge window but I find that unnecessa=
ry.
> >>> I know people on pdx86 do review during merge window so no need to wa=
it
> >>> when working with patches related to pdx86. Just don't expect patches
> >>> get applied during the merge window or right after it (the latter ten=
ds to
> >>> be the most busiest time of cycle for me) :-).
> >>>
> >>> It's more about the frequency, how often to send a series which is
> >>> relatively large. Large number of versions end up just filling inboxe=
s
> >>> (and patchwork's pending patches list) and we don't have time to read=
 them
> >>> all through so I suggest waiting like 3 days at minimum between versi=
ons
> >>> when the series is large or complex to give time to go through the se=
ries.
> >>>
> >>> This is not a hard rule, so if there are e.g. many significant change=
s,
> >>> feel free to "violate" it in that case.
> >>
> >> Exactly. I am unlikely to do much review during the merge window mysel=
f,
> >> but I'll pick up the patchset and followup once the merge window is ov=
er,
> >> so feel free to keep discussing and polishing it with me on CC :)
> >>
> >> Thanks,
> >
> > I think we have reached a good point with this series. We can pick up
> > again when you guys are ready.
> >
> > I will switch gears and look a bit into msi-wmi-platform for the MSI
> > Claw with Armin and we can revisit this come rc1.
> >
> > Let's try to get through it early in 6.16 so that Luke can also do
> > what he wants to with the Ally, and let's push the oxpec move as well,
> > so I can get those two off my plate.
>
> I see Ilpo and Jiri mentioned no need to pause development. But it does
> look like everything is in good state so far, and no doubt you might
> have some ideas after a few days (plus that did of helpful info asus
> dropped in my lap).
>
> If you do anything significant and would like someone to test on a few
> variety of laptop please let me know privately and I'll do what I can.

Yeah, I think the comments I got so far I could fix in an hour or so,
so I would like some more to pool in.

It is good we have a way to parse the keyboard check [1] now, but all
this boils down to removing the RGB quirk and tweaking how the result
of that function is parsed.

If you have some deadtime atm, you can check the MSI Claw draft I am
working on [2]. It is still too early to send. The fwupd integration
is causing some issues, such as it being picky and requiring all
optional vars are implemented, and I think the potential interference
with shift mode (platform profile in MSI laptops) will be confusing as
well. But the same issues are present in Asus and Lenovo Legion too,
so MSI is not unique in that regard.

Antheas

[1] https://github.com/torvalds/linux/blob/4e82c87058f45e79eeaa4d5bcc3b38dd=
3dce7209/drivers/hid/hid-asus.c#L402-L434
[2] https://github.com/bazzite-org/patchwork/tree/msi

> Cheers,
> Luke.
>
> > Antheas
> >
> >> --
> >> Jiri Kosina
> >> SUSE Labs
> >>
>

