Return-Path: <linux-input+bounces-15482-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 87105BDAB7C
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 18:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 373CE4EF332
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 16:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8D9304BC1;
	Tue, 14 Oct 2025 16:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0GuveuNr"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7548226863
	for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 16:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760460889; cv=none; b=iYHLdGfcgXf9lKZboMMF/1N04QptltrEdq2XtS4/ktdCvpUymNXH7jgxJ2im8DuFY4vIE4zDZuGxOvEZbWBhqI78MS7FiLGO2u9B/Zf4kK/r+GEQgxZ65hjInIFIFh8fvF7OfoHfAh5d/URCezMeqJd92Agla3VYYrjzcuFdS/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760460889; c=relaxed/simple;
	bh=D1GVedUb0QFmnIZwIdVK+2uGHdnzIPnIAYaUHpZc5aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fuCTd7W4Dx+GK8Ih9d7TYFK/swFkQ9tV7c71DBx60mGlX8A9kMhv3BZcCSS/+GhVZiLD95EIk66Rd4FccxGwxxcVBfYYB9YtDHqV2UcnicOXiIPzewpYAAr/WsozYmJYmDp/srYvmBUFq5WJHUmY0o147N7Dup3E83M2NWxWw2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0GuveuNr; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-856222505eeso742069185a.1
        for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 09:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760460886; x=1761065686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Df6BZCUDqmZYWW1/Q3uV+enf2JbWxA8H5BbOTsXwypM=;
        b=0GuveuNrXbRIWw9zzbfBrq9TW6LOEVF0X+jY0nOuROJlQ5GrCBaof4EbKh9k5PvJMM
         BtjVNLbKeUlrR+3m0u6sAkedHAySFWE+4EdbOEaBlGtHChx+p9ThRGWkX2Vxz74PaB/U
         juug/H8fPCLlfTEnXlWhGnIkCWqlRJY01wKfGIt5DI//9qM+IlvW4d8y9JMr8Oz7k/kZ
         StdoCViotFves1YqMBB7uNEF9kOyVCsNgWPvCq5aHd0vSJC4LY5k4+aO/RvtIaVyZxYB
         f1sP3f1Aow41Qcu3VO2kz91ClOLr7h/a+cFfe5spn4cq+gfyhVZVoKd7PC72FkC5Fc8T
         JN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760460886; x=1761065686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Df6BZCUDqmZYWW1/Q3uV+enf2JbWxA8H5BbOTsXwypM=;
        b=KYl4DYB4f3CYyJMZYz3E+H5H5mnMbttjHSi3xdG+ZWRtcuPKJxy2IjCBnkNAoxoAct
         Tv+WJF1LDbe/gnPVuDyYCnw9XfVWd/EZFuKJfNdA1X/YCa82AlDNqKSG4xiBUyjY3x6I
         CGHlOBWcQ1Evrv0vlH/cg7WBXAmCL/cgFzrGK8WuaEL8V87LcTtQGrbO3LMrbBwXcCWw
         cBI0budRrkVIVL/cdy1MNxn9YCQXhPw64NwZrFmoB2OrTWBjURZwQM8J5RkGWsKr55eC
         LlKEvqJebhiPQKaueBBH7EHAvoZs9GCnEXipWSC/iHI74KYJuFnYaH1pylvLKAjqW01G
         2/cA==
X-Forwarded-Encrypted: i=1; AJvYcCXi/HF+YlENAAPuZJgEx29dLBxp6yRT2dVqkko/+SZFqx9u1hg1SMUgIsN9NY0sJXjy1+D5o2B59lGQIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCkG6uCEqhDi9lBs9lVH3tlG3HSF4HaKH8NnYHxasIlKtQJSPD
	qN+wdjhrym7wREICYsYRJtf6ycU4qc8Sj7lxaOPhjuUFSiMA7qz2zoI24JwPyg7fWgyZWpShlnJ
	gjOQOZKXII2thJFNYpYcyXimDZifdsTZH73bEs7WG
