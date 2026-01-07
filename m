Return-Path: <linux-input+bounces-16812-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 982A0CFD4A1
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 11:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 786BA304EF47
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 10:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B0932277B;
	Wed,  7 Jan 2026 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="SjeRm02a"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13445322A0A
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 10:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767783111; cv=none; b=YyEnNaS1Wn1eLDP6GdJJrdid9BJvCoFpKKc528cQR5sREycxbL8oCaXmfPihuv8B1VN7OieV9Ilox7V3SdgQnCuh1sUYbo9ndytgKOC39uNOFmuMk03mPAY3m8KpNi/aFvLcTwSE0DQJZsJ0k6XOMrqAhszi37D6I6uYRzp3OP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767783111; c=relaxed/simple;
	bh=Ps9qTqmo79GI4OkJiEco7YqLY/fMbiliLAVMkxm0YU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T4gimyI21orzqperQG7gOEn7Grep7XgWVkFPnO/zMVIlRDQqEtzP9IqxIqtTOXLWudmg4GYt0erYOhjAsYlbE9vrvtaxrabL306dI3+r0U+lejHgHKXhoc4gb3CV1SNtpcgnhwEx/12mYWD6+uhWu7VizSBPpTB6Cdc96oIoefA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=SjeRm02a; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 8A72541A28
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 12:45:53 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 9927741A82
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 12:45:52 +0200 (EET)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id E765E2024D9
	for <linux-input@vger.kernel.org>; Wed,  7 Jan 2026 12:45:51 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1767782752;
	bh=UPJqUBsu8J6PaUXvQzvKo8/QsD8sXV/qiiqM8ei6DNw=;
	h=Received:From:Subject:To;
	b=SjeRm02aDVUMmgGoSlK4c2E6Cc570HynsCah5AiMYk/gSn03e8kD6QEo7HYFdm3Q5
	 OS5NOm+PARYOUQLe2JiwwiUMILq6dAnKK2AuXawfzgEO/cGVSX8VgY5rrpkyYA3ic/
	 eU97CoF61A3lax7O7Q5N1DLU2tOvDHKEEvEiCqEMVImRx2rWr9lofAlJQ/nkJo2ffq
	 rnEBFU4enF5ie6lr+27BhdNUlJvv92dRa1azenATlN+KsiMLpfUsEg53UnWUGmi6sA
	 yCkyGsGMIu3gg63e+a856RKJhHqroqUxBLo7S/Of+FsoZEPa7oMgzqpeUFFbM4qtP2
	 vWB9+vKX0blgQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.167.49) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lf1-f49.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-59b6f59c4f5so751144e87.3
        for <linux-input@vger.kernel.org>;
 Wed, 07 Jan 2026 02:45:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXrwgnQ6MAOOCC7EuZ1L/wMuOe/3dG5rBGJt36B/cTBw3GZtguNrPBZSJa+BCH+yeyAHLy9gxEyo27cAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPbUQ3t3L+moFxzreaWGDM26gN22vhPNvNNJeIJ/zV6DEzxvUI
	pLVlmtiNEq18YUaXOFKlZF1zdScQYFRbXnxKEG5wJmXeD8gU0vs0Qt2eraHB60dCOraPaIHdzNG
	G5KmNFvWV59T0ti3kHWGlP6XYI/CruX8=
X-Google-Smtp-Source: 
 AGHT+IHbMDVsmXrfo3Kwh8F5r0Coxxs3PxbChd/QtQ5ssN61Ccbu+x6jyWazCZP7Qk0EfBV3ViA3oF7Wvl6e4+5Z/MI=
X-Received: by 2002:a05:651c:2229:b0:378:d5dc:17c2 with SMTP id
 38308e7fff4ca-382ff677592mr6064931fa.11.1767782751490; Wed, 07 Jan 2026
 02:45:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <3ec43b6f-a284-4af7-bcae-8aee11929abb@proton.me>
 <CAGwozwEeZ5KKZWvhC1i-jS5Yike5gVeFK0yyu56L2-e5JvmsPQ@mail.gmail.com>
 <CAGwozwEud1-6GT=JHoG64f3NUXJ1-wFmWpotNK4s6b=m+1styw@mail.gmail.com>
 <1adcffd1-2381-654d-b9b5-966306758509@linux.intel.com>
 <CAGwozwFJfZ2ATVR+N4pwb0unsXOpJbThtefigrtax9iYcPto7A@mail.gmail.com>
 <d169655b-4e15-fab6-0ce8-7a6bfd6a47a5@linux.intel.com>
