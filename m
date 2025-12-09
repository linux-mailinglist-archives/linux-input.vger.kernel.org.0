Return-Path: <linux-input+bounces-16503-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A83CAF852
	for <lists+linux-input@lfdr.de>; Tue, 09 Dec 2025 10:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C47F300C6EB
	for <lists+linux-input@lfdr.de>; Tue,  9 Dec 2025 09:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1722FD1AA;
	Tue,  9 Dec 2025 09:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="XKS2FWsL"
X-Original-To: linux-input@vger.kernel.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30312FC887
	for <linux-input@vger.kernel.org>; Tue,  9 Dec 2025 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.27.248.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765274249; cv=none; b=XbuggEQ+kkKkpTTwoNl6RYOv2RkPQbhamAaV2NxkNk3gwrySj1pvbj348GKx+iiZTy4doK+bL+WuPHAXQRhke3v80Gu5MGB8vSW+VQWFLQE4kuTLmVldHWXGDgzYI6pgueWIrIWRgxsBRkC7N4Dtc4W66Ys33JwRxfe1qT5NoIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765274249; c=relaxed/simple;
	bh=SRkro+EMkJp2g+04Nj8nP4enCJ9VDEPLtFHW/k5KMJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k6hWB4M50zKPXEwpGWpAnA7xTAM13lSGNuuCFglYpDP8/Ywwrg91R87p3/T3DeNhsD8yyDwt68s89BABlpjfbbaOyf4Rz45g1c0hkmSn+ZTYyyNsmrxSsc03trB9On+JidDmPWc3jRXD+TVsG7X0DS9iRve0TMvd4//HD+T7Vjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=XKS2FWsL; arc=none smtp.client-ip=37.27.248.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 985D33F693
	for <linux-input@vger.kernel.org>; Tue,  9 Dec 2025 11:49:50 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 160C33F684
	for <linux-input@vger.kernel.org>; Tue,  9 Dec 2025 11:49:49 +0200 (EET)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 4EDEA201B8A
	for <linux-input@vger.kernel.org>; Tue,  9 Dec 2025 11:49:48 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1765273788;
	bh=BgTbqAQ+xguorLfxQqn1zqTCgLd9qC5vNnsgn7zWCkM=;
	h=Received:From:Subject:To;
	b=XKS2FWsLwkI2faMYaSvIObBBHehcVFNhuGLQInCr4Zg6Sel1pyJ3SBwCOWCClWOB6
	 bnbDlRGPuQkWZ/kqNaumxEHyNMdULk/Y16mvhDg+q87uB909UkS8FGxKHg9L6BywVi
	 b1ldGZbGYNpNjfpT36y9OdrCn2VkG4y1RHbw5Gg8kxR4Rtl16e5dvoTrl/9N0CvCjg
	 CJeWaEDS4e1hVZq9GO0QZKI95WlaaIbJ0+ZIy2twAY+yeyf9igNu2O9loSwYBADm9O
	 gGwN5+NmaZIsPYXuzSdSbvgybHsoVB3wKgyIHhzpHdZShpABOK30tSJ30cytzB5XiL
	 wXzPDu2QJj2RQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.173) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f173.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-37a5bc6b491so46001821fa.0
        for <linux-input@vger.kernel.org>;
 Tue, 09 Dec 2025 01:49:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVK9jLTrmcUSnjZbw/nNb3MxjEHBlvWRJ/fUlp6grhXkkuVGFMXlOTSI196EwdpTbjlR8qvjXfa330lqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7l8eGiaCcZez/YlB5euOupsZDnOyCMviMMYW2UjznqZmWgpdf
	6KEolJJ0eAHo6XEP7huKbn84jDHYmT1Uo14RCHX0dBQFVyGfQrcKi7js5FzImmsMXnyxQXUkYqM
	bOQZTSptWxuJh0x4/cpJCRqPIz6UpsCg=
X-Google-Smtp-Source: 
 AGHT+IEE571CvTzfWElgXJXo9f7AH7UDXe7L4EOm71RW7DlYfA4oUFMDIpJVgD7df9S8XuEguHLwdZeBCLWvTWmoGWQ=
X-Received: by 2002:a2e:be1d:0:b0:37e:56d0:1a42 with SMTP id
 38308e7fff4ca-37ed1fd2ceemr33054551fa.17.1765273787757; Tue, 09 Dec 2025
 01:49:47 -0800 (PST)
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
In-Reply-To: <1adcffd1-2381-654d-b9b5-966306758509@linux.intel.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 9 Dec 2025 10:49:36 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwFJfZ2ATVR+N4pwb0unsXOpJbThtefigrtax9iYcPto7A@mail.gmail.com>
X-Gm-Features: AQt7F2oUkWR0b31nmmYZYwQueU54JMhgawp1VgoYDlbZvAiDQyYaNl7SLFU8dXU
Message-ID: 
 <CAGwozwFJfZ2ATVR+N4pwb0unsXOpJbThtefigrtax9iYcPto7A@mail.gmail.com>
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
 <176527378850.2460119.10843203546071832633@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 9 Dec 2025 at 10:17, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Sat, 6 Dec 2025, Antheas Kapenekakis wrote:
>
> > On Sat, 6 Dec 2025 at 00:03, Antheas Kapenekakis <lkml@antheas.dev> wro=
te:
> > >
> > > On Fri, 5 Dec 2025 at 23:13, Kelsios <K3lsios@proton.me> wrote:
> > > >
> > > > Hello,
> > > >
> > > > I would like to report a regression affecting keyboard backlight br=
ightness control on my ASUS ROG Zephyrus G16 (model GU605CW).
> > > >
> > > > Using kernel 6.17.9-arch1-1.1-g14 with the latest HID ASUS patchset=
 v10, keyboard *color* control works correctly, but *brightness* control no=
 longer responds at all. The issue is reproducible on every boot. This prob=
lem is not present when using patchset v8, where both color and brightness =
work as expected.
> > > >
> > > > Important detail: the issue occurs even **without** asusctl install=
ed, so it must be within the kernel HID/WMI handling and is unrelated to us=
erspace tools.
> > > >
> > > > Output of dmesg is available here [1], please let me know if any ad=
ditional information is required.
> > > >
> > > > Thank you for your time and work on supporting these ASUS laptops.
> > > >
> > > > Best regards,
> > > > Kelsios
> > > >
> > > > [1] https://pastebin.com/ZFC13Scf
> > >
> > > [ 1.035986] asus 0003:0B05:19B6.0001: Asus failed to receive handshak=
e ack: -32
> > >
> > > Oh yeah, asus_kbd_init no longer works with spurious inits so it brok=
e
> > > devices marked with QUIRK_ROG_NKEY_LEGACY
> > >
> > > There are three ways to approach this. One is to ignore the error...
> > > second is to drop the quirk... third is to check for the usages for I=
D1, ID2...
> > >
> > > I would tend towards dropping the ID2 init and ignoring the error for
> > > ID1... Unless an EPIPE would cause the device to close
> >
> > Benjamin correctly caught the deviation
>
> BTW, we want to record this knowledge also into the changelog so that the
> next person who'd want to make the check stricter does not need to guess
> whether it was based on a real observed problem or mere guessing there
> could be a problem.

If we keep the spurious inits, the stricter check will catch them and
throw errors. This is problematic.

Kelsios, you have a device that allegedly would not work without those
inits. Perhaps you could try removing the legacy quirk from your
device and see if everything is ok?

If it is, then we have a tested device and a case for removing the
legacy quirk altogether

Antheas

> --
>  i.
>
>


