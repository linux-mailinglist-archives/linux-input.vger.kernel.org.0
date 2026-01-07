Return-Path: <linux-input+bounces-16811-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F388CFD3C1
	for <lists+linux-input@lfdr.de>; Wed, 07 Jan 2026 11:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BF2A300E456
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 10:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A519330655;
	Wed,  7 Jan 2026 10:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b1ByYqGH"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8742533032C;
	Wed,  7 Jan 2026 10:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782574; cv=none; b=o/eaYoPNPEqgZ+JwiT/IdQgcshlxs/q5utcG61Xc9r+ffJtzOmaNUNwNBgKSD6euQ/AqGQB8uW6cxAoxLNX6cWHPc7TByZEfin32qH0uYSZLv6HrQ0aPgeD2CVTebjqo8abBNUnDttmVK7GXbrdOpuae856d0nsW+HAxgWgSHus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782574; c=relaxed/simple;
	bh=G+WEhemUuhro8Yq/RD1cv/X+PTtpGZrecmSFETALep0=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=fnOptTKN95JhHmLVJ/CxDsup38zkN0YqkeGHZYnLQ6BQi2QtWuboRomefBAEHMPE44p241wUDweu3oDZtfci+hynUDuZbrDlJlyM1M7GJXZCV/oO/jwDR+pO6ACVp8iIh6vhiMcWLxnVSCVoSfXUHZdpClBKFiNZbtQJBx7EyNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b1ByYqGH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767782572; x=1799318572;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=G+WEhemUuhro8Yq/RD1cv/X+PTtpGZrecmSFETALep0=;
  b=b1ByYqGHLuzoilWGxMuD0D7wylno1bGjq3L4R90iwBLITsqTRKP4D7f+
   YOZ+oiCEVtW+Fu4qXNI1Jg2ocPSxQ4ND6kR1p+5YS4uBiCfPApeDZV7Hf
   bisvgSex5a3+6gDWdXN/xsQ0aKEmgOiZw/3MnnzSIvx2u34IoAlvZQGpZ
   ewLS9daLzMoLAxcWIXKb7MijQKH0UWxrMyZLg1fYmw1lJ1C3IHHcGi0Xj
   1GR3MxjiwFA7t/ZjSTewU3N+ALCct0VplROLAEZl4NomKEK22vGhH6+zt
   7fJBjMm158siuoGa7jd+Ce7GfPPr6+C63RPElssUOieR4Fj7n1mfVCcnp
   w==;
X-CSE-ConnectionGUID: 15gFK/44SOuosQ5KaCdxbg==
X-CSE-MsgGUID: NnGupNIyQqmHa/YLebMAIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="91807915"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="91807915"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 02:42:51 -0800
X-CSE-ConnectionGUID: 2P0x2dTmTFO3nF/YKDUUfw==
X-CSE-MsgGUID: SzZxd8HLRZy5RS1povJXYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="233599488"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.88])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 02:42:46 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 7 Jan 2026 12:42:43 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>, Kelsios <K3lsios@proton.me>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>, 
    Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v10 00/11] HID: asus: Fix ASUS ROG Laptop's Keyboard
 backlight handling
In-Reply-To: <CAGwozwFJfZ2ATVR+N4pwb0unsXOpJbThtefigrtax9iYcPto7A@mail.gmail.com>
Message-ID: <d169655b-4e15-fab6-0ce8-7a6bfd6a47a5@linux.intel.com>
References: <3ec43b6f-a284-4af7-bcae-8aee11929abb@proton.me> <CAGwozwEeZ5KKZWvhC1i-jS5Yike5gVeFK0yyu56L2-e5JvmsPQ@mail.gmail.com> <CAGwozwEud1-6GT=JHoG64f3NUXJ1-wFmWpotNK4s6b=m+1styw@mail.gmail.com> <1adcffd1-2381-654d-b9b5-966306758509@linux.intel.com>
 <CAGwozwFJfZ2ATVR+N4pwb0unsXOpJbThtefigrtax9iYcPto7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2098392125-1767782563=:977"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2098392125-1767782563=:977
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 9 Dec 2025, Antheas Kapenekakis wrote:
> On Tue, 9 Dec 2025 at 10:17, Ilpo J=C3=A4rvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
> > On Sat, 6 Dec 2025, Antheas Kapenekakis wrote:
> > > On Sat, 6 Dec 2025 at 00:03, Antheas Kapenekakis <lkml@antheas.dev> w=
rote:
> > > > On Fri, 5 Dec 2025 at 23:13, Kelsios <K3lsios@proton.me> wrote:
> > > > >
> > > > > I would like to report a regression affecting keyboard backlight =
brightness control on my ASUS ROG Zephyrus G16 (model GU605CW).
> > > > >
> > > > > Using kernel 6.17.9-arch1-1.1-g14 with the latest HID ASUS patchs=
et v10, keyboard *color* control works correctly, but *brightness* control =
no longer responds at all. The issue is reproducible on every boot. This pr=
oblem is not present when using patchset v8, where both color and brightnes=
s work as expected.
> > > > >
> > > > > Important detail: the issue occurs even **without** asusctl insta=
lled, so it must be within the kernel HID/WMI handling and is unrelated to =
userspace tools.
> > > > >
> > > > > Output of dmesg is available here [1], please let me know if any =
additional information is required.
> > > > >
> > > > > Thank you for your time and work on supporting these ASUS laptops=
=2E
> > > > >
> > > > > Best regards,
> > > > > Kelsios
> > > > >
> > > > > [1] https://pastebin.com/ZFC13Scf
> > > >
> > > > [ 1.035986] asus 0003:0B05:19B6.0001: Asus failed to receive handsh=
ake ack: -32
> > > >
> > > > Oh yeah, asus_kbd_init no longer works with spurious inits so it br=
oke
> > > > devices marked with QUIRK_ROG_NKEY_LEGACY
> > > >
> > > > There are three ways to approach this. One is to ignore the error..=
=2E
> > > > second is to drop the quirk... third is to check for the usages for=
 ID1, ID2...
> > > >
> > > > I would tend towards dropping the ID2 init and ignoring the error f=
or
> > > > ID1... Unless an EPIPE would cause the device to close
> > >
> > > Benjamin correctly caught the deviation
> >
> > BTW, we want to record this knowledge also into the changelog so that t=
he
> > next person who'd want to make the check stricter does not need to gues=
s
> > whether it was based on a real observed problem or mere guessing there
> > could be a problem.
>=20
> If we keep the spurious inits, the stricter check will catch them and
> throw errors. This is problematic.
>=20
> Kelsios, you have a device that allegedly would not work without those
> inits. Perhaps you could try removing the legacy quirk from your
> device and see if everything is ok?
>=20
> If it is, then we have a tested device and a case for removing the
> legacy quirk altogether

Hi all,

Is there any progress on this?

--=20
 i.

--8323328-2098392125-1767782563=:977--