In-Reply-To: <d169655b-4e15-fab6-0ce8-7a6bfd6a47a5@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 7 Jan 2026 12:45:39 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwEE0TXZqKy1W0zPjP=6+oog1ATfGJeLFqyLwr8kMZ56Lg@mail.gmail.com>
X-Gm-Features: AQt7F2qGi_Ib-l_BkhSdFBmsl2C4nJR9G3ErPBxu5U5NEYUxXg7eniaXsipzZ30
Message-ID: 
 <CAGwozwEE0TXZqKy1W0zPjP=6+oog1ATfGJeLFqyLwr8kMZ56Lg@mail.gmail.com>
Subject: Re: [PATCH v10 00/11] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kelsios <K3lsios@proton.me>, platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
 "Luke D . Jones" <luke@ljones.dev>,
	Hans de Goede <hansg@kernel.org>, Denis Benato <benato.denis96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <176778275211.936036.6681783237466247751@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 7 Jan 2026 at 12:42, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Tue, 9 Dec 2025, Antheas Kapenekakis wrote:
> > On Tue, 9 Dec 2025 at 10:17, Ilpo J=C3=A4rvinen
> > <ilpo.jarvinen@linux.intel.com> wrote:
> > > On Sat, 6 Dec 2025, Antheas Kapenekakis wrote:
> > > > On Sat, 6 Dec 2025 at 00:03, Antheas Kapenekakis <lkml@antheas.dev>=
 wrote:
> > > > > On Fri, 5 Dec 2025 at 23:13, Kelsios <K3lsios@proton.me> wrote:
> > > > > >
> > > > > > I would like to report a regression affecting keyboard backligh=
t brightness control on my ASUS ROG Zephyrus G16 (model GU605CW).
> > > > > >
> > > > > > Using kernel 6.17.9-arch1-1.1-g14 with the latest HID ASUS patc=
hset v10, keyboard *color* control works correctly, but *brightness* contro=
l no longer responds at all. The issue is reproducible on every boot. This =
problem is not present when using patchset v8, where both color and brightn=
ess work as expected.
> > > > > >
> > > > > > Important detail: the issue occurs even **without** asusctl ins=
talled, so it must be within the kernel HID/WMI handling and is unrelated t=
o userspace tools.
> > > > > >
> > > > > > Output of dmesg is available here [1], please let me know if an=
y additional information is required.
> > > > > >
> > > > > > Thank you for your time and work on supporting these ASUS lapto=
ps.
> > > > > >
> > > > > > Best regards,
> > > > > > Kelsios
> > > > > >
> > > > > > [1] https://pastebin.com/ZFC13Scf
> > > > >
> > > > > [ 1.035986] asus 0003:0B05:19B6.0001: Asus failed to receive hand=
shake ack: -32
> > > > >
> > > > > Oh yeah, asus_kbd_init no longer works with spurious inits so it =
broke
> > > > > devices marked with QUIRK_ROG_NKEY_LEGACY
> > > > >
> > > > > There are three ways to approach this. One is to ignore the error=
...
> > > > > second is to drop the quirk... third is to check for the usages f=
or ID1, ID2...
> > > > >
> > > > > I would tend towards dropping the ID2 init and ignoring the error=
 for
> > > > > ID1... Unless an EPIPE would cause the device to close
> > > >
> > > > Benjamin correctly caught the deviation
> > >
> > > BTW, we want to record this knowledge also into the changelog so that=
 the
> > > next person who'd want to make the check stricter does not need to gu=
ess
> > > whether it was based on a real observed problem or mere guessing ther=
e
> > > could be a problem.
> >
> > If we keep the spurious inits, the stricter check will catch them and
> > throw errors. This is problematic.
> >
> > Kelsios, you have a device that allegedly would not work without those
> > inits. Perhaps you could try removing the legacy quirk from your
> > device and see if everything is ok?
> >
> > If it is, then we have a tested device and a case for removing the
> > legacy quirk altogether
>
> Hi all,
>
> Is there any progress on this?

Hi,
I plan to revise the patch series and fix this issue next week.
Currently on holidays

I am unsure how I will tackle this issue, I might make the init not
fail for 0x5d/0x5e, and try to avoid printing errors if the endpoint
is missing.

Best,
Antheas

> --
>  i.


