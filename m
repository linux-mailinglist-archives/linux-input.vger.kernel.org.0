Return-Path: <linux-input+bounces-13619-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D69EB0C86D
	for <lists+linux-input@lfdr.de>; Mon, 21 Jul 2025 18:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A498D1AA0E68
	for <lists+linux-input@lfdr.de>; Mon, 21 Jul 2025 16:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0CB2E03E4;
	Mon, 21 Jul 2025 16:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oUT8PoMh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCFB2D9EF2
	for <linux-input@vger.kernel.org>; Mon, 21 Jul 2025 16:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753114009; cv=none; b=ICpOVXnmQh6H0bcWHEADnlTiAufIVqrDaSYQPuV+s5XpzLgX4XgBjmSjVVBDadJR4bIs4K9pErwhRNzjtN9S8l2mzmKJCaeppMDKPgexW0dg7/su+iI3OtBmuCZqWA/UR/Lq/hqSmwgV4zecpobo5Rc+DXAQB450j30h29NsgnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753114009; c=relaxed/simple;
	bh=ckRfEQFp4nWUivzsicNdLk73ZvBCFK71dcqQzwI6kW0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kP6NsCwS1bqvdK3ZQAZi27Fj7dyjrbTEPV7XsKwYhD4egCdY7/YhdQm+rQsJOG+Lc2NHJUd3T6khDtAkP4/LztnAp7zqELydAse9Rn3GiIAHLAN9HnHRBR3YqkiQVjm38TaASgt2vuJSc9Vj26xJ9PTDHC6uKudxU2zicdIqQWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oUT8PoMh; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4ab61ecc1e8so33997601cf.1
        for <linux-input@vger.kernel.org>; Mon, 21 Jul 2025 09:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753114006; x=1753718806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOd3UEq1wUDaXyZJdeoQUzMxVytfD91oNEpksZRpWa0=;
        b=oUT8PoMh6wg03696q/kQ2it6i539//dCeXX6HwrCSyWuSgRjfHBrbh4nhj6vVWAS1g
         LaLBYqLfW70pqnNcEHL5yYuHk98S6MmJzItpay1OCAUPAL+h1fN8eF7VziGB+Vgb9TKy
         8YH+1dGFdp931zLQlAz4D0roMeFqR9+FLNi5/2Nita+rnfycN4JcwchDb2x2kbqwr9QC
         BZdnnNRb4lYt/uIl3lgYqWfda6R/jDir8M0b/j2NIPJgq+2V4XuRI/HcpsgQE3oqT/kU
         RXx1FWvfgv6AjpPHuuytG/HNkSo4+cBIxSX1pTP6RN1sAtej1pTuumO9TC4DUhlC7WLL
         lxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753114006; x=1753718806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOd3UEq1wUDaXyZJdeoQUzMxVytfD91oNEpksZRpWa0=;
        b=QMBgqxasYjOvZ8kEm1MaMA69ZxzMGudRj3cRSAnPzZTrcGfPWaD80SuSk9/X/rLNew
         9O+5qm8sIybO9kxy4nEwZ6OaHrOnF4AYNxNXxcHEDesFm75Pz1yE/q+O9nTTzCkiDtKE
         GedE9oG3XwKgp2A6UQWytGRoTgr3h0SGngxAN32jC/rGWkBNDLhVcrVeoSE/2glUVKFY
         W1KSxwajlpV5e+X5sCNtbCuKLByeKSbB2BVaPJBUkwPBU4sPAvlhtUSCIMvu8J2K8wMw
         y7UzuD4Ip/NEWRB10KH6HUpmk0WgJd9Cd3dUd5EN8yUK4pM1FbEpLpBZ829WAXi65LGR
         yZpQ==
X-Forwarded-Encrypted: i=1; AJvYcCURIVhHE3MsQpxm0LI5thqEMoWjm1X4trf2CjyWRlILAoaJ3WykbZA+VBXcRsJZCd831ajBPaa26ys7HQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Zih543k7rywayEgkfUfejfj//8+l0cErg7rcc8zMUmAsZ5FS
	MiE2mqoHz27coF8tEWKTE6tNGy1lFwoo/umAHLOz0ghPjDMzgGPgN/whnlelPg0hr16AnkhFhJb
	Vc5EuPBJFvjJYmiLKQxKNdQwqUPrxrtgnZkUL3xTX