X-Gm-Gg: ASbGncsH2OkyD6rRF3FXZHTuCDzKFrgAtNb6fT1YmLBLi54HziL4G6oVy8bz6HtEly4
	+QABgY2oe4SvMv4zpr2KTAcmQcNjau11zQ6e98QS9XKLFhXYcEBmycMHjnfDxDtraczfSNgIqs5
	o93PU+88kI+WbZQg9bBP5bR30ehtdOkyMFH8bxrXNwYU0VHiqKPSr5gF9iWWW74Rh31gv3CN4yL
	VKKqBaFUt/wvv5EQkR88e0km23MIvTAnLKyQVipXFmaWFPMYDeMqHUhZr/VlKelng==
X-Google-Smtp-Source: AGHT+IFs2gFYcfCXCnaHheGv1p/wPFAHpEAPy0np+u6INKD1CEWs2Qe2zsnL7aytVH5aO6wPXE69vW94D3oxAHQrrSM=
X-Received: by 2002:a05:622a:190c:b0:4e8:8202:a358 with SMTP id
 d75a77b69052e-4e88228caa4mr1291541cf.28.1760460885501; Tue, 14 Oct 2025
 09:54:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251013-hid-haptic-kconfig-fix-v1-1-b1ad90732625@google.com> <r8116qrr-5n80-01s8-92o0-88n8q14007s9@xreary.bet>
In-Reply-To: <r8116qrr-5n80-01s8-92o0-88n8q14007s9@xreary.bet>
From: Jonathan Denose <jdenose@google.com>
Date: Tue, 14 Oct 2025 11:54:34 -0500
X-Gm-Features: AS18NWDw2ZPqBXsxEa-0ouLmF3Mps0Fed2-Rbg-wZNaFmSdlqE2JyI1Mab_Akis
Message-ID: <CAMCVhVOXm88TZ1VV2TcMEO9qUn4A=+MWroGOzF+oJOFcxChQFA@mail.gmail.com>
Subject: Re: [PATCH] HID: Kconfig: Fix build error from CONFIG_HID_HAPTIC
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Randy Dunlap <rdunlap@infradead.org>, Lucas GISSOT <lucas.gissot.pro@gmail.com>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 5:09=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wrot=
e:
>
> On Mon, 13 Oct 2025, Jonathan Denose wrote:
>
> > Temporarily change CONFIG_HID_HAPTIC to be bool instead of tristate, un=
til
> > we implement a permanent solution.
> >
> > ---
> > Recently the CONFIG_HID_HAPTIC Kconfig option was reported as causing
> > the following build errors:
> >
> >   MODPOST Module.symvers
> > ERROR: modpost: "hid_haptic_init" [drivers/hid/hid-multitouch.ko] undef=
ined!
> > ERROR: modpost: "hid_haptic_pressure_increase" [drivers/hid/hid-multito=
uch.ko] undefined!
> > ERROR: modpost: "hid_haptic_check_pressure_unit" [drivers/hid/hid-multi=
touch.ko] undefined!
> > ERROR: modpost: "hid_haptic_input_configured" [drivers/hid/hid-multitou=
ch.ko] undefined!
> > ERROR: modpost: "hid_haptic_input_mapping" [drivers/hid/hid-multitouch.=
ko] undefined!
> > ERROR: modpost: "hid_haptic_feature_mapping" [drivers/hid/hid-multitouc=
h.ko] undefined!
> > ERROR: modpost: "hid_haptic_pressure_reset" [drivers/hid/hid-multitouch=
.ko] undefined!
> > make[3]: *** [/home/thl/var/linux.dev/scripts/Makefile.modpost:147: Mod=
ule.symvers] Error 1
> >
> > when the kernel is compiled with the following configuration:
> >
> > CONFIG_HID=3Dy
> > CONFIG_HID_MULTITOUCH=3Dm
> > CONFIG_HID_HAPTIC=3Dm
> >
> > To resolve this, temporarily change the CONFIG_HID_HAPTIC option to be
> > bool, until we arrive at a permanent solution to enable CONFIG_HID_HAPT=
IC
> > to be tristate.
> >
> > For a more detailed discussion, see [1].
> >
> > [1]: https://lore.kernel.org/linux-input/auypydfkhx2eg7vp764way4batdilz=
c35inqda3exwzs3tk3ff@oagat6g46zto/
> >
> > Signed-off-by: Jonathan Denose <jdenose@google.com>
>
> I've moved this whole block above the --- line and applied.
>
> Thanks,
>
> --
> Jiri Kosina
> SUSE Labs
>
Ok, I understand now. Thank you all for the feedback and fixing/applying.
--
Jonathan