X-Gm-Gg: ASbGncukyhJaeRy1c7H8Ht1iOTZMT+74qyI7nGYMa/SXkHQ3pcKW+jUcSeFXT2V8tBF
	JgMbwC/yDN4f/gZFZM7QBFSr1zzoBgneTU/u7Wwxq25/zwhALGBDQprGs9ZyfeW+YcCwbG68VUf
	pDcD/09GNGGkCi3vjfyfubqEwD13BewbA3xw4WIMKY5mmhIbYuyznbr+Fp+8zvJPiUVr6rEiXUP
	lgWIAtqgrFT9gvwnAK9Ugpfbahiz1XALm1aVQ==
X-Google-Smtp-Source: AGHT+IFj1pscYYUhcJuV1F8HJLXSMp0txYiqKFJNij7Hh1NCCAe/FXlP0ElhhDhIMJQGruaN9saxEe5ta2hhBHWDNn0=
X-Received: by 2002:a05:622a:8e:b0:4a9:96b8:750e with SMTP id
 d75a77b69052e-4ab93c50c48mr327951831cf.10.1753114005197; Mon, 21 Jul 2025
 09:06:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714-support-forcepads-v1-11-71c7c05748c9@google.com>
 <202507151942.94dhYylY-lkp@intel.com> <CAMCVhVNYePCuCw_SSTxwAdcastPP_azik44kG18o0_QK37OiZA@mail.gmail.com>
 <aHmOZiQ7TAQ3TjpQ@rli9-mobl>
In-Reply-To: <aHmOZiQ7TAQ3TjpQ@rli9-mobl>
From: Jonathan Denose <jdenose@google.com>
Date: Mon, 21 Jul 2025 11:06:33 -0500
X-Gm-Features: Ac12FXw0e6ocTZ8KNGtxPAWELTre3ggLXjmb05tlAjrpnHYW1CCSdTseRrCefMw
Message-ID: <CAMCVhVNTWKg89MhPJeVvKK5ZhXYy2WCJFBGJo2Hg5=aCUZz32A@mail.gmail.com>
Subject: Re: [PATCH 11/11] HID: multitouch: add haptic multitouch support
To: Philip Li <philip.li@intel.com>
Cc: kernel test robot <lkp@intel.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>, oe-kbuild-all@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 6:59=E2=80=AFPM Philip Li <philip.li@intel.com> wro=
te:
>
> On Thu, Jul 17, 2025 at 01:43:28PM -0500, Jonathan Denose wrote:
> > On Tue, Jul 15, 2025 at 6:36=E2=80=AFAM kernel test robot <lkp@intel.co=
m> wrote:
> > > kernel test robot noticed the following build errors:
> > >
> > > [auto build test ERROR on 86731a2a651e58953fc949573895f2fa6d456841]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Denos=
e/HID-add-haptics-page-defines/20250714-231444
> > > base:   86731a2a651e58953fc949573895f2fa6d456841
> > > patch link:    https://lore.kernel.org/r/20250714-support-forcepads-v=
1-11-71c7c05748c9%40google.com
> > > patch subject: [PATCH 11/11] HID: multitouch: add haptic multitouch s=
upport
> > > config: hexagon-randconfig-r112-20250715 (https://download.01.org/0da=
y-ci/archive/20250715/202507151942.94dhYylY-lkp@intel.com/config)
> > > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project =
6009708b4367171ccdbf4b5905cb6a803753fe18)
> > > reproduce: (https://download.01.org/0day-ci/archive/20250715/20250715=
1942.94dhYylY-lkp@intel.com/reproduce)
> >
> > I'm having trouble reproducing this build error. I tried following the
>
> Sorry Jonathan, the reproduce step we provide is wrong, would you mind to=
 give
> a try similar to the steps in [1]? We will resolve the bug as early as po=
ssible.
>
> [1] https://download.01.org/0day-ci/archive/20250717/202507170506.Wzz1lR5=
I-lkp@intel.com/reproduce
>
> > steps in the linked reproduce file, but when running:
> > COMPILER_INSTALL_PATH=3D$HOME/0day ~/lkp-tests/kbuild/make.cross C=3D1
> > CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=3Dunlimited
> > -fmax-warnings=3Dunlimited' O=3Dbuild_dir ARCH=3Dhexagon olddefconfig
> >
> > I get the errors:
> > 0day/gcc-4.6.1-nolibc/hexagon-linux/bin/hexagon-linux-gcc: unknown C co=
mpiler
> > scripts/Kconfig.include:45: Sorry, this C compiler is not supported.
> >
> > It looks to me like the hexagon-linux-gcc compiler is correctly
> > installed at $HOME/0day so I'm not sure what to do from here. Can
> > someone please assist me with this?
> >
> > --
> > Jonathan
> >
Great! Thanks for providing the correct reproduce steps Phillip.

I tried them and both of the make.cross steps completed successfully.
I am not getting the build errors that the test bot is reporting.
--=20
Jonathan

